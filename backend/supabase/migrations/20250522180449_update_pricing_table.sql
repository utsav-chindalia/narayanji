-- Migration: Update payments.id to text type for storing Razorpay payment link IDs
-- Date: 2025-05-22

-- 1. Drop the existing primary key constraint
ALTER TABLE public.payments DROP CONSTRAINT payments_pkey;

-- 2. Alter the id column from uuid to text
ALTER TABLE public.payments ALTER COLUMN id TYPE text;

-- 3. Re-add the primary key constraint
ALTER TABLE public.payments ADD PRIMARY KEY (id);
