const workOrdersService = require('../services/workOrdersService');

/**
 * GET /api/work-orders
 * Returns all work orders for the warehouse team.
 */
exports.listWorkOrders = async (req, res, next) => {
  try {
    const workOrders = await workOrdersService.listWorkOrders();
    res.json(workOrders);
  } catch (error) {
    next(error);
  }
}; 