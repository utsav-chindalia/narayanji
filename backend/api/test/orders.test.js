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

// Add mock for getOrderItems
const mockOrderItems = [
  {
    sku: 'SKU-001',
    quantity_kg: 3,
    product_name: 'Til Sakri Gajak',
    pricing_tier: 'TIER_2',
    price_per_kg: 288,
    gst: 0.05,
    product_category: 'GAJAK'
  }
];
const ordersService = require('../services/ordersService');
ordersService.getOrderItems = jest.fn().mockResolvedValue(mockOrderItems);

const app = express();
app.use(express.json());
// Fake auth middleware
app.use((req, res, next) => {
  req.user = { id: 'vendor_123', pricingTier: 'TIER_2' };
  next();
});
app.get('/api/orders', ordersController.listOrders);
app.get('/api/orders/:orderId/items', ordersController.getOrderItems);

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

describe('GET /api/orders/:orderId/items', () => {
  it('should return order items with expected structure', async () => {
    const res = await request(app).get('/api/orders/ORD-1234/items');
    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
    expect(res.body[0]).toHaveProperty('sku');
    expect(res.body[0]).toHaveProperty('quantity_kg');
    expect(res.body[0]).toHaveProperty('product_name');
    expect(res.body[0]).toHaveProperty('pricing_tier');
    expect(res.body[0]).toHaveProperty('price_per_kg');
    expect(res.body[0]).toHaveProperty('gst');
    expect(res.body[0]).toHaveProperty('product_category');
    expect(res.body[0].sku).toBe('SKU-001');
    expect(res.body[0].pricing_tier).toBe('TIER_2');
  });
}); 