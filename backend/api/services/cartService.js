const supabase = require('../config/supabaseClient');

// Add items to cart (create or update order with status 'cart')
async function addToCart(vendorId, items) {
  // Find existing cart order for vendor
  let { data: order, error } = await supabase
    .from('orders')
    .select('*')
    .eq('vendor_id', vendorId)
    .eq('status', 'cart')
    .maybeSingle();
  if (error) throw error;

  // If no cart order, create one
  if (!order) {
    const orderId = `ORD-${Date.now()}`;
    const { data: newOrder, error: createError } = await supabase
      .from('orders')
      .insert({ id: orderId, vendor_id: vendorId, status: 'cart', created_at: new Date().toISOString() })
      .select()
      .maybeSingle();
    if (createError) throw createError;
    order = newOrder;
  }

  // Upsert order_items
  for (const item of items) {
    const { sku, quantity_kg } = item;
    if (!sku || !quantity_kg) continue;
    // Check if item exists
    const { data: existing, error: itemError } = await supabase
      .from('order_items')
      .select('id')
      .eq('order_id', order.id)
      .eq('sku', sku)
      .maybeSingle();
    if (itemError) throw itemError;
    if (existing) {
      // Update quantity
      const { error: updateError } = await supabase
        .from('order_items')
        .update({ quantity_kg })
        .eq('id', existing.id);
      if (updateError) throw updateError;
    } else {
      // Insert new item
      const { error: insertError } = await supabase
        .from('order_items')
        .insert({ order_id: order.id, sku, quantity_kg });
      if (insertError) throw insertError;
    }
  }

  // Return updated cart
  const { data: updatedItems, error: fetchError } = await supabase
    .from('order_items')
    .select('*')
    .eq('order_id', order.id);
  if (fetchError) throw fetchError;
  return { orderId: order.id, items: updatedItems };
}

// Update cart (only if vendor_id matches)
async function updateCart(vendorId, orderId, items) {
  // Fetch order and check vendor
  const { data: order, error } = await supabase
    .from('orders')
    .select('*')
    .eq('id', orderId)
    .maybeSingle();
  if (error) throw error;
  if (!order || order.vendor_id !== vendorId) {
    throw { status: 403, message: 'Forbidden: Vendor mismatch' };
  }

  // Update items (replace all for simplicity)
  // Delete existing items
  const { error: delError } = await supabase
    .from('order_items')
    .delete()
    .eq('order_id', orderId);
  if (delError) throw delError;

  // Insert new items
  for (const item of items) {
    const { sku, quantity_kg } = item;
    if (!sku || !quantity_kg) continue;
    const { error: insertError } = await supabase
      .from('order_items')
      .insert({ order_id: orderId, sku, quantity_kg });
    if (insertError) throw insertError;
  }

  // Return updated cart
  const { data: updatedItems, error: fetchError } = await supabase
    .from('order_items')
    .select('*')
    .eq('order_id', orderId);
  if (fetchError) throw fetchError;
  return { orderId, items: updatedItems };
}

module.exports = { addToCart, updateCart }; 