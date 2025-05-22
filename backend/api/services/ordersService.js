const supabase = require('../config/supabaseClient');
const { applySearchAndPagination, getVendorIdByUuid } = require('./utils');
const config = require('../config');

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
    .select('sku, quantity_kg, product:products(sku, name, category, price_per_kg, gst_percent)')
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
    product_name: item.product?.name || '',
    pricing_tier: pricingTier,
    price_per_kg: item.product ? Math.round((item.product.price_per_kg * (1 - discount)) * 100) / 100 : '',
    gst: item.product?.gst_percent ?? '',
    product_category: item.product?.category || ''
  }));
}

/**
 * Confirm order payment: creates a Razorpay order for the full amount of the vendor's cart
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
  if (order.status !== 'cart' && order.status !== 'pending') {
    throw { status: 400, message: 'Order is not payable' };
  }

  // 2. Fetch order items and vendor pricing tier
  // (Assume pricing tier is stored on vendor or order)
  let pricingTier = order.pricing_tier || 'TIER_1';
  const items = await getOrderItems(orderId, pricingTier);
  if (!items.length) throw { status: 400, message: 'Order has no items' };

  // 3. Calculate total amount (sum of price_per_kg * quantity_kg for all items)
  let total = 0;
  for (const item of items) {
    total += (parseFloat(item.price_per_kg) || 0) * (parseFloat(item.quantity_kg) || 0);
  }
  // Razorpay expects amount in paise (INR * 100)
  const amountPaise = Math.round(total * 100);
  if (amountPaise <= 0) throw { status: 400, message: 'Order total is zero' };

  // 4. Create Razorpay order
  try {
    const razorpayOrder = await rzp.orders.create({
      amount: amountPaise,
      currency: 'INR',
      receipt: orderId,
      payment_capture: 1, // auto-capture
      notes: {
        vendor_id: order.vendor_id,
        order_id: orderId
      }
    });
    // Optionally, update order with razorpay_order_id
    // await supabase.from('orders').update({ razorpay_order_id: razorpayOrder.id }).eq('id', orderId);
    // Return order info for frontend to proceed with payment
    return {
      success: true,
      razorpayOrderId: razorpayOrder.id,
      amount: razorpayOrder.amount,
      currency: razorpayOrder.currency,
      orderId,
      paymentUrl: null // Frontend should use Razorpay Checkout with this order id
    };
  } catch (err) {
    // See razorpay-rules.mdc: Error Handling
    // Log error context, but not secrets or PII
    console.error('Razorpay order creation failed', { orderId, vendorId: order.vendor_id, err: err.message });
    throw { status: 500, message: 'Failed to create payment order. Please try again.' };
  }
}

module.exports = { listOrders, getOrderItems, confirmOrderPayment }; 