const supabase = require('../config/supabaseClient');
const { applySearchAndPagination, getVendorIdByUuid, getVendorDetailsById } = require('./utils');
const config = require('../config');
const { v4: uuidv4 } = require('uuid');

function isUUID(str) {
  return /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/.test(str);
}

// Razorpay instance (see documents/payment.md: "Create order")
const { rzp } = config;

/**
 * List orders with optional status filter, search, and pagination, and role-based filtering.
 * @param {object} options
 * @param {string} [options.status] - Filter by order status
 * @param {string} [options.search] - Search by order id or vendor id
 * @param {number} [options.page=1] - Page number
 * @param {number} [options.pageSize=20] - Items per page
 * @param {object} [options.user] - User object containing id
 * @returns {Promise<Array>} - List of orders
 */
async function listOrders({ status, search, page = 1, pageSize = 20, user } = {}) {
  if (!user || !user.id) {
    throw { status: 401, message: 'Unauthorized: Missing user id' };
  }

  // Fetch vendor role using the user id
  const vendor = await getVendorIdByUuid(user.id);
  const role = vendor ? vendor.role : null;

  if (!role) {
    throw { status: 403, message: 'Forbidden: Unauthorized role' };
  }

  let query = supabase
    .from('orders')
    .select('id, vendor_id, status, total_weight, created_at, last_updated');

  if (status) {
    query = query.eq('status', status);
  }

  // Role-based filtering
  if (role === 'vendor') {
    query = query.eq('vendor_id', user.id);
  } else if (role === 'admin') {
    // No additional filter, admin can see all orders
  } else {
    throw { status: 403, message: 'Forbidden: Unauthorized role' };
  }

  // Only apply fuzzy search to 'id' (text)
  if (search) {
    // If search is a UUID, filter vendor_id exactly
    if (isUUID(search)) {
      query = query.eq('vendor_id', search);
    } else {
      query = applySearchAndPagination(query, {
        search,
        searchFields: ['id'],
        page,
        pageSize
      });
      // Return early to avoid double range
      const { data: orders, error } = await query;
      if (error) throw error;
      return orders || [];
    }
  }

  // Apply pagination if not already done
  query = query.range((page - 1) * pageSize, page * pageSize - 1);

  const { data: orders, error } = await query;
  if (error) throw error;
  return orders || [];
}

/**
 * Get all items for a given orderId, including product details and pricing tier discount.
 * @param {string} orderId
 * @param {string} pricingTier
 * @returns {Promise<Array>} - List of order items with product info and pricing
 */
async function getOrderItems(orderId, pricingTier) {
  // Fetch order items with product info
  const { data: items, error: itemsError } = await supabase
    .from('order_items')
    .select('sku, quantity_kg, approved_quantity_kg, product:products(sku, name, category, price_per_kg, gst_percent)')
    .eq('order_id', orderId);
  if (itemsError) throw itemsError;
  if (!items || items.length === 0) return [];

  // Fetch discount for the pricing tier
  const { data: tier, error: tierError } = await supabase
    .from('pricing_tiers')
    .select('discount_pct')
    .eq('name', pricingTier)
    .maybeSingle();
  if (tierError) throw tierError;
  const discount = tier ? parseFloat(tier.discount_pct) : 0;

  return items.map(item => ({
    sku: item.sku,
    quantity_kg: item.quantity_kg,
    approved_quantity_kg: item.approved_quantity_kg,
    product_name: item.product?.name || '',
    pricing_tier: pricingTier,
    price_per_kg: item.product ? Math.round((item.product.price_per_kg * (1 - discount)) * 100) / 100 : '',
    gst: item.product?.gst_percent ?? '',
    product_category: item.product?.category || ''
  }));
}

/**
 * Confirm order payment: creates a Razorpay payment link for the full amount of the vendor's cart
 * @param {string} orderId
 * @param {object} user
 * @returns {Promise<object>} - Payment link/order response
 */
async function confirmOrderPayment(orderId, user) {
  // 1. Validate user and order
  if (!user || !user.id) {
    throw { status: 401, message: 'Unauthorized: Missing user id' };
  }
  // Fetch user role
  const vendor = await getVendorIdByUuid(user.id);
  const role = vendor ? vendor.role : null;
  if (role !== 'admin') {
    throw { status: 403, message: 'Forbidden: Only admin can perform this action' };
  }
  // Fetch order
  const { data: order, error: orderError } = await supabase
    .from('orders')
    .select('*')
    .eq('id', orderId)
    .maybeSingle();
  if (orderError) throw orderError;
  if (!order) throw { status: 404, message: 'Order not found' };
  if (order.status === 'cart' && order.status === 'pending') {
    throw { status: 400, message: 'Order is not payable' };
  }

  // 2. Fetch order items and vendor pricing tier
  let pricingTier = order.pricing_tier || 'TIER_1';
  const items = await getOrderItems(orderId, pricingTier);
  if (!items.length) throw { status: 400, message: 'Order has no items' };

  // 3. Calculate total amount (sum of price_per_kg * approved_quantity_kg for all items)
  let total = 0;
  for (const item of items) {
    const qty = item.approved_quantity_kg != null ? item.approved_quantity_kg : item.quantity_kg;
    total += (parseFloat(item.price_per_kg) || 0) * (parseFloat(qty) || 0);
  }
  const amountPaise = Math.round(total * 100);
  if (amountPaise <= 0) throw { status: 400, message: 'Order total is zero' };

  // 4. Fetch vendor details for payment link
  const vendorDetails = await getVendorDetailsById(order.vendor_id);
  if (!vendorDetails) throw { status: 404, message: 'Vendor not found' };

  // 5. Create Razorpay order
  let razorpayOrder;
  try {
    razorpayOrder = await rzp.orders.create({
      amount: amountPaise,
      currency: 'INR',
      receipt: orderId,
      payment_capture: 1, // auto-capture
      notes: {
        vendor_id: order.vendor_id,
        order_id: orderId
      }
    });
  } catch (err) {
    console.log(err);
    console.error('Razorpay order creation failed', { orderId, vendorId: order.vendor_id, err: err.message });
    throw { status: 500, message: 'Failed to create payment order. Please try again.' };
  }

  // 6. Create Razorpay payment link
  let paymentLink;
  try {
    paymentLink = await rzp.paymentLink.create({
      amount: amountPaise,
      currency: 'INR',
      accept_partial: false,
      reference_id: razorpayOrder.id,
      description: `Payment for order ${orderId}`,
      customer: {
        name: vendorDetails.name,
        contact: vendorDetails.phone,
        // email: vendorDetails.email, // Uncomment if email is available
      },
      notes: {
        vendor_id: order.vendor_id,
        order_id: orderId,
        razorpay_order_id: razorpayOrder.id
      }
    });
  } catch (err) {
    console.error(err);
    console.error('Razorpay payment link creation failed', { orderId, vendorId: order.vendor_id, err: err.message });
    throw { status: 500, message: 'Failed to create payment link. Please try again.' };
  }

  // 7. Store payment details in payments table
  let paymentRecord;
  try {
    const { data: inserted, error: insertError } = await supabase
      .from('payments')
      .insert({
        id: paymentLink.id,
        order_id: orderId,
        app_pay_order_id: razorpayOrder.id,
        status: 'pending',
        payment_url: paymentLink.short_url
      })
      .select()
      .maybeSingle();
    if (insertError) throw insertError;
    paymentRecord = inserted;
  } catch (err) {
    console.error(err);
    console.error('Failed to insert payment record', { orderId, err: err.message });
    throw { status: 500, message: 'Failed to store payment record. Please try again.' };
  }

  // 8. Update order status to 'approved'
  try {
    const { error: updateOrderError } = await supabase
      .from('orders')
      .update({ status: 'payment_pending' })
      .eq('id', orderId);
    if (updateOrderError) throw updateOrderError;
  } catch (err) {
    console.error(err);
    console.error('Failed to update order status to approved', { orderId, err: err.message });
    throw { status: 500, message: 'Failed to update order status. Please try again.' };
  }

  // 9. Return all details
  return {
    success: true,
    razorpayOrder: {
      id: razorpayOrder.id,
      amount: razorpayOrder.amount,
      currency: razorpayOrder.currency,
      receipt: razorpayOrder.receipt
    },
    paymentLink: {
      id: paymentLink.id,
      amount: paymentLink.amount,
      currency: paymentLink.currency,
      short_url: paymentLink.short_url
    },
    paymentRecord,
    orderId
  };
}

/**
 * Review order: update approved quantities and generate work orders
 * @param {string} orderId
 * @param {Array} items - [{ sku, approvedQuantityKg }]
 * @param {object} user
 * @returns {Promise<object>} - Success message
 */
async function reviewOrder(orderId, items, user) {
  // 1. Validate user and order
  if (!user || !user.id) {
    throw { status: 401, message: 'Unauthorized: Missing user id' };
  }
  // Fetch user role
  const vendor = await getVendorIdByUuid(user.id);
  const role = vendor ? vendor.role : null;
  if (role !== 'admin') {
    throw { status: 403, message: 'Forbidden: Only admin can perform this action' };
  }
  // Fetch order
  const { data: order, error: orderError } = await supabase
    .from('orders')
    .select('*')
    .eq('id', orderId)
    .maybeSingle();
  if (orderError) throw orderError;
  if (!order) throw { status: 404, message: 'Order not found' };

  // 2. Update approved quantities for each item
  for (const item of items) {
    const { sku, approvedQuantityKg } = item;
    if (!sku || typeof approvedQuantityKg !== 'number') continue;
    const { error: updateError } = await supabase
      .from('order_items')
      .update({ approved_quantity_kg: approvedQuantityKg })
      .eq('order_id', orderId)
      .eq('sku', sku);
    if (updateError) throw updateError;
  }

  // 3. Set order status to 'reviewed'
  const { error: updateOrderError } = await supabase
    .from('orders')
    .update({ status: 'approved', last_updated: new Date().toISOString() })
    .eq('id', orderId);
  if (updateOrderError) throw updateOrderError;

  return { success: true, message: 'Order reviewed successfully' };
}

/**
 * Get payment info for an order: returns payment link and total
 * @param {string} orderId
 * @returns {Promise<object>} - Payment link and total
 */
async function getOrderPaymentInfo(orderId) {
  // Fetch order
  const { data: order, error: orderError } = await supabase
    .from('orders')
    .select('*')
    .eq('id', orderId)
    .maybeSingle();
  if (orderError) throw orderError;
  if (!order) throw { status: 404, message: 'Order not found' };

  // Fetch payment link from payments table
  const { data: payment, error: paymentError } = await supabase
    .from('payments')
    .select('payment_url')
    .eq('order_id', orderId)
    .order('created_at', { ascending: false })
    .maybeSingle();
  if (paymentError) throw paymentError;

  // Calculate total (sum of price_per_kg * approved_quantity_kg for all items)
  let total = 0;
  const pricingTier = order.pricing_tier || 'TIER_1';
  const items = await getOrderItems(orderId, pricingTier);
  for (const item of items) {
    const qty = item.approved_quantity_kg != null ? item.approved_quantity_kg : item.quantity_kg;
    total += (parseFloat(item.price_per_kg) || 0) * (parseFloat(qty) || 0);
  }

  return [{
    payment_url: payment ? payment.payment_url : '',
    payment_total: total
  }];
}

module.exports = { listOrders, getOrderItems, confirmOrderPayment, reviewOrder, getOrderPaymentInfo }; 