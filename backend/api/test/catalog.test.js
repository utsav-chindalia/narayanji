const request = require('supertest');
const express = require('express');
const catalogController = require('../controllers/catalogController');

// Mock supabase and service
jest.mock('../services/catalogService', () => ({
  getCatalog: jest.fn().mockResolvedValue([
    {
      sku: 'GZK-001',
      name: 'Til Sakri Gajak',
      category: 'GAJAK',
      unitType: 'PER_KG',
      imageUrl: 'https://cdn.com/gajak1.png',
      pricePerKg: 320,
      gstPercent: 0.05
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
app.get('/api/catalog', catalogController.getCatalog);

describe('GET /api/catalog', () => {
  it('should return catalog with expected structure', async () => {
    const res = await request(app).get('/api/catalog');
    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
    expect(res.body[0]).toHaveProperty('sku');
    expect(res.body[0]).toHaveProperty('name');
    expect(res.body[0]).toHaveProperty('category');
    expect(res.body[0]).toHaveProperty('unitType');
    expect(res.body[0]).toHaveProperty('imageUrl');
    expect(res.body[0]).toHaveProperty('pricePerKg');
    expect(res.body[0]).toHaveProperty('gstPercent');
  });
}); 