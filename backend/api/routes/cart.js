const express = require('express');
const router = express.Router();
const cartController = require('../controllers/cartController');

// POST /api/cart - Add to cart (create or update order)
router.post('/', cartController.addToCart);

// PATCH /api/cart/:orderId - Update cart (e.g., change quantity, remove item)
router.patch('/:orderId', cartController.updateCart);

module.exports = router; 