const request = require('supertest');
const express = require('express');
const vendorController = require('../controllers/vendorController');

const app = express();
app.use(express.json());
app.post('/api/check-vendor', vendorController.checkVendor);

describe('POST /api/check-vendor', () => {
  it('should return 400 if phone is missing', async () => {
    const res = await request(app).post('/api/check-vendor').send({});
    expect(res.statusCode).toBe(400);
    expect(res.body).toHaveProperty('error');
  });

  it('should return allowed: true if vendor exists', async () => {
    jest.spyOn(require('../services/vendorService'), 'isVendorAllowed').mockResolvedValue(true);
    const res = await request(app).post('/api/check-vendor').send({ phone: '+919876543210' });
    expect(res.statusCode).toBe(200);
    expect(res.body).toEqual({ allowed: true });
  });

  it('should return allowed: false if vendor does not exist', async () => {
    jest.spyOn(require('../services/vendorService'), 'isVendorAllowed').mockResolvedValue(false);
    const res = await request(app).post('/api/check-vendor').send({ phone: '+919876543210' });
    expect(res.statusCode).toBe(200);
    expect(res.body).toEqual({ allowed: false });
  });

  it('should return 500 on service error', async () => {
    jest.spyOn(require('../services/vendorService'), 'isVendorAllowed').mockRejectedValue(new Error('DB error'));
    const res = await request(app).post('/api/check-vendor').send({ phone: '+919876543210' });
    expect(res.statusCode).toBe(500);
    expect(res.body).toHaveProperty('error');
  });
}); 