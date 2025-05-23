const express = require('express');
const router = express.Router();
const workOrdersController = require('../controllers/workOrdersController');

// GET /api/work-orders
router.get('/', workOrdersController.listWorkOrders);

module.exports = router; 