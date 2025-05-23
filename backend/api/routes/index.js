const express = require('express');
const router = express.Router();
const authMiddleware = require('../middleware/authMiddleware');
const razorpayWebhookService = require('../services/razorpayWebhookService');

// Webhook route (no auth)
router.post('/webhook/payment', express.json(), async (req, res) => {
  console.log(req.body);
  try {
    const result = await razorpayWebhookService.handlePaymentWebhook(req.body);
    res.status(200).json(result);
  } catch (err) {
    console.error('Webhook error:', err);
    res.status(500).json({ error: 'Webhook processing failed', details: err.message || err });
  }
});

// Apply authentication middleware to all /api routes
router.use(authMiddleware);

// Example: router.use('/users', require('../controllers/userController'));

router.use('/example', require('./example'));
// Route for checking if a vendor phone is allowed
router.use('/check-vendor', require('./vendor'));
router.use('/catalog', require('./catalog'));
router.use('/cart', require('./cart'));
router.use('/orders', require('./orders'));
router.use('/work-orders', require('./workOrders'));

module.exports = router; 