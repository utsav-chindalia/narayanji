require('dotenv').config({path: '.env.local'});

module.exports = {
  port: process.env.PORT || 3000,
  razorpay: {
    key_id: process.env.KEY_ID,
    key_secret: process.env.KEY_SECRET
  },
  // Add other config variables here
}; 