const catalogService = require('../services/catalogService');

/**
 * GET /api/catalog
 * Query params:
 *   - search: (optional) search term for name, category, or sku
 *   - page: (optional, default 1) page number
 *   - pageSize: (optional, default 20) items per page
 * Returns the product catalog with vendor-specific pricing, search, and pagination.
 */
exports.getCatalog = async (req, res, next) => {
  try {
    const pricingTier = req.user && req.user.pricingTier ? req.user.pricingTier : 'TIER_1';
    const { search, page = 1, pageSize = 20 } = req.query;
    const catalogResult = await catalogService.getCatalog(pricingTier, {
      search,
      page: Number(page) || 1,
      pageSize: Number(pageSize) || 20
    });
    res.json(catalogResult);
  } catch (error) {
    next(error);
  }
}; 