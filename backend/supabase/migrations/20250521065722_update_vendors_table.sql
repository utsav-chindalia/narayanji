-- Migration: Add 'role' column to vendors table
-- Purpose: Introduce a 'role' column to distinguish vendor roles (e.g., admin, standard)
-- Affected table: public.vendors
-- Date: 2025-05-21
--
-- This migration adds a new column 'role' to the vendors table. The column is of type text and is nullable by default.
-- Update this migration if you want to enforce a default value or NOT NULL constraint.

alter table public.vendors
  add column role text;

comment on column public.vendors.role is 'Role of the vendor (e.g., admin, standard, etc).';
