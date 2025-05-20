const catalogService = require('../services/catalogService');

/**
 * GET /api/catalog
 * Returns the product catalog with vendor-specific pricing.
 */
exports.getCatalog = async (req, res, next) => {
  try {
    const pricingTier = req.user && req.user.pricingTier ? req.user.pricingTier : 'TIER_1';
    const catalog = await catalogService.getCatalog(pricingTier);
    res.json(catalog);
  } catch (error) {
    next(error);
  }
}; 