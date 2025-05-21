const supabase = require('../config/supabaseClient');
const { applySearchAndPagination } = require('./utils');

function isUUID(str) {
  return /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/.test(str);
}

/**
 * List orders with optional status filter, search, and pagination.
 * @param {object} options
 * @param {string} [options.status] - Filter by order status
 * @param {string} [options.search] - Search by order id or vendor id
 * @param {number} [options.page=1] - Page number
 * @param {number} [options.pageSize=20] - Items per page
 * @returns {Promise<Array>} - List of orders
 */
async function listOrders({ status, search, page = 1, pageSize = 20 } = {}) {
  let query = supabase
    .from('orders')
    .select('id, vendor_id, status, total_weight, created_at, last_updated');

  if (status) {
    query = query.eq('status', status);
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

module.exports = { listOrders }; 