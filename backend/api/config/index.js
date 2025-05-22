require('dotenv').config({path: '.env.local'});
const Razorpay = require('razorpay');

const rzp = new Razorpay({
  key_id: process.env.KEY_ID,
  key_secret: process.env.KEY_SECRET
});

module.exports = {
  port: process.env.PORT || 3000,
  razorpay: {
    key_id: process.env.KEY_ID,
    key_secret: process.env.KEY_SECRET
  },
  rzp,
  // Add other config variables here
}; 