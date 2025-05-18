const vendorService = require('../services/vendorService');

// Controller for vendor-related endpoints, e.g., checking if a vendor phone is allowed

/**
 * POST /api/check-vendor
 * Body: { phone: string }
 * Response: { allowed: boolean }
 */
exports.checkVendor = async (req, res, next) => {
  const { phone } = req.body;
  if (!phone) {
    return res.status(400).json({ error: 'Phone is required' });
  }
  try {
    const allowed = await vendorService.isVendorAllowed(phone);
    res.json({ allowed });
  } catch (error) {
    next(error);
  }
}; 