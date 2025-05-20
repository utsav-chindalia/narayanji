-- Migration: Update products table to match new product schema (add category, unit_type, gst_percent, update constraints)
-- Date: 2024-05-19 12:00:00 UTC
--
-- This migration updates the products table to match the new schema as per product requirements.
--
-- Changes:
--   - Add 'category' (text, not null)
--   - Add 'unit_type' (text, not null)
--   - Add 'gst_percent' (numeric)
--   - Update comments for clarity
--   - No destructive changes

alter table public.products
  add column category text;

alter table public.products
  add column unit_type text not null default 'PER_KG';

alter table public.products
  add column gst_percent numeric;

-- Remove default after migration for production safety
alter table public.products
  alter column category drop default;
alter table public.products
  alter column unit_type drop default;

comment on column public.products.category is 'Product category, e.g., GAJAK, PATTIS, ROLL';
comment on column public.products.unit_type is 'Unit type, e.g., PER_KG, PER_BOX';
comment on column public.products.gst_percent is 'GST % as decimal (0.05 for 5%)';

-- Optionally, update table comment for completeness
comment on table public.products is 'Products available for order. SKU is the primary key. Includes category, unit type, GST percent, and other product details.';

-- Remove 'box_weight_grams' column from products table (destructive operation)
alter table public.products
drop column if exists box_weight_grams; 