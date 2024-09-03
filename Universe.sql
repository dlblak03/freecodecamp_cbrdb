--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(60) NOT NULL,
    galaxy_age_in_millions_of_years integer,
    description text,
    galaxy_type_id integer NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    moon_age_in_millions_of_years integer,
    description text,
    has_life boolean
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
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_age_in_millions_of_years integer,
    description text,
    has_life boolean,
    distance_from_earth numeric(5,1)
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
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    star_age_in_millions_of_years integer,
    description text
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13300, 'A massive barred spiral galaxy, approximately 100,000 light-years across, containing hundreds of billions of stars, dust, and gas, with our solar system situated about 25,000 light-years from its center.', 0);
INSERT INTO public.galaxy VALUES (2, 'Sagittarius Dwarf', 11200, 'A satellite elliptical galaxy of the Milky Way, discovered in 1994, with a looping shape, at least nine known globular clusters, and being tidally disrupted by the Milky Way’s gravitational forces, resulting in a stellar stream along its path.', 0);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 13100, 'The Large Magellanic Cloud (LMC) is a nearby satellite galaxy, approximately 163,000 light-years away, with a diameter of 9.86 kiloparsecs (32,200 light-years), consisting of a warped central bar and spiral arms, and is predicted to merge with the Milky Way in about 2.4 billion years.', 0);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 12500, 'The Small Magellanic Cloud is a dwarf irregular galaxy, approximately 62,000 light-years away, with a diameter of 18,900 light-years, containing around 3 billion stars, and is a companion galaxy to the Milky Way, exhibiting a central bar structure and tidal interaction with the Large Magellanic Cloud.', 0);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf', -1, 'A disputed dwarf irregular galaxy, located approximately 25,000 light-years away, thought to contain about one billion stars, with a relatively high percentage of red giants, and having a roughly elliptical shape, although its true nature and existence are still debated among astronomers.', 0);
INSERT INTO public.galaxy VALUES (6, 'Ursa Major III', 11000, 'Ursa Major III is a predicted dwarf satellite galaxy of the Milky Way, characterized by a high mass-to-light ratio, potentially indicating the presence of a massive dark matter halo, and discovered through the UNIONS survey as the smallest and faintest ever detected.', 0);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical Galaxy', '');
INSERT INTO public.galaxy_types VALUES (2, 'Spiral Galaxy', '');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular Galaxy', '');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon #1', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Moon #2', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Moon #3', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Moon #4', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Moon #5', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Moon #6', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Moon #7', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Moon #8', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Moon #9', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Moon #10', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Moon #11', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon #12', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon #13', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon #14', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon #15', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon #16', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon #17', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon #18', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon #19', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon #20', 1, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 40500, '', false, 96.6);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 40600, '', false, 25.0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4540, '', true, 0.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 4000, '', false, 140.0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4600, '', false, 385.0);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 400, '', false, 1200.0);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 4600, '', false, 1800.0);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 4600, '', false, 2700.0);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 4570, '', false, -1.0);
INSERT INTO public.planet VALUES (10, 'Orcus', 1, 53, '', false, -1.0);
INSERT INTO public.planet VALUES (11, 'Pluto', 1, 93, '', false, -1.0);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, 4500, '', false, -1.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4520, '');
INSERT INTO public.star VALUES (2, 'Rigel', 1, 8, '');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 11, '');
INSERT INTO public.star VALUES (4, 'Sirius', 1, 242, '');
INSERT INTO public.star VALUES (5, 'Deneb', 1, 8, '');
INSERT INTO public.star VALUES (6, 'Antares', 1, 14, '');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_type_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

