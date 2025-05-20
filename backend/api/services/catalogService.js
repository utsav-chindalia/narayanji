const supabase = require('../config/supabaseClient');

/**
 * Fetch product catalog with vendor-specific pricing.
 * @param {string} pricingTier - The vendor's pricing tier (e.g., TIER_1, TIER_2).
 * @returns {Promise<Array>} - List of products with vendor-specific pricing.
 */
async function getCatalog(pricingTier) {
  // Fetch all products
  const { data: products, error: prodError } = await supabase
    .from('products')
    .select('sku, name, category, unit_type, image_url, price_per_kg, gst_percent');
  if (prodError) throw prodError;

  // Fetch discount for the pricing tier
  const { data: tier, error: tierError } = await supabase
    .from('pricing_tiers')
    .select('discount_pct')
    .eq('name', pricingTier)
    .maybeSingle();
  if (tierError) throw tierError;
  const discount = tier ? parseFloat(tier.discount_pct) : 0;

  // Map products with discounted price
  return (products || []).map(p => ({
    sku: p.sku,
    name: p.name,
    category: p.category,
    unitType: p.unit_type,
    imageUrl: p.image_url,
    pricePerKg: Math.round((p.price_per_kg * (1 - discount)) * 100) / 100,
    gstPercent: parseFloat(p.gst_percent)
  }));
}

module.exports = { getCatalog }; 