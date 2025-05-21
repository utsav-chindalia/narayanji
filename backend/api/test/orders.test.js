const request = require('supertest');
const express = require('express');
const ordersController = require('../controllers/ordersController');

// Mock ordersService
jest.mock('../services/ordersService', () => ({
  listOrders: jest.fn().mockResolvedValue([
    {
      id: 'ORD-1234',
      vendor_id: 'vendor_123',
      status: 'approved',
      total_weight: 100,
      created_at: '2025-05-14T12:00:00Z',
      last_updated: '2025-05-15T10:00:00Z'
    }
  ])
}));

const app = express();
app.use(express.json());
// Fake auth middleware
app.use((req, res, next) => {
  req.user = { id: 'vendor_123', pricingTier: 'TIER_2' };
  next();
});
app.get('/api/orders', ordersController.listOrders);

describe('GET /api/orders', () => {
  it('should return orders with expected structure', async () => {
    const res = await request(app).get('/api/orders');
    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
    expect(res.body[0]).toHaveProperty('id');
    expect(res.body[0]).toHaveProperty('vendor_id');
    expect(res.body[0]).toHaveProperty('status');
    expect(res.body[0]).toHaveProperty('total_weight');
    expect(res.body[0]).toHaveProperty('created_at');
    expect(res.body[0]).toHaveProperty('last_updated');
  });
}); 