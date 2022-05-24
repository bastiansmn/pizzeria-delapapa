--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

DROP DATABASE IF EXISTS pizzeria_delapapa;
--
-- Name: pizzeria_delapapa; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pizzeria_delapapa WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'fr_FR.UTF-8';


ALTER DATABASE pizzeria_delapapa OWNER TO postgres;

\connect pizzeria_delapapa

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
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer DEFAULT nextval('public.address_id_seq'::regclass) NOT NULL,
    name_adr text NOT NULL,
    opt_info text NOT NULL,
    user_id integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: deliverer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliverer_id_seq OWNER TO postgres;

--
-- Name: deliverer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverer (
    id integer DEFAULT nextval('public.deliverer_id_seq'::regclass) NOT NULL,
    deliverer_name text NOT NULL,
    deliverer_lastname text NOT NULL,
    order_id integer
);


ALTER TABLE public.deliverer OWNER TO postgres;

--
-- Name: drink_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drink_size (
    size text NOT NULL,
    coefficient double precision
);


ALTER TABLE public.drink_size OWNER TO postgres;

--
-- Name: ingr_quant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingr_quant (
    ingr_id integer,
    pizza_id integer,
    quant integer
);


ALTER TABLE public.ingr_quant OWNER TO postgres;

--
-- Name: ingredients_ingr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_ingr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_ingr_id_seq OWNER TO postgres;

--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    ingr_id integer DEFAULT nextval('public.ingredients_ingr_id_seq'::regclass) NOT NULL,
    ingr_name text NOT NULL,
    ingr_type text NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- Name: link_menu_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_menu_product (
    menu_id integer,
    drink_size text,
    pizza_size text,
    product_type integer,
    quant integer
);


ALTER TABLE public.link_menu_product OWNER TO postgres;

--
-- Name: menu_quant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_quant (
    order_id integer,
    menu_id integer,
    quant integer
);


ALTER TABLE public.menu_quant OWNER TO postgres;

--
-- Name: menu_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_size (
    menu_id integer NOT NULL,
    size text NOT NULL
);


ALTER TABLE public.menu_size OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_id_seq OWNER TO postgres;

--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer DEFAULT nextval('public.menus_id_seq'::regclass) NOT NULL,
    price integer NOT NULL,
    menu_name text NOT NULL,
    image text,
    description text
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_id_seq OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer DEFAULT nextval('public.order_id_seq'::regclass) NOT NULL,
    status text NOT NULL,
    date timestamp with time zone NOT NULL,
    address_id integer
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: pizza_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_size (
    size text NOT NULL,
    coefficient double precision
);


ALTER TABLE public.pizza_size OWNER TO postgres;

--
-- Name: prod_quant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prod_quant (
    order_id integer,
    product_id integer,
    quant integer,
    pizza_size text,
    sauce_name text,
    drink_size text,
    type text
);


ALTER TABLE public.prod_quant OWNER TO postgres;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer DEFAULT nextval('public.product_id_seq'::regclass) NOT NULL,
    name text,
    price integer,
    image text,
    type integer NOT NULL,
    is_custom boolean DEFAULT false,
    is_veggie boolean DEFAULT false,
    is_spicy boolean DEFAULT false,
    description text
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: sauce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sauce (
    name text NOT NULL
);


ALTER TABLE public.sauce OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    lastname text NOT NULL,
    password text NOT NULL,
    phone_num text NOT NULL,
    is_deliverer boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (id, name_adr, opt_info, user_id) VALUES (3, '23 allée des platanes', '', 7);


--
-- Data for Name: deliverer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: drink_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.drink_size (size, coefficient) VALUES ('25cl', 0.9);
INSERT INTO public.drink_size (size, coefficient) VALUES ('33cl', 1);
INSERT INTO public.drink_size (size, coefficient) VALUES ('50cl', 1.2);
INSERT INTO public.drink_size (size, coefficient) VALUES ('1l', 1.5);


--
-- Data for Name: ingr_quant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (22, 1, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 1, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (9, 1, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (18, 1, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (15, 1, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (22, 2, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 2, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (7, 2, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (5, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (24, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (21, 3, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (12, 4, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 4, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (30, 4, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (29, 4, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (8, 4, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 5, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 5, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (16, 5, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (25, 5, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 6, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 6, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (8, 6, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 6, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 7, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 7, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (30, 7, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (23, 7, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (24, 7, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 7, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (12, 8, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 8, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (29, 8, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 8, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 8, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (5, 8, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 9, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 9, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (28, 9, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 10, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 10, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (1, 10, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (26, 10, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (24, 10, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 10, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (22, 11, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 11, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 11, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 11, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (31, 11, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (12, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (16, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (30, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (31, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 12, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 13, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 13, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (30, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (28, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (5, 14, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 15, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 15, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (16, 15, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 15, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 16, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 16, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (8, 16, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (29, 16, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 16, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (2, 16, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (22, 17, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 17, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (14, 17, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (21, 17, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (13, 17, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (27, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (6, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (24, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (4, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (17, 18, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (10, 19, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 19, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (29, 19, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (24, 19, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (11, 19, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (22, 20, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 20, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (3, 20, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (31, 20, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (21, 20, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (22, 21, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (19, 21, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (9, 21, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (20, 21, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (9, 63, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (1, 63, 1);
INSERT INTO public.ingr_quant (ingr_id, pizza_id, quant) VALUES (23, 63, 1);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (1, 'Olives noires', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (2, 'Sauce samouraï', 'Sauce');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (3, 'Pomme de terre', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (4, 'Oignons rouges frais', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (5, 'Poivrons verts frais', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (6, 'Kébab', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (7, 'Saumon fumé de Norvège', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (8, 'Merguez', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (9, 'Fromage de chèvre', 'Fromage');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (10, 'Sauce tomate à l''origan', 'Base');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (11, 'Parmigiano reggiano AOP', 'Fromage');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (12, 'Sauce Barbecue', 'Sauce');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (13, 'Champignon frais', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (14, 'Jambon cru', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (15, 'Fourme d''Ambert AOP', 'Fromage');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (16, 'Jambon', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (17, 'Sauce blanche kébab', 'Sauce');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (18, 'Emmental', 'Fromage');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (19, 'Mozzarella', 'Fromage');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (20, 'Miel', 'Sauce');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (21, 'Fromage à raclette', 'Fromage');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (22, 'Crème fraîche légère', 'Base');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (23, 'Piments jalapeños', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (24, 'Tomates fraîches', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (25, 'Ananas', 'Légumes/fruits');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (26, 'Thon', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (27, 'Emincés de poulet', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (28, 'Saucisse pepperoni', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (29, 'Filet de poulet rôti', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (30, 'Emietté au boeuf', 'Viande/poisson');
INSERT INTO public.ingredients (ingr_id, ingr_name, ingr_type) VALUES (31, 'Lardons', 'Viande/poisson');


--
-- Data for Name: link_menu_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (1, NULL, 'M', 0, 1);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (1, NULL, NULL, 1, 1);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (1, '50cl', NULL, 2, 2);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (2, NULL, 'M', 0, 2);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (2, NULL, NULL, 1, 2);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (2, '1l', NULL, 2, 1);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (3, NULL, 'M', 0, 3);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (3, NULL, NULL, 1, 2);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (3, '1l', NULL, 2, 1);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (4, NULL, NULL, 1, 3);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (5, NULL, 'S', 0, 2);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (5, '1l', NULL, 2, 1);
INSERT INTO public.link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) VALUES (6, NULL, 'XL', 0, 3);


--
-- Data for Name: menu_quant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menu_size; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menus (id, price, menu_name, image, description) VALUES (1, 2090, 'Extra menu', 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/extra-menu-heineken.b1c0f264d346aae1ccd68beb5b260e64.1.jpg', '1 entrée, 1 pizza Medium, 2 boissons individuelles (50cl ou moins)');
INSERT INTO public.menus (id, price, menu_name, image, description) VALUES (2, 3390, 'Mega menu', 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/mega-menu-heineken.4cc2ca9114bab16a56034d3db164b90f.1.jpg', '2 entrées, 2 pizzas Medium, 1 boisson à partager (1L ou plus)');
INSERT INTO public.menus (id, price, menu_name, image, description) VALUES (3, 4190, 'Giga menu', 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/giga-menu-heineken.62e3d2c55e8b6eb67974e715da5ba7b9.1.jpg', '2 Entrées, 3 Pizzas Medium, 1 boisson à partager (1L ou plus)');
INSERT INTO public.menus (id, price, menu_name, image, description) VALUES (4, 3900, '3 Pizzas XL', 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/local-3pxl-39e-del.6d41734f162fae4b9753b39848fbf68e.1.jpg', '3 Pizzas Xlarge Pâtes Pan ou Classic.');
INSERT INTO public.menus (id, price, menu_name, image, description) VALUES (5, 1600, 'Multi mix', 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/multi-mix.316747c0f3b4846c443263b77a0d4995.1.jpg', '10 Chicken Wings Originales + 5 Chicken Tasty + 10 Chicken Croqs + 4 Sauces au choix');
INSERT INTO public.menus (id, price, menu_name, image, description) VALUES (6, 2190, 'Menu duo', 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/bogo-50-off.d1fd8c0b42f64351c700d62174b04e8a.1.jpg', '2 pizzas Small et 1 boisson 1l à partager.');


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" (id, status, date, address_id) VALUES (70, 'PENDING', '2022-05-24 12:58:07.56923+02', 3);
INSERT INTO public."order" (id, status, date, address_id) VALUES (71, 'PENDING', '2022-05-24 12:58:48.717817+02', 3);


--
-- Data for Name: pizza_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pizza_size (size, coefficient) VALUES ('S', 0.9);
INSERT INTO public.pizza_size (size, coefficient) VALUES ('M', 1);
INSERT INTO public.pizza_size (size, coefficient) VALUES ('XL', 1.1);


--
-- Data for Name: prod_quant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size, type) VALUES (70, 26, 1, 'null', 'null', '33cl', 'drink');
INSERT INTO public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size, type) VALUES (70, 3, 1, 'M', 'null', 'null', 'pizza');
INSERT INTO public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size, type) VALUES (70, 30, 1, 'null', 'Algérienne', 'null', 'starter');
INSERT INTO public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size, type) VALUES (71, 26, 1, 'null', 'null', '33cl', 'drink');
INSERT INTO public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size, type) VALUES (71, 3, 1, 'M', 'null', 'null', 'pizza');
INSERT INTO public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size, type) VALUES (71, 30, 1, 'null', 'Algérienne', 'null', 'starter');


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (1, '4 Fromages', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/fromage.e70b59d7921e1113513460fbea3046df.1.jpg', 0, false, true, false, 'Crème fraîche légère, mozzarella, fromage de chèvre, emmental et Fourme d''Ambert AOP');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (2, 'Nordique', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/nord.36477c6ab92657b8bc026c32220a4e23.1.jpg', 0, false, false, false, 'Crème fraîche légère, mozzarella et saumon fumé de Norvège');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (3, 'Végétarienne', 1650, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/vegetar.c80707922e21153554f7e54e607bee50.1.jpg', 0, false, true, false, 'Sauce tomate à l''origan, mozzarella, champignons frais, oignons rouges frais, poivrons verts frais, tomates fraîches et Olives noires');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (4, 'BPM', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/bpm.812855af9fb70567e766bcb2b2667bdb.1.jpg', 0, false, false, false, 'Sauce barbecue, mozzarella, emietté au boeuf, filet de poulet rôti et merguez');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (5, 'Hawaïenne Jambon', 1650, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/hawaienne.6cf6b87d02e3b45e3702023191b5158e.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, jambon et ananas');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (6, 'Orientale', 1650, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/orientale.aa0e75b013460d6599bc7cb9c53d5a16.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, merguez et champignons frais');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (7, 'Spicy Hot One', 1650, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/spicy-hot-one.5752e3b2035e831e7f98e0fe97fdbe09.1.jpg', 0, false, false, true, 'Sauce tomate à l''origan, mozzarella, emietté au boeuf, piments jalapeños, oignons rouges frais et tomates fraîches');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (8, 'Chicken Barbecue', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/chicken-bbq.3a33b97a501154997e8a3167eca3e8ed.1.jpg', 0, false, false, false, 'Sauce barbecue, mozzarella, filet de poulet rôti, oignons rouges frais, champignons frais et poivrons verts frais');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (9, 'Pepperoni Lovers', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/pepperoni.313df36c8b232421470453bbb60201dd.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella et saucisse pepperoni');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (10, 'Provençale', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/provencale.b2790760a7c41d37418000cdebaab0d9.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, thon, tomates fraîches, oignons rouges frais et olives noires');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (11, 'Campagnarde', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/campagnarde.6cbf9278a7e41ca8f40c723bbac2e826.1.jpg', 0, false, false, false, 'Crème fraîche légère, mozzarella, lardons, oignons rouges frais et champignons frais');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (12, 'Texane Barbecue', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/texane-bbq.fc5bbf2798477052fb3a288a09b0aba9.1.jpg', 0, false, false, false, 'Sauce barbecue, mozzarella, jambon, emietté au boeuf, lardons, champignons frais et oignons rouges frais.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (13, 'Margherita', 1250, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/margherita.3560275dd11211efe4c49755163a9e3c.1.jpg', 0, false, true, false, 'Sauce tomate à l''origan et mozzarella');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (14, 'Suprême', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/supreme.bb2b566dfabf81e950943a802db75f49.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, emietté au boeuf, saucisse pepperoni, champignons frais, oignons rouges frais et poivrons verts frais');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (15, 'Queen', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/queen.de552a669cd804a7732811af4ac060ba.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, jambon et champignons frais');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (16, 'Samouraï', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/samourai.e96b57f97e787a4cd2048629c20d6824.1.jpg', 0, false, false, true, 'Sauce tomate à l''origan, mozzarella, merguez, filet de poulet rôti, oignons rouges frais, Sauce Samouraï');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (17, 'Montagnarde', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/montagnarde.08fb304ab7943248500a62f78d039db7.1.jpg', 0, false, false, false, 'Crème fraîche légère, mozzarella, jambon cru, fromage à raclette et champignons frais');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (18, 'Kasbah', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/kasbah.c3aa509816d983a89fed7e99ea9f58af.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, émincé de poulet kebab, tomates fraîches, oignons rouges frais et sauce blanche kebab');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (19, 'Chicken Parmesan', 1850, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/chicken-parmesan.17f8071016f6e1304c49fd03f4285a0b.1.jpg', 0, false, false, false, 'Sauce tomate à l''origan, mozzarella, filet de poulet rôti, tomates fraîches, parmigiano reggiano AOP');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (20, 'Raclette', 1750, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/raclette.680807b3b3d730422cb06657c1011163.1.jpg', 0, false, false, false, 'Crème fraîche légère, mozzarella, pommes de terre, lardons et fromage à raclette');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (21, 'Chèvre miel', 1650, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/chevre-miel.8104a0acdb16d18dac2b8ad574aa92f2.1.jpg', 0, false, true, false, 'Crème fraîche légère, mozzarella, fromage de chèvre, miel');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (22, 'Heineken', 300, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/heineken-330ml.9be2b974951dad063123a0dd549fa11b.1.jpg', 2, false, true, false, 'Heineken');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (23, 'Breadsticks Extra Mozzarella', 650, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/mozarella-tear-and-share.fc1290bb363da1e7f2620d5350bc6a86.1.jpg', 1, false, true, false, 'Comme le Breadsticks Mozzarella, avec en plus de la Mozzarella gratinée par-dessus! Servis avec une sauce au choix.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (24, 'Pulco Citronnade', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/pulco-citronnade-33cl.ca53b0d9ba0310baa79dce4625c75030.1.jpg', 2, false, true, false, 'Pulco Citronnade');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (25, 'Breadsticks mozzarella', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/breadsticks-mozzarella.9acbb30828d7f6e2d862f3ee87685f25.1.jpg', 1, false, true, false, '8 Bâtonnets de pâte à pizza garnis de mozzarella. Servis avec une délicieuse sauce au choix.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (26, 'Coca-Cola Zero', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/coca-cola-zero.fc749983c923cf7da21057039863d41e.1.jpg', 2, false, true, false, 'Coca-Cola Zero');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (27, 'Coca-Cola Original', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/coca-cola-regular.b621843d0031af68eccf767fd667e9e5.1.jpg', 2, false, true, false, 'Coca-Cola Original');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (28, 'Orangina', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/orangina-regular.4ba0ed03af7fad9fb7207d249a3d8128.1.jpg', 2, false, true, false, 'Orangina');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (29, 'Perrier', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/perrier-33cl.19d186f7c0dc74202ba143da6d1fd451.1.jpg', 2, false, true, false, 'Perrier');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (30, '2 Pains à l''ail mozzarella', 300, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-mozzarella.0f833b45c65b2ca08a2e11856c938788.1.jpg', 1, false, true, false, '2 Tranches de pain à l''ail gratinées à la mozzarella.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (31, 'Vittel', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/vitel-500ml.86ce20fb76a7890e7629a8122e3dcbde.1.jpg', 2, false, true, false, 'Vittel');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (32, 'Sprite', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/sprite-330ml.91ea69e4c7a3c3e42ecdbf9b25a68fbb.1.jpg', 2, false, true, false, 'Sprite');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (33, 'Potatoes', 300, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/potatoes.2f6d160172507ec0fb8d391a863c203d.1.jpg', 1, false, true, false, 'Des Potatoes cuites au four. Servies avec une sauce au choix.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (34, 'Chicken Wings Epicées', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-wings-espicees.c61b12681491832f2bb805449f6e23cb.1.jpg', 1, false, false, true, 'Recette très épicée : 6 ailes de poulet marinées');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (35, 'San Pellegrino', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/san-pelligrano-regular-1000ml.5908347aabe03f2d3b7de3f557cf5699.1.jpg', 2, false, true, false, 'San Pellegrino');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (36, 'Capri-Sun Multivitamin', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/capri-sun-20cl.f2b97fa69cfdd1f9e51cce58c67aa033.1.jpg', 2, false, true, false, 'Capri-Sun Multivitamin');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (37, 'Oasis Tropical', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/oasis-tropical.afddada90d10f2224a5a909700b57d5c.1.jpg', 2, false, true, false, 'Oasis Tropical');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (38, 'Oasis Pomme Cassis Framboise', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/oasis-pomme-cassis-2000ml.d2f61fd03a623d79b70b0e685a70fe10.1.jpg', 2, false, true, false, 'Oasis Pomme Cassis Framboise');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (39, 'Schweppes Agrum''', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/schweppes-agrum-330ml.7fb3a70b8624ccc91ce34b2d7562bc48.1.jpg', 2, false, true, false, 'Schweppes Agrum''');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (40, 'Chicken Tasty', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-tasty.e84565c9abe296ce73c2643c445662a5.1.jpg', 1, false, false, false, '4 Aiguillettes de poulet cuites au four');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (41, 'Salade Méditerranéenne', 700, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/salade-mediterraneenne.3b6fc13c1ce0858aed50100f83e23c1c.1.jpg', 1, false, true, false, 'Salade verte, tomates fraîches, champignons frais, Parmigiano Reggiano AOP, olives noires, tranche de pain à l’ail et vinaigrette balsamique');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (42, '2 Pains à l''ail Mozzarella et Tomates Fraîches', 300, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-tomato.7cb5a8cc6fd4b08e2b7e3922e97f4f35.1.jpg', 1, false, true, false, '2 Tranches de pain à l''ail gratinées à la mozzarella avec des dés de tomates fraîches');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (43, '4 Pains à l''ail Mozzarella', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-mozzarella-4.4225cf0f3d12f9dedd8f205314ff73a0.1.jpg', 1, false, true, false, '4 Tranches de pain à l''ail gratinées à la mozzarella.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (44, 'Coca-Cola Cherry', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/coca-cola-cherry-330ml.9a1b3b8f19ea13a6d54c4a7df7f3782f.1.jpg', 2, false, true, false, 'Coca-Cola Cherry');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (45, 'Salade Caesar', 700, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/salade-caesar.3774efa52bbe1f08d63ae78a0f672b11.1.jpg', 1, false, false, false, 'Salade verte, tomates fraîches, filet de poulet rôti et mariné, Parmigiano Reggiano AOP, tranche de pain à l’ail et une sauce Caesar');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (46, '4 Pains à l''ail Mozzarella et Tomates Fraîches', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-tomato-4.f545932d207ac6cbe09aa47259a537f1.1.jpg', 1, false, true, false, '4 Tranches de pain à l''ail gratinées à la mozzarella avec des dés de tomates fraîches');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (47, 'Fuze Tea', 200, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/fuze-tea-330ml.df98e66eab25554f8a3520839a0b5509.1.jpg', 2, false, true, false, 'Fuze Tea');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (48, 'Rosé Côtes de Provence AOP', 600, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/rose-cotes-de-provence-750ml.a11177bed1f36f4153f4c87292499672.1.jpg', 2, false, true, false, 'Rosé Côtes de Provence AOP');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (49, 'Chicken Wings', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-wings-originales.adc71ecdbff262d91f50fcdcd093f7c0.1.jpg', 1, false, false, false, 'Recette originale : 6 ailes de poulet marinées.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (50, 'Chicken Croqs', 500, 'https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-croqs.f42cf4a6b9352ee0df213b17028a51dc.1.jpg', 1, false, false, false, '8 Bouchées Panées au Poulet. Servis avec une délicieuse sauce au choix.');
INSERT INTO public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) VALUES (63, 'qdqdqd', 1910, NULL, 0, true, false, false, 'XL');


--
-- Data for Name: sauce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sauce (name) VALUES ('Barbecue');
INSERT INTO public.sauce (name) VALUES ('Curry');
INSERT INTO public.sauce (name) VALUES ('Ketchup');
INSERT INTO public.sauce (name) VALUES ('Blanche');
INSERT INTO public.sauce (name) VALUES ('Samouraï');
INSERT INTO public.sauce (name) VALUES ('Algérienne');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, email, lastname, password, phone_num, is_deliverer) VALUES (7, 'SOMON', 'bastian.somon@gmail.com', 'BASTIAN', '$2a$08$G4HHyZpCEsJbbYxrJZj.EeZsPgWS6uAxJj4Pca1T8gMwPK.R8StYq', '0601055110', false);
INSERT INTO public.users (id, name, email, lastname, password, phone_num, is_deliverer) VALUES (8, 'Livreur', 'livreur@livreur.com', 'Livreur', '$2a$08$w/0wYijEShUYH8QsOCrp/eKuRj6ykQo.0XC6YWorAjKAQ/VipzNWW', '0606060606', true);


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 3, true);


--
-- Name: deliverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliverer_id_seq', 1, false);


--
-- Name: ingredients_ingr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_ingr_id_seq', 31, true);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 6, true);


--
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 71, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 63, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: address address_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);


--
-- Name: deliverer deliverer_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer
    ADD CONSTRAINT deliverer_pk PRIMARY KEY (id);


--
-- Name: drink_size drink_size_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drink_size
    ADD CONSTRAINT drink_size_pk PRIMARY KEY (size);


--
-- Name: ingredients ingredients_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (ingr_id);


--
-- Name: menu_size menu_size_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_size
    ADD CONSTRAINT menu_size_pk PRIMARY KEY (menu_id);


--
-- Name: menus menus_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pk PRIMARY KEY (id);


--
-- Name: order order_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);


--
-- Name: pizza_size pizza_size_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_size
    ADD CONSTRAINT pizza_size_pk PRIMARY KEY (size);


--
-- Name: product product_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pk PRIMARY KEY (id);


--
-- Name: sauce sauce_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sauce
    ADD CONSTRAINT sauce_pk PRIMARY KEY (name);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: drink_size_size_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX drink_size_size_uindex ON public.drink_size USING btree (size);


--
-- Name: pizza_size_size_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pizza_size_size_uindex ON public.pizza_size USING btree (size);


--
-- Name: product_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX product_id_uindex ON public.product USING btree (id);


--
-- Name: sauce_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sauce_name_uindex ON public.sauce USING btree (name);


--
-- Name: order address_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- Name: link_menu_product drink_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_menu_product
    ADD CONSTRAINT drink_size FOREIGN KEY (drink_size) REFERENCES public.drink_size(size);


--
-- Name: ingr_quant ingr_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingr_quant
    ADD CONSTRAINT ingr_id FOREIGN KEY (ingr_id) REFERENCES public.ingredients(ingr_id);


--
-- Name: menu_size menu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_size
    ADD CONSTRAINT menu_id FOREIGN KEY (menu_id) REFERENCES public.menus(id);


--
-- Name: link_menu_product menu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_menu_product
    ADD CONSTRAINT menu_id FOREIGN KEY (menu_id) REFERENCES public.menus(id);


--
-- Name: menu_quant menu_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_quant
    ADD CONSTRAINT menu_id FOREIGN KEY (menu_id) REFERENCES public.menus(id);


--
-- Name: deliverer order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: menu_quant order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_quant
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: prod_quant order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE;


--
-- Name: ingr_quant pizza_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingr_quant
    ADD CONSTRAINT pizza_id FOREIGN KEY (pizza_id) REFERENCES public.product(id) ON DELETE CASCADE;


--
-- Name: link_menu_product pizza_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_menu_product
    ADD CONSTRAINT pizza_size FOREIGN KEY (pizza_size) REFERENCES public.pizza_size(size);


--
-- Name: prod_quant product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: address user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

