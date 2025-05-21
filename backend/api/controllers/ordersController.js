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
      pageSize: Number(pageSize) || 20
    });
    res.json(orders);
  } catch (error) {
    next(error);
  }
}; 