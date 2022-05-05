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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    name_adr character varying(40) NOT NULL,
    opt_info character varying(40) NOT NULL,
    user_id integer
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: deliverer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverer (
    id integer NOT NULL,
    deliverer_name character varying(20) NOT NULL,
    deliverer_lastname character varying(20) NOT NULL,
    order_id integer
);


ALTER TABLE public.deliverer OWNER TO postgres;

--
-- Name: drink_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drink_size (
    size character varying(10) NOT NULL
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
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    ingr_id integer NOT NULL,
    ingr_name character varying NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

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
-- Name: ingredients_ingr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_ingr_id_seq OWNED BY public.ingredients.ingr_id;


--
-- Name: link_menu_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link_menu_product (
    menu_id integer,
    product_id integer
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
    size character varying(10) NOT NULL
);


ALTER TABLE public.menu_size OWNER TO postgres;

--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    id integer NOT NULL,
    price integer NOT NULL,
    menu_name character varying(40) NOT NULL
);


ALTER TABLE public.menus OWNER TO postgres;

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
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_id_seq OWNED BY public.menus.id;


--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    status character varying(10) NOT NULL,
    date character varying(20) NOT NULL,
    address_id integer
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: pizza_size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_size (
    size character varying NOT NULL
);


ALTER TABLE public.pizza_size OWNER TO postgres;

--
-- Name: prod_quant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prod_quant (
    order_id integer,
    product_id integer,
    quant integer,
    pizza_size character varying,
    sauce_name character varying,
    drink_size character varying
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
    name character varying,
    price integer,
    image character varying,
    type integer NOT NULL,
    is_custom boolean DEFAULT false,
    is_veggie boolean DEFAULT false,
    is_spicy boolean DEFAULT false,
    description character varying
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: sauce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sauce (
    name character varying NOT NULL
);


ALTER TABLE public.sauce OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(80) NOT NULL,
    lastname character varying(40) NOT NULL,
    password character varying(40) NOT NULL,
    phone_num character varying(10) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: ingredients ingr_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN ingr_id SET DEFAULT nextval('public.ingredients_ingr_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN id SET DEFAULT nextval('public.menus_id_seq'::regclass);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, name_adr, opt_info, user_id) FROM stdin;
\.


--
-- Data for Name: deliverer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deliverer (id, deliverer_name, deliverer_lastname, order_id) FROM stdin;
\.


--
-- Data for Name: drink_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drink_size (size) FROM stdin;
\.


--
-- Data for Name: ingr_quant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingr_quant (ingr_id, pizza_id, quant) FROM stdin;
2	1	1
3	1	1
4	1	1
5	1	1
9	1	1
6	2	1
3	2	1
7	2	1
8	2	1
10	2	1
1	3	1
3	3	1
11	3	1
1	4	1
3	4	1
12	4	1
13	4	1
2	5	1
3	5	1
14	5	1
15	5	1
13	5	1
1	6	1
3	6	1
7	6	1
11	6	1
13	6	1
16	6	1
17	6	1
2	7	1
3	7	1
18	7	1
19	7	1
15	7	1
2	8	1
3	8	1
4	8	1
20	8	1
6	9	1
3	9	1
8	9	1
16	9	1
17	9	1
13	9	1
1	10	1
3	10	1
10	10	1
13	10	1
1	11	1
3	11	1
2	12	1
3	12	1
21	12	1
6	13	1
3	13	1
12	13	1
13	13	1
7	13	1
19	13	1
16	13	1
1	14	1
3	14	1
13	14	1
16	14	1
17	14	1
22	14	1
27	14	1
2	15	1
3	15	1
19	15	1
16	15	1
13	15	1
1	16	1
3	16	1
31	16	1
23	16	1
27	16	1
24	16	1
16	16	1
1	17	1
3	17	1
12	17	1
25	17	1
1	18	1
3	18	1
7	18	1
26	18	1
16	18	1
27	18	1
1	19	1
3	19	1
10	19	1
8	19	1
16	19	1
28	19	1
1	20	1
3	20	1
8	20	1
27	20	1
29	20	1
1	21	1
3	21	1
30	21	1
27	21	1
16	21	1
22	21	1
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (ingr_id, ingr_name) FROM stdin;
1	Sauce tomate à l'origan
2	Crème fraîche légère
3	Mozzarella
4	Fromage de chèvre
5	Emmental
6	Sauce Barbecue
7	Emietté au boeuf
8	Filet de poulet rôti
9	Fourme d'Ambert AOP
10	Merguez
11	Saucisse pepperoni
12	Jambon
13	Champignon frais
14	Jambon cru
15	Fromage à raclette
16	Oignons rouges frais
17	Poivrons verts frais
18	Pomme de terre
19	Lardons
20	Miel
21	Saumon fumé de Norvège
22	Olives noires
23	Kébab
24	Sauce blanche kébab
25	Ananas
26	Piments jalapeños
27	Tomates fraîches
28	Sauce samouraï
29	Parmigiano reggiano AOP
30	Thon
31	Emincés de poulet
\.


--
-- Data for Name: link_menu_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.link_menu_product (menu_id, product_id) FROM stdin;
\.


--
-- Data for Name: menu_quant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_quant (order_id, menu_id, quant) FROM stdin;
\.


--
-- Data for Name: menu_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_size (menu_id, size) FROM stdin;
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (id, price, menu_name) FROM stdin;
2	2090	Extra menu
3	3390	Mega menu
4	4190	Giga menu
5	1600	Multi mix
6	2190	Menu duo
7	3900	3 Pizzas XL
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, status, date, address_id) FROM stdin;
\.


--
-- Data for Name: pizza_size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza_size (size) FROM stdin;
\.


--
-- Data for Name: prod_quant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prod_quant (order_id, product_id, quant, pizza_size, sauce_name, drink_size) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) FROM stdin;
1	4 Fromages	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/fromage.e70b59d7921e1113513460fbea3046df.1.jpg	0	f	t	f	Crème fraîche légère, mozzarella, fromage de chèvre, emmental et Fourme d'Ambert AOP
12	Nordique	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/nord.36477c6ab92657b8bc026c32220a4e23.1.jpg	0	f	f	f	Crème fraîche légère, mozzarella et saumon fumé de Norvège
14	Végétarienne	1650	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/vegetar.c80707922e21153554f7e54e607bee50.1.jpg	0	f	t	f	Sauce tomate à l'origan, mozzarella, champignons frais, oignons rouges frais, poivrons verts frais, tomates fraîches et Olives noires
2	BPM	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/bpm.812855af9fb70567e766bcb2b2667bdb.1.jpg	0	f	f	f	Sauce barbecue, mozzarella, emietté au boeuf, filet de poulet rôti et merguez
49	Heineken	300	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/heineken-330ml.9be2b974951dad063123a0dd549fa11b.1.jpg	2	f	t	f	Heineken
22	Breadsticks Extra Mozzarella	650	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/mozarella-tear-and-share.fc1290bb363da1e7f2620d5350bc6a86.1.jpg	1	f	t	f	Comme le Breadsticks Mozzarella, avec en plus de la Mozzarella gratinée par-dessus! Servis avec une sauce au choix.
46	Pulco Citronnade	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/pulco-citronnade-33cl.ca53b0d9ba0310baa79dce4625c75030.1.jpg	2	f	t	f	Pulco Citronnade
23	Breadsticks mozzarella	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/breadsticks-mozzarella.9acbb30828d7f6e2d862f3ee87685f25.1.jpg	1	f	t	f	8 Bâtonnets de pâte à pizza garnis de mozzarella. Servis avec une délicieuse sauce au choix.
17	Hawaïenne Jambon	1650	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/hawaienne.6cf6b87d02e3b45e3702023191b5158e.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, jambon et ananas
36	Coca-Cola Zero	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/coca-cola-zero.fc749983c923cf7da21057039863d41e.1.jpg	2	f	t	f	Coca-Cola Zero
10	Orientale	1650	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/orientale.aa0e75b013460d6599bc7cb9c53d5a16.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, merguez et champignons frais
35	Coca-Cola Original	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/coca-cola-regular.b621843d0031af68eccf767fd667e9e5.1.jpg	2	f	t	f	Coca-Cola Original
39	Orangina	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/orangina-regular.4ba0ed03af7fad9fb7207d249a3d8128.1.jpg	2	f	t	f	Orangina
18	Spicy Hot One	1650	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/spicy-hot-one.5752e3b2035e831e7f98e0fe97fdbe09.1.jpg	0	f	f	t	Sauce tomate à l'origan, mozzarella, emietté au boeuf, piments jalapeños, oignons rouges frais et tomates fraîches
48	Perrier	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/perrier-33cl.19d186f7c0dc74202ba143da6d1fd451.1.jpg	2	f	t	f	Perrier
9	Chicken Barbecue	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/chicken-bbq.3a33b97a501154997e8a3167eca3e8ed.1.jpg	0	f	f	f	Sauce barbecue, mozzarella, filet de poulet rôti, oignons rouges frais, champignons frais et poivrons verts frais
28	2 Pains à l'ail mozzarella	300	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-mozzarella.0f833b45c65b2ca08a2e11856c938788.1.jpg	1	f	t	f	2 Tranches de pain à l'ail gratinées à la mozzarella.
3	Pepperoni Lovers	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/pepperoni.313df36c8b232421470453bbb60201dd.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella et saucisse pepperoni
44	Vittel	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/vitel-500ml.86ce20fb76a7890e7629a8122e3dcbde.1.jpg	2	f	t	f	Vittel
42	Sprite	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/sprite-330ml.91ea69e4c7a3c3e42ecdbf9b25a68fbb.1.jpg	2	f	t	f	Sprite
31	Potatoes	300	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/potatoes.2f6d160172507ec0fb8d391a863c203d.1.jpg	1	f	t	f	Des Potatoes cuites au four. Servies avec une sauce au choix.
21	Provençale	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/provencale.b2790760a7c41d37418000cdebaab0d9.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, thon, tomates fraîches, oignons rouges frais et olives noires
24	Chicken Wings Epicées	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-wings-espicees.c61b12681491832f2bb805449f6e23cb.1.jpg	1	f	f	t	Recette très épicée : 6 ailes de poulet marinées
43	San Pellegrino	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/san-pelligrano-regular-1000ml.5908347aabe03f2d3b7de3f557cf5699.1.jpg	2	f	t	f	San Pellegrino
15	Campagnarde	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/campagnarde.6cbf9278a7e41ca8f40c723bbac2e826.1.jpg	0	f	f	f	Crème fraîche légère, mozzarella, lardons, oignons rouges frais et champignons frais
47	Capri-Sun Multivitamin	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/capri-sun-20cl.f2b97fa69cfdd1f9e51cce58c67aa033.1.jpg	2	f	t	f	Capri-Sun Multivitamin
13	Texane Barbecue	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/texane-bbq.fc5bbf2798477052fb3a288a09b0aba9.1.jpg	0	f	f	f	Sauce barbecue, mozzarella, jambon, emietté au boeuf, lardons, champignons frais et oignons rouges frais.
38	Oasis Tropical	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/oasis-tropical.afddada90d10f2224a5a909700b57d5c.1.jpg	2	f	t	f	Oasis Tropical
41	Oasis Pomme Cassis Framboise	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/oasis-pomme-cassis-2000ml.d2f61fd03a623d79b70b0e685a70fe10.1.jpg	2	f	t	f	Oasis Pomme Cassis Framboise
45	Schweppes Agrum'	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/schweppes-agrum-330ml.7fb3a70b8624ccc91ce34b2d7562bc48.1.jpg	2	f	t	f	Schweppes Agrum'
11	Margherita	1250	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/margherita.3560275dd11211efe4c49755163a9e3c.1.jpg	0	f	t	f	Sauce tomate à l'origan et mozzarella
30	Chicken Tasty	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-tasty.e84565c9abe296ce73c2643c445662a5.1.jpg	1	f	f	f	4 Aiguillettes de poulet cuites au four
34	Salade Méditerranéenne	700	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/salade-mediterraneenne.3b6fc13c1ce0858aed50100f83e23c1c.1.jpg	1	f	t	f	Salade verte, tomates fraîches, champignons frais, Parmigiano Reggiano AOP, olives noires, tranche de pain à l’ail et vinaigrette balsamique
6	Suprême	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/supreme.bb2b566dfabf81e950943a802db75f49.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, emietté au boeuf, saucisse pepperoni, champignons frais, oignons rouges frais et poivrons verts frais
29	2 Pains à l'ail Mozzarella et Tomates Fraîches	300	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-tomato.7cb5a8cc6fd4b08e2b7e3922e97f4f35.1.jpg	1	f	t	f	2 Tranches de pain à l'ail gratinées à la mozzarella avec des dés de tomates fraîches
4	Queen	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/queen.de552a669cd804a7732811af4ac060ba.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, jambon et champignons frais
20	Chicken Parmesan	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/chicken-parmesan.17f8071016f6e1304c49fd03f4285a0b.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, filet de poulet rôti, tomates fraîches, parmigiano reggiano AOP
26	4 Pains à l'ail Mozzarella	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-mozzarella-4.4225cf0f3d12f9dedd8f205314ff73a0.1.jpg	1	f	t	f	4 Tranches de pain à l'ail gratinées à la mozzarella.
37	Coca-Cola Cherry	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/coca-cola-cherry-330ml.9a1b3b8f19ea13a6d54c4a7df7f3782f.1.jpg	2	f	t	f	Coca-Cola Cherry
5	Montagnarde	1850	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/montagnarde.08fb304ab7943248500a62f78d039db7.1.jpg	0	f	f	f	Crème fraîche légère, mozzarella, jambon cru, fromage à raclette et champignons frais
7	Raclette	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/raclette.680807b3b3d730422cb06657c1011163.1.jpg	0	f	f	f	Crème fraîche légère, mozzarella, pommes de terre, lardons et fromage à raclette
33	Salade Caesar	700	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/salade-caesar.3774efa52bbe1f08d63ae78a0f672b11.1.jpg	1	f	f	f	Salade verte, tomates fraîches, filet de poulet rôti et mariné, Parmigiano Reggiano AOP, tranche de pain à l’ail et une sauce Caesar
19	Samouraï	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/samourai.e96b57f97e787a4cd2048629c20d6824.1.jpg	0	f	f	t	Sauce tomate à l'origan, mozzarella, merguez, filet de poulet rôti, oignons rouges frais, Sauce Samouraï
27	4 Pains à l'ail Mozzarella et Tomates Fraîches	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/bruschetta-tomato-4.f545932d207ac6cbe09aa47259a537f1.1.jpg	1	f	t	f	4 Tranches de pain à l'ail gratinées à la mozzarella avec des dés de tomates fraîches
40	Fuze Tea	200	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/fuze-tea-330ml.df98e66eab25554f8a3520839a0b5509.1.jpg	2	f	t	f	Fuze Tea
16	Kasbah	1750	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/kasbah.c3aa509816d983a89fed7e99ea9f58af.1.jpg	0	f	f	f	Sauce tomate à l'origan, mozzarella, émincé de poulet kebab, tomates fraîches, oignons rouges frais et sauce blanche kebab
8	Chèvre miel	1650	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/pizza/chevre-miel.8104a0acdb16d18dac2b8ad574aa92f2.1.jpg	0	f	t	f	Crème fraîche légère, mozzarella, fromage de chèvre, miel
50	Rosé Côtes de Provence AOP	600	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/drink/rose-cotes-de-provence-750ml.a11177bed1f36f4153f4c87292499672.1.jpg	2	f	t	f	Rosé Côtes de Provence AOP
25	Chicken Wings	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-wings-originales.adc71ecdbff262d91f50fcdcd093f7c0.1.jpg	1	f	f	f	Recette originale : 6 ailes de poulet marinées.
32	Chicken Croqs	500	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/side/chicken-croqs.f42cf4a6b9352ee0df213b17028a51dc.1.jpg	1	f	f	f	8 Bouchées Panées au Poulet. Servis avec une délicieuse sauce au choix.
\.


--
-- Data for Name: sauce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sauce (name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, lastname, password, phone_num) FROM stdin;
\.


--
-- Name: ingredients_ingr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_ingr_id_seq', 1, false);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_id_seq', 7, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 50, true);


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
-- Name: prod_quant drink_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
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
-- Name: prod_quant order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: menu_quant order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_quant
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."order"(id);


--
-- Name: ingr_quant pizza_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingr_quant
    ADD CONSTRAINT pizza_id FOREIGN KEY (pizza_id) REFERENCES public.product(id);


--
-- Name: prod_quant pizza_size; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
    ADD CONSTRAINT pizza_size FOREIGN KEY (pizza_size) REFERENCES public.pizza_size(size);


--
-- Name: prod_quant product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: link_menu_product product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link_menu_product
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: prod_quant sauce_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prod_quant
    ADD CONSTRAINT sauce_name FOREIGN KEY (sauce_name) REFERENCES public.sauce(name);


--
-- Name: address user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

