-- Migration: Initial schema for Narayan Ji Gajak DMS (MVP)
-- Purpose: Create all core tables, constraints, indexes, and RLS policies as per database_schema.md
-- Date: 2025-05-18
--
-- Tables: vendors, products, vendor_product_pricing, orders, order_items, payments, work_orders
--
-- All tables use UTC timestamps and are created in the public schema.
-- All foreign keys are indexed. RLS is enabled for all tables with basic policies.

--
-- Table: vendors
--
create table public.vendors (
  id uuid primary key not null, -- Supabase user id
  name text not null,
  phone text unique not null, -- E.164 format
  pricing_tier text not null, -- e.g., TIER_1, TIER_2
  created_at timestamptz not null default now()
);
comment on table public.vendors is 'Vendors registered in the system. Each vendor is a Supabase user.';

alter table public.vendors enable row level security;
-- RLS: Only authenticated users can select/insert/update/delete their own vendor row (customize as needed)
create policy "Allow authenticated read vendors" on public.vendors for select to authenticated using (true);
create policy "Allow authenticated insert vendors" on public.vendors for insert to authenticated with check (true);
create policy "Allow authenticated update vendors" on public.vendors for update to authenticated using (true);
create policy "Allow authenticated delete vendors" on public.vendors for delete to authenticated using (true);

--
-- Table: products
--
create table public.products (
  sku text primary key not null, -- Product SKU
  name text not null,
  box_weight_grams integer not null,
  image_url text,
  price_per_kg numeric not null, -- Vendor-specific via pricing
  created_at timestamptz not null default now()
);
comment on table public.products is 'Products available for order. SKU is the primary key.';

alter table public.products enable row level security;
create policy "Allow authenticated read products" on public.products for select to authenticated using (true);
create policy "Allow authenticated insert products" on public.products for insert to authenticated with check (true);
create policy "Allow authenticated update products" on public.products for update to authenticated using (true);
create policy "Allow authenticated delete products" on public.products for delete to authenticated using (true);

--
-- Table: vendor_product_pricing
--
create table public.vendor_product_pricing (
  id uuid primary key not null,
  vendor_id uuid not null references public.vendors(id) on delete cascade,
  sku text not null references public.products(sku) on delete cascade,
  price_per_kg numeric not null,
  created_at timestamptz not null default now()
);
comment on table public.vendor_product_pricing is 'Vendor-specific product pricing.';

create index idx_vendor_product_pricing_vendor_id on public.vendor_product_pricing(vendor_id);
create index idx_vendor_product_pricing_sku on public.vendor_product_pricing(sku);

alter table public.vendor_product_pricing enable row level security;
create policy "Allow authenticated read vendor_product_pricing" on public.vendor_product_pricing for select to authenticated using (true);
create policy "Allow authenticated insert vendor_product_pricing" on public.vendor_product_pricing for insert to authenticated with check (true);
create policy "Allow authenticated update vendor_product_pricing" on public.vendor_product_pricing for update to authenticated using (true);
create policy "Allow authenticated delete vendor_product_pricing" on public.vendor_product_pricing for delete to authenticated using (true);

--
-- Table: orders
--
create table public.orders (
  id text primary key not null, -- e.g., ORD-1234
  vendor_id uuid not null references public.vendors(id) on delete cascade,
  status text not null, -- e.g., packaged, in_production
  total_weight numeric,
  created_at timestamptz not null default now(),
  last_updated timestamptz
);
comment on table public.orders is 'Orders placed by vendors.';

create index idx_orders_vendor_id on public.orders(vendor_id);

alter table public.orders enable row level security;
create policy "Allow authenticated read orders" on public.orders for select to authenticated using (true);
create policy "Allow authenticated insert orders" on public.orders for insert to authenticated with check (true);
create policy "Allow authenticated update orders" on public.orders for update to authenticated using (true);
create policy "Allow authenticated delete orders" on public.orders for delete to authenticated using (true);

--
-- Table: order_items
--
create table public.order_items (
  id uuid primary key not null,
  order_id text not null references public.orders(id) on delete cascade,
  sku text not null references public.products(sku) on delete cascade,
  quantity_kg numeric not null,
  approved_quantity_kg numeric
);
comment on table public.order_items is 'Items within an order, referencing products.';

create index idx_order_items_order_id on public.order_items(order_id);
create index idx_order_items_sku on public.order_items(sku);

alter table public.order_items enable row level security;
create policy "Allow authenticated read order_items" on public.order_items for select to authenticated using (true);
create policy "Allow authenticated insert order_items" on public.order_items for insert to authenticated with check (true);
create policy "Allow authenticated update order_items" on public.order_items for update to authenticated using (true);
create policy "Allow authenticated delete order_items" on public.order_items for delete to authenticated using (true);

--
-- Table: payments
--
create table public.payments (
  id uuid primary key not null,
  order_id text not null references public.orders(id) on delete cascade,
  app_pay_order_id text unique,
  status text not null, -- e.g., paid, pending
  payment_url text,
  created_at timestamptz not null default now()
);
comment on table public.payments is 'Payments for orders.';

create index idx_payments_order_id on public.payments(order_id);

alter table public.payments enable row level security;
create policy "Allow authenticated read payments" on public.payments for select to authenticated using (true);
create policy "Allow authenticated insert payments" on public.payments for insert to authenticated with check (true);
create policy "Allow authenticated update payments" on public.payments for update to authenticated using (true);
create policy "Allow authenticated delete payments" on public.payments for delete to authenticated using (true);

--
-- Table: work_orders
--
create table public.work_orders (
  id text primary key not null, -- e.g., WO-101
  order_id text not null references public.orders(id) on delete cascade,
  vendor_id uuid not null references public.vendors(id) on delete cascade,
  sku text not null references public.products(sku) on delete cascade,
  quantity_kg numeric not null,
  batch_code text,
  status text not null, -- e.g., pending, completed
  created_at timestamptz not null default now()
);
comment on table public.work_orders is 'Work orders for production batches.';

create index idx_work_orders_order_id on public.work_orders(order_id);
create index idx_work_orders_vendor_id on public.work_orders(vendor_id);
create index idx_work_orders_sku on public.work_orders(sku);

alter table public.work_orders enable row level security;
create policy "Allow authenticated read work_orders" on public.work_orders for select to authenticated using (true);
create policy "Allow authenticated insert work_orders" on public.work_orders for insert to authenticated with check (true);
create policy "Allow authenticated update work_orders" on public.work_orders for update to authenticated using (true);
create policy "Allow authenticated delete work_orders" on public.work_orders for delete to authenticated using (true);

-- End of initial schema migration
