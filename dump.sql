--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shortenUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortenUrls" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: shortenUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortenUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortenUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortenUrls_id_seq" OWNED BY public."shortenUrls".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    "encryptedPassword" text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shortenUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortenUrls" ALTER COLUMN id SET DEFAULT nextval('public."shortenUrls_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 2, '6934eb2b-6d80-4401-ac38-ba67ea583a0d', '2022-10-14 22:21:29.225644');
INSERT INTO public.sessions VALUES (3, 1, 'afcc6064-5b70-4c91-8a16-30ebf682becf', '2022-10-15 16:35:52.191569');
INSERT INTO public.sessions VALUES (4, 3, '1a96d912-6dd5-432b-9c87-33cff59274e4', '2022-10-15 17:22:24.705419');
INSERT INTO public.sessions VALUES (5, 5, 'd4de38a6-96e5-490a-94eb-67d94b613f4c', '2022-10-15 20:24:48.681144');
INSERT INTO public.sessions VALUES (6, 12, '7929605a-96e3-498b-9d45-88447bb0f208', '2022-10-16 15:19:34.549599');


--
-- Data for Name: shortenUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."shortenUrls" VALUES (2, 1, 'https://www.youtube.com/watch?v=sbRBGIswzi4', 'QYXdXCc9', 0, '2022-10-15 16:37:38.162101');
INSERT INTO public."shortenUrls" VALUES (4, 2, 'https://www.youtube.com/watch?v=ZNS948a2nZY', 'i2VYjCQL', 4, '2022-10-15 16:39:57.999164');
INSERT INTO public."shortenUrls" VALUES (6, 5, 'https://github.com/ronaldo-a', 'fTUybZoB', 4, '2022-10-15 20:26:25.373608');
INSERT INTO public."shortenUrls" VALUES (7, 5, 'https://www.youtube.com/watch?v=fQ3Z3FUcpdo', 'N62etem-', 3, '2022-10-15 20:28:31.696853');
INSERT INTO public."shortenUrls" VALUES (3, 1, 'https://www.youtube.com/watch?v=LccxHuHq-RA', 'OyvoOhrL', 3, '2022-10-15 16:38:21.711775');
INSERT INTO public."shortenUrls" VALUES (8, 12, 'htt://joi.dev/api/?v=17.6.1#objectpatternpattern-schema-options', 'rs1UIid2', 0, '2022-10-16 16:24:06.603864');
INSERT INTO public."shortenUrls" VALUES (9, 12, 'https://uibakery.io/regex-library/url', 'gupaAo0j', 0, '2022-10-16 16:37:48.110946');
INSERT INTO public."shortenUrls" VALUES (10, 12, 'http://www.youtube.com/', 'Hx808DaL', 0, '2022-10-16 16:38:40.003267');
INSERT INTO public."shortenUrls" VALUES (11, 12, 'www.youtube.com', 'z3psB_Iu', 0, '2022-10-16 19:55:16.280618');
INSERT INTO public."shortenUrls" VALUES (12, 12, 'http://www.youtube.com/watch?v=jfKfPfyJRdk', 'yYJS0aKQ', 0, '2022-10-16 19:58:04.070648');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Ronaldo', 'ronaldo@ronaldo.com', '$2b$10$Zn.Tr/HTOTprQTCsOKK.De16OKrwj2GIyGj/Jp3IOcEwTqlp4TzpC');
INSERT INTO public.users VALUES (2, 'Lisbeth', 'lisbeth@lisbeth.com', '$2b$10$hqCkwqdOh5iNOPfcvsRK6u6QU67qq9QwKxtANTNSvtIvxs1TAS7Ki');
INSERT INTO public.users VALUES (3, 'Hermione', 'hermione@hermione.com', '$2b$10$MLF7AF2MMEEp06s9y4vdluEuAXvUGqGL1JADXAf.QOrwY/EaXblsi');
INSERT INTO public.users VALUES (5, 'Mokoko', 'mokoko@mokoko.com', '$2b$10$zHu5rfJn3a8Ncpv/uBWrhOm.p/9ubvYV5oKFvyGdvPGVuXk7d7y2u');
INSERT INTO public.users VALUES (6, 'Flipturn', 'flipturn@flipturn.com', '$2b$10$2f1sdL.7pRAjNGl3y3AXzeUhG0i7Gg9Z7.y6wIJxAaBUBsM.OWn5K');
INSERT INTO public.users VALUES (7, 'Patrícia', 'patricia@patricia.com', '$2b$10$nPt2Q8kGWTDEwehd27jnSu1L3aGhtw1wdPLJmpr35pBT4bIt3UoAe');
INSERT INTO public.users VALUES (8, 'Marcelo', 'marcelo@marcelo.com', '$2b$10$ny0f3BWOH7y1D9fjUyDSbOJsZsqysSkF0Id0YDzQ9gmAzk8O.5xpa');
INSERT INTO public.users VALUES (9, 'Lílian', 'lilian@lilian.com', '$2b$10$063YT8ERnyu7.mtSH1BnZue1cNUsJjgvG4xO10FmzzHCClZnLZNcG');
INSERT INTO public.users VALUES (10, 'Daniel', 'daniel@daniel.com', '$2b$10$Hl/NLyY7yID2GcfDEbuLXOa0GTHbtYDFTN55DrZNgmLR85lvGzIzi');
INSERT INTO public.users VALUES (11, 'Helena', 'helena@helena.com', '$2b$10$w4QE4iblDyHvDqEhHpzzXu9tM9fqvbxDhb93jd1wvlz4w2K/xaig6');
INSERT INTO public.users VALUES (12, 'Nicolas', 'nicolas@nicolas.com', '$2b$10$BVJYL/mPzRWKB4VtseehHuyfB.DJbqgICLrl85bvKLZ01f5ltE.tW');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 7, true);


--
-- Name: shortenUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortenUrls_id_seq"', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: sessions sessions_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_key" UNIQUE ("userId");


--
-- Name: shortenUrls shortenUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortenUrls"
    ADD CONSTRAINT "shortenUrls_pkey" PRIMARY KEY (id);


--
-- Name: shortenUrls shortenUrls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortenUrls"
    ADD CONSTRAINT "shortenUrls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: shortenUrls shortenUrls_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortenUrls"
    ADD CONSTRAINT "shortenUrls_url_key" UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_encryptedPassword_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_encryptedPassword_key" UNIQUE ("encryptedPassword");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shortenUrls shortenUrls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortenUrls"
    ADD CONSTRAINT "shortenUrls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

