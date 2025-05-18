

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE EXTENSION IF NOT EXISTS "pg_net" WITH SCHEMA "extensions";






COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";






CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";





SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."order_items" (
    "id" "uuid" NOT NULL,
    "order_id" "text" NOT NULL,
    "sku" "text" NOT NULL,
    "quantity_kg" numeric NOT NULL,
    "approved_quantity_kg" numeric
);


ALTER TABLE "public"."order_items" OWNER TO "postgres";


COMMENT ON TABLE "public"."order_items" IS 'Items within an order, referencing products.';



CREATE TABLE IF NOT EXISTS "public"."orders" (
    "id" "text" NOT NULL,
    "vendor_id" "uuid" NOT NULL,
    "status" "text" NOT NULL,
    "total_weight" numeric,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "last_updated" timestamp with time zone
);


ALTER TABLE "public"."orders" OWNER TO "postgres";


COMMENT ON TABLE "public"."orders" IS 'Orders placed by vendors.';



CREATE TABLE IF NOT EXISTS "public"."payments" (
    "id" "uuid" NOT NULL,
    "order_id" "text" NOT NULL,
    "app_pay_order_id" "text",
    "status" "text" NOT NULL,
    "payment_url" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."payments" OWNER TO "postgres";


COMMENT ON TABLE "public"."payments" IS 'Payments for orders.';



CREATE TABLE IF NOT EXISTS "public"."products" (
    "sku" "text" NOT NULL,
    "name" "text" NOT NULL,
    "box_weight_grams" integer NOT NULL,
    "image_url" "text",
    "price_per_kg" numeric NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."products" OWNER TO "postgres";


COMMENT ON TABLE "public"."products" IS 'Products available for order. SKU is the primary key.';



CREATE TABLE IF NOT EXISTS "public"."vendor_product_pricing" (
    "id" "uuid" NOT NULL,
    "vendor_id" "uuid" NOT NULL,
    "sku" "text" NOT NULL,
    "price_per_kg" numeric NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."vendor_product_pricing" OWNER TO "postgres";


COMMENT ON TABLE "public"."vendor_product_pricing" IS 'Vendor-specific product pricing.';



CREATE TABLE IF NOT EXISTS "public"."vendors" (
    "id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "phone" "text" NOT NULL,
    "pricing_tier" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."vendors" OWNER TO "postgres";


COMMENT ON TABLE "public"."vendors" IS 'Vendors registered in the system. Each vendor is a Supabase user.';



CREATE TABLE IF NOT EXISTS "public"."work_orders" (
    "id" "text" NOT NULL,
    "order_id" "text" NOT NULL,
    "vendor_id" "uuid" NOT NULL,
    "sku" "text" NOT NULL,
    "quantity_kg" numeric NOT NULL,
    "batch_code" "text",
    "status" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."work_orders" OWNER TO "postgres";


COMMENT ON TABLE "public"."work_orders" IS 'Work orders for production batches.';



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."payments"
    ADD CONSTRAINT "payments_app_pay_order_id_key" UNIQUE ("app_pay_order_id");



ALTER TABLE ONLY "public"."payments"
    ADD CONSTRAINT "payments_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."products"
    ADD CONSTRAINT "products_pkey" PRIMARY KEY ("sku");



ALTER TABLE ONLY "public"."vendor_product_pricing"
    ADD CONSTRAINT "vendor_product_pricing_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."vendors"
    ADD CONSTRAINT "vendors_phone_key" UNIQUE ("phone");



ALTER TABLE ONLY "public"."vendors"
    ADD CONSTRAINT "vendors_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."work_orders"
    ADD CONSTRAINT "work_orders_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_order_items_order_id" ON "public"."order_items" USING "btree" ("order_id");



CREATE INDEX "idx_order_items_sku" ON "public"."order_items" USING "btree" ("sku");



CREATE INDEX "idx_orders_vendor_id" ON "public"."orders" USING "btree" ("vendor_id");



CREATE INDEX "idx_payments_order_id" ON "public"."payments" USING "btree" ("order_id");



CREATE INDEX "idx_vendor_product_pricing_sku" ON "public"."vendor_product_pricing" USING "btree" ("sku");



CREATE INDEX "idx_vendor_product_pricing_vendor_id" ON "public"."vendor_product_pricing" USING "btree" ("vendor_id");



CREATE INDEX "idx_work_orders_order_id" ON "public"."work_orders" USING "btree" ("order_id");



CREATE INDEX "idx_work_orders_sku" ON "public"."work_orders" USING "btree" ("sku");



CREATE INDEX "idx_work_orders_vendor_id" ON "public"."work_orders" USING "btree" ("vendor_id");



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."order_items"
    ADD CONSTRAINT "order_items_sku_fkey" FOREIGN KEY ("sku") REFERENCES "public"."products"("sku") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."orders"
    ADD CONSTRAINT "orders_vendor_id_fkey" FOREIGN KEY ("vendor_id") REFERENCES "public"."vendors"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."payments"
    ADD CONSTRAINT "payments_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."vendor_product_pricing"
    ADD CONSTRAINT "vendor_product_pricing_sku_fkey" FOREIGN KEY ("sku") REFERENCES "public"."products"("sku") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."vendor_product_pricing"
    ADD CONSTRAINT "vendor_product_pricing_vendor_id_fkey" FOREIGN KEY ("vendor_id") REFERENCES "public"."vendors"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."work_orders"
    ADD CONSTRAINT "work_orders_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."work_orders"
    ADD CONSTRAINT "work_orders_sku_fkey" FOREIGN KEY ("sku") REFERENCES "public"."products"("sku") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."work_orders"
    ADD CONSTRAINT "work_orders_vendor_id_fkey" FOREIGN KEY ("vendor_id") REFERENCES "public"."vendors"("id") ON DELETE CASCADE;



CREATE POLICY "Allow authenticated delete order_items" ON "public"."order_items" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated delete orders" ON "public"."orders" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated delete payments" ON "public"."payments" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated delete products" ON "public"."products" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated delete vendor_product_pricing" ON "public"."vendor_product_pricing" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated delete vendors" ON "public"."vendors" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated delete work_orders" ON "public"."work_orders" FOR DELETE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated insert order_items" ON "public"."order_items" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated insert orders" ON "public"."orders" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated insert payments" ON "public"."payments" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated insert products" ON "public"."products" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated insert vendor_product_pricing" ON "public"."vendor_product_pricing" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated insert vendors" ON "public"."vendors" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated insert work_orders" ON "public"."work_orders" FOR INSERT TO "authenticated" WITH CHECK (true);



CREATE POLICY "Allow authenticated read order_items" ON "public"."order_items" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated read orders" ON "public"."orders" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated read payments" ON "public"."payments" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated read products" ON "public"."products" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated read vendor_product_pricing" ON "public"."vendor_product_pricing" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated read vendors" ON "public"."vendors" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated read work_orders" ON "public"."work_orders" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update order_items" ON "public"."order_items" FOR UPDATE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update orders" ON "public"."orders" FOR UPDATE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update payments" ON "public"."payments" FOR UPDATE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update products" ON "public"."products" FOR UPDATE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update vendor_product_pricing" ON "public"."vendor_product_pricing" FOR UPDATE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update vendors" ON "public"."vendors" FOR UPDATE TO "authenticated" USING (true);



CREATE POLICY "Allow authenticated update work_orders" ON "public"."work_orders" FOR UPDATE TO "authenticated" USING (true);



ALTER TABLE "public"."order_items" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."orders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."payments" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."products" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."vendor_product_pricing" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."vendors" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."work_orders" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";





GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";
































































































































































































GRANT ALL ON TABLE "public"."order_items" TO "anon";
GRANT ALL ON TABLE "public"."order_items" TO "authenticated";
GRANT ALL ON TABLE "public"."order_items" TO "service_role";



GRANT ALL ON TABLE "public"."orders" TO "anon";
GRANT ALL ON TABLE "public"."orders" TO "authenticated";
GRANT ALL ON TABLE "public"."orders" TO "service_role";



GRANT ALL ON TABLE "public"."payments" TO "anon";
GRANT ALL ON TABLE "public"."payments" TO "authenticated";
GRANT ALL ON TABLE "public"."payments" TO "service_role";



GRANT ALL ON TABLE "public"."products" TO "anon";
GRANT ALL ON TABLE "public"."products" TO "authenticated";
GRANT ALL ON TABLE "public"."products" TO "service_role";



GRANT ALL ON TABLE "public"."vendor_product_pricing" TO "anon";
GRANT ALL ON TABLE "public"."vendor_product_pricing" TO "authenticated";
GRANT ALL ON TABLE "public"."vendor_product_pricing" TO "service_role";



GRANT ALL ON TABLE "public"."vendors" TO "anon";
GRANT ALL ON TABLE "public"."vendors" TO "authenticated";
GRANT ALL ON TABLE "public"."vendors" TO "service_role";



GRANT ALL ON TABLE "public"."work_orders" TO "anon";
GRANT ALL ON TABLE "public"."work_orders" TO "authenticated";
GRANT ALL ON TABLE "public"."work_orders" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






























RESET ALL;
