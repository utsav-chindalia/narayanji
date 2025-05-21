const supabase = require('../config/supabaseClient');
const { applySearchAndPagination, getVendorIdByUuid } = require('./utils');

function isUUID(str) {
  return /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/.test(str);
}

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
 * Confirm order payment (stub for now, returns placeholder paymentUrl)
 * @param {string} orderId
 * @param {object} user
 * @returns {Promise<object>} - Payment link response
 */
async function confirmOrderPayment(orderId, user) {
  // TODO: Add validation, order checks, and Razorpay integration
  return {
    success: true,
    paymentUrl: 'https://razorpay.com/pay/order_stub123'
  };
}

module.exports = { listOrders, getOrderItems, confirmOrderPayment }; 