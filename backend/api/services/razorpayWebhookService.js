const supabase = require('../config/supabaseClient');
const { getVendorDetailsById } = require('./utils');
const { v4: uuidv4 } = require('uuid');

/**
 * Handles Razorpay webhook payload for payment_link.paid event.
 * @param {object} payload - The webhook payload from Razorpay
 * @returns {Promise<object>} - Result of the operation
 */
async function handlePaymentWebhook(payload) {
  // 1. Check event type
  if (payload.event !== 'payment.captured') {
    return { handled: false, reason: 'Not a payment_link.captured event' };
  }

  // 2. Extract order reference (assume in payload.payload.payment_link.reference_id or notes)
  const paymentLink = payload.payload?.payment.entity;
  const referenceId = paymentLink?.notes?.order_id;
  if (!referenceId) {
    return { handled: false, reason: 'No order reference found in webhook' };
  }

  // 3. Find the order by referenceId (order_id)
  const { data: order, error: orderError } = await supabase
    .from('orders')
    .select('*')
    .eq('id', referenceId)
    .maybeSingle();
  if (orderError || !order) {
    return { handled: false, reason: 'Order not found', error: orderError };
  }

  // 4. Update order status to 'paid'
  const { error: updateOrderError } = await supabase
    .from('orders')
    .update({ status: 'paid' })
    .eq('id', referenceId);
  if (updateOrderError) {
    return { handled: false, reason: 'Failed to update order status', error: updateOrderError };
  }

  // 5. Update payment status to 'paid' for this order
  await supabase
    .from('payments')
    .update({ status: 'paid' })
    .eq('order_id', referenceId);

  // 6. Check if a work order exists for this order
  const { data: workOrder, error: workOrderError } = await supabase
    .from('work_orders')
    .select('id')
    .eq('order_id', referenceId)
    .maybeSingle();
  if (workOrderError) {
    return { handled: false, reason: 'Error checking work order', error: workOrderError };
  }

  let workOrderCreated = false;
  if (!workOrder) {
    // 7. Create work orders for each item in the order
    const { data: orderItems, error: itemsError } = await supabase
      .from('order_items')
      .select('*')
      .eq('order_id', referenceId);
    if (itemsError) {
      return { handled: false, reason: 'Error fetching order items', error: itemsError };
    }
    const workOrderRows = orderItems.map(item => ({
      id: uuidv4(),
      order_id: referenceId,
      vendor_id: order.vendor_id,
      sku: item.sku,
      quantity_kg: item.quantity_kg,
      status: 'created',
      created_at: new Date().toISOString(),
    }));
    const { error: insertError } = await supabase
      .from('work_orders')
      .insert(workOrderRows);
    if (insertError) {
      return { handled: false, reason: 'Failed to create work order', error: insertError };
    }
    workOrderCreated = true;
  }

  return {
    handled: true,
    orderId: referenceId,
    workOrderCreated,
    message: workOrderCreated ? 'Order marked paid and work order created' : 'Order marked paid, work order already exists',
  };
}

module.exports = { handlePaymentWebhook }; 