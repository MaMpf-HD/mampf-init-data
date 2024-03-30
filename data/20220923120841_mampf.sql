--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

-- Started on 2022-09-23 12:08:41 UTC

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
-- TOC entry 2 (class 3079 OID 26237)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 26274)
-- Name: announcements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.announcements (
    id bigint NOT NULL,
    lecture_id bigint,
    announcer_id bigint,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    on_main_page boolean DEFAULT false
);


--
-- TOC entry 211 (class 1259 OID 26280)
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 211
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- TOC entry 212 (class 1259 OID 26281)
-- Name: answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    text text,
    value boolean,
    explanation text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    question_id integer
);


--
-- TOC entry 213 (class 1259 OID 26286)
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 213
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- TOC entry 214 (class 1259 OID 26287)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26292)
-- Name: assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assignments (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    medium_id bigint,
    title text,
    deadline timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    accepted_file_type text DEFAULT '.pdf'::text,
    deletion_date date DEFAULT '2020-10-15'::date NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 26298)
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 216
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- TOC entry 217 (class 1259 OID 26299)
-- Name: chapters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chapters (
    id bigint NOT NULL,
    lecture_id integer,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    display_number text,
    hidden boolean,
    details text
);


--
-- TOC entry 218 (class 1259 OID 26304)
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 218
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- TOC entry 219 (class 1259 OID 26305)
-- Name: clicker_votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clicker_votes (
    id bigint NOT NULL,
    value integer,
    clicker_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 26308)
-- Name: clicker_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clicker_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 220
-- Name: clicker_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clicker_votes_id_seq OWNED BY public.clicker_votes.id;


--
-- TOC entry 221 (class 1259 OID 26309)
-- Name: clickers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clickers (
    id bigint NOT NULL,
    editor_id integer,
    question_id integer,
    code text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title text,
    open boolean,
    alternatives integer,
    instance text
);


--
-- TOC entry 222 (class 1259 OID 26314)
-- Name: clickers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clickers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 222
-- Name: clickers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clickers_id_seq OWNED BY public.clickers.id;


--
-- TOC entry 223 (class 1259 OID 26315)
-- Name: commontator_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commontator_comments (
    id bigint NOT NULL,
    thread_id bigint NOT NULL,
    creator_type character varying NOT NULL,
    creator_id bigint NOT NULL,
    editor_type character varying,
    editor_id bigint,
    body text NOT NULL,
    deleted_at timestamp without time zone,
    cached_votes_up integer DEFAULT 0,
    cached_votes_down integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    parent_id bigint
);


--
-- TOC entry 224 (class 1259 OID 26322)
-- Name: commontator_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 224
-- Name: commontator_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_comments_id_seq OWNED BY public.commontator_comments.id;


--
-- TOC entry 225 (class 1259 OID 26323)
-- Name: commontator_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commontator_subscriptions (
    id bigint NOT NULL,
    thread_id bigint NOT NULL,
    subscriber_type character varying NOT NULL,
    subscriber_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 26328)
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 226
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_subscriptions_id_seq OWNED BY public.commontator_subscriptions.id;


--
-- TOC entry 227 (class 1259 OID 26329)
-- Name: commontator_threads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commontator_threads (
    id bigint NOT NULL,
    commontable_type character varying,
    commontable_id bigint,
    closer_type character varying,
    closer_id bigint,
    closed_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 26334)
-- Name: commontator_threads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 228
-- Name: commontator_threads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_threads_id_seq OWNED BY public.commontator_threads.id;


--
-- TOC entry 229 (class 1259 OID 26335)
-- Name: course_self_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_self_joins (
    id bigint NOT NULL,
    course_id bigint,
    preceding_course_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 26338)
-- Name: course_self_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_self_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 230
-- Name: course_self_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_self_joins_id_seq OWNED BY public.course_self_joins.id;


--
-- TOC entry 231 (class 1259 OID 26339)
-- Name: course_tag_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.course_tag_joins (
    id bigint NOT NULL,
    course_id integer,
    tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 26342)
-- Name: course_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 232
-- Name: course_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_tag_joins_id_seq OWNED BY public.course_tag_joins.id;


--
-- TOC entry 233 (class 1259 OID 26347)
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    short_title character varying,
    organizational boolean,
    organizational_concept text,
    locale text,
    term_independent boolean DEFAULT false,
    image_data text
);


--
-- TOC entry 234 (class 1259 OID 26353)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 234
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 235 (class 1259 OID 26354)
-- Name: division_course_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.division_course_joins (
    id bigint NOT NULL,
    division_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 236 (class 1259 OID 26357)
-- Name: division_course_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.division_course_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 236
-- Name: division_course_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.division_course_joins_id_seq OWNED BY public.division_course_joins.id;


--
-- TOC entry 237 (class 1259 OID 26358)
-- Name: division_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.division_translations (
    id bigint NOT NULL,
    division_id bigint NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name text
);


--
-- TOC entry 238 (class 1259 OID 26363)
-- Name: division_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.division_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 238
-- Name: division_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.division_translations_id_seq OWNED BY public.division_translations.id;


--
-- TOC entry 239 (class 1259 OID 26364)
-- Name: divisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.divisions (
    id bigint NOT NULL,
    program_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 240 (class 1259 OID 26367)
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 240
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.divisions_id_seq OWNED BY public.divisions.id;


--
-- TOC entry 241 (class 1259 OID 26368)
-- Name: editable_user_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.editable_user_joins (
    id bigint NOT NULL,
    editable_id integer,
    editable_type character varying,
    user_id integer
);


--
-- TOC entry 242 (class 1259 OID 26373)
-- Name: editable_user_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.editable_user_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 242
-- Name: editable_user_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.editable_user_joins_id_seq OWNED BY public.editable_user_joins.id;


--
-- TOC entry 243 (class 1259 OID 26374)
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


--
-- TOC entry 244 (class 1259 OID 26379)
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 244
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- TOC entry 245 (class 1259 OID 26380)
-- Name: imports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.imports (
    id bigint NOT NULL,
    medium_id bigint NOT NULL,
    teachable_type character varying NOT NULL,
    teachable_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 246 (class 1259 OID 26385)
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 246
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- TOC entry 247 (class 1259 OID 26386)
-- Name: item_self_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_self_joins (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    related_item_id bigint NOT NULL
);


--
-- TOC entry 248 (class 1259 OID 26389)
-- Name: item_self_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_self_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 248
-- Name: item_self_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_self_joins_id_seq OWNED BY public.item_self_joins.id;


--
-- TOC entry 249 (class 1259 OID 26390)
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    start_time text,
    sort text,
    page integer,
    description text,
    link text,
    explanation text,
    medium_id bigint,
    section_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ref_number text,
    pdf_destination text,
    "position" integer,
    quarantine boolean,
    hidden boolean
);


--
-- TOC entry 250 (class 1259 OID 26395)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 250
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 251 (class 1259 OID 26396)
-- Name: lecture_user_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lecture_user_joins (
    id bigint NOT NULL,
    lecture_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 26399)
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lecture_user_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 252
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lecture_user_joins_id_seq OWNED BY public.lecture_user_joins.id;


--
-- TOC entry 253 (class 1259 OID 26400)
-- Name: lectures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lectures (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    course_id integer,
    term_id integer,
    teacher_id integer,
    start_chapter integer,
    absolute_numbering boolean,
    start_section integer,
    organizational_concept text,
    organizational boolean,
    muesli boolean,
    released text,
    content_mode text,
    passphrase text,
    locale text,
    sort text,
    forum_id integer,
    structure_ids text,
    comments_disabled boolean,
    organizational_on_top boolean,
    disable_teacher_display boolean DEFAULT false,
    submission_max_team_size integer,
    submission_grace_period integer DEFAULT 15,
    legacy_seminar boolean DEFAULT false
);


--
-- TOC entry 254 (class 1259 OID 26407)
-- Name: lectures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lectures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 254
-- Name: lectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lectures_id_seq OWNED BY public.lectures.id;


--
-- TOC entry 255 (class 1259 OID 26408)
-- Name: lesson_section_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lesson_section_joins (
    id bigint NOT NULL,
    lesson_id integer,
    section_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 26411)
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_section_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 256
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_section_joins_id_seq OWNED BY public.lesson_section_joins.id;


--
-- TOC entry 257 (class 1259 OID 26412)
-- Name: lesson_tag_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lesson_tag_joins (
    id bigint NOT NULL,
    lesson_id integer,
    tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 26415)
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 258
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_tag_joins_id_seq OWNED BY public.lesson_tag_joins.id;


--
-- TOC entry 259 (class 1259 OID 26416)
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lessons (
    id bigint NOT NULL,
    date date,
    lecture_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_destination text,
    end_destination text,
    details text
);


--
-- TOC entry 260 (class 1259 OID 26421)
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 260
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- TOC entry 261 (class 1259 OID 26422)
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id bigint NOT NULL,
    medium_id bigint,
    linked_medium_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 26425)
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 262
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- TOC entry 263 (class 1259 OID 26426)
-- Name: media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media (
    id bigint NOT NULL,
    external_reference_link text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sort character varying,
    description character varying,
    teachable_type character varying,
    teachable_id bigint,
    video_data text,
    screenshot_data text,
    manuscript_data text,
    released text,
    imported_manuscript boolean,
    quizzable_type character varying,
    quizzable_id bigint,
    hint text,
    parent_id integer,
    quiz_graph text,
    level integer,
    type text,
    text text,
    independent boolean,
    keks_id integer,
    locale text,
    solution text,
    question_sort text,
    content text,
    geogebra_data text,
    geogebra_app_name text,
    "position" integer,
    text_input boolean DEFAULT false,
    boost double precision DEFAULT 0.0,
    released_at timestamp without time zone,
    publisher text,
    file_last_edited timestamp without time zone
);


--
-- TOC entry 264 (class 1259 OID 26433)
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 264
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- TOC entry 265 (class 1259 OID 26434)
-- Name: medium_tag_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.medium_tag_joins (
    id bigint NOT NULL,
    medium_id bigint,
    tag_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 26437)
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medium_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 266
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medium_tag_joins_id_seq OWNED BY public.medium_tag_joins.id;


--
-- TOC entry 267 (class 1259 OID 26438)
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    recipient_id integer,
    notifiable_id integer,
    notifiable_type text,
    action text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 26443)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 268
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 269 (class 1259 OID 26444)
-- Name: notions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title text,
    locale text,
    tag_id integer,
    aliased_tag_id integer
);


--
-- TOC entry 270 (class 1259 OID 26449)
-- Name: notions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 270
-- Name: notions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notions_id_seq OWNED BY public.notions.id;


--
-- TOC entry 271 (class 1259 OID 26450)
-- Name: program_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.program_translations (
    id bigint NOT NULL,
    program_id bigint NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name text
);


--
-- TOC entry 272 (class 1259 OID 26455)
-- Name: program_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.program_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 272
-- Name: program_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.program_translations_id_seq OWNED BY public.program_translations.id;


--
-- TOC entry 273 (class 1259 OID 26456)
-- Name: programs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    subject_id bigint
);


--
-- TOC entry 274 (class 1259 OID 26459)
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 274
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- TOC entry 275 (class 1259 OID 26460)
-- Name: quiz_certificates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quiz_certificates (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    quiz_id bigint NOT NULL,
    user_id bigint,
    code text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 276 (class 1259 OID 26466)
-- Name: readers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.readers (
    id bigint NOT NULL,
    user_id integer,
    thread_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 277 (class 1259 OID 26469)
-- Name: readers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.readers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 277
-- Name: readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.readers_id_seq OWNED BY public.readers.id;


--
-- TOC entry 278 (class 1259 OID 26470)
-- Name: referrals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.referrals (
    id bigint NOT NULL,
    start_time text,
    end_time text,
    explanation text,
    item_id bigint,
    medium_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 279 (class 1259 OID 26475)
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 279
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
-- TOC entry 280 (class 1259 OID 26476)
-- Name: relations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.relations (
    id bigint NOT NULL,
    tag_id integer,
    related_tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 281 (class 1259 OID 26479)
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 281
-- Name: relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.relations_id_seq OWNED BY public.relations.id;


--
-- TOC entry 282 (class 1259 OID 26480)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 283 (class 1259 OID 26485)
-- Name: section_tag_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.section_tag_joins (
    id bigint NOT NULL,
    section_id integer,
    tag_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tag_position integer
);


--
-- TOC entry 284 (class 1259 OID 26488)
-- Name: section_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.section_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 284
-- Name: section_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.section_tag_joins_id_seq OWNED BY public.section_tag_joins.id;


--
-- TOC entry 285 (class 1259 OID 26489)
-- Name: sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sections (
    id bigint NOT NULL,
    chapter_id integer,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    display_number text,
    hidden boolean,
    tags_order text,
    details text
);


--
-- TOC entry 286 (class 1259 OID 26494)
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 286
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- TOC entry 355 (class 1259 OID 27252)
-- Name: speaker_talk_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.speaker_talk_joins (
    id bigint NOT NULL,
    talk_id bigint NOT NULL,
    speaker_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 354 (class 1259 OID 27251)
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.speaker_talk_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 354
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.speaker_talk_joins_id_seq OWNED BY public.speaker_talk_joins.id;


--
-- TOC entry 287 (class 1259 OID 26495)
-- Name: subject_translations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subject_translations (
    id bigint NOT NULL,
    subject_id bigint NOT NULL,
    locale character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name text
);


--
-- TOC entry 288 (class 1259 OID 26500)
-- Name: subject_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subject_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 288
-- Name: subject_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subject_translations_id_seq OWNED BY public.subject_translations.id;


--
-- TOC entry 289 (class 1259 OID 26501)
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 290 (class 1259 OID 26504)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 290
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 291 (class 1259 OID 26505)
-- Name: submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submissions (
    tutorial_id bigint NOT NULL,
    assignment_id bigint NOT NULL,
    token text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    manuscript_data text,
    invited_user_ids integer[] DEFAULT '{}'::integer[],
    correction_data text,
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    last_modification_by_users_at timestamp without time zone,
    accepted boolean
);


--
-- TOC entry 292 (class 1259 OID 26513)
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    realizations text
);


--
-- TOC entry 293 (class 1259 OID 26518)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 293
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 361 (class 1259 OID 27313)
-- Name: talk_tag_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talk_tag_joins (
    id bigint NOT NULL,
    talk_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 360 (class 1259 OID 27312)
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talk_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 360
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talk_tag_joins_id_seq OWNED BY public.talk_tag_joins.id;


--
-- TOC entry 353 (class 1259 OID 27239)
-- Name: talks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.talks (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title text,
    "position" integer,
    details text,
    dates date[] DEFAULT '{}'::date[],
    description text,
    display_description boolean DEFAULT false
);


--
-- TOC entry 352 (class 1259 OID 27238)
-- Name: talks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 352
-- Name: talks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talks_id_seq OWNED BY public.talks.id;


--
-- TOC entry 294 (class 1259 OID 26519)
-- Name: terms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.terms (
    id bigint NOT NULL,
    year integer,
    season character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean DEFAULT false,
    submission_deletion_mail timestamp without time zone,
    submission_deletion_reminder timestamp without time zone,
    submissions_deleted_at timestamp without time zone
);


--
-- TOC entry 295 (class 1259 OID 26525)
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 295
-- Name: terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.terms_id_seq OWNED BY public.terms.id;


--
-- TOC entry 296 (class 1259 OID 26526)
-- Name: thredded_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_categories (
    id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    name text NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug text NOT NULL
);


--
-- TOC entry 297 (class 1259 OID 26531)
-- Name: thredded_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 297
-- Name: thredded_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_categories_id_seq OWNED BY public.thredded_categories.id;


--
-- TOC entry 298 (class 1259 OID 26532)
-- Name: thredded_messageboard_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_groups (
    id bigint NOT NULL,
    name character varying,
    "position" integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 299 (class 1259 OID 26537)
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 299
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_groups_id_seq OWNED BY public.thredded_messageboard_groups.id;


--
-- TOC entry 300 (class 1259 OID 26538)
-- Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 301 (class 1259 OID 26542)
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 301
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq OWNED BY public.thredded_messageboard_notifications_for_followed_topics.id;


--
-- TOC entry 302 (class 1259 OID 26543)
-- Name: thredded_messageboard_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_users (
    id bigint NOT NULL,
    thredded_user_detail_id bigint NOT NULL,
    thredded_messageboard_id bigint NOT NULL,
    last_seen_at timestamp without time zone NOT NULL
);


--
-- TOC entry 303 (class 1259 OID 26546)
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 303
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_users_id_seq OWNED BY public.thredded_messageboard_users.id;


--
-- TOC entry 304 (class 1259 OID 26547)
-- Name: thredded_messageboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboards (
    id bigint NOT NULL,
    name text NOT NULL,
    slug text,
    description text,
    topics_count integer DEFAULT 0,
    posts_count integer DEFAULT 0,
    "position" integer NOT NULL,
    last_topic_id bigint,
    messageboard_group_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    locked boolean DEFAULT false NOT NULL
);


--
-- TOC entry 305 (class 1259 OID 26555)
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 305
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboards_id_seq OWNED BY public.thredded_messageboards.id;


--
-- TOC entry 306 (class 1259 OID 26556)
-- Name: thredded_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 307 (class 1259 OID 26560)
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 307
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_notifications_for_followed_topics_id_seq OWNED BY public.thredded_notifications_for_followed_topics.id;


--
-- TOC entry 308 (class 1259 OID 26561)
-- Name: thredded_notifications_for_private_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_private_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 309 (class 1259 OID 26565)
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_notifications_for_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 309
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_notifications_for_private_topics_id_seq OWNED BY public.thredded_notifications_for_private_topics.id;


--
-- TOC entry 310 (class 1259 OID 26566)
-- Name: thredded_post_moderation_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_post_moderation_records (
    id bigint NOT NULL,
    post_id bigint,
    messageboard_id bigint,
    post_content text,
    post_user_id bigint,
    post_user_name text,
    moderator_id bigint,
    moderation_state integer NOT NULL,
    previous_moderation_state integer NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- TOC entry 311 (class 1259 OID 26571)
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_post_moderation_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 311
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_post_moderation_records_id_seq OWNED BY public.thredded_post_moderation_records.id;


--
-- TOC entry 312 (class 1259 OID 26572)
-- Name: thredded_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_posts (
    id bigint NOT NULL,
    user_id bigint,
    content text,
    source character varying(191) DEFAULT 'web'::character varying,
    postable_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    moderation_state integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 313 (class 1259 OID 26578)
-- Name: thredded_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 313
-- Name: thredded_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_posts_id_seq OWNED BY public.thredded_posts.id;


--
-- TOC entry 314 (class 1259 OID 26579)
-- Name: thredded_private_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_private_posts (
    id bigint NOT NULL,
    user_id bigint,
    content text,
    postable_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 315 (class 1259 OID 26584)
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 315
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_posts_id_seq OWNED BY public.thredded_private_posts.id;


--
-- TOC entry 316 (class 1259 OID 26585)
-- Name: thredded_private_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_private_topics (
    id bigint NOT NULL,
    user_id bigint,
    last_user_id bigint,
    title text NOT NULL,
    slug text NOT NULL,
    posts_count integer DEFAULT 0,
    hash_id character varying(20) NOT NULL,
    last_post_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 317 (class 1259 OID 26591)
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 317
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_topics_id_seq OWNED BY public.thredded_private_topics.id;


--
-- TOC entry 318 (class 1259 OID 26592)
-- Name: thredded_private_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_private_users (
    id bigint NOT NULL,
    private_topic_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 319 (class 1259 OID 26595)
-- Name: thredded_private_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 319
-- Name: thredded_private_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_users_id_seq OWNED BY public.thredded_private_users.id;


--
-- TOC entry 320 (class 1259 OID 26596)
-- Name: thredded_topic_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_topic_categories (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 26599)
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_topic_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 321
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_topic_categories_id_seq OWNED BY public.thredded_topic_categories.id;


--
-- TOC entry 322 (class 1259 OID 26600)
-- Name: thredded_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_topics (
    id bigint NOT NULL,
    user_id bigint,
    last_user_id bigint,
    title text NOT NULL,
    slug text NOT NULL,
    messageboard_id bigint NOT NULL,
    posts_count integer DEFAULT 0 NOT NULL,
    sticky boolean DEFAULT false NOT NULL,
    locked boolean DEFAULT false NOT NULL,
    hash_id character varying(20) NOT NULL,
    moderation_state integer NOT NULL,
    last_post_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 323 (class 1259 OID 26608)
-- Name: thredded_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 323
-- Name: thredded_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_topics_id_seq OWNED BY public.thredded_topics.id;


--
-- TOC entry 324 (class 1259 OID 26609)
-- Name: thredded_user_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_details (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    latest_activity_at timestamp without time zone,
    posts_count integer DEFAULT 0,
    topics_count integer DEFAULT 0,
    last_seen_at timestamp without time zone,
    moderation_state integer DEFAULT 0 NOT NULL,
    moderation_state_changed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 325 (class 1259 OID 26615)
-- Name: thredded_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 325
-- Name: thredded_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_details_id_seq OWNED BY public.thredded_user_details.id;


--
-- TOC entry 326 (class 1259 OID 26616)
-- Name: thredded_user_messageboard_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_messageboard_preferences (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    follow_topics_on_mention boolean DEFAULT true NOT NULL,
    auto_follow_topics boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 327 (class 1259 OID 26621)
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_messageboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 327
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_messageboard_preferences_id_seq OWNED BY public.thredded_user_messageboard_preferences.id;


--
-- TOC entry 328 (class 1259 OID 26622)
-- Name: thredded_user_post_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_post_notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    notified_at timestamp without time zone NOT NULL
);


--
-- TOC entry 329 (class 1259 OID 26625)
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_post_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 329
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_post_notifications_id_seq OWNED BY public.thredded_user_post_notifications.id;


--
-- TOC entry 330 (class 1259 OID 26626)
-- Name: thredded_user_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_preferences (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    follow_topics_on_mention boolean DEFAULT true NOT NULL,
    auto_follow_topics boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 331 (class 1259 OID 26631)
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 331
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_preferences_id_seq OWNED BY public.thredded_user_preferences.id;


--
-- TOC entry 332 (class 1259 OID 26632)
-- Name: thredded_user_private_topic_read_states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_private_topic_read_states (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    postable_id bigint NOT NULL,
    unread_posts_count integer DEFAULT 0 NOT NULL,
    read_posts_count integer DEFAULT 0 NOT NULL,
    "integer" integer DEFAULT 0 NOT NULL,
    read_at timestamp without time zone NOT NULL
);


--
-- TOC entry 333 (class 1259 OID 26638)
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_private_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 333
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_private_topic_read_states_id_seq OWNED BY public.thredded_user_private_topic_read_states.id;


--
-- TOC entry 334 (class 1259 OID 26639)
-- Name: thredded_user_topic_follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_topic_follows (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    topic_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    reason smallint
);


--
-- TOC entry 335 (class 1259 OID 26642)
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_topic_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 335
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_topic_follows_id_seq OWNED BY public.thredded_user_topic_follows.id;


--
-- TOC entry 336 (class 1259 OID 26643)
-- Name: thredded_user_topic_read_states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_topic_read_states (
    id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    user_id bigint NOT NULL,
    postable_id bigint NOT NULL,
    unread_posts_count integer DEFAULT 0 NOT NULL,
    read_posts_count integer DEFAULT 0 NOT NULL,
    "integer" integer DEFAULT 0 NOT NULL,
    read_at timestamp without time zone NOT NULL
);


--
-- TOC entry 337 (class 1259 OID 26649)
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 337
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_topic_read_states_id_seq OWNED BY public.thredded_user_topic_read_states.id;


--
-- TOC entry 338 (class 1259 OID 26650)
-- Name: tutor_tutorial_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tutor_tutorial_joins (
    id bigint NOT NULL,
    tutorial_id bigint NOT NULL,
    tutor_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 339 (class 1259 OID 26653)
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tutor_tutorial_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 339
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tutor_tutorial_joins_id_seq OWNED BY public.tutor_tutorial_joins.id;


--
-- TOC entry 340 (class 1259 OID 26654)
-- Name: tutorials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tutorials (
    id bigint NOT NULL,
    title text,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 341 (class 1259 OID 26659)
-- Name: tutorials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tutorials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 341
-- Name: tutorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tutorials_id_seq OWNED BY public.tutorials.id;


--
-- TOC entry 342 (class 1259 OID 26660)
-- Name: user_favorite_lecture_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_favorite_lecture_joins (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 343 (class 1259 OID 26663)
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_favorite_lecture_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 343
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_favorite_lecture_joins_id_seq OWNED BY public.user_favorite_lecture_joins.id;


--
-- TOC entry 344 (class 1259 OID 26664)
-- Name: user_submission_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_submission_joins (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    submission_id uuid
);


--
-- TOC entry 345 (class 1259 OID 26667)
-- Name: user_submission_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_submission_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 345
-- Name: user_submission_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_submission_joins_id_seq OWNED BY public.user_submission_joins.id;


--
-- TOC entry 346 (class 1259 OID 26668)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean,
    subscription_type integer,
    consents boolean,
    consented_at timestamp without time zone,
    name text,
    homepage text,
    no_notifications boolean DEFAULT false,
    locale text,
    email_for_medium boolean,
    email_for_announcement boolean,
    email_for_teachable boolean,
    email_for_news boolean,
    current_lecture_id integer,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    unread_comments boolean DEFAULT false,
    study_participant boolean DEFAULT false,
    email_for_submission_upload boolean,
    email_for_submission_removal boolean,
    email_for_submission_join boolean,
    email_for_submission_leave boolean,
    email_for_correction_upload boolean,
    email_for_submission_decision boolean,
    name_in_tutorials text,
    archived boolean,
    locked_at timestamp without time zone,
    image_data text
);


--
-- TOC entry 347 (class 1259 OID 26678)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 347
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 348 (class 1259 OID 26679)
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes (
    id bigint NOT NULL,
    votable_type character varying,
    votable_id bigint,
    voter_type character varying,
    voter_id bigint,
    vote_flag boolean,
    vote_scope character varying,
    vote_weight integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 349 (class 1259 OID 26684)
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 349
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- TOC entry 350 (class 1259 OID 26685)
-- Name: vtt_containers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vtt_containers (
    id bigint NOT NULL,
    table_of_contents_data text,
    references_data text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 351 (class 1259 OID 26690)
-- Name: vtt_containers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vtt_containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 351
-- Name: vtt_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vtt_containers_id_seq OWNED BY public.vtt_containers.id;


--
-- TOC entry 359 (class 1259 OID 27282)
-- Name: watchlist_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.watchlist_entries (
    id bigint NOT NULL,
    watchlist_id bigint NOT NULL,
    medium_id bigint NOT NULL,
    medium_position integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 358 (class 1259 OID 27281)
-- Name: watchlist_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchlist_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 358
-- Name: watchlist_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchlist_entries_id_seq OWNED BY public.watchlist_entries.id;


--
-- TOC entry 357 (class 1259 OID 27275)
-- Name: watchlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.watchlists (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    watchlist_entry_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    name character varying,
    public boolean DEFAULT false,
    description character varying
);


--
-- TOC entry 356 (class 1259 OID 27274)
-- Name: watchlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 356
-- Name: watchlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchlists_id_seq OWNED BY public.watchlists.id;


--
-- TOC entry 3586 (class 2604 OID 26691)
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- TOC entry 3587 (class 2604 OID 26692)
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 26693)
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- TOC entry 3591 (class 2604 OID 26694)
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- TOC entry 3592 (class 2604 OID 26695)
-- Name: clicker_votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clicker_votes ALTER COLUMN id SET DEFAULT nextval('public.clicker_votes_id_seq'::regclass);


--
-- TOC entry 3593 (class 2604 OID 26696)
-- Name: clickers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clickers ALTER COLUMN id SET DEFAULT nextval('public.clickers_id_seq'::regclass);


--
-- TOC entry 3596 (class 2604 OID 26697)
-- Name: commontator_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments ALTER COLUMN id SET DEFAULT nextval('public.commontator_comments_id_seq'::regclass);


--
-- TOC entry 3597 (class 2604 OID 26698)
-- Name: commontator_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.commontator_subscriptions_id_seq'::regclass);


--
-- TOC entry 3598 (class 2604 OID 26699)
-- Name: commontator_threads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads ALTER COLUMN id SET DEFAULT nextval('public.commontator_threads_id_seq'::regclass);


--
-- TOC entry 3599 (class 2604 OID 26700)
-- Name: course_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins ALTER COLUMN id SET DEFAULT nextval('public.course_self_joins_id_seq'::regclass);


--
-- TOC entry 3600 (class 2604 OID 26701)
-- Name: course_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.course_tag_joins_id_seq'::regclass);


--
-- TOC entry 3602 (class 2604 OID 26703)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 3603 (class 2604 OID 26704)
-- Name: division_course_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins ALTER COLUMN id SET DEFAULT nextval('public.division_course_joins_id_seq'::regclass);


--
-- TOC entry 3604 (class 2604 OID 26705)
-- Name: division_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations ALTER COLUMN id SET DEFAULT nextval('public.division_translations_id_seq'::regclass);


--
-- TOC entry 3605 (class 2604 OID 26706)
-- Name: divisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions ALTER COLUMN id SET DEFAULT nextval('public.divisions_id_seq'::regclass);


--
-- TOC entry 3606 (class 2604 OID 26707)
-- Name: editable_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins ALTER COLUMN id SET DEFAULT nextval('public.editable_user_joins_id_seq'::regclass);


--
-- TOC entry 3607 (class 2604 OID 26708)
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- TOC entry 3608 (class 2604 OID 26709)
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- TOC entry 3609 (class 2604 OID 26710)
-- Name: item_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins ALTER COLUMN id SET DEFAULT nextval('public.item_self_joins_id_seq'::regclass);


--
-- TOC entry 3610 (class 2604 OID 26711)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3611 (class 2604 OID 26712)
-- Name: lecture_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins ALTER COLUMN id SET DEFAULT nextval('public.lecture_user_joins_id_seq'::regclass);


--
-- TOC entry 3614 (class 2604 OID 26713)
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lectures_id_seq'::regclass);


--
-- TOC entry 3616 (class 2604 OID 26714)
-- Name: lesson_section_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_section_joins_id_seq'::regclass);


--
-- TOC entry 3617 (class 2604 OID 26715)
-- Name: lesson_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_tag_joins_id_seq'::regclass);


--
-- TOC entry 3618 (class 2604 OID 26716)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 26717)
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- TOC entry 3622 (class 2604 OID 26718)
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- TOC entry 3623 (class 2604 OID 26719)
-- Name: medium_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.medium_tag_joins_id_seq'::regclass);


--
-- TOC entry 3624 (class 2604 OID 26720)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3625 (class 2604 OID 26721)
-- Name: notions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions ALTER COLUMN id SET DEFAULT nextval('public.notions_id_seq'::regclass);


--
-- TOC entry 3626 (class 2604 OID 26722)
-- Name: program_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations ALTER COLUMN id SET DEFAULT nextval('public.program_translations_id_seq'::regclass);


--
-- TOC entry 3627 (class 2604 OID 26723)
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- TOC entry 3629 (class 2604 OID 26724)
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- TOC entry 3630 (class 2604 OID 26725)
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- TOC entry 3631 (class 2604 OID 26726)
-- Name: relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations ALTER COLUMN id SET DEFAULT nextval('public.relations_id_seq'::regclass);


--
-- TOC entry 3632 (class 2604 OID 26727)
-- Name: section_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.section_tag_joins_id_seq'::regclass);


--
-- TOC entry 3633 (class 2604 OID 26728)
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- TOC entry 3701 (class 2604 OID 27255)
-- Name: speaker_talk_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins ALTER COLUMN id SET DEFAULT nextval('public.speaker_talk_joins_id_seq'::regclass);


--
-- TOC entry 3634 (class 2604 OID 26729)
-- Name: subject_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations ALTER COLUMN id SET DEFAULT nextval('public.subject_translations_id_seq'::regclass);


--
-- TOC entry 3635 (class 2604 OID 26730)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 3638 (class 2604 OID 26732)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3705 (class 2604 OID 27316)
-- Name: talk_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.talk_tag_joins_id_seq'::regclass);


--
-- TOC entry 3698 (class 2604 OID 27242)
-- Name: talks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks ALTER COLUMN id SET DEFAULT nextval('public.talks_id_seq'::regclass);


--
-- TOC entry 3640 (class 2604 OID 26733)
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- TOC entry 3641 (class 2604 OID 26734)
-- Name: thredded_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_categories_id_seq'::regclass);


--
-- TOC entry 3642 (class 2604 OID 26735)
-- Name: thredded_messageboard_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_groups_id_seq'::regclass);


--
-- TOC entry 3644 (class 2604 OID 26736)
-- Name: thredded_messageboard_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_notifications_for_followed_topics_id_seq'::regclass);


--
-- TOC entry 3645 (class 2604 OID 26737)
-- Name: thredded_messageboard_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_users_id_seq'::regclass);


--
-- TOC entry 3649 (class 2604 OID 26738)
-- Name: thredded_messageboards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboards_id_seq'::regclass);


--
-- TOC entry 3651 (class 2604 OID 26739)
-- Name: thredded_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_followed_topics_id_seq'::regclass);


--
-- TOC entry 3653 (class 2604 OID 26740)
-- Name: thredded_notifications_for_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_private_topics_id_seq'::regclass);


--
-- TOC entry 3654 (class 2604 OID 26741)
-- Name: thredded_post_moderation_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records ALTER COLUMN id SET DEFAULT nextval('public.thredded_post_moderation_records_id_seq'::regclass);


--
-- TOC entry 3656 (class 2604 OID 26742)
-- Name: thredded_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_posts_id_seq'::regclass);


--
-- TOC entry 3657 (class 2604 OID 26743)
-- Name: thredded_private_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_posts_id_seq'::regclass);


--
-- TOC entry 3659 (class 2604 OID 26744)
-- Name: thredded_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_topics_id_seq'::regclass);


--
-- TOC entry 3660 (class 2604 OID 26745)
-- Name: thredded_private_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_users_id_seq'::regclass);


--
-- TOC entry 3661 (class 2604 OID 26746)
-- Name: thredded_topic_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_topic_categories_id_seq'::regclass);


--
-- TOC entry 3665 (class 2604 OID 26747)
-- Name: thredded_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_topics_id_seq'::regclass);


--
-- TOC entry 3669 (class 2604 OID 26748)
-- Name: thredded_user_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_details_id_seq'::regclass);


--
-- TOC entry 3672 (class 2604 OID 26749)
-- Name: thredded_user_messageboard_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_messageboard_preferences_id_seq'::regclass);


--
-- TOC entry 3673 (class 2604 OID 26750)
-- Name: thredded_user_post_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_post_notifications_id_seq'::regclass);


--
-- TOC entry 3676 (class 2604 OID 26751)
-- Name: thredded_user_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_preferences_id_seq'::regclass);


--
-- TOC entry 3680 (class 2604 OID 26752)
-- Name: thredded_user_private_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_private_topic_read_states_id_seq'::regclass);


--
-- TOC entry 3681 (class 2604 OID 26753)
-- Name: thredded_user_topic_follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_follows_id_seq'::regclass);


--
-- TOC entry 3685 (class 2604 OID 26754)
-- Name: thredded_user_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_read_states_id_seq'::regclass);


--
-- TOC entry 3686 (class 2604 OID 26755)
-- Name: tutor_tutorial_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins ALTER COLUMN id SET DEFAULT nextval('public.tutor_tutorial_joins_id_seq'::regclass);


--
-- TOC entry 3687 (class 2604 OID 26756)
-- Name: tutorials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials ALTER COLUMN id SET DEFAULT nextval('public.tutorials_id_seq'::regclass);


--
-- TOC entry 3688 (class 2604 OID 26757)
-- Name: user_favorite_lecture_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins ALTER COLUMN id SET DEFAULT nextval('public.user_favorite_lecture_joins_id_seq'::regclass);


--
-- TOC entry 3689 (class 2604 OID 26758)
-- Name: user_submission_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins ALTER COLUMN id SET DEFAULT nextval('public.user_submission_joins_id_seq'::regclass);


--
-- TOC entry 3695 (class 2604 OID 26759)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3696 (class 2604 OID 26760)
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- TOC entry 3697 (class 2604 OID 26761)
-- Name: vtt_containers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vtt_containers ALTER COLUMN id SET DEFAULT nextval('public.vtt_containers_id_seq'::regclass);


--
-- TOC entry 3704 (class 2604 OID 27285)
-- Name: watchlist_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries ALTER COLUMN id SET DEFAULT nextval('public.watchlist_entries_id_seq'::regclass);


--
-- TOC entry 3702 (class 2604 OID 27278)
-- Name: watchlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists ALTER COLUMN id SET DEFAULT nextval('public.watchlists_id_seq'::regclass);


--
-- TOC entry 4188 (class 0 OID 26274)
-- Dependencies: 210
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, lecture_id, announcer_id, details, created_at, updated_at, on_main_page) FROM stdin;
1	\N	1	<div>Das ist die Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:13:06.111759	2020-07-24 13:13:06.111759	f
2	1	2	<div>Das ist eine Mitteilung für die LA2 in der Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:40:47.403705	2020-07-24 13:40:47.403705	f
3	27	2	<div>Today's session is cancelled due to a corona infection of the speaker.</div>	2022-08-05 14:24:49.642445	2022-08-05 14:24:49.642445	f
4	\N	1	<div>Mampf will be down from 5pm to 7pm this afternoon.</div>	2022-08-05 14:26:46.610612	2022-08-05 14:26:46.610612	t
\.


--
-- TOC entry 4190 (class 0 OID 26281)
-- Dependencies: 212
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.answers (id, text, value, explanation, created_at, updated_at, question_id) FROM stdin;
1	In einem Körper ist das Nullideal das einzige Primideal.	t	In jedem Körper ist das Nullideal ein Primideal, da ein Körper stets nullteilerfrei ist. Da ein Körper außerdem nur die zwei Ideale $(0),(1)$ hat und $(1)$ per Definition kein Primideal ist, stimmt die Behauptung. 	2020-07-24 16:02:04.608443	2020-07-24 16:02:33.384053	17
2	Ein Körper enthält keine Primideale.	f	In jedem Körper ist das Nullideal ein Primideal, da ein Körper stets nullteilerfrei ist.	2020-07-24 16:02:53.498406	2020-07-24 16:02:53.498406	17
3	Ein Körper kann mehrere Primideale enthalten.	f	Da ein Körper nur die zwei Ideale $(0),(1)$ hat und $(1)$ per Definition kein Primideal ist, ist die Behauptung falsch. 	2020-07-24 16:03:12.154853	2020-07-24 16:03:12.154853	17
4	In einem Körper ist der Körper selbst das einzige Primideal.	f	Der ganze Ring selbst ist per Definition niemals ein Primideal.	2020-07-24 16:03:28.363441	2020-07-24 16:03:28.363441	17
32	$a \\in I.$	f	Ein konkretes Gegenbeispiel wäre $I = 2\\mathbb{Z},$ $x =2, y= 6.$ In diesem Fall gilt $a=3 \\notin I.$	2020-07-24 16:24:00.93104	2020-07-24 16:24:00.93104	28
5	$(1)$  ist ein Primideal in $\\mathbb Z$.	f	Das Ideal $(1)$ ist der Ring $\\mathbb{Z}$ selbst, per Defintion ist das kein Primideal.	2020-07-24 16:04:00.252568	2020-07-24 16:04:58.884251	18
6	$8\\mathbb Z$ ist ein Primideal in $\\mathbb Z$.	f	Es ist $8=2\\cdot 4\\in 8\\mathbb{Z}$, aber weder $2$ noch $4$ liegen in $8\\mathbb{Z}$.	2020-07-24 16:05:13.668016	2020-07-24 16:05:13.668016	18
7	$\\mathbb Z$  ist ein Primideal in $\\mathbb Z$.	f	Per Definition ist der Ring selbst kein Primideal.	2020-07-24 16:05:28.380608	2020-07-24 16:05:28.380608	18
8	$17\\mathbb Z$  ist ein Primideal in $\\mathbb Z$.	t	In der Vorlesung wurde gezeigt, dass die Primideal in $\\mathbb{Z}$ genau von der Form $p\\mathbb{Z}$ für eine Primzahl $p$ bzw. $(0)$ sind.	2020-07-24 16:05:42.721872	2020-07-24 16:05:42.721872	18
9	$\\frac 1 2 \\mathbb Z$ ist ein Primideal in $\\mathbb Q$.	f	$\\frac{1}{2}\\mathbb{Z}$ ist nicht einmal ein Ideal in $\\mathbb{Q}$, denn $\\frac{1}{2}\\in\\frac{1}{2}\\mathbb{Z}$ und $\\frac{2}{3}\\in\\mathbb{Q}$, aber $\\frac{2}{3}\\cdot\\frac{1}{2}=\\frac{1}{3}\\not\\in\\frac{1}{2}\\mathbb{Z}$.	2020-07-24 16:06:37.9578	2020-07-24 16:07:11.111097	19
10	$\\mathbb Q$ ist ein Primideal in $\\mathbb Q$.	f	Der Ring selbst ist nach Definition kein Primideal.	2020-07-24 16:07:25.29407	2020-07-24 16:07:25.29407	19
11	$\\{0\\}$ ist ein Primideal in $\\mathbb Q$.	t	Als Körper ist $\\mathbb{Q}=\\mathbb{Q}/\\{0\\}$ nullteilerfrei, und deshalb ist $\\{0\\}$ ein Primideal in $\\mathbb{Q}$.	2020-07-24 16:07:40.116905	2020-07-24 16:07:40.116905	19
12	$17\\mathbb Q$ ist ein Primideal in $\\mathbb Q$.	f	Es ist $17\\mathbb{Q}=\\mathbb{Q}$, der Ring selbst ist nach Definition kein Primideal.	2020-07-24 16:07:56.768941	2020-07-24 16:07:56.768941	19
13	$2\\mathbb Z$	t	Es ist $\\mathbb{Z}/2\\mathbb{Z}$ ein Körper und deshalb $2\\mathbb{Z}$ ein maximales Ideal in $\\mathbb{Z}$.	2020-07-24 16:08:26.020582	2020-07-24 16:08:57.292247	20
14	$\\{0\\}$	f	Das Ideal $\\{0\\}$ ist echt enthalten im Ideal $3\\mathbb{Z}$, welches selbst von $\\mathbb{Z}$ verschieden ist. $\\{0\\}$ kann demzufolge kein maximales Ideal in $\\mathbb{Z}$ sein.	2020-07-24 16:09:12.548245	2020-07-24 16:09:12.548245	20
15	$\\mathbb Z$	f	Der Ring selbst ist nach Definition kein maximales Ideal.	2020-07-24 16:09:32.320309	2020-07-24 16:09:32.320309	20
16	$4\\mathbb Z$	f	Es ist $4\\mathbb{Z}\\subsetneqq 2\\mathbb{Z}\\subsetneqq\\mathbb{Z}$, weswegen $4\\mathbb{Z}$ kein maximales Ideal sein kann.	2020-07-24 16:09:45.30176	2020-07-24 16:09:45.30176	20
17	$(X)\\subseteq K[X]$	t	Es ist $K[X]/(X)\\cong K$ (indem man den Homomorphiesatz auf den surjektiven Ringhomomorphismus $K[X]\\to K,f\\mapsto f(0)$, welcher als Kern genau $(X)$ hat, anwendet). Insbesondere ist $K[X]/(X)$ ein Körper und damit nullteilerfrei, so dass $(X)$ ein Primideal ist.  	2020-07-24 16:10:17.994164	2020-07-24 16:10:57.854301	21
18	 $(X^2)\\subseteq K[X]$	f	Es ist $X^2=X\\cdot X\\in (X^2)$. Außerdem ist $X\\not\\in(X^2)$, denn jedes von Null verschiedene Vielfache von $X^2$ hat mindestens Grad $2$. Damit kann $(X^2)$ kein Primideal sein.	2020-07-24 16:11:17.081679	2020-07-24 16:11:17.081679	21
19	 $(a)\\subseteq K[X]$	f	Es ist $(1)=K[X]$, und der Ring selbst ist per Definition kein Primideal.	2020-07-24 16:11:31.266971	2020-07-24 16:11:31.266971	21
20	$\\{0\\}$	t	Die Idealaxiome sind trivialerweise erfüllt.	2020-07-24 16:17:11.062443	2020-07-24 16:17:39.011507	24
21	$2\\mathbb{Z} + 3\\mathbb{Z} = \\{2a+3b \\mid a,b \\in \\mathbb{Z}\\}$	t	Die Summe zweier Ideale ist wieder ein Ideal.	2020-07-24 16:17:56.489268	2020-07-24 16:17:56.489268	24
22	$3+4\\mathbb{Z} = \\{3+4a \\mid a \\in \\mathbb{Z}\\} $	f	Diese Menge ist kein Ideal, da $0$ nicht enthalten ist. 	2020-07-24 16:18:12.471392	2020-07-24 16:18:12.471392	24
23	$2$ ist ein Element von $I$ und ist das Element von kleinstem Betrag, welches von  $0$ verschieden ist. 	t	Es gilt $2 = (-1)\\cdot4+6 \\in I.$ Ferner ist $ \\pm 1 \\notin I,$ da jedes Element von $I$ gerade sein muss.	2020-07-24 16:18:57.007414	2020-07-24 16:19:25.796383	25
24	12 ist ein Erzeuger von $I$.	f	Wäre $12$ ein Erzeuger, so wären alle Elemente von $I$ durch $12$ teilbar. Offenbar sind z.B. $4,6 \\in I$ nicht durch $12$ teilbar.	2020-07-24 16:19:43.618739	2020-07-24 16:19:43.618739	25
25	12 ist das kleinste gemeinsame Vielfache von $4$ und $6.$	t	Das folgt aus $4 = 2^2$ und $6 = 2\\cdot 3.$ Dann ist $\\operatorname{kgV}(4,6) = 2^2\\cdot 3 = 12.$	2020-07-24 16:20:05.881365	2020-07-24 16:20:05.881365	25
26	2 ist ein Erzeuger von $I.$	t	$2$ ist ein Element von $I$ und sowohl $4$ als auch $6$ liegen im von $2$ erzeugten Ideal.	2020-07-24 16:20:21.274453	2020-07-24 16:20:21.274453	25
27	Wenn $y \\in I,$ dann gilt $\\lvert y\\rvert \\in I.$	t	Falls $y$ positiv ist, ist die Aussage trivialerweise Wahr. Wenn $y$ nicht positiv ist, dann gilt $\\lvert y\\rvert = -y = (-1)\\cdot y\\in I.$ 	2020-07-24 16:20:48.62998	2020-07-24 16:21:28.771939	26
28	Für $0\\neq y \\in \\mathbb{Z}$ ist $\\lvert y\\rvert \\in \\mathbb{N}.$	t	In diesem Fall ist $\\lvert y\\rvert$ eine positive ganze Zahl, also eine natürliche Zahl.	2020-07-24 16:21:43.692376	2020-07-24 16:21:43.692376	26
29	Das Nullideal  $\\{0\\} $ wird von einem Element erzeugt.	t	$0$ ist ein Erzeuger.	2020-07-24 16:21:58.394179	2020-07-24 16:21:58.394179	26
30	Jedes Ideal in $\\mathbb{Z}$ enthält ein Element von $\\mathbb{N}.$	f	Das Nullideal $\\{0\\}$ enthält keine natürliche Zahl.	2020-07-24 16:22:13.192145	2020-07-24 16:22:13.192145	26
31	$r=0.$	t	Wäre $r\\neq 0,$ so wäre $r$ eine natürliche Zahl in $I,$ welche strikt kleiner $x$ ist. Ein Widerspruch zu der Voraussetzung. 	2020-07-24 16:23:22.739698	2020-07-24 16:23:45.905527	28
33	$r \\in I.$	t	Es gilt $r = y-ax.$ Da $y \\in I$ und $x \\in I$ ist auch $y-ax \\in I.$ 	2020-07-24 16:24:14.586751	2020-07-24 16:24:14.586751	28
34	für alle $a\\in I$ und $r\\in R$ stets $ra\\in I$ ist.	t	Das ergibt sich aus der Definition eines Ideals.	2020-07-24 16:30:41.535269	2020-07-24 16:32:45.768218	31
35	für alle $a,b\\in I$ stets $ab\\in I$ ist.	f	Dann wäre $\\mathbb{Z}$ ein Ideal in $\\mathbb{Q}$. Iste es aber nicht.	2020-07-24 16:33:51.338492	2020-07-24 16:33:51.338492	31
36	$(1, t-2, \\left(t-2\\right)^{2}, \\left(t-2\\right)^{3} \\cdot \\left(t-3\\right))$	t		2020-07-24 16:43:21.37894	2020-07-24 16:44:05.090855	34
37	$\\left(t-2\\right)^{3} \\cdot \\left(t-3\\right)^{2}$	t	Es ist $d_5(A)=c_1(A)\\cdot\\ldots\\cdot c_5(A)$ und $d_5(A)=\\chi^{\\operatorname{char}}_A$.	2020-07-24 16:44:51.30828	2020-07-24 16:45:36.13915	35
38	$(1, 1, t-2, t-2, t-2, \\left(t-2\\right)^{2} \\cdot \\left(t-3\\right))$	t		2020-07-24 16:46:02.121546	2020-07-24 16:47:12.301033	36
39	$\\begin{pmatrix}0 & -9 & 0 & 0 \\cr 1 & 6 & 0 & 0 \\cr 0 & 0 & 0 & -9 \\cr 0 & 0 & 1 & 6\\end{pmatrix}$	t		2020-07-24 16:48:30.077745	2020-07-24 16:49:20.967593	37
\.


--
-- TOC entry 4192 (class 0 OID 26287)
-- Dependencies: 214
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	docker_development	2020-07-24 13:03:53.932392	2020-07-24 13:03:53.932392
\.


--
-- TOC entry 4193 (class 0 OID 26292)
-- Dependencies: 215
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments (id, lecture_id, medium_id, title, deadline, created_at, updated_at, accepted_file_type, deletion_date) FROM stdin;
1	1	12	Blatt 4	2020-11-28 16:50:00	2020-11-28 16:32:30.987364	2020-11-28 16:49:59.902518	.pdf	2020-10-15
2	1	45	Blatt 5	2021-03-28 16:00:00	2020-11-28 16:54:41.933526	2020-11-28 16:54:41.933526	.pdf	2020-10-15
3	1	12	Blatt 6	2022-08-07 17:00:00	2022-08-05 14:49:41.819884	2022-08-05 14:49:41.819884	.pdf	2023-04-14
\.


--
-- TOC entry 4195 (class 0 OID 26299)
-- Dependencies: 217
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chapters (id, lecture_id, title, created_at, updated_at, "position", display_number, hidden, details) FROM stdin;
6	3	Inzidenzgeometrie	2020-07-24 17:04:34.200541	2020-07-24 17:05:02.885966	2	\N	\N	\N
7	3	Hilbertebenen	2020-07-24 17:04:34.220647	2020-07-24 17:05:02.885966	3	\N	\N	\N
8	3	Euklidische Geometrie	2020-07-24 17:04:34.241839	2020-07-24 17:05:02.885966	4	\N	\N	\N
9	3	Nichteuklidische Geometrie	2020-07-24 17:04:34.263575	2020-07-24 17:05:02.885966	5	\N	\N	\N
5	3	Analytische Geometrie	2020-07-24 17:04:34.178653	2020-07-24 17:05:02.885966	1	\N	\N	\N
4	2	Einführung	2020-07-24 16:52:55.533057	2022-08-05 14:06:57.253776	1	\N	\N	\N
1	1	Unitäre Räume und der Spektralsatz	2020-07-24 13:17:57.127274	2022-09-20 10:34:42.714363	1	\N	\N	\N
2	1	Ringe	2020-07-24 13:18:08.753046	2022-09-20 10:34:42.714363	2	\N	\N	\N
3	1	Normalformen von Endomorphismen	2020-07-24 13:18:28.913528	2022-09-20 10:34:42.714363	3	\N	\N	\N
\.


--
-- TOC entry 4197 (class 0 OID 26305)
-- Dependencies: 219
-- Data for Name: clicker_votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clicker_votes (id, value, clicker_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4199 (class 0 OID 26309)
-- Dependencies: 221
-- Data for Name: clickers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clickers (id, editor_id, question_id, code, created_at, updated_at, title, open, alternatives, instance) FROM stdin;
\.


--
-- TOC entry 4201 (class 0 OID 26315)
-- Dependencies: 223
-- Data for Name: commontator_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_comments (id, thread_id, creator_type, creator_id, editor_type, editor_id, body, deleted_at, cached_votes_up, cached_votes_down, created_at, updated_at, parent_id) FROM stdin;
3	11	User	5	User	5	Mistake in line 3. Please correct!	\N	1	0	2022-08-05 13:39:19.597298	2022-08-05 13:59:15.135944	\N
4	11	User	6	User	6	Yes, it should be: "Let $f : G \\to H$ be a group homomorphism" and not "Let $f : H \\to G$ be a group homomorphism".	\N	0	0	2022-08-05 13:41:25.73298	2022-08-05 14:00:28.792243	3
5	39	User	6	User	6	The script sucks!	\N	0	0	2022-08-05 13:42:38.790462	2022-08-05 14:03:59.866379	\N
\.


--
-- TOC entry 4203 (class 0 OID 26323)
-- Dependencies: 225
-- Data for Name: commontator_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_subscriptions (id, thread_id, subscriber_type, subscriber_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 26329)
-- Dependencies: 227
-- Data for Name: commontator_threads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_threads (id, commontable_type, commontable_id, closer_type, closer_id, closed_at, created_at, updated_at) FROM stdin;
1	Medium	1	\N	\N	\N	2020-07-24 13:54:47.148414	2020-07-24 13:54:47.148414
2	Medium	2	\N	\N	\N	2020-07-24 14:06:58.985077	2020-07-24 14:06:58.985077
3	Medium	3	\N	\N	\N	2020-07-24 14:12:39.692883	2020-07-24 14:12:39.692883
4	Medium	4	\N	\N	\N	2020-07-24 14:18:30.413921	2020-07-24 14:18:30.413921
5	Medium	5	\N	\N	\N	2020-07-24 14:23:41.541388	2020-07-24 14:23:41.541388
6	Medium	6	\N	\N	\N	2020-07-24 14:29:17.52754	2020-07-24 14:29:17.52754
7	Medium	7	\N	\N	\N	2020-07-24 14:33:16.171268	2020-07-24 14:33:16.171268
8	Medium	8	\N	\N	\N	2020-07-24 14:46:06.879049	2020-07-24 14:46:06.879049
9	Medium	9	\N	\N	\N	2020-07-24 14:51:14.948392	2020-07-24 14:51:14.948392
10	Medium	10	\N	\N	\N	2020-07-24 14:56:40.120874	2020-07-24 14:56:40.120874
11	Medium	11	\N	\N	\N	2020-07-24 15:09:22.046132	2020-07-24 15:09:22.046132
12	Medium	12	\N	\N	\N	2020-07-24 15:15:19.713744	2020-07-24 15:15:19.713744
13	Medium	13	\N	\N	\N	2020-07-24 15:43:22.736014	2020-07-24 15:43:22.736014
14	Medium	14	\N	\N	\N	2020-07-24 15:54:03.042863	2020-07-24 15:54:03.042863
15	Medium	15	\N	\N	\N	2020-07-24 15:58:26.613419	2020-07-24 15:58:26.613419
16	Medium	16	\N	\N	\N	2020-07-24 16:01:47.137821	2020-07-24 16:01:47.137821
17	Medium	17	\N	\N	\N	2020-07-24 16:02:04.58318	2020-07-24 16:02:04.58318
18	Medium	18	\N	\N	\N	2020-07-24 16:04:00.221757	2020-07-24 16:04:00.221757
19	Medium	19	\N	\N	\N	2020-07-24 16:06:37.926979	2020-07-24 16:06:37.926979
20	Medium	20	\N	\N	\N	2020-07-24 16:08:25.981035	2020-07-24 16:08:25.981035
21	Medium	21	\N	\N	\N	2020-07-24 16:10:17.966641	2020-07-24 16:10:17.966641
22	Medium	22	\N	\N	\N	2020-07-24 16:15:52.027521	2020-07-24 16:15:52.027521
23	Medium	23	\N	\N	\N	2020-07-24 16:16:21.676936	2020-07-24 16:16:21.676936
24	Medium	24	\N	\N	\N	2020-07-24 16:17:11.036526	2020-07-24 16:17:11.036526
25	Medium	25	\N	\N	\N	2020-07-24 16:18:56.980314	2020-07-24 16:18:56.980314
26	Medium	26	\N	\N	\N	2020-07-24 16:20:48.60286	2020-07-24 16:20:48.60286
27	Medium	27	\N	\N	\N	2020-07-24 16:22:40.794054	2020-07-24 16:22:40.794054
28	Medium	28	\N	\N	\N	2020-07-24 16:23:22.713753	2020-07-24 16:23:22.713753
29	Medium	29	\N	\N	\N	2020-07-24 16:24:37.75451	2020-07-24 16:24:37.75451
30	Medium	30	\N	\N	\N	2020-07-24 16:29:29.680896	2020-07-24 16:29:29.680896
31	Medium	31	\N	\N	\N	2020-07-24 16:30:41.505948	2020-07-24 16:30:41.505948
32	Medium	32	\N	\N	\N	2020-07-24 16:34:24.993333	2020-07-24 16:34:24.993333
33	Medium	33	\N	\N	\N	2020-07-24 16:42:58.585328	2020-07-24 16:42:58.585328
34	Medium	34	\N	\N	\N	2020-07-24 16:43:21.342742	2020-07-24 16:43:21.342742
35	Medium	35	\N	\N	\N	2020-07-24 16:44:51.285803	2020-07-24 16:44:51.285803
36	Medium	36	\N	\N	\N	2020-07-24 16:46:02.087775	2020-07-24 16:46:02.087775
37	Medium	37	\N	\N	\N	2020-07-24 16:48:30.049314	2020-07-24 16:48:30.049314
38	Medium	38	\N	\N	\N	2020-07-24 16:56:38.664095	2020-07-24 16:56:38.664095
40	Medium	40	\N	\N	\N	2020-08-10 16:09:44.731809	2020-08-10 16:09:44.731809
41	Medium	41	\N	\N	\N	2020-09-01 14:30:02.691385	2020-09-01 14:30:02.691385
42	Medium	42	\N	\N	\N	2020-09-02 11:47:59.556005	2020-09-02 11:47:59.556005
43	Medium	43	\N	\N	\N	2020-09-03 10:31:05.868892	2020-09-03 10:31:05.868892
45	Medium	45	\N	\N	\N	2020-11-28 16:23:26.321915	2020-11-28 16:23:26.321915
46	Medium	46	\N	\N	\N	2022-08-05 13:33:25.101715	2022-08-05 13:33:25.101715
39	Medium	39	User	1	2022-08-05 14:04:31.608575	2020-07-24 17:03:37.801783	2022-08-05 14:04:31.611431
47	Medium	47	\N	\N	\N	2022-08-05 14:30:40.390535	2022-08-05 14:30:40.390535
48	Medium	48	\N	\N	\N	2022-08-05 14:32:29.860304	2022-08-05 14:32:29.860304
49	Medium	49	\N	\N	\N	2022-08-05 14:33:54.451435	2022-08-05 14:33:54.451435
50	Medium	50	\N	\N	\N	2022-08-05 14:34:37.277142	2022-08-05 14:34:37.277142
51	Medium	51	\N	\N	\N	2022-08-05 14:35:35.037828	2022-08-05 14:35:35.037828
\.


--
-- TOC entry 4207 (class 0 OID 26335)
-- Dependencies: 229
-- Data for Name: course_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_self_joins (id, course_id, preceding_course_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4209 (class 0 OID 26339)
-- Dependencies: 231
-- Data for Name: course_tag_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_tag_joins (id, course_id, tag_id, created_at, updated_at) FROM stdin;
1	1	1	2020-07-24 13:20:57.186263	2020-07-24 13:20:57.186263
2	1	2	2020-07-24 13:21:16.329449	2020-07-24 13:21:16.329449
3	1	3	2020-07-24 13:21:31.399256	2020-07-24 13:21:31.399256
4	1	4	2020-07-24 13:22:02.700146	2020-07-24 13:22:02.700146
5	1	5	2020-07-24 13:22:36.921861	2020-07-24 13:22:36.921861
6	1	6	2020-07-24 13:23:10.099515	2020-07-24 13:23:10.099515
7	1	7	2020-07-24 13:24:32.147387	2020-07-24 13:24:32.147387
8	1	8	2020-07-24 13:25:01.922444	2020-07-24 13:25:01.922444
9	1	9	2020-07-24 13:29:05.429254	2020-07-24 13:29:05.429254
10	1	10	2020-07-24 13:29:15.589105	2020-07-24 13:29:15.589105
11	1	11	2020-07-24 13:30:05.951987	2020-07-24 13:30:05.951987
12	1	12	2020-07-24 13:30:26.131007	2020-07-24 13:30:26.131007
13	1	13	2020-07-24 13:30:53.02906	2020-07-24 13:30:53.02906
14	1	14	2020-07-24 13:33:00.832719	2020-07-24 13:33:00.832719
15	1	15	2020-07-24 13:34:37.120348	2020-07-24 13:34:37.120348
16	1	16	2020-07-24 13:35:07.227687	2020-07-24 13:35:07.227687
17	1	17	2020-07-24 13:35:29.766915	2020-07-24 13:35:29.766915
18	1	18	2020-07-24 13:35:50.920253	2020-07-24 13:35:50.920253
19	1	19	2020-07-24 13:36:38.531332	2020-07-24 13:36:38.531332
20	1	20	2020-07-24 13:37:19.233849	2020-07-24 13:37:19.233849
21	1	21	2020-07-24 13:38:04.772305	2020-07-24 13:38:04.772305
22	1	22	2020-07-24 13:43:04.012295	2020-07-24 13:43:04.012295
23	1	23	2020-07-24 13:43:48.696551	2020-07-24 13:43:48.696551
24	1	24	2020-07-24 13:44:47.043735	2020-07-24 13:44:47.043735
25	1	25	2020-07-24 13:45:18.02724	2020-07-24 13:45:18.02724
26	1	26	2020-07-24 13:45:38.485523	2020-07-24 13:45:38.485523
27	1	27	2020-07-24 16:12:42.714893	2020-07-24 16:12:42.714893
28	1	28	2020-07-24 16:13:15.826302	2020-07-24 16:13:15.826302
29	2	29	2020-07-24 16:53:57.25551	2020-07-24 16:53:57.25551
30	3	30	2020-07-24 17:04:35.541289	2020-07-24 17:04:35.541289
31	3	31	2020-07-24 17:04:35.603203	2020-07-24 17:04:35.603203
32	3	32	2020-07-24 17:04:35.669953	2020-07-24 17:04:35.669953
33	3	33	2020-07-24 17:04:35.731407	2020-07-24 17:04:35.731407
34	3	34	2020-07-24 17:04:35.793282	2020-07-24 17:04:35.793282
35	3	35	2020-07-24 17:04:35.851788	2020-07-24 17:04:35.851788
36	3	36	2020-07-24 17:04:35.909946	2020-07-24 17:04:35.909946
37	3	37	2020-07-24 17:04:35.97051	2020-07-24 17:04:35.97051
38	3	38	2020-07-24 17:04:36.027001	2020-07-24 17:04:36.027001
39	3	39	2020-07-24 17:04:36.084468	2020-07-24 17:04:36.084468
40	3	40	2020-07-24 17:04:36.139223	2020-07-24 17:04:36.139223
41	3	41	2020-07-24 17:04:36.199012	2020-07-24 17:04:36.199012
42	3	42	2020-07-24 17:04:36.257598	2020-07-24 17:04:36.257598
43	1	43	2020-09-02 09:52:36.082389	2020-09-02 09:52:36.082389
44	2	44	2022-08-05 13:29:45.50487	2022-08-05 13:29:45.50487
45	2	45	2022-08-05 13:30:12.629886	2022-08-05 13:30:12.629886
\.


--
-- TOC entry 4211 (class 0 OID 26347)
-- Dependencies: 233
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses (id, title, created_at, updated_at, short_title, organizational, organizational_concept, locale, term_independent, image_data) FROM stdin;
4	Helpdesk	2020-08-10 12:54:28.387314	2020-09-07 12:25:44.679002	HD	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	t	{"id":"course/4/image/80c00f71d63f21d92020a936eeecc728.png","storage":"store","metadata":{"filename":"helpdesk.png","size":30867,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/4/image/normalized-aa71fdb577d70fde1083f216ce8563d9.png","storage":"store","metadata":{"filename":"image_processing20200907-1-1w6el95.png","size":18019,"mime_type":"image/png","width":405,"height":270}}}}
6	Analysis 2	2020-08-11 11:44:11.176117	2020-09-07 12:26:21.527624	Ana 2	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	t	{"id":"course/6/image/7d24a01da797ce8669eaab17e3bc45da.png","storage":"store","metadata":{"filename":"ana2.png","size":269867,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/6/image/normalized-afa8ff83b44f99b73400537d57837766.png","storage":"store","metadata":{"filename":"image_processing20200907-1-16ceokm.png","size":69514,"mime_type":"image/png","width":405,"height":270}}}}
1	Lineare Algebra 2	2020-07-24 13:12:16.486836	2020-11-28 16:23:47.421142	LA 2	t	<div><strong>Code<br></strong>MA5<br><strong><br>Leistungspunkte<br></strong>8 LP<strong><br><br>Turnus<br></strong>jährlich im Sommer<br><strong><br>Inhalt<br></strong>Ringe und Ideale, Moduln und Homomorphismen, Basis und Rang, direkte Summen und Produkte, Tensorprodukt, äußere und symmetrische Potenzen und Determinanten, Moduln über Hauptidealringen, Elementarteilertheorie, Normalformen von Endomorphismen, verallgemeinerte Eigenräume, Jordansche Normalform, nilpotente und halbeinfache Endomorphismen<br><br><strong>Lernziele</strong></div><ul><li>Vertiefende Kenntnisse der Linearen Algebra</li><li>Fähigkeit zum selbständigen Beweisen von Aussagen und Lösen von Aufgaben aus dem Themenbereich und zur schriftlichen und mündlichen Darstellung der Ergebnisse.&nbsp;</li></ul>	\N	f	{"id":"course/1/image/bfb434f11f4a6497215deac1c697070a.png","storage":"store","metadata":{"filename":"la2.png","size":26525,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/1/image/normalized-311085190da94b42debb1be7692d0c3f.png","storage":"store","metadata":{"filename":"image_processing20200907-1-q5pu9w.png","size":6381,"mime_type":"image/png","width":405,"height":270}}}}
3	Einführung in die Geometrie	2020-07-24 17:00:32.17088	2022-08-05 14:04:31.601177	Geo	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	f	{"id":"course/3/image/56a232dfe44377a5ca931c1795aa5961.png","storage":"store","metadata":{"filename":"geo.png","size":73632,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/3/image/normalized-e18ecac8857423650c300b6efe0bf166.png","storage":"store","metadata":{"filename":"image_processing20200907-1-ta0s1a.png","size":28943,"mime_type":"image/png","width":405,"height":270}}}}
2	Algebra 1	2020-07-24 16:51:16.294796	2022-08-05 15:10:44.122858	Alg 1	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	f	{"id":"course/2/image/120c081f6b2ff912c6780eb019513ab5.png","storage":"store","metadata":{"filename":"alg1.png","size":45268,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/2/image/normalized-cc8984eb278d816596ba6e04d68bbf05.png","storage":"store","metadata":{"filename":"image_processing20200907-1-p61xj5.png","size":18109,"mime_type":"image/png","width":405,"height":270}}}}
\.


--
-- TOC entry 4213 (class 0 OID 26354)
-- Dependencies: 235
-- Data for Name: division_course_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.division_course_joins (id, division_id, course_id, created_at, updated_at) FROM stdin;
1	1	1	2020-07-24 13:12:16.492837	2020-07-24 13:12:16.492837
2	4	1	2020-07-24 13:16:35.849451	2020-07-24 13:16:35.849451
3	2	2	2020-07-24 16:51:16.300313	2020-07-24 16:51:16.300313
4	2	3	2020-07-24 17:00:32.178423	2020-07-24 17:00:32.178423
5	1	4	2020-08-10 12:54:28.395682	2020-08-10 12:54:28.395682
7	1	6	2020-08-11 11:44:11.181446	2020-08-11 11:44:11.181446
\.


--
-- TOC entry 4215 (class 0 OID 26358)
-- Dependencies: 237
-- Data for Name: division_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.division_translations (id, division_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:11:06.848376	2020-07-24 13:11:06.848376	Pflichtmodule
2	1	en	2020-07-24 13:11:06.851265	2020-07-24 13:11:06.851265	Mandatory Courses
3	2	de	2020-07-24 13:11:13.369274	2020-07-24 13:11:13.369274	Wahlpflichtbereich 1
4	2	en	2020-07-24 13:11:13.372059	2020-07-24 13:11:13.372059	Elective Modules 1
5	3	de	2020-07-24 13:11:43.558302	2020-07-24 13:11:43.558302	Pflichtmodule
6	3	en	2020-07-24 13:11:43.560584	2020-07-24 13:11:43.560584	Elective Modules 1
7	4	de	2020-07-24 13:16:19.428878	2020-07-24 13:16:19.428878	Wahlbereich
8	4	en	2020-07-24 13:16:19.431698	2020-07-24 13:16:19.431698	Elective Courses
\.


--
-- TOC entry 4217 (class 0 OID 26364)
-- Dependencies: 239
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.divisions (id, program_id, created_at, updated_at) FROM stdin;
1	1	2020-07-24 13:11:06.845633	2020-07-24 13:11:06.845633
2	1	2020-07-24 13:11:13.366328	2020-07-24 13:11:13.366328
3	2	2020-07-24 13:11:43.555597	2020-07-24 13:11:43.555597
4	2	2020-07-24 13:16:19.425481	2020-07-24 13:16:19.425481
\.


--
-- TOC entry 4219 (class 0 OID 26368)
-- Dependencies: 241
-- Data for Name: editable_user_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.editable_user_joins (id, editable_id, editable_type, user_id) FROM stdin;
2	1	Course	2
3	1	Medium	2
4	2	Medium	2
5	3	Medium	2
6	4	Medium	2
7	5	Medium	2
8	6	Medium	2
9	7	Medium	2
10	8	Medium	2
11	9	Medium	2
12	10	Medium	2
13	11	Medium	2
14	12	Medium	2
15	13	Medium	2
16	14	Medium	2
17	15	Medium	2
18	16	Medium	2
19	17	Medium	2
20	18	Medium	2
21	19	Medium	2
22	20	Medium	2
23	21	Medium	2
24	22	Medium	2
25	23	Medium	2
26	24	Medium	2
27	25	Medium	2
28	26	Medium	2
29	27	Medium	2
30	28	Medium	2
31	29	Medium	2
32	30	Medium	2
33	31	Medium	2
34	32	Medium	2
35	33	Medium	2
36	34	Medium	2
37	35	Medium	2
38	36	Medium	2
39	37	Medium	2
40	2	Course	2
41	38	Medium	2
42	3	Course	2
43	39	Medium	2
44	4	Course	1
45	4	Course	2
46	40	Medium	2
48	6	Course	2
50	41	Medium	2
51	43	Medium	2
53	45	Medium	2
54	2	Course	12
55	26	Lecture	13
56	46	Medium	5
57	47	Medium	1
58	48	Medium	1
59	49	Medium	1
60	50	Medium	1
61	51	Medium	1
184	1	Lecture	5
\.


--
-- TOC entry 4221 (class 0 OID 26374)
-- Dependencies: 243
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
1	testpost-in-der-docker-umgebung	1	Thredded::Topic	\N	2020-07-24 15:13:56.562819
2	neuer-testpost	2	Thredded::Topic	\N	2020-09-03 11:09:21.560051
\.


--
-- TOC entry 4223 (class 0 OID 26380)
-- Dependencies: 245
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.imports (id, medium_id, teachable_type, teachable_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4225 (class 0 OID 26386)
-- Dependencies: 247
-- Data for Name: item_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_self_joins (id, item_id, related_item_id) FROM stdin;
\.


--
-- TOC entry 4227 (class 0 OID 26390)
-- Dependencies: 249
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.items (id, start_time, sort, page, description, link, explanation, medium_id, section_id, created_at, updated_at, ref_number, pdf_destination, "position", quarantine, hidden) FROM stdin;
1	\N	self	\N	\N	\N	\N	1	\N	2020-07-24 13:54:47.140526	2020-07-24 13:54:47.140526	\N	\N	\N	\N	\N
2	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	example	1	Fundamentalmatrix einer Sesquilinearform	\N	\N	1	2	2020-07-24 14:05:13.805408	2020-07-24 14:05:13.805408	0.6	\N	\N	\N	f
3	\N	self	\N	\N	\N	\N	2	\N	2020-07-24 14:06:58.976812	2020-07-24 14:06:58.976812	\N	\N	\N	\N	\N
4	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 1\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	definition	1	selbstadjungierte, normale Endomorphismen bzw. Matrizen	\N	\N	2	2	2020-07-24 14:09:36.445551	2020-07-24 14:09:36.445551	0.24	\N	\N	\N	f
5	\N	self	\N	\N	\N	\N	3	\N	2020-07-24 14:12:39.683271	2020-07-24 14:12:39.683271	\N	\N	\N	\N	\N
6	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 1\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	remark	1	Division mit Rest in $\\Z$	\N	\N	3	1	2020-07-24 14:15:01.747259	2020-07-24 14:15:01.747259	1.5	\N	\N	\N	f
7	\N	self	\N	\N	\N	\N	4	\N	2020-07-24 14:18:30.405441	2020-07-24 14:18:30.405441	\N	\N	\N	\N	\N
8	--- &1 !ruby/object:TimeStamp\nmilliseconds: 540\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	remark	1	Charakterisierung von Körpern	\N	\N	4	1	2020-07-24 14:20:57.602111	2020-07-24 14:20:57.602111	1.17	\N	\N	\N	f
9	--- &1 !ruby/object:TimeStamp\nmilliseconds: 127\nminutes: 0\nseconds: 54\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	definition	1	Nullteiler	\N	\N	4	1	2020-07-24 14:21:34.827887	2020-07-24 14:21:34.827887	1.18	\N	\N	\N	f
10	\N	self	\N	\N	\N	\N	5	\N	2020-07-24 14:23:41.534339	2020-07-24 14:23:41.534339	\N	\N	\N	\N	\N
11	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	example	\N	zu maximalen Elementen	\N	\N	5	1	2020-07-24 14:24:59.466237	2020-07-24 14:24:59.466237	1.30	\N	\N	\N	f
12	\N	self	\N	\N	\N	\N	6	\N	2020-07-24 14:29:17.520025	2020-07-24 14:29:17.520025	\N	\N	\N	\N	\N
13	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	remark	\N	Existenz eines ggT in HIR	\N	\N	6	3	2020-07-24 14:31:34.903094	2020-07-24 14:31:34.903094	2.5	\N	\N	\N	f
14	\N	self	\N	\N	\N	\N	7	\N	2020-07-24 14:33:16.164349	2020-07-24 14:33:16.164349	\N	\N	\N	\N	\N
15	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	corollary	\N	Primfaktorzerlegung im Polynomring	\N	\N	7	4	2020-07-24 14:34:39.540801	2020-07-24 14:34:39.540801	3.5	\N	\N	\N	f
16	--- &1 !ruby/object:TimeStamp\nmilliseconds: 670\nminutes: 0\nseconds: 41\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	theorem	\N	Euklidischer Algorithmus	\N	\N	7	4	2020-07-24 14:35:05.728698	2020-07-24 14:35:05.728698	3.6	\N	\N	\N	f
17	\N	self	\N	\N	\N	\N	8	\N	2020-07-24 14:46:06.870777	2020-07-24 14:46:06.870777	\N	\N	\N	\N	\N
18	--- &1 !ruby/object:TimeStamp\nmilliseconds: 180\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	figure	\N	Fittings Lemma: $A\\in M_{m,n}(R)$, $S\\in\\operatorname{GL}_m(R)$, $T\\in\\operatorname{GL}_n(R)$, $l\\leq\\min\\{m,n\\}$. Dann: $\\operatorname{Fit}_l(A)=\\operatorname{Fit}_l(SA)=\\operatorname{Fit}_l(AT)$	\N	\N	8	4	2020-07-24 14:49:19.696472	2020-07-24 14:49:27.34386	3.15	\N	\N	\N	f
19	\N	self	\N	\N	\N	\N	9	\N	2020-07-24 14:51:14.93824	2020-07-24 14:51:14.93824	\N	\N	\N	\N	\N
20	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	theorem	\N	Satz von Frobenius: $A,B\\in M_{n,n}(K)$. Dann: $A\\approx B$ $\\Leftrightarrow$ $P_A\\sim P_B$.	\N	\N	9	5	2020-07-24 14:53:08.930126	2020-07-24 14:53:08.930126	4.2	\N	\N	\N	f
21	\N	self	\N	\N	\N	\N	10	\N	2020-07-24 14:56:40.114435	2020-07-24 14:56:40.114435	\N	\N	\N	\N	\N
22	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	remark	\N	$g_1,\\ldots,g_r\\in K[t]$ normiert, nichtkonstant mit $g_1|g_2|\\ldots|g_r$ , $n:=\\deg(g_1)+\\ldots+\\deg(g_r)$. Dann: $c_1(B_{g_1,\\ldots,g_r})=1,\\ldots$, $c_{n-r}(B_{g_1,\\ldots,g_r})=1$, $c_{n-r+1}(B_{g_1,\\ldots,g_r})=g_1$, $c_n(B_{g_1,\\ldots,g_r})=g_r$.	\N	\N	10	6	2020-07-24 14:58:12.52992	2020-07-24 14:58:12.52992	5.3	\N	\N	\N	f
23	\N	self	\N	\N	\N	\N	11	\N	2020-07-24 15:09:22.038115	2020-07-24 15:09:22.038115	\N	\N	\N	\N	\N
24	\N	self	\N	\N	\N	\N	12	\N	2020-07-24 15:15:19.705268	2020-07-24 15:15:19.705268	\N	\N	\N	\N	\N
25	\N	self	\N	\N	\N	\N	13	\N	2020-07-24 15:43:22.728538	2020-07-24 15:43:22.728538	\N	\N	\N	\N	\N
26	\N	self	\N	\N	\N	\N	14	\N	2020-07-24 15:54:03.030614	2020-07-24 15:54:03.030614	\N	\N	\N	\N	\N
27	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	label	1	Bilinearform	\N	\N	14	\N	2020-07-24 15:56:19.030798	2020-07-24 15:57:14.696379		\N	\N	\N	f
28	--- &1 !ruby/object:TimeStamp\nmilliseconds: 731\nminutes: 0\nseconds: 27\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	label	2	Fundamentalmatrix	\N	\N	14	\N	2020-07-24 15:56:44.795908	2020-07-24 15:57:17.410653	F	\N	\N	\N	f
29	\N	self	\N	\N	\N	\N	15	\N	2020-07-24 15:58:26.605723	2020-07-24 15:58:26.605723	\N	\N	\N	\N	\N
30	\N	self	\N	\N	\N	\N	16	\N	2020-07-24 16:01:47.129544	2020-07-24 16:01:47.129544	\N	\N	\N	\N	\N
31	\N	self	\N	\N	\N	\N	22	\N	2020-07-24 16:15:52.019409	2020-07-24 16:15:52.019409	\N	\N	\N	\N	\N
32	\N	self	\N	\N	\N	\N	33	\N	2020-07-24 16:42:58.576924	2020-07-24 16:42:58.576924	\N	\N	\N	\N	\N
33	\N	self	\N	\N	\N	\N	38	\N	2020-07-24 16:56:38.656482	2020-07-24 16:56:38.656482	\N	\N	\N	\N	\N
34	\N	self	\N	\N	\N	\N	39	\N	2020-07-24 17:03:37.793772	2020-07-24 17:03:37.793772	\N	\N	\N	\N	\N
35	\N	chapter	3	Analytische Geometrie	\N	\N	39	\N	2020-07-24 17:04:35.253814	2020-07-24 17:04:35.253814	1	chap:Analytische-Geometrie	\N	\N	\N
36	\N	chapter	64	Inzidenzgeometrie	\N	\N	39	\N	2020-07-24 17:04:35.253814	2020-07-24 17:04:35.253814	2	chap:Inzidenzgeometrie	\N	\N	\N
37	\N	chapter	72	Hilbertebenen	\N	\N	39	\N	2020-07-24 17:04:35.253814	2020-07-24 17:04:35.253814	3	chap:Hilbertebenen	\N	\N	\N
38	\N	chapter	111	Euklidische Geometrie	\N	\N	39	\N	2020-07-24 17:04:35.253814	2020-07-24 17:04:35.253814	4	chap:Euklidische-Geometrie-kurz	\N	\N	\N
39	\N	chapter	137	Nichteuklidische Geometrie	\N	\N	39	\N	2020-07-24 17:04:35.253814	2020-07-24 17:04:35.253814	5	chap:Nichteuklidsche-Geometrie	\N	\N	\N
40	\N	section	3	Affine Räume	\N	\N	39	8	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.1	sect:Affine-Raeume	-1	\N	\N
41	\N	section	11	Affine Abbildungen	\N	\N	39	9	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.2	sect:Affine-Abbildungen	-1	\N	\N
42	\N	section	16	Affine Koordinaten	\N	\N	39	10	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.3	sect:Affine-Koordinaten	-1	\N	\N
43	\N	section	27	Polytope	\N	\N	39	11	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.4	sect:Polytope	-1	\N	\N
44	\N	section	36	Projektive Räume	\N	\N	39	12	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.5	sect:Projektive-Raeume	-1	\N	\N
45	\N	section	40	Projektive Abbildungen	\N	\N	39	13	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.6	sect:Projektive-Abbildungen	-1	\N	\N
46	\N	section	49	Projektive Koordinaten	\N	\N	39	14	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.7	sect:Projektive-Koordinaten	-1	\N	\N
47	\N	section	58	Computergraphik	\N	\N	39	15	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.8	sect:Computergraphik	-1	\N	\N
48	\N	section	61	Übungsaufgaben	\N	\N	39	16	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	1.9	sect:Uebungsaufgaben-Analytische-Geometrie	-1	\N	\N
49	\N	section	64	Inzidenzebenen	\N	\N	39	17	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	2.1	sect:Inzidenzebenen	-1	\N	\N
50	\N	section	67	Affine Ebenen	\N	\N	39	18	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	2.2	sect:affine-Ebenen	-1	\N	\N
51	\N	section	70	Übungsaufgaben	\N	\N	39	19	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	2.3	sect:Uebungsaufgaben-Inzidenzgeometrie	-1	\N	\N
52	\N	section	72	Die Anordnungsaxiome	\N	\N	39	20	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.1	sect:Anordnungsaxiome	-1	\N	\N
53	\N	section	78	Die Kongruenzaxiome für Strecken	\N	\N	39	21	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.2	sect:Die-Kongruenzaxiome-fuer-Strecken	-1	\N	\N
54	\N	section	80	Die Kongruenzaxiome für Winkel	\N	\N	39	22	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.3	sect:Kongruenzaxiome-fuer-Winkel	-1	\N	\N
55	\N	section	87	Ergänzungswinkel, Gegenwinkel und rechte Winkel	\N	\N	39	23	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.4	sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel	-1	\N	\N
56	\N	section	89	Orthogonalität und Parallelität	\N	\N	39	24	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.5	sect:Orthogonalitaet-und-Parallelitaet	-1	\N	\N
57	\N	section	94	Der Kongruenzsatz für Dreiecke	\N	\N	39	25	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.6	sect:Kongruenzsatz	-1	\N	\N
58	\N	section	97	Mittelsenkrechte und Winkelhalbierende	\N	\N	39	26	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.7	sect:Mittelsenkrechte-und-Winkelhalbierende	-1	\N	\N
59	\N	section	100	Innen- und Außenwinkel im Dreieck	\N	\N	39	27	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.8	sect:Innen-und-Aussenwinkel-im-Dreieck	-1	\N	\N
60	\N	section	104	In- und Umkreis	\N	\N	39	28	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.9	sect:Kreise	-1	\N	\N
61	\N	section	108	Übungsaufgaben	\N	\N	39	29	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	3.10	sect:Uebungsaufgaben-Hilbertebenen	-1	\N	\N
62	\N	section	111	Das Vollständigkeitsaxiom	\N	\N	39	30	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	4.1	sect:Vollstaendigkeitsaxiom	-1	\N	\N
63	\N	section	114	Euklidische Ebenen	\N	\N	39	31	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	4.2	sect:Euklidische-Ebenen	-1	\N	\N
64	\N	section	116	Kreise	\N	\N	39	32	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	4.3	sect:Kreise-in-der-euklidischen-Ebene	-1	\N	\N
65	\N	section	126	Die Inversion am Kreis	\N	\N	39	33	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	4.4	sect:Inversion-am-Kreis	-1	\N	\N
66	\N	section	135	Übungsaufgaben	\N	\N	39	34	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	4.5	sect:Uebungsaufgaben-Euklidische-Geometrie	-1	\N	\N
67	\N	section	137	Das Poincaré'sche Kreismodell	\N	\N	39	35	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	5.1	sect:Hyperbolische-Ebenen	-1	\N	\N
68	\N	section	144	Hyperbolische Geometrie	\N	\N	39	36	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	5.2	sect:Hyperbolische-Geometrie	-1	\N	\N
69	\N	section	151	Übungsaufgaben	\N	\N	39	37	2020-07-24 17:04:35.273312	2020-07-24 17:04:35.273312	5.3	sect:Uebungsaufgaben-Nichteuklidische-Geometrie	-1	\N	\N
70	\N	definition	3	affiner Raum	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.1	defn:affiner-Raum	2	\N	f
71	\N	definition	4	affine Dimension	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.2	defn:affine-Dimension	3	\N	f
72	\N	example	4	affiner Standardraum	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.3	bsp:affiner-Standardraum	4	\N	f
73	\N	equation	5		\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.1	Aktion-der-Translationen	5	\N	f
74	\N	equation	5		\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.2	Vektoraddition	6	\N	f
75	\N	definition	5	affiner Unterraum	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.4	defn:affiner-Unterraum	7	\N	f
76	\N	example	5	affine Unterräume der affinen Standardräume	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.5	bsp:affine-Unterraeume	8	\N	f
77	\N	proposition	6	Beliebigkeit des Aufpunkts eines affinen Unterraums	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.6	prop:Dimension-affiner-Unterraum	9	\N	f
78	\N	definition	6	Dimension eines affinen Unterraums	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.7	defn:Dimension-affiner-Unterraum	10	\N	f
79	\N	proposition	6	affine Unterräume sind affine Räume	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.8	prop:affine-Unterraeume-sind-affine-Raeume	11	\N	f
80	\N	proposition	7	Durchschnitt und Verbindungsraum affiner Räume	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.9	prop:Durchschnitt-und-Verbindungsraum-affin	12	\N	f
81	\N	equation	7		\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.3	Durchschnitt	13	\N	f
82	\N	equation	7		\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.4	Verbindungsraum-Fall-1	14	\N	f
83	\N	equation	8		\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.5	Verbindungsraum-Fall-2	15	\N	f
84	\N	theorem	9	Verbindungsraum als Vereinigung von Verbindungsgeraden	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.10	satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden	16	\N	f
85	\N	theorem	9	Dimensionsformel für affine Unterräume	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.11	satz:Dimensionsformel-fuer-affine-Unterraeume	17	\N	f
86	\N	definition	10	parallel und windschief	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.12	defn:parallel-und-windschief	18	\N	f
87	\N	remark	10	eine Hyperebene ist zu keinem affinen Unterraum windschief	\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.13	bem:keine-windschiefen-Hyperebenen	19	\N	f
88	\N	remark	10		\N	\N	39	8	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.14	bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden	20	\N	f
89	\N	definition	11	affine Abbildung	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.15	defn:affine-Abbildung	22	\N	f
90	\N	equation	11		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.6	affine-Abbildung	23	\N	f
91	\N	example	11	affine Abbildungen	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.16	bsp:affine-Abb	24	\N	f
92	\N	proposition	11	Kriterium für affine Abbildung	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.17	prop:Kriterium-fuer-affine-Abbildung	25	\N	f
93	\N	proposition	11	Zusammenhang zwischen affinen und linearen Abbildungen	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.18	prop:Zusammenhang-affine-und-lineare-Abbildungen	26	\N	f
94	\N	equation	12		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.7	affine-Abbildung-aus-linearer-Abbildung	27	\N	f
95	\N	example	12	affine Abbildungen in der affinen Standardebene	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.19	bsp:affine-Abbildungen-in-der-affinen-Standardebene	28	\N	f
96	\N	equation	13		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.8	W-Bahn	29	\N	f
97	\N	proposition	13	Parallelprojektionen	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.20	prop:Parallelprojektion	30	\N	f
98	\N	definition	14	kollinear	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.21	defn:kollinear	31	\N	f
99	\N	definition	14	n-Eck	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.22	defn:n-Eck	32	\N	f
100	\N	definition	15	Parallelogramm	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.23	defn:Parallelogramm	33	\N	f
101	\N	proposition	15	affine Abbildungen erhalten Parallelogramme	\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.24	prop:affine-Abbildungen-erhalten-Parallelogramme	34	\N	f
102	\N	equation	15		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.9	affine-Abbildungen-erhalten-Parallelogramme	35	\N	f
103	\N	equation	15		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.10	Bild-ist-Parallelogramm-1	36	\N	f
104	\N	equation	15		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.11	Bild-ist-Parallelogramm-2	37	\N	f
105	\N	equation	15		\N	\N	39	9	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.12	gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht	38	\N	f
106	\N	definition	16	affine Basis	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.25	defn:affine-Basis	40	\N	f
107	\N	example	16	Standardbasis des affinen Standardraums	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.26	bsp:Standardbasis-des-affinen-Standardraums	41	\N	f
108	\N	remark	16	affine Unabhängigkeit hängt nicht von der Reihenfolge ab	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.27	bem:affine-Unabhaengigkeit	42	\N	f
109	\N	theorem	17	Eindeutigkeit der affinen Abbildung mit gegebenen Bildern einer affinen Basis	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.28	satz:affine-Abbildung	43	\N	f
110	\N	definition	17	affines Koordinatensystem	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.29	defn:affines-Koordinatensystem	44	\N	f
111	\N	definition	18	Teilverhältnis	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.30	defn:Teilverhaeltnis	45	\N	f
112	\N	equation	18		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.13	Teilverhaeltnis	46	\N	f
113	\N	remark	18	Teilverhältnis im affinen Standardraum	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.31	bem:Teilverhaeltnis-in-Standardraum	47	\N	f
114	\N	proposition	19	Teilverhältnis ist affine Invariante	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.32	prop:TV-affine-Invariante	48	\N	f
115	\N	theorem	19	Strahlensatz	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.33	satz:affiner-Strahlensatz	49	\N	f
116	\N	definition	21	Mittelpunkt	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.35	defn:Mittelpunkt	50	\N	f
117	\N	theorem	21	Diagonalensatz	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.36	satz:Diagonalensatz	51	\N	f
118	\N	theorem	22	Schwerpunktsatz	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.37	satz:Schwerpunktsatz	52	\N	f
119	\N	definition	23	Strecke, Strahl und Winkel	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.38	defn:Winkel-affin	53	\N	f
120	\N	equation	23		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.14	euklidisches-Winkelmass	54	\N	f
121	\N	equation	23	Winkelgröße	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.15	Winkelgroesse	55	\N	f
122	\N	definition	23	Seitenlängen und Innenwinkelgrößen eines Dreicks	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.39	defn:Seitenlaengen-und-Innenwinkelgroessen	56	\N	f
123	\N	theorem	23	Kosinussatz	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.40	satz:Kosinussatz	57	\N	f
124	\N	equation	24		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.16	Kosinussatz	58	\N	f
125	\N	Corollary	24	Satz des Pythagoras	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.41	coro:Pythagoras	59	\N	f
126	\N	theorem	24	Winkelsumme im Dreieck	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.42	satz:Winkelsumme-im-Dreieck	60	\N	f
127	\N	equation	25		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.17	Winkelsumme-Kosinuswerte	61	\N	f
128	\N	equation	25		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.18	Sinus-des-Winkelmasses	62	\N	f
129	\N	equation	25		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.19	Rechnung-zu-Cauchy-Schwartz	63	\N	f
130	\N	equation	26		\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.20	Winkelsumme-Sinuswerte	64	\N	f
131	\N	theorem	26	Sinussatz	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.43	satz:Sinussatz	65	\N	f
132	\N	Corollary	27	Sinus und Kosinus als Quotient der Katheten durch die Hypothenuse	\N	\N	39	10	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.44	coro:Hypothenuse-und-Katheten	66	\N	f
133	\N	definition	27	Konvexes Polyeder und Polytop	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.45	defn:Polytop	68	\N	f
134	\N	example	28	Durchschnitte orthogonaler Halbräume	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.46	bsp:Durchschnitt-von-Halbraeumen	69	\N	f
135	\N	remark	28	Rand eines Polytops	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.47	bem:Rand-eines-Polytops	70	\N	f
136	\N	definition	28	Ecken, Kanten, Flächen eines Polytops	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.48	defn:Ecken-Kanten-Flaechen	71	\N	f
137	\N	example	28	Ecken, Kanten, Flächen beim Würfel	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.49	bsp:Wuerfel	72	\N	f
138	\N	theorem	29	Euler'sche Polyederformel	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.50	satz:Polyederformel	73	\N	f
139	\N	definition	33	regelmäßige n-Ecke und Platonische Körper	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.51	defn:Platonischer-Koerper	74	\N	f
140	\N	proposition	33	Beschreibung regulärer Polytope durch Grad und Anzahl der Kanten pro Ecke	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.52	prop:Polytop	75	\N	f
141	\N	Corollary	33	Platonische Körper	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.53	coro:Platonische-Koerper	76	\N	f
142	\N	definition	34	Ähnlichkeitsabbildung	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.54	defn:Aehnlichkeitsabbildung-analytisch	77	\N	f
143	\N	theorem	34	Klassifikation der Platonischen Körper	\N	\N	39	11	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.55	satz:Klassifikation-der-Platonischen-Koerper	78	\N	f
144	\N	definition	36	projektiver Raum	\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.56	defn:projektiver-Raum	80	\N	f
145	\N	example	37	projektiver Standardraum	\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.57	bsp:projektiver-Standardraum	81	\N	f
146	\N	example	37	Veranschaulichung projektiver Standardräume der Dimension 1 und 2 als affine Einbettungen	\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.58	bsp:Einbettungen-projektiver-Standardraeume	82	\N	f
147	\N	definition	38	projektiver Unterraum	\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.59	defn:projektiver-Unterraum	83	\N	f
148	\N	proposition	38	Durchschnitt und Verbindungsraum projektiver Räume	\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.60	prop:Durchschnitt-und-Verbindungsraum-projektiv	84	\N	f
149	\N	figure	39		\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.3	abb:Boyflaeche	85	\N	f
150	\N	equation	40		\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.21	Beschreibung-projektiver-Verbindungsraum	86	\N	f
151	\N	theorem	40	Dimensionsformel für projektive Unterräume	\N	\N	39	12	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.61	satz:Dimensionsformel-fuer-projektive-Unterraeume	87	\N	f
152	\N	definition	40	projektive Abbildung	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.62	defn:projektive-Abbildung	89	\N	f
153	\N	proposition	41	Zusammenhang zwischen den linearen Abbildungen zu einer gegebenen projektiven Abbildung	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.63	prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb	90	\N	f
154	\N	example	41	kanonische Einbettung	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.64	bsp:kanonische-Einbettung	91	\N	f
155	\N	definition	42	Zentralprojektion	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.65	defn:Zentralprojektion	92	\N	f
156	\N	equation	43		\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.22	Wohldefiniertheit-Zentralprojektion-1	93	\N	f
157	\N	equation	43		\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.23	Wohldefiniertheit-Zentralprojektion-2	94	\N	f
158	\N	remark	43	alternative Beschreibung des Begriffs der Zentralprojektion	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.66	bem:Beschreibung-Zentralprojektion	95	\N	f
159	\N	proposition	43	Zentralprojektionen sind Projektivitäten	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.67	prop:Zentralprojektionen-sind-Projektivitaeten	96	\N	f
160	\N	theorem	44	projektiver Abschluss	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.68	satz:projektiver-Abschluss	97	\N	f
161	\N	example	45	projektiver Abschluss einer Hyperebene in K³	\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.69	bsp:projektiver-Abschluss	98	\N	f
162	\N	equation	46		\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.24	ZcapX	99	\N	f
163	\N	equation	47		\N	\N	39	13	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.25	dim-ZcapX	100	\N	f
164	\N	definition	49	projektive Basis	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.70	defn:projektive-Basis	102	\N	f
165	\N	example	49	Standardbasis des projektiven Standardraums	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.71	bsp:kanonische-projektive-Basis	103	\N	f
166	\N	figure	49		\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.4	abb:projektive-Standardbasis	104	\N	f
167	\N	lemma	50	Zusammenhang zwischen projektiver Basis und Basis des zugrunde liegenden Vektorraums	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.72	lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis	105	\N	f
168	\N	theorem	50	projektive Räume gleicher Dimension sind kanonisch isomorph	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.73	satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph	106	\N	f
169	\N	definition	51	projektives Koordinatensystem	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.74	defn:projektives-Koordinatensystem	107	\N	f
170	\N	definition	51	Doppelverhältnis	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.75	defn:Doppelverhaeltnis-projektiv	108	\N	f
171	\N	proposition	52	Doppelverhältnis ist projektive Invariante	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.76	prop:DV-projektive-Invariante	109	\N	f
172	\N	equation	52		\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.26	DV-projektive-Invariante	110	\N	f
173	\N	proposition	52	Berechnung des Doppelverhältnisses aus den homogenen Koordinaten	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.77	prop:DV-Berechnung	111	\N	f
174	\N	remark	54	Zusammenhang zwischen Doppelverhältnis und bestimmten Teilverhältnissen	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.78	bem:Zusammenhang-DV-und-TV	112	\N	f
175	\N	theorem	55	projektiver Satz von Desargues	\N	\N	39	14	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.79	satz:projektiver-Desargues	113	\N	f
176	\N	equation	59		\N	\N	39	15	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.27	Transformationen-in-R3	115	\N	f
177	\N	definition	60	Quader	\N	\N	39	15	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.80	defn:Quader	116	\N	f
178	\N	definition	60	Rechteckkegelstumpf	\N	\N	39	15	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.81	defn:Kegelstumpf	117	\N	f
179	\N	exercise	61		\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.1	aufg:Verbindungsgerade-ist-Gerade	119	\N	f
180	\N	exercise	61		\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.2	aufg:Eigenschaften-affiner-Abbildungen	120	\N	f
181	\N	exercise	61	Transfer: Abbildungsgeometrie	\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.4	aufg:Abbildungsgeometrie	121	\N	f
182	\N	exercise	62	Tangenssatz	\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.5	aufg:Tangenssatz	122	\N	f
183	\N	exercise	62	Heron'sche Formel	\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.6	aufg:Heronsche-Formel	123	\N	f
184	\N	exercise	62		\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.8	aufg:Vergleich-rechtwinkliger-Dreiecke	124	\N	f
185	\N	exercise	62		\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.9	aufg:Durchschnitt-Gerade-mit-Einheitssphaere	125	\N	f
186	\N	exercise	63	Jede Projektivität, die den Durchschnitt von Start- und Zielraum punktweise festlässt, ist eine Zentralprojektion	\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.11	aufg:fast-jede-Projektivitaet-ist-Zentralprojektion	126	\N	f
187	\N	exercise	63	projektiver Satz von Pappos	\N	\N	39	16	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	1.13	aufg:projektiver-Pappos	127	\N	f
188	\N	definition	65	Inzidenzebene	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.1	defn:Inzidenzebene	130	\N	f
189	\N	example	65	Inzidenzebene	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.2	bsp:Inzidenzebene	131	\N	f
190	\N	proposition	65	nichtparallele Geraden besitzen eindeutigen Schnittpunkt	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.3	prop:Geradenschnittpunkt	132	\N	f
191	\N	proposition	66	Kriterium dafür, ob ein Punkt auf einer Geraden liegt	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.4	prop:Kriterium-Punkt-auf-Gerade	133	\N	f
192	\N	proposition	66	Trennung von Punkt und Gerade	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.5	prop:Trennung-von-Punkt-und-Gerade	134	\N	f
193	\N	theorem	66	affine Standardebene ist Inzidenzebene	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.6	satz:A2(K)-Inzidenzebene	135	\N	f
194	\N	remark	67	Parallelitätsbegriffe in der affinen Standardebene stimmen überein	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.7	bem:Parallelitaet-in-A2(K)	136	\N	f
195	\N	definition	67	Isomorphismus von Inzidenzebenen	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.8	defn:Isomorphismus-von-Inzidenzebenen	137	\N	f
196	\N	example	67	affine Ebenen (analytisch definiert) sind Inzidenzebenen	\N	\N	39	17	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.9	bsp:affine-Ebenen-sind-Inzidenzebenen	138	\N	f
197	\N	definition	67	Parallelenaxiom	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.10	defn:Parallelenaxiome	140	\N	f
198	\N	definition	68	affine Ebene	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.11	defn:affine-Ebene	141	\N	f
199	\N	example	68	Parallelenaxiom	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.12	bsp:Parallelenaxiome	142	\N	f
200	\N	proposition	69	Parallelität ist Äquivalenzrelation	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.13	prop:Parallelitaet-Aequivalenzrelation	143	\N	f
201	\N	definition	69	Parallelenbüschel und Geradenbüschel	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.14	defn:Parallelenbueschel-und-Geradenbueschel	144	\N	f
202	\N	example	69	Parallelenbüschel und Geradenbüschel in der affinen Standardebene	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.15	bsp:Parallelenbueschel-und-Geradenbueschel	145	\N	f
203	\N	definition	70	affiner Isomorphismus	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.16	defn:affiner-Isomorphismus	146	\N	f
204	\N	example	70	affiner Isomorphismus	\N	\N	39	18	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.17	bsp:affiner-Isomorphismus	147	\N	f
205	\N	exercise	70		\N	\N	39	19	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.2	aufg:Isomorphismen-von-Inzidenzebenen	149	\N	f
206	\N	exercise	70		\N	\N	39	19	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.3	aufg:affine-Ebene-mit-fuenf-Punkten	150	\N	f
207	\N	exercise	70		\N	\N	39	19	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	2.4	aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig	151	\N	f
208	\N	definition	72	Anordnungsaxiome	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.1	defn:Anordnungsaxiome	154	\N	f
209	\N	proposition	73	Seiten einer Geraden	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.2	prop:Seiten-einer-Geraden	155	\N	f
210	\N	figure	73	Seiten einer Geraden	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.1	abb:Geradenseiten	156	\N	f
211	\N	example	74	Anordnung in der affinen Standardebene	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.3	bsp:affine-Standardebene-und-Anordnung	157	\N	f
212	\N	equation	74		\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.1	Anordnung-fuer-affine-Standardebenen	158	\N	f
213	\N	equation	75	Hesse'sche Normalform	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.2	Hessesche-Normalform	159	\N	f
214	\N	definition	75	Lage auf verschiedenen Seiten einer Geraden	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.4	defn:Lage-auf-verschiedenen-Geradenseiten	160	\N	f
215	\N	proposition	75	Seiten von Geraden und Punkten	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.5	prop:Seiten-von-Geraden-und-Punkten	161	\N	f
216	\N	Corollary	76	Lage auf gleicher Seite ist Äquivalenzrelation	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.6	coro:Seiten-eines-Punktes	162	\N	f
217	\N	definition	76	Erweiterung des Anordnungsbegriffs auf beliebig viele kollineare Punkte	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.7	defn:Anordnung-vieler-Punkte	163	\N	f
218	\N	proposition	76	Anordnungen von Punkten auf Geraden	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.8	prop:Anordnung-von-Punkten-auf-Geraden	164	\N	f
219	\N	remark	77	alternatives Anordnungsaxiom (A'2)	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.9	bem:alternatives-Anordnungsaxiom	165	\N	f
220	\N	definition	77	Strecke und Strahl	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.10	defn:strecke-und-strahl	166	\N	f
221	\N	proposition	77	Strecken und Strahlen	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.11	prop:Strecken-und-Strahlen	167	\N	f
222	\N	proposition	77	Gerade als Vereinigung von Strahlen	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.12	prop:gerade-vereinigung-von-strahlen	168	\N	f
223	\N	theorem	78	Satz von Pasch	\N	\N	39	20	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.13	satz:Pasch	169	\N	f
224	\N	definition	78	Kongruenzaxiome für Strecken	\N	\N	39	21	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.14	defn:Kongruenzaxiome-fuer-Strecken	171	\N	f
225	\N	example	79	Streckenkongruenzen in der affinen Standardebene	\N	\N	39	21	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.15	bsp:affine-Standardebene-und-Kongruenzen-von-Strecken	172	\N	f
226	\N	proposition	79	Streckensubtraktion	\N	\N	39	21	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.16	prop:Streckensubtraktion	173	\N	f
227	\N	definition	79	Vergleich von Strecken	\N	\N	39	21	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.17	defn:<-fuer-Strecken	174	\N	f
228	\N	proposition	80	Vergleich von Strecken	\N	\N	39	21	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.18	prop:<-fuer-Strecken	175	\N	f
229	\N	definition	80	Winkel	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.19	defn:Winkel	177	\N	f
230	\N	figure	80	Winkel	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.2	abb:Winkel	178	\N	f
231	\N	proposition	80	Identitätskriterium für Winkel	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.20	prop:winkel	179	\N	f
232	\N	definition	81	Inneres eines Winkels	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.21	defn:Inneres-eines-Winkels	180	\N	f
233	\N	lemma	81	Kriterium für die Lage im Inneren eines Winkels	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.22	lemma:im-Inneren-eines-Winkels	181	\N	f
234	\N	definition	82	Kongruenzaxiome für Winkel	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.23	defn:Kongruenzaxiome-fuer-Winkel	182	\N	f
235	\N	definition	83	Vergleich von Winkeln	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.24	defn:<-fuer-Winkel	183	\N	f
236	\N	proposition	83	Vergleich von Winkeln	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.25	prop:<-fuer-Winkel	184	\N	f
237	\N	definition	83	Dreieck	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.26	defn:Dreieck	185	\N	f
238	\N	remark	84	Kongruenz von Dreiecken	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.27	bem:dreieck	186	\N	f
239	\N	definition	84	ebene Geometrie	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.28	defn:ebene-Geometrie	187	\N	f
240	\N	definition	84	Bewegung	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.29	defn:Bewegung	188	\N	f
241	\N	example	85	Bewegungen in der affinen Standardebene	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.30	bsp:Bewegungen-in-der-affinen-Standardebene	189	\N	f
242	\N	definition	85	genügend viele Bewegungen	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.31	defn:gvB	190	\N	f
243	\N	theorem	86	Existenz genügend vieler Bewegungen impliziert (K'6)	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.32	satz:genug-Bewegung	191	\N	f
244	\N	equation	86		\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.3	Voraussetzungen-SWS	192	\N	f
245	\N	example	86	Winkelkongruenzen in der affinen Standardebene	\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.33	bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln	193	\N	f
246	\N	equation	86		\N	\N	39	22	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.4	Kongruenz-von-Winkeln-in-der-affinen-Standardebene	194	\N	f
247	\N	definition	87	Ergänzungswinkel und Gegenwinkel	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.34	defn:Ergaenzungswinkel-Gegenwinkel	196	\N	f
248	\N	proposition	87	Ergänzungswinkel kongruenter Winkel sind kongruent	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.35	prop:Ergaenzungswinkel	197	\N	f
249	\N	Corollary	88	ein Winkel ist zu seinem Gegenwinkel kongruent	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.36	coro:Gegenwinkel	198	\N	f
250	\N	definition	88	rechter Winkel	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.37	defn:rechter-Winkel	199	\N	f
251	\N	proposition	88	Ergänzungswinkel eines rechten Winkels ist rechter Winkel	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.38	prop:rechter-Winkel	200	\N	f
252	\N	theorem	89	rechte Winkel sind zueinander kongruent	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.39	satz:Viertes-euklidisches-Postulat	201	\N	f
253	\N	Corollary	89	die rechten Winkel bilden eine Kongruenzklasse	\N	\N	39	23	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.40	coro:rechte-Winkel	202	\N	f
254	\N	definition	89	orthogonal	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.41	defn:orthogonal	204	\N	f
255	\N	theorem	89	Existenz des Lots	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.42	satz:Orthogonale-Gerade	205	\N	f
256	\N	figure	90	Existenz des Lots	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.3	abb:Orthogonale	206	\N	f
257	\N	definition	90	Wechselwinkel und Stufenwinkel	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.43	defn:Wechselwinkel-und-Stufenwinkel	207	\N	f
258	\N	remark	91	Zusammenhang zwischen Wechsel- und Stufenwinkel	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.44	bem:Wechselwinkel-und-Stufenwinkel	208	\N	f
259	\N	theorem	91	schwacher Wechselwinkelsatz	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.45	satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz	209	\N	f
260	\N	Corollary	92	zweifaches Lotfällen gibt Parallele	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.46	coro:zum-schwachen-wws	210	\N	f
261	\N	Corollary	92	Eindeutigkeit des Lots	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.47	coro:Lot-eindeutig	211	\N	f
262	\N	Corollary	92	Existenz von Parallelen	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.48	coro:Existenz-von-Parallelen	212	\N	f
263	\N	theorem	92	starker Wechselwinkelsatz	\N	\N	39	24	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.49	satz:Parallelenaxiom-in-Hilbertebenen	213	\N	f
264	\N	proposition	94	Abtragung eines Dreiecks	\N	\N	39	25	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.51	prop:eindeutiges-Dreieck	215	\N	f
265	\N	definition	94	gleichschenkliges Dreieck	\N	\N	39	25	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.52	defn:gleichschenkliges-Dreieck	216	\N	f
266	\N	proposition	94	gleichschenkliges Dreieck	\N	\N	39	25	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.53	prop:gleichschenkliges-Dreieck	217	\N	f
267	\N	proposition	94	Winkeladdition und -subtraktion	\N	\N	39	25	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.54	prop:Winkeladdsubtraktion	218	\N	f
268	\N	theorem	95	Kongruenzsatz für Dreiecke	\N	\N	39	25	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.55	satz:Kongruenzsatz-fuer-Dreiecke	219	\N	f
269	\N	equation	96		\N	\N	39	25	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.5	wsw-1	220	\N	f
270	\N	definition	97	Streckenmittelpunkt	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.56	defn:Streckenmittelpunkt	222	\N	f
271	\N	lemma	97	Streckenmittelpunkt liegt zwischen den Randpunkten der Strecke	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.57	lemma:Mittelpunkt-liegt-zwischen-Randpunkten	223	\N	f
272	\N	theorem	98	Existenz und Eindeutigkeit des Streckenmittelpunkts	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.58	satz:Mittelpunkt	224	\N	f
273	\N	equation	98		\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.6	Mittelpunkt-1	225	\N	f
274	\N	equation	98		\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.7	Mittelpunkt-2	226	\N	f
275	\N	definition	99	Mittelsenkrechte	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.59	defn:Mittelsenkrechte	227	\N	f
276	\N	proposition	99	Charakterisierung der Mittelsenkrechten	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.60	prop:Charakterisierung-Mittelsenkrechte	228	\N	f
277	\N	definition	99	Winkelhalbierende	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.61	defn:Winkelhalbierende	229	\N	f
278	\N	proposition	100	Existenz der Winkelhalbierenden	\N	\N	39	26	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.62	prop:Existenz-der-Winkelhalbierenden	230	\N	f
279	\N	definition	100	Innenwinkel	\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.63	defn:Innenwinkel	232	\N	f
280	\N	proposition	100	schwache Winkelsumme im Dreieck	\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.64	prop:schwache-Winkelsumme-im-Dreieck-1	233	\N	f
281	\N	equation	101		\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.8	schwache-Winkelsumme-im-Dreieck	234	\N	f
282	\N	theorem	101	Außenwinkelsatz	\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.65	satz:Aussenwinkelsatz	235	\N	f
283	\N	theorem	102	der größeren Dreiecksseite liegt der größere Winkel gegenüber	\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.66	satz:grosse-Dreiecksseite-hat-grossen-Winkel	236	\N	f
284	\N	figure	102	der größeren Dreiecksseite liegt der größere Winkel gegenüber	\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.4	abb:grosse-Dreiecksseite-hat-grossen-Winkel	237	\N	f
285	\N	theorem	103	SSrW-Kriterium	\N	\N	39	27	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.67	satz:SSrechterWinkel	238	\N	f
286	\N	definition	104	Kreis	\N	\N	39	28	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.68	defn:Kreis	240	\N	f
287	\N	proposition	104	Eindeutigkeit des Kreismittelpunkts	\N	\N	39	28	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.69	prop:Kreise-haben-genau-einen-Mittelpunkt	241	\N	f
288	\N	theorem	105	Umkreissatz	\N	\N	39	28	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.70	satz:Umkreissatz	242	\N	f
289	\N	definition	105	Höhe	\N	\N	39	28	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.72	defn:Hoehe	243	\N	f
290	\N	theorem	105	Höhensatz	\N	\N	39	28	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.73	satz:Hoehensatz	244	\N	f
291	\N	theorem	106	Inkreissatz	\N	\N	39	28	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.74	satz:Inkreissatz	245	\N	f
292	\N	exercise	108		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.1	aufg:Anordnung-von-Punkten-auf-Geraden	247	\N	f
293	\N	exercise	108		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.2	aufg:unendlich-viele-Punkte-mit-I-+-A	248	\N	f
294	\N	exercise	108		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.4	aufg:Anordnung-Modell-alternativ	249	\N	f
295	\N	exercise	108		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.5	aufg:<-fuer-Winkel	250	\N	f
296	\N	exercise	108		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.6	aufg:Inneres-bestimmt-den-Winkel	251	\N	f
297	\N	exercise	108		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.7	aufg:konvexe-Mengen	252	\N	f
298	\N	exercise	109		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.10	aufg:Parallelogramm-synthetisch	253	\N	f
299	\N	exercise	109	Geradenspiegelung	\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.12	aufg:Spiegelungen-in-Hilbertebenen	254	\N	f
300	\N	exercise	110		\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.13	aufg:Abschaetzung-Abstand-Punkt-Gerade	255	\N	f
301	\N	exercise	110	Höhenformel	\N	\N	39	29	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	3.14	aufg:Hoehenformel	256	\N	f
302	\N	definition	112	Dedekindschnitt	\N	\N	39	30	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.1	defn:Dedekindschnitt	259	\N	f
303	\N	definition	112	Vollständigkeitsaxiom	\N	\N	39	30	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.2	defn:Vollstaendigkeitsaxiom	260	\N	f
304	\N	example	113	Vollständigkeitsaxiom	\N	\N	39	30	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.3	bsp:Vollstaendigkeitsaxiom	261	\N	f
305	\N	theorem	113	Archimedisches Axiom	\N	\N	39	30	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.4	satz:Archimedisches-Axiom	262	\N	f
306	\N	definition	114	euklidische Ebene	\N	\N	39	31	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.5	defn:Euklidsche-Ebene	264	\N	f
307	\N	definition	114	Isomorphismus euklidischer Ebenen	\N	\N	39	31	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.6	defn:Isomorphismus-euklidischer-Ebenen	265	\N	f
308	\N	theorem	114	Hauptsatz für euklidische Ebenen	\N	\N	39	31	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.8	satz:Hauptsatz-fuer-euklidische-Ebenen	266	\N	f
309	\N	proposition	115	Größe der Winkelsumme	\N	\N	39	31	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.9	prop:Groesse-der-Winkelsumme	267	\N	f
310	\N	proposition	117	Durchschnitt von Kreis und Gerade	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.10	prop:Durchschnitt-Kreis-Gerade	269	\N	f
311	\N	Corollary	118	Charakterisierung der Tangente	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.11	coro:Tangente	270	\N	f
312	\N	definition	118	Potenz	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.12	defn:Potenz	271	\N	f
313	\N	theorem	119	Zweisehnensatz	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.13	satz:Zweisehnensatz	272	\N	f
314	\N	theorem	119	Sehnen-Tangenten-Satz	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.14	satz:Sehnen-Tangenten-Satz	273	\N	f
315	\N	proposition	120	Potenzgerade	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.15	prop:potenzgerade	274	\N	f
316	\N	theorem	121	Kreis-Kreis-Schnitt-Eigenschaft	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.17	satz:Kreis-Kreis-Schnitt-Eigenschaft	275	\N	f
317	\N	Corollary	122	Kreis-Kreis-Schnitt-Eigenschaft	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.18	coro:Kreis-Kreis-Schnitt-Eigenschaft	276	\N	f
318	\N	theorem	123	Peripheriewinkelsatz	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.19	satz:Peripheriewinkelsatz	277	\N	f
319	\N	theorem	124	Satz des Thales	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.20	satz:Thales	278	\N	f
320	\N	theorem	124	Verschärfung des Sinussatzes	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.21	satz:Sinussatz-Verschaerfung	279	\N	f
321	\N	theorem	125	Eulergleichung	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.22	satz:Eulergleichung	280	\N	f
322	\N	Corollary	125	Eulergerade	\N	\N	39	32	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.23	coro:Eulergerade	281	\N	f
323	\N	definition	126	Inversion am Kreis	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.24	defn:Inversion-am-Kreis	283	\N	f
324	\N	proposition	126	Inversionen am Kreis sind bijektiv und bilden Punkte von innen nach außen ab	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.25	prop:Inversionen-am-Kreis-sind-bijektiv	284	\N	f
325	\N	proposition	127	Konstruktion des Bildpunkts unter der Inversion	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.26	prop:Tangentenschnittpunkt-mit-Inversion	285	\N	f
326	\N	proposition	127	Eigenschaften der Inversion am Kreis	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.27	prop:Eigenschaften-der-Inversion	286	\N	f
327	\N	definition	129	verallgemeinerte Gerade	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.28	defn:verallgemeinerte-Gerade	287	\N	f
328	\N	proposition	129	orthogonale verallgemeinerte Gerade	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.29	prop:orthogonale-verallgemeinerte-Geraden	288	\N	f
329	\N	proposition	130	Eigenschaften orthogonaler Kreise	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.30	prop:orthogonale-Kreise	289	\N	f
330	\N	proposition	131	Inversion eines Kreises an einem anderen Kreis	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.31	prop:Inversion-Kreis-an-Kreis	290	\N	f
331	\N	equation	131		\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.1	Schnittpunktanzahl-bleibt-unter-Inversion-erhalten	291	\N	f
332	\N	equation	131		\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.2	Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2	292	\N	f
333	\N	equation	131		\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.3	Inversion-fuer-verallgemeinerte-Geraden	293	\N	f
334	\N	lemma	132	Verhalten von Berührpunkten unter der Inversion	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.32	lemma:Beruehrpunkte-unter-der-Inversion	294	\N	f
335	\N	proposition	132	Verhalten von Tangenten unter der Inversion	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.33	prop:Inversion-und-Tangenten	295	\N	f
336	\N	definition	132	verallgemeinerte Winkelgröße	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.34	defn:verallgemeinerte-Winkelgroesse	296	\N	f
337	\N	theorem	133	Inversion ist winkeltreu	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.35	satz:Inversion-winkeltreu	297	\N	f
338	\N	definition	133	Doppelverhältnis	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.36	defn:Doppelverhaeltnis	298	\N	f
339	\N	proposition	133	Inversion erhält Doppelverhältnis	\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.37	prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis	299	\N	f
340	\N	equation	133		\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.4	DV-1	300	\N	f
341	\N	equation	134		\N	\N	39	33	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.5	DV-2	301	\N	f
342	\N	exercise	135		\N	\N	39	34	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.1	aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl	303	\N	f
343	\N	exercise	135		\N	\N	39	34	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.4	aufg:Peripheriewinkelsatz	304	\N	f
344	\N	exercise	135		\N	\N	39	34	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.5	aufg:Tangentenschnittpunkt-mit-Inversion	305	\N	f
345	\N	exercise	136	gleichseitiges Dreieck	\N	\N	39	34	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	4.6	aufg:gleichseitige-Dreiecke-SHU	306	\N	f
346	\N	definition	137	hyperbolische Ebene	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.1	defn:Hyperbolische-Ebene	309	\N	f
347	\N	definition	138	Endpunkte einer k-Geraden	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.2	defn:Endpunkte-von-k-Geraden	310	\N	f
348	\N	proposition	138	Poincaré'sches Kreismodell ist Inzidenzebene	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.3	prop:Kreismodell-ist-Inzidenzebene	311	\N	f
349	\N	equation	139		\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.1	I2-hyperbolisch	312	\N	f
350	\N	equation	140		\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.2	Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs	313	\N	f
351	\N	proposition	140	Poincaré'sches Kreismodell erfüllt Anordnungsaxiome	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.4	prop:Kreismodell-erfuellt-Anordnungsaxiome	314	\N	f
352	\N	equation	140		\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.3	hyperbolischer-Abstand	315	\N	f
353	\N	lemma	141	k-Anordnung von k-Punkten	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.5	lemma:k-Anordnung-von-k-Punkten	316	\N	f
354	\N	equation	141		\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.4	Kongruenz-von-k-Strecken	317	\N	f
355	\N	proposition	141	Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Strecken	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.6	prop:Kreismodell-erfuellt-Streckenkongruenzaxiome	318	\N	f
356	\N	proposition	142	Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Winkel	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.7	prop:Kreismodell-erfuellt-Winkelkongruenzaxiome	319	\N	f
357	\N	proposition	142	Existenz einer k-Bewegung, die gegebenen k-Punkt auf den Ursprung schickt	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.8	prop:k-Bewegung-in-den-Ursprung	320	\N	f
358	\N	proposition	143	Poincaré'sches Kreismodell erfüllt Vollständigkeitsaxiom	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.9	prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom	321	\N	f
359	\N	proposition	143	Poincaré'sche Kreismodell erfüllt das hyperbolische Axiom	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.10	prop:hyperbolisches-Axiom-im-Poincaremodell	322	\N	f
360	\N	theorem	144	Poincaré'sches Kreismodell ist hyperbolische Ebene	\N	\N	39	35	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.11	satz:Kreismodell-ist-hyperbolische-Ebene	323	\N	f
361	\N	equation	144		\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.5	Additionstheorem-cosh	325	\N	f
362	\N	equation	144		\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.6	hyperbolisches-Pythagorasaequivalent	326	\N	f
363	\N	lemma	144	k-Abstand zum Ursprung	\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.12	lemma:k-Abstand-zum-Ursprung	327	\N	f
364	\N	lemma	145	sinh und cosh vom k-Abstand zum Ursprung	\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.13	lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung	328	\N	f
365	\N	lemma	145	Projektion von k-Punkten auf die Verbindungssehne der Endpunkte der zugehörigen k-Geraden	\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.14	lemma:Norm-im-Klein-Modell	329	\N	f
366	\N	theorem	146	Trigonometrie im rechtwinkligen k-Dreieck	\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.15	satz:Trigonometrie-rechtwinkliges-k-Dreieck	330	\N	f
367	\N	theorem	148	hyperbolische Trigonometrie	\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.16	satz:hyperbolische-Trigonometrie	331	\N	f
368	\N	equation	149		\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.7	hyperbolische-Trigonometrie	332	\N	f
369	\N	theorem	150	Winkelsumme im k-Dreieck	\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.17	satz:Winkelsumme-im-k-Dreieck	333	\N	f
370	\N	equation	150		\N	\N	39	36	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.8	beta+gamma<pi	334	\N	f
371	\N	exercise	151		\N	\N	39	37	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.1	aufg:hyperbolische-Geradenspiegelung-ist-Bewegung	336	\N	f
372	\N	exercise	151		\N	\N	39	37	2020-07-24 17:04:35.432721	2020-07-24 17:04:35.432721	5.2	aufg:Poincarehalbebene	337	\N	f
373	\N	self	\N	\N	\N	\N	40	\N	2020-08-10 16:09:44.71675	2020-08-10 16:09:44.71675	\N	\N	\N	\N	\N
374	\N	self	\N	\N	\N	\N	41	\N	2020-09-01 14:30:02.680027	2020-09-01 14:30:02.680027	\N	\N	\N	\N	\N
375	\N	self	\N	\N	\N	\N	43	\N	2020-09-03 10:31:05.856671	2020-09-03 10:31:05.856671	\N	\N	\N	\N	\N
377	\N	self	\N	\N	\N	\N	45	\N	2020-11-28 16:23:26.315445	2020-11-28 16:23:26.315445	\N	\N	\N	\N	\N
378	\N	self	\N	\N	\N	\N	46	\N	2022-08-05 13:33:25.095664	2022-08-05 13:33:25.095664	\N	\N	\N	\N	\N
379	\N	self	\N	\N	\N	\N	47	\N	2022-08-05 14:30:40.3857	2022-08-05 14:30:40.3857	\N	\N	\N	\N	\N
380	\N	self	\N	\N	\N	\N	48	\N	2022-08-05 14:32:29.854954	2022-08-05 14:32:29.854954	\N	\N	\N	\N	\N
381	\N	self	\N	\N	\N	\N	49	\N	2022-08-05 14:33:54.44741	2022-08-05 14:33:54.44741	\N	\N	\N	\N	\N
382	\N	self	\N	\N	\N	\N	50	\N	2022-08-05 14:34:37.272206	2022-08-05 14:34:37.272206	\N	\N	\N	\N	\N
383	\N	self	\N	\N	\N	\N	51	\N	2022-08-05 14:35:35.032096	2022-08-05 14:35:35.032096	\N	\N	\N	\N	\N
384	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	section	\N	Vorüberlegungen	\N	\N	47	\N	2022-08-05 15:09:36.618058	2022-08-05 15:09:36.618058		\N	\N	\N	f
385	--- &1 !ruby/object:TimeStamp\nmilliseconds: 719\nminutes: 0\nseconds: 14\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	example	\N	Beispiel - Schritt 1	\N	\N	47	\N	2022-08-05 15:10:00.484351	2022-08-05 15:10:00.484351		\N	\N	\N	f
386	--- &1 !ruby/object:TimeStamp\nmilliseconds: 129\nminutes: 0\nseconds: 36\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	example	\N	Beispiel - Schritt 2	\N	\N	47	\N	2022-08-05 15:10:21.426082	2022-08-05 15:10:21.426082		\N	\N	\N	f
387	\N	link	\N	Irreduzibilitätskriterium nach Eisenstein	https://de.wikipedia.org/wiki/Eisensteinkriterium	Hier ein Wikipedia-Link zum Eisensteinkriterium.	\N	\N	2022-08-05 15:13:01.877288	2022-08-05 15:13:01.877288	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4229 (class 0 OID 26396)
-- Dependencies: 251
-- Data for Name: lecture_user_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lecture_user_joins (id, lecture_id, user_id, created_at, updated_at) FROM stdin;
1	1	2	2020-07-24 13:26:34.78275	2020-07-24 13:26:34.78275
4	2	2	2020-07-24 16:59:10.061397	2020-07-24 16:59:10.061397
5	3	2	2020-07-24 17:05:22.957752	2020-07-24 17:05:22.957752
8	4	2	2020-08-10 16:38:18.69896	2020-08-10 16:38:18.69896
20	4	1	2020-08-13 12:31:01.423026	2020-08-13 12:31:01.423026
22	2	1	2020-08-14 12:23:05.090946	2020-08-14 12:23:05.090946
64	1	5	2020-11-28 16:26:26.788855	2020-11-28 16:26:26.788855
65	3	5	2020-11-28 16:26:28.410175	2020-11-28 16:26:28.410175
66	1	6	2020-11-28 16:27:28.091405	2020-11-28 16:27:28.091405
67	4	6	2020-11-28 16:27:29.627032	2020-11-28 16:27:29.627032
68	3	6	2020-11-28 16:27:30.783394	2020-11-28 16:27:30.783394
69	1	7	2020-11-28 16:28:40.697551	2020-11-28 16:28:40.697551
70	4	7	2020-11-28 16:28:42.415407	2020-11-28 16:28:42.415407
71	3	7	2020-11-28 16:28:43.234317	2020-11-28 16:28:43.234317
72	3	8	2020-11-28 16:29:33.472718	2020-11-28 16:29:33.472718
73	1	8	2020-11-28 16:29:34.762145	2020-11-28 16:29:34.762145
74	4	8	2020-11-28 16:29:35.639406	2020-11-28 16:29:35.639406
75	1	9	2020-11-28 16:31:41.405253	2020-11-28 16:31:41.405253
76	3	9	2020-11-28 16:31:42.393021	2020-11-28 16:31:42.393021
77	2	9	2020-11-28 16:31:48.809191	2020-11-28 16:31:48.809191
78	1	10	2020-11-28 16:35:00.996356	2020-11-28 16:35:00.996356
79	4	10	2020-11-28 16:35:02.070113	2020-11-28 16:35:02.070113
80	3	10	2020-11-28 16:35:03.086974	2020-11-28 16:35:03.086974
81	27	5	2022-08-05 13:22:20.38792	2022-08-05 13:22:20.38792
82	27	2	2022-08-05 13:23:08.208443	2022-08-05 13:23:08.208443
83	3	1	2022-08-05 13:43:22.252941	2022-08-05 13:43:22.252941
84	27	1	2022-08-05 13:55:28.690828	2022-08-05 13:55:28.690828
85	1	1	2022-08-05 14:16:57.55146	2022-08-05 14:16:57.55146
86	26	1	2022-08-05 14:18:41.927074	2022-08-05 14:18:41.927074
\.


--
-- TOC entry 4231 (class 0 OID 26400)
-- Dependencies: 253
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lectures (id, created_at, updated_at, course_id, term_id, teacher_id, start_chapter, absolute_numbering, start_section, organizational_concept, organizational, muesli, released, content_mode, passphrase, locale, sort, forum_id, structure_ids, comments_disabled, organizational_on_top, disable_teacher_display, submission_max_team_size, submission_grace_period, legacy_seminar) FROM stdin;
24	2020-08-12 10:25:53.80801	2020-09-07 12:25:30.26636	1	3	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	\N	video	\N	de	lecture	\N	\N	\N	\N	f	\N	15	f
25	2020-08-12 10:26:24.860043	2020-09-07 12:25:30.26636	1	2	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	video	test	de	lecture	\N	\N	\N	\N	f	\N	15	f
1	2020-07-24 13:17:08.173027	2022-09-20 10:34:42.729475	1	4	2	0	t	0	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	1	---\n- 1\n	\N	\N	f	2	15	f
2	2020-07-24 16:52:00.370572	2022-08-05 14:06:57.280964	2	2	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	2	\N	\N	\N	f	\N	15	f
26	2020-09-01 09:16:03.22769	2022-08-05 14:47:48.139782	2	1	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	\N	video	\N	de	lecture	\N	\N	\N	\N	f	\N	15	f
3	2020-07-24 17:01:18.424312	2022-08-05 14:47:48.139782	3	1	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	manuscript		de	lecture	\N	\N	\N	\N	f	\N	15	f
4	2020-08-10 12:56:57.917228	2022-09-02 16:52:53.227357	4	\N	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	f	all	video		de	special	\N	\N	\N	t	t	\N	15	f
27	2022-08-05 13:19:57.44893	2022-08-05 15:10:44.123936	2	1	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Seminar: Do 14-16 Uhr im SR 4 im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Tutorium: n.V. bei <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a></li><li>Vorbesprechung: Mi, 24. Juli 2019, 13.15 Uhr in SR 3&nbsp; im Mathematikon, INF 205</li></ul><div><br></div><div><strong>Vorträge</strong></div><div><br>Im Seminar wird jede TeilnehmerIn einen Vortrag halten. Die Vorträge werden bei der <strong>Vorbesprechung</strong> vergeben. Ob nach der Vorbesprechung noch Themen frei sind, können Sie bei der DozentIn in Erfahrung bringen. Beim Vortrag sollen Sie&nbsp; den Ihnen zugewiesenen Stoff in der Ihnen zugewiesenen Zeit behandeln - und zwar so, dass jeder dass jeder der Anwesenden davon profitiert. Um das zu erreichen, ist es wichtig, dass Sie <em>frühzeitig</em> mit der Vorbereitung Ihres Vortrags beginnen. Außerdem erwarten wir, dass Sie rechtzeitig vor dem Vortrag Kontakt mit <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a> aufnehmen, um Details zum Inhalt und zur Strukturierung des Vortrags zu besprechen. Rechtzeitig wäre beispielsweise zwei Wochen vor Ihrem Vortrag - eine Viertelstunde vor Vortragsbeginn ist nicht rechtzeitig. Sie sollten daraufhin arbeiten, sämtliche Details ihres Vortragsinhaltes gründlich zu verstehen. Auf der anderen Seite ist es wichtig für Ihren Vortrag, dass Sie diesen so gestalten, dass Ihre KommilitonInnen - für die der Inhalt Ihres Vortrages in der Regel neu sein wird - eine Chance haben, diesen auch zu verstehen. Viele nützliche Hinweise zum Halten mathematischer Vorträge finden Sie <a href="http://download.uni-mainz.de/mathematik/Topologie%20und%20Geometrie/Lehre/Wie-halte-ich-einen-Seminarvortrag.pdf">hier</a>.<br><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen des Vortrags notwendig.</li><li>Die Anmeldung zum Vortrag erfolgt über MÜSLI. Die Anmeldung wird am 15. August 2019 geschlossen. Wer danach noch im MÜSLI für das Seminar eingetragen ist, erhält bei Nichtabhalten seines/ihres Vortrags die Note 5 (nicht bestanden).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note des bestandenen Vortrags, bzw. der Note 5.0, wenn der Vortrag nicht bestanden oder nicht abgehalten wurde.</li></ul>	\N	\N	all	video	key	en	seminar	\N	\N	\N	\N	f	\N	15	f
\.


--
-- TOC entry 4233 (class 0 OID 26408)
-- Dependencies: 255
-- Data for Name: lesson_section_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lesson_section_joins (id, lesson_id, section_id, created_at, updated_at) FROM stdin;
1	1	2	2020-07-24 13:46:15.948704	2020-07-24 13:46:15.948704
2	2	2	2020-07-24 13:47:35.468858	2020-07-24 13:47:35.468858
3	3	1	2020-07-24 13:48:26.582297	2020-07-24 13:48:26.582297
4	4	1	2020-07-24 13:49:04.251157	2020-07-24 13:49:04.251157
5	5	1	2020-07-24 13:49:32.420395	2020-07-24 13:49:32.420395
6	6	3	2020-07-24 13:49:56.844028	2020-07-24 13:49:56.844028
7	7	4	2020-07-24 13:50:20.229042	2020-07-24 13:50:20.229042
8	8	4	2020-07-24 13:50:41.379453	2020-07-24 13:50:41.379453
9	9	5	2020-07-24 13:52:24.411115	2020-07-24 13:52:24.411115
10	10	6	2020-07-24 13:52:50.736652	2020-07-24 13:52:50.736652
12	12	7	2020-07-24 16:53:25.580048	2020-07-24 16:53:25.580048
\.


--
-- TOC entry 4235 (class 0 OID 26412)
-- Dependencies: 257
-- Data for Name: lesson_tag_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lesson_tag_joins (id, lesson_id, tag_id, created_at, updated_at) FROM stdin;
1	1	1	2020-07-24 13:46:15.929507	2020-07-24 13:46:15.929507
2	1	2	2020-07-24 13:46:15.93175	2020-07-24 13:46:15.93175
3	1	3	2020-07-24 13:46:15.933796	2020-07-24 13:46:15.933796
4	1	4	2020-07-24 13:46:15.935893	2020-07-24 13:46:15.935893
7	1	7	2020-07-24 13:46:15.943357	2020-07-24 13:46:15.943357
8	1	8	2020-07-24 13:46:15.945635	2020-07-24 13:46:15.945635
15	2	5	2020-07-24 13:47:35.463436	2020-07-24 13:47:35.463436
16	2	6	2020-07-24 13:47:35.465891	2020-07-24 13:47:35.465891
17	3	9	2020-07-24 13:48:26.568412	2020-07-24 13:48:26.568412
18	3	14	2020-07-24 13:48:26.57063	2020-07-24 13:48:26.57063
20	3	11	2020-07-24 13:48:26.575075	2020-07-24 13:48:26.575075
25	4	10	2020-07-24 13:49:04.242048	2020-07-24 13:49:04.242048
27	4	12	2020-07-24 13:49:04.246537	2020-07-24 13:49:04.246537
33	5	12	2020-07-24 13:49:32.414052	2020-07-24 13:49:32.414052
34	5	13	2020-07-24 13:49:32.417299	2020-07-24 13:49:32.417299
35	6	15	2020-07-24 13:49:56.828604	2020-07-24 13:49:56.828604
36	6	16	2020-07-24 13:49:56.831459	2020-07-24 13:49:56.831459
37	6	17	2020-07-24 13:49:56.834853	2020-07-24 13:49:56.834853
38	6	18	2020-07-24 13:49:56.840978	2020-07-24 13:49:56.840978
39	7	19	2020-07-24 13:50:20.22026	2020-07-24 13:50:20.22026
40	7	20	2020-07-24 13:50:20.223117	2020-07-24 13:50:20.223117
44	8	21	2020-07-24 13:50:41.376514	2020-07-24 13:50:41.376514
45	9	22	2020-07-24 13:52:24.405201	2020-07-24 13:52:24.405201
46	9	23	2020-07-24 13:52:24.40849	2020-07-24 13:52:24.40849
47	10	24	2020-07-24 13:52:50.727549	2020-07-24 13:52:50.727549
48	10	25	2020-07-24 13:52:50.730863	2020-07-24 13:52:50.730863
53	4	27	2020-07-24 16:14:14.710248	2020-07-24 16:14:14.710248
54	4	28	2020-07-24 16:14:14.71375	2020-07-24 16:14:14.71375
55	12	29	2020-07-24 16:54:01.716525	2020-07-24 16:54:01.716525
\.


--
-- TOC entry 4237 (class 0 OID 26416)
-- Dependencies: 259
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lessons (id, date, lecture_id, created_at, updated_at, start_destination, end_destination, details) FROM stdin;
12	2019-10-21	2	2020-07-24 16:53:25.575141	2022-08-05 14:06:57.252287	\N	\N	
5	2020-05-05	1	2020-07-24 13:49:32.40135	2022-09-20 10:34:42.713344	\N	\N	
6	2020-05-07	1	2020-07-24 13:49:56.825933	2022-09-20 10:34:42.713344	\N	\N	\N
7	2020-05-12	1	2020-07-24 13:50:20.217324	2022-09-20 10:34:42.713344	\N	\N	
8	2020-05-14	1	2020-07-24 13:50:41.367319	2022-09-20 10:34:42.713344	\N	\N	
1	2020-04-21	1	2020-07-24 13:46:15.926855	2022-09-20 10:34:42.713344	\N	\N	
2	2020-04-23	1	2020-07-24 13:47:35.445993	2022-09-20 10:34:42.713344	\N	\N	
3	2020-04-28	1	2020-07-24 13:48:26.566012	2022-09-20 10:34:42.713344	\N	\N	
9	2020-05-19	1	2020-07-24 13:52:24.40245	2022-09-20 10:34:42.713344	\N	\N	
4	2020-04-30	1	2020-07-24 13:49:04.235057	2022-09-20 10:34:42.713344	\N	\N	
10	2020-05-28	1	2020-07-24 13:52:50.724565	2022-09-20 10:34:42.713344	\N	\N	
\.


--
-- TOC entry 4239 (class 0 OID 26422)
-- Dependencies: 261
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, medium_id, linked_medium_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4241 (class 0 OID 26426)
-- Dependencies: 263
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.media (id, external_reference_link, created_at, updated_at, sort, description, teachable_type, teachable_id, video_data, screenshot_data, manuscript_data, released, imported_manuscript, quizzable_type, quizzable_id, hint, parent_id, quiz_graph, level, type, text, independent, keks_id, locale, solution, question_sort, content, geogebra_data, geogebra_app_name, "position", text_input, boost, released_at, publisher, file_last_edited) FROM stdin;
42	\N	2020-09-02 11:47:59.54323	2020-09-02 11:47:59.54323	RandomQuiz	Zufallsquiz Lineare Algebra 2 2020-09-02 11:47:59 +0000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 17\n  2:\n    :type: Question\n    :id: 18\n  3:\n    :type: Question\n    :id: 35\n  4:\n    :type: Question\n    :id: 20\n  5:\n    :type: Question\n    :id: 37\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	f	0	\N	\N	\N
28	\N	2020-07-24 16:23:22.686316	2022-09-20 10:34:42.711631	Question	Ideale in Z Division mit Rest	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Sei wie zuvor $0 \\neq I\\subset \\mathbb{Z}$ ein Ideal und $x \\in I$ die kleinste natürliche Zahl in $I$. Sei weiterhin $y \\in I$ ein weiteres Element. Mit Hilfe von Division mit Rest finden wir ein $a \\in \\mathbb{Z}$ und ein $0 \\leq r < \\lvert x\\rvert$ mit $$y = ax+r.$$\nWas können wir ableiten?	f	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	16	f	0	2020-07-24 16:23:22.686316	\N	\N
43	\N	2020-09-03 10:31:05.824135	2020-09-07 12:25:30.264455	Quiz	Testquiz	Course	1	\N	\N	\N	all	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 24\nedges: {}\nroot: 1\ndefault_table:\n  1: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	f	0	2020-09-03 10:31:05.824135	\N	\N
39	\N	2020-07-24 17:03:37.785021	2022-08-05 14:47:48.142248	Script	Vorlesungsskript	Lecture	3	\N	\N	{"id":"medium/39/manuscript/02c2ff5ef750d0b3bdbd44dad9b0ceea.pdf","storage":"store","metadata":{"filename":"Skript.V.Geo.SS20.Vorlesungsskript.pdf","size":6388579,"mime_type":"application/pdf","pages":152,"destinations":["chap:Analytische-Geometrie","sect:Affine-Raeume","defn:affiner-Raum","defn:affine-Dimension","bsp:affiner-Standardraum","Aktion-der-Translationen","Vektoraddition","defn:affiner-Unterraum","bsp:affine-Unterraeume","prop:Dimension-affiner-Unterraum","defn:Dimension-affiner-Unterraum","prop:affine-Unterraeume-sind-affine-Raeume","prop:Durchschnitt-und-Verbindungsraum-affin","Durchschnitt","Verbindungsraum-Fall-1","Verbindungsraum-Fall-2","satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","satz:Dimensionsformel-fuer-affine-Unterraeume","defn:parallel-und-windschief","bem:keine-windschiefen-Hyperebenen","bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sect:Affine-Abbildungen","defn:affine-Abbildung","affine-Abbildung","bsp:affine-Abb","prop:Kriterium-fuer-affine-Abbildung","prop:Zusammenhang-affine-und-lineare-Abbildungen","affine-Abbildung-aus-linearer-Abbildung","bsp:affine-Abbildungen-in-der-affinen-Standardebene","W-Bahn","prop:Parallelprojektion","defn:kollinear","defn:n-Eck","defn:Parallelogramm","prop:affine-Abbildungen-erhalten-Parallelogramme","affine-Abbildungen-erhalten-Parallelogramme","Bild-ist-Parallelogramm-1","Bild-ist-Parallelogramm-2","gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht","sect:Affine-Koordinaten","defn:affine-Basis","bsp:Standardbasis-des-affinen-Standardraums","bem:affine-Unabhaengigkeit","satz:affine-Abbildung","defn:affines-Koordinatensystem","defn:Teilverhaeltnis","Teilverhaeltnis","bem:Teilverhaeltnis-in-Standardraum","prop:TV-affine-Invariante","satz:affiner-Strahlensatz","defn:Mittelpunkt","satz:Diagonalensatz","satz:Schwerpunktsatz","defn:Winkel-affin","euklidisches-Winkelmass","Winkelgroesse","defn:Seitenlaengen-und-Innenwinkelgroessen","satz:Kosinussatz","Kosinussatz","coro:Pythagoras","satz:Winkelsumme-im-Dreieck","Winkelsumme-Kosinuswerte","Sinus-des-Winkelmasses","Rechnung-zu-Cauchy-Schwartz","Winkelsumme-Sinuswerte","satz:Sinussatz","coro:Hypothenuse-und-Katheten","sect:Polytope","defn:Polytop","bsp:Durchschnitt-von-Halbraeumen","bem:Rand-eines-Polytops","defn:Ecken-Kanten-Flaechen","bsp:Wuerfel","satz:Polyederformel","defn:Platonischer-Koerper","prop:Polytop","coro:Platonische-Koerper","defn:Aehnlichkeitsabbildung-analytisch","satz:Klassifikation-der-Platonischen-Koerper","sect:Projektive-Raeume","defn:projektiver-Raum","bsp:projektiver-Standardraum","bsp:Einbettungen-projektiver-Standardraeume","defn:projektiver-Unterraum","prop:Durchschnitt-und-Verbindungsraum-projektiv","abb:Boyflaeche","Beschreibung-projektiver-Verbindungsraum","satz:Dimensionsformel-fuer-projektive-Unterraeume","sect:Projektive-Abbildungen","defn:projektive-Abbildung","prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb","bsp:kanonische-Einbettung","defn:Zentralprojektion","Wohldefiniertheit-Zentralprojektion-1","Wohldefiniertheit-Zentralprojektion-2","bem:Beschreibung-Zentralprojektion","prop:Zentralprojektionen-sind-Projektivitaeten","satz:projektiver-Abschluss","bsp:projektiver-Abschluss","ZcapX","dim-ZcapX","sect:Projektive-Koordinaten","defn:projektive-Basis","bsp:kanonische-projektive-Basis","abb:projektive-Standardbasis","lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis","satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph","defn:projektives-Koordinatensystem","defn:Doppelverhaeltnis-projektiv","prop:DV-projektive-Invariante","DV-projektive-Invariante","prop:DV-Berechnung","bem:Zusammenhang-DV-und-TV","satz:projektiver-Desargues","sect:Computergraphik","Transformationen-in-R3","defn:Quader","defn:Kegelstumpf","sect:Uebungsaufgaben-Analytische-Geometrie","aufg:Verbindungsgerade-ist-Gerade","aufg:Eigenschaften-affiner-Abbildungen","aufg:Abbildungsgeometrie","aufg:Tangenssatz","aufg:Heronsche-Formel","aufg:Vergleich-rechtwinkliger-Dreiecke","aufg:Durchschnitt-Gerade-mit-Einheitssphaere","aufg:fast-jede-Projektivitaet-ist-Zentralprojektion","aufg:projektiver-Pappos","chap:Inzidenzgeometrie","sect:Inzidenzebenen","defn:Inzidenzebene","bsp:Inzidenzebene","prop:Geradenschnittpunkt","prop:Kriterium-Punkt-auf-Gerade","prop:Trennung-von-Punkt-und-Gerade","satz:A2(K)-Inzidenzebene","bem:Parallelitaet-in-A2(K)","defn:Isomorphismus-von-Inzidenzebenen","bsp:affine-Ebenen-sind-Inzidenzebenen","sect:affine-Ebenen","defn:Parallelenaxiome","defn:affine-Ebene","bsp:Parallelenaxiome","prop:Parallelitaet-Aequivalenzrelation","defn:Parallelenbueschel-und-Geradenbueschel","bsp:Parallelenbueschel-und-Geradenbueschel","defn:affiner-Isomorphismus","bsp:affiner-Isomorphismus","sect:Uebungsaufgaben-Inzidenzgeometrie","aufg:Isomorphismen-von-Inzidenzebenen","aufg:affine-Ebene-mit-fuenf-Punkten","aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig","chap:Hilbertebenen","sect:Anordnungsaxiome","defn:Anordnungsaxiome","prop:Seiten-einer-Geraden","abb:Geradenseiten","bsp:affine-Standardebene-und-Anordnung","Anordnung-fuer-affine-Standardebenen","Hessesche-Normalform","defn:Lage-auf-verschiedenen-Geradenseiten","prop:Seiten-von-Geraden-und-Punkten","coro:Seiten-eines-Punktes","defn:Anordnung-vieler-Punkte","prop:Anordnung-von-Punkten-auf-Geraden","bem:alternatives-Anordnungsaxiom","defn:strecke-und-strahl","prop:Strecken-und-Strahlen","prop:gerade-vereinigung-von-strahlen","satz:Pasch","sect:Die-Kongruenzaxiome-fuer-Strecken","defn:Kongruenzaxiome-fuer-Strecken","bsp:affine-Standardebene-und-Kongruenzen-von-Strecken","prop:Streckensubtraktion","defn:<-fuer-Strecken","prop:<-fuer-Strecken","sect:Kongruenzaxiome-fuer-Winkel","defn:Winkel","abb:Winkel","prop:winkel","defn:Inneres-eines-Winkels","lemma:im-Inneren-eines-Winkels","defn:Kongruenzaxiome-fuer-Winkel","defn:<-fuer-Winkel","prop:<-fuer-Winkel","defn:Dreieck","bem:dreieck","defn:ebene-Geometrie","defn:Bewegung","bsp:Bewegungen-in-der-affinen-Standardebene","defn:gvB","satz:genug-Bewegung","Voraussetzungen-SWS","bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln","Kongruenz-von-Winkeln-in-der-affinen-Standardebene","sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel","defn:Ergaenzungswinkel-Gegenwinkel","prop:Ergaenzungswinkel","coro:Gegenwinkel","defn:rechter-Winkel","prop:rechter-Winkel","satz:Viertes-euklidisches-Postulat","coro:rechte-Winkel","sect:Orthogonalitaet-und-Parallelitaet","defn:orthogonal","satz:Orthogonale-Gerade","abb:Orthogonale","defn:Wechselwinkel-und-Stufenwinkel","bem:Wechselwinkel-und-Stufenwinkel","satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz","coro:zum-schwachen-wws","coro:Lot-eindeutig","coro:Existenz-von-Parallelen","satz:Parallelenaxiom-in-Hilbertebenen","sect:Kongruenzsatz","prop:eindeutiges-Dreieck","defn:gleichschenkliges-Dreieck","prop:gleichschenkliges-Dreieck","prop:Winkeladdsubtraktion","satz:Kongruenzsatz-fuer-Dreiecke","wsw-1","sect:Mittelsenkrechte-und-Winkelhalbierende","defn:Streckenmittelpunkt","lemma:Mittelpunkt-liegt-zwischen-Randpunkten","satz:Mittelpunkt","Mittelpunkt-1","Mittelpunkt-2","defn:Mittelsenkrechte","prop:Charakterisierung-Mittelsenkrechte","defn:Winkelhalbierende","prop:Existenz-der-Winkelhalbierenden","sect:Innen-und-Aussenwinkel-im-Dreieck","defn:Innenwinkel","prop:schwache-Winkelsumme-im-Dreieck-1","schwache-Winkelsumme-im-Dreieck","satz:Aussenwinkelsatz","satz:grosse-Dreiecksseite-hat-grossen-Winkel","abb:grosse-Dreiecksseite-hat-grossen-Winkel","satz:SSrechterWinkel","sect:Kreise","defn:Kreis","prop:Kreise-haben-genau-einen-Mittelpunkt","satz:Umkreissatz","defn:Hoehe","satz:Hoehensatz","satz:Inkreissatz","sect:Uebungsaufgaben-Hilbertebenen","aufg:Anordnung-von-Punkten-auf-Geraden","aufg:unendlich-viele-Punkte-mit-I-+-A","aufg:Anordnung-Modell-alternativ","aufg:<-fuer-Winkel","aufg:Inneres-bestimmt-den-Winkel","aufg:konvexe-Mengen","aufg:Parallelogramm-synthetisch","aufg:Spiegelungen-in-Hilbertebenen","aufg:Abschaetzung-Abstand-Punkt-Gerade","aufg:Hoehenformel","chap:Euklidische-Geometrie-kurz","sect:Vollstaendigkeitsaxiom","defn:Dedekindschnitt","defn:Vollstaendigkeitsaxiom","bsp:Vollstaendigkeitsaxiom","satz:Archimedisches-Axiom","sect:Euklidische-Ebenen","defn:Euklidsche-Ebene","defn:Isomorphismus-euklidischer-Ebenen","satz:Hauptsatz-fuer-euklidische-Ebenen","prop:Groesse-der-Winkelsumme","sect:Kreise-in-der-euklidischen-Ebene","prop:Durchschnitt-Kreis-Gerade","coro:Tangente","defn:Potenz","satz:Zweisehnensatz","satz:Sehnen-Tangenten-Satz","prop:potenzgerade","satz:Kreis-Kreis-Schnitt-Eigenschaft","coro:Kreis-Kreis-Schnitt-Eigenschaft","satz:Peripheriewinkelsatz","satz:Thales","satz:Sinussatz-Verschaerfung","satz:Eulergleichung","coro:Eulergerade","sect:Inversion-am-Kreis","defn:Inversion-am-Kreis","prop:Inversionen-am-Kreis-sind-bijektiv","prop:Tangentenschnittpunkt-mit-Inversion","prop:Eigenschaften-der-Inversion","defn:verallgemeinerte-Gerade","prop:orthogonale-verallgemeinerte-Geraden","prop:orthogonale-Kreise","prop:Inversion-Kreis-an-Kreis","Schnittpunktanzahl-bleibt-unter-Inversion-erhalten","Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2","Inversion-fuer-verallgemeinerte-Geraden","lemma:Beruehrpunkte-unter-der-Inversion","prop:Inversion-und-Tangenten","defn:verallgemeinerte-Winkelgroesse","satz:Inversion-winkeltreu","defn:Doppelverhaeltnis","prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis","DV-1","DV-2","sect:Uebungsaufgaben-Euklidische-Geometrie","aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl","aufg:Peripheriewinkelsatz","aufg:Tangentenschnittpunkt-mit-Inversion","aufg:gleichseitige-Dreiecke-SHU","chap:Nichteuklidsche-Geometrie","sect:Hyperbolische-Ebenen","defn:Hyperbolische-Ebene","defn:Endpunkte-von-k-Geraden","prop:Kreismodell-ist-Inzidenzebene","I2-hyperbolisch","Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs","prop:Kreismodell-erfuellt-Anordnungsaxiome","hyperbolischer-Abstand","lemma:k-Anordnung-von-k-Punkten","Kongruenz-von-k-Strecken","prop:Kreismodell-erfuellt-Streckenkongruenzaxiome","prop:Kreismodell-erfuellt-Winkelkongruenzaxiome","prop:k-Bewegung-in-den-Ursprung","prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom","prop:hyperbolisches-Axiom-im-Poincaremodell","satz:Kreismodell-ist-hyperbolische-Ebene","sect:Hyperbolische-Geometrie","Additionstheorem-cosh","hyperbolisches-Pythagorasaequivalent","lemma:k-Abstand-zum-Ursprung","lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung","lemma:Norm-im-Klein-Modell","satz:Trigonometrie-rechtwinkliges-k-Dreieck","satz:hyperbolische-Trigonometrie","hyperbolische-Trigonometrie","satz:Winkelsumme-im-k-Dreieck","beta+gamma<pi","sect:Uebungsaufgaben-Nichteuklidische-Geometrie","aufg:hyperbolische-Geradenspiegelung-ist-Bewegung","aufg:Poincarehalbebene"],"bookmarks":[{"destination":"chap:Analytische-Geometrie","sort":"Kapitel","label":"1","description":"Analytische Geometrie","chapter":"1","section":"1.0","subsection":"1.0.0","page":"3","counter":0},{"destination":"sect:Affine-Raeume","sort":"Abschnitt","label":"1.1","description":"Affine Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"3","counter":1},{"destination":"defn:affiner-Raum","sort":"Definition","label":"1.1","description":"affiner Raum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"3","counter":2},{"destination":"defn:affine-Dimension","sort":"Definition","label":"1.2","description":"affine Dimension","chapter":"1","section":"1.1","subsection":"1.1.0","page":"4","counter":3},{"destination":"bsp:affiner-Standardraum","sort":"Beispiel","label":"1.3","description":"affiner Standardraum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"4","counter":4},{"destination":"Aktion-der-Translationen","sort":"Gleichung","label":"1.1","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":5},{"destination":"Vektoraddition","sort":"Gleichung","label":"1.2","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":6},{"destination":"defn:affiner-Unterraum","sort":"Definition","label":"1.4","description":"affiner Unterraum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":7},{"destination":"bsp:affine-Unterraeume","sort":"Beispiel","label":"1.5","description":"affine Unterräume der affinen Standardräume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":8},{"destination":"prop:Dimension-affiner-Unterraum","sort":"Proposition","label":"1.6","description":"Beliebigkeit des Aufpunkts eines affinen Unterraums","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":9},{"destination":"defn:Dimension-affiner-Unterraum","sort":"Definition","label":"1.7","description":"Dimension eines affinen Unterraums","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":10},{"destination":"prop:affine-Unterraeume-sind-affine-Raeume","sort":"Proposition","label":"1.8","description":"affine Unterräume sind affine Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":11},{"destination":"prop:Durchschnitt-und-Verbindungsraum-affin","sort":"Proposition","label":"1.9","description":"Durchschnitt und Verbindungsraum affiner Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":12},{"destination":"Durchschnitt","sort":"Gleichung","label":"1.3","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":13},{"destination":"Verbindungsraum-Fall-1","sort":"Gleichung","label":"1.4","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":14},{"destination":"Verbindungsraum-Fall-2","sort":"Gleichung","label":"1.5","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"8","counter":15},{"destination":"satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sort":"Satz","label":"1.10","description":"Verbindungsraum als Vereinigung von Verbindungsgeraden","chapter":"1","section":"1.1","subsection":"1.1.0","page":"9","counter":16},{"destination":"satz:Dimensionsformel-fuer-affine-Unterraeume","sort":"Satz","label":"1.11","description":"Dimensionsformel für affine Unterräume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"9","counter":17},{"destination":"defn:parallel-und-windschief","sort":"Definition","label":"1.12","description":"parallel und windschief","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":18},{"destination":"bem:keine-windschiefen-Hyperebenen","sort":"Bemerkung","label":"1.13","description":"eine Hyperebene ist zu keinem affinen Unterraum windschief","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":19},{"destination":"bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sort":"Bemerkung","label":"1.14","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":20},{"destination":"sect:Affine-Abbildungen","sort":"Abschnitt","label":"1.2","description":"Affine Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":21},{"destination":"defn:affine-Abbildung","sort":"Definition","label":"1.15","description":"affine Abbildung","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":22},{"destination":"affine-Abbildung","sort":"Gleichung","label":"1.6","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":23},{"destination":"bsp:affine-Abb","sort":"Beispiel","label":"1.16","description":"affine Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":24},{"destination":"prop:Kriterium-fuer-affine-Abbildung","sort":"Proposition","label":"1.17","description":"Kriterium für affine Abbildung","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":25},{"destination":"prop:Zusammenhang-affine-und-lineare-Abbildungen","sort":"Proposition","label":"1.18","description":"Zusammenhang zwischen affinen und linearen Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":26},{"destination":"affine-Abbildung-aus-linearer-Abbildung","sort":"Gleichung","label":"1.7","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"12","counter":27},{"destination":"bsp:affine-Abbildungen-in-der-affinen-Standardebene","sort":"Beispiel","label":"1.19","description":"affine Abbildungen in der affinen Standardebene","chapter":"1","section":"1.2","subsection":"1.2.0","page":"12","counter":28},{"destination":"W-Bahn","sort":"Gleichung","label":"1.8","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"13","counter":29},{"destination":"prop:Parallelprojektion","sort":"Proposition","label":"1.20","description":"Parallelprojektionen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"13","counter":30},{"destination":"defn:kollinear","sort":"Definition","label":"1.21","description":"kollinear","chapter":"1","section":"1.2","subsection":"1.2.0","page":"14","counter":31},{"destination":"defn:n-Eck","sort":"Definition","label":"1.22","description":"n-Eck","chapter":"1","section":"1.2","subsection":"1.2.0","page":"14","counter":32},{"destination":"defn:Parallelogramm","sort":"Definition","label":"1.23","description":"Parallelogramm","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":33},{"destination":"prop:affine-Abbildungen-erhalten-Parallelogramme","sort":"Proposition","label":"1.24","description":"affine Abbildungen erhalten Parallelogramme","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":34},{"destination":"affine-Abbildungen-erhalten-Parallelogramme","sort":"Gleichung","label":"1.9","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":35},{"destination":"Bild-ist-Parallelogramm-1","sort":"Gleichung","label":"1.10","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":36},{"destination":"Bild-ist-Parallelogramm-2","sort":"Gleichung","label":"1.11","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":37},{"destination":"gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht","sort":"Gleichung","label":"1.12","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":38},{"destination":"sect:Affine-Koordinaten","sort":"Abschnitt","label":"1.3","description":"Affine Koordinaten","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":39},{"destination":"defn:affine-Basis","sort":"Definition","label":"1.25","description":"affine Basis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":40},{"destination":"bsp:Standardbasis-des-affinen-Standardraums","sort":"Beispiel","label":"1.26","description":"Standardbasis des affinen Standardraums","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":41},{"destination":"bem:affine-Unabhaengigkeit","sort":"Bemerkung","label":"1.27","description":"affine Unabhängigkeit hängt nicht von der Reihenfolge ab","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":42},{"destination":"satz:affine-Abbildung","sort":"Satz","label":"1.28","description":"Eindeutigkeit der affinen Abbildung mit gegebenen Bildern einer affinen Basis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"17","counter":43},{"destination":"defn:affines-Koordinatensystem","sort":"Definition","label":"1.29","description":"affines Koordinatensystem","chapter":"1","section":"1.3","subsection":"1.3.0","page":"17","counter":44},{"destination":"defn:Teilverhaeltnis","sort":"Definition","label":"1.30","description":"Teilverhältnis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":45},{"destination":"Teilverhaeltnis","sort":"Gleichung","label":"1.13","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":46},{"destination":"bem:Teilverhaeltnis-in-Standardraum","sort":"Bemerkung","label":"1.31","description":"Teilverhältnis im affinen Standardraum","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":47},{"destination":"prop:TV-affine-Invariante","sort":"Proposition","label":"1.32","description":"Teilverhältnis ist affine Invariante","chapter":"1","section":"1.3","subsection":"1.3.0","page":"19","counter":48},{"destination":"satz:affiner-Strahlensatz","sort":"Satz","label":"1.33","description":"Strahlensatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"19","counter":49},{"destination":"defn:Mittelpunkt","sort":"Definition","label":"1.35","description":"Mittelpunkt","chapter":"1","section":"1.3","subsection":"1.3.0","page":"21","counter":50},{"destination":"satz:Diagonalensatz","sort":"Satz","label":"1.36","description":"Diagonalensatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"21","counter":51},{"destination":"satz:Schwerpunktsatz","sort":"Satz","label":"1.37","description":"Schwerpunktsatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"22","counter":52},{"destination":"defn:Winkel-affin","sort":"Definition","label":"1.38","description":"Strecke, Strahl und Winkel","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":53},{"destination":"euklidisches-Winkelmass","sort":"Gleichung","label":"1.14","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":54},{"destination":"Winkelgroesse","sort":"Gleichung","label":"1.15","description":"Winkelgröße","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":55},{"destination":"defn:Seitenlaengen-und-Innenwinkelgroessen","sort":"Definition","label":"1.39","description":"Seitenlängen und Innenwinkelgrößen eines Dreicks","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":56},{"destination":"satz:Kosinussatz","sort":"Satz","label":"1.40","description":"Kosinussatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":57},{"destination":"Kosinussatz","sort":"Gleichung","label":"1.16","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":58},{"destination":"coro:Pythagoras","sort":"Korollar","label":"1.41","description":"Satz des Pythagoras","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":59},{"destination":"satz:Winkelsumme-im-Dreieck","sort":"Satz","label":"1.42","description":"Winkelsumme im Dreieck","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":60},{"destination":"Winkelsumme-Kosinuswerte","sort":"Gleichung","label":"1.17","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":61},{"destination":"Sinus-des-Winkelmasses","sort":"Gleichung","label":"1.18","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":62},{"destination":"Rechnung-zu-Cauchy-Schwartz","sort":"Gleichung","label":"1.19","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":63},{"destination":"Winkelsumme-Sinuswerte","sort":"Gleichung","label":"1.20","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"26","counter":64},{"destination":"satz:Sinussatz","sort":"Satz","label":"1.43","description":"Sinussatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"26","counter":65},{"destination":"coro:Hypothenuse-und-Katheten","sort":"Korollar","label":"1.44","description":"Sinus und Kosinus als Quotient der Katheten durch die Hypothenuse","chapter":"1","section":"1.3","subsection":"1.3.0","page":"27","counter":66},{"destination":"sect:Polytope","sort":"Abschnitt","label":"1.4","description":"Polytope","chapter":"1","section":"1.4","subsection":"1.4.0","page":"27","counter":67},{"destination":"defn:Polytop","sort":"Definition","label":"1.45","description":"Konvexes Polyeder und Polytop","chapter":"1","section":"1.4","subsection":"1.4.0","page":"27","counter":68},{"destination":"bsp:Durchschnitt-von-Halbraeumen","sort":"Beispiel","label":"1.46","description":"Durchschnitte orthogonaler Halbräume","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":69},{"destination":"bem:Rand-eines-Polytops","sort":"Bemerkung","label":"1.47","description":"Rand eines Polytops","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":70},{"destination":"defn:Ecken-Kanten-Flaechen","sort":"Definition","label":"1.48","description":"Ecken, Kanten, Flächen eines Polytops","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":71},{"destination":"bsp:Wuerfel","sort":"Beispiel","label":"1.49","description":"Ecken, Kanten, Flächen beim Würfel","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":72},{"destination":"satz:Polyederformel","sort":"Satz","label":"1.50","description":"Euler'sche Polyederformel","chapter":"1","section":"1.4","subsection":"1.4.0","page":"29","counter":73},{"destination":"defn:Platonischer-Koerper","sort":"Definition","label":"1.51","description":"regelmäßige n-Ecke und Platonische Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":74},{"destination":"prop:Polytop","sort":"Proposition","label":"1.52","description":"Beschreibung regulärer Polytope durch Grad und Anzahl der Kanten pro Ecke","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":75},{"destination":"coro:Platonische-Koerper","sort":"Korollar","label":"1.53","description":"Platonische Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":76},{"destination":"defn:Aehnlichkeitsabbildung-analytisch","sort":"Definition","label":"1.54","description":"Ähnlichkeitsabbildung","chapter":"1","section":"1.4","subsection":"1.4.0","page":"34","counter":77},{"destination":"satz:Klassifikation-der-Platonischen-Koerper","sort":"Satz","label":"1.55","description":"Klassifikation der Platonischen Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"34","counter":78},{"destination":"sect:Projektive-Raeume","sort":"Abschnitt","label":"1.5","description":"Projektive Räume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"36","counter":79},{"destination":"defn:projektiver-Raum","sort":"Definition","label":"1.56","description":"projektiver Raum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"36","counter":80},{"destination":"bsp:projektiver-Standardraum","sort":"Beispiel","label":"1.57","description":"projektiver Standardraum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"37","counter":81},{"destination":"bsp:Einbettungen-projektiver-Standardraeume","sort":"Beispiel","label":"1.58","description":"Veranschaulichung projektiver Standardräume der Dimension 1 und 2 als affine Einbettungen","chapter":"1","section":"1.5","subsection":"1.5.0","page":"37","counter":82},{"destination":"defn:projektiver-Unterraum","sort":"Definition","label":"1.59","description":"projektiver Unterraum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"38","counter":83},{"destination":"prop:Durchschnitt-und-Verbindungsraum-projektiv","sort":"Proposition","label":"1.60","description":"Durchschnitt und Verbindungsraum projektiver Räume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"38","counter":84},{"destination":"abb:Boyflaeche","sort":"Abbildung","label":"1.3","description":"","chapter":"1","section":"1.5","subsection":"1.5.0","page":"39","counter":85},{"destination":"Beschreibung-projektiver-Verbindungsraum","sort":"Gleichung","label":"1.21","description":"","chapter":"1","section":"1.5","subsection":"1.5.0","page":"40","counter":86},{"destination":"satz:Dimensionsformel-fuer-projektive-Unterraeume","sort":"Satz","label":"1.61","description":"Dimensionsformel für projektive Unterräume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"40","counter":87},{"destination":"sect:Projektive-Abbildungen","sort":"Abschnitt","label":"1.6","description":"Projektive Abbildungen","chapter":"1","section":"1.6","subsection":"1.6.0","page":"40","counter":88},{"destination":"defn:projektive-Abbildung","sort":"Definition","label":"1.62","description":"projektive Abbildung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"40","counter":89},{"destination":"prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb","sort":"Proposition","label":"1.63","description":"Zusammenhang zwischen den linearen Abbildungen zu einer gegebenen projektiven Abbildung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"41","counter":90},{"destination":"bsp:kanonische-Einbettung","sort":"Beispiel","label":"1.64","description":"kanonische Einbettung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"41","counter":91},{"destination":"defn:Zentralprojektion","sort":"Definition","label":"1.65","description":"Zentralprojektion","chapter":"1","section":"1.6","subsection":"1.6.0","page":"42","counter":92},{"destination":"Wohldefiniertheit-Zentralprojektion-1","sort":"Gleichung","label":"1.22","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":93},{"destination":"Wohldefiniertheit-Zentralprojektion-2","sort":"Gleichung","label":"1.23","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":94},{"destination":"bem:Beschreibung-Zentralprojektion","sort":"Bemerkung","label":"1.66","description":"alternative Beschreibung des Begriffs der Zentralprojektion","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":95},{"destination":"prop:Zentralprojektionen-sind-Projektivitaeten","sort":"Proposition","label":"1.67","description":"Zentralprojektionen sind Projektivitäten","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":96},{"destination":"satz:projektiver-Abschluss","sort":"Satz","label":"1.68","description":"projektiver Abschluss","chapter":"1","section":"1.6","subsection":"1.6.0","page":"44","counter":97},{"destination":"bsp:projektiver-Abschluss","sort":"Beispiel","label":"1.69","description":"projektiver Abschluss einer Hyperebene in K³","chapter":"1","section":"1.6","subsection":"1.6.0","page":"45","counter":98},{"destination":"ZcapX","sort":"Gleichung","label":"1.24","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"46","counter":99},{"destination":"dim-ZcapX","sort":"Gleichung","label":"1.25","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"47","counter":100},{"destination":"sect:Projektive-Koordinaten","sort":"Abschnitt","label":"1.7","description":"Projektive Koordinaten","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":101},{"destination":"defn:projektive-Basis","sort":"Definition","label":"1.70","description":"projektive Basis","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":102},{"destination":"bsp:kanonische-projektive-Basis","sort":"Beispiel","label":"1.71","description":"Standardbasis des projektiven Standardraums","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":103},{"destination":"abb:projektive-Standardbasis","sort":"Abbildung","label":"1.4","description":"","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":104},{"destination":"lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis","sort":"Lemma","label":"1.72","description":"Zusammenhang zwischen projektiver Basis und Basis des zugrunde liegenden Vektorraums","chapter":"1","section":"1.7","subsection":"1.7.0","page":"50","counter":105},{"destination":"satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph","sort":"Satz","label":"1.73","description":"projektive Räume gleicher Dimension sind kanonisch isomorph","chapter":"1","section":"1.7","subsection":"1.7.0","page":"50","counter":106},{"destination":"defn:projektives-Koordinatensystem","sort":"Definition","label":"1.74","description":"projektives Koordinatensystem","chapter":"1","section":"1.7","subsection":"1.7.0","page":"51","counter":107},{"destination":"defn:Doppelverhaeltnis-projektiv","sort":"Definition","label":"1.75","description":"Doppelverhältnis","chapter":"1","section":"1.7","subsection":"1.7.0","page":"51","counter":108},{"destination":"prop:DV-projektive-Invariante","sort":"Proposition","label":"1.76","description":"Doppelverhältnis ist projektive Invariante","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":109},{"destination":"DV-projektive-Invariante","sort":"Gleichung","label":"1.26","description":"","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":110},{"destination":"prop:DV-Berechnung","sort":"Proposition","label":"1.77","description":"Berechnung des Doppelverhältnisses aus den homogenen Koordinaten","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":111},{"destination":"bem:Zusammenhang-DV-und-TV","sort":"Bemerkung","label":"1.78","description":"Zusammenhang zwischen Doppelverhältnis und bestimmten Teilverhältnissen","chapter":"1","section":"1.7","subsection":"1.7.0","page":"54","counter":112},{"destination":"satz:projektiver-Desargues","sort":"Satz","label":"1.79","description":"projektiver Satz von Desargues","chapter":"1","section":"1.7","subsection":"1.7.0","page":"55","counter":113},{"destination":"sect:Computergraphik","sort":"Abschnitt","label":"1.8","description":"Computergraphik","chapter":"1","section":"1.8","subsection":"1.8.0","page":"58","counter":114},{"destination":"Transformationen-in-R3","sort":"Gleichung","label":"1.27","description":"","chapter":"1","section":"1.8","subsection":"1.8.0","page":"59","counter":115},{"destination":"defn:Quader","sort":"Definition","label":"1.80","description":"Quader","chapter":"1","section":"1.8","subsection":"1.8.0","page":"60","counter":116},{"destination":"defn:Kegelstumpf","sort":"Definition","label":"1.81","description":"Rechteckkegelstumpf","chapter":"1","section":"1.8","subsection":"1.8.0","page":"60","counter":117},{"destination":"sect:Uebungsaufgaben-Analytische-Geometrie","sort":"Abschnitt","label":"1.9","description":"Übungsaufgaben","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":118},{"destination":"aufg:Verbindungsgerade-ist-Gerade","sort":"Aufgabe","label":"1.1","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":119},{"destination":"aufg:Eigenschaften-affiner-Abbildungen","sort":"Aufgabe","label":"1.2","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":120},{"destination":"aufg:Abbildungsgeometrie","sort":"Aufgabe","label":"1.4","description":"Transfer: Abbildungsgeometrie","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":121},{"destination":"aufg:Tangenssatz","sort":"Aufgabe","label":"1.5","description":"Tangenssatz","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":122},{"destination":"aufg:Heronsche-Formel","sort":"Aufgabe","label":"1.6","description":"Heron'sche Formel","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":123},{"destination":"aufg:Vergleich-rechtwinkliger-Dreiecke","sort":"Aufgabe","label":"1.8","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":124},{"destination":"aufg:Durchschnitt-Gerade-mit-Einheitssphaere","sort":"Aufgabe","label":"1.9","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":125},{"destination":"aufg:fast-jede-Projektivitaet-ist-Zentralprojektion","sort":"Aufgabe","label":"1.11","description":"Jede Projektivität, die den Durchschnitt von Start- und Zielraum punktweise festlässt, ist eine Zentralprojektion","chapter":"1","section":"1.9","subsection":"1.9.0","page":"63","counter":126},{"destination":"aufg:projektiver-Pappos","sort":"Aufgabe","label":"1.13","description":"projektiver Satz von Pappos","chapter":"1","section":"1.9","subsection":"1.9.0","page":"63","counter":127},{"destination":"chap:Inzidenzgeometrie","sort":"Kapitel","label":"2","description":"Inzidenzgeometrie","chapter":"2","section":"2.0","subsection":"2.0.0","page":"64","counter":128},{"destination":"sect:Inzidenzebenen","sort":"Abschnitt","label":"2.1","description":"Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"64","counter":129},{"destination":"defn:Inzidenzebene","sort":"Definition","label":"2.1","description":"Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":130},{"destination":"bsp:Inzidenzebene","sort":"Beispiel","label":"2.2","description":"Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":131},{"destination":"prop:Geradenschnittpunkt","sort":"Proposition","label":"2.3","description":"nichtparallele Geraden besitzen eindeutigen Schnittpunkt","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":132},{"destination":"prop:Kriterium-Punkt-auf-Gerade","sort":"Proposition","label":"2.4","description":"Kriterium dafür, ob ein Punkt auf einer Geraden liegt","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":133},{"destination":"prop:Trennung-von-Punkt-und-Gerade","sort":"Proposition","label":"2.5","description":"Trennung von Punkt und Gerade","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":134},{"destination":"satz:A2(K)-Inzidenzebene","sort":"Satz","label":"2.6","description":"affine Standardebene ist Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":135},{"destination":"bem:Parallelitaet-in-A2(K)","sort":"Bemerkung","label":"2.7","description":"Parallelitätsbegriffe in der affinen Standardebene stimmen überein","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":136},{"destination":"defn:Isomorphismus-von-Inzidenzebenen","sort":"Definition","label":"2.8","description":"Isomorphismus von Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":137},{"destination":"bsp:affine-Ebenen-sind-Inzidenzebenen","sort":"Beispiel","label":"2.9","description":"affine Ebenen (analytisch definiert) sind Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":138},{"destination":"sect:affine-Ebenen","sort":"Abschnitt","label":"2.2","description":"Affine Ebenen","chapter":"2","section":"2.2","subsection":"2.2.0","page":"67","counter":139},{"destination":"defn:Parallelenaxiome","sort":"Definition","label":"2.10","description":"Parallelenaxiom","chapter":"2","section":"2.2","subsection":"2.2.0","page":"67","counter":140},{"destination":"defn:affine-Ebene","sort":"Definition","label":"2.11","description":"affine Ebene","chapter":"2","section":"2.2","subsection":"2.2.0","page":"68","counter":141},{"destination":"bsp:Parallelenaxiome","sort":"Beispiel","label":"2.12","description":"Parallelenaxiom","chapter":"2","section":"2.2","subsection":"2.2.0","page":"68","counter":142},{"destination":"prop:Parallelitaet-Aequivalenzrelation","sort":"Proposition","label":"2.13","description":"Parallelität ist Äquivalenzrelation","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":143},{"destination":"defn:Parallelenbueschel-und-Geradenbueschel","sort":"Definition","label":"2.14","description":"Parallelenbüschel und Geradenbüschel","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":144},{"destination":"bsp:Parallelenbueschel-und-Geradenbueschel","sort":"Beispiel","label":"2.15","description":"Parallelenbüschel und Geradenbüschel in der affinen Standardebene","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":145},{"destination":"defn:affiner-Isomorphismus","sort":"Definition","label":"2.16","description":"affiner Isomorphismus","chapter":"2","section":"2.2","subsection":"2.2.0","page":"70","counter":146},{"destination":"bsp:affiner-Isomorphismus","sort":"Beispiel","label":"2.17","description":"affiner Isomorphismus","chapter":"2","section":"2.2","subsection":"2.2.0","page":"70","counter":147},{"destination":"sect:Uebungsaufgaben-Inzidenzgeometrie","sort":"Abschnitt","label":"2.3","description":"Übungsaufgaben","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":148},{"destination":"aufg:Isomorphismen-von-Inzidenzebenen","sort":"Aufgabe","label":"2.2","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":149},{"destination":"aufg:affine-Ebene-mit-fuenf-Punkten","sort":"Aufgabe","label":"2.3","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":150},{"destination":"aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig","sort":"Aufgabe","label":"2.4","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":151},{"destination":"chap:Hilbertebenen","sort":"Kapitel","label":"3","description":"Hilbertebenen","chapter":"3","section":"3.0","subsection":"3.0.0","page":"72","counter":152},{"destination":"sect:Anordnungsaxiome","sort":"Abschnitt","label":"3.1","description":"Die Anordnungsaxiome","chapter":"3","section":"3.1","subsection":"3.1.0","page":"72","counter":153},{"destination":"defn:Anordnungsaxiome","sort":"Definition","label":"3.1","description":"Anordnungsaxiome","chapter":"3","section":"3.1","subsection":"3.1.0","page":"72","counter":154},{"destination":"prop:Seiten-einer-Geraden","sort":"Proposition","label":"3.2","description":"Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"73","counter":155},{"destination":"abb:Geradenseiten","sort":"Abbildung","label":"3.1","description":"Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"73","counter":156},{"destination":"bsp:affine-Standardebene-und-Anordnung","sort":"Beispiel","label":"3.3","description":"Anordnung in der affinen Standardebene","chapter":"3","section":"3.1","subsection":"3.1.0","page":"74","counter":157},{"destination":"Anordnung-fuer-affine-Standardebenen","sort":"Gleichung","label":"3.1","description":"","chapter":"3","section":"3.1","subsection":"3.1.0","page":"74","counter":158},{"destination":"Hessesche-Normalform","sort":"Gleichung","label":"3.2","description":"Hesse'sche Normalform","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":159},{"destination":"defn:Lage-auf-verschiedenen-Geradenseiten","sort":"Definition","label":"3.4","description":"Lage auf verschiedenen Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":160},{"destination":"prop:Seiten-von-Geraden-und-Punkten","sort":"Proposition","label":"3.5","description":"Seiten von Geraden und Punkten","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":161},{"destination":"coro:Seiten-eines-Punktes","sort":"Korollar","label":"3.6","description":"Lage auf gleicher Seite ist Äquivalenzrelation","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":162},{"destination":"defn:Anordnung-vieler-Punkte","sort":"Definition","label":"3.7","description":"Erweiterung des Anordnungsbegriffs auf beliebig viele kollineare Punkte","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":163},{"destination":"prop:Anordnung-von-Punkten-auf-Geraden","sort":"Proposition","label":"3.8","description":"Anordnungen von Punkten auf Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":164},{"destination":"bem:alternatives-Anordnungsaxiom","sort":"Bemerkung","label":"3.9","description":"alternatives Anordnungsaxiom (A'2)","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":165},{"destination":"defn:strecke-und-strahl","sort":"Definition","label":"3.10","description":"Strecke und Strahl","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":166},{"destination":"prop:Strecken-und-Strahlen","sort":"Proposition","label":"3.11","description":"Strecken und Strahlen","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":167},{"destination":"prop:gerade-vereinigung-von-strahlen","sort":"Proposition","label":"3.12","description":"Gerade als Vereinigung von Strahlen","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":168},{"destination":"satz:Pasch","sort":"Satz","label":"3.13","description":"Satz von Pasch","chapter":"3","section":"3.1","subsection":"3.1.0","page":"78","counter":169},{"destination":"sect:Die-Kongruenzaxiome-fuer-Strecken","sort":"Abschnitt","label":"3.2","description":"Die Kongruenzaxiome für Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"78","counter":170},{"destination":"defn:Kongruenzaxiome-fuer-Strecken","sort":"Definition","label":"3.14","description":"Kongruenzaxiome für Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"78","counter":171},{"destination":"bsp:affine-Standardebene-und-Kongruenzen-von-Strecken","sort":"Beispiel","label":"3.15","description":"Streckenkongruenzen in der affinen Standardebene","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":172},{"destination":"prop:Streckensubtraktion","sort":"Proposition","label":"3.16","description":"Streckensubtraktion","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":173},{"destination":"defn:<-fuer-Strecken","sort":"Definition","label":"3.17","description":"Vergleich von Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":174},{"destination":"prop:<-fuer-Strecken","sort":"Proposition","label":"3.18","description":"Vergleich von Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"80","counter":175},{"destination":"sect:Kongruenzaxiome-fuer-Winkel","sort":"Abschnitt","label":"3.3","description":"Die Kongruenzaxiome für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":176},{"destination":"defn:Winkel","sort":"Definition","label":"3.19","description":"Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":177},{"destination":"abb:Winkel","sort":"Abbildung","label":"3.2","description":"Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":178},{"destination":"prop:winkel","sort":"Proposition","label":"3.20","description":"Identitätskriterium für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":179},{"destination":"defn:Inneres-eines-Winkels","sort":"Definition","label":"3.21","description":"Inneres eines Winkels","chapter":"3","section":"3.3","subsection":"3.3.0","page":"81","counter":180},{"destination":"lemma:im-Inneren-eines-Winkels","sort":"Lemma","label":"3.22","description":"Kriterium für die Lage im Inneren eines Winkels","chapter":"3","section":"3.3","subsection":"3.3.0","page":"81","counter":181},{"destination":"defn:Kongruenzaxiome-fuer-Winkel","sort":"Definition","label":"3.23","description":"Kongruenzaxiome für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"82","counter":182},{"destination":"defn:<-fuer-Winkel","sort":"Definition","label":"3.24","description":"Vergleich von Winkeln","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":183},{"destination":"prop:<-fuer-Winkel","sort":"Proposition","label":"3.25","description":"Vergleich von Winkeln","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":184},{"destination":"defn:Dreieck","sort":"Definition","label":"3.26","description":"Dreieck","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":185},{"destination":"bem:dreieck","sort":"Bemerkung","label":"3.27","description":"Kongruenz von Dreiecken","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":186},{"destination":"defn:ebene-Geometrie","sort":"Definition","label":"3.28","description":"ebene Geometrie","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":187},{"destination":"defn:Bewegung","sort":"Definition","label":"3.29","description":"Bewegung","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":188},{"destination":"bsp:Bewegungen-in-der-affinen-Standardebene","sort":"Beispiel","label":"3.30","description":"Bewegungen in der affinen Standardebene","chapter":"3","section":"3.3","subsection":"3.3.0","page":"85","counter":189},{"destination":"defn:gvB","sort":"Definition","label":"3.31","description":"genügend viele Bewegungen","chapter":"3","section":"3.3","subsection":"3.3.0","page":"85","counter":190},{"destination":"satz:genug-Bewegung","sort":"Satz","label":"3.32","description":"Existenz genügend vieler Bewegungen impliziert (K'6)","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":191},{"destination":"Voraussetzungen-SWS","sort":"Gleichung","label":"3.3","description":"","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":192},{"destination":"bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln","sort":"Beispiel","label":"3.33","description":"Winkelkongruenzen in der affinen Standardebene","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":193},{"destination":"Kongruenz-von-Winkeln-in-der-affinen-Standardebene","sort":"Gleichung","label":"3.4","description":"","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":194},{"destination":"sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel","sort":"Abschnitt","label":"3.4","description":"Ergänzungswinkel, Gegenwinkel und rechte Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":195},{"destination":"defn:Ergaenzungswinkel-Gegenwinkel","sort":"Definition","label":"3.34","description":"Ergänzungswinkel und Gegenwinkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":196},{"destination":"prop:Ergaenzungswinkel","sort":"Proposition","label":"3.35","description":"Ergänzungswinkel kongruenter Winkel sind kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":197},{"destination":"coro:Gegenwinkel","sort":"Korollar","label":"3.36","description":"ein Winkel ist zu seinem Gegenwinkel kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":198},{"destination":"defn:rechter-Winkel","sort":"Definition","label":"3.37","description":"rechter Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":199},{"destination":"prop:rechter-Winkel","sort":"Proposition","label":"3.38","description":"Ergänzungswinkel eines rechten Winkels ist rechter Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":200},{"destination":"satz:Viertes-euklidisches-Postulat","sort":"Satz","label":"3.39","description":"rechte Winkel sind zueinander kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"89","counter":201},{"destination":"coro:rechte-Winkel","sort":"Korollar","label":"3.40","description":"die rechten Winkel bilden eine Kongruenzklasse","chapter":"3","section":"3.4","subsection":"3.4.0","page":"89","counter":202},{"destination":"sect:Orthogonalitaet-und-Parallelitaet","sort":"Abschnitt","label":"3.5","description":"Orthogonalität und Parallelität","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":203},{"destination":"defn:orthogonal","sort":"Definition","label":"3.41","description":"orthogonal","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":204},{"destination":"satz:Orthogonale-Gerade","sort":"Satz","label":"3.42","description":"Existenz des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":205},{"destination":"abb:Orthogonale","sort":"Abbildung","label":"3.3","description":"Existenz des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"90","counter":206},{"destination":"defn:Wechselwinkel-und-Stufenwinkel","sort":"Definition","label":"3.43","description":"Wechselwinkel und Stufenwinkel","chapter":"3","section":"3.5","subsection":"3.5.0","page":"90","counter":207},{"destination":"bem:Wechselwinkel-und-Stufenwinkel","sort":"Bemerkung","label":"3.44","description":"Zusammenhang zwischen Wechsel- und Stufenwinkel","chapter":"3","section":"3.5","subsection":"3.5.0","page":"91","counter":208},{"destination":"satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz","sort":"Satz","label":"3.45","description":"schwacher Wechselwinkelsatz","chapter":"3","section":"3.5","subsection":"3.5.0","page":"91","counter":209},{"destination":"coro:zum-schwachen-wws","sort":"Korollar","label":"3.46","description":"zweifaches Lotfällen gibt Parallele","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":210},{"destination":"coro:Lot-eindeutig","sort":"Korollar","label":"3.47","description":"Eindeutigkeit des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":211},{"destination":"coro:Existenz-von-Parallelen","sort":"Korollar","label":"3.48","description":"Existenz von Parallelen","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":212},{"destination":"satz:Parallelenaxiom-in-Hilbertebenen","sort":"Satz","label":"3.49","description":"starker Wechselwinkelsatz","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":213},{"destination":"sect:Kongruenzsatz","sort":"Abschnitt","label":"3.6","description":"Der Kongruenzsatz für Dreiecke","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":214},{"destination":"prop:eindeutiges-Dreieck","sort":"Proposition","label":"3.51","description":"Abtragung eines Dreiecks","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":215},{"destination":"defn:gleichschenkliges-Dreieck","sort":"Definition","label":"3.52","description":"gleichschenkliges Dreieck","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":216},{"destination":"prop:gleichschenkliges-Dreieck","sort":"Proposition","label":"3.53","description":"gleichschenkliges Dreieck","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":217},{"destination":"prop:Winkeladdsubtraktion","sort":"Proposition","label":"3.54","description":"Winkeladdition und -subtraktion","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":218},{"destination":"satz:Kongruenzsatz-fuer-Dreiecke","sort":"Satz","label":"3.55","description":"Kongruenzsatz für Dreiecke","chapter":"3","section":"3.6","subsection":"3.6.0","page":"95","counter":219},{"destination":"wsw-1","sort":"Gleichung","label":"3.5","description":"","chapter":"3","section":"3.6","subsection":"3.6.0","page":"96","counter":220},{"destination":"sect:Mittelsenkrechte-und-Winkelhalbierende","sort":"Abschnitt","label":"3.7","description":"Mittelsenkrechte und Winkelhalbierende","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":221},{"destination":"defn:Streckenmittelpunkt","sort":"Definition","label":"3.56","description":"Streckenmittelpunkt","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":222},{"destination":"lemma:Mittelpunkt-liegt-zwischen-Randpunkten","sort":"Lemma","label":"3.57","description":"Streckenmittelpunkt liegt zwischen den Randpunkten der Strecke","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":223},{"destination":"satz:Mittelpunkt","sort":"Satz","label":"3.58","description":"Existenz und Eindeutigkeit des Streckenmittelpunkts","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":224},{"destination":"Mittelpunkt-1","sort":"Gleichung","label":"3.6","description":"","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":225},{"destination":"Mittelpunkt-2","sort":"Gleichung","label":"3.7","description":"","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":226},{"destination":"defn:Mittelsenkrechte","sort":"Definition","label":"3.59","description":"Mittelsenkrechte","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":227},{"destination":"prop:Charakterisierung-Mittelsenkrechte","sort":"Proposition","label":"3.60","description":"Charakterisierung der Mittelsenkrechten","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":228},{"destination":"defn:Winkelhalbierende","sort":"Definition","label":"3.61","description":"Winkelhalbierende","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":229},{"destination":"prop:Existenz-der-Winkelhalbierenden","sort":"Proposition","label":"3.62","description":"Existenz der Winkelhalbierenden","chapter":"3","section":"3.7","subsection":"3.7.0","page":"100","counter":230},{"destination":"sect:Innen-und-Aussenwinkel-im-Dreieck","sort":"Abschnitt","label":"3.8","description":"Innen- und Außenwinkel im Dreieck","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":231},{"destination":"defn:Innenwinkel","sort":"Definition","label":"3.63","description":"Innenwinkel","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":232},{"destination":"prop:schwache-Winkelsumme-im-Dreieck-1","sort":"Proposition","label":"3.64","description":"schwache Winkelsumme im Dreieck","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":233},{"destination":"schwache-Winkelsumme-im-Dreieck","sort":"Gleichung","label":"3.8","description":"","chapter":"3","section":"3.8","subsection":"3.8.0","page":"101","counter":234},{"destination":"satz:Aussenwinkelsatz","sort":"Satz","label":"3.65","description":"Außenwinkelsatz","chapter":"3","section":"3.8","subsection":"3.8.0","page":"101","counter":235},{"destination":"satz:grosse-Dreiecksseite-hat-grossen-Winkel","sort":"Satz","label":"3.66","description":"der größeren Dreiecksseite liegt der größere Winkel gegenüber","chapter":"3","section":"3.8","subsection":"3.8.0","page":"102","counter":236},{"destination":"abb:grosse-Dreiecksseite-hat-grossen-Winkel","sort":"Abbildung","label":"3.4","description":"der größeren Dreiecksseite liegt der größere Winkel gegenüber","chapter":"3","section":"3.8","subsection":"3.8.0","page":"102","counter":237},{"destination":"satz:SSrechterWinkel","sort":"Satz","label":"3.67","description":"SSrW-Kriterium","chapter":"3","section":"3.8","subsection":"3.8.0","page":"103","counter":238},{"destination":"sect:Kreise","sort":"Abschnitt","label":"3.9","description":"In- und Umkreis","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":239},{"destination":"defn:Kreis","sort":"Definition","label":"3.68","description":"Kreis","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":240},{"destination":"prop:Kreise-haben-genau-einen-Mittelpunkt","sort":"Proposition","label":"3.69","description":"Eindeutigkeit des Kreismittelpunkts","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":241},{"destination":"satz:Umkreissatz","sort":"Satz","label":"3.70","description":"Umkreissatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":242},{"destination":"defn:Hoehe","sort":"Definition","label":"3.72","description":"Höhe","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":243},{"destination":"satz:Hoehensatz","sort":"Satz","label":"3.73","description":"Höhensatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":244},{"destination":"satz:Inkreissatz","sort":"Satz","label":"3.74","description":"Inkreissatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"106","counter":245},{"destination":"sect:Uebungsaufgaben-Hilbertebenen","sort":"Abschnitt","label":"3.10","description":"Übungsaufgaben","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":246},{"destination":"aufg:Anordnung-von-Punkten-auf-Geraden","sort":"Aufgabe","label":"3.1","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":247},{"destination":"aufg:unendlich-viele-Punkte-mit-I-+-A","sort":"Aufgabe","label":"3.2","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":248},{"destination":"aufg:Anordnung-Modell-alternativ","sort":"Aufgabe","label":"3.4","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":249},{"destination":"aufg:<-fuer-Winkel","sort":"Aufgabe","label":"3.5","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":250},{"destination":"aufg:Inneres-bestimmt-den-Winkel","sort":"Aufgabe","label":"3.6","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":251},{"destination":"aufg:konvexe-Mengen","sort":"Aufgabe","label":"3.7","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":252},{"destination":"aufg:Parallelogramm-synthetisch","sort":"Aufgabe","label":"3.10","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"109","counter":253},{"destination":"aufg:Spiegelungen-in-Hilbertebenen","sort":"Aufgabe","label":"3.12","description":"Geradenspiegelung","chapter":"3","section":"3.10","subsection":"3.10.0","page":"109","counter":254},{"destination":"aufg:Abschaetzung-Abstand-Punkt-Gerade","sort":"Aufgabe","label":"3.13","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"110","counter":255},{"destination":"aufg:Hoehenformel","sort":"Aufgabe","label":"3.14","description":"Höhenformel","chapter":"3","section":"3.10","subsection":"3.10.0","page":"110","counter":256},{"destination":"chap:Euklidische-Geometrie-kurz","sort":"Kapitel","label":"4","description":"Euklidische Geometrie","chapter":"4","section":"4.0","subsection":"4.0.0","page":"111","counter":257},{"destination":"sect:Vollstaendigkeitsaxiom","sort":"Abschnitt","label":"4.1","description":"Das Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"111","counter":258},{"destination":"defn:Dedekindschnitt","sort":"Definition","label":"4.1","description":"Dedekindschnitt","chapter":"4","section":"4.1","subsection":"4.1.0","page":"112","counter":259},{"destination":"defn:Vollstaendigkeitsaxiom","sort":"Definition","label":"4.2","description":"Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"112","counter":260},{"destination":"bsp:Vollstaendigkeitsaxiom","sort":"Beispiel","label":"4.3","description":"Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"113","counter":261},{"destination":"satz:Archimedisches-Axiom","sort":"Satz","label":"4.4","description":"Archimedisches Axiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"113","counter":262},{"destination":"sect:Euklidische-Ebenen","sort":"Abschnitt","label":"4.2","description":"Euklidische Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":263},{"destination":"defn:Euklidsche-Ebene","sort":"Definition","label":"4.5","description":"euklidische Ebene","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":264},{"destination":"defn:Isomorphismus-euklidischer-Ebenen","sort":"Definition","label":"4.6","description":"Isomorphismus euklidischer Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":265},{"destination":"satz:Hauptsatz-fuer-euklidische-Ebenen","sort":"Satz","label":"4.8","description":"Hauptsatz für euklidische Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":266},{"destination":"prop:Groesse-der-Winkelsumme","sort":"Proposition","label":"4.9","description":"Größe der Winkelsumme","chapter":"4","section":"4.2","subsection":"4.2.0","page":"115","counter":267},{"destination":"sect:Kreise-in-der-euklidischen-Ebene","sort":"Abschnitt","label":"4.3","description":"Kreise","chapter":"4","section":"4.3","subsection":"4.3.0","page":"116","counter":268},{"destination":"prop:Durchschnitt-Kreis-Gerade","sort":"Proposition","label":"4.10","description":"Durchschnitt von Kreis und Gerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"117","counter":269},{"destination":"coro:Tangente","sort":"Korollar","label":"4.11","description":"Charakterisierung der Tangente","chapter":"4","section":"4.3","subsection":"4.3.0","page":"118","counter":270},{"destination":"defn:Potenz","sort":"Definition","label":"4.12","description":"Potenz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"118","counter":271},{"destination":"satz:Zweisehnensatz","sort":"Satz","label":"4.13","description":"Zweisehnensatz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"119","counter":272},{"destination":"satz:Sehnen-Tangenten-Satz","sort":"Satz","label":"4.14","description":"Sehnen-Tangenten-Satz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"119","counter":273},{"destination":"prop:potenzgerade","sort":"Proposition","label":"4.15","description":"Potenzgerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"120","counter":274},{"destination":"satz:Kreis-Kreis-Schnitt-Eigenschaft","sort":"Satz","label":"4.17","description":"Kreis-Kreis-Schnitt-Eigenschaft","chapter":"4","section":"4.3","subsection":"4.3.0","page":"121","counter":275},{"destination":"coro:Kreis-Kreis-Schnitt-Eigenschaft","sort":"Korollar","label":"4.18","description":"Kreis-Kreis-Schnitt-Eigenschaft","chapter":"4","section":"4.3","subsection":"4.3.0","page":"122","counter":276},{"destination":"satz:Peripheriewinkelsatz","sort":"Satz","label":"4.19","description":"Peripheriewinkelsatz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"123","counter":277},{"destination":"satz:Thales","sort":"Satz","label":"4.20","description":"Satz des Thales","chapter":"4","section":"4.3","subsection":"4.3.0","page":"124","counter":278},{"destination":"satz:Sinussatz-Verschaerfung","sort":"Satz","label":"4.21","description":"Verschärfung des Sinussatzes","chapter":"4","section":"4.3","subsection":"4.3.0","page":"124","counter":279},{"destination":"satz:Eulergleichung","sort":"Satz","label":"4.22","description":"Eulergleichung","chapter":"4","section":"4.3","subsection":"4.3.0","page":"125","counter":280},{"destination":"coro:Eulergerade","sort":"Korollar","label":"4.23","description":"Eulergerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"125","counter":281},{"destination":"sect:Inversion-am-Kreis","sort":"Abschnitt","label":"4.4","description":"Die Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":282},{"destination":"defn:Inversion-am-Kreis","sort":"Definition","label":"4.24","description":"Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":283},{"destination":"prop:Inversionen-am-Kreis-sind-bijektiv","sort":"Proposition","label":"4.25","description":"Inversionen am Kreis sind bijektiv und bilden Punkte von innen nach außen ab","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":284},{"destination":"prop:Tangentenschnittpunkt-mit-Inversion","sort":"Proposition","label":"4.26","description":"Konstruktion des Bildpunkts unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"127","counter":285},{"destination":"prop:Eigenschaften-der-Inversion","sort":"Proposition","label":"4.27","description":"Eigenschaften der Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"127","counter":286},{"destination":"defn:verallgemeinerte-Gerade","sort":"Definition","label":"4.28","description":"verallgemeinerte Gerade","chapter":"4","section":"4.4","subsection":"4.4.0","page":"129","counter":287},{"destination":"prop:orthogonale-verallgemeinerte-Geraden","sort":"Proposition","label":"4.29","description":"orthogonale verallgemeinerte Gerade","chapter":"4","section":"4.4","subsection":"4.4.0","page":"129","counter":288},{"destination":"prop:orthogonale-Kreise","sort":"Proposition","label":"4.30","description":"Eigenschaften orthogonaler Kreise","chapter":"4","section":"4.4","subsection":"4.4.0","page":"130","counter":289},{"destination":"prop:Inversion-Kreis-an-Kreis","sort":"Proposition","label":"4.31","description":"Inversion eines Kreises an einem anderen Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":290},{"destination":"Schnittpunktanzahl-bleibt-unter-Inversion-erhalten","sort":"Gleichung","label":"4.1","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":291},{"destination":"Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2","sort":"Gleichung","label":"4.2","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":292},{"destination":"Inversion-fuer-verallgemeinerte-Geraden","sort":"Gleichung","label":"4.3","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":293},{"destination":"lemma:Beruehrpunkte-unter-der-Inversion","sort":"Lemma","label":"4.32","description":"Verhalten von Berührpunkten unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":294},{"destination":"prop:Inversion-und-Tangenten","sort":"Proposition","label":"4.33","description":"Verhalten von Tangenten unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":295},{"destination":"defn:verallgemeinerte-Winkelgroesse","sort":"Definition","label":"4.34","description":"verallgemeinerte Winkelgröße","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":296},{"destination":"satz:Inversion-winkeltreu","sort":"Satz","label":"4.35","description":"Inversion ist winkeltreu","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":297},{"destination":"defn:Doppelverhaeltnis","sort":"Definition","label":"4.36","description":"Doppelverhältnis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":298},{"destination":"prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis","sort":"Proposition","label":"4.37","description":"Inversion erhält Doppelverhältnis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":299},{"destination":"DV-1","sort":"Gleichung","label":"4.4","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":300},{"destination":"DV-2","sort":"Gleichung","label":"4.5","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"134","counter":301},{"destination":"sect:Uebungsaufgaben-Euklidische-Geometrie","sort":"Abschnitt","label":"4.5","description":"Übungsaufgaben","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":302},{"destination":"aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl","sort":"Aufgabe","label":"4.1","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":303},{"destination":"aufg:Peripheriewinkelsatz","sort":"Aufgabe","label":"4.4","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":304},{"destination":"aufg:Tangentenschnittpunkt-mit-Inversion","sort":"Aufgabe","label":"4.5","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":305},{"destination":"aufg:gleichseitige-Dreiecke-SHU","sort":"Aufgabe","label":"4.6","description":"gleichseitiges Dreieck","chapter":"4","section":"4.5","subsection":"4.5.0","page":"136","counter":306},{"destination":"chap:Nichteuklidsche-Geometrie","sort":"Kapitel","label":"5","description":"Nichteuklidische Geometrie","chapter":"5","section":"5.0","subsection":"5.0.0","page":"137","counter":307},{"destination":"sect:Hyperbolische-Ebenen","sort":"Abschnitt","label":"5.1","description":"Das Poincaré'sche Kreismodell","chapter":"5","section":"5.1","subsection":"5.1.0","page":"137","counter":308},{"destination":"defn:Hyperbolische-Ebene","sort":"Definition","label":"5.1","description":"hyperbolische Ebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"137","counter":309},{"destination":"defn:Endpunkte-von-k-Geraden","sort":"Definition","label":"5.2","description":"Endpunkte einer k-Geraden","chapter":"5","section":"5.1","subsection":"5.1.0","page":"138","counter":310},{"destination":"prop:Kreismodell-ist-Inzidenzebene","sort":"Proposition","label":"5.3","description":"Poincaré'sches Kreismodell ist Inzidenzebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"138","counter":311},{"destination":"I2-hyperbolisch","sort":"Gleichung","label":"5.1","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"139","counter":312},{"destination":"Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs","sort":"Gleichung","label":"5.2","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":313},{"destination":"prop:Kreismodell-erfuellt-Anordnungsaxiome","sort":"Proposition","label":"5.4","description":"Poincaré'sches Kreismodell erfüllt Anordnungsaxiome","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":314},{"destination":"hyperbolischer-Abstand","sort":"Gleichung","label":"5.3","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":315},{"destination":"lemma:k-Anordnung-von-k-Punkten","sort":"Lemma","label":"5.5","description":"k-Anordnung von k-Punkten","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":316},{"destination":"Kongruenz-von-k-Strecken","sort":"Gleichung","label":"5.4","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":317},{"destination":"prop:Kreismodell-erfuellt-Streckenkongruenzaxiome","sort":"Proposition","label":"5.6","description":"Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Strecken","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":318},{"destination":"prop:Kreismodell-erfuellt-Winkelkongruenzaxiome","sort":"Proposition","label":"5.7","description":"Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Winkel","chapter":"5","section":"5.1","subsection":"5.1.0","page":"142","counter":319},{"destination":"prop:k-Bewegung-in-den-Ursprung","sort":"Proposition","label":"5.8","description":"Existenz einer k-Bewegung, die gegebenen k-Punkt auf den Ursprung schickt","chapter":"5","section":"5.1","subsection":"5.1.0","page":"142","counter":320},{"destination":"prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom","sort":"Proposition","label":"5.9","description":"Poincaré'sches Kreismodell erfüllt Vollständigkeitsaxiom","chapter":"5","section":"5.1","subsection":"5.1.0","page":"143","counter":321},{"destination":"prop:hyperbolisches-Axiom-im-Poincaremodell","sort":"Proposition","label":"5.10","description":"Poincaré'sche Kreismodell erfüllt das hyperbolische Axiom","chapter":"5","section":"5.1","subsection":"5.1.0","page":"143","counter":322},{"destination":"satz:Kreismodell-ist-hyperbolische-Ebene","sort":"Satz","label":"5.11","description":"Poincaré'sches Kreismodell ist hyperbolische Ebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"144","counter":323},{"destination":"sect:Hyperbolische-Geometrie","sort":"Abschnitt","label":"5.2","description":"Hyperbolische Geometrie","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":324},{"destination":"Additionstheorem-cosh","sort":"Gleichung","label":"5.5","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":325},{"destination":"hyperbolisches-Pythagorasaequivalent","sort":"Gleichung","label":"5.6","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":326},{"destination":"lemma:k-Abstand-zum-Ursprung","sort":"Lemma","label":"5.12","description":"k-Abstand zum Ursprung","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":327},{"destination":"lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung","sort":"Lemma","label":"5.13","description":"sinh und cosh vom k-Abstand zum Ursprung","chapter":"5","section":"5.2","subsection":"5.2.0","page":"145","counter":328},{"destination":"lemma:Norm-im-Klein-Modell","sort":"Lemma","label":"5.14","description":"Projektion von k-Punkten auf die Verbindungssehne der Endpunkte der zugehörigen k-Geraden","chapter":"5","section":"5.2","subsection":"5.2.0","page":"145","counter":329},{"destination":"satz:Trigonometrie-rechtwinkliges-k-Dreieck","sort":"Satz","label":"5.15","description":"Trigonometrie im rechtwinkligen k-Dreieck","chapter":"5","section":"5.2","subsection":"5.2.0","page":"146","counter":330},{"destination":"satz:hyperbolische-Trigonometrie","sort":"Satz","label":"5.16","description":"hyperbolische Trigonometrie","chapter":"5","section":"5.2","subsection":"5.2.0","page":"148","counter":331},{"destination":"hyperbolische-Trigonometrie","sort":"Gleichung","label":"5.7","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"149","counter":332},{"destination":"satz:Winkelsumme-im-k-Dreieck","sort":"Satz","label":"5.17","description":"Winkelsumme im k-Dreieck","chapter":"5","section":"5.2","subsection":"5.2.0","page":"150","counter":333},{"destination":"beta+gamma<pi","sort":"Gleichung","label":"5.8","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"150","counter":334},{"destination":"sect:Uebungsaufgaben-Nichteuklidische-Geometrie","sort":"Abschnitt","label":"5.3","description":"Übungsaufgaben","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":335},{"destination":"aufg:hyperbolische-Geradenspiegelung-ist-Bewegung","sort":"Aufgabe","label":"5.1","description":"","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":336},{"destination":"aufg:Poincarehalbebene","sort":"Aufgabe","label":"5.2","description":"","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":337}],"linked_media":[102,98,10,104,10,95,98,98,98,110,491,349,350,351,353,360]},"derivatives":{"screenshot":{"id":"medium/39/manuscript/screenshot-3decee3284df294f13fd31a8a444715d.png","storage":"store","metadata":{"filename":"image_processing20200724-1-7uc3mi.png","size":7126,"mime_type":"image/png"}}}}	all	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 17:03:37.785021	\N	\N
46	https://en.wikipedia.org/wiki/Group_(mathematics)	2022-08-05 13:33:25.078745	2022-08-05 14:07:15.514842	Reste	Groups	Talk	1	\N	\N	{"id":"medium/46/manuscript/16faf389e47502a6662ef2168b02f312.pdf","storage":"store","metadata":{"filename":"empty.pdf","size":1154,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[],"version":null},"derivatives":{"screenshot":{"id":"medium/46/manuscript/screenshot-5842b6968e935e05ee874bdbbffa6918.png","storage":"store","metadata":{"filename":"image_processing20220805-1-hgctcd.png","size":10234,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	<div>Paper with lines.</div>	\N	\N	0	f	0	2022-08-05 13:36:01.791177	\N	\N
26	\N	2020-07-24 16:20:48.588701	2022-09-20 10:34:42.711631	Question	Ideal in Z minimales Element	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Sei nun $I \\subset \\mathbb{Z}$ ein Ideal. Um zu zeigen, dass $I$ von einem Element erzeugt wird, müssen wir einen Kandidaten für dieses Element finden. \nAus dem Beispiel davor geht hervor, dass ein sinnvoller Kandidat "die kleinste natürliche Zahl, welche in $I$ liegt" wäre. Formal müssen wir noch ein bisschen aufpassen. Welche der folgenden Aussagen sind wahr?	f	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	14	f	0	2020-07-24 16:20:48.588701	\N	\N
33	\N	2020-07-24 16:42:58.569127	2022-09-20 10:34:42.711631	Quiz	Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 34\n  2:\n    :type: Question\n    :id: 35\n  3:\n    :type: Question\n    :id: 36\n  4:\n    :type: Question\n    :id: 37\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	de	\N	\N		\N	\N	21	f	0	2020-07-24 16:42:58.569127	\N	\N
5		2020-07-24 14:23:41.519702	2022-09-20 10:34:42.711631	Kaviar		Lesson	5	{"id":"medium/5/video/20c0f8f5b7f84bdba5fc08789f703533.mp4","storage":"store","metadata":{"filename":"LA2E05.mp4","size":2035152,"mime_type":"video/mp4","duration":60.024,"bitrate":271245,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/5/screenshot/df65c704b2cd27b51f4e1bc1a8e3d346.png","storage":"store","metadata":{"filename":"screenshot20200724-1-swmdmi.png","size":260866,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/5/screenshot/normalized-b13c583f59f7c34e185c02b71341b31b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1sz19jf.png","size":65008,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/5/manuscript/aa230cc1ddea2de68359e0e4a47bb7dc.pdf","storage":"store","metadata":{"filename":"LA2.E05.pdf","size":1446454,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/5/manuscript/screenshot-42ea4fa7150abd860db7e446ad95426b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-g5cacj.png","size":164433,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:23:41.519702	\N	\N
1		2020-07-24 13:54:47.104217	2022-09-20 10:34:42.711631	Kaviar		Lesson	1	{"id":"medium/1/video/269c5ce0c48ed4a23891abd1346125aa.mp4","storage":"store","metadata":{"filename":"LA2.E01.mp4","size":2078859,"mime_type":"video/mp4","duration":60.024,"bitrate":277070,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/1/screenshot/9b259def551649d827b7a40d33ece6d6.png","storage":"store","metadata":{"filename":"screenshot20200724-1-16f6c1d.png","size":230732,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/1/screenshot/normalized-62b8405499916239163ce7ff3df213e7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-x9wc6t.png","size":60200,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/1/manuscript/d7d911f3ade1888e7c44445c573aa3d4.pdf","storage":"store","metadata":{"filename":"LA2.E01.pdf","size":1138473,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/1/manuscript/screenshot-d85053a28beb894430567279403be368.png","storage":"store","metadata":{"filename":"image_processing20200724-1-h1cbbu.png","size":149022,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 13:54:47.104217	\N	\N
51	\N	2022-08-05 14:35:35.026043	2022-08-05 14:47:48.142248	Sesam	Worked Example Locked	Lecture	27	\N	\N	\N	locked	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	4	f	0	2022-08-05 14:35:41.774619	\N	\N
9		2020-07-24 14:51:14.920111	2022-09-20 10:34:42.711631	Kaviar		Lesson	9	{"id":"medium/9/video/6187a6877c63eb1f436c609233b6734f.mp4","storage":"store","metadata":{"filename":"LA2E09.mp4","size":1956825,"mime_type":"video/mp4","duration":60.024,"bitrate":260805,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/9/screenshot/50ce3e38dfa67e91de39afe6e819a55e.png","storage":"store","metadata":{"filename":"screenshot20200724-1-17n4aon.png","size":181298,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/9/screenshot/normalized-208498c706d6e610ce9bedd0c1423b54.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1dieo3r.png","size":52223,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/9/manuscript/7f21bce51aa2568c3b2735f06ee6fae9.pdf","storage":"store","metadata":{"filename":"LA2.E09.pdf","size":1166711,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/9/manuscript/screenshot-c314b7d368b987b1ced90857682be068.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1jcn8b5.png","size":148996,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:51:14.920111	\N	\N
32		2020-07-24 16:34:24.982063	2022-09-20 10:34:42.711631	Remark	nächster Versuch	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	Remark	Damit gehen wir die obige Frage nochmal an.	\N	\N	\N	\N	\N		\N	classic	20	f	0	2020-07-24 16:34:24.982063	\N	\N
47		2022-08-05 14:30:40.379007	2022-08-05 15:10:44.120522	Sesam	Worked Example Free	Lecture	27	{"id":"medium/47/video/8fbbda33353ed60cae247f1e5230dcb0.mp4","storage":"store","metadata":{"filename":"WorkedExample.mp4","size":1461881,"mime_type":"video/mp4","duration":53.526,"bitrate":218492,"resolution":"1624x1080","frame_rate":"20/1"}}	{"id":"medium/47/screenshot/a85c6e67b74319702fe1226b2084cbf4.png","storage":"store","metadata":{"filename":"screenshot20220805-1-bony1x.png","size":150856,"mime_type":"image/png","width":750,"height":498},"derivatives":{"normalized":{"id":"medium/47/screenshot/normalized-1ff53c1c3c65c4119a4e0d8f1bf088c4.png","storage":"store","metadata":{"filename":"image_processing20220805-1-43smh4.png","size":31267,"mime_type":"image/png","width":405,"height":269}}}}	\N	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N		\N	classic	0	f	0	2022-08-05 14:31:00.873873	\N	\N
48	\N	2022-08-05 14:32:29.847968	2022-08-05 14:47:48.142248	Sesam	Worked Example Unpublished	Lecture	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	1	f	0	\N	\N	\N
49	\N	2022-08-05 14:33:54.439745	2022-08-05 14:47:48.142248	Sesam	Worked Example Registered	Lecture	27	\N	\N	\N	users	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	2	f	0	2022-08-05 14:34:12.32618	\N	\N
50	\N	2022-08-05 14:34:37.266105	2022-08-05 14:47:48.142248	Sesam	Worked Example Subscribers	Lecture	27	\N	\N	\N	subscribers	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	3	f	0	2022-08-05 14:34:46.647792	\N	\N
37	\N	2020-07-24 16:48:30.034301	2022-09-20 10:34:42.711631	Question	Frobenius-Normalform bestimmen	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Die Matrix $A\\in M_{4,4}(\\mathbb{Q})$ habe die Invariantenteiler $1,1,(t-3)^2,(t-3)^2$. Gib die Frobenius-Normalform von $A$ an.	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfMatrix\n  row_count: 4\n  column_count: 4\n  coefficients:\n  - '0'\n  - "-9"\n  - '0'\n  - '0'\n  - '1'\n  - '6'\n  - '0'\n  - '0'\n  - '0'\n  - '0'\n  - '0'\n  - "-9"\n  - '0'\n  - '0'\n  - '1'\n  - '6'\n  tex: "\\\\begin{pmatrix}0 & -9 & 0 & 0 \\\\cr 1 & 6 & 0 & 0 \\\\cr 0 & 0 & 0 & -9 \\\\cr\n    0 & 0 & 1 & 6\\\\end{pmatrix}"\n  nerd: matrix([0,-9,0,0],[1,6,0,0],[0,0,0,-9],[0,0,1,6])\nexplanation: ''\n	free	\N	\N	\N	25	f	0	2020-07-24 16:48:30.034301	\N	\N
41	\N	2020-09-01 14:30:02.64804	2020-09-07 12:25:30.264455	Quiz	Tensorprodukt	Course	1	\N	\N	\N	all	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 25\nedges: {}\nroot: 1\ndefault_table:\n  1: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N		\N	\N	1	f	0	2020-09-01 14:30:02.64804	\N	\N
13		2020-07-24 15:43:22.719009	2020-09-07 12:25:30.264455	Sesam	Frobenius-Normalform	Course	1	{"id":"medium/13/video/a6ea48bef517cd2fb6b2a56e0c30c80a.mp4","storage":"store","metadata":{"filename":"Worked Example.v.la 2.ss17.frobenius-normalform.mp4","size":1556998,"mime_type":"video/mp4","duration":60.024,"bitrate":207516,"resolution":"1620x1080","frame_rate":"20/1"}}	\N	{"id":"medium/13/manuscript/bb2ae64c3a094be17d3b1addb8c43c15.pdf","storage":"store","metadata":{"filename":"Worked Example.V.LA 2.SS17.Frobenius-Normalform.pdf","size":593628,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/13/manuscript/screenshot-1b2c2c1a6b4412914b430ffb21c7231f.png","storage":"store","metadata":{"filename":"image_processing20200724-1-vyhz0w.png","size":36276,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	classic	0	f	0	2020-07-24 15:43:22.719009	\N	\N
25	\N	2020-07-24 16:18:56.962113	2022-09-20 10:34:42.711631	Question	Ideale in Z Erzeuger finden	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Bevor wir einen allgemeinen Beweis der Aussage führen, schauen wir uns ein Beispiel an. Betrachte das Ideal $$I:= 4\\mathbb{Z} + 6 \\mathbb{Z} = \\{a4+b6 \\mid a,b \\in \\mathbb{Z}\\}.$$\nWir wollen zeigen, dass jedes Ideal in $\\mathbb{Z}$ von einem Element erzeugt wird. Diese Aussage müsste insbesondere für $I$ stimmen.\nWelche der folgenden Antwortoptionen sind wahr?	f	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	13	f	0	2020-07-24 16:18:56.962113	\N	\N
18		2020-07-24 16:04:00.205352	2022-09-20 10:34:42.711631	Question	Beispiele für Primideale in Z	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Welche dieser Aussagen sind wahr?	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc		\N	\N	6	f	0	2020-07-24 16:04:00.205352	\N	\N
7		2020-07-24 14:33:16.150404	2022-09-20 10:34:42.711631	Kaviar		Lesson	7	{"id":"medium/7/video/9a75b21e25ae51bee58281bff24ae7e2.mp4","storage":"store","metadata":{"filename":"LA2E07.mp4","size":1742925,"mime_type":"video/mp4","duration":60.024,"bitrate":232297,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/7/screenshot/f452ec799399d32c84390c6bfec896c3.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1i8ba8i.png","size":169612,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/7/screenshot/normalized-f7108a74864a48d622f1ca0d0ea18e8b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-16c2dut.png","size":41756,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/7/manuscript/abe54aaef2c42a27155ce88753ed59ba.pdf","storage":"store","metadata":{"filename":"LA2.E07.pdf","size":1106134,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/7/manuscript/screenshot-7b8d24fe3103d89a98e0cd135abf1390.png","storage":"store","metadata":{"filename":"image_processing20200724-1-vqwyb8.png","size":133262,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:33:16.150404	\N	\N
40	\N	2020-08-10 16:09:44.690925	2022-09-02 16:52:53.2142	Kaviar	Vorlesungszusatzvideo	Lecture	4	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N	\N	\N	\N	0	f	0	2020-08-10 16:09:44.690925	\N	\N
21	\N	2020-07-24 16:10:17.951738	2022-09-20 10:34:42.711631	Question	Beispiele für Primideale in K[X]	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Sei $K$ ein Körper und $a\\in K$. Betrachte den Polynomring in einer Variable $K[X]$ über $K$.\n\nWelche der folgenden Ideale sind Primideale in $K[X]$?	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	9	f	0	2020-07-24 16:10:17.951738	\N	\N
17	\N	2020-07-24 16:02:04.55872	2022-09-20 10:34:42.711631	Question	Primideale in Körpern	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Welche dieser Aussagen ist stets wahr?\n	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	5	f	0	2020-07-24 16:02:04.55872	\N	\N
34		2020-07-24 16:43:21.322066	2022-09-20 10:34:42.711631	Question	Zusammenhang Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Die Matrix $A\\in M_{4,4}(\\mathbb{Q})$ habe die Invariantenteiler $1,t-2,t-2,(t-2)(t-3)$. Gib die Determinantenteiler $d_1(A),\\ldots,d_4(A)$ als Tupel von Polynomen aus $\\mathbb{Q}[t]$ an.	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfTuple\n  value: 1,t-2,(t-2)^2,(t-2)^3*(t-3)\n  tex: "(1, t-2, \\\\left(t-2\\\\right)^{2}, \\\\left(t-2\\\\right)^{3} \\\\cdot \\\\left(t-3\\\\right))"\n  nerd: vector(1,t-2,(t-2)^2,(t-2)^3*(t-3))\nexplanation: ''\n	free		\N	\N	22	f	0	2020-07-24 16:43:21.322066	\N	\N
11	\N	2020-07-24 15:09:22.028739	2022-09-20 10:34:42.711631	Script	Skript	Lecture	1	\N	\N	{"id":"medium/11/manuscript/6a7f68166c0f73c5e52e5c3e04edbe91.pdf","storage":"store","metadata":{"filename":"skript.pdf","size":958764,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/11/manuscript/screenshot-9bfae6984bf1c9058e39961b5e47209e.png","storage":"store","metadata":{"filename":"image_processing20200724-1-7kqb5h.png","size":10393,"mime_type":"image/png"}}}}	all	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 15:09:22.028739	\N	\N
14		2020-07-24 15:54:03.017896	2022-09-20 10:34:42.711631	Kiwi	Euklidische Räume	Lecture	1	{"id":"medium/14/video/2f175f5305281b157e749a69cb29df98.mp4","storage":"store","metadata":{"filename":"Wiederholung.v.la 2.ss20.euklidische Räume-1.mp4","size":1952112,"mime_type":"video/mp4","duration":60.024,"bitrate":260177,"resolution":"1620x1080","frame_rate":"20/1"}}	\N	{"id":"medium/14/manuscript/b442dd2f1fa978c2e097c18a9c00d4e7.pdf","storage":"store","metadata":{"filename":"Wiederholung.V.LA 2.SS20.Euklidische Räume.pdf","size":76310,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/14/manuscript/screenshot-5a6c59528e7a5f4867c4cf55f65b6070.png","storage":"store","metadata":{"filename":"image_processing20200724-1-131qq54.png","size":9310,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	2	f	0	2020-07-24 15:54:03.017896	\N	\N
22	\N	2020-07-24 16:15:52.01113	2022-09-20 10:34:42.711631	Quiz	Angeleiteter Beweis: Ideale in Z	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Remark\n    :id: 23\n  2:\n    :type: Question\n    :id: 24\n  3:\n    :type: Question\n    :id: 25\n  4:\n    :type: Question\n    :id: 26\n  5:\n    :type: Remark\n    :id: 27\n  6:\n    :type: Question\n    :id: 28\n  7:\n    :type: Remark\n    :id: 29\n  8:\n    :type: Remark\n    :id: 30\n  9:\n    :type: Question\n    :id: 31\n  10:\n    :type: Remark\n    :id: 32\nedges:\n  ? - 2\n    - 8\n  : - 20: false\n      21: false\n      22: true\n    - 20: false\n      21: true\n      22: false\n    - 20: false\n      21: true\n      22: true\n    - 20: true\n      21: false\n      22: false\n    - 20: true\n      21: false\n      22: true\n    - 20: false\n      21: false\n      22: false\n    - 20: true\n      21: true\n      22: true\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: 6\n  6: 7\n  7: -1\n  8: 9\n  9: 10\n  10: 2\nhide_solution:\n- - 2\n  - 20: false\n    21: false\n    22: true\n- - 2\n  - 20: false\n    21: true\n    22: false\n- - 2\n  - 20: false\n    21: true\n    22: true\n- - 2\n  - 20: true\n    21: false\n    22: false\n- - 2\n  - 20: true\n    21: false\n    22: true\n- - 2\n  - 20: false\n    21: false\n    22: false\n- - 2\n  - 20: true\n    21: true\n    22: true\n	1	Quiz	\N	\N	\N	de	\N	\N		\N	\N	10	f	0	2020-07-24 16:15:52.01113	\N	\N
23	\N	2020-07-24 16:16:21.665364	2022-09-20 10:34:42.711631	Remark	Ideale in Z Start	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	Remark	In diesem angeleiteten Beweis wollen wir zeigen, dass jedes Ideal in $\\mathbb{Z}$ von einem Element erzeugt wird. Ein Ideal $I$ eins (kommutativen) Ringes $R,$ welches von einem Element erzeugt wird, nennt man $\\textbf{Hauptideal}.$ In diesem Fall gibt es ein $x \\in I,$ sodass für jedes $y\\in I$ ein $a \\in R$ existiert mit $y = ax.$ Man schreibt dann auch $$I = (x) := Rx = \\{ax \\mid a\\in R\\}.$$\nEin kommutativer nullteilerfreier Ring, in dem jedes Ideal ein Hauptideal ist, wird $\\textbf{Hauptidealring}$ genannt. Die ganzen Zahlen $\\mathbb{Z}$ sind bekanntlich nullteilerfrei. Wir werden in diesem Quiz folglich zeigen, dass $\\mathbb{Z}$ ein Hauptidealring ist.	\N	\N	\N	\N	\N	\N	\N	\N	11	f	0	2020-07-24 16:16:21.665364	\N	\N
35		2020-07-24 16:44:51.271122	2022-09-20 10:34:42.711631	Question	Zusammenhang Invariantenteiler und charakteristisches Polynom	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Die Matrix $A\\in M_{5,5}(\\mathbb{Q})$ habe die Invariantenteiler $1,1,t-2,(t-2)(t-3),(t-2)(t-3)$. Gib das charakteristische Polynom von $A$ (als Polynom aus $\\mathbb{Q}[t]$) an.	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: "(t-2)^3*(t-3)^2"\n  tex: "\\\\left(t-2\\\\right)^{3} \\\\cdot \\\\left(t-3\\\\right)^{2}"\n  nerd: "(t-2)^3*(t-3)^2"\nexplanation: Es ist $d_5(A)=c_1(A)\\cdot\\ldots\\cdot c_5(A)$ und $d_5(A)=\\chi^{\\operatorname{char}}_A$.\n	free		\N	\N	23	f	0	2020-07-24 16:44:51.271122	\N	\N
38		2020-07-24 16:56:38.642606	2022-08-05 14:06:57.250837	Kaviar		Lesson	12	{"id":"medium/38/video/fd2c06150fe18ebfee91b6a73c833be3.mp4","storage":"store","metadata":{"filename":"Lektion.v.alg 1.ws17 18.e1-1.mp4","size":1915023,"mime_type":"video/mp4","duration":60.024,"bitrate":255234,"resolution":"1440x1070","frame_rate":"20/1"}}	\N	{"id":"medium/38/manuscript/66ca156dcebc7c8b2f4497dd65d68a9b.pdf","storage":"store","metadata":{"filename":"Lektion.V.Alg 1.WS17_18.E1.pdf","size":486317,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/38/manuscript/screenshot-e21a2c087545cd09eef48c484fd2081a.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12owwue.png","size":7455,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 16:56:38.642606	\N	\N
27	\N	2020-07-24 16:22:40.781556	2022-09-20 10:34:42.711631	Remark	Ideale in Z Erzeuger Kandidat	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	Remark	Wir können annehmen, dass $I$ nicht das Nullideal ist, da dieses bereits ein Hauptideal ist.\nWenn $I$ nicht das Nullideal ist, dann enthält es ein von $0$ verschiedenes Element $y$ und damit auch eine natürliche Zahl $\\lvert y \\rvert.$\nInsgesamt können wir folgern, dass $I\\cap \\mathbb{N}$ eine nicht-leere Teilmenge der natürlichen Zahlen ist und daher ein minimales Element $x$ besitzt. \nUm zu zeigen, dass $x$ ein Erzeuger von $I$ ist, müssen wir zeigen, dass jedes Element $y \\in I$ von der Form $y=ax$ ist für ein $a \\in \\mathbb{Z}.$  Eine wichtige Zutat wird die Division mit Rest.	\N	\N	\N	\N	\N	\N	\N	\N	15	f	0	2020-07-24 16:22:40.781556	\N	\N
30	\N	2020-07-24 16:29:29.670149	2022-09-20 10:34:42.711631	Remark	Wiederholung Ideal ankündigen	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	Remark	Wir schauen uns nochmal den Begriff des Ideals genauer an.	\N	\N	\N	\N	\N	\N	\N	\N	18	f	0	2020-07-24 16:29:29.670149	\N	\N
24	\N	2020-07-24 16:17:11.021084	2022-09-20 10:34:42.711631	Question	Ideale in Z erkennen	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Welche der folgenden Teilmengen von $\\mathbb{Z}$ sind Ideale?	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	12	f	0	2020-07-24 16:17:11.021084	\N	\N
20	\N	2020-07-24 16:08:25.960801	2022-09-20 10:34:42.711631	Question	Beispiele für Maximalideale in Z	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Betrachte den Ring der ganzen Zahlen $\\mathbb Z$. \n\nWelche dieser Ideale sind Maximalideale in $\\mathbb Z$?	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	8	f	0	2020-07-24 16:08:25.960801	\N	\N
45		2020-11-28 16:23:26.308384	2022-09-20 10:34:42.711631	Nuesse	Blatt 5	Lecture	1	\N	\N	{"id":"medium/45/manuscript/1cf0c8f0baf4dcb98931fd2c1bb9a6b5.pdf","storage":"store","metadata":{"filename":"Übung.V.LA 2.SS20.LA2-Blatt05.pdf","size":70765,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/45/manuscript/screenshot-06c628555c0925a1461a265e77b619ca.png","storage":"store","metadata":{"filename":"image_processing20201128-1-h318j9.png","size":43176,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	26	f	0	2020-11-28 16:23:26.308384	\N	\N
2		2020-07-24 14:06:58.962512	2022-09-20 10:34:42.711631	Kaviar		Lesson	2	{"id":"medium/2/video/6e46aab6179623cfed897b663cd723a9.mp4","storage":"store","metadata":{"filename":"LA2E02.mp4","size":1955566,"mime_type":"video/mp4","duration":60.024,"bitrate":260637,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/2/screenshot/da504c00a54f7ff2cb78cd1062af949b.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1k4u0et.png","size":190159,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/2/screenshot/normalized-a0b4b7e41202fb1abd8b5a8360c54f37.png","storage":"store","metadata":{"filename":"image_processing20200724-1-18sealr.png","size":45542,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/2/manuscript/e1582e2dea166d0e78f6504bbacc625a.pdf","storage":"store","metadata":{"filename":"LA2.E02.pdf","size":1130194,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/2/manuscript/screenshot-f4b924397fe7ada1576b2f8d0360f1f9.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1levfn8.png","size":149968,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:06:58.962512	\N	\N
4		2020-07-24 14:18:30.391486	2022-09-20 10:34:42.711631	Kaviar		Lesson	4	{"id":"medium/4/video/dd9017f21d168a56f365f54d24236133.mp4","storage":"store","metadata":{"filename":"LA2E04.mp4","size":2332822,"mime_type":"video/mp4","duration":60.024,"bitrate":310918,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/4/screenshot/91927569e5f74dd421a334cf864bf97f.png","storage":"store","metadata":{"filename":"screenshot20200724-1-18t9svm.png","size":217053,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/4/screenshot/normalized-ce2d108f74aa61caf947f27b7f2e91d7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1i2mktm.png","size":63907,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/4/manuscript/cdb87ae3926c61a4989cfc0d97b1277e.pdf","storage":"store","metadata":{"filename":"LA2.E04.pdf","size":1359479,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/4/manuscript/screenshot-9ab7c7f3c704645eb480721a53a4614e.png","storage":"store","metadata":{"filename":"image_processing20200724-1-qhhu3w.png","size":158255,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:18:30.391486	\N	\N
36	\N	2020-07-24 16:46:02.067418	2022-09-20 10:34:42.711631	Question	Zusammenhang Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Die Matrix $A\\in M_{6,6}(\\mathbb{Q})$ habe die Determinantenteiler $1,1,t-2,(t-2)^2,(t-2)^3,(t-2)^5(t-3)$. Gib die Invariantenteiler $c_1(A),\\ldots,c_6(A)$ als Tupel von Polynomen aus $\\mathbb{Q}[t]$ an.	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfTuple\n  value: 1,1,t-2,t-2,t-2,(t-2)^2*(t-3)\n  tex: "(1, 1, t-2, t-2, t-2, \\\\left(t-2\\\\right)^{2} \\\\cdot \\\\left(t-3\\\\right))"\n  nerd: vector(1,1,t-2,t-2,t-2,(t-2)^2*(t-3))\nexplanation: ''\n	free	\N	\N	\N	24	f	0	2020-07-24 16:46:02.067418	\N	\N
3		2020-07-24 14:12:39.663351	2022-09-20 10:34:42.711631	Kaviar		Lesson	3	{"id":"medium/3/video/9c61a69cb2ad6b460f32810ed366d8f4.mp4","storage":"store","metadata":{"filename":"LAL2E03.mp4","size":1752814,"mime_type":"video/mp4","duration":60.024,"bitrate":233615,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/3/screenshot/3366a1ac75c28b56e165987c425574ba.png","storage":"store","metadata":{"filename":"screenshot20200724-1-6gkzy3.png","size":174370,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/3/screenshot/normalized-c6188e6a3d396811d283a153ddafa567.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1qykrfz.png","size":42558,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/3/manuscript/02875aacacb6c00ceedf955ed0885bf8.pdf","storage":"store","metadata":{"filename":"LA2.E03.pdf","size":911950,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/3/manuscript/screenshot-09d32e534c82c32213076811e637c5d5.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1jctkbr.png","size":108707,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:12:39.663351	\N	\N
19	\N	2020-07-24 16:06:37.911565	2022-09-20 10:34:42.711631	Question	Beispiele für Primideale in Q	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Welche dieser Aussagen sind wahr?	t	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	7	f	0	2020-07-24 16:06:37.911565	\N	\N
6		2020-07-24 14:29:17.501435	2022-09-20 10:34:42.711631	Kaviar		Lesson	6	{"id":"medium/6/video/71f29269c49e634630e53741e5c4b80c.mp4","storage":"store","metadata":{"filename":"LA2E06.mp4","size":1914014,"mime_type":"video/mp4","duration":60.024,"bitrate":255099,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/6/screenshot/32c82f68b8808e9c2550c5918c034918.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1ar4gk2.png","size":213364,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/6/screenshot/normalized-5c573a2d2d5e5a0d93c932e51fcb95cc.png","storage":"store","metadata":{"filename":"image_processing20200724-1-dzinn4.png","size":57533,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/6/manuscript/48ce537f46f30e41f531c0dd4a1155fb.pdf","storage":"store","metadata":{"filename":"LA2.E06.pdf","size":1146440,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/6/manuscript/screenshot-80c2cb074e0c72693d3221b4d926c5ec.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1v5nulk.png","size":142931,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:29:17.501435	\N	\N
12		2020-07-24 15:15:19.693823	2022-09-20 10:34:42.711631	Nuesse	Blatt4	Lecture	1	\N	\N	{"id":"medium/12/manuscript/d8024479ea26e6e6b5d17cdfb9bf02b3.pdf","storage":"store","metadata":{"filename":"Übung.V.LA 2.SS20.LA2-Blatt02.pdf","size":67599,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/12/manuscript/screenshot-16b55aeefffa834857b4a3e1e515a8f3.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12sjf5y.png","size":40172,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	1	f	0	2020-07-24 15:15:19.693823	\N	\N
29	\N	2020-07-24 16:24:37.74309	2022-09-20 10:34:42.711631	Remark	Ideale in Z final	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	Remark	Damit haben wir gezeigt: Jedes $y \\in I$ ist von der Form $y= ax$ für ein $a \\in \\mathbb{Z}.$ Daher wird $I$ von $x$ erzeugt. Essentiell für den Beweis war die Division mit Rest. Divison mit Rest ist in jedem $\\textbf{``euklidischen Ring''}$ möglich. Die ganzen Zahl sind ein Beispiel eines euklidischen Rings. Der Beweis, den wir in diesem Quiz geführt haben, lässt sich auch auf euklidische Ringe übertragen. Damit würde man das folgende Ergebnis erhalten: Jeder $\\textbf{euklidische Ring}$ ist ein $\\textbf{Hauptidealring}.$	\N	\N	\N	\N	\N	\N	\N	\N	17	f	0	2020-07-24 16:24:37.74309	\N	\N
15		2020-07-24 15:58:26.59272	2022-09-20 10:34:42.711631	Reste	Informationen zur Vorlesung	Lecture	1	\N	\N	{"id":"medium/15/manuscript/6abae2f9d76fc3cf81f061e982a17b4c.pdf","storage":"store","metadata":{"filename":"Sonstiges.V.LA 2.SS20.Informationen zur Vorlesung.pdf","size":134035,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/15/manuscript/screenshot-78c940c61c11b7ea563edd44d9e08b11.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1gee8hy.png","size":73051,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	3	f	0	2020-07-24 15:58:26.59272	\N	\N
31		2020-07-24 16:30:41.490936	2022-09-20 10:34:42.711631	Question	Ideale Definition	Lecture	1	\N	\N	\N	all	\N	\N	\N		\N	\N	1	Question	Sei $R$ ein kommutativer Ring mit Eins. Eine Teilmenge $I$ von $R$ von heißt Ideal, wenn $0\\in I$ ist, für alle $a,b\\in I$ stets $a+b\\in I$ gilt und	f	\N	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc		\N	\N	19	f	0	2020-07-24 16:30:41.490936	\N	\N
16	\N	2020-07-24 16:01:47.120356	2022-09-20 10:34:42.711631	Quiz	Primideale und maximale Ideale	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 17\n  2:\n    :type: Question\n    :id: 18\n  3:\n    :type: Question\n    :id: 19\n  4:\n    :type: Question\n    :id: 20\n  5:\n    :type: Question\n    :id: 21\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	de	\N	\N		\N	\N	4	f	0	2020-07-24 16:01:47.120356	\N	\N
10		2020-07-24 14:56:40.100167	2022-09-20 10:34:42.711631	Kaviar		Lesson	10	{"id":"medium/10/video/4d452e06ae4c401055930a78f3c99e5b.mp4","storage":"store","metadata":{"filename":"LA2E10.mp4","size":1770925,"mime_type":"video/mp4","duration":60.024,"bitrate":236028,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/10/screenshot/c4d2ddda7fe38c385e8dca2341ffc8e6.png","storage":"store","metadata":{"filename":"screenshot20200724-1-mo0aeb.png","size":125109,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/10/screenshot/normalized-e0e7e6399d6a452317e3f2eb9e640cf7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-13kkkad.png","size":32713,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/10/manuscript/a02e7d985f2c2a514071775902e439c8.pdf","storage":"store","metadata":{"filename":"LA2.E10.pdf","size":638000,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/10/manuscript/screenshot-83029d5d314509f94f5d2f545dc587a3.png","storage":"store","metadata":{"filename":"image_processing20200724-1-o1213x.png","size":78449,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:56:40.100167	\N	\N
8		2020-07-24 14:46:06.857134	2022-09-20 10:34:42.711631	Kaviar		Lesson	8	{"id":"medium/8/video/c66bbf9059e1cb15f4ef25fca67a5d81.mp4","storage":"store","metadata":{"filename":"LA2E08.mp4","size":1636141,"mime_type":"video/mp4","duration":60.024,"bitrate":218064,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/8/screenshot/b1b718054ad08f98391c9e370a66949a.png","storage":"store","metadata":{"filename":"screenshot20200724-1-18a3lza.png","size":119674,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/8/screenshot/normalized-55cae70265a6b310bbbe6b95af8c0462.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12sd2sb.png","size":12571,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/8/manuscript/bbc747724b0ff16f074a0ed4d6241c65.pdf","storage":"store","metadata":{"filename":"LA2.E08.pdf","size":816914,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/8/manuscript/screenshot-cf1744a864646413b4678bddbc9a6704.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1kmhlcg.png","size":108129,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	0	2020-07-24 14:46:06.857134	\N	\N
\.


--
-- TOC entry 4243 (class 0 OID 26434)
-- Dependencies: 265
-- Data for Name: medium_tag_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.medium_tag_joins (id, medium_id, tag_id, created_at, updated_at) FROM stdin;
1	1	8	2020-07-24 13:54:47.110632	2020-07-24 13:54:47.110632
2	1	7	2020-07-24 13:54:47.113508	2020-07-24 13:54:47.113508
3	1	1	2020-07-24 13:54:47.115941	2020-07-24 13:54:47.115941
4	1	4	2020-07-24 13:54:47.118331	2020-07-24 13:54:47.118331
5	1	2	2020-07-24 13:54:47.120582	2020-07-24 13:54:47.120582
6	1	3	2020-07-24 13:54:47.122787	2020-07-24 13:54:47.122787
7	2	6	2020-07-24 14:06:58.968443	2020-07-24 14:06:58.968443
8	2	5	2020-07-24 14:06:58.970983	2020-07-24 14:06:58.970983
9	3	11	2020-07-24 14:12:39.66981	2020-07-24 14:12:39.66981
10	3	9	2020-07-24 14:12:39.673652	2020-07-24 14:12:39.673652
11	3	14	2020-07-24 14:12:39.677021	2020-07-24 14:12:39.677021
12	4	10	2020-07-24 14:18:30.397883	2020-07-24 14:18:30.397883
13	4	12	2020-07-24 14:18:30.400485	2020-07-24 14:18:30.400485
14	5	13	2020-07-24 14:23:41.525768	2020-07-24 14:23:41.525768
15	5	12	2020-07-24 14:23:41.528517	2020-07-24 14:23:41.528517
16	6	17	2020-07-24 14:29:17.506908	2020-07-24 14:29:17.506908
17	6	18	2020-07-24 14:29:17.509915	2020-07-24 14:29:17.509915
18	6	15	2020-07-24 14:29:17.512303	2020-07-24 14:29:17.512303
19	6	16	2020-07-24 14:29:17.514977	2020-07-24 14:29:17.514977
20	7	19	2020-07-24 14:33:16.156256	2020-07-24 14:33:16.156256
21	7	20	2020-07-24 14:33:16.15917	2020-07-24 14:33:16.15917
22	8	21	2020-07-24 14:46:06.863827	2020-07-24 14:46:06.863827
23	9	23	2020-07-24 14:51:14.927906	2020-07-24 14:51:14.927906
24	9	22	2020-07-24 14:51:14.931144	2020-07-24 14:51:14.931144
25	10	25	2020-07-24 14:56:40.106184	2020-07-24 14:56:40.106184
27	13	24	2020-07-24 15:45:27.48404	2020-07-24 15:45:27.48404
28	16	27	2020-07-24 16:12:46.182296	2020-07-24 16:12:46.182296
29	16	28	2020-07-24 16:13:18.196264	2020-07-24 16:13:18.196264
30	17	27	2020-07-24 16:26:22.390034	2020-07-24 16:26:22.390034
31	17	14	2020-07-24 16:26:22.396221	2020-07-24 16:26:22.396221
32	18	27	2020-07-24 16:26:34.292935	2020-07-24 16:26:34.292935
33	19	27	2020-07-24 16:26:43.605452	2020-07-24 16:26:43.605452
34	20	28	2020-07-24 16:26:51.35781	2020-07-24 16:26:51.35781
35	21	27	2020-07-24 16:26:59.451744	2020-07-24 16:26:59.451744
36	24	10	2020-07-24 16:27:07.349189	2020-07-24 16:27:07.349189
37	25	10	2020-07-24 16:27:16.124891	2020-07-24 16:27:16.124891
38	26	10	2020-07-24 16:27:24.624205	2020-07-24 16:27:24.624205
39	28	10	2020-07-24 16:27:38.571399	2020-07-24 16:27:38.571399
40	22	10	2020-07-24 16:28:01.492713	2020-07-24 16:28:01.492713
41	31	10	2020-07-24 16:36:26.056394	2020-07-24 16:36:26.056394
42	34	23	2020-07-24 16:44:15.098756	2020-07-24 16:44:15.098756
43	35	23	2020-07-24 16:46:16.814056	2020-07-24 16:46:16.814056
44	33	23	2020-07-24 16:49:40.083301	2020-07-24 16:49:40.083301
46	38	29	2020-07-24 16:56:38.648099	2020-07-24 16:56:38.648099
47	41	43	2020-09-02 09:52:38.378562	2020-09-02 09:52:38.378562
48	46	44	2022-08-05 13:35:21.245742	2022-08-05 13:35:21.245742
49	46	45	2022-08-05 13:35:21.24795	2022-08-05 13:35:21.24795
\.


--
-- TOC entry 4245 (class 0 OID 26438)
-- Dependencies: 267
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications (id, recipient_id, notifiable_id, notifiable_type, action, created_at, updated_at) FROM stdin;
1	\N	1	Course	create	2020-07-24 13:12:16.549135	2020-07-24 13:12:16.549135
2	\N	1	Announcement	create	2020-07-24 13:13:06.124278	2020-07-24 13:13:06.124278
6	\N	1	Medium	create	2020-07-24 14:05:51.206368	2020-07-24 14:05:51.206368
7	\N	2	Medium	create	2020-07-24 14:10:18.094217	2020-07-24 14:10:18.094217
8	\N	3	Medium	create	2020-07-24 14:17:32.162201	2020-07-24 14:17:32.162201
9	\N	4	Medium	create	2020-07-24 14:21:56.934163	2020-07-24 14:21:56.934163
10	\N	5	Medium	create	2020-07-24 14:27:38.518866	2020-07-24 14:27:38.518866
11	\N	6	Medium	create	2020-07-24 14:32:38.278241	2020-07-24 14:32:38.278241
12	\N	7	Medium	create	2020-07-24 14:44:52.695906	2020-07-24 14:44:52.695906
13	\N	8	Medium	create	2020-07-24 14:50:12.569179	2020-07-24 14:50:12.569179
15	\N	10	Medium	create	2020-07-24 14:59:48.499854	2020-07-24 14:59:48.499854
18	\N	12	Medium	create	2020-07-24 15:15:38.806249	2020-07-24 15:15:38.806249
23	\N	14	Medium	create	2020-07-24 15:57:22.850925	2020-07-24 15:57:22.850925
17	\N	11	Medium	create	2020-07-24 15:09:39.180668	2020-07-24 15:09:39.180668
19	\N	12	Medium	create	2020-07-24 15:15:38.806249	2020-07-24 15:15:38.806249
21	\N	13	Medium	create	2020-07-24 15:45:32.650578	2020-07-24 15:45:32.650578
24	\N	14	Medium	create	2020-07-24 15:57:22.850925	2020-07-24 15:57:22.850925
27	\N	16	Medium	create	2020-07-24 16:12:13.820151	2020-07-24 16:12:13.820151
30	\N	22	Medium	create	2020-07-24 16:25:47.320873	2020-07-24 16:25:47.320873
33	\N	33	Medium	create	2020-07-24 16:49:45.116024	2020-07-24 16:49:45.116024
47	2	15	Medium	create	2020-07-24 17:07:25.169587	2020-07-24 17:07:25.169587
74	2	43	Medium	create	2020-09-03 10:31:28.650914	2020-09-03 10:31:28.650914
78	2	45	Medium	create	2020-11-28 16:23:47.444507	2020-11-28 16:23:47.444507
79	3	45	Medium	create	2020-11-28 16:23:47.444507	2020-11-28 16:23:47.444507
93	1	3	Announcement	create	2022-08-05 14:24:49.660344	2022-08-05 14:24:49.660344
94	2	3	Announcement	create	2022-08-05 14:24:49.660344	2022-08-05 14:24:49.660344
95	5	3	Announcement	create	2022-08-05 14:24:49.660344	2022-08-05 14:24:49.660344
96	1	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
97	2	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
98	5	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
99	6	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
100	7	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
101	8	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
102	9	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
103	10	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
104	12	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
105	13	4	Announcement	create	2022-08-05 14:26:46.636809	2022-08-05 14:26:46.636809
106	1	47	Medium	create	2022-08-05 14:31:00.900278	2022-08-05 14:31:00.900278
107	2	47	Medium	create	2022-08-05 14:31:00.900278	2022-08-05 14:31:00.900278
108	5	47	Medium	create	2022-08-05 14:31:00.900278	2022-08-05 14:31:00.900278
109	1	49	Medium	create	2022-08-05 14:34:12.377754	2022-08-05 14:34:12.377754
110	2	49	Medium	create	2022-08-05 14:34:12.377754	2022-08-05 14:34:12.377754
111	5	49	Medium	create	2022-08-05 14:34:12.377754	2022-08-05 14:34:12.377754
112	1	50	Medium	create	2022-08-05 14:34:46.674499	2022-08-05 14:34:46.674499
113	2	50	Medium	create	2022-08-05 14:34:46.674499	2022-08-05 14:34:46.674499
114	5	50	Medium	create	2022-08-05 14:34:46.674499	2022-08-05 14:34:46.674499
115	1	51	Medium	create	2022-08-05 14:35:41.798564	2022-08-05 14:35:41.798564
116	2	51	Medium	create	2022-08-05 14:35:41.798564	2022-08-05 14:35:41.798564
117	5	51	Medium	create	2022-08-05 14:35:41.798564	2022-08-05 14:35:41.798564
\.


--
-- TOC entry 4247 (class 0 OID 26444)
-- Dependencies: 269
-- Data for Name: notions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notions (id, created_at, updated_at, title, locale, tag_id, aliased_tag_id) FROM stdin;
1	2020-07-24 13:20:57.19181	2020-07-24 13:20:57.19181	unitärer Raum	de	1	\N
2	2020-07-24 13:20:57.209324	2020-07-24 13:20:57.209324	unitary space	en	1	\N
3	2020-07-24 13:21:16.361894	2020-07-24 13:21:16.361894	Skalarprodukt	de	2	\N
4	2020-07-24 13:21:16.377563	2020-07-24 13:21:16.377563	scalar product	en	2	\N
5	2020-07-24 13:21:31.427138	2020-07-24 13:21:31.427138	Norm	de	3	\N
6	2020-07-24 13:21:31.443036	2020-07-24 13:21:31.443036	norm	en	3	\N
7	2020-07-24 13:22:02.733492	2020-07-24 13:22:02.733492	hermitesche Form	de	4	\N
8	2020-07-24 13:22:02.748456	2020-07-24 13:22:02.748456	hermitian form	en	4	\N
9	2020-07-24 13:22:36.926681	2020-07-24 13:22:36.926681	normaler Endomorphismus	de	5	\N
10	2020-07-24 13:22:36.940724	2020-07-24 13:22:36.940724	normal endomorphism	en	5	\N
11	2020-07-24 13:23:10.126856	2020-07-24 13:23:10.126856	Spektralsatz für normale Endomorphismen	de	6	\N
12	2020-07-24 13:23:10.141341	2020-07-24 13:23:10.141341	spectral theorem for normal endomorphisms	en	6	\N
13	2020-07-24 13:24:32.175769	2020-07-24 13:24:32.175769	unitäre Abbildung	de	7	\N
14	2020-07-24 13:24:32.191552	2020-07-24 13:24:32.191552	unitary map	en	7	\N
15	2020-07-24 13:25:01.950576	2020-07-24 13:25:01.950576	unitäre matrix	de	8	\N
16	2020-07-24 13:25:01.963087	2020-07-24 13:25:01.963087	unitary matrix	en	8	\N
17	2020-07-24 13:29:05.433855	2020-07-24 13:29:05.433855	Ring	de	9	\N
18	2020-07-24 13:29:05.450177	2020-07-24 13:29:05.450177	ring	en	9	\N
19	2020-07-24 13:29:15.594418	2020-07-24 13:29:15.594418	Ideal	de	10	\N
20	2020-07-24 13:29:15.610018	2020-07-24 13:29:15.610018	ideal	en	10	\N
21	2020-07-24 13:30:05.956469	2020-07-24 13:30:05.956469	Ringhomomorphismus	de	11	\N
22	2020-07-24 13:30:05.969956	2020-07-24 13:30:05.969956	ring homomorphism	en	11	\N
23	2020-07-24 13:30:26.162033	2020-07-24 13:30:26.162033	Faktorring	de	12	\N
24	2020-07-24 13:30:26.182248	2020-07-24 13:30:26.182248	factor ring	en	12	\N
25	2020-07-24 13:30:53.054774	2020-07-24 13:30:53.054774	Chinesischer Restsatz	de	13	\N
26	2020-07-24 13:30:53.068987	2020-07-24 13:30:53.068987	chinese remainder theorem	en	13	\N
27	2020-07-24 13:33:00.865803	2020-07-24 13:33:00.865803	Körper	de	14	\N
28	2020-07-24 13:33:00.88086	2020-07-24 13:33:00.88086	field	en	14	\N
29	2020-07-24 13:34:37.1247	2020-07-24 13:34:37.1247	Teiler	de	15	\N
30	2020-07-24 13:34:37.137776	2020-07-24 13:34:37.137776	divisor	en	15	\N
31	2020-07-24 13:35:07.255485	2020-07-24 13:35:07.255485	irreduzibles Element	de	16	\N
32	2020-07-24 13:35:07.269159	2020-07-24 13:35:07.269159	irreducible Element	en	16	\N
33	2020-07-24 13:35:29.819099	2020-07-24 13:35:29.819099	Primelement	de	17	\N
34	2020-07-24 13:35:29.833535	2020-07-24 13:35:29.833535	prime element	en	17	\N
35	2020-07-24 13:35:50.92584	2020-07-24 13:35:50.92584	faktorieller Ring	de	18	\N
36	2020-07-24 13:35:50.939439	2020-07-24 13:35:50.939439	factorial fdomain	en	18	\N
37	2020-07-24 13:35:50.952258	2020-07-24 13:35:50.952258	ZPE-Ring	de	\N	18
38	2020-07-24 13:36:38.55848	2020-07-24 13:36:38.55848	euklidischer Ring	de	19	\N
39	2020-07-24 13:36:38.576474	2020-07-24 13:36:38.576474	euclidean domain	en	19	\N
40	2020-07-24 13:37:19.257722	2020-07-24 13:37:19.257722	euklidischer Algorithmus	de	20	\N
41	2020-07-24 13:37:19.271545	2020-07-24 13:37:19.271545	euclidean algorithm	en	20	\N
42	2020-07-24 13:38:04.79753	2020-07-24 13:38:04.79753	Elementarteilersatz für Matrizen über eukl. Ringen	de	21	\N
43	2020-07-24 13:38:04.811544	2020-07-24 13:38:04.811544	elementary divisor theorem for matrices over euclidean domains	en	21	\N
44	2020-07-24 13:43:04.037586	2020-07-24 13:43:04.037586	Satz von Frobenius	de	22	\N
45	2020-07-24 13:43:04.051689	2020-07-24 13:43:04.051689	Frobenius' theorem	en	22	\N
46	2020-07-24 13:43:48.724816	2020-07-24 13:43:48.724816	Invarianten- und Determinantenteiler einer Matrix	de	23	\N
47	2020-07-24 13:43:48.739205	2020-07-24 13:43:48.739205	invariant and derterminant divisors of a matrix	en	23	\N
48	2020-07-24 13:44:47.070403	2020-07-24 13:44:47.070403	Frobenius-Normalform	de	24	\N
49	2020-07-24 13:44:47.085206	2020-07-24 13:44:47.085206	Frobenius normal form	en	24	\N
50	2020-07-24 13:44:47.105494	2020-07-24 13:44:47.105494	rationale Normalform	de	\N	24
51	2020-07-24 13:45:18.072131	2020-07-24 13:45:18.072131	Weierstrass-Normalform	de	25	\N
52	2020-07-24 13:45:18.086401	2020-07-24 13:45:18.086401	Weierstrass normal form	en	25	\N
53	2020-07-24 13:45:38.511337	2020-07-24 13:45:38.511337	Jordansche Normalform	de	26	\N
54	2020-07-24 13:45:38.526812	2020-07-24 13:45:38.526812	Jordan normal form	en	26	\N
55	2020-07-24 16:12:42.745069	2020-07-24 16:12:42.745069	Primideal	de	27	\N
56	2020-07-24 16:12:42.76217	2020-07-24 16:12:42.76217	prime ideal	en	27	\N
57	2020-07-24 16:13:15.856189	2020-07-24 16:13:15.856189	maximales Ideal	de	28	\N
58	2020-07-24 16:13:15.8714	2020-07-24 16:13:15.8714	maximal ideal	en	28	\N
59	2020-07-24 16:53:57.260048	2020-07-24 16:53:57.260048	Geschichte der Algebra	de	29	\N
60	2020-07-24 16:53:57.274872	2020-07-24 16:53:57.274872	history of algebra	en	29	\N
61	2020-07-24 17:04:35.550378	2020-07-24 17:04:35.550378	affiner Raum	de	30	\N
62	2020-07-24 17:04:35.613201	2020-07-24 17:04:35.613201	affine Dimension	de	31	\N
63	2020-07-24 17:04:35.679347	2020-07-24 17:04:35.679347	affiner Standardraum	de	32	\N
64	2020-07-24 17:04:35.74631	2020-07-24 17:04:35.74631	affiner Unterraum	de	33	\N
65	2020-07-24 17:04:35.802167	2020-07-24 17:04:35.802167	affine Unterräume der affinen Standardräume	de	34	\N
66	2020-07-24 17:04:35.860555	2020-07-24 17:04:35.860555	Beliebigkeit des Aufpunkts eines affinen Unterraums	de	35	\N
67	2020-07-24 17:04:35.918888	2020-07-24 17:04:35.918888	Dimension eines affinen Unterraums	de	36	\N
68	2020-07-24 17:04:35.979005	2020-07-24 17:04:35.979005	affine Unterräume sind affine Räume	de	37	\N
69	2020-07-24 17:04:36.038432	2020-07-24 17:04:36.038432	Durchschnitt und Verbindungsraum affiner Räume	de	38	\N
70	2020-07-24 17:04:36.093218	2020-07-24 17:04:36.093218	Verbindungsraum als Vereinigung von Verbindungsgeraden	de	39	\N
71	2020-07-24 17:04:36.149964	2020-07-24 17:04:36.149964	Dimensionsformel für affine Unterräume	de	40	\N
72	2020-07-24 17:04:36.207658	2020-07-24 17:04:36.207658	parallel und windschief	de	41	\N
73	2020-07-24 17:04:36.266953	2020-07-24 17:04:36.266953	eine Hyperebene ist zu keinem affinen Unterraum windschief	de	42	\N
74	2020-09-02 09:52:36.089137	2020-09-02 09:52:36.089137	Tensorprodukt	de	43	\N
75	2022-08-05 13:29:45.507661	2022-08-05 13:29:45.507661	Gruppe	de	44	\N
76	2022-08-05 13:29:45.553965	2022-08-05 13:29:45.553965	group	en	44	\N
77	2022-08-05 13:30:12.632794	2022-08-05 13:30:12.632794	Gruppenhomomorphismus	de	45	\N
78	2022-08-05 13:30:12.643284	2022-08-05 13:30:12.643284	group homomorphism	en	45	\N
\.


--
-- TOC entry 4249 (class 0 OID 26450)
-- Dependencies: 271
-- Data for Name: program_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.program_translations (id, program_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:11:01.072876	2020-07-24 13:11:01.072876	BSc 100%
2	1	en	2020-07-24 13:11:01.075914	2020-07-24 13:11:01.075914	BSc 100%
3	2	de	2020-07-24 13:11:37.797744	2020-07-24 13:11:37.797744	BSc 100%
4	2	en	2020-07-24 13:11:37.800449	2020-07-24 13:11:37.800449	BSc 100%
\.


--
-- TOC entry 4251 (class 0 OID 26456)
-- Dependencies: 273
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programs (id, created_at, updated_at, subject_id) FROM stdin;
1	2020-07-24 13:11:01.069662	2020-07-24 13:11:01.069662	1
2	2020-07-24 13:11:37.794408	2020-07-24 13:11:37.794408	2
\.


--
-- TOC entry 4253 (class 0 OID 26460)
-- Dependencies: 275
-- Data for Name: quiz_certificates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quiz_certificates (id, quiz_id, user_id, code, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4254 (class 0 OID 26466)
-- Dependencies: 276
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.readers (id, user_id, thread_id, created_at, updated_at) FROM stdin;
1	3	1	2020-09-02 09:20:23.743252	2020-09-02 09:20:23.750381
\.


--
-- TOC entry 4256 (class 0 OID 26470)
-- Dependencies: 278
-- Data for Name: referrals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.referrals (id, start_time, end_time, explanation, item_id, medium_id, created_at, updated_at) FROM stdin;
1	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	1	2	2020-07-24 14:10:05.501443	2020-07-24 14:10:05.501443
2	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	3	3	2020-07-24 14:15:17.758296	2020-07-24 14:15:17.758296
3	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	5	4	2020-07-24 14:21:49.552306	2020-07-24 14:21:49.552306
4	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	7	5	2020-07-24 14:25:31.042969	2020-07-24 14:25:31.042969
5	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	10	6	2020-07-24 14:32:31.681089	2020-07-24 14:32:31.681089
6	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	12	7	2020-07-24 14:35:32.496587	2020-07-24 14:35:32.496587
7	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n		14	8	2020-07-24 14:49:50.813587	2020-07-24 14:49:50.813587
8	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	vorige Sitzung	19	10	2020-07-24 14:58:27.267194	2020-07-24 14:58:27.267194
9	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n		373	9	2020-08-11 15:13:23.292473	2020-08-11 15:13:23.292473
10	--- &1 !ruby/object:TimeStamp\nmilliseconds: 434\nminutes: 0\nseconds: 36\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 24\nminutes: 1\nseconds: 0\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  messages: {}\n  details: {}\n		373	5	2020-08-11 15:14:37.166967	2020-08-11 15:14:37.166967
11	--- &1 !ruby/object:TimeStamp\nmilliseconds: 828\nminutes: 0\nseconds: 33\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 526\nminutes: 0\nseconds: 53\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	Der Zusammenhang ist offensichtlich.	379	47	2022-08-05 15:11:32.48664	2022-08-05 15:11:32.48664
12	--- &1 !ruby/object:TimeStamp\nmilliseconds: 128\nminutes: 0\nseconds: 36\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	--- &1 !ruby/object:TimeStamp\nmilliseconds: 526\nminutes: 0\nseconds: 53\nhours: 0\nvalidation_context: \nerrors: !ruby/object:ActiveModel::Errors\n  base: *1\n  errors: []\n	Hier ein Wikipedia-Link zum Eisensteinkriterium.	387	47	2022-08-05 15:13:19.451249	2022-08-05 15:13:19.451249
\.


--
-- TOC entry 4258 (class 0 OID 26476)
-- Dependencies: 280
-- Data for Name: relations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.relations (id, tag_id, related_tag_id, created_at, updated_at) FROM stdin;
1	2	1	2020-07-24 13:21:16.337447	2020-07-24 13:21:16.337447
2	1	2	2020-07-24 13:21:16.350267	2020-07-24 13:21:16.350267
3	3	2	2020-07-24 13:21:31.407666	2020-07-24 13:21:31.407666
4	2	3	2020-07-24 13:21:31.418716	2020-07-24 13:21:31.418716
5	4	1	2020-07-24 13:22:02.708632	2020-07-24 13:22:02.708632
6	1	4	2020-07-24 13:22:02.720156	2020-07-24 13:22:02.720156
7	6	5	2020-07-24 13:23:10.106892	2020-07-24 13:23:10.106892
8	5	6	2020-07-24 13:23:10.118191	2020-07-24 13:23:10.118191
9	7	1	2020-07-24 13:24:32.155482	2020-07-24 13:24:32.155482
10	1	7	2020-07-24 13:24:32.167077	2020-07-24 13:24:32.167077
11	8	7	2020-07-24 13:25:01.930638	2020-07-24 13:25:01.930638
12	7	8	2020-07-24 13:25:01.941907	2020-07-24 13:25:01.941907
13	12	9	2020-07-24 13:30:26.139518	2020-07-24 13:30:26.139518
14	9	12	2020-07-24 13:30:26.151298	2020-07-24 13:30:26.151298
15	13	12	2020-07-24 13:30:53.035444	2020-07-24 13:30:53.035444
16	12	13	2020-07-24 13:30:53.046669	2020-07-24 13:30:53.046669
17	10	9	2020-07-24 13:32:22.010176	2020-07-24 13:32:22.010176
18	9	10	2020-07-24 13:32:22.022753	2020-07-24 13:32:22.022753
19	14	9	2020-07-24 13:33:00.841697	2020-07-24 13:33:00.841697
20	9	14	2020-07-24 13:33:00.856229	2020-07-24 13:33:00.856229
21	16	15	2020-07-24 13:35:07.234974	2020-07-24 13:35:07.234974
22	15	16	2020-07-24 13:35:07.246539	2020-07-24 13:35:07.246539
23	17	16	2020-07-24 13:35:29.775158	2020-07-24 13:35:29.775158
24	16	17	2020-07-24 13:35:29.78652	2020-07-24 13:35:29.78652
25	17	15	2020-07-24 13:35:29.799231	2020-07-24 13:35:29.799231
26	15	17	2020-07-24 13:35:29.810702	2020-07-24 13:35:29.810702
27	19	18	2020-07-24 13:36:38.53788	2020-07-24 13:36:38.53788
28	18	19	2020-07-24 13:36:38.550585	2020-07-24 13:36:38.550585
29	20	19	2020-07-24 13:37:19.23978	2020-07-24 13:37:19.23978
30	19	20	2020-07-24 13:37:19.249815	2020-07-24 13:37:19.249815
31	21	19	2020-07-24 13:38:04.779548	2020-07-24 13:38:04.779548
32	19	21	2020-07-24 13:38:04.790184	2020-07-24 13:38:04.790184
33	22	21	2020-07-24 13:43:04.019358	2020-07-24 13:43:04.019358
34	21	22	2020-07-24 13:43:04.029016	2020-07-24 13:43:04.029016
35	23	21	2020-07-24 13:43:48.704458	2020-07-24 13:43:48.704458
36	21	23	2020-07-24 13:43:48.716877	2020-07-24 13:43:48.716877
37	24	23	2020-07-24 13:44:47.0509	2020-07-24 13:44:47.0509
38	23	24	2020-07-24 13:44:47.062023	2020-07-24 13:44:47.062023
39	25	24	2020-07-24 13:45:18.033143	2020-07-24 13:45:18.033143
40	24	25	2020-07-24 13:45:18.042911	2020-07-24 13:45:18.042911
41	25	23	2020-07-24 13:45:18.053561	2020-07-24 13:45:18.053561
42	23	25	2020-07-24 13:45:18.064253	2020-07-24 13:45:18.064253
43	26	25	2020-07-24 13:45:38.492538	2020-07-24 13:45:38.492538
44	25	26	2020-07-24 13:45:38.502523	2020-07-24 13:45:38.502523
45	27	17	2020-07-24 16:12:42.72324	2020-07-24 16:12:42.72324
46	17	27	2020-07-24 16:12:42.735166	2020-07-24 16:12:42.735166
47	28	27	2020-07-24 16:13:15.835205	2020-07-24 16:13:15.835205
48	27	28	2020-07-24 16:13:15.846438	2020-07-24 16:13:15.846438
49	45	44	2022-08-05 13:31:09.019332	2022-08-05 13:31:09.019332
50	44	45	2022-08-05 13:31:09.026362	2022-08-05 13:31:09.026362
\.


--
-- TOC entry 4260 (class 0 OID 26480)
-- Dependencies: 282
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20170731143601
20170909120217
20170909133037
20170914151647
20170914162323
20170919123229
20170923111653
20170924083728
20170926152242
20171001163138
20171001200216
20171001204632
20171002153622
20171007115305
20171009142032
20171009164246
20171009172505
20171011122408
20171011171726
20171013093342
20171016171419
20171021135749
20180524065013
20180524065149
20180524103749
20180804125856
20180804161127
20180806092317
20180806100940
20180806124930
20180808092444
20180808110436
20180808124013
20180809103756
20180812172548
20180816125615
20180816125644
20180819151835
20180820123437
20180820152008
20180820152123
20180821132727
20180821133012
20180821135946
20180821140516
20180821140606
20180821164804
20180822105514
20180824155138
20180830080855
20180830081938
20180830084403
20180830085749
20180830093646
20180830121324
20180830121400
20180830121502
20180830121545
20180902065347
20180905085019
20180905085400
20180905134510
20180906114938
20180906122130
20180907135635
20180907154637
20180907155337
20180908101213
20180908122719
20180909152247
20180909152728
20180910124741
20180911085149
20180913104612
20180913110600
20180913110737
20181007101351
20181015141212
20181129113233
20181129115315
20181207142648
20181210173053
20181216120201
20181222160210
20181222164908
20181222165544
20181223190159
20190106121300
20190126161457
20190127120458
20190127121403
20190203110121
20190204155920
20190204161127
20190207092000
20190211172104
20190212143919
20190224133946
20190225103346
20190225142347
20190225151323
20190226102954
20190227130143
20190227142829
20190227173517
20190301121741
20190304115617
20190323135214
20190323142434
20190323142600
20190323143039
20190323143455
20190325131507
20190327133213
20190329135055
20190401132545
20190401132839
20190401141907
20190404132603
20190405110252
20190406151823
20190410105555
20190418081446
20190424124609
20190424171641
20190424174546
20190430111047
20190501135008
20190501135301
20190501135815
20190502130040
20190502130152
20190507103930
20190507105006
20190507171538
20190508130822
20190508131506
20190508131550
20190508140309
20190508152304
20190508155308
20190510233648
20190511031012
20190518161033
20190522110318
20190522114150
20190522152209
20190606084258
20190610051931
20190611081201
20190709111532
20190803110440
20190803162036
20190806121625
20190807094614
20190807112347
20190807140702
20190808083640
20190808083830
20190808090901
20190809080758
20190809093136
20190816133744
20190816141526
20190817163159
20190926140031
20191112173840
20191129161025
20191204174533
20200305111817
20200306112006
20200309124905
20200309125231
20200309125401
20200310164147
20200320115753
20200320115821
20200320120903
20200320124731
20200320124830
20200322124947
20200322125249
20200322130432
20200323192640
20200410111827
20200410111828
20200412083413
20200412103921
20200412104751
20200413121127
20200414170119
20200503120849
20200509111503
20200510062602
20200510104347
20200521120400
20200521125454
20200521152116
20200521152416
20200531141619
20200606133607
20200611130229
20200613090342
20200809123000
20200810162008
20200831120105
20200901131834
20200903105622
20200903152249
20200907113337
20200908112756
20200909104314
20200910101127
20200911144018
20200911144948
20200914105849
20200916115720
20200926155041
20200927111435
20200927134606
20200930101924
20201002091503
20201002092028
20201002094500
20201002095520
20201004141237
20201005135129
20201006113955
20201008135825
20201009154917
20201009160756
20201015154231
20201017133345
20201022163956
20201026151550
20201030104932
20201114125010
20201121151659
20201124223030
20201129133117
20201206161307
20201213123754
20210226094753
20210226104256
20210226124230
20210319102604
20210610230901
20210629133704
20210710122546
20210710122706
20210710130619
20210710152036
20210711095102
20210711104739
20210823141044
20210827141317
20210828094735
20210908162847
20210909153352
20210923085744
20210923113111
20211119181430
20220125162730
\.


--
-- TOC entry 4261 (class 0 OID 26485)
-- Dependencies: 283
-- Data for Name: section_tag_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.section_tag_joins (id, section_id, tag_id, created_at, updated_at, tag_position) FROM stdin;
1	2	1	2020-07-24 13:23:31.176272	2020-07-24 13:23:31.176272	0
2	2	2	2020-07-24 13:23:31.183351	2020-07-24 13:23:31.183351	1
3	2	3	2020-07-24 13:23:31.189321	2020-07-24 13:23:31.189321	2
4	2	4	2020-07-24 13:23:31.194912	2020-07-24 13:23:31.194912	3
9	1	9	2020-07-24 13:31:05.978526	2020-07-24 13:31:05.978526	0
14	1	14	2020-07-24 13:33:04.975486	2020-07-24 13:33:05.061602	1
15	3	15	2020-07-24 13:35:58.100691	2020-07-24 13:35:58.100691	0
16	3	16	2020-07-24 13:35:58.106472	2020-07-24 13:35:58.106472	1
17	3	17	2020-07-24 13:35:58.112755	2020-07-24 13:35:58.112755	2
18	3	18	2020-07-24 13:35:58.119046	2020-07-24 13:35:58.119046	3
19	4	19	2020-07-24 13:38:07.864091	2020-07-24 13:38:07.864091	0
20	4	20	2020-07-24 13:38:07.873731	2020-07-24 13:38:07.873731	1
21	4	21	2020-07-24 13:38:07.889562	2020-07-24 13:38:07.889562	2
22	5	22	2020-07-24 13:43:59.598103	2020-07-24 13:43:59.598103	0
23	5	23	2020-07-24 13:43:59.603581	2020-07-24 13:43:59.603581	1
5	2	5	2020-07-24 13:23:31.201839	2020-07-24 13:47:19.203681	6
6	2	6	2020-07-24 13:23:31.207435	2020-07-24 13:47:19.213658	7
7	2	7	2020-07-24 13:25:06.596293	2020-07-24 13:47:19.222529	5
8	2	8	2020-07-24 13:25:06.602302	2020-07-24 13:47:19.231806	4
10	1	10	2020-07-24 13:31:05.985152	2020-07-24 16:13:56.546397	3
11	1	11	2020-07-24 13:31:05.992225	2020-07-24 16:13:56.555669	2
12	1	12	2020-07-24 13:31:05.998073	2020-07-24 16:13:56.565237	6
13	1	13	2020-07-24 13:31:06.003541	2020-07-24 16:13:56.574989	7
27	1	27	2020-07-24 16:13:56.479114	2020-07-24 16:13:56.58511	4
28	1	28	2020-07-24 16:13:56.485965	2020-07-24 16:13:56.595825	5
29	7	29	2020-07-24 16:54:01.776321	2020-07-24 16:54:01.776321	0
30	8	30	2020-07-24 17:04:35.545577	2020-07-24 17:04:35.545577	0
31	8	31	2020-07-24 17:04:35.607354	2020-07-24 17:04:35.607354	1
32	8	32	2020-07-24 17:04:35.674265	2020-07-24 17:04:35.674265	2
33	8	33	2020-07-24 17:04:35.740439	2020-07-24 17:04:35.740439	3
34	8	34	2020-07-24 17:04:35.797357	2020-07-24 17:04:35.797357	4
35	8	35	2020-07-24 17:04:35.855949	2020-07-24 17:04:35.855949	5
36	8	36	2020-07-24 17:04:35.914289	2020-07-24 17:04:35.914289	6
37	8	37	2020-07-24 17:04:35.974271	2020-07-24 17:04:35.974271	7
38	8	38	2020-07-24 17:04:36.03203	2020-07-24 17:04:36.03203	8
39	8	39	2020-07-24 17:04:36.0886	2020-07-24 17:04:36.0886	9
40	8	40	2020-07-24 17:04:36.144264	2020-07-24 17:04:36.144264	10
41	8	41	2020-07-24 17:04:36.203116	2020-07-24 17:04:36.203116	11
42	8	42	2020-07-24 17:04:36.261647	2020-07-24 17:04:36.261647	12
25	6	25	2020-07-24 13:45:40.489071	2020-09-01 15:21:00.408056	0
26	6	26	2020-07-24 13:45:40.496223	2020-09-01 15:21:00.423973	1
\.


--
-- TOC entry 4263 (class 0 OID 26489)
-- Dependencies: 285
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sections (id, chapter_id, title, created_at, updated_at, "position", display_number, hidden, tags_order, details) FROM stdin;
25	7	Der Kongruenzsatz für Dreiecke	2020-07-24 17:04:34.840428	2020-07-24 17:05:02.889962	6	\N	\N	\N	\N
26	7	Mittelsenkrechte und Winkelhalbierende	2020-07-24 17:04:34.871461	2020-07-24 17:05:02.889962	7	\N	\N	\N	\N
27	7	Innen- und Außenwinkel im Dreieck	2020-07-24 17:04:34.90258	2020-07-24 17:05:02.889962	8	\N	\N	\N	\N
28	7	In- und Umkreis	2020-07-24 17:04:34.934588	2020-07-24 17:05:02.889962	9	\N	\N	\N	\N
9	5	Affine Abbildungen	2020-07-24 17:04:34.31982	2020-07-24 17:05:02.889962	2	\N	\N	\N	\N
10	5	Affine Koordinaten	2020-07-24 17:04:34.351367	2020-07-24 17:05:02.889962	3	\N	\N	\N	\N
11	5	Polytope	2020-07-24 17:04:34.386976	2020-07-24 17:05:02.889962	4	\N	\N	\N	\N
29	7	Übungsaufgaben	2020-07-24 17:04:34.966316	2020-07-24 17:05:02.889962	10	\N	\N	\N	\N
12	5	Projektive Räume	2020-07-24 17:04:34.426172	2020-07-24 17:05:02.889962	5	\N	\N	\N	\N
13	5	Projektive Abbildungen	2020-07-24 17:04:34.459566	2020-07-24 17:05:02.889962	6	\N	\N	\N	\N
14	5	Projektive Koordinaten	2020-07-24 17:04:34.491447	2020-07-24 17:05:02.889962	7	\N	\N	\N	\N
30	8	Das Vollständigkeitsaxiom	2020-07-24 17:04:34.99914	2020-07-24 17:05:02.889962	1	\N	\N	\N	\N
15	5	Computergraphik	2020-07-24 17:04:34.523458	2020-07-24 17:05:02.889962	8	\N	\N	\N	\N
16	5	Übungsaufgaben	2020-07-24 17:04:34.556461	2020-07-24 17:05:02.889962	9	\N	\N	\N	\N
31	8	Euklidische Ebenen	2020-07-24 17:04:35.027944	2020-07-24 17:05:02.889962	2	\N	\N	\N	\N
32	8	Kreise	2020-07-24 17:04:35.060817	2020-07-24 17:05:02.889962	3	\N	\N	\N	\N
17	6	Inzidenzebenen	2020-07-24 17:04:34.590767	2020-07-24 17:05:02.889962	1	\N	\N	\N	\N
33	8	Die Inversion am Kreis	2020-07-24 17:04:35.092405	2020-07-24 17:05:02.889962	4	\N	\N	\N	\N
18	6	Affine Ebenen	2020-07-24 17:04:34.621909	2020-07-24 17:05:02.889962	2	\N	\N	\N	\N
19	6	Übungsaufgaben	2020-07-24 17:04:34.651674	2020-07-24 17:05:02.889962	3	\N	\N	\N	\N
20	7	Die Anordnungsaxiome	2020-07-24 17:04:34.684294	2020-07-24 17:05:02.889962	1	\N	\N	\N	\N
34	8	Übungsaufgaben	2020-07-24 17:04:35.123464	2020-07-24 17:05:02.889962	5	\N	\N	\N	\N
21	7	Die Kongruenzaxiome für Strecken	2020-07-24 17:04:34.715512	2020-07-24 17:05:02.889962	2	\N	\N	\N	\N
22	7	Die Kongruenzaxiome für Winkel	2020-07-24 17:04:34.745589	2020-07-24 17:05:02.889962	3	\N	\N	\N	\N
23	7	Ergänzungswinkel, Gegenwinkel und rechte Winkel	2020-07-24 17:04:34.77568	2020-07-24 17:05:02.889962	4	\N	\N	\N	\N
35	9	Das Poincaré'sche Kreismodell	2020-07-24 17:04:35.160116	2020-07-24 17:05:02.889962	1	\N	\N	\N	\N
24	7	Orthogonalität und Parallelität	2020-07-24 17:04:34.806388	2020-07-24 17:05:02.889962	5	\N	\N	\N	\N
36	9	Hyperbolische Geometrie	2020-07-24 17:04:35.190516	2020-07-24 17:05:02.889962	2	\N	\N	\N	\N
8	5	Affine Räume	2020-07-24 17:04:34.287564	2020-07-24 17:05:02.889962	1	\N	\N	\N	\N
37	9	Übungsaufgaben	2020-07-24 17:04:35.220559	2020-07-24 17:05:02.889962	3	\N	\N	\N	\N
7	4	Eine kurze Geschichte der Algebra	2020-07-24 16:53:07.753998	2022-08-05 14:06:57.256083	1	\N	\N	\N	\N
5	3	Invarianten- und Determinantenteiler	2020-07-24 13:19:58.558913	2022-09-20 10:34:42.716211	1		f	\N	
2	1	Unitäre Räume und der Spektralsatz	2020-07-24 13:19:21.145061	2022-09-20 10:34:42.716211	1		f	\N	
3	2	Teilbarkeit	2020-07-24 13:19:33.31142	2022-09-20 10:34:42.716211	2		f	\N	
4	2	Euklidische Ringe	2020-07-24 13:19:42.036437	2022-09-20 10:34:42.716211	3		f	\N	
1	2	Ringe und Ideale	2020-07-24 13:18:45.156279	2022-09-20 10:34:42.716211	1		f	\N	
6	3	Normalformen	2020-07-24 13:20:07.536377	2022-09-20 10:34:42.716211	2		f	\N	
\.


--
-- TOC entry 4333 (class 0 OID 27252)
-- Dependencies: 355
-- Data for Name: speaker_talk_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.speaker_talk_joins (id, talk_id, speaker_id, created_at, updated_at) FROM stdin;
1	1	5	2022-08-05 13:27:59.320402	2022-08-05 13:27:59.320402
2	1	6	2022-08-05 13:31:37.207743	2022-08-05 13:31:37.207743
\.


--
-- TOC entry 4265 (class 0 OID 26495)
-- Dependencies: 287
-- Data for Name: subject_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subject_translations (id, subject_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:10:54.797363	2020-07-24 13:10:54.797363	Mathematik
2	1	en	2020-07-24 13:10:54.800296	2020-07-24 13:10:54.800296	Mathematics
3	2	de	2020-07-24 13:11:31.488701	2020-07-24 13:11:31.488701	Informatik
4	2	en	2020-07-24 13:11:31.492281	2020-07-24 13:11:31.492281	Computer Science
\.


--
-- TOC entry 4267 (class 0 OID 26501)
-- Dependencies: 289
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subjects (id, created_at, updated_at) FROM stdin;
1	2020-07-24 13:10:54.791691	2020-07-24 13:10:54.791691
2	2020-07-24 13:11:31.484615	2020-07-24 13:11:31.484615
\.


--
-- TOC entry 4269 (class 0 OID 26505)
-- Dependencies: 291
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.submissions (tutorial_id, assignment_id, token, created_at, updated_at, manuscript_data, invited_user_ids, correction_data, id, last_modification_by_users_at, accepted) FROM stdin;
1	1	9iVG9t	2020-11-28 16:47:39.509532	2020-11-28 16:53:54.375618	{"id":"2053b3abc33881461a4bd884d867ca4c.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"b2e1169bf837f544df8f1e0627e7481e.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	6e088ccc-9568-4dc6-8354-9b46c2c7d135	2020-11-28 16:51:20.326433	t
1	2	DHQ7Yd	2020-11-28 16:55:33.791975	2020-11-28 16:55:33.822069	{"id":"c07f01e9f7400fa298b639d41ccc84f8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	\N	e5c5f104-94c2-4f6d-b3ee-ec84b26c81ed	2020-11-28 16:55:33.821883	\N
1	1	7ZuBdv	2020-11-28 16:48:16.014103	2020-11-28 16:53:45.950681	{"id":"78f53faef661f736a9f775ce2946d3a4.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"feca3ab66f00c78344785b4de2de4dee.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	21e42f50-a50d-4ea6-9239-94ef2c0f238a	2020-11-28 16:48:36.102696	\N
1	1	soywYN	2020-11-28 16:48:56.729104	2020-11-28 16:53:49.943971	{"id":"1baef7a77688a207fc32b595406433d8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"8768adf897b9786221e25eb12b2c4956.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	d6ce28ca-e8b4-4f3c-8ad4-61ef035c88aa	2020-11-28 16:49:20.704658	\N
1	3	r9Hqx5	2022-08-05 14:51:06.864604	2022-08-05 14:52:06.705536	{"id":"1a0fd5eabca55ff91c0ca56e20e16fa1.pdf","storage":"submission_store","metadata":{"filename":"empty.pdf","size":1154,"mime_type":"application/pdf"}}	{}	\N	d9d47c3a-f53b-4afc-adc2-61a6e050cb30	2022-08-05 14:52:06.704508	\N
\.


--
-- TOC entry 4270 (class 0 OID 26513)
-- Dependencies: 292
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, created_at, updated_at, realizations) FROM stdin;
10	2020-07-24 13:29:15.586878	2020-07-24 16:14:14.739601	\N
12	2020-07-24 13:30:26.128269	2020-07-24 16:14:14.739601	\N
27	2020-07-24 16:12:42.712164	2020-07-24 16:14:14.739601	\N
28	2020-07-24 16:13:15.823817	2020-07-24 16:14:14.739601	\N
29	2020-07-24 16:53:57.252477	2020-07-24 16:54:01.75246	\N
30	2020-07-24 17:04:35.538948	2020-07-24 17:04:35.555225	\N
31	2020-07-24 17:04:35.600794	2020-07-24 17:04:35.617884	\N
32	2020-07-24 17:04:35.667531	2020-07-24 17:04:35.684388	\N
33	2020-07-24 17:04:35.728915	2020-07-24 17:04:35.751162	\N
11	2020-07-24 13:30:05.949715	2020-07-24 13:49:32.439558	\N
9	2020-07-24 13:29:05.426574	2020-07-24 13:49:32.439558	\N
34	2020-07-24 17:04:35.791338	2020-07-24 17:04:35.807314	\N
14	2020-07-24 13:33:00.82869	2020-07-24 13:49:32.439558	\N
13	2020-07-24 13:30:53.026747	2020-07-24 13:49:40.210127	\N
35	2020-07-24 17:04:35.849766	2020-07-24 17:04:35.865359	\N
18	2020-07-24 13:35:50.918108	2020-07-24 13:49:56.861716	\N
15	2020-07-24 13:34:37.118068	2020-07-24 13:49:56.861716	\N
16	2020-07-24 13:35:07.225423	2020-07-24 13:49:56.861716	\N
36	2020-07-24 17:04:35.907599	2020-07-24 17:04:35.923252	\N
37	2020-07-24 17:04:35.96849	2020-07-24 17:04:35.983968	\N
38	2020-07-24 17:04:36.025163	2020-07-24 17:04:36.042888	\N
39	2020-07-24 17:04:36.082368	2020-07-24 17:04:36.098185	\N
40	2020-07-24 17:04:36.136735	2020-07-24 17:04:36.154507	\N
19	2020-07-24 13:36:38.528431	2020-07-24 13:50:41.399322	\N
41	2020-07-24 17:04:36.196549	2020-07-24 17:04:36.21251	\N
20	2020-07-24 13:37:19.231512	2020-07-24 13:50:41.399322	\N
21	2020-07-24 13:38:04.769944	2020-07-24 13:50:58.072537	\N
42	2020-07-24 17:04:36.255396	2020-07-24 17:04:36.271542	\N
25	2020-07-24 13:45:18.024992	2020-07-24 13:53:15.411455	\N
24	2020-07-24 13:44:47.041647	2020-07-24 13:53:15.411455	\N
26	2020-07-24 13:45:38.483423	2020-07-24 13:53:20.643563	\N
8	2020-07-24 13:25:01.92009	2020-07-24 13:47:35.48708	\N
7	2020-07-24 13:24:32.144852	2020-07-24 13:47:35.48708	\N
1	2020-07-24 13:20:57.182882	2020-07-24 13:47:35.48708	\N
23	2020-07-24 13:43:48.693729	2020-07-24 14:55:18.436726	\N
4	2020-07-24 13:22:02.697548	2020-07-24 13:47:35.48708	\N
2	2020-07-24 13:21:16.326791	2020-07-24 13:47:35.48708	\N
22	2020-07-24 13:43:04.010122	2020-07-24 14:55:18.436726	\N
3	2020-07-24 13:21:31.396819	2020-07-24 13:47:35.48708	\N
6	2020-07-24 13:23:10.09721	2020-07-24 13:47:45.838218	\N
5	2020-07-24 13:22:36.919083	2020-07-24 13:47:45.838218	\N
17	2020-07-24 13:35:29.764739	2020-07-24 16:12:42.740556	\N
43	2020-09-02 09:52:36.079263	2020-09-02 09:52:36.095856	\N
44	2022-08-05 13:29:45.502148	2022-08-05 13:31:09.028357	\N
45	2022-08-05 13:30:12.628652	2022-08-05 13:31:09.067861	\N
\.


--
-- TOC entry 4339 (class 0 OID 27313)
-- Dependencies: 361
-- Data for Name: talk_tag_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.talk_tag_joins (id, talk_id, tag_id, created_at, updated_at) FROM stdin;
1	1	44	2022-08-05 13:30:27.138879	2022-08-05 13:30:27.138879
2	1	45	2022-08-05 13:30:27.140961	2022-08-05 13:30:27.140961
\.


--
-- TOC entry 4331 (class 0 OID 27239)
-- Dependencies: 353
-- Data for Name: talks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.talks (id, lecture_id, created_at, updated_at, title, "position", details, dates, description, display_description) FROM stdin;
1	27	2022-08-05 13:21:29.874189	2022-08-05 13:57:32.718902	Gruppen	1	<div>Test</div>	{2022-08-05}	<div>Ich halte einen Vortrag über Gruppen.</div>	t
\.


--
-- TOC entry 4272 (class 0 OID 26519)
-- Dependencies: 294
-- Data for Name: terms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.terms (id, year, season, created_at, updated_at, active, submission_deletion_mail, submission_deletion_reminder, submissions_deleted_at) FROM stdin;
2	2019	WS	2020-07-24 16:51:35.08902	2020-07-24 16:51:35.08902	f	\N	\N	\N
3	2018	WS	2020-08-10 15:45:28.438147	2020-08-10 15:45:28.438147	f	\N	\N	\N
1	2020	SS	2020-07-24 13:12:32.284437	2022-08-05 14:47:48.138314	f	\N	\N	\N
4	2022	WS	2022-08-05 14:47:26.131037	2022-08-05 14:47:48.158214	t	\N	\N	\N
\.


--
-- TOC entry 4274 (class 0 OID 26526)
-- Dependencies: 296
-- Data for Name: thredded_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_categories (id, messageboard_id, name, description, created_at, updated_at, slug) FROM stdin;
\.


--
-- TOC entry 4276 (class 0 OID 26532)
-- Dependencies: 298
-- Data for Name: thredded_messageboard_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_groups (id, name, "position", created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4278 (class 0 OID 26538)
-- Dependencies: 300
-- Data for Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_notifications_for_followed_topics (id, user_id, messageboard_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4280 (class 0 OID 26543)
-- Dependencies: 302
-- Data for Name: thredded_messageboard_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_users (id, thredded_user_detail_id, thredded_messageboard_id, last_seen_at) FROM stdin;
1	1	1	2020-07-24 15:13:57.225997
\.


--
-- TOC entry 4282 (class 0 OID 26547)
-- Dependencies: 304
-- Data for Name: thredded_messageboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboards (id, name, slug, description, topics_count, posts_count, "position", last_topic_id, messageboard_group_id, created_at, updated_at, locked) FROM stdin;
2	(L) Algebra 1, WS 2019/20 [DozentIn]	v-algebra-1-ws-2019-20-dozentin	\N	0	0	1595609557	\N	\N	2020-07-24 16:52:37.056125	2022-08-05 14:06:23.816032	f
1	(V) Lineare Algebra 2, WS 2022/23 [DozentIn]	v-lineare-algebra-2-ss-2020-dozentin	\N	2	2	1595597956	2	\N	2020-07-24 13:39:16.058555	2022-09-20 10:08:41.655836	f
\.


--
-- TOC entry 4284 (class 0 OID 26556)
-- Dependencies: 306
-- Data for Name: thredded_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_followed_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4286 (class 0 OID 26561)
-- Dependencies: 308
-- Data for Name: thredded_notifications_for_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_private_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4288 (class 0 OID 26566)
-- Dependencies: 310
-- Data for Name: thredded_post_moderation_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_post_moderation_records (id, post_id, messageboard_id, post_content, post_user_id, post_user_name, moderator_id, moderation_state, previous_moderation_state, created_at) FROM stdin;
\.


--
-- TOC entry 4290 (class 0 OID 26572)
-- Dependencies: 312
-- Data for Name: thredded_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_posts (id, user_id, content, source, postable_id, messageboard_id, moderation_state, created_at, updated_at) FROM stdin;
1	2	Klappt das?	web	1	1	0	2020-07-24 15:13:56.535875	2020-07-24 15:13:56.535875
2	\N	ssssss	web	2	1	0	2020-09-03 11:09:21.527677	2020-09-03 11:09:21.527677
\.


--
-- TOC entry 4292 (class 0 OID 26579)
-- Dependencies: 314
-- Data for Name: thredded_private_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_posts (id, user_id, content, postable_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4294 (class 0 OID 26585)
-- Dependencies: 316
-- Data for Name: thredded_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_topics (id, user_id, last_user_id, title, slug, posts_count, hash_id, last_post_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4296 (class 0 OID 26592)
-- Dependencies: 318
-- Data for Name: thredded_private_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_users (id, private_topic_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4298 (class 0 OID 26596)
-- Dependencies: 320
-- Data for Name: thredded_topic_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topic_categories (id, topic_id, category_id) FROM stdin;
\.


--
-- TOC entry 4300 (class 0 OID 26600)
-- Dependencies: 322
-- Data for Name: thredded_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topics (id, user_id, last_user_id, title, slug, messageboard_id, posts_count, sticky, locked, hash_id, moderation_state, last_post_at, created_at, updated_at) FROM stdin;
1	2	2	Testpost in der Docker-Umgebung	testpost-in-der-docker-umgebung	1	1	f	f	755be586701a955a9678	0	2020-07-24 15:13:56.535875	2020-07-24 15:13:56.506852	2020-07-24 15:13:56.632465
2	\N	\N	neuer Testpost	neuer-testpost	1	1	f	f	f62fa65b5e6217e961af	0	2020-09-03 11:09:21.527677	2020-09-03 11:09:21.498003	2020-09-03 11:09:21.629468
\.


--
-- TOC entry 4302 (class 0 OID 26609)
-- Dependencies: 324
-- Data for Name: thredded_user_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_details (id, user_id, latest_activity_at, posts_count, topics_count, last_seen_at, moderation_state, moderation_state_changed_at, created_at, updated_at) FROM stdin;
1	2	\N	1	1	2020-07-24 15:13:57.225997	0	\N	2020-07-24 15:13:41.254846	2020-07-24 15:13:57.240353
\.


--
-- TOC entry 4304 (class 0 OID 26616)
-- Dependencies: 326
-- Data for Name: thredded_user_messageboard_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_messageboard_preferences (id, user_id, messageboard_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4306 (class 0 OID 26622)
-- Dependencies: 328
-- Data for Name: thredded_user_post_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_post_notifications (id, user_id, post_id, notified_at) FROM stdin;
\.


--
-- TOC entry 4308 (class 0 OID 26626)
-- Dependencies: 330
-- Data for Name: thredded_user_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_preferences (id, user_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4310 (class 0 OID 26632)
-- Dependencies: 332
-- Data for Name: thredded_user_private_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_private_topic_read_states (id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
\.


--
-- TOC entry 4312 (class 0 OID 26639)
-- Dependencies: 334
-- Data for Name: thredded_user_topic_follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_follows (id, user_id, topic_id, created_at, reason) FROM stdin;
1	2	1	2020-07-24 15:13:56.61965	1
\.


--
-- TOC entry 4314 (class 0 OID 26643)
-- Dependencies: 336
-- Data for Name: thredded_user_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_read_states (id, messageboard_id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
1	1	2	1	0	1	0	2020-07-24 15:13:56.535875
\.


--
-- TOC entry 4316 (class 0 OID 26650)
-- Dependencies: 338
-- Data for Name: tutor_tutorial_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutor_tutorial_joins (id, tutorial_id, tutor_id, created_at, updated_at) FROM stdin;
1	1	10	2020-11-28 16:42:53.098756	2020-11-28 16:42:53.098756
\.


--
-- TOC entry 4318 (class 0 OID 26654)
-- Dependencies: 340
-- Data for Name: tutorials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutorials (id, title, lecture_id, created_at, updated_at) FROM stdin;
1	Mo 14-16	1	2020-11-28 16:42:53.096527	2020-11-28 16:42:53.096527
\.


--
-- TOC entry 4320 (class 0 OID 26660)
-- Dependencies: 342
-- Data for Name: user_favorite_lecture_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_favorite_lecture_joins (id, user_id, lecture_id, created_at, updated_at) FROM stdin;
1	6	1	2020-11-28 16:27:31.845382	2020-11-28 16:27:31.845382
2	6	3	2020-11-28 16:27:33.145725	2020-11-28 16:27:33.145725
3	7	1	2020-11-28 16:28:45.249256	2020-11-28 16:28:45.249256
4	10	3	2020-11-28 16:35:07.472518	2020-11-28 16:35:07.472518
5	10	1	2020-11-28 16:35:08.723205	2020-11-28 16:35:08.723205
6	10	4	2020-11-28 16:35:09.38261	2020-11-28 16:35:09.38261
7	2	27	2022-08-05 13:23:40.285219	2022-08-05 13:23:40.285219
\.


--
-- TOC entry 4322 (class 0 OID 26664)
-- Dependencies: 344
-- Data for Name: user_submission_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_submission_joins (id, user_id, created_at, updated_at, submission_id) FROM stdin;
1	5	2020-11-28 16:47:39.51566	2020-11-28 16:47:39.51566	6e088ccc-9568-4dc6-8354-9b46c2c7d135
2	6	2020-11-28 16:48:16.019926	2020-11-28 16:48:16.019926	21e42f50-a50d-4ea6-9239-94ef2c0f238a
3	7	2020-11-28 16:48:36.099425	2020-11-28 16:48:36.099425	21e42f50-a50d-4ea6-9239-94ef2c0f238a
4	8	2020-11-28 16:48:56.735077	2020-11-28 16:48:56.735077	d6ce28ca-e8b4-4f3c-8ad4-61ef035c88aa
5	9	2020-11-28 16:49:20.7016	2020-11-28 16:49:20.7016	d6ce28ca-e8b4-4f3c-8ad4-61ef035c88aa
6	5	2020-11-28 16:55:33.798801	2020-11-28 16:55:33.798801	e5c5f104-94c2-4f6d-b3ee-ec84b26c81ed
7	5	2022-08-05 14:51:06.878709	2022-08-05 14:51:06.878709	d9d47c3a-f53b-4afc-adc2-61a6e050cb30
8	6	2022-08-05 14:52:06.694481	2022-08-05 14:52:06.694481	d9d47c3a-f53b-4afc-adc2-61a6e050cb30
\.


--
-- TOC entry 4324 (class 0 OID 26668)
-- Dependencies: 346
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, admin, subscription_type, consents, consented_at, name, homepage, no_notifications, locale, email_for_medium, email_for_announcement, email_for_teachable, email_for_news, current_lecture_id, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, unread_comments, study_participant, email_for_submission_upload, email_for_submission_removal, email_for_submission_join, email_for_submission_leave, email_for_correction_upload, email_for_submission_decision, name_in_tutorials, archived, locked_at, image_data) FROM stdin;
2	teacher@mampf.edu	$2a$11$MZd9ZvYAyvOFZ6U0DYgCre1qdtL5sTn8iDpub4j7AXk./u6DzNPVi	\N	\N	\N	2020-07-24 13:14:59.543985	2022-08-05 14:35:41.794115	f	1	t	2020-07-24 13:14:59.547776	DozentIn	\N	f	en	t	t	t	t	\N	quSs9sq1VAMQCbDgRyhU	2020-07-24 13:15:13.670023	2020-07-24 13:14:59.544082	\N	t	f	f	f	f	f	f	f		\N	\N	\N
7	student3@mampf.edu	$2a$11$TKVcUksEWf718eGXHbLe.uSU/ApCLpX6BK.bxIZWk9oe04NND.5fS	\N	\N	\N	2020-11-28 16:28:02.121432	2022-08-05 14:26:46.624773	f	1	t	2020-11-28 16:28:02.123082	student3	\N	f	en	t	t	t	f	\N	ZUzqyXACyQrBNVGGrWxm	2020-11-28 16:28:09.870025	2020-11-28 16:28:02.121486	\N	f	f	f	f	f	f	f	f	Berta Musterfrau	\N	\N	\N
10	tutor@mampf.edu	$2a$11$sEuDSITI0nnp.PajiHATves48jIoWCI5QWuRnbEN.Tnjf9wk9zY..	\N	\N	\N	2020-11-28 16:34:08.325163	2022-08-05 14:26:46.624773	f	1	t	2020-11-28 16:34:08.326859	tutor	\N	f	en	t	t	t	f	\N	dbg8mcD6CmtfAfgAfX4Q	2020-11-28 16:34:11.824042	2020-11-28 16:34:08.325214	\N	f	f	f	f	f	f	f	f	Benjamin Tutor	\N	\N	\N
1	admin@mampf.edu	$2a$11$2tfeqioIPbQDwJWCctfixu6NddQ2lanbWzfXr5yLpHKameFj/YA5e	\N	\N	\N	2020-07-24 13:07:48.807973	2022-09-20 10:34:52.574221	t	1	t	2020-07-24 13:07:48.811417	admin	\N	f	en	t	t	t	t	\N	UguwyiyL_B65bQkMZMQf	2020-07-24 13:07:56.770723	2020-07-24 13:07:48.808231	\N	f	f	f	f	f	f	f	f		\N	\N	\N
8	student4@mampf.edu	$2a$11$pkQgXR2b04uE7gqLMXFK8O8bk/io0VUs6BcaZDQfkAHURkylRJHUC	\N	\N	\N	2020-11-28 16:29:07.923841	2022-08-05 14:26:46.624773	f	1	t	2020-11-28 16:29:07.925959	student4	\N	f	en	t	t	t	f	\N	j5hzKj7ePDPVbKGJsyqx	2020-11-28 16:29:14.406097	2020-11-28 16:29:07.923915	\N	f	f	f	f	f	f	f	f	Berta Mustermann	\N	\N	\N
5	student1@mampf.edu	$2a$11$8xWSW0PTFhR2j18uAuXIw.NlueCM56TdhmzAwdc7d/PVDQeEkLYWe	\N	\N	\N	2020-11-28 16:25:23.437946	2022-09-20 10:35:08.959339	f	1	t	2020-11-28 16:25:23.440059	student1	\N	f	en	f	f	f	t	\N	qwPPGpBwzjn7o_NE1cMd	2020-11-28 16:25:28.248539	2020-11-28 16:25:23.438158	\N	f	f	t	t	t	t	t	t	Max Mustermann	\N	\N	\N
9	student5@mampf.edu	$2a$11$OyfzzvQ7qZ35XmcFmQ0DVe2stv/tqaRpGSiMTqELgd/csxFH5bZ12	\N	\N	\N	2020-11-28 16:30:12.956799	2022-08-05 14:26:46.624773	f	1	t	2020-11-28 16:30:12.958778	student5	\N	f	en	f	f	f	t	\N	eWAAGQqtUt9P31_dpHey	2020-11-28 16:30:18.870235	2020-11-28 16:30:12.956859	\N	f	f	t	t	t	t	t	t	Erika Musterfrau	\N	\N	\N
6	student2@mampf.edu	$2a$11$mtK0n1D2vgpu8NpKAMUyReVxieYRc.xML3qatLdlBZTSIGJ.v6hs2	\N	\N	\N	2020-11-28 16:26:55.50289	2022-08-05 14:26:46.624773	f	1	t	2020-11-28 16:26:55.504637	student2	\N	f	en	t	t	t	f	\N	4DVzmJnsA4PJx9StS_Js	2020-11-28 16:27:07.826099	2020-11-28 16:26:55.502947	\N	f	f	f	f	f	f	f	f	Max Musterfrau	\N	\N	\N
13	ed@mampf.edu	$2a$11$4gip9VRW95exL5JfL0Laiu2U/nYcXyA3SAKENym3Nr/Q7IfNypGUi	\N	\N	\N	2022-08-05 13:14:08.705536	2022-08-05 14:26:46.624773	f	1	t	2022-08-05 13:14:08.706967	ed	\N	f	en	f	f	f	f	\N	NhEfb358TxX5788uqSZy	2022-08-05 13:14:16.480332	2022-08-05 13:14:08.705583	\N	f	f	f	f	f	f	f	f		\N	\N	\N
12	moded@mampf.edu	$2a$11$AmI4u1dqQIw0mkPYJmS.U.axomFgcJxP65rw3BH0tl/08GgScOQvq	\N	\N	\N	2022-08-05 13:13:27.138526	2022-08-05 14:26:46.624773	f	1	t	2022-08-05 13:13:27.140572	moded	\N	f	en	f	f	f	f	\N	GEw-LMkj1zw73bsu-Jy5	2022-08-05 13:13:35.913881	2022-08-05 13:13:27.138906	\N	f	f	f	f	f	f	f	f		\N	\N	\N
\.


--
-- TOC entry 4326 (class 0 OID 26679)
-- Dependencies: 348
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
1	Commontator::Comment	3	User	6	t	\N	1	2022-08-05 13:39:47.797346	2022-08-05 13:39:47.797346
\.


--
-- TOC entry 4328 (class 0 OID 26685)
-- Dependencies: 350
-- Data for Name: vtt_containers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vtt_containers (id, table_of_contents_data, references_data, created_at, updated_at) FROM stdin;
1	{"id":"vttcontainer/1/table_of_contents/42ffaad2361e4159f627c1d0e879444b.vtt","storage":"store","metadata":{"filename":"toc-20200724-1-bkckds.vtt","size":8,"mime_type":null}}	{"id":"vttcontainer/1/references/e97c0f1ee902df6a7d4e5d3357ceccba.vtt","storage":"store","metadata":{"filename":"ref-20200724-1-tdylp.vtt","size":8,"mime_type":null}}	2020-07-24 14:07:44.863383	2020-07-24 14:07:44.913329
2	{"id":"vttcontainer/2/table_of_contents/a1f3a1c8c8bb370fa8d14ce95ff9af42.vtt","storage":"store","metadata":{"filename":"toc-20200811-1-18bq97l.vtt","size":73,"mime_type":null}}	{"id":"vttcontainer/2/references/ae02090dfa1d07cfa99be64ec528adc2.vtt","storage":"store","metadata":{"filename":"ref-20200811-1-1dji0f7.vtt","size":362,"mime_type":null}}	2020-08-11 15:14:40.30688	2020-08-11 15:14:40.371299
11	{"id":"vttcontainer/11/table_of_contents/dbde217228031b857bccbf42265bfecd.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-5u7ge9.vtt","size":106,"mime_type":null}}	{"id":"vttcontainer/11/references/9e382c3ed47ec36cef02913ae479a7d2.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-7saad.vtt","size":245,"mime_type":null}}	2022-08-05 14:55:53.984068	2022-08-05 14:55:53.999715
3	{"id":"vttcontainer/3/table_of_contents/af8b96d8325eda3a87eb2e0b39b8d3ed.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-d1v069.vtt","size":301,"mime_type":null}}	{"id":"vttcontainer/3/references/d9045907fb40df219f4371691c0ff60d.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-4dtxti.vtt","size":245,"mime_type":null}}	2022-08-05 14:54:57.492227	2022-08-05 14:54:57.543108
8	{"id":"vttcontainer/8/table_of_contents/67f7320f70e4514897c9595cb112718c.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-1e519n.vtt","size":73,"mime_type":null}}	{"id":"vttcontainer/8/references/27fff8b216ee79d4de1f645993c97db7.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-ur74q0.vtt","size":365,"mime_type":null}}	2022-08-05 14:55:34.919302	2022-08-05 14:55:34.949832
4	{"id":"vttcontainer/4/table_of_contents/e894fe4bd4e75850786de5993908e337.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-lpq3ao.vtt","size":142,"mime_type":null}}	{"id":"vttcontainer/4/references/67c44f83f160feb9e15f4d813a1764ed.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-q4s2o3.vtt","size":128,"mime_type":null}}	2022-08-05 14:55:19.641663	2022-08-05 14:55:19.681711
5	{"id":"vttcontainer/5/table_of_contents/33c09cc4e3a30ab9e84148d2168afe6b.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-tvnqby.vtt","size":247,"mime_type":null}}	{"id":"vttcontainer/5/references/49f3f7eb326b83f75023ccab2c98f4e0.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-24bk4x.vtt","size":210,"mime_type":null}}	2022-08-05 14:55:28.137433	2022-08-05 14:55:28.155485
6	{"id":"vttcontainer/6/table_of_contents/5a13ea20c921de61f9c6104692613417.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-76xphy.vtt","size":151,"mime_type":null}}	{"id":"vttcontainer/6/references/71233b5b752be87d94becb1b723de6be.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-selmts.vtt","size":245,"mime_type":null}}	2022-08-05 14:55:29.199245	2022-08-05 14:55:29.228729
9	{"id":"vttcontainer/9/table_of_contents/cffcc7f35486d1d4d3fee876c43f831d.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-ok380p.vtt","size":134,"mime_type":null}}	{"id":"vttcontainer/9/references/12e61b4ceb76071d7c789b04a37f2f58.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-kw4xjo.vtt","size":245,"mime_type":null}}	2022-08-05 14:55:36.498291	2022-08-05 14:55:36.514935
7	{"id":"vttcontainer/7/table_of_contents/3d125d0825310bc253b5b78f8e4fb150.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-jt61j1.vtt","size":75,"mime_type":null}}	{"id":"vttcontainer/7/references/045ae89470ba7aea2e07db687be287dd.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-u24ufy.vtt","size":245,"mime_type":null}}	2022-08-05 14:55:33.713634	2022-08-05 14:55:33.730846
15	{"id":"vttcontainer/15/table_of_contents/1277386768f2c92c156b02573145a615.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-rndkc3.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/15/references/916423f444125609bbc028488aef00f2.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-ustzzy.vtt","size":493,"mime_type":null}}	2022-08-27 07:50:59.680951	2022-08-27 07:50:59.697755
10	{"id":"vttcontainer/10/table_of_contents/215e211ea1ad62a6bbfdb6b84d31749e.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-54jd52.vtt","size":75,"mime_type":null}}	{"id":"vttcontainer/10/references/f664b2b27fc8e05fb9e0b0ad2a296c9d.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-u9szmy.vtt","size":245,"mime_type":null}}	2022-08-05 14:55:38.320516	2022-08-05 14:55:38.330895
14	{"id":"vttcontainer/14/table_of_contents/907bc4379210c9d94229ef1adba4834d.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-m7gsue.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/14/references/575481a69efc0540b5c9f0fd412450f2.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-k5irda.vtt","size":493,"mime_type":null}}	2022-08-27 07:50:14.699979	2022-08-27 07:50:14.709891
12	{"id":"vttcontainer/12/table_of_contents/327459866ca7f4ff50aa78a6314ac7e2.vtt","storage":"store","metadata":{"filename":"toc-20220805-1-b55eh6.vtt","size":90,"mime_type":null}}	{"id":"vttcontainer/12/references/af573433419a3e33c5b37530b1d5757b.vtt","storage":"store","metadata":{"filename":"ref-20220805-1-t4secu.vtt","size":8,"mime_type":null}}	2022-08-05 14:55:54.920295	2022-08-05 14:55:54.932265
13	{"id":"vttcontainer/13/table_of_contents/0e41005264679505666b42df64d81613.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-w9ughy.vtt","size":301,"mime_type":null}}	{"id":"vttcontainer/13/references/030710181fd0a1ecf42720f0367b04cb.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-xfgjnm.vtt","size":245,"mime_type":null}}	2022-08-27 07:49:52.197696	2022-08-27 07:49:52.23154
16	{"id":"vttcontainer/16/table_of_contents/f7858cc07879e8945790e3eb797f594a.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-4n0bo5.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/16/references/9f0cfb7bb614b0fba317c961dbc83683.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-m16ife.vtt","size":493,"mime_type":null}}	2022-08-27 07:51:25.728004	2022-08-27 07:51:25.74587
17	{"id":"vttcontainer/17/table_of_contents/89084fe8df01a27611cb2f1f9133f9d8.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-y8kf8p.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/17/references/c9b578fc1a62c5daba8839ca1a84e336.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-vr330z.vtt","size":493,"mime_type":null}}	2022-08-27 07:52:39.629128	2022-08-27 07:52:39.645505
18	{"id":"vttcontainer/18/table_of_contents/e3533e66a59d7f147f3bc4d539439b98.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-pa6ia8.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/18/references/cce30a64276be4603a9ec852e2c8db99.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-vyetyl.vtt","size":493,"mime_type":null}}	2022-08-27 07:52:59.626576	2022-08-27 07:52:59.644309
31	{"id":"vttcontainer/31/table_of_contents/a5f7296a404e03d9db4095dee4c1381d.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-e5lxn3.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/31/references/79c59c4cd12fa72ce6322a249b30f416.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-5wva5o.vtt","size":493,"mime_type":null}}	2022-08-29 09:53:19.220848	2022-08-29 09:53:19.238845
19	{"id":"vttcontainer/19/table_of_contents/361ec26b34c712585d8eed9d04cceb7e.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-l7pekz.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/19/references/ac2a6736df94530550a3cb85358deb00.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-fapqjj.vtt","size":493,"mime_type":null}}	2022-08-27 07:53:08.555343	2022-08-27 07:53:08.572589
25	{"id":"vttcontainer/25/table_of_contents/1ff243d444150b8f6abcc6b10aa7aaa8.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-hxgra5.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/25/references/1c77d8313b85062339d8db6cd2f18189.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-wx35h5.vtt","size":493,"mime_type":null}}	2022-08-27 08:00:41.335366	2022-08-27 08:00:41.353926
20	{"id":"vttcontainer/20/table_of_contents/792899f297496b5ceb42427fe279a031.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-vvx9xg.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/20/references/3e1460c150c8623445b3ba58574500be.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-76xxby.vtt","size":493,"mime_type":null}}	2022-08-27 07:53:18.940259	2022-08-27 07:53:18.949911
21	{"id":"vttcontainer/21/table_of_contents/f98f255772dd62be748dcd44aac4ea8e.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-m78ov1.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/21/references/b007d4cb9d04e7fd3f0c2075a9e89217.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-rvq9a7.vtt","size":493,"mime_type":null}}	2022-08-27 07:53:26.003804	2022-08-27 07:53:26.033827
29	{"id":"vttcontainer/29/table_of_contents/36784ddcb7ed0fc4ae4c05500901d292.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-rov2rx.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/29/references/3fffd0b047c0dcb1daaf44f304e8ea4b.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-bdm00r.vtt","size":493,"mime_type":null}}	2022-08-29 09:50:49.055034	2022-08-29 09:50:49.07148
22	{"id":"vttcontainer/22/table_of_contents/45d067d91ca3ef541c65e8323756d9f3.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-677j5g.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/22/references/87a53c96990a376402f6cbd2fa4dc47b.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-ymy7r.vtt","size":493,"mime_type":null}}	2022-08-27 07:59:08.001088	2022-08-27 07:59:08.050423
26	{"id":"vttcontainer/26/table_of_contents/02ff99b84bedc177d1d2ce81bff82b10.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-iaku6q.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/26/references/c04e23192bf94b4787628a7fe680a96c.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-jo83m8.vtt","size":493,"mime_type":null}}	2022-08-29 09:49:44.721552	2022-08-29 09:49:44.758946
23	{"id":"vttcontainer/23/table_of_contents/93e99d8ca569f922c9a0094fc071e17a.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-4m3iii.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/23/references/7aefa4e2b3f52ceff8364f9b55b94ed4.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-2k0ovj.vtt","size":493,"mime_type":null}}	2022-08-27 07:59:40.503501	2022-08-27 07:59:40.519133
24	{"id":"vttcontainer/24/table_of_contents/9d8f91bf39ce3fa6b4785a4f024bb2fd.vtt","storage":"store","metadata":{"filename":"toc-20220827-1-ybhuyh.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/24/references/f1e05b471f7ac5bf89018e0635df133c.vtt","storage":"store","metadata":{"filename":"ref-20220827-1-q1wiw.vtt","size":493,"mime_type":null}}	2022-08-27 08:00:15.663003	2022-08-27 08:00:15.683453
27	{"id":"vttcontainer/27/table_of_contents/338fbdd0eceaf3ac44ede439c1b10092.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-nwyw7v.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/27/references/881f8449117b91276c422d6623fda477.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-jeol32.vtt","size":493,"mime_type":null}}	2022-08-29 09:50:00.252734	2022-08-29 09:50:00.290227
28	{"id":"vttcontainer/28/table_of_contents/5933f2fd61cdbb00a9c4221ed7eef0e9.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-13eoe3.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/28/references/e4ac6a0384190d5751761cfa62d3d6f3.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-v7on2x.vtt","size":493,"mime_type":null}}	2022-08-29 09:50:23.166189	2022-08-29 09:50:23.196372
30	{"id":"vttcontainer/30/table_of_contents/ba6dfb6be28826c73b0c8c2b4a3c4039.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-j0k08o.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/30/references/b890d23a14c42ec2539ebf35cf87a8f1.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-yhmk47.vtt","size":493,"mime_type":null}}	2022-08-29 09:51:02.178989	2022-08-29 09:51:02.206633
33	{"id":"vttcontainer/33/table_of_contents/e77be0235865552c54accb48655b172f.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-tew366.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/33/references/bbc48e1c85d106c17953a73d5424b293.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-84wfbf.vtt","size":493,"mime_type":null}}	2022-08-29 09:53:48.848128	2022-08-29 09:53:48.88131
32	{"id":"vttcontainer/32/table_of_contents/12ed1c650e1b0791d00f197b789d8c87.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-2s967r.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/32/references/9cf84565c41edc5ef870b7c83a79b765.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-m815h5.vtt","size":493,"mime_type":null}}	2022-08-29 09:53:42.246324	2022-08-29 09:53:42.263749
34	{"id":"vttcontainer/34/table_of_contents/eaddc1f3f159511953855d22ecad3efc.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-8s04pn.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/34/references/549210bc8ea5be1c097666dac8c1f9df.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-y6pkrx.vtt","size":493,"mime_type":null}}	2022-08-29 09:54:38.450352	2022-08-29 09:54:38.517754
35	{"id":"vttcontainer/35/table_of_contents/4b1b27eb5be2d64496fbe22f8a71640f.vtt","storage":"store","metadata":{"filename":"toc-20220829-1-wqqoyk.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/35/references/fa7050de78d4d1a74273808b912b24a9.vtt","storage":"store","metadata":{"filename":"ref-20220829-1-gw2xcm.vtt","size":493,"mime_type":null}}	2022-08-29 09:54:49.904607	2022-08-29 09:54:49.921524
36	{"id":"vttcontainer/36/table_of_contents/fda467dc1217da52fd35c7b6917c56c1.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-72y93v.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/36/references/8f2921eaacd00f4e334b69947d437552.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-t51ja8.vtt","size":493,"mime_type":null}}	2022-09-20 11:34:30.08911	2022-09-20 11:34:30.100394
49	{"id":"vttcontainer/49/table_of_contents/abe004aa9ace6ec5b3bc1571322a3100.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-ueh7o8.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/49/references/3b601b7b8e6b9ec357d44c195ec5fbc8.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-daz1q5.vtt","size":493,"mime_type":null}}	2022-09-20 11:39:30.596858	2022-09-20 11:39:30.612966
37	{"id":"vttcontainer/37/table_of_contents/6da24e6d3dab53fbe2670af7ae5f61bb.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-nusigm.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/37/references/cb07c484c0a00d8ff3594e333b670adb.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-pd9zn5.vtt","size":493,"mime_type":null}}	2022-09-20 11:34:40.718073	2022-09-20 11:34:40.729693
43	{"id":"vttcontainer/43/table_of_contents/dc424e52f624c82e7c01ca5c9508f7f0.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-cix9ys.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/43/references/a18a719480fe12c774db4103ba7e2fcf.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-wygqmi.vtt","size":493,"mime_type":null}}	2022-09-20 11:37:12.360993	2022-09-20 11:37:12.376226
38	{"id":"vttcontainer/38/table_of_contents/3eff59a272de7042cfe577845cb17554.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-p7ghf9.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/38/references/1d46a607d403e6776cde3e1144801e52.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-umee35.vtt","size":493,"mime_type":null}}	2022-09-20 11:34:52.341565	2022-09-20 11:34:52.361352
39	{"id":"vttcontainer/39/table_of_contents/ec00a28ad8f9be50ac9611c94237cb20.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-6b1dg.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/39/references/68692914f0fa3bb4ac5add70faf7ace4.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-fuxm88.vtt","size":493,"mime_type":null}}	2022-09-20 11:35:30.191923	2022-09-20 11:35:30.205575
47	{"id":"vttcontainer/47/table_of_contents/d58b0c97d7dfd147660416c434b9f4a8.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-q8yq9c.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/47/references/7bd90bffda88b36b668952728cc86296.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-zcsh8o.vtt","size":493,"mime_type":null}}	2022-09-20 11:39:13.307559	2022-09-20 11:39:13.321486
40	{"id":"vttcontainer/40/table_of_contents/58a5a207ca10f3e3c9dbe46700484825.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-xj9irv.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/40/references/545085b9e494cb650274fc47a5f3cbec.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-prfm17.vtt","size":493,"mime_type":null}}	2022-09-20 11:35:38.906028	2022-09-20 11:35:38.920679
44	{"id":"vttcontainer/44/table_of_contents/44a6c58b55ac27f1227a0760c5aa5b30.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-aqpdk8.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/44/references/8fffd00bcb2d618726ec8f59aa2abb63.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-tv9yy4.vtt","size":493,"mime_type":null}}	2022-09-20 11:37:40.851584	2022-09-20 11:37:40.866255
41	{"id":"vttcontainer/41/table_of_contents/524234016866b4299732d2bafba9db91.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-govnov.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/41/references/9e95c726565344abd74271d1b309b801.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-z1sce.vtt","size":493,"mime_type":null}}	2022-09-20 11:35:47.068254	2022-09-20 11:35:47.081547
42	{"id":"vttcontainer/42/table_of_contents/cf59db60fdcbc779108bcc00d069ead7.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-pydgmo.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/42/references/1afed132547cfd16993bdcd1eaca8902.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-vfgze0.vtt","size":493,"mime_type":null}}	2022-09-20 11:36:36.144769	2022-09-20 11:36:36.157076
45	{"id":"vttcontainer/45/table_of_contents/7c793e3c31fd0ecfcf2e961001f4bd08.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-lfpn3g.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/45/references/69e2e91243748ce1ae0c23ddf1b9dfca.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-mbmb7r.vtt","size":493,"mime_type":null}}	2022-09-20 11:38:02.451872	2022-09-20 11:38:02.465201
46	{"id":"vttcontainer/46/table_of_contents/5623ffac5964bc31154d0c93c4ac1920.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-596scc.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/46/references/f1d21eed036a0d344db1a7975cada8d0.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-j7cxxt.vtt","size":493,"mime_type":null}}	2022-09-20 11:38:57.535397	2022-09-20 11:38:57.549881
48	{"id":"vttcontainer/48/table_of_contents/ac8f9d095a9f3aac80f9a0a37079361d.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-abo0eu.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/48/references/e26576c544eb91699cc3e67544cbf191.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-fjkjky.vtt","size":493,"mime_type":null}}	2022-09-20 11:39:23.352452	2022-09-20 11:39:23.400713
51	{"id":"vttcontainer/51/table_of_contents/c1f1c1fd9c74c4c003a829fcbfb2d103.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-gkyol3.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/51/references/4d29118d2c90d91b7ebe9c09e6f9950e.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-qii2xi.vtt","size":493,"mime_type":null}}	2022-09-20 11:41:33.024011	2022-09-20 11:41:33.037518
50	{"id":"vttcontainer/50/table_of_contents/a3c4d30d3ff861d8b130f2c8645a96de.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-cu7h4v.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/50/references/9f5d962a3b9d3d6560f9b7686a588ef9.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-xctg4m.vtt","size":493,"mime_type":null}}	2022-09-20 11:39:38.075145	2022-09-20 11:39:38.089565
52	{"id":"vttcontainer/52/table_of_contents/8676b7fbda21c26bd2178c02b5cf4773.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-whhyl5.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/52/references/9064bdde1a34d18d0a9b09009a4c8f48.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-6wvgat.vtt","size":493,"mime_type":null}}	2022-09-20 11:42:17.588621	2022-09-20 11:42:17.606054
53	{"id":"vttcontainer/53/table_of_contents/939bfe30f96ee1ea920cf47204db875e.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-ly855n.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/53/references/fabc026eb6ccc70bf0cce4b0ee29d34d.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-mv398w.vtt","size":493,"mime_type":null}}	2022-09-20 11:42:47.322145	2022-09-20 11:42:47.337144
54	{"id":"vttcontainer/54/table_of_contents/87168f3d4f4bd3970c7768b76ba7102f.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-qetcwi.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/54/references/cbee3e0ab92238fe60611373b0bcfe73.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-vwbso6.vtt","size":493,"mime_type":null}}	2022-09-20 11:42:52.968328	2022-09-20 11:42:52.981814
67	{"id":"vttcontainer/67/table_of_contents/698d84470c3e63dc92fb88a2abab7b8a.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-vpgvd3.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/67/references/94003c608eab15547b890cc2cfffa52a.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-ysds63.vtt","size":493,"mime_type":null}}	2022-09-20 12:01:33.091514	2022-09-20 12:01:33.105454
55	{"id":"vttcontainer/55/table_of_contents/6587f96ad5b237643023ea4fa71d94e5.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-mwxyze.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/55/references/525a7baa2f97e047a60bd19e12082eb0.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-1bvd9j.vtt","size":493,"mime_type":null}}	2022-09-20 11:56:19.619571	2022-09-20 11:56:19.635024
61	{"id":"vttcontainer/61/table_of_contents/78a90164a89aeaf2793404541e01b7b5.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-9jot8b.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/61/references/aa3cde7f6c0f1ff54aaa526d5226a6a5.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-wkqc11.vtt","size":493,"mime_type":null}}	2022-09-20 12:00:01.262441	2022-09-20 12:00:01.276511
56	{"id":"vttcontainer/56/table_of_contents/a2c5ac333df45dddf42795d1e969b8ba.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-vtrd7f.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/56/references/08a17539581ab14c61128a327545bece.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-chsebb.vtt","size":493,"mime_type":null}}	2022-09-20 11:56:53.981894	2022-09-20 11:56:53.993597
57	{"id":"vttcontainer/57/table_of_contents/9619886dd2ec7a55f5c76913217c657e.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-54sxdw.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/57/references/9120279776e705e0149f58abc582f449.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-dk2of4.vtt","size":493,"mime_type":null}}	2022-09-20 11:58:35.916629	2022-09-20 11:58:35.930835
65	{"id":"vttcontainer/65/table_of_contents/a1ad10b78418e10a27b239f3785bd957.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-mxi9ys.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/65/references/68a91d9b212400d7bb44db44a1f390d1.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-xo7gzr.vtt","size":493,"mime_type":null}}	2022-09-20 12:01:16.350376	2022-09-20 12:01:16.363997
58	{"id":"vttcontainer/58/table_of_contents/ae63b855db63f3c355982122c5e28479.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-ztfcjq.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/58/references/434fb4e553c1d5ed62a039c6ca9f6f4f.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-76z2m3.vtt","size":493,"mime_type":null}}	2022-09-20 11:59:01.510312	2022-09-20 11:59:01.524089
62	{"id":"vttcontainer/62/table_of_contents/86c68ea0435e6b8ee90ed1f00e407b29.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-67aq58.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/62/references/e5679def8b1d2b5634405a456dcc4161.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-52t26q.vtt","size":493,"mime_type":null}}	2022-09-20 12:00:25.856889	2022-09-20 12:00:25.868845
59	{"id":"vttcontainer/59/table_of_contents/8a64d93089ea0247aeaffa5867de4e51.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-ppfv1z.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/59/references/d090b92238b4160dd863119e4ab54f11.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-y9tq1w.vtt","size":493,"mime_type":null}}	2022-09-20 11:59:49.220059	2022-09-20 11:59:49.23527
60	{"id":"vttcontainer/60/table_of_contents/ff7802af7734c347ffa400b86cff0df2.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-43xfv9.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/60/references/85d20b29841871e25044ab29874e617d.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-lc7dfx.vtt","size":493,"mime_type":null}}	2022-09-20 11:59:54.520082	2022-09-20 11:59:54.543352
63	{"id":"vttcontainer/63/table_of_contents/5b0c7e3dba34d96e5a347fd424053069.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-x88k8b.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/63/references/c0bd2c3899ddc1252cbd27babcf07d61.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-5yv03i.vtt","size":493,"mime_type":null}}	2022-09-20 12:00:33.001157	2022-09-20 12:00:33.014204
64	{"id":"vttcontainer/64/table_of_contents/6c5a6d693dd2f914fe6990437fbe9ccd.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-odaepk.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/64/references/40186c7e1dc37e00db99869dbaa7af06.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-xvmc26.vtt","size":493,"mime_type":null}}	2022-09-20 12:00:45.942899	2022-09-20 12:00:45.957899
66	{"id":"vttcontainer/66/table_of_contents/6480412b8ef2c3e5834992e52310023b.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-qasfo2.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/66/references/afdf962e2d3127cfdacc35eedf9548db.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-5284qj.vtt","size":493,"mime_type":null}}	2022-09-20 12:01:19.881819	2022-09-20 12:01:19.897789
69	{"id":"vttcontainer/69/table_of_contents/cf717d27948e21ca371ec1bd79476cfc.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-8hd4n1.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/69/references/f79d33a11cc75626314c73b1da813f62.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-6l4rqh.vtt","size":493,"mime_type":null}}	2022-09-20 12:02:05.449959	2022-09-20 12:02:05.464972
68	{"id":"vttcontainer/68/table_of_contents/b5ddaf1e53c92f1d9e2c6e2620c326a2.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-3siyy5.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/68/references/bc50f6cc6cabff4a654bb12dbb1b2f61.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-ihymlh.vtt","size":493,"mime_type":null}}	2022-09-20 12:01:54.521536	2022-09-20 12:01:54.530757
70	{"id":"vttcontainer/70/table_of_contents/7451bac494fd7db00547ebb451ee6d14.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-sxbzlp.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/70/references/ab49ae8752e5118cfa28eea77b8fb566.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-396zvw.vtt","size":493,"mime_type":null}}	2022-09-20 12:02:51.345255	2022-09-20 12:02:51.35931
71	{"id":"vttcontainer/71/table_of_contents/c893ec9ddc9c5f868381fead880fb620.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-c2ep37.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/71/references/8d647c28bafb25945595edad327fe4ca.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-yfr1fn.vtt","size":493,"mime_type":null}}	2022-09-20 12:03:06.72127	2022-09-20 12:03:06.732656
72	{"id":"vttcontainer/72/table_of_contents/970e4a289c7a9d3fc03cba89cc877a0d.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-wdhade.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/72/references/d7c2cf18c0ae9858e9bc43d66cb74ead.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-lrn8cp.vtt","size":493,"mime_type":null}}	2022-09-20 12:03:30.891886	2022-09-20 12:03:30.903079
85	{"id":"vttcontainer/85/table_of_contents/61664836312cb9f8b365266a4b94b9da.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-q9bsxb.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/85/references/198aa2ef62405e68c02a6c34702c540f.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-6njwuj.vtt","size":493,"mime_type":null}}	2022-09-20 13:25:38.645362	2022-09-20 13:25:38.659033
73	{"id":"vttcontainer/73/table_of_contents/40caef716ea1ac3f806e1e124bcd69cd.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-87cy0o.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/73/references/64692151b1b4d83b1122347b32d57f9b.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-8lu460.vtt","size":493,"mime_type":null}}	2022-09-20 12:03:38.758987	2022-09-20 12:03:38.773314
79	{"id":"vttcontainer/79/table_of_contents/a774e28c65353d4c31b2d639cfb49dc6.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-vgflly.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/79/references/310c035fe2a776e97aa78f5106db10fa.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-398sfi.vtt","size":493,"mime_type":null}}	2022-09-20 12:06:06.300029	2022-09-20 12:06:06.313388
74	{"id":"vttcontainer/74/table_of_contents/9bb0abd898ca55bead92a901a105b419.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-l86j6f.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/74/references/9c3ab4c073c0473dc53271b1e5ef2a01.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-lw6wwy.vtt","size":493,"mime_type":null}}	2022-09-20 12:03:58.248592	2022-09-20 12:03:58.264073
75	{"id":"vttcontainer/75/table_of_contents/838ec92fa344c6189d57379b838b34ce.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-jr0jr5.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/75/references/724a60d0e9c2b24eaf25a7a26cec28b7.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-59ene9.vtt","size":493,"mime_type":null}}	2022-09-20 12:04:10.308445	2022-09-20 12:04:10.321961
83	{"id":"vttcontainer/83/table_of_contents/639a788bbe342a427f195545ea8b7a9c.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-qnfw98.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/83/references/30990d46439c6e01a3875b66eb61f7ec.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-bk0oa0.vtt","size":493,"mime_type":null}}	2022-09-20 13:24:20.991044	2022-09-20 13:24:21.007197
76	{"id":"vttcontainer/76/table_of_contents/5cb398df5abc3a80a7855555181356df.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-yoj6dn.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/76/references/8793f8568d643325224ec0077298f11a.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-6cjwm8.vtt","size":493,"mime_type":null}}	2022-09-20 12:04:56.963696	2022-09-20 12:04:56.99593
80	{"id":"vttcontainer/80/table_of_contents/90157b6dedf9ab61a2926edcfd2d5ab4.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-dh0bkc.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/80/references/7ea31cd055b21b1a4d74270426cd7a79.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-vdnnk8.vtt","size":493,"mime_type":null}}	2022-09-20 12:06:17.596957	2022-09-20 12:06:17.60871
77	{"id":"vttcontainer/77/table_of_contents/a34cd57a2e3db3014c70f111cda6a3b1.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-x6lm1i.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/77/references/003442382343ae91e6b7f3cb2f486a0d.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-p33zty.vtt","size":493,"mime_type":null}}	2022-09-20 12:05:08.970806	2022-09-20 12:05:08.983185
78	{"id":"vttcontainer/78/table_of_contents/8fabb8950044ff59c34839b5246cd1aa.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-4wu3in.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/78/references/a749f950b72dd0bddc9ebe7ceaf4d8e1.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-hp1a04.vtt","size":493,"mime_type":null}}	2022-09-20 12:05:43.856045	2022-09-20 12:05:43.868507
81	{"id":"vttcontainer/81/table_of_contents/38b6a582bc188526ddac49c601f2c7fa.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-ixuekm.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/81/references/f25f32e4809cb3a8268eb02acec1e0f9.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-7rit5m.vtt","size":493,"mime_type":null}}	2022-09-20 12:23:28.593327	2022-09-20 12:23:28.603835
82	{"id":"vttcontainer/82/table_of_contents/bb2f7224888ee8f4016b047ad443854d.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-xavss0.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/82/references/6a661a07b520a3b404635e4367aaa460.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-edlv0o.vtt","size":493,"mime_type":null}}	2022-09-20 12:23:33.634754	2022-09-20 12:23:33.646605
84	{"id":"vttcontainer/84/table_of_contents/2c8b3ba5277fb48747a1a1cb856ae471.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-qijxh.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/84/references/c5c9cb51e53ec05972747a198a73274d.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-phi9j1.vtt","size":493,"mime_type":null}}	2022-09-20 13:24:57.418482	2022-09-20 13:24:57.433171
87	{"id":"vttcontainer/87/table_of_contents/aaef6f05cca49181a0ea0a138f18bbb3.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-nf45uk.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/87/references/68c52e195784d13bf95c95fdefa74920.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-lrf9az.vtt","size":493,"mime_type":null}}	2022-09-20 13:26:07.758581	2022-09-20 13:26:07.772265
86	{"id":"vttcontainer/86/table_of_contents/28d44d8999913259ed58b52f1c55f31f.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-2cx0r0.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/86/references/d039bfacacdf13e9b6bb979afdd369ca.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-ek6o0t.vtt","size":493,"mime_type":null}}	2022-09-20 13:25:44.446548	2022-09-20 13:25:44.457602
88	{"id":"vttcontainer/88/table_of_contents/e85fa7cca9976d215f781f10fd67d139.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-dcytr1.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/88/references/7115049978d872cf83e17e99ccc29ae4.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-driykf.vtt","size":493,"mime_type":null}}	2022-09-20 13:26:51.524589	2022-09-20 13:26:51.53839
89	{"id":"vttcontainer/89/table_of_contents/adacabf1e8f08676011c285ff1f36e27.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-bys1cl.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/89/references/cacc3d20315a83617f97e01c0c1a8930.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-grq7yr.vtt","size":493,"mime_type":null}}	2022-09-20 13:27:11.893074	2022-09-20 13:27:11.906126
90	{"id":"vttcontainer/90/table_of_contents/84809a1c6fcd21996c511ef13bfd19df.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-gdqs9m.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/90/references/5c2371954d9b9f2af1d085142457110f.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-u5s4ew.vtt","size":493,"mime_type":null}}	2022-09-20 13:27:53.363185	2022-09-20 13:27:53.37573
103	{"id":"vttcontainer/103/table_of_contents/8516e0dc8a8ea11de8e21decad39e556.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-lkd66b.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/103/references/44a1253541ecbc73da80eda4abc22931.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-ysl29x.vtt","size":493,"mime_type":null}}	2022-09-20 13:32:07.470228	2022-09-20 13:32:07.484737
91	{"id":"vttcontainer/91/table_of_contents/4c137d7d22a2eeb362115601aa9c02ce.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-mfa3k1.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/91/references/e185880d9b7c04da206b0e15296cafae.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-oh1dhw.vtt","size":493,"mime_type":null}}	2022-09-20 13:28:30.065022	2022-09-20 13:28:30.078325
97	{"id":"vttcontainer/97/table_of_contents/7f9481d95c7ca02ad1b19b3b40fd88e7.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-1m6h4f.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/97/references/d0f2dd2bb50cfef55499e492cc817b33.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-s2fdqd.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:34.396925	2022-09-20 13:30:34.409507
92	{"id":"vttcontainer/92/table_of_contents/54f2279b2cb56bc17840cea135dc8fcd.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-76cy1j.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/92/references/bb949f3a8dfce2e73e12061b1147f8e1.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-9lo128.vtt","size":493,"mime_type":null}}	2022-09-20 13:28:36.4129	2022-09-20 13:28:36.426917
93	{"id":"vttcontainer/93/table_of_contents/7c23f596ec88f1ef66802dd1be412d24.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-eacp0d.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/93/references/b4362542d9155d051ccf5bc8c74ea7a1.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-4qxvrg.vtt","size":493,"mime_type":null}}	2022-09-20 13:28:53.047236	2022-09-20 13:28:53.059655
101	{"id":"vttcontainer/101/table_of_contents/0c99994c7a46a3ba758612a41ded36a2.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-p1a161.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/101/references/6ac0f036bd4493e7042a9064c3c811dd.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-s2e78n.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:56.991735	2022-09-20 13:30:57.004768
94	{"id":"vttcontainer/94/table_of_contents/5a64966b720bd4a0e2578356888a74ad.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-eb0tmx.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/94/references/dbc2a64dbc68f259e7333a5c67cf76ab.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-69gawa.vtt","size":493,"mime_type":null}}	2022-09-20 13:28:58.387068	2022-09-20 13:28:58.399172
98	{"id":"vttcontainer/98/table_of_contents/750c9dd9c12d5cd9cbf859f2ffdbf1ec.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-shtpdu.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/98/references/dcaefdee621ea55c6f907db130685977.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-hpn61.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:40.645824	2022-09-20 13:30:40.659037
95	{"id":"vttcontainer/95/table_of_contents/b2592dd66407ae22882fabff777be3cc.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-6mw2qx.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/95/references/3d2a911ac5fc2743044e1404620c9b6b.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-qj7jj8.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:15.950412	2022-09-20 13:30:15.962408
96	{"id":"vttcontainer/96/table_of_contents/72a4517d77c4353ea95911271c0c8244.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-zzu64j.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/96/references/36de554b67195e932ceba49d095d9dfe.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-lgoza9.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:26.334436	2022-09-20 13:30:26.348943
99	{"id":"vttcontainer/99/table_of_contents/b37e58056f4071ec28a4017857f285f3.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-5lp7mk.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/99/references/652ee7553bf515f3ee44d93ab791ccf3.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-xmspef.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:45.332057	2022-09-20 13:30:45.347547
100	{"id":"vttcontainer/100/table_of_contents/0e43402622e93dcd451d1d1ad98996e5.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-jjq7cx.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/100/references/aeb70041b2106aff50f0bd762029f726.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-h6mk9d.vtt","size":493,"mime_type":null}}	2022-09-20 13:30:50.182098	2022-09-20 13:30:50.192821
102	{"id":"vttcontainer/102/table_of_contents/3316043a0ccc2c03a811f5400531f1bb.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-1dpzdk.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/102/references/3e6bc0517380fc3f9848f74e961cd8fb.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-8izgle.vtt","size":493,"mime_type":null}}	2022-09-20 13:31:56.255542	2022-09-20 13:31:56.270393
105	{"id":"vttcontainer/105/table_of_contents/2352670cddade63c45b8ada540ef9b80.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-ud3s38.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/105/references/4b74009ea827a13387bfde826fe34233.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-keq1c5.vtt","size":493,"mime_type":null}}	2022-09-20 13:33:55.515955	2022-09-20 13:33:55.528913
104	{"id":"vttcontainer/104/table_of_contents/71d738fafc97f897bfa7c34fc8e855c1.vtt","storage":"store","metadata":{"filename":"toc-20220920-1-nb141a.vtt","size":172,"mime_type":null}}	{"id":"vttcontainer/104/references/5f057249479e21e8386ee56bf8102fe3.vtt","storage":"store","metadata":{"filename":"ref-20220920-1-antf99.vtt","size":493,"mime_type":null}}	2022-09-20 13:33:03.371551	2022-09-20 13:33:03.38635
\.


--
-- TOC entry 4337 (class 0 OID 27282)
-- Dependencies: 359
-- Data for Name: watchlist_entries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.watchlist_entries (id, watchlist_id, medium_id, medium_position, created_at, updated_at) FROM stdin;
1	3	39	0	2022-08-05 13:52:07.795377	2022-08-05 13:52:07.795377
2	3	11	1	2022-08-05 13:52:15.489454	2022-08-05 13:52:15.489454
3	4	39	0	2022-08-05 13:53:14.826467	2022-08-05 13:53:14.826467
\.


--
-- TOC entry 4335 (class 0 OID 27275)
-- Dependencies: 357
-- Data for Name: watchlists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.watchlists (id, user_id, watchlist_entry_id, created_at, updated_at, name, public, description) FROM stdin;
3	5	\N	2022-08-05 13:51:36.010128	2022-08-05 13:51:52.069354	My public watchlist	t	Here's my public watchlist
4	5	\N	2022-08-05 13:52:49.485056	2022-08-05 13:52:49.485056	My private watchlist	f	Here's my private watchlist.
\.


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 211
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcements_id_seq', 4, true);


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 213
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.answers_id_seq', 39, true);


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 216
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assignments_id_seq', 3, true);


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 218
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chapters_id_seq', 10, true);


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 220
-- Name: clicker_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clicker_votes_id_seq', 1, false);


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 222
-- Name: clickers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clickers_id_seq', 1, false);


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 224
-- Name: commontator_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_comments_id_seq', 5, true);


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 226
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_subscriptions_id_seq', 1, false);


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 228
-- Name: commontator_threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_threads_id_seq', 51, true);


--
-- TOC entry 4429 (class 0 OID 0)
-- Dependencies: 230
-- Name: course_self_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_self_joins_id_seq', 1, false);


--
-- TOC entry 4430 (class 0 OID 0)
-- Dependencies: 232
-- Name: course_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_tag_joins_id_seq', 45, true);


--
-- TOC entry 4431 (class 0 OID 0)
-- Dependencies: 234
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 8, true);


--
-- TOC entry 4432 (class 0 OID 0)
-- Dependencies: 236
-- Name: division_course_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.division_course_joins_id_seq', 8, true);


--
-- TOC entry 4433 (class 0 OID 0)
-- Dependencies: 238
-- Name: division_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.division_translations_id_seq', 8, true);


--
-- TOC entry 4434 (class 0 OID 0)
-- Dependencies: 240
-- Name: divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.divisions_id_seq', 4, true);


--
-- TOC entry 4435 (class 0 OID 0)
-- Dependencies: 242
-- Name: editable_user_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.editable_user_joins_id_seq', 184, true);


--
-- TOC entry 4436 (class 0 OID 0)
-- Dependencies: 244
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 2, true);


--
-- TOC entry 4437 (class 0 OID 0)
-- Dependencies: 246
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- TOC entry 4438 (class 0 OID 0)
-- Dependencies: 248
-- Name: item_self_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_self_joins_id_seq', 1, false);


--
-- TOC entry 4439 (class 0 OID 0)
-- Dependencies: 250
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_id_seq', 387, true);


--
-- TOC entry 4440 (class 0 OID 0)
-- Dependencies: 252
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lecture_user_joins_id_seq', 86, true);


--
-- TOC entry 4441 (class 0 OID 0)
-- Dependencies: 254
-- Name: lectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lectures_id_seq', 27, true);


--
-- TOC entry 4442 (class 0 OID 0)
-- Dependencies: 256
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_section_joins_id_seq', 12, true);


--
-- TOC entry 4443 (class 0 OID 0)
-- Dependencies: 258
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_tag_joins_id_seq', 55, true);


--
-- TOC entry 4444 (class 0 OID 0)
-- Dependencies: 260
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lessons_id_seq', 12, true);


--
-- TOC entry 4445 (class 0 OID 0)
-- Dependencies: 262
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 1, false);


--
-- TOC entry 4446 (class 0 OID 0)
-- Dependencies: 264
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.media_id_seq', 51, true);


--
-- TOC entry 4447 (class 0 OID 0)
-- Dependencies: 266
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medium_tag_joins_id_seq', 49, true);


--
-- TOC entry 4448 (class 0 OID 0)
-- Dependencies: 268
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 117, true);


--
-- TOC entry 4449 (class 0 OID 0)
-- Dependencies: 270
-- Name: notions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notions_id_seq', 78, true);


--
-- TOC entry 4450 (class 0 OID 0)
-- Dependencies: 272
-- Name: program_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.program_translations_id_seq', 4, true);


--
-- TOC entry 4451 (class 0 OID 0)
-- Dependencies: 274
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.programs_id_seq', 2, true);


--
-- TOC entry 4452 (class 0 OID 0)
-- Dependencies: 277
-- Name: readers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.readers_id_seq', 1, true);


--
-- TOC entry 4453 (class 0 OID 0)
-- Dependencies: 279
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.referrals_id_seq', 12, true);


--
-- TOC entry 4454 (class 0 OID 0)
-- Dependencies: 281
-- Name: relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.relations_id_seq', 50, true);


--
-- TOC entry 4455 (class 0 OID 0)
-- Dependencies: 284
-- Name: section_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.section_tag_joins_id_seq', 44, true);


--
-- TOC entry 4456 (class 0 OID 0)
-- Dependencies: 286
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sections_id_seq', 37, true);


--
-- TOC entry 4457 (class 0 OID 0)
-- Dependencies: 354
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.speaker_talk_joins_id_seq', 2, true);


--
-- TOC entry 4458 (class 0 OID 0)
-- Dependencies: 288
-- Name: subject_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subject_translations_id_seq', 4, true);


--
-- TOC entry 4459 (class 0 OID 0)
-- Dependencies: 290
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 2, true);


--
-- TOC entry 4460 (class 0 OID 0)
-- Dependencies: 293
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 45, true);


--
-- TOC entry 4461 (class 0 OID 0)
-- Dependencies: 360
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talk_tag_joins_id_seq', 2, true);


--
-- TOC entry 4462 (class 0 OID 0)
-- Dependencies: 352
-- Name: talks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talks_id_seq', 1, true);


--
-- TOC entry 4463 (class 0 OID 0)
-- Dependencies: 295
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.terms_id_seq', 4, true);


--
-- TOC entry 4464 (class 0 OID 0)
-- Dependencies: 297
-- Name: thredded_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_categories_id_seq', 1, false);


--
-- TOC entry 4465 (class 0 OID 0)
-- Dependencies: 299
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_groups_id_seq', 1, false);


--
-- TOC entry 4466 (class 0 OID 0)
-- Dependencies: 301
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_notifications_for_followed_topics_id_seq', 1, false);


--
-- TOC entry 4467 (class 0 OID 0)
-- Dependencies: 303
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_users_id_seq', 2, true);


--
-- TOC entry 4468 (class 0 OID 0)
-- Dependencies: 305
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboards_id_seq', 2, true);


--
-- TOC entry 4469 (class 0 OID 0)
-- Dependencies: 307
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_notifications_for_followed_topics_id_seq', 1, false);


--
-- TOC entry 4470 (class 0 OID 0)
-- Dependencies: 309
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_notifications_for_private_topics_id_seq', 1, false);


--
-- TOC entry 4471 (class 0 OID 0)
-- Dependencies: 311
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_post_moderation_records_id_seq', 1, false);


--
-- TOC entry 4472 (class 0 OID 0)
-- Dependencies: 313
-- Name: thredded_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_posts_id_seq', 2, true);


--
-- TOC entry 4473 (class 0 OID 0)
-- Dependencies: 315
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_posts_id_seq', 1, false);


--
-- TOC entry 4474 (class 0 OID 0)
-- Dependencies: 317
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_topics_id_seq', 1, false);


--
-- TOC entry 4475 (class 0 OID 0)
-- Dependencies: 319
-- Name: thredded_private_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_users_id_seq', 1, false);


--
-- TOC entry 4476 (class 0 OID 0)
-- Dependencies: 321
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_topic_categories_id_seq', 1, false);


--
-- TOC entry 4477 (class 0 OID 0)
-- Dependencies: 323
-- Name: thredded_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_topics_id_seq', 2, true);


--
-- TOC entry 4478 (class 0 OID 0)
-- Dependencies: 325
-- Name: thredded_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_details_id_seq', 2, true);


--
-- TOC entry 4479 (class 0 OID 0)
-- Dependencies: 327
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_messageboard_preferences_id_seq', 1, false);


--
-- TOC entry 4480 (class 0 OID 0)
-- Dependencies: 329
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_post_notifications_id_seq', 1, false);


--
-- TOC entry 4481 (class 0 OID 0)
-- Dependencies: 331
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_preferences_id_seq', 1, false);


--
-- TOC entry 4482 (class 0 OID 0)
-- Dependencies: 333
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_private_topic_read_states_id_seq', 1, false);


--
-- TOC entry 4483 (class 0 OID 0)
-- Dependencies: 335
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_topic_follows_id_seq', 2, true);


--
-- TOC entry 4484 (class 0 OID 0)
-- Dependencies: 337
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_topic_read_states_id_seq', 2, true);


--
-- TOC entry 4485 (class 0 OID 0)
-- Dependencies: 339
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tutor_tutorial_joins_id_seq', 1, true);


--
-- TOC entry 4486 (class 0 OID 0)
-- Dependencies: 341
-- Name: tutorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tutorials_id_seq', 1, true);


--
-- TOC entry 4487 (class 0 OID 0)
-- Dependencies: 343
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_favorite_lecture_joins_id_seq', 7, true);


--
-- TOC entry 4488 (class 0 OID 0)
-- Dependencies: 345
-- Name: user_submission_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_submission_joins_id_seq', 8, true);


--
-- TOC entry 4489 (class 0 OID 0)
-- Dependencies: 347
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 349
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.votes_id_seq', 1, true);


--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 351
-- Name: vtt_containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vtt_containers_id_seq', 105, true);


--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 358
-- Name: watchlist_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlist_entries_id_seq', 3, true);


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 356
-- Name: watchlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlists_id_seq', 4, true);


--
-- TOC entry 3707 (class 2606 OID 26771)
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- TOC entry 3711 (class 2606 OID 26773)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- TOC entry 3714 (class 2606 OID 26775)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3716 (class 2606 OID 26777)
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 3720 (class 2606 OID 26779)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 3723 (class 2606 OID 26781)
-- Name: clicker_votes clicker_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clicker_votes
    ADD CONSTRAINT clicker_votes_pkey PRIMARY KEY (id);


--
-- TOC entry 3725 (class 2606 OID 26783)
-- Name: clickers clickers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clickers
    ADD CONSTRAINT clickers_pkey PRIMARY KEY (id);


--
-- TOC entry 3728 (class 2606 OID 26785)
-- Name: commontator_comments commontator_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT commontator_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3736 (class 2606 OID 26787)
-- Name: commontator_subscriptions commontator_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT commontator_subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 3740 (class 2606 OID 26789)
-- Name: commontator_threads commontator_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads
    ADD CONSTRAINT commontator_threads_pkey PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 26791)
-- Name: course_self_joins course_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT course_self_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3749 (class 2606 OID 26793)
-- Name: course_tag_joins course_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins
    ADD CONSTRAINT course_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3753 (class 2606 OID 26797)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 3755 (class 2606 OID 26799)
-- Name: division_course_joins division_course_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins
    ADD CONSTRAINT division_course_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3759 (class 2606 OID 26801)
-- Name: division_translations division_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations
    ADD CONSTRAINT division_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 3763 (class 2606 OID 26803)
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 26805)
-- Name: editable_user_joins editable_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins
    ADD CONSTRAINT editable_user_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3770 (class 2606 OID 26807)
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 26809)
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- TOC entry 3782 (class 2606 OID 26811)
-- Name: item_self_joins item_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins
    ADD CONSTRAINT item_self_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 26813)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3790 (class 2606 OID 26815)
-- Name: lecture_user_joins lecture_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT lecture_user_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 26817)
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 26819)
-- Name: lesson_section_joins lesson_section_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins
    ADD CONSTRAINT lesson_section_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3802 (class 2606 OID 26821)
-- Name: lesson_tag_joins lesson_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins
    ADD CONSTRAINT lesson_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3805 (class 2606 OID 26823)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 26825)
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- TOC entry 3814 (class 2606 OID 26827)
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 26829)
-- Name: medium_tag_joins medium_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT medium_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 26831)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 26833)
-- Name: notions notions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions
    ADD CONSTRAINT notions_pkey PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 26835)
-- Name: program_translations program_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations
    ADD CONSTRAINT program_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 3833 (class 2606 OID 26837)
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- TOC entry 3837 (class 2606 OID 26839)
-- Name: quiz_certificates quiz_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT quiz_certificates_pkey PRIMARY KEY (id);


--
-- TOC entry 3839 (class 2606 OID 26841)
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- TOC entry 3843 (class 2606 OID 26843)
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- TOC entry 3848 (class 2606 OID 26845)
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 26847)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3854 (class 2606 OID 26849)
-- Name: section_tag_joins section_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins
    ADD CONSTRAINT section_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3857 (class 2606 OID 26851)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 3993 (class 2606 OID 27257)
-- Name: speaker_talk_joins speaker_talk_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT speaker_talk_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3861 (class 2606 OID 26853)
-- Name: subject_translations subject_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations
    ADD CONSTRAINT subject_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 3863 (class 2606 OID 26855)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 3868 (class 2606 OID 26857)
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3870 (class 2606 OID 26859)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4005 (class 2606 OID 27318)
-- Name: talk_tag_joins talk_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT talk_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3989 (class 2606 OID 27244)
-- Name: talks talks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT talks_pkey PRIMARY KEY (id);


--
-- TOC entry 3872 (class 2606 OID 26861)
-- Name: terms terms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT terms_pkey PRIMARY KEY (id);


--
-- TOC entry 3877 (class 2606 OID 26863)
-- Name: thredded_categories thredded_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories
    ADD CONSTRAINT thredded_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3879 (class 2606 OID 26865)
-- Name: thredded_messageboard_groups thredded_messageboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups
    ADD CONSTRAINT thredded_messageboard_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3881 (class 2606 OID 26867)
-- Name: thredded_messageboard_notifications_for_followed_topics thredded_messageboard_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics
    ADD CONSTRAINT thredded_messageboard_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 3886 (class 2606 OID 26869)
-- Name: thredded_messageboard_users thredded_messageboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT thredded_messageboard_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3890 (class 2606 OID 26871)
-- Name: thredded_messageboards thredded_messageboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards
    ADD CONSTRAINT thredded_messageboards_pkey PRIMARY KEY (id);


--
-- TOC entry 3892 (class 2606 OID 26873)
-- Name: thredded_notifications_for_followed_topics thredded_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics
    ADD CONSTRAINT thredded_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 3895 (class 2606 OID 26875)
-- Name: thredded_notifications_for_private_topics thredded_notifications_for_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics
    ADD CONSTRAINT thredded_notifications_for_private_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 3899 (class 2606 OID 26877)
-- Name: thredded_post_moderation_records thredded_post_moderation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records
    ADD CONSTRAINT thredded_post_moderation_records_pkey PRIMARY KEY (id);


--
-- TOC entry 3907 (class 2606 OID 26879)
-- Name: thredded_posts thredded_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts
    ADD CONSTRAINT thredded_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3910 (class 2606 OID 26881)
-- Name: thredded_private_posts thredded_private_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts
    ADD CONSTRAINT thredded_private_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3915 (class 2606 OID 26883)
-- Name: thredded_private_topics thredded_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics
    ADD CONSTRAINT thredded_private_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 3919 (class 2606 OID 26885)
-- Name: thredded_private_users thredded_private_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users
    ADD CONSTRAINT thredded_private_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3923 (class 2606 OID 26887)
-- Name: thredded_topic_categories thredded_topic_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories
    ADD CONSTRAINT thredded_topic_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3931 (class 2606 OID 26889)
-- Name: thredded_topics thredded_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics
    ADD CONSTRAINT thredded_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 3937 (class 2606 OID 26891)
-- Name: thredded_user_details thredded_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details
    ADD CONSTRAINT thredded_user_details_pkey PRIMARY KEY (id);


--
-- TOC entry 3939 (class 2606 OID 26893)
-- Name: thredded_user_messageboard_preferences thredded_user_messageboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences
    ADD CONSTRAINT thredded_user_messageboard_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 3944 (class 2606 OID 26895)
-- Name: thredded_user_post_notifications thredded_user_post_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT thredded_user_post_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 3947 (class 2606 OID 26897)
-- Name: thredded_user_preferences thredded_user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences
    ADD CONSTRAINT thredded_user_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 3949 (class 2606 OID 26899)
-- Name: thredded_user_private_topic_read_states thredded_user_private_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states
    ADD CONSTRAINT thredded_user_private_topic_read_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3952 (class 2606 OID 26901)
-- Name: thredded_user_topic_follows thredded_user_topic_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows
    ADD CONSTRAINT thredded_user_topic_follows_pkey PRIMARY KEY (id);


--
-- TOC entry 3956 (class 2606 OID 26903)
-- Name: thredded_user_topic_read_states thredded_user_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states
    ADD CONSTRAINT thredded_user_topic_read_states_pkey PRIMARY KEY (id);


--
-- TOC entry 3962 (class 2606 OID 26905)
-- Name: tutor_tutorial_joins tutor_tutorial_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT tutor_tutorial_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 26907)
-- Name: tutorials tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT tutorials_pkey PRIMARY KEY (id);


--
-- TOC entry 3969 (class 2606 OID 26909)
-- Name: user_favorite_lecture_joins user_favorite_lecture_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT user_favorite_lecture_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3973 (class 2606 OID 26911)
-- Name: user_submission_joins user_submission_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT user_submission_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 3978 (class 2606 OID 26913)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3984 (class 2606 OID 26915)
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- TOC entry 3986 (class 2606 OID 26917)
-- Name: vtt_containers vtt_containers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vtt_containers
    ADD CONSTRAINT vtt_containers_pkey PRIMARY KEY (id);


--
-- TOC entry 4001 (class 2606 OID 27287)
-- Name: watchlist_entries watchlist_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT watchlist_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 3997 (class 2606 OID 27280)
-- Name: watchlists watchlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_pkey PRIMARY KEY (id);


--
-- TOC entry 3708 (class 1259 OID 26918)
-- Name: index_announcements_on_announcer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_announcer_id ON public.announcements USING btree (announcer_id);


--
-- TOC entry 3709 (class 1259 OID 26919)
-- Name: index_announcements_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_lecture_id ON public.announcements USING btree (lecture_id);


--
-- TOC entry 3712 (class 1259 OID 26920)
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- TOC entry 3717 (class 1259 OID 26921)
-- Name: index_assignments_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_lecture_id ON public.assignments USING btree (lecture_id);


--
-- TOC entry 3718 (class 1259 OID 26922)
-- Name: index_assignments_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_medium_id ON public.assignments USING btree (medium_id);


--
-- TOC entry 3721 (class 1259 OID 26923)
-- Name: index_chapters_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_lecture_id ON public.chapters USING btree (lecture_id);


--
-- TOC entry 3726 (class 1259 OID 26924)
-- Name: index_clickers_on_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clickers_on_editor_id ON public.clickers USING btree (editor_id);


--
-- TOC entry 3729 (class 1259 OID 26925)
-- Name: index_commontator_comments_on_c_id_and_c_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_c_id_and_c_type_and_t_id ON public.commontator_comments USING btree (creator_id, creator_type, thread_id);


--
-- TOC entry 3730 (class 1259 OID 26926)
-- Name: index_commontator_comments_on_cached_votes_down; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_down ON public.commontator_comments USING btree (cached_votes_down);


--
-- TOC entry 3731 (class 1259 OID 26927)
-- Name: index_commontator_comments_on_cached_votes_up; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_up ON public.commontator_comments USING btree (cached_votes_up);


--
-- TOC entry 3732 (class 1259 OID 26928)
-- Name: index_commontator_comments_on_editor_type_and_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_editor_type_and_editor_id ON public.commontator_comments USING btree (editor_type, editor_id);


--
-- TOC entry 3733 (class 1259 OID 26929)
-- Name: index_commontator_comments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_parent_id ON public.commontator_comments USING btree (parent_id);


--
-- TOC entry 3734 (class 1259 OID 26930)
-- Name: index_commontator_comments_on_thread_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_thread_id_and_created_at ON public.commontator_comments USING btree (thread_id, created_at);


--
-- TOC entry 3737 (class 1259 OID 26931)
-- Name: index_commontator_subscriptions_on_s_id_and_s_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_subscriptions_on_s_id_and_s_type_and_t_id ON public.commontator_subscriptions USING btree (subscriber_id, subscriber_type, thread_id);


--
-- TOC entry 3738 (class 1259 OID 26932)
-- Name: index_commontator_subscriptions_on_thread_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_subscriptions_on_thread_id ON public.commontator_subscriptions USING btree (thread_id);


--
-- TOC entry 3741 (class 1259 OID 26933)
-- Name: index_commontator_threads_on_c_id_and_c_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_threads_on_c_id_and_c_type ON public.commontator_threads USING btree (commontable_type, commontable_id);


--
-- TOC entry 3742 (class 1259 OID 26934)
-- Name: index_commontator_threads_on_closer_type_and_closer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_threads_on_closer_type_and_closer_id ON public.commontator_threads USING btree (closer_type, closer_id);


--
-- TOC entry 3745 (class 1259 OID 26935)
-- Name: index_course_self_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_course_id ON public.course_self_joins USING btree (course_id);


--
-- TOC entry 3746 (class 1259 OID 26936)
-- Name: index_course_self_joins_on_course_id_and_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_course_self_joins_on_course_id_and_preceding_course_id ON public.course_self_joins USING btree (course_id, preceding_course_id);


--
-- TOC entry 3747 (class 1259 OID 26937)
-- Name: index_course_self_joins_on_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_preceding_course_id ON public.course_self_joins USING btree (preceding_course_id);


--
-- TOC entry 3750 (class 1259 OID 26938)
-- Name: index_course_tag_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_course_id ON public.course_tag_joins USING btree (course_id);


--
-- TOC entry 3751 (class 1259 OID 26939)
-- Name: index_course_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_tag_id ON public.course_tag_joins USING btree (tag_id);


--
-- TOC entry 3756 (class 1259 OID 26942)
-- Name: index_division_course_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_course_id ON public.division_course_joins USING btree (course_id);


--
-- TOC entry 3757 (class 1259 OID 26943)
-- Name: index_division_course_joins_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_division_id ON public.division_course_joins USING btree (division_id);


--
-- TOC entry 3760 (class 1259 OID 26944)
-- Name: index_division_translations_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_division_id ON public.division_translations USING btree (division_id);


--
-- TOC entry 3761 (class 1259 OID 26945)
-- Name: index_division_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_locale ON public.division_translations USING btree (locale);


--
-- TOC entry 3764 (class 1259 OID 26946)
-- Name: index_divisions_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_divisions_on_program_id ON public.divisions USING btree (program_id);


--
-- TOC entry 3771 (class 1259 OID 26947)
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- TOC entry 3772 (class 1259 OID 26948)
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- TOC entry 3773 (class 1259 OID 26949)
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- TOC entry 3774 (class 1259 OID 26950)
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- TOC entry 3777 (class 1259 OID 26951)
-- Name: index_imports_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_medium_id ON public.imports USING btree (medium_id);


--
-- TOC entry 3778 (class 1259 OID 26952)
-- Name: index_imports_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_teachable_type_and_teachable_id ON public.imports USING btree (teachable_type, teachable_id);


--
-- TOC entry 3779 (class 1259 OID 26953)
-- Name: index_item_self_joins_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_item_id ON public.item_self_joins USING btree (item_id);


--
-- TOC entry 3780 (class 1259 OID 26954)
-- Name: index_item_self_joins_on_related_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_related_item_id ON public.item_self_joins USING btree (related_item_id);


--
-- TOC entry 3783 (class 1259 OID 26955)
-- Name: index_items_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_medium_id ON public.items USING btree (medium_id);


--
-- TOC entry 3784 (class 1259 OID 26956)
-- Name: index_items_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_section_id ON public.items USING btree (section_id);


--
-- TOC entry 3787 (class 1259 OID 26957)
-- Name: index_lecture_user_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_lecture_id ON public.lecture_user_joins USING btree (lecture_id);


--
-- TOC entry 3788 (class 1259 OID 26958)
-- Name: index_lecture_user_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_user_id ON public.lecture_user_joins USING btree (user_id);


--
-- TOC entry 3791 (class 1259 OID 26959)
-- Name: index_lectures_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_teacher_id ON public.lectures USING btree (teacher_id);


--
-- TOC entry 3792 (class 1259 OID 26960)
-- Name: index_lectures_on_term_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_term_id ON public.lectures USING btree (term_id);


--
-- TOC entry 3795 (class 1259 OID 26961)
-- Name: index_lesson_section_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_lesson_id ON public.lesson_section_joins USING btree (lesson_id);


--
-- TOC entry 3796 (class 1259 OID 26962)
-- Name: index_lesson_section_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_section_id ON public.lesson_section_joins USING btree (section_id);


--
-- TOC entry 3799 (class 1259 OID 26963)
-- Name: index_lesson_tag_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_lesson_id ON public.lesson_tag_joins USING btree (lesson_id);


--
-- TOC entry 3800 (class 1259 OID 26964)
-- Name: index_lesson_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_tag_id ON public.lesson_tag_joins USING btree (tag_id);


--
-- TOC entry 3803 (class 1259 OID 26965)
-- Name: index_lessons_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lessons_on_lecture_id ON public.lessons USING btree (lecture_id);


--
-- TOC entry 3806 (class 1259 OID 26966)
-- Name: index_links_on_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linked_medium_id ON public.links USING btree (linked_medium_id);


--
-- TOC entry 3807 (class 1259 OID 26967)
-- Name: index_links_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_medium_id ON public.links USING btree (medium_id);


--
-- TOC entry 3808 (class 1259 OID 26968)
-- Name: index_links_on_medium_id_and_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_links_on_medium_id_and_linked_medium_id ON public.links USING btree (medium_id, linked_medium_id);


--
-- TOC entry 3811 (class 1259 OID 26969)
-- Name: index_media_on_quizzable_type_and_quizzable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_quizzable_type_and_quizzable_id ON public.media USING btree (quizzable_type, quizzable_id);


--
-- TOC entry 3812 (class 1259 OID 26970)
-- Name: index_media_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_teachable_type_and_teachable_id ON public.media USING btree (teachable_type, teachable_id);


--
-- TOC entry 3815 (class 1259 OID 26971)
-- Name: index_medium_tag_joins_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_medium_id ON public.medium_tag_joins USING btree (medium_id);


--
-- TOC entry 3816 (class 1259 OID 26972)
-- Name: index_medium_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_tag_id ON public.medium_tag_joins USING btree (tag_id);


--
-- TOC entry 3819 (class 1259 OID 26973)
-- Name: index_notifications_on_notifiable_id_and_notifiable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_notifiable_id_and_notifiable_type ON public.notifications USING btree (notifiable_id, notifiable_type);


--
-- TOC entry 3820 (class 1259 OID 26974)
-- Name: index_notifications_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_recipient_id ON public.notifications USING btree (recipient_id);


--
-- TOC entry 3823 (class 1259 OID 26975)
-- Name: index_notions_on_aliased_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_aliased_tag_id ON public.notions USING btree (aliased_tag_id);


--
-- TOC entry 3824 (class 1259 OID 26976)
-- Name: index_notions_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_tag_id ON public.notions USING btree (tag_id);


--
-- TOC entry 3827 (class 1259 OID 26977)
-- Name: index_program_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_locale ON public.program_translations USING btree (locale);


--
-- TOC entry 3828 (class 1259 OID 26978)
-- Name: index_program_translations_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_program_id ON public.program_translations USING btree (program_id);


--
-- TOC entry 3831 (class 1259 OID 26979)
-- Name: index_programs_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_programs_on_subject_id ON public.programs USING btree (subject_id);


--
-- TOC entry 3834 (class 1259 OID 26980)
-- Name: index_quiz_certificates_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_quiz_id ON public.quiz_certificates USING btree (quiz_id);


--
-- TOC entry 3835 (class 1259 OID 26981)
-- Name: index_quiz_certificates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_user_id ON public.quiz_certificates USING btree (user_id);


--
-- TOC entry 3840 (class 1259 OID 26982)
-- Name: index_referrals_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_item_id ON public.referrals USING btree (item_id);


--
-- TOC entry 3841 (class 1259 OID 26983)
-- Name: index_referrals_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_medium_id ON public.referrals USING btree (medium_id);


--
-- TOC entry 3844 (class 1259 OID 26984)
-- Name: index_relations_on_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_related_tag_id ON public.relations USING btree (related_tag_id);


--
-- TOC entry 3845 (class 1259 OID 26985)
-- Name: index_relations_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_tag_id ON public.relations USING btree (tag_id);


--
-- TOC entry 3846 (class 1259 OID 26986)
-- Name: index_relations_on_tag_id_and_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_relations_on_tag_id_and_related_tag_id ON public.relations USING btree (tag_id, related_tag_id);


--
-- TOC entry 3851 (class 1259 OID 26987)
-- Name: index_section_tag_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_section_id ON public.section_tag_joins USING btree (section_id);


--
-- TOC entry 3852 (class 1259 OID 26988)
-- Name: index_section_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_tag_id ON public.section_tag_joins USING btree (tag_id);


--
-- TOC entry 3855 (class 1259 OID 26989)
-- Name: index_sections_on_chapter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_chapter_id ON public.sections USING btree (chapter_id);


--
-- TOC entry 3990 (class 1259 OID 27269)
-- Name: index_speaker_talk_joins_on_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_speaker_id ON public.speaker_talk_joins USING btree (speaker_id);


--
-- TOC entry 3991 (class 1259 OID 27268)
-- Name: index_speaker_talk_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_talk_id ON public.speaker_talk_joins USING btree (talk_id);


--
-- TOC entry 3858 (class 1259 OID 26990)
-- Name: index_subject_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_locale ON public.subject_translations USING btree (locale);


--
-- TOC entry 3859 (class 1259 OID 26991)
-- Name: index_subject_translations_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_subject_id ON public.subject_translations USING btree (subject_id);


--
-- TOC entry 3864 (class 1259 OID 26992)
-- Name: index_submissions_on_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_assignment_id ON public.submissions USING btree (assignment_id);


--
-- TOC entry 3865 (class 1259 OID 26993)
-- Name: index_submissions_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_submissions_on_token ON public.submissions USING btree (token);


--
-- TOC entry 3866 (class 1259 OID 26994)
-- Name: index_submissions_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_tutorial_id ON public.submissions USING btree (tutorial_id);


--
-- TOC entry 4002 (class 1259 OID 27330)
-- Name: index_talk_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_tag_id ON public.talk_tag_joins USING btree (tag_id);


--
-- TOC entry 4003 (class 1259 OID 27329)
-- Name: index_talk_tag_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_talk_id ON public.talk_tag_joins USING btree (talk_id);


--
-- TOC entry 3987 (class 1259 OID 27250)
-- Name: index_talks_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_lecture_id ON public.talks USING btree (lecture_id);


--
-- TOC entry 3873 (class 1259 OID 26995)
-- Name: index_thredded_categories_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_categories_on_messageboard_id ON public.thredded_categories USING btree (messageboard_id);


--
-- TOC entry 3874 (class 1259 OID 26996)
-- Name: index_thredded_categories_on_messageboard_id_and_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_categories_on_messageboard_id_and_slug ON public.thredded_categories USING btree (messageboard_id, slug);


--
-- TOC entry 3883 (class 1259 OID 26997)
-- Name: index_thredded_messageboard_users_for_recently_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboard_users_for_recently_active ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, last_seen_at);


--
-- TOC entry 3884 (class 1259 OID 26998)
-- Name: index_thredded_messageboard_users_primary; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboard_users_primary ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, thredded_user_detail_id);


--
-- TOC entry 3887 (class 1259 OID 26999)
-- Name: index_thredded_messageboards_on_messageboard_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboards_on_messageboard_group_id ON public.thredded_messageboards USING btree (messageboard_group_id);


--
-- TOC entry 3888 (class 1259 OID 27000)
-- Name: index_thredded_messageboards_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboards_on_slug ON public.thredded_messageboards USING btree (slug);


--
-- TOC entry 3897 (class 1259 OID 27001)
-- Name: index_thredded_moderation_records_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_moderation_records_for_display ON public.thredded_post_moderation_records USING btree (messageboard_id, created_at DESC);


--
-- TOC entry 3900 (class 1259 OID 27002)
-- Name: index_thredded_posts_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_for_display ON public.thredded_posts USING btree (moderation_state, updated_at);


--
-- TOC entry 3901 (class 1259 OID 27003)
-- Name: index_thredded_posts_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_messageboard_id ON public.thredded_posts USING btree (messageboard_id);


--
-- TOC entry 3902 (class 1259 OID 27004)
-- Name: index_thredded_posts_on_postable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id ON public.thredded_posts USING btree (postable_id);


--
-- TOC entry 3903 (class 1259 OID 27005)
-- Name: index_thredded_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id_and_created_at ON public.thredded_posts USING btree (postable_id, created_at);


--
-- TOC entry 3904 (class 1259 OID 27006)
-- Name: index_thredded_posts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_user_id ON public.thredded_posts USING btree (user_id);


--
-- TOC entry 3908 (class 1259 OID 27007)
-- Name: index_thredded_private_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_posts_on_postable_id_and_created_at ON public.thredded_private_posts USING btree (postable_id, created_at);


--
-- TOC entry 3911 (class 1259 OID 27008)
-- Name: index_thredded_private_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_hash_id ON public.thredded_private_topics USING btree (hash_id);


--
-- TOC entry 3912 (class 1259 OID 27009)
-- Name: index_thredded_private_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_last_post_at ON public.thredded_private_topics USING btree (last_post_at);


--
-- TOC entry 3913 (class 1259 OID 27010)
-- Name: index_thredded_private_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_private_topics_on_slug ON public.thredded_private_topics USING btree (slug);


--
-- TOC entry 3916 (class 1259 OID 27011)
-- Name: index_thredded_private_users_on_private_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_private_topic_id ON public.thredded_private_users USING btree (private_topic_id);


--
-- TOC entry 3917 (class 1259 OID 27012)
-- Name: index_thredded_private_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_user_id ON public.thredded_private_users USING btree (user_id);


--
-- TOC entry 3920 (class 1259 OID 27013)
-- Name: index_thredded_topic_categories_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_category_id ON public.thredded_topic_categories USING btree (category_id);


--
-- TOC entry 3921 (class 1259 OID 27014)
-- Name: index_thredded_topic_categories_on_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_topic_id ON public.thredded_topic_categories USING btree (topic_id);


--
-- TOC entry 3924 (class 1259 OID 27015)
-- Name: index_thredded_topics_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_for_display ON public.thredded_topics USING btree (moderation_state, sticky DESC, updated_at DESC);


--
-- TOC entry 3925 (class 1259 OID 27016)
-- Name: index_thredded_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_hash_id ON public.thredded_topics USING btree (hash_id);


--
-- TOC entry 3926 (class 1259 OID 27017)
-- Name: index_thredded_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_last_post_at ON public.thredded_topics USING btree (last_post_at);


--
-- TOC entry 3927 (class 1259 OID 27018)
-- Name: index_thredded_topics_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_messageboard_id ON public.thredded_topics USING btree (messageboard_id);


--
-- TOC entry 3928 (class 1259 OID 27019)
-- Name: index_thredded_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_topics_on_slug ON public.thredded_topics USING btree (slug);


--
-- TOC entry 3929 (class 1259 OID 27020)
-- Name: index_thredded_topics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_user_id ON public.thredded_topics USING btree (user_id);


--
-- TOC entry 3933 (class 1259 OID 27021)
-- Name: index_thredded_user_details_for_moderations; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_for_moderations ON public.thredded_user_details USING btree (moderation_state, moderation_state_changed_at DESC);


--
-- TOC entry 3934 (class 1259 OID 27022)
-- Name: index_thredded_user_details_on_latest_activity_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_on_latest_activity_at ON public.thredded_user_details USING btree (latest_activity_at);


--
-- TOC entry 3935 (class 1259 OID 27023)
-- Name: index_thredded_user_details_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_details_on_user_id ON public.thredded_user_details USING btree (user_id);


--
-- TOC entry 3941 (class 1259 OID 27024)
-- Name: index_thredded_user_post_notifications_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_post_notifications_on_post_id ON public.thredded_user_post_notifications USING btree (post_id);


--
-- TOC entry 3942 (class 1259 OID 27025)
-- Name: index_thredded_user_post_notifications_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_post_notifications_on_user_id_and_post_id ON public.thredded_user_post_notifications USING btree (user_id, post_id);


--
-- TOC entry 3945 (class 1259 OID 27026)
-- Name: index_thredded_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_preferences_on_user_id ON public.thredded_user_preferences USING btree (user_id);


--
-- TOC entry 3954 (class 1259 OID 27027)
-- Name: index_thredded_user_topic_read_states_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_topic_read_states_on_messageboard_id ON public.thredded_user_topic_read_states USING btree (messageboard_id);


--
-- TOC entry 3959 (class 1259 OID 27028)
-- Name: index_tutor_tutorial_joins_on_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutor_id ON public.tutor_tutorial_joins USING btree (tutor_id);


--
-- TOC entry 3960 (class 1259 OID 27029)
-- Name: index_tutor_tutorial_joins_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutorial_id ON public.tutor_tutorial_joins USING btree (tutorial_id);


--
-- TOC entry 3963 (class 1259 OID 27030)
-- Name: index_tutorials_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_lecture_id ON public.tutorials USING btree (lecture_id);


--
-- TOC entry 3966 (class 1259 OID 27031)
-- Name: index_user_favorite_lecture_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_lecture_id ON public.user_favorite_lecture_joins USING btree (lecture_id);


--
-- TOC entry 3967 (class 1259 OID 27032)
-- Name: index_user_favorite_lecture_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_user_id ON public.user_favorite_lecture_joins USING btree (user_id);


--
-- TOC entry 3970 (class 1259 OID 27033)
-- Name: index_user_submission_joins_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_submission_id ON public.user_submission_joins USING btree (submission_id);


--
-- TOC entry 3971 (class 1259 OID 27034)
-- Name: index_user_submission_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_user_id ON public.user_submission_joins USING btree (user_id);


--
-- TOC entry 3974 (class 1259 OID 27035)
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- TOC entry 3975 (class 1259 OID 27036)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 3976 (class 1259 OID 27037)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 3979 (class 1259 OID 27038)
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON public.votes USING btree (votable_id, votable_type, vote_scope);


--
-- TOC entry 3980 (class 1259 OID 27039)
-- Name: index_votes_on_votable_type_and_votable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_type_and_votable_id ON public.votes USING btree (votable_type, votable_id);


--
-- TOC entry 3981 (class 1259 OID 27040)
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON public.votes USING btree (voter_id, voter_type, vote_scope);


--
-- TOC entry 3982 (class 1259 OID 27041)
-- Name: index_votes_on_voter_type_and_voter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_type_and_voter_id ON public.votes USING btree (voter_type, voter_id);


--
-- TOC entry 3998 (class 1259 OID 27299)
-- Name: index_watchlist_entries_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_medium_id ON public.watchlist_entries USING btree (medium_id);


--
-- TOC entry 3999 (class 1259 OID 27298)
-- Name: index_watchlist_entries_on_watchlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_watchlist_id ON public.watchlist_entries USING btree (watchlist_id);


--
-- TOC entry 3994 (class 1259 OID 27300)
-- Name: index_watchlists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_user_id ON public.watchlists USING btree (user_id);


--
-- TOC entry 3995 (class 1259 OID 27306)
-- Name: index_watchlists_on_watchlist_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_watchlist_entry_id ON public.watchlists USING btree (watchlist_entry_id);


--
-- TOC entry 3767 (class 1259 OID 27042)
-- Name: polymorphic_editable_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_editable_idx ON public.editable_user_joins USING btree (editable_id, editable_type);


--
-- TOC entry 3768 (class 1259 OID 27043)
-- Name: polymorphic_many_to_many_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_many_to_many_idx ON public.editable_user_joins USING btree (editable_id, editable_type, user_id);


--
-- TOC entry 3875 (class 1259 OID 27044)
-- Name: thredded_categories_name_ci; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_categories_name_ci ON public.thredded_categories USING btree (lower(name) text_pattern_ops);


--
-- TOC entry 3882 (class 1259 OID 27045)
-- Name: thredded_messageboard_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_messageboard_notifications_for_followed_topics_unique ON public.thredded_messageboard_notifications_for_followed_topics USING btree (user_id, messageboard_id, notifier_key);


--
-- TOC entry 3893 (class 1259 OID 27046)
-- Name: thredded_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_followed_topics_unique ON public.thredded_notifications_for_followed_topics USING btree (user_id, notifier_key);


--
-- TOC entry 3896 (class 1259 OID 27047)
-- Name: thredded_notifications_for_private_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_private_topics_unique ON public.thredded_notifications_for_private_topics USING btree (user_id, notifier_key);


--
-- TOC entry 3905 (class 1259 OID 27048)
-- Name: thredded_posts_content_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_posts_content_fts ON public.thredded_posts USING gist (to_tsvector('english'::regconfig, content));


--
-- TOC entry 3932 (class 1259 OID 27049)
-- Name: thredded_topics_title_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_topics_title_fts ON public.thredded_topics USING gist (to_tsvector('english'::regconfig, title));


--
-- TOC entry 3940 (class 1259 OID 27050)
-- Name: thredded_user_messageboard_preferences_user_id_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_messageboard_preferences_user_id_messageboard_id ON public.thredded_user_messageboard_preferences USING btree (user_id, messageboard_id);


--
-- TOC entry 3950 (class 1259 OID 27051)
-- Name: thredded_user_private_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_private_topic_read_states_user_postable ON public.thredded_user_private_topic_read_states USING btree (user_id, postable_id);


--
-- TOC entry 3953 (class 1259 OID 27052)
-- Name: thredded_user_topic_follows_user_topic; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_follows_user_topic ON public.thredded_user_topic_follows USING btree (user_id, topic_id);


--
-- TOC entry 3957 (class 1259 OID 27053)
-- Name: thredded_user_topic_read_states_user_messageboard; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_user_topic_read_states_user_messageboard ON public.thredded_user_topic_read_states USING btree (user_id, messageboard_id);


--
-- TOC entry 3958 (class 1259 OID 27054)
-- Name: thredded_user_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_read_states_user_postable ON public.thredded_user_topic_read_states USING btree (user_id, postable_id);


--
-- TOC entry 4014 (class 2606 OID 27055)
-- Name: imports fk_rails_018d34d0a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT fk_rails_018d34d0a7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4045 (class 2606 OID 27288)
-- Name: watchlist_entries fk_rails_021aafbf37; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_021aafbf37 FOREIGN KEY (watchlist_id) REFERENCES public.watchlists(id);


--
-- TOC entry 4030 (class 2606 OID 27060)
-- Name: thredded_messageboard_users fk_rails_06e42c62f5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_06e42c62f5 FOREIGN KEY (thredded_user_detail_id) REFERENCES public.thredded_user_details(id) ON DELETE CASCADE;


--
-- TOC entry 4043 (class 2606 OID 27301)
-- Name: watchlists fk_rails_0dc1a4cbcb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_0dc1a4cbcb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4040 (class 2606 OID 27245)
-- Name: talks fk_rails_1210911b58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT fk_rails_1210911b58 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4039 (class 2606 OID 27065)
-- Name: user_submission_joins fk_rails_12d41a7e23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT fk_rails_12d41a7e23 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4023 (class 2606 OID 27070)
-- Name: programs fk_rails_174715887a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT fk_rails_174715887a FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 4041 (class 2606 OID 27263)
-- Name: speaker_talk_joins fk_rails_1d337b4d3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_1d337b4d3d FOREIGN KEY (speaker_id) REFERENCES public.users(id);


--
-- TOC entry 4017 (class 2606 OID 27075)
-- Name: lecture_user_joins fk_rails_1e48112fae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_1e48112fae FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4008 (class 2606 OID 27080)
-- Name: assignments fk_rails_2d7bf5a691; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_rails_2d7bf5a691 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4046 (class 2606 OID 27293)
-- Name: watchlist_entries fk_rails_32f03600d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_32f03600d9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4032 (class 2606 OID 27085)
-- Name: thredded_user_post_notifications fk_rails_364d7e370a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_364d7e370a FOREIGN KEY (post_id) REFERENCES public.thredded_posts(id) ON DELETE CASCADE;


--
-- TOC entry 4028 (class 2606 OID 27090)
-- Name: submissions fk_rails_3a2b44e658; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_3a2b44e658 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4037 (class 2606 OID 27095)
-- Name: user_favorite_lecture_joins fk_rails_40985ebb4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_40985ebb4f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4019 (class 2606 OID 27100)
-- Name: links fk_rails_49020b7472; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_49020b7472 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4009 (class 2606 OID 27105)
-- Name: commontator_comments fk_rails_558e599d00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_558e599d00 FOREIGN KEY (parent_id) REFERENCES public.commontator_comments(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4033 (class 2606 OID 27110)
-- Name: thredded_user_post_notifications fk_rails_5908eec802; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_5908eec802 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4006 (class 2606 OID 27115)
-- Name: announcements fk_rails_5b3f1d7737; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_5b3f1d7737 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4029 (class 2606 OID 27120)
-- Name: submissions fk_rails_61cac0823d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_61cac0823d FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- TOC entry 4036 (class 2606 OID 27125)
-- Name: tutorials fk_rails_66221d24a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT fk_rails_66221d24a3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4011 (class 2606 OID 27130)
-- Name: commontator_subscriptions fk_rails_68cc24d064; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT fk_rails_68cc24d064 FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4020 (class 2606 OID 27135)
-- Name: links fk_rails_6b5cb429ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_6b5cb429ed FOREIGN KEY (linked_medium_id) REFERENCES public.media(id);


--
-- TOC entry 4047 (class 2606 OID 27319)
-- Name: talk_tag_joins fk_rails_6bcb0e8e5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_6bcb0e8e5f FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- TOC entry 4038 (class 2606 OID 27145)
-- Name: user_favorite_lecture_joins fk_rails_77bc049c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_77bc049c12 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4048 (class 2606 OID 27324)
-- Name: talk_tag_joins fk_rails_85b7c429a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_85b7c429a2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 4044 (class 2606 OID 27307)
-- Name: watchlists fk_rails_8780bd5b5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_8780bd5b5a FOREIGN KEY (watchlist_entry_id) REFERENCES public.watchlist_entries(id);


--
-- TOC entry 4010 (class 2606 OID 27150)
-- Name: commontator_comments fk_rails_96666eb19a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_96666eb19a FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4031 (class 2606 OID 27155)
-- Name: thredded_messageboard_users fk_rails_966803d714; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_966803d714 FOREIGN KEY (thredded_messageboard_id) REFERENCES public.thredded_messageboards(id) ON DELETE CASCADE;


--
-- TOC entry 4015 (class 2606 OID 27160)
-- Name: items fk_rails_99dcbdef9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_99dcbdef9f FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- TOC entry 4026 (class 2606 OID 27165)
-- Name: referrals fk_rails_9c4f45c15c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_9c4f45c15c FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4013 (class 2606 OID 27170)
-- Name: divisions fk_rails_a1b344ef36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT fk_rails_a1b344ef36 FOREIGN KEY (program_id) REFERENCES public.programs(id);


--
-- TOC entry 4016 (class 2606 OID 27175)
-- Name: items fk_rails_add0a302a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_add0a302a9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4021 (class 2606 OID 27180)
-- Name: medium_tag_joins fk_rails_b11130c931; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b11130c931 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4022 (class 2606 OID 27185)
-- Name: medium_tag_joins fk_rails_b181027fb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b181027fb2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 4034 (class 2606 OID 27190)
-- Name: tutor_tutorial_joins fk_rails_b781447eb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_b781447eb1 FOREIGN KEY (tutor_id) REFERENCES public.users(id);


--
-- TOC entry 4018 (class 2606 OID 27200)
-- Name: lecture_user_joins fk_rails_bdbf7bc779; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_bdbf7bc779 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4024 (class 2606 OID 27205)
-- Name: quiz_certificates fk_rails_c10d7b5c91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_c10d7b5c91 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4025 (class 2606 OID 27210)
-- Name: quiz_certificates fk_rails_da91c72f96; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_da91c72f96 FOREIGN KEY (quiz_id) REFERENCES public.media(id);


--
-- TOC entry 4027 (class 2606 OID 27215)
-- Name: referrals fk_rails_dce931e0f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_dce931e0f7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4042 (class 2606 OID 27258)
-- Name: speaker_talk_joins fk_rails_e5bafe887c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_e5bafe887c FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- TOC entry 4012 (class 2606 OID 27220)
-- Name: course_self_joins fk_rails_ecb46f40b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT fk_rails_ecb46f40b3 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4035 (class 2606 OID 27225)
-- Name: tutor_tutorial_joins fk_rails_f1a97a6dc5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_f1a97a6dc5 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4007 (class 2606 OID 27230)
-- Name: announcements fk_rails_fd9bbf1b15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_fd9bbf1b15 FOREIGN KEY (announcer_id) REFERENCES public.users(id);


-- Completed on 2022-09-23 12:08:41 UTC

--
-- PostgreSQL database dump complete
--

