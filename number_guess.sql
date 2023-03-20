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
-- Name: stats; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stats (
    user_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.stats OWNER TO freecodecamp;

--
-- Name: stats_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stats_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_game_id_seq OWNER TO freecodecamp;

--
-- Name: stats_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stats_game_id_seq OWNED BY public.stats.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: stats game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats ALTER COLUMN game_id SET DEFAULT nextval('public.stats_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stats VALUES (3, 6);
INSERT INTO public.stats VALUES (5, 7);
INSERT INTO public.stats VALUES (6, 8);
INSERT INTO public.stats VALUES (3, 9);
INSERT INTO public.stats VALUES (4, 10);
INSERT INTO public.stats VALUES (4, 11);
INSERT INTO public.stats VALUES (4, 12);
INSERT INTO public.stats VALUES (4, 13);
INSERT INTO public.stats VALUES (5, 14);
INSERT INTO public.stats VALUES (6, 15);
INSERT INTO public.stats VALUES (4, 16);
INSERT INTO public.stats VALUES (4, 17);
INSERT INTO public.stats VALUES (4, 18);
INSERT INTO public.stats VALUES (4, 19);
INSERT INTO public.stats VALUES (4, 20);
INSERT INTO public.stats VALUES (5, 21);
INSERT INTO public.stats VALUES (6, 22);
INSERT INTO public.stats VALUES (4, 23);
INSERT INTO public.stats VALUES (3, 24);
INSERT INTO public.stats VALUES (4, 25);
INSERT INTO public.stats VALUES (4, 26);
INSERT INTO public.stats VALUES (4, 27);
INSERT INTO public.stats VALUES (4, 28);
INSERT INTO public.stats VALUES (5, 29);
INSERT INTO public.stats VALUES (6, 30);
INSERT INTO public.stats VALUES (4, 31);
INSERT INTO public.stats VALUES (3, 32);
INSERT INTO public.stats VALUES (4, 33);
INSERT INTO public.stats VALUES (4, 34);
INSERT INTO public.stats VALUES (4, 35);
INSERT INTO public.stats VALUES (4, 36);
INSERT INTO public.stats VALUES (5, 37);
INSERT INTO public.stats VALUES (6, 38);
INSERT INTO public.stats VALUES (4, 39);
INSERT INTO public.stats VALUES (4, 40);
INSERT INTO public.stats VALUES (4, 41);
INSERT INTO public.stats VALUES (4, 42);
INSERT INTO public.stats VALUES (4, 43);
INSERT INTO public.stats VALUES (5, 44);
INSERT INTO public.stats VALUES (6, 45);
INSERT INTO public.stats VALUES (4, 46);
INSERT INTO public.stats VALUES (4, 47);
INSERT INTO public.stats VALUES (4, 48);
INSERT INTO public.stats VALUES (4, 49);
INSERT INTO public.stats VALUES (4, 50);
INSERT INTO public.stats VALUES (5, 51);
INSERT INTO public.stats VALUES (6, 52);
INSERT INTO public.stats VALUES (4, 53);
INSERT INTO public.stats VALUES (4, 54);
INSERT INTO public.stats VALUES (4, 55);
INSERT INTO public.stats VALUES (4, 56);
INSERT INTO public.stats VALUES (4, 57);
INSERT INTO public.stats VALUES (5, 58);
INSERT INTO public.stats VALUES (6, 59);
INSERT INTO public.stats VALUES (4, 60);
INSERT INTO public.stats VALUES (4, 61);
INSERT INTO public.stats VALUES (4, 62);
INSERT INTO public.stats VALUES (4, 63);
INSERT INTO public.stats VALUES (4, 64);
INSERT INTO public.stats VALUES (5, 65);
INSERT INTO public.stats VALUES (6, 66);
INSERT INTO public.stats VALUES (4, 67);
INSERT INTO public.stats VALUES (4, 68);
INSERT INTO public.stats VALUES (4, 69);
INSERT INTO public.stats VALUES (4, 70);
INSERT INTO public.stats VALUES (4, 71);
INSERT INTO public.stats VALUES (5, 72);
INSERT INTO public.stats VALUES (6, 73);
INSERT INTO public.stats VALUES (4, 74);
INSERT INTO public.stats VALUES (22, 75);
INSERT INTO public.stats VALUES (23, 76);
INSERT INTO public.stats VALUES (23, 77);
INSERT INTO public.stats VALUES (22, 78);
INSERT INTO public.stats VALUES (22, 79);
INSERT INTO public.stats VALUES (22, 80);
INSERT INTO public.stats VALUES (24, 81);
INSERT INTO public.stats VALUES (25, 82);
INSERT INTO public.stats VALUES (25, 83);
INSERT INTO public.stats VALUES (24, 84);
INSERT INTO public.stats VALUES (24, 85);
INSERT INTO public.stats VALUES (24, 86);
INSERT INTO public.stats VALUES (4, 87);
INSERT INTO public.stats VALUES (4, 88);
INSERT INTO public.stats VALUES (4, 89);
INSERT INTO public.stats VALUES (4, 90);
INSERT INTO public.stats VALUES (5, 91);
INSERT INTO public.stats VALUES (6, 92);
INSERT INTO public.stats VALUES (4, 93);
INSERT INTO public.stats VALUES (26, 94);
INSERT INTO public.stats VALUES (26, 95);
INSERT INTO public.stats VALUES (27, 96);
INSERT INTO public.stats VALUES (27, 97);
INSERT INTO public.stats VALUES (26, 98);
INSERT INTO public.stats VALUES (26, 99);
INSERT INTO public.stats VALUES (26, 100);
INSERT INTO public.stats VALUES (28, 101);
INSERT INTO public.stats VALUES (28, 102);
INSERT INTO public.stats VALUES (29, 103);
INSERT INTO public.stats VALUES (29, 104);
INSERT INTO public.stats VALUES (28, 105);
INSERT INTO public.stats VALUES (28, 106);
INSERT INTO public.stats VALUES (28, 107);
INSERT INTO public.stats VALUES (30, 108);
INSERT INTO public.stats VALUES (30, 109);
INSERT INTO public.stats VALUES (31, 110);
INSERT INTO public.stats VALUES (31, 111);
INSERT INTO public.stats VALUES (30, 112);
INSERT INTO public.stats VALUES (30, 113);
INSERT INTO public.stats VALUES (30, 114);
INSERT INTO public.stats VALUES (32, 115);
INSERT INTO public.stats VALUES (32, 116);
INSERT INTO public.stats VALUES (33, 117);
INSERT INTO public.stats VALUES (33, 118);
INSERT INTO public.stats VALUES (32, 119);
INSERT INTO public.stats VALUES (32, 120);
INSERT INTO public.stats VALUES (32, 121);
INSERT INTO public.stats VALUES (34, 122);
INSERT INTO public.stats VALUES (34, 123);
INSERT INTO public.stats VALUES (35, 124);
INSERT INTO public.stats VALUES (35, 125);
INSERT INTO public.stats VALUES (34, 126);
INSERT INTO public.stats VALUES (34, 127);
INSERT INTO public.stats VALUES (34, 128);
INSERT INTO public.stats VALUES (36, 129);
INSERT INTO public.stats VALUES (37, 130);
INSERT INTO public.stats VALUES (37, 131);
INSERT INTO public.stats VALUES (36, 132);
INSERT INTO public.stats VALUES (36, 133);
INSERT INTO public.stats VALUES (36, 134);
INSERT INTO public.stats VALUES (38, 135);
INSERT INTO public.stats VALUES (38, 136);
INSERT INTO public.stats VALUES (39, 137);
INSERT INTO public.stats VALUES (39, 138);
INSERT INTO public.stats VALUES (38, 139);
INSERT INTO public.stats VALUES (38, 140);
INSERT INTO public.stats VALUES (38, 141);
INSERT INTO public.stats VALUES (3, 142);
INSERT INTO public.stats VALUES (40, 143);
INSERT INTO public.stats VALUES (40, 144);
INSERT INTO public.stats VALUES (41, 145);
INSERT INTO public.stats VALUES (41, 146);
INSERT INTO public.stats VALUES (40, 147);
INSERT INTO public.stats VALUES (40, 148);
INSERT INTO public.stats VALUES (40, 149);
INSERT INTO public.stats VALUES (42, 150);
INSERT INTO public.stats VALUES (42, 151);
INSERT INTO public.stats VALUES (43, 152);
INSERT INTO public.stats VALUES (43, 153);
INSERT INTO public.stats VALUES (42, 154);
INSERT INTO public.stats VALUES (42, 155);
INSERT INTO public.stats VALUES (42, 156);
INSERT INTO public.stats VALUES (44, 157);
INSERT INTO public.stats VALUES (44, 158);
INSERT INTO public.stats VALUES (45, 159);
INSERT INTO public.stats VALUES (45, 160);
INSERT INTO public.stats VALUES (44, 161);
INSERT INTO public.stats VALUES (44, 162);
INSERT INTO public.stats VALUES (44, 163);
INSERT INTO public.stats VALUES (46, 164);
INSERT INTO public.stats VALUES (46, 165);
INSERT INTO public.stats VALUES (47, 166);
INSERT INTO public.stats VALUES (47, 167);
INSERT INTO public.stats VALUES (46, 168);
INSERT INTO public.stats VALUES (46, 169);
INSERT INTO public.stats VALUES (46, 170);
INSERT INTO public.stats VALUES (48, 171);
INSERT INTO public.stats VALUES (48, 172);
INSERT INTO public.stats VALUES (49, 173);
INSERT INTO public.stats VALUES (49, 174);
INSERT INTO public.stats VALUES (48, 175);
INSERT INTO public.stats VALUES (48, 176);
INSERT INTO public.stats VALUES (48, 177);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (6, 'a', 28);
INSERT INTO public.users VALUES (3, 'Pedro', 7);
INSERT INTO public.users VALUES (39, 'user_1677258803515', 48);
INSERT INTO public.users VALUES (38, 'user_1677258803516', 232);
INSERT INTO public.users VALUES (4, '0', 21);
INSERT INTO public.users VALUES (40, 'user_1677258953761', 29);
INSERT INTO public.users VALUES (41, 'user_1677258953760', 8);
INSERT INTO public.users VALUES (5, '1', 45);
INSERT INTO public.users VALUES (43, 'user_1677259160555', 679);
INSERT INTO public.users VALUES (42, 'user_1677259160556', 582);
INSERT INTO public.users VALUES (45, 'user_1677259299016', 354);
INSERT INTO public.users VALUES (23, 'user_1677258030172', 663);
INSERT INTO public.users VALUES (22, 'user_1677258030173', 20);
INSERT INTO public.users VALUES (44, 'user_1677259299017', 215);
INSERT INTO public.users VALUES (25, 'user_1677258063464', 590);
INSERT INTO public.users VALUES (24, 'user_1677258063465', 116);
INSERT INTO public.users VALUES (46, 'user_1677259466023', 20);
INSERT INTO public.users VALUES (26, 'user_1677258322528', 8);
INSERT INTO public.users VALUES (27, 'user_1677258322527', 810);
INSERT INTO public.users VALUES (47, 'user_1677259466022', 337);
INSERT INTO public.users VALUES (29, 'user_1677258408132', 165);
INSERT INTO public.users VALUES (28, 'user_1677258408133', 56);
INSERT INTO public.users VALUES (31, 'user_1677258423309', 180);
INSERT INTO public.users VALUES (30, 'user_1677258423310', 41);
INSERT INTO public.users VALUES (33, 'user_1677258529867', 515);
INSERT INTO public.users VALUES (32, 'user_1677258529868', 501);
INSERT INTO public.users VALUES (49, 'user_1677259511054', 773);
INSERT INTO public.users VALUES (35, 'user_1677258558806', 37);
INSERT INTO public.users VALUES (34, 'user_1677258558807', 123);
INSERT INTO public.users VALUES (48, 'user_1677259511055', 256);
INSERT INTO public.users VALUES (37, 'user_1677258613940', 235);
INSERT INTO public.users VALUES (36, 'user_1677258613941', 38);


--
-- Name: stats_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stats_game_id_seq', 177, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 49, true);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: stats stats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

