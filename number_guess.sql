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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    username character varying(25) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 1000
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES ('Test', 1, 7);
INSERT INTO public.user_info VALUES ('user_1683710890276', 2, 431);
INSERT INTO public.user_info VALUES ('user_1683710890277', 4, 120);
INSERT INTO public.user_info VALUES ('user_1683711657921', 2, 158);
INSERT INTO public.user_info VALUES ('user_1683710906671', 2, 418);
INSERT INTO public.user_info VALUES ('user_1683711657922', 5, 6);
INSERT INTO public.user_info VALUES ('user_1683710906672', 5, 34);
INSERT INTO public.user_info VALUES ('user_1683710950259', 2, 240);
INSERT INTO public.user_info VALUES ('user_1683710950260', 4, 202);
INSERT INTO public.user_info VALUES ('user_1683711029284', 1, 254);
INSERT INTO public.user_info VALUES ('user_1683711029285', 4, 172);
INSERT INTO public.user_info VALUES ('user_1683711096465', 2, 550);
INSERT INTO public.user_info VALUES ('user_1683711096466', 4, 18);
INSERT INTO public.user_info VALUES ('user_1683711336623', 1, 598);
INSERT INTO public.user_info VALUES ('user_1683711336624', 4, 33);
INSERT INTO public.user_info VALUES ('user_1683711378165', 2, 177);
INSERT INTO public.user_info VALUES ('user_1683711378166', 5, 221);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

