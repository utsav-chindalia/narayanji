const ordersService = require('../services/ordersService');

/**
 * GET /api/orders
 * Query params:
 *   - status: (optional) filter by order status
 *   - search: (optional) search by order id or vendor id
 *   - page: (optional, default 1) page number
 *   - pageSize: (optional, default 20) items per page
 * Returns a list of orders with filtering, search, and pagination.
 */
exports.listOrders = async (req, res, next) => {
  try {
    const { status, search, page = 1, pageSize = 20 } = req.query;
    const orders = await ordersService.listOrders({
      status,
      search,
      page: Number(page) || 1,
      pageSize: Number(pageSize) || 20,
      user: req.user
    });
    res.json(orders);
  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/orders/:orderId/items
 * Returns all items for the given orderId with product and pricing info.
 */
exports.getOrderItems = async (req, res, next) => {
  try {
    const { orderId } = req.params;
    const pricingTier = req.user && req.user.pricingTier ? req.user.pricingTier : 'TIER_1';
    const items = await ordersService.getOrderItems(orderId, pricingTier);
    res.json(items);
  } catch (error) {
    next(error);
  }
}; 