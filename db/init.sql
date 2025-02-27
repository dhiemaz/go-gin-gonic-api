--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Homebrew)
-- Dumped by pg_dump version 17.4 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS "gin-gonic-api";
--
-- Name: gin-gonic-api; Type: DATABASE; Schema: -; Owner: hendisantika
--

CREATE DATABASE "gin-gonic-api" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "gin-gonic-api" OWNER TO hendisantika;

\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='gin-gonic-api'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: hendisantika
--

CREATE TABLE public.roles (
                              id bigint NOT NULL,
                              role text,
                              created_at timestamp with time zone,
                              updated_at timestamp with time zone,
                              deleted_at timestamp with time zone
);


ALTER TABLE public.roles OWNER TO hendisantika;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: hendisantika
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO hendisantika;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hendisantika
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: hendisantika
--

CREATE TABLE public.users (
                              id bigint NOT NULL,
                              name text,
                              email text,
                              password text,
                              status bigint,
                              role_id bigint NOT NULL,
                              created_at timestamp with time zone,
                              updated_at timestamp with time zone,
                              deleted_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO hendisantika;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hendisantika
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO hendisantika;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hendisantika
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: hendisantika
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hendisantika
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: hendisantika
--

INSERT INTO public.roles (id, role, created_at, updated_at, deleted_at) VALUES (1, 'user', '2025-02-27 07:48:28.084298+07', NULL, NULL);
INSERT INTO public.roles (id, role, created_at, updated_at, deleted_at) VALUES (2, 'admin', '2025-02-27 07:48:43.686187+07', NULL, NULL);
INSERT INTO public.roles (id, role, created_at, updated_at, deleted_at) VALUES (3, 'ADMIN', '2025-02-27 07:55:29.182109+07', NULL, NULL);
INSERT INTO public.roles (id, role, created_at, updated_at, deleted_at) VALUES (4, 'USER', '2025-02-27 07:55:29.182109+07', NULL, NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hendisantika
--

INSERT INTO public.users (id, name, email, password, status, role_id, created_at, updated_at, deleted_at) VALUES (1, 'ITADORI YUJI', 'yuji@yopmail.com', 'yuji', 1, 3, '2025-02-27 08:04:57.815507+07', NULL, NULL);
INSERT INTO public.users (id, name, email, password, status, role_id, created_at, updated_at, deleted_at) VALUES (2, 'FUSHIGURO MEGUMI', 'megumi@yopmail.com', 'megumi', 1, 3, '2025-02-27 08:04:57.815507+07', NULL, NULL);
INSERT INTO public.users (id, name, email, password, status, role_id, created_at, updated_at, deleted_at) VALUES (3, 'SATORU GOJO', 'gojo@yopmail.com', 'gojo', 1, 3, '2025-02-27 08:04:57.815507+07', NULL, NULL);
INSERT INTO public.users (id, name, email, password, status, role_id, created_at, updated_at, deleted_at) VALUES (4, 'SUGURU GETO', 'geto@yopmail.com', 'geto', 0, 3, '2025-02-27 08:04:57.815507+07', NULL, NULL);
INSERT INTO public.users (id, name, email, password, status, role_id, created_at, updated_at, deleted_at) VALUES (5, 'RYOUMEN SUKUNA', 'sukuna@yopmail.com', 'sukuna', 1, 4, '2025-02-27 08:04:57.815507+07', NULL, NULL);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hendisantika
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hendisantika
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: hendisantika
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hendisantika
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users fk_users_role; Type: FK CONSTRAINT; Schema: public; Owner: hendisantika
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

