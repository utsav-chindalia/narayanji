# Database Schema for Narayan Ji Gajak DMS (MVP)

This document outlines the proposed database schema based on the API contract and Swagger specification. It is intended as a reference for future migrations and backend development.

---

## Table: vendors
| Field         | Type      | Constraints         | Notes                       |
|--------------|-----------|--------------------|-----------------------------|
| id           | uuid      | PK, not null       | Supabase user id            |
| name         | text      | not null           |                             |
| phone        | text      | unique, not null   | E.164 format                |
| pricing_tier | text      | not null           | e.g., TIER_1, TIER_2        |
| created_at   | timestamptz | default now()    |                             |

---

## Table: products
| Field           | Type      | Constraints         | Notes                       |
|-----------------|-----------|--------------------|-----------------------------|
| sku             | text      | PK, not null       | Product SKU                 |
| name            | text      | not null           |                             |
| box_weight_grams| integer   | not null           |                             |
| image_url       | text      |                    |                             |
| price_per_kg    | numeric   | not null           | Vendor-specific via pricing |
| created_at      | timestamptz | default now()    |                             |

---

## Table: vendor_product_pricing
| Field         | Type      | Constraints         | Notes                       |
|--------------|-----------|--------------------|-----------------------------|
| id           | uuid      | PK, not null       |                             |
| vendor_id    | uuid      | FK -> vendors.id   |                             |
| sku          | text      | FK -> products.sku |                             |
| price_per_kg | numeric   | not null           |                             |
| created_at   | timestamptz | default now()    |                             |

---

## Table: orders
| Field         | Type      | Constraints         | Notes                       |
|--------------|-----------|--------------------|-----------------------------|
| id           | text      | PK, not null       | e.g., ORD-1234              |
| vendor_id    | uuid      | FK -> vendors.id   |                             |
| status       | text      | not null           | e.g., packaged, in_production|
| total_weight | numeric   |                    |                             |
| created_at   | timestamptz | default now()    |                             |
| last_updated | timestamptz |                    |                             |

---

## Table: order_items
| Field              | Type      | Constraints         | Notes                       |
|--------------------|-----------|--------------------|-----------------------------|
| id                 | uuid      | PK, not null       |                             |
| order_id           | text      | FK -> orders.id    |                             |
| sku                | text      | FK -> products.sku |                             |
| quantity_kg        | numeric   | not null           | Ordered quantity            |
| approved_quantity_kg| numeric  |                    | Set by admin                |

---

## Table: payments
| Field         | Type      | Constraints         | Notes                       |
|--------------|-----------|--------------------|-----------------------------|
| id           | uuid      | PK, not null       |                             |
| order_id     | text      | FK -> orders.id    |                             |
| app_pay_order_id | text  | unique             |                             |
| status       | text      | not null           | e.g., paid, pending         |
| payment_url  | text      |                    |                             |
| created_at   | timestamptz | default now()    |                             |

---

## Table: work_orders
| Field         | Type      | Constraints         | Notes                       |
|--------------|-----------|--------------------|-----------------------------|
| id           | text      | PK, not null       | e.g., WO-101                |
| order_id     | text      | FK -> orders.id    |                             |
| vendor_id    | uuid      | FK -> vendors.id   |                             |
| sku          | text      | FK -> products.sku |                             |
| quantity_kg  | numeric   | not null           |                             |
| batch_code   | text      |                    |                             |
| status       | text      | not null           | e.g., pending, completed    |
| created_at   | timestamptz | default now()    |                             |

---

# Notes
- All timestamps use UTC.
- All foreign keys should be indexed.
- Vendor-specific pricing can be managed via the `vendor_product_pricing` table.
- Order status and payment status are string enums; consider using check constraints or enum types in migrations.
- This schema is a starting point and may be refined as business logic evolves. 