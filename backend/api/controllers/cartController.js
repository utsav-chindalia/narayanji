const cartService = require('../services/cartService');

// POST /api/cart
exports.addToCart = async (req, res, next) => {
  try {
    const vendorId = req.user.id;
    const { items } = req.body; // items: [{ sku, quantity_kg }]
    if (!Array.isArray(items) || items.length === 0) {
      return res.status(400).json({ error: 'No items provided' });
    }
    const result = await cartService.addToCart(vendorId, items);
    res.json(result);
  } catch (error) {
    next(error);
  }
};

// PATCH /api/cart/:orderId
exports.updateCart = async (req, res, next) => {
  try {
    const vendorId = req.user.id;
    const { orderId } = req.params;
    const { items } = req.body; // items: [{ sku, quantity_kg }]
    if (!orderId || !Array.isArray(items)) {
      return res.status(400).json({ error: 'Order ID and items required' });
    }
    const result = await cartService.updateCart(vendorId, orderId, items);
    res.json(result);
  } catch (error) {
    next(error);
  }
}; 