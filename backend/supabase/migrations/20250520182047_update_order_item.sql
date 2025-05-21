-- Ensure pgcrypto extension is enabled for UUID generation
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Set default value for id column in order_items table
ALTER TABLE public.order_items
ALTER COLUMN id SET DEFAULT gen_random_uuid();
