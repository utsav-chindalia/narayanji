const supabase = require('../config/supabaseClient');

/**
 * Fetch all work orders, joining with vendors and products for display.
 * @returns {Promise<Array>} List of work orders with vendor and product info
 */
async function listWorkOrders() {
  // Join work_orders with vendors and products
  const { data, error } = await supabase
    .from('work_orders')
    .select(`
      id,
      vendor:vendors(name),
      sku,
      quantity_kg,
      batch_code,
      status
    `);
  if (error) throw error;
  // Format response as per API contract
  return (data || []).map(wo => ({
    workOrderId: wo.id,
    vendor: wo.vendor?.name || '',
    sku: wo.sku,
    quantityKg: wo.quantity_kg,
    batchCode: wo.batch_code,
    status: wo.status
  }));
}

module.exports = { listWorkOrders }; 