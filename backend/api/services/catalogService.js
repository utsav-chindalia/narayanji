const supabase = require('../config/supabaseClient');
const { applySearchAndPagination } = require('./utils');

/**
 * Fetch product catalog with vendor-specific pricing, search, and pagination.
 * @param {string} pricingTier - The vendor's pricing tier (e.g., TIER_1, TIER_2).
 * @param {object} options
 * @param {string} [options.search] - Search term
 * @param {number} [options.page=1] - Page number (1-based)
 * @param {number} [options.pageSize=20] - Items per page
 * @returns {Promise<Array>} - List of products with vendor-specific pricing.
 */
async function getCatalog(pricingTier, { search, page = 1, pageSize = 20 } = {}) {
  // If searching, override pageSize to a large number to return all matches
  if (search) {
    page = 1;
    pageSize = 1000; // or any large number that covers all possible results
  }
  // Build base query
  let query = supabase
    .from('products')
    .select('sku, name, category, unit_type, image_url, price_per_kg, gst_percent', { count: 'exact' });

  // Apply search and pagination
  query = applySearchAndPagination(query, {
    search,
    searchFields: ['name', 'category', 'sku'],
    page,
    pageSize
  });
  console.log(query);
  const { data: products, error: prodError, count: total } = await query;
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
  const mappedProducts = (products || []).map(p => ({
    sku: p.sku,
    name: p.name,
    category: p.category,
    unitType: p.unit_type,
    imageUrl: p.image_url,
    pricePerKg: Math.round((p.price_per_kg * (1 - discount)) * 100) / 100,
    gstPercent: parseFloat(p.gst_percent)
  }));

  return {
    products: mappedProducts,
    total: total || 0
  };
}

module.exports = { getCatalog }; 