DROP DATABASE IF EXISTS pizzeria_delapapa;
CREATE DATABASE pizzeria_delapapa ENCODING = 'UTF-8';

\connect pizzeria_delapapa;

--
-- Start of DDL
--

CREATE TABLE address(
    id integer NOT NULL,
    name_adr text NOT NULL,
    opt_info text NOT NULL,
    user_id integer
);

CREATE TABLE deliverer (
   id integer NOT NULL,
   deliverer_name text NOT NULL,
   deliverer_lastname text NOT NULL,
   order_id integer
);

CREATE TABLE drink_size (
    size text NOT NULL,
    coefficient double precision
);

CREATE TABLE ingr_quant (
    ingr_id integer,
    pizza_id integer,
    quant integer
);

CREATE TABLE ingredients (
    ingr_id integer NOT NULL,
    ingr_name text NOT NULL
);

CREATE TABLE link_menu_product (
   menu_id integer,
   drink_size text,
   pizza_size text,
   product_type integer,
   quant integer
);

CREATE TABLE menu_quant (
    order_id integer,
    menu_id integer,
    quant integer
);

CREATE TABLE menu_size (
    menu_id integer NOT NULL,
    size text NOT NULL
);

CREATE TABLE menus (
   id integer NOT NULL,
   price integer NOT NULL,
   menu_name text NOT NULL,
   image text,
   description text
);

CREATE TABLE "order" (
    id integer NOT NULL,
    status text NOT NULL,
    date timestamp with time zone NOT NULL,
    address_id integer
);

CREATE TABLE pizza_size (
    size text NOT NULL,
    coefficient double precision
);

CREATE TABLE prod_quant (
    order_id integer,
    product_id integer,
    quant integer,
    pizza_size text,
    sauce_name text,
    drink_size text
);

CREATE TABLE product (
     id integer NOT NULL,
     name text,
     price integer,
     image text,
     type integer NOT NULL,
     is_custom boolean DEFAULT false,
     is_veggie boolean DEFAULT false,
     is_spicy boolean DEFAULT false,
     description text
);

CREATE TABLE sauce (
    name text NOT NULL
);

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    lastname text NOT NULL,
    password text NOT NULL,
    phone_num text NOT NULL
);

--
-- End of DDL
--



--
-- Sequences :
--

CREATE SEQUENCE address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE deliverer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE ingredients_ingr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE menus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ONLY address ALTER COLUMN id SET DEFAULT nextval('address_id_seq'::regclass);

ALTER TABLE ONLY deliverer ALTER COLUMN id SET DEFAULT nextval('deliverer_id_seq'::regclass);

ALTER TABLE ONLY ingredients ALTER COLUMN ingr_id SET DEFAULT nextval('ingredients_ingr_id_seq'::regclass);

ALTER TABLE ONLY menus ALTER COLUMN id SET DEFAULT nextval('menus_id_seq'::regclass);

ALTER TABLE ONLY "order" ALTER COLUMN id SET DEFAULT nextval('order_id_seq'::regclass);

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);

--
-- End of sequences
--


--
-- Start of INSERTs
--

COPY drink_size (size, coefficient) FROM stdin;
25cl	0.9
33cl	1
50cl	1.2
1l	1.5
\.

COPY ingr_quant (ingr_id, pizza_id, quant) FROM stdin;
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

COPY ingredients (ingr_id, ingr_name) FROM stdin;
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

COPY link_menu_product (menu_id, drink_size, pizza_size, product_type, quant) FROM stdin;
2	\N	M	0	1
2	\N	\N	1	1
2	50cl	\N	2	2
3	\N	M	0	2
3	\N	\N	1	2
3	1l	\N	2	1
4	\N	M	0	3
4	\N	\N	1	2
4	1l	\N	2	1
7	\N	XL	0	3
5	\N	\N	1	3
6	\N	S	0	2
6	1l	\N	2	1
\.

COPY menus (id, price, menu_name, image, description) FROM stdin;
2	2090	Extra menu	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/extra-menu-heineken.b1c0f264d346aae1ccd68beb5b260e64.1.jpg	1 entrée, 1 pizza Medium, 2 boissons individuelles (50cl ou moins)
3	3390	Mega menu	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/mega-menu-heineken.4cc2ca9114bab16a56034d3db164b90f.1.jpg	2 entrées, 2 pizzas Medium, 1 boisson à partager (1L ou plus)
4	4190	Giga menu	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/giga-menu-heineken.62e3d2c55e8b6eb67974e715da5ba7b9.1.jpg	2 Entrées, 3 Pizzas Medium, 1 boisson à partager (1L ou plus)
7	3900	3 Pizzas XL	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/local-3pxl-39e-del.6d41734f162fae4b9753b39848fbf68e.1.jpg	3 Pizzas Xlarge Pâtes Pan ou Classic.
5	1600	Multi mix	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/multi-mix.316747c0f3b4846c443263b77a0d4995.1.jpg	10 Chicken Wings Originales + 5 Chicken Tasty + 10 Chicken Croqs + 4 Sauces au choix
6	2190	Menu duo	https://api.pizzahut.io/v1/content/fr-fr/fr-1/images/deal/bogo-50-off.d1fd8c0b42f64351c700d62174b04e8a.1.jpg	2 pizzas Small et 1 boisson 1l à partager.
\.

COPY pizza_size (size, coefficient) FROM stdin;
S	0.9
M	1
XL	1.1
\.

COPY product (id, name, price, image, type, is_custom, is_veggie, is_spicy, description) FROM stdin;
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

COPY sauce (name) FROM stdin;
Barbecue
Curry
Ketchup
Blanche
Samouraï
Algérienne
\.

--
-- End of INSERTs
--


--
-- Primary/foreign keys
--

ALTER TABLE ONLY address
    ADD CONSTRAINT address_pk PRIMARY KEY (id);

ALTER TABLE ONLY deliverer
    ADD CONSTRAINT deliverer_pk PRIMARY KEY (id);

ALTER TABLE ONLY drink_size
    ADD CONSTRAINT drink_size_pk PRIMARY KEY (size);

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pk PRIMARY KEY (ingr_id);

ALTER TABLE ONLY menu_size
    ADD CONSTRAINT menu_size_pk PRIMARY KEY (menu_id);

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pk PRIMARY KEY (id);

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pk PRIMARY KEY (id);

ALTER TABLE ONLY pizza_size
    ADD CONSTRAINT pizza_size_pk PRIMARY KEY (size);

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pk PRIMARY KEY (id);

ALTER TABLE ONLY sauce
    ADD CONSTRAINT sauce_pk PRIMARY KEY (name);

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);

CREATE UNIQUE INDEX drink_size_size_uindex ON drink_size USING btree (size);

CREATE UNIQUE INDEX pizza_size_size_uindex ON pizza_size USING btree (size);

CREATE UNIQUE INDEX product_id_uindex ON product USING btree (id);

CREATE UNIQUE INDEX sauce_name_uindex ON sauce USING btree (name);

ALTER TABLE ONLY "order"
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES address(id);

ALTER TABLE ONLY prod_quant
    ADD CONSTRAINT drink_size FOREIGN KEY (drink_size) REFERENCES drink_size(size);

ALTER TABLE ONLY link_menu_product
    ADD CONSTRAINT drink_size FOREIGN KEY (drink_size) REFERENCES drink_size(size);

ALTER TABLE ONLY ingr_quant
    ADD CONSTRAINT ingr_id FOREIGN KEY (ingr_id) REFERENCES ingredients(ingr_id);

ALTER TABLE ONLY menu_size
    ADD CONSTRAINT menu_id FOREIGN KEY (menu_id) REFERENCES menus(id);

ALTER TABLE ONLY link_menu_product
    ADD CONSTRAINT menu_id FOREIGN KEY (menu_id) REFERENCES menus(id);

ALTER TABLE ONLY menu_quant
    ADD CONSTRAINT menu_id FOREIGN KEY (menu_id) REFERENCES menus(id);

ALTER TABLE ONLY deliverer
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES "order"(id);

ALTER TABLE ONLY prod_quant
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES "order"(id);

ALTER TABLE ONLY menu_quant
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES "order"(id);

ALTER TABLE ONLY ingr_quant
    ADD CONSTRAINT pizza_id FOREIGN KEY (pizza_id) REFERENCES product(id);

ALTER TABLE ONLY prod_quant
    ADD CONSTRAINT pizza_size FOREIGN KEY (pizza_size) REFERENCES pizza_size(size);

ALTER TABLE ONLY link_menu_product
    ADD CONSTRAINT pizza_size FOREIGN KEY (pizza_size) REFERENCES pizza_size(size);

ALTER TABLE ONLY prod_quant
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES product(id);

ALTER TABLE ONLY prod_quant
    ADD CONSTRAINT sauce_name FOREIGN KEY (sauce_name) REFERENCES sauce(name);

ALTER TABLE ONLY address
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users(id);

--
-- End of primary/foreign keys
--
