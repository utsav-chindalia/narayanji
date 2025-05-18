-- Dummy data for vendors table
insert into public.vendors (id, name, phone, pricing_tier, created_at) values
  ('11111111-1111-1111-1111-111111111111', 'Vendor One', '+911234567890', 'TIER_1', now()),
  ('22222222-2222-2222-2222-222222222222', 'Vendor Two', '+919876543210', 'TIER_2', now()),
  ('33333333-3333-3333-3333-333333333333', 'Vendor Three', '+919112233445', 'TIER_1', now()); 