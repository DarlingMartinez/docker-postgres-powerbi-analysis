--
-- PostgreSQL database dump
--

\restrict WanHii8XBuJeYbMR0o9mVd8jzZ0CUj6lp8308aan7DYBDjS6eA9aJOfJzvtwjPy

-- Dumped from database version 15.15 (Debian 15.15-1.pgdg13+1)
-- Dumped by pg_dump version 15.15 (Debian 15.15-1.pgdg13+1)

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

ALTER TABLE ONLY public.fact_ventas DROP CONSTRAINT fk_producto;
ALTER TABLE ONLY public.clientes DROP CONSTRAINT fk_pais;
ALTER TABLE ONLY public.fact_ventas DROP CONSTRAINT fk_cliente;
ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_categoria;
ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_pkey;
ALTER TABLE ONLY public.fact_ventas DROP CONSTRAINT fact_ventas_pkey;
ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
ALTER TABLE public.productos ALTER COLUMN producto_id DROP DEFAULT;
ALTER TABLE public.pais ALTER COLUMN pais_id DROP DEFAULT;
ALTER TABLE public.fact_ventas ALTER COLUMN venta_id DROP DEFAULT;
ALTER TABLE public.clientes ALTER COLUMN cliente_id DROP DEFAULT;
ALTER TABLE public.categoria ALTER COLUMN categoria_id DROP DEFAULT;
DROP SEQUENCE public.productos_producto_id_seq;
DROP TABLE public.productos;
DROP SEQUENCE public.pais_pais_id_seq;
DROP TABLE public.pais;
DROP SEQUENCE public.fact_ventas_venta_id_seq;
DROP TABLE public.fact_ventas;
DROP SEQUENCE public.clientes_cliente_id_seq;
DROP TABLE public.clientes;
DROP SEQUENCE public.categoria_categoria_id_seq;
DROP TABLE public.categoria;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: fix_admin
--

