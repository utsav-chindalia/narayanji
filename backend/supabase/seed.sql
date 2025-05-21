SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '4da000e0-110e-4fe2-b74c-01456d576473', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"+911234567890@gajak.com","user_id":"aad89d8d-01a7-4d4c-8b8e-0306e64503a1","user_phone":"911234567890"}}', '2025-05-20 13:24:42.683565+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d2730c1-a903-460d-86c8-08c3ac1712bb', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"+919876543210@gajak.com","user_id":"73e0fa9a-41e8-4d3e-8ec2-a37b696fdb53","user_phone":"919876543210"}}', '2025-05-20 13:24:42.773423+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3bd6411-dc78-4c10-b626-143375921386', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"8105885551@gajak.com","user_id":"cc173c68-2471-4096-b9c0-fa1fd3823d2f","user_phone":"8105885551"}}', '2025-05-20 13:24:42.833408+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d5aefc4-a0e7-4869-943c-8d196f7ecf26', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"+919876543210@gajak.com","user_id":"73e0fa9a-41e8-4d3e-8ec2-a37b696fdb53","user_phone":"919876543210"}}', '2025-05-21 07:03:54.941148+00', ''),
	('00000000-0000-0000-0000-000000000000', '5deec913-1820-422e-82c8-44fb11dc9c46', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"+911234567890@gajak.com","user_id":"aad89d8d-01a7-4d4c-8b8e-0306e64503a1","user_phone":"911234567890"}}', '2025-05-21 07:03:54.941204+00', ''),
	('00000000-0000-0000-0000-000000000000', '76548aa7-920e-4dca-85a5-c164fff9ace2', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"8105885551@gajak.com","user_id":"cc173c68-2471-4096-b9c0-fa1fd3823d2f","user_phone":"8105885551"}}', '2025-05-21 07:03:54.941125+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f0b044c-cb83-4d61-b3f2-6e38cead29eb', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"+911234567890@gajak.com","user_id":"01308449-3ee2-4d2e-9262-754f1c92c58e","user_phone":"911234567890"}}', '2025-05-21 07:04:13.869768+00', ''),
	('00000000-0000-0000-0000-000000000000', '82b8f02c-5514-4aa1-af55-6e6be434755c', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"+919876543210@gajak.com","user_id":"a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc","user_phone":"919876543210"}}', '2025-05-21 07:04:13.95791+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c55e1cf6-a255-4176-ae1f-4746946b01be', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"8105885551@gajak.com","user_id":"9f8c7a8c-6fd5-45ad-a3c1-7367d8171152","user_phone":"8105885551"}}', '2025-05-21 07:04:14.018567+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1d33dd7-5ceb-48da-a640-71013abd399e', '{"action":"user_signedup","actor_id":"9f8c7a8c-6fd5-45ad-a3c1-7367d8171152","actor_username":"8105885551","actor_via_sso":false,"log_type":"team","traits":{"channel":"sms","provider":"phone"}}', '2025-05-21 07:10:30.360051+00', ''),
	('00000000-0000-0000-0000-000000000000', '3b2ada28-b20c-40bf-92c3-ae2e839cebce', '{"action":"login","actor_id":"9f8c7a8c-6fd5-45ad-a3c1-7367d8171152","actor_username":"8105885551","actor_via_sso":false,"log_type":"account","traits":{"provider":"phone"}}', '2025-05-21 07:10:30.364065+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d8e4292-64af-40e4-96b9-e8edbdb366ed', '{"action":"user_recovery_requested","actor_id":"9f8c7a8c-6fd5-45ad-a3c1-7367d8171152","actor_username":"8105885551","actor_via_sso":false,"log_type":"user","traits":{"channel":"sms"}}', '2025-05-21 07:10:30.37183+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e56427d4-8067-44f7-868d-895f9a5e1c2b', '{"action":"user_signedup","actor_id":"9f8c7a8c-6fd5-45ad-a3c1-7367d8171152","actor_username":"8105885551","actor_via_sso":false,"log_type":"team"}', '2025-05-21 07:10:30.392128+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '01308449-3ee2-4d2e-9262-754f1c92c58e', 'authenticated', 'authenticated', '+911234567890@gajak.com', '$2a$10$AlpRWWOzf9g1eGFyAdatgufwJcyiQZ95Bl5P9nfw6mE4DYVReqb66', '2025-05-21 07:04:13.870252+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email", "phone"]}', '{"email_verified": true}', NULL, '2025-05-21 07:04:13.866142+00', '2025-05-21 07:04:13.870543+00', '911234567890', NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc', 'authenticated', 'authenticated', '+919876543210@gajak.com', '$2a$10$hRobFeQfPACNNC5g1TVzee8rBLwyaEJuLwXSbmedL2uCKpjLUiCl6', '2025-05-21 07:04:13.958249+00', NULL, '', NULL, '', NULL, '', '', NULL, NULL, '{"provider": "email", "providers": ["email", "phone"]}', '{"email_verified": true}', NULL, '2025-05-21 07:04:13.956911+00', '2025-05-21 07:04:13.958498+00', '919876543210', NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', 'authenticated', 'authenticated', '8105885551@gajak.com', '$2a$10$wRBZgzw7VuFO7WlyeZsxaefYwzbwQaqEepH06JRSMCkcATC1zHDpC', '2025-05-21 07:04:14.018888+00', NULL, '', '2025-05-21 07:10:30.37243+00', '', NULL, '', '', NULL, '2025-05-21 07:10:30.393638+00', '{"provider": "email", "providers": ["email", "phone"]}', '{"email_verified": true}', NULL, '2025-05-21 07:04:14.017508+00', '2025-05-21 07:10:30.39434+00', '8105885551', '2025-05-21 07:10:30.392411+00', '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('01308449-3ee2-4d2e-9262-754f1c92c58e', '01308449-3ee2-4d2e-9262-754f1c92c58e', '{"sub": "01308449-3ee2-4d2e-9262-754f1c92c58e", "email": "+911234567890@gajak.com", "email_verified": false, "phone_verified": false}', 'email', '2025-05-21 07:04:13.869044+00', '2025-05-21 07:04:13.869066+00', '2025-05-21 07:04:13.869066+00', 'fb097630-e9d8-4c09-a3ac-ee729b4ed12c'),
	('01308449-3ee2-4d2e-9262-754f1c92c58e', '01308449-3ee2-4d2e-9262-754f1c92c58e', '{"sub": "01308449-3ee2-4d2e-9262-754f1c92c58e", "phone": "911234567890", "email_verified": false, "phone_verified": false}', 'phone', '2025-05-21 07:04:13.869506+00', '2025-05-21 07:04:13.869523+00', '2025-05-21 07:04:13.869523+00', 'f97aaf01-2bdf-4a45-8ab2-cac85a21f270'),
	('a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc', 'a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc', '{"sub": "a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc", "email": "+919876543210@gajak.com", "email_verified": false, "phone_verified": false}', 'email', '2025-05-21 07:04:13.957412+00', '2025-05-21 07:04:13.957427+00', '2025-05-21 07:04:13.957427+00', '8d4ab04c-6270-4690-8da7-21b5c71c6068'),
	('a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc', 'a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc', '{"sub": "a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc", "phone": "919876543210", "email_verified": false, "phone_verified": false}', 'phone', '2025-05-21 07:04:13.957692+00', '2025-05-21 07:04:13.957706+00', '2025-05-21 07:04:13.957706+00', '07b3abb9-dfb7-44bd-9282-396f093e918d'),
	('9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', '{"sub": "9f8c7a8c-6fd5-45ad-a3c1-7367d8171152", "email": "8105885551@gajak.com", "email_verified": false, "phone_verified": false}', 'email', '2025-05-21 07:04:14.017987+00', '2025-05-21 07:04:14.018019+00', '2025-05-21 07:04:14.018019+00', '47d21a9b-6acb-4d88-8eff-6cd743ee08d1'),
	('9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', '{"sub": "9f8c7a8c-6fd5-45ad-a3c1-7367d8171152", "phone": "8105885551", "email_verified": false, "phone_verified": false}', 'phone', '2025-05-21 07:04:14.018328+00', '2025-05-21 07:04:14.018347+00', '2025-05-21 07:04:14.018347+00', 'c285beb4-a457-4b7d-9348-0e818d04b31d');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('ab6cf9e1-3fd4-4446-9e31-9c52cf7a44bd', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', '2025-05-21 07:10:30.364602+00', '2025-05-21 07:10:30.364602+00', NULL, 'aal1', NULL, NULL, 'node', '192.168.65.1', NULL),
	('7ab10b26-8797-4323-9721-5b9f69107330', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', '2025-05-21 07:10:30.393662+00', '2025-05-21 07:10:30.393662+00', NULL, 'aal1', NULL, NULL, 'node', '192.168.65.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('ab6cf9e1-3fd4-4446-9e31-9c52cf7a44bd', '2025-05-21 07:10:30.368238+00', '2025-05-21 07:10:30.368238+00', 'password', '743e0937-4d89-4154-ae8c-de800e91c588'),
	('7ab10b26-8797-4323-9721-5b9f69107330', '2025-05-21 07:10:30.394459+00', '2025-05-21 07:10:30.394459+00', 'otp', 'c6dd634a-7af7-435f-940c-817a7e5873a2');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 1, 'aAn9O13P4YRMaEyT7VOgmw', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', false, '2025-05-21 07:10:30.365842+00', '2025-05-21 07:10:30.365842+00', NULL, 'ab6cf9e1-3fd4-4446-9e31-9c52cf7a44bd'),
	('00000000-0000-0000-0000-000000000000', 2, '-plTezVdq0bPXdR1g16tOg', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', false, '2025-05-21 07:10:30.393937+00', '2025-05-21 07:10:30.393937+00', NULL, '7ab10b26-8797-4323-9721-5b9f69107330');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."vendors" ("id", "name", "phone", "pricing_tier", "created_at", "role") VALUES
	('01308449-3ee2-4d2e-9262-754f1c92c58e', 'Vendor One', '+911234567890', 'TIER_1', '2025-05-21 07:04:13.897333+00', 'vendor'),
	('a5dfc7b8-c305-40b0-8c82-52eb8bd5a6cc', 'Vendor Two', '+919876543210', 'TIER_2', '2025-05-21 07:04:13.962173+00', 'vendor'),
	('9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', 'Naryanji', '8105885551', 'TIER_2', '2025-05-21 07:04:14.023336+00', 'admin');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."orders" ("id", "vendor_id", "status", "total_weight", "created_at", "last_updated") VALUES
	('ORD-1747811460295', '9f8c7a8c-6fd5-45ad-a3c1-7367d8171152', 'cart', NULL, '2025-05-21 07:11:00.295+00', NULL);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."products" ("sku", "name", "image_url", "price_per_kg", "created_at", "category", "unit_type", "gst_percent") VALUES
	('SKU1', 'GAJAK GUD', NULL, 480, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU2', 'TILSAKRI GAJAK', NULL, 480, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU3', 'GAJAK CHINI', NULL, 480, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU4', 'SON GUD GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU5', 'SON CHINI GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU6', 'GUD KAJU GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU7', 'CHINI KAJU GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU8', 'CHOCLATE KAJU GAJAK', NULL, 540, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU9', 'MANGO KAJU GAJAK', NULL, 540, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU10', 'SON ROLL GUD GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU11', 'SON ROLL CHINI GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU12', 'DRYFRUIT ROLL GAJAK', NULL, 560, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU13', 'CHOCLATE ROLL GAJAK', NULL, 540, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU14', 'PISTA TILSAKRI GAJAK', NULL, 540, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU15', 'PISTA ELAYCHI TILPATTI', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU16', 'PISTA BATI GAJAK', NULL, 540, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU17', 'CHAMCHAM GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU18', 'MAVA TIL GAJAK', NULL, 520, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU19', 'SUGAR FREE GAJAK', NULL, 720, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU20', 'GUD MALAI GAJAK', NULL, 540, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU21', 'PISTA MALAI GAJAK', NULL, 600, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU22', 'BADAM MALAI GAJAK', NULL, 600, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU23', 'MANGO MALAI GAJAK', NULL, 600, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU24', 'CHOCLATE MALAI GAJAK', NULL, 600, '2025-05-20 06:17:39+00', 'GAJAK', 'PER KG', 5.00),
	('SKU25', 'SPECIAL CHIKKI', NULL, 460, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU26', 'GOL CHIKKI', NULL, 440, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU27', 'RUF-TUF CHIKKI', NULL, 460, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU28', 'DOUBLE MAJA CHIKKI', NULL, 500, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU29', 'DRYFRUIT CHIKKI', NULL, 1000, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU30', 'TAKA-TAK CHIKKI', NULL, 460, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU31', 'BUTTER PANUTS CHIKKI', NULL, 480, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU32', 'ELAYCHI CHIKKI', NULL, 460, '2025-05-20 06:17:39+00', 'CHIKKI', 'PER KG', 5.00),
	('SKU33', 'REWARI GUD', NULL, 480, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU34', 'REWARI CHINI', NULL, 480, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU35', 'CHOCLATE REWARI GUD', NULL, 540, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU36', 'CHOCLATE REWARI CHINI', NULL, 520, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU37', 'PISTA REWARI', NULL, 560, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU38', 'KESAR REWARI', NULL, 560, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU39', 'MANGO REWARI', NULL, 520, '2025-05-20 06:17:39+00', 'REWARI', 'PER KG', 5.00),
	('SKU40', 'KAJU KATLI', NULL, 840, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU41', 'MUNG THAL', NULL, 400, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU42', 'AGRA PETHA', NULL, 120, '2025-05-20 06:17:39+00', 'SWEETS', 'PER PICKET', 5.00),
	('SKU43', 'DODA BARFI', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU44', 'MILK CAKE', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU45', 'SADA BARFI', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU46', 'MOONG BARFI', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU47', 'KESAR BARFI', NULL, 500, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU48', 'MAKHAN BADA', NULL, 500, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU49', 'KASHMIRI BARFI', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU50', 'MAWA KATLI', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU51', 'ANJEER MAWA BARFI', NULL, 540, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU52', 'ANJEER DRY FRUIT BARFI', NULL, 1160, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU53', 'MISHRI MAWA', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU54', 'MATHURA PEDA', NULL, 400, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU55', 'GULAB JAMUN', NULL, 400, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU56', 'RASGULLA', NULL, 340, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU57', 'BANGALI MITHAI', NULL, 420, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU58', 'RASMALLI', NULL, 440, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU59', 'MALAI ROLL', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU60', 'PATISA', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU61', 'KALAKAND', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU62', 'MAWA KACHORI', NULL, 50, '2025-05-20 06:17:39+00', 'SWEETS', 'PER PICE', 5.00),
	('SKU63', 'PANEER', NULL, 400, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU64', 'KANGAN(IMERTI)', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU65', 'KAJU PATISA', NULL, 900, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU66', 'KHEER KADAM', NULL, 480, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU67', 'SOAN PAPDI', NULL, 400, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU68', 'MYSORE PAK', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU69', 'PANNER JALABI', NULL, 500, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU70', 'BADAM KATLI', NULL, 800, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU71', 'AKHROT BARFI', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU72', 'Ghewar FIKA', NULL, 780, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU73', 'Ghewar MITHA', NULL, 680, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU74', 'MINI GHEWAR MITHA', NULL, 840, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU75', 'MINI GHEWAR FIKA', NULL, 940, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU76', 'RABDI MALPUA', NULL, 460, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU77', 'CHOCOLATE BARFI', NULL, 480, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU78', 'SANDESH LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'SWEETS', 'PER KG', 5.00),
	('SKU79', 'CRUNCHY LADDU', NULL, 520, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU80', 'SPECIAL TIL LADDU', NULL, 500, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU81', 'MAVA TIL LADDU', NULL, 500, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU82', 'TIL LADDU', NULL, 420, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU83', 'GOND KE LADDU', NULL, 620, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU84', 'KHAJUR DRYFRUIT LADDU', NULL, 1000, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU85', 'BESAN LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU86', 'KANPURI LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU87', 'CHOGANI LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU88', 'DOODH LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU89', 'MOTICHUR LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU90', 'MAWA LADDU', NULL, 500, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU91', 'SONTH LADDU', NULL, 460, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU92', 'AATA LADDU', NULL, 460, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU93', 'RAM DANA LADDU', NULL, 440, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU94', 'MOONG LADDU', NULL, 460, '2025-05-20 06:17:39+00', 'LADDU', 'PER KG', 5.00),
	('SKU95', 'MASALA BESAN PAPDI', NULL, 280, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU96', 'BESAN PAPDI', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU97', 'MIX NAMKEEN', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU98', 'MOGAR  NAMKEEN', NULL, 320, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU99', 'BOONDI', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU100', 'MASALA BOONDI', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU101', 'DAL MOTH NAMKEEN', NULL, 320, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU102', 'TASTY (FRIED PEANUTS)', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU103', 'SEV NUGRA NAMKEEN', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU104', 'BIKANERI SEV', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU105', 'CHANA DAL NAMKEEN', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU106', 'BHAKARWADI', NULL, 300, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU107', 'GANTHIYA', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU108', 'KADAK SEV / JAIPURI SEV', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU109', 'MASALA SANKHIYA', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU110', 'SADA SANKHIYA', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU111', 'MASALA MATHRI', NULL, 300, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU112', 'SADA MATHRI', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU113', 'METHI MATHRI', NULL, 280, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU114', 'SADA PAPDI', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU115', 'FALHARI NAMKEEN', NULL, 440, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU116', 'KHATA METHA NAMKEEN', NULL, 300, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU117', 'POTATO CHIPS (BLACK PAPER)', NULL, 70, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU118', 'POTATO CHIPS (RED CHILLY)', NULL, 70, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU119', 'WAFERS', NULL, 90, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU120', 'TILPARA', NULL, 320, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU121', 'PUDINA SEV', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU122', 'RATLAMI ( LONG SEV)', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU123', 'ALLU BUJYA', NULL, 300, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU124', 'SOYA KATORI', NULL, 70, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU125', 'MALKA MASUR', NULL, 320, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU126', 'Chat Papadi', NULL, 280, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU127', 'SADA SEV', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU128', 'MUNGBADI (500gm)', NULL, 170, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER PICE', 5.00),
	('SKU129', 'Zero SEV', NULL, 260, '2025-05-20 06:17:39+00', 'UNPACKED_NAMKEEN', 'PER KG', 5.00),
	('SKU130', 'BHELPURI Bikaji', NULL, 65, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU131', 'BIKAJI BHUJIA', NULL, 115, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU132', 'BIKANERI BHUJIA', NULL, 390, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU133', 'Poha', NULL, 95, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU134', 'Bikaji Bikaneri Bhujia', NULL, 360, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU135', 'Moong Dal', NULL, 155, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU136', 'Aloo Bhujia', NULL, 155, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU137', 'BC Bikaneri Bhujia', NULL, 175, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU138', 'Kuch Kuch', NULL, 155, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU139', 'BC all in one', NULL, 175, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU140', 'BC navratan mixture', NULL, 175, '2025-05-20 06:17:39+00', 'PACKED_NAMKEEN', 'PER PICKET', 12.00),
	('SKU141', 'MASALA PEANUTS', NULL, 260, '2025-05-20 06:17:39+00', 'PEANUTS', 'PER KG', 12.00),
	('SKU142', 'SINGDANA WHITE  (PER PACK)', NULL, 130, '2025-05-20 06:17:39+00', 'ROASTED PEANUTS', 'PER PICE', 12.00),
	('SKU143', 'KALI MUNGFALI  (PER PACK)', NULL, 130, '2025-05-20 06:17:39+00', 'ROASTED PEANUTS', 'PER PICE', 12.00),
	('SKU144', 'ALMONDS(SUPER MAMRA)', NULL, 3800, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU145', 'ALMONDS SMALL MAMRA', NULL, 2800, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU146', 'ALMONDS(SATTAR GIRI)', NULL, 2600, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU147', 'ALMONDS SATTAR GIRI', NULL, 2400, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU148', 'ROASTED ALMOND', NULL, 1400, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU149', 'CALFORNIA ALMONDS', NULL, 900, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU150', 'SABUT STARGRI BADAM', NULL, 1600, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER PICKET', 12.00),
	('SKU151', 'SALORA BADAM', NULL, 1400, '2025-05-20 06:17:39+00', 'ALMONDS', 'PER KG', 12.00),
	('SKU152', 'ROASTED CASHEW', NULL, 1500, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU153', 'MASALA CASHEW', NULL, 1600, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU154', 'CASHEW(180 NO.)', NULL, 2100, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU155', 'CASHEW210', NULL, 1600, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU156', 'CASHEW240', NULL, 1400, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU157', 'CASHEW320', NULL, 1200, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU158', 'CASHEW400', NULL, 1100, '2025-05-20 06:17:39+00', 'CASHEW', 'PER KG', 5.00),
	('SKU159', 'ROASTED PISTA BIG', NULL, 1800, '2025-05-20 06:17:39+00', 'PITSA', 'PER KG', 12.00),
	('SKU160', 'ROASTED PISTA SMALL', NULL, 1600, '2025-05-20 06:17:39+00', 'PITSA', 'PER KG', 12.00),
	('SKU161', 'PISTA GIRI', NULL, 4000, '2025-05-20 06:17:39+00', 'PITSA', 'PER KG', 12.00),
	('SKU162', 'ANJEER (BIG)', NULL, 1800, '2025-05-20 06:17:39+00', 'ANJEER', 'PER KG', 12.00),
	('SKU163', 'ANJEER SMALL', NULL, 1600, '2025-05-20 06:17:39+00', 'ANJEER', 'PER KG', 12.00),
	('SKU164', 'KISHMISH (JHANDA )', NULL, 1800, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU165', 'KISHMISH (SUNDAR KHANDI)', NULL, 1800, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU166', 'KISHMISH  LONG', NULL, 500, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU167', 'KISHMISH (GOL )', NULL, 500, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU168', 'KISHMISH ( BLACK)', NULL, 500, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU169', 'MUNAKKA  BIG', NULL, 1400, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU170', 'MUNAKKA SMALL', NULL, 1200, '2025-05-20 06:17:39+00', 'KISHMISH & MUNAKKA', 'PER KG', 5.00),
	('SKU171', 'ELAICHI', NULL, 4200, '2025-05-20 06:17:39+00', 'ELAICHI', 'PER KG', 5.00),
	('SKU172', 'KHURMANI', NULL, 800, '2025-05-20 06:17:39+00', 'KHURMANI', 'PER KG', 12.00),
	('SKU173', 'WALLNUT BIG  GIRI', NULL, 1800, '2025-05-20 06:17:39+00', 'WALLNUT', 'PER KG', 5.00),
	('SKU174', 'WALLNUT SMALL', NULL, 1600, '2025-05-20 06:17:39+00', 'WALLNUT', 'PER KG', 5.00),
	('SKU175', 'WALLNUTS  TUKDI', NULL, 1400, '2025-05-20 06:17:39+00', 'WALLNUT', 'PER KG', 5.00),
	('SKU176', 'MAKHANA (PER PACK)', NULL, 450, '2025-05-20 06:17:39+00', 'MAKHANA', 'PER KG', 5.00),
	('SKU177', 'STH Makhana', NULL, 160, '2025-05-20 06:17:39+00', 'MAKHANA', 'PER PICKET', 5.00),
	('SKU178', 'Flavoured makhana-80gm', NULL, 130, '2025-05-20 06:17:39+00', 'MAKHANA', 'PER PICKET', 5.00),
	('SKU179', 'KALI MIRCH', NULL, 800, '2025-05-20 06:17:39+00', 'KALI MIRCH', 'PER KG', 5.00),
	('SKU180', 'Loong', NULL, 900, '2025-05-20 06:17:39+00', 'LOONG', 'PER KG', NULL),
	('SKU181', 'MISHRI', NULL, 120, '2025-05-20 06:17:39+00', 'MISHRI', 'PER KG', 5.00),
	('SKU182', 'Chuhara', NULL, 320, '2025-05-20 06:17:39+00', 'DATES', 'PER KG', 12.00),
	('SKU183', 'LION QYNO DESEEDED DATS', NULL, 156, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU184', 'LION DESERT KING DATS', NULL, 279, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU185', 'LION ARABIAN DATES', NULL, 220, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU186', 'LION MASKUT KHAJUR DATS', NULL, 247, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU187', 'Dates', NULL, 247, '2025-05-20 06:17:39+00', 'DATES', 'PER KG', 12.00),
	('SKU188', 'SHAHENSHAH BLACK DATES', NULL, 199, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU189', 'SABAA BLACK DATES', NULL, 170, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU190', 'ROYAL ZAHIDI DATES', NULL, 240, '2025-05-20 06:17:39+00', 'DATES', 'PER PICKET', 12.00),
	('SKU191', 'MiX SEEDS', NULL, 900, '2025-05-20 06:17:39+00', 'MiX SEEDS', 'PER KG', 5.00),
	('SKU192', 'PAPAD MUNG SADA (400 gm)', NULL, 110, '2025-05-20 06:17:39+00', 'PAPAD', 'PER PICKET', 0.00),
	('SKU193', 'PAPAD MUNG MEDIUM (400 gm)', NULL, 110, '2025-05-20 06:17:39+00', 'PAPAD', 'PER PICKET', 0.00),
	('SKU194', 'PAPAD MUNG LAHSUN (400 gm)', NULL, 120, '2025-05-20 06:17:39+00', 'PAPAD', 'PER PICKET', 0.00),
	('SKU195', 'PAPAD MUNG PUNJABI (400 gm)', NULL, 120, '2025-05-20 06:17:39+00', 'PAPAD', 'PER PICKET', 0.00),
	('SKU196', 'PAPAD CHANA SADA (400 gm)', NULL, 120, '2025-05-20 06:17:39+00', 'PAPAD', 'PER PICKET', 0.00),
	('SKU197', 'PAPAD CHANA LAHSUN (400 gm)', NULL, 120, '2025-05-20 06:17:39+00', 'PAPAD', 'PER PICKET', 0.00),
	('SKU198', 'KHARI', NULL, 70, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 5.00),
	('SKU199', 'RUSK TOAST', NULL, 70, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 5.00),
	('SKU200', 'BUTTER NAMKEEN COOKIES 250Grms', NULL, 100, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU201', 'HONEY OATS 250Grms', NULL, 130, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU202', 'AATA AJWAIN COOKIES 250Grms', NULL, 110, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU203', 'AATA AJWAIN COOKIES', NULL, 220, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU204', 'COCONUT COOKIES 250Grms', NULL, 110, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU205', 'SUJI ELAICHI 250Grms', NULL, 100, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU206', 'SUJI ELAICHI 500Grms', NULL, 200, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU207', 'SUJI NANKATAI 250Grms', NULL, 105, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU208', 'SUJI NANKATAI 500Grms', NULL, 210, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU209', 'TUTI FRUTI', NULL, 200, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU210', 'CHOCO JUMBO COOKIE', NULL, 200, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU211', 'CHOCO CHIP COOKIE', NULL, 200, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU212', 'COCONUT COOKIE', NULL, 220, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU213', 'SUJI HONEY OATS 500Grms', NULL, 260, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU214', 'DRY FRUIT COOKIE', NULL, 200, '2025-05-20 06:17:39+00', 'BAKERY PRODUCT', 'PER PICKET', 18.00),
	('SKU215', 'MASALA THEPLA', NULL, 75, '2025-05-20 06:17:39+00', 'THEPLA', 'PER PICKET', 5.00),
	('SKU216', 'METHI THEPLA', NULL, 75, '2025-05-20 06:17:39+00', 'THEPLA', 'PER PICKET', 5.00),
	('SKU217', 'GARLIC THEPLA', NULL, 75, '2025-05-20 06:17:39+00', 'THEPLA', 'PER PICKET', 5.00),
	('SKU218', 'DAIRY MILK SILK', NULL, 85, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU219', 'Fruit and Nut', NULL, 45, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU220', 'Dairy milk', NULL, 50, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU221', 'Dairy milk crispello', NULL, 35, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU222', '5 STAR', NULL, 20, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU223', 'DAIRY MILK FAMILY PACK', NULL, 130, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU224', 'Silk Bubbly Large', NULL, 195, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU225', 'DAIRY MILK FRUIT AND NUT', NULL, 90, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU226', 'SILK GANACHE', NULL, 185, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU227', 'SILK HEART BILK', NULL, 180, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU228', 'Cadbury Rum Raisins', NULL, 110, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU229', 'Cadbury Temptations Almond Treat', NULL, 110, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU230', 'Cadbury Bournville', NULL, 110, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU231', 'Silk Oreo', NULL, 90, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU232', 'Dairy Milk Crackle', NULL, 45, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU233', 'Cadbury Bournville Classic', NULL, 50, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU234', 'Dairy Milk Silk Bubbly', NULL, 90, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU235', 'Silk Desserts', NULL, 140, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU236', 'Cadbury Celebrations', NULL, 150, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU237', 'Dairy Milk Selections', NULL, 380, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU238', 'DARY MILK', NULL, 45, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU239', 'FUSE CHOCOLATE', NULL, 20, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU240', 'LICKABLES MOTU PATLU', NULL, 45, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU241', 'DARY MILK SILK', NULL, 90, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU242', 'NUTTIES CHOCOLATE', NULL, 45, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU243', 'DARY MILK CHOCOLATE', NULL, 180, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU244', 'DARY MILK OREO', NULL, 195, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU245', 'DAIRY MILK SILK', NULL, 195, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU246', 'FUSE', NULL, 40, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU247', '5STAR OREO', NULL, 40, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU248', 'DARY MILK', NULL, 50, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU249', 'DARY MILK', NULL, 20, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU250', 'Celebration Pack MRP 550', NULL, 550, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU251', 'Celebration Pack MRP 200', NULL, 200, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU252', 'Celebration Pack MRP 375', NULL, 375, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU253', 'Celebration Pack MRP 300', NULL, 300, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU254', 'Celebration pack MRP 160', NULL, 160, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU255', 'Celebration pack MRP 110', NULL, 110, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU256', 'Celebration pack MRP 575', NULL, 575, '2025-05-20 06:17:39+00', 'CHOCOLATE', 'PER PCS', 18.00),
	('SKU257', 'SAMOSA          (PER PLATE)', NULL, 20, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU258', 'DAL KACHORI   (PER PLATE)', NULL, 20, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU259', 'AALOO KACHORI    (PER PLATE)', NULL, 20, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU260', 'PYAZ KACHORI    (PER PLATE)', NULL, 25, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU261', 'BREAD PAKODA   (PER PLATE)', NULL, 30, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU262', 'MIRCHI BADA   (PER PLATE)', NULL, 30, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU263', 'RAJ KACHORI   (PER PLATE)', NULL, 60, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU264', 'PANI PATASI AATA (PER PLATE)', NULL, 20, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU265', 'PANI PATASI SUJI  (PER PLATE)', NULL, 30, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU266', 'CHOLA TIKKI   (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU267', 'JALEBI (PER KG)', NULL, 400, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/KG', 5.00),
	('SKU268', 'BHELPURI   (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU269', 'DAHI CHAT PAPDI   (PER PLATE)', NULL, 60, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU270', 'DAHI BADA   (PER PLATE)', NULL, 60, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU271', 'PAV BHAJI  (PER PLATE)', NULL, 70, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU272', 'EXTRA PAV  (PER PLATE)', NULL, 20, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU273', 'SEV PURI   (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU274', 'CHOLA BHATURA   (PER PLATE)', NULL, 80, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU275', 'EXTRA BHATURA  (PER PLATE)', NULL, 30, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU276', 'CHOWMEIN  (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU277', 'DAL CHILLA  (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU278', 'PANEER CHILLA   (PER PLATE)', NULL, 70, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU279', 'VEZ BURGER  (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU280', 'CHEEZ BURGER   (PER PLATE)', NULL, 70, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU281', 'VEZ SANDWICH   (PER PLATE)', NULL, 80, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU282', 'CHEEZ SANDWICH    (PER PLATE)', NULL, 120, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU283', 'AALOO CHAT     (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU284', 'DRY BHEL    (PER PLATE)', NULL, 50, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/PLATE', 5.00),
	('SKU285', 'DAL PAKODI   (PER KG)', NULL, 360, '2025-05-20 06:17:39+00', 'FAST-FOODS', 'PER/KG', 5.00),
	('SKU286', 'STH GOLGAPPA KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU287', 'STH CHATPATA KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU288', 'STH CHEESE KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU289', 'STH METHI KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU290', 'STH GARLIC KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU291', 'STH MANCHURIAN KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU292', 'STH JEERA KHAKHARA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU293', 'STH PUNJABI KHAKHARA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU294', 'STH MOONG KHAKHARA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU295', 'STH MASALA KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU296', 'TALOD PANIPURI KHAKHRA', NULL, 81, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU297', 'TALOD PIZZA KHAKHRA', NULL, 81, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU298', 'TALOD PERI PERI KHAKHRA', NULL, 0, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU299', 'TALOD NOODLES KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU300', 'TALOD MEXICAN KHAKHRA', NULL, 81, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU301', 'KASURI MATHI KHAKHRA', NULL, 75, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU302', 'TALOD PLAIN KHAKHRA', NULL, 75, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU303', 'TALOD JEERA KHAKHRA', NULL, 75, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU304', 'TALOD MASALA KHAKHRA', NULL, 75, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU305', 'STH PLAIN KHAKHRA', NULL, 80, '2025-05-20 06:17:39+00', 'KHAKHRA', 'PER/PICKET', 5.00),
	('SKU306', 'NIMBU PANNI', NULL, 45, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 5.00),
	('SKU307', 'PUDINA AAM PANNA JALANI', NULL, 45, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 5.00),
	('SKU308', 'PUDINA AAM PANNA', NULL, 45, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 5.00),
	('SKU309', 'KAPOORJI PISTA THANDAI', NULL, 0, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU310', 'KAPOORJI GULAB SYRUP', NULL, 340, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU311', 'KAPOORJI ALMOND SYRUP', NULL, 540, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU312', 'KAPOORJI KESAR THANDAI', NULL, 0, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU313', 'KAPOORJI CHANDRAMRIT', NULL, 510, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU314', 'KAPOORJI KHUS', NULL, 340, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU315', 'FROLIC CHANDAN SYRUP', NULL, 415, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU316', 'FORLIC ROSE SYRUP', NULL, 225, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU317', 'FORLIC KHUS SYRUP', NULL, 225, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU318', 'Jalani jaljira pack', NULL, 45, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU319', 'JALANI JALJIRA', NULL, 65, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU320', 'MANGO FRUIT SYRUP', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU321', 'KHUS SYRUP', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU322', 'ORANGE FRUIT SYRUP', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU323', 'KESARIA THANDAI', NULL, 0, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU324', 'Litchi fruit', NULL, 200, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU325', 'Kairi pudina', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU326', 'Kala khata fruit', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU327', 'Rose syrup', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU328', 'Kesarya badam fruit Shabbat', NULL, 355, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU329', 'Bela syrup', NULL, 220, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU330', 'Leman Shikanji', NULL, 190, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 12.00),
	('SKU331', 'Shai Gulab syrup', NULL, 240, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU332', 'Kesar Elachi sharabat', NULL, 395, '2025-05-20 06:17:39+00', 'SARBAT & THANDAI', 'PER/BOTTLE', 18.00),
	('SKU333', 'RAJASTHANI TADKA', NULL, 175, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU334', 'JAIN KER SANGRI ACHAR', NULL, 300, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU335', 'KAIRI ACHAAR', NULL, 275, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU336', 'FORLIC KER ACHAR', NULL, 315, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU337', 'LESWA ACHAAR FORLIC', NULL, 275, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU338', 'GAJAR ACHAAR', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU339', 'NIMBOO CHUTNEY', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU340', 'KARI CHOONDA', NULL, 150, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU341', 'NIMBOO ACHAAR', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU342', 'FORLIC LAL MIRCH', NULL, 200, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU343', 'RAI MIRCH ACHAR', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU344', 'JAIN GARLIC CHUTNEY', NULL, 180, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU345', 'JAIN MANGO PICKLE', NULL, 110, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU346', 'GHUNDA ACHAAR', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU347', 'HARI MIRCHI ATHNA', NULL, 110, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU348', 'JAIN KER SANGRI', NULL, 220, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU349', 'JAIN MIX PICKLE', NULL, 110, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU350', 'MANGO PICKLE', NULL, 130, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU351', 'MIXED PICKLE', NULL, 130, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU352', 'HARI MIRCHI KUTTA', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU353', 'SWEET LIME PICKLE', NULL, 125, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU354', 'LAL MIRCHI KUTTA', NULL, 160, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU355', 'Garlic pickile', NULL, 275, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU356', 'LIME LACCHA CHUTNEY (400 gm)', NULL, 120, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU357', 'KER SANGARI PICKEL (400 gm)', NULL, 180, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU358', 'LAHSUN CHUTNEY (400 gm)', NULL, 140, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU359', 'KER PICKLE(400 gm)', NULL, 180, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU360', 'GUNDA PICKLE (500 gm)', NULL, 250, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU361', 'LEMON PICKLE (400 gm)', NULL, 110, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU362', 'MANGO PICKLE (400 gm)', NULL, 110, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU363', 'LAL MIRCHI PICKLE (400 gm)', NULL, 100, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00),
	('SKU364', 'HARI MIRCHI PICKLE(400gm)', NULL, 80, '2025-05-20 06:17:39+00', 'ACHAAR &CHUTNEY', 'PER/PICKET', 12.00);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."order_items" ("id", "order_id", "sku", "quantity_kg", "approved_quantity_kg") VALUES
	('fac25bec-b634-44ae-af7d-ea5435ea939c', 'ORD-1747811460295', 'SKU1', 2, NULL),
	('e822fbe4-9dea-4c6c-b0e1-1cf2dd2cec52', 'ORD-1747811460295', 'SKU2', 2, NULL);


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pricing_tiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."pricing_tiers" ("name", "discount_pct") VALUES
	('TIER_1', 0.00),
	('TIER_2', 0.10),
	('TIER_3', 0.15);


--
-- Data for Name: work_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 2, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
