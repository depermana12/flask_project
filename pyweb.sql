--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Ubuntu 15.6-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.6 (Ubuntu 15.6-1.pgdg22.04+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: registrants; Type: TABLE; Schema: public; Owner: depermana
--

CREATE TABLE public.registrants (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    sport character varying(255)
);


ALTER TABLE public.registrants OWNER TO depermana;

--
-- Name: registrants_id_seq; Type: SEQUENCE; Schema: public; Owner: depermana
--

CREATE SEQUENCE public.registrants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registrants_id_seq OWNER TO depermana;

--
-- Name: registrants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: depermana
--

ALTER SEQUENCE public.registrants_id_seq OWNED BY public.registrants.id;


--
-- Name: registrants id; Type: DEFAULT; Schema: public; Owner: depermana
--

ALTER TABLE ONLY public.registrants ALTER COLUMN id SET DEFAULT nextval('public.registrants_id_seq'::regclass);


--
-- Data for Name: registrants; Type: TABLE DATA; Schema: public; Owner: depermana
--

COPY public.registrants (id, name, sport) FROM stdin;
45	Deddia Permana	Basketball
79	python	Ultimate Frisbee
\.


--
-- Name: registrants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: depermana
--

SELECT pg_catalog.setval('public.registrants_id_seq', 79, true);


--
-- Name: registrants registrants_pkey; Type: CONSTRAINT; Schema: public; Owner: depermana
--

ALTER TABLE ONLY public.registrants
    ADD CONSTRAINT registrants_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO depermana;


--
-- PostgreSQL database dump complete
--