CREATE TABLE public.categoria (
    categoria_id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.categoria OWNER TO fix_admin;

--
-- Name: categoria_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: fix_admin
--

CREATE SEQUENCE public.categoria_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_categoria_id_seq OWNER TO fix_admin;

--
-- Name: categoria_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fix_admin
--

ALTER SEQUENCE public.categoria_categoria_id_seq OWNED BY public.categoria.categoria_id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: fix_admin
--

CREATE TABLE public.clientes (
    cliente_id integer NOT NULL,
    nombre_cliente character varying(100) NOT NULL,
    pais_id integer NOT NULL
);


ALTER TABLE public.clientes OWNER TO fix_admin;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: fix_admin
--

CREATE SEQUENCE public.clientes_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_cliente_id_seq OWNER TO fix_admin;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fix_admin
--

ALTER SEQUENCE public.clientes_cliente_id_seq OWNED BY public.clientes.cliente_id;


--
-- Name: fact_ventas; Type: TABLE; Schema: public; Owner: fix_admin
--

CREATE TABLE public.fact_ventas (
    venta_id integer NOT NULL,
    producto_id integer NOT NULL,
    cliente_id integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario integer NOT NULL,
    fecha date NOT NULL,
    CONSTRAINT fact_ventas_cantidad_check CHECK ((cantidad > 0)),
    CONSTRAINT fact_ventas_precio_unitario_check CHECK (((precio_unitario)::numeric >= (0)::numeric))
);


ALTER TABLE public.fact_ventas OWNER TO fix_admin;

--
-- Name: fact_ventas_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: fix_admin
--

CREATE SEQUENCE public.fact_ventas_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_ventas_venta_id_seq OWNER TO fix_admin;

--
-- Name: fact_ventas_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fix_admin
--

ALTER SEQUENCE public.fact_ventas_venta_id_seq OWNED BY public.fact_ventas.venta_id;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: fix_admin
--

CREATE TABLE public.pais (
    pais_id integer NOT NULL,
    lugar character varying(50) NOT NULL
);


ALTER TABLE public.pais OWNER TO fix_admin;

--
-- Name: pais_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: fix_admin
--

CREATE SEQUENCE public.pais_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_pais_id_seq OWNER TO fix_admin;

--
-- Name: pais_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fix_admin
--

ALTER SEQUENCE public.pais_pais_id_seq OWNED BY public.pais.pais_id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: fix_admin
--

CREATE TABLE public.productos (
    producto_id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.productos OWNER TO fix_admin;

--
-- Name: productos_producto_id_seq; Type: SEQUENCE; Schema: public; Owner: fix_admin
--

CREATE SEQUENCE public.productos_producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_producto_id_seq OWNER TO fix_admin;

--
-- Name: productos_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fix_admin
--

ALTER SEQUENCE public.productos_producto_id_seq OWNED BY public.productos.producto_id;


--
-- Name: categoria categoria_id; Type: DEFAULT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.categoria ALTER COLUMN categoria_id SET DEFAULT nextval('public.categoria_categoria_id_seq'::regclass);


--
-- Name: clientes cliente_id; Type: DEFAULT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.clientes ALTER COLUMN cliente_id SET DEFAULT nextval('public.clientes_cliente_id_seq'::regclass);


--
-- Name: fact_ventas venta_id; Type: DEFAULT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.fact_ventas ALTER COLUMN venta_id SET DEFAULT nextval('public.fact_ventas_venta_id_seq'::regclass);


--
-- Name: pais pais_id; Type: DEFAULT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.pais ALTER COLUMN pais_id SET DEFAULT nextval('public.pais_pais_id_seq'::regclass);


--
-- Name: productos producto_id; Type: DEFAULT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.productos ALTER COLUMN producto_id SET DEFAULT nextval('public.productos_producto_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: fix_admin
--

INSERT INTO public.categoria (categoria_id, descripcion) VALUES (1, 'Electrónica');
INSERT INTO public.categoria (categoria_id, descripcion) VALUES (2, 'Muebles');
INSERT INTO public.categoria (categoria_id, descripcion) VALUES (3, 'Comida');
INSERT INTO public.categoria (categoria_id, descripcion) VALUES (4, 'Ropa');
INSERT INTO public.categoria (categoria_id, descripcion) VALUES (5, 'Mascota');
INSERT INTO public.categoria (categoria_id, descripcion) VALUES (6, 'Dormitorio');
INSERT INTO public.categoria (categoria_id, descripcion) VALUES (7, 'Escolar');


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: fix_admin
--

INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (1, 'Juan Pérez', 1);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (2, 'María García', 2);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (3, 'Carlos López', 3);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (4, 'Ana Martínez', 4);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (5, 'Luis Rodríguez', 5);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (6, 'Elena Gómez', 6);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (7, 'Diego Torres', 7);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (8, 'Sofía Hernández', 1);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (9, 'Javier Ruiz', 2);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (10, 'Lucía Díaz', 3);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (11, 'Andrés Castro', 4);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (12, 'Valentina Morales', 5);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (13, 'Mateo Ortiz', 6);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (14, 'Camila Silva', 7);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (15, 'Nicolás Romero', 1);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (16, 'Isabella Vega', 2);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (17, 'Sebastián Méndez', 3);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (18, 'Antonella Peña', 4);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (19, 'Samuel Castillo', 5);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (20, 'Valeria Ríos', 6);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (21, 'Felipe Flores', 7);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (22, 'Martina Mendoza', 1);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (23, 'Joaquín Ibarra', 2);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (24, 'Victoria Guzmán', 3);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (25, 'Gabriel Salazar', 4);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (26, 'Renata Pineda', 5);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (27, 'Tomás Ferrera', 6);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (28, 'Emilia Rivas', 7);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (29, 'Daniel Duarte', 1);
INSERT INTO public.clientes (cliente_id, nombre_cliente, pais_id) VALUES (30, 'Sara Benítez', 2);


--
-- Data for Name: fact_ventas; Type: TABLE DATA; Schema: public; Owner: fix_admin
--
INSERT INTO fact_ventas (producto_id, cliente_id, cantidad, precio_unitario, fecha)SELECT
floor(random() * 60 + 1)::int,
floor(random() * 30 + 1)::int,
floor(random() * 5 + 1)::int,
floor(random() * 95001 + 5000)::int,
CURRENT_DATE - (random() * 365)::int FROM generate_series(1, 5000); 
INSERT 0 5000


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: fix_admin
--

INSERT INTO public.pais (pais_id, lugar) VALUES (1, 'Colombia');
INSERT INTO public.pais (pais_id, lugar) VALUES (2, 'México');
INSERT INTO public.pais (pais_id, lugar) VALUES (3, 'Argentina');
INSERT INTO public.pais (pais_id, lugar) VALUES (4, 'Perú');
INSERT INTO public.pais (pais_id, lugar) VALUES (5, 'Brasil');
INSERT INTO public.pais (pais_id, lugar) VALUES (6, 'El Salvador');
INSERT INTO public.pais (pais_id, lugar) VALUES (7, 'Nicaragua');


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: fix_admin
--

INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (1, 'Laptop Pro', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (2, 'Smartphone X', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (3, 'Audífonos BT', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (4, 'Monitor 4K', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (5, 'Teclado Mecánico', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (6, 'Cámara HD', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (7, 'Tablet 10', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (8, 'Mouse Gaming', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (9, 'Reloj Inteligente', 1);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (10, 'Sofá 3 Pz', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (11, 'Mesa Centro', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (12, 'Silla Ergonom', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (13, 'Estante Libros', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (14, 'Comedor Madera', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (15, 'Credenza', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (16, 'Escritorio', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (17, 'Lámpara Pie', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (18, 'Espejo Pared', 2);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (19, 'Arroz 1kg', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (20, 'Aceite Oliva', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (21, 'Pasta Penne', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (22, 'Café Molido', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (23, 'Cereal Avena', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (24, 'Salsa Tomate', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (25, 'Chocolate', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (26, 'Leche Entera', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (27, 'Galletas', 3);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (28, 'Camiseta M', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (29, 'Jeans Azul', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (30, 'Chaqueta', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (31, 'Vestido', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (32, 'Zapatos', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (33, 'Sudadera', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (34, 'Gorra', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (35, 'Calcetines', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (36, 'Cinturón', 4);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (37, 'Croquetas', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (38, 'Arena Gato', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (39, 'Juguete Can', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (40, 'Cama Mascota', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (41, 'Champú Perro', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (42, 'Correa', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (43, 'Rascador', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (44, 'Bebedero', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (45, 'Collar', 5);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (46, 'Colchón Mat', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (47, 'Almohada', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (48, 'Sábanas', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (49, 'Lámpara Mesa', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (50, 'Mesita Noche', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (51, 'Edredón', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (52, 'Cojines', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (53, 'Manta', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (54, 'Alfombra', 6);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (55, 'Cuaderno', 7);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (56, 'Lápices Col', 7);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (57, 'Mochila', 7);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (58, 'Calculadora', 7);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (59, 'Pegamento', 7);
INSERT INTO public.productos (producto_id, nombre, categoria_id) VALUES (60, 'Regla 30cm', 7);


--
-- Name: categoria_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fix_admin
--

SELECT pg_catalog.setval('public.categoria_categoria_id_seq', 7, true);


--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fix_admin
--

SELECT pg_catalog.setval('public.clientes_cliente_id_seq', 30, true);


--
-- Name: fact_ventas_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fix_admin
--

SELECT pg_catalog.setval('public.fact_ventas_venta_id_seq', 5100, true);


--
-- Name: pais_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fix_admin
--

SELECT pg_catalog.setval('public.pais_pais_id_seq', 7, true);


--
-- Name: productos_producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fix_admin
--

SELECT pg_catalog.setval('public.productos_producto_id_seq', 60, true);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (categoria_id);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id);


--
-- Name: fact_ventas fact_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fact_ventas_pkey PRIMARY KEY (venta_id);


--
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (pais_id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (producto_id);


--
-- Name: productos fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(categoria_id) ON DELETE RESTRICT;


--
-- Name: fact_ventas fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(cliente_id);


--
-- Name: clientes fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_pais FOREIGN KEY (pais_id) REFERENCES public.pais(pais_id) ON DELETE RESTRICT;


--
-- Name: fact_ventas fk_producto; Type: FK CONSTRAINT; Schema: public; Owner: fix_admin
--

ALTER TABLE ONLY public.fact_ventas
    ADD CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- PostgreSQL database dump complete
--

\unrestrict WanHii8XBuJeYbMR0o9mVd8jzZ0CUj6lp8308aan7DYBDjS6eA9aJOfJzvtwjPy

