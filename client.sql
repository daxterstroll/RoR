--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-05-18 00:23:29 EEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12431)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 193 (class 1259 OID 17521)
-- Name: bookings; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    user_id integer,
    item_id integer,
    started_at date,
    ended_on date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.bookings OWNER TO admin;

--
-- TOC entry 192 (class 1259 OID 17519)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_id_seq OWNER TO admin;

--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 192
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- TOC entry 195 (class 1259 OID 17529)
-- Name: cities; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cities OWNER TO admin;

--
-- TOC entry 194 (class 1259 OID 17527)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO admin;

--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 194
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 189 (class 1259 OID 17499)
-- Name: items; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.items (
    id integer NOT NULL,
    user_id integer,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    city_id integer
);


ALTER TABLE public.items OWNER TO admin;

--
-- TOC entry 188 (class 1259 OID 17497)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO admin;

--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 188
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 191 (class 1259 OID 17510)
-- Name: reviews; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer,
    message character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reviewable_id integer,
    reviewable_type text
);


ALTER TABLE public.reviews OWNER TO admin;

--
-- TOC entry 190 (class 1259 OID 17508)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO admin;

--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 190
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 185 (class 1259 OID 17468)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO admin;

--
-- TOC entry 187 (class 1259 OID 17488)
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    city_id integer
);


ALTER TABLE public.users OWNER TO admin;

--
-- TOC entry 186 (class 1259 OID 17486)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 186
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2079 (class 2604 OID 17524)
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 17532)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 17502)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 17513)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 17491)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2226 (class 0 OID 17521)
-- Dependencies: 193
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.bookings (id, user_id, item_id, started_at, ended_on, created_at, updated_at) FROM stdin;
27	7	3	\N	\N	2018-05-17 20:34:59.976819	2018-05-17 20:34:59.976819
28	3	6	\N	\N	2018-05-17 20:35:07.675733	2018-05-17 20:35:07.675733
29	2	1	\N	\N	2018-05-17 20:35:13.323105	2018-05-17 20:35:13.323105
30	1	2	\N	\N	2018-05-17 20:35:18.027336	2018-05-17 20:35:18.027336
\.


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 192
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.bookings_id_seq', 30, true);


--
-- TOC entry 2228 (class 0 OID 17529)
-- Dependencies: 195
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cities (id, name, created_at, updated_at) FROM stdin;
2	Kiev	2018-05-14 15:06:05.307339	2018-05-14 15:40:41.849711
3	Lviv	2018-05-14 15:06:13.717977	2018-05-14 15:40:47.163613
\.


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 194
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cities_id_seq', 3, true);


--
-- TOC entry 2222 (class 0 OID 17499)
-- Dependencies: 189
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.items (id, user_id, name, created_at, updated_at, city_id) FROM stdin;
1	1	Iphone	2018-05-14 15:06:40.158551	2018-05-14 19:59:55.049799	2
2	2	car	2018-05-14 15:07:13.15682	2018-05-14 15:07:13.15682	2
3	3	часы	2018-05-14 17:40:46.899326	2018-05-14 20:37:44.009067	2
6	7	Coca-cola	2018-05-17 20:33:39.76724	2018-05-17 20:33:39.76724	2
\.


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 188
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.items_id_seq', 6, true);


--
-- TOC entry 2224 (class 0 OID 17510)
-- Dependencies: 191
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.reviews (id, user_id, message, created_at, updated_at, reviewable_id, reviewable_type) FROM stdin;
\.


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 190
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.reviews_id_seq', 187, true);


--
-- TOC entry 2218 (class 0 OID 17468)
-- Dependencies: 185
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.schema_migrations (version) FROM stdin;
20180505213818
20180507113100
20180507113335
20180507130801
20180507133424
20180512141256
\.


--
-- TOC entry 2220 (class 0 OID 17488)
-- Dependencies: 187
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, name, email, created_at, updated_at, city_id) FROM stdin;
1	Maxim	daxterstroll@gmail.com	2018-05-14 15:06:24.833775	2018-05-14 15:43:52.273044	2
2	Ostap	Ostap@gmail.com	2018-05-14 15:07:00.871491	2018-05-14 15:42:55.652196	2
3	Oleg		2018-05-14 15:29:35.320783	2018-05-14 15:42:41.697394	2
7	Olya		2018-05-17 20:33:24.43166	2018-05-17 20:33:24.43166	3
\.


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 186
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 2091 (class 2606 OID 17526)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 17537)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 17507)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 17518)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 17496)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2092 (class 1259 OID 17574)
-- Name: fki_item_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fki_item_id ON public.bookings USING btree (item_id);


--
-- TOC entry 2093 (class 1259 OID 17568)
-- Name: fki_user_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fki_user_id ON public.bookings USING btree (user_id);


--
-- TOC entry 2087 (class 1259 OID 17585)
-- Name: fki_user_id_fkey; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fki_user_id_fkey ON public.reviews USING btree (user_id);


--
-- TOC entry 2084 (class 1259 OID 17596)
-- Name: fki_user_id_fkeyy; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX fki_user_id_fkeyy ON public.items USING btree (user_id);


--
-- TOC entry 2081 (class 1259 OID 17474)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- TOC entry 2096 (class 2606 OID 17558)
-- Name: items city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- TOC entry 2100 (class 2606 OID 17569)
-- Name: bookings item_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT item_id FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 2099 (class 2606 OID 17563)
-- Name: bookings user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2098 (class 2606 OID 17580)
-- Name: reviews user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2097 (class 2606 OID 17591)
-- Name: items user_id_fkeyy; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT user_id_fkeyy FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2018-05-18 00:23:29 EEST

--
-- PostgreSQL database dump complete
--

