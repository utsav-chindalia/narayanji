const express = require('express');
const router = express.Router();
const ordersController = require('../controllers/ordersController');

// GET /api/orders
router.get('/', ordersController.listOrders);

module.exports = router; 