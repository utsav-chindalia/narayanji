const express = require('express');
const router = express.Router();
const ordersController = require('../controllers/ordersController');

// GET /api/orders
router.get('/', ordersController.listOrders);

// GET /api/orders/:orderId/items
router.get('/:orderId/items', ordersController.getOrderItems);

// POST /api/orders/:orderId/confirm
router.post('/:orderId/confirm', ordersController.confirmOrderPayment);

// PUT /api/orders/:orderId/review
router.put('/:orderId/review', ordersController.reviewOrder);

module.exports = router; 