-- Migration: Remove vendor_product_pricing table and add pricing_tiers table
-- Purpose: Remove the vendor-specific product pricing table and introduce a pricing_tiers table for discount management.
-- Date: 2025-05-20
--
-- This migration is destructive: it drops the vendor_product_pricing table and all its data.
-- It also creates a new pricing_tiers table with RLS enabled and policies for select, insert, update, and delete.

-- =========================
-- Drop vendor_product_pricing table
-- =========================

drop table if exists public.vendor_product_pricing cascade;
-- WARNING: This will remove all vendor-specific product pricing data.

-- =========================
-- Create pricing_tiers table
-- =========================

create table public.pricing_tiers (
  name text primary key not null, -- e.g., TIER_1, TIER_2, TIER_3
  discount_pct numeric not null   -- e.g., 0.00, 0.10, 0.15
);
comment on table public.pricing_tiers is 'Defines pricing tiers and their associated discount percentages.';

-- Enable Row Level Security (RLS)
alter table public.pricing_tiers enable row level security;

-- RLS Policies for pricing_tiers
-- Select policy for authenticated users
create policy "Allow authenticated select pricing_tiers" on public.pricing_tiers
  for select to authenticated
  using (true);

-- Insert policy for authenticated users
create policy "Allow authenticated insert pricing_tiers" on public.pricing_tiers
  for insert to authenticated
  with check (true);

-- Update policy for authenticated users
create policy "Allow authenticated update pricing_tiers" on public.pricing_tiers
  for update to authenticated
  using (true);

-- Delete policy for authenticated users
create policy "Allow authenticated delete pricing_tiers" on public.pricing_tiers
  for delete to authenticated
  using (true);

-- End of migration
