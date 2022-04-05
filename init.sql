DROP DATABASE IF EXISTS pizzeria_delapapa;
CREATE DATABASE pizzeria_delapapa;

\connect pizzeria_delapapa;

CREATE TABLE address(
    id integer NOT NULL,
    name_adr character varying(40) NOT NULL,
    opt_info character varying(40) NOT NULL,
    user_id integer
);

CREATE TABLE deliverer (
    id integer NOT NULL,
    deliverer_name character varying(20) NOT NULL,
    deliverer_lastname character varying(20) NOT NULL,
    order_id integer
);

CREATE TABLE drink_size (
    size character varying(10) NOT NULL
);

CREATE TABLE ingr_quant (
    ingr_id integer,
    pizza_id integer,
    quant integer
);

CREATE TABLE ingredients (
    ingr_id integer NOT NULL,
    ingr_name character varying(20) NOT NULL
);

CREATE TABLE link_menu_product (
    menu_id integer,
    product_id integer
);

CREATE TABLE menu_quant (
    order_id integer,
    menu_id integer,
    quant integer
);

CREATE TABLE menu_size (
    menu_id integer NOT NULL,
    size character varying(10) NOT NULL
);

CREATE TABLE menus (
    id integer NOT NULL,
    price integer NOT NULL,
    menu_name character varying(40) NOT NULL
);

CREATE TABLE "order" (
    id integer NOT NULL,
    status character varying(10) NOT NULL,
    date character varying(20) NOT NULL,
    address_id integer
);

CREATE TABLE pizza_size (
    size character varying NOT NULL
);

CREATE TABLE prod_quant (
    order_id integer,
    product_id integer,
    quant integer
);

CREATE TABLE product (
    id integer NOT NULL,
    name character varying,
    price double precision,
    image character varying,
    type integer NOT NULL,
    pizza_size character varying,
    drink_size character varying,
    sauce_name character varying
);

CREATE SEQUENCE product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE sauce (
    name character varying NOT NULL
);

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(80) NOT NULL,
    lastname character varying(40) NOT NULL,
    password character varying(40) NOT NULL,
    phone_num character varying(10) NOT NULL
);

ALTER TABLE ONLY product ALTER COLUMN id SET DEFAULT nextval('product_id_seq'::regclass);

SELECT pg_catalog.setval('product_id_seq', 1, false);


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


ALTER TABLE ONLY product
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




ALTER TABLE ONLY product
    ADD CONSTRAINT pizza_size FOREIGN KEY (pizza_size) REFERENCES pizza_size(size);




ALTER TABLE ONLY prod_quant
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES product(id);




ALTER TABLE ONLY link_menu_product
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES product(id);



ALTER TABLE ONLY product
    ADD CONSTRAINT sauce_name FOREIGN KEY (sauce_name) REFERENCES sauce(name);




ALTER TABLE ONLY address
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES users(id);

