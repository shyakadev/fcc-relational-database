--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    images_id integer,
    constellation character varying(20),
    mass integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.images (
    images_id integer NOT NULL,
    filename character varying(40) NOT NULL,
    name character varying(30),
    width integer,
    height integer
);


ALTER TABLE public.images OWNER TO freecodecamp;

--
-- Name: images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_image_id_seq OWNER TO freecodecamp;

--
-- Name: images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.images_image_id_seq OWNED BY public.images.images_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth numeric(10,2),
    star_id integer,
    orbital_period integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth character varying(20),
    galaxy_id integer,
    mass integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: images images_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.images ALTER COLUMN images_id SET DEFAULT nextval('public.images_image_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Gets it name from the area of the sky in which it appears, the constellation of Andromeda.', 1, 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxies', 'Appearance is similar to an insect antennae', 2, 'Corvus', NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction ofof rotation', 3, 'Centaurus', NULL);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'It has spectacular dark band of absorbing dust in front of the galaxy bright nucleus', 1, 'Coma Berenices', NULL);
INSERT INTO public.galaxy VALUES (5, 'Bode Galaxy', 'Named for Johann Elert Bode who discovered this galaxy in 1774', 1, 'ursa Major', NULL);
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'Looks are similar to a butterfly', 2, 'Virgo', NULL);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.images VALUES (1, 'andromeda_galaxy.jpg', 'andromeda_galaxy', NULL, NULL);
INSERT INTO public.images VALUES (2, 'antennae_galaxies.jpg', 'antennae_galaxies', NULL, NULL);
INSERT INTO public.images VALUES (3, 'backward_galaxy.jpg', 'backward_galaxy', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 2030023, 3232343.20, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 2030023, 3232343.20, 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 2030023, 3232343.20, 2);
INSERT INTO public.moon VALUES (5, 'Lo', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (6, 'Europa', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (7, 'Ganymede', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (8, 'Callissto', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (9, 'Amalthea', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (10, 'Himalia', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (11, 'Elara', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (13, 'Sinope', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (14, 'Lysithea', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (15, 'Carme', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (16, 'Ananke', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (17, 'Leda', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (18, 'Thebe', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (19, 'Adrastea', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (20, 'Metis', 2030023, 3232343.20, 8);
INSERT INTO public.moon VALUES (21, 'Callirrhoe', 2030023, 3232343.20, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '38% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (2, 'Mars', '53% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (3, 'Venus', '95% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (5, 'Neptune', '388% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (6, 'Uranus', '400% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (7, 'Saturn', '945% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (8, 'Jupiter', '1120% the size of Earth', false, 259.71, 2, 256);
INSERT INTO public.planet VALUES (4, 'Earth', '100% the size of Earth', true, 259.71, 2, 256);
INSERT INTO public.planet VALUES (9, 'Orcus', '1120% the size of Earth', false, 259.71, 3, 256);
INSERT INTO public.planet VALUES (10, 'Salacia', '110% the size of Earth', false, 259.71, 4, 256);
INSERT INTO public.planet VALUES (14, 'Pluto', '11% the size of Earth', false, 259.71, 7, 256);
INSERT INTO public.planet VALUES (15, 'Haumea', '11% the size of Earth', false, 259.71, 8, 256);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Ross 248 (HH Andromedae)', 'flare star', true, '10.3057 +-0.0014', 1, NULL);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'one directly-imaged habitable-zone planet candidate(2021)', true, '4.3441 +-0.0022', 3, NULL);
INSERT INTO public.star VALUES (4, 'Groombridge 34', 'flare star, two suspected planets', true, '4.3441 +-0.0022', 2, NULL);
INSERT INTO public.star VALUES (7, 'Ross 128', 'flare star, one planet', true, '11.0074+-0.0011', 6, NULL);
INSERT INTO public.star VALUES (8, 'Gliese 412', 'flare star, one planet', false, '11.0074+-0.0011', 5, NULL);
INSERT INTO public.star VALUES (10, 'Groombridge 1618', 'flare star, one planet', false, '11.0074+-0.0011', 5, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.images_image_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: images images_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_id PRIMARY KEY (images_id);


--
-- Name: images images_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_name_key UNIQUE (name);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy fk_galaxy_images; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_images FOREIGN KEY (images_id) REFERENCES public.images(images_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

