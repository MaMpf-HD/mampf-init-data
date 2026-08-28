--
-- PostgreSQL database dump
--

\restrict Md5qUXVycYdGPp37axZABbhEkbajm4yIfErDnwrKrmAMeyQZ5dH3bfjb9T0jnFd

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

-- Started on 2026-08-28 22:58:28 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 10131980)
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- TOC entry 3 (class 3079 OID 10132061)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 4 (class 3079 OID 10132099)
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 10132106)
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 10132117)
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 223
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- TOC entry 224 (class 1259 OID 10132118)
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 10132129)
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 225
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- TOC entry 226 (class 1259 OID 10132130)
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 10132141)
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 227
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- TOC entry 228 (class 1259 OID 10132142)
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 10132150)
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 229
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- TOC entry 230 (class 1259 OID 10132151)
-- Name: annotations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.annotations (
    id bigint NOT NULL,
    medium_id bigint NOT NULL,
    user_id bigint NOT NULL,
    "timestamp" text NOT NULL,
    comment text,
    color character varying NOT NULL,
    category integer NOT NULL,
    subcategory integer,
    visible_for_teacher boolean DEFAULT false NOT NULL,
    public_comment_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 10132166)
-- Name: annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.annotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 231
-- Name: annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.annotations_id_seq OWNED BY public.annotations.id;


--
-- TOC entry 232 (class 1259 OID 10132167)
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
-- TOC entry 233 (class 1259 OID 10132176)
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 233
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- TOC entry 234 (class 1259 OID 10132177)
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
-- TOC entry 235 (class 1259 OID 10132185)
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 235
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- TOC entry 236 (class 1259 OID 10132186)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 10132194)
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
    deletion_date date DEFAULT '2200-01-01'::date NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 10132206)
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 238
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- TOC entry 239 (class 1259 OID 10132207)
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
-- TOC entry 240 (class 1259 OID 10132215)
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 240
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
-- TOC entry 241 (class 1259 OID 10132216)
-- Name: claims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.claims (
    id bigint NOT NULL,
    redemption_id bigint NOT NULL,
    claimable_type character varying NOT NULL,
    claimable_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 10132227)
-- Name: claims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.claims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 242
-- Name: claims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.claims_id_seq OWNED BY public.claims.id;


--
-- TOC entry 243 (class 1259 OID 10132228)
-- Name: cohort_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cohort_memberships (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id bigint NOT NULL,
    cohort_id bigint NOT NULL,
    source_campaign_id uuid,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 10132237)
-- Name: cohorts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cohorts (
    id bigint NOT NULL,
    title character varying NOT NULL,
    description text,
    capacity integer,
    context_type character varying NOT NULL,
    context_id bigint NOT NULL,
    propagate_to_lecture boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    skip_campaigns boolean DEFAULT false NOT NULL,
    self_materialization_mode integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 10132254)
-- Name: cohorts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cohorts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 245
-- Name: cohorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cohorts_id_seq OWNED BY public.cohorts.id;


--
-- TOC entry 246 (class 1259 OID 10132255)
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
-- TOC entry 247 (class 1259 OID 10132269)
-- Name: commontator_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 247
-- Name: commontator_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_comments_id_seq OWNED BY public.commontator_comments.id;


--
-- TOC entry 248 (class 1259 OID 10132270)
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
-- TOC entry 249 (class 1259 OID 10132281)
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 249
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_subscriptions_id_seq OWNED BY public.commontator_subscriptions.id;


--
-- TOC entry 250 (class 1259 OID 10132282)
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
-- TOC entry 251 (class 1259 OID 10132290)
-- Name: commontator_threads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 251
-- Name: commontator_threads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_threads_id_seq OWNED BY public.commontator_threads.id;


--
-- TOC entry 252 (class 1259 OID 10132291)
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
-- TOC entry 253 (class 1259 OID 10132297)
-- Name: course_self_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_self_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 253
-- Name: course_self_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_self_joins_id_seq OWNED BY public.course_self_joins.id;


--
-- TOC entry 254 (class 1259 OID 10132298)
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
-- TOC entry 255 (class 1259 OID 10132304)
-- Name: course_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 255
-- Name: course_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_tag_joins_id_seq OWNED BY public.course_tag_joins.id;


--
-- TOC entry 256 (class 1259 OID 10132305)
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
-- TOC entry 257 (class 1259 OID 10132314)
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 257
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 258 (class 1259 OID 10132315)
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
-- TOC entry 259 (class 1259 OID 10132323)
-- Name: division_course_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.division_course_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 259
-- Name: division_course_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.division_course_joins_id_seq OWNED BY public.division_course_joins.id;


--
-- TOC entry 260 (class 1259 OID 10132324)
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
-- TOC entry 261 (class 1259 OID 10132334)
-- Name: division_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.division_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 261
-- Name: division_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.division_translations_id_seq OWNED BY public.division_translations.id;


--
-- TOC entry 262 (class 1259 OID 10132335)
-- Name: divisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.divisions (
    id bigint NOT NULL,
    program_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 10132341)
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 263
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.divisions_id_seq OWNED BY public.divisions.id;


--
-- TOC entry 264 (class 1259 OID 10132342)
-- Name: editable_user_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.editable_user_joins (
    id bigint NOT NULL,
    editable_id integer,
    editable_type character varying,
    user_id integer
);


--
-- TOC entry 265 (class 1259 OID 10132348)
-- Name: editable_user_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.editable_user_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 265
-- Name: editable_user_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.editable_user_joins_id_seq OWNED BY public.editable_user_joins.id;


--
-- TOC entry 266 (class 1259 OID 10132349)
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.feedbacks (
    id bigint NOT NULL,
    title text,
    feedback text,
    can_contact boolean DEFAULT false NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 267 (class 1259 OID 10132360)
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 267
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- TOC entry 268 (class 1259 OID 10132361)
-- Name: flipper_features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flipper_features (
    id bigint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 10132370)
-- Name: flipper_features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flipper_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 269
-- Name: flipper_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flipper_features_id_seq OWNED BY public.flipper_features.id;


--
-- TOC entry 270 (class 1259 OID 10132371)
-- Name: flipper_gates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flipper_gates (
    id bigint NOT NULL,
    feature_key character varying NOT NULL,
    key character varying NOT NULL,
    value text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 271 (class 1259 OID 10132381)
-- Name: flipper_gates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flipper_gates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 271
-- Name: flipper_gates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flipper_gates_id_seq OWNED BY public.flipper_gates.id;


--
-- TOC entry 272 (class 1259 OID 10132382)
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
-- TOC entry 273 (class 1259 OID 10132390)
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 273
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- TOC entry 274 (class 1259 OID 10132391)
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
-- TOC entry 275 (class 1259 OID 10132402)
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 275
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- TOC entry 276 (class 1259 OID 10132403)
-- Name: item_self_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_self_joins (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    related_item_id bigint NOT NULL
);


--
-- TOC entry 277 (class 1259 OID 10132409)
-- Name: item_self_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_self_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 277
-- Name: item_self_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_self_joins_id_seq OWNED BY public.item_self_joins.id;


--
-- TOC entry 278 (class 1259 OID 10132410)
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
-- TOC entry 279 (class 1259 OID 10132418)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 279
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 280 (class 1259 OID 10132419)
-- Name: lecture_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lecture_memberships (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    source_campaign_id uuid,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 281 (class 1259 OID 10132428)
-- Name: lecture_user_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lecture_user_joins (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 10132436)
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lecture_user_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 282
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lecture_user_joins_id_seq OWNED BY public.lecture_user_joins.id;


--
-- TOC entry 283 (class 1259 OID 10132437)
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
    comments_disabled boolean,
    organizational_on_top boolean,
    disable_teacher_display boolean DEFAULT false,
    submission_max_team_size integer,
    submission_grace_period integer DEFAULT 15,
    legacy_seminar boolean DEFAULT false,
    annotations_status integer DEFAULT 1 NOT NULL,
    self_materialization_mode integer DEFAULT 0 NOT NULL,
    home_intro text,
    home_attachment_data text
);


--
-- TOC entry 284 (class 1259 OID 10132452)
-- Name: lectures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lectures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 284
-- Name: lectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lectures_id_seq OWNED BY public.lectures.id;


--
-- TOC entry 285 (class 1259 OID 10132453)
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
-- TOC entry 286 (class 1259 OID 10132459)
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_section_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 286
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_section_joins_id_seq OWNED BY public.lesson_section_joins.id;


--
-- TOC entry 287 (class 1259 OID 10132460)
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
-- TOC entry 288 (class 1259 OID 10132466)
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 288
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_tag_joins_id_seq OWNED BY public.lesson_tag_joins.id;


--
-- TOC entry 289 (class 1259 OID 10132467)
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
-- TOC entry 290 (class 1259 OID 10132475)
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 290
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- TOC entry 291 (class 1259 OID 10132476)
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
-- TOC entry 292 (class 1259 OID 10132482)
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 292
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- TOC entry 293 (class 1259 OID 10132483)
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
    hint text,
    parent_id integer,
    quiz_graph text,
    level integer,
    type text,
    text text,
    independent boolean,
    locale text,
    solution text,
    question_sort text,
    content text,
    geogebra_data text,
    geogebra_app_name text,
    "position" integer,
    text_input boolean DEFAULT false,
    released_at timestamp without time zone,
    publisher text,
    file_last_edited timestamp without time zone,
    external_link_description text,
    annotations_status integer DEFAULT '-1'::integer NOT NULL,
    answers_count integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 294 (class 1259 OID 10132496)
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 294
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- TOC entry 295 (class 1259 OID 10132497)
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
-- TOC entry 296 (class 1259 OID 10132503)
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medium_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 296
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medium_tag_joins_id_seq OWNED BY public.medium_tag_joins.id;


--
-- TOC entry 297 (class 1259 OID 10132504)
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
-- TOC entry 298 (class 1259 OID 10132512)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 298
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 299 (class 1259 OID 10132513)
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
-- TOC entry 300 (class 1259 OID 10132521)
-- Name: notions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 300
-- Name: notions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notions_id_seq OWNED BY public.notions.id;


--
-- TOC entry 301 (class 1259 OID 10132522)
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
-- TOC entry 302 (class 1259 OID 10132532)
-- Name: program_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.program_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 302
-- Name: program_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.program_translations_id_seq OWNED BY public.program_translations.id;


--
-- TOC entry 303 (class 1259 OID 10132533)
-- Name: programs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    subject_id bigint
);


--
-- TOC entry 304 (class 1259 OID 10132539)
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 304
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- TOC entry 305 (class 1259 OID 10132540)
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
-- TOC entry 306 (class 1259 OID 10132550)
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
-- TOC entry 307 (class 1259 OID 10132556)
-- Name: readers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.readers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 307
-- Name: readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.readers_id_seq OWNED BY public.readers.id;


--
-- TOC entry 308 (class 1259 OID 10132557)
-- Name: redemptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.redemptions (
    id bigint NOT NULL,
    voucher_id uuid NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 309 (class 1259 OID 10132565)
-- Name: redemptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.redemptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 309
-- Name: redemptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redemptions_id_seq OWNED BY public.redemptions.id;


--
-- TOC entry 310 (class 1259 OID 10132566)
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
-- TOC entry 311 (class 1259 OID 10132574)
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 311
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
-- TOC entry 312 (class 1259 OID 10132575)
-- Name: registration_campaigns; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registration_campaigns (
    campaignable_type character varying NOT NULL,
    campaignable_id bigint NOT NULL,
    description character varying,
    allocation_mode integer DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    registration_deadline timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    last_allocation_calculated_at timestamp(6) without time zone,
    allocation_decided_at timestamp(6) without time zone
);


--
-- TOC entry 313 (class 1259 OID 10132591)
-- Name: registration_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registration_items (
    registerable_type character varying NOT NULL,
    registerable_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    registration_campaign_id uuid NOT NULL,
    confirmed_registrations_count integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 314 (class 1259 OID 10132605)
-- Name: registration_policies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registration_policies (
    kind integer NOT NULL,
    phase integer DEFAULT 0 NOT NULL,
    "position" integer,
    active boolean DEFAULT true NOT NULL,
    config jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    registration_campaign_id uuid NOT NULL
);


--
-- TOC entry 315 (class 1259 OID 10132622)
-- Name: registration_student_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registration_student_messages (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    sender_id bigint NOT NULL,
    subject character varying NOT NULL,
    body text NOT NULL,
    attachment_data text,
    recipient_emails character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    recipients_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 316 (class 1259 OID 10132638)
-- Name: registration_student_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.registration_student_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 316
-- Name: registration_student_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.registration_student_messages_id_seq OWNED BY public.registration_student_messages.id;


--
-- TOC entry 317 (class 1259 OID 10132639)
-- Name: registration_user_registrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registration_user_registrations (
    user_id bigint NOT NULL,
    preference_rank integer,
    status integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    registration_campaign_id uuid CONSTRAINT registration_user_registratio_registration_campaign_id_not_null NOT NULL,
    registration_item_id uuid NOT NULL,
    materialized_at timestamp(6) without time zone,
    exclusive_assignment boolean DEFAULT false NOT NULL,
    rejection_reason_type character varying,
    rejection_reason_code character varying,
    rejection_reason_label character varying,
    rejected_at timestamp(6) without time zone,
    rejection_overridden_at timestamp(6) without time zone,
    rejection_policy_id uuid
);


--
-- TOC entry 318 (class 1259 OID 10132655)
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
-- TOC entry 319 (class 1259 OID 10132661)
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 319
-- Name: relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.relations_id_seq OWNED BY public.relations.id;


--
-- TOC entry 320 (class 1259 OID 10132662)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 10132668)
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
-- TOC entry 322 (class 1259 OID 10132674)
-- Name: section_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.section_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 322
-- Name: section_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.section_tag_joins_id_seq OWNED BY public.section_tag_joins.id;


--
-- TOC entry 323 (class 1259 OID 10132675)
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
-- TOC entry 324 (class 1259 OID 10132683)
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 324
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- TOC entry 325 (class 1259 OID 10132684)
-- Name: speaker_talk_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.speaker_talk_joins (
    id bigint NOT NULL,
    talk_id bigint NOT NULL,
    speaker_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    source_campaign_id uuid
);


--
-- TOC entry 326 (class 1259 OID 10132692)
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.speaker_talk_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 326
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.speaker_talk_joins_id_seq OWNED BY public.speaker_talk_joins.id;


--
-- TOC entry 327 (class 1259 OID 10132693)
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
-- TOC entry 328 (class 1259 OID 10132703)
-- Name: subject_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subject_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 328
-- Name: subject_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subject_translations_id_seq OWNED BY public.subject_translations.id;


--
-- TOC entry 329 (class 1259 OID 10132704)
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 330 (class 1259 OID 10132710)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 330
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 331 (class 1259 OID 10132711)
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
-- TOC entry 332 (class 1259 OID 10132723)
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 333 (class 1259 OID 10132729)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 333
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 334 (class 1259 OID 10132730)
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
-- TOC entry 335 (class 1259 OID 10132738)
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talk_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 335
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talk_tag_joins_id_seq OWNED BY public.talk_tag_joins.id;


--
-- TOC entry 336 (class 1259 OID 10132739)
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
    display_description boolean DEFAULT false,
    capacity integer,
    skip_campaigns boolean DEFAULT false NOT NULL,
    self_materialization_mode integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 337 (class 1259 OID 10132754)
-- Name: talks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 337
-- Name: talks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talks_id_seq OWNED BY public.talks.id;


--
-- TOC entry 338 (class 1259 OID 10132755)
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
-- TOC entry 339 (class 1259 OID 10132764)
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 339
-- Name: terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.terms_id_seq OWNED BY public.terms.id;


--
-- TOC entry 340 (class 1259 OID 10132765)
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
-- TOC entry 341 (class 1259 OID 10132776)
-- Name: thredded_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 341
-- Name: thredded_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_categories_id_seq OWNED BY public.thredded_categories.id;


--
-- TOC entry 342 (class 1259 OID 10132777)
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
-- TOC entry 343 (class 1259 OID 10132786)
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 343
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_groups_id_seq OWNED BY public.thredded_messageboard_groups.id;


--
-- TOC entry 344 (class 1259 OID 10132787)
-- Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_notifications_for_followed_topics (
    id bigint CONSTRAINT thredded_messageboard_notifications_for_followed_to_id_not_null NOT NULL,
    user_id bigint CONSTRAINT thredded_messageboard_notifications_for_follow_user_id_not_null NOT NULL,
    messageboard_id bigint CONSTRAINT thredded_messageboard_notifications_fo_messageboard_id_not_null NOT NULL,
    notifier_key character varying(90) CONSTRAINT thredded_messageboard_notifications_for_f_notifier_key_not_null NOT NULL,
    enabled boolean DEFAULT true CONSTRAINT thredded_messageboard_notifications_for_follow_enabled_not_null NOT NULL
);


--
-- TOC entry 345 (class 1259 OID 10132796)
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 345
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq OWNED BY public.thredded_messageboard_notifications_for_followed_topics.id;


--
-- TOC entry 346 (class 1259 OID 10132797)
-- Name: thredded_messageboard_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_users (
    id bigint NOT NULL,
    thredded_user_detail_id bigint NOT NULL,
    thredded_messageboard_id bigint NOT NULL,
    last_seen_at timestamp without time zone NOT NULL
);


--
-- TOC entry 347 (class 1259 OID 10132804)
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 347
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_users_id_seq OWNED BY public.thredded_messageboard_users.id;


--
-- TOC entry 348 (class 1259 OID 10132805)
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
-- TOC entry 349 (class 1259 OID 10132819)
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 349
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboards_id_seq OWNED BY public.thredded_messageboards.id;


--
-- TOC entry 350 (class 1259 OID 10132820)
-- Name: thredded_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) CONSTRAINT thredded_notifications_for_followed_topic_notifier_key_not_null NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 351 (class 1259 OID 10132828)
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 351
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_notifications_for_followed_topics_id_seq OWNED BY public.thredded_notifications_for_followed_topics.id;


--
-- TOC entry 352 (class 1259 OID 10132829)
-- Name: thredded_notifications_for_private_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_private_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 353 (class 1259 OID 10132837)
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_notifications_for_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 353
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_notifications_for_private_topics_id_seq OWNED BY public.thredded_notifications_for_private_topics.id;


--
-- TOC entry 354 (class 1259 OID 10132838)
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
    previous_moderation_state integer CONSTRAINT thredded_post_moderation_rec_previous_moderation_state_not_null NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- TOC entry 355 (class 1259 OID 10132847)
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_post_moderation_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 355
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_post_moderation_records_id_seq OWNED BY public.thredded_post_moderation_records.id;


--
-- TOC entry 356 (class 1259 OID 10132848)
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
-- TOC entry 357 (class 1259 OID 10132860)
-- Name: thredded_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 357
-- Name: thredded_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_posts_id_seq OWNED BY public.thredded_posts.id;


--
-- TOC entry 358 (class 1259 OID 10132861)
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
-- TOC entry 359 (class 1259 OID 10132870)
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 359
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_posts_id_seq OWNED BY public.thredded_private_posts.id;


--
-- TOC entry 360 (class 1259 OID 10132871)
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
-- TOC entry 361 (class 1259 OID 10132883)
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 361
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_topics_id_seq OWNED BY public.thredded_private_topics.id;


--
-- TOC entry 362 (class 1259 OID 10132884)
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
-- TOC entry 363 (class 1259 OID 10132890)
-- Name: thredded_private_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 363
-- Name: thredded_private_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_users_id_seq OWNED BY public.thredded_private_users.id;


--
-- TOC entry 364 (class 1259 OID 10132891)
-- Name: thredded_topic_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_topic_categories (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- TOC entry 365 (class 1259 OID 10132897)
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_topic_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 365
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_topic_categories_id_seq OWNED BY public.thredded_topic_categories.id;


--
-- TOC entry 366 (class 1259 OID 10132898)
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
-- TOC entry 367 (class 1259 OID 10132917)
-- Name: thredded_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 367
-- Name: thredded_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_topics_id_seq OWNED BY public.thredded_topics.id;


--
-- TOC entry 368 (class 1259 OID 10132918)
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
-- TOC entry 369 (class 1259 OID 10132929)
-- Name: thredded_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 369
-- Name: thredded_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_details_id_seq OWNED BY public.thredded_user_details.id;


--
-- TOC entry 370 (class 1259 OID 10132930)
-- Name: thredded_user_messageboard_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_messageboard_preferences (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    messageboard_id bigint NOT NULL,
    follow_topics_on_mention boolean DEFAULT true CONSTRAINT thredded_user_messageboard_pr_follow_topics_on_mention_not_null NOT NULL,
    auto_follow_topics boolean DEFAULT false CONSTRAINT thredded_user_messageboard_preferen_auto_follow_topics_not_null NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 371 (class 1259 OID 10132942)
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_messageboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 371
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_messageboard_preferences_id_seq OWNED BY public.thredded_user_messageboard_preferences.id;


--
-- TOC entry 372 (class 1259 OID 10132943)
-- Name: thredded_user_post_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_post_notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    notified_at timestamp without time zone NOT NULL
);


--
-- TOC entry 373 (class 1259 OID 10132950)
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_post_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 373
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_post_notifications_id_seq OWNED BY public.thredded_user_post_notifications.id;


--
-- TOC entry 374 (class 1259 OID 10132951)
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
-- TOC entry 375 (class 1259 OID 10132962)
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 375
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_preferences_id_seq OWNED BY public.thredded_user_preferences.id;


--
-- TOC entry 376 (class 1259 OID 10132963)
-- Name: thredded_user_private_topic_read_states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_private_topic_read_states (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    postable_id bigint NOT NULL,
    unread_posts_count integer DEFAULT 0 CONSTRAINT thredded_user_private_topic_read_st_unread_posts_count_not_null NOT NULL,
    read_posts_count integer DEFAULT 0 CONSTRAINT thredded_user_private_topic_read_stat_read_posts_count_not_null NOT NULL,
    "integer" integer DEFAULT 0 NOT NULL,
    read_at timestamp without time zone NOT NULL
);


--
-- TOC entry 377 (class 1259 OID 10132976)
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_private_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 377
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_private_topic_read_states_id_seq OWNED BY public.thredded_user_private_topic_read_states.id;


--
-- TOC entry 378 (class 1259 OID 10132977)
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
-- TOC entry 379 (class 1259 OID 10132984)
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_topic_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 379
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_topic_follows_id_seq OWNED BY public.thredded_user_topic_follows.id;


--
-- TOC entry 380 (class 1259 OID 10132985)
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
-- TOC entry 381 (class 1259 OID 10132999)
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 381
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_topic_read_states_id_seq OWNED BY public.thredded_user_topic_read_states.id;


--
-- TOC entry 382 (class 1259 OID 10133000)
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
-- TOC entry 383 (class 1259 OID 10133008)
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tutor_tutorial_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 383
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tutor_tutorial_joins_id_seq OWNED BY public.tutor_tutorial_joins.id;


--
-- TOC entry 384 (class 1259 OID 10133009)
-- Name: tutorial_memberships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tutorial_memberships (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id bigint NOT NULL,
    tutorial_id bigint NOT NULL,
    source_campaign_id uuid,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    lecture_id bigint NOT NULL
);


--
-- TOC entry 385 (class 1259 OID 10133019)
-- Name: tutorials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tutorials (
    id bigint NOT NULL,
    title text NOT NULL,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    capacity integer,
    skip_campaigns boolean DEFAULT false NOT NULL,
    self_materialization_mode integer DEFAULT 0 NOT NULL,
    location character varying
);


--
-- TOC entry 386 (class 1259 OID 10133033)
-- Name: tutorials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tutorials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 386
-- Name: tutorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tutorials_id_seq OWNED BY public.tutorials.id;


--
-- TOC entry 387 (class 1259 OID 10133034)
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
-- TOC entry 388 (class 1259 OID 10133042)
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_favorite_lecture_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 388
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_favorite_lecture_joins_id_seq OWNED BY public.user_favorite_lecture_joins.id;


--
-- TOC entry 389 (class 1259 OID 10133043)
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
-- TOC entry 390 (class 1259 OID 10133050)
-- Name: user_submission_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_submission_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 390
-- Name: user_submission_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_submission_joins_id_seq OWNED BY public.user_submission_joins.id;


--
-- TOC entry 391 (class 1259 OID 10133051)
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
    consents boolean DEFAULT false NOT NULL,
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
    email_for_submission_upload boolean,
    email_for_submission_removal boolean,
    email_for_submission_join boolean,
    email_for_submission_leave boolean,
    email_for_correction_upload boolean,
    email_for_submission_decision boolean,
    name_in_tutorials text,
    archived boolean,
    locked_at timestamp without time zone,
    image_data text,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) without time zone,
    last_sign_in_at timestamp(6) without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    deletion_date date,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    password_policy_version integer DEFAULT 0 NOT NULL,
    password_changed_at timestamp(6) without time zone
);


--
-- TOC entry 392 (class 1259 OID 10133073)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 392
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 393 (class 1259 OID 10133074)
-- Name: vignettes_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_answers (
    id bigint NOT NULL,
    type character varying,
    vignettes_question_id bigint NOT NULL,
    vignettes_slide_id bigint NOT NULL,
    vignettes_user_answer_id bigint NOT NULL,
    text text,
    likert_scale_value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 394 (class 1259 OID 10133085)
-- Name: vignettes_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 394
-- Name: vignettes_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_answers_id_seq OWNED BY public.vignettes_answers.id;


--
-- TOC entry 395 (class 1259 OID 10133086)
-- Name: vignettes_answers_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_answers_options (
    vignettes_answer_id bigint NOT NULL,
    vignettes_option_id bigint NOT NULL
);


--
-- TOC entry 396 (class 1259 OID 10133091)
-- Name: vignettes_codenames; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_codenames (
    id bigint NOT NULL,
    pseudonym character varying,
    user_id bigint,
    lecture_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 397 (class 1259 OID 10133099)
-- Name: vignettes_codenames_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_codenames_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 397
-- Name: vignettes_codenames_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_codenames_id_seq OWNED BY public.vignettes_codenames.id;


--
-- TOC entry 398 (class 1259 OID 10133100)
-- Name: vignettes_completion_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_completion_messages (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 399 (class 1259 OID 10133107)
-- Name: vignettes_completion_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_completion_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5048 (class 0 OID 0)
-- Dependencies: 399
-- Name: vignettes_completion_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_completion_messages_id_seq OWNED BY public.vignettes_completion_messages.id;


--
-- TOC entry 400 (class 1259 OID 10133108)
-- Name: vignettes_info_slides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_info_slides (
    id bigint NOT NULL,
    title character varying NOT NULL,
    vignettes_questionnaire_id bigint NOT NULL,
    icon_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 401 (class 1259 OID 10133118)
-- Name: vignettes_info_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_info_slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5049 (class 0 OID 0)
-- Dependencies: 401
-- Name: vignettes_info_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_info_slides_id_seq OWNED BY public.vignettes_info_slides.id;


--
-- TOC entry 402 (class 1259 OID 10133119)
-- Name: vignettes_info_slides_slides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_info_slides_slides (
    vignettes_info_slide_id bigint NOT NULL,
    vignettes_slide_id bigint NOT NULL
);


--
-- TOC entry 403 (class 1259 OID 10133124)
-- Name: vignettes_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_options (
    id bigint NOT NULL,
    text character varying,
    vignettes_question_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 404 (class 1259 OID 10133133)
-- Name: vignettes_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5050 (class 0 OID 0)
-- Dependencies: 404
-- Name: vignettes_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_options_id_seq OWNED BY public.vignettes_options.id;


--
-- TOC entry 405 (class 1259 OID 10133134)
-- Name: vignettes_questionnaires; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_questionnaires (
    id bigint NOT NULL,
    title character varying,
    lecture_id bigint NOT NULL,
    published boolean,
    editable boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 406 (class 1259 OID 10133144)
-- Name: vignettes_questionnaires_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_questionnaires_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5051 (class 0 OID 0)
-- Dependencies: 406
-- Name: vignettes_questionnaires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_questionnaires_id_seq OWNED BY public.vignettes_questionnaires.id;


--
-- TOC entry 407 (class 1259 OID 10133145)
-- Name: vignettes_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_questions (
    id bigint NOT NULL,
    type character varying,
    question_text text,
    vignettes_slide_id bigint NOT NULL,
    only_integer boolean DEFAULT false,
    min_number numeric(10,0),
    max_number numeric(10,0),
    language character varying DEFAULT 'en'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 408 (class 1259 OID 10133156)
-- Name: vignettes_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5052 (class 0 OID 0)
-- Dependencies: 408
-- Name: vignettes_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_questions_id_seq OWNED BY public.vignettes_questions.id;


--
-- TOC entry 409 (class 1259 OID 10133157)
-- Name: vignettes_slide_statistics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_slide_statistics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    vignettes_answer_id bigint,
    time_on_slide integer,
    total_time_on_slide integer,
    time_on_info_slides text,
    info_slides_access_count text,
    info_slides_first_access_time text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 410 (class 1259 OID 10133166)
-- Name: vignettes_slide_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_slide_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5053 (class 0 OID 0)
-- Dependencies: 410
-- Name: vignettes_slide_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_slide_statistics_id_seq OWNED BY public.vignettes_slide_statistics.id;


--
-- TOC entry 411 (class 1259 OID 10133167)
-- Name: vignettes_slides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_slides (
    id bigint NOT NULL,
    title character varying NOT NULL,
    vignettes_questionnaire_id bigint NOT NULL,
    "position" integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 412 (class 1259 OID 10133178)
-- Name: vignettes_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5054 (class 0 OID 0)
-- Dependencies: 412
-- Name: vignettes_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_slides_id_seq OWNED BY public.vignettes_slides.id;


--
-- TOC entry 413 (class 1259 OID 10133179)
-- Name: vignettes_user_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_user_answers (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    vignettes_questionnaire_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 414 (class 1259 OID 10133187)
-- Name: vignettes_user_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_user_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5055 (class 0 OID 0)
-- Dependencies: 414
-- Name: vignettes_user_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_user_answers_id_seq OWNED BY public.vignettes_user_answers.id;


--
-- TOC entry 415 (class 1259 OID 10133188)
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
-- TOC entry 416 (class 1259 OID 10133196)
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 416
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- TOC entry 417 (class 1259 OID 10133197)
-- Name: vouchers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vouchers (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    role integer NOT NULL,
    lecture_id bigint NOT NULL,
    secure_hash character varying NOT NULL,
    invalidated_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 418 (class 1259 OID 10133209)
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
-- TOC entry 419 (class 1259 OID 10133217)
-- Name: watchlist_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchlist_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 419
-- Name: watchlist_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchlist_entries_id_seq OWNED BY public.watchlist_entries.id;


--
-- TOC entry 420 (class 1259 OID 10133218)
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
-- TOC entry 421 (class 1259 OID 10133228)
-- Name: watchlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 421
-- Name: watchlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchlists_id_seq OWNED BY public.watchlists.id;


--
-- TOC entry 3898 (class 2604 OID 10133229)
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- TOC entry 3899 (class 2604 OID 10133230)
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- TOC entry 3900 (class 2604 OID 10133231)
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- TOC entry 3901 (class 2604 OID 10133232)
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- TOC entry 3902 (class 2604 OID 10133233)
-- Name: annotations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations ALTER COLUMN id SET DEFAULT nextval('public.annotations_id_seq'::regclass);


--
-- TOC entry 3904 (class 2604 OID 10133234)
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- TOC entry 3906 (class 2604 OID 10133235)
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- TOC entry 3907 (class 2604 OID 10133236)
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- TOC entry 3910 (class 2604 OID 10133237)
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- TOC entry 3911 (class 2604 OID 10133238)
-- Name: claims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims ALTER COLUMN id SET DEFAULT nextval('public.claims_id_seq'::regclass);


--
-- TOC entry 3913 (class 2604 OID 10133239)
-- Name: cohorts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohorts ALTER COLUMN id SET DEFAULT nextval('public.cohorts_id_seq'::regclass);


--
-- TOC entry 3917 (class 2604 OID 10133240)
-- Name: commontator_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments ALTER COLUMN id SET DEFAULT nextval('public.commontator_comments_id_seq'::regclass);


--
-- TOC entry 3920 (class 2604 OID 10133241)
-- Name: commontator_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.commontator_subscriptions_id_seq'::regclass);


--
-- TOC entry 3921 (class 2604 OID 10133242)
-- Name: commontator_threads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads ALTER COLUMN id SET DEFAULT nextval('public.commontator_threads_id_seq'::regclass);


--
-- TOC entry 3922 (class 2604 OID 10133243)
-- Name: course_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins ALTER COLUMN id SET DEFAULT nextval('public.course_self_joins_id_seq'::regclass);


--
-- TOC entry 3923 (class 2604 OID 10133244)
-- Name: course_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.course_tag_joins_id_seq'::regclass);


--
-- TOC entry 3924 (class 2604 OID 10133245)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 3926 (class 2604 OID 10133246)
-- Name: division_course_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins ALTER COLUMN id SET DEFAULT nextval('public.division_course_joins_id_seq'::regclass);


--
-- TOC entry 3927 (class 2604 OID 10133247)
-- Name: division_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations ALTER COLUMN id SET DEFAULT nextval('public.division_translations_id_seq'::regclass);


--
-- TOC entry 3928 (class 2604 OID 10133248)
-- Name: divisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions ALTER COLUMN id SET DEFAULT nextval('public.divisions_id_seq'::regclass);


--
-- TOC entry 3929 (class 2604 OID 10133249)
-- Name: editable_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins ALTER COLUMN id SET DEFAULT nextval('public.editable_user_joins_id_seq'::regclass);


--
-- TOC entry 3930 (class 2604 OID 10133250)
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- TOC entry 3932 (class 2604 OID 10133251)
-- Name: flipper_features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_features ALTER COLUMN id SET DEFAULT nextval('public.flipper_features_id_seq'::regclass);


--
-- TOC entry 3933 (class 2604 OID 10133252)
-- Name: flipper_gates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_gates ALTER COLUMN id SET DEFAULT nextval('public.flipper_gates_id_seq'::regclass);


--
-- TOC entry 3934 (class 2604 OID 10133253)
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- TOC entry 3935 (class 2604 OID 10133254)
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- TOC entry 3936 (class 2604 OID 10133255)
-- Name: item_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins ALTER COLUMN id SET DEFAULT nextval('public.item_self_joins_id_seq'::regclass);


--
-- TOC entry 3937 (class 2604 OID 10133256)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3939 (class 2604 OID 10133257)
-- Name: lecture_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins ALTER COLUMN id SET DEFAULT nextval('public.lecture_user_joins_id_seq'::regclass);


--
-- TOC entry 3940 (class 2604 OID 10133258)
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lectures_id_seq'::regclass);


--
-- TOC entry 3946 (class 2604 OID 10133259)
-- Name: lesson_section_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_section_joins_id_seq'::regclass);


--
-- TOC entry 3947 (class 2604 OID 10133260)
-- Name: lesson_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_tag_joins_id_seq'::regclass);


--
-- TOC entry 3948 (class 2604 OID 10133261)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 3949 (class 2604 OID 10133262)
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- TOC entry 3950 (class 2604 OID 10133263)
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- TOC entry 3954 (class 2604 OID 10133264)
-- Name: medium_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.medium_tag_joins_id_seq'::regclass);


--
-- TOC entry 3955 (class 2604 OID 10133265)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3956 (class 2604 OID 10133266)
-- Name: notions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions ALTER COLUMN id SET DEFAULT nextval('public.notions_id_seq'::regclass);


--
-- TOC entry 3957 (class 2604 OID 10133267)
-- Name: program_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations ALTER COLUMN id SET DEFAULT nextval('public.program_translations_id_seq'::regclass);


--
-- TOC entry 3958 (class 2604 OID 10133268)
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- TOC entry 3960 (class 2604 OID 10133269)
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- TOC entry 3961 (class 2604 OID 10133270)
-- Name: redemptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions ALTER COLUMN id SET DEFAULT nextval('public.redemptions_id_seq'::regclass);


--
-- TOC entry 3962 (class 2604 OID 10133271)
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- TOC entry 3972 (class 2604 OID 10133272)
-- Name: registration_student_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages ALTER COLUMN id SET DEFAULT nextval('public.registration_student_messages_id_seq'::regclass);


--
-- TOC entry 3978 (class 2604 OID 10133273)
-- Name: relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations ALTER COLUMN id SET DEFAULT nextval('public.relations_id_seq'::regclass);


--
-- TOC entry 3979 (class 2604 OID 10133274)
-- Name: section_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.section_tag_joins_id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 10133275)
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- TOC entry 3981 (class 2604 OID 10133276)
-- Name: speaker_talk_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins ALTER COLUMN id SET DEFAULT nextval('public.speaker_talk_joins_id_seq'::regclass);


--
-- TOC entry 3982 (class 2604 OID 10133277)
-- Name: subject_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations ALTER COLUMN id SET DEFAULT nextval('public.subject_translations_id_seq'::regclass);


--
-- TOC entry 3983 (class 2604 OID 10133278)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 3986 (class 2604 OID 10133279)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3987 (class 2604 OID 10133280)
-- Name: talk_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.talk_tag_joins_id_seq'::regclass);


--
-- TOC entry 3988 (class 2604 OID 10133281)
-- Name: talks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks ALTER COLUMN id SET DEFAULT nextval('public.talks_id_seq'::regclass);


--
-- TOC entry 3993 (class 2604 OID 10133282)
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- TOC entry 3995 (class 2604 OID 10133283)
-- Name: thredded_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_categories_id_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 10133284)
-- Name: thredded_messageboard_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_groups_id_seq'::regclass);


--
-- TOC entry 3997 (class 2604 OID 10133285)
-- Name: thredded_messageboard_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_notifications_for_followed_topics_id_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 10133286)
-- Name: thredded_messageboard_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_users_id_seq'::regclass);


--
-- TOC entry 4000 (class 2604 OID 10133287)
-- Name: thredded_messageboards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboards_id_seq'::regclass);


--
-- TOC entry 4004 (class 2604 OID 10133288)
-- Name: thredded_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_followed_topics_id_seq'::regclass);


--
-- TOC entry 4006 (class 2604 OID 10133289)
-- Name: thredded_notifications_for_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_private_topics_id_seq'::regclass);


--
-- TOC entry 4008 (class 2604 OID 10133290)
-- Name: thredded_post_moderation_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records ALTER COLUMN id SET DEFAULT nextval('public.thredded_post_moderation_records_id_seq'::regclass);


--
-- TOC entry 4009 (class 2604 OID 10133291)
-- Name: thredded_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_posts_id_seq'::regclass);


--
-- TOC entry 4011 (class 2604 OID 10133292)
-- Name: thredded_private_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_posts_id_seq'::regclass);


--
-- TOC entry 4012 (class 2604 OID 10133293)
-- Name: thredded_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_topics_id_seq'::regclass);


--
-- TOC entry 4014 (class 2604 OID 10133294)
-- Name: thredded_private_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_users_id_seq'::regclass);


--
-- TOC entry 4015 (class 2604 OID 10133295)
-- Name: thredded_topic_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_topic_categories_id_seq'::regclass);


--
-- TOC entry 4016 (class 2604 OID 10133296)
-- Name: thredded_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_topics_id_seq'::regclass);


--
-- TOC entry 4020 (class 2604 OID 10133297)
-- Name: thredded_user_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_details_id_seq'::regclass);


--
-- TOC entry 4024 (class 2604 OID 10133298)
-- Name: thredded_user_messageboard_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_messageboard_preferences_id_seq'::regclass);


--
-- TOC entry 4027 (class 2604 OID 10133299)
-- Name: thredded_user_post_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_post_notifications_id_seq'::regclass);


--
-- TOC entry 4028 (class 2604 OID 10133300)
-- Name: thredded_user_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_preferences_id_seq'::regclass);


--
-- TOC entry 4031 (class 2604 OID 10133301)
-- Name: thredded_user_private_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_private_topic_read_states_id_seq'::regclass);


--
-- TOC entry 4035 (class 2604 OID 10133302)
-- Name: thredded_user_topic_follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_follows_id_seq'::regclass);


--
-- TOC entry 4036 (class 2604 OID 10133303)
-- Name: thredded_user_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_read_states_id_seq'::regclass);


--
-- TOC entry 4040 (class 2604 OID 10133304)
-- Name: tutor_tutorial_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins ALTER COLUMN id SET DEFAULT nextval('public.tutor_tutorial_joins_id_seq'::regclass);


--
-- TOC entry 4042 (class 2604 OID 10133305)
-- Name: tutorials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials ALTER COLUMN id SET DEFAULT nextval('public.tutorials_id_seq'::regclass);


--
-- TOC entry 4045 (class 2604 OID 10133306)
-- Name: user_favorite_lecture_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins ALTER COLUMN id SET DEFAULT nextval('public.user_favorite_lecture_joins_id_seq'::regclass);


--
-- TOC entry 4046 (class 2604 OID 10133307)
-- Name: user_submission_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins ALTER COLUMN id SET DEFAULT nextval('public.user_submission_joins_id_seq'::regclass);


--
-- TOC entry 4047 (class 2604 OID 10133308)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4056 (class 2604 OID 10133309)
-- Name: vignettes_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers ALTER COLUMN id SET DEFAULT nextval('public.vignettes_answers_id_seq'::regclass);


--
-- TOC entry 4057 (class 2604 OID 10133310)
-- Name: vignettes_codenames id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames ALTER COLUMN id SET DEFAULT nextval('public.vignettes_codenames_id_seq'::regclass);


--
-- TOC entry 4058 (class 2604 OID 10133311)
-- Name: vignettes_completion_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages ALTER COLUMN id SET DEFAULT nextval('public.vignettes_completion_messages_id_seq'::regclass);


--
-- TOC entry 4059 (class 2604 OID 10133312)
-- Name: vignettes_info_slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_info_slides ALTER COLUMN id SET DEFAULT nextval('public.vignettes_info_slides_id_seq'::regclass);


--
-- TOC entry 4060 (class 2604 OID 10133313)
-- Name: vignettes_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options ALTER COLUMN id SET DEFAULT nextval('public.vignettes_options_id_seq'::regclass);


--
-- TOC entry 4061 (class 2604 OID 10133314)
-- Name: vignettes_questionnaires id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires ALTER COLUMN id SET DEFAULT nextval('public.vignettes_questionnaires_id_seq'::regclass);


--
-- TOC entry 4063 (class 2604 OID 10133315)
-- Name: vignettes_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions ALTER COLUMN id SET DEFAULT nextval('public.vignettes_questions_id_seq'::regclass);


--
-- TOC entry 4066 (class 2604 OID 10133316)
-- Name: vignettes_slide_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics ALTER COLUMN id SET DEFAULT nextval('public.vignettes_slide_statistics_id_seq'::regclass);


--
-- TOC entry 4067 (class 2604 OID 10133317)
-- Name: vignettes_slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides ALTER COLUMN id SET DEFAULT nextval('public.vignettes_slides_id_seq'::regclass);


--
-- TOC entry 4068 (class 2604 OID 10133318)
-- Name: vignettes_user_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers ALTER COLUMN id SET DEFAULT nextval('public.vignettes_user_answers_id_seq'::regclass);


--
-- TOC entry 4069 (class 2604 OID 10133319)
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- TOC entry 4071 (class 2604 OID 10133320)
-- Name: watchlist_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries ALTER COLUMN id SET DEFAULT nextval('public.watchlist_entries_id_seq'::regclass);


--
-- TOC entry 4072 (class 2604 OID 10133321)
-- Name: watchlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists ALTER COLUMN id SET DEFAULT nextval('public.watchlists_id_seq'::regclass);


--
-- TOC entry 4758 (class 0 OID 10132106)
-- Dependencies: 222
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
7	content	<div><action-text-attachment sgid="eyJfcmFpbHMiOnsiZGF0YSI6ImdpZDovL21hbXBmL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvNj9leHBpcmVzX2luIiwicHVyIjoiYXR0YWNoYWJsZSJ9fQ==--615d6ebbec4c72a2331d1c80b1b8e3cec4d58f16" content-type="image/jpeg" url="http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6NiwicHVyIjoiYmxvYl9pZCJ9fQ==--fd958f5a679f7aa955027eb1aa21be0072bca9cf/tastatur.jpg" filename="tastatur.jpg" filesize="1402645" width="3950" height="1584" presentation="gallery"></action-text-attachment></div>	Vignettes::Slide	5	2025-07-14 15:11:22.019999	2025-07-14 15:11:22.052028
8	content		Vignettes::Slide	6	2025-07-14 15:11:52.251469	2025-07-14 15:11:52.251469
5	content	<div>Bitte durchlesen!</div>	Vignettes::InfoSlide	2	2025-07-14 15:09:29.115796	2025-07-14 15:09:29.115796
6	content	<div>Toller Inhalt.<action-text-attachment sgid="eyJfcmFpbHMiOnsiZGF0YSI6ImdpZDovL21hbXBmL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvNT9leHBpcmVzX2luIiwicHVyIjoiYXR0YWNoYWJsZSJ9fQ==--607d17d7c9e4312b77c26c8f48d3610916e6df8a" content-type="image/png" url="http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6NSwicHVyIjoiYmxvYl9pZCJ9fQ==--4eb9e75cf64bea211cf6c53313b82b6d4d7df597/Screenshot%202025-06-03%20172757.png" filename="Screenshot 2025-06-03 172757.png" filesize="25125" width="708" height="316" presentation="gallery"></action-text-attachment></div>	Vignettes::Slide	4	2025-07-14 15:10:15.628111	2025-07-14 15:10:15.678124
\.


--
-- TOC entry 4760 (class 0 OID 10132118)
-- Dependencies: 224
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
5	embeds	ActionText::RichText	6	5	2025-07-14 15:10:15.637747
6	embeds	ActionText::RichText	7	6	2025-07-14 15:11:22.026505
7	image	ActiveStorage::VariantRecord	3	7	2025-07-14 15:12:18.737584
8	image	ActiveStorage::VariantRecord	4	8	2025-07-14 15:12:42.431624
\.


--
-- TOC entry 4762 (class 0 OID 10132130)
-- Dependencies: 226
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
5	qgzgwq1dc5858lg1wzdhace37i48	Screenshot 2025-06-03 172757.png	image/png	{"identified":true,"width":708,"height":316,"analyzed":true}	development	25125	KCnVXo3CVnb3jSCvOweGeA==	2025-07-14 15:10:08.464248
6	dn46q40a36irllg85e4on7fn990w	tastatur.jpg	image/jpeg	{"identified":true,"width":3950,"height":1584,"analyzed":true}	development	1402645	tfC5FiG/ILRsq1xUkvCG9A==	2025-07-14 15:11:18.915158
7	errb2kvp1x0ftm0q46hbcz8fk4ym	Screenshot 2025-06-03 172757.png	image/png	{"identified":true,"width":708,"height":316,"analyzed":true}	development	22038	gQPC5tgnMHWELlip5A7eNg==	2025-07-14 15:12:18.736021
8	5it2sori3mauv68avn2tuob08zps	tastatur.jpg	image/jpeg	{"identified":true,"width":1024,"height":411,"analyzed":true}	development	74117	ekLcjqhoQ+9o8UsapSq8oA==	2025-07-14 15:12:42.428673
\.


--
-- TOC entry 4764 (class 0 OID 10132142)
-- Dependencies: 228
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
3	5	wjqVtOuFppDd1oEBBMUc2TyD8vk=
4	6	g9oDsuZ2Ke1OimlPvx7V2sj306E=
\.


--
-- TOC entry 4766 (class 0 OID 10132151)
-- Dependencies: 230
-- Data for Name: annotations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.annotations (id, medium_id, user_id, "timestamp", comment, color, category, subcategory, visible_for_teacher, public_comment_id, created_at, updated_at) FROM stdin;
1	9	7	--- !ruby/object:TimeStamp\nmilliseconds: 284\nminutes: 0\nseconds: 11\nhours: 0\n	Die Rechnung muss ich mir mal in Ruhe später ansehen.	#F2711C	0	\N	t	\N	2025-07-14 11:25:30.853804	2025-07-14 11:25:30.853804
2	9	7	--- !ruby/object:TimeStamp\nmilliseconds: 448\nminutes: 0\nseconds: 19\nhours: 0\n	\N	#21BA45	0	\N	f	8	2025-07-14 11:26:44.703541	2025-07-14 11:26:44.716281
3	9	7	--- !ruby/object:TimeStamp\nmilliseconds: 616\nminutes: 0\nseconds: 39\nhours: 0\n	Ganz schöne Sauklaue.	#D05D41	3	\N	t	\N	2025-07-14 11:27:07.83318	2025-07-14 11:27:07.83318
4	9	8	--- !ruby/object:TimeStamp\nmilliseconds: 910\nminutes: 0\nseconds: 24\nhours: 0\n	Hä?	#00B5AD	1	1	t	\N	2025-07-14 11:31:11.663613	2025-07-14 11:31:11.663613
5	13	9	--- !ruby/object:TimeStamp\nmilliseconds: 90\nminutes: 0\nseconds: 16\nhours: 0\n	Ullam ea blanditiis et.	#E03997	3	\N	f	\N	2026-08-26 19:49:18.639611	2026-08-26 19:49:18.639611
6	13	7	--- !ruby/object:TimeStamp\nmilliseconds: 130\nminutes: 0\nseconds: 28\nhours: 0\n	Ipsam esse saepe animi.	#444444	0	\N	f	\N	2026-08-26 19:49:18.671395	2026-08-26 19:49:18.671395
7	13	5	--- !ruby/object:TimeStamp\nmilliseconds: 650\nminutes: 0\nseconds: 14\nhours: 0\n	Blanditiis et aliquid expedita.	#00B5AD	3	\N	f	\N	2026-08-26 19:49:18.68003	2026-08-26 19:49:18.68003
8	47	9	--- !ruby/object:TimeStamp\nmilliseconds: 710\nminutes: 0\nseconds: 16\nhours: 0\n	Fugiat suscipit sapiente nihil.	#999999	2	\N	f	\N	2026-08-26 19:49:18.701429	2026-08-26 19:49:18.701429
9	47	7	--- !ruby/object:TimeStamp\nmilliseconds: 270\nminutes: 0\nseconds: 19\nhours: 0\n	Quos dolores est fuga.	#A333C8	2	\N	f	\N	2026-08-26 19:49:18.714465	2026-08-26 19:49:18.714465
10	47	5	--- !ruby/object:TimeStamp\nmilliseconds: 480\nminutes: 0\nseconds: 19\nhours: 0\n	Iste adipisci et accusamus.	#B5CC18	3	\N	f	\N	2026-08-26 19:49:18.736937	2026-08-26 19:49:18.736937
11	8	9	--- !ruby/object:TimeStamp\nmilliseconds: 670\nminutes: 0\nseconds: 10\nhours: 0\n	In modi excepturi assumenda.	#00B5AD	1	\N	f	\N	2026-08-26 19:49:18.748962	2026-08-26 19:49:18.748962
12	8	7	--- !ruby/object:TimeStamp\nmilliseconds: 310\nminutes: 0\nseconds: 14\nhours: 0\n	Vitae ut fugiat minima.	#444444	2	\N	f	\N	2026-08-26 19:49:18.759546	2026-08-26 19:49:18.759546
13	8	5	--- !ruby/object:TimeStamp\nmilliseconds: 390\nminutes: 0\nseconds: 21\nhours: 0\n	Nihil dolor qui minus.	#2185D0	3	\N	f	\N	2026-08-26 19:49:18.770863	2026-08-26 19:49:18.770863
14	38	9	--- !ruby/object:TimeStamp\nmilliseconds: 870\nminutes: 0\nseconds: 13\nhours: 0\n	Ut esse voluptates ducimus.	#FBBD08	3	\N	f	\N	2026-08-26 19:49:18.781736	2026-08-26 19:49:18.781736
15	38	7	--- !ruby/object:TimeStamp\nmilliseconds: 940\nminutes: 0\nseconds: 39\nhours: 0\n	Praesentium natus nemo aut.	#F2711C	2	\N	f	\N	2026-08-26 19:49:18.794651	2026-08-26 19:49:18.794651
16	38	5	--- !ruby/object:TimeStamp\nmilliseconds: 120\nminutes: 0\nseconds: 22\nhours: 0\n	Eos alias ea quos.	#A333C8	3	\N	f	\N	2026-08-26 19:49:18.812065	2026-08-26 19:49:18.812065
17	9	9	--- !ruby/object:TimeStamp\nmilliseconds: 890\nminutes: 0\nseconds: 33\nhours: 0\n	Qui et quasi earum.	#00B5AD	3	\N	f	\N	2026-08-26 19:49:18.82617	2026-08-26 19:49:18.82617
18	9	5	--- !ruby/object:TimeStamp\nmilliseconds: 150\nminutes: 0\nseconds: 18\nhours: 0\n	Deleniti nesciunt voluptas eum.	#FBBD08	3	\N	f	\N	2026-08-26 19:49:18.912318	2026-08-26 19:49:18.912318
19	10	9	--- !ruby/object:TimeStamp\nmilliseconds: 580\nminutes: 0\nseconds: 36\nhours: 0\n	Nemo sed nulla sequi.	#B5CC18	2	\N	f	\N	2026-08-26 19:49:18.92265	2026-08-26 19:49:18.92265
20	10	7	--- !ruby/object:TimeStamp\nmilliseconds: 70\nminutes: 0\nseconds: 29\nhours: 0\n	Culpa natus quaerat facilis.	#DB2828	3	\N	f	\N	2026-08-26 19:49:18.92994	2026-08-26 19:49:18.92994
21	10	5	--- !ruby/object:TimeStamp\nmilliseconds: 150\nminutes: 0\nseconds: 18\nhours: 0\n	Soluta sapiente earum amet.	#F2711C	0	\N	f	\N	2026-08-26 19:49:18.938258	2026-08-26 19:49:18.938258
22	2	9	--- !ruby/object:TimeStamp\nmilliseconds: 520\nminutes: 0\nseconds: 18\nhours: 0\n	Quia sit expedita aut.	#DB2828	1	\N	f	\N	2026-08-26 19:49:18.947466	2026-08-26 19:49:18.947466
23	2	7	--- !ruby/object:TimeStamp\nmilliseconds: 640\nminutes: 0\nseconds: 36\nhours: 0\n	Sed molestiae quae doloribus.	#B5CC18	3	\N	f	\N	2026-08-26 19:49:18.955423	2026-08-26 19:49:18.955423
24	2	5	--- !ruby/object:TimeStamp\nmilliseconds: 30\nminutes: 0\nseconds: 39\nhours: 0\n	In ut culpa illum.	#6435C9	3	\N	f	\N	2026-08-26 19:49:18.963434	2026-08-26 19:49:18.963434
25	6	9	--- !ruby/object:TimeStamp\nmilliseconds: 30\nminutes: 0\nseconds: 28\nhours: 0\n	Voluptatem tempora provident aut.	#DB2828	3	\N	f	\N	2026-08-26 19:49:18.970774	2026-08-26 19:49:18.970774
26	6	7	--- !ruby/object:TimeStamp\nmilliseconds: 320\nminutes: 0\nseconds: 37\nhours: 0\n	Rerum quia assumenda alias.	#F2711C	1	\N	f	\N	2026-08-26 19:49:18.978667	2026-08-26 19:49:18.978667
27	6	5	--- !ruby/object:TimeStamp\nmilliseconds: 270\nminutes: 0\nseconds: 20\nhours: 0\n	Consequuntur ut aliquam vitae.	#2185D0	0	\N	f	\N	2026-08-26 19:49:18.985313	2026-08-26 19:49:18.985313
28	13	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#DB2828	0	\N	t	\N	2026-08-28 15:08:35.879127	2026-08-28 15:08:35.879127
29	13	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#F2711C	1	1	f	\N	2026-08-28 15:08:35.905503	2026-08-28 15:08:35.905503
30	13	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#FBBD08	1	2	t	\N	2026-08-28 15:08:35.909659	2026-08-28 15:08:35.909659
31	13	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#FBBD08	0	0	t	\N	2026-08-28 15:08:35.913275	2026-08-28 15:08:35.913275
32	13	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#B5CC18	0	0	f	\N	2026-08-28 15:08:35.919042	2026-08-28 15:08:35.919042
33	13	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#21BA45	3	\N	t	\N	2026-08-28 15:08:35.934066	2026-08-28 15:08:35.934066
34	13	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#21BA45	2	\N	t	\N	2026-08-28 15:08:35.94031	2026-08-28 15:08:35.94031
35	47	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#F2711C	1	1	t	\N	2026-08-28 15:08:35.949614	2026-08-28 15:08:35.949614
36	47	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#FBBD08	1	2	f	\N	2026-08-28 15:08:35.954034	2026-08-28 15:08:35.954034
37	47	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#B5CC18	0	0	t	\N	2026-08-28 15:08:35.95822	2026-08-28 15:08:35.95822
38	47	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#B5CC18	3	\N	t	\N	2026-08-28 15:08:35.962612	2026-08-28 15:08:35.962612
39	47	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#21BA45	3	\N	f	\N	2026-08-28 15:08:35.977704	2026-08-28 15:08:35.977704
40	47	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#00B5AD	2	\N	t	\N	2026-08-28 15:08:35.982864	2026-08-28 15:08:35.982864
41	47	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#00B5AD	0	\N	t	\N	2026-08-28 15:08:35.987918	2026-08-28 15:08:35.987918
42	47	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#F2711C	3	\N	f	\N	2026-08-28 15:08:35.997694	2026-08-28 15:08:35.997694
43	47	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Beispiel für die Übung übernehmen.	#F2711C	1	2	f	\N	2026-08-28 15:08:36.001277	2026-08-28 15:08:36.001277
44	38	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#FBBD08	1	2	t	\N	2026-08-28 15:08:36.006341	2026-08-28 15:08:36.006341
45	38	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#B5CC18	0	0	f	\N	2026-08-28 15:08:36.01214	2026-08-28 15:08:36.01214
46	38	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#21BA45	3	\N	t	\N	2026-08-28 15:08:36.016326	2026-08-28 15:08:36.016326
47	38	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#21BA45	2	\N	t	\N	2026-08-28 15:08:36.020384	2026-08-28 15:08:36.020384
48	38	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#00B5AD	2	\N	f	\N	2026-08-28 15:08:36.024673	2026-08-28 15:08:36.024673
49	38	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#2185D0	0	\N	t	\N	2026-08-28 15:08:36.029447	2026-08-28 15:08:36.029447
50	38	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#2185D0	1	1	t	\N	2026-08-28 15:08:36.032788	2026-08-28 15:08:36.032788
51	38	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Beispiel für die Übung übernehmen.	#FBBD08	1	2	f	\N	2026-08-28 15:08:36.047535	2026-08-28 15:08:36.047535
52	38	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#FBBD08	2	\N	f	\N	2026-08-28 15:08:36.051941	2026-08-28 15:08:36.051941
53	8	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#B5CC18	0	0	t	\N	2026-08-28 15:08:36.065894	2026-08-28 15:08:36.065894
54	8	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#21BA45	3	\N	f	\N	2026-08-28 15:08:36.070372	2026-08-28 15:08:36.070372
55	8	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#00B5AD	2	\N	t	\N	2026-08-28 15:08:36.074748	2026-08-28 15:08:36.074748
56	8	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#00B5AD	0	\N	t	\N	2026-08-28 15:08:36.078014	2026-08-28 15:08:36.078014
57	8	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#2185D0	0	\N	f	\N	2026-08-28 15:08:36.082144	2026-08-28 15:08:36.082144
58	8	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#6435C9	1	1	t	\N	2026-08-28 15:08:36.089773	2026-08-28 15:08:36.089773
59	8	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#6435C9	1	2	t	\N	2026-08-28 15:08:36.094364	2026-08-28 15:08:36.094364
60	8	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#B5CC18	2	\N	f	\N	2026-08-28 15:08:36.100522	2026-08-28 15:08:36.100522
61	8	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#B5CC18	3	\N	f	\N	2026-08-28 15:08:36.10426	2026-08-28 15:08:36.10426
62	9	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#21BA45	3	\N	t	\N	2026-08-28 15:08:36.108093	2026-08-28 15:08:36.108093
63	9	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#00B5AD	2	\N	f	\N	2026-08-28 15:08:36.112172	2026-08-28 15:08:36.112172
64	9	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#2185D0	0	\N	t	\N	2026-08-28 15:08:36.125685	2026-08-28 15:08:36.125685
65	9	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#2185D0	1	1	t	\N	2026-08-28 15:08:36.129207	2026-08-28 15:08:36.129207
66	9	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#DB2828	1	2	t	\N	2026-08-28 15:08:36.13539	2026-08-28 15:08:36.13539
67	9	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#21BA45	3	\N	f	\N	2026-08-28 15:08:36.14282	2026-08-28 15:08:36.14282
68	9	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Beispiel für die Übung übernehmen.	#21BA45	1	2	f	\N	2026-08-28 15:08:36.149307	2026-08-28 15:08:36.149307
69	10	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#00B5AD	2	\N	t	\N	2026-08-28 15:08:36.154146	2026-08-28 15:08:36.154146
70	10	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#2185D0	0	\N	f	\N	2026-08-28 15:08:36.158717	2026-08-28 15:08:36.158717
71	10	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#6435C9	1	1	t	\N	2026-08-28 15:08:36.163208	2026-08-28 15:08:36.163208
72	10	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#6435C9	1	2	t	\N	2026-08-28 15:08:36.169102	2026-08-28 15:08:36.169102
73	10	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#DB2828	1	2	f	\N	2026-08-28 15:08:36.17326	2026-08-28 15:08:36.17326
74	10	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#F2711C	0	0	t	\N	2026-08-28 15:08:36.177742	2026-08-28 15:08:36.177742
75	10	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#F2711C	3	\N	t	\N	2026-08-28 15:08:36.181545	2026-08-28 15:08:36.181545
76	10	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Beispiel für die Übung übernehmen.	#00B5AD	1	2	f	\N	2026-08-28 15:08:36.189014	2026-08-28 15:08:36.189014
77	10	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#00B5AD	2	\N	f	\N	2026-08-28 15:08:36.192876	2026-08-28 15:08:36.192876
78	2	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#2185D0	0	\N	t	\N	2026-08-28 15:08:36.207	2026-08-28 15:08:36.207
79	2	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#6435C9	1	1	f	\N	2026-08-28 15:08:36.211443	2026-08-28 15:08:36.211443
80	2	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#DB2828	1	2	t	\N	2026-08-28 15:08:36.215826	2026-08-28 15:08:36.215826
81	2	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#DB2828	0	0	t	\N	2026-08-28 15:08:36.219	2026-08-28 15:08:36.219
82	2	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#F2711C	0	0	f	\N	2026-08-28 15:08:36.222697	2026-08-28 15:08:36.222697
83	2	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#FBBD08	3	\N	t	\N	2026-08-28 15:08:36.226791	2026-08-28 15:08:36.226791
84	2	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#FBBD08	2	\N	t	\N	2026-08-28 15:08:36.230449	2026-08-28 15:08:36.230449
85	2	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#2185D0	2	\N	f	\N	2026-08-28 15:08:36.237051	2026-08-28 15:08:36.237051
86	2	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#2185D0	3	\N	f	\N	2026-08-28 15:08:36.240233	2026-08-28 15:08:36.240233
87	6	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#6435C9	1	1	t	\N	2026-08-28 15:08:36.24411	2026-08-28 15:08:36.24411
88	6	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#DB2828	1	2	f	\N	2026-08-28 15:08:36.248761	2026-08-28 15:08:36.248761
89	6	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#F2711C	0	0	t	\N	2026-08-28 15:08:36.262005	2026-08-28 15:08:36.262005
90	6	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#F2711C	3	\N	t	\N	2026-08-28 15:08:36.265432	2026-08-28 15:08:36.265432
91	6	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#FBBD08	3	\N	f	\N	2026-08-28 15:08:36.271599	2026-08-28 15:08:36.271599
92	6	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#B5CC18	2	\N	t	\N	2026-08-28 15:08:36.278566	2026-08-28 15:08:36.278566
93	6	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#B5CC18	0	\N	t	\N	2026-08-28 15:08:36.282722	2026-08-28 15:08:36.282722
94	6	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#6435C9	3	\N	f	\N	2026-08-28 15:08:36.289908	2026-08-28 15:08:36.289908
95	6	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Beispiel für die Übung übernehmen.	#6435C9	1	2	f	\N	2026-08-28 15:08:36.29486	2026-08-28 15:08:36.29486
96	3	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#DB2828	1	2	t	\N	2026-08-28 15:08:36.299686	2026-08-28 15:08:36.299686
97	3	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#DB2828	0	0	t	\N	2026-08-28 15:08:36.303661	2026-08-28 15:08:36.303661
98	3	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#F2711C	0	0	f	\N	2026-08-28 15:08:36.307902	2026-08-28 15:08:36.307902
99	3	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#F2711C	3	\N	f	\N	2026-08-28 15:08:36.31203	2026-08-28 15:08:36.31203
100	3	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#FBBD08	3	\N	t	\N	2026-08-28 15:08:36.316027	2026-08-28 15:08:36.316027
101	3	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#FBBD08	2	\N	t	\N	2026-08-28 15:08:36.319613	2026-08-28 15:08:36.319613
102	3	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#B5CC18	2	\N	f	\N	2026-08-28 15:08:36.323435	2026-08-28 15:08:36.323435
103	3	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#B5CC18	0	\N	f	\N	2026-08-28 15:08:36.326779	2026-08-28 15:08:36.326779
104	3	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#21BA45	0	\N	t	\N	2026-08-28 15:08:36.338296	2026-08-28 15:08:36.338296
105	3	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#21BA45	1	1	t	\N	2026-08-28 15:08:36.342746	2026-08-28 15:08:36.342746
106	3	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Beispiel für die Übung übernehmen.	#DB2828	1	2	f	\N	2026-08-28 15:08:36.349575	2026-08-28 15:08:36.349575
107	3	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#DB2828	2	\N	f	\N	2026-08-28 15:08:36.352914	2026-08-28 15:08:36.352914
108	7	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#F2711C	0	0	t	\N	2026-08-28 15:08:36.356982	2026-08-28 15:08:36.356982
109	7	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#F2711C	3	\N	t	\N	2026-08-28 15:08:36.360161	2026-08-28 15:08:36.360161
110	7	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#FBBD08	3	\N	f	\N	2026-08-28 15:08:36.363909	2026-08-28 15:08:36.363909
111	7	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#FBBD08	2	\N	f	\N	2026-08-28 15:08:36.366967	2026-08-28 15:08:36.366967
112	7	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#B5CC18	2	\N	t	\N	2026-08-28 15:08:36.37063	2026-08-28 15:08:36.37063
113	7	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#B5CC18	0	\N	t	\N	2026-08-28 15:08:36.374039	2026-08-28 15:08:36.374039
114	7	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#21BA45	0	\N	f	\N	2026-08-28 15:08:36.377876	2026-08-28 15:08:36.377876
115	7	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#21BA45	1	1	f	\N	2026-08-28 15:08:36.388599	2026-08-28 15:08:36.388599
116	7	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#00B5AD	1	1	t	\N	2026-08-28 15:08:36.393337	2026-08-28 15:08:36.393337
117	7	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#00B5AD	1	2	t	\N	2026-08-28 15:08:36.398193	2026-08-28 15:08:36.398193
118	7	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#F2711C	2	\N	f	\N	2026-08-28 15:08:36.405631	2026-08-28 15:08:36.405631
119	7	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#F2711C	3	\N	f	\N	2026-08-28 15:08:36.408944	2026-08-28 15:08:36.408944
120	5	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#FBBD08	3	\N	t	\N	2026-08-28 15:08:36.413627	2026-08-28 15:08:36.413627
121	5	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#FBBD08	2	\N	t	\N	2026-08-28 15:08:36.417325	2026-08-28 15:08:36.417325
122	5	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#B5CC18	2	\N	f	\N	2026-08-28 15:08:36.42132	2026-08-28 15:08:36.42132
123	5	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#B5CC18	0	\N	f	\N	2026-08-28 15:08:36.425198	2026-08-28 15:08:36.425198
124	5	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#21BA45	0	\N	t	\N	2026-08-28 15:08:36.4319	2026-08-28 15:08:36.4319
125	5	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#21BA45	1	1	t	\N	2026-08-28 15:08:36.435186	2026-08-28 15:08:36.435186
126	5	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#00B5AD	1	1	f	\N	2026-08-28 15:08:36.439757	2026-08-28 15:08:36.439757
127	5	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#00B5AD	1	2	f	\N	2026-08-28 15:08:36.442901	2026-08-28 15:08:36.442901
128	5	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#2185D0	1	2	t	\N	2026-08-28 15:08:36.448908	2026-08-28 15:08:36.448908
129	5	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#2185D0	0	0	t	\N	2026-08-28 15:08:36.45278	2026-08-28 15:08:36.45278
130	5	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#FBBD08	3	\N	f	\N	2026-08-28 15:08:36.466681	2026-08-28 15:08:36.466681
131	5	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Beispiel für die Übung übernehmen.	#FBBD08	1	2	f	\N	2026-08-28 15:08:36.470508	2026-08-28 15:08:36.470508
132	14	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#B5CC18	2	\N	t	\N	2026-08-28 15:08:36.47478	2026-08-28 15:08:36.47478
133	14	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#B5CC18	0	\N	t	\N	2026-08-28 15:08:36.477918	2026-08-28 15:08:36.477918
134	14	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#21BA45	0	\N	f	\N	2026-08-28 15:08:36.481712	2026-08-28 15:08:36.481712
135	14	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#21BA45	1	1	f	\N	2026-08-28 15:08:36.485468	2026-08-28 15:08:36.485468
136	14	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#00B5AD	1	1	t	\N	2026-08-28 15:08:36.489384	2026-08-28 15:08:36.489384
137	14	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#00B5AD	1	2	t	\N	2026-08-28 15:08:36.493183	2026-08-28 15:08:36.493183
138	14	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#2185D0	1	2	f	\N	2026-08-28 15:08:36.497353	2026-08-28 15:08:36.497353
139	14	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#2185D0	0	0	f	\N	2026-08-28 15:08:36.500722	2026-08-28 15:08:36.500722
140	14	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#6435C9	0	0	t	\N	2026-08-28 15:08:36.504453	2026-08-28 15:08:36.504453
141	14	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#6435C9	3	\N	t	\N	2026-08-28 15:08:36.507481	2026-08-28 15:08:36.507481
142	14	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Beispiel für die Übung übernehmen.	#B5CC18	1	2	f	\N	2026-08-28 15:08:36.517025	2026-08-28 15:08:36.517025
143	14	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#B5CC18	2	\N	f	\N	2026-08-28 15:08:36.521226	2026-08-28 15:08:36.521226
144	4	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#21BA45	0	\N	t	\N	2026-08-28 15:08:36.526575	2026-08-28 15:08:36.526575
145	4	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#21BA45	1	1	t	\N	2026-08-28 15:08:36.531161	2026-08-28 15:08:36.531161
146	4	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#00B5AD	1	1	f	\N	2026-08-28 15:08:36.53595	2026-08-28 15:08:36.53595
147	4	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#00B5AD	1	2	f	\N	2026-08-28 15:08:36.543888	2026-08-28 15:08:36.543888
148	4	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#2185D0	1	2	t	\N	2026-08-28 15:08:36.554218	2026-08-28 15:08:36.554218
149	4	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#2185D0	0	0	t	\N	2026-08-28 15:08:36.557491	2026-08-28 15:08:36.557491
150	4	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#6435C9	0	0	f	\N	2026-08-28 15:08:36.562565	2026-08-28 15:08:36.562565
151	4	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#6435C9	3	\N	f	\N	2026-08-28 15:08:36.565893	2026-08-28 15:08:36.565893
152	4	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#DB2828	3	\N	t	\N	2026-08-28 15:08:36.570468	2026-08-28 15:08:36.570468
153	4	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#DB2828	2	\N	t	\N	2026-08-28 15:08:36.574136	2026-08-28 15:08:36.574136
154	4	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Voraussetzung fehlt, beim nächsten Mal ergänzen.	#21BA45	2	\N	f	\N	2026-08-28 15:08:36.582115	2026-08-28 15:08:36.582115
155	4	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#21BA45	3	\N	f	\N	2026-08-28 15:08:36.58533	2026-08-28 15:08:36.58533
156	1	9	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Warum darf man die Summe an dieser Stelle vertauschen?	#00B5AD	1	1	t	\N	2026-08-28 15:08:36.589655	2026-08-28 15:08:36.589655
157	1	9	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#00B5AD	1	2	t	\N	2026-08-28 15:08:36.60026	2026-08-28 15:08:36.60026
158	1	5	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Das ist genau die Aufgabe von Blatt 3.	#2185D0	1	2	f	\N	2026-08-28 15:08:36.604509	2026-08-28 15:08:36.604509
159	1	5	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Definition sitzt jetzt.	#2185D0	0	0	f	\N	2026-08-28 15:08:36.607977	2026-08-28 15:08:36.607977
160	1	6	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 25\nhours: 0\n	Definition sitzt jetzt.	#6435C9	0	0	t	\N	2026-08-28 15:08:36.620251	2026-08-28 15:08:36.620251
161	1	6	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 4\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#6435C9	3	\N	t	\N	2026-08-28 15:08:36.624507	2026-08-28 15:08:36.624507
162	1	7	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Ab hier ist die Tafel schlecht zu lesen.	#DB2828	3	\N	f	\N	2026-08-28 15:08:36.62944	2026-08-28 15:08:36.62944
163	1	7	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#DB2828	2	\N	f	\N	2026-08-28 15:08:36.632667	2026-08-28 15:08:36.632667
164	1	8	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 37\nhours: 0\n	Ich glaube, im Index ist ein Dreher.	#F2711C	2	\N	t	\N	2026-08-28 15:08:36.636987	2026-08-28 15:08:36.636987
165	1	8	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 18\nhours: 0\n	Hier nochmal ansehen, der Schritt ging schnell.	#F2711C	0	\N	t	\N	2026-08-28 15:08:36.640853	2026-08-28 15:08:36.640853
166	1	2	--- !ruby/object:TimeStamp\nmilliseconds: 0\nminutes: 0\nseconds: 11\nhours: 0\n	Hier langsamer machen, das geht zu schnell.	#00B5AD	3	\N	f	\N	2026-08-28 15:08:36.647839	2026-08-28 15:08:36.647839
167	1	2	--- !ruby/object:TimeStamp\nmilliseconds: 500\nminutes: 0\nseconds: 31\nhours: 0\n	Beispiel für die Übung übernehmen.	#00B5AD	1	2	f	\N	2026-08-28 15:08:36.650989	2026-08-28 15:08:36.650989
\.


--
-- TOC entry 4768 (class 0 OID 10132167)
-- Dependencies: 232
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, lecture_id, announcer_id, details, created_at, updated_at, on_main_page) FROM stdin;
1	\N	1	<div>Das ist die Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:13:06.111759	2020-07-24 13:13:06.111759	f
2	1	2	<div>Das ist eine Mitteilung für die LA2 in der Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:40:47.403705	2020-07-24 13:40:47.403705	f
3	27	2	<div>Today's session is cancelled due to a corona infection of the speaker.</div>	2022-08-05 14:24:49.642445	2022-08-05 14:24:49.642445	f
4	\N	1	<div>Mampf will be down from 5pm to 7pm this afternoon.</div>	2022-08-05 14:26:46.610612	2022-08-05 14:26:46.610612	f
24	\N	1	Am Freitag ist MaMpf zwischen 8 und 10 Uhr wegen Wartungsarbeiten nicht erreichbar.	2026-08-28 22:57:19.345648	2026-08-28 22:57:19.345648	f
25	\N	1	Die Anmeldung für die Veranstaltungen des kommenden Semesters ist freigeschaltet.	2026-08-28 22:57:19.60307	2026-08-28 22:57:19.60307	f
26	1	2	Die Vorlesung am Donnerstag entfällt.	2026-08-28 22:57:19.805191	2026-08-28 22:57:19.805191	f
27	3	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-28 22:57:19.8605	2026-08-28 22:57:19.8605	f
28	28	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-28 22:57:19.872724	2026-08-28 22:57:19.872724	f
29	29	2	Die Vorlesung am Donnerstag entfällt.	2026-08-28 22:57:19.881768	2026-08-28 22:57:19.881768	f
30	35	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-28 22:57:19.890451	2026-08-28 22:57:19.890451	f
31	36	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-28 22:57:19.89613	2026-08-28 22:57:19.89613	f
32	30	2	Die Vorlesung am Donnerstag entfällt.	2026-08-28 22:57:19.901993	2026-08-28 22:57:19.901993	f
\.


--
-- TOC entry 4770 (class 0 OID 10132177)
-- Dependencies: 234
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
-- TOC entry 4772 (class 0 OID 10132186)
-- Dependencies: 236
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-07-24 13:03:53.932392	2025-07-14 10:42:06.530578
\.


--
-- TOC entry 4773 (class 0 OID 10132194)
-- Dependencies: 237
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments (id, lecture_id, medium_id, title, deadline, created_at, updated_at, accepted_file_type, deletion_date) FROM stdin;
2	1	45	Blatt 5	2026-05-09 16:00:00	2020-11-28 16:54:41.933526	2025-07-14 11:05:22.969571	.pdf	2026-10-15
1	1	12	Blatt 4	2026-05-01 15:50:00	2020-11-28 16:32:30.987364	2025-07-14 11:05:48.488131	.pdf	2026-10-15
3	1	45	Blatt 6	2026-09-03 17:00:00	2022-08-05 14:49:41.819884	2025-07-14 11:06:21.422622	.pdf	2026-10-15
\.


--
-- TOC entry 4775 (class 0 OID 10132207)
-- Dependencies: 239
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chapters (id, lecture_id, title, created_at, updated_at, "position", display_number, hidden, details) FROM stdin;
4	2	Einführung	2020-07-24 16:52:55.533057	2025-07-14 11:12:42.261212	1	\N	\N	\N
6	3	Inzidenzgeometrie	2020-07-24 17:04:34.200541	2026-08-26 19:49:17.36115	2	\N	\N	\N
7	3	Hilbertebenen	2020-07-24 17:04:34.220647	2026-08-26 19:49:17.36115	3	\N	\N	\N
8	3	Euklidische Geometrie	2020-07-24 17:04:34.241839	2026-08-26 19:49:17.36115	4	\N	\N	\N
9	3	Nichteuklidische Geometrie	2020-07-24 17:04:34.263575	2026-08-26 19:49:17.36115	5	\N	\N	\N
5	3	Analytische Geometrie	2020-07-24 17:04:34.178653	2026-08-26 19:49:17.36115	1	\N	\N	\N
1	1	Unitäre Räume und der Spektralsatz	2020-07-24 13:17:57.127274	2026-08-28 15:08:35.075569	1	\N	\N	\N
3	1	Normalformen von Endomorphismen	2020-07-24 13:18:28.913528	2026-08-28 15:08:35.075569	3	\N	\N	\N
2	1	Ringe	2020-07-24 13:18:08.753046	2026-08-28 15:08:35.075569	2	\N	\N	\N
\.


--
-- TOC entry 4777 (class 0 OID 10132216)
-- Dependencies: 241
-- Data for Name: claims; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.claims (id, redemption_id, claimable_type, claimable_id, created_at, updated_at) FROM stdin;
1	1	Talk	2	2025-07-15 12:11:14.690491	2025-07-15 12:11:14.690491
2	2	Talk	2	2025-07-15 12:11:39.225067	2025-07-15 12:11:39.225067
3	3	Talk	3	2025-07-15 12:11:59.002407	2025-07-15 12:11:59.002407
\.


--
-- TOC entry 4779 (class 0 OID 10132228)
-- Dependencies: 243
-- Data for Name: cohort_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cohort_memberships (id, user_id, cohort_id, source_campaign_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4780 (class 0 OID 10132237)
-- Dependencies: 244
-- Data for Name: cohorts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cohorts (id, title, description, capacity, context_type, context_id, propagate_to_lecture, created_at, updated_at, skip_campaigns, self_materialization_mode) FROM stdin;
5	Repeaters	If you failed last year's exam and don't want to go through tutorials again, register here.	15	Lecture	39	t	2026-08-28 15:08:31.671769	2026-08-28 15:08:31.671769	f	0
6	Waitlist	If you failed last year's exam and don't want to go through tutorials again, register here.	20	Lecture	39	f	2026-08-28 15:08:31.68079	2026-08-28 15:08:31.68079	f	0
9	Interest Survey	If you failed last year's exam and don't want to go through tutorials again, register here.	\N	Lecture	31	f	2026-08-28 22:57:16.249963	2026-08-28 22:57:16.249963	f	0
10	Nachrücker	If you failed last year's exam and don't want to go through tutorials again, register here.	5	Lecture	31	f	2026-08-28 22:57:16.449335	2026-08-28 22:57:16.449335	f	0
\.


--
-- TOC entry 4782 (class 0 OID 10132255)
-- Dependencies: 246
-- Data for Name: commontator_comments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_comments (id, thread_id, creator_type, creator_id, editor_type, editor_id, body, deleted_at, cached_votes_up, cached_votes_down, created_at, updated_at, parent_id) FROM stdin;
3	11	User	5	User	5	Mistake in line 3. Please correct!	\N	1	0	2022-08-05 13:39:19.597298	2022-08-05 13:59:15.135944	\N
4	11	User	6	User	6	Yes, it should be: "Let $f : G \\to H$ be a group homomorphism" and not "Let $f : H \\to G$ be a group homomorphism".	\N	0	0	2022-08-05 13:41:25.73298	2022-08-05 14:00:28.792243	3
5	39	User	6	User	2	The script sucks!	2025-07-14 11:22:37.639036	0	0	2022-08-05 13:42:38.790462	2025-07-14 11:22:37.642746	\N
6	10	User	7	\N	\N	Ich versteh das alles nicht.	\N	0	0	2025-07-14 11:23:54.813143	2025-07-14 11:23:54.813143	\N
7	8	User	7	\N	\N	Das scheint alles falsch zu sein.	\N	0	0	2025-07-14 11:24:08.39051	2025-07-14 11:24:08.39051	\N
8	9	User	7	\N	\N	Die Umformung verstehe ich nicht. Können Sie das nochmal erklären?	\N	0	0	2025-07-14 11:26:44.700756	2025-07-14 11:26:44.700756	\N
9	9	User	2	\N	\N	Nö. Ist doch offensichtlich.	\N	0	0	2025-07-14 11:29:09.689494	2025-07-14 11:29:09.689494	8
10	9	User	8	\N	\N	Nicht nett!	\N	0	0	2025-07-14 11:30:38.539342	2025-07-14 11:30:38.539342	9
11	42	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.446174	2026-08-26 19:49:18.446174	\N
12	42	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.450692	2026-08-26 19:49:18.450692	\N
13	42	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.455312	2026-08-26 19:49:18.455312	\N
14	43	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.46482	2026-08-26 19:49:18.46482	\N
15	43	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.468593	2026-08-26 19:49:18.468593	\N
16	43	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.472107	2026-08-26 19:49:18.472107	\N
17	51	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.479974	2026-08-26 19:49:18.479974	\N
18	51	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.483873	2026-08-26 19:49:18.483873	\N
19	51	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.487259	2026-08-26 19:49:18.487259	\N
20	41	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.493502	2026-08-26 19:49:18.493502	\N
21	41	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.49646	2026-08-26 19:49:18.49646	\N
22	41	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.499647	2026-08-26 19:49:18.499647	\N
23	48	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.505541	2026-08-26 19:49:18.505541	\N
24	48	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.521281	2026-08-26 19:49:18.521281	\N
25	48	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.525313	2026-08-26 19:49:18.525313	\N
26	49	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.530682	2026-08-26 19:49:18.530682	\N
27	49	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.534583	2026-08-26 19:49:18.534583	\N
28	49	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.537743	2026-08-26 19:49:18.537743	\N
29	40	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.544763	2026-08-26 19:49:18.544763	\N
30	40	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.548215	2026-08-26 19:49:18.548215	\N
31	40	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.551152	2026-08-26 19:49:18.551152	\N
32	30	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.557962	2026-08-26 19:49:18.557962	\N
33	30	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.561292	2026-08-26 19:49:18.561292	\N
34	30	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.56438	2026-08-26 19:49:18.56438	\N
35	19	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.571442	2026-08-26 19:49:18.571442	\N
36	19	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.575402	2026-08-26 19:49:18.575402	\N
37	19	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.579908	2026-08-26 19:49:18.579908	\N
38	13	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-26 19:49:18.588597	2026-08-26 19:49:18.588597	\N
39	13	User	7	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-26 19:49:18.592824	2026-08-26 19:49:18.592824	\N
40	13	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-26 19:49:18.595948	2026-08-26 19:49:18.595948	\N
41	47	User	9	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-28 15:08:35.833989	2026-08-28 15:08:35.833989	\N
42	47	User	5	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-28 15:08:35.837282	2026-08-28 15:08:35.837282	\N
43	47	User	6	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-28 15:08:35.839273	2026-08-28 15:08:35.839273	\N
\.


--
-- TOC entry 4784 (class 0 OID 10132270)
-- Dependencies: 248
-- Data for Name: commontator_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_subscriptions (id, thread_id, subscriber_type, subscriber_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4786 (class 0 OID 10132282)
-- Dependencies: 250
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
52	Medium	52	\N	\N	\N	2025-07-15 12:12:56.403872	2025-07-15 12:12:56.403872
\.


--
-- TOC entry 4788 (class 0 OID 10132291)
-- Dependencies: 252
-- Data for Name: course_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_self_joins (id, course_id, preceding_course_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4790 (class 0 OID 10132298)
-- Dependencies: 254
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
46	10	46	2025-07-15 12:04:34.672335	2025-07-15 12:04:34.672335
47	10	47	2025-07-15 12:05:40.385413	2025-07-15 12:05:40.385413
48	10	48	2025-07-15 12:08:23.033734	2025-07-15 12:08:23.033734
\.


--
-- TOC entry 4792 (class 0 OID 10132305)
-- Dependencies: 256
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses (id, title, created_at, updated_at, short_title, organizational, organizational_concept, locale, term_independent, image_data) FROM stdin;
4	Helpdesk	2020-08-10 12:54:28.387314	2020-09-07 12:25:44.679002	HD	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	t	{"id":"course/4/image/80c00f71d63f21d92020a936eeecc728.png","storage":"store","metadata":{"filename":"helpdesk.png","size":30867,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/4/image/normalized-aa71fdb577d70fde1083f216ce8563d9.png","storage":"store","metadata":{"filename":"image_processing20200907-1-1w6el95.png","size":18019,"mime_type":"image/png","width":405,"height":270}}}}
6	Analysis 2	2020-08-11 11:44:11.176117	2020-09-07 12:26:21.527624	Ana 2	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	t	{"id":"course/6/image/7d24a01da797ce8669eaab17e3bc45da.png","storage":"store","metadata":{"filename":"ana2.png","size":269867,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/6/image/normalized-afa8ff83b44f99b73400537d57837766.png","storage":"store","metadata":{"filename":"image_processing20200907-1-16ceokm.png","size":69514,"mime_type":"image/png","width":405,"height":270}}}}
3	Einführung in die Geometrie	2020-07-24 17:00:32.17088	2022-08-05 14:04:31.601177	Geo	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	f	{"id":"course/3/image/56a232dfe44377a5ca931c1795aa5961.png","storage":"store","metadata":{"filename":"geo.png","size":73632,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/3/image/normalized-e18ecac8857423650c300b6efe0bf166.png","storage":"store","metadata":{"filename":"image_processing20200907-1-ta0s1a.png","size":28943,"mime_type":"image/png","width":405,"height":270}}}}
2	Algebra 1	2020-07-24 16:51:16.294796	2022-08-05 15:10:44.122858	Alg 1	f	<div>Hier sollte der Text stehen.&nbsp;</div>	\N	f	{"id":"course/2/image/120c081f6b2ff912c6780eb019513ab5.png","storage":"store","metadata":{"filename":"alg1.png","size":45268,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/2/image/normalized-cc8984eb278d816596ba6e04d68bbf05.png","storage":"store","metadata":{"filename":"image_processing20200907-1-p61xj5.png","size":18109,"mime_type":"image/png","width":405,"height":270}}}}
1	Lineare Algebra 2	2020-07-24 13:12:16.486836	2025-07-14 11:01:53.21293	LA 2	t	<div><strong>Code<br></strong>MA5<br><strong><br>Leistungspunkte<br></strong>8 LP<strong><br><br>Turnus<br></strong>jährlich im Sommer<br><strong><br>Inhalt<br></strong>Ringe und Ideale, Moduln und Homomorphismen, Basis und Rang, direkte Summen und Produkte, Tensorprodukt, äußere und symmetrische Potenzen und Determinanten, Moduln über Hauptidealringen, Elementarteilertheorie, Normalformen von Endomorphismen, verallgemeinerte Eigenräume, Jordansche Normalform, nilpotente und halbeinfache Endomorphismen<br><br><strong>Lernziele</strong></div><ul><li>Vertiefende Kenntnisse der Linearen Algebra</li><li>Fähigkeit zum selbständigen Beweisen von Aussagen und Lösen von Aufgaben aus dem Themenbereich und zur schriftlichen und mündlichen Darstellung der Ergebnisse.&nbsp;</li></ul>	\N	f	{"id":"course/1/image/bfb434f11f4a6497215deac1c697070a.png","storage":"store","metadata":{"filename":"la2.png","size":26525,"mime_type":"image/png","width":900,"height":600},"derivatives":{"normalized":{"id":"course/1/image/normalized-311085190da94b42debb1be7692d0c3f.png","storage":"store","metadata":{"filename":"image_processing20200907-1-q5pu9w.png","size":6381,"mime_type":"image/png","width":405,"height":270}}}}
9	Vignetten	2025-07-14 11:37:14.472885	2025-07-14 11:37:14.49565	VI	\N	<!-- BEGIN app/views/courses/_organizational_default.html.erb -->This should be the text.\n<!-- END app/views/courses/_organizational_default.html.erb -->	\N	f	\N
10	Elementare Zahlentheorie	2025-07-15 12:03:01.866319	2025-07-15 12:14:43.289142	EZT	\N	<!-- BEGIN app/views/courses/_organizational_default.html.erb -->This should be the text.\n<!-- END app/views/courses/_organizational_default.html.erb -->	\N	f	\N
11	Demo Roster Seminar	2026-08-26 19:48:20.780537	2026-08-26 19:48:20.780537	DRS	\N	\N	\N	f	\N
12	Campaign Test Seminar	2026-08-26 19:49:06.370491	2026-08-26 19:49:06.370491	CTS	\N	\N	en	f	\N
13	Demo Next Term (with registration)	2026-08-26 19:49:13.971602	2026-08-26 19:49:13.971602	Sansibar oder der letzte Grund 1370	\N	\N	en	f	\N
14	Demo Next Term (subscribe only)	2026-08-26 19:49:14.435126	2026-08-26 19:49:14.435126	Haus ohne Hüter 765	\N	\N	en	f	\N
15	Demo Next Term (unpublished)	2026-08-26 19:49:14.847834	2026-08-26 19:49:14.847834	Der Besuch der alten Dame 8131	\N	\N	en	f	\N
16	Analysis SS 2026	2026-08-26 19:49:15.310798	2026-08-26 19:49:15.310798	Ana SS 2026	\N	\N	\N	f	\N
17	Seminar SS 2026	2026-08-26 19:49:15.438745	2026-08-26 19:49:15.438745	Sem SS 2026	\N	\N	\N	f	\N
18	Analysis WS 2026	2026-08-26 19:49:15.572975	2026-08-26 19:49:15.572975	Ana WS 2026	\N	\N	\N	f	\N
19	Seminar WS 2026	2026-08-26 19:49:15.642195	2026-08-26 19:49:15.642195	Sem WS 2026	\N	\N	\N	f	\N
20	Registration Playground	2026-08-28 15:08:31.157856	2026-08-28 15:08:31.157856	RP	\N	\N	\N	f	\N
\.


--
-- TOC entry 4794 (class 0 OID 10132315)
-- Dependencies: 258
-- Data for Name: division_course_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.division_course_joins (id, division_id, course_id, created_at, updated_at) FROM stdin;
1	1	1	2020-07-24 13:12:16.492837	2020-07-24 13:12:16.492837
2	4	1	2020-07-24 13:16:35.849451	2020-07-24 13:16:35.849451
3	2	2	2020-07-24 16:51:16.300313	2020-07-24 16:51:16.300313
4	2	3	2020-07-24 17:00:32.178423	2020-07-24 17:00:32.178423
5	1	4	2020-08-10 12:54:28.395682	2020-08-10 12:54:28.395682
7	1	6	2020-08-11 11:44:11.181446	2020-08-11 11:44:11.181446
9	2	10	2025-07-15 12:03:01.877605	2025-07-15 12:03:01.877605
\.


--
-- TOC entry 4796 (class 0 OID 10132324)
-- Dependencies: 260
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
-- TOC entry 4798 (class 0 OID 10132335)
-- Dependencies: 262
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.divisions (id, program_id, created_at, updated_at) FROM stdin;
1	1	2020-07-24 13:11:06.845633	2020-07-24 13:11:06.845633
2	1	2020-07-24 13:11:13.366328	2020-07-24 13:11:13.366328
3	2	2020-07-24 13:11:43.555597	2020-07-24 13:11:43.555597
4	2	2020-07-24 13:16:19.425481	2020-07-24 13:16:19.425481
\.


--
-- TOC entry 4800 (class 0 OID 10132342)
-- Dependencies: 264
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
185	9	Course	2
186	10	Course	2
187	52	Medium	5
\.


--
-- TOC entry 4802 (class 0 OID 10132349)
-- Dependencies: 266
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.feedbacks (id, title, feedback, can_contact, user_id, created_at, updated_at) FROM stdin;
1	Beschwerde	Alles Mist!	t	8	2025-07-14 11:29:43.122178	2025-07-14 11:29:43.122178
\.


--
-- TOC entry 4804 (class 0 OID 10132361)
-- Dependencies: 268
-- Data for Name: flipper_features; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flipper_features (id, key, created_at, updated_at) FROM stdin;
1	next_term_banner	2026-08-26 19:49:13.923275	2026-08-26 19:49:13.923275
\.


--
-- TOC entry 4806 (class 0 OID 10132371)
-- Dependencies: 270
-- Data for Name: flipper_gates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flipper_gates (id, feature_key, key, value, created_at, updated_at) FROM stdin;
3	next_term_banner	boolean	true	2026-08-28 22:57:16.517798	2026-08-28 22:57:16.517798
\.


--
-- TOC entry 4808 (class 0 OID 10132382)
-- Dependencies: 272
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
1	testpost-in-der-docker-umgebung	1	Thredded::Topic	\N	2020-07-24 15:13:56.562819
2	neuer-testpost	2	Thredded::Topic	\N	2020-09-03 11:09:21.560051
3	frage-zu-blatt-3-aufgabe-2	3	Thredded::Topic	\N	2026-08-26 19:49:17.161354
4	lerngruppe-fuer-die-klausur	4	Thredded::Topic	\N	2026-08-26 19:49:17.298043
5	frage-zu-blatt-3-aufgabe-2-v-einfuehrung-in-die-geometrie-ss-2026-dozentin	5	Thredded::Topic	\N	2026-08-26 19:49:17.391972
6	lerngruppe-fuer-die-klausur-v-einfuehrung-in-die-geometrie-ss-2026-dozentin	6	Thredded::Topic	\N	2026-08-26 19:49:17.456539
7	frage-zu-blatt-3-aufgabe-2-v-vignetten-ss-2026-dozentin	7	Thredded::Topic	\N	2026-08-26 19:49:17.553975
8	lerngruppe-fuer-die-klausur-v-vignetten-ss-2026-dozentin	8	Thredded::Topic	\N	2026-08-26 19:49:17.614204
9	frage-zu-blatt-3-aufgabe-2-ps-elementare-zahlentheorie-ss-2026-dozentin	9	Thredded::Topic	\N	2026-08-26 19:49:17.710651
10	lerngruppe-fuer-die-klausur-ps-elementare-zahlentheorie-ss-2026-dozentin	10	Thredded::Topic	\N	2026-08-26 19:49:17.760137
11	frage-zu-blatt-3-aufgabe-2-s-demo-roster-seminar-ss-2026-dozentin	11	Thredded::Topic	\N	2026-08-26 19:49:17.839577
12	lerngruppe-fuer-die-klausur-s-demo-roster-seminar-ss-2026-dozentin	12	Thredded::Topic	\N	2026-08-26 19:49:17.900844
13	frage-zu-blatt-3-aufgabe-2-s-campaign-test-seminar-ss-2026-dozentin	13	Thredded::Topic	\N	2026-08-26 19:49:17.978186
14	lerngruppe-fuer-die-klausur-s-campaign-test-seminar-ss-2026-dozentin	14	Thredded::Topic	\N	2026-08-26 19:49:18.039011
15	frage-zu-blatt-3-aufgabe-2-v-analysis-ss-2026-ss-2026-dozentin	15	Thredded::Topic	\N	2026-08-26 19:49:18.116729
16	lerngruppe-fuer-die-klausur-v-analysis-ss-2026-ss-2026-dozentin	16	Thredded::Topic	\N	2026-08-26 19:49:18.178177
17	frage-zu-blatt-3-aufgabe-2-s-seminar-ss-2026-ss-2026-dozentin	17	Thredded::Topic	\N	2026-08-26 19:49:18.251458
18	lerngruppe-fuer-die-klausur-s-seminar-ss-2026-ss-2026-dozentin	18	Thredded::Topic	\N	2026-08-26 19:49:18.302569
\.


--
-- TOC entry 4810 (class 0 OID 10132391)
-- Dependencies: 274
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.imports (id, medium_id, teachable_type, teachable_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4812 (class 0 OID 10132403)
-- Dependencies: 276
-- Data for Name: item_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_self_joins (id, item_id, related_item_id) FROM stdin;
\.


--
-- TOC entry 4814 (class 0 OID 10132410)
-- Dependencies: 278
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
388	\N	self	\N	\N	\N	\N	52	\N	2025-07-15 12:12:56.39715	2025-07-15 12:12:56.39715	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4816 (class 0 OID 10132419)
-- Dependencies: 280
-- Data for Name: lecture_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lecture_memberships (id, user_id, lecture_id, source_campaign_id, created_at, updated_at) FROM stdin;
477d62c7-e80c-4383-8f9c-48b8875f4123	15	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
d08999c8-4bb3-47c3-92fb-47f10b3697a2	17	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
231a3b37-8e3e-42e5-b8ce-cbe60cac15db	18	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
6484dc74-1506-4a69-b48a-71f451f327b3	19	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
38e9dbcb-85a3-4aaa-8e61-2ec81e066483	20	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
9105eb16-200d-439d-8da9-9d211c64fa4c	21	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
604cafe3-4f14-4f85-baa6-d2800fde3ba0	23	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
78a961f7-7b24-46b6-8746-ba11f4e5ea01	28	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
ffc8ac8c-169e-4569-b9e6-d9f9042e054b	35	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
f4f26266-b879-4c44-9906-4f893553dc2b	37	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
ee6d918a-8ed3-44c6-b51d-8760dfdf57a3	14	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
42598c7b-4c72-4d06-8c53-914f7ed5c057	16	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
b7e39d04-b8bc-4356-bb9f-8f3490dd8fd1	27	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
e66f3e57-9898-4862-998c-235065ceef3a	30	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
3884e8f3-0020-452a-a122-bdbcfc463939	31	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
b89df8c8-a345-4feb-a914-804c7f853e9f	34	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
fb87ed9f-4d63-4866-bddc-236f1b9338e2	36	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
877cbdf3-865b-4604-b11a-98fb6f1f8382	44	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
3eb071d6-29f4-4ae1-a61d-426342389ed8	22	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
e5b14f94-214f-40af-b2c7-a5a91cf95978	26	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
981cc090-d3ff-4945-ad56-f2c6b0d0f3eb	33	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
c8076f21-fcd8-45c9-8015-e1f4ae1b5f67	38	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
41afaa1b-c722-4d13-abf8-5be4ae1bda07	39	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
425ffa09-1ff7-4911-8ce9-abd87eb16dc2	40	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
9662a7fa-9587-43d7-9de4-5ec8c14dcbf0	24	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
cc5ddc4a-272d-40d3-803b-ff18395f14e4	25	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
fbff9ddd-cf45-4b7b-99ad-06e4cf4ad4ec	29	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
a495d698-3e85-4bff-8848-726308525c2c	32	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
41194fb5-11ac-4290-9997-aa44c54e9b2d	41	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
a69d1934-6bc5-40a1-ab57-3ffff3bf7f2c	42	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
05e1fd02-7752-4fbf-b122-d7556de50c51	43	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
f1b349b9-b122-4eba-b1f8-b90b8ee3cf97	45	1	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
fdb4a679-e310-4e31-b443-e40473ac42fa	53	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
fa93a59b-768d-4061-bccb-1412db2c53bf	47	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
82cdd85d-767b-4a9e-984e-70233f30dfe1	56	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
1831d295-07ac-40a1-8a8f-52b3921b1618	46	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
dad8f001-3c99-477b-af32-06f6b427017b	57	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
9bb520a0-98b5-40c3-b6b9-2cd07a2ba215	51	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
6f8e2ecb-3445-45be-9a18-4a3fbb6d0d5a	48	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
0859c774-cd9e-4f00-92bf-645b38c910ee	50	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
d958b945-6bcc-442a-a35e-a83733de9487	52	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
dca5c512-5cbc-4f5f-b78f-f5260459a18c	55	30	\N	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
239a9283-1802-4384-b5c1-6cbf5a5bd59f	49	30	\N	2026-08-28 15:08:28.813542	2026-08-28 15:08:28.813542
a83115be-cbf8-4017-9d8e-bda82df7ab77	54	30	\N	2026-08-28 22:57:12.607925	2026-08-28 22:57:12.607925
\.


--
-- TOC entry 4817 (class 0 OID 10132428)
-- Dependencies: 281
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
87	28	5	2025-07-14 11:50:06.67689	2025-07-14 11:50:06.67689
88	28	6	2025-07-14 14:02:21.433853	2025-07-14 14:02:21.433853
89	28	7	2025-07-14 15:04:15.7398	2025-07-14 15:04:15.7398
90	29	5	2025-07-15 12:10:41.761171	2025-07-15 12:10:41.761171
91	29	6	2025-07-15 12:11:39.23344	2025-07-15 12:11:39.23344
92	29	7	2025-07-15 12:11:59.013782	2025-07-15 12:11:59.013782
93	29	2	2025-07-15 12:17:43.535431	2025-07-15 12:17:43.535431
94	1	15	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
95	1	17	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
96	1	18	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
97	1	19	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
98	1	20	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
99	1	21	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
100	1	23	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
101	1	28	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
102	1	35	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
103	1	37	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
104	1	14	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
105	1	16	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
106	1	27	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
107	1	30	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
108	1	31	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
109	1	34	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
110	1	36	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
111	1	44	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
112	1	22	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
113	1	26	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
114	1	33	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
115	1	38	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
116	1	39	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
117	1	40	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
118	1	24	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
119	1	25	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
120	1	29	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
121	1	32	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
122	1	41	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
123	1	42	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
124	1	43	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
125	1	45	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
126	30	2	2026-08-26 19:48:21.061311	2026-08-26 19:48:21.061311
127	30	53	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
128	30	47	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
129	30	56	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
130	30	46	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
131	30	57	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
132	30	51	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
133	30	48	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
134	30	50	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
135	30	52	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
136	30	55	2026-08-26 19:48:05.954904	2026-08-26 19:48:05.954904
137	31	2	2026-08-26 19:49:06.453248	2026-08-26 19:49:06.453248
172	30	49	2026-08-28 15:08:28.813542	2026-08-28 15:08:28.813542
219	30	54	2026-08-28 22:57:12.607925	2026-08-28 22:57:12.607925
\.


--
-- TOC entry 4819 (class 0 OID 10132437)
-- Dependencies: 283
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lectures (id, created_at, updated_at, course_id, term_id, teacher_id, start_chapter, absolute_numbering, start_section, organizational_concept, organizational, muesli, released, content_mode, passphrase, locale, sort, forum_id, comments_disabled, organizational_on_top, disable_teacher_display, submission_max_team_size, submission_grace_period, legacy_seminar, annotations_status, self_materialization_mode, home_intro, home_attachment_data) FROM stdin;
24	2020-08-12 10:25:53.80801	2020-09-07 12:25:30.26636	1	3	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	\N	video	\N	de	lecture	\N	\N	\N	f	\N	15	f	1	0	\N	\N
25	2020-08-12 10:26:24.860043	2020-09-07 12:25:30.26636	1	2	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	video	test	de	lecture	\N	\N	\N	f	\N	15	f	1	0	\N	\N
4	2020-08-10 12:56:57.917228	2022-09-02 16:52:53.227357	4	\N	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	f	all	video		de	special	\N	\N	t	t	\N	15	f	1	0	\N	\N
2	2020-07-24 16:52:00.370572	2025-07-14 11:12:42.279881	2	9	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	2	\N	\N	f	\N	15	f	1	0	\N	\N
27	2022-08-05 13:19:57.44893	2025-07-14 11:12:30.473055	2	10	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Seminar: Do 14-16 Uhr im SR 4 im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Tutorium: n.V. bei <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a></li><li>Vorbesprechung: Mi, 24. Juli 2019, 13.15 Uhr in SR 3&nbsp; im Mathematikon, INF 205</li></ul><div><br></div><div><strong>Vorträge</strong></div><div><br>Im Seminar wird jede TeilnehmerIn einen Vortrag halten. Die Vorträge werden bei der <strong>Vorbesprechung</strong> vergeben. Ob nach der Vorbesprechung noch Themen frei sind, können Sie bei der DozentIn in Erfahrung bringen. Beim Vortrag sollen Sie&nbsp; den Ihnen zugewiesenen Stoff in der Ihnen zugewiesenen Zeit behandeln - und zwar so, dass jeder dass jeder der Anwesenden davon profitiert. Um das zu erreichen, ist es wichtig, dass Sie <em>frühzeitig</em> mit der Vorbereitung Ihres Vortrags beginnen. Außerdem erwarten wir, dass Sie rechtzeitig vor dem Vortrag Kontakt mit <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a> aufnehmen, um Details zum Inhalt und zur Strukturierung des Vortrags zu besprechen. Rechtzeitig wäre beispielsweise zwei Wochen vor Ihrem Vortrag - eine Viertelstunde vor Vortragsbeginn ist nicht rechtzeitig. Sie sollten daraufhin arbeiten, sämtliche Details ihres Vortragsinhaltes gründlich zu verstehen. Auf der anderen Seite ist es wichtig für Ihren Vortrag, dass Sie diesen so gestalten, dass Ihre KommilitonInnen - für die der Inhalt Ihres Vortrages in der Regel neu sein wird - eine Chance haben, diesen auch zu verstehen. Viele nützliche Hinweise zum Halten mathematischer Vorträge finden Sie <a href="http://download.uni-mainz.de/mathematik/Topologie%20und%20Geometrie/Lehre/Wie-halte-ich-einen-Seminarvortrag.pdf">hier</a>.<br><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen des Vortrags notwendig.</li><li>Die Anmeldung zum Vortrag erfolgt über MÜSLI. Die Anmeldung wird am 15. August 2019 geschlossen. Wer danach noch im MÜSLI für das Seminar eingetragen ist, erhält bei Nichtabhalten seines/ihres Vortrags die Note 5 (nicht bestanden).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note des bestandenen Vortrags, bzw. der Note 5.0, wenn der Vortrag nicht bestanden oder nicht abgehalten wurde.</li></ul>	\N	\N	all	video	key	en	seminar	\N	\N	\N	f	\N	15	f	1	0	\N	\N
26	2020-09-01 09:16:03.22769	2025-07-14 11:11:15.58856	2	6	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	\N	video		de	lecture	\N	\N	\N	f	\N	15	f	1	0	<div>Diese Seite ist die Anlaufstelle für <strong>Algebra 1</strong>.</div><div>Fragen zwischendurch stellst Du am besten im Forum — dort antworten auch die Tutorinnen und Tutoren. Wichtige Hinweise erscheinen als Ankündigung ganz oben; wenn Du die Veranstaltung abonniert hast, bekommst Du sie außerdem als Benachrichtigung.</div><div>Das Skript wächst mit der Vorlesung mit. Wo etwas unklar bleibt, hilft oft die verlinkte Wiederholung aus dem vorigen Semester.</div>	\N
33	2026-08-26 19:49:14.818331	2026-08-26 19:49:14.833677	14	6	182	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	<div><strong>Demo Next Term (subscribe only)</strong></div><div>The week runs as usual: two lectures, one exercise class, and a sheet of which half the points admit you to the exam.</div><div>Everything you need for that is here: the notes under “Manuscript”, the recordings under “Lessons” and the sheets under “Exercises”. Office hours are on Tuesdays at 2 pm.</div>	\N
34	2026-08-26 19:49:15.264708	2026-08-26 19:49:15.264708	15	6	183	\N	\N	\N	\N	\N	\N	\N	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	<div>Welcome to <strong>Demo Next Term (unpublished)</strong>!</div><div>This page holds everything the course comes with: the notes, the recording of every session and the exercise sheets. A recording is usually up the evening after the lecture, its chapter marks the day after that.</div><div>Sheets appear on Wednesdays and are handed in by the Friday of the week after — in pairs, here on MaMpf. Your tutor uploads the correction in the same place.</div>	\N
38	2026-08-26 19:49:15.67941	2026-08-26 19:49:15.855981	19	6	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	seminar	\N	\N	\N	f	\N	15	f	1	0	<div><strong>Seminar WS 2026</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
32	2026-08-26 19:49:14.364676	2026-08-26 19:49:14.424701	13	6	181	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	<div><strong>Demo Next Term (with registration)</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
37	2026-08-26 19:49:15.58456	2026-08-26 19:49:15.62085	18	6	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	<div><strong>Analysis WS 2026</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
39	2026-08-28 15:08:31.305681	2026-08-28 15:08:31.641193	20	6	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	<div><strong>Registration Playground</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
31	2026-08-26 19:49:06.390838	2026-08-28 22:57:18.205252	12	6	2	\N	\N	\N	\N	\N	\N	t	video	\N	en	seminar	7	\N	\N	f	\N	15	f	1	0	<div><strong>Campaign Test Seminar</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
1	2020-07-24 13:17:08.173027	2026-08-28 22:57:19.806699	1	5	2	0	t	0	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	1	\N	\N	f	2	15	f	1	0	<div>Willkommen bei <strong>Lineare Algebra 2</strong>!</div><div>Auf dieser Seite findest Du alles zur Veranstaltung: das Skript, die Videos zu den einzelnen Sitzungen und die Übungsblätter. Die Aufzeichnung steht in der Regel am Abend nach der Vorlesung bereit, die Kapitelmarken kommen am Tag darauf dazu.</div><div>Die Übungsblätter erscheinen mittwochs und werden bis zum Freitag der Folgewoche abgegeben — in Zweiergruppen, direkt hier über MaMpf. Deine Tutorin oder Dein Tutor lädt die Korrektur an derselben Stelle wieder hoch.</div>	{"id":"97d461394b4fdf0983e1785c570a1641.pdf","storage":"cache","metadata":{"filename":"shrine20260828-169712-qo13ee.pdf","size":1138473,"mime_type":"application/pdf"}}
3	2020-07-24 17:01:18.424312	2026-08-28 22:57:19.861619	3	5	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	manuscript		de	lecture	3	\N	\N	f	\N	15	f	1	0	<div>Diese Seite ist die Anlaufstelle für <strong>Einführung in die Geometrie</strong>.</div><div>Fragen zwischendurch stellst Du am besten im Forum — dort antworten auch die Tutorinnen und Tutoren. Wichtige Hinweise erscheinen als Ankündigung ganz oben; wenn Du die Veranstaltung abonniert hast, bekommst Du sie außerdem als Benachrichtigung.</div><div>Das Skript wächst mit der Vorlesung mit. Wo etwas unklar bleibt, hilft oft die verlinkte Wiederholung aus dem vorigen Semester.</div>	\N
28	2025-07-14 11:37:42.454732	2026-08-28 22:57:19.873598	9	5	2	\N	\N	\N	<!-- BEGIN app/views/lectures/organizational/_lecture.html.erb --><div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul><!-- END app/views/lectures/organizational/_lecture.html.erb -->	\N	\N	all	video	\N	de	vignettes	4	\N	\N	f	\N	15	f	1	0	<div><strong>Vignetten</strong></div><div>Der Ablauf ist der übliche: zwei Vorlesungen und eine Übung pro Woche, dazu ein Übungsblatt, von dem die Hälfte der Punkte zur Klausurzulassung reicht.</div><div>Alles, was Du dafür brauchst, steht hier: das Skript unter „Manuskript“, die Aufzeichnungen unter „Lektionen“ und die Blätter unter „Übungen“. Die Sprechstunde findet dienstags um 14 Uhr statt.</div>	\N
29	2025-07-15 12:03:30.235477	2026-08-28 22:57:19.882662	10	5	2	\N	\N	\N	<!-- BEGIN app/views/lectures/organizational/_seminar.html.erb --><div><strong>Termine</strong></div><div><br></div><ul><li>Seminar: Do 14-16 Uhr im SR 4 im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Tutorium: n.V. bei <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a></li><li>Vorbesprechung: Mi, 24. Juli 2019, 13.15 Uhr in SR 3&nbsp; im Mathematikon, INF 205</li></ul><div><br></div><div><strong>Vorträge</strong></div><div><br>Im Seminar wird jede TeilnehmerIn einen Vortrag halten. Die Vorträge werden bei der <strong>Vorbesprechung</strong> vergeben. Ob nach der Vorbesprechung noch Themen frei sind, können Sie bei der DozentIn in Erfahrung bringen. Beim Vortrag sollen Sie&nbsp; den Ihnen zugewiesenen Stoff in der Ihnen zugewiesenen Zeit behandeln - und zwar so, dass jeder dass jeder der Anwesenden davon profitiert. Um das zu erreichen, ist es wichtig, dass Sie <em>frühzeitig</em> mit der Vorbereitung Ihres Vortrags beginnen. Außerdem erwarten wir, dass Sie rechtzeitig vor dem Vortrag Kontakt mit <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a> aufnehmen, um Details zum Inhalt und zur Strukturierung des Vortrags zu besprechen. Rechtzeitig wäre beispielsweise zwei Wochen vor Ihrem Vortrag - eine Viertelstunde vor Vortragsbeginn ist nicht rechtzeitig. Sie sollten daraufhin arbeiten, sämtliche Details ihres Vortragsinhaltes gründlich zu verstehen. Auf der anderen Seite ist es wichtig für Ihren Vortrag, dass Sie diesen so gestalten, dass Ihre KommilitonInnen - für die der Inhalt Ihres Vortrages in der Regel neu sein wird - eine Chance haben, diesen auch zu verstehen. Viele nützliche Hinweise zum Halten mathematischer Vorträge finden Sie <a href="http://download.uni-mainz.de/mathematik/Topologie%20und%20Geometrie/Lehre/Wie-halte-ich-einen-Seminarvortrag.pdf">hier</a>.<br><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen des Vortrags notwendig.</li><li>Die Anmeldung zum Vortrag erfolgt über MÜSLI. Die Anmeldung wird am 15. August 2019 geschlossen. Wer danach noch im MÜSLI für das Seminar eingetragen ist, erhält bei Nichtabhalten seines/ihres Vortrags die Note 5 (nicht bestanden).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note des bestandenen Vortrags, bzw. der Note 5.0, wenn der Vortrag nicht bestanden oder nicht abgehalten wurde.</li></ul><!-- END app/views/lectures/organizational/_seminar.html.erb -->	\N	\N	all	video	\N	de	proseminar	5	\N	\N	f	\N	15	f	1	0	<div>Willkommen bei <strong>Elementare Zahlentheorie</strong>!</div><div>Auf dieser Seite findest Du alles zur Veranstaltung: das Skript, die Videos zu den einzelnen Sitzungen und die Übungsblätter. Die Aufzeichnung steht in der Regel am Abend nach der Vorlesung bereit, die Kapitelmarken kommen am Tag darauf dazu.</div><div>Die Übungsblätter erscheinen mittwochs und werden bis zum Freitag der Folgewoche abgegeben — in Zweiergruppen, direkt hier über MaMpf. Deine Tutorin oder Dein Tutor lädt die Korrektur an derselben Stelle wieder hoch.</div>	\N
35	2026-08-26 19:49:15.332297	2026-08-28 22:57:19.891281	16	5	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	8	\N	\N	f	\N	15	f	1	0	<div>This is where <strong>Analysis SS 2026</strong> starts.</div><div>Ask what comes up in the forum; the tutors read it too. Anything that matters is announced at the top of this page, and reaches you as a notification once you have subscribed to the course.</div><div>The notes grow with the lecture. Where something stays unclear, the linked revision from last term often helps.</div>	\N
36	2026-08-26 19:49:15.453156	2026-08-28 22:57:19.898533	17	5	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	seminar	9	\N	\N	f	\N	15	f	1	0	<div><strong>Seminar SS 2026</strong></div><div>The week runs as usual: two lectures, one exercise class, and a sheet of which half the points admit you to the exam.</div><div>Everything you need for that is here: the notes under “Manuscript”, the recordings under “Lessons” and the sheets under “Exercises”. Office hours are on Tuesdays at 2 pm.</div>	\N
30	2026-08-26 19:48:20.910268	2026-08-28 22:57:19.902863	11	5	2	\N	\N	\N	\N	\N	\N	t	video	\N	en	seminar	6	\N	\N	f	\N	15	f	1	0	<div>Welcome to <strong>Demo Roster Seminar</strong>!</div><div>This page holds everything the course comes with: the notes, the recording of every session and the exercise sheets. A recording is usually up the evening after the lecture, its chapter marks the day after that.</div><div>Sheets appear on Wednesdays and are handed in by the Friday of the week after — in pairs, here on MaMpf. Your tutor uploads the correction in the same place.</div>	\N
\.


--
-- TOC entry 4821 (class 0 OID 10132453)
-- Dependencies: 285
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
-- TOC entry 4823 (class 0 OID 10132460)
-- Dependencies: 287
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
-- TOC entry 4825 (class 0 OID 10132467)
-- Dependencies: 289
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lessons (id, date, lecture_id, created_at, updated_at, start_destination, end_destination, details) FROM stdin;
12	2020-10-21	2	2020-07-24 16:53:25.575141	2025-07-14 11:12:42.259389	\N	\N	
1	2026-04-21	1	2020-07-24 13:46:15.926855	2026-08-28 15:08:35.072996	\N	\N	
2	2026-04-23	1	2020-07-24 13:47:35.445993	2026-08-28 15:08:35.072996	\N	\N	
9	2026-05-19	1	2020-07-24 13:52:24.40245	2026-08-28 15:08:35.072996	\N	\N	
10	2026-05-28	1	2020-07-24 13:52:50.724565	2026-08-28 15:08:35.072996	\N	\N	
3	2026-04-28	1	2020-07-24 13:48:26.566012	2026-08-28 15:08:35.072996	\N	\N	
5	2026-05-05	1	2020-07-24 13:49:32.40135	2026-08-28 15:08:35.072996	\N	\N	
4	2026-04-30	1	2020-07-24 13:49:04.235057	2026-08-28 15:08:35.072996	\N	\N	
6	2026-05-07	1	2020-07-24 13:49:56.825933	2026-08-28 15:08:35.072996	\N	\N	
7	2026-05-12	1	2020-07-24 13:50:20.217324	2026-08-28 15:08:35.072996	\N	\N	
8	2026-05-14	1	2020-07-24 13:50:41.367319	2026-08-28 15:08:35.072996	\N	\N	
\.


--
-- TOC entry 4827 (class 0 OID 10132476)
-- Dependencies: 291
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, medium_id, linked_medium_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4829 (class 0 OID 10132483)
-- Dependencies: 293
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.media (id, external_reference_link, created_at, updated_at, sort, description, teachable_type, teachable_id, video_data, screenshot_data, manuscript_data, released, imported_manuscript, hint, parent_id, quiz_graph, level, type, text, independent, locale, solution, question_sort, content, geogebra_data, geogebra_app_name, "position", text_input, released_at, publisher, file_last_edited, external_link_description, annotations_status, answers_count) FROM stdin;
42	\N	2020-09-02 11:47:59.54323	2020-09-02 11:47:59.54323	RandomQuiz	Zufallsquiz Lineare Algebra 2 2020-09-02 11:47:59 +0000	\N	\N	\N	\N	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 17\n  2:\n    :type: Question\n    :id: 18\n  3:\n    :type: Question\n    :id: 35\n  4:\n    :type: Question\n    :id: 20\n  5:\n    :type: Question\n    :id: 37\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N	\N	\N	0	f	\N	\N	\N	\N	-1	0
43	\N	2020-09-03 10:31:05.824135	2020-09-07 12:25:30.264455	Quiz	Testquiz	Course	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 24\nedges: {}\nroot: 1\ndefault_table:\n  1: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N	\N	\N	2	f	2021-09-03 10:31:05.824135	\N	\N	\N	-1	0
51	\N	2022-08-05 14:35:35.026043	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Locked	Lecture	27	\N	\N	\N	locked	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	4	f	2023-08-05 14:35:41.774619	\N	\N	\N	-1	0
41	\N	2020-09-01 14:30:02.64804	2020-09-07 12:25:30.264455	Quiz	Tensorprodukt	Course	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 25\nedges: {}\nroot: 1\ndefault_table:\n  1: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N		\N	\N	1	f	2021-09-01 14:30:02.64804	\N	\N	\N	-1	0
48	\N	2022-08-05 14:32:29.847968	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Unpublished	Lecture	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	1	f	\N	\N	\N	\N	-1	0
49	\N	2022-08-05 14:33:54.439745	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Registered	Lecture	27	\N	\N	\N	users	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	2	f	2023-08-05 14:34:12.32618	\N	\N	\N	-1	0
40	\N	2020-08-10 16:09:44.690925	2022-09-02 16:52:53.2142	LessonMaterial	Vorlesungszusatzvideo	Lecture	4	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N	\N	\N	\N	0	f	2021-08-10 16:09:44.690925	\N	\N	\N	-1	0
13		2020-07-24 15:43:22.719009	2020-09-07 12:25:30.264455	WorkedExample	Frobenius-Normalform	Course	1	{"id":"medium/13/video/a6ea48bef517cd2fb6b2a56e0c30c80a.mp4","storage":"store","metadata":{"filename":"Worked Example.v.la 2.ss17.frobenius-normalform.mp4","size":1556998,"mime_type":"video/mp4","duration":60.024,"bitrate":207516,"resolution":"1620x1080","frame_rate":"20/1"}}	\N	{"id":"medium/13/manuscript/bb2ae64c3a094be17d3b1addb8c43c15.pdf","storage":"store","metadata":{"filename":"Worked Example.V.LA 2.SS17.Frobenius-Normalform.pdf","size":593628,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/13/manuscript/screenshot-1b2c2c1a6b4412914b430ffb21c7231f.png","storage":"store","metadata":{"filename":"image_processing20200724-1-vyhz0w.png","size":36276,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	classic	0	f	2021-07-24 15:43:22.719009	\N	\N	\N	-1	0
47		2022-08-05 14:30:40.379007	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Free	Lecture	27	{"id":"medium/47/video/8fbbda33353ed60cae247f1e5230dcb0.mp4","storage":"store","metadata":{"filename":"WorkedExample.mp4","size":1461881,"mime_type":"video/mp4","duration":53.526,"bitrate":218492,"resolution":"1624x1080","frame_rate":"20/1"}}	{"id":"medium/47/screenshot/a85c6e67b74319702fe1226b2084cbf4.png","storage":"store","metadata":{"filename":"screenshot20220805-1-bony1x.png","size":150856,"mime_type":"image/png","width":750,"height":498},"derivatives":{"normalized":{"id":"medium/47/screenshot/normalized-1ff53c1c3c65c4119a4e0d8f1bf088c4.png","storage":"store","metadata":{"filename":"image_processing20220805-1-43smh4.png","size":31267,"mime_type":"image/png","width":405,"height":269}}}}	\N	all	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N		\N	classic	0	f	2023-08-05 14:31:00.873873	\N	\N	\N	-1	0
30	\N	2020-07-24 16:29:29.670149	2026-08-28 15:08:35.069535	Remark	Wiederholung Ideal ankündigen	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Wir schauen uns nochmal den Begriff des Ideals genauer an.	\N	\N	\N	\N	\N	\N	\N	18	f	2021-07-24 16:29:29.670149	\N	\N	\N	-1	0
38		2020-07-24 16:56:38.642606	2025-07-14 11:12:42.258782	LessonMaterial		Lesson	12	{"id":"medium/38/video/fd2c06150fe18ebfee91b6a73c833be3.mp4","storage":"store","metadata":{"filename":"Lektion.v.alg 1.ws17 18.e1-1.mp4","size":1915023,"mime_type":"video/mp4","duration":60.024,"bitrate":255234,"resolution":"1440x1070","frame_rate":"20/1"}}	\N	{"id":"medium/38/manuscript/66ca156dcebc7c8b2f4497dd65d68a9b.pdf","storage":"store","metadata":{"filename":"Lektion.V.Alg 1.WS17_18.E1.pdf","size":486317,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/38/manuscript/screenshot-e21a2c087545cd09eef48c484fd2081a.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12owwue.png","size":7455,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 16:56:38.642606	\N	\N	\N	-1	0
18		2020-07-24 16:04:00.205352	2026-08-28 15:08:35.069535	Question	Beispiele für Primideale in Z	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche dieser Aussagen sind wahr?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc		\N	\N	6	f	2021-07-24 16:04:00.205352	\N	\N	\N	-1	4
26	\N	2020-07-24 16:20:48.588701	2026-08-28 15:08:35.069535	Question	Ideal in Z minimales Element	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei nun $I \\subset \\mathbb{Z}$ ein Ideal. Um zu zeigen, dass $I$ von einem Element erzeugt wird, müssen wir einen Kandidaten für dieses Element finden. \nAus dem Beispiel davor geht hervor, dass ein sinnvoller Kandidat "die kleinste natürliche Zahl, welche in $I$ liegt" wäre. Formal müssen wir noch ein bisschen aufpassen. Welche der folgenden Aussagen sind wahr?	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	14	f	2021-07-24 16:20:48.588701	\N	\N	\N	-1	4
50	\N	2022-08-05 14:34:37.266105	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Subscribers	Lecture	27	\N	\N	\N	subscribers	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	3	f	2023-08-05 14:34:46.647792	\N	\N	\N	-1	0
46	https://en.wikipedia.org/wiki/Group_(mathematics)	2022-08-05 13:33:25.078745	2025-07-14 11:12:30.462343	Miscellaneous	Groups	Talk	1	\N	\N	{"id":"medium/46/manuscript/16faf389e47502a6662ef2168b02f312.pdf","storage":"store","metadata":{"filename":"empty.pdf","size":1154,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[],"version":null},"derivatives":{"screenshot":{"id":"medium/46/manuscript/screenshot-5842b6968e935e05ee874bdbbffa6918.png","storage":"store","metadata":{"filename":"image_processing20220805-1-hgctcd.png","size":10234,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	<div>Paper with lines.</div>	\N	\N	0	f	2023-08-05 13:36:01.791177	\N	\N	\N	-1	0
32		2020-07-24 16:34:24.982063	2026-08-28 15:08:35.069535	Remark	nächster Versuch	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Damit gehen wir die obige Frage nochmal an.	\N	\N	\N	\N		\N	classic	20	f	2021-07-24 16:34:24.982063	\N	\N	\N	-1	0
39	\N	2020-07-24 17:03:37.785021	2026-08-26 19:49:17.356338	Script	Vorlesungsskript	Lecture	3	\N	\N	{"id":"medium/39/manuscript/02c2ff5ef750d0b3bdbd44dad9b0ceea.pdf","storage":"store","metadata":{"filename":"Skript.V.Geo.SS20.Vorlesungsskript.pdf","size":6388579,"mime_type":"application/pdf","pages":152,"destinations":["chap:Analytische-Geometrie","sect:Affine-Raeume","defn:affiner-Raum","defn:affine-Dimension","bsp:affiner-Standardraum","Aktion-der-Translationen","Vektoraddition","defn:affiner-Unterraum","bsp:affine-Unterraeume","prop:Dimension-affiner-Unterraum","defn:Dimension-affiner-Unterraum","prop:affine-Unterraeume-sind-affine-Raeume","prop:Durchschnitt-und-Verbindungsraum-affin","Durchschnitt","Verbindungsraum-Fall-1","Verbindungsraum-Fall-2","satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","satz:Dimensionsformel-fuer-affine-Unterraeume","defn:parallel-und-windschief","bem:keine-windschiefen-Hyperebenen","bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sect:Affine-Abbildungen","defn:affine-Abbildung","affine-Abbildung","bsp:affine-Abb","prop:Kriterium-fuer-affine-Abbildung","prop:Zusammenhang-affine-und-lineare-Abbildungen","affine-Abbildung-aus-linearer-Abbildung","bsp:affine-Abbildungen-in-der-affinen-Standardebene","W-Bahn","prop:Parallelprojektion","defn:kollinear","defn:n-Eck","defn:Parallelogramm","prop:affine-Abbildungen-erhalten-Parallelogramme","affine-Abbildungen-erhalten-Parallelogramme","Bild-ist-Parallelogramm-1","Bild-ist-Parallelogramm-2","gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht","sect:Affine-Koordinaten","defn:affine-Basis","bsp:Standardbasis-des-affinen-Standardraums","bem:affine-Unabhaengigkeit","satz:affine-Abbildung","defn:affines-Koordinatensystem","defn:Teilverhaeltnis","Teilverhaeltnis","bem:Teilverhaeltnis-in-Standardraum","prop:TV-affine-Invariante","satz:affiner-Strahlensatz","defn:Mittelpunkt","satz:Diagonalensatz","satz:Schwerpunktsatz","defn:Winkel-affin","euklidisches-Winkelmass","Winkelgroesse","defn:Seitenlaengen-und-Innenwinkelgroessen","satz:Kosinussatz","Kosinussatz","coro:Pythagoras","satz:Winkelsumme-im-Dreieck","Winkelsumme-Kosinuswerte","Sinus-des-Winkelmasses","Rechnung-zu-Cauchy-Schwartz","Winkelsumme-Sinuswerte","satz:Sinussatz","coro:Hypothenuse-und-Katheten","sect:Polytope","defn:Polytop","bsp:Durchschnitt-von-Halbraeumen","bem:Rand-eines-Polytops","defn:Ecken-Kanten-Flaechen","bsp:Wuerfel","satz:Polyederformel","defn:Platonischer-Koerper","prop:Polytop","coro:Platonische-Koerper","defn:Aehnlichkeitsabbildung-analytisch","satz:Klassifikation-der-Platonischen-Koerper","sect:Projektive-Raeume","defn:projektiver-Raum","bsp:projektiver-Standardraum","bsp:Einbettungen-projektiver-Standardraeume","defn:projektiver-Unterraum","prop:Durchschnitt-und-Verbindungsraum-projektiv","abb:Boyflaeche","Beschreibung-projektiver-Verbindungsraum","satz:Dimensionsformel-fuer-projektive-Unterraeume","sect:Projektive-Abbildungen","defn:projektive-Abbildung","prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb","bsp:kanonische-Einbettung","defn:Zentralprojektion","Wohldefiniertheit-Zentralprojektion-1","Wohldefiniertheit-Zentralprojektion-2","bem:Beschreibung-Zentralprojektion","prop:Zentralprojektionen-sind-Projektivitaeten","satz:projektiver-Abschluss","bsp:projektiver-Abschluss","ZcapX","dim-ZcapX","sect:Projektive-Koordinaten","defn:projektive-Basis","bsp:kanonische-projektive-Basis","abb:projektive-Standardbasis","lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis","satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph","defn:projektives-Koordinatensystem","defn:Doppelverhaeltnis-projektiv","prop:DV-projektive-Invariante","DV-projektive-Invariante","prop:DV-Berechnung","bem:Zusammenhang-DV-und-TV","satz:projektiver-Desargues","sect:Computergraphik","Transformationen-in-R3","defn:Quader","defn:Kegelstumpf","sect:Uebungsaufgaben-Analytische-Geometrie","aufg:Verbindungsgerade-ist-Gerade","aufg:Eigenschaften-affiner-Abbildungen","aufg:Abbildungsgeometrie","aufg:Tangenssatz","aufg:Heronsche-Formel","aufg:Vergleich-rechtwinkliger-Dreiecke","aufg:Durchschnitt-Gerade-mit-Einheitssphaere","aufg:fast-jede-Projektivitaet-ist-Zentralprojektion","aufg:projektiver-Pappos","chap:Inzidenzgeometrie","sect:Inzidenzebenen","defn:Inzidenzebene","bsp:Inzidenzebene","prop:Geradenschnittpunkt","prop:Kriterium-Punkt-auf-Gerade","prop:Trennung-von-Punkt-und-Gerade","satz:A2(K)-Inzidenzebene","bem:Parallelitaet-in-A2(K)","defn:Isomorphismus-von-Inzidenzebenen","bsp:affine-Ebenen-sind-Inzidenzebenen","sect:affine-Ebenen","defn:Parallelenaxiome","defn:affine-Ebene","bsp:Parallelenaxiome","prop:Parallelitaet-Aequivalenzrelation","defn:Parallelenbueschel-und-Geradenbueschel","bsp:Parallelenbueschel-und-Geradenbueschel","defn:affiner-Isomorphismus","bsp:affiner-Isomorphismus","sect:Uebungsaufgaben-Inzidenzgeometrie","aufg:Isomorphismen-von-Inzidenzebenen","aufg:affine-Ebene-mit-fuenf-Punkten","aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig","chap:Hilbertebenen","sect:Anordnungsaxiome","defn:Anordnungsaxiome","prop:Seiten-einer-Geraden","abb:Geradenseiten","bsp:affine-Standardebene-und-Anordnung","Anordnung-fuer-affine-Standardebenen","Hessesche-Normalform","defn:Lage-auf-verschiedenen-Geradenseiten","prop:Seiten-von-Geraden-und-Punkten","coro:Seiten-eines-Punktes","defn:Anordnung-vieler-Punkte","prop:Anordnung-von-Punkten-auf-Geraden","bem:alternatives-Anordnungsaxiom","defn:strecke-und-strahl","prop:Strecken-und-Strahlen","prop:gerade-vereinigung-von-strahlen","satz:Pasch","sect:Die-Kongruenzaxiome-fuer-Strecken","defn:Kongruenzaxiome-fuer-Strecken","bsp:affine-Standardebene-und-Kongruenzen-von-Strecken","prop:Streckensubtraktion","defn:<-fuer-Strecken","prop:<-fuer-Strecken","sect:Kongruenzaxiome-fuer-Winkel","defn:Winkel","abb:Winkel","prop:winkel","defn:Inneres-eines-Winkels","lemma:im-Inneren-eines-Winkels","defn:Kongruenzaxiome-fuer-Winkel","defn:<-fuer-Winkel","prop:<-fuer-Winkel","defn:Dreieck","bem:dreieck","defn:ebene-Geometrie","defn:Bewegung","bsp:Bewegungen-in-der-affinen-Standardebene","defn:gvB","satz:genug-Bewegung","Voraussetzungen-SWS","bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln","Kongruenz-von-Winkeln-in-der-affinen-Standardebene","sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel","defn:Ergaenzungswinkel-Gegenwinkel","prop:Ergaenzungswinkel","coro:Gegenwinkel","defn:rechter-Winkel","prop:rechter-Winkel","satz:Viertes-euklidisches-Postulat","coro:rechte-Winkel","sect:Orthogonalitaet-und-Parallelitaet","defn:orthogonal","satz:Orthogonale-Gerade","abb:Orthogonale","defn:Wechselwinkel-und-Stufenwinkel","bem:Wechselwinkel-und-Stufenwinkel","satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz","coro:zum-schwachen-wws","coro:Lot-eindeutig","coro:Existenz-von-Parallelen","satz:Parallelenaxiom-in-Hilbertebenen","sect:Kongruenzsatz","prop:eindeutiges-Dreieck","defn:gleichschenkliges-Dreieck","prop:gleichschenkliges-Dreieck","prop:Winkeladdsubtraktion","satz:Kongruenzsatz-fuer-Dreiecke","wsw-1","sect:Mittelsenkrechte-und-Winkelhalbierende","defn:Streckenmittelpunkt","lemma:Mittelpunkt-liegt-zwischen-Randpunkten","satz:Mittelpunkt","Mittelpunkt-1","Mittelpunkt-2","defn:Mittelsenkrechte","prop:Charakterisierung-Mittelsenkrechte","defn:Winkelhalbierende","prop:Existenz-der-Winkelhalbierenden","sect:Innen-und-Aussenwinkel-im-Dreieck","defn:Innenwinkel","prop:schwache-Winkelsumme-im-Dreieck-1","schwache-Winkelsumme-im-Dreieck","satz:Aussenwinkelsatz","satz:grosse-Dreiecksseite-hat-grossen-Winkel","abb:grosse-Dreiecksseite-hat-grossen-Winkel","satz:SSrechterWinkel","sect:Kreise","defn:Kreis","prop:Kreise-haben-genau-einen-Mittelpunkt","satz:Umkreissatz","defn:Hoehe","satz:Hoehensatz","satz:Inkreissatz","sect:Uebungsaufgaben-Hilbertebenen","aufg:Anordnung-von-Punkten-auf-Geraden","aufg:unendlich-viele-Punkte-mit-I-+-A","aufg:Anordnung-Modell-alternativ","aufg:<-fuer-Winkel","aufg:Inneres-bestimmt-den-Winkel","aufg:konvexe-Mengen","aufg:Parallelogramm-synthetisch","aufg:Spiegelungen-in-Hilbertebenen","aufg:Abschaetzung-Abstand-Punkt-Gerade","aufg:Hoehenformel","chap:Euklidische-Geometrie-kurz","sect:Vollstaendigkeitsaxiom","defn:Dedekindschnitt","defn:Vollstaendigkeitsaxiom","bsp:Vollstaendigkeitsaxiom","satz:Archimedisches-Axiom","sect:Euklidische-Ebenen","defn:Euklidsche-Ebene","defn:Isomorphismus-euklidischer-Ebenen","satz:Hauptsatz-fuer-euklidische-Ebenen","prop:Groesse-der-Winkelsumme","sect:Kreise-in-der-euklidischen-Ebene","prop:Durchschnitt-Kreis-Gerade","coro:Tangente","defn:Potenz","satz:Zweisehnensatz","satz:Sehnen-Tangenten-Satz","prop:potenzgerade","satz:Kreis-Kreis-Schnitt-Eigenschaft","coro:Kreis-Kreis-Schnitt-Eigenschaft","satz:Peripheriewinkelsatz","satz:Thales","satz:Sinussatz-Verschaerfung","satz:Eulergleichung","coro:Eulergerade","sect:Inversion-am-Kreis","defn:Inversion-am-Kreis","prop:Inversionen-am-Kreis-sind-bijektiv","prop:Tangentenschnittpunkt-mit-Inversion","prop:Eigenschaften-der-Inversion","defn:verallgemeinerte-Gerade","prop:orthogonale-verallgemeinerte-Geraden","prop:orthogonale-Kreise","prop:Inversion-Kreis-an-Kreis","Schnittpunktanzahl-bleibt-unter-Inversion-erhalten","Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2","Inversion-fuer-verallgemeinerte-Geraden","lemma:Beruehrpunkte-unter-der-Inversion","prop:Inversion-und-Tangenten","defn:verallgemeinerte-Winkelgroesse","satz:Inversion-winkeltreu","defn:Doppelverhaeltnis","prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis","DV-1","DV-2","sect:Uebungsaufgaben-Euklidische-Geometrie","aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl","aufg:Peripheriewinkelsatz","aufg:Tangentenschnittpunkt-mit-Inversion","aufg:gleichseitige-Dreiecke-SHU","chap:Nichteuklidsche-Geometrie","sect:Hyperbolische-Ebenen","defn:Hyperbolische-Ebene","defn:Endpunkte-von-k-Geraden","prop:Kreismodell-ist-Inzidenzebene","I2-hyperbolisch","Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs","prop:Kreismodell-erfuellt-Anordnungsaxiome","hyperbolischer-Abstand","lemma:k-Anordnung-von-k-Punkten","Kongruenz-von-k-Strecken","prop:Kreismodell-erfuellt-Streckenkongruenzaxiome","prop:Kreismodell-erfuellt-Winkelkongruenzaxiome","prop:k-Bewegung-in-den-Ursprung","prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom","prop:hyperbolisches-Axiom-im-Poincaremodell","satz:Kreismodell-ist-hyperbolische-Ebene","sect:Hyperbolische-Geometrie","Additionstheorem-cosh","hyperbolisches-Pythagorasaequivalent","lemma:k-Abstand-zum-Ursprung","lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung","lemma:Norm-im-Klein-Modell","satz:Trigonometrie-rechtwinkliges-k-Dreieck","satz:hyperbolische-Trigonometrie","hyperbolische-Trigonometrie","satz:Winkelsumme-im-k-Dreieck","beta+gamma<pi","sect:Uebungsaufgaben-Nichteuklidische-Geometrie","aufg:hyperbolische-Geradenspiegelung-ist-Bewegung","aufg:Poincarehalbebene"],"bookmarks":[{"destination":"chap:Analytische-Geometrie","sort":"Kapitel","label":"1","description":"Analytische Geometrie","chapter":"1","section":"1.0","subsection":"1.0.0","page":"3","counter":0},{"destination":"sect:Affine-Raeume","sort":"Abschnitt","label":"1.1","description":"Affine Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"3","counter":1},{"destination":"defn:affiner-Raum","sort":"Definition","label":"1.1","description":"affiner Raum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"3","counter":2},{"destination":"defn:affine-Dimension","sort":"Definition","label":"1.2","description":"affine Dimension","chapter":"1","section":"1.1","subsection":"1.1.0","page":"4","counter":3},{"destination":"bsp:affiner-Standardraum","sort":"Beispiel","label":"1.3","description":"affiner Standardraum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"4","counter":4},{"destination":"Aktion-der-Translationen","sort":"Gleichung","label":"1.1","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":5},{"destination":"Vektoraddition","sort":"Gleichung","label":"1.2","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":6},{"destination":"defn:affiner-Unterraum","sort":"Definition","label":"1.4","description":"affiner Unterraum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":7},{"destination":"bsp:affine-Unterraeume","sort":"Beispiel","label":"1.5","description":"affine Unterräume der affinen Standardräume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":8},{"destination":"prop:Dimension-affiner-Unterraum","sort":"Proposition","label":"1.6","description":"Beliebigkeit des Aufpunkts eines affinen Unterraums","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":9},{"destination":"defn:Dimension-affiner-Unterraum","sort":"Definition","label":"1.7","description":"Dimension eines affinen Unterraums","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":10},{"destination":"prop:affine-Unterraeume-sind-affine-Raeume","sort":"Proposition","label":"1.8","description":"affine Unterräume sind affine Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":11},{"destination":"prop:Durchschnitt-und-Verbindungsraum-affin","sort":"Proposition","label":"1.9","description":"Durchschnitt und Verbindungsraum affiner Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":12},{"destination":"Durchschnitt","sort":"Gleichung","label":"1.3","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":13},{"destination":"Verbindungsraum-Fall-1","sort":"Gleichung","label":"1.4","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":14},{"destination":"Verbindungsraum-Fall-2","sort":"Gleichung","label":"1.5","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"8","counter":15},{"destination":"satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sort":"Satz","label":"1.10","description":"Verbindungsraum als Vereinigung von Verbindungsgeraden","chapter":"1","section":"1.1","subsection":"1.1.0","page":"9","counter":16},{"destination":"satz:Dimensionsformel-fuer-affine-Unterraeume","sort":"Satz","label":"1.11","description":"Dimensionsformel für affine Unterräume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"9","counter":17},{"destination":"defn:parallel-und-windschief","sort":"Definition","label":"1.12","description":"parallel und windschief","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":18},{"destination":"bem:keine-windschiefen-Hyperebenen","sort":"Bemerkung","label":"1.13","description":"eine Hyperebene ist zu keinem affinen Unterraum windschief","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":19},{"destination":"bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sort":"Bemerkung","label":"1.14","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":20},{"destination":"sect:Affine-Abbildungen","sort":"Abschnitt","label":"1.2","description":"Affine Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":21},{"destination":"defn:affine-Abbildung","sort":"Definition","label":"1.15","description":"affine Abbildung","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":22},{"destination":"affine-Abbildung","sort":"Gleichung","label":"1.6","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":23},{"destination":"bsp:affine-Abb","sort":"Beispiel","label":"1.16","description":"affine Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":24},{"destination":"prop:Kriterium-fuer-affine-Abbildung","sort":"Proposition","label":"1.17","description":"Kriterium für affine Abbildung","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":25},{"destination":"prop:Zusammenhang-affine-und-lineare-Abbildungen","sort":"Proposition","label":"1.18","description":"Zusammenhang zwischen affinen und linearen Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":26},{"destination":"affine-Abbildung-aus-linearer-Abbildung","sort":"Gleichung","label":"1.7","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"12","counter":27},{"destination":"bsp:affine-Abbildungen-in-der-affinen-Standardebene","sort":"Beispiel","label":"1.19","description":"affine Abbildungen in der affinen Standardebene","chapter":"1","section":"1.2","subsection":"1.2.0","page":"12","counter":28},{"destination":"W-Bahn","sort":"Gleichung","label":"1.8","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"13","counter":29},{"destination":"prop:Parallelprojektion","sort":"Proposition","label":"1.20","description":"Parallelprojektionen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"13","counter":30},{"destination":"defn:kollinear","sort":"Definition","label":"1.21","description":"kollinear","chapter":"1","section":"1.2","subsection":"1.2.0","page":"14","counter":31},{"destination":"defn:n-Eck","sort":"Definition","label":"1.22","description":"n-Eck","chapter":"1","section":"1.2","subsection":"1.2.0","page":"14","counter":32},{"destination":"defn:Parallelogramm","sort":"Definition","label":"1.23","description":"Parallelogramm","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":33},{"destination":"prop:affine-Abbildungen-erhalten-Parallelogramme","sort":"Proposition","label":"1.24","description":"affine Abbildungen erhalten Parallelogramme","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":34},{"destination":"affine-Abbildungen-erhalten-Parallelogramme","sort":"Gleichung","label":"1.9","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":35},{"destination":"Bild-ist-Parallelogramm-1","sort":"Gleichung","label":"1.10","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":36},{"destination":"Bild-ist-Parallelogramm-2","sort":"Gleichung","label":"1.11","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":37},{"destination":"gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht","sort":"Gleichung","label":"1.12","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":38},{"destination":"sect:Affine-Koordinaten","sort":"Abschnitt","label":"1.3","description":"Affine Koordinaten","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":39},{"destination":"defn:affine-Basis","sort":"Definition","label":"1.25","description":"affine Basis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":40},{"destination":"bsp:Standardbasis-des-affinen-Standardraums","sort":"Beispiel","label":"1.26","description":"Standardbasis des affinen Standardraums","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":41},{"destination":"bem:affine-Unabhaengigkeit","sort":"Bemerkung","label":"1.27","description":"affine Unabhängigkeit hängt nicht von der Reihenfolge ab","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":42},{"destination":"satz:affine-Abbildung","sort":"Satz","label":"1.28","description":"Eindeutigkeit der affinen Abbildung mit gegebenen Bildern einer affinen Basis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"17","counter":43},{"destination":"defn:affines-Koordinatensystem","sort":"Definition","label":"1.29","description":"affines Koordinatensystem","chapter":"1","section":"1.3","subsection":"1.3.0","page":"17","counter":44},{"destination":"defn:Teilverhaeltnis","sort":"Definition","label":"1.30","description":"Teilverhältnis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":45},{"destination":"Teilverhaeltnis","sort":"Gleichung","label":"1.13","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":46},{"destination":"bem:Teilverhaeltnis-in-Standardraum","sort":"Bemerkung","label":"1.31","description":"Teilverhältnis im affinen Standardraum","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":47},{"destination":"prop:TV-affine-Invariante","sort":"Proposition","label":"1.32","description":"Teilverhältnis ist affine Invariante","chapter":"1","section":"1.3","subsection":"1.3.0","page":"19","counter":48},{"destination":"satz:affiner-Strahlensatz","sort":"Satz","label":"1.33","description":"Strahlensatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"19","counter":49},{"destination":"defn:Mittelpunkt","sort":"Definition","label":"1.35","description":"Mittelpunkt","chapter":"1","section":"1.3","subsection":"1.3.0","page":"21","counter":50},{"destination":"satz:Diagonalensatz","sort":"Satz","label":"1.36","description":"Diagonalensatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"21","counter":51},{"destination":"satz:Schwerpunktsatz","sort":"Satz","label":"1.37","description":"Schwerpunktsatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"22","counter":52},{"destination":"defn:Winkel-affin","sort":"Definition","label":"1.38","description":"Strecke, Strahl und Winkel","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":53},{"destination":"euklidisches-Winkelmass","sort":"Gleichung","label":"1.14","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":54},{"destination":"Winkelgroesse","sort":"Gleichung","label":"1.15","description":"Winkelgröße","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":55},{"destination":"defn:Seitenlaengen-und-Innenwinkelgroessen","sort":"Definition","label":"1.39","description":"Seitenlängen und Innenwinkelgrößen eines Dreicks","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":56},{"destination":"satz:Kosinussatz","sort":"Satz","label":"1.40","description":"Kosinussatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":57},{"destination":"Kosinussatz","sort":"Gleichung","label":"1.16","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":58},{"destination":"coro:Pythagoras","sort":"Korollar","label":"1.41","description":"Satz des Pythagoras","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":59},{"destination":"satz:Winkelsumme-im-Dreieck","sort":"Satz","label":"1.42","description":"Winkelsumme im Dreieck","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":60},{"destination":"Winkelsumme-Kosinuswerte","sort":"Gleichung","label":"1.17","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":61},{"destination":"Sinus-des-Winkelmasses","sort":"Gleichung","label":"1.18","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":62},{"destination":"Rechnung-zu-Cauchy-Schwartz","sort":"Gleichung","label":"1.19","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":63},{"destination":"Winkelsumme-Sinuswerte","sort":"Gleichung","label":"1.20","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"26","counter":64},{"destination":"satz:Sinussatz","sort":"Satz","label":"1.43","description":"Sinussatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"26","counter":65},{"destination":"coro:Hypothenuse-und-Katheten","sort":"Korollar","label":"1.44","description":"Sinus und Kosinus als Quotient der Katheten durch die Hypothenuse","chapter":"1","section":"1.3","subsection":"1.3.0","page":"27","counter":66},{"destination":"sect:Polytope","sort":"Abschnitt","label":"1.4","description":"Polytope","chapter":"1","section":"1.4","subsection":"1.4.0","page":"27","counter":67},{"destination":"defn:Polytop","sort":"Definition","label":"1.45","description":"Konvexes Polyeder und Polytop","chapter":"1","section":"1.4","subsection":"1.4.0","page":"27","counter":68},{"destination":"bsp:Durchschnitt-von-Halbraeumen","sort":"Beispiel","label":"1.46","description":"Durchschnitte orthogonaler Halbräume","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":69},{"destination":"bem:Rand-eines-Polytops","sort":"Bemerkung","label":"1.47","description":"Rand eines Polytops","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":70},{"destination":"defn:Ecken-Kanten-Flaechen","sort":"Definition","label":"1.48","description":"Ecken, Kanten, Flächen eines Polytops","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":71},{"destination":"bsp:Wuerfel","sort":"Beispiel","label":"1.49","description":"Ecken, Kanten, Flächen beim Würfel","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":72},{"destination":"satz:Polyederformel","sort":"Satz","label":"1.50","description":"Euler'sche Polyederformel","chapter":"1","section":"1.4","subsection":"1.4.0","page":"29","counter":73},{"destination":"defn:Platonischer-Koerper","sort":"Definition","label":"1.51","description":"regelmäßige n-Ecke und Platonische Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":74},{"destination":"prop:Polytop","sort":"Proposition","label":"1.52","description":"Beschreibung regulärer Polytope durch Grad und Anzahl der Kanten pro Ecke","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":75},{"destination":"coro:Platonische-Koerper","sort":"Korollar","label":"1.53","description":"Platonische Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":76},{"destination":"defn:Aehnlichkeitsabbildung-analytisch","sort":"Definition","label":"1.54","description":"Ähnlichkeitsabbildung","chapter":"1","section":"1.4","subsection":"1.4.0","page":"34","counter":77},{"destination":"satz:Klassifikation-der-Platonischen-Koerper","sort":"Satz","label":"1.55","description":"Klassifikation der Platonischen Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"34","counter":78},{"destination":"sect:Projektive-Raeume","sort":"Abschnitt","label":"1.5","description":"Projektive Räume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"36","counter":79},{"destination":"defn:projektiver-Raum","sort":"Definition","label":"1.56","description":"projektiver Raum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"36","counter":80},{"destination":"bsp:projektiver-Standardraum","sort":"Beispiel","label":"1.57","description":"projektiver Standardraum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"37","counter":81},{"destination":"bsp:Einbettungen-projektiver-Standardraeume","sort":"Beispiel","label":"1.58","description":"Veranschaulichung projektiver Standardräume der Dimension 1 und 2 als affine Einbettungen","chapter":"1","section":"1.5","subsection":"1.5.0","page":"37","counter":82},{"destination":"defn:projektiver-Unterraum","sort":"Definition","label":"1.59","description":"projektiver Unterraum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"38","counter":83},{"destination":"prop:Durchschnitt-und-Verbindungsraum-projektiv","sort":"Proposition","label":"1.60","description":"Durchschnitt und Verbindungsraum projektiver Räume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"38","counter":84},{"destination":"abb:Boyflaeche","sort":"Abbildung","label":"1.3","description":"","chapter":"1","section":"1.5","subsection":"1.5.0","page":"39","counter":85},{"destination":"Beschreibung-projektiver-Verbindungsraum","sort":"Gleichung","label":"1.21","description":"","chapter":"1","section":"1.5","subsection":"1.5.0","page":"40","counter":86},{"destination":"satz:Dimensionsformel-fuer-projektive-Unterraeume","sort":"Satz","label":"1.61","description":"Dimensionsformel für projektive Unterräume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"40","counter":87},{"destination":"sect:Projektive-Abbildungen","sort":"Abschnitt","label":"1.6","description":"Projektive Abbildungen","chapter":"1","section":"1.6","subsection":"1.6.0","page":"40","counter":88},{"destination":"defn:projektive-Abbildung","sort":"Definition","label":"1.62","description":"projektive Abbildung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"40","counter":89},{"destination":"prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb","sort":"Proposition","label":"1.63","description":"Zusammenhang zwischen den linearen Abbildungen zu einer gegebenen projektiven Abbildung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"41","counter":90},{"destination":"bsp:kanonische-Einbettung","sort":"Beispiel","label":"1.64","description":"kanonische Einbettung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"41","counter":91},{"destination":"defn:Zentralprojektion","sort":"Definition","label":"1.65","description":"Zentralprojektion","chapter":"1","section":"1.6","subsection":"1.6.0","page":"42","counter":92},{"destination":"Wohldefiniertheit-Zentralprojektion-1","sort":"Gleichung","label":"1.22","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":93},{"destination":"Wohldefiniertheit-Zentralprojektion-2","sort":"Gleichung","label":"1.23","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":94},{"destination":"bem:Beschreibung-Zentralprojektion","sort":"Bemerkung","label":"1.66","description":"alternative Beschreibung des Begriffs der Zentralprojektion","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":95},{"destination":"prop:Zentralprojektionen-sind-Projektivitaeten","sort":"Proposition","label":"1.67","description":"Zentralprojektionen sind Projektivitäten","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":96},{"destination":"satz:projektiver-Abschluss","sort":"Satz","label":"1.68","description":"projektiver Abschluss","chapter":"1","section":"1.6","subsection":"1.6.0","page":"44","counter":97},{"destination":"bsp:projektiver-Abschluss","sort":"Beispiel","label":"1.69","description":"projektiver Abschluss einer Hyperebene in K³","chapter":"1","section":"1.6","subsection":"1.6.0","page":"45","counter":98},{"destination":"ZcapX","sort":"Gleichung","label":"1.24","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"46","counter":99},{"destination":"dim-ZcapX","sort":"Gleichung","label":"1.25","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"47","counter":100},{"destination":"sect:Projektive-Koordinaten","sort":"Abschnitt","label":"1.7","description":"Projektive Koordinaten","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":101},{"destination":"defn:projektive-Basis","sort":"Definition","label":"1.70","description":"projektive Basis","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":102},{"destination":"bsp:kanonische-projektive-Basis","sort":"Beispiel","label":"1.71","description":"Standardbasis des projektiven Standardraums","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":103},{"destination":"abb:projektive-Standardbasis","sort":"Abbildung","label":"1.4","description":"","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":104},{"destination":"lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis","sort":"Lemma","label":"1.72","description":"Zusammenhang zwischen projektiver Basis und Basis des zugrunde liegenden Vektorraums","chapter":"1","section":"1.7","subsection":"1.7.0","page":"50","counter":105},{"destination":"satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph","sort":"Satz","label":"1.73","description":"projektive Räume gleicher Dimension sind kanonisch isomorph","chapter":"1","section":"1.7","subsection":"1.7.0","page":"50","counter":106},{"destination":"defn:projektives-Koordinatensystem","sort":"Definition","label":"1.74","description":"projektives Koordinatensystem","chapter":"1","section":"1.7","subsection":"1.7.0","page":"51","counter":107},{"destination":"defn:Doppelverhaeltnis-projektiv","sort":"Definition","label":"1.75","description":"Doppelverhältnis","chapter":"1","section":"1.7","subsection":"1.7.0","page":"51","counter":108},{"destination":"prop:DV-projektive-Invariante","sort":"Proposition","label":"1.76","description":"Doppelverhältnis ist projektive Invariante","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":109},{"destination":"DV-projektive-Invariante","sort":"Gleichung","label":"1.26","description":"","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":110},{"destination":"prop:DV-Berechnung","sort":"Proposition","label":"1.77","description":"Berechnung des Doppelverhältnisses aus den homogenen Koordinaten","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":111},{"destination":"bem:Zusammenhang-DV-und-TV","sort":"Bemerkung","label":"1.78","description":"Zusammenhang zwischen Doppelverhältnis und bestimmten Teilverhältnissen","chapter":"1","section":"1.7","subsection":"1.7.0","page":"54","counter":112},{"destination":"satz:projektiver-Desargues","sort":"Satz","label":"1.79","description":"projektiver Satz von Desargues","chapter":"1","section":"1.7","subsection":"1.7.0","page":"55","counter":113},{"destination":"sect:Computergraphik","sort":"Abschnitt","label":"1.8","description":"Computergraphik","chapter":"1","section":"1.8","subsection":"1.8.0","page":"58","counter":114},{"destination":"Transformationen-in-R3","sort":"Gleichung","label":"1.27","description":"","chapter":"1","section":"1.8","subsection":"1.8.0","page":"59","counter":115},{"destination":"defn:Quader","sort":"Definition","label":"1.80","description":"Quader","chapter":"1","section":"1.8","subsection":"1.8.0","page":"60","counter":116},{"destination":"defn:Kegelstumpf","sort":"Definition","label":"1.81","description":"Rechteckkegelstumpf","chapter":"1","section":"1.8","subsection":"1.8.0","page":"60","counter":117},{"destination":"sect:Uebungsaufgaben-Analytische-Geometrie","sort":"Abschnitt","label":"1.9","description":"Übungsaufgaben","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":118},{"destination":"aufg:Verbindungsgerade-ist-Gerade","sort":"Aufgabe","label":"1.1","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":119},{"destination":"aufg:Eigenschaften-affiner-Abbildungen","sort":"Aufgabe","label":"1.2","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":120},{"destination":"aufg:Abbildungsgeometrie","sort":"Aufgabe","label":"1.4","description":"Transfer: Abbildungsgeometrie","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":121},{"destination":"aufg:Tangenssatz","sort":"Aufgabe","label":"1.5","description":"Tangenssatz","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":122},{"destination":"aufg:Heronsche-Formel","sort":"Aufgabe","label":"1.6","description":"Heron'sche Formel","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":123},{"destination":"aufg:Vergleich-rechtwinkliger-Dreiecke","sort":"Aufgabe","label":"1.8","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":124},{"destination":"aufg:Durchschnitt-Gerade-mit-Einheitssphaere","sort":"Aufgabe","label":"1.9","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":125},{"destination":"aufg:fast-jede-Projektivitaet-ist-Zentralprojektion","sort":"Aufgabe","label":"1.11","description":"Jede Projektivität, die den Durchschnitt von Start- und Zielraum punktweise festlässt, ist eine Zentralprojektion","chapter":"1","section":"1.9","subsection":"1.9.0","page":"63","counter":126},{"destination":"aufg:projektiver-Pappos","sort":"Aufgabe","label":"1.13","description":"projektiver Satz von Pappos","chapter":"1","section":"1.9","subsection":"1.9.0","page":"63","counter":127},{"destination":"chap:Inzidenzgeometrie","sort":"Kapitel","label":"2","description":"Inzidenzgeometrie","chapter":"2","section":"2.0","subsection":"2.0.0","page":"64","counter":128},{"destination":"sect:Inzidenzebenen","sort":"Abschnitt","label":"2.1","description":"Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"64","counter":129},{"destination":"defn:Inzidenzebene","sort":"Definition","label":"2.1","description":"Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":130},{"destination":"bsp:Inzidenzebene","sort":"Beispiel","label":"2.2","description":"Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":131},{"destination":"prop:Geradenschnittpunkt","sort":"Proposition","label":"2.3","description":"nichtparallele Geraden besitzen eindeutigen Schnittpunkt","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":132},{"destination":"prop:Kriterium-Punkt-auf-Gerade","sort":"Proposition","label":"2.4","description":"Kriterium dafür, ob ein Punkt auf einer Geraden liegt","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":133},{"destination":"prop:Trennung-von-Punkt-und-Gerade","sort":"Proposition","label":"2.5","description":"Trennung von Punkt und Gerade","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":134},{"destination":"satz:A2(K)-Inzidenzebene","sort":"Satz","label":"2.6","description":"affine Standardebene ist Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":135},{"destination":"bem:Parallelitaet-in-A2(K)","sort":"Bemerkung","label":"2.7","description":"Parallelitätsbegriffe in der affinen Standardebene stimmen überein","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":136},{"destination":"defn:Isomorphismus-von-Inzidenzebenen","sort":"Definition","label":"2.8","description":"Isomorphismus von Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":137},{"destination":"bsp:affine-Ebenen-sind-Inzidenzebenen","sort":"Beispiel","label":"2.9","description":"affine Ebenen (analytisch definiert) sind Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":138},{"destination":"sect:affine-Ebenen","sort":"Abschnitt","label":"2.2","description":"Affine Ebenen","chapter":"2","section":"2.2","subsection":"2.2.0","page":"67","counter":139},{"destination":"defn:Parallelenaxiome","sort":"Definition","label":"2.10","description":"Parallelenaxiom","chapter":"2","section":"2.2","subsection":"2.2.0","page":"67","counter":140},{"destination":"defn:affine-Ebene","sort":"Definition","label":"2.11","description":"affine Ebene","chapter":"2","section":"2.2","subsection":"2.2.0","page":"68","counter":141},{"destination":"bsp:Parallelenaxiome","sort":"Beispiel","label":"2.12","description":"Parallelenaxiom","chapter":"2","section":"2.2","subsection":"2.2.0","page":"68","counter":142},{"destination":"prop:Parallelitaet-Aequivalenzrelation","sort":"Proposition","label":"2.13","description":"Parallelität ist Äquivalenzrelation","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":143},{"destination":"defn:Parallelenbueschel-und-Geradenbueschel","sort":"Definition","label":"2.14","description":"Parallelenbüschel und Geradenbüschel","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":144},{"destination":"bsp:Parallelenbueschel-und-Geradenbueschel","sort":"Beispiel","label":"2.15","description":"Parallelenbüschel und Geradenbüschel in der affinen Standardebene","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":145},{"destination":"defn:affiner-Isomorphismus","sort":"Definition","label":"2.16","description":"affiner Isomorphismus","chapter":"2","section":"2.2","subsection":"2.2.0","page":"70","counter":146},{"destination":"bsp:affiner-Isomorphismus","sort":"Beispiel","label":"2.17","description":"affiner Isomorphismus","chapter":"2","section":"2.2","subsection":"2.2.0","page":"70","counter":147},{"destination":"sect:Uebungsaufgaben-Inzidenzgeometrie","sort":"Abschnitt","label":"2.3","description":"Übungsaufgaben","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":148},{"destination":"aufg:Isomorphismen-von-Inzidenzebenen","sort":"Aufgabe","label":"2.2","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":149},{"destination":"aufg:affine-Ebene-mit-fuenf-Punkten","sort":"Aufgabe","label":"2.3","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":150},{"destination":"aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig","sort":"Aufgabe","label":"2.4","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":151},{"destination":"chap:Hilbertebenen","sort":"Kapitel","label":"3","description":"Hilbertebenen","chapter":"3","section":"3.0","subsection":"3.0.0","page":"72","counter":152},{"destination":"sect:Anordnungsaxiome","sort":"Abschnitt","label":"3.1","description":"Die Anordnungsaxiome","chapter":"3","section":"3.1","subsection":"3.1.0","page":"72","counter":153},{"destination":"defn:Anordnungsaxiome","sort":"Definition","label":"3.1","description":"Anordnungsaxiome","chapter":"3","section":"3.1","subsection":"3.1.0","page":"72","counter":154},{"destination":"prop:Seiten-einer-Geraden","sort":"Proposition","label":"3.2","description":"Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"73","counter":155},{"destination":"abb:Geradenseiten","sort":"Abbildung","label":"3.1","description":"Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"73","counter":156},{"destination":"bsp:affine-Standardebene-und-Anordnung","sort":"Beispiel","label":"3.3","description":"Anordnung in der affinen Standardebene","chapter":"3","section":"3.1","subsection":"3.1.0","page":"74","counter":157},{"destination":"Anordnung-fuer-affine-Standardebenen","sort":"Gleichung","label":"3.1","description":"","chapter":"3","section":"3.1","subsection":"3.1.0","page":"74","counter":158},{"destination":"Hessesche-Normalform","sort":"Gleichung","label":"3.2","description":"Hesse'sche Normalform","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":159},{"destination":"defn:Lage-auf-verschiedenen-Geradenseiten","sort":"Definition","label":"3.4","description":"Lage auf verschiedenen Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":160},{"destination":"prop:Seiten-von-Geraden-und-Punkten","sort":"Proposition","label":"3.5","description":"Seiten von Geraden und Punkten","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":161},{"destination":"coro:Seiten-eines-Punktes","sort":"Korollar","label":"3.6","description":"Lage auf gleicher Seite ist Äquivalenzrelation","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":162},{"destination":"defn:Anordnung-vieler-Punkte","sort":"Definition","label":"3.7","description":"Erweiterung des Anordnungsbegriffs auf beliebig viele kollineare Punkte","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":163},{"destination":"prop:Anordnung-von-Punkten-auf-Geraden","sort":"Proposition","label":"3.8","description":"Anordnungen von Punkten auf Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":164},{"destination":"bem:alternatives-Anordnungsaxiom","sort":"Bemerkung","label":"3.9","description":"alternatives Anordnungsaxiom (A'2)","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":165},{"destination":"defn:strecke-und-strahl","sort":"Definition","label":"3.10","description":"Strecke und Strahl","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":166},{"destination":"prop:Strecken-und-Strahlen","sort":"Proposition","label":"3.11","description":"Strecken und Strahlen","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":167},{"destination":"prop:gerade-vereinigung-von-strahlen","sort":"Proposition","label":"3.12","description":"Gerade als Vereinigung von Strahlen","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":168},{"destination":"satz:Pasch","sort":"Satz","label":"3.13","description":"Satz von Pasch","chapter":"3","section":"3.1","subsection":"3.1.0","page":"78","counter":169},{"destination":"sect:Die-Kongruenzaxiome-fuer-Strecken","sort":"Abschnitt","label":"3.2","description":"Die Kongruenzaxiome für Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"78","counter":170},{"destination":"defn:Kongruenzaxiome-fuer-Strecken","sort":"Definition","label":"3.14","description":"Kongruenzaxiome für Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"78","counter":171},{"destination":"bsp:affine-Standardebene-und-Kongruenzen-von-Strecken","sort":"Beispiel","label":"3.15","description":"Streckenkongruenzen in der affinen Standardebene","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":172},{"destination":"prop:Streckensubtraktion","sort":"Proposition","label":"3.16","description":"Streckensubtraktion","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":173},{"destination":"defn:<-fuer-Strecken","sort":"Definition","label":"3.17","description":"Vergleich von Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":174},{"destination":"prop:<-fuer-Strecken","sort":"Proposition","label":"3.18","description":"Vergleich von Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"80","counter":175},{"destination":"sect:Kongruenzaxiome-fuer-Winkel","sort":"Abschnitt","label":"3.3","description":"Die Kongruenzaxiome für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":176},{"destination":"defn:Winkel","sort":"Definition","label":"3.19","description":"Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":177},{"destination":"abb:Winkel","sort":"Abbildung","label":"3.2","description":"Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":178},{"destination":"prop:winkel","sort":"Proposition","label":"3.20","description":"Identitätskriterium für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":179},{"destination":"defn:Inneres-eines-Winkels","sort":"Definition","label":"3.21","description":"Inneres eines Winkels","chapter":"3","section":"3.3","subsection":"3.3.0","page":"81","counter":180},{"destination":"lemma:im-Inneren-eines-Winkels","sort":"Lemma","label":"3.22","description":"Kriterium für die Lage im Inneren eines Winkels","chapter":"3","section":"3.3","subsection":"3.3.0","page":"81","counter":181},{"destination":"defn:Kongruenzaxiome-fuer-Winkel","sort":"Definition","label":"3.23","description":"Kongruenzaxiome für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"82","counter":182},{"destination":"defn:<-fuer-Winkel","sort":"Definition","label":"3.24","description":"Vergleich von Winkeln","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":183},{"destination":"prop:<-fuer-Winkel","sort":"Proposition","label":"3.25","description":"Vergleich von Winkeln","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":184},{"destination":"defn:Dreieck","sort":"Definition","label":"3.26","description":"Dreieck","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":185},{"destination":"bem:dreieck","sort":"Bemerkung","label":"3.27","description":"Kongruenz von Dreiecken","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":186},{"destination":"defn:ebene-Geometrie","sort":"Definition","label":"3.28","description":"ebene Geometrie","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":187},{"destination":"defn:Bewegung","sort":"Definition","label":"3.29","description":"Bewegung","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":188},{"destination":"bsp:Bewegungen-in-der-affinen-Standardebene","sort":"Beispiel","label":"3.30","description":"Bewegungen in der affinen Standardebene","chapter":"3","section":"3.3","subsection":"3.3.0","page":"85","counter":189},{"destination":"defn:gvB","sort":"Definition","label":"3.31","description":"genügend viele Bewegungen","chapter":"3","section":"3.3","subsection":"3.3.0","page":"85","counter":190},{"destination":"satz:genug-Bewegung","sort":"Satz","label":"3.32","description":"Existenz genügend vieler Bewegungen impliziert (K'6)","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":191},{"destination":"Voraussetzungen-SWS","sort":"Gleichung","label":"3.3","description":"","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":192},{"destination":"bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln","sort":"Beispiel","label":"3.33","description":"Winkelkongruenzen in der affinen Standardebene","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":193},{"destination":"Kongruenz-von-Winkeln-in-der-affinen-Standardebene","sort":"Gleichung","label":"3.4","description":"","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":194},{"destination":"sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel","sort":"Abschnitt","label":"3.4","description":"Ergänzungswinkel, Gegenwinkel und rechte Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":195},{"destination":"defn:Ergaenzungswinkel-Gegenwinkel","sort":"Definition","label":"3.34","description":"Ergänzungswinkel und Gegenwinkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":196},{"destination":"prop:Ergaenzungswinkel","sort":"Proposition","label":"3.35","description":"Ergänzungswinkel kongruenter Winkel sind kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":197},{"destination":"coro:Gegenwinkel","sort":"Korollar","label":"3.36","description":"ein Winkel ist zu seinem Gegenwinkel kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":198},{"destination":"defn:rechter-Winkel","sort":"Definition","label":"3.37","description":"rechter Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":199},{"destination":"prop:rechter-Winkel","sort":"Proposition","label":"3.38","description":"Ergänzungswinkel eines rechten Winkels ist rechter Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":200},{"destination":"satz:Viertes-euklidisches-Postulat","sort":"Satz","label":"3.39","description":"rechte Winkel sind zueinander kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"89","counter":201},{"destination":"coro:rechte-Winkel","sort":"Korollar","label":"3.40","description":"die rechten Winkel bilden eine Kongruenzklasse","chapter":"3","section":"3.4","subsection":"3.4.0","page":"89","counter":202},{"destination":"sect:Orthogonalitaet-und-Parallelitaet","sort":"Abschnitt","label":"3.5","description":"Orthogonalität und Parallelität","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":203},{"destination":"defn:orthogonal","sort":"Definition","label":"3.41","description":"orthogonal","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":204},{"destination":"satz:Orthogonale-Gerade","sort":"Satz","label":"3.42","description":"Existenz des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":205},{"destination":"abb:Orthogonale","sort":"Abbildung","label":"3.3","description":"Existenz des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"90","counter":206},{"destination":"defn:Wechselwinkel-und-Stufenwinkel","sort":"Definition","label":"3.43","description":"Wechselwinkel und Stufenwinkel","chapter":"3","section":"3.5","subsection":"3.5.0","page":"90","counter":207},{"destination":"bem:Wechselwinkel-und-Stufenwinkel","sort":"Bemerkung","label":"3.44","description":"Zusammenhang zwischen Wechsel- und Stufenwinkel","chapter":"3","section":"3.5","subsection":"3.5.0","page":"91","counter":208},{"destination":"satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz","sort":"Satz","label":"3.45","description":"schwacher Wechselwinkelsatz","chapter":"3","section":"3.5","subsection":"3.5.0","page":"91","counter":209},{"destination":"coro:zum-schwachen-wws","sort":"Korollar","label":"3.46","description":"zweifaches Lotfällen gibt Parallele","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":210},{"destination":"coro:Lot-eindeutig","sort":"Korollar","label":"3.47","description":"Eindeutigkeit des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":211},{"destination":"coro:Existenz-von-Parallelen","sort":"Korollar","label":"3.48","description":"Existenz von Parallelen","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":212},{"destination":"satz:Parallelenaxiom-in-Hilbertebenen","sort":"Satz","label":"3.49","description":"starker Wechselwinkelsatz","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":213},{"destination":"sect:Kongruenzsatz","sort":"Abschnitt","label":"3.6","description":"Der Kongruenzsatz für Dreiecke","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":214},{"destination":"prop:eindeutiges-Dreieck","sort":"Proposition","label":"3.51","description":"Abtragung eines Dreiecks","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":215},{"destination":"defn:gleichschenkliges-Dreieck","sort":"Definition","label":"3.52","description":"gleichschenkliges Dreieck","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":216},{"destination":"prop:gleichschenkliges-Dreieck","sort":"Proposition","label":"3.53","description":"gleichschenkliges Dreieck","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":217},{"destination":"prop:Winkeladdsubtraktion","sort":"Proposition","label":"3.54","description":"Winkeladdition und -subtraktion","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":218},{"destination":"satz:Kongruenzsatz-fuer-Dreiecke","sort":"Satz","label":"3.55","description":"Kongruenzsatz für Dreiecke","chapter":"3","section":"3.6","subsection":"3.6.0","page":"95","counter":219},{"destination":"wsw-1","sort":"Gleichung","label":"3.5","description":"","chapter":"3","section":"3.6","subsection":"3.6.0","page":"96","counter":220},{"destination":"sect:Mittelsenkrechte-und-Winkelhalbierende","sort":"Abschnitt","label":"3.7","description":"Mittelsenkrechte und Winkelhalbierende","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":221},{"destination":"defn:Streckenmittelpunkt","sort":"Definition","label":"3.56","description":"Streckenmittelpunkt","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":222},{"destination":"lemma:Mittelpunkt-liegt-zwischen-Randpunkten","sort":"Lemma","label":"3.57","description":"Streckenmittelpunkt liegt zwischen den Randpunkten der Strecke","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":223},{"destination":"satz:Mittelpunkt","sort":"Satz","label":"3.58","description":"Existenz und Eindeutigkeit des Streckenmittelpunkts","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":224},{"destination":"Mittelpunkt-1","sort":"Gleichung","label":"3.6","description":"","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":225},{"destination":"Mittelpunkt-2","sort":"Gleichung","label":"3.7","description":"","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":226},{"destination":"defn:Mittelsenkrechte","sort":"Definition","label":"3.59","description":"Mittelsenkrechte","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":227},{"destination":"prop:Charakterisierung-Mittelsenkrechte","sort":"Proposition","label":"3.60","description":"Charakterisierung der Mittelsenkrechten","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":228},{"destination":"defn:Winkelhalbierende","sort":"Definition","label":"3.61","description":"Winkelhalbierende","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":229},{"destination":"prop:Existenz-der-Winkelhalbierenden","sort":"Proposition","label":"3.62","description":"Existenz der Winkelhalbierenden","chapter":"3","section":"3.7","subsection":"3.7.0","page":"100","counter":230},{"destination":"sect:Innen-und-Aussenwinkel-im-Dreieck","sort":"Abschnitt","label":"3.8","description":"Innen- und Außenwinkel im Dreieck","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":231},{"destination":"defn:Innenwinkel","sort":"Definition","label":"3.63","description":"Innenwinkel","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":232},{"destination":"prop:schwache-Winkelsumme-im-Dreieck-1","sort":"Proposition","label":"3.64","description":"schwache Winkelsumme im Dreieck","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":233},{"destination":"schwache-Winkelsumme-im-Dreieck","sort":"Gleichung","label":"3.8","description":"","chapter":"3","section":"3.8","subsection":"3.8.0","page":"101","counter":234},{"destination":"satz:Aussenwinkelsatz","sort":"Satz","label":"3.65","description":"Außenwinkelsatz","chapter":"3","section":"3.8","subsection":"3.8.0","page":"101","counter":235},{"destination":"satz:grosse-Dreiecksseite-hat-grossen-Winkel","sort":"Satz","label":"3.66","description":"der größeren Dreiecksseite liegt der größere Winkel gegenüber","chapter":"3","section":"3.8","subsection":"3.8.0","page":"102","counter":236},{"destination":"abb:grosse-Dreiecksseite-hat-grossen-Winkel","sort":"Abbildung","label":"3.4","description":"der größeren Dreiecksseite liegt der größere Winkel gegenüber","chapter":"3","section":"3.8","subsection":"3.8.0","page":"102","counter":237},{"destination":"satz:SSrechterWinkel","sort":"Satz","label":"3.67","description":"SSrW-Kriterium","chapter":"3","section":"3.8","subsection":"3.8.0","page":"103","counter":238},{"destination":"sect:Kreise","sort":"Abschnitt","label":"3.9","description":"In- und Umkreis","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":239},{"destination":"defn:Kreis","sort":"Definition","label":"3.68","description":"Kreis","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":240},{"destination":"prop:Kreise-haben-genau-einen-Mittelpunkt","sort":"Proposition","label":"3.69","description":"Eindeutigkeit des Kreismittelpunkts","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":241},{"destination":"satz:Umkreissatz","sort":"Satz","label":"3.70","description":"Umkreissatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":242},{"destination":"defn:Hoehe","sort":"Definition","label":"3.72","description":"Höhe","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":243},{"destination":"satz:Hoehensatz","sort":"Satz","label":"3.73","description":"Höhensatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":244},{"destination":"satz:Inkreissatz","sort":"Satz","label":"3.74","description":"Inkreissatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"106","counter":245},{"destination":"sect:Uebungsaufgaben-Hilbertebenen","sort":"Abschnitt","label":"3.10","description":"Übungsaufgaben","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":246},{"destination":"aufg:Anordnung-von-Punkten-auf-Geraden","sort":"Aufgabe","label":"3.1","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":247},{"destination":"aufg:unendlich-viele-Punkte-mit-I-+-A","sort":"Aufgabe","label":"3.2","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":248},{"destination":"aufg:Anordnung-Modell-alternativ","sort":"Aufgabe","label":"3.4","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":249},{"destination":"aufg:<-fuer-Winkel","sort":"Aufgabe","label":"3.5","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":250},{"destination":"aufg:Inneres-bestimmt-den-Winkel","sort":"Aufgabe","label":"3.6","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":251},{"destination":"aufg:konvexe-Mengen","sort":"Aufgabe","label":"3.7","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":252},{"destination":"aufg:Parallelogramm-synthetisch","sort":"Aufgabe","label":"3.10","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"109","counter":253},{"destination":"aufg:Spiegelungen-in-Hilbertebenen","sort":"Aufgabe","label":"3.12","description":"Geradenspiegelung","chapter":"3","section":"3.10","subsection":"3.10.0","page":"109","counter":254},{"destination":"aufg:Abschaetzung-Abstand-Punkt-Gerade","sort":"Aufgabe","label":"3.13","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"110","counter":255},{"destination":"aufg:Hoehenformel","sort":"Aufgabe","label":"3.14","description":"Höhenformel","chapter":"3","section":"3.10","subsection":"3.10.0","page":"110","counter":256},{"destination":"chap:Euklidische-Geometrie-kurz","sort":"Kapitel","label":"4","description":"Euklidische Geometrie","chapter":"4","section":"4.0","subsection":"4.0.0","page":"111","counter":257},{"destination":"sect:Vollstaendigkeitsaxiom","sort":"Abschnitt","label":"4.1","description":"Das Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"111","counter":258},{"destination":"defn:Dedekindschnitt","sort":"Definition","label":"4.1","description":"Dedekindschnitt","chapter":"4","section":"4.1","subsection":"4.1.0","page":"112","counter":259},{"destination":"defn:Vollstaendigkeitsaxiom","sort":"Definition","label":"4.2","description":"Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"112","counter":260},{"destination":"bsp:Vollstaendigkeitsaxiom","sort":"Beispiel","label":"4.3","description":"Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"113","counter":261},{"destination":"satz:Archimedisches-Axiom","sort":"Satz","label":"4.4","description":"Archimedisches Axiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"113","counter":262},{"destination":"sect:Euklidische-Ebenen","sort":"Abschnitt","label":"4.2","description":"Euklidische Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":263},{"destination":"defn:Euklidsche-Ebene","sort":"Definition","label":"4.5","description":"euklidische Ebene","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":264},{"destination":"defn:Isomorphismus-euklidischer-Ebenen","sort":"Definition","label":"4.6","description":"Isomorphismus euklidischer Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":265},{"destination":"satz:Hauptsatz-fuer-euklidische-Ebenen","sort":"Satz","label":"4.8","description":"Hauptsatz für euklidische Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":266},{"destination":"prop:Groesse-der-Winkelsumme","sort":"Proposition","label":"4.9","description":"Größe der Winkelsumme","chapter":"4","section":"4.2","subsection":"4.2.0","page":"115","counter":267},{"destination":"sect:Kreise-in-der-euklidischen-Ebene","sort":"Abschnitt","label":"4.3","description":"Kreise","chapter":"4","section":"4.3","subsection":"4.3.0","page":"116","counter":268},{"destination":"prop:Durchschnitt-Kreis-Gerade","sort":"Proposition","label":"4.10","description":"Durchschnitt von Kreis und Gerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"117","counter":269},{"destination":"coro:Tangente","sort":"Korollar","label":"4.11","description":"Charakterisierung der Tangente","chapter":"4","section":"4.3","subsection":"4.3.0","page":"118","counter":270},{"destination":"defn:Potenz","sort":"Definition","label":"4.12","description":"Potenz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"118","counter":271},{"destination":"satz:Zweisehnensatz","sort":"Satz","label":"4.13","description":"Zweisehnensatz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"119","counter":272},{"destination":"satz:Sehnen-Tangenten-Satz","sort":"Satz","label":"4.14","description":"Sehnen-Tangenten-Satz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"119","counter":273},{"destination":"prop:potenzgerade","sort":"Proposition","label":"4.15","description":"Potenzgerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"120","counter":274},{"destination":"satz:Kreis-Kreis-Schnitt-Eigenschaft","sort":"Satz","label":"4.17","description":"Kreis-Kreis-Schnitt-Eigenschaft","chapter":"4","section":"4.3","subsection":"4.3.0","page":"121","counter":275},{"destination":"coro:Kreis-Kreis-Schnitt-Eigenschaft","sort":"Korollar","label":"4.18","description":"Kreis-Kreis-Schnitt-Eigenschaft","chapter":"4","section":"4.3","subsection":"4.3.0","page":"122","counter":276},{"destination":"satz:Peripheriewinkelsatz","sort":"Satz","label":"4.19","description":"Peripheriewinkelsatz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"123","counter":277},{"destination":"satz:Thales","sort":"Satz","label":"4.20","description":"Satz des Thales","chapter":"4","section":"4.3","subsection":"4.3.0","page":"124","counter":278},{"destination":"satz:Sinussatz-Verschaerfung","sort":"Satz","label":"4.21","description":"Verschärfung des Sinussatzes","chapter":"4","section":"4.3","subsection":"4.3.0","page":"124","counter":279},{"destination":"satz:Eulergleichung","sort":"Satz","label":"4.22","description":"Eulergleichung","chapter":"4","section":"4.3","subsection":"4.3.0","page":"125","counter":280},{"destination":"coro:Eulergerade","sort":"Korollar","label":"4.23","description":"Eulergerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"125","counter":281},{"destination":"sect:Inversion-am-Kreis","sort":"Abschnitt","label":"4.4","description":"Die Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":282},{"destination":"defn:Inversion-am-Kreis","sort":"Definition","label":"4.24","description":"Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":283},{"destination":"prop:Inversionen-am-Kreis-sind-bijektiv","sort":"Proposition","label":"4.25","description":"Inversionen am Kreis sind bijektiv und bilden Punkte von innen nach außen ab","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":284},{"destination":"prop:Tangentenschnittpunkt-mit-Inversion","sort":"Proposition","label":"4.26","description":"Konstruktion des Bildpunkts unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"127","counter":285},{"destination":"prop:Eigenschaften-der-Inversion","sort":"Proposition","label":"4.27","description":"Eigenschaften der Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"127","counter":286},{"destination":"defn:verallgemeinerte-Gerade","sort":"Definition","label":"4.28","description":"verallgemeinerte Gerade","chapter":"4","section":"4.4","subsection":"4.4.0","page":"129","counter":287},{"destination":"prop:orthogonale-verallgemeinerte-Geraden","sort":"Proposition","label":"4.29","description":"orthogonale verallgemeinerte Gerade","chapter":"4","section":"4.4","subsection":"4.4.0","page":"129","counter":288},{"destination":"prop:orthogonale-Kreise","sort":"Proposition","label":"4.30","description":"Eigenschaften orthogonaler Kreise","chapter":"4","section":"4.4","subsection":"4.4.0","page":"130","counter":289},{"destination":"prop:Inversion-Kreis-an-Kreis","sort":"Proposition","label":"4.31","description":"Inversion eines Kreises an einem anderen Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":290},{"destination":"Schnittpunktanzahl-bleibt-unter-Inversion-erhalten","sort":"Gleichung","label":"4.1","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":291},{"destination":"Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2","sort":"Gleichung","label":"4.2","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":292},{"destination":"Inversion-fuer-verallgemeinerte-Geraden","sort":"Gleichung","label":"4.3","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":293},{"destination":"lemma:Beruehrpunkte-unter-der-Inversion","sort":"Lemma","label":"4.32","description":"Verhalten von Berührpunkten unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":294},{"destination":"prop:Inversion-und-Tangenten","sort":"Proposition","label":"4.33","description":"Verhalten von Tangenten unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":295},{"destination":"defn:verallgemeinerte-Winkelgroesse","sort":"Definition","label":"4.34","description":"verallgemeinerte Winkelgröße","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":296},{"destination":"satz:Inversion-winkeltreu","sort":"Satz","label":"4.35","description":"Inversion ist winkeltreu","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":297},{"destination":"defn:Doppelverhaeltnis","sort":"Definition","label":"4.36","description":"Doppelverhältnis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":298},{"destination":"prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis","sort":"Proposition","label":"4.37","description":"Inversion erhält Doppelverhältnis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":299},{"destination":"DV-1","sort":"Gleichung","label":"4.4","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":300},{"destination":"DV-2","sort":"Gleichung","label":"4.5","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"134","counter":301},{"destination":"sect:Uebungsaufgaben-Euklidische-Geometrie","sort":"Abschnitt","label":"4.5","description":"Übungsaufgaben","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":302},{"destination":"aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl","sort":"Aufgabe","label":"4.1","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":303},{"destination":"aufg:Peripheriewinkelsatz","sort":"Aufgabe","label":"4.4","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":304},{"destination":"aufg:Tangentenschnittpunkt-mit-Inversion","sort":"Aufgabe","label":"4.5","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":305},{"destination":"aufg:gleichseitige-Dreiecke-SHU","sort":"Aufgabe","label":"4.6","description":"gleichseitiges Dreieck","chapter":"4","section":"4.5","subsection":"4.5.0","page":"136","counter":306},{"destination":"chap:Nichteuklidsche-Geometrie","sort":"Kapitel","label":"5","description":"Nichteuklidische Geometrie","chapter":"5","section":"5.0","subsection":"5.0.0","page":"137","counter":307},{"destination":"sect:Hyperbolische-Ebenen","sort":"Abschnitt","label":"5.1","description":"Das Poincaré'sche Kreismodell","chapter":"5","section":"5.1","subsection":"5.1.0","page":"137","counter":308},{"destination":"defn:Hyperbolische-Ebene","sort":"Definition","label":"5.1","description":"hyperbolische Ebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"137","counter":309},{"destination":"defn:Endpunkte-von-k-Geraden","sort":"Definition","label":"5.2","description":"Endpunkte einer k-Geraden","chapter":"5","section":"5.1","subsection":"5.1.0","page":"138","counter":310},{"destination":"prop:Kreismodell-ist-Inzidenzebene","sort":"Proposition","label":"5.3","description":"Poincaré'sches Kreismodell ist Inzidenzebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"138","counter":311},{"destination":"I2-hyperbolisch","sort":"Gleichung","label":"5.1","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"139","counter":312},{"destination":"Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs","sort":"Gleichung","label":"5.2","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":313},{"destination":"prop:Kreismodell-erfuellt-Anordnungsaxiome","sort":"Proposition","label":"5.4","description":"Poincaré'sches Kreismodell erfüllt Anordnungsaxiome","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":314},{"destination":"hyperbolischer-Abstand","sort":"Gleichung","label":"5.3","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":315},{"destination":"lemma:k-Anordnung-von-k-Punkten","sort":"Lemma","label":"5.5","description":"k-Anordnung von k-Punkten","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":316},{"destination":"Kongruenz-von-k-Strecken","sort":"Gleichung","label":"5.4","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":317},{"destination":"prop:Kreismodell-erfuellt-Streckenkongruenzaxiome","sort":"Proposition","label":"5.6","description":"Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Strecken","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":318},{"destination":"prop:Kreismodell-erfuellt-Winkelkongruenzaxiome","sort":"Proposition","label":"5.7","description":"Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Winkel","chapter":"5","section":"5.1","subsection":"5.1.0","page":"142","counter":319},{"destination":"prop:k-Bewegung-in-den-Ursprung","sort":"Proposition","label":"5.8","description":"Existenz einer k-Bewegung, die gegebenen k-Punkt auf den Ursprung schickt","chapter":"5","section":"5.1","subsection":"5.1.0","page":"142","counter":320},{"destination":"prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom","sort":"Proposition","label":"5.9","description":"Poincaré'sches Kreismodell erfüllt Vollständigkeitsaxiom","chapter":"5","section":"5.1","subsection":"5.1.0","page":"143","counter":321},{"destination":"prop:hyperbolisches-Axiom-im-Poincaremodell","sort":"Proposition","label":"5.10","description":"Poincaré'sche Kreismodell erfüllt das hyperbolische Axiom","chapter":"5","section":"5.1","subsection":"5.1.0","page":"143","counter":322},{"destination":"satz:Kreismodell-ist-hyperbolische-Ebene","sort":"Satz","label":"5.11","description":"Poincaré'sches Kreismodell ist hyperbolische Ebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"144","counter":323},{"destination":"sect:Hyperbolische-Geometrie","sort":"Abschnitt","label":"5.2","description":"Hyperbolische Geometrie","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":324},{"destination":"Additionstheorem-cosh","sort":"Gleichung","label":"5.5","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":325},{"destination":"hyperbolisches-Pythagorasaequivalent","sort":"Gleichung","label":"5.6","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":326},{"destination":"lemma:k-Abstand-zum-Ursprung","sort":"Lemma","label":"5.12","description":"k-Abstand zum Ursprung","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":327},{"destination":"lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung","sort":"Lemma","label":"5.13","description":"sinh und cosh vom k-Abstand zum Ursprung","chapter":"5","section":"5.2","subsection":"5.2.0","page":"145","counter":328},{"destination":"lemma:Norm-im-Klein-Modell","sort":"Lemma","label":"5.14","description":"Projektion von k-Punkten auf die Verbindungssehne der Endpunkte der zugehörigen k-Geraden","chapter":"5","section":"5.2","subsection":"5.2.0","page":"145","counter":329},{"destination":"satz:Trigonometrie-rechtwinkliges-k-Dreieck","sort":"Satz","label":"5.15","description":"Trigonometrie im rechtwinkligen k-Dreieck","chapter":"5","section":"5.2","subsection":"5.2.0","page":"146","counter":330},{"destination":"satz:hyperbolische-Trigonometrie","sort":"Satz","label":"5.16","description":"hyperbolische Trigonometrie","chapter":"5","section":"5.2","subsection":"5.2.0","page":"148","counter":331},{"destination":"hyperbolische-Trigonometrie","sort":"Gleichung","label":"5.7","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"149","counter":332},{"destination":"satz:Winkelsumme-im-k-Dreieck","sort":"Satz","label":"5.17","description":"Winkelsumme im k-Dreieck","chapter":"5","section":"5.2","subsection":"5.2.0","page":"150","counter":333},{"destination":"beta+gamma<pi","sort":"Gleichung","label":"5.8","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"150","counter":334},{"destination":"sect:Uebungsaufgaben-Nichteuklidische-Geometrie","sort":"Abschnitt","label":"5.3","description":"Übungsaufgaben","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":335},{"destination":"aufg:hyperbolische-Geradenspiegelung-ist-Bewegung","sort":"Aufgabe","label":"5.1","description":"","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":336},{"destination":"aufg:Poincarehalbebene","sort":"Aufgabe","label":"5.2","description":"","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":337}],"linked_media":[102,98,10,104,10,95,98,98,98,110,491,349,350,351,353,360]},"derivatives":{"screenshot":{"id":"medium/39/manuscript/screenshot-3decee3284df294f13fd31a8a444715d.png","storage":"store","metadata":{"filename":"image_processing20200724-1-7uc3mi.png","size":7126,"mime_type":"image/png"}}}}	all	t	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 17:03:37.785021	\N	\N	\N	-1	0
52		2025-07-15 12:12:56.371975	2026-08-26 19:49:17.668861	LessonMaterial	Teilbarkeit	Talk	2	\N	\N	{"id":"medium/52/manuscript/1d248e204bee6e98adcc72bc1bb78caf.pdf","storage":"store","metadata":{"filename":"Vortrag1.pdf","size":61563,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[],"version":null},"derivatives":{"screenshot":{"id":"medium/52/manuscript/screenshot-c50180167bc81e896748fa0189b4a57f.png","storage":"store","metadata":{"filename":"image_processing20250715-149-3um9kx.png","size":7014,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2026-07-15 12:14:43.286356	\N	\N		-1	0
19	\N	2020-07-24 16:06:37.911565	2026-08-28 15:08:35.069535	Question	Beispiele für Primideale in Q	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche dieser Aussagen sind wahr?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	7	f	2021-07-24 16:06:37.911565	\N	\N	\N	-1	4
21	\N	2020-07-24 16:10:17.951738	2026-08-28 15:08:35.069535	Question	Beispiele für Primideale in K[X]	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei $K$ ein Körper und $a\\in K$. Betrachte den Polynomring in einer Variable $K[X]$ über $K$.\n\nWelche der folgenden Ideale sind Primideale in $K[X]$?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	9	f	2021-07-24 16:10:17.951738	\N	\N	\N	-1	3
23	\N	2020-07-24 16:16:21.665364	2026-08-28 15:08:35.069535	Remark	Ideale in Z Start	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	In diesem angeleiteten Beweis wollen wir zeigen, dass jedes Ideal in $\\mathbb{Z}$ von einem Element erzeugt wird. Ein Ideal $I$ eins (kommutativen) Ringes $R,$ welches von einem Element erzeugt wird, nennt man $\\textbf{Hauptideal}.$ In diesem Fall gibt es ein $x \\in I,$ sodass für jedes $y\\in I$ ein $a \\in R$ existiert mit $y = ax.$ Man schreibt dann auch $$I = (x) := Rx = \\{ax \\mid a\\in R\\}.$$\nEin kommutativer nullteilerfreier Ring, in dem jedes Ideal ein Hauptideal ist, wird $\\textbf{Hauptidealring}$ genannt. Die ganzen Zahlen $\\mathbb{Z}$ sind bekanntlich nullteilerfrei. Wir werden in diesem Quiz folglich zeigen, dass $\\mathbb{Z}$ ein Hauptidealring ist.	\N	\N	\N	\N	\N	\N	\N	11	f	2021-07-24 16:16:21.665364	\N	\N	\N	-1	0
17	\N	2020-07-24 16:02:04.55872	2026-08-28 15:08:35.069535	Question	Primideale in Körpern	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche dieser Aussagen ist stets wahr?\n	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	5	f	2021-07-24 16:02:04.55872	\N	\N	\N	-1	4
12		2020-07-24 15:15:19.693823	2026-08-28 15:08:35.069535	Exercise	Blatt4	Lecture	1	\N	\N	{"id":"medium/12/manuscript/d8024479ea26e6e6b5d17cdfb9bf02b3.pdf","storage":"store","metadata":{"filename":"Übung.V.LA 2.SS20.LA2-Blatt02.pdf","size":67599,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/12/manuscript/screenshot-16b55aeefffa834857b4a3e1e515a8f3.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12sjf5y.png","size":40172,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	1	f	2021-07-24 15:15:19.693823	\N	\N	\N	-1	0
33	\N	2020-07-24 16:42:58.569127	2026-08-28 15:08:35.069535	Quiz	Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 34\n  2:\n    :type: Question\n    :id: 35\n  3:\n    :type: Question\n    :id: 36\n  4:\n    :type: Question\n    :id: 37\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: -1\nhide_solution: []\n	1	Quiz	\N	\N	de	\N	\N		\N	\N	21	f	2021-07-24 16:42:58.569127	\N	\N	\N	-1	0
8		2020-07-24 14:46:06.857134	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	8	{"id":"medium/8/video/c66bbf9059e1cb15f4ef25fca67a5d81.mp4","storage":"store","metadata":{"filename":"LA2E08.mp4","size":1636141,"mime_type":"video/mp4","duration":60.024,"bitrate":218064,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/8/screenshot/b1b718054ad08f98391c9e370a66949a.png","storage":"store","metadata":{"filename":"screenshot20200724-1-18a3lza.png","size":119674,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/8/screenshot/normalized-55cae70265a6b310bbbe6b95af8c0462.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12sd2sb.png","size":12571,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/8/manuscript/bbc747724b0ff16f074a0ed4d6241c65.pdf","storage":"store","metadata":{"filename":"LA2.E08.pdf","size":816914,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/8/manuscript/screenshot-cf1744a864646413b4678bddbc9a6704.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1kmhlcg.png","size":108129,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:46:06.857134	\N	\N	\N	-1	0
22	\N	2020-07-24 16:15:52.01113	2026-08-28 15:08:35.069535	Quiz	Angeleiteter Beweis: Ideale in Z	Lecture	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Remark\n    :id: 23\n  2:\n    :type: Question\n    :id: 24\n  3:\n    :type: Question\n    :id: 25\n  4:\n    :type: Question\n    :id: 26\n  5:\n    :type: Remark\n    :id: 27\n  6:\n    :type: Question\n    :id: 28\n  7:\n    :type: Remark\n    :id: 29\n  8:\n    :type: Remark\n    :id: 30\n  9:\n    :type: Question\n    :id: 31\n  10:\n    :type: Remark\n    :id: 32\nedges:\n  ? - 2\n    - 8\n  : - 20: false\n      21: false\n      22: true\n    - 20: false\n      21: true\n      22: false\n    - 20: false\n      21: true\n      22: true\n    - 20: true\n      21: false\n      22: false\n    - 20: true\n      21: false\n      22: true\n    - 20: false\n      21: false\n      22: false\n    - 20: true\n      21: true\n      22: true\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: 6\n  6: 7\n  7: -1\n  8: 9\n  9: 10\n  10: 2\nhide_solution:\n- - 2\n  - 20: false\n    21: false\n    22: true\n- - 2\n  - 20: false\n    21: true\n    22: false\n- - 2\n  - 20: false\n    21: true\n    22: true\n- - 2\n  - 20: true\n    21: false\n    22: false\n- - 2\n  - 20: true\n    21: false\n    22: true\n- - 2\n  - 20: false\n    21: false\n    22: false\n- - 2\n  - 20: true\n    21: true\n    22: true\n	1	Quiz	\N	\N	de	\N	\N		\N	\N	10	f	2021-07-24 16:15:52.01113	\N	\N	\N	-1	0
9		2020-07-24 14:51:14.920111	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	9	{"id":"medium/9/video/6187a6877c63eb1f436c609233b6734f.mp4","storage":"store","metadata":{"filename":"LA2E09.mp4","size":1956825,"mime_type":"video/mp4","duration":60.024,"bitrate":260805,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/9/screenshot/50ce3e38dfa67e91de39afe6e819a55e.png","storage":"store","metadata":{"filename":"screenshot20200724-1-17n4aon.png","size":181298,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/9/screenshot/normalized-208498c706d6e610ce9bedd0c1423b54.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1dieo3r.png","size":52223,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/9/manuscript/7f21bce51aa2568c3b2735f06ee6fae9.pdf","storage":"store","metadata":{"filename":"LA2.E09.pdf","size":1166711,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/9/manuscript/screenshot-c314b7d368b987b1ced90857682be068.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1jcn8b5.png","size":148996,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:51:14.920111	\N	\N	\N	-1	0
10		2020-07-24 14:56:40.100167	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	10	{"id":"medium/10/video/4d452e06ae4c401055930a78f3c99e5b.mp4","storage":"store","metadata":{"filename":"LA2E10.mp4","size":1770925,"mime_type":"video/mp4","duration":60.024,"bitrate":236028,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/10/screenshot/c4d2ddda7fe38c385e8dca2341ffc8e6.png","storage":"store","metadata":{"filename":"screenshot20200724-1-mo0aeb.png","size":125109,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/10/screenshot/normalized-e0e7e6399d6a452317e3f2eb9e640cf7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-13kkkad.png","size":32713,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/10/manuscript/a02e7d985f2c2a514071775902e439c8.pdf","storage":"store","metadata":{"filename":"LA2.E10.pdf","size":638000,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/10/manuscript/screenshot-83029d5d314509f94f5d2f545dc587a3.png","storage":"store","metadata":{"filename":"image_processing20200724-1-o1213x.png","size":78449,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:56:40.100167	\N	\N	\N	-1	0
2		2020-07-24 14:06:58.962512	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	2	{"id":"medium/2/video/6e46aab6179623cfed897b663cd723a9.mp4","storage":"store","metadata":{"filename":"LA2E02.mp4","size":1955566,"mime_type":"video/mp4","duration":60.024,"bitrate":260637,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/2/screenshot/da504c00a54f7ff2cb78cd1062af949b.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1k4u0et.png","size":190159,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/2/screenshot/normalized-a0b4b7e41202fb1abd8b5a8360c54f37.png","storage":"store","metadata":{"filename":"image_processing20200724-1-18sealr.png","size":45542,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/2/manuscript/e1582e2dea166d0e78f6504bbacc625a.pdf","storage":"store","metadata":{"filename":"LA2.E02.pdf","size":1130194,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/2/manuscript/screenshot-f4b924397fe7ada1576b2f8d0360f1f9.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1levfn8.png","size":149968,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:06:58.962512	\N	\N	\N	-1	0
6		2020-07-24 14:29:17.501435	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	6	{"id":"medium/6/video/71f29269c49e634630e53741e5c4b80c.mp4","storage":"store","metadata":{"filename":"LA2E06.mp4","size":1914014,"mime_type":"video/mp4","duration":60.024,"bitrate":255099,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/6/screenshot/32c82f68b8808e9c2550c5918c034918.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1ar4gk2.png","size":213364,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/6/screenshot/normalized-5c573a2d2d5e5a0d93c932e51fcb95cc.png","storage":"store","metadata":{"filename":"image_processing20200724-1-dzinn4.png","size":57533,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/6/manuscript/48ce537f46f30e41f531c0dd4a1155fb.pdf","storage":"store","metadata":{"filename":"LA2.E06.pdf","size":1146440,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/6/manuscript/screenshot-80c2cb074e0c72693d3221b4d926c5ec.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1v5nulk.png","size":142931,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:29:17.501435	\N	\N	\N	-1	0
3		2020-07-24 14:12:39.663351	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	3	{"id":"medium/3/video/9c61a69cb2ad6b460f32810ed366d8f4.mp4","storage":"store","metadata":{"filename":"LAL2E03.mp4","size":1752814,"mime_type":"video/mp4","duration":60.024,"bitrate":233615,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/3/screenshot/3366a1ac75c28b56e165987c425574ba.png","storage":"store","metadata":{"filename":"screenshot20200724-1-6gkzy3.png","size":174370,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/3/screenshot/normalized-c6188e6a3d396811d283a153ddafa567.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1qykrfz.png","size":42558,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/3/manuscript/02875aacacb6c00ceedf955ed0885bf8.pdf","storage":"store","metadata":{"filename":"LA2.E03.pdf","size":911950,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/3/manuscript/screenshot-09d32e534c82c32213076811e637c5d5.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1jctkbr.png","size":108707,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:12:39.663351	\N	\N	\N	-1	0
7		2020-07-24 14:33:16.150404	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	7	{"id":"medium/7/video/9a75b21e25ae51bee58281bff24ae7e2.mp4","storage":"store","metadata":{"filename":"LA2E07.mp4","size":1742925,"mime_type":"video/mp4","duration":60.024,"bitrate":232297,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/7/screenshot/f452ec799399d32c84390c6bfec896c3.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1i8ba8i.png","size":169612,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/7/screenshot/normalized-f7108a74864a48d622f1ca0d0ea18e8b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-16c2dut.png","size":41756,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/7/manuscript/abe54aaef2c42a27155ce88753ed59ba.pdf","storage":"store","metadata":{"filename":"LA2.E07.pdf","size":1106134,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/7/manuscript/screenshot-7b8d24fe3103d89a98e0cd135abf1390.png","storage":"store","metadata":{"filename":"image_processing20200724-1-vqwyb8.png","size":133262,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:33:16.150404	\N	\N	\N	-1	0
16	\N	2020-07-24 16:01:47.120356	2026-08-28 15:08:35.069535	Quiz	Primideale und maximale Ideale	Lecture	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 17\n  2:\n    :type: Question\n    :id: 18\n  3:\n    :type: Question\n    :id: 19\n  4:\n    :type: Question\n    :id: 20\n  5:\n    :type: Question\n    :id: 21\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: -1\nhide_solution: []\n	1	Quiz	\N	\N	de	\N	\N		\N	\N	4	f	2021-07-24 16:01:47.120356	\N	\N	\N	-1	0
5		2020-07-24 14:23:41.519702	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	5	{"id":"medium/5/video/20c0f8f5b7f84bdba5fc08789f703533.mp4","storage":"store","metadata":{"filename":"LA2E05.mp4","size":2035152,"mime_type":"video/mp4","duration":60.024,"bitrate":271245,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/5/screenshot/df65c704b2cd27b51f4e1bc1a8e3d346.png","storage":"store","metadata":{"filename":"screenshot20200724-1-swmdmi.png","size":260866,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/5/screenshot/normalized-b13c583f59f7c34e185c02b71341b31b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1sz19jf.png","size":65008,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/5/manuscript/aa230cc1ddea2de68359e0e4a47bb7dc.pdf","storage":"store","metadata":{"filename":"LA2.E05.pdf","size":1446454,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/5/manuscript/screenshot-42ea4fa7150abd860db7e446ad95426b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-g5cacj.png","size":164433,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:23:41.519702	\N	\N	\N	-1	0
15		2020-07-24 15:58:26.59272	2026-08-28 15:08:35.069535	Miscellaneous	Informationen zur Vorlesung	Lecture	1	\N	\N	{"id":"medium/15/manuscript/6abae2f9d76fc3cf81f061e982a17b4c.pdf","storage":"store","metadata":{"filename":"Sonstiges.V.LA 2.SS20.Informationen zur Vorlesung.pdf","size":134035,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/15/manuscript/screenshot-78c940c61c11b7ea563edd44d9e08b11.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1gee8hy.png","size":73051,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	3	f	2021-07-24 15:58:26.59272	\N	\N	\N	-1	0
14		2020-07-24 15:54:03.017896	2026-08-28 15:08:35.069535	Repetition	Euklidische Räume	Lecture	1	{"id":"medium/14/video/2f175f5305281b157e749a69cb29df98.mp4","storage":"store","metadata":{"filename":"Wiederholung.v.la 2.ss20.euklidische Räume-1.mp4","size":1952112,"mime_type":"video/mp4","duration":60.024,"bitrate":260177,"resolution":"1620x1080","frame_rate":"20/1"}}	\N	{"id":"medium/14/manuscript/b442dd2f1fa978c2e097c18a9c00d4e7.pdf","storage":"store","metadata":{"filename":"Wiederholung.V.LA 2.SS20.Euklidische Räume.pdf","size":76310,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/14/manuscript/screenshot-5a6c59528e7a5f4867c4cf55f65b6070.png","storage":"store","metadata":{"filename":"image_processing20200724-1-131qq54.png","size":9310,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	2	f	2021-07-24 15:54:03.017896	\N	\N	\N	-1	0
4		2020-07-24 14:18:30.391486	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	4	{"id":"medium/4/video/dd9017f21d168a56f365f54d24236133.mp4","storage":"store","metadata":{"filename":"LA2E04.mp4","size":2332822,"mime_type":"video/mp4","duration":60.024,"bitrate":310918,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/4/screenshot/91927569e5f74dd421a334cf864bf97f.png","storage":"store","metadata":{"filename":"screenshot20200724-1-18t9svm.png","size":217053,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/4/screenshot/normalized-ce2d108f74aa61caf947f27b7f2e91d7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1i2mktm.png","size":63907,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/4/manuscript/cdb87ae3926c61a4989cfc0d97b1277e.pdf","storage":"store","metadata":{"filename":"LA2.E04.pdf","size":1359479,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/4/manuscript/screenshot-9ab7c7f3c704645eb480721a53a4614e.png","storage":"store","metadata":{"filename":"image_processing20200724-1-qhhu3w.png","size":158255,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:18:30.391486	\N	\N	\N	-1	0
11	\N	2020-07-24 15:09:22.028739	2026-08-28 15:08:35.069535	Script	Skript	Lecture	1	\N	\N	{"id":"medium/11/manuscript/6a7f68166c0f73c5e52e5c3e04edbe91.pdf","storage":"store","metadata":{"filename":"skript.pdf","size":958764,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/11/manuscript/screenshot-9bfae6984bf1c9058e39961b5e47209e.png","storage":"store","metadata":{"filename":"image_processing20200724-1-7kqb5h.png","size":10393,"mime_type":"image/png"}}}}	all	f	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 15:09:22.028739	\N	\N	\N	-1	0
45		2020-11-28 16:23:26.308384	2026-08-28 15:08:35.069535	Exercise	Blatt 5	Lecture	1	\N	\N	{"id":"medium/45/manuscript/1cf0c8f0baf4dcb98931fd2c1bb9a6b5.pdf","storage":"store","metadata":{"filename":"Übung.V.LA 2.SS20.LA2-Blatt05.pdf","size":70765,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/45/manuscript/screenshot-06c628555c0925a1461a265e77b619ca.png","storage":"store","metadata":{"filename":"image_processing20201128-1-h318j9.png","size":43176,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	26	f	2021-11-28 16:23:26.308384	\N	\N	\N	-1	0
27	\N	2020-07-24 16:22:40.781556	2026-08-28 15:08:35.069535	Remark	Ideale in Z Erzeuger Kandidat	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Wir können annehmen, dass $I$ nicht das Nullideal ist, da dieses bereits ein Hauptideal ist.\nWenn $I$ nicht das Nullideal ist, dann enthält es ein von $0$ verschiedenes Element $y$ und damit auch eine natürliche Zahl $\\lvert y \\rvert.$\nInsgesamt können wir folgern, dass $I\\cap \\mathbb{N}$ eine nicht-leere Teilmenge der natürlichen Zahlen ist und daher ein minimales Element $x$ besitzt. \nUm zu zeigen, dass $x$ ein Erzeuger von $I$ ist, müssen wir zeigen, dass jedes Element $y \\in I$ von der Form $y=ax$ ist für ein $a \\in \\mathbb{Z}.$  Eine wichtige Zutat wird die Division mit Rest.	\N	\N	\N	\N	\N	\N	\N	15	f	2021-07-24 16:22:40.781556	\N	\N	\N	-1	0
29	\N	2020-07-24 16:24:37.74309	2026-08-28 15:08:35.069535	Remark	Ideale in Z final	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Damit haben wir gezeigt: Jedes $y \\in I$ ist von der Form $y= ax$ für ein $a \\in \\mathbb{Z}.$ Daher wird $I$ von $x$ erzeugt. Essentiell für den Beweis war die Division mit Rest. Divison mit Rest ist in jedem $\\textbf{``euklidischen Ring''}$ möglich. Die ganzen Zahl sind ein Beispiel eines euklidischen Rings. Der Beweis, den wir in diesem Quiz geführt haben, lässt sich auch auf euklidische Ringe übertragen. Damit würde man das folgende Ergebnis erhalten: Jeder $\\textbf{euklidische Ring}$ ist ein $\\textbf{Hauptidealring}.$	\N	\N	\N	\N	\N	\N	\N	17	f	2021-07-24 16:24:37.74309	\N	\N	\N	-1	0
1		2020-07-24 13:54:47.104217	2026-08-28 15:08:35.069535	LessonMaterial		Lesson	1	{"id":"medium/1/video/269c5ce0c48ed4a23891abd1346125aa.mp4","storage":"store","metadata":{"filename":"LA2.E01.mp4","size":2078859,"mime_type":"video/mp4","duration":60.024,"bitrate":277070,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/1/screenshot/9b259def551649d827b7a40d33ece6d6.png","storage":"store","metadata":{"filename":"screenshot20200724-1-16f6c1d.png","size":230732,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/1/screenshot/normalized-62b8405499916239163ce7ff3df213e7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-x9wc6t.png","size":60200,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/1/manuscript/d7d911f3ade1888e7c44445c573aa3d4.pdf","storage":"store","metadata":{"filename":"LA2.E01.pdf","size":1138473,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/1/manuscript/screenshot-d85053a28beb894430567279403be368.png","storage":"store","metadata":{"filename":"image_processing20200724-1-h1cbbu.png","size":149022,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 13:54:47.104217	\N	\N	\N	-1	0
20	\N	2020-07-24 16:08:25.960801	2026-08-28 15:08:35.069535	Question	Beispiele für Maximalideale in Z	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Betrachte den Ring der ganzen Zahlen $\\mathbb Z$. \n\nWelche dieser Ideale sind Maximalideale in $\\mathbb Z$?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	8	f	2021-07-24 16:08:25.960801	\N	\N	\N	-1	4
24	\N	2020-07-24 16:17:11.021084	2026-08-28 15:08:35.069535	Question	Ideale in Z erkennen	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche der folgenden Teilmengen von $\\mathbb{Z}$ sind Ideale?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	12	f	2021-07-24 16:17:11.021084	\N	\N	\N	-1	3
25	\N	2020-07-24 16:18:56.962113	2026-08-28 15:08:35.069535	Question	Ideale in Z Erzeuger finden	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Bevor wir einen allgemeinen Beweis der Aussage führen, schauen wir uns ein Beispiel an. Betrachte das Ideal $$I:= 4\\mathbb{Z} + 6 \\mathbb{Z} = \\{a4+b6 \\mid a,b \\in \\mathbb{Z}\\}.$$\nWir wollen zeigen, dass jedes Ideal in $\\mathbb{Z}$ von einem Element erzeugt wird. Diese Aussage müsste insbesondere für $I$ stimmen.\nWelche der folgenden Antwortoptionen sind wahr?	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	13	f	2021-07-24 16:18:56.962113	\N	\N	\N	-1	4
28	\N	2020-07-24 16:23:22.686316	2026-08-28 15:08:35.069535	Question	Ideale in Z Division mit Rest	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei wie zuvor $0 \\neq I\\subset \\mathbb{Z}$ ein Ideal und $x \\in I$ die kleinste natürliche Zahl in $I$. Sei weiterhin $y \\in I$ ein weiteres Element. Mit Hilfe von Division mit Rest finden wir ein $a \\in \\mathbb{Z}$ und ein $0 \\leq r < \\lvert x\\rvert$ mit $$y = ax+r.$$\nWas können wir ableiten?	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	16	f	2021-07-24 16:23:22.686316	\N	\N	\N	-1	3
31		2020-07-24 16:30:41.490936	2026-08-28 15:08:35.069535	Question	Ideale Definition	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei $R$ ein kommutativer Ring mit Eins. Eine Teilmenge $I$ von $R$ von heißt Ideal, wenn $0\\in I$ ist, für alle $a,b\\in I$ stets $a+b\\in I$ gilt und	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc		\N	\N	19	f	2021-07-24 16:30:41.490936	\N	\N	\N	-1	2
34		2020-07-24 16:43:21.322066	2026-08-28 15:08:35.069535	Question	Zusammenhang Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{4,4}(\\mathbb{Q})$ habe die Invariantenteiler $1,t-2,t-2,(t-2)(t-3)$. Gib die Determinantenteiler $d_1(A),\\ldots,d_4(A)$ als Tupel von Polynomen aus $\\mathbb{Q}[t]$ an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfTuple\n  value: 1,t-2,(t-2)^2,(t-2)^3*(t-3)\n  tex: "(1, t-2, \\\\left(t-2\\\\right)^{2}, \\\\left(t-2\\\\right)^{3} \\\\cdot \\\\left(t-3\\\\right))"\n  nerd: vector(1,t-2,(t-2)^2,(t-2)^3*(t-3))\nexplanation: ''\n	free		\N	\N	22	f	2021-07-24 16:43:21.322066	\N	\N	\N	-1	1
35		2020-07-24 16:44:51.271122	2026-08-28 15:08:35.069535	Question	Zusammenhang Invariantenteiler und charakteristisches Polynom	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{5,5}(\\mathbb{Q})$ habe die Invariantenteiler $1,1,t-2,(t-2)(t-3),(t-2)(t-3)$. Gib das charakteristische Polynom von $A$ (als Polynom aus $\\mathbb{Q}[t]$) an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: "(t-2)^3*(t-3)^2"\n  tex: "\\\\left(t-2\\\\right)^{3} \\\\cdot \\\\left(t-3\\\\right)^{2}"\n  nerd: "(t-2)^3*(t-3)^2"\nexplanation: Es ist $d_5(A)=c_1(A)\\cdot\\ldots\\cdot c_5(A)$ und $d_5(A)=\\chi^{\\operatorname{char}}_A$.\n	free		\N	\N	23	f	2021-07-24 16:44:51.271122	\N	\N	\N	-1	1
36	\N	2020-07-24 16:46:02.067418	2026-08-28 15:08:35.069535	Question	Zusammenhang Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{6,6}(\\mathbb{Q})$ habe die Determinantenteiler $1,1,t-2,(t-2)^2,(t-2)^3,(t-2)^5(t-3)$. Gib die Invariantenteiler $c_1(A),\\ldots,c_6(A)$ als Tupel von Polynomen aus $\\mathbb{Q}[t]$ an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfTuple\n  value: 1,1,t-2,t-2,t-2,(t-2)^2*(t-3)\n  tex: "(1, 1, t-2, t-2, t-2, \\\\left(t-2\\\\right)^{2} \\\\cdot \\\\left(t-3\\\\right))"\n  nerd: vector(1,1,t-2,t-2,t-2,(t-2)^2*(t-3))\nexplanation: ''\n	free	\N	\N	\N	24	f	2021-07-24 16:46:02.067418	\N	\N	\N	-1	1
37	\N	2020-07-24 16:48:30.034301	2026-08-28 15:08:35.069535	Question	Frobenius-Normalform bestimmen	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{4,4}(\\mathbb{Q})$ habe die Invariantenteiler $1,1,(t-3)^2,(t-3)^2$. Gib die Frobenius-Normalform von $A$ an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfMatrix\n  row_count: 4\n  column_count: 4\n  coefficients:\n  - '0'\n  - "-9"\n  - '0'\n  - '0'\n  - '1'\n  - '6'\n  - '0'\n  - '0'\n  - '0'\n  - '0'\n  - '0'\n  - "-9"\n  - '0'\n  - '0'\n  - '1'\n  - '6'\n  tex: "\\\\begin{pmatrix}0 & -9 & 0 & 0 \\\\cr 1 & 6 & 0 & 0 \\\\cr 0 & 0 & 0 & -9 \\\\cr\n    0 & 0 & 1 & 6\\\\end{pmatrix}"\n  nerd: matrix([0,-9,0,0],[1,6,0,0],[0,0,0,-9],[0,0,1,6])\nexplanation: ''\n	free	\N	\N	\N	25	f	2021-07-24 16:48:30.034301	\N	\N	\N	-1	1
\.


--
-- TOC entry 4831 (class 0 OID 10132497)
-- Dependencies: 295
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
-- TOC entry 4833 (class 0 OID 10132504)
-- Dependencies: 297
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
118	1	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
119	2	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
123	8	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
124	9	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
125	10	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
126	12	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
127	13	28	Lecture	create	2025-07-14 11:44:51.866687	2025-07-14 11:44:51.866687
128	1	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
129	2	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
133	8	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
134	9	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
135	10	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
136	12	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
137	13	29	Lecture	create	2025-07-15 12:10:30.264902	2025-07-15 12:10:30.264902
138	2	1	Redemption	\N	2025-07-15 12:11:14.695912	2025-07-15 12:11:14.695912
139	2	2	Redemption	\N	2025-07-15 12:11:39.228347	2025-07-15 12:11:39.228347
140	2	3	Redemption	\N	2025-07-15 12:11:59.007461	2025-07-15 12:11:59.007461
141	5	52	Medium	create	2025-07-15 12:14:43.271386	2025-07-15 12:14:43.271386
142	6	52	Medium	create	2025-07-15 12:14:43.271386	2025-07-15 12:14:43.271386
143	7	52	Medium	create	2025-07-15 12:14:43.271386	2025-07-15 12:14:43.271386
1000	1	24	Announcement	create	2026-08-28 22:57:19.402207	2026-08-28 22:57:19.402207
1001	2	24	Announcement	create	2026-08-28 22:57:19.405783	2026-08-28 22:57:19.405783
1002	5	24	Announcement	create	2026-08-28 22:57:19.406746	2026-08-28 22:57:19.406746
1003	6	24	Announcement	create	2026-08-28 22:57:19.407683	2026-08-28 22:57:19.407683
1004	7	24	Announcement	create	2026-08-28 22:57:19.40938	2026-08-28 22:57:19.40938
1005	8	24	Announcement	create	2026-08-28 22:57:19.410743	2026-08-28 22:57:19.410743
1006	9	24	Announcement	create	2026-08-28 22:57:19.411799	2026-08-28 22:57:19.411799
1007	10	24	Announcement	create	2026-08-28 22:57:19.413885	2026-08-28 22:57:19.413885
1008	12	24	Announcement	create	2026-08-28 22:57:19.41538	2026-08-28 22:57:19.41538
1009	13	24	Announcement	create	2026-08-28 22:57:19.416489	2026-08-28 22:57:19.416489
1010	14	24	Announcement	create	2026-08-28 22:57:19.417412	2026-08-28 22:57:19.417412
1011	15	24	Announcement	create	2026-08-28 22:57:19.418324	2026-08-28 22:57:19.418324
1012	16	24	Announcement	create	2026-08-28 22:57:19.419185	2026-08-28 22:57:19.419185
1013	17	24	Announcement	create	2026-08-28 22:57:19.420038	2026-08-28 22:57:19.420038
1014	18	24	Announcement	create	2026-08-28 22:57:19.421691	2026-08-28 22:57:19.421691
1015	19	24	Announcement	create	2026-08-28 22:57:19.422539	2026-08-28 22:57:19.422539
1016	20	24	Announcement	create	2026-08-28 22:57:19.423372	2026-08-28 22:57:19.423372
1017	21	24	Announcement	create	2026-08-28 22:57:19.42443	2026-08-28 22:57:19.42443
1018	22	24	Announcement	create	2026-08-28 22:57:19.425256	2026-08-28 22:57:19.425256
1019	23	24	Announcement	create	2026-08-28 22:57:19.426548	2026-08-28 22:57:19.426548
1020	24	24	Announcement	create	2026-08-28 22:57:19.427568	2026-08-28 22:57:19.427568
1021	25	24	Announcement	create	2026-08-28 22:57:19.428615	2026-08-28 22:57:19.428615
1022	26	24	Announcement	create	2026-08-28 22:57:19.430979	2026-08-28 22:57:19.430979
1023	27	24	Announcement	create	2026-08-28 22:57:19.431979	2026-08-28 22:57:19.431979
1024	28	24	Announcement	create	2026-08-28 22:57:19.432891	2026-08-28 22:57:19.432891
1025	29	24	Announcement	create	2026-08-28 22:57:19.433728	2026-08-28 22:57:19.433728
1026	30	24	Announcement	create	2026-08-28 22:57:19.434615	2026-08-28 22:57:19.434615
1027	31	24	Announcement	create	2026-08-28 22:57:19.435453	2026-08-28 22:57:19.435453
1028	32	24	Announcement	create	2026-08-28 22:57:19.436301	2026-08-28 22:57:19.436301
1029	33	24	Announcement	create	2026-08-28 22:57:19.437722	2026-08-28 22:57:19.437722
1030	34	24	Announcement	create	2026-08-28 22:57:19.438615	2026-08-28 22:57:19.438615
1031	35	24	Announcement	create	2026-08-28 22:57:19.439482	2026-08-28 22:57:19.439482
1032	36	24	Announcement	create	2026-08-28 22:57:19.440296	2026-08-28 22:57:19.440296
1033	37	24	Announcement	create	2026-08-28 22:57:19.441079	2026-08-28 22:57:19.441079
1034	38	24	Announcement	create	2026-08-28 22:57:19.44189	2026-08-28 22:57:19.44189
1035	39	24	Announcement	create	2026-08-28 22:57:19.442931	2026-08-28 22:57:19.442931
1036	40	24	Announcement	create	2026-08-28 22:57:19.444442	2026-08-28 22:57:19.444442
1037	41	24	Announcement	create	2026-08-28 22:57:19.445365	2026-08-28 22:57:19.445365
1038	42	24	Announcement	create	2026-08-28 22:57:19.446273	2026-08-28 22:57:19.446273
1039	43	24	Announcement	create	2026-08-28 22:57:19.447148	2026-08-28 22:57:19.447148
1040	44	24	Announcement	create	2026-08-28 22:57:19.447993	2026-08-28 22:57:19.447993
1041	45	24	Announcement	create	2026-08-28 22:57:19.448836	2026-08-28 22:57:19.448836
1042	46	24	Announcement	create	2026-08-28 22:57:19.449678	2026-08-28 22:57:19.449678
1043	47	24	Announcement	create	2026-08-28 22:57:19.450534	2026-08-28 22:57:19.450534
1044	48	24	Announcement	create	2026-08-28 22:57:19.451393	2026-08-28 22:57:19.451393
1045	49	24	Announcement	create	2026-08-28 22:57:19.452217	2026-08-28 22:57:19.452217
1046	50	24	Announcement	create	2026-08-28 22:57:19.453718	2026-08-28 22:57:19.453718
1047	51	24	Announcement	create	2026-08-28 22:57:19.454642	2026-08-28 22:57:19.454642
1048	52	24	Announcement	create	2026-08-28 22:57:19.455452	2026-08-28 22:57:19.455452
1049	53	24	Announcement	create	2026-08-28 22:57:19.456239	2026-08-28 22:57:19.456239
1050	54	24	Announcement	create	2026-08-28 22:57:19.457022	2026-08-28 22:57:19.457022
1051	55	24	Announcement	create	2026-08-28 22:57:19.457845	2026-08-28 22:57:19.457845
1052	56	24	Announcement	create	2026-08-28 22:57:19.458811	2026-08-28 22:57:19.458811
1053	57	24	Announcement	create	2026-08-28 22:57:19.459646	2026-08-28 22:57:19.459646
1054	58	24	Announcement	create	2026-08-28 22:57:19.460517	2026-08-28 22:57:19.460517
1055	59	24	Announcement	create	2026-08-28 22:57:19.461784	2026-08-28 22:57:19.461784
1056	60	24	Announcement	create	2026-08-28 22:57:19.462666	2026-08-28 22:57:19.462666
1057	61	24	Announcement	create	2026-08-28 22:57:19.463679	2026-08-28 22:57:19.463679
1058	62	24	Announcement	create	2026-08-28 22:57:19.464515	2026-08-28 22:57:19.464515
1059	63	24	Announcement	create	2026-08-28 22:57:19.465315	2026-08-28 22:57:19.465315
1060	64	24	Announcement	create	2026-08-28 22:57:19.466182	2026-08-28 22:57:19.466182
1061	65	24	Announcement	create	2026-08-28 22:57:19.470238	2026-08-28 22:57:19.470238
1062	66	24	Announcement	create	2026-08-28 22:57:19.471824	2026-08-28 22:57:19.471824
1063	67	24	Announcement	create	2026-08-28 22:57:19.47289	2026-08-28 22:57:19.47289
1064	68	24	Announcement	create	2026-08-28 22:57:19.473785	2026-08-28 22:57:19.473785
1065	69	24	Announcement	create	2026-08-28 22:57:19.474724	2026-08-28 22:57:19.474724
1066	70	24	Announcement	create	2026-08-28 22:57:19.475562	2026-08-28 22:57:19.475562
1067	71	24	Announcement	create	2026-08-28 22:57:19.476393	2026-08-28 22:57:19.476393
1068	72	24	Announcement	create	2026-08-28 22:57:19.477279	2026-08-28 22:57:19.477279
1069	73	24	Announcement	create	2026-08-28 22:57:19.478562	2026-08-28 22:57:19.478562
1070	74	24	Announcement	create	2026-08-28 22:57:19.479577	2026-08-28 22:57:19.479577
1071	75	24	Announcement	create	2026-08-28 22:57:19.480417	2026-08-28 22:57:19.480417
1072	76	24	Announcement	create	2026-08-28 22:57:19.481235	2026-08-28 22:57:19.481235
1073	77	24	Announcement	create	2026-08-28 22:57:19.482099	2026-08-28 22:57:19.482099
1074	78	24	Announcement	create	2026-08-28 22:57:19.482947	2026-08-28 22:57:19.482947
1075	79	24	Announcement	create	2026-08-28 22:57:19.483791	2026-08-28 22:57:19.483791
1076	80	24	Announcement	create	2026-08-28 22:57:19.484678	2026-08-28 22:57:19.484678
1077	81	24	Announcement	create	2026-08-28 22:57:19.48549	2026-08-28 22:57:19.48549
1078	82	24	Announcement	create	2026-08-28 22:57:19.48633	2026-08-28 22:57:19.48633
1079	83	24	Announcement	create	2026-08-28 22:57:19.487152	2026-08-28 22:57:19.487152
1080	84	24	Announcement	create	2026-08-28 22:57:19.487953	2026-08-28 22:57:19.487953
1081	85	24	Announcement	create	2026-08-28 22:57:19.489422	2026-08-28 22:57:19.489422
1082	86	24	Announcement	create	2026-08-28 22:57:19.490534	2026-08-28 22:57:19.490534
1083	87	24	Announcement	create	2026-08-28 22:57:19.491371	2026-08-28 22:57:19.491371
1084	88	24	Announcement	create	2026-08-28 22:57:19.492175	2026-08-28 22:57:19.492175
1085	89	24	Announcement	create	2026-08-28 22:57:19.493007	2026-08-28 22:57:19.493007
1086	90	24	Announcement	create	2026-08-28 22:57:19.494086	2026-08-28 22:57:19.494086
1087	91	24	Announcement	create	2026-08-28 22:57:19.494923	2026-08-28 22:57:19.494923
1088	92	24	Announcement	create	2026-08-28 22:57:19.495889	2026-08-28 22:57:19.495889
1089	93	24	Announcement	create	2026-08-28 22:57:19.496754	2026-08-28 22:57:19.496754
1090	94	24	Announcement	create	2026-08-28 22:57:19.497573	2026-08-28 22:57:19.497573
1091	95	24	Announcement	create	2026-08-28 22:57:19.498435	2026-08-28 22:57:19.498435
1092	96	24	Announcement	create	2026-08-28 22:57:19.499437	2026-08-28 22:57:19.499437
1093	97	24	Announcement	create	2026-08-28 22:57:19.500257	2026-08-28 22:57:19.500257
1094	98	24	Announcement	create	2026-08-28 22:57:19.501056	2026-08-28 22:57:19.501056
1095	99	24	Announcement	create	2026-08-28 22:57:19.501858	2026-08-28 22:57:19.501858
1096	100	24	Announcement	create	2026-08-28 22:57:19.502755	2026-08-28 22:57:19.502755
1097	101	24	Announcement	create	2026-08-28 22:57:19.503587	2026-08-28 22:57:19.503587
1098	102	24	Announcement	create	2026-08-28 22:57:19.504449	2026-08-28 22:57:19.504449
1099	103	24	Announcement	create	2026-08-28 22:57:19.505258	2026-08-28 22:57:19.505258
1100	104	24	Announcement	create	2026-08-28 22:57:19.506122	2026-08-28 22:57:19.506122
1101	105	24	Announcement	create	2026-08-28 22:57:19.50698	2026-08-28 22:57:19.50698
1102	106	24	Announcement	create	2026-08-28 22:57:19.508759	2026-08-28 22:57:19.508759
1103	107	24	Announcement	create	2026-08-28 22:57:19.514227	2026-08-28 22:57:19.514227
1104	108	24	Announcement	create	2026-08-28 22:57:19.515386	2026-08-28 22:57:19.515386
1105	109	24	Announcement	create	2026-08-28 22:57:19.516263	2026-08-28 22:57:19.516263
1106	110	24	Announcement	create	2026-08-28 22:57:19.517178	2026-08-28 22:57:19.517178
1107	111	24	Announcement	create	2026-08-28 22:57:19.51806	2026-08-28 22:57:19.51806
1108	112	24	Announcement	create	2026-08-28 22:57:19.519096	2026-08-28 22:57:19.519096
1109	113	24	Announcement	create	2026-08-28 22:57:19.519966	2026-08-28 22:57:19.519966
1110	114	24	Announcement	create	2026-08-28 22:57:19.520889	2026-08-28 22:57:19.520889
1111	115	24	Announcement	create	2026-08-28 22:57:19.52262	2026-08-28 22:57:19.52262
1112	116	24	Announcement	create	2026-08-28 22:57:19.523644	2026-08-28 22:57:19.523644
1113	117	24	Announcement	create	2026-08-28 22:57:19.52491	2026-08-28 22:57:19.52491
1114	118	24	Announcement	create	2026-08-28 22:57:19.526107	2026-08-28 22:57:19.526107
1115	119	24	Announcement	create	2026-08-28 22:57:19.5271	2026-08-28 22:57:19.5271
1116	120	24	Announcement	create	2026-08-28 22:57:19.52802	2026-08-28 22:57:19.52802
1117	121	24	Announcement	create	2026-08-28 22:57:19.528966	2026-08-28 22:57:19.528966
1118	122	24	Announcement	create	2026-08-28 22:57:19.531357	2026-08-28 22:57:19.531357
1119	123	24	Announcement	create	2026-08-28 22:57:19.533369	2026-08-28 22:57:19.533369
1120	124	24	Announcement	create	2026-08-28 22:57:19.534333	2026-08-28 22:57:19.534333
1121	125	24	Announcement	create	2026-08-28 22:57:19.535516	2026-08-28 22:57:19.535516
1122	126	24	Announcement	create	2026-08-28 22:57:19.536533	2026-08-28 22:57:19.536533
1123	127	24	Announcement	create	2026-08-28 22:57:19.537463	2026-08-28 22:57:19.537463
1124	128	24	Announcement	create	2026-08-28 22:57:19.538467	2026-08-28 22:57:19.538467
1125	129	24	Announcement	create	2026-08-28 22:57:19.540074	2026-08-28 22:57:19.540074
1126	130	24	Announcement	create	2026-08-28 22:57:19.541031	2026-08-28 22:57:19.541031
1127	131	24	Announcement	create	2026-08-28 22:57:19.541893	2026-08-28 22:57:19.541893
1128	132	24	Announcement	create	2026-08-28 22:57:19.542762	2026-08-28 22:57:19.542762
1129	133	24	Announcement	create	2026-08-28 22:57:19.543663	2026-08-28 22:57:19.543663
1130	134	24	Announcement	create	2026-08-28 22:57:19.544632	2026-08-28 22:57:19.544632
1131	135	24	Announcement	create	2026-08-28 22:57:19.545932	2026-08-28 22:57:19.545932
1132	136	24	Announcement	create	2026-08-28 22:57:19.547602	2026-08-28 22:57:19.547602
1133	137	24	Announcement	create	2026-08-28 22:57:19.548552	2026-08-28 22:57:19.548552
1134	138	24	Announcement	create	2026-08-28 22:57:19.549445	2026-08-28 22:57:19.549445
1135	139	24	Announcement	create	2026-08-28 22:57:19.550729	2026-08-28 22:57:19.550729
1136	140	24	Announcement	create	2026-08-28 22:57:19.551903	2026-08-28 22:57:19.551903
1137	141	24	Announcement	create	2026-08-28 22:57:19.553044	2026-08-28 22:57:19.553044
1138	142	24	Announcement	create	2026-08-28 22:57:19.554233	2026-08-28 22:57:19.554233
1139	143	24	Announcement	create	2026-08-28 22:57:19.555255	2026-08-28 22:57:19.555255
1140	144	24	Announcement	create	2026-08-28 22:57:19.557003	2026-08-28 22:57:19.557003
1141	145	24	Announcement	create	2026-08-28 22:57:19.558086	2026-08-28 22:57:19.558086
1142	146	24	Announcement	create	2026-08-28 22:57:19.558986	2026-08-28 22:57:19.558986
1143	147	24	Announcement	create	2026-08-28 22:57:19.559813	2026-08-28 22:57:19.559813
1144	148	24	Announcement	create	2026-08-28 22:57:19.560657	2026-08-28 22:57:19.560657
1145	149	24	Announcement	create	2026-08-28 22:57:19.562116	2026-08-28 22:57:19.562116
1146	150	24	Announcement	create	2026-08-28 22:57:19.563226	2026-08-28 22:57:19.563226
1147	151	24	Announcement	create	2026-08-28 22:57:19.564152	2026-08-28 22:57:19.564152
1148	152	24	Announcement	create	2026-08-28 22:57:19.565141	2026-08-28 22:57:19.565141
1149	153	24	Announcement	create	2026-08-28 22:57:19.566081	2026-08-28 22:57:19.566081
1150	154	24	Announcement	create	2026-08-28 22:57:19.567547	2026-08-28 22:57:19.567547
1151	155	24	Announcement	create	2026-08-28 22:57:19.568505	2026-08-28 22:57:19.568505
1152	156	24	Announcement	create	2026-08-28 22:57:19.569399	2026-08-28 22:57:19.569399
1153	157	24	Announcement	create	2026-08-28 22:57:19.570351	2026-08-28 22:57:19.570351
1154	158	24	Announcement	create	2026-08-28 22:57:19.57122	2026-08-28 22:57:19.57122
1155	159	24	Announcement	create	2026-08-28 22:57:19.572088	2026-08-28 22:57:19.572088
1156	160	24	Announcement	create	2026-08-28 22:57:19.572945	2026-08-28 22:57:19.572945
1157	161	24	Announcement	create	2026-08-28 22:57:19.573836	2026-08-28 22:57:19.573836
1158	162	24	Announcement	create	2026-08-28 22:57:19.575402	2026-08-28 22:57:19.575402
1159	163	24	Announcement	create	2026-08-28 22:57:19.576404	2026-08-28 22:57:19.576404
1160	164	24	Announcement	create	2026-08-28 22:57:19.577375	2026-08-28 22:57:19.577375
1161	165	24	Announcement	create	2026-08-28 22:57:19.57839	2026-08-28 22:57:19.57839
1162	166	24	Announcement	create	2026-08-28 22:57:19.579553	2026-08-28 22:57:19.579553
1163	167	24	Announcement	create	2026-08-28 22:57:19.58049	2026-08-28 22:57:19.58049
1164	168	24	Announcement	create	2026-08-28 22:57:19.581352	2026-08-28 22:57:19.581352
1165	169	24	Announcement	create	2026-08-28 22:57:19.582287	2026-08-28 22:57:19.582287
1166	170	24	Announcement	create	2026-08-28 22:57:19.587034	2026-08-28 22:57:19.587034
1167	171	24	Announcement	create	2026-08-28 22:57:19.588143	2026-08-28 22:57:19.588143
1168	172	24	Announcement	create	2026-08-28 22:57:19.589108	2026-08-28 22:57:19.589108
1169	173	24	Announcement	create	2026-08-28 22:57:19.590036	2026-08-28 22:57:19.590036
1170	174	24	Announcement	create	2026-08-28 22:57:19.590966	2026-08-28 22:57:19.590966
1171	175	24	Announcement	create	2026-08-28 22:57:19.59186	2026-08-28 22:57:19.59186
1172	176	24	Announcement	create	2026-08-28 22:57:19.592748	2026-08-28 22:57:19.592748
1173	177	24	Announcement	create	2026-08-28 22:57:19.593626	2026-08-28 22:57:19.593626
1174	178	24	Announcement	create	2026-08-28 22:57:19.594679	2026-08-28 22:57:19.594679
1175	179	24	Announcement	create	2026-08-28 22:57:19.595886	2026-08-28 22:57:19.595886
1176	180	24	Announcement	create	2026-08-28 22:57:19.596919	2026-08-28 22:57:19.596919
1177	181	24	Announcement	create	2026-08-28 22:57:19.598287	2026-08-28 22:57:19.598287
1178	182	24	Announcement	create	2026-08-28 22:57:19.599304	2026-08-28 22:57:19.599304
1179	183	24	Announcement	create	2026-08-28 22:57:19.600218	2026-08-28 22:57:19.600218
1180	184	24	Announcement	create	2026-08-28 22:57:19.601124	2026-08-28 22:57:19.601124
1181	1	25	Announcement	create	2026-08-28 22:57:19.607123	2026-08-28 22:57:19.607123
1182	2	25	Announcement	create	2026-08-28 22:57:19.608221	2026-08-28 22:57:19.608221
1183	5	25	Announcement	create	2026-08-28 22:57:19.609343	2026-08-28 22:57:19.609343
1184	6	25	Announcement	create	2026-08-28 22:57:19.610328	2026-08-28 22:57:19.610328
1185	7	25	Announcement	create	2026-08-28 22:57:19.613945	2026-08-28 22:57:19.613945
1186	8	25	Announcement	create	2026-08-28 22:57:19.615501	2026-08-28 22:57:19.615501
1187	9	25	Announcement	create	2026-08-28 22:57:19.617082	2026-08-28 22:57:19.617082
1188	10	25	Announcement	create	2026-08-28 22:57:19.618343	2026-08-28 22:57:19.618343
1189	12	25	Announcement	create	2026-08-28 22:57:19.619377	2026-08-28 22:57:19.619377
1190	13	25	Announcement	create	2026-08-28 22:57:19.620332	2026-08-28 22:57:19.620332
1191	14	25	Announcement	create	2026-08-28 22:57:19.621211	2026-08-28 22:57:19.621211
1192	15	25	Announcement	create	2026-08-28 22:57:19.622122	2026-08-28 22:57:19.622122
1193	16	25	Announcement	create	2026-08-28 22:57:19.622993	2026-08-28 22:57:19.622993
1194	17	25	Announcement	create	2026-08-28 22:57:19.623891	2026-08-28 22:57:19.623891
1195	18	25	Announcement	create	2026-08-28 22:57:19.624755	2026-08-28 22:57:19.624755
1196	19	25	Announcement	create	2026-08-28 22:57:19.625615	2026-08-28 22:57:19.625615
1197	20	25	Announcement	create	2026-08-28 22:57:19.626701	2026-08-28 22:57:19.626701
1198	21	25	Announcement	create	2026-08-28 22:57:19.627714	2026-08-28 22:57:19.627714
1199	22	25	Announcement	create	2026-08-28 22:57:19.628626	2026-08-28 22:57:19.628626
1200	23	25	Announcement	create	2026-08-28 22:57:19.62945	2026-08-28 22:57:19.62945
1201	24	25	Announcement	create	2026-08-28 22:57:19.630373	2026-08-28 22:57:19.630373
1202	25	25	Announcement	create	2026-08-28 22:57:19.631434	2026-08-28 22:57:19.631434
1203	26	25	Announcement	create	2026-08-28 22:57:19.637331	2026-08-28 22:57:19.637331
1204	27	25	Announcement	create	2026-08-28 22:57:19.638511	2026-08-28 22:57:19.638511
1205	28	25	Announcement	create	2026-08-28 22:57:19.63942	2026-08-28 22:57:19.63942
1206	29	25	Announcement	create	2026-08-28 22:57:19.64033	2026-08-28 22:57:19.64033
1207	30	25	Announcement	create	2026-08-28 22:57:19.641159	2026-08-28 22:57:19.641159
1208	31	25	Announcement	create	2026-08-28 22:57:19.642037	2026-08-28 22:57:19.642037
1209	32	25	Announcement	create	2026-08-28 22:57:19.643007	2026-08-28 22:57:19.643007
1210	33	25	Announcement	create	2026-08-28 22:57:19.644042	2026-08-28 22:57:19.644042
1211	34	25	Announcement	create	2026-08-28 22:57:19.64624	2026-08-28 22:57:19.64624
1212	35	25	Announcement	create	2026-08-28 22:57:19.647306	2026-08-28 22:57:19.647306
1213	36	25	Announcement	create	2026-08-28 22:57:19.648847	2026-08-28 22:57:19.648847
1214	37	25	Announcement	create	2026-08-28 22:57:19.650259	2026-08-28 22:57:19.650259
1215	38	25	Announcement	create	2026-08-28 22:57:19.651644	2026-08-28 22:57:19.651644
1216	39	25	Announcement	create	2026-08-28 22:57:19.653168	2026-08-28 22:57:19.653168
1217	40	25	Announcement	create	2026-08-28 22:57:19.654783	2026-08-28 22:57:19.654783
1218	41	25	Announcement	create	2026-08-28 22:57:19.655839	2026-08-28 22:57:19.655839
1219	42	25	Announcement	create	2026-08-28 22:57:19.657508	2026-08-28 22:57:19.657508
1220	43	25	Announcement	create	2026-08-28 22:57:19.658489	2026-08-28 22:57:19.658489
1221	44	25	Announcement	create	2026-08-28 22:57:19.659344	2026-08-28 22:57:19.659344
1222	45	25	Announcement	create	2026-08-28 22:57:19.660247	2026-08-28 22:57:19.660247
1223	46	25	Announcement	create	2026-08-28 22:57:19.661168	2026-08-28 22:57:19.661168
1224	47	25	Announcement	create	2026-08-28 22:57:19.662119	2026-08-28 22:57:19.662119
1225	48	25	Announcement	create	2026-08-28 22:57:19.663175	2026-08-28 22:57:19.663175
1226	49	25	Announcement	create	2026-08-28 22:57:19.664264	2026-08-28 22:57:19.664264
1227	50	25	Announcement	create	2026-08-28 22:57:19.66636	2026-08-28 22:57:19.66636
1228	51	25	Announcement	create	2026-08-28 22:57:19.667774	2026-08-28 22:57:19.667774
1229	52	25	Announcement	create	2026-08-28 22:57:19.669148	2026-08-28 22:57:19.669148
1230	53	25	Announcement	create	2026-08-28 22:57:19.670159	2026-08-28 22:57:19.670159
1231	54	25	Announcement	create	2026-08-28 22:57:19.671087	2026-08-28 22:57:19.671087
1232	55	25	Announcement	create	2026-08-28 22:57:19.671966	2026-08-28 22:57:19.671966
1233	56	25	Announcement	create	2026-08-28 22:57:19.672907	2026-08-28 22:57:19.672907
1234	57	25	Announcement	create	2026-08-28 22:57:19.674538	2026-08-28 22:57:19.674538
1235	58	25	Announcement	create	2026-08-28 22:57:19.675615	2026-08-28 22:57:19.675615
1236	59	25	Announcement	create	2026-08-28 22:57:19.67649	2026-08-28 22:57:19.67649
1237	60	25	Announcement	create	2026-08-28 22:57:19.677529	2026-08-28 22:57:19.677529
1238	61	25	Announcement	create	2026-08-28 22:57:19.678502	2026-08-28 22:57:19.678502
1239	62	25	Announcement	create	2026-08-28 22:57:19.679437	2026-08-28 22:57:19.679437
1240	63	25	Announcement	create	2026-08-28 22:57:19.680334	2026-08-28 22:57:19.680334
1241	64	25	Announcement	create	2026-08-28 22:57:19.681193	2026-08-28 22:57:19.681193
1242	65	25	Announcement	create	2026-08-28 22:57:19.682096	2026-08-28 22:57:19.682096
1243	66	25	Announcement	create	2026-08-28 22:57:19.682997	2026-08-28 22:57:19.682997
1244	67	25	Announcement	create	2026-08-28 22:57:19.684398	2026-08-28 22:57:19.684398
1245	68	25	Announcement	create	2026-08-28 22:57:19.685331	2026-08-28 22:57:19.685331
1246	69	25	Announcement	create	2026-08-28 22:57:19.686193	2026-08-28 22:57:19.686193
1247	70	25	Announcement	create	2026-08-28 22:57:19.687023	2026-08-28 22:57:19.687023
1248	71	25	Announcement	create	2026-08-28 22:57:19.687846	2026-08-28 22:57:19.687846
1249	72	25	Announcement	create	2026-08-28 22:57:19.688678	2026-08-28 22:57:19.688678
1250	73	25	Announcement	create	2026-08-28 22:57:19.68948	2026-08-28 22:57:19.68948
1251	74	25	Announcement	create	2026-08-28 22:57:19.690355	2026-08-28 22:57:19.690355
1252	75	25	Announcement	create	2026-08-28 22:57:19.691714	2026-08-28 22:57:19.691714
1253	76	25	Announcement	create	2026-08-28 22:57:19.693239	2026-08-28 22:57:19.693239
1254	77	25	Announcement	create	2026-08-28 22:57:19.694406	2026-08-28 22:57:19.694406
1255	78	25	Announcement	create	2026-08-28 22:57:19.695276	2026-08-28 22:57:19.695276
1256	79	25	Announcement	create	2026-08-28 22:57:19.696131	2026-08-28 22:57:19.696131
1257	80	25	Announcement	create	2026-08-28 22:57:19.696941	2026-08-28 22:57:19.696941
1258	81	25	Announcement	create	2026-08-28 22:57:19.697798	2026-08-28 22:57:19.697798
1259	82	25	Announcement	create	2026-08-28 22:57:19.698678	2026-08-28 22:57:19.698678
1260	83	25	Announcement	create	2026-08-28 22:57:19.699503	2026-08-28 22:57:19.699503
1261	84	25	Announcement	create	2026-08-28 22:57:19.700327	2026-08-28 22:57:19.700327
1262	85	25	Announcement	create	2026-08-28 22:57:19.701521	2026-08-28 22:57:19.701521
1263	86	25	Announcement	create	2026-08-28 22:57:19.702408	2026-08-28 22:57:19.702408
1264	87	25	Announcement	create	2026-08-28 22:57:19.703237	2026-08-28 22:57:19.703237
1265	88	25	Announcement	create	2026-08-28 22:57:19.704045	2026-08-28 22:57:19.704045
1266	89	25	Announcement	create	2026-08-28 22:57:19.708603	2026-08-28 22:57:19.708603
1267	90	25	Announcement	create	2026-08-28 22:57:19.709825	2026-08-28 22:57:19.709825
1268	91	25	Announcement	create	2026-08-28 22:57:19.710776	2026-08-28 22:57:19.710776
1269	92	25	Announcement	create	2026-08-28 22:57:19.71164	2026-08-28 22:57:19.71164
1270	93	25	Announcement	create	2026-08-28 22:57:19.7125	2026-08-28 22:57:19.7125
1271	94	25	Announcement	create	2026-08-28 22:57:19.713306	2026-08-28 22:57:19.713306
1272	95	25	Announcement	create	2026-08-28 22:57:19.714186	2026-08-28 22:57:19.714186
1273	96	25	Announcement	create	2026-08-28 22:57:19.715022	2026-08-28 22:57:19.715022
1274	97	25	Announcement	create	2026-08-28 22:57:19.715862	2026-08-28 22:57:19.715862
1275	98	25	Announcement	create	2026-08-28 22:57:19.716719	2026-08-28 22:57:19.716719
1276	99	25	Announcement	create	2026-08-28 22:57:19.717551	2026-08-28 22:57:19.717551
1277	100	25	Announcement	create	2026-08-28 22:57:19.718469	2026-08-28 22:57:19.718469
1278	101	25	Announcement	create	2026-08-28 22:57:19.719317	2026-08-28 22:57:19.719317
1279	102	25	Announcement	create	2026-08-28 22:57:19.720152	2026-08-28 22:57:19.720152
1280	103	25	Announcement	create	2026-08-28 22:57:19.720982	2026-08-28 22:57:19.720982
1281	104	25	Announcement	create	2026-08-28 22:57:19.721807	2026-08-28 22:57:19.721807
1282	105	25	Announcement	create	2026-08-28 22:57:19.722794	2026-08-28 22:57:19.722794
1283	106	25	Announcement	create	2026-08-28 22:57:19.723684	2026-08-28 22:57:19.723684
1284	107	25	Announcement	create	2026-08-28 22:57:19.724608	2026-08-28 22:57:19.724608
1285	108	25	Announcement	create	2026-08-28 22:57:19.725482	2026-08-28 22:57:19.725482
1286	109	25	Announcement	create	2026-08-28 22:57:19.726414	2026-08-28 22:57:19.726414
1287	110	25	Announcement	create	2026-08-28 22:57:19.727293	2026-08-28 22:57:19.727293
1288	111	25	Announcement	create	2026-08-28 22:57:19.728139	2026-08-28 22:57:19.728139
1289	112	25	Announcement	create	2026-08-28 22:57:19.728982	2026-08-28 22:57:19.728982
1290	113	25	Announcement	create	2026-08-28 22:57:19.729809	2026-08-28 22:57:19.729809
1291	114	25	Announcement	create	2026-08-28 22:57:19.730699	2026-08-28 22:57:19.730699
1292	115	25	Announcement	create	2026-08-28 22:57:19.731559	2026-08-28 22:57:19.731559
1293	116	25	Announcement	create	2026-08-28 22:57:19.732396	2026-08-28 22:57:19.732396
1294	117	25	Announcement	create	2026-08-28 22:57:19.733209	2026-08-28 22:57:19.733209
1295	118	25	Announcement	create	2026-08-28 22:57:19.734041	2026-08-28 22:57:19.734041
1296	119	25	Announcement	create	2026-08-28 22:57:19.734888	2026-08-28 22:57:19.734888
1297	120	25	Announcement	create	2026-08-28 22:57:19.735691	2026-08-28 22:57:19.735691
1298	121	25	Announcement	create	2026-08-28 22:57:19.736583	2026-08-28 22:57:19.736583
1299	122	25	Announcement	create	2026-08-28 22:57:19.737383	2026-08-28 22:57:19.737383
1300	123	25	Announcement	create	2026-08-28 22:57:19.738281	2026-08-28 22:57:19.738281
1301	124	25	Announcement	create	2026-08-28 22:57:19.739176	2026-08-28 22:57:19.739176
1302	125	25	Announcement	create	2026-08-28 22:57:19.740022	2026-08-28 22:57:19.740022
1303	126	25	Announcement	create	2026-08-28 22:57:19.740828	2026-08-28 22:57:19.740828
1304	127	25	Announcement	create	2026-08-28 22:57:19.741674	2026-08-28 22:57:19.741674
1305	128	25	Announcement	create	2026-08-28 22:57:19.746879	2026-08-28 22:57:19.746879
1306	129	25	Announcement	create	2026-08-28 22:57:19.747854	2026-08-28 22:57:19.747854
1307	130	25	Announcement	create	2026-08-28 22:57:19.748673	2026-08-28 22:57:19.748673
1308	131	25	Announcement	create	2026-08-28 22:57:19.749497	2026-08-28 22:57:19.749497
1309	132	25	Announcement	create	2026-08-28 22:57:19.750428	2026-08-28 22:57:19.750428
1310	133	25	Announcement	create	2026-08-28 22:57:19.751255	2026-08-28 22:57:19.751255
1311	134	25	Announcement	create	2026-08-28 22:57:19.752135	2026-08-28 22:57:19.752135
1312	135	25	Announcement	create	2026-08-28 22:57:19.752968	2026-08-28 22:57:19.752968
1313	136	25	Announcement	create	2026-08-28 22:57:19.755246	2026-08-28 22:57:19.755246
1314	137	25	Announcement	create	2026-08-28 22:57:19.756105	2026-08-28 22:57:19.756105
1315	138	25	Announcement	create	2026-08-28 22:57:19.756916	2026-08-28 22:57:19.756916
1316	139	25	Announcement	create	2026-08-28 22:57:19.75778	2026-08-28 22:57:19.75778
1317	140	25	Announcement	create	2026-08-28 22:57:19.758809	2026-08-28 22:57:19.758809
1318	141	25	Announcement	create	2026-08-28 22:57:19.759666	2026-08-28 22:57:19.759666
1319	142	25	Announcement	create	2026-08-28 22:57:19.760494	2026-08-28 22:57:19.760494
1320	143	25	Announcement	create	2026-08-28 22:57:19.761323	2026-08-28 22:57:19.761323
1321	144	25	Announcement	create	2026-08-28 22:57:19.762882	2026-08-28 22:57:19.762882
1322	145	25	Announcement	create	2026-08-28 22:57:19.763749	2026-08-28 22:57:19.763749
1323	146	25	Announcement	create	2026-08-28 22:57:19.764777	2026-08-28 22:57:19.764777
1324	147	25	Announcement	create	2026-08-28 22:57:19.765972	2026-08-28 22:57:19.765972
1325	148	25	Announcement	create	2026-08-28 22:57:19.76716	2026-08-28 22:57:19.76716
1326	149	25	Announcement	create	2026-08-28 22:57:19.768101	2026-08-28 22:57:19.768101
1327	150	25	Announcement	create	2026-08-28 22:57:19.768947	2026-08-28 22:57:19.768947
1328	151	25	Announcement	create	2026-08-28 22:57:19.770035	2026-08-28 22:57:19.770035
1329	152	25	Announcement	create	2026-08-28 22:57:19.771857	2026-08-28 22:57:19.771857
1330	153	25	Announcement	create	2026-08-28 22:57:19.772774	2026-08-28 22:57:19.772774
1331	154	25	Announcement	create	2026-08-28 22:57:19.773594	2026-08-28 22:57:19.773594
1332	155	25	Announcement	create	2026-08-28 22:57:19.774474	2026-08-28 22:57:19.774474
1333	156	25	Announcement	create	2026-08-28 22:57:19.775336	2026-08-28 22:57:19.775336
1334	157	25	Announcement	create	2026-08-28 22:57:19.776165	2026-08-28 22:57:19.776165
1335	158	25	Announcement	create	2026-08-28 22:57:19.776978	2026-08-28 22:57:19.776978
1336	159	25	Announcement	create	2026-08-28 22:57:19.778589	2026-08-28 22:57:19.778589
1337	160	25	Announcement	create	2026-08-28 22:57:19.779443	2026-08-28 22:57:19.779443
1338	161	25	Announcement	create	2026-08-28 22:57:19.780245	2026-08-28 22:57:19.780245
1339	162	25	Announcement	create	2026-08-28 22:57:19.781042	2026-08-28 22:57:19.781042
1340	163	25	Announcement	create	2026-08-28 22:57:19.781872	2026-08-28 22:57:19.781872
1341	164	25	Announcement	create	2026-08-28 22:57:19.782737	2026-08-28 22:57:19.782737
1342	165	25	Announcement	create	2026-08-28 22:57:19.78353	2026-08-28 22:57:19.78353
1343	166	25	Announcement	create	2026-08-28 22:57:19.784338	2026-08-28 22:57:19.784338
1344	167	25	Announcement	create	2026-08-28 22:57:19.785227	2026-08-28 22:57:19.785227
1345	168	25	Announcement	create	2026-08-28 22:57:19.78634	2026-08-28 22:57:19.78634
1346	169	25	Announcement	create	2026-08-28 22:57:19.787913	2026-08-28 22:57:19.787913
1347	170	25	Announcement	create	2026-08-28 22:57:19.789097	2026-08-28 22:57:19.789097
1348	171	25	Announcement	create	2026-08-28 22:57:19.790088	2026-08-28 22:57:19.790088
1349	172	25	Announcement	create	2026-08-28 22:57:19.791056	2026-08-28 22:57:19.791056
1350	173	25	Announcement	create	2026-08-28 22:57:19.792002	2026-08-28 22:57:19.792002
1351	174	25	Announcement	create	2026-08-28 22:57:19.792869	2026-08-28 22:57:19.792869
1352	175	25	Announcement	create	2026-08-28 22:57:19.793722	2026-08-28 22:57:19.793722
1353	176	25	Announcement	create	2026-08-28 22:57:19.794577	2026-08-28 22:57:19.794577
1354	177	25	Announcement	create	2026-08-28 22:57:19.796077	2026-08-28 22:57:19.796077
1355	178	25	Announcement	create	2026-08-28 22:57:19.797011	2026-08-28 22:57:19.797011
1356	179	25	Announcement	create	2026-08-28 22:57:19.797912	2026-08-28 22:57:19.797912
1357	180	25	Announcement	create	2026-08-28 22:57:19.798994	2026-08-28 22:57:19.798994
1358	181	25	Announcement	create	2026-08-28 22:57:19.799998	2026-08-28 22:57:19.799998
1359	182	25	Announcement	create	2026-08-28 22:57:19.800998	2026-08-28 22:57:19.800998
1360	183	25	Announcement	create	2026-08-28 22:57:19.802032	2026-08-28 22:57:19.802032
1361	184	25	Announcement	create	2026-08-28 22:57:19.802929	2026-08-28 22:57:19.802929
1362	1	26	Announcement	create	2026-08-28 22:57:19.816894	2026-08-28 22:57:19.816894
1363	2	26	Announcement	create	2026-08-28 22:57:19.818023	2026-08-28 22:57:19.818023
1364	5	26	Announcement	create	2026-08-28 22:57:19.822076	2026-08-28 22:57:19.822076
1365	6	26	Announcement	create	2026-08-28 22:57:19.8235	2026-08-28 22:57:19.8235
1366	7	26	Announcement	create	2026-08-28 22:57:19.824407	2026-08-28 22:57:19.824407
1367	8	26	Announcement	create	2026-08-28 22:57:19.825258	2026-08-28 22:57:19.825258
1368	9	26	Announcement	create	2026-08-28 22:57:19.826133	2026-08-28 22:57:19.826133
1369	10	26	Announcement	create	2026-08-28 22:57:19.826965	2026-08-28 22:57:19.826965
1370	14	26	Announcement	create	2026-08-28 22:57:19.827797	2026-08-28 22:57:19.827797
1371	15	26	Announcement	create	2026-08-28 22:57:19.828611	2026-08-28 22:57:19.828611
1372	16	26	Announcement	create	2026-08-28 22:57:19.829469	2026-08-28 22:57:19.829469
1373	17	26	Announcement	create	2026-08-28 22:57:19.830379	2026-08-28 22:57:19.830379
1374	18	26	Announcement	create	2026-08-28 22:57:19.831382	2026-08-28 22:57:19.831382
1375	19	26	Announcement	create	2026-08-28 22:57:19.832357	2026-08-28 22:57:19.832357
1376	20	26	Announcement	create	2026-08-28 22:57:19.833267	2026-08-28 22:57:19.833267
1377	21	26	Announcement	create	2026-08-28 22:57:19.834272	2026-08-28 22:57:19.834272
1378	22	26	Announcement	create	2026-08-28 22:57:19.83515	2026-08-28 22:57:19.83515
1379	23	26	Announcement	create	2026-08-28 22:57:19.835985	2026-08-28 22:57:19.835985
1380	24	26	Announcement	create	2026-08-28 22:57:19.836803	2026-08-28 22:57:19.836803
1381	25	26	Announcement	create	2026-08-28 22:57:19.837612	2026-08-28 22:57:19.837612
1382	26	26	Announcement	create	2026-08-28 22:57:19.838501	2026-08-28 22:57:19.838501
1383	27	26	Announcement	create	2026-08-28 22:57:19.839347	2026-08-28 22:57:19.839347
1384	28	26	Announcement	create	2026-08-28 22:57:19.840226	2026-08-28 22:57:19.840226
1385	29	26	Announcement	create	2026-08-28 22:57:19.841141	2026-08-28 22:57:19.841141
1386	30	26	Announcement	create	2026-08-28 22:57:19.842042	2026-08-28 22:57:19.842042
1387	31	26	Announcement	create	2026-08-28 22:57:19.842898	2026-08-28 22:57:19.842898
1388	32	26	Announcement	create	2026-08-28 22:57:19.843715	2026-08-28 22:57:19.843715
1389	33	26	Announcement	create	2026-08-28 22:57:19.844538	2026-08-28 22:57:19.844538
1390	34	26	Announcement	create	2026-08-28 22:57:19.8454	2026-08-28 22:57:19.8454
1391	35	26	Announcement	create	2026-08-28 22:57:19.846395	2026-08-28 22:57:19.846395
1392	36	26	Announcement	create	2026-08-28 22:57:19.847331	2026-08-28 22:57:19.847331
1393	37	26	Announcement	create	2026-08-28 22:57:19.848187	2026-08-28 22:57:19.848187
1394	38	26	Announcement	create	2026-08-28 22:57:19.849014	2026-08-28 22:57:19.849014
1395	39	26	Announcement	create	2026-08-28 22:57:19.849818	2026-08-28 22:57:19.849818
1396	40	26	Announcement	create	2026-08-28 22:57:19.850726	2026-08-28 22:57:19.850726
1397	41	26	Announcement	create	2026-08-28 22:57:19.851587	2026-08-28 22:57:19.851587
1398	42	26	Announcement	create	2026-08-28 22:57:19.852428	2026-08-28 22:57:19.852428
1399	43	26	Announcement	create	2026-08-28 22:57:19.853245	2026-08-28 22:57:19.853245
1400	44	26	Announcement	create	2026-08-28 22:57:19.854103	2026-08-28 22:57:19.854103
1401	45	26	Announcement	create	2026-08-28 22:57:19.854918	2026-08-28 22:57:19.854918
1402	1	27	Announcement	create	2026-08-28 22:57:19.86374	2026-08-28 22:57:19.86374
1403	2	27	Announcement	create	2026-08-28 22:57:19.864694	2026-08-28 22:57:19.864694
1404	5	27	Announcement	create	2026-08-28 22:57:19.865584	2026-08-28 22:57:19.865584
1405	6	27	Announcement	create	2026-08-28 22:57:19.866468	2026-08-28 22:57:19.866468
1406	7	27	Announcement	create	2026-08-28 22:57:19.867422	2026-08-28 22:57:19.867422
1407	8	27	Announcement	create	2026-08-28 22:57:19.869055	2026-08-28 22:57:19.869055
1408	9	27	Announcement	create	2026-08-28 22:57:19.870107	2026-08-28 22:57:19.870107
1409	10	27	Announcement	create	2026-08-28 22:57:19.870932	2026-08-28 22:57:19.870932
1410	5	28	Announcement	create	2026-08-28 22:57:19.876488	2026-08-28 22:57:19.876488
1411	6	28	Announcement	create	2026-08-28 22:57:19.877831	2026-08-28 22:57:19.877831
1412	7	28	Announcement	create	2026-08-28 22:57:19.879953	2026-08-28 22:57:19.879953
1413	2	29	Announcement	create	2026-08-28 22:57:19.885093	2026-08-28 22:57:19.885093
1414	5	29	Announcement	create	2026-08-28 22:57:19.886058	2026-08-28 22:57:19.886058
1415	6	29	Announcement	create	2026-08-28 22:57:19.88694	2026-08-28 22:57:19.88694
1416	7	29	Announcement	create	2026-08-28 22:57:19.888676	2026-08-28 22:57:19.888676
1417	2	32	Announcement	create	2026-08-28 22:57:19.904752	2026-08-28 22:57:19.904752
1418	46	32	Announcement	create	2026-08-28 22:57:19.905755	2026-08-28 22:57:19.905755
1419	47	32	Announcement	create	2026-08-28 22:57:19.906631	2026-08-28 22:57:19.906631
1420	48	32	Announcement	create	2026-08-28 22:57:19.907524	2026-08-28 22:57:19.907524
1421	49	32	Announcement	create	2026-08-28 22:57:19.908513	2026-08-28 22:57:19.908513
1422	50	32	Announcement	create	2026-08-28 22:57:19.910894	2026-08-28 22:57:19.910894
1423	51	32	Announcement	create	2026-08-28 22:57:19.912292	2026-08-28 22:57:19.912292
1424	52	32	Announcement	create	2026-08-28 22:57:19.913277	2026-08-28 22:57:19.913277
1425	53	32	Announcement	create	2026-08-28 22:57:19.914221	2026-08-28 22:57:19.914221
1426	54	32	Announcement	create	2026-08-28 22:57:19.915152	2026-08-28 22:57:19.915152
1427	55	32	Announcement	create	2026-08-28 22:57:19.916119	2026-08-28 22:57:19.916119
1428	56	32	Announcement	create	2026-08-28 22:57:19.91703	2026-08-28 22:57:19.91703
1429	57	32	Announcement	create	2026-08-28 22:57:19.918001	2026-08-28 22:57:19.918001
\.


--
-- TOC entry 4835 (class 0 OID 10132513)
-- Dependencies: 299
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
79	2025-07-15 12:04:34.67541	2025-07-15 12:04:34.67541	divisibility	en	46	\N
80	2025-07-15 12:04:34.685301	2025-07-15 12:04:34.685301	Teilbarkeit	de	46	\N
81	2025-07-15 12:05:40.4062	2025-07-15 12:05:40.4062	prime number	en	47	\N
82	2025-07-15 12:05:40.410207	2025-07-15 12:05:40.410207	Primzahl	de	47	\N
83	2025-07-15 12:08:23.04139	2025-07-15 12:08:23.04139	RSA cryptosystem	en	48	\N
84	2025-07-15 12:08:23.047457	2025-07-15 12:08:23.047457	RSA-Verschlusselung	de	48	\N
\.


--
-- TOC entry 4837 (class 0 OID 10132522)
-- Dependencies: 301
-- Data for Name: program_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.program_translations (id, program_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:11:01.072876	2020-07-24 13:11:01.072876	BSc 100%
2	1	en	2020-07-24 13:11:01.075914	2020-07-24 13:11:01.075914	BSc 100%
3	2	de	2020-07-24 13:11:37.797744	2020-07-24 13:11:37.797744	BSc 100%
4	2	en	2020-07-24 13:11:37.800449	2020-07-24 13:11:37.800449	BSc 100%
\.


--
-- TOC entry 4839 (class 0 OID 10132533)
-- Dependencies: 303
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programs (id, created_at, updated_at, subject_id) FROM stdin;
1	2020-07-24 13:11:01.069662	2020-07-24 13:11:01.069662	1
2	2020-07-24 13:11:37.794408	2020-07-24 13:11:37.794408	2
\.


--
-- TOC entry 4841 (class 0 OID 10132540)
-- Dependencies: 305
-- Data for Name: quiz_certificates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quiz_certificates (id, quiz_id, user_id, code, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 10132550)
-- Dependencies: 306
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.readers (id, user_id, thread_id, created_at, updated_at) FROM stdin;
1	3	1	2020-09-02 09:20:23.743252	2020-09-02 09:20:23.750381
\.


--
-- TOC entry 4844 (class 0 OID 10132557)
-- Dependencies: 308
-- Data for Name: redemptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.redemptions (id, voucher_id, user_id, created_at, updated_at) FROM stdin;
1	8ed8a767-7faa-486c-a757-7417ffd04c3d	5	2025-07-15 12:11:14.688568	2025-07-15 12:11:14.688568
2	8ed8a767-7faa-486c-a757-7417ffd04c3d	6	2025-07-15 12:11:39.223198	2025-07-15 12:11:39.223198
3	8ed8a767-7faa-486c-a757-7417ffd04c3d	7	2025-07-15 12:11:58.999334	2025-07-15 12:11:58.999334
\.


--
-- TOC entry 4846 (class 0 OID 10132566)
-- Dependencies: 310
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
-- TOC entry 4848 (class 0 OID 10132575)
-- Dependencies: 312
-- Data for Name: registration_campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_campaigns (campaignable_type, campaignable_id, description, allocation_mode, status, registration_deadline, created_at, updated_at, id, last_allocation_calculated_at, allocation_decided_at) FROM stdin;
Lecture	1	Demo Lecture Roster Campaign	1	4	2026-09-04 22:57:13.422424	2026-08-28 22:57:13.430905	2026-08-28 22:57:14.285278	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.935296	2026-08-28 22:57:13.936444
Lecture	30	Demo Seminar Roster Campaign	1	4	2026-09-04 22:57:14.625873	2026-08-28 22:57:14.632553	2026-08-28 22:57:15.097914	f4548178-f640-4c08-9f4a-f53d4890b6f3	2026-08-28 22:57:15.020018	2026-08-28 22:57:15.020699
Lecture	31	Stage 1: Planning	0	2	2026-09-04 22:57:16.226178	2026-08-28 22:57:16.228444	2026-08-28 22:57:16.311692	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	\N	\N
Lecture	32	Anmeldung	0	1	2027-08-28 22:57:16.596085	2026-08-26 19:49:14.408239	2026-08-26 19:49:14.430417	114e0f13-144d-4e47-93d6-c4926bec2fa1	\N	\N
Lecture	37	Anmeldung zu den Übungsgruppen	0	1	2027-08-28 22:57:16.596085	2026-08-26 19:49:15.598413	2026-08-26 19:49:15.635743	f3abc265-8d50-4fbe-b44c-0fa27d228f47	\N	\N
Lecture	38	Vergabe der Vortragsthemen	0	1	2027-08-28 22:57:16.596085	2026-08-26 19:49:15.704716	2026-08-26 19:49:15.893139	42b6546f-5f6d-4741-abc7-f7d169d09b87	\N	\N
Lecture	39	Solver Test Campaign	1	1	2027-08-28 22:57:16.596085	2026-08-28 15:08:31.407163	2026-08-28 15:08:31.440607	bafa1987-373b-46ab-ace9-b2ad19518b66	\N	\N
Lecture	39	Cohort FCFS Campaign	0	1	2027-08-28 22:57:16.596085	2026-08-28 15:08:31.61006	2026-08-28 15:08:31.696953	b23b10c6-caee-4b71-a496-92be8f5a37c0	\N	\N
Lecture	31	Stage 2: Allocation	1	1	2027-08-28 22:57:16.596085	2026-08-28 22:57:16.312873	2026-08-28 22:57:16.39536	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	\N	\N
Lecture	31	Stage 3: Nachrücker (FCFS)	0	1	2027-08-28 22:57:16.596085	2026-08-28 22:57:16.445782	2026-08-28 22:57:16.452313	561adfd0-6a6a-40d4-a542-aac315de5518	\N	\N
\.


--
-- TOC entry 4849 (class 0 OID 10132591)
-- Dependencies: 313
-- Data for Name: registration_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_items (registerable_type, registerable_id, created_at, updated_at, id, registration_campaign_id, confirmed_registrations_count) FROM stdin;
Tutorial	13	2026-08-26 19:49:14.419441	2026-08-26 19:49:14.419441	3375fbf1-aab0-4e27-889c-26d373aca613	114e0f13-144d-4e47-93d6-c4926bec2fa1	0
Tutorial	14	2026-08-26 19:49:14.427747	2026-08-26 19:49:14.427747	44403811-7e60-481c-9b53-e8d00ae122cf	114e0f13-144d-4e47-93d6-c4926bec2fa1	0
Tutorial	19	2026-08-26 19:49:15.623233	2026-08-26 19:49:15.623233	60e49967-c44c-4b7c-aafd-2ba35988e68f	f3abc265-8d50-4fbe-b44c-0fa27d228f47	0
Tutorial	20	2026-08-26 19:49:15.626175	2026-08-26 19:49:15.626175	58b97351-fd40-4c8b-a28d-15ec50cfe143	f3abc265-8d50-4fbe-b44c-0fa27d228f47	0
Tutorial	21	2026-08-26 19:49:15.628952	2026-08-26 19:49:15.628952	a9f946dd-d952-40f5-9f7f-ab2a952bc618	f3abc265-8d50-4fbe-b44c-0fa27d228f47	0
Tutorial	22	2026-08-26 19:49:15.632171	2026-08-26 19:49:15.632171	ca1fa95b-f63f-4b44-918b-e3bc32a3710a	f3abc265-8d50-4fbe-b44c-0fa27d228f47	0
Talk	35	2026-08-26 19:49:15.861098	2026-08-26 19:49:15.861098	2c9880dd-b89d-4c06-a5c1-e58b1bb21cb0	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	36	2026-08-26 19:49:15.86483	2026-08-26 19:49:15.86483	df8e8fc9-a84b-4795-901c-a8ef95b1716b	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	37	2026-08-26 19:49:15.868648	2026-08-26 19:49:15.868648	db04a731-3417-44b9-988c-3a6e4df4a375	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	38	2026-08-26 19:49:15.874145	2026-08-26 19:49:15.874145	9a475fe6-f389-4e3f-bc1a-d2d7f6841a82	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	39	2026-08-26 19:49:15.877923	2026-08-26 19:49:15.877923	73abf727-2ba7-455e-b115-194b410e8968	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	40	2026-08-26 19:49:15.881581	2026-08-26 19:49:15.881581	4e437a78-21c5-4dcd-98ee-8dab9835bc7e	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	41	2026-08-26 19:49:15.887101	2026-08-26 19:49:15.887101	814051a6-382b-4a84-9590-cf9e911f6e79	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Talk	42	2026-08-26 19:49:15.89046	2026-08-26 19:49:15.89046	75ec2f0a-bb37-4191-8965-32bdb9e85262	42b6546f-5f6d-4741-abc7-f7d169d09b87	0
Tutorial	23	2026-08-28 15:08:31.426919	2026-08-28 15:08:31.426919	31bb644f-7280-454d-9ba1-9f3d425dddb5	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	24	2026-08-28 15:08:31.430712	2026-08-28 15:08:31.430712	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	25	2026-08-28 15:08:31.435147	2026-08-28 15:08:31.435147	0759131b-7aac-4d34-8442-9d7abff1d0ab	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	26	2026-08-28 15:08:31.43821	2026-08-28 15:08:31.43821	4f07ce44-78b3-429e-b74f-653e2057f745	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	2	2026-08-28 22:57:13.460583	2026-08-28 22:57:13.460583	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	a72bdfb6-4af3-42ea-aff1-33b6090038c5	10
Tutorial	3	2026-08-28 22:57:13.470789	2026-08-28 22:57:13.470789	3fbee437-0fdf-4654-ae62-9df78dc65563	a72bdfb6-4af3-42ea-aff1-33b6090038c5	8
Tutorial	4	2026-08-28 22:57:13.476201	2026-08-28 22:57:13.476201	4d7c157f-d2d4-4467-9832-985508c23833	a72bdfb6-4af3-42ea-aff1-33b6090038c5	8
Tutorial	5	2026-08-28 22:57:13.486826	2026-08-28 22:57:13.486826	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	a72bdfb6-4af3-42ea-aff1-33b6090038c5	6
Talk	5	2026-08-28 22:57:14.652925	2026-08-28 22:57:14.652925	8042369e-cb9c-4d78-b5bf-4e33d30856c6	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	6	2026-08-28 22:57:14.657192	2026-08-28 22:57:14.657192	acb6b22c-3931-4021-ba3a-5e0f805fa552	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	7	2026-08-28 22:57:14.659441	2026-08-28 22:57:14.659441	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	8	2026-08-28 22:57:14.661407	2026-08-28 22:57:14.661407	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	9	2026-08-28 22:57:14.66287	2026-08-28 22:57:14.66287	b7ce023a-e989-413d-92b4-f8439ef2b9da	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	10	2026-08-28 22:57:14.664252	2026-08-28 22:57:14.664252	04ed4937-925f-430e-855e-67a176272674	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	11	2026-08-28 22:57:14.665652	2026-08-28 22:57:14.665652	52718295-1097-4e67-ae2e-db0f3c0a02b6	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	12	2026-08-28 22:57:14.667136	2026-08-28 22:57:14.667136	e70e2f3e-0d7b-496a-82de-b844e4f56a43	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	13	2026-08-28 22:57:14.669232	2026-08-28 22:57:14.669232	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Talk	14	2026-08-28 22:57:14.670823	2026-08-28 22:57:14.670823	178e2ca8-e004-4eba-b0c2-bd168630590e	f4548178-f640-4c08-9f4a-f53d4890b6f3	1
Tutorial	27	2026-08-28 15:08:31.634828	2026-08-28 15:08:31.634828	a3208082-123d-45ce-a563-fb1e4f4776b4	b23b10c6-caee-4b71-a496-92be8f5a37c0	12
Tutorial	28	2026-08-28 15:08:31.638846	2026-08-28 15:08:31.638846	83104a52-54b7-4468-abdf-548e81d458b6	b23b10c6-caee-4b71-a496-92be8f5a37c0	10
Tutorial	29	2026-08-28 15:08:31.642538	2026-08-28 15:08:31.642538	c0e50193-27a7-4a5c-b3e3-c14a4264af11	b23b10c6-caee-4b71-a496-92be8f5a37c0	8
Cohort	5	2026-08-28 15:08:31.677992	2026-08-28 15:08:31.677992	602b7284-620b-431b-860b-6ff79255a1b5	b23b10c6-caee-4b71-a496-92be8f5a37c0	5
Cohort	6	2026-08-28 15:08:31.693027	2026-08-28 15:08:31.693027	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	b23b10c6-caee-4b71-a496-92be8f5a37c0	12
Cohort	9	2026-08-28 22:57:16.263392	2026-08-28 22:57:16.263392	1c17ea54-ccea-4d78-a227-73e9ec7a3977	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	12
Talk	55	2026-08-28 22:57:16.347851	2026-08-28 22:57:16.347851	2f7a19ee-638c-420e-b42a-b62645c40158	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	56	2026-08-28 22:57:16.352413	2026-08-28 22:57:16.352413	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	57	2026-08-28 22:57:16.355618	2026-08-28 22:57:16.355618	99935a28-e997-4e5a-940f-5d78123b7db0	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	58	2026-08-28 22:57:16.358963	2026-08-28 22:57:16.358963	6b4b7395-5f2c-4446-9cf6-9fb91c92df95	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	59	2026-08-28 22:57:16.362779	2026-08-28 22:57:16.362779	725d1337-1b13-4f48-93f2-ffab45663fbc	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	60	2026-08-28 22:57:16.370649	2026-08-28 22:57:16.370649	cf5b85d5-7e72-4b44-a004-f43b7a6d3b59	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	61	2026-08-28 22:57:16.374032	2026-08-28 22:57:16.374032	262968da-50df-4a68-abbd-9edc10f8c017	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	62	2026-08-28 22:57:16.377876	2026-08-28 22:57:16.377876	a06a3a72-1433-480c-804e-24389868dd05	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	63	2026-08-28 22:57:16.380588	2026-08-28 22:57:16.380588	08e3bbb5-6aee-4061-8d87-42ce08332974	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	64	2026-08-28 22:57:16.383078	2026-08-28 22:57:16.383078	2fe4e72d-8242-487c-a71c-efe30bbbf8f5	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	65	2026-08-28 22:57:16.386532	2026-08-28 22:57:16.386532	7af4426e-7f2e-448a-8e3a-d5730fa8f1cb	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Talk	66	2026-08-28 22:57:16.390028	2026-08-28 22:57:16.390028	34eb1d52-674b-43d7-b5bb-e295a34a8b21	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	0
Cohort	10	2026-08-28 22:57:16.450954	2026-08-28 22:57:16.450954	411943c4-ebb0-4aee-9482-4262232d7492	561adfd0-6a6a-40d4-a542-aac315de5518	5
\.


--
-- TOC entry 4850 (class 0 OID 10132605)
-- Dependencies: 314
-- Data for Name: registration_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_policies (kind, phase, "position", active, config, created_at, updated_at, id, registration_campaign_id) FROM stdin;
0	1	1	t	{"allowed_domains": "example.com"}	2026-08-28 15:08:31.627576	2026-08-28 15:08:31.627576	c1253339-f52b-4c05-a8d2-5798739fbb5c	b23b10c6-caee-4b71-a496-92be8f5a37c0
0	1	1	t	{"allowed_domains": "mampf.edu"}	2026-08-28 22:57:14.683372	2026-08-28 22:57:14.683372	4bfae883-9bf8-4ef1-a4d2-2bb996de7886	f4548178-f640-4c08-9f4a-f53d4890b6f3
1	1	1	t	{"prerequisite_campaign_id": "d3f32de2-0950-43c5-ad25-4a994cf7f8b9"}	2026-08-28 22:57:16.316691	2026-08-28 22:57:16.316691	ef72c7d3-bf4f-45a6-b4aa-987cf4d4be14	23f45ca4-194c-4c7e-9db7-ea9051c0dac5
\.


--
-- TOC entry 4851 (class 0 OID 10132622)
-- Dependencies: 315
-- Data for Name: registration_student_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_student_messages (id, lecture_id, sender_id, subject, body, attachment_data, recipient_emails, recipients_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4853 (class 0 OID 10132639)
-- Dependencies: 317
-- Data for Name: registration_user_registrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_user_registrations (user_id, preference_rank, status, created_at, updated_at, id, registration_campaign_id, registration_item_id, materialized_at, exclusive_assignment, rejection_reason_type, rejection_reason_code, rejection_reason_label, rejected_at, rejection_overridden_at, rejection_policy_id) FROM stdin;
17	1	1	2026-08-28 22:57:13.566024	2026-08-28 22:57:13.920423	0aff5e54-921b-4a65-974b-f0f421929a31	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
29	1	1	2026-08-28 22:57:13.675262	2026-08-28 22:57:13.920423	a9e6a9f1-68fe-4056-94a7-a950aafc7af1	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
34	2	1	2026-08-28 22:57:13.700655	2026-08-28 22:57:13.920423	fe813d03-3926-42dd-8926-fbff607ee34a	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
35	1	1	2026-08-28 22:57:13.70388	2026-08-28 22:57:13.920423	fd43b664-9adb-49c9-8a3f-b1a11c039d9e	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
36	1	1	2026-08-28 22:57:13.708403	2026-08-28 22:57:13.920423	e42d23e3-5138-40c9-8f9b-0a67fe0a41aa	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
38	1	1	2026-08-28 22:57:13.715636	2026-08-28 22:57:13.920423	28dc70ea-e9d5-4c2f-9660-3fc6c7f729de	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
39	1	1	2026-08-28 22:57:13.719755	2026-08-28 22:57:13.920423	b0cd8dd4-cffc-481f-82fb-652343594fbb	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
40	1	1	2026-08-28 22:57:13.730344	2026-08-28 22:57:13.920423	db08d4b9-e28d-4d6e-8e13-45c1f6f58508	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	2026-08-28 22:57:13.991244	f	\N	\N	\N	\N	\N	\N
15	1	1	2026-08-28 22:57:13.538158	2026-08-28 22:57:13.916907	99a79e39-0225-40f9-a743-2b95ea5d1925	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
26	1	1	2026-08-28 22:57:13.646453	2026-08-28 22:57:13.916907	b032105d-ac40-414f-ac1e-c18a184802ce	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
27	1	1	2026-08-28 22:57:13.660053	2026-08-28 22:57:13.916907	5012a93c-b976-4561-95f7-52661135b42b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
31	1	1	2026-08-28 22:57:13.683167	2026-08-28 22:57:13.916907	e9072248-2c2f-4e33-a9e1-3ab7f2bab3f5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
32	2	1	2026-08-28 22:57:13.688819	2026-08-28 22:57:13.916907	f17d1b7f-0de5-479c-9be7-a738423bf932	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
33	1	1	2026-08-28 22:57:13.692505	2026-08-28 22:57:13.916907	a9132b84-0e87-4dbf-a4a6-2c8ac666ad2b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
41	2	1	2026-08-28 22:57:13.73535	2026-08-28 22:57:13.916907	e8a3f030-69d4-480c-b9d0-e92dc000d03f	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
42	1	1	2026-08-28 22:57:13.747048	2026-08-28 22:57:13.916907	d0771058-bbf6-471c-a78c-8ca2fa454466	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	2026-08-28 22:57:14.003898	f	\N	\N	\N	\N	\N	\N
16	1	1	2026-08-28 22:57:13.558536	2026-08-28 22:57:13.919009	0de164e9-d0ee-45a0-b0e3-2eace8393c0e	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
18	1	1	2026-08-28 22:57:13.582047	2026-08-28 22:57:13.919009	5ace103f-d2ce-46ec-8a63-beb812ebe230	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
20	1	1	2026-08-28 22:57:13.602833	2026-08-28 22:57:13.919009	06db975d-7ff8-45e4-b386-2b40ca66e0af	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
22	4	1	2026-08-28 22:57:13.623362	2026-08-28 22:57:13.919009	f1447e63-f0d3-4d48-b512-0c1c19cd31f7	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
23	1	1	2026-08-28 22:57:13.626846	2026-08-28 22:57:13.919009	68e22bb0-961c-410b-bd36-d3938fd52c4b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
24	4	1	2026-08-28 22:57:13.639834	2026-08-28 22:57:13.919009	4eaee56b-2335-46d3-a039-0c1970f6aa79	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
25	1	1	2026-08-28 22:57:13.641107	2026-08-28 22:57:13.919009	1eee0d60-572c-4e3b-8ac6-3383c6064083	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
30	1	1	2026-08-28 22:57:13.678866	2026-08-28 22:57:13.919009	2f057b72-2016-40f9-996c-39f4700f5e05	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
44	1	1	2026-08-28 22:57:13.772223	2026-08-28 22:57:13.919009	e738ab62-ef6d-45f3-97e2-d15ca86e11ed	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
45	1	1	2026-08-28 22:57:13.775474	2026-08-28 22:57:13.919009	01cba33a-e8ac-446a-b80d-ecd47e65c8f8	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	2026-08-28 22:57:14.01144	f	\N	\N	\N	\N	\N	\N
14	1	1	2026-08-28 22:57:13.518134	2026-08-28 22:57:13.913731	1e4f6552-d5c1-4d8a-bcc1-3d5cdc3a4db0	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	2026-08-28 22:57:14.018814	f	\N	\N	\N	\N	\N	\N
19	1	1	2026-08-28 22:57:13.590285	2026-08-28 22:57:13.913731	0de67327-2b34-495b-a4b0-fa55fc0b7354	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	2026-08-28 22:57:14.018814	f	\N	\N	\N	\N	\N	\N
21	1	1	2026-08-28 22:57:13.612862	2026-08-28 22:57:13.913731	a5c404c5-cb5d-45ce-bf9d-e99adfff6319	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	2026-08-28 22:57:14.018814	f	\N	\N	\N	\N	\N	\N
28	1	1	2026-08-28 22:57:13.668975	2026-08-28 22:57:13.913731	786fa313-d529-4d84-8a72-7ad678959b96	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	2026-08-28 22:57:14.018814	f	\N	\N	\N	\N	\N	\N
37	1	1	2026-08-28 22:57:13.712095	2026-08-28 22:57:13.913731	7120b5fe-b452-4545-a691-6c21bec93e99	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	2026-08-28 22:57:14.018814	f	\N	\N	\N	\N	\N	\N
43	1	1	2026-08-28 22:57:13.764741	2026-08-28 22:57:13.913731	43427b94-852d-4419-98d5-047ec2bcb0e4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	2026-08-28 22:57:14.018814	f	\N	\N	\N	\N	\N	\N
14	2	2	2026-08-28 22:57:13.523047	2026-08-28 22:57:14.019841	93210513-ef8a-433c-91dc-b8ce23fd3227	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
14	3	2	2026-08-28 22:57:13.533219	2026-08-28 22:57:14.019841	938702d0-4d2f-424a-8abb-d79ffda31b6b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
14	4	2	2026-08-28 22:57:13.535677	2026-08-28 22:57:14.019841	6112396e-f6ac-4c60-a330-cd18c39b142a	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
15	2	2	2026-08-28 22:57:13.548889	2026-08-28 22:57:14.019841	c6681d17-3aa3-4a26-9814-16330427b613	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
15	3	2	2026-08-28 22:57:13.55368	2026-08-28 22:57:14.019841	269fe5fc-b92b-4e47-b74b-9b4cbfec73fd	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
15	4	2	2026-08-28 22:57:13.556936	2026-08-28 22:57:14.019841	7c935046-505c-4dfb-b9b9-8b7260f0a2bd	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
16	2	2	2026-08-28 22:57:13.561029	2026-08-28 22:57:14.019841	4e649213-da66-4a2b-b30d-ab73929f1f8c	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
16	3	2	2026-08-28 22:57:13.562787	2026-08-28 22:57:14.019841	d9d9350a-7d55-4d20-ad77-66021f64adaf	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
16	4	2	2026-08-28 22:57:13.563898	2026-08-28 22:57:14.019841	276055ae-f15c-499a-9ad1-a97cf41866dd	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
17	2	2	2026-08-28 22:57:13.568039	2026-08-28 22:57:14.019841	efb7c484-9920-4d47-856a-2f78e74c44df	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
17	3	2	2026-08-28 22:57:13.56919	2026-08-28 22:57:14.019841	8634a450-0542-473f-a4d0-301721e1cecf	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
17	4	2	2026-08-28 22:57:13.573717	2026-08-28 22:57:14.019841	94a48090-ab3c-453c-89d6-89a194f797ea	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
18	2	2	2026-08-28 22:57:13.584057	2026-08-28 22:57:14.019841	9067a27a-ac71-4ce7-926c-a8f93601b297	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
18	3	2	2026-08-28 22:57:13.585445	2026-08-28 22:57:14.019841	fa939936-52a1-4442-b865-029db3c954a7	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
18	4	2	2026-08-28 22:57:13.587787	2026-08-28 22:57:14.019841	0fe05179-a85e-4dd1-822e-23f0f4204fb2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
19	2	2	2026-08-28 22:57:13.594692	2026-08-28 22:57:14.019841	af2a63c9-1868-41d6-adfc-aa9eb1494c38	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
19	3	2	2026-08-28 22:57:13.600046	2026-08-28 22:57:14.019841	dfe95889-aa8b-464e-8226-f3a3667ae3d4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
19	4	2	2026-08-28 22:57:13.601785	2026-08-28 22:57:14.019841	627090bd-0819-43cf-8fd9-22e83bd03e8e	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
20	2	2	2026-08-28 22:57:13.603899	2026-08-28 22:57:14.019841	bbdef6a5-75b4-4548-ba35-4efba3721130	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
20	3	2	2026-08-28 22:57:13.609248	2026-08-28 22:57:14.019841	8d6e8d20-bdb4-4321-9652-7fd48983b801	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
20	4	2	2026-08-28 22:57:13.611886	2026-08-28 22:57:14.019841	065b62c6-b17e-49d8-ab9f-ad3f2090566c	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
21	2	2	2026-08-28 22:57:13.615823	2026-08-28 22:57:14.019841	a7bc93c0-ecc8-4549-b832-0d1c6256e172	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
21	3	2	2026-08-28 22:57:13.617018	2026-08-28 22:57:14.019841	55bd1b52-06e3-4c57-8e30-ae4f6bea202d	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
21	4	2	2026-08-28 22:57:13.617883	2026-08-28 22:57:14.019841	63037494-0741-42c1-bec8-a6ddc21259e3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
22	1	2	2026-08-28 22:57:13.618912	2026-08-28 22:57:14.019841	6608773d-efca-4cce-b85d-30bdfabc52c5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
22	2	2	2026-08-28 22:57:13.619927	2026-08-28 22:57:14.019841	35e21f25-1509-481b-91f4-851926d9514c	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
22	3	2	2026-08-28 22:57:13.620955	2026-08-28 22:57:14.019841	2dfcbe67-cbf3-409d-8096-d263437ae8fd	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
23	2	2	2026-08-28 22:57:13.630833	2026-08-28 22:57:14.019841	d08d4e0d-e7b1-45d3-a561-56feb8ee8061	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
23	3	2	2026-08-28 22:57:13.631825	2026-08-28 22:57:14.019841	06e0a5f1-df2b-4f3b-a7a8-e5b350b9e189	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
23	4	2	2026-08-28 22:57:13.634788	2026-08-28 22:57:14.019841	9b9c31fa-e3b0-4db2-bb15-bdadfe203eb8	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
24	1	2	2026-08-28 22:57:13.636305	2026-08-28 22:57:14.019841	07378bb7-0244-4b4a-bf76-5b25f5742dfc	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
24	2	2	2026-08-28 22:57:13.637185	2026-08-28 22:57:14.019841	ddfa8f7d-9954-4e78-a55f-4dd769a1c09e	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
24	3	2	2026-08-28 22:57:13.638575	2026-08-28 22:57:14.019841	d46d0571-4072-48e6-9ed8-d48938d6fc57	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
25	2	2	2026-08-28 22:57:13.642151	2026-08-28 22:57:14.019841	c20df8a8-56b0-4603-bdd2-0664325fdade	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
25	3	2	2026-08-28 22:57:13.643426	2026-08-28 22:57:14.019841	6ce25afd-33cf-4f3d-9423-8c33720ff1a5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
25	4	2	2026-08-28 22:57:13.645245	2026-08-28 22:57:14.019841	e1508fc2-6abf-415c-8edf-a0ce616b2a59	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
26	2	2	2026-08-28 22:57:13.647786	2026-08-28 22:57:14.019841	6c834c73-6f12-4031-9f5d-b5399f212f0c	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
26	3	2	2026-08-28 22:57:13.648824	2026-08-28 22:57:14.019841	36fc820a-0ec8-4e1a-b4aa-736f75a3afdd	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
26	4	2	2026-08-28 22:57:13.651198	2026-08-28 22:57:14.019841	3238434a-254f-4422-abbe-ae631c4d459e	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
27	2	2	2026-08-28 22:57:13.664652	2026-08-28 22:57:14.019841	35aedac2-2c57-49c1-a32f-853e5d863ff7	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
27	3	2	2026-08-28 22:57:13.665815	2026-08-28 22:57:14.019841	13168976-e23f-40c7-a6ca-e926922355fc	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
27	4	2	2026-08-28 22:57:13.667723	2026-08-28 22:57:14.019841	7953f44a-8ee8-483a-8a49-15446a62268a	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
28	2	2	2026-08-28 22:57:13.67093	2026-08-28 22:57:14.019841	cfae35db-f805-4203-a089-7ce119601413	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
28	3	2	2026-08-28 22:57:13.672192	2026-08-28 22:57:14.019841	eb0b0cd5-e5be-4d96-9c81-baa826a414c6	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
28	4	2	2026-08-28 22:57:13.673868	2026-08-28 22:57:14.019841	dc66b67e-f147-4b87-95d9-4c2102096354	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
29	2	2	2026-08-28 22:57:13.676161	2026-08-28 22:57:14.019841	17d10f66-36f3-4cb7-9fba-00c04df3702f	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
29	3	2	2026-08-28 22:57:13.677048	2026-08-28 22:57:14.019841	7479bb95-9e00-4a57-991c-4f79303e8b6a	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
29	4	2	2026-08-28 22:57:13.677938	2026-08-28 22:57:14.019841	b894ab9b-287c-429c-ac40-b6ab6c4c55e2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
30	2	2	2026-08-28 22:57:13.679882	2026-08-28 22:57:14.019841	67311498-f38b-48a5-bd86-d8b5503d8958	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
30	3	2	2026-08-28 22:57:13.681303	2026-08-28 22:57:14.019841	0c220eb3-e03f-4e8d-ae56-68cf7df3792b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
30	4	2	2026-08-28 22:57:13.682318	2026-08-28 22:57:14.019841	5059bfe1-c5cb-427c-a8be-d74763626e6d	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
31	2	2	2026-08-28 22:57:13.68399	2026-08-28 22:57:14.019841	ad36fade-0d6d-44d9-bd09-ced5543f7f5c	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
31	3	2	2026-08-28 22:57:13.684848	2026-08-28 22:57:14.019841	a84838cc-9bab-41e3-8378-34029f8caaef	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
31	4	2	2026-08-28 22:57:13.686928	2026-08-28 22:57:14.019841	32b248a7-807c-44d9-9cb6-0dd8769ce1b7	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
32	1	2	2026-08-28 22:57:13.687825	2026-08-28 22:57:14.019841	41a1a7e3-25cf-49b7-aba0-f77de2ffeb14	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
32	3	2	2026-08-28 22:57:13.689926	2026-08-28 22:57:14.019841	38ac80cc-b969-4d09-9f76-8f4ebff7b9fc	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
32	4	2	2026-08-28 22:57:13.691047	2026-08-28 22:57:14.019841	abc9756c-d977-49b5-a877-ea8ab7959c43	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
33	2	2	2026-08-28 22:57:13.693395	2026-08-28 22:57:14.019841	d0281806-f8d5-4c22-a2db-40bcc4ac4338	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
33	3	2	2026-08-28 22:57:13.694342	2026-08-28 22:57:14.019841	d5361401-3313-424e-8603-3cb13bfe2c86	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
33	4	2	2026-08-28 22:57:13.695209	2026-08-28 22:57:14.019841	d5622e34-1768-4655-8b4b-546e98589c44	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
34	1	2	2026-08-28 22:57:13.699533	2026-08-28 22:57:14.019841	e8c3e999-e213-4fbd-b920-ea82020ca7ab	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
34	3	2	2026-08-28 22:57:13.701965	2026-08-28 22:57:14.019841	a2303ed8-5648-43a8-b9fc-76d3fe967606	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
34	4	2	2026-08-28 22:57:13.702987	2026-08-28 22:57:14.019841	7736c002-b4f8-461f-ad05-4254aa70f12a	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
35	2	2	2026-08-28 22:57:13.704735	2026-08-28 22:57:14.019841	206e6318-7720-420a-9545-929820e2d342	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
35	3	2	2026-08-28 22:57:13.70569	2026-08-28 22:57:14.019841	27457208-b9dd-484a-ab08-3cbc207f3bfc	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
35	4	2	2026-08-28 22:57:13.707304	2026-08-28 22:57:14.019841	0676601f-3d89-4289-8f85-3d0d2931013f	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
36	2	2	2026-08-28 22:57:13.709281	2026-08-28 22:57:14.019841	9cd9ecb2-e958-4f87-873e-aaf654d0d44f	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
36	3	2	2026-08-28 22:57:13.710408	2026-08-28 22:57:14.019841	1ed44410-f772-4992-97e3-af32ae1c6131	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
36	4	2	2026-08-28 22:57:13.711253	2026-08-28 22:57:14.019841	5b56381a-6378-4744-b071-88ab8b7bd59f	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
37	2	2	2026-08-28 22:57:13.712925	2026-08-28 22:57:14.019841	081c87b9-3596-496f-a150-e637153ab8aa	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
37	3	2	2026-08-28 22:57:13.713746	2026-08-28 22:57:14.019841	76ee4af6-a6ec-4623-aa70-560e12cbfe1b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
37	4	2	2026-08-28 22:57:13.714614	2026-08-28 22:57:14.019841	5b95e6c8-c897-4a57-92a7-d22d87b74f74	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
38	2	2	2026-08-28 22:57:13.716669	2026-08-28 22:57:14.019841	99bd8f1c-9471-42db-b0bb-5a518f2db3e1	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
38	3	2	2026-08-28 22:57:13.717659	2026-08-28 22:57:14.019841	5e8d0181-658d-484d-9ec4-794256d90e50	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
38	4	2	2026-08-28 22:57:13.718606	2026-08-28 22:57:14.019841	04e808b5-6f7b-46c9-9fdc-e8660de9d45c	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
39	2	2	2026-08-28 22:57:13.720593	2026-08-28 22:57:14.019841	8628e995-eb94-4f1e-bfed-f7093dd62678	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
39	3	2	2026-08-28 22:57:13.723896	2026-08-28 22:57:14.019841	629434a2-f9c5-4c14-91e9-24a54f5bb6ff	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
39	4	2	2026-08-28 22:57:13.726009	2026-08-28 22:57:14.019841	4e6e1777-ecc5-47e2-bcc6-b2e95f288c12	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
40	2	2	2026-08-28 22:57:13.731368	2026-08-28 22:57:14.019841	a3c1a432-6c84-4bb7-a8fe-f169120ea621	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
40	3	2	2026-08-28 22:57:13.732713	2026-08-28 22:57:14.019841	ffbe2332-5011-4532-84ff-cf36202c8c1b	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
40	4	2	2026-08-28 22:57:13.733685	2026-08-28 22:57:14.019841	771fb2e1-3274-49e0-afb9-246e7b75b7fd	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
41	1	2	2026-08-28 22:57:13.734536	2026-08-28 22:57:14.019841	ff63abda-b9c7-46cd-9c6d-efb364aaf179	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
41	3	2	2026-08-28 22:57:13.741078	2026-08-28 22:57:14.019841	b5612385-c464-4385-a62e-1e88d7aa41ef	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
41	4	2	2026-08-28 22:57:13.745894	2026-08-28 22:57:14.019841	3423aaca-3fb1-4140-a5d8-ea92c0139c5f	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
42	2	2	2026-08-28 22:57:13.748053	2026-08-28 22:57:14.019841	1cb2e8db-44a1-4a86-a269-96b06c04e6f4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
42	3	2	2026-08-28 22:57:13.751497	2026-08-28 22:57:14.019841	af85b779-b17d-4ad8-94f5-812cd12d2683	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
42	4	2	2026-08-28 22:57:13.763446	2026-08-28 22:57:14.019841	1669b567-f0a6-461a-b28c-8167087f4499	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
43	2	2	2026-08-28 22:57:13.765785	2026-08-28 22:57:14.019841	f492bfc4-82db-4dae-8cd3-23a618e1869e	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
43	3	2	2026-08-28 22:57:13.76715	2026-08-28 22:57:14.019841	f2d5d2a4-435d-458d-a187-4c3d9916fabf	a72bdfb6-4af3-42ea-aff1-33b6090038c5	a8e113c4-c440-4f15-a1b3-e7ffffd9db5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
43	4	2	2026-08-28 22:57:13.770975	2026-08-28 22:57:14.019841	90f7e710-6a6b-4a98-bb7b-b0bb93b32684	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
44	2	2	2026-08-28 22:57:13.773048	2026-08-28 22:57:14.019841	2bed2c8a-ab70-4637-a483-a02ecec7ebe2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
44	3	2	2026-08-28 22:57:13.773833	2026-08-28 22:57:14.019841	5eec6077-3c41-4d04-9a33-d2ff9c2aff47	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
44	4	2	2026-08-28 22:57:13.774684	2026-08-28 22:57:14.019841	7f427987-b7fd-4f6f-b6c5-cea3acd59c90	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
45	2	2	2026-08-28 22:57:13.776333	2026-08-28 22:57:14.019841	8d6f895f-d1d0-4327-9073-5b44cb2985c5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	4d7c157f-d2d4-4467-9832-985508c23833	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
45	3	2	2026-08-28 22:57:13.777161	2026-08-28 22:57:14.019841	5f42a272-7c90-4fd6-b103-a1152d2899aa	a72bdfb6-4af3-42ea-aff1-33b6090038c5	3fbee437-0fdf-4654-ae62-9df78dc65563	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
45	4	2	2026-08-28 22:57:13.778079	2026-08-28 22:57:14.019841	b3962fe0-0899-44f7-837c-0150565d13a0	a72bdfb6-4af3-42ea-aff1-33b6090038c5	f63f8c27-1ad3-454e-8c8c-5d04224b9d73	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:14.019841	\N	\N
58	1	2	2026-08-28 22:57:14.860278	2026-08-28 22:57:14.935068	6dd06d68-0e03-42d9-a027-83db5b0ce548	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	2	2	2026-08-28 22:57:14.861071	2026-08-28 22:57:14.940302	3ec07854-95ca-41cf-a299-b6244a4f8d6b	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	3	2	2026-08-28 22:57:14.86186	2026-08-28 22:57:14.942359	802cffc3-e354-49ae-9468-c69674af186d	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	4	2	2026-08-28 22:57:14.862754	2026-08-28 22:57:14.944533	1c451af4-59b7-48fe-99f7-b293dabc514d	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	5	2	2026-08-28 22:57:14.863582	2026-08-28 22:57:14.946963	f4ec588e-ea8f-4f0d-843b-6dd366e4ebce	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	6	2	2026-08-28 22:57:14.864391	2026-08-28 22:57:14.949126	1fba12af-ccab-4d59-b169-b3454c7921a9	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	7	2	2026-08-28 22:57:14.865307	2026-08-28 22:57:14.952428	71e6276f-32e0-406a-9f18-b565c9effc5f	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	8	2	2026-08-28 22:57:14.866165	2026-08-28 22:57:14.955004	0bb0403d-0f5e-429d-a699-b1ff3ad8daaf	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	9	2	2026-08-28 22:57:14.867546	2026-08-28 22:57:14.956473	427ea66a-8656-46bb-b286-a23ac1f6b625	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
58	10	2	2026-08-28 22:57:14.869234	2026-08-28 22:57:14.961149	e30543ee-c997-4467-995d-3cf18c634132	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	1	2	2026-08-28 22:57:14.870735	2026-08-28 22:57:14.962667	b5c93f00-3efa-4bce-80d7-04d22c8a13e1	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	2	2	2026-08-28 22:57:14.871897	2026-08-28 22:57:14.96397	8a81d8f3-89de-4f7f-a1a1-1e6eda7fd33d	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	3	2	2026-08-28 22:57:14.8728	2026-08-28 22:57:14.966972	171612cc-f41a-4cb2-b42c-d5d19e1c1fbb	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	4	2	2026-08-28 22:57:14.873779	2026-08-28 22:57:14.968757	530e7bc3-14df-4e38-80a3-176cee90073f	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	5	2	2026-08-28 22:57:14.875044	2026-08-28 22:57:14.971443	ca157a92-2fef-4b36-b222-d49aa48c741d	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	6	2	2026-08-28 22:57:14.876115	2026-08-28 22:57:14.974108	85a27bde-57f9-4605-8623-e3a5ec628a16	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	7	2	2026-08-28 22:57:14.877155	2026-08-28 22:57:14.975594	4c1f61f8-d137-469b-9300-ec9311fb9ffb	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	8	2	2026-08-28 22:57:14.878358	2026-08-28 22:57:14.9773	9dd35658-92ad-4b43-8e39-2ce0203c253d	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	9	2	2026-08-28 22:57:14.879289	2026-08-28 22:57:14.979074	460f0084-ca0d-4959-9fdf-c3ff1d767953	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
59	10	2	2026-08-28 22:57:14.880239	2026-08-28 22:57:14.981005	736d9066-a7eb-4aa5-abbc-4f4646c69864	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 22:57:14.919435	\N	4bfae883-9bf8-4ef1-a4d2-2bb996de7886
46	1	1	2026-08-28 22:57:14.706379	2026-08-28 22:57:14.989039	7f3f1697-06e5-44fc-a5c5-f766b32244f3	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	2026-08-28 22:57:15.034214	f	\N	\N	\N	\N	\N	\N
47	1	1	2026-08-28 22:57:14.719003	2026-08-28 22:57:14.990492	74137d06-fb60-428e-ab9f-86014619119f	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	2026-08-28 22:57:15.039062	f	\N	\N	\N	\N	\N	\N
56	1	1	2026-08-28 22:57:14.837075	2026-08-28 22:57:15.001157	e407c455-ad58-4b70-8798-f1cff89388bc	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	2026-08-28 22:57:15.044365	f	\N	\N	\N	\N	\N	\N
57	1	1	2026-08-28 22:57:14.849257	2026-08-28 22:57:15.002447	fd263444-0da9-4015-ba96-c9c2711de70f	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	2026-08-28 22:57:15.050365	f	\N	\N	\N	\N	\N	\N
49	2	1	2026-08-28 22:57:14.748456	2026-08-28 22:57:14.99275	add6ba15-ee9d-441a-8873-d4b12e7a90da	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	2026-08-28 22:57:15.055841	f	\N	\N	\N	\N	\N	\N
48	1	1	2026-08-28 22:57:14.734606	2026-08-28 22:57:14.991619	6f6d4be8-cd53-4a98-aede-fbaa914d4fef	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	2026-08-28 22:57:15.063719	f	\N	\N	\N	\N	\N	\N
50	1	1	2026-08-28 22:57:14.759911	2026-08-28 22:57:14.99365	78a6ab6d-1024-42fc-bef5-6aff68846dbd	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	2026-08-28 22:57:15.069339	f	\N	\N	\N	\N	\N	\N
54	1	1	2026-08-28 22:57:14.812561	2026-08-28 22:57:15.00014	9e54bad5-f781-42de-aadc-55607071c53e	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	2026-08-28 22:57:15.078113	f	\N	\N	\N	\N	\N	\N
51	2	1	2026-08-28 22:57:14.775778	2026-08-28 22:57:14.9951	a7ec7cb4-633d-4061-9b4b-df232cd643a2	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	2026-08-28 22:57:15.083484	f	\N	\N	\N	\N	\N	\N
52	4	1	2026-08-28 22:57:14.79159	2026-08-28 22:57:14.999104	20a09951-548a-416b-9fa5-77f078ba7389	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	2026-08-28 22:57:15.089333	f	\N	\N	\N	\N	\N	\N
46	2	2	2026-08-28 22:57:14.707831	2026-08-28 22:57:15.089917	8d459423-783f-43a0-9461-4fbf50ffefd8	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	3	2	2026-08-28 22:57:14.708922	2026-08-28 22:57:15.089917	0696b870-3304-4717-b81c-72f5641f4285	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	4	2	2026-08-28 22:57:14.710995	2026-08-28 22:57:15.089917	289a7bbf-74ab-412e-86db-2e13d743c592	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	5	2	2026-08-28 22:57:14.712196	2026-08-28 22:57:15.089917	0e4c8436-b8c6-447f-9b8d-d7e60ddddcd3	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	6	2	2026-08-28 22:57:14.71321	2026-08-28 22:57:15.089917	118eb6d1-ba2d-4d57-8ab9-0887698d98dd	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	7	2	2026-08-28 22:57:14.714373	2026-08-28 22:57:15.089917	6811c1bd-4c7e-42a5-adba-829ee64925b1	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	8	2	2026-08-28 22:57:14.71541	2026-08-28 22:57:15.089917	1caa9266-5626-4146-bc17-3ad1faaad72a	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	9	2	2026-08-28 22:57:14.716472	2026-08-28 22:57:15.089917	12308c18-f9db-4980-b577-cf0626b637e1	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
46	10	2	2026-08-28 22:57:14.717753	2026-08-28 22:57:15.089917	1d015a76-069d-459f-9bc2-510a22069888	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	2	2	2026-08-28 22:57:14.720525	2026-08-28 22:57:15.089917	5f41a8f3-135a-49d4-9d3e-7bc334163b06	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	3	2	2026-08-28 22:57:14.723101	2026-08-28 22:57:15.089917	7fdd3e3b-1029-4467-a942-f95c2dcd25ae	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	4	2	2026-08-28 22:57:14.724767	2026-08-28 22:57:15.089917	0a4eec59-2258-402b-b46b-43600a2b9e27	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	5	2	2026-08-28 22:57:14.726263	2026-08-28 22:57:15.089917	10db56d1-30c5-48e8-9276-b47d66b2c63c	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	6	2	2026-08-28 22:57:14.727437	2026-08-28 22:57:15.089917	1637a3d0-aab5-40e7-a794-4279739edf5e	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	7	2	2026-08-28 22:57:14.728574	2026-08-28 22:57:15.089917	cee9170b-3306-4e09-8d73-bcf78e3c55db	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	8	2	2026-08-28 22:57:14.72967	2026-08-28 22:57:15.089917	a6966fc7-617d-4822-8740-99b7fb1d45ce	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	9	2	2026-08-28 22:57:14.730901	2026-08-28 22:57:15.089917	a4ec1056-a2c2-4831-9bd7-aa0ee13b916e	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
47	10	2	2026-08-28 22:57:14.732264	2026-08-28 22:57:15.089917	9172ee91-cc0c-437b-9618-6ba0de5a60a6	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	2	2	2026-08-28 22:57:14.735764	2026-08-28 22:57:15.089917	0b97ab58-b925-4a0a-ba4e-b301aebdf6d9	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	3	2	2026-08-28 22:57:14.737022	2026-08-28 22:57:15.089917	32b9d8b1-f421-4b27-a4ac-a8c000f86dce	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	4	2	2026-08-28 22:57:14.738204	2026-08-28 22:57:15.089917	69579bb5-ec5e-48ac-98de-703b7d809917	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	5	2	2026-08-28 22:57:14.73924	2026-08-28 22:57:15.089917	de954735-4098-4495-86c9-cc43ad83c288	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	6	2	2026-08-28 22:57:14.74025	2026-08-28 22:57:15.089917	135d387c-a7b5-4979-a6c1-9261389247c4	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	7	2	2026-08-28 22:57:14.741298	2026-08-28 22:57:15.089917	d4454b1b-88bf-461f-8136-4d448103add1	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	8	2	2026-08-28 22:57:14.742525	2026-08-28 22:57:15.089917	7ed4f048-d4d6-4f79-b6e3-f816f244cd56	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	9	2	2026-08-28 22:57:14.743684	2026-08-28 22:57:15.089917	0718e062-94e1-4801-ad96-3511984ee97a	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
48	10	2	2026-08-28 22:57:14.744703	2026-08-28 22:57:15.089917	6a0776c6-3300-42e1-87b3-317399bdf58b	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	1	2	2026-08-28 22:57:14.747115	2026-08-28 22:57:15.089917	c919442a-eff3-4921-9c5c-027a42177b0c	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	3	2	2026-08-28 22:57:14.749557	2026-08-28 22:57:15.089917	6cba4287-66d7-4005-b27d-5d897349ea8e	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	4	2	2026-08-28 22:57:14.750692	2026-08-28 22:57:15.089917	fcf4563a-35ad-43e0-a0c4-7b31b86d4dc6	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	5	2	2026-08-28 22:57:14.751724	2026-08-28 22:57:15.089917	8ade7834-1a24-48a5-89ac-d441b180b2c2	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	6	2	2026-08-28 22:57:14.752959	2026-08-28 22:57:15.089917	a3439efe-6f62-4e0a-bf7c-506cc532e906	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	7	2	2026-08-28 22:57:14.754221	2026-08-28 22:57:15.089917	5ab80215-7af2-4e07-96d1-5876d08a5567	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	8	2	2026-08-28 22:57:14.755332	2026-08-28 22:57:15.089917	6d08001d-e38f-46dc-b45a-ce698f0c2020	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	9	2	2026-08-28 22:57:14.756462	2026-08-28 22:57:15.089917	0b6518a2-4938-4fac-9d70-dc2cda58521b	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
49	10	2	2026-08-28 22:57:14.75765	2026-08-28 22:57:15.089917	97e6cf1e-43a6-4ab9-aff6-f61a99dcd4ab	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	2	2	2026-08-28 22:57:14.760985	2026-08-28 22:57:15.089917	526d77cf-9a4e-4960-8109-5d53397c6bdc	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	3	2	2026-08-28 22:57:14.762147	2026-08-28 22:57:15.089917	6f7bc32e-e332-4a04-9513-39e6439311c8	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	4	2	2026-08-28 22:57:14.76327	2026-08-28 22:57:15.089917	d8db05b4-5e30-42b8-80cd-55370866e0a8	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	5	2	2026-08-28 22:57:14.764748	2026-08-28 22:57:15.089917	caf11dbe-6720-4801-92ee-5cd789f0e639	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	6	2	2026-08-28 22:57:14.766098	2026-08-28 22:57:15.089917	651bf620-ecf4-435f-b22c-1396ef12f792	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	7	2	2026-08-28 22:57:14.767723	2026-08-28 22:57:15.089917	f8e640a9-c96b-4a10-bbca-324b72b9dd0b	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	8	2	2026-08-28 22:57:14.769063	2026-08-28 22:57:15.089917	5688085e-1d24-423f-8eb1-4eddd5a5ea9f	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	9	2	2026-08-28 22:57:14.770486	2026-08-28 22:57:15.089917	3e1629c8-4095-4bc5-a8a0-7560bb37d82b	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
50	10	2	2026-08-28 22:57:14.771695	2026-08-28 22:57:15.089917	6e04d791-5868-452c-8a0e-d8eab8197dca	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	1	2	2026-08-28 22:57:14.774373	2026-08-28 22:57:15.089917	9a17194d-70a5-4d10-95e1-207837a57c85	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	3	2	2026-08-28 22:57:14.777192	2026-08-28 22:57:15.089917	7f1b3b00-4475-41a9-bd2d-8b70065eb43e	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	4	2	2026-08-28 22:57:14.778411	2026-08-28 22:57:15.089917	0bcbfaf7-e086-4c88-8352-34c75a6c2617	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	5	2	2026-08-28 22:57:14.779553	2026-08-28 22:57:15.089917	25abdf43-4c3f-4c03-9c50-636e1e628d90	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	6	2	2026-08-28 22:57:14.780576	2026-08-28 22:57:15.089917	8626624c-7d3a-4c52-802e-7704eea94fd0	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	7	2	2026-08-28 22:57:14.781573	2026-08-28 22:57:15.089917	f0ee5429-6af3-4622-b80f-2868c8768b16	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	8	2	2026-08-28 22:57:14.782812	2026-08-28 22:57:15.089917	9291dddf-5f73-4594-946d-90dc36087aee	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	9	2	2026-08-28 22:57:14.783947	2026-08-28 22:57:15.089917	8e22578a-3f9e-41e6-8a4e-78a3dde5d863	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
51	10	2	2026-08-28 22:57:14.785119	2026-08-28 22:57:15.089917	02633980-0c64-43bf-a622-44e0d9157f1e	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	1	2	2026-08-28 22:57:14.787666	2026-08-28 22:57:15.089917	2dcbf123-0d78-4305-9f1e-7e40d2b77772	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	2	2	2026-08-28 22:57:14.78884	2026-08-28 22:57:15.089917	c9e7e987-5c69-48f7-bf67-8ab44342efcc	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	3	2	2026-08-28 22:57:14.790185	2026-08-28 22:57:15.089917	453ba522-baa8-47db-b043-0f05c96c5173	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	5	2	2026-08-28 22:57:14.792958	2026-08-28 22:57:15.089917	9c3457af-e0e3-45af-b9d6-10fd4fb7c388	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	6	2	2026-08-28 22:57:14.794132	2026-08-28 22:57:15.089917	1c91fe10-470c-4aa0-af2f-612aa36bea0a	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	7	2	2026-08-28 22:57:14.795242	2026-08-28 22:57:15.089917	a3e84b03-a079-4e05-ad36-e5c076b5cf5f	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	8	2	2026-08-28 22:57:14.796246	2026-08-28 22:57:15.089917	3ff42efb-bbb9-4645-a052-e245927e5b55	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	9	2	2026-08-28 22:57:14.797364	2026-08-28 22:57:15.089917	34bf5785-f37f-48bc-960d-461356e2193c	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
52	10	2	2026-08-28 22:57:14.798512	2026-08-28 22:57:15.089917	fd066ca9-061f-4584-bbb8-303fb53aaa3e	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	1	2	2026-08-28 22:57:14.800226	2026-08-28 22:57:15.089917	09b43c8d-53c9-4d96-8172-480dad6d293a	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	2	2	2026-08-28 22:57:14.801333	2026-08-28 22:57:15.089917	f7f010b3-c1b1-40fb-9aa5-c3d9919272fb	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	3	2	2026-08-28 22:57:14.802574	2026-08-28 22:57:15.089917	a6fe054a-8511-4a9a-8936-5d1e5a99d839	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	4	2	2026-08-28 22:57:14.804091	2026-08-28 22:57:15.089917	83cfd55c-d239-4045-a04c-16930140066c	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	5	2	2026-08-28 22:57:14.80556	2026-08-28 22:57:15.089917	530a3c4c-42aa-4859-b1cd-0b80d82586da	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	6	2	2026-08-28 22:57:14.806912	2026-08-28 22:57:15.089917	57f002c0-c7bd-45b0-830c-5537f39186eb	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	7	2	2026-08-28 22:57:14.808086	2026-08-28 22:57:15.089917	af669fb4-293f-4e54-ab01-9634b9990649	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	8	2	2026-08-28 22:57:14.809338	2026-08-28 22:57:15.089917	1bc3a168-3670-4ed6-b3a3-b11f619104d7	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	9	2	2026-08-28 22:57:14.810488	2026-08-28 22:57:15.089917	34384aa1-e158-4346-9658-ca6427383e6b	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
53	10	2	2026-08-28 22:57:14.811538	2026-08-28 22:57:15.089917	6fd02c74-af95-4006-bbc4-8c3d938127ad	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	2	2	2026-08-28 22:57:14.813542	2026-08-28 22:57:15.089917	4aaf4f6f-422e-4cf5-acd4-a06c3cfd8fd6	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	3	2	2026-08-28 22:57:14.814618	2026-08-28 22:57:15.089917	62190894-ac87-4419-9623-fa1a4e39b0f8	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	4	2	2026-08-28 22:57:14.815695	2026-08-28 22:57:15.089917	b4818ab2-ffc5-445d-b079-a561c4f784bb	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	5	2	2026-08-28 22:57:14.817104	2026-08-28 22:57:15.089917	7ace4868-3bea-400d-bff6-e9fede26c2a1	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	6	2	2026-08-28 22:57:14.819199	2026-08-28 22:57:15.089917	bc813e57-bab1-4c74-8666-d24da74bdb32	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	7	2	2026-08-28 22:57:14.820857	2026-08-28 22:57:15.089917	a592b79a-959d-4c03-92fb-477706e64347	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	8	2	2026-08-28 22:57:14.822347	2026-08-28 22:57:15.089917	1de453ec-0064-43ba-96af-16b5f365e0d2	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	9	2	2026-08-28 22:57:14.823602	2026-08-28 22:57:15.089917	2351b4de-81f4-49cc-909b-83c050388a03	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
54	10	2	2026-08-28 22:57:14.824753	2026-08-28 22:57:15.089917	591251bf-0556-4d09-bbf3-eac5708560fa	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	1	2	2026-08-28 22:57:14.825788	2026-08-28 22:57:15.089917	4a059aa5-9ffd-4467-baeb-1877d628e6b9	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	2	2	2026-08-28 22:57:14.827046	2026-08-28 22:57:15.089917	3a3de8eb-f61c-48ca-8edc-ebabca599d4f	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	3	2	2026-08-28 22:57:14.828062	2026-08-28 22:57:15.089917	71a50f6b-d42a-46b5-bcd8-26a3ba1f800d	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	4	2	2026-08-28 22:57:14.829237	2026-08-28 22:57:15.089917	048c89ef-e51a-4d75-885b-bcb0584a71a1	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	5	2	2026-08-28 22:57:14.830333	2026-08-28 22:57:15.089917	a6467859-0c5f-49e7-b4b0-1d9a7da68e02	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	6	2	2026-08-28 22:57:14.831371	2026-08-28 22:57:15.089917	9b972b8a-04e6-4f91-8811-00324b9b0a13	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	7	2	2026-08-28 22:57:14.832339	2026-08-28 22:57:15.089917	4e602963-5dbc-4ea8-ab21-8ced28b1ab81	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	8	2	2026-08-28 22:57:14.83321	2026-08-28 22:57:15.089917	c58016b1-cd2f-405d-a227-e1229fd46e0c	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	9	2	2026-08-28 22:57:14.834264	2026-08-28 22:57:15.089917	0c426b15-d85f-41e8-9176-bf47b580f256	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
55	10	2	2026-08-28 22:57:14.835655	2026-08-28 22:57:15.089917	b6a11555-c217-4698-9066-a5637e6a34b3	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	2	2	2026-08-28 22:57:14.838623	2026-08-28 22:57:15.089917	29b9fd9d-4eaa-4f22-95db-ddd2e963af4b	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	3	2	2026-08-28 22:57:14.840344	2026-08-28 22:57:15.089917	d5f33b25-67fc-4f1f-b470-e7e891300e24	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	4	2	2026-08-28 22:57:14.841711	2026-08-28 22:57:15.089917	9b9a56ed-3629-4557-b236-554e2cbc0c8e	f4548178-f640-4c08-9f4a-f53d4890b6f3	52718295-1097-4e67-ae2e-db0f3c0a02b6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	5	2	2026-08-28 22:57:14.843036	2026-08-28 22:57:15.089917	96ab9da3-d003-4811-b29a-67d5ed3c429a	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	6	2	2026-08-28 22:57:14.844233	2026-08-28 22:57:15.089917	3ab366d1-2be7-4127-9823-835882c3083c	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	7	2	2026-08-28 22:57:14.84533	2026-08-28 22:57:15.089917	97d92c6b-e6b5-439a-95d6-a7f924321e3d	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	8	2	2026-08-28 22:57:14.846374	2026-08-28 22:57:15.089917	427d11e9-a3fe-438b-9ddd-f7cc2d143e70	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	9	2	2026-08-28 22:57:14.847273	2026-08-28 22:57:15.089917	8357d03d-23ac-4a07-93ee-3c8d42a8808d	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
56	10	2	2026-08-28 22:57:14.848209	2026-08-28 22:57:15.089917	68c4432b-12eb-4f00-9486-6d2e2e07590f	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	2	2	2026-08-28 22:57:14.850486	2026-08-28 22:57:15.089917	a42a2e74-3c54-4068-804c-ad1109706d15	f4548178-f640-4c08-9f4a-f53d4890b6f3	8042369e-cb9c-4d78-b5bf-4e33d30856c6	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	3	2	2026-08-28 22:57:14.852087	2026-08-28 22:57:15.089917	4589f1ca-9b47-427b-a4c1-8b0b8d835575	f4548178-f640-4c08-9f4a-f53d4890b6f3	aa05ea4a-4a7e-4031-960b-55cdd9e78d74	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	4	2	2026-08-28 22:57:14.853838	2026-08-28 22:57:15.089917	fa034c72-8d13-4043-a880-76d60472e2a8	f4548178-f640-4c08-9f4a-f53d4890b6f3	e70e2f3e-0d7b-496a-82de-b844e4f56a43	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	5	2	2026-08-28 22:57:14.855184	2026-08-28 22:57:15.089917	d8dd358f-9547-46ae-9b59-7590855eae94	f4548178-f640-4c08-9f4a-f53d4890b6f3	04ed4937-925f-430e-855e-67a176272674	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	6	2	2026-08-28 22:57:14.856032	2026-08-28 22:57:15.089917	160f3e70-c16d-4eb4-a2cf-5f094e18f29e	f4548178-f640-4c08-9f4a-f53d4890b6f3	54f48deb-3cf1-4a08-9ec3-9670b9d1da14	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	7	2	2026-08-28 22:57:14.856834	2026-08-28 22:57:15.089917	c110932d-eede-4711-b02d-0dd37a59851c	f4548178-f640-4c08-9f4a-f53d4890b6f3	178e2ca8-e004-4eba-b0c2-bd168630590e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	8	2	2026-08-28 22:57:14.857652	2026-08-28 22:57:15.089917	29bb4c13-37a0-4af0-89c0-d8deaca3ed21	f4548178-f640-4c08-9f4a-f53d4890b6f3	3c6c5060-1a88-4f97-ae6d-e7c1825e9b93	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	9	2	2026-08-28 22:57:14.85854	2026-08-28 22:57:15.089917	708678f9-c9ce-4c1a-a5cd-226f4da6fbca	f4548178-f640-4c08-9f4a-f53d4890b6f3	b7ce023a-e989-413d-92b4-f8439ef2b9da	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
57	10	2	2026-08-28 22:57:14.859464	2026-08-28 22:57:15.089917	3908ceba-f7c9-4a90-a1c8-529591473bc4	f4548178-f640-4c08-9f4a-f53d4890b6f3	acb6b22c-3931-4021-ba3a-5e0f805fa552	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 22:57:15.089917	\N	\N
60	1	0	2026-08-28 22:57:15.179868	2026-08-28 22:57:15.179868	79372f50-e2df-406f-b3ca-7543657fd923	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
60	2	0	2026-08-28 22:57:15.182312	2026-08-28 22:57:15.182312	77c0c056-1755-483f-a9ac-d3d99f1cc288	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
61	1	0	2026-08-28 22:57:15.187476	2026-08-28 22:57:15.187476	c04ed100-62e5-47b5-a423-2d4b945e481e	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
61	2	0	2026-08-28 22:57:15.189428	2026-08-28 22:57:15.189428	a78388b2-da7a-4065-8ed4-023d718c7311	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
61	3	0	2026-08-28 22:57:15.191122	2026-08-28 22:57:15.191122	9a29a317-bd02-454b-b806-db67f8ababf0	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
62	1	0	2026-08-28 22:57:15.192555	2026-08-28 22:57:15.192555	f43fbd5f-7489-41c1-a883-10d7072ea3e6	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
62	2	0	2026-08-28 22:57:15.193867	2026-08-28 22:57:15.193867	227ccf49-39f5-4235-a660-08283121769d	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
63	1	0	2026-08-28 22:57:15.196477	2026-08-28 22:57:15.196477	cf7141f4-74b0-470d-a609-1fe4fe761c2a	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
64	1	0	2026-08-28 22:57:15.199217	2026-08-28 22:57:15.199217	cc566655-addb-4002-ba06-d1c8ae6640b5	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
65	1	0	2026-08-28 22:57:15.201038	2026-08-28 22:57:15.201038	99411743-8a11-4884-bb71-e0a3546f3653	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
66	1	0	2026-08-28 22:57:15.202605	2026-08-28 22:57:15.202605	7e534e3f-b9da-4ff1-a8b0-0b2514d8881a	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
66	2	0	2026-08-28 22:57:15.203889	2026-08-28 22:57:15.203889	f2419c33-a352-434c-a1f7-6c688650bb48	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
67	1	0	2026-08-28 22:57:15.205888	2026-08-28 22:57:15.205888	9ec9fa28-0f08-4fb5-bf94-af7117e59115	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
67	2	0	2026-08-28 22:57:15.207039	2026-08-28 22:57:15.207039	31ebb5f1-a0f2-4613-907f-ed056e3336e8	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
68	1	0	2026-08-28 22:57:15.208534	2026-08-28 22:57:15.208534	7432fb0c-9b0a-4dff-ba41-9bcf1b20f1a5	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
69	1	0	2026-08-28 22:57:15.210682	2026-08-28 22:57:15.210682	d6925005-9f09-43b5-ad70-201329154319	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
70	1	0	2026-08-28 22:57:15.213413	2026-08-28 22:57:15.213413	80cfca0f-292d-4ee2-9b47-51ebc3520a17	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
71	1	0	2026-08-28 22:57:15.216093	2026-08-28 22:57:15.216093	6a36e697-2c4b-44b6-bcc8-a59ce7d1bf08	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
71	2	0	2026-08-28 22:57:15.218589	2026-08-28 22:57:15.218589	c8d8346e-4a69-40ee-82c8-9ddb56e7401a	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
72	1	0	2026-08-28 22:57:15.220927	2026-08-28 22:57:15.220927	2866a4f0-ca40-4c2a-ba6d-53a2f050b109	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
72	2	0	2026-08-28 22:57:15.222351	2026-08-28 22:57:15.222351	a38a68a9-1e8d-4892-bac9-e65a04d13e4c	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
73	1	0	2026-08-28 22:57:15.226172	2026-08-28 22:57:15.226172	a84e9abc-037c-4953-b015-b08de7f35652	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
73	2	0	2026-08-28 22:57:15.227866	2026-08-28 22:57:15.227866	fc86fa57-319e-4120-ad98-5f9204367ff3	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
74	1	0	2026-08-28 22:57:15.231144	2026-08-28 22:57:15.231144	33eaf30e-5865-4cdf-969e-3beb80e69227	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
74	2	0	2026-08-28 22:57:15.232378	2026-08-28 22:57:15.232378	371ee258-d2bc-46f4-a21a-8f7e6c7fe3c2	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
75	1	0	2026-08-28 22:57:15.234111	2026-08-28 22:57:15.234111	558c0381-6c6a-41ad-9e33-a19c2045d49b	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
76	1	0	2026-08-28 22:57:15.235786	2026-08-28 22:57:15.235786	4d1717f7-e02e-41c5-9640-7159fd466abf	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
76	2	0	2026-08-28 22:57:15.237095	2026-08-28 22:57:15.237095	227e2d14-4e12-4a28-ac24-0d380ae6551e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
77	1	0	2026-08-28 22:57:15.238847	2026-08-28 22:57:15.238847	2a7090cd-8a71-4036-afb5-4d1b44229a7f	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
77	2	0	2026-08-28 22:57:15.239925	2026-08-28 22:57:15.239925	bb752a9b-4308-4517-a94a-172d5e8c8a0a	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
78	1	0	2026-08-28 22:57:15.241362	2026-08-28 22:57:15.241362	7d1de54b-fb55-40a1-b2da-94d6aefbf431	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
79	1	0	2026-08-28 22:57:15.243214	2026-08-28 22:57:15.243214	3685869d-833e-432e-b121-8c1fa96605ce	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
79	2	0	2026-08-28 22:57:15.245635	2026-08-28 22:57:15.245635	1796598a-28e5-4264-a58d-5cf6ba18b21e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
79	3	0	2026-08-28 22:57:15.247638	2026-08-28 22:57:15.247638	e604792a-381f-493a-9b32-491b7c591ee5	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
80	1	0	2026-08-28 22:57:15.24965	2026-08-28 22:57:15.24965	27ae1069-c091-4761-a5ae-c47d8a3dd9e7	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
81	1	0	2026-08-28 22:57:15.252032	2026-08-28 22:57:15.252032	99f57414-7392-402f-94a1-632675c680c3	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
81	2	0	2026-08-28 22:57:15.253118	2026-08-28 22:57:15.253118	e269d4df-913e-4c3d-9ba6-cf083a8f3ac9	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
81	3	0	2026-08-28 22:57:15.254838	2026-08-28 22:57:15.254838	26cbaac2-5e08-4ce1-83a7-193f38c6a9c1	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
82	1	0	2026-08-28 22:57:15.256474	2026-08-28 22:57:15.256474	f60cf6ff-4489-47a4-9a3c-3fed764f827c	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
83	1	0	2026-08-28 22:57:15.258129	2026-08-28 22:57:15.258129	1e6756ef-a603-47ff-9b5f-7de0532ab608	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
83	2	0	2026-08-28 22:57:15.259436	2026-08-28 22:57:15.259436	38c679cc-9fc8-41a2-ac1e-e9d1c2cdb526	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
84	1	0	2026-08-28 22:57:15.262034	2026-08-28 22:57:15.262034	bfc8f18d-4bcc-4950-9625-a00dab8dda51	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
85	1	0	2026-08-28 22:57:15.264297	2026-08-28 22:57:15.264297	1ea6fc5f-3528-42a5-8bdf-29df78ee2fb5	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
86	1	0	2026-08-28 22:57:15.266158	2026-08-28 22:57:15.266158	76f2236e-b955-4c24-ab5e-b244c3d087eb	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
86	2	0	2026-08-28 22:57:15.267573	2026-08-28 22:57:15.267573	54a8ee27-8c41-4125-a227-041484c60e2b	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
87	1	0	2026-08-28 22:57:15.269308	2026-08-28 22:57:15.269308	570abd46-871d-4987-b747-2e272b54006e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
88	1	0	2026-08-28 22:57:15.271142	2026-08-28 22:57:15.271142	37be43f0-d49b-457b-b192-3c478a907e93	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
89	1	0	2026-08-28 22:57:15.272693	2026-08-28 22:57:15.272693	fb853ad9-b239-4539-8aa2-5b855e3d5fa1	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
90	1	0	2026-08-28 22:57:15.274709	2026-08-28 22:57:15.274709	41ebb488-0e09-4ed1-9e6f-0141bcc34377	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
91	1	0	2026-08-28 22:57:15.276901	2026-08-28 22:57:15.276901	0da81c7b-81f7-43f2-9b51-6f57e6df4f52	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
91	2	0	2026-08-28 22:57:15.278844	2026-08-28 22:57:15.278844	208d40f8-67fa-454d-9558-7140b3341d1a	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
92	1	0	2026-08-28 22:57:15.280785	2026-08-28 22:57:15.280785	ab6b0961-dcf5-46e9-88c6-347561d44aa3	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
93	1	0	2026-08-28 22:57:15.282597	2026-08-28 22:57:15.282597	7ef05f29-3cc1-40bc-a445-4df2f659acf8	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
94	1	0	2026-08-28 22:57:15.284313	2026-08-28 22:57:15.284313	e079fdf9-8df1-4dee-8b61-c5ce65c8cc20	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
95	1	0	2026-08-28 22:57:15.286079	2026-08-28 22:57:15.286079	26bfd9b8-c02b-49a0-b05c-7341af221bad	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
95	2	0	2026-08-28 22:57:15.287756	2026-08-28 22:57:15.287756	a05faa41-0147-4db1-b355-57b9cdb3797e	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
96	1	0	2026-08-28 22:57:15.289256	2026-08-28 22:57:15.289256	cac6fe41-6078-4a47-a24d-d5b5ccce91f8	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
96	2	0	2026-08-28 22:57:15.29111	2026-08-28 22:57:15.29111	1a877f44-a28b-4b74-aa27-ac6f186630e5	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
97	1	0	2026-08-28 22:57:15.296477	2026-08-28 22:57:15.296477	6a6e1f2b-d0d5-4408-a3ef-1ec6b36a3bcb	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
97	2	0	2026-08-28 22:57:15.298005	2026-08-28 22:57:15.298005	185011be-c805-4e09-868b-d757f04141fb	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
98	1	0	2026-08-28 22:57:15.299611	2026-08-28 22:57:15.299611	44ed7376-d0cf-455d-b9b6-7196204102fa	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
99	1	0	2026-08-28 22:57:15.301195	2026-08-28 22:57:15.301195	3ec006bf-b94c-4e7a-bd2f-c4c3f49f9cdc	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
100	1	0	2026-08-28 22:57:15.302822	2026-08-28 22:57:15.302822	57e18e46-9e2d-4ca6-a6e3-6beb86445fca	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
100	2	0	2026-08-28 22:57:15.30413	2026-08-28 22:57:15.30413	4b33d91a-71f0-4289-abb7-6d6670711a11	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
101	1	0	2026-08-28 22:57:15.305889	2026-08-28 22:57:15.305889	9bd5848d-74e5-416d-b142-4e2a9f4d09ae	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
101	2	0	2026-08-28 22:57:15.307003	2026-08-28 22:57:15.307003	b6cb0717-821c-40d5-b3a9-ffd4f929ea43	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
102	1	0	2026-08-28 22:57:15.30887	2026-08-28 22:57:15.30887	48ae3baa-d0ee-491a-8b96-fdff5f2d0fe0	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
103	1	0	2026-08-28 22:57:15.31125	2026-08-28 22:57:15.31125	46fbf01c-c2f4-410f-8f8d-b17cf5056dae	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
104	1	0	2026-08-28 22:57:15.316323	2026-08-28 22:57:15.316323	dcdd13d7-b17e-465c-8df7-30be0bbe618f	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
105	1	0	2026-08-28 22:57:15.318096	2026-08-28 22:57:15.318096	e9e455ca-318a-4006-961a-04c3ee1cb4d0	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
106	1	0	2026-08-28 22:57:15.31963	2026-08-28 22:57:15.31963	33fcfbf9-0160-4547-915f-f9527f48a8a9	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
106	2	0	2026-08-28 22:57:15.32111	2026-08-28 22:57:15.32111	f07d2866-ecae-4b1d-8669-00994fa85928	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
107	1	0	2026-08-28 22:57:15.323652	2026-08-28 22:57:15.323652	9623a472-eb34-4689-a193-3615f21a1ff9	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
107	2	0	2026-08-28 22:57:15.325066	2026-08-28 22:57:15.325066	96245fa9-0c91-4781-9997-8e66add57db5	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
108	1	0	2026-08-28 22:57:15.326982	2026-08-28 22:57:15.326982	0e44f199-d7c9-4f0d-ab30-2f1aa321915b	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
108	2	0	2026-08-28 22:57:15.328144	2026-08-28 22:57:15.328144	234e4f2d-3d6a-4b30-8212-a5aa2441eef4	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
109	1	0	2026-08-28 22:57:15.329785	2026-08-28 22:57:15.329785	bf137746-2f16-49b0-abae-86dc7dbff13b	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
109	2	0	2026-08-28 22:57:15.33101	2026-08-28 22:57:15.33101	ec08dcef-e659-4211-8f7d-9298d85530a3	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
110	1	0	2026-08-28 22:57:15.333409	2026-08-28 22:57:15.333409	452e81f7-1fe8-4b4c-a5f4-7414e9158d42	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
110	2	0	2026-08-28 22:57:15.334472	2026-08-28 22:57:15.334472	fca42816-1c0f-4e40-bb0d-8d3e4d805810	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
111	1	0	2026-08-28 22:57:15.33598	2026-08-28 22:57:15.33598	a0ef98c3-a42b-4ec7-a990-9161193d496f	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
111	2	0	2026-08-28 22:57:15.337455	2026-08-28 22:57:15.337455	7598981a-340b-4146-a24d-1e2abb01bd2e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
112	1	0	2026-08-28 22:57:15.339624	2026-08-28 22:57:15.339624	3c14aca7-0cb4-412c-ae1b-08459dfbb99b	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
113	1	0	2026-08-28 22:57:15.341681	2026-08-28 22:57:15.341681	3bf81e8b-f64e-4337-8f7e-00fcf0c486dc	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
114	1	0	2026-08-28 22:57:15.3434	2026-08-28 22:57:15.3434	1cdbafc3-f0d6-4153-a2df-ad056b886104	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
114	2	0	2026-08-28 22:57:15.344683	2026-08-28 22:57:15.344683	10653693-a672-446b-bbdf-993e052e7971	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
115	\N	1	2026-08-28 22:57:15.449743	2026-08-28 22:57:15.449743	20e69c80-7618-4e16-95d1-77a98e9ac95b	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
116	\N	1	2026-08-28 22:57:15.458877	2026-08-28 22:57:15.458877	7b7b9975-ee19-46f7-badf-39c48bd19543	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
117	\N	1	2026-08-28 22:57:15.462559	2026-08-28 22:57:15.462559	d389f760-1330-4402-86b3-9c6e72c74526	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
118	\N	1	2026-08-28 22:57:15.46544	2026-08-28 22:57:15.46544	7df71f15-d3d1-45db-9d43-af93fb5e4f8a	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
119	\N	1	2026-08-28 22:57:15.468447	2026-08-28 22:57:15.468447	8f1a73b3-77dd-45d1-b15b-161ce188da33	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
120	\N	1	2026-08-28 22:57:15.471181	2026-08-28 22:57:15.471181	79ed6dca-109a-4f80-badb-9a45a734766c	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
121	\N	1	2026-08-28 22:57:15.474477	2026-08-28 22:57:15.474477	f21f9e6e-4639-4609-938d-5a83b032e41e	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
122	\N	1	2026-08-28 22:57:15.477546	2026-08-28 22:57:15.477546	e2ad82d0-106b-4754-a1b1-4c898bf72d01	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
123	\N	1	2026-08-28 22:57:15.480386	2026-08-28 22:57:15.480386	228baae9-8913-4f57-a065-cd260b53757c	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
124	\N	1	2026-08-28 22:57:15.483687	2026-08-28 22:57:15.483687	07333273-dce3-4f2f-810d-898900b230c6	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
125	\N	1	2026-08-28 22:57:15.48658	2026-08-28 22:57:15.48658	48e3e1a3-ca0c-40ef-b7de-c1f1b4d402ff	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
126	\N	1	2026-08-28 22:57:15.49033	2026-08-28 22:57:15.49033	2a0015de-095a-4fe4-8d7a-f798e86a46ee	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
127	\N	1	2026-08-28 22:57:15.493777	2026-08-28 22:57:15.493777	048a6193-916f-419e-9a58-eef371f7332a	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
128	\N	1	2026-08-28 22:57:15.497656	2026-08-28 22:57:15.497656	1df7c0c1-9395-43ca-9b5a-13447e72c34c	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
129	\N	1	2026-08-28 22:57:15.500727	2026-08-28 22:57:15.500727	0c7d4a7e-b207-466e-82cb-b44b90892740	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
130	\N	1	2026-08-28 22:57:15.503959	2026-08-28 22:57:15.503959	8c26d58b-d85b-40f0-8c24-f283f759a24e	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
131	\N	1	2026-08-28 22:57:15.508207	2026-08-28 22:57:15.508207	b5e4d680-ce20-4489-ad4f-1ef712906d31	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
132	\N	1	2026-08-28 22:57:15.511781	2026-08-28 22:57:15.511781	10c81f55-7e46-4857-9b81-48b89cc375bf	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
133	\N	1	2026-08-28 22:57:15.518729	2026-08-28 22:57:15.518729	3b285136-484f-48de-b3b4-bdd89c0bccaa	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
134	\N	1	2026-08-28 22:57:15.522442	2026-08-28 22:57:15.522442	005610f6-8b44-4934-9ad4-e164212e2283	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
135	\N	1	2026-08-28 22:57:15.525723	2026-08-28 22:57:15.525723	cd48affa-252e-4178-ab4e-decbdb101559	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
136	\N	1	2026-08-28 22:57:15.5288	2026-08-28 22:57:15.5288	ced35fcf-132c-4a8e-addc-9a4145d4554f	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
137	\N	1	2026-08-28 22:57:15.531832	2026-08-28 22:57:15.531832	aa6c1ba2-1ccd-4963-b9ab-0ea12ce00a33	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
138	\N	1	2026-08-28 22:57:15.534859	2026-08-28 22:57:15.534859	728eda00-c782-432c-b9a9-e1669c379774	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
139	\N	1	2026-08-28 22:57:15.538057	2026-08-28 22:57:15.538057	0eebdb27-16c4-41c6-9d2e-fe4b5933de11	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
140	\N	1	2026-08-28 22:57:15.540979	2026-08-28 22:57:15.540979	c23d491d-a33b-40f3-8497-c8e032f139d9	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
141	\N	1	2026-08-28 22:57:15.544725	2026-08-28 22:57:15.544725	a6e789ba-2709-4823-8d71-4708e1c8d84f	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
142	\N	1	2026-08-28 22:57:15.54942	2026-08-28 22:57:15.54942	51e4222c-5ed5-409d-ab91-d3dfa792b1c0	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
143	\N	1	2026-08-28 22:57:15.552573	2026-08-28 22:57:15.552573	a7741b52-f62d-4cd4-9f88-7225adb0bb20	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
144	\N	1	2026-08-28 22:57:15.556904	2026-08-28 22:57:15.556904	de65e2dc-87a8-4d13-a21c-571a0ad58557	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
145	\N	1	2026-08-28 22:57:15.559606	2026-08-28 22:57:15.559606	7ae94958-5767-4fa4-9edd-fbd2a3d5a671	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
146	\N	1	2026-08-28 22:57:15.578617	2026-08-28 22:57:15.578617	2fa148ef-eb1e-44f3-b369-4f28afc40361	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
147	\N	1	2026-08-28 22:57:15.582782	2026-08-28 22:57:15.582782	78cfacca-f1de-4b21-8389-467114e68ff4	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
148	\N	1	2026-08-28 22:57:15.585306	2026-08-28 22:57:15.585306	ad1548d2-cbbf-4876-a046-c40f89460e86	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
149	\N	1	2026-08-28 22:57:15.588308	2026-08-28 22:57:15.588308	0bd1a25c-8c14-41cb-9035-660c85f9eed2	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
150	\N	1	2026-08-28 22:57:15.590966	2026-08-28 22:57:15.590966	8895c06e-8e67-4b16-9e75-c43ed5874798	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
151	\N	1	2026-08-28 22:57:15.593873	2026-08-28 22:57:15.593873	bdd97b34-6585-45cf-ac04-682b1491a675	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
152	\N	1	2026-08-28 22:57:15.597183	2026-08-28 22:57:15.597183	b1eeaf52-3d17-44ce-af3b-a8da46a4e38e	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
153	\N	1	2026-08-28 22:57:15.599781	2026-08-28 22:57:15.599781	070e2bbd-6cb6-49ed-a693-427a50fd481d	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
154	\N	1	2026-08-28 22:57:15.602742	2026-08-28 22:57:15.602742	dbf29d63-5967-4058-a7dd-dcc133c0aceb	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
155	\N	1	2026-08-28 22:57:15.605931	2026-08-28 22:57:15.605931	b7dc7ced-d3d7-4697-b305-3e9f5d33cdb9	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
156	\N	1	2026-08-28 22:57:15.608433	2026-08-28 22:57:15.608433	ff15ebbf-150c-499f-9715-df09da08e775	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
157	\N	1	2026-08-28 22:57:15.611176	2026-08-28 22:57:15.611176	a19b555c-d350-418d-8026-d62a88962668	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
158	\N	1	2026-08-28 22:57:15.613646	2026-08-28 22:57:15.613646	22f713a2-b8b6-4c63-a252-0731b542f38d	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
159	\N	1	2026-08-28 22:57:15.616064	2026-08-28 22:57:15.616064	8c24a792-87ec-416a-a99f-3580fa58d771	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
160	\N	1	2026-08-28 22:57:15.619212	2026-08-28 22:57:15.619212	2cf77fe6-c813-4db8-b436-92bb96bb223f	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
161	\N	1	2026-08-28 22:57:15.622318	2026-08-28 22:57:15.622318	d6ca08e8-006c-43c0-9676-7b2b4381d0d0	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
162	\N	1	2026-08-28 22:57:16.270681	2026-08-28 22:57:16.270681	7a2d81a1-48b7-4b57-bcd2-dd38c8489980	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
163	\N	1	2026-08-28 22:57:16.275318	2026-08-28 22:57:16.275318	0eda69dc-2896-4f00-a2ea-91373d02480e	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
164	\N	1	2026-08-28 22:57:16.278486	2026-08-28 22:57:16.278486	5b6a0196-59bd-44ff-a03c-52cb14782a80	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
165	\N	1	2026-08-28 22:57:16.281433	2026-08-28 22:57:16.281433	575c7880-a19f-44d7-a968-6d27c2193ffc	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
166	\N	1	2026-08-28 22:57:16.284758	2026-08-28 22:57:16.284758	829cad76-09ae-43a1-aed9-3fe98aeecb2d	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
167	\N	1	2026-08-28 22:57:16.288873	2026-08-28 22:57:16.288873	00c19b0d-eaf9-4276-be31-9a39e3dbc112	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
168	\N	1	2026-08-28 22:57:16.292997	2026-08-28 22:57:16.292997	f0adc373-c788-42f3-a608-5e0c7d7e07ea	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
169	\N	1	2026-08-28 22:57:16.297268	2026-08-28 22:57:16.297268	8724231d-9350-4b0a-a97a-61835a543389	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
170	\N	1	2026-08-28 22:57:16.300577	2026-08-28 22:57:16.300577	37a934bd-df68-4760-bfa7-8bf0778887c2	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
171	\N	1	2026-08-28 22:57:16.303742	2026-08-28 22:57:16.303742	0411702a-31af-43fc-b296-ae5cb7dd55b5	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
172	\N	1	2026-08-28 22:57:16.307163	2026-08-28 22:57:16.307163	d0f70ca4-dc1a-44a2-b64f-ee6ca0c838a9	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
173	\N	1	2026-08-28 22:57:16.310595	2026-08-28 22:57:16.310595	275968a0-d3ca-4ea6-9688-f771673dd0d5	d3f32de2-0950-43c5-ad25-4a994cf7f8b9	1c17ea54-ccea-4d78-a227-73e9ec7a3977	\N	f	\N	\N	\N	\N	\N	\N
162	1	0	2026-08-28 22:57:16.397977	2026-08-28 22:57:16.397977	508c64a2-d34a-40d9-a873-52d99ecdd521	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
162	2	0	2026-08-28 22:57:16.399323	2026-08-28 22:57:16.399323	26c253d8-d3d6-4728-8c96-15a792ed1883	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2f7a19ee-638c-420e-b42a-b62645c40158	\N	f	\N	\N	\N	\N	\N	\N
162	3	0	2026-08-28 22:57:16.400841	2026-08-28 22:57:16.400841	6ad77de5-91e8-402c-b540-c8378952a657	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	cf5b85d5-7e72-4b44-a004-f43b7a6d3b59	\N	f	\N	\N	\N	\N	\N	\N
163	1	0	2026-08-28 22:57:16.40206	2026-08-28 22:57:16.40206	1baf70fc-1e21-426b-9c2e-089300930ad3	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
163	2	0	2026-08-28 22:57:16.403383	2026-08-28 22:57:16.403383	164c5efb-b182-4d43-b3a0-bc2aa70b50ce	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2f7a19ee-638c-420e-b42a-b62645c40158	\N	f	\N	\N	\N	\N	\N	\N
163	3	0	2026-08-28 22:57:16.404724	2026-08-28 22:57:16.404724	dcbc153b-0d9e-4ede-995d-ec4d62c75f12	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	34eb1d52-674b-43d7-b5bb-e295a34a8b21	\N	f	\N	\N	\N	\N	\N	\N
164	1	0	2026-08-28 22:57:16.405755	2026-08-28 22:57:16.405755	0e3db7c5-5922-4b03-8e05-291df3a1b650	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2f7a19ee-638c-420e-b42a-b62645c40158	\N	f	\N	\N	\N	\N	\N	\N
164	2	0	2026-08-28 22:57:16.406894	2026-08-28 22:57:16.406894	6a437c79-69ab-454b-a082-ed72a5fdc48b	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
164	3	0	2026-08-28 22:57:16.408213	2026-08-28 22:57:16.408213	34adee3d-d7c7-468b-b12e-a775f5577ab6	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	cf5b85d5-7e72-4b44-a004-f43b7a6d3b59	\N	f	\N	\N	\N	\N	\N	\N
165	1	0	2026-08-28 22:57:16.409388	2026-08-28 22:57:16.409388	a3737d3d-bdbb-4211-ae70-c5aa1fc875b5	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2fe4e72d-8242-487c-a71c-efe30bbbf8f5	\N	f	\N	\N	\N	\N	\N	\N
165	2	0	2026-08-28 22:57:16.410846	2026-08-28 22:57:16.410846	ee536084-1b99-49b6-abdb-a8237afc33b1	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
165	3	0	2026-08-28 22:57:16.41202	2026-08-28 22:57:16.41202	c7813015-dff0-4508-bb24-ee8580768b2e	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	08e3bbb5-6aee-4061-8d87-42ce08332974	\N	f	\N	\N	\N	\N	\N	\N
166	1	0	2026-08-28 22:57:16.413106	2026-08-28 22:57:16.413106	014eaef4-5309-404e-b3cf-2dbec03b791f	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2f7a19ee-638c-420e-b42a-b62645c40158	\N	f	\N	\N	\N	\N	\N	\N
166	2	0	2026-08-28 22:57:16.414164	2026-08-28 22:57:16.414164	28c3de9b-7e09-4e8b-81a1-3039e3816afc	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	99935a28-e997-4e5a-940f-5d78123b7db0	\N	f	\N	\N	\N	\N	\N	\N
166	3	0	2026-08-28 22:57:16.415232	2026-08-28 22:57:16.415232	235e9fcf-0f8f-4f77-98f6-c0201e1edb2a	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	262968da-50df-4a68-abbd-9edc10f8c017	\N	f	\N	\N	\N	\N	\N	\N
167	1	0	2026-08-28 22:57:16.416375	2026-08-28 22:57:16.416375	30abe9e6-3f70-41d9-aa87-8c60ccd4fcab	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	725d1337-1b13-4f48-93f2-ffab45663fbc	\N	f	\N	\N	\N	\N	\N	\N
167	2	0	2026-08-28 22:57:16.417282	2026-08-28 22:57:16.417282	93a6d01b-cb99-4a8d-a028-cd8cd23e4b56	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	cf5b85d5-7e72-4b44-a004-f43b7a6d3b59	\N	f	\N	\N	\N	\N	\N	\N
167	3	0	2026-08-28 22:57:16.418368	2026-08-28 22:57:16.418368	f52483f2-4b5b-4c1b-a243-410f8c35c0d5	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2f7a19ee-638c-420e-b42a-b62645c40158	\N	f	\N	\N	\N	\N	\N	\N
168	1	0	2026-08-28 22:57:16.419356	2026-08-28 22:57:16.419356	e5a89e7d-04db-45a2-bf0e-5984a1256266	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	262968da-50df-4a68-abbd-9edc10f8c017	\N	f	\N	\N	\N	\N	\N	\N
168	2	0	2026-08-28 22:57:16.420511	2026-08-28 22:57:16.420511	3266427a-7c6a-4322-a38a-aa3f04afded4	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	cf5b85d5-7e72-4b44-a004-f43b7a6d3b59	\N	f	\N	\N	\N	\N	\N	\N
168	3	0	2026-08-28 22:57:16.421683	2026-08-28 22:57:16.421683	9f43004c-c447-4c53-b093-4feece3ec833	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	34eb1d52-674b-43d7-b5bb-e295a34a8b21	\N	f	\N	\N	\N	\N	\N	\N
169	1	0	2026-08-28 22:57:16.422962	2026-08-28 22:57:16.422962	a9a42d24-f6d2-4512-9381-bb66abef7923	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
169	2	0	2026-08-28 22:57:16.423945	2026-08-28 22:57:16.423945	7e59850d-a03a-4830-83c0-434985a736a5	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	99935a28-e997-4e5a-940f-5d78123b7db0	\N	f	\N	\N	\N	\N	\N	\N
169	3	0	2026-08-28 22:57:16.424869	2026-08-28 22:57:16.424869	883d5b19-634d-4988-a38a-3d4c786571c2	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	725d1337-1b13-4f48-93f2-ffab45663fbc	\N	f	\N	\N	\N	\N	\N	\N
170	1	0	2026-08-28 22:57:16.42582	2026-08-28 22:57:16.42582	dd71295f-0f01-45be-9512-7b911af8e2d0	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	99935a28-e997-4e5a-940f-5d78123b7db0	\N	f	\N	\N	\N	\N	\N	\N
170	2	0	2026-08-28 22:57:16.427111	2026-08-28 22:57:16.427111	5399b9cb-dbe4-4a64-a7d0-2836930541a1	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	cf5b85d5-7e72-4b44-a004-f43b7a6d3b59	\N	f	\N	\N	\N	\N	\N	\N
170	3	0	2026-08-28 22:57:16.428043	2026-08-28 22:57:16.428043	d749f0a3-ed83-47d6-8082-46845838c7c0	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	6b4b7395-5f2c-4446-9cf6-9fb91c92df95	\N	f	\N	\N	\N	\N	\N	\N
171	1	0	2026-08-28 22:57:16.429019	2026-08-28 22:57:16.429019	b19ecc84-02c7-4f9d-ad0a-c587e513c645	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
171	2	0	2026-08-28 22:57:16.429977	2026-08-28 22:57:16.429977	c47e02e1-f0ef-470b-af78-25501eb918eb	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	99935a28-e997-4e5a-940f-5d78123b7db0	\N	f	\N	\N	\N	\N	\N	\N
171	3	0	2026-08-28 22:57:16.430929	2026-08-28 22:57:16.430929	18a8a603-a5bf-4525-a03c-21d23d0afa45	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	6b4b7395-5f2c-4446-9cf6-9fb91c92df95	\N	f	\N	\N	\N	\N	\N	\N
172	1	0	2026-08-28 22:57:16.432073	2026-08-28 22:57:16.432073	79dca0f6-6083-498b-9e76-d34041ed6aa8	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2f7a19ee-638c-420e-b42a-b62645c40158	\N	f	\N	\N	\N	\N	\N	\N
172	2	0	2026-08-28 22:57:16.432985	2026-08-28 22:57:16.432985	28a0cb85-f9a8-4e6b-9032-89e5ae341476	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	725d1337-1b13-4f48-93f2-ffab45663fbc	\N	f	\N	\N	\N	\N	\N	\N
172	3	0	2026-08-28 22:57:16.43392	2026-08-28 22:57:16.43392	888e1643-23d0-4e12-9d4b-e8651958c279	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
173	1	0	2026-08-28 22:57:16.434912	2026-08-28 22:57:16.434912	ee5a7bba-49dc-4a84-b9fa-9e6a7bd59ac7	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	34eb1d52-674b-43d7-b5bb-e295a34a8b21	\N	f	\N	\N	\N	\N	\N	\N
173	2	0	2026-08-28 22:57:16.435896	2026-08-28 22:57:16.435896	6f2999e6-0856-4a33-b48a-7a335ad9168c	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	262968da-50df-4a68-abbd-9edc10f8c017	\N	f	\N	\N	\N	\N	\N	\N
173	3	0	2026-08-28 22:57:16.437244	2026-08-28 22:57:16.437244	c1050367-b982-4482-819a-3878caddbff3	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	2fe4e72d-8242-487c-a71c-efe30bbbf8f5	\N	f	\N	\N	\N	\N	\N	\N
174	1	0	2026-08-28 22:57:16.438903	2026-08-28 22:57:16.438903	e633b9e3-6b06-4059-94f1-931198e9b843	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	725d1337-1b13-4f48-93f2-ffab45663fbc	\N	f	\N	\N	\N	\N	\N	\N
174	2	0	2026-08-28 22:57:16.439893	2026-08-28 22:57:16.439893	9bdccae0-b446-49c9-8f15-418ae5206d96	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	7af4426e-7f2e-448a-8e3a-d5730fa8f1cb	\N	f	\N	\N	\N	\N	\N	\N
174	3	0	2026-08-28 22:57:16.440873	2026-08-28 22:57:16.440873	c21d63a2-ed37-403c-978f-a339a583a94e	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	dd09d15c-3c9c-4759-b04e-17f8e3170eb0	\N	f	\N	\N	\N	\N	\N	\N
175	1	0	2026-08-28 22:57:16.442406	2026-08-28 22:57:16.442406	b943884e-1d80-4e03-898a-b5b83ed07f5d	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	99935a28-e997-4e5a-940f-5d78123b7db0	\N	f	\N	\N	\N	\N	\N	\N
175	2	0	2026-08-28 22:57:16.443556	2026-08-28 22:57:16.443556	a2804aba-cc84-4ada-9e39-2113c334bda3	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	7af4426e-7f2e-448a-8e3a-d5730fa8f1cb	\N	f	\N	\N	\N	\N	\N	\N
175	3	0	2026-08-28 22:57:16.44456	2026-08-28 22:57:16.44456	1cca9d31-b387-4af8-9084-33cb54e5d6d8	23f45ca4-194c-4c7e-9db7-ea9051c0dac5	262968da-50df-4a68-abbd-9edc10f8c017	\N	f	\N	\N	\N	\N	\N	\N
176	\N	1	2026-08-28 22:57:16.455355	2026-08-28 22:57:16.455355	af3f1f1a-b6f5-45ad-a94e-9655ed41df78	561adfd0-6a6a-40d4-a542-aac315de5518	411943c4-ebb0-4aee-9482-4262232d7492	\N	f	\N	\N	\N	\N	\N	\N
177	\N	1	2026-08-28 22:57:16.457416	2026-08-28 22:57:16.457416	df646a8c-1365-48c1-9056-ae71ac02846d	561adfd0-6a6a-40d4-a542-aac315de5518	411943c4-ebb0-4aee-9482-4262232d7492	\N	f	\N	\N	\N	\N	\N	\N
178	\N	1	2026-08-28 22:57:16.459708	2026-08-28 22:57:16.459708	ccddc390-945b-4805-8934-8b61f9c504b7	561adfd0-6a6a-40d4-a542-aac315de5518	411943c4-ebb0-4aee-9482-4262232d7492	\N	f	\N	\N	\N	\N	\N	\N
179	\N	1	2026-08-28 22:57:16.461767	2026-08-28 22:57:16.461767	a4ad81a8-f406-41d0-a1dc-e5d5ac4b2123	561adfd0-6a6a-40d4-a542-aac315de5518	411943c4-ebb0-4aee-9482-4262232d7492	\N	f	\N	\N	\N	\N	\N	\N
180	\N	1	2026-08-28 22:57:16.46391	2026-08-28 22:57:16.46391	4ae774c5-7c6d-4062-8fea-8481adbb4c0b	561adfd0-6a6a-40d4-a542-aac315de5518	411943c4-ebb0-4aee-9482-4262232d7492	\N	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4854 (class 0 OID 10132655)
-- Dependencies: 318
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
51	47	27	2025-07-15 12:05:40.388425	2025-07-15 12:05:40.388425
52	27	47	2025-07-15 12:05:40.392671	2025-07-15 12:05:40.392671
53	47	17	2025-07-15 12:05:40.395841	2025-07-15 12:05:40.395841
54	17	47	2025-07-15 12:05:40.398498	2025-07-15 12:05:40.398498
55	47	46	2025-07-15 12:05:40.401641	2025-07-15 12:05:40.401641
56	46	47	2025-07-15 12:05:40.403955	2025-07-15 12:05:40.403955
57	48	47	2025-07-15 12:08:23.035912	2025-07-15 12:08:23.035912
58	47	48	2025-07-15 12:08:23.039059	2025-07-15 12:08:23.039059
\.


--
-- TOC entry 4856 (class 0 OID 10132662)
-- Dependencies: 320
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
20220810152049
20230407093205
20230427124337
20231101100015
20240116180000
20240215100000
20240319130000
20240329230000
20240329230010
20240422200000
20240530200000
20240605200000
20240906200000
20240921200000
20240921221000
20250419000000
20250419000001
20250419000002
20250419000003
20250419000004
20250419000005
20250419000006
20250419000007
20250419000008
20250419000009
20250419000010
20250419000011
20250419000012
20250518000000
20250518000001
20250612000000
20250612000001
20250612000002
20250723000000
20250803000000
20250902000000
20250902000001
20250902000002
20250902000003
20250902000004
20250902000005
20250902000006
20250902000007
20250902000008
20250902000009
20250902000010
20250902000011
20250902000012
20250905000000
20250921000000
20251116000000
20251116000001
20251116000002
20251116000003
20251210000000
20251220000000
20251224000000
20260403000000
20260404000000
20260404000001
20260404000002
20260404000003
20260404000004
20260404000005
20260404000006
20260404000007
20260404000008
20260404000009
20260404000010
20260404000011
20260404000012
20260416000000
20260501000000
20260501000001
20260613000000
20260614000000
20260614000001
20260621000000
20260626000000
20260627000000
20260705000000
20260711000000
20260718000000
20260824000000
20260824000001
20260825000000
\.


--
-- TOC entry 4857 (class 0 OID 10132668)
-- Dependencies: 321
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
45	6	24	2025-07-14 10:57:51.390816	2025-07-14 10:57:51.390816	2
\.


--
-- TOC entry 4859 (class 0 OID 10132675)
-- Dependencies: 323
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sections (id, chapter_id, title, created_at, updated_at, "position", display_number, hidden, tags_order, details) FROM stdin;
7	4	Eine kurze Geschichte der Algebra	2020-07-24 16:53:07.753998	2025-07-14 11:12:42.262119	1	\N	\N	\N	\N
25	7	Der Kongruenzsatz für Dreiecke	2020-07-24 17:04:34.840428	2026-08-26 19:49:17.364291	6	\N	\N	\N	\N
26	7	Mittelsenkrechte und Winkelhalbierende	2020-07-24 17:04:34.871461	2026-08-26 19:49:17.364291	7	\N	\N	\N	\N
27	7	Innen- und Außenwinkel im Dreieck	2020-07-24 17:04:34.90258	2026-08-26 19:49:17.364291	8	\N	\N	\N	\N
28	7	In- und Umkreis	2020-07-24 17:04:34.934588	2026-08-26 19:49:17.364291	9	\N	\N	\N	\N
9	5	Affine Abbildungen	2020-07-24 17:04:34.31982	2026-08-26 19:49:17.364291	2	\N	\N	\N	\N
10	5	Affine Koordinaten	2020-07-24 17:04:34.351367	2026-08-26 19:49:17.364291	3	\N	\N	\N	\N
11	5	Polytope	2020-07-24 17:04:34.386976	2026-08-26 19:49:17.364291	4	\N	\N	\N	\N
29	7	Übungsaufgaben	2020-07-24 17:04:34.966316	2026-08-26 19:49:17.364291	10	\N	\N	\N	\N
12	5	Projektive Räume	2020-07-24 17:04:34.426172	2026-08-26 19:49:17.364291	5	\N	\N	\N	\N
13	5	Projektive Abbildungen	2020-07-24 17:04:34.459566	2026-08-26 19:49:17.364291	6	\N	\N	\N	\N
14	5	Projektive Koordinaten	2020-07-24 17:04:34.491447	2026-08-26 19:49:17.364291	7	\N	\N	\N	\N
30	8	Das Vollständigkeitsaxiom	2020-07-24 17:04:34.99914	2026-08-26 19:49:17.364291	1	\N	\N	\N	\N
15	5	Computergraphik	2020-07-24 17:04:34.523458	2026-08-26 19:49:17.364291	8	\N	\N	\N	\N
16	5	Übungsaufgaben	2020-07-24 17:04:34.556461	2026-08-26 19:49:17.364291	9	\N	\N	\N	\N
31	8	Euklidische Ebenen	2020-07-24 17:04:35.027944	2026-08-26 19:49:17.364291	2	\N	\N	\N	\N
32	8	Kreise	2020-07-24 17:04:35.060817	2026-08-26 19:49:17.364291	3	\N	\N	\N	\N
17	6	Inzidenzebenen	2020-07-24 17:04:34.590767	2026-08-26 19:49:17.364291	1	\N	\N	\N	\N
33	8	Die Inversion am Kreis	2020-07-24 17:04:35.092405	2026-08-26 19:49:17.364291	4	\N	\N	\N	\N
18	6	Affine Ebenen	2020-07-24 17:04:34.621909	2026-08-26 19:49:17.364291	2	\N	\N	\N	\N
19	6	Übungsaufgaben	2020-07-24 17:04:34.651674	2026-08-26 19:49:17.364291	3	\N	\N	\N	\N
20	7	Die Anordnungsaxiome	2020-07-24 17:04:34.684294	2026-08-26 19:49:17.364291	1	\N	\N	\N	\N
34	8	Übungsaufgaben	2020-07-24 17:04:35.123464	2026-08-26 19:49:17.364291	5	\N	\N	\N	\N
21	7	Die Kongruenzaxiome für Strecken	2020-07-24 17:04:34.715512	2026-08-26 19:49:17.364291	2	\N	\N	\N	\N
22	7	Die Kongruenzaxiome für Winkel	2020-07-24 17:04:34.745589	2026-08-26 19:49:17.364291	3	\N	\N	\N	\N
23	7	Ergänzungswinkel, Gegenwinkel und rechte Winkel	2020-07-24 17:04:34.77568	2026-08-26 19:49:17.364291	4	\N	\N	\N	\N
35	9	Das Poincaré'sche Kreismodell	2020-07-24 17:04:35.160116	2026-08-26 19:49:17.364291	1	\N	\N	\N	\N
24	7	Orthogonalität und Parallelität	2020-07-24 17:04:34.806388	2026-08-26 19:49:17.364291	5	\N	\N	\N	\N
36	9	Hyperbolische Geometrie	2020-07-24 17:04:35.190516	2026-08-26 19:49:17.364291	2	\N	\N	\N	\N
8	5	Affine Räume	2020-07-24 17:04:34.287564	2026-08-26 19:49:17.364291	1	\N	\N	\N	\N
37	9	Übungsaufgaben	2020-07-24 17:04:35.220559	2026-08-26 19:49:17.364291	3	\N	\N	\N	\N
2	1	Unitäre Räume und der Spektralsatz	2020-07-24 13:19:21.145061	2026-08-28 15:08:35.077227	1		f	\N	
5	3	Invarianten- und Determinantenteiler	2020-07-24 13:19:58.558913	2026-08-28 15:08:35.077227	1		f	\N	
6	3	Normalformen	2020-07-24 13:20:07.536377	2026-08-28 15:08:35.077227	2		f	\N	
1	2	Ringe und Ideale	2020-07-24 13:18:45.156279	2026-08-28 15:08:35.077227	1		f	\N	
3	2	Teilbarkeit	2020-07-24 13:19:33.31142	2026-08-28 15:08:35.077227	2		f	\N	
4	2	Euklidische Ringe	2020-07-24 13:19:42.036437	2026-08-28 15:08:35.077227	3		f	\N	
\.


--
-- TOC entry 4861 (class 0 OID 10132684)
-- Dependencies: 325
-- Data for Name: speaker_talk_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.speaker_talk_joins (id, talk_id, speaker_id, created_at, updated_at, source_campaign_id) FROM stdin;
1	1	5	2022-08-05 13:27:59.320402	2022-08-05 13:27:59.320402	\N
2	1	6	2022-08-05 13:31:37.207743	2022-08-05 13:31:37.207743	\N
3	2	5	2025-07-15 12:11:14.651103	2025-07-15 12:11:14.651103	\N
4	2	6	2025-07-15 12:11:39.202251	2025-07-15 12:11:39.202251	\N
5	3	7	2025-07-15 12:11:58.989642	2025-07-15 12:11:58.989642	\N
26	10	46	2026-08-28 22:57:15.026487	2026-08-28 22:57:15.026487	f4548178-f640-4c08-9f4a-f53d4890b6f3
27	14	47	2026-08-28 22:57:15.035858	2026-08-28 22:57:15.035858	f4548178-f640-4c08-9f4a-f53d4890b6f3
28	7	56	2026-08-28 22:57:15.040551	2026-08-28 22:57:15.040551	f4548178-f640-4c08-9f4a-f53d4890b6f3
29	11	57	2026-08-28 22:57:15.046931	2026-08-28 22:57:15.046931	f4548178-f640-4c08-9f4a-f53d4890b6f3
30	8	49	2026-08-28 22:57:15.052404	2026-08-28 22:57:15.052404	f4548178-f640-4c08-9f4a-f53d4890b6f3
31	5	48	2026-08-28 22:57:15.059387	2026-08-28 22:57:15.059387	f4548178-f640-4c08-9f4a-f53d4890b6f3
32	13	50	2026-08-28 22:57:15.065587	2026-08-28 22:57:15.065587	f4548178-f640-4c08-9f4a-f53d4890b6f3
33	6	54	2026-08-28 22:57:15.071477	2026-08-28 22:57:15.071477	f4548178-f640-4c08-9f4a-f53d4890b6f3
34	9	51	2026-08-28 22:57:15.079997	2026-08-28 22:57:15.079997	f4548178-f640-4c08-9f4a-f53d4890b6f3
35	12	52	2026-08-28 22:57:15.085558	2026-08-28 22:57:15.085558	f4548178-f640-4c08-9f4a-f53d4890b6f3
\.


--
-- TOC entry 4863 (class 0 OID 10132693)
-- Dependencies: 327
-- Data for Name: subject_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subject_translations (id, subject_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:10:54.797363	2020-07-24 13:10:54.797363	Mathematik
2	1	en	2020-07-24 13:10:54.800296	2020-07-24 13:10:54.800296	Mathematics
3	2	de	2020-07-24 13:11:31.488701	2020-07-24 13:11:31.488701	Informatik
4	2	en	2020-07-24 13:11:31.492281	2020-07-24 13:11:31.492281	Computer Science
\.


--
-- TOC entry 4865 (class 0 OID 10132704)
-- Dependencies: 329
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subjects (id, created_at, updated_at) FROM stdin;
1	2020-07-24 13:10:54.791691	2020-07-24 13:10:54.791691
2	2020-07-24 13:11:31.484615	2020-07-24 13:11:31.484615
\.


--
-- TOC entry 4867 (class 0 OID 10132711)
-- Dependencies: 331
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.submissions (tutorial_id, assignment_id, token, created_at, updated_at, manuscript_data, invited_user_ids, correction_data, id, last_modification_by_users_at, accepted) FROM stdin;
1	1	9iVG9t	2020-11-28 16:47:39.509532	2020-11-28 16:53:54.375618	{"id":"2053b3abc33881461a4bd884d867ca4c.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"b2e1169bf837f544df8f1e0627e7481e.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	6e088ccc-9568-4dc6-8354-9b46c2c7d135	2021-11-28 16:51:20.326433	t
1	2	DHQ7Yd	2020-11-28 16:55:33.791975	2020-11-28 16:55:33.822069	{"id":"c07f01e9f7400fa298b639d41ccc84f8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	\N	e5c5f104-94c2-4f6d-b3ee-ec84b26c81ed	2021-11-28 16:55:33.821883	\N
1	1	7ZuBdv	2020-11-28 16:48:16.014103	2020-11-28 16:53:45.950681	{"id":"78f53faef661f736a9f775ce2946d3a4.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"feca3ab66f00c78344785b4de2de4dee.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	21e42f50-a50d-4ea6-9239-94ef2c0f238a	2021-11-28 16:48:36.102696	\N
1	1	soywYN	2020-11-28 16:48:56.729104	2020-11-28 16:53:49.943971	{"id":"1baef7a77688a207fc32b595406433d8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"8768adf897b9786221e25eb12b2c4956.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	d6ce28ca-e8b4-4f3c-8ad4-61ef035c88aa	2021-11-28 16:49:20.704658	\N
1	3	r9Hqx5	2022-08-05 14:51:06.864604	2022-08-05 14:52:06.705536	{"id":"1a0fd5eabca55ff91c0ca56e20e16fa1.pdf","storage":"submission_store","metadata":{"filename":"empty.pdf","size":1154,"mime_type":"application/pdf"}}	{}	\N	d9d47c3a-f53b-4afc-adc2-61a6e050cb30	2023-08-05 14:52:06.704508	\N
2	1	7Sowsn	2026-08-28 15:08:34.281465	2026-08-28 15:09:42.14599	{"id":"6be2563d255058f52028f7c18fbebe81.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"2ea72714062fc0894f2999464c286dc0a04fa0633d7d757a8136e30e9b92d947"}}}	{}	\N	69d37c49-4a21-4cf7-b923-8b21f7e2f1c7	\N	\N
3	1	H5tmao	2026-08-28 15:08:34.323468	2026-08-28 15:09:42.170589	{"id":"0ee14116aa623d97ebb10327841c4139.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"60332705a55af3815cacc46a0354deb71d10dab8ca620c04bbc2d1571038727a"}}}	{}	\N	9805be16-7f98-4824-b26a-0a63ff6a5a7b	\N	\N
4	1	X8coBB	2026-08-28 15:08:34.390445	2026-08-28 15:09:42.1961	{"id":"f0eae269e1866e3539345e4026753b41.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"a9b9e1dce85637612688cc680a3236fcb921fdc48de325f9c3e3818d444796bb"}}}	{}	\N	e44a1efe-9e5b-46fd-9a98-f90f14abe1a7	\N	\N
2	3	sa2k1L	2026-08-28 15:08:34.635417	2026-08-28 15:09:42.297592	{"id":"4248f9f99cb0dd8c58c0842407c136c7.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"a22cc17c7b40fe948c041116be7fa5662e0342a4ba7d4e3bc8bf01f4eb9b0616"}}}	{}	\N	b2b9dbe2-f089-4b64-8447-7a789e2b195a	\N	\N
2	1	yGWHgK	2026-08-28 15:08:34.241593	2026-08-28 15:09:42.136838	{"id":"0ef82dcc492f4c963d2b660f7a1c7668.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"912f5c96cb5b748ecd5a0ef5d8f44287307d37e619637403b05289dffcff2eee"}}}	{}	{"id":"edcda36e582b11939f3ff5dac4b59b9a.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"7718805d872a7dbe92b5fb03433fd9494c3459c233e83442f001080ec8a36fa3"}}}	012909d0-498c-4ae1-8c22-267c0dbc1045	\N	t
3	1	Mecktj	2026-08-28 15:08:34.29926	2026-08-28 15:09:42.16221	{"id":"cb32d502e722675eb84b25f1ed9bd100.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"9568ee1716dbefe4f4c7a47e5d61ac719d765e1f554684185d53c2138cfea6fe"}}}	{}	{"id":"14e08073fe48703cbe83d087b6048f49.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"0126275f8567be982b7346e89f18e8a9d57c05f67741df12ab21fefc6c2a1613"}}}	b687d9ae-0169-4db1-a72a-a13e374c4ff8	\N	t
4	1	mqUChS	2026-08-28 15:08:34.340556	2026-08-28 15:09:42.186633	{"id":"55480719e74829e5e1d9e90b7373f06a.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"d6406773a5c4f0688c5b48ecabefb415bcfdfd84d69daa4fd2e69ed9c0fbe11e"}}}	{}	{"id":"56154f4cc6ba0ac542beeea16bd4c765.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"abfbab7c78e104d8514fcc9ea2e399a088d8a666073ac0735f395e8f504177bd"}}}	57835070-1cf1-4b57-a14a-66ac1203a6ed	\N	t
2	2	dLApUC	2026-08-28 15:08:34.463527	2026-08-28 15:09:42.230692	{"id":"ca4f3a1a670abed004b2a2d24b8a80f4.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"085b0b8ea593fa1c3645305a6b2b6c1b9b7567ea461d1026ca148861e2b65d26"}}}	{}	{"id":"d0b9fa9632ec342a9a2d82af7efdfd03.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"5ccbfb05ae26c6329b09affbd27083bb32ce4a098a5faf5e7ce3392bd34ba83d"}}}	fa584f57-09d6-43f4-98f0-c0875a507915	\N	f
3	2	YWumws	2026-08-28 15:08:34.52793	2026-08-28 15:09:42.25783	{"id":"fab8223b081142794f80ed22ae072284.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"ec1e07def1cdd441bbd7cc7a18261caa0278fa6b527a4d777acb00eaddcb812c"}}}	{}	\N	fe64f7d2-9e60-4202-b876-754e99991215	\N	\N
4	2	geXWR2	2026-08-28 15:08:34.546092	2026-08-28 15:09:42.267729	{"id":"09320356becec65c306ae22a961e9eb8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"042ae6cf129e406baa65ac1f7439cf41ee70138098cb8e9dd7b9fc1adf8ca2da"}}}	{}	{"id":"57bca21b3cd0105a4655c82da2a1c9ed.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"3739a1ebfebd38cfa07b747bdec026b4e1ac05f8cfca4dd8c6b3500c4e5745af"}}}	8bc5fa8f-8ccc-429e-8601-600865b22507	\N	f
5	2	37jCV1	2026-08-28 15:08:34.617514	2026-08-28 15:09:42.292117	{"id":"6814d955d4a0b0836976e590e162d722.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"ff0d51a960d28568c16a4a042a6523ed1a287c79aaead05235d7b34636b5b808"}}}	{}	\N	8251b2d8-b928-4519-8941-4f26300da4cc	\N	\N
5	1	dyWqud	2026-08-28 15:08:34.445032	2026-08-28 15:09:42.221235	{"id":"14505bc2ea1b3adeb69f7ae037847d6a.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"6b95b36cefec0832a4bae003f36c905fb316044f557f2ab7c1ffebd67244d59d"}}}	{}	\N	84b6cd70-cd3b-481f-91db-5c8f8e33bbca	\N	\N
5	1	7xYBnV	2026-08-28 15:08:34.419001	2026-08-28 15:09:42.215783	{"id":"149e3845ff7b784d259a39d6d8a57f13.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"e9f2d68a8b909a3bd33d07377c468dc9f726ddce0b596dd9afebd4cce158c58a"}}}	{}	{"id":"3416133efb84c95c0590eb1a69f45300.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"525ebbce8f7a692310e28d86c4243109677a849a251046b62fb432a04d61a721"}}}	7ece90fe-3d94-4e5f-b3f8-20c3789a9aac	\N	t
2	2	Vrvd5F	2026-08-28 15:08:34.487127	2026-08-28 15:09:42.236562	{"id":"a25b46f5d581b14a517fccfc64ea90ea.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"70760e6a8c4af79487ac4d7ecd6ca8ac14b17e34449417559c2def0000d6ddf5"}}}	{}	\N	8bbd562d-00e8-4f8f-911e-6ac137f5dc50	\N	\N
3	2	Pz6t1b	2026-08-28 15:08:34.503951	2026-08-28 15:09:42.252069	{"id":"dd94cc69c14da197b28ce7cd0540218a.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"8436f3e5afe72575723d882f787d9776f0b3eda6edb3c0388f448d9b2b417cfd"}}}	{}	{"id":"c9b0683bb37499a159169dcaf2ec2c98.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"66b65c1400cdc51bbfd77385ff3eee190ad870c86ed4985a68e74dc7da7417ee"}}}	08c603fd-1bf3-447f-94b7-429542063b7b	\N	f
4	2	83JtWA	2026-08-28 15:08:34.57734	2026-08-28 15:09:42.274578	{"id":"93a2c07c0031c55fc2ca176097179764.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"e1a89a201039960cf2a9acbba0d8fa7d41e9dc94df9b55f266abd57aafae09c3"}}}	{}	\N	b9e6eb34-62bb-4625-8ae6-fb9f2909ae46	\N	\N
5	2	kRgDGN	2026-08-28 15:08:34.593866	2026-08-28 15:09:42.285443	{"id":"31fe9833f0ed2fa0d1d6ac2ff80ef5d3.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"a21507b5481f55ab3ad7043da3887002ab20c037b456100f226aff7353554674"}}}	{}	{"id":"533856e04bee083324130ba5d7bf7ecf.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"50d83894869cb98032835e2adfd447e8218e297e432316ce01b51a125b2a8f6d"}}}	5fcf65fe-1bc4-43cf-a716-664f3033b441	\N	f
2	3	gqkHFF	2026-08-28 15:08:34.653276	2026-08-28 15:09:42.304892	{"id":"a932461ac777783c0cee7c58447d0ea3.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"4baa653f2f2299bcad7ff0c2f01402435d03c32f7267e6994f3a27c68e1964ea"}}}	{}	\N	093268c7-dcb8-492d-a9b0-916838e40173	\N	\N
3	3	LkaUSi	2026-08-28 15:08:34.67409	2026-08-28 15:09:42.310454	{"id":"d637ceb298091e64500114cef6016757.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"35a3c5ff8d866b39c662feb9ebee01e5e702997f35d5f8c07f22ee8bba614995"}}}	{}	\N	86967b80-d40c-4254-b802-af39d35a9c48	\N	\N
3	3	R1FgjV	2026-08-28 15:08:34.704044	2026-08-28 15:09:42.337882	{"id":"fbfb197f2b5d3a705c506552cf98a526.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"e3bb274aef1ea58c6b10fc77bf1ea1d3c0dadb12cc164505100a39c9c54db5b3"}}}	{}	\N	44f8a4fc-e18b-4389-a3ac-b22f5ad475b9	\N	\N
4	3	PYdBrG	2026-08-28 15:08:34.721342	2026-08-28 15:09:42.343624	{"id":"38bd5726c4c0a887fed3e3927e26d49f.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"e3ba579ef3f16c70a354c45da673ce996b4cc53164529f6d2fd0b57a9697d8a8"}}}	{}	\N	8e1d1139-8c7c-449e-9e63-be39a90afafb	\N	\N
4	3	Sb1fN6	2026-08-28 15:08:34.738649	2026-08-28 15:09:42.349382	{"id":"4ab636f7ab1315ff68bbe1847b420ffc.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"5588eabc5eb459fa0fcd766ed0bc8db1a22699fd4b849ef17a0ff111ceefacb3"}}}	{}	\N	983c5142-8b3c-4209-bed8-d357ddcbd877	\N	\N
5	3	w9CTG1	2026-08-28 15:08:34.755701	2026-08-28 15:09:42.354539	{"id":"6feaad43878b12d16a8115bdaa3f750c.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"e967543df3a911281eb24f0685976ffa5cb777448874d04bdb4e752d87d93745"}}}	{}	\N	5cbbf4d2-a03b-4472-8872-cb4516eaf8af	\N	\N
5	3	ZmVaUL	2026-08-28 15:08:34.77425	2026-08-28 15:09:42.359742	{"id":"92d71222ff2f6156d11235bc9e4552de.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T15:08:34Z","scope":"full","signature":"393964fc99e08744645b6ce3d36d275bd7d4ef3a522aed44909148e25b7cece2"}}}	{}	\N	598b03c9-a2a8-410b-8ccf-7f9bef441e64	\N	\N
1	2	seBVgu	2026-08-28 22:57:16.84086	2026-08-28 22:58:26.049603	{"id":"0a410cb073c21fe599a95dfb6932dfd4.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T22:57:16Z","scope":"full","signature":"9c0cda5f51a0163012bfe67b92cc2caa8e8e8cf69ece2fdd44d9f9abe1dbab17"}}}	{}	\N	dcd24eec-f129-4bc5-ae12-bb2ffbbab8a9	\N	\N
1	3	JMkh1G	2026-08-28 22:57:16.893292	2026-08-28 22:58:26.060742	{"id":"f4cb5ce422ce88ca993c770a270166e9.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":61563,"mime_type":"application/pdf","malware_scan":{"status":"clean","scanner":"clamav","scanned_at":"2026-08-28T22:57:16Z","scope":"full","signature":"8d9a4d9b1f907deea21afab4a2d81c9458469febf2c97271b7847efa4680bb60"}}}	{}	\N	8a8a26cd-ab6b-4411-a8e3-d779fc3acc7b	\N	\N
\.


--
-- TOC entry 4868 (class 0 OID 10132723)
-- Dependencies: 332
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, created_at, updated_at) FROM stdin;
29	2020-07-24 16:53:57.252477	2020-07-24 16:54:01.75246
30	2020-07-24 17:04:35.538948	2020-07-24 17:04:35.555225
31	2020-07-24 17:04:35.600794	2020-07-24 17:04:35.617884
32	2020-07-24 17:04:35.667531	2020-07-24 17:04:35.684388
33	2020-07-24 17:04:35.728915	2020-07-24 17:04:35.751162
34	2020-07-24 17:04:35.791338	2020-07-24 17:04:35.807314
35	2020-07-24 17:04:35.849766	2020-07-24 17:04:35.865359
36	2020-07-24 17:04:35.907599	2020-07-24 17:04:35.923252
37	2020-07-24 17:04:35.96849	2020-07-24 17:04:35.983968
38	2020-07-24 17:04:36.025163	2020-07-24 17:04:36.042888
39	2020-07-24 17:04:36.082368	2020-07-24 17:04:36.098185
40	2020-07-24 17:04:36.136735	2020-07-24 17:04:36.154507
41	2020-07-24 17:04:36.196549	2020-07-24 17:04:36.21251
42	2020-07-24 17:04:36.255396	2020-07-24 17:04:36.271542
26	2020-07-24 13:45:38.483423	2020-07-24 13:53:20.643563
43	2020-09-02 09:52:36.079263	2020-09-02 09:52:36.095856
44	2022-08-05 13:29:45.502148	2022-08-05 13:31:09.028357
45	2022-08-05 13:30:12.628652	2022-08-05 13:31:09.067861
2	2020-07-24 13:21:16.326791	2025-07-14 10:49:31.745518
4	2020-07-24 13:22:02.697548	2025-07-14 10:49:31.745518
8	2020-07-24 13:25:01.92009	2025-07-14 10:49:31.745518
7	2020-07-24 13:24:32.144852	2025-07-14 10:49:31.745518
1	2020-07-24 13:20:57.182882	2025-07-14 10:49:31.745518
3	2020-07-24 13:21:31.396819	2025-07-14 10:49:31.745518
5	2020-07-24 13:22:36.919083	2025-07-14 10:50:08.889067
6	2020-07-24 13:23:10.09721	2025-07-14 10:50:08.889067
23	2020-07-24 13:43:48.693729	2025-07-14 10:57:31.481097
22	2020-07-24 13:43:04.010122	2025-07-14 10:57:31.481097
24	2020-07-24 13:44:47.041647	2025-07-14 10:57:51.356664
25	2020-07-24 13:45:18.024992	2025-07-14 10:57:51.356664
14	2020-07-24 13:33:00.82869	2025-07-14 10:58:13.897868
11	2020-07-24 13:30:05.949715	2025-07-14 10:58:13.897868
9	2020-07-24 13:29:05.426574	2025-07-14 10:58:13.897868
13	2020-07-24 13:30:53.026747	2025-07-14 10:58:35.625552
10	2020-07-24 13:29:15.586878	2025-07-14 10:58:59.958823
12	2020-07-24 13:30:26.128269	2025-07-14 10:58:59.958823
28	2020-07-24 16:13:15.823817	2025-07-14 10:58:59.958823
18	2020-07-24 13:35:50.918108	2025-07-14 11:01:16.891972
16	2020-07-24 13:35:07.225423	2025-07-14 11:01:16.891972
15	2020-07-24 13:34:37.118068	2025-07-14 11:01:16.891972
19	2020-07-24 13:36:38.528431	2025-07-14 11:01:37.140818
20	2020-07-24 13:37:19.231512	2025-07-14 11:01:37.140818
21	2020-07-24 13:38:04.769944	2025-07-14 11:01:53.205627
27	2020-07-24 16:12:42.712164	2025-07-15 12:05:40.393678
17	2020-07-24 13:35:29.764739	2025-07-15 12:05:40.39958
46	2025-07-15 12:04:34.670117	2025-07-15 12:05:40.404852
47	2025-07-15 12:05:40.383979	2025-07-15 12:08:23.040003
48	2025-07-15 12:08:23.032703	2025-07-15 12:08:23.048194
\.


--
-- TOC entry 4870 (class 0 OID 10132730)
-- Dependencies: 334
-- Data for Name: talk_tag_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.talk_tag_joins (id, talk_id, tag_id, created_at, updated_at) FROM stdin;
1	1	44	2022-08-05 13:30:27.138879	2022-08-05 13:30:27.138879
2	1	45	2022-08-05 13:30:27.140961	2022-08-05 13:30:27.140961
3	2	46	2025-07-15 12:04:41.025091	2025-07-15 12:04:41.025091
4	3	47	2025-07-15 12:05:42.944356	2025-07-15 12:05:42.944356
5	4	48	2025-07-15 12:08:24.671656	2025-07-15 12:08:24.671656
\.


--
-- TOC entry 4872 (class 0 OID 10132739)
-- Dependencies: 336
-- Data for Name: talks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.talks (id, lecture_id, created_at, updated_at, title, "position", details, dates, description, display_description, capacity, skip_campaigns, self_materialization_mode) FROM stdin;
1	27	2022-08-05 13:21:29.874189	2022-08-05 13:57:32.718902	Gruppen	1	<div>Test</div>	{2022-08-05}	<div>Ich halte einen Vortrag über Gruppen.</div>	t	\N	t	0
3	29	2025-07-15 12:05:05.908031	2025-07-15 12:05:05.908031	Primzahlen	2	<div>Es soll gezeigt werden, dass es unendlich viele Primzahlen gibt.</div>	{2025-07-23}	\N	f	\N	t	0
4	29	2025-07-15 12:06:17.796623	2025-07-15 12:06:17.796623	Das RSA-Verfahren	3	<div>Verschlüsselung mit dem RSA-Verfahren</div>	{2025-08-07}	\N	f	\N	t	0
2	29	2025-07-15 12:04:15.654601	2025-07-15 12:14:43.2905	Teilbarkeit	1	<div>Definition von Teilbarkeit, grundlegende Eigenschaften</div>	{2025-07-17}	\N	f	\N	t	0
35	38	2026-08-26 19:49:15.711467	2026-08-26 19:49:15.711467	Romulus der Große 2474	1	\N	{2026-05-23}	\N	f	\N	f	0
36	38	2026-08-26 19:49:15.721837	2026-08-26 19:49:15.721837	Fabian 5751	2	\N	{2026-06-19}	\N	f	\N	f	0
37	38	2026-08-26 19:49:15.728332	2026-08-26 19:49:15.728332	Die Box 36	3	\N	{2026-06-26}	\N	f	\N	f	0
38	38	2026-08-26 19:49:15.739439	2026-08-26 19:49:15.739439	Die zärtlichen Schwestern 7158	4	\N	{2026-05-29}	\N	f	\N	f	0
39	38	2026-08-26 19:49:15.749109	2026-08-26 19:49:15.749109	Iphigenie auf Tauris 1346	5	\N	{2026-02-21}	\N	f	\N	f	0
40	38	2026-08-26 19:49:15.756463	2026-08-26 19:49:15.756463	Der Brief des Lord Chandos 2789	6	\N	{2026-09-27}	\N	f	\N	f	0
41	38	2026-08-26 19:49:15.765051	2026-08-26 19:49:15.765051	Narziß und Goldmund 3947	7	\N	{2026-05-15}	\N	f	\N	f	0
42	38	2026-08-26 19:49:15.851503	2026-08-26 19:49:15.851503	Die Blechtrommel 5282	8	\N	{2026-04-29}	\N	f	\N	f	0
27	36	2026-08-26 19:49:15.474802	2026-08-26 19:49:15.474802	Die Leiden des jungen Werther 3904	1	\N	{2026-12-31}	\N	f	\N	t	0
28	36	2026-08-26 19:49:15.481879	2026-08-26 19:49:15.481879	Das kalte Herz 2239	2	\N	{2026-04-22}	\N	f	\N	t	0
29	36	2026-08-26 19:49:15.489396	2026-08-26 19:49:15.489396	Unterhaltungen deutscher Ausgewanderten 8114	3	\N	{2026-09-18}	\N	f	\N	t	0
30	36	2026-08-26 19:49:15.494567	2026-08-26 19:49:15.494567	Über das Studium der griechischen Poesie 4864	4	\N	{2026-04-21}	\N	f	\N	t	0
31	36	2026-08-26 19:49:15.500548	2026-08-26 19:49:15.500548	Till Eulenspiegel 115	5	\N	{2026-02-24}	\N	f	\N	t	0
32	36	2026-08-26 19:49:15.512155	2026-08-26 19:49:15.512155	Das Marmorbild 8163	6	\N	{2026-12-06}	\N	f	\N	t	0
33	36	2026-08-26 19:49:15.517929	2026-08-26 19:49:15.517929	Der Vorleser 9804	7	\N	{2026-12-02}	\N	f	\N	t	0
34	36	2026-08-26 19:49:15.52468	2026-08-26 19:49:15.52468	Effi Briest 8041	8	\N	{2026-09-12}	\N	f	\N	t	0
5	30	2026-08-26 19:48:21.088138	2026-08-28 22:57:14.565111	Demo Talk 1	1	\N	{}	\N	f	1	f	0
6	30	2026-08-26 19:48:21.121654	2026-08-28 22:57:14.576813	Demo Talk 2	2	\N	{}	\N	f	1	f	0
7	30	2026-08-26 19:48:21.128718	2026-08-28 22:57:14.580251	Demo Talk 3	3	\N	{}	\N	f	1	f	0
8	30	2026-08-26 19:48:21.133048	2026-08-28 22:57:14.583219	Demo Talk 4	4	\N	{}	\N	f	1	f	0
9	30	2026-08-26 19:48:21.139088	2026-08-28 22:57:14.588396	Demo Talk 5	5	\N	{}	\N	f	1	f	0
10	30	2026-08-26 19:48:21.146787	2026-08-28 22:57:14.592008	Demo Talk 6	6	\N	{}	\N	f	1	f	0
11	30	2026-08-26 19:48:21.152863	2026-08-28 22:57:14.595538	Demo Talk 7	7	\N	{}	\N	f	1	f	0
12	30	2026-08-26 19:48:21.159243	2026-08-28 22:57:14.608194	Demo Talk 8	8	\N	{}	\N	f	1	f	0
13	30	2026-08-26 19:48:21.164837	2026-08-28 22:57:14.612734	Demo Talk 9	9	\N	{}	\N	f	1	f	0
14	30	2026-08-26 19:48:21.170807	2026-08-28 22:57:14.618429	Demo Talk 10	10	\N	{}	\N	f	1	f	0
55	31	2026-08-28 22:57:16.325704	2026-08-28 22:57:16.325704	Die Waffen nieder!	1	\N	{2026-03-24}	\N	f	1	f	0
56	31	2026-08-28 22:57:16.349053	2026-08-28 22:57:16.349053	Die Leute von Seldwyla	2	\N	{2026-09-13}	\N	f	1	f	0
57	31	2026-08-28 22:57:16.353394	2026-08-28 22:57:16.353394	Der Besuch der alten Dame	3	\N	{2026-01-29}	\N	f	1	f	0
58	31	2026-08-28 22:57:16.356386	2026-08-28 22:57:16.356386	Über das Studium der griechischen Poesie	4	\N	{2026-12-13}	\N	f	1	f	0
59	31	2026-08-28 22:57:16.359633	2026-08-28 22:57:16.359633	Andorra	5	\N	{2026-09-09}	\N	f	1	f	0
60	31	2026-08-28 22:57:16.364955	2026-08-28 22:57:16.364955	Wilhelm Meisters Wanderjahre oder die Entsagenden	6	\N	{2026-11-03}	\N	f	1	f	0
61	31	2026-08-28 22:57:16.371756	2026-08-28 22:57:16.371756	Helden wie wir	7	\N	{2026-04-30}	\N	f	1	f	0
62	31	2026-08-28 22:57:16.374744	2026-08-28 22:57:16.374744	Cleopatra	8	\N	{2026-08-22}	\N	f	1	f	0
63	31	2026-08-28 22:57:16.378723	2026-08-28 22:57:16.378723	Aus dem Leben eines Taugenichts	9	\N	{2026-07-10}	\N	f	1	f	0
64	31	2026-08-28 22:57:16.381276	2026-08-28 22:57:16.381276	Narziss und Goldmund	10	\N	{2026-10-17}	\N	f	1	f	0
65	31	2026-08-28 22:57:16.383703	2026-08-28 22:57:16.383703	Frühlings Erwachen	11	\N	{2026-09-17}	\N	f	1	f	0
66	31	2026-08-28 22:57:16.387407	2026-08-28 22:57:16.387407	Mephisto	12	\N	{2026-08-29}	\N	f	1	f	0
\.


--
-- TOC entry 4874 (class 0 OID 10132755)
-- Dependencies: 338
-- Data for Name: terms; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.terms (id, year, season, created_at, updated_at, active, submission_deletion_mail, submission_deletion_reminder, submissions_deleted_at) FROM stdin;
2	2020	WS	2020-07-24 16:51:35.08902	2020-07-24 16:51:35.08902	f	\N	\N	\N
3	2019	WS	2020-08-10 15:45:28.438147	2020-08-10 15:45:28.438147	f	\N	\N	\N
1	2021	SS	2020-07-24 13:12:32.284437	2022-08-05 14:47:48.138314	f	\N	\N	\N
4	2023	WS	2022-08-05 14:47:26.131037	2025-07-14 10:47:22.034296	f	\N	\N	\N
5	2026	SS	2025-07-14 10:47:08.430522	2025-07-14 10:47:22.045595	t	\N	\N	\N
6	2026	WS	2025-07-14 10:47:32.760729	2025-07-14 10:47:32.760729	f	\N	\N	\N
7	2027	SS	2025-07-14 10:47:56.10258	2025-07-14 10:47:56.10258	f	\N	\N	\N
8	2027	WS	2025-07-14 10:48:06.98245	2025-07-14 10:48:06.98245	f	\N	\N	\N
9	2025	WS	2025-07-14 11:10:03.815925	2025-07-14 11:10:03.815925	f	\N	\N	\N
10	2024	WS	2025-07-14 11:12:05.689494	2025-07-14 11:12:05.689494	f	\N	\N	\N
\.


--
-- TOC entry 4876 (class 0 OID 10132765)
-- Dependencies: 340
-- Data for Name: thredded_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_categories (id, messageboard_id, name, description, created_at, updated_at, slug) FROM stdin;
\.


--
-- TOC entry 4878 (class 0 OID 10132777)
-- Dependencies: 342
-- Data for Name: thredded_messageboard_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_groups (id, name, "position", created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4880 (class 0 OID 10132787)
-- Dependencies: 344
-- Data for Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_notifications_for_followed_topics (id, user_id, messageboard_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4882 (class 0 OID 10132797)
-- Dependencies: 346
-- Data for Name: thredded_messageboard_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_users (id, thredded_user_detail_id, thredded_messageboard_id, last_seen_at) FROM stdin;
1	1	1	2020-07-24 15:13:57.225997
\.


--
-- TOC entry 4884 (class 0 OID 10132805)
-- Dependencies: 348
-- Data for Name: thredded_messageboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboards (id, name, slug, description, topics_count, posts_count, "position", last_topic_id, messageboard_group_id, created_at, updated_at, locked) FROM stdin;
1	(V) Lineare Algebra 2, SS 2026 [DozentIn]	v-lineare-algebra-2-ss-2020-dozentin	\N	4	8	1595597956	4	\N	2020-07-24 13:39:16.058555	2026-08-26 19:50:23.859621	f
2	(V) Algebra 1, WS 2025/26 [DozentIn]	v-algebra-1-ws-2019-20-dozentin	\N	0	0	1595609557	\N	\N	2020-07-24 16:52:37.056125	2026-08-26 19:49:15.992984	f
3	(V) Einführung in die Geometrie, SS 2026 [DozentIn]	v-einfuehrung-in-die-geometrie-ss-2026-dozentin	\N	2	6	1787773757	6	\N	2026-08-26 19:49:17.335836	2026-08-26 19:50:24.281101	f
4	(V) Vignetten, SS 2026 [DozentIn]	v-vignetten-ss-2026-dozentin	\N	2	6	1787773757	8	\N	2026-08-26 19:49:17.50508	2026-08-26 19:50:24.450724	f
5	(PS) Elementare Zahlentheorie, SS 2026 [DozentIn]	ps-elementare-zahlentheorie-ss-2026-dozentin	\N	2	6	1787773757	10	\N	2026-08-26 19:49:17.654676	2026-08-26 19:50:24.639502	f
6	(S) Demo Roster Seminar, SS 2026 [DozentIn]	s-demo-roster-seminar-ss-2026-dozentin	\N	2	6	1787773757	12	\N	2026-08-26 19:49:17.790378	2026-08-26 19:50:24.81811	f
8	(V) Analysis SS 2026, SS 2026 [DozentIn]	v-analysis-ss-2026-ss-2026-dozentin	\N	2	6	1787773758	16	\N	2026-08-26 19:49:18.072979	2026-08-26 19:50:25.176044	f
9	(S) Seminar SS 2026, SS 2026 [DozentIn]	s-seminar-ss-2026-ss-2026-dozentin	\N	2	6	1787773758	18	\N	2026-08-26 19:49:18.206016	2026-08-26 19:50:25.338783	f
7	(S) Campaign Test Seminar, WS 2026/27 [DozentIn]	s-campaign-test-seminar-ss-2026-dozentin	\N	2	6	1787773757	14	\N	2026-08-26 19:49:17.935167	2026-08-28 15:08:34.88441	f
\.


--
-- TOC entry 4886 (class 0 OID 10132820)
-- Dependencies: 350
-- Data for Name: thredded_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_followed_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4888 (class 0 OID 10132829)
-- Dependencies: 352
-- Data for Name: thredded_notifications_for_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_private_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 10132838)
-- Dependencies: 354
-- Data for Name: thredded_post_moderation_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_post_moderation_records (id, post_id, messageboard_id, post_content, post_user_id, post_user_name, moderator_id, moderation_state, previous_moderation_state, created_at) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 10132848)
-- Dependencies: 356
-- Data for Name: thredded_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_posts (id, user_id, content, source, postable_id, messageboard_id, moderation_state, created_at, updated_at) FROM stdin;
1	2	Klappt das?	web	1	1	0	2020-07-24 15:13:56.535875	2020-07-24 15:13:56.535875
2	\N	ssssss	web	2	1	0	2020-09-03 11:09:21.527677	2020-09-03 11:09:21.527677
3	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	3	1	0	2026-08-26 19:49:17.204921	2026-08-26 19:49:17.204921
4	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	3	1	0	2026-08-26 19:49:17.222637	2026-08-26 19:49:17.222637
5	2	Danke, damit hat es geklappt.	web	3	1	0	2026-08-26 19:49:17.248215	2026-08-26 19:49:17.248215
6	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	4	1	0	2026-08-26 19:49:17.302277	2026-08-26 19:49:17.302277
7	7	Kann man da noch dazukommen?	web	4	1	0	2026-08-26 19:49:17.310176	2026-08-26 19:49:17.310176
8	2	Klar, kommt einfach vorbei.	web	4	1	0	2026-08-26 19:49:17.31803	2026-08-26 19:49:17.31803
9	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	5	3	0	2026-08-26 19:49:17.395802	2026-08-26 19:49:17.395802
10	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	5	3	0	2026-08-26 19:49:17.402948	2026-08-26 19:49:17.402948
11	2	Danke, damit hat es geklappt.	web	5	3	0	2026-08-26 19:49:17.4252	2026-08-26 19:49:17.4252
12	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	6	3	0	2026-08-26 19:49:17.460121	2026-08-26 19:49:17.460121
13	7	Kann man da noch dazukommen?	web	6	3	0	2026-08-26 19:49:17.467883	2026-08-26 19:49:17.467883
14	2	Klar, kommt einfach vorbei.	web	6	3	0	2026-08-26 19:49:17.489798	2026-08-26 19:49:17.489798
15	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	7	4	0	2026-08-26 19:49:17.558011	2026-08-26 19:49:17.558011
16	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	7	4	0	2026-08-26 19:49:17.568632	2026-08-26 19:49:17.568632
17	2	Danke, damit hat es geklappt.	web	7	4	0	2026-08-26 19:49:17.5762	2026-08-26 19:49:17.5762
18	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	8	4	0	2026-08-26 19:49:17.630977	2026-08-26 19:49:17.630977
19	7	Kann man da noch dazukommen?	web	8	4	0	2026-08-26 19:49:17.637137	2026-08-26 19:49:17.637137
20	2	Klar, kommt einfach vorbei.	web	8	4	0	2026-08-26 19:49:17.645213	2026-08-26 19:49:17.645213
21	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	9	5	0	2026-08-26 19:49:17.714966	2026-08-26 19:49:17.714966
22	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	9	5	0	2026-08-26 19:49:17.720892	2026-08-26 19:49:17.720892
23	2	Danke, damit hat es geklappt.	web	9	5	0	2026-08-26 19:49:17.72896	2026-08-26 19:49:17.72896
24	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	10	5	0	2026-08-26 19:49:17.764512	2026-08-26 19:49:17.764512
25	7	Kann man da noch dazukommen?	web	10	5	0	2026-08-26 19:49:17.77083	2026-08-26 19:49:17.77083
26	2	Klar, kommt einfach vorbei.	web	10	5	0	2026-08-26 19:49:17.778923	2026-08-26 19:49:17.778923
27	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	11	6	0	2026-08-26 19:49:17.842857	2026-08-26 19:49:17.842857
28	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	11	6	0	2026-08-26 19:49:17.849355	2026-08-26 19:49:17.849355
29	2	Danke, damit hat es geklappt.	web	11	6	0	2026-08-26 19:49:17.855765	2026-08-26 19:49:17.855765
30	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	12	6	0	2026-08-26 19:49:17.904653	2026-08-26 19:49:17.904653
31	7	Kann man da noch dazukommen?	web	12	6	0	2026-08-26 19:49:17.913566	2026-08-26 19:49:17.913566
32	2	Klar, kommt einfach vorbei.	web	12	6	0	2026-08-26 19:49:17.922574	2026-08-26 19:49:17.922574
33	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	13	7	0	2026-08-26 19:49:17.981923	2026-08-26 19:49:17.981923
34	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	13	7	0	2026-08-26 19:49:17.988034	2026-08-26 19:49:17.988034
35	2	Danke, damit hat es geklappt.	web	13	7	0	2026-08-26 19:49:18.006645	2026-08-26 19:49:18.006645
36	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	14	7	0	2026-08-26 19:49:18.042452	2026-08-26 19:49:18.042452
37	7	Kann man da noch dazukommen?	web	14	7	0	2026-08-26 19:49:18.048952	2026-08-26 19:49:18.048952
38	2	Klar, kommt einfach vorbei.	web	14	7	0	2026-08-26 19:49:18.05473	2026-08-26 19:49:18.05473
39	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	15	8	0	2026-08-26 19:49:18.11963	2026-08-26 19:49:18.11963
40	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	15	8	0	2026-08-26 19:49:18.127104	2026-08-26 19:49:18.127104
41	2	Danke, damit hat es geklappt.	web	15	8	0	2026-08-26 19:49:18.134049	2026-08-26 19:49:18.134049
42	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	16	8	0	2026-08-26 19:49:18.181352	2026-08-26 19:49:18.181352
43	7	Kann man da noch dazukommen?	web	16	8	0	2026-08-26 19:49:18.188114	2026-08-26 19:49:18.188114
44	2	Klar, kommt einfach vorbei.	web	16	8	0	2026-08-26 19:49:18.195766	2026-08-26 19:49:18.195766
45	9	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	17	9	0	2026-08-26 19:49:18.254103	2026-08-26 19:49:18.254103
46	7	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	17	9	0	2026-08-26 19:49:18.26349	2026-08-26 19:49:18.26349
47	2	Danke, damit hat es geklappt.	web	17	9	0	2026-08-26 19:49:18.27012	2026-08-26 19:49:18.27012
48	9	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	18	9	0	2026-08-26 19:49:18.306105	2026-08-26 19:49:18.306105
49	7	Kann man da noch dazukommen?	web	18	9	0	2026-08-26 19:49:18.313505	2026-08-26 19:49:18.313505
50	2	Klar, kommt einfach vorbei.	web	18	9	0	2026-08-26 19:49:18.319806	2026-08-26 19:49:18.319806
\.


--
-- TOC entry 4894 (class 0 OID 10132861)
-- Dependencies: 358
-- Data for Name: thredded_private_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_posts (id, user_id, content, postable_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4896 (class 0 OID 10132871)
-- Dependencies: 360
-- Data for Name: thredded_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_topics (id, user_id, last_user_id, title, slug, posts_count, hash_id, last_post_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 10132884)
-- Dependencies: 362
-- Data for Name: thredded_private_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_users (id, private_topic_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 10132891)
-- Dependencies: 364
-- Data for Name: thredded_topic_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topic_categories (id, topic_id, category_id) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 10132898)
-- Dependencies: 366
-- Data for Name: thredded_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topics (id, user_id, last_user_id, title, slug, messageboard_id, posts_count, sticky, locked, hash_id, moderation_state, last_post_at, created_at, updated_at) FROM stdin;
1	2	2	Testpost in der Docker-Umgebung	testpost-in-der-docker-umgebung	1	1	f	f	755be586701a955a9678	0	2020-07-24 15:13:56.535875	2020-07-24 15:13:56.506852	2020-07-24 15:13:56.632465
2	\N	\N	neuer Testpost	neuer-testpost	1	1	f	f	f62fa65b5e6217e961af	0	2020-09-03 11:09:21.527677	2020-09-03 11:09:21.498003	2020-09-03 11:09:21.629468
9	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-ps-elementare-zahlentheorie-ss-2026-dozentin	5	3	f	f	edb9fa647c0afcd8b52e	0	2026-08-26 19:49:17.72896	2026-08-26 19:49:17.702473	2026-08-26 19:50:24.690922
3	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2	1	3	f	f	fa20c6c573cf5c32893d	0	2026-08-26 19:49:17.248215	2026-08-26 19:49:17.117986	2026-08-26 19:50:24.010273
4	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur	1	3	f	f	6101d8992e58a6f98056	0	2026-08-26 19:49:17.31803	2026-08-26 19:49:17.28783	2026-08-26 19:50:24.150895
10	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-ps-elementare-zahlentheorie-ss-2026-dozentin	5	3	f	f	fef71ba0acd92f00e8ea	0	2026-08-26 19:49:17.778923	2026-08-26 19:49:17.751858	2026-08-26 19:50:24.77361
5	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-v-einfuehrung-in-die-geometrie-ss-2026-dozentin	3	3	f	f	f3fc62d93d342888986e	0	2026-08-26 19:49:17.4252	2026-08-26 19:49:17.3826	2026-08-26 19:50:24.33276
6	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-v-einfuehrung-in-die-geometrie-ss-2026-dozentin	3	3	f	f	8c257ee8455a352e240c	0	2026-08-26 19:49:17.489798	2026-08-26 19:49:17.447722	2026-08-26 19:50:24.411893
7	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-v-vignetten-ss-2026-dozentin	4	3	f	f	252d81411c1ad1f9ce48	0	2026-08-26 19:49:17.5762	2026-08-26 19:49:17.545539	2026-08-26 19:50:24.507472
8	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-v-vignetten-ss-2026-dozentin	4	3	f	f	fda171324f20876d88a2	0	2026-08-26 19:49:17.645213	2026-08-26 19:49:17.60071	2026-08-26 19:50:24.59786
11	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-s-demo-roster-seminar-ss-2026-dozentin	6	3	f	f	fff5a940a979df5a8232	0	2026-08-26 19:49:17.855765	2026-08-26 19:49:17.832745	2026-08-26 19:50:24.865258
14	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-s-campaign-test-seminar-ss-2026-dozentin	7	3	f	f	9c23b79f59d7d7815577	0	2026-08-26 19:49:18.05473	2026-08-26 19:49:18.030623	2026-08-26 19:50:25.137022
15	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-v-analysis-ss-2026-ss-2026-dozentin	8	3	f	f	66bb7d79819f0ba3e98f	0	2026-08-26 19:49:18.134049	2026-08-26 19:49:18.108941	2026-08-26 19:50:25.225428
16	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-v-analysis-ss-2026-ss-2026-dozentin	8	3	f	f	2269dd7b0b8120bfd583	0	2026-08-26 19:49:18.195766	2026-08-26 19:49:18.157255	2026-08-26 19:50:25.30354
17	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-s-seminar-ss-2026-ss-2026-dozentin	9	3	f	f	9d16d4025741590ea7a8	0	2026-08-26 19:49:18.27012	2026-08-26 19:49:18.237896	2026-08-26 19:50:25.385794
12	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-s-demo-roster-seminar-ss-2026-dozentin	6	3	f	f	1f452124b6980bdbd1a4	0	2026-08-26 19:49:17.922574	2026-08-26 19:49:17.892043	2026-08-26 19:50:24.944774
13	9	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-s-campaign-test-seminar-ss-2026-dozentin	7	3	f	f	29457367f02dacf1ec0a	0	2026-08-26 19:49:18.006645	2026-08-26 19:49:17.969964	2026-08-26 19:50:25.05541
18	9	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-s-seminar-ss-2026-ss-2026-dozentin	9	3	f	f	9c8f45a05217536301a4	0	2026-08-26 19:49:18.319806	2026-08-26 19:49:18.294197	2026-08-26 19:50:25.484496
\.


--
-- TOC entry 4904 (class 0 OID 10132918)
-- Dependencies: 368
-- Data for Name: thredded_user_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_details (id, user_id, latest_activity_at, posts_count, topics_count, last_seen_at, moderation_state, moderation_state_changed_at, created_at, updated_at) FROM stdin;
3	9	\N	16	16	\N	0	\N	2026-08-26 19:49:17.084897	2026-08-26 19:49:17.084897
4	7	\N	16	0	\N	0	\N	2026-08-26 19:49:17.219565	2026-08-26 19:49:17.219565
1	2	\N	17	1	2020-07-24 15:13:57.225997	0	\N	2020-07-24 15:13:41.254846	2020-07-24 15:13:57.240353
\.


--
-- TOC entry 4906 (class 0 OID 10132930)
-- Dependencies: 370
-- Data for Name: thredded_user_messageboard_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_messageboard_preferences (id, user_id, messageboard_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4908 (class 0 OID 10132943)
-- Dependencies: 372
-- Data for Name: thredded_user_post_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_post_notifications (id, user_id, post_id, notified_at) FROM stdin;
\.


--
-- TOC entry 4910 (class 0 OID 10132951)
-- Dependencies: 374
-- Data for Name: thredded_user_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_preferences (id, user_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4912 (class 0 OID 10132963)
-- Dependencies: 376
-- Data for Name: thredded_user_private_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_private_topic_read_states (id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
\.


--
-- TOC entry 4914 (class 0 OID 10132977)
-- Dependencies: 378
-- Data for Name: thredded_user_topic_follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_follows (id, user_id, topic_id, created_at, reason) FROM stdin;
1	2	1	2020-07-24 15:13:56.61965	1
3	9	3	2026-08-26 19:50:23.925663	1
4	7	3	2026-08-26 19:50:23.996051	1
5	2	3	2026-08-26 19:50:24.024258	1
6	9	4	2026-08-26 19:50:24.082631	1
7	7	4	2026-08-26 19:50:24.120755	1
8	2	4	2026-08-26 19:50:24.257814	1
9	9	5	2026-08-26 19:50:24.294585	1
10	7	5	2026-08-26 19:50:24.322042	1
11	2	5	2026-08-26 19:50:24.346529	1
12	9	6	2026-08-26 19:50:24.376726	1
13	7	6	2026-08-26 19:50:24.400816	1
14	2	6	2026-08-26 19:50:24.42642	1
15	9	7	2026-08-26 19:50:24.467496	1
16	7	7	2026-08-26 19:50:24.495338	1
17	2	7	2026-08-26 19:50:24.524176	1
18	9	8	2026-08-26 19:50:24.558921	1
19	7	8	2026-08-26 19:50:24.585421	1
20	2	8	2026-08-26 19:50:24.613644	1
21	9	9	2026-08-26 19:50:24.654688	1
22	7	9	2026-08-26 19:50:24.680454	1
23	2	9	2026-08-26 19:50:24.704451	1
24	9	10	2026-08-26 19:50:24.736095	1
25	7	10	2026-08-26 19:50:24.761932	1
26	2	10	2026-08-26 19:50:24.789052	1
27	9	11	2026-08-26 19:50:24.832163	1
28	7	11	2026-08-26 19:50:24.855538	1
29	2	11	2026-08-26 19:50:24.87821	1
30	9	12	2026-08-26 19:50:24.908868	1
31	7	12	2026-08-26 19:50:24.932487	1
32	2	12	2026-08-26 19:50:24.959005	1
33	9	13	2026-08-26 19:50:25.016164	1
34	7	13	2026-08-26 19:50:25.043963	1
35	2	13	2026-08-26 19:50:25.068687	1
36	9	14	2026-08-26 19:50:25.100391	1
37	7	14	2026-08-26 19:50:25.126757	1
38	2	14	2026-08-26 19:50:25.151193	1
39	9	15	2026-08-26 19:50:25.191344	1
40	7	15	2026-08-26 19:50:25.215624	1
41	2	15	2026-08-26 19:50:25.238695	1
42	9	16	2026-08-26 19:50:25.269591	1
43	7	16	2026-08-26 19:50:25.293812	1
44	2	16	2026-08-26 19:50:25.316694	1
45	9	17	2026-08-26 19:50:25.353239	1
46	7	17	2026-08-26 19:50:25.375599	1
47	2	17	2026-08-26 19:50:25.398138	1
48	9	18	2026-08-26 19:50:25.451138	1
49	7	18	2026-08-26 19:50:25.473838	1
50	2	18	2026-08-26 19:50:25.49776	1
\.


--
-- TOC entry 4916 (class 0 OID 10132985)
-- Dependencies: 380
-- Data for Name: thredded_user_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_read_states (id, messageboard_id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
1	1	2	1	0	1	0	2020-07-24 15:13:56.535875
\.


--
-- TOC entry 4918 (class 0 OID 10133000)
-- Dependencies: 382
-- Data for Name: tutor_tutorial_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutor_tutorial_joins (id, tutorial_id, tutor_id, created_at, updated_at) FROM stdin;
1	1	10	2020-11-28 16:42:53.098756	2020-11-28 16:42:53.098756
2	2	10	2026-08-28 15:08:33.499964	2026-08-28 15:08:33.499964
3	3	184	2026-08-28 15:08:33.506551	2026-08-28 15:08:33.506551
4	4	10	2026-08-28 15:08:33.509723	2026-08-28 15:08:33.509723
5	5	184	2026-08-28 15:08:33.512739	2026-08-28 15:08:33.512739
\.


--
-- TOC entry 4920 (class 0 OID 10133009)
-- Dependencies: 384
-- Data for Name: tutorial_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutorial_memberships (id, user_id, tutorial_id, source_campaign_id, created_at, updated_at, lecture_id) FROM stdin;
28769f82-0442-4ba9-ab4c-7510f4f264e4	5	1	\N	2026-08-28 15:08:33.612295	2026-08-28 15:08:33.612295	1
986599a4-563d-42dd-916d-9c2430d56016	6	1	\N	2026-08-28 15:08:33.629827	2026-08-28 15:08:33.629827	1
957e85f5-6a57-49ea-863a-e4c6595de9d5	7	1	\N	2026-08-28 15:08:33.719449	2026-08-28 15:08:33.719449	1
410083f1-cab8-4ff7-aa3f-fe1465d227e0	8	1	\N	2026-08-28 15:08:33.72863	2026-08-28 15:08:33.72863	1
e0e1a193-866b-4c61-8ed1-0166f1792357	9	1	\N	2026-08-28 15:08:33.736616	2026-08-28 15:08:33.736616	1
9d103e6f-e12d-4faf-9899-7181b5774ba9	17	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
2d1c75ed-5eaa-4312-81e0-f85c71108ab5	29	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
7d7c9866-b21f-4a70-a4f5-79d3b05b4754	34	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
309798e1-b2f8-472d-a182-52b2c13e1597	35	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
8d646a88-7c52-41a3-96aa-32d5515d6a67	36	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
3a8261e6-3e0a-48c3-a7d4-d78f86df25c7	38	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
1c50c6cb-bd85-465c-9aab-8f425a12a310	39	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
066b64d9-a941-4d8f-a840-97dfceefefbc	40	3	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.947077	2026-08-28 22:57:13.947077	1
c383263b-1a94-432c-bada-25e88b1d76c1	15	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
6553c48e-cb56-4027-b950-db93c17b22f0	26	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
73972758-5231-451a-840d-32ac06535dfa	27	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
1f8790de-ab73-43ff-9c04-f564862b823f	31	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
40dab7f5-a781-4056-b69f-a84db05e87ea	32	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
58be0c41-6829-4eb8-95fb-31b3f8db62ab	33	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
d85423dd-6bf1-4f77-85b1-c31ae278005b	41	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
213a2e32-bbb7-4eaa-a8bd-683f9744537e	42	4	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:13.994879	2026-08-28 22:57:13.994879	1
1dbf2d42-9dee-479f-ad2d-a8a16294e81c	16	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
3cfe824c-2f72-4a5d-a744-45310d4fbd9a	18	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
8c45d679-481f-4671-9b39-5ebafb248f13	20	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
8331b213-f242-429a-9ed3-3a81a73c487f	22	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
96da79e8-5be0-42b8-9283-759d2431a6b0	23	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
29b37bbc-3dee-4d5f-8f8d-c8b6c56fd9e4	24	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
a99464eb-6f0b-40d9-b9a3-0dc431bbfb3d	25	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
a37a59c4-fecf-4ae1-9fa8-7263e4ddea8e	30	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
4a6c46fe-a3bd-4fd9-89a2-d5dd6ee6dc19	44	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
a117aa6c-d44a-4e00-b2ed-a4b73188a90c	45	2	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.00582	2026-08-28 22:57:14.00582	1
d014143a-7c46-4157-9ab3-7a7124d9b9a3	14	5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.013567	2026-08-28 22:57:14.013567	1
8e747b7d-a2d6-4dc6-a15e-e7e8bd0c72db	19	5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.013567	2026-08-28 22:57:14.013567	1
0ca81bad-f89e-4e2f-a024-4942d50e5c07	21	5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.013567	2026-08-28 22:57:14.013567	1
a1d33937-92ac-47fd-972d-8bc73daa0b42	28	5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.013567	2026-08-28 22:57:14.013567	1
956b5bde-8a3f-49da-aaba-941ea427b0f6	37	5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.013567	2026-08-28 22:57:14.013567	1
67ec8285-ce9e-470c-ac44-cf39b013ecb3	43	5	a72bdfb6-4af3-42ea-aff1-33b6090038c5	2026-08-28 22:57:14.013567	2026-08-28 22:57:14.013567	1
\.


--
-- TOC entry 4921 (class 0 OID 10133019)
-- Dependencies: 385
-- Data for Name: tutorials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutorials (id, title, lecture_id, created_at, updated_at, capacity, skip_campaigns, self_materialization_mode, location) FROM stdin;
1	Mo 14-16	1	2020-11-28 16:42:53.096527	2020-11-28 16:42:53.096527	\N	t	0	\N
13	Tutorial Mo 14:00	32	2026-08-26 19:49:14.413541	2026-08-26 19:49:14.413541	12	f	0	INF 205
14	Tutorial Fr 9:00	32	2026-08-26 19:49:14.423445	2026-08-26 19:49:14.423445	8	f	0	INF 205
19	Stand by Me 3239076659	37	2026-08-26 19:49:15.607367	2026-08-26 19:49:15.607367	12	f	0	INF 205
20	Seven Samurai 9521563309	37	2026-08-26 19:49:15.610923	2026-08-26 19:49:15.610923	12	f	0	INF 205
21	The Godfather: Part II 3216085226	37	2026-08-26 19:49:15.614569	2026-08-26 19:49:15.614569	12	f	0	INF 205
22	To Kill a Mockingbird 3597284178	37	2026-08-26 19:49:15.619087	2026-08-26 19:49:15.619087	12	f	0	INF 205
23	Tutorial 1	39	2026-08-28 15:08:31.416919	2026-08-28 15:08:31.416919	20	f	0	INF 205
24	Tutorial 2	39	2026-08-28 15:08:31.429136	2026-08-28 15:08:31.429136	15	f	0	INF 205
25	Tutorial 3	39	2026-08-28 15:08:31.432211	2026-08-28 15:08:31.432211	10	f	0	INF 205
26	Tutorial 4	39	2026-08-28 15:08:31.436711	2026-08-28 15:08:31.436711	5	f	0	INF 205
27	FCFS Tutorial 5	39	2026-08-28 15:08:31.632033	2026-08-28 15:08:31.632033	12	f	0	INF 205
28	FCFS Tutorial 6	39	2026-08-28 15:08:31.636587	2026-08-28 15:08:31.636587	10	f	0	INF 205
29	FCFS Tutorial 7	39	2026-08-28 15:08:31.640668	2026-08-28 15:08:31.640668	8	f	0	INF 205
15	Psycho 4245820484	35	2026-08-26 19:49:15.361306	2026-08-26 19:49:15.361306	12	t	0	INF 205
16	Heat 8135014184	35	2026-08-26 19:49:15.366522	2026-08-26 19:49:15.366522	12	t	0	INF 205
17	Room 2736578899	35	2026-08-26 19:49:15.371821	2026-08-26 19:49:15.371821	12	t	0	INF 205
18	Catch Me If You Can 7947335225	35	2026-08-26 19:49:15.376267	2026-08-26 19:49:15.376267	12	t	0	INF 205
2	Demo Tutorial 1	1	2026-08-26 19:48:06.418487	2026-08-28 22:57:13.367032	10	f	0	\N
3	Demo Tutorial 2	1	2026-08-26 19:48:06.458667	2026-08-28 22:57:13.4047	8	f	0	\N
4	Demo Tutorial 3	1	2026-08-26 19:48:06.466547	2026-08-28 22:57:13.411499	8	f	0	\N
5	Demo Tutorial 4	1	2026-08-26 19:48:06.47115	2026-08-28 22:57:13.418971	6	f	0	\N
\.


--
-- TOC entry 4923 (class 0 OID 10133034)
-- Dependencies: 387
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
-- TOC entry 4925 (class 0 OID 10133043)
-- Dependencies: 389
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
9	22	2026-08-28 15:08:34.251638	2026-08-28 15:08:34.251638	012909d0-498c-4ae1-8c22-267c0dbc1045
10	28	2026-08-28 15:08:34.259535	2026-08-28 15:08:34.259535	012909d0-498c-4ae1-8c22-267c0dbc1045
11	29	2026-08-28 15:08:34.284497	2026-08-28 15:08:34.284497	69d37c49-4a21-4cf7-b923-8b21f7e2f1c7
12	24	2026-08-28 15:08:34.302587	2026-08-28 15:08:34.302587	b687d9ae-0169-4db1-a72a-a13e374c4ff8
13	25	2026-08-28 15:08:34.305697	2026-08-28 15:08:34.305697	b687d9ae-0169-4db1-a72a-a13e374c4ff8
14	26	2026-08-28 15:08:34.326921	2026-08-28 15:08:34.326921	9805be16-7f98-4824-b26a-0a63ff6a5a7b
15	14	2026-08-28 15:08:34.343269	2026-08-28 15:08:34.343269	57835070-1cf1-4b57-a14a-66ac1203a6ed
16	16	2026-08-28 15:08:34.345256	2026-08-28 15:08:34.345256	57835070-1cf1-4b57-a14a-66ac1203a6ed
17	17	2026-08-28 15:08:34.394135	2026-08-28 15:08:34.394135	e44a1efe-9e5b-46fd-9a98-f90f14abe1a7
18	15	2026-08-28 15:08:34.422729	2026-08-28 15:08:34.422729	7ece90fe-3d94-4e5f-b3f8-20c3789a9aac
19	18	2026-08-28 15:08:34.424779	2026-08-28 15:08:34.424779	7ece90fe-3d94-4e5f-b3f8-20c3789a9aac
20	21	2026-08-28 15:08:34.448277	2026-08-28 15:08:34.448277	84b6cd70-cd3b-481f-91db-5c8f8e33bbca
21	22	2026-08-28 15:08:34.468382	2026-08-28 15:08:34.468382	fa584f57-09d6-43f4-98f0-c0875a507915
22	28	2026-08-28 15:08:34.470645	2026-08-28 15:08:34.470645	fa584f57-09d6-43f4-98f0-c0875a507915
23	29	2026-08-28 15:08:34.490209	2026-08-28 15:08:34.490209	8bbd562d-00e8-4f8f-911e-6ac137f5dc50
24	24	2026-08-28 15:08:34.50665	2026-08-28 15:08:34.50665	08c603fd-1bf3-447f-94b7-429542063b7b
25	25	2026-08-28 15:08:34.509936	2026-08-28 15:08:34.509936	08c603fd-1bf3-447f-94b7-429542063b7b
26	26	2026-08-28 15:08:34.531747	2026-08-28 15:08:34.531747	fe64f7d2-9e60-4202-b876-754e99991215
27	14	2026-08-28 15:08:34.548884	2026-08-28 15:08:34.548884	8bc5fa8f-8ccc-429e-8601-600865b22507
28	16	2026-08-28 15:08:34.557975	2026-08-28 15:08:34.557975	8bc5fa8f-8ccc-429e-8601-600865b22507
29	17	2026-08-28 15:08:34.580283	2026-08-28 15:08:34.580283	b9e6eb34-62bb-4625-8ae6-fb9f2909ae46
30	15	2026-08-28 15:08:34.597099	2026-08-28 15:08:34.597099	5fcf65fe-1bc4-43cf-a716-664f3033b441
31	18	2026-08-28 15:08:34.599595	2026-08-28 15:08:34.599595	5fcf65fe-1bc4-43cf-a716-664f3033b441
32	21	2026-08-28 15:08:34.621198	2026-08-28 15:08:34.621198	8251b2d8-b928-4519-8941-4f26300da4cc
33	22	2026-08-28 15:08:34.63951	2026-08-28 15:08:34.63951	b2b9dbe2-f089-4b64-8447-7a789e2b195a
34	28	2026-08-28 15:08:34.641966	2026-08-28 15:08:34.641966	b2b9dbe2-f089-4b64-8447-7a789e2b195a
35	29	2026-08-28 15:08:34.656418	2026-08-28 15:08:34.656418	093268c7-dcb8-492d-a9b0-916838e40173
36	24	2026-08-28 15:08:34.677607	2026-08-28 15:08:34.677607	86967b80-d40c-4254-b802-af39d35a9c48
37	25	2026-08-28 15:08:34.691754	2026-08-28 15:08:34.691754	86967b80-d40c-4254-b802-af39d35a9c48
38	26	2026-08-28 15:08:34.707031	2026-08-28 15:08:34.707031	44f8a4fc-e18b-4389-a3ac-b22f5ad475b9
39	14	2026-08-28 15:08:34.724985	2026-08-28 15:08:34.724985	8e1d1139-8c7c-449e-9e63-be39a90afafb
40	16	2026-08-28 15:08:34.728281	2026-08-28 15:08:34.728281	8e1d1139-8c7c-449e-9e63-be39a90afafb
41	17	2026-08-28 15:08:34.741535	2026-08-28 15:08:34.741535	983c5142-8b3c-4209-bed8-d357ddcbd877
42	15	2026-08-28 15:08:34.758708	2026-08-28 15:08:34.758708	5cbbf4d2-a03b-4472-8872-cb4516eaf8af
43	18	2026-08-28 15:08:34.761267	2026-08-28 15:08:34.761267	5cbbf4d2-a03b-4472-8872-cb4516eaf8af
44	21	2026-08-28 15:08:34.778004	2026-08-28 15:08:34.778004	598b03c9-a2a8-410b-8ccf-7f9bef441e64
45	7	2026-08-28 22:57:16.853894	2026-08-28 22:57:16.853894	dcd24eec-f129-4bc5-ae12-bb2ffbbab8a9
46	7	2026-08-28 22:57:16.89674	2026-08-28 22:57:16.89674	8a8a26cd-ab6b-4411-a8e3-d779fc3acc7b
\.


--
-- TOC entry 4927 (class 0 OID 10133051)
-- Dependencies: 391
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, admin, subscription_type, consents, consented_at, name, homepage, no_notifications, locale, email_for_medium, email_for_announcement, email_for_teachable, email_for_news, current_lecture_id, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, unread_comments, email_for_submission_upload, email_for_submission_removal, email_for_submission_join, email_for_submission_leave, email_for_correction_upload, email_for_submission_decision, name_in_tutorials, archived, locked_at, image_data, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, deletion_date, failed_attempts, unlock_token, password_policy_version, password_changed_at) FROM stdin;
1	admin@mampf.edu	$2a$11$aGtvgiAZMBn7Zpz.htqCiOka.WsJc9GGqBhN27/jflO8xf4jRLH9a	\N	\N	\N	2020-07-24 13:07:48.807973	2026-08-28 22:57:21.173316	t	1	t	2020-07-24 13:07:48.811417	admin	\N	f	en	t	t	t	t	\N	UguwyiyL_B65bQkMZMQf	2020-07-24 13:07:56.770723	2020-07-24 13:07:48.808231	\N	t	f	f	f	f	f	f		\N	\N	\N	3	2025-07-15 12:02:24.48997	2025-07-14 11:35:13.666864	\N	\N	\N	0	\N	1	2026-08-28 22:57:21.172826
2	teacher@mampf.edu	$2a$11$cbzzLiMJWlSrKuFDNLgIP.HOzVEhNx98Ld4GN6Oz8Dlp8oxIZjMVK	\N	\N	\N	2020-07-24 13:14:59.543985	2026-08-28 22:57:21.704121	f	1	t	2020-07-24 13:14:59.547776	DozentIn	\N	f	en	t	t	t	t	\N	quSs9sq1VAMQCbDgRyhU	2020-07-24 13:15:13.670023	2020-07-24 13:14:59.544082	\N	t	f	f	f	f	f	f		\N	\N	\N	12	2025-07-15 12:03:11.254407	2025-07-15 11:59:27.082351	\N	\N	\N	0	\N	1	2026-08-28 22:57:21.703899
5	student1@mampf.edu	$2a$11$MrNOs91Q.aAXIOm7NJARM.fBBA4zstxulnbSxWWrI19nQWN25P9ES	\N	\N	\N	2020-11-28 16:25:23.437946	2026-08-28 22:57:22.100304	f	1	t	2020-11-28 16:25:23.440059	student1	\N	f	en	f	f	f	t	\N	qwPPGpBwzjn7o_NE1cMd	2020-11-28 16:25:28.248539	2020-11-28 16:25:23.438158	\N	t	t	t	t	t	t	t	Max Mustermann	\N	\N	\N	6	2025-07-15 12:12:31.120017	2025-07-15 12:10:11.284039	\N	\N	\N	0	\N	1	2026-08-28 22:57:22.100167
6	student2@mampf.edu	$2a$11$4G5vRTMJ2NYkU.aAib87RO7y/nYNcH3SdjB46fYdzKwX2rOAmm/m2	\N	\N	\N	2020-11-28 16:26:55.50289	2026-08-28 22:57:22.469756	f	1	t	2020-11-28 16:26:55.504637	student2	\N	f	en	t	t	t	f	\N	4DVzmJnsA4PJx9StS_Js	2020-11-28 16:27:07.826099	2020-11-28 16:26:55.502947	\N	t	f	f	f	f	f	f	Max Musterfrau	\N	\N	\N	5	2026-08-26 19:51:17.687287	2025-07-15 12:15:20.813542	\N	\N	\N	0	\N	1	2026-08-28 22:57:22.469618
7	student3@mampf.edu	$2a$11$hCwpjXEn/BdKGAVYLftp9u3J/WExTxIwFpUxvwiq93dho6TQjcrRS	\N	\N	\N	2020-11-28 16:28:02.121432	2026-08-28 22:57:22.806586	f	1	t	2020-11-28 16:28:02.123082	student3	\N	f	en	t	t	t	f	\N	ZUzqyXACyQrBNVGGrWxm	2020-11-28 16:28:09.870025	2020-11-28 16:28:02.121486	\N	t	f	f	f	f	f	f	Berta Musterfrau	\N	\N	\N	3	2025-07-15 12:11:49.670511	2025-07-14 15:04:06.537713	\N	\N	\N	0	\N	1	2026-08-28 22:57:22.806448
8	student4@mampf.edu	$2a$11$PZow1U.WEXb1oWXOXFJOeuHk/p2ZGlPF17t.YMzqlCpBR/t7HSatC	\N	\N	\N	2020-11-28 16:29:07.923841	2026-08-28 22:57:23.181911	f	1	t	2020-11-28 16:29:07.925959	student4	\N	f	en	t	t	t	f	\N	j5hzKj7ePDPVbKGJsyqx	2020-11-28 16:29:14.406097	2020-11-28 16:29:07.923915	\N	t	f	f	f	f	f	f	Berta Mustermann	\N	\N	\N	1	2025-07-14 11:29:25.560481	2025-07-14 11:29:25.560481	\N	\N	\N	0	\N	1	2026-08-28 22:57:23.181746
10	tutor@mampf.edu	$2a$11$e10fZiUeOCxE5SfUnDNaJ.BOpKtRwfOmo6ChLQgOJGza/vfPKv9K2	\N	\N	\N	2020-11-28 16:34:08.325163	2026-08-28 22:57:24.42466	f	1	t	2020-11-28 16:34:08.326859	tutor	\N	f	en	t	t	t	f	\N	dbg8mcD6CmtfAfgAfX4Q	2020-11-28 16:34:11.824042	2020-11-28 16:34:08.325214	\N	t	f	f	f	f	f	f	Benjamin Tutor	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:24.424497
13	ed@mampf.edu	$2a$11$yzvVaEzzM99qII6hxJGKZuzvkwT8xCzJAYSpA4U6HH.I.NMQwISQ6	\N	\N	\N	2022-08-05 13:14:08.705536	2026-08-28 22:57:25.121583	f	1	t	2022-08-05 13:14:08.706967	ed	\N	f	en	f	f	f	f	\N	NhEfb358TxX5788uqSZy	2022-08-05 13:14:16.480332	2022-08-05 13:14:08.705583	\N	f	f	f	f	f	f	f		\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:25.121436
14	demo_lecture_student_0@example.com	$2a$11$TlAZA.afn04DhE5plKv4ZunKQyW2ZZEUAmv5Jiq7WNb./vT5lohFK	\N	\N	\N	2026-08-26 19:48:07.214925	2026-08-28 22:57:25.45867	f	1	t	2026-08-26 19:48:07.214846	Demo Lecture Student 0	\N	f	en	\N	\N	\N	\N	\N	z_YGpnA-TN8KnzG3sLjM	2026-08-26 19:48:07.232542	2026-08-26 19:48:07.215757	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:25.458529
15	demo_lecture_student_1@example.com	$2a$11$QUzzM3xNKXaQTTaYxoqTV.Dqgi.lQK8RfNU.vgDd7LiAEw/5DtY7.	\N	\N	\N	2026-08-26 19:48:07.809522	2026-08-28 22:57:25.81245	f	1	t	2026-08-26 19:48:07.809474	Demo Lecture Student 1	\N	f	en	\N	\N	\N	\N	\N	re-1t-yEsB_YZG7PHZRG	2026-08-26 19:48:07.814687	2026-08-26 19:48:07.809561	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:25.81226
16	demo_lecture_student_2@example.com	$2a$11$l6X/QSRmS3s9Uzyv9uUzveogGZc/ccjmvYzBc/ynB2dXph9JByZ.C	\N	\N	\N	2026-08-26 19:48:08.365155	2026-08-28 22:57:26.155256	f	1	t	2026-08-26 19:48:08.365075	Demo Lecture Student 2	\N	f	en	\N	\N	\N	\N	\N	WsnLyjxV3fS7szcn-pCg	2026-08-26 19:48:08.368977	2026-08-26 19:48:08.365207	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:26.155118
17	demo_lecture_student_3@example.com	$2a$11$f96yTG.WeizmeUJxlMSmdet2YJHbU7rEXaDLzBzMwUwj1I/pPQsmq	\N	\N	\N	2026-08-26 19:48:08.927997	2026-08-28 22:57:26.485881	f	1	t	2026-08-26 19:48:08.927851	Demo Lecture Student 3	\N	f	en	\N	\N	\N	\N	\N	RGXSH9EzPaLzDTrdmpLC	2026-08-26 19:48:08.929793	2026-08-26 19:48:08.928046	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:26.485736
18	demo_lecture_student_4@example.com	$2a$11$J7ZbvZQ0Btiv19xKKG/7LeM4opalEksx8LVZCOID5kw/ZFxkNj6Pa	\N	\N	\N	2026-08-26 19:48:09.342082	2026-08-28 22:57:26.841965	f	1	t	2026-08-26 19:48:09.342037	Demo Lecture Student 4	\N	f	en	\N	\N	\N	\N	\N	1xueoytYbn468cDHiK1u	2026-08-26 19:48:09.344055	2026-08-26 19:48:09.34245	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:26.841822
19	demo_lecture_student_5@example.com	$2a$11$nTzu8GVu1t27dAP9kczBWeT455N9VYOLdb6YXHSJ3t6xtMJkdUMsK	\N	\N	\N	2026-08-26 19:48:09.764081	2026-08-28 22:57:27.177062	f	1	t	2026-08-26 19:48:09.764032	Demo Lecture Student 5	\N	f	en	\N	\N	\N	\N	\N	GUYx_hwQbyZPxFZEkL3-	2026-08-26 19:48:09.765377	2026-08-26 19:48:09.764116	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:27.176922
20	demo_lecture_student_6@example.com	$2a$11$Zj8mE0lz0vPoS7Na252Pi.lRqXguGXDYHUF74NW1xJrDAPV5I5PnO	\N	\N	\N	2026-08-26 19:48:10.137806	2026-08-28 22:57:27.502019	f	1	t	2026-08-26 19:48:10.137712	Demo Lecture Student 6	\N	f	en	\N	\N	\N	\N	\N	m3ypBPiQBjEiJALpiTuV	2026-08-26 19:48:10.139577	2026-08-26 19:48:10.137847	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:27.501868
21	demo_lecture_student_7@example.com	$2a$11$BRA/O2sy7Zij6TQzxuKim.amNPAkEnx5oj7sI8YbDwMMF3NpM4oKi	\N	\N	\N	2026-08-26 19:48:10.558701	2026-08-28 22:57:27.857445	f	1	t	2026-08-26 19:48:10.558655	Demo Lecture Student 7	\N	f	en	\N	\N	\N	\N	\N	S-FGSsxuUC2DKDyKjzwW	2026-08-26 19:48:10.562155	2026-08-26 19:48:10.558771	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:27.857287
22	demo_lecture_student_8@example.com	$2a$11$SpwwYiJbGbCmU/gnzSsPi.RpXfDX3rK5HNoHJ7Ib0JdWIcJORnZ8e	\N	\N	\N	2026-08-26 19:48:10.941096	2026-08-28 22:57:28.198651	f	1	t	2026-08-26 19:48:10.941055	Demo Lecture Student 8	\N	f	en	\N	\N	\N	\N	\N	EDKTJ1bK8Mz7qZ6fq1wJ	2026-08-26 19:48:10.948131	2026-08-26 19:48:10.941493	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:28.198317
23	demo_lecture_student_9@example.com	$2a$11$QCdbr8po2lxNFTlxcEhOneYDgaKYmjjwKcQSzblIJnJNP/LkqSw1e	\N	\N	\N	2026-08-26 19:48:11.347141	2026-08-28 22:57:28.533294	f	1	t	2026-08-26 19:48:11.347018	Demo Lecture Student 9	\N	f	en	\N	\N	\N	\N	\N	dGsc8yrt12a_yNgmHFHd	2026-08-26 19:48:11.354067	2026-08-26 19:48:11.347176	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:28.532653
24	demo_lecture_student_10@example.com	$2a$11$VKd/nN5Diw3AowlP933POORrt7Ol2dBCZDpaO9I77JAKCg..8Hgjy	\N	\N	\N	2026-08-26 19:48:11.746935	2026-08-28 22:57:28.891847	f	1	t	2026-08-26 19:48:11.746881	Demo Lecture Student 10	\N	f	en	\N	\N	\N	\N	\N	cj4USzWcz6ZBptE1PUb5	2026-08-26 19:48:11.748509	2026-08-26 19:48:11.746973	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:28.891682
25	demo_lecture_student_11@example.com	$2a$11$7JMUo//puF93aS6I0VxErOo4gh8t5SBC4J0i3zsB7PnN3ygfVKG.u	\N	\N	\N	2026-08-26 19:48:12.137225	2026-08-28 22:57:29.229964	f	1	t	2026-08-26 19:48:12.13718	Demo Lecture Student 11	\N	f	en	\N	\N	\N	\N	\N	Zbx3hSYa1b7jmZbY-uDt	2026-08-26 19:48:12.138682	2026-08-26 19:48:12.137257	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:29.229818
26	demo_lecture_student_12@example.com	$2a$11$RqyN0M3mBIdDBZFvY6A81OxWOuUNEAGhDleEuYTa9y/rmLe.aeKkW	\N	\N	\N	2026-08-26 19:48:12.527363	2026-08-28 22:57:29.581024	f	1	t	2026-08-26 19:48:12.527215	Demo Lecture Student 12	\N	f	en	\N	\N	\N	\N	\N	7-E77vspWzpDQkVkCzSP	2026-08-26 19:48:12.528888	2026-08-26 19:48:12.527406	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:29.580881
27	demo_lecture_student_13@example.com	$2a$11$w2FPiZBB91mjqp/mi.1M8.TJJdrPDd1h1PaKdxdFcs1NxClwHviKi	\N	\N	\N	2026-08-26 19:48:12.911069	2026-08-28 22:57:29.928878	f	1	t	2026-08-26 19:48:12.911027	Demo Lecture Student 13	\N	f	en	\N	\N	\N	\N	\N	p6NCVAuY8uY2mDAR5_BE	2026-08-26 19:48:12.912761	2026-08-26 19:48:12.911102	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:29.928739
28	demo_lecture_student_14@example.com	$2a$11$c.Z/r14pqHjfUDgSNFXaCuqngK/iNav/HbPi9RxV65PaOePiNCNLO	\N	\N	\N	2026-08-26 19:48:13.286724	2026-08-28 22:57:30.26226	f	1	t	2026-08-26 19:48:13.286676	Demo Lecture Student 14	\N	f	en	\N	\N	\N	\N	\N	jeAXcSFAJeQZynyiv4t9	2026-08-26 19:48:13.288394	2026-08-26 19:48:13.286758	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:30.262085
29	demo_lecture_student_15@example.com	$2a$11$EgLB/nlf62ahNpvHyV8S1.fYy1yX0/h/hXknx/ribvEVo4AC9ztHW	\N	\N	\N	2026-08-26 19:48:13.683043	2026-08-28 22:57:30.616489	f	1	t	2026-08-26 19:48:13.682978	Demo Lecture Student 15	\N	f	en	\N	\N	\N	\N	\N	y4hHVy2DTVZSiLG55rpk	2026-08-26 19:48:13.684784	2026-08-26 19:48:13.683105	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:30.616354
30	demo_lecture_student_16@example.com	$2a$11$buobamrMGxT6sI7PDocM6.NU3NGUKtdOwczrkNby6Jzi7tsu0R09y	\N	\N	\N	2026-08-26 19:48:14.060239	2026-08-28 22:57:30.965694	f	1	t	2026-08-26 19:48:14.059848	Demo Lecture Student 16	\N	f	en	\N	\N	\N	\N	\N	Y-BQdE3CRGaaNj_xcQKk	2026-08-26 19:48:14.062919	2026-08-26 19:48:14.060316	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:30.965468
31	demo_lecture_student_17@example.com	$2a$11$QkxEkUm.XeFqwpYlVHUHQer7s50fdCdPKqjvGuY3wzcgk2NX1V/q.	\N	\N	\N	2026-08-26 19:48:14.43704	2026-08-28 22:57:31.31596	f	1	t	2026-08-26 19:48:14.436998	Demo Lecture Student 17	\N	f	en	\N	\N	\N	\N	\N	z2Ms-i3dR4DBR5qBBhVE	2026-08-26 19:48:14.438323	2026-08-26 19:48:14.437074	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:31.315821
32	demo_lecture_student_18@example.com	$2a$11$uYxyO/hlVAy5cKlqtDhEyelhKnQmAo3./JjIhjR8bm1Z3J0c/B/zy	\N	\N	\N	2026-08-26 19:48:14.826853	2026-08-28 22:57:31.673723	f	1	t	2026-08-26 19:48:14.826811	Demo Lecture Student 18	\N	f	en	\N	\N	\N	\N	\N	zDHr7z-J5eJsvK3rY157	2026-08-26 19:48:14.828083	2026-08-26 19:48:14.826889	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:31.673587
33	demo_lecture_student_19@example.com	$2a$11$ieNd6fPtXWISDD8yaL9TEuonxjiJOOMTtj7n7vGUFpu6ENklOXHUi	\N	\N	\N	2026-08-26 19:48:15.207163	2026-08-28 22:57:32.01678	f	1	t	2026-08-26 19:48:15.207122	Demo Lecture Student 19	\N	f	en	\N	\N	\N	\N	\N	tT8Q1maryAmpGjxRYhpM	2026-08-26 19:48:15.208569	2026-08-26 19:48:15.207195	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:32.016518
34	demo_lecture_student_20@example.com	$2a$11$b75DfSHPVmnRsR1op75Q.ORcNOAWcsHqqQz5R64AIRz7d4fQL/Nfy	\N	\N	\N	2026-08-26 19:48:15.603818	2026-08-28 22:57:32.361019	f	1	t	2026-08-26 19:48:15.603775	Demo Lecture Student 20	\N	f	en	\N	\N	\N	\N	\N	KtCvdseRBQkBAxKsRteC	2026-08-26 19:48:15.605363	2026-08-26 19:48:15.603855	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:32.360877
35	demo_lecture_student_21@example.com	$2a$11$QKFIIV0YMBu3vsjIFm4F0uI0Gcr8q994e5Fliw.af14IoWLufCcSC	\N	\N	\N	2026-08-26 19:48:15.981463	2026-08-28 22:57:32.752647	f	1	t	2026-08-26 19:48:15.981425	Demo Lecture Student 21	\N	f	en	\N	\N	\N	\N	\N	oXyyQFqL-76ti2D2szUQ	2026-08-26 19:48:15.982649	2026-08-26 19:48:15.981495	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:32.752428
36	demo_lecture_student_22@example.com	$2a$11$j9g5FbVZvbP7QcGcz7QnM.D5/vZbH5B/LD4aCPhoJC0KUyPmRyzjW	\N	\N	\N	2026-08-26 19:48:16.36663	2026-08-28 22:57:33.119085	f	1	t	2026-08-26 19:48:16.366589	Demo Lecture Student 22	\N	f	en	\N	\N	\N	\N	\N	zoettit89ZGCM7tTfnrR	2026-08-26 19:48:16.368112	2026-08-26 19:48:16.366663	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:33.118904
37	demo_lecture_student_23@example.com	$2a$11$H0uqvQCLETu2leDGfS7bgeuvaRxhPj34HSQOky9pccDJF9gcPAQY6	\N	\N	\N	2026-08-26 19:48:16.756622	2026-08-28 22:57:33.471222	f	1	t	2026-08-26 19:48:16.756585	Demo Lecture Student 23	\N	f	en	\N	\N	\N	\N	\N	_wAgQVhEqW44NrFGB6Xy	2026-08-26 19:48:16.757721	2026-08-26 19:48:16.756652	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:33.471072
38	demo_lecture_student_24@example.com	$2a$11$WnZ6Xf9eviasL2ASGiKjxe7c/8BwGytmj1hoWGFHlNCtklsPtyudu	\N	\N	\N	2026-08-26 19:48:17.14132	2026-08-28 22:57:33.851428	f	1	t	2026-08-26 19:48:17.141284	Demo Lecture Student 24	\N	f	en	\N	\N	\N	\N	\N	-XKNd2yjpdWWZyBYxWpn	2026-08-26 19:48:17.142493	2026-08-26 19:48:17.141391	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:33.851286
39	demo_lecture_student_25@example.com	$2a$11$k5LJRkrIAZskZ7wqUIk57ObgibaGjQO2faBKcYASW6RvIYXx6KjEy	\N	\N	\N	2026-08-26 19:48:17.524694	2026-08-28 22:57:34.209224	f	1	t	2026-08-26 19:48:17.524023	Demo Lecture Student 25	\N	f	en	\N	\N	\N	\N	\N	1RTXpByHFusEMN-n9xkC	2026-08-26 19:48:17.526235	2026-08-26 19:48:17.524735	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:34.209079
40	demo_lecture_student_26@example.com	$2a$11$aHAiKFfzncsyp/V2eInoBOk19pvidLUnzICR/xh8q5i7oywo0.CvO	\N	\N	\N	2026-08-26 19:48:17.904308	2026-08-28 22:57:34.568576	f	1	t	2026-08-26 19:48:17.90427	Demo Lecture Student 26	\N	f	en	\N	\N	\N	\N	\N	_y4iBrf1_A5FDwNmvtov	2026-08-26 19:48:17.905466	2026-08-26 19:48:17.904339	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:34.568437
41	demo_lecture_student_27@example.com	$2a$11$KNVPpokH70PDzdSJ0gmjoebmP.pRbHM8f2b/t2mpscOfyA4DvywuO	\N	\N	\N	2026-08-26 19:48:18.282456	2026-08-28 22:57:34.93393	f	1	t	2026-08-26 19:48:18.282419	Demo Lecture Student 27	\N	f	en	\N	\N	\N	\N	\N	y5zcKsj2eSsd9GiPcetk	2026-08-26 19:48:18.283562	2026-08-26 19:48:18.282488	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:34.933788
42	demo_lecture_student_28@example.com	$2a$11$.HzSmF/T4LoHmGUqa20DBOUENsND0uDJhF5nzBjST..NGOTvyh3qi	\N	\N	\N	2026-08-26 19:48:18.659858	2026-08-28 22:57:35.285279	f	1	t	2026-08-26 19:48:18.659822	Demo Lecture Student 28	\N	f	en	\N	\N	\N	\N	\N	mMdUaaebtBJFJnbScRgw	2026-08-26 19:48:18.661458	2026-08-26 19:48:18.659887	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:35.285137
43	demo_lecture_student_29@example.com	$2a$11$3GMGCUm.QFF06i2KDgD74OIqctb9A.2HbYBsuXz9KiNP9gPsiM1ie	\N	\N	\N	2026-08-26 19:48:19.041229	2026-08-28 22:57:35.652755	f	1	t	2026-08-26 19:48:19.041193	Demo Lecture Student 29	\N	f	en	\N	\N	\N	\N	\N	8FLnmoe7XtxxF3pEQdmt	2026-08-26 19:48:19.042522	2026-08-26 19:48:19.041259	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:35.652609
44	demo_lecture_student_30@example.com	$2a$11$InD5Ux3ray2juNRw4BNahu34191bZflGdHpp4.Tuy7o.anrmnH21m	\N	\N	\N	2026-08-26 19:48:19.414755	2026-08-28 22:57:36.00377	f	1	t	2026-08-26 19:48:19.414719	Demo Lecture Student 30	\N	f	en	\N	\N	\N	\N	\N	ngiKay5Hh4hFHess6YLN	2026-08-26 19:48:19.416212	2026-08-26 19:48:19.414785	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:36.003594
45	demo_lecture_student_31@example.com	$2a$11$Xw7CPZimpDeJqoFV5GeaAexx0Rn/gA//JkI0.JUt0UqoX2gNlbF/2	\N	\N	\N	2026-08-26 19:48:19.793031	2026-08-28 22:57:36.347276	f	1	t	2026-08-26 19:48:19.792993	Demo Lecture Student 31	\N	f	en	\N	\N	\N	\N	\N	gLg1XHucCxiyYQGeeCkx	2026-08-26 19:48:19.794394	2026-08-26 19:48:19.793067	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:36.347135
46	demo_seminar_student_0@mampf.edu	$2a$11$h9IxxDZcS9vqDsOiA4Mu5e.grNli9v4Q3aIPjUQElaVrlbeWpOw.6	\N	\N	\N	2026-08-26 19:48:21.667102	2026-08-28 22:57:36.710724	f	1	t	2026-08-26 19:48:21.666825	Demo Seminar Student 0	\N	f	en	\N	\N	\N	\N	\N	Bez1V5NYMcKtfBB1g8LZ	2026-08-26 19:48:21.668969	2026-08-26 19:48:21.667235	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:36.710583
47	demo_seminar_student_1@mampf.edu	$2a$11$RpDzf.q7UHXDHkZaiupbzueWk2TBfnruMKmFo/pq1tyFA4vFJVP3m	\N	\N	\N	2026-08-26 19:48:22.070093	2026-08-28 22:57:37.062985	f	1	t	2026-08-26 19:48:22.070056	Demo Seminar Student 1	\N	f	en	\N	\N	\N	\N	\N	sr1FfqjSFSHW87gc7V-g	2026-08-26 19:48:22.071198	2026-08-26 19:48:22.070129	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:37.062073
48	demo_seminar_student_2@mampf.edu	$2a$11$0ElpTleFEabJ6j1ScPgGnuJeuK.cOhtqtHMp6s2r892nEwrQYS40C	\N	\N	\N	2026-08-26 19:48:22.43313	2026-08-28 22:57:37.394779	f	1	t	2026-08-26 19:48:22.433092	Demo Seminar Student 2	\N	f	en	\N	\N	\N	\N	\N	CFX4Xvrfx68mYkywV_-b	2026-08-26 19:48:22.434311	2026-08-26 19:48:22.433179	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:37.394646
49	demo_seminar_student_3@mampf.edu	$2a$11$vhBEk2KNCyu4EEfNU2dOUOYUIHtAQ84UBDLf0FCFyPB8o.M4mByaC	\N	\N	\N	2026-08-26 19:48:22.806947	2026-08-28 22:57:37.746129	f	1	t	2026-08-26 19:48:22.806911	Demo Seminar Student 3	\N	f	en	\N	\N	\N	\N	\N	DViz-FcSqXSzVNjrb2BB	2026-08-26 19:48:22.808035	2026-08-26 19:48:22.80698	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:37.745989
50	demo_seminar_student_4@mampf.edu	$2a$11$PMKev8OwJPJwXEsfcV.wZuaTLkD5mrR/9Ej.lefn7rZ0FWXgEOs2K	\N	\N	\N	2026-08-26 19:48:23.164034	2026-08-28 22:57:38.082375	f	1	t	2026-08-26 19:48:23.163988	Demo Seminar Student 4	\N	f	en	\N	\N	\N	\N	\N	Y3k6twnJ3zMnN52NekWN	2026-08-26 19:48:23.165327	2026-08-26 19:48:23.164073	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:38.08224
51	demo_seminar_student_5@mampf.edu	$2a$11$l4Y0WQcqdUCW7eyV57KgCOLWGuGoLvYNrBIM23sr/y..AHp7NiSTy	\N	\N	\N	2026-08-26 19:48:23.660159	2026-08-28 22:57:38.41655	f	1	t	2026-08-26 19:48:23.660118	Demo Seminar Student 5	\N	f	en	\N	\N	\N	\N	\N	zmbZjJ2PNtMeiE6v2eLZ	2026-08-26 19:48:23.661385	2026-08-26 19:48:23.660206	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:38.416412
52	demo_seminar_student_6@mampf.edu	$2a$11$8npEBVtQJmRsevDPY0GVFucQM90FAQMvfm4NgSFNu.nHC3sNBysS.	\N	\N	\N	2026-08-26 19:48:24.022698	2026-08-28 22:57:38.774306	f	1	t	2026-08-26 19:48:24.022663	Demo Seminar Student 6	\N	f	en	\N	\N	\N	\N	\N	6QqvvLNemQq5ACqrCxz3	2026-08-26 19:48:24.023795	2026-08-26 19:48:24.022734	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:38.774154
53	demo_seminar_student_7@mampf.edu	$2a$11$TP8Vst9PBqdi0aITKpl6AOO9i4lyn.aiJCXtksmoDVNtRQS2VW3Nm	\N	\N	\N	2026-08-26 19:48:24.429429	2026-08-28 22:57:39.108589	f	1	t	2026-08-26 19:48:24.429393	Demo Seminar Student 7	\N	f	en	\N	\N	\N	\N	\N	HpMzYZQ2S1QEnCgw2sSE	2026-08-26 19:48:24.430856	2026-08-26 19:48:24.429465	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:39.108442
54	demo_seminar_student_8@mampf.edu	$2a$11$ksONzFWY3qWdjl3v7lN.WOcK0.tDeQtr8VVxp4.4Pr8qKitpTYX9i	\N	\N	\N	2026-08-26 19:48:24.778494	2026-08-28 22:57:39.452916	f	1	t	2026-08-26 19:48:24.778455	Demo Seminar Student 8	\N	f	en	\N	\N	\N	\N	\N	KzDDMcwSB17BahNBWyRr	2026-08-26 19:48:24.779645	2026-08-26 19:48:24.778534	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:39.452786
55	demo_seminar_student_9@mampf.edu	$2a$11$MR9tlyjHXI3pk8LOBskaGuAzcZmtpx7P6.2ZNGIerf/rV2Ih.JDqK	\N	\N	\N	2026-08-26 19:48:25.151005	2026-08-28 22:57:39.794812	f	1	t	2026-08-26 19:48:25.150961	Demo Seminar Student 9	\N	f	en	\N	\N	\N	\N	\N	t3FjNsRjckHx7GkAv6Gu	2026-08-26 19:48:25.152273	2026-08-26 19:48:25.151048	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:39.794662
56	demo_seminar_student_10@mampf.edu	$2a$11$eLXssFv3eeU/QY/HRXFF0.e4PbBq52e0MUgAFCQsoeqvXubVkz0cS	\N	\N	\N	2026-08-26 19:48:25.50142	2026-08-28 22:57:40.12783	f	1	t	2026-08-26 19:48:25.500969	Demo Seminar Student 10	\N	f	en	\N	\N	\N	\N	\N	yhmZxNP7r9wgvkNXiNbL	2026-08-26 19:48:25.502932	2026-08-26 19:48:25.501469	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:40.127693
57	demo_seminar_student_11@mampf.edu	$2a$11$Ofburf7UKOo48fiob.b90.DqmK2wJUtcBT8eHLkJL9FEGBuWNavne	\N	\N	\N	2026-08-26 19:48:25.877974	2026-08-28 22:57:40.485882	f	1	t	2026-08-26 19:48:25.877686	Demo Seminar Student 11	\N	f	en	\N	\N	\N	\N	\N	5fnjws97WUsqW8EEboLK	2026-08-26 19:48:25.879618	2026-08-26 19:48:25.87849	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:40.485745
58	demo_seminar_rejected_0@example.com	$2a$11$9hUKr92/dYSklt9UiPPwCuyZZkma5XYpDOIkzKfmL0FeFHUyZVs1S	\N	\N	\N	2026-08-26 19:48:26.217589	2026-08-28 22:57:40.821783	f	1	t	2026-08-26 19:48:26.217556	Demo Seminar Rejected 0	\N	f	en	\N	\N	\N	\N	\N	87ovjJE3eGwGsZ1HtawD	2026-08-26 19:48:26.218782	2026-08-26 19:48:26.217622	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:40.82165
59	demo_seminar_rejected_1@example.com	$2a$11$nYFiL8NUa2ZyqAts/jtOZeYjqs1eNffJH67JRJ6/6.K.1BWwMXSLa	\N	\N	\N	2026-08-26 19:48:26.584305	2026-08-28 22:57:41.152977	f	1	t	2026-08-26 19:48:26.584273	Demo Seminar Rejected 1	\N	f	en	\N	\N	\N	\N	\N	9V_JULqBMpbWRVQysUZn	2026-08-26 19:48:26.585473	2026-08-26 19:48:26.584336	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:41.152839
60	solver_user_0@example.com	$2a$11$gRhumAtDPy5ZrK4psmU1sueggUeYgqPmbVrFXTyoChiuqCfaIfwzG	\N	\N	\N	2026-08-26 19:48:27.51481	2026-08-28 22:57:41.501006	f	1	t	2026-08-26 19:48:27.514766	Solver User 0	\N	f	en	\N	\N	\N	\N	\N	V-s657wkamGfuWHLzxr_	2026-08-26 19:48:27.51596	2026-08-26 19:48:27.514854	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:41.500875
61	solver_user_1@example.com	$2a$11$8/w8MmCakqhoaJRcL7AzZOCyQzyaI7dV1epWaMfO5iRD.f.ewZzR.	\N	\N	\N	2026-08-26 19:48:27.889997	2026-08-28 22:57:41.83876	f	1	t	2026-08-26 19:48:27.889945	Solver User 1	\N	f	en	\N	\N	\N	\N	\N	UeuyaVLmqwwmK_gPRmQF	2026-08-26 19:48:27.891128	2026-08-26 19:48:27.890036	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:41.838627
62	solver_user_2@example.com	$2a$11$HCL/JQswb56op9niQfIAWuWspcpzUIA.4f2VB3nHw7EuPY/WKD3GK	\N	\N	\N	2026-08-26 19:48:28.277957	2026-08-28 22:57:42.166891	f	1	t	2026-08-26 19:48:28.277923	Solver User 2	\N	f	en	\N	\N	\N	\N	\N	VFuadniEjbsyztTtEy_N	2026-08-26 19:48:28.279126	2026-08-26 19:48:28.27799	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:42.166748
63	solver_user_3@example.com	$2a$11$OfOWT6IKwywo6xsuYCqnseVn20qGGmy9LkIFjs9rV5pLcyysN.Bxq	\N	\N	\N	2026-08-26 19:48:28.650515	2026-08-28 22:57:42.515283	f	1	t	2026-08-26 19:48:28.650483	Solver User 3	\N	f	en	\N	\N	\N	\N	\N	_ynBNH8v6VxdNxMKRxRq	2026-08-26 19:48:28.651677	2026-08-26 19:48:28.650553	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:42.515124
64	solver_user_4@example.com	$2a$11$X3mNKL4L7AOXEf1Lfwc8AuGbCqN1BO6H6q2IC0G4VOCOc2KLDCA3y	\N	\N	\N	2026-08-26 19:48:29.029028	2026-08-28 22:57:42.856014	f	1	t	2026-08-26 19:48:29.028993	Solver User 4	\N	f	en	\N	\N	\N	\N	\N	D-nbT8Xzzi2MUhW-g6rt	2026-08-26 19:48:29.030264	2026-08-26 19:48:29.029064	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:42.855875
65	solver_user_5@example.com	$2a$11$ti4qTdgra0jiOyJHfF6Kfez/VTDSS38Vq7wc8zl5EATmh.o0XFt2S	\N	\N	\N	2026-08-26 19:48:29.420129	2026-08-28 22:57:43.187775	f	1	t	2026-08-26 19:48:29.420096	Solver User 5	\N	f	en	\N	\N	\N	\N	\N	CMafyCfD3yVfEnFN3-aq	2026-08-26 19:48:29.421263	2026-08-26 19:48:29.420166	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:43.187622
66	solver_user_6@example.com	$2a$11$WdoJjvO3nW4UbjPlZDBvcer6Y27Cecb2JQMWsFdxj1Ss0woJ8BQ5K	\N	\N	\N	2026-08-26 19:48:29.794009	2026-08-28 22:57:43.539737	f	1	t	2026-08-26 19:48:29.793974	Solver User 6	\N	f	en	\N	\N	\N	\N	\N	jHFS2qWvMP6YYvVfCxU_	2026-08-26 19:48:29.795233	2026-08-26 19:48:29.794063	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:43.539601
67	solver_user_7@example.com	$2a$11$RlALJVoJsZvp6T4ozJAkt.I2avj5haumUFf5/QetTe/XK2z1hub.6	\N	\N	\N	2026-08-26 19:48:30.189193	2026-08-28 22:57:43.878886	f	1	t	2026-08-26 19:48:30.189159	Solver User 7	\N	f	en	\N	\N	\N	\N	\N	mbmNxusKB5VzgBQzQsks	2026-08-26 19:48:30.190555	2026-08-26 19:48:30.189229	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:43.878744
68	solver_user_8@example.com	$2a$11$g05HYKOi2pIKQHt8aAvhX./RnYv2Ek1L0Bz/i.O3KALuODwLPEkxW	\N	\N	\N	2026-08-26 19:48:30.56596	2026-08-28 22:57:44.227414	f	1	t	2026-08-26 19:48:30.565921	Solver User 8	\N	f	en	\N	\N	\N	\N	\N	5vKG6hjzFBW2CypqYCoN	2026-08-26 19:48:30.567206	2026-08-26 19:48:30.565997	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:44.227268
69	solver_user_9@example.com	$2a$11$ugJEGCLVOLhfpq/xxPWjbO5YwfF8FFar79hMUG88xSs2w1XzIdEou	\N	\N	\N	2026-08-26 19:48:30.92305	2026-08-28 22:57:44.56985	f	1	t	2026-08-26 19:48:30.923016	Solver User 9	\N	f	en	\N	\N	\N	\N	\N	612XG-eb-DDxE7xcD6Jo	2026-08-26 19:48:30.924151	2026-08-26 19:48:30.923085	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:44.569714
70	solver_user_10@example.com	$2a$11$Uw93uSIWabPXbqY3bXEWx.t4JTFKmwhK8h5FVZVdxQlleVcp9qnNi	\N	\N	\N	2026-08-26 19:48:31.301441	2026-08-28 22:57:44.901071	f	1	t	2026-08-26 19:48:31.301408	Solver User 10	\N	f	en	\N	\N	\N	\N	\N	y9HSBTZ-1UGDiAe5UFKs	2026-08-26 19:48:31.302594	2026-08-26 19:48:31.301474	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:44.900938
71	solver_user_11@example.com	$2a$11$IomJ0cOibh0UNUWkwvDx4.puMMBNNWGWGad5CyTLa0/DxbupAafgW	\N	\N	\N	2026-08-26 19:48:31.659411	2026-08-28 22:57:45.253512	f	1	t	2026-08-26 19:48:31.65938	Solver User 11	\N	f	en	\N	\N	\N	\N	\N	c9affA9SLtomwDoxqo3x	2026-08-26 19:48:31.66059	2026-08-26 19:48:31.659443	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:45.253366
72	solver_user_12@example.com	$2a$11$hFuA6tU2MZKl/aQ/yYjiH.At.UafOotFdeMPu87tsxLF/swKp1Chu	\N	\N	\N	2026-08-26 19:48:32.029917	2026-08-28 22:57:45.596097	f	1	t	2026-08-26 19:48:32.029883	Solver User 12	\N	f	en	\N	\N	\N	\N	\N	VEA4TB4PxRv_z2dva7zD	2026-08-26 19:48:32.031003	2026-08-26 19:48:32.029953	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:45.595963
73	solver_user_13@example.com	$2a$11$SfKKBeuF8D3ffbtjKh5jaeBqtW2yMVQ6AuDO6TqqEMI46ECyCaCZq	\N	\N	\N	2026-08-26 19:48:32.398932	2026-08-28 22:57:45.925695	f	1	t	2026-08-26 19:48:32.398899	Solver User 13	\N	f	en	\N	\N	\N	\N	\N	NyDej8SSeamRMySiVGNZ	2026-08-26 19:48:32.401516	2026-08-26 19:48:32.39959	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:45.925551
74	solver_user_14@example.com	$2a$11$HZ8V7uA8pX3YSqefEB7MvOnp.s79EISDVe/TQ3GDgLx9FGXm5TBkC	\N	\N	\N	2026-08-26 19:48:32.748551	2026-08-28 22:57:46.276028	f	1	t	2026-08-26 19:48:32.748515	Solver User 14	\N	f	en	\N	\N	\N	\N	\N	zKn66VKgNjzQRL8to82y	2026-08-26 19:48:32.749766	2026-08-26 19:48:32.748583	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:46.275891
75	solver_user_15@example.com	$2a$11$BWOi5tOK1hE03ERLGSp8PutHDB/O2hmNnKXxbb1bYnd/hWBTPj/iy	\N	\N	\N	2026-08-26 19:48:33.117156	2026-08-28 22:57:46.608264	f	1	t	2026-08-26 19:48:33.116896	Solver User 15	\N	f	en	\N	\N	\N	\N	\N	tyza6eaRacRMz_zYc4jQ	2026-08-26 19:48:33.118383	2026-08-26 19:48:33.117196	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:46.608126
76	solver_user_16@example.com	$2a$11$WZPxyHxYPRukfEvDK7IDu.yPSRmYPK.S0htVYQxeLF22BPQ6zyuMa	\N	\N	\N	2026-08-26 19:48:33.48573	2026-08-28 22:57:46.932209	f	1	t	2026-08-26 19:48:33.485698	Solver User 16	\N	f	en	\N	\N	\N	\N	\N	Vy9SEGpKzxS3A89yCyM2	2026-08-26 19:48:33.487118	2026-08-26 19:48:33.485761	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:46.931998
77	solver_user_17@example.com	$2a$11$Lw6g2iNOXYA9L/8ISRjn7OYVwvW1zTtvhcxy/nl78b.uDW4ZqlMPm	\N	\N	\N	2026-08-26 19:48:33.840001	2026-08-28 22:57:47.284668	f	1	t	2026-08-26 19:48:33.839968	Solver User 17	\N	f	en	\N	\N	\N	\N	\N	S4W2jWdsmgGwQH9C5asz	2026-08-26 19:48:33.841086	2026-08-26 19:48:33.840033	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:47.284512
78	solver_user_18@example.com	$2a$11$tUfW4HSEdSCrYmO1Sgp69OqXHgJfogmcZTcjlTW6PUYQSG80EtT4W	\N	\N	\N	2026-08-26 19:48:34.207645	2026-08-28 22:57:47.616977	f	1	t	2026-08-26 19:48:34.207613	Solver User 18	\N	f	en	\N	\N	\N	\N	\N	kEef2LWZgwNnTV4GANAj	2026-08-26 19:48:34.208909	2026-08-26 19:48:34.207678	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:47.616846
79	solver_user_19@example.com	$2a$11$kWJgPQ1viAdUbMOZY1G82OIQlyBOtDDi2IW2hH8/E/wk54NW2PFa.	\N	\N	\N	2026-08-26 19:48:34.562486	2026-08-28 22:57:47.955402	f	1	t	2026-08-26 19:48:34.562444	Solver User 19	\N	f	en	\N	\N	\N	\N	\N	AyBJK3PsyzLysHxYvUS-	2026-08-26 19:48:34.564079	2026-08-26 19:48:34.56252	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:47.955251
80	solver_user_20@example.com	$2a$11$WadRG9gOW/3HnmgCXbhi7OeC1LtKm281B3HTk4pdI/2SKd0N0HKkq	\N	\N	\N	2026-08-26 19:48:34.932963	2026-08-28 22:57:48.321465	f	1	t	2026-08-26 19:48:34.932924	Solver User 20	\N	f	en	\N	\N	\N	\N	\N	xzSzDzPTTo8CYfynp7ac	2026-08-26 19:48:34.934409	2026-08-26 19:48:34.932999	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:48.321325
81	solver_user_21@example.com	$2a$11$PR.SkKxTO3qAkhc.HeD/VOdIgf5lPPxlQqXpgfaul9A3YDDM95B3a	\N	\N	\N	2026-08-26 19:48:35.31679	2026-08-28 22:57:48.670142	f	1	t	2026-08-26 19:48:35.316756	Solver User 21	\N	f	en	\N	\N	\N	\N	\N	4dHzJoPdo4YQYNbTUzG3	2026-08-26 19:48:35.318046	2026-08-26 19:48:35.316822	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:48.669991
82	solver_user_22@example.com	$2a$11$MkICzpqu4/zXleCzvtCAxe./5nJqinN8pLZRrFPjjbcOrp.JJYzHe	\N	\N	\N	2026-08-26 19:48:35.706971	2026-08-28 22:57:49.011028	f	1	t	2026-08-26 19:48:35.706887	Solver User 22	\N	f	en	\N	\N	\N	\N	\N	JeSfLfNREbtWn1y6Hosm	2026-08-26 19:48:35.708352	2026-08-26 19:48:35.707023	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:49.01089
83	solver_user_23@example.com	$2a$11$yiy7rx54pNmt19PO3ATV5uXdxu5htQ.cd.UFz8LZ2H.eGLzXbG/Cu	\N	\N	\N	2026-08-26 19:48:36.101474	2026-08-28 22:57:49.355341	f	1	t	2026-08-26 19:48:36.101431	Solver User 23	\N	f	en	\N	\N	\N	\N	\N	btxVCAz2kf8tA3YvoFw7	2026-08-26 19:48:36.102809	2026-08-26 19:48:36.101511	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:49.355209
84	solver_user_24@example.com	$2a$11$x4y4tWSbt1LV0a4o7y0gaO7xSTwlmYyNAiuF5kF8SXh7eSurMhALm	\N	\N	\N	2026-08-26 19:48:36.497327	2026-08-28 22:57:49.682501	f	1	t	2026-08-26 19:48:36.497293	Solver User 24	\N	f	en	\N	\N	\N	\N	\N	VgdFsxP742ps9EMEZZgs	2026-08-26 19:48:36.498558	2026-08-26 19:48:36.497361	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:49.682328
85	solver_user_25@example.com	$2a$11$IlE2aeix0.GrJwXENth.BOqLEn9TubGLtTJthLeBuEYzcs05sx7mS	\N	\N	\N	2026-08-26 19:48:36.892575	2026-08-28 22:57:50.027131	f	1	t	2026-08-26 19:48:36.892542	Solver User 25	\N	f	en	\N	\N	\N	\N	\N	JuxgET6z7LtutDYKbrtx	2026-08-26 19:48:36.893709	2026-08-26 19:48:36.892605	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:50.026975
86	solver_user_26@example.com	$2a$11$2foyemZQcmhtGLbUzjHb0ukgq4IhaDag7y7C8ABO4SotB8HjILUBO	\N	\N	\N	2026-08-26 19:48:37.274405	2026-08-28 22:57:50.37131	f	1	t	2026-08-26 19:48:37.27437	Solver User 26	\N	f	en	\N	\N	\N	\N	\N	jdwDNSsdWN-mky99Y3UC	2026-08-26 19:48:37.27586	2026-08-26 19:48:37.27444	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:50.371165
87	solver_user_27@example.com	$2a$11$lQ8yah599vvuv9FhROLOCuqbhqlcEDFaaLFBGj8VXya8zEZ10SitW	\N	\N	\N	2026-08-26 19:48:37.647646	2026-08-28 22:57:50.700815	f	1	t	2026-08-26 19:48:37.647613	Solver User 27	\N	f	en	\N	\N	\N	\N	\N	T2ZsNhHS_f4TzkxBeZKg	2026-08-26 19:48:37.648764	2026-08-26 19:48:37.647679	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:50.700678
88	solver_user_28@example.com	$2a$11$AA1A8gWXMVnl2g1RHqtuUumVZTwqhVkqURiPU8WAYLhXlLqst/YQy	\N	\N	\N	2026-08-26 19:48:38.008577	2026-08-28 22:57:51.050839	f	1	t	2026-08-26 19:48:38.00854	Solver User 28	\N	f	en	\N	\N	\N	\N	\N	hE-nEiJF78EqzqqNX87i	2026-08-26 19:48:38.010149	2026-08-26 19:48:38.008635	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:51.0507
89	solver_user_29@example.com	$2a$11$dIjMior7cRCCDnIm7JWUJuORkVhLDKQl8S6c.qsHqSyyz2mJO7coa	\N	\N	\N	2026-08-26 19:48:38.40139	2026-08-28 22:57:51.400692	f	1	t	2026-08-26 19:48:38.40135	Solver User 29	\N	f	en	\N	\N	\N	\N	\N	YJ1jpWzkX9cTybaes7AW	2026-08-26 19:48:38.402826	2026-08-26 19:48:38.401432	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:51.400558
90	solver_user_30@example.com	$2a$11$DQVGtkUDU0Fj2eH8zmQFy.Vd4BmZ7eCVvs/R8Tdtfi257j1mBgT5q	\N	\N	\N	2026-08-26 19:48:38.773417	2026-08-28 22:57:51.723644	f	1	t	2026-08-26 19:48:38.773384	Solver User 30	\N	f	en	\N	\N	\N	\N	\N	R47sKsJ3jiUaFTg46J_T	2026-08-26 19:48:38.774981	2026-08-26 19:48:38.773452	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:51.723514
91	solver_user_31@example.com	$2a$11$aOtvJ5IyxIGeAhhCAfb0vefTPJL3W2sKSteiPNYt/BKnki/HKVbmu	\N	\N	\N	2026-08-26 19:48:39.149572	2026-08-28 22:57:52.075217	f	1	t	2026-08-26 19:48:39.149533	Solver User 31	\N	f	en	\N	\N	\N	\N	\N	3AFJvpz_3nLqr6KNQP41	2026-08-26 19:48:39.151066	2026-08-26 19:48:39.149629	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:52.07492
92	solver_user_32@example.com	$2a$11$oTXfAHkrO2OCwLE6n77d..AGPwkeLI8Mi4J4ZI9TXx/DiCy93fYeK	\N	\N	\N	2026-08-26 19:48:39.552711	2026-08-28 22:57:52.418896	f	1	t	2026-08-26 19:48:39.552677	Solver User 32	\N	f	en	\N	\N	\N	\N	\N	e89WdwMHsN3DgsnxGhFP	2026-08-26 19:48:39.554023	2026-08-26 19:48:39.552745	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:52.418746
93	solver_user_33@example.com	$2a$11$OJmQRYgaMDPOAOxT5V5N0.4z97vIVpWXSnMXz1hrLK4kz1qqoGuwK	\N	\N	\N	2026-08-26 19:48:39.923175	2026-08-28 22:57:52.761463	f	1	t	2026-08-26 19:48:39.923134	Solver User 33	\N	f	en	\N	\N	\N	\N	\N	djRpJeuxxHy9TiDYbsyg	2026-08-26 19:48:39.924566	2026-08-26 19:48:39.923217	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:52.761331
94	solver_user_34@example.com	$2a$11$Wljo91xPKBlbEjq5gkeC4O0cZRzCxEgyH1NXv9jKcoh30X3fd26xq	\N	\N	\N	2026-08-26 19:48:40.305242	2026-08-28 22:57:53.107984	f	1	t	2026-08-26 19:48:40.305206	Solver User 34	\N	f	en	\N	\N	\N	\N	\N	tq6bVr-QJzAu1KtYehwy	2026-08-26 19:48:40.306532	2026-08-26 19:48:40.305279	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:53.107831
95	solver_user_35@example.com	$2a$11$T1ENmyDQMGASnVrjOmZl2uRPyE7.jnMr052mUX7ZbzmUioezXiKJm	\N	\N	\N	2026-08-26 19:48:40.730029	2026-08-28 22:57:53.443322	f	1	t	2026-08-26 19:48:40.729995	Solver User 35	\N	f	en	\N	\N	\N	\N	\N	4fNP78u5pB-YjrJpKR8i	2026-08-26 19:48:40.732497	2026-08-26 19:48:40.730062	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:53.443183
96	solver_user_36@example.com	$2a$11$qvymdiSQBZ3aVQPzL1nCtu3XwILLNwhwIjlqcWfSnBiJ66M48dSMS	\N	\N	\N	2026-08-26 19:48:41.103435	2026-08-28 22:57:53.794451	f	1	t	2026-08-26 19:48:41.103401	Solver User 36	\N	f	en	\N	\N	\N	\N	\N	GMgx7Ff8txUfzZKRGxyL	2026-08-26 19:48:41.104643	2026-08-26 19:48:41.103469	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:53.794297
97	solver_user_37@example.com	$2a$11$uwOhwTvQoDS5eg.rTjz5OOaYXVUZtvwtGEtD4oAsPF/VX0pL4r4Xm	\N	\N	\N	2026-08-26 19:48:41.4944	2026-08-28 22:57:54.294164	f	1	t	2026-08-26 19:48:41.494366	Solver User 37	\N	f	en	\N	\N	\N	\N	\N	zjUBDsPuJCyQ_Hsi6tdn	2026-08-26 19:48:41.495673	2026-08-26 19:48:41.494432	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:54.294028
98	solver_user_38@example.com	$2a$11$hLZIVFQcSe6ry8PnDonmEeeotYyR3KrqjrUlytDxS10JDm4Q91fby	\N	\N	\N	2026-08-26 19:48:41.862229	2026-08-28 22:57:55.034575	f	1	t	2026-08-26 19:48:41.862196	Solver User 38	\N	f	en	\N	\N	\N	\N	\N	58P_duxP8UjDkceJCYLq	2026-08-26 19:48:41.863353	2026-08-26 19:48:41.862262	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:55.034427
99	solver_user_39@example.com	$2a$11$BFdlq6hRXBcewNdKkskOouRwUbcxOPpoWIn.beZSTOczQpNPqv2eG	\N	\N	\N	2026-08-26 19:48:42.239841	2026-08-28 22:57:55.384988	f	1	t	2026-08-26 19:48:42.239808	Solver User 39	\N	f	en	\N	\N	\N	\N	\N	eBziXWBbDzpsjXz_-2C1	2026-08-26 19:48:42.241115	2026-08-26 19:48:42.239873	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:55.384476
100	solver_user_40@example.com	$2a$11$my/wKj8NRVaUndW36ttSXu6Fo2lhRMAO5.Drd6kT0EryulBkuLwyO	\N	\N	\N	2026-08-26 19:48:42.624455	2026-08-28 22:57:55.720235	f	1	t	2026-08-26 19:48:42.624423	Solver User 40	\N	f	en	\N	\N	\N	\N	\N	RgwzcaUQncACkTpxBLm4	2026-08-26 19:48:42.625568	2026-08-26 19:48:42.624486	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:55.720063
101	solver_user_41@example.com	$2a$11$ZtGJVhZBDcu1DD2MJK7Mj.AtD7m/dyk2WTXYePuCEDkYTCm.uyIv2	\N	\N	\N	2026-08-26 19:48:42.9974	2026-08-28 22:57:56.06378	f	1	t	2026-08-26 19:48:42.997364	Solver User 41	\N	f	en	\N	\N	\N	\N	\N	rGemd-g5YYNV5X_pgwcf	2026-08-26 19:48:42.99875	2026-08-26 19:48:42.997432	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:56.063622
102	solver_user_42@example.com	$2a$11$BpYgvjr9E28vQDKXITLgMuyunoCww1XJQPKBvhTVyiTxoZrTNHpZu	\N	\N	\N	2026-08-26 19:48:43.398829	2026-08-28 22:57:56.420706	f	1	t	2026-08-26 19:48:43.398794	Solver User 42	\N	f	en	\N	\N	\N	\N	\N	4SdABSqtkmJZHhRbUcPW	2026-08-26 19:48:43.400026	2026-08-26 19:48:43.398864	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:56.420559
103	solver_user_43@example.com	$2a$11$.z2agwAutkUZAJmgx4n.buTVeBnlV6dGFobCKBVf53Qj0XddbfdD6	\N	\N	\N	2026-08-26 19:48:43.808352	2026-08-28 22:57:56.771566	f	1	t	2026-08-26 19:48:43.808318	Solver User 43	\N	f	en	\N	\N	\N	\N	\N	LsgyCCQFoFJVgLKPWz-9	2026-08-26 19:48:43.809524	2026-08-26 19:48:43.808389	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:56.77138
104	solver_user_44@example.com	$2a$11$BeUxVojOLnr8Wem3RZpJZuP8CvAT9/FZ0Rwalbdx0rtAYXIyHHn0q	\N	\N	\N	2026-08-26 19:48:44.201047	2026-08-28 22:57:57.134902	f	1	t	2026-08-26 19:48:44.201012	Solver User 44	\N	f	en	\N	\N	\N	\N	\N	j3LNQCaMWSWdDfPQsJRa	2026-08-26 19:48:44.202187	2026-08-26 19:48:44.201079	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:57.134743
105	solver_user_45@example.com	$2a$11$5P.VdvyxiRtwR4VGqY6.BehgFcBTbd4rDS.G00BmpMhP0K.20CepO	\N	\N	\N	2026-08-26 19:48:44.607021	2026-08-28 22:57:57.476495	f	1	t	2026-08-26 19:48:44.606974	Solver User 45	\N	f	en	\N	\N	\N	\N	\N	_fsP8-UJQ3WKVLcZQVBs	2026-08-26 19:48:44.609389	2026-08-26 19:48:44.607063	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:57.476365
106	solver_user_46@example.com	$2a$11$5qbqYy6FwOTdS1u29tAsM.IUGrq9DbpPkMiW44g/kK3jWPcaDE7Ru	\N	\N	\N	2026-08-26 19:48:45.005309	2026-08-28 22:57:57.822758	f	1	t	2026-08-26 19:48:45.005266	Solver User 46	\N	f	en	\N	\N	\N	\N	\N	H_KXi1qFgJGADoumLWYw	2026-08-26 19:48:45.006732	2026-08-26 19:48:45.005348	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:57.822591
107	solver_user_47@example.com	$2a$11$cBfP0nInR0Ze.ZIYhCKvxufgp6MgdfBBJVIT6zO.GQb8mkXQV4vtm	\N	\N	\N	2026-08-26 19:48:45.406275	2026-08-28 22:57:58.181378	f	1	t	2026-08-26 19:48:45.406231	Solver User 47	\N	f	en	\N	\N	\N	\N	\N	kh7Svii9Tj_JbDZo974Q	2026-08-26 19:48:45.408029	2026-08-26 19:48:45.406314	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:58.181247
108	solver_user_48@example.com	$2a$11$9pidyKo3wemCxugMWtiIFueUOGlCJMfcgzoHWwH1G7pw2fjEC4OCK	\N	\N	\N	2026-08-26 19:48:45.806639	2026-08-28 22:57:58.523678	f	1	t	2026-08-26 19:48:45.806606	Solver User 48	\N	f	en	\N	\N	\N	\N	\N	75xzmBn4egh4SLCNoztz	2026-08-26 19:48:45.807738	2026-08-26 19:48:45.806669	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:58.523541
109	solver_user_49@example.com	$2a$11$sdvfFHOzIWf1Mz.pZ2iUH.f36I3e9M4UzV/wjiLcO9zNYlIZaqBvy	\N	\N	\N	2026-08-26 19:48:46.186853	2026-08-28 22:57:58.864975	f	1	t	2026-08-26 19:48:46.186819	Solver User 49	\N	f	en	\N	\N	\N	\N	\N	4U48qS_BAQwj5-yWY784	2026-08-26 19:48:46.188038	2026-08-26 19:48:46.186885	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:58.864842
110	solver_user_50@example.com	$2a$11$dk8Sa/WTT4b3iIKO3AcgKORAE6mrz2YDQFU3/OMpY1nOXlpt..28K	\N	\N	\N	2026-08-26 19:48:46.592361	2026-08-28 22:57:59.226143	f	1	t	2026-08-26 19:48:46.592329	Solver User 50	\N	f	en	\N	\N	\N	\N	\N	c99BN5Fs1kfa9WNG7xsE	2026-08-26 19:48:46.593713	2026-08-26 19:48:46.592391	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:59.226007
111	solver_user_51@example.com	$2a$11$nR4pjZgzFuH9nVYAxHjtNuUJhOx6EZ4ORpqOReYpAsmjCSgAel4hK	\N	\N	\N	2026-08-26 19:48:46.960592	2026-08-28 22:57:59.563311	f	1	t	2026-08-26 19:48:46.960561	Solver User 51	\N	f	en	\N	\N	\N	\N	\N	rjz_fqXWBTY36GqjxYpC	2026-08-26 19:48:46.961712	2026-08-26 19:48:46.960624	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:59.563174
112	solver_user_52@example.com	$2a$11$Vog7VHc6y.E.LFaf528Aye8/FtQOaUU1gI1SwDqVblO4WgyKlTEPG	\N	\N	\N	2026-08-26 19:48:47.312663	2026-08-28 22:57:59.895864	f	1	t	2026-08-26 19:48:47.3126	Solver User 52	\N	f	en	\N	\N	\N	\N	\N	Qs4KM8j5uyHRTZrXKwCe	2026-08-26 19:48:47.313762	2026-08-26 19:48:47.312699	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:57:59.895728
113	solver_user_53@example.com	$2a$11$NW78kbQw3FnxrXVA72w3nO7WJDNry.Iick0YSfQ3DMYbBNdGXfSZW	\N	\N	\N	2026-08-26 19:48:47.811715	2026-08-28 22:58:00.275857	f	1	t	2026-08-26 19:48:47.811676	Solver User 53	\N	f	en	\N	\N	\N	\N	\N	xt2Rzwz1sRt-F69g7dbd	2026-08-26 19:48:47.813295	2026-08-26 19:48:47.811762	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:00.275702
114	solver_user_54@example.com	$2a$11$DjLOmzw5JP8ZIe2KdKi2C.IoVGRSn2OyL5noSMTqE2y0Y0px.sRXa	\N	\N	\N	2026-08-26 19:48:48.211566	2026-08-28 22:58:00.656191	f	1	t	2026-08-26 19:48:48.211526	Solver User 54	\N	f	en	\N	\N	\N	\N	\N	t-yPMcoMhNZFjAxmzzDR	2026-08-26 19:48:48.212952	2026-08-26 19:48:48.211604	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:00.656057
115	cohort_user_0@example.com	$2a$11$lBU7yqNHQXsnS0oJ3gTs.uS.lGuGqGNAXutPqGpUD6Mi63N.pJyUG	\N	\N	\N	2026-08-26 19:48:48.755642	2026-08-28 22:58:01.032248	f	1	t	2026-08-26 19:48:48.755606	Cohort User 0	\N	f	en	\N	\N	\N	\N	\N	j3UetLFZjzxFEuRE2tX2	2026-08-26 19:48:48.756968	2026-08-26 19:48:48.755682	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:01.032094
116	cohort_user_1@example.com	$2a$11$Uy57wqOWB1xsufC6dfNXGuQKBsI/PYLokEYlP0PStD9voHC.ja7Ze	\N	\N	\N	2026-08-26 19:48:49.175811	2026-08-28 22:58:01.391871	f	1	t	2026-08-26 19:48:49.17577	Cohort User 1	\N	f	en	\N	\N	\N	\N	\N	R9r1njjsxywm1xhxccQz	2026-08-26 19:48:49.17717	2026-08-26 19:48:49.175855	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:01.391731
117	cohort_user_2@external.org	$2a$11$gtO.ZTdOGvi1MERof6N90umwTUJMzyTK9PueZ0/emwDG4TnNuIyIe	\N	\N	\N	2026-08-26 19:48:49.700036	2026-08-28 22:58:01.745337	f	1	t	2026-08-26 19:48:49.700004	Cohort User 2	\N	f	en	\N	\N	\N	\N	\N	to6rQ-T9sVxTaUdsYeNq	2026-08-26 19:48:49.701212	2026-08-26 19:48:49.700073	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:01.745182
118	cohort_user_3@example.com	$2a$11$5CdmBgCT5W9nP3nLDkG9ZO1E/Hh3Os.DziGf1zW1I/qldF1PCtrYK	\N	\N	\N	2026-08-26 19:48:50.075554	2026-08-28 22:58:02.131473	f	1	t	2026-08-26 19:48:50.075521	Cohort User 3	\N	f	en	\N	\N	\N	\N	\N	yt4PsEyVCLRfiYxhsdC6	2026-08-26 19:48:50.076698	2026-08-26 19:48:50.075587	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:02.131312
119	cohort_user_4@example.com	$2a$11$D5vT9vnu.oWn/uyy4ECi0OVr2V9t.HRX8.30o/lWL.aMVVRADWh6i	\N	\N	\N	2026-08-26 19:48:50.446068	2026-08-28 22:58:02.476162	f	1	t	2026-08-26 19:48:50.44602	Cohort User 4	\N	f	en	\N	\N	\N	\N	\N	6ewyrJBCLbuWLBFyPvzX	2026-08-26 19:48:50.447871	2026-08-26 19:48:50.446125	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:02.476028
120	cohort_user_5@example.com	$2a$11$zVLCuNmHIF9ye9t8hjnSwuYNb8hhl00Zpul43BCOMGM6gQ0GrWI.K	\N	\N	\N	2026-08-26 19:48:50.824304	2026-08-28 22:58:02.807103	f	1	t	2026-08-26 19:48:50.824272	Cohort User 5	\N	f	en	\N	\N	\N	\N	\N	GZu-n7fZx2LhpvvGfNFy	2026-08-26 19:48:50.82547	2026-08-26 19:48:50.824337	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:02.806953
121	cohort_user_6@example.com	$2a$11$2kbgaE/BhsmA8LSBuaN7tuEwGVv2lg1IwjhNcSHIJHSqKOJXzuTgG	\N	\N	\N	2026-08-26 19:48:51.182835	2026-08-28 22:58:03.187556	f	1	t	2026-08-26 19:48:51.182802	Cohort User 6	\N	f	en	\N	\N	\N	\N	\N	paSc_kzjdfbU1zYSeBQK	2026-08-26 19:48:51.184103	2026-08-26 19:48:51.182868	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:03.187405
122	cohort_user_7@external.org	$2a$11$.rEfL81oDQ6Q0.GfQGvbk.PV7rQad8oisqcX6W4fT88Tii7qLBn5m	\N	\N	\N	2026-08-26 19:48:51.551795	2026-08-28 22:58:03.543205	f	1	t	2026-08-26 19:48:51.551759	Cohort User 7	\N	f	en	\N	\N	\N	\N	\N	w9W3jau374jKdeZiK1ZG	2026-08-26 19:48:51.553365	2026-08-26 19:48:51.55183	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:03.543067
123	cohort_user_8@example.com	$2a$11$pDiDzI0UsMXcCuGYjI0atuc0QejaLWhdpjEPiQBTKrCpbqp9SYMDy	\N	\N	\N	2026-08-26 19:48:51.925838	2026-08-28 22:58:03.909217	f	1	t	2026-08-26 19:48:51.9258	Cohort User 8	\N	f	en	\N	\N	\N	\N	\N	4SZtGvswQ6M_quzyMyAv	2026-08-26 19:48:51.926992	2026-08-26 19:48:51.92589	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:03.906896
124	cohort_user_9@example.com	$2a$11$Iu1jjIQaUH47B18DlHi/UudSsrFuG0.xBLBMo92Kl6v0cs1NnHTpW	\N	\N	\N	2026-08-26 19:48:52.285548	2026-08-28 22:58:04.28236	f	1	t	2026-08-26 19:48:52.285512	Cohort User 9	\N	f	en	\N	\N	\N	\N	\N	GGkyPQ22ZpHQRyFUoryR	2026-08-26 19:48:52.286663	2026-08-26 19:48:52.285583	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:04.282226
125	cohort_user_10@example.com	$2a$11$nH3iKLcN6GlE2457xyBWQON207Hm08Keea9T7bJ57KtPtXR83JYFK	\N	\N	\N	2026-08-26 19:48:52.669263	2026-08-28 22:58:04.629418	f	1	t	2026-08-26 19:48:52.669227	Cohort User 10	\N	f	en	\N	\N	\N	\N	\N	zeVbBshoqnCktL3s-FjK	2026-08-26 19:48:52.670942	2026-08-26 19:48:52.6693	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:04.629299
126	cohort_user_11@example.com	$2a$11$Qyu23DgB0KIEavGYdku/weVSd9s67b7N4b4jbzwJt26o/.h4tKqVa	\N	\N	\N	2026-08-26 19:48:53.043884	2026-08-28 22:58:04.986013	f	1	t	2026-08-26 19:48:53.04385	Cohort User 11	\N	f	en	\N	\N	\N	\N	\N	kRpLovZPbThYvsyKiemL	2026-08-26 19:48:53.045114	2026-08-26 19:48:53.043918	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:04.985743
127	cohort_user_12@example.com	$2a$11$ttVoRPUrNLegub7ASM46FurmacqDcUSc/1axPfx.BjIvxiUCAMW1m	\N	\N	\N	2026-08-26 19:48:53.450104	2026-08-28 22:58:05.351461	f	1	t	2026-08-26 19:48:53.450067	Cohort User 12	\N	f	en	\N	\N	\N	\N	\N	q3PsXGgL_9yA2p39tuY5	2026-08-26 19:48:53.451405	2026-08-26 19:48:53.450139	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:05.351338
128	cohort_user_13@example.com	$2a$11$eH3zPxfTDQxfWaQ7Bu1hzeJkNyODoxcoIOAbrmhMyEi.Dc7phrggK	\N	\N	\N	2026-08-26 19:48:53.819468	2026-08-28 22:58:05.70146	f	1	t	2026-08-26 19:48:53.819433	Cohort User 13	\N	f	en	\N	\N	\N	\N	\N	rzJfDntCXkNV9iyGoHy2	2026-08-26 19:48:53.820657	2026-08-26 19:48:53.819504	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:05.701226
129	cohort_user_14@external.org	$2a$11$o.0AjX2l9Y1C1eq0sOQE1u.gG0yfm2DrPCRXnqVKD1KiifbfXpQIa	\N	\N	\N	2026-08-26 19:48:54.196646	2026-08-28 22:58:06.082432	f	1	t	2026-08-26 19:48:54.196561	Cohort User 14	\N	f	en	\N	\N	\N	\N	\N	AjvBDdbcy5NKN_UePjHz	2026-08-26 19:48:54.20294	2026-08-26 19:48:54.196691	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:06.082312
130	cohort_user_15@example.com	$2a$11$mIuSvXoSO.rE79GCjU1HfO83WGfyS1tw/bpaa9pD5lrtYV1V67VhS	\N	\N	\N	2026-08-26 19:48:54.564805	2026-08-28 22:58:06.462221	f	1	t	2026-08-26 19:48:54.564772	Cohort User 15	\N	f	en	\N	\N	\N	\N	\N	R6JrFtnHe85z4xvwxEmQ	2026-08-26 19:48:54.566206	2026-08-26 19:48:54.564836	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:06.4621
131	cohort_user_16@example.com	$2a$11$2p.C16DuwwjrX16SyiKSZ.bTegMDPY9W4uZbxlN/p964LYHvUvUnO	\N	\N	\N	2026-08-26 19:48:54.925797	2026-08-28 22:58:06.820493	f	1	t	2026-08-26 19:48:54.925754	Cohort User 16	\N	f	en	\N	\N	\N	\N	\N	ibXeHe8fz8qY5cw1rug8	2026-08-26 19:48:54.927107	2026-08-26 19:48:54.925837	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:06.820367
132	cohort_user_17@example.com	$2a$11$Lbtn.UkUnpjLjos1RHF2uO1oSNiJY3JMAY6R8t4fTfAKeM2g1w8ci	\N	\N	\N	2026-08-26 19:48:55.281257	2026-08-28 22:58:07.202225	f	1	t	2026-08-26 19:48:55.281223	Cohort User 17	\N	f	en	\N	\N	\N	\N	\N	KVzmciyv6zzjUByRXT_8	2026-08-26 19:48:55.282375	2026-08-26 19:48:55.281289	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:07.202093
133	cohort_user_18@example.com	$2a$11$TSj77RELJiqTv.x36t6RcuLkk5EOHQ5iXbQd2TbJfyXTPpXMP3eaS	\N	\N	\N	2026-08-26 19:48:55.648568	2026-08-28 22:58:07.559187	f	1	t	2026-08-26 19:48:55.648291	Cohort User 18	\N	f	en	\N	\N	\N	\N	\N	CBiWfjxrzo1x7FGnwB9x	2026-08-26 19:48:55.653411	2026-08-26 19:48:55.650069	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:07.559031
134	cohort_user_19@external.org	$2a$11$qQwsketttTUmUOjORFgu1uHbeY1dSWzuuQ.xyhyK0cc6dVre2rbXO	\N	\N	\N	2026-08-26 19:48:56.170754	2026-08-28 22:58:07.920351	f	1	t	2026-08-26 19:48:56.170721	Cohort User 19	\N	f	en	\N	\N	\N	\N	\N	Rag3NoM6eTCnp4oxTP5E	2026-08-26 19:48:56.171848	2026-08-26 19:48:56.170783	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:07.920221
135	cohort_user_20@example.com	$2a$11$waP/sNsKm0ODoGvtHsk6F.Sj1DImSgoWBSm1NSMQK39GiBVgJB6n.	\N	\N	\N	2026-08-26 19:48:56.550042	2026-08-28 22:58:08.28322	f	1	t	2026-08-26 19:48:56.549988	Cohort User 20	\N	f	en	\N	\N	\N	\N	\N	4TL5D2MFdFyG8rdxasDm	2026-08-26 19:48:56.55129	2026-08-26 19:48:56.550072	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:08.283087
136	cohort_user_21@example.com	$2a$11$ihCl8kAvyy1bHvlEFFBP4uP2CH.E6pRBq7A6ASy7cdRURctfh3KIq	\N	\N	\N	2026-08-26 19:48:56.91773	2026-08-28 22:58:08.679707	f	1	t	2026-08-26 19:48:56.917701	Cohort User 21	\N	f	en	\N	\N	\N	\N	\N	ozVYL9_Js8inTJawSfmi	2026-08-26 19:48:56.918837	2026-08-26 19:48:56.917755	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:08.679573
137	cohort_user_22@example.com	$2a$11$pPVFW4RzPnEJ4V0olxyjW.jlWD4Ud6Yw2LwahIEow4MTaAzAijhEq	\N	\N	\N	2026-08-26 19:48:57.283039	2026-08-28 22:58:09.040285	f	1	t	2026-08-26 19:48:57.28301	Cohort User 22	\N	f	en	\N	\N	\N	\N	\N	E8x7kHQyNyMtmSD-kCkQ	2026-08-26 19:48:57.284122	2026-08-26 19:48:57.283064	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:09.040152
138	cohort_user_23@example.com	$2a$11$Gt7CYuS0T60UUe6kp.6bZO/UzE1Vn86a7izZzIed0gOYxJXxdcZym	\N	\N	\N	2026-08-26 19:48:57.755354	2026-08-28 22:58:09.403387	f	1	t	2026-08-26 19:48:57.755324	Cohort User 23	\N	f	en	\N	\N	\N	\N	\N	9aue6B7v-sfGL9rgUjiC	2026-08-26 19:48:57.756508	2026-08-26 19:48:57.755381	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:09.403263
139	cohort_user_24@example.com	$2a$11$r2SU29nFEstju7dhOcAZh.lg09N7u9QYhE2rkrIqylWgowSfZYIW2	\N	\N	\N	2026-08-26 19:48:58.112259	2026-08-28 22:58:09.739846	f	1	t	2026-08-26 19:48:58.11223	Cohort User 24	\N	f	en	\N	\N	\N	\N	\N	4UWBWAyNppxa4uNSCoJ2	2026-08-26 19:48:58.113342	2026-08-26 19:48:58.112284	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:09.739727
140	cohort_user_25@example.com	$2a$11$VFA6Om9b6J7kGv45nxY.0.Ume1zML5MmNQcZaYPNXZDYJmleeOurC	\N	\N	\N	2026-08-26 19:48:58.48861	2026-08-28 22:58:10.088827	f	1	t	2026-08-26 19:48:58.488564	Cohort User 25	\N	f	en	\N	\N	\N	\N	\N	BWE3ZVN7v-DRZhxUT3rP	2026-08-26 19:48:58.489847	2026-08-26 19:48:58.488661	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:10.088697
141	cohort_user_26@example.com	$2a$11$QKp9wECZ1YLp9uawST5KSehQEUfWIUUcbjMrlRb43hsNlObbbtqFG	\N	\N	\N	2026-08-26 19:48:58.86665	2026-08-28 22:58:10.436837	f	1	t	2026-08-26 19:48:58.866616	Cohort User 26	\N	f	en	\N	\N	\N	\N	\N	hhSyiB9XjcCPLhgo1emf	2026-08-26 19:48:58.867768	2026-08-26 19:48:58.866679	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:10.436711
142	cohort_user_27@example.com	$2a$11$p5FM0smvoVl4WmoIRpXj3ecKeYQuMnxxdjmwq3QenQL8eGI45gnlS	\N	\N	\N	2026-08-26 19:48:59.220201	2026-08-28 22:58:10.764283	f	1	t	2026-08-26 19:48:59.220172	Cohort User 27	\N	f	en	\N	\N	\N	\N	\N	eHvGSqq1iDnsN6xf9fZV	2026-08-26 19:48:59.221268	2026-08-26 19:48:59.220226	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:10.764154
143	cohort_user_28@example.com	$2a$11$e8.sdpB5w1tgZ6IFpOIPeuKnithuNuEcGmMU.Qawoq4CXSezuyfjK	\N	\N	\N	2026-08-26 19:48:59.675657	2026-08-28 22:58:11.120429	f	1	t	2026-08-26 19:48:59.675625	Cohort User 28	\N	f	en	\N	\N	\N	\N	\N	xLuR8pjmcwDR_U96EwYJ	2026-08-26 19:48:59.676756	2026-08-26 19:48:59.675682	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:11.120283
144	cohort_user_29@example.com	$2a$11$Q4sYE7Hh9CbdbteW2b/sgeo9tfkD0mA69wyGIi83VmXY9Zt57umxO	\N	\N	\N	2026-08-26 19:49:00.015238	2026-08-28 22:58:11.462801	f	1	t	2026-08-26 19:49:00.015207	Cohort User 29	\N	f	en	\N	\N	\N	\N	\N	eyyi-QAu34Tq-hJv_vDy	2026-08-26 19:49:00.016388	2026-08-26 19:49:00.015262	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:11.462669
145	cohort_user_30@example.com	$2a$11$0RtfSIJtJfMuevKQuMCFGOBKdbHJVfHAiv1uo/J1FhutXMLD4vjyy	\N	\N	\N	2026-08-26 19:49:00.384646	2026-08-28 22:58:11.790892	f	1	t	2026-08-26 19:49:00.384606	Cohort User 30	\N	f	en	\N	\N	\N	\N	\N	65S82T-fSf9dsPrGx24R	2026-08-26 19:49:00.385704	2026-08-26 19:49:00.384673	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:11.790767
146	cohort_user_31@example.com	$2a$11$tSUIocRs/FHxguQMDrO5WeIg5UoiI44.p4HHrvleyoPCxxrLkJkKy	\N	\N	\N	2026-08-26 19:49:00.739188	2026-08-28 22:58:12.154782	f	1	t	2026-08-26 19:49:00.739157	Cohort User 31	\N	f	en	\N	\N	\N	\N	\N	3_-9VNCz3p8_2etYShF6	2026-08-26 19:49:00.740323	2026-08-26 19:49:00.739214	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:12.154652
147	cohort_user_32@example.com	$2a$11$0N2KIHQGF9Zb8HJ4YNbjD.vPtp35LuLJ5Wxcst1991zM3gW1cFMCy	\N	\N	\N	2026-08-26 19:49:01.083851	2026-08-28 22:58:12.505135	f	1	t	2026-08-26 19:49:01.08381	Cohort User 32	\N	f	en	\N	\N	\N	\N	\N	jX-8gCfsTgS4xaq1EnWe	2026-08-26 19:49:01.085034	2026-08-26 19:49:01.083881	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:12.505007
148	cohort_user_33@external.org	$2a$11$QZx9NCr9ufWfCqWQMbEcBuen3/YIkou1BMrXVs8eW5e.bfDBymS5C	\N	\N	\N	2026-08-26 19:49:01.548803	2026-08-28 22:58:12.858954	f	1	t	2026-08-26 19:49:01.548772	Cohort User 33	\N	f	en	\N	\N	\N	\N	\N	3kW6sdsEK4ykXyM5hjzz	2026-08-26 19:49:01.54993	2026-08-26 19:49:01.548828	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:12.858834
149	cohort_user_34@example.com	$2a$11$aS57.HPXDZ0ZWiTzw85a7ew9Nm0H1buYK7EgfqVCw1UPJcI1tcZqW	\N	\N	\N	2026-08-26 19:49:01.913335	2026-08-28 22:58:13.211444	f	1	t	2026-08-26 19:49:01.913305	Cohort User 34	\N	f	en	\N	\N	\N	\N	\N	1LUwbuoX8mDvyss7dWbC	2026-08-26 19:49:01.914648	2026-08-26 19:49:01.913361	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:13.211323
150	cohort_user_35@example.com	$2a$11$IfWNIgfVt.d2zxRPLij1HOZ8CcZBiYG8HdSEbtdoBVsYE9H.ba24K	\N	\N	\N	2026-08-26 19:49:02.26714	2026-08-28 22:58:13.551724	f	1	t	2026-08-26 19:49:02.267109	Cohort User 35	\N	f	en	\N	\N	\N	\N	\N	g_9z4wSRZsmmq9eFgqA6	2026-08-26 19:49:02.268167	2026-08-26 19:49:02.267167	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:13.551599
151	cohort_user_36@example.com	$2a$11$1t0y40por5zqy1MgEdcxu.Tp9MmfAgXj/H3cJNgxRrCOJkFrr/9ty	\N	\N	\N	2026-08-26 19:49:02.608377	2026-08-28 22:58:13.90927	f	1	t	2026-08-26 19:49:02.608347	Cohort User 36	\N	f	en	\N	\N	\N	\N	\N	Um2gVT4Cbs26Th8yCxH9	2026-08-26 19:49:02.609496	2026-08-26 19:49:02.608401	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:13.909146
152	cohort_user_37@example.com	$2a$11$AKB2dUt.uWZqeQLuh3lC7eY35894s0sF3uTmDBhDgv322p46xa7xe	\N	\N	\N	2026-08-26 19:49:02.977824	2026-08-28 22:58:14.250968	f	1	t	2026-08-26 19:49:02.977792	Cohort User 37	\N	f	en	\N	\N	\N	\N	\N	-mXksvwMbJ1qFPHAG3mm	2026-08-26 19:49:02.979036	2026-08-26 19:49:02.977851	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:14.250843
153	cohort_user_38@example.com	$2a$11$TJtPf0i24KZ5AkZf7eGtVeo3j9dS6T12suloqN2WBCrTZMNDK3xja	\N	\N	\N	2026-08-26 19:49:03.440905	2026-08-28 22:58:14.59157	f	1	t	2026-08-26 19:49:03.440871	Cohort User 38	\N	f	en	\N	\N	\N	\N	\N	qaq6jWuy5tsxmC11yn3c	2026-08-26 19:49:03.442302	2026-08-26 19:49:03.440938	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:14.591441
154	cohort_user_39@example.com	$2a$11$i0O.8CrcotQ6kHU5JwYcbuLZPyovslVWeV2rS9hsfdxt/0RT2ND3S	\N	\N	\N	2026-08-26 19:49:03.787501	2026-08-28 22:58:14.945987	f	1	t	2026-08-26 19:49:03.787467	Cohort User 39	\N	f	en	\N	\N	\N	\N	\N	mt_KYekbyJ696TvTPEmb	2026-08-26 19:49:03.7887	2026-08-26 19:49:03.78753	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:14.94584
155	cohort_user_40@example.com	$2a$11$aS027YkNo59n1ui8/APmz.3eRFUtFuf9DJEBpExSdywB0ktTaQ4hi	\N	\N	\N	2026-08-26 19:49:04.16075	2026-08-28 22:58:15.294036	f	1	t	2026-08-26 19:49:04.160706	Cohort User 40	\N	f	en	\N	\N	\N	\N	\N	8h-FsYgyrcLau9xPtyo7	2026-08-26 19:49:04.161955	2026-08-26 19:49:04.16078	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:15.293915
156	cohort_user_41@example.com	$2a$11$mM96/EfcaWCW5ZycMNMZ/eXTDCsiVarLCR6/fyhaHBF82lUEdiUIe	\N	\N	\N	2026-08-26 19:49:04.507082	2026-08-28 22:58:15.634583	f	1	t	2026-08-26 19:49:04.507051	Cohort User 41	\N	f	en	\N	\N	\N	\N	\N	Q9R8EYhzB8PWxNPZFg1E	2026-08-26 19:49:04.508189	2026-08-26 19:49:04.507108	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:15.634404
157	cohort_user_42@example.com	$2a$11$sm/ogr/BMROpuQP4IxyHmeHCy46lilpD93e/sTX8jmsrlGUWvuWjO	\N	\N	\N	2026-08-26 19:49:04.883203	2026-08-28 22:58:15.999594	f	1	t	2026-08-26 19:49:04.883173	Cohort User 42	\N	f	en	\N	\N	\N	\N	\N	NjrQq27HC6Pcr_VNCpzn	2026-08-26 19:49:04.884332	2026-08-26 19:49:04.883229	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:15.999474
158	cohort_user_43@example.com	$2a$11$OMQwGDHWV91dfUdnvrJltuX14rUGclGcFSe3LdU9NVrVjZ2uRbina	\N	\N	\N	2026-08-26 19:49:05.255865	2026-08-28 22:58:16.34924	f	1	t	2026-08-26 19:49:05.255832	Cohort User 43	\N	f	en	\N	\N	\N	\N	\N	dP6McyFDah5hp9ta3HtH	2026-08-26 19:49:05.257029	2026-08-26 19:49:05.255891	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:16.349115
159	cohort_user_44@example.com	$2a$11$97ULrFouUJNOkruhM3fOtO7T6o9oNZZd5pUl5xj6kNGFD1cxSrp36	\N	\N	\N	2026-08-26 19:49:05.617487	2026-08-28 22:58:16.704015	f	1	t	2026-08-26 19:49:05.617453	Cohort User 44	\N	f	en	\N	\N	\N	\N	\N	_VvbRQggzJ6n95tzWFJU	2026-08-26 19:49:05.618679	2026-08-26 19:49:05.617515	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:16.703895
160	cohort_user_45@example.com	$2a$11$ueocjkCptt4Pk/3qmqJqmuG3R4rfwS1TkPw6MRzWZF11UDHj.C01y	\N	\N	\N	2026-08-26 19:49:05.98615	2026-08-28 22:58:17.062016	f	1	t	2026-08-26 19:49:05.98612	Cohort User 45	\N	f	en	\N	\N	\N	\N	\N	hfT7ustuQKaLacDDsH6c	2026-08-26 19:49:05.98719	2026-08-26 19:49:05.986176	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:17.061894
161	cohort_user_46@example.com	$2a$11$B8w4QB3bYTiqodORa9I48.fciUOC.iVUNtUEzWHxrhzGqCZAh.qV6	\N	\N	\N	2026-08-26 19:49:06.356013	2026-08-28 22:58:17.401128	f	1	t	2026-08-26 19:49:06.355975	Cohort User 46	\N	f	en	\N	\N	\N	\N	\N	GB1-d4hZxw4k8Fb-Qr1d	2026-08-26 19:49:06.357409	2026-08-26 19:49:06.356042	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:17.401002
162	seminar_student_0@mampf.edu	$2a$11$NZB8Xo6GDWO9m/5B17F0MOSbhnTSVMSYV2xw83YUTvK6Pg4kx6wCm	\N	\N	\N	2026-08-26 19:49:06.839909	2026-08-28 22:58:17.762508	f	1	t	2026-08-26 19:49:06.839877	Seminar Student 0	\N	f	en	\N	\N	\N	\N	\N	KSsj9UMqzyMY65zT9FpG	2026-08-26 19:49:06.841306	2026-08-26 19:49:06.839934	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:17.762372
163	seminar_student_1@mampf.edu	$2a$11$9MKwcbb2.fCc93OdqW7yFOGntZuEN79Xfjzpm4VHxSX.sW.YzNdKa	\N	\N	\N	2026-08-26 19:49:07.212604	2026-08-28 22:58:18.105198	f	1	t	2026-08-26 19:49:07.212564	Seminar Student 1	\N	f	en	\N	\N	\N	\N	\N	SyMT1aHfsCLPKXea-oTe	2026-08-26 19:49:07.213909	2026-08-26 19:49:07.212675	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:18.105067
164	seminar_student_2@mampf.edu	$2a$11$dfdh4BBEVZukVClkiBjPAezGHwd9He36cM97xCsQQy09KMoN4/rEK	\N	\N	\N	2026-08-26 19:49:07.608118	2026-08-28 22:58:18.444486	f	1	t	2026-08-26 19:49:07.608085	Seminar Student 2	\N	f	en	\N	\N	\N	\N	\N	zQotxxfLNCf74HU3ioTw	2026-08-26 19:49:07.609509	2026-08-26 19:49:07.608148	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:18.44434
165	seminar_student_3@mampf.edu	$2a$11$kElbFj8sa2XWGDYYqAL1be29sIiSRWTlHKXM4YDHApv6tTluTgoK6	\N	\N	\N	2026-08-26 19:49:07.986028	2026-08-28 22:58:18.801861	f	1	t	2026-08-26 19:49:07.985997	Seminar Student 3	\N	f	en	\N	\N	\N	\N	\N	zeiFd1DsRN9zeLwVxBHM	2026-08-26 19:49:07.987127	2026-08-26 19:49:07.986054	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:18.801741
166	seminar_student_4@mampf.edu	$2a$11$.6CisIpOo52NJwUwMmu7rOS15g1GxQvgqccjCnefo5eGoIR3oUPUa	\N	\N	\N	2026-08-26 19:49:08.348105	2026-08-28 22:58:19.145444	f	1	t	2026-08-26 19:49:08.348073	Seminar Student 4	\N	f	en	\N	\N	\N	\N	\N	1PUZgsTMGH7LAwa9jxud	2026-08-26 19:49:08.349249	2026-08-26 19:49:08.348131	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:19.145318
167	seminar_student_5@mampf.edu	$2a$11$31cgSfHRl36GfEU0VAUwo.Mxm0rn9ogcMBhFS/jk8qKSsIyTQa87W	\N	\N	\N	2026-08-26 19:49:08.725561	2026-08-28 22:58:19.475741	f	1	t	2026-08-26 19:49:08.725523	Seminar Student 5	\N	f	en	\N	\N	\N	\N	\N	Q184oVSzs13EFzrX9gXv	2026-08-26 19:49:08.72684	2026-08-26 19:49:08.725599	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:19.475622
168	seminar_student_6@mampf.edu	$2a$11$eUTBcS7p/ByEB3CxcSfpke1CQnTSKPD/A1ABqGV7SFJ.xdsCMi6kW	\N	\N	\N	2026-08-26 19:49:09.105464	2026-08-28 22:58:19.83314	f	1	t	2026-08-26 19:49:09.105434	Seminar Student 6	\N	f	en	\N	\N	\N	\N	\N	4FV6TXM7f__xECh7p3U-	2026-08-26 19:49:09.106678	2026-08-26 19:49:09.105488	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:19.83301
169	seminar_student_7@mampf.edu	$2a$11$Es97PvZDRTEn7K6TRSZpC.8dboSO5BHFZe/iKWDKY/hapwVNA9RrS	\N	\N	\N	2026-08-26 19:49:09.484028	2026-08-28 22:58:20.171864	f	1	t	2026-08-26 19:49:09.483998	Seminar Student 7	\N	f	en	\N	\N	\N	\N	\N	Dc4bhCzEZe6NFC2W2Mwk	2026-08-26 19:49:09.485255	2026-08-26 19:49:09.484053	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:20.171739
170	seminar_student_8@mampf.edu	$2a$11$PIP8S21bO5cli4QY2b2VK.HsKF05BQPsrE2w5a8DE6aoMb.SXmqtG	\N	\N	\N	2026-08-26 19:49:09.860674	2026-08-28 22:58:20.527081	f	1	t	2026-08-26 19:49:09.860606	Seminar Student 8	\N	f	en	\N	\N	\N	\N	\N	WG6N7YytstRYrgzqyRhf	2026-08-26 19:49:09.861738	2026-08-26 19:49:09.860699	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:20.526952
171	seminar_student_9@mampf.edu	$2a$11$IFAu6VZKTXFTkvtQ5hgDpuzB/VRVoYyObegFfX82CNTt2nGrmHMMi	\N	\N	\N	2026-08-26 19:49:10.233142	2026-08-28 22:58:20.880155	f	1	t	2026-08-26 19:49:10.233108	Seminar Student 9	\N	f	en	\N	\N	\N	\N	\N	pWY22vUGS2rYNF6wj5ZM	2026-08-26 19:49:10.234386	2026-08-26 19:49:10.233168	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:20.880017
172	seminar_student_10@mampf.edu	$2a$11$Uz69SAuCs6k0Cn5TWokyLe2wnrgNOHjZLTyrkIZguwMPmnv1rCjjW	\N	\N	\N	2026-08-26 19:49:10.645526	2026-08-28 22:58:21.220416	f	1	t	2026-08-26 19:49:10.645495	Seminar Student 10	\N	f	en	\N	\N	\N	\N	\N	gFxKngprgPxr9DJaSY5y	2026-08-26 19:49:10.64709	2026-08-26 19:49:10.645551	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:21.220276
173	seminar_student_11@mampf.edu	$2a$11$qtQOk.9IvJbpJ/TLy12A/.y0uBIJ88TybtvCpAVxpH3UClTbbDpBS	\N	\N	\N	2026-08-26 19:49:11.017304	2026-08-28 22:58:21.575643	f	1	t	2026-08-26 19:49:11.017275	Seminar Student 11	\N	f	en	\N	\N	\N	\N	\N	wjqB6MJofAVoHyK3AtXc	2026-08-26 19:49:11.018421	2026-08-26 19:49:11.017329	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:21.57552
174	external_student_0@mampf.edu	$2a$11$vSAzYIj92Og/g3crsfr3GedxrvZ8ZSnbUT459933j0ClD/D07WHOe	\N	\N	\N	2026-08-26 19:49:11.542474	2026-08-28 22:58:21.914924	f	1	t	2026-08-26 19:49:11.542442	External Student 0	\N	f	en	\N	\N	\N	\N	\N	_w8WH3rayxMdNVp7Atox	2026-08-26 19:49:11.543709	2026-08-26 19:49:11.542503	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:21.914781
175	external_student_1@mampf.edu	$2a$11$gg6/GvEa8.QLUGt4gYV80.SERr6Ia0Xw.WlaVsHc9He8O/Z5P2lfW	\N	\N	\N	2026-08-26 19:49:11.944519	2026-08-28 22:58:22.25705	f	1	t	2026-08-26 19:49:11.944487	External Student 1	\N	f	en	\N	\N	\N	\N	\N	Jp1yo7is46LfnAUXxhkb	2026-08-26 19:49:11.945618	2026-08-26 19:49:11.944545	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:22.256912
176	nachruecker_0@mampf.edu	$2a$11$UJzVEGeb4sH4C.dKl6.3MOqqqd2sQwiVkBb5qQcOq/rFvHhFAM5Ja	\N	\N	\N	2026-08-26 19:49:12.343176	2026-08-28 22:58:22.62217	f	1	t	2026-08-26 19:49:12.343135	Nachrücker 0	\N	f	en	\N	\N	\N	\N	\N	nqYxEXM2uMsQ9LyNtRxx	2026-08-26 19:49:12.344483	2026-08-26 19:49:12.343209	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:22.622036
177	nachruecker_1@mampf.edu	$2a$11$ZvkkrIyrH1rczcHuj3q/.ORfNSLXyPlHZJfYWDew/I712nKCG96jO	\N	\N	\N	2026-08-26 19:49:12.755363	2026-08-28 22:58:22.970858	f	1	t	2026-08-26 19:49:12.755322	Nachrücker 1	\N	f	en	\N	\N	\N	\N	\N	pDFvxa6eas-y_ucSRkKJ	2026-08-26 19:49:12.756598	2026-08-26 19:49:12.755394	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:22.970735
178	nachruecker_2@mampf.edu	$2a$11$nipTnVHPRkYAJ6.JYzHsGOtrxmtoxagW.0I6TwKF9pGhXUqQsLoXe	\N	\N	\N	2026-08-26 19:49:13.135653	2026-08-28 22:58:23.299633	f	1	t	2026-08-26 19:49:13.135618	Nachrücker 2	\N	f	en	\N	\N	\N	\N	\N	RXJHqLj7_SP2CTa3Utko	2026-08-26 19:49:13.136942	2026-08-26 19:49:13.135682	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:23.299514
179	nachruecker_3@mampf.edu	$2a$11$prWeUyi9Xtk6iS1xXPoRE.vyU4P4F3kZWuTRICqyvcrfyi7c/Q9Ru	\N	\N	\N	2026-08-26 19:49:13.511281	2026-08-28 22:58:23.658274	f	1	t	2026-08-26 19:49:13.51125	Nachrücker 3	\N	f	en	\N	\N	\N	\N	\N	jH5bXcQ2e5J6AvTtoob8	2026-08-26 19:49:13.512424	2026-08-26 19:49:13.511308	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:23.658137
180	nachruecker_4@mampf.edu	$2a$11$pvHMwH.u1E/moopw.5oS..GvHnCBaXPakxB4wSYYS9cmweY1MNlqe	\N	\N	\N	2026-08-26 19:49:13.888892	2026-08-28 22:58:24.03638	f	1	t	2026-08-26 19:49:13.888852	Nachrücker 4	\N	f	en	\N	\N	\N	\N	\N	WSL3UBqzMp_csTxe6wxF	2026-08-26 19:49:13.890224	2026-08-26 19:49:13.888922	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:24.036243
181	yahaira.glover@skiles-skiles.test	$2a$11$8aJUfwhMNIx7IeIOUwKpNeYv5n3EifAoqu677JKVgWnPC5JJyh9WC	\N	\N	\N	2026-08-26 19:49:14.359724	2026-08-28 22:58:24.382247	f	1	t	2026-08-26 19:49:14.359692	Valerie von Eifert	\N	f	en	\N	\N	\N	\N	\N	kAtuqafkxsS_RrajR4LQ	2026-08-26 19:49:14.361743	2026-08-26 19:49:14.359751	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:24.38212
182	adena_von@ziemann.test	$2a$11$K6DARStBGGTpc0brgvnW5uPHQRE7ozHliz7IGaiCWfNKPtprFEdB.	\N	\N	\N	2026-08-26 19:49:14.81331	2026-08-28 22:58:24.907542	f	1	t	2026-08-26 19:49:14.813278	Mathis Steinert	\N	f	en	\N	\N	\N	\N	\N	KDCxbQqTxtunzX2iBPVU	2026-08-26 19:49:14.815229	2026-08-26 19:49:14.813339	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:24.90742
183	alexis_bayer@mcclure.test	$2a$11$1nh.FpBbUksaCXz9H6A6munv4Dkx4sYhNVq4gxWD9gzU3xO9/PVQa	\N	\N	\N	2026-08-26 19:49:15.258682	2026-08-28 22:58:25.648037	f	1	t	2026-08-26 19:49:15.258648	Hr. Sönke Weigel	\N	f	en	\N	\N	\N	\N	\N	GupsnKZS2GKszd_yQQyU	2026-08-26 19:49:15.260875	2026-08-26 19:49:15.258712	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:25.647915
184	tutor2@mampf.edu	$2a$11$Dw94GreXiWiMKE247I51fOTTSOQ1vbRdRK1AXKHn0k6qwSS4Qh5rW	\N	\N	\N	2026-08-28 15:08:33.470488	2026-08-28 22:58:26.00596	f	1	t	2026-08-28 15:08:33.469896	Toni Tutor	\N	f	en	\N	\N	\N	\N	\N	D3jhzk9hwaoqu6bfGdSo	2026-08-28 15:08:33.475336	2026-08-28 15:08:33.470927	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 22:58:26.005837
9	student5@mampf.edu	$2a$11$xr4RkA1zsd2HnDMSnQUlP.63BWWprQDm5rC2WjkvX7s6Z.zIpIYAG	\N	\N	\N	2020-11-28 16:30:12.956799	2026-08-28 22:57:23.521721	f	1	t	2020-11-28 16:30:12.958778	student5	\N	f	en	f	f	f	t	\N	eWAAGQqtUt9P31_dpHey	2020-11-28 16:30:18.870235	2020-11-28 16:30:12.956859	\N	t	t	t	t	t	t	t	Erika Musterfrau	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	0	\N
12	moded@mampf.edu	$2a$11$RKFHHQUV1RpEmAuHn4Q2keW30dfj0AlZz0T5HCf/YJtUlsEjlML4S	\N	\N	\N	2022-08-05 13:13:27.138526	2026-08-28 22:57:24.788736	f	1	t	2022-08-05 13:13:27.140572	moded	\N	f	en	f	f	f	f	\N	GEw-LMkj1zw73bsu-Jy5	2022-08-05 13:13:35.913881	2022-08-05 13:13:27.138906	\N	f	f	f	f	f	f	f		\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	0	\N
\.


--
-- TOC entry 4929 (class 0 OID 10133074)
-- Dependencies: 393
-- Data for Name: vignettes_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_answers (id, type, vignettes_question_id, vignettes_slide_id, vignettes_user_answer_id, text, likert_scale_value, created_at, updated_at) FROM stdin;
8	Vignettes::TextAnswer	4	4	4	Schlangenlemma	\N	2025-07-14 15:12:42.170271	2025-07-14 15:12:42.170271
9	Vignettes::MultipleChoiceAnswer	5	5	4	\N	\N	2025-07-14 15:13:10.788364	2025-07-14 15:13:10.788364
10	Vignettes::LikertScaleAnswer	6	6	4	\N	disagree	2025-07-14 15:13:15.60867	2025-07-14 15:13:15.60867
\.


--
-- TOC entry 4931 (class 0 OID 10133086)
-- Dependencies: 395
-- Data for Name: vignettes_answers_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_answers_options (vignettes_answer_id, vignettes_option_id) FROM stdin;
9	7
\.


--
-- TOC entry 4932 (class 0 OID 10133091)
-- Dependencies: 396
-- Data for Name: vignettes_codenames; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_codenames (id, pseudonym, user_id, lecture_id, created_at, updated_at) FROM stdin;
1	HZUS57	5	28	2025-07-14 11:50:20.413531	2025-07-14 11:50:20.413531
2	UJSBGATR	6	28	2025-07-14 14:02:29.627335	2025-07-14 14:02:29.627335
3	7HZSGRE	7	28	2025-07-14 15:04:23.913466	2025-07-14 15:04:23.913466
\.


--
-- TOC entry 4934 (class 0 OID 10133100)
-- Dependencies: 398
-- Data for Name: vignettes_completion_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_completion_messages (id, lecture_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4936 (class 0 OID 10133108)
-- Dependencies: 400
-- Data for Name: vignettes_info_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_info_slides (id, title, vignettes_questionnaire_id, icon_type, created_at, updated_at) FROM stdin;
2	Informationen	2	eye	2025-07-14 15:09:29.112665	2025-07-14 15:09:29.116847
\.


--
-- TOC entry 4938 (class 0 OID 10133119)
-- Dependencies: 402
-- Data for Name: vignettes_info_slides_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_info_slides_slides (vignettes_info_slide_id, vignettes_slide_id) FROM stdin;
2	5
\.


--
-- TOC entry 4939 (class 0 OID 10133124)
-- Dependencies: 403
-- Data for Name: vignettes_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_options (id, text, vignettes_question_id, created_at, updated_at) FROM stdin;
5	Tschechisch	5	2025-07-14 15:11:22.029809	2025-07-14 15:11:22.029809
6	Slowakisch	5	2025-07-14 15:11:22.030968	2025-07-14 15:11:22.030968
7	Slowenisch	5	2025-07-14 15:11:22.03184	2025-07-14 15:11:22.03184
8	Kroatisch	5	2025-07-14 15:11:22.032543	2025-07-14 15:11:22.032543
\.


--
-- TOC entry 4941 (class 0 OID 10133134)
-- Dependencies: 405
-- Data for Name: vignettes_questionnaires; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_questionnaires (id, title, lecture_id, published, editable, created_at, updated_at) FROM stdin;
2	Testvignette	28	t	f	2025-07-14 15:09:11.919174	2025-07-14 15:12:00.430996
\.


--
-- TOC entry 4943 (class 0 OID 10133145)
-- Dependencies: 407
-- Data for Name: vignettes_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_questions (id, type, question_text, vignettes_slide_id, only_integer, min_number, max_number, language, created_at, updated_at) FROM stdin;
4	Vignettes::TextQuestion	Was ist das?	4	f	\N	\N	en	2025-07-14 15:10:15.639754	2025-07-14 15:10:15.639754
5	Vignettes::MultipleChoiceQuestion	Welches Tastaturlayout ist das?	5	f	\N	\N	en	2025-07-14 15:11:22.028604	2025-07-14 15:11:22.028604
6	Vignettes::LikertScaleQuestion	Wurden deine Erwartungen erfüllt?	6	f	\N	\N	de	2025-07-14 15:11:52.25297	2025-07-14 15:11:52.25297
\.


--
-- TOC entry 4945 (class 0 OID 10133157)
-- Dependencies: 409
-- Data for Name: vignettes_slide_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_slide_statistics (id, user_id, vignettes_answer_id, time_on_slide, total_time_on_slide, time_on_info_slides, info_slides_access_count, info_slides_first_access_time, created_at, updated_at) FROM stdin;
2	5	8	23	23	{}	{}	{}	2025-07-14 15:12:42.171486	2025-07-14 15:12:42.171486
3	5	9	28	28	{}	{}	{}	2025-07-14 15:13:10.789473	2025-07-14 15:13:10.789473
4	5	10	4	4	{}	{}	{}	2025-07-14 15:13:15.610299	2025-07-14 15:13:15.610299
\.


--
-- TOC entry 4947 (class 0 OID 10133167)
-- Dependencies: 411
-- Data for Name: vignettes_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_slides (id, title, vignettes_questionnaire_id, "position", created_at, updated_at) FROM stdin;
4	Erste Slide	2	1	2025-07-14 15:10:15.622982	2025-07-14 15:10:15.700008
5	Zweite Slide	2	2	2025-07-14 15:11:22.015487	2025-07-14 15:11:22.055107
6	Letzte Slide	2	3	2025-07-14 15:11:52.25048	2025-07-14 15:11:52.252295
\.


--
-- TOC entry 4949 (class 0 OID 10133179)
-- Dependencies: 413
-- Data for Name: vignettes_user_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_user_answers (id, user_id, vignettes_questionnaire_id, created_at, updated_at) FROM stdin;
4	5	2	2025-07-14 15:12:18.622235	2025-07-14 15:12:18.622235
\.


--
-- TOC entry 4951 (class 0 OID 10133188)
-- Dependencies: 415
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
1	Commontator::Comment	3	User	6	t	\N	1	2022-08-05 13:39:47.797346	2022-08-05 13:39:47.797346
\.


--
-- TOC entry 4953 (class 0 OID 10133197)
-- Dependencies: 417
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vouchers (id, role, lecture_id, secure_hash, invalidated_at, expires_at, created_at, updated_at) FROM stdin;
1fd281f2-0192-4fa0-897b-27718cc28511	0	1	2e6af40b0f95b636aa2d1a974f876b8f	2026-07-14 11:07:37.673926	2026-07-28 11:07:23.901548	2025-07-14 11:07:23.901548	2025-07-14 11:07:37.674734
e2273c2f-fd1d-4d58-950e-a01d33aeac33	1	3	50b4626ef862f2ea57711560312435ce	\N	2026-07-17 11:09:15.735269	2025-07-14 11:09:15.735269	2025-07-14 11:09:15.735269
ccc50df8-0262-4372-bb3e-d8cc1650663e	0	3	551e12e67488e373418dd0ea9e22acbc	\N	2026-07-28 11:09:16.709169	2025-07-14 11:09:16.709169	2025-07-14 11:09:16.709169
8ed8a767-7faa-486c-a757-7417ffd04c3d	3	29	431d5aa6f1131afcb2765a2d7053f1f6	\N	2026-08-14 12:09:41.03965	2025-07-15 12:09:41.03965	2025-07-15 12:09:41.03965
\.


--
-- TOC entry 4954 (class 0 OID 10133209)
-- Dependencies: 418
-- Data for Name: watchlist_entries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.watchlist_entries (id, watchlist_id, medium_id, medium_position, created_at, updated_at) FROM stdin;
1	3	39	0	2022-08-05 13:52:07.795377	2022-08-05 13:52:07.795377
2	3	11	1	2022-08-05 13:52:15.489454	2022-08-05 13:52:15.489454
3	4	39	0	2022-08-05 13:53:14.826467	2022-08-05 13:53:14.826467
4	5	9	0	2025-07-14 11:30:21.726398	2025-07-14 11:30:21.726398
5	5	7	1	2025-07-14 11:30:24.602332	2025-07-14 11:30:24.602332
6	6	43	1	2026-08-26 19:49:19.04181	2026-08-26 19:49:19.04181
7	6	48	2	2026-08-26 19:49:19.052177	2026-08-26 19:49:19.052177
8	6	49	3	2026-08-26 19:49:19.059331	2026-08-26 19:49:19.059331
15	9	47	1	2026-08-28 15:08:36.700073	2026-08-28 15:08:36.700073
16	9	38	2	2026-08-28 15:08:36.712144	2026-08-28 15:08:36.712144
17	9	8	3	2026-08-28 15:08:36.7181	2026-08-28 15:08:36.7181
18	10	47	1	2026-08-28 15:08:36.726551	2026-08-28 15:08:36.726551
19	10	38	2	2026-08-28 15:08:36.731867	2026-08-28 15:08:36.731867
20	10	8	3	2026-08-28 15:08:36.737299	2026-08-28 15:08:36.737299
21	11	38	1	2026-08-28 15:08:36.747433	2026-08-28 15:08:36.747433
22	11	8	2	2026-08-28 15:08:36.752592	2026-08-28 15:08:36.752592
23	11	9	3	2026-08-28 15:08:36.758151	2026-08-28 15:08:36.758151
24	12	38	1	2026-08-28 15:08:36.7652	2026-08-28 15:08:36.7652
25	12	8	2	2026-08-28 15:08:36.771044	2026-08-28 15:08:36.771044
26	12	9	3	2026-08-28 15:08:36.775862	2026-08-28 15:08:36.775862
27	13	8	1	2026-08-28 15:08:36.782923	2026-08-28 15:08:36.782923
28	13	9	2	2026-08-28 15:08:36.787877	2026-08-28 15:08:36.787877
29	13	10	3	2026-08-28 15:08:36.799235	2026-08-28 15:08:36.799235
30	14	8	1	2026-08-28 15:08:36.808795	2026-08-28 15:08:36.808795
31	14	9	2	2026-08-28 15:08:36.814667	2026-08-28 15:08:36.814667
32	14	10	3	2026-08-28 15:08:36.821322	2026-08-28 15:08:36.821322
33	15	9	1	2026-08-28 15:08:36.830249	2026-08-28 15:08:36.830249
34	15	10	2	2026-08-28 15:08:36.83647	2026-08-28 15:08:36.83647
35	15	2	3	2026-08-28 15:08:36.841936	2026-08-28 15:08:36.841936
36	16	9	1	2026-08-28 15:08:36.851415	2026-08-28 15:08:36.851415
37	16	10	2	2026-08-28 15:08:36.857827	2026-08-28 15:08:36.857827
38	16	2	3	2026-08-28 15:08:36.866246	2026-08-28 15:08:36.866246
39	17	10	1	2026-08-28 15:08:36.885228	2026-08-28 15:08:36.885228
40	17	2	2	2026-08-28 15:08:36.893	2026-08-28 15:08:36.893
41	17	6	3	2026-08-28 15:08:36.900196	2026-08-28 15:08:36.900196
42	18	38	1	2026-08-28 15:08:36.909761	2026-08-28 15:08:36.909761
43	18	8	2	2026-08-28 15:08:36.91602	2026-08-28 15:08:36.91602
44	18	9	3	2026-08-28 15:08:36.934337	2026-08-28 15:08:36.934337
45	18	10	4	2026-08-28 15:08:36.940164	2026-08-28 15:08:36.940164
46	18	2	5	2026-08-28 15:08:36.945855	2026-08-28 15:08:36.945855
10	7	49	1	2026-08-26 19:49:19.075649	2026-08-28 22:57:20.296645
11	7	51	2	2026-08-26 19:49:19.082077	2026-08-28 22:57:20.296645
13	8	41	1	2026-08-26 19:49:19.101322	2026-08-28 22:57:20.307719
14	8	51	2	2026-08-26 19:49:19.108334	2026-08-28 22:57:20.307719
47	19	13	1	2026-08-28 22:57:20.385012	2026-08-28 22:57:20.385012
48	19	47	2	2026-08-28 22:57:20.393169	2026-08-28 22:57:20.393169
49	19	38	3	2026-08-28 22:57:20.399525	2026-08-28 22:57:20.399525
50	20	47	1	2026-08-28 22:57:20.419621	2026-08-28 22:57:20.419621
51	20	38	2	2026-08-28 22:57:20.425643	2026-08-28 22:57:20.425643
52	20	8	3	2026-08-28 22:57:20.430421	2026-08-28 22:57:20.430421
53	21	47	1	2026-08-28 22:57:20.4378	2026-08-28 22:57:20.4378
54	21	38	2	2026-08-28 22:57:20.44179	2026-08-28 22:57:20.44179
55	21	8	3	2026-08-28 22:57:20.447907	2026-08-28 22:57:20.447907
56	22	38	1	2026-08-28 22:57:20.456103	2026-08-28 22:57:20.456103
57	22	8	2	2026-08-28 22:57:20.463134	2026-08-28 22:57:20.463134
58	22	9	3	2026-08-28 22:57:20.467342	2026-08-28 22:57:20.467342
59	23	38	1	2026-08-28 22:57:20.473815	2026-08-28 22:57:20.473815
60	23	8	2	2026-08-28 22:57:20.479137	2026-08-28 22:57:20.479137
61	23	9	3	2026-08-28 22:57:20.483141	2026-08-28 22:57:20.483141
62	24	8	1	2026-08-28 22:57:20.493954	2026-08-28 22:57:20.493954
63	24	9	2	2026-08-28 22:57:20.50049	2026-08-28 22:57:20.50049
64	24	10	3	2026-08-28 22:57:20.504577	2026-08-28 22:57:20.504577
65	25	8	1	2026-08-28 22:57:20.511692	2026-08-28 22:57:20.511692
66	25	9	2	2026-08-28 22:57:20.515928	2026-08-28 22:57:20.515928
67	25	10	3	2026-08-28 22:57:20.519814	2026-08-28 22:57:20.519814
68	26	9	1	2026-08-28 22:57:20.536611	2026-08-28 22:57:20.536611
69	26	10	2	2026-08-28 22:57:20.54139	2026-08-28 22:57:20.54139
70	26	2	3	2026-08-28 22:57:20.546244	2026-08-28 22:57:20.546244
71	27	9	1	2026-08-28 22:57:20.55378	2026-08-28 22:57:20.55378
72	27	10	2	2026-08-28 22:57:20.559012	2026-08-28 22:57:20.559012
73	27	2	3	2026-08-28 22:57:20.564271	2026-08-28 22:57:20.564271
74	28	10	1	2026-08-28 22:57:20.572182	2026-08-28 22:57:20.572182
75	28	2	2	2026-08-28 22:57:20.576614	2026-08-28 22:57:20.576614
76	28	6	3	2026-08-28 22:57:20.581926	2026-08-28 22:57:20.581926
\.


--
-- TOC entry 4956 (class 0 OID 10133218)
-- Dependencies: 420
-- Data for Name: watchlists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.watchlists (id, user_id, watchlist_entry_id, created_at, updated_at, name, public, description) FROM stdin;
3	5	\N	2022-08-05 13:51:36.010128	2022-08-05 13:51:52.069354	My public watchlist	t	Here's my public watchlist
4	5	\N	2022-08-05 13:52:49.485056	2022-08-05 13:52:49.485056	My private watchlist	f	Here's my private watchlist.
5	8	\N	2025-07-14 11:30:08.902407	2025-07-14 11:30:08.902407	Neue Watchlist	f	Libeslingsmedien
6	9	\N	2026-08-26 19:49:19.014502	2026-08-26 19:49:19.014502	Wiederholung 1	f	\N
7	7	\N	2026-08-26 19:49:19.066438	2026-08-26 19:49:19.066438	Wiederholung 2	f	\N
8	6	\N	2026-08-26 19:49:19.092026	2026-08-26 19:49:19.092026	Wiederholung 5	f	\N
9	9	\N	2026-08-28 15:08:36.677402	2026-08-28 15:08:36.677402	Vor der Klausur 1	f	\N
10	5	\N	2026-08-28 15:08:36.72442	2026-08-28 15:08:36.72442	Wiederholung 2	f	\N
11	5	\N	2026-08-28 15:08:36.745123	2026-08-28 15:08:36.745123	Vor der Klausur 2	f	\N
12	6	\N	2026-08-28 15:08:36.763217	2026-08-28 15:08:36.763217	Wiederholung 3	f	\N
13	6	\N	2026-08-28 15:08:36.780904	2026-08-28 15:08:36.780904	Vor der Klausur 3	f	\N
14	7	\N	2026-08-28 15:08:36.806207	2026-08-28 15:08:36.806207	Wiederholung 4	f	\N
15	7	\N	2026-08-28 15:08:36.827521	2026-08-28 15:08:36.827521	Vor der Klausur 4	f	\N
16	8	\N	2026-08-28 15:08:36.848352	2026-08-28 15:08:36.848352	Wiederholung 5	f	\N
17	8	\N	2026-08-28 15:08:36.873623	2026-08-28 15:08:36.873623	Vor der Klausur 5	f	\N
18	2	\N	2026-08-28 15:08:36.907301	2026-08-28 15:08:36.907301	Für die Sprechstunde	f	\N
19	5	\N	2026-08-28 22:57:20.344002	2026-08-28 22:57:20.344002	Wiederholung 1	f	\N
20	5	\N	2026-08-28 22:57:20.417188	2026-08-28 22:57:20.417188	Vor der Klausur 1	f	\N
21	6	\N	2026-08-28 22:57:20.436078	2026-08-28 22:57:20.436078	Wiederholung 2	f	\N
22	6	\N	2026-08-28 22:57:20.453654	2026-08-28 22:57:20.453654	Vor der Klausur 2	f	\N
23	7	\N	2026-08-28 22:57:20.472171	2026-08-28 22:57:20.472171	Wiederholung 3	f	\N
24	7	\N	2026-08-28 22:57:20.491578	2026-08-28 22:57:20.491578	Vor der Klausur 3	f	\N
25	8	\N	2026-08-28 22:57:20.509711	2026-08-28 22:57:20.509711	Wiederholung 4	f	\N
26	8	\N	2026-08-28 22:57:20.524773	2026-08-28 22:57:20.524773	Vor der Klausur 4	f	\N
27	9	\N	2026-08-28 22:57:20.551703	2026-08-28 22:57:20.551703	Wiederholung 5	f	\N
28	9	\N	2026-08-28 22:57:20.57035	2026-08-28 22:57:20.57035	Vor der Klausur 5	f	\N
\.


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 223
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 8, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 225
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 8, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 227
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 8, true);


--
-- TOC entry 5062 (class 0 OID 0)
-- Dependencies: 229
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 4, true);


--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 231
-- Name: annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.annotations_id_seq', 167, true);


--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 233
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcements_id_seq', 32, true);


--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 235
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.answers_id_seq', 39, true);


--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 238
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assignments_id_seq', 3, true);


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 240
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chapters_id_seq', 10, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 242
-- Name: claims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.claims_id_seq', 3, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 245
-- Name: cohorts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cohorts_id_seq', 10, true);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 247
-- Name: commontator_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_comments_id_seq', 43, true);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 249
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_subscriptions_id_seq', 1, false);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 251
-- Name: commontator_threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_threads_id_seq', 52, true);


--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 253
-- Name: course_self_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_self_joins_id_seq', 1, false);


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 255
-- Name: course_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_tag_joins_id_seq', 48, true);


--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 257
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 20, true);


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 259
-- Name: division_course_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.division_course_joins_id_seq', 9, true);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 261
-- Name: division_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.division_translations_id_seq', 8, true);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 263
-- Name: divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.divisions_id_seq', 4, true);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 265
-- Name: editable_user_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.editable_user_joins_id_seq', 187, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 267
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, true);


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 269
-- Name: flipper_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flipper_features_id_seq', 1, true);


--
-- TOC entry 5082 (class 0 OID 0)
-- Dependencies: 271
-- Name: flipper_gates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flipper_gates_id_seq', 3, true);


--
-- TOC entry 5083 (class 0 OID 0)
-- Dependencies: 273
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 18, true);


--
-- TOC entry 5084 (class 0 OID 0)
-- Dependencies: 275
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- TOC entry 5085 (class 0 OID 0)
-- Dependencies: 277
-- Name: item_self_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_self_joins_id_seq', 1, false);


--
-- TOC entry 5086 (class 0 OID 0)
-- Dependencies: 279
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_id_seq', 388, true);


--
-- TOC entry 5087 (class 0 OID 0)
-- Dependencies: 282
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lecture_user_joins_id_seq', 221, true);


--
-- TOC entry 5088 (class 0 OID 0)
-- Dependencies: 284
-- Name: lectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lectures_id_seq', 39, true);


--
-- TOC entry 5089 (class 0 OID 0)
-- Dependencies: 286
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_section_joins_id_seq', 12, true);


--
-- TOC entry 5090 (class 0 OID 0)
-- Dependencies: 288
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_tag_joins_id_seq', 55, true);


--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 290
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lessons_id_seq', 12, true);


--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 292
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 1, false);


--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 294
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.media_id_seq', 52, true);


--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 296
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medium_tag_joins_id_seq', 49, true);


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 298
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1429, true);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 300
-- Name: notions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notions_id_seq', 84, true);


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 302
-- Name: program_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.program_translations_id_seq', 4, true);


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 304
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.programs_id_seq', 2, true);


--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 307
-- Name: readers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.readers_id_seq', 1, true);


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 309
-- Name: redemptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redemptions_id_seq', 3, true);


--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 311
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.referrals_id_seq', 12, true);


--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 316
-- Name: registration_student_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.registration_student_messages_id_seq', 1, false);


--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 319
-- Name: relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.relations_id_seq', 58, true);


--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 322
-- Name: section_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.section_tag_joins_id_seq', 45, true);


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 324
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sections_id_seq', 37, true);


--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 326
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.speaker_talk_joins_id_seq', 35, true);


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 328
-- Name: subject_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subject_translations_id_seq', 4, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 330
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 2, true);


--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 333
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 48, true);


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 335
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talk_tag_joins_id_seq', 5, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 337
-- Name: talks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talks_id_seq', 66, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 339
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.terms_id_seq', 10, true);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 341
-- Name: thredded_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_categories_id_seq', 1, false);


--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 343
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_groups_id_seq', 1, false);


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 345
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_notifications_for_followed_topics_id_seq', 1, false);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 347
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_users_id_seq', 2, true);


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 349
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboards_id_seq', 9, true);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 351
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_notifications_for_followed_topics_id_seq', 1, false);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 353
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_notifications_for_private_topics_id_seq', 1, false);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 355
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_post_moderation_records_id_seq', 1, false);


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 357
-- Name: thredded_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_posts_id_seq', 50, true);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 359
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_posts_id_seq', 1, false);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 361
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_topics_id_seq', 1, false);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 363
-- Name: thredded_private_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_users_id_seq', 1, false);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 365
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_topic_categories_id_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 367
-- Name: thredded_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_topics_id_seq', 18, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 369
-- Name: thredded_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_details_id_seq', 4, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 371
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_messageboard_preferences_id_seq', 1, false);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 373
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_post_notifications_id_seq', 1, false);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 375
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_preferences_id_seq', 1, false);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 377
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_private_topic_read_states_id_seq', 1, false);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 379
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_topic_follows_id_seq', 50, true);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 381
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_topic_read_states_id_seq', 2, true);


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 383
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tutor_tutorial_joins_id_seq', 5, true);


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 386
-- Name: tutorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tutorials_id_seq', 29, true);


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 388
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_favorite_lecture_joins_id_seq', 7, true);


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 390
-- Name: user_submission_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_submission_joins_id_seq', 46, true);


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 392
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 184, true);


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 394
-- Name: vignettes_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_answers_id_seq', 10, true);


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 397
-- Name: vignettes_codenames_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_codenames_id_seq', 3, true);


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 399
-- Name: vignettes_completion_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_completion_messages_id_seq', 1, false);


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 401
-- Name: vignettes_info_slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_info_slides_id_seq', 2, true);


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 404
-- Name: vignettes_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_options_id_seq', 8, true);


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 406
-- Name: vignettes_questionnaires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_questionnaires_id_seq', 2, true);


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 408
-- Name: vignettes_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_questions_id_seq', 6, true);


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 410
-- Name: vignettes_slide_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_slide_statistics_id_seq', 4, true);


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 412
-- Name: vignettes_slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_slides_id_seq', 6, true);


--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 414
-- Name: vignettes_user_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_user_answers_id_seq', 4, true);


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 416
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.votes_id_seq', 1, true);


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 419
-- Name: watchlist_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlist_entries_id_seq', 76, true);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 421
-- Name: watchlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlists_id_seq', 28, true);


--
-- TOC entry 4075 (class 2606 OID 10133333)
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- TOC entry 4078 (class 2606 OID 10133335)
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 10133337)
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4085 (class 2606 OID 10133339)
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- TOC entry 4088 (class 2606 OID 10133341)
-- Name: annotations annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- TOC entry 4092 (class 2606 OID 10133343)
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- TOC entry 4096 (class 2606 OID 10133345)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4101 (class 2606 OID 10133347)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 4103 (class 2606 OID 10133349)
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4107 (class 2606 OID 10133351)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4110 (class 2606 OID 10133353)
-- Name: claims claims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT claims_pkey PRIMARY KEY (id);


--
-- TOC entry 4114 (class 2606 OID 10133355)
-- Name: cohort_memberships cohort_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT cohort_memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 4120 (class 2606 OID 10133357)
-- Name: cohorts cohorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohorts
    ADD CONSTRAINT cohorts_pkey PRIMARY KEY (id);


--
-- TOC entry 4125 (class 2606 OID 10133359)
-- Name: commontator_comments commontator_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT commontator_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4133 (class 2606 OID 10133361)
-- Name: commontator_subscriptions commontator_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT commontator_subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4137 (class 2606 OID 10133363)
-- Name: commontator_threads commontator_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads
    ADD CONSTRAINT commontator_threads_pkey PRIMARY KEY (id);


--
-- TOC entry 4141 (class 2606 OID 10133365)
-- Name: course_self_joins course_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT course_self_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4146 (class 2606 OID 10133367)
-- Name: course_tag_joins course_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins
    ADD CONSTRAINT course_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4150 (class 2606 OID 10133369)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4156 (class 2606 OID 10133371)
-- Name: division_course_joins division_course_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins
    ADD CONSTRAINT division_course_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4160 (class 2606 OID 10133373)
-- Name: division_translations division_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations
    ADD CONSTRAINT division_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4164 (class 2606 OID 10133375)
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- TOC entry 4167 (class 2606 OID 10133377)
-- Name: editable_user_joins editable_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins
    ADD CONSTRAINT editable_user_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4171 (class 2606 OID 10133379)
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- TOC entry 4174 (class 2606 OID 10133381)
-- Name: flipper_features flipper_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_features
    ADD CONSTRAINT flipper_features_pkey PRIMARY KEY (id);


--
-- TOC entry 4177 (class 2606 OID 10133383)
-- Name: flipper_gates flipper_gates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_gates
    ADD CONSTRAINT flipper_gates_pkey PRIMARY KEY (id);


--
-- TOC entry 4180 (class 2606 OID 10133385)
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- TOC entry 4186 (class 2606 OID 10133387)
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- TOC entry 4192 (class 2606 OID 10133389)
-- Name: item_self_joins item_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins
    ADD CONSTRAINT item_self_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4196 (class 2606 OID 10133391)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 4202 (class 2606 OID 10133393)
-- Name: lecture_memberships lecture_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT lecture_memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 4207 (class 2606 OID 10133395)
-- Name: lecture_user_joins lecture_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT lecture_user_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4213 (class 2606 OID 10133397)
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- TOC entry 4217 (class 2606 OID 10133399)
-- Name: lesson_section_joins lesson_section_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins
    ADD CONSTRAINT lesson_section_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4221 (class 2606 OID 10133401)
-- Name: lesson_tag_joins lesson_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins
    ADD CONSTRAINT lesson_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4224 (class 2606 OID 10133403)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 4229 (class 2606 OID 10133405)
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- TOC entry 4239 (class 2606 OID 10133407)
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- TOC entry 4243 (class 2606 OID 10133409)
-- Name: medium_tag_joins medium_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT medium_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4247 (class 2606 OID 10133411)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4253 (class 2606 OID 10133413)
-- Name: notions notions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions
    ADD CONSTRAINT notions_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 10133415)
-- Name: program_translations program_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations
    ADD CONSTRAINT program_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4260 (class 2606 OID 10133417)
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- TOC entry 4264 (class 2606 OID 10133419)
-- Name: quiz_certificates quiz_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT quiz_certificates_pkey PRIMARY KEY (id);


--
-- TOC entry 4266 (class 2606 OID 10133421)
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- TOC entry 4270 (class 2606 OID 10133423)
-- Name: redemptions redemptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT redemptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4274 (class 2606 OID 10133425)
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- TOC entry 4279 (class 2606 OID 10133427)
-- Name: registration_campaigns registration_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_campaigns
    ADD CONSTRAINT registration_campaigns_pkey PRIMARY KEY (id);


--
-- TOC entry 4283 (class 2606 OID 10133429)
-- Name: registration_items registration_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_items
    ADD CONSTRAINT registration_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4290 (class 2606 OID 10133431)
-- Name: registration_policies registration_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_policies
    ADD CONSTRAINT registration_policies_pkey PRIMARY KEY (id);


--
-- TOC entry 4294 (class 2606 OID 10133433)
-- Name: registration_student_messages registration_student_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT registration_student_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 10133435)
-- Name: registration_user_registrations registration_user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT registration_user_registrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4310 (class 2606 OID 10133437)
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- TOC entry 4312 (class 2606 OID 10133439)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4316 (class 2606 OID 10133441)
-- Name: section_tag_joins section_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins
    ADD CONSTRAINT section_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4320 (class 2606 OID 10133443)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 4326 (class 2606 OID 10133445)
-- Name: speaker_talk_joins speaker_talk_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT speaker_talk_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4330 (class 2606 OID 10133447)
-- Name: subject_translations subject_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations
    ADD CONSTRAINT subject_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4332 (class 2606 OID 10133449)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 10133451)
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4339 (class 2606 OID 10133453)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4343 (class 2606 OID 10133455)
-- Name: talk_tag_joins talk_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT talk_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 10133457)
-- Name: talks talks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT talks_pkey PRIMARY KEY (id);


--
-- TOC entry 4350 (class 2606 OID 10133459)
-- Name: terms terms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT terms_pkey PRIMARY KEY (id);


--
-- TOC entry 4355 (class 2606 OID 10133461)
-- Name: thredded_categories thredded_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories
    ADD CONSTRAINT thredded_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4357 (class 2606 OID 10133463)
-- Name: thredded_messageboard_groups thredded_messageboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups
    ADD CONSTRAINT thredded_messageboard_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4359 (class 2606 OID 10133465)
-- Name: thredded_messageboard_notifications_for_followed_topics thredded_messageboard_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics
    ADD CONSTRAINT thredded_messageboard_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4364 (class 2606 OID 10133467)
-- Name: thredded_messageboard_users thredded_messageboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT thredded_messageboard_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4368 (class 2606 OID 10133469)
-- Name: thredded_messageboards thredded_messageboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards
    ADD CONSTRAINT thredded_messageboards_pkey PRIMARY KEY (id);


--
-- TOC entry 4370 (class 2606 OID 10133471)
-- Name: thredded_notifications_for_followed_topics thredded_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics
    ADD CONSTRAINT thredded_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4373 (class 2606 OID 10133473)
-- Name: thredded_notifications_for_private_topics thredded_notifications_for_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics
    ADD CONSTRAINT thredded_notifications_for_private_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4377 (class 2606 OID 10133475)
-- Name: thredded_post_moderation_records thredded_post_moderation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records
    ADD CONSTRAINT thredded_post_moderation_records_pkey PRIMARY KEY (id);


--
-- TOC entry 4385 (class 2606 OID 10133477)
-- Name: thredded_posts thredded_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts
    ADD CONSTRAINT thredded_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4388 (class 2606 OID 10133479)
-- Name: thredded_private_posts thredded_private_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts
    ADD CONSTRAINT thredded_private_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4393 (class 2606 OID 10133481)
-- Name: thredded_private_topics thredded_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics
    ADD CONSTRAINT thredded_private_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4397 (class 2606 OID 10133483)
-- Name: thredded_private_users thredded_private_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users
    ADD CONSTRAINT thredded_private_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4401 (class 2606 OID 10133485)
-- Name: thredded_topic_categories thredded_topic_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories
    ADD CONSTRAINT thredded_topic_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4409 (class 2606 OID 10133487)
-- Name: thredded_topics thredded_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics
    ADD CONSTRAINT thredded_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4415 (class 2606 OID 10133489)
-- Name: thredded_user_details thredded_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details
    ADD CONSTRAINT thredded_user_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4417 (class 2606 OID 10133491)
-- Name: thredded_user_messageboard_preferences thredded_user_messageboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences
    ADD CONSTRAINT thredded_user_messageboard_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 4422 (class 2606 OID 10133493)
-- Name: thredded_user_post_notifications thredded_user_post_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT thredded_user_post_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4425 (class 2606 OID 10133495)
-- Name: thredded_user_preferences thredded_user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences
    ADD CONSTRAINT thredded_user_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 4427 (class 2606 OID 10133497)
-- Name: thredded_user_private_topic_read_states thredded_user_private_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states
    ADD CONSTRAINT thredded_user_private_topic_read_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4430 (class 2606 OID 10133499)
-- Name: thredded_user_topic_follows thredded_user_topic_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows
    ADD CONSTRAINT thredded_user_topic_follows_pkey PRIMARY KEY (id);


--
-- TOC entry 4434 (class 2606 OID 10133501)
-- Name: thredded_user_topic_read_states thredded_user_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states
    ADD CONSTRAINT thredded_user_topic_read_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4441 (class 2606 OID 10133503)
-- Name: tutor_tutorial_joins tutor_tutorial_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT tutor_tutorial_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4448 (class 2606 OID 10133505)
-- Name: tutorial_memberships tutorial_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT tutorial_memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 4453 (class 2606 OID 10133507)
-- Name: tutorials tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT tutorials_pkey PRIMARY KEY (id);


--
-- TOC entry 4457 (class 2606 OID 10133509)
-- Name: user_favorite_lecture_joins user_favorite_lecture_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT user_favorite_lecture_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4461 (class 2606 OID 10133511)
-- Name: user_submission_joins user_submission_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT user_submission_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4467 (class 2606 OID 10133513)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4472 (class 2606 OID 10133515)
-- Name: vignettes_answers vignettes_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT vignettes_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4478 (class 2606 OID 10133517)
-- Name: vignettes_codenames vignettes_codenames_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT vignettes_codenames_pkey PRIMARY KEY (id);


--
-- TOC entry 4481 (class 2606 OID 10133519)
-- Name: vignettes_completion_messages vignettes_completion_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages
    ADD CONSTRAINT vignettes_completion_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4484 (class 2606 OID 10133521)
-- Name: vignettes_info_slides vignettes_info_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_info_slides
    ADD CONSTRAINT vignettes_info_slides_pkey PRIMARY KEY (id);


--
-- TOC entry 4489 (class 2606 OID 10133523)
-- Name: vignettes_options vignettes_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options
    ADD CONSTRAINT vignettes_options_pkey PRIMARY KEY (id);


--
-- TOC entry 4492 (class 2606 OID 10133525)
-- Name: vignettes_questionnaires vignettes_questionnaires_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires
    ADD CONSTRAINT vignettes_questionnaires_pkey PRIMARY KEY (id);


--
-- TOC entry 4495 (class 2606 OID 10133527)
-- Name: vignettes_questions vignettes_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions
    ADD CONSTRAINT vignettes_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4499 (class 2606 OID 10133529)
-- Name: vignettes_slide_statistics vignettes_slide_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT vignettes_slide_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 4503 (class 2606 OID 10133531)
-- Name: vignettes_slides vignettes_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides
    ADD CONSTRAINT vignettes_slides_pkey PRIMARY KEY (id);


--
-- TOC entry 4507 (class 2606 OID 10133533)
-- Name: vignettes_user_answers vignettes_user_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT vignettes_user_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4513 (class 2606 OID 10133535)
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- TOC entry 4517 (class 2606 OID 10133537)
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 4521 (class 2606 OID 10133539)
-- Name: watchlist_entries watchlist_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT watchlist_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 4525 (class 2606 OID 10133541)
-- Name: watchlists watchlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_pkey PRIMARY KEY (id);


--
-- TOC entry 4485 (class 1259 OID 10133542)
-- Name: idx_on_vignettes_info_slide_id_vignettes_slide_id_2bdc65ab76; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_vignettes_info_slide_id_vignettes_slide_id_2bdc65ab76 ON public.vignettes_info_slides_slides USING btree (vignettes_info_slide_id, vignettes_slide_id);


--
-- TOC entry 4486 (class 1259 OID 10133543)
-- Name: idx_on_vignettes_slide_id_vignettes_info_slide_id_c74f04e951; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_vignettes_slide_id_vignettes_info_slide_id_c74f04e951 ON public.vignettes_info_slides_slides USING btree (vignettes_slide_id, vignettes_info_slide_id);


--
-- TOC entry 4076 (class 1259 OID 10133544)
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- TOC entry 4079 (class 1259 OID 10133545)
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- TOC entry 4080 (class 1259 OID 10133546)
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- TOC entry 4083 (class 1259 OID 10133547)
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- TOC entry 4086 (class 1259 OID 10133548)
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- TOC entry 4089 (class 1259 OID 10133549)
-- Name: index_annotations_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_annotations_on_medium_id ON public.annotations USING btree (medium_id);


--
-- TOC entry 4090 (class 1259 OID 10133550)
-- Name: index_annotations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_annotations_on_user_id ON public.annotations USING btree (user_id);


--
-- TOC entry 4093 (class 1259 OID 10133551)
-- Name: index_announcements_on_announcer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_announcer_id ON public.announcements USING btree (announcer_id);


--
-- TOC entry 4094 (class 1259 OID 10133552)
-- Name: index_announcements_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_lecture_id ON public.announcements USING btree (lecture_id);


--
-- TOC entry 4097 (class 1259 OID 10133553)
-- Name: index_answers_on_explanation_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_explanation_trgm ON public.answers USING gin (explanation public.gin_trgm_ops);


--
-- TOC entry 4098 (class 1259 OID 10133554)
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- TOC entry 4099 (class 1259 OID 10133555)
-- Name: index_answers_on_text_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_text_trgm ON public.answers USING gin (text public.gin_trgm_ops);


--
-- TOC entry 4473 (class 1259 OID 10133556)
-- Name: index_answers_options_on_answer_id_and_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_options_on_answer_id_and_option_id ON public.vignettes_answers_options USING btree (vignettes_answer_id, vignettes_option_id);


--
-- TOC entry 4474 (class 1259 OID 10133557)
-- Name: index_answers_options_on_option_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_options_on_option_id_and_answer_id ON public.vignettes_answers_options USING btree (vignettes_option_id, vignettes_answer_id);


--
-- TOC entry 4104 (class 1259 OID 10133558)
-- Name: index_assignments_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_lecture_id ON public.assignments USING btree (lecture_id);


--
-- TOC entry 4105 (class 1259 OID 10133559)
-- Name: index_assignments_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_medium_id ON public.assignments USING btree (medium_id);


--
-- TOC entry 4108 (class 1259 OID 10133560)
-- Name: index_chapters_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_lecture_id ON public.chapters USING btree (lecture_id);


--
-- TOC entry 4111 (class 1259 OID 10133561)
-- Name: index_claims_on_claimable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_claims_on_claimable ON public.claims USING btree (claimable_type, claimable_id);


--
-- TOC entry 4112 (class 1259 OID 10133562)
-- Name: index_claims_on_redemption_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_claims_on_redemption_id ON public.claims USING btree (redemption_id);


--
-- TOC entry 4115 (class 1259 OID 10133563)
-- Name: index_cohort_memberships_on_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_cohort_id ON public.cohort_memberships USING btree (cohort_id);


--
-- TOC entry 4116 (class 1259 OID 10133564)
-- Name: index_cohort_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_source_campaign_id ON public.cohort_memberships USING btree (source_campaign_id);


--
-- TOC entry 4117 (class 1259 OID 10133565)
-- Name: index_cohort_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_user_id ON public.cohort_memberships USING btree (user_id);


--
-- TOC entry 4118 (class 1259 OID 10133566)
-- Name: index_cohort_memberships_on_user_id_and_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cohort_memberships_on_user_id_and_cohort_id ON public.cohort_memberships USING btree (user_id, cohort_id);


--
-- TOC entry 4121 (class 1259 OID 10133567)
-- Name: index_cohorts_on_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_context ON public.cohorts USING btree (context_type, context_id);


--
-- TOC entry 4122 (class 1259 OID 10133568)
-- Name: index_cohorts_on_context_and_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cohorts_on_context_and_title_unique ON public.cohorts USING btree (context_type, context_id, title);


--
-- TOC entry 4123 (class 1259 OID 10133569)
-- Name: index_cohorts_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_self_materialization_mode ON public.cohorts USING btree (self_materialization_mode);


--
-- TOC entry 4126 (class 1259 OID 10133570)
-- Name: index_commontator_comments_on_c_id_and_c_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_c_id_and_c_type_and_t_id ON public.commontator_comments USING btree (creator_id, creator_type, thread_id);


--
-- TOC entry 4127 (class 1259 OID 10133571)
-- Name: index_commontator_comments_on_cached_votes_down; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_down ON public.commontator_comments USING btree (cached_votes_down);


--
-- TOC entry 4128 (class 1259 OID 10133572)
-- Name: index_commontator_comments_on_cached_votes_up; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_up ON public.commontator_comments USING btree (cached_votes_up);


--
-- TOC entry 4129 (class 1259 OID 10133573)
-- Name: index_commontator_comments_on_editor_type_and_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_editor_type_and_editor_id ON public.commontator_comments USING btree (editor_type, editor_id);


--
-- TOC entry 4130 (class 1259 OID 10133574)
-- Name: index_commontator_comments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_parent_id ON public.commontator_comments USING btree (parent_id);


--
-- TOC entry 4131 (class 1259 OID 10133575)
-- Name: index_commontator_comments_on_thread_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_thread_id_and_created_at ON public.commontator_comments USING btree (thread_id, created_at);


--
-- TOC entry 4134 (class 1259 OID 10133576)
-- Name: index_commontator_subscriptions_on_s_id_and_s_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_subscriptions_on_s_id_and_s_type_and_t_id ON public.commontator_subscriptions USING btree (subscriber_id, subscriber_type, thread_id);


--
-- TOC entry 4135 (class 1259 OID 10133577)
-- Name: index_commontator_subscriptions_on_thread_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_subscriptions_on_thread_id ON public.commontator_subscriptions USING btree (thread_id);


--
-- TOC entry 4138 (class 1259 OID 10133578)
-- Name: index_commontator_threads_on_c_id_and_c_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_threads_on_c_id_and_c_type ON public.commontator_threads USING btree (commontable_type, commontable_id);


--
-- TOC entry 4139 (class 1259 OID 10133579)
-- Name: index_commontator_threads_on_closer_type_and_closer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_threads_on_closer_type_and_closer_id ON public.commontator_threads USING btree (closer_type, closer_id);


--
-- TOC entry 4142 (class 1259 OID 10133580)
-- Name: index_course_self_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_course_id ON public.course_self_joins USING btree (course_id);


--
-- TOC entry 4143 (class 1259 OID 10133581)
-- Name: index_course_self_joins_on_course_id_and_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_course_self_joins_on_course_id_and_preceding_course_id ON public.course_self_joins USING btree (course_id, preceding_course_id);


--
-- TOC entry 4144 (class 1259 OID 10133582)
-- Name: index_course_self_joins_on_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_preceding_course_id ON public.course_self_joins USING btree (preceding_course_id);


--
-- TOC entry 4147 (class 1259 OID 10133583)
-- Name: index_course_tag_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_course_id ON public.course_tag_joins USING btree (course_id);


--
-- TOC entry 4148 (class 1259 OID 10133584)
-- Name: index_course_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_tag_id ON public.course_tag_joins USING btree (tag_id);


--
-- TOC entry 4151 (class 1259 OID 10133585)
-- Name: index_courses_on_short_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_short_title_trgm ON public.courses USING gin (short_title public.gin_trgm_ops);


--
-- TOC entry 4152 (class 1259 OID 10133586)
-- Name: index_courses_on_term_independent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_term_independent ON public.courses USING btree (term_independent);


--
-- TOC entry 4153 (class 1259 OID 10133587)
-- Name: index_courses_on_title_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_title_trigram ON public.courses USING gin (title public.gin_trgm_ops);


--
-- TOC entry 4154 (class 1259 OID 10133588)
-- Name: index_courses_on_title_tsearch; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_title_tsearch ON public.courses USING gin (to_tsvector('simple'::regconfig, (title)::text));


--
-- TOC entry 4157 (class 1259 OID 10133589)
-- Name: index_division_course_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_course_id ON public.division_course_joins USING btree (course_id);


--
-- TOC entry 4158 (class 1259 OID 10133590)
-- Name: index_division_course_joins_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_division_id ON public.division_course_joins USING btree (division_id);


--
-- TOC entry 4161 (class 1259 OID 10133591)
-- Name: index_division_translations_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_division_id ON public.division_translations USING btree (division_id);


--
-- TOC entry 4162 (class 1259 OID 10133592)
-- Name: index_division_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_locale ON public.division_translations USING btree (locale);


--
-- TOC entry 4165 (class 1259 OID 10133593)
-- Name: index_divisions_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_divisions_on_program_id ON public.divisions USING btree (program_id);


--
-- TOC entry 4172 (class 1259 OID 10133594)
-- Name: index_feedbacks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feedbacks_on_user_id ON public.feedbacks USING btree (user_id);


--
-- TOC entry 4175 (class 1259 OID 10133595)
-- Name: index_flipper_features_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_flipper_features_on_key ON public.flipper_features USING btree (key);


--
-- TOC entry 4178 (class 1259 OID 10133596)
-- Name: index_flipper_gates_on_feature_key_and_key_and_value; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_flipper_gates_on_feature_key_and_key_and_value ON public.flipper_gates USING btree (feature_key, key, value);


--
-- TOC entry 4181 (class 1259 OID 10133597)
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- TOC entry 4182 (class 1259 OID 10133598)
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- TOC entry 4183 (class 1259 OID 10133599)
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- TOC entry 4184 (class 1259 OID 10133600)
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- TOC entry 4187 (class 1259 OID 10133601)
-- Name: index_imports_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_medium_id ON public.imports USING btree (medium_id);


--
-- TOC entry 4188 (class 1259 OID 10133602)
-- Name: index_imports_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_teachable_type_and_teachable_id ON public.imports USING btree (teachable_type, teachable_id);


--
-- TOC entry 4189 (class 1259 OID 10133603)
-- Name: index_item_self_joins_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_item_id ON public.item_self_joins USING btree (item_id);


--
-- TOC entry 4190 (class 1259 OID 10133604)
-- Name: index_item_self_joins_on_related_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_related_item_id ON public.item_self_joins USING btree (related_item_id);


--
-- TOC entry 4193 (class 1259 OID 10133605)
-- Name: index_items_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_medium_id ON public.items USING btree (medium_id);


--
-- TOC entry 4194 (class 1259 OID 10133606)
-- Name: index_items_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_section_id ON public.items USING btree (section_id);


--
-- TOC entry 4197 (class 1259 OID 10133607)
-- Name: index_lecture_memberships_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_lecture_id ON public.lecture_memberships USING btree (lecture_id);


--
-- TOC entry 4198 (class 1259 OID 10133608)
-- Name: index_lecture_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_source_campaign_id ON public.lecture_memberships USING btree (source_campaign_id);


--
-- TOC entry 4199 (class 1259 OID 10133609)
-- Name: index_lecture_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_user_id ON public.lecture_memberships USING btree (user_id);


--
-- TOC entry 4200 (class 1259 OID 10133610)
-- Name: index_lecture_memberships_on_user_id_and_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_lecture_memberships_on_user_id_and_lecture_id ON public.lecture_memberships USING btree (user_id, lecture_id);


--
-- TOC entry 4203 (class 1259 OID 10133611)
-- Name: index_lecture_user_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_lecture_id ON public.lecture_user_joins USING btree (lecture_id);


--
-- TOC entry 4204 (class 1259 OID 10133612)
-- Name: index_lecture_user_joins_on_lecture_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_lecture_user_joins_on_lecture_id_and_user_id ON public.lecture_user_joins USING btree (lecture_id, user_id);


--
-- TOC entry 4205 (class 1259 OID 10133613)
-- Name: index_lecture_user_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_user_id ON public.lecture_user_joins USING btree (user_id);


--
-- TOC entry 4208 (class 1259 OID 10133614)
-- Name: index_lectures_on_released; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_released ON public.lectures USING btree (released);


--
-- TOC entry 4209 (class 1259 OID 10133615)
-- Name: index_lectures_on_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_sort ON public.lectures USING btree (sort);


--
-- TOC entry 4210 (class 1259 OID 10133616)
-- Name: index_lectures_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_teacher_id ON public.lectures USING btree (teacher_id);


--
-- TOC entry 4211 (class 1259 OID 10133617)
-- Name: index_lectures_on_term_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_term_id ON public.lectures USING btree (term_id);


--
-- TOC entry 4214 (class 1259 OID 10133618)
-- Name: index_lesson_section_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_lesson_id ON public.lesson_section_joins USING btree (lesson_id);


--
-- TOC entry 4215 (class 1259 OID 10133619)
-- Name: index_lesson_section_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_section_id ON public.lesson_section_joins USING btree (section_id);


--
-- TOC entry 4218 (class 1259 OID 10133620)
-- Name: index_lesson_tag_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_lesson_id ON public.lesson_tag_joins USING btree (lesson_id);


--
-- TOC entry 4219 (class 1259 OID 10133621)
-- Name: index_lesson_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_tag_id ON public.lesson_tag_joins USING btree (tag_id);


--
-- TOC entry 4222 (class 1259 OID 10133622)
-- Name: index_lessons_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lessons_on_lecture_id ON public.lessons USING btree (lecture_id);


--
-- TOC entry 4225 (class 1259 OID 10133623)
-- Name: index_links_on_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linked_medium_id ON public.links USING btree (linked_medium_id);


--
-- TOC entry 4226 (class 1259 OID 10133624)
-- Name: index_links_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_medium_id ON public.links USING btree (medium_id);


--
-- TOC entry 4227 (class 1259 OID 10133625)
-- Name: index_links_on_medium_id_and_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_links_on_medium_id_and_linked_medium_id ON public.links USING btree (medium_id, linked_medium_id);


--
-- TOC entry 4230 (class 1259 OID 10133626)
-- Name: index_media_on_answers_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_answers_count ON public.media USING btree (answers_count);


--
-- TOC entry 4231 (class 1259 OID 10133627)
-- Name: index_media_on_content_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_content_trgm ON public.media USING gin (content public.gin_trgm_ops);


--
-- TOC entry 4232 (class 1259 OID 10133628)
-- Name: index_media_on_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_description_trgm ON public.media USING gin (description public.gin_trgm_ops);


--
-- TOC entry 4233 (class 1259 OID 10133629)
-- Name: index_media_on_external_link_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_external_link_description_trgm ON public.media USING gin (external_link_description public.gin_trgm_ops);


--
-- TOC entry 4234 (class 1259 OID 10133630)
-- Name: index_media_on_released; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_released ON public.media USING btree (released);


--
-- TOC entry 4235 (class 1259 OID 10133631)
-- Name: index_media_on_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_sort ON public.media USING btree (sort);


--
-- TOC entry 4236 (class 1259 OID 10133632)
-- Name: index_media_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_teachable_type_and_teachable_id ON public.media USING btree (teachable_type, teachable_id);


--
-- TOC entry 4237 (class 1259 OID 10133633)
-- Name: index_media_on_text_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_text_trgm ON public.media USING gin (text public.gin_trgm_ops);


--
-- TOC entry 4240 (class 1259 OID 10133634)
-- Name: index_medium_tag_joins_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_medium_id ON public.medium_tag_joins USING btree (medium_id);


--
-- TOC entry 4241 (class 1259 OID 10133635)
-- Name: index_medium_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_tag_id ON public.medium_tag_joins USING btree (tag_id);


--
-- TOC entry 4244 (class 1259 OID 10133636)
-- Name: index_notifications_on_notifiable_id_and_notifiable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_notifiable_id_and_notifiable_type ON public.notifications USING btree (notifiable_id, notifiable_type);


--
-- TOC entry 4245 (class 1259 OID 10133637)
-- Name: index_notifications_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_recipient_id ON public.notifications USING btree (recipient_id);


--
-- TOC entry 4248 (class 1259 OID 10133638)
-- Name: index_notions_on_aliased_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_aliased_tag_id ON public.notions USING btree (aliased_tag_id);


--
-- TOC entry 4249 (class 1259 OID 10133639)
-- Name: index_notions_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_tag_id ON public.notions USING btree (tag_id);


--
-- TOC entry 4250 (class 1259 OID 10133640)
-- Name: index_notions_on_title_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_title_trigram ON public.notions USING gin (title public.gin_trgm_ops);


--
-- TOC entry 4251 (class 1259 OID 10133641)
-- Name: index_notions_on_title_tsearch; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_title_tsearch ON public.notions USING gin (to_tsvector('simple'::regconfig, title));


--
-- TOC entry 4254 (class 1259 OID 10133642)
-- Name: index_program_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_locale ON public.program_translations USING btree (locale);


--
-- TOC entry 4255 (class 1259 OID 10133643)
-- Name: index_program_translations_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_program_id ON public.program_translations USING btree (program_id);


--
-- TOC entry 4258 (class 1259 OID 10133644)
-- Name: index_programs_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_programs_on_subject_id ON public.programs USING btree (subject_id);


--
-- TOC entry 4261 (class 1259 OID 10133645)
-- Name: index_quiz_certificates_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_quiz_id ON public.quiz_certificates USING btree (quiz_id);


--
-- TOC entry 4262 (class 1259 OID 10133646)
-- Name: index_quiz_certificates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_user_id ON public.quiz_certificates USING btree (user_id);


--
-- TOC entry 4267 (class 1259 OID 10133647)
-- Name: index_redemptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_redemptions_on_user_id ON public.redemptions USING btree (user_id);


--
-- TOC entry 4268 (class 1259 OID 10133648)
-- Name: index_redemptions_on_voucher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_redemptions_on_voucher_id ON public.redemptions USING btree (voucher_id);


--
-- TOC entry 4271 (class 1259 OID 10133649)
-- Name: index_referrals_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_item_id ON public.referrals USING btree (item_id);


--
-- TOC entry 4272 (class 1259 OID 10133650)
-- Name: index_referrals_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_medium_id ON public.referrals USING btree (medium_id);


--
-- TOC entry 4295 (class 1259 OID 10133651)
-- Name: index_reg_user_regs_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reg_user_regs_on_campaign_id ON public.registration_user_registrations USING btree (registration_campaign_id);


--
-- TOC entry 4296 (class 1259 OID 10133652)
-- Name: index_reg_user_regs_on_rejection_overridden_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reg_user_regs_on_rejection_overridden_at ON public.registration_user_registrations USING btree (rejection_overridden_at);


--
-- TOC entry 4297 (class 1259 OID 10133653)
-- Name: index_reg_user_regs_unique_exclusive_assignment_unranked; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_exclusive_assignment_unranked ON public.registration_user_registrations USING btree (registration_campaign_id, user_id) WHERE ((exclusive_assignment = true) AND (preference_rank IS NULL));


--
-- TOC entry 4298 (class 1259 OID 10133654)
-- Name: index_reg_user_regs_unique_item_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_item_user ON public.registration_user_registrations USING btree (registration_campaign_id, user_id, registration_item_id);


--
-- TOC entry 4299 (class 1259 OID 10133655)
-- Name: index_reg_user_regs_unique_ranked; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_ranked ON public.registration_user_registrations USING btree (registration_campaign_id, user_id, preference_rank) WHERE (preference_rank IS NOT NULL);


--
-- TOC entry 4275 (class 1259 OID 10133656)
-- Name: index_registration_campaigns_on_allocation_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_allocation_mode ON public.registration_campaigns USING btree (allocation_mode);


--
-- TOC entry 4276 (class 1259 OID 10133657)
-- Name: index_registration_campaigns_on_campaignable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_campaignable ON public.registration_campaigns USING btree (campaignable_type, campaignable_id);


--
-- TOC entry 4277 (class 1259 OID 10133658)
-- Name: index_registration_campaigns_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_status ON public.registration_campaigns USING btree (status);


--
-- TOC entry 4280 (class 1259 OID 10133659)
-- Name: index_registration_items_on_registration_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_items_on_registration_campaign_id ON public.registration_items USING btree (registration_campaign_id);


--
-- TOC entry 4281 (class 1259 OID 10133660)
-- Name: index_registration_items_on_unique_registerable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_registration_items_on_unique_registerable ON public.registration_items USING btree (registerable_type, registerable_id);


--
-- TOC entry 4284 (class 1259 OID 10133661)
-- Name: index_registration_policies_on_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_active ON public.registration_policies USING btree (active);


--
-- TOC entry 4285 (class 1259 OID 10133662)
-- Name: index_registration_policies_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_kind ON public.registration_policies USING btree (kind);


--
-- TOC entry 4286 (class 1259 OID 10133663)
-- Name: index_registration_policies_on_phase; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_phase ON public.registration_policies USING btree (phase);


--
-- TOC entry 4287 (class 1259 OID 10133664)
-- Name: index_registration_policies_on_registration_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_registration_campaign_id ON public.registration_policies USING btree (registration_campaign_id);


--
-- TOC entry 4288 (class 1259 OID 10133665)
-- Name: index_registration_policies_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_position ON public.registration_policies USING btree (registration_campaign_id, "position");


--
-- TOC entry 4291 (class 1259 OID 10133666)
-- Name: index_registration_student_messages_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_student_messages_on_lecture_id ON public.registration_student_messages USING btree (lecture_id);


--
-- TOC entry 4292 (class 1259 OID 10133667)
-- Name: index_registration_student_messages_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_student_messages_on_sender_id ON public.registration_student_messages USING btree (sender_id);


--
-- TOC entry 4300 (class 1259 OID 10133668)
-- Name: index_registration_user_registrations_on_registration_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_registration_item_id ON public.registration_user_registrations USING btree (registration_item_id);


--
-- TOC entry 4301 (class 1259 OID 10133669)
-- Name: index_registration_user_registrations_on_rejection_policy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_rejection_policy_id ON public.registration_user_registrations USING btree (rejection_policy_id);


--
-- TOC entry 4302 (class 1259 OID 10133670)
-- Name: index_registration_user_registrations_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_status ON public.registration_user_registrations USING btree (status);


--
-- TOC entry 4303 (class 1259 OID 10133671)
-- Name: index_registration_user_registrations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_user_id ON public.registration_user_registrations USING btree (user_id);


--
-- TOC entry 4306 (class 1259 OID 10133672)
-- Name: index_relations_on_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_related_tag_id ON public.relations USING btree (related_tag_id);


--
-- TOC entry 4307 (class 1259 OID 10133673)
-- Name: index_relations_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_tag_id ON public.relations USING btree (tag_id);


--
-- TOC entry 4308 (class 1259 OID 10133674)
-- Name: index_relations_on_tag_id_and_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_relations_on_tag_id_and_related_tag_id ON public.relations USING btree (tag_id, related_tag_id);


--
-- TOC entry 4313 (class 1259 OID 10133675)
-- Name: index_section_tag_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_section_id ON public.section_tag_joins USING btree (section_id);


--
-- TOC entry 4314 (class 1259 OID 10133676)
-- Name: index_section_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_tag_id ON public.section_tag_joins USING btree (tag_id);


--
-- TOC entry 4317 (class 1259 OID 10133677)
-- Name: index_sections_on_chapter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_chapter_id ON public.sections USING btree (chapter_id);


--
-- TOC entry 4318 (class 1259 OID 10133678)
-- Name: index_sections_on_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_title_trgm ON public.sections USING gin (title public.gin_trgm_ops);


--
-- TOC entry 4321 (class 1259 OID 10133679)
-- Name: index_speaker_talk_joins_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_source_campaign_id ON public.speaker_talk_joins USING btree (source_campaign_id);


--
-- TOC entry 4322 (class 1259 OID 10133680)
-- Name: index_speaker_talk_joins_on_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_speaker_id ON public.speaker_talk_joins USING btree (speaker_id);


--
-- TOC entry 4323 (class 1259 OID 10133681)
-- Name: index_speaker_talk_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_talk_id ON public.speaker_talk_joins USING btree (talk_id);


--
-- TOC entry 4324 (class 1259 OID 10133682)
-- Name: index_speaker_talk_joins_on_talk_id_and_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_speaker_talk_joins_on_talk_id_and_speaker_id ON public.speaker_talk_joins USING btree (talk_id, speaker_id);


--
-- TOC entry 4327 (class 1259 OID 10133683)
-- Name: index_subject_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_locale ON public.subject_translations USING btree (locale);


--
-- TOC entry 4328 (class 1259 OID 10133684)
-- Name: index_subject_translations_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_subject_id ON public.subject_translations USING btree (subject_id);


--
-- TOC entry 4333 (class 1259 OID 10133685)
-- Name: index_submissions_on_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_assignment_id ON public.submissions USING btree (assignment_id);


--
-- TOC entry 4334 (class 1259 OID 10133686)
-- Name: index_submissions_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_submissions_on_token ON public.submissions USING btree (token);


--
-- TOC entry 4335 (class 1259 OID 10133687)
-- Name: index_submissions_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_tutorial_id ON public.submissions USING btree (tutorial_id);


--
-- TOC entry 4340 (class 1259 OID 10133688)
-- Name: index_talk_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_tag_id ON public.talk_tag_joins USING btree (tag_id);


--
-- TOC entry 4341 (class 1259 OID 10133689)
-- Name: index_talk_tag_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_talk_id ON public.talk_tag_joins USING btree (talk_id);


--
-- TOC entry 4344 (class 1259 OID 10133690)
-- Name: index_talks_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_lecture_id ON public.talks USING btree (lecture_id);


--
-- TOC entry 4345 (class 1259 OID 10133691)
-- Name: index_talks_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_self_materialization_mode ON public.talks USING btree (self_materialization_mode);


--
-- TOC entry 4348 (class 1259 OID 10133692)
-- Name: index_terms_on_year_and_season; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_terms_on_year_and_season ON public.terms USING btree (year, season);


--
-- TOC entry 4351 (class 1259 OID 10133693)
-- Name: index_thredded_categories_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_categories_on_messageboard_id ON public.thredded_categories USING btree (messageboard_id);


--
-- TOC entry 4352 (class 1259 OID 10133694)
-- Name: index_thredded_categories_on_messageboard_id_and_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_categories_on_messageboard_id_and_slug ON public.thredded_categories USING btree (messageboard_id, slug);


--
-- TOC entry 4361 (class 1259 OID 10133695)
-- Name: index_thredded_messageboard_users_for_recently_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboard_users_for_recently_active ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, last_seen_at);


--
-- TOC entry 4362 (class 1259 OID 10133696)
-- Name: index_thredded_messageboard_users_primary; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboard_users_primary ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, thredded_user_detail_id);


--
-- TOC entry 4365 (class 1259 OID 10133697)
-- Name: index_thredded_messageboards_on_messageboard_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboards_on_messageboard_group_id ON public.thredded_messageboards USING btree (messageboard_group_id);


--
-- TOC entry 4366 (class 1259 OID 10133698)
-- Name: index_thredded_messageboards_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboards_on_slug ON public.thredded_messageboards USING btree (slug);


--
-- TOC entry 4375 (class 1259 OID 10133699)
-- Name: index_thredded_moderation_records_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_moderation_records_for_display ON public.thredded_post_moderation_records USING btree (messageboard_id, created_at DESC);


--
-- TOC entry 4378 (class 1259 OID 10133700)
-- Name: index_thredded_posts_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_for_display ON public.thredded_posts USING btree (moderation_state, updated_at);


--
-- TOC entry 4379 (class 1259 OID 10133701)
-- Name: index_thredded_posts_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_messageboard_id ON public.thredded_posts USING btree (messageboard_id);


--
-- TOC entry 4380 (class 1259 OID 10133702)
-- Name: index_thredded_posts_on_postable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id ON public.thredded_posts USING btree (postable_id);


--
-- TOC entry 4381 (class 1259 OID 10133703)
-- Name: index_thredded_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id_and_created_at ON public.thredded_posts USING btree (postable_id, created_at);


--
-- TOC entry 4382 (class 1259 OID 10133704)
-- Name: index_thredded_posts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_user_id ON public.thredded_posts USING btree (user_id);


--
-- TOC entry 4386 (class 1259 OID 10133705)
-- Name: index_thredded_private_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_posts_on_postable_id_and_created_at ON public.thredded_private_posts USING btree (postable_id, created_at);


--
-- TOC entry 4389 (class 1259 OID 10133706)
-- Name: index_thredded_private_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_hash_id ON public.thredded_private_topics USING btree (hash_id);


--
-- TOC entry 4390 (class 1259 OID 10133707)
-- Name: index_thredded_private_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_last_post_at ON public.thredded_private_topics USING btree (last_post_at);


--
-- TOC entry 4391 (class 1259 OID 10133708)
-- Name: index_thredded_private_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_private_topics_on_slug ON public.thredded_private_topics USING btree (slug);


--
-- TOC entry 4394 (class 1259 OID 10133709)
-- Name: index_thredded_private_users_on_private_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_private_topic_id ON public.thredded_private_users USING btree (private_topic_id);


--
-- TOC entry 4395 (class 1259 OID 10133710)
-- Name: index_thredded_private_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_user_id ON public.thredded_private_users USING btree (user_id);


--
-- TOC entry 4398 (class 1259 OID 10133711)
-- Name: index_thredded_topic_categories_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_category_id ON public.thredded_topic_categories USING btree (category_id);


--
-- TOC entry 4399 (class 1259 OID 10133712)
-- Name: index_thredded_topic_categories_on_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_topic_id ON public.thredded_topic_categories USING btree (topic_id);


--
-- TOC entry 4402 (class 1259 OID 10133713)
-- Name: index_thredded_topics_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_for_display ON public.thredded_topics USING btree (moderation_state, sticky DESC, updated_at DESC);


--
-- TOC entry 4403 (class 1259 OID 10133714)
-- Name: index_thredded_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_hash_id ON public.thredded_topics USING btree (hash_id);


--
-- TOC entry 4404 (class 1259 OID 10133715)
-- Name: index_thredded_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_last_post_at ON public.thredded_topics USING btree (last_post_at);


--
-- TOC entry 4405 (class 1259 OID 10133716)
-- Name: index_thredded_topics_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_messageboard_id ON public.thredded_topics USING btree (messageboard_id);


--
-- TOC entry 4406 (class 1259 OID 10133717)
-- Name: index_thredded_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_topics_on_slug ON public.thredded_topics USING btree (slug);


--
-- TOC entry 4407 (class 1259 OID 10133718)
-- Name: index_thredded_topics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_user_id ON public.thredded_topics USING btree (user_id);


--
-- TOC entry 4411 (class 1259 OID 10133719)
-- Name: index_thredded_user_details_for_moderations; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_for_moderations ON public.thredded_user_details USING btree (moderation_state, moderation_state_changed_at DESC);


--
-- TOC entry 4412 (class 1259 OID 10133720)
-- Name: index_thredded_user_details_on_latest_activity_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_on_latest_activity_at ON public.thredded_user_details USING btree (latest_activity_at);


--
-- TOC entry 4413 (class 1259 OID 10133721)
-- Name: index_thredded_user_details_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_details_on_user_id ON public.thredded_user_details USING btree (user_id);


--
-- TOC entry 4419 (class 1259 OID 10133722)
-- Name: index_thredded_user_post_notifications_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_post_notifications_on_post_id ON public.thredded_user_post_notifications USING btree (post_id);


--
-- TOC entry 4420 (class 1259 OID 10133723)
-- Name: index_thredded_user_post_notifications_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_post_notifications_on_user_id_and_post_id ON public.thredded_user_post_notifications USING btree (user_id, post_id);


--
-- TOC entry 4423 (class 1259 OID 10133724)
-- Name: index_thredded_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_preferences_on_user_id ON public.thredded_user_preferences USING btree (user_id);


--
-- TOC entry 4432 (class 1259 OID 10133725)
-- Name: index_thredded_user_topic_read_states_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_topic_read_states_on_messageboard_id ON public.thredded_user_topic_read_states USING btree (messageboard_id);


--
-- TOC entry 4437 (class 1259 OID 10133726)
-- Name: index_tutor_tutorial_joins_on_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutor_id ON public.tutor_tutorial_joins USING btree (tutor_id);


--
-- TOC entry 4438 (class 1259 OID 10133727)
-- Name: index_tutor_tutorial_joins_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutorial_id ON public.tutor_tutorial_joins USING btree (tutorial_id);


--
-- TOC entry 4439 (class 1259 OID 10133728)
-- Name: index_tutor_tutorial_joins_on_tutorial_id_and_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutor_tutorial_joins_on_tutorial_id_and_tutor_id ON public.tutor_tutorial_joins USING btree (tutorial_id, tutor_id);


--
-- TOC entry 4442 (class 1259 OID 10133729)
-- Name: index_tutorial_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_source_campaign_id ON public.tutorial_memberships USING btree (source_campaign_id);


--
-- TOC entry 4443 (class 1259 OID 10133730)
-- Name: index_tutorial_memberships_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_tutorial_id ON public.tutorial_memberships USING btree (tutorial_id);


--
-- TOC entry 4444 (class 1259 OID 10133731)
-- Name: index_tutorial_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_user_id ON public.tutorial_memberships USING btree (user_id);


--
-- TOC entry 4445 (class 1259 OID 10133732)
-- Name: index_tutorial_memberships_on_user_id_and_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorial_memberships_on_user_id_and_lecture_id ON public.tutorial_memberships USING btree (user_id, lecture_id);


--
-- TOC entry 4446 (class 1259 OID 10133733)
-- Name: index_tutorial_memberships_on_user_id_and_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorial_memberships_on_user_id_and_tutorial_id ON public.tutorial_memberships USING btree (user_id, tutorial_id);


--
-- TOC entry 4449 (class 1259 OID 10133734)
-- Name: index_tutorials_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_lecture_id ON public.tutorials USING btree (lecture_id);


--
-- TOC entry 4450 (class 1259 OID 10133735)
-- Name: index_tutorials_on_lecture_id_and_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorials_on_lecture_id_and_title_unique ON public.tutorials USING btree (lecture_id, title);


--
-- TOC entry 4451 (class 1259 OID 10133736)
-- Name: index_tutorials_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_self_materialization_mode ON public.tutorials USING btree (self_materialization_mode);


--
-- TOC entry 4454 (class 1259 OID 10133737)
-- Name: index_user_favorite_lecture_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_lecture_id ON public.user_favorite_lecture_joins USING btree (lecture_id);


--
-- TOC entry 4455 (class 1259 OID 10133738)
-- Name: index_user_favorite_lecture_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_user_id ON public.user_favorite_lecture_joins USING btree (user_id);


--
-- TOC entry 4458 (class 1259 OID 10133739)
-- Name: index_user_submission_joins_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_submission_id ON public.user_submission_joins USING btree (submission_id);


--
-- TOC entry 4459 (class 1259 OID 10133740)
-- Name: index_user_submission_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_user_id ON public.user_submission_joins USING btree (user_id);


--
-- TOC entry 4462 (class 1259 OID 10133741)
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- TOC entry 4463 (class 1259 OID 10133742)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 4464 (class 1259 OID 10133743)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 4465 (class 1259 OID 10133744)
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- TOC entry 4468 (class 1259 OID 10133745)
-- Name: index_vignettes_answers_on_vignettes_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_question_id ON public.vignettes_answers USING btree (vignettes_question_id);


--
-- TOC entry 4469 (class 1259 OID 10133746)
-- Name: index_vignettes_answers_on_vignettes_slide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_slide_id ON public.vignettes_answers USING btree (vignettes_slide_id);


--
-- TOC entry 4470 (class 1259 OID 10133747)
-- Name: index_vignettes_answers_on_vignettes_user_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_user_answer_id ON public.vignettes_answers USING btree (vignettes_user_answer_id);


--
-- TOC entry 4475 (class 1259 OID 10133748)
-- Name: index_vignettes_codenames_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_codenames_on_lecture_id ON public.vignettes_codenames USING btree (lecture_id);


--
-- TOC entry 4476 (class 1259 OID 10133749)
-- Name: index_vignettes_codenames_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_codenames_on_user_id ON public.vignettes_codenames USING btree (user_id);


--
-- TOC entry 4479 (class 1259 OID 10133750)
-- Name: index_vignettes_completion_messages_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_completion_messages_on_lecture_id ON public.vignettes_completion_messages USING btree (lecture_id);


--
-- TOC entry 4482 (class 1259 OID 10133751)
-- Name: index_vignettes_info_slides_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_info_slides_on_vignettes_questionnaire_id ON public.vignettes_info_slides USING btree (vignettes_questionnaire_id);


--
-- TOC entry 4487 (class 1259 OID 10133752)
-- Name: index_vignettes_options_on_vignettes_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_options_on_vignettes_question_id ON public.vignettes_options USING btree (vignettes_question_id);


--
-- TOC entry 4490 (class 1259 OID 10133753)
-- Name: index_vignettes_questionnaires_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_questionnaires_on_lecture_id ON public.vignettes_questionnaires USING btree (lecture_id);


--
-- TOC entry 4493 (class 1259 OID 10133754)
-- Name: index_vignettes_questions_on_vignettes_slide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_questions_on_vignettes_slide_id ON public.vignettes_questions USING btree (vignettes_slide_id);


--
-- TOC entry 4496 (class 1259 OID 10133755)
-- Name: index_vignettes_slide_statistics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slide_statistics_on_user_id ON public.vignettes_slide_statistics USING btree (user_id);


--
-- TOC entry 4497 (class 1259 OID 10133756)
-- Name: index_vignettes_slide_statistics_on_vignettes_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slide_statistics_on_vignettes_answer_id ON public.vignettes_slide_statistics USING btree (vignettes_answer_id);


--
-- TOC entry 4500 (class 1259 OID 10133757)
-- Name: index_vignettes_slides_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slides_on_position ON public.vignettes_slides USING btree ("position");


--
-- TOC entry 4501 (class 1259 OID 10133758)
-- Name: index_vignettes_slides_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slides_on_vignettes_questionnaire_id ON public.vignettes_slides USING btree (vignettes_questionnaire_id);


--
-- TOC entry 4504 (class 1259 OID 10133759)
-- Name: index_vignettes_user_answers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_user_answers_on_user_id ON public.vignettes_user_answers USING btree (user_id);


--
-- TOC entry 4505 (class 1259 OID 10133760)
-- Name: index_vignettes_user_answers_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_user_answers_on_vignettes_questionnaire_id ON public.vignettes_user_answers USING btree (vignettes_questionnaire_id);


--
-- TOC entry 4508 (class 1259 OID 10133761)
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON public.votes USING btree (votable_id, votable_type, vote_scope);


--
-- TOC entry 4509 (class 1259 OID 10133762)
-- Name: index_votes_on_votable_type_and_votable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_type_and_votable_id ON public.votes USING btree (votable_type, votable_id);


--
-- TOC entry 4510 (class 1259 OID 10133763)
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON public.votes USING btree (voter_id, voter_type, vote_scope);


--
-- TOC entry 4511 (class 1259 OID 10133764)
-- Name: index_votes_on_voter_type_and_voter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_type_and_voter_id ON public.votes USING btree (voter_type, voter_id);


--
-- TOC entry 4514 (class 1259 OID 10133765)
-- Name: index_vouchers_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vouchers_on_lecture_id ON public.vouchers USING btree (lecture_id);


--
-- TOC entry 4515 (class 1259 OID 10133766)
-- Name: index_vouchers_on_secure_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_vouchers_on_secure_hash ON public.vouchers USING btree (secure_hash);


--
-- TOC entry 4518 (class 1259 OID 10133767)
-- Name: index_watchlist_entries_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_medium_id ON public.watchlist_entries USING btree (medium_id);


--
-- TOC entry 4519 (class 1259 OID 10133768)
-- Name: index_watchlist_entries_on_watchlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_watchlist_id ON public.watchlist_entries USING btree (watchlist_id);


--
-- TOC entry 4522 (class 1259 OID 10133769)
-- Name: index_watchlists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_user_id ON public.watchlists USING btree (user_id);


--
-- TOC entry 4523 (class 1259 OID 10133770)
-- Name: index_watchlists_on_watchlist_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_watchlist_entry_id ON public.watchlists USING btree (watchlist_entry_id);


--
-- TOC entry 4168 (class 1259 OID 10133771)
-- Name: polymorphic_editable_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_editable_idx ON public.editable_user_joins USING btree (editable_id, editable_type);


--
-- TOC entry 4169 (class 1259 OID 10133772)
-- Name: polymorphic_many_to_many_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_many_to_many_idx ON public.editable_user_joins USING btree (editable_id, editable_type, user_id);


--
-- TOC entry 4353 (class 1259 OID 10133773)
-- Name: thredded_categories_name_ci; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_categories_name_ci ON public.thredded_categories USING btree (lower(name) text_pattern_ops);


--
-- TOC entry 4360 (class 1259 OID 10133774)
-- Name: thredded_messageboard_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_messageboard_notifications_for_followed_topics_unique ON public.thredded_messageboard_notifications_for_followed_topics USING btree (user_id, messageboard_id, notifier_key);


--
-- TOC entry 4371 (class 1259 OID 10133775)
-- Name: thredded_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_followed_topics_unique ON public.thredded_notifications_for_followed_topics USING btree (user_id, notifier_key);


--
-- TOC entry 4374 (class 1259 OID 10133776)
-- Name: thredded_notifications_for_private_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_private_topics_unique ON public.thredded_notifications_for_private_topics USING btree (user_id, notifier_key);


--
-- TOC entry 4383 (class 1259 OID 10133777)
-- Name: thredded_posts_content_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_posts_content_fts ON public.thredded_posts USING gist (to_tsvector('english'::regconfig, content));


--
-- TOC entry 4410 (class 1259 OID 10133778)
-- Name: thredded_topics_title_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_topics_title_fts ON public.thredded_topics USING gist (to_tsvector('english'::regconfig, title));


--
-- TOC entry 4418 (class 1259 OID 10133779)
-- Name: thredded_user_messageboard_preferences_user_id_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_messageboard_preferences_user_id_messageboard_id ON public.thredded_user_messageboard_preferences USING btree (user_id, messageboard_id);


--
-- TOC entry 4428 (class 1259 OID 10133780)
-- Name: thredded_user_private_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_private_topic_read_states_user_postable ON public.thredded_user_private_topic_read_states USING btree (user_id, postable_id);


--
-- TOC entry 4431 (class 1259 OID 10133781)
-- Name: thredded_user_topic_follows_user_topic; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_follows_user_topic ON public.thredded_user_topic_follows USING btree (user_id, topic_id);


--
-- TOC entry 4435 (class 1259 OID 10133782)
-- Name: thredded_user_topic_read_states_user_messageboard; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_user_topic_read_states_user_messageboard ON public.thredded_user_topic_read_states USING btree (user_id, messageboard_id);


--
-- TOC entry 4436 (class 1259 OID 10133783)
-- Name: thredded_user_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_read_states_user_postable ON public.thredded_user_topic_read_states USING btree (user_id, postable_id);


--
-- TOC entry 4543 (class 2606 OID 10133784)
-- Name: imports fk_rails_018d34d0a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT fk_rails_018d34d0a7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4607 (class 2606 OID 10133789)
-- Name: watchlist_entries fk_rails_021aafbf37; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_021aafbf37 FOREIGN KEY (watchlist_id) REFERENCES public.watchlists(id);


--
-- TOC entry 4595 (class 2606 OID 10133794)
-- Name: vignettes_codenames fk_rails_02690186bc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT fk_rails_02690186bc FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4570 (class 2606 OID 10133799)
-- Name: speaker_talk_joins fk_rails_06579d230c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_06579d230c FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4578 (class 2606 OID 10133804)
-- Name: thredded_messageboard_users fk_rails_06e42c62f5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_06e42c62f5 FOREIGN KEY (thredded_user_detail_id) REFERENCES public.thredded_user_details(id) ON DELETE CASCADE;


--
-- TOC entry 4609 (class 2606 OID 10133809)
-- Name: watchlists fk_rails_0dc1a4cbcb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_0dc1a4cbcb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4564 (class 2606 OID 10133814)
-- Name: registration_student_messages fk_rails_11439afa9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT fk_rails_11439afa9f FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4577 (class 2606 OID 10133819)
-- Name: talks fk_rails_1210911b58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT fk_rails_1210911b58 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4591 (class 2606 OID 10133824)
-- Name: user_submission_joins fk_rails_12d41a7e23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT fk_rails_12d41a7e23 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4558 (class 2606 OID 10133829)
-- Name: redemptions fk_rails_14fa576d5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT fk_rails_14fa576d5b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4600 (class 2606 OID 10133834)
-- Name: vignettes_questions fk_rails_166147907b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions
    ADD CONSTRAINT fk_rails_166147907b FOREIGN KEY (vignettes_slide_id) REFERENCES public.vignettes_slides(id);


--
-- TOC entry 4555 (class 2606 OID 10133839)
-- Name: programs fk_rails_174715887a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT fk_rails_174715887a FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 4571 (class 2606 OID 10133844)
-- Name: speaker_talk_joins fk_rails_1d337b4d3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_1d337b4d3d FOREIGN KEY (speaker_id) REFERENCES public.users(id);


--
-- TOC entry 4549 (class 2606 OID 10133849)
-- Name: lecture_user_joins fk_rails_1e48112fae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_1e48112fae FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4566 (class 2606 OID 10133854)
-- Name: registration_user_registrations fk_rails_2c25a6b50a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_2c25a6b50a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4532 (class 2606 OID 10133859)
-- Name: assignments fk_rails_2d7bf5a691; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_rails_2d7bf5a691 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4546 (class 2606 OID 10133864)
-- Name: lecture_memberships fk_rails_32871c16bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_32871c16bd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4608 (class 2606 OID 10133869)
-- Name: watchlist_entries fk_rails_32f03600d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_32f03600d9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4592 (class 2606 OID 10133874)
-- Name: vignettes_answers fk_rails_341ebaf06f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_341ebaf06f FOREIGN KEY (vignettes_question_id) REFERENCES public.vignettes_questions(id);


--
-- TOC entry 4580 (class 2606 OID 10133879)
-- Name: thredded_user_post_notifications fk_rails_364d7e370a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_364d7e370a FOREIGN KEY (post_id) REFERENCES public.thredded_posts(id) ON DELETE CASCADE;


--
-- TOC entry 4573 (class 2606 OID 10133884)
-- Name: submissions fk_rails_3a2b44e658; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_3a2b44e658 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4598 (class 2606 OID 10133889)
-- Name: vignettes_options fk_rails_3fbca24de5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options
    ADD CONSTRAINT fk_rails_3fbca24de5 FOREIGN KEY (vignettes_question_id) REFERENCES public.vignettes_questions(id);


--
-- TOC entry 4528 (class 2606 OID 10133894)
-- Name: annotations fk_rails_4043df79bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_4043df79bf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4589 (class 2606 OID 10133899)
-- Name: user_favorite_lecture_joins fk_rails_40985ebb4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_40985ebb4f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4551 (class 2606 OID 10133904)
-- Name: links fk_rails_49020b7472; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_49020b7472 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4529 (class 2606 OID 10133909)
-- Name: annotations fk_rails_4f1a0f89b4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_4f1a0f89b4 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4537 (class 2606 OID 10133914)
-- Name: commontator_comments fk_rails_558e599d00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_558e599d00 FOREIGN KEY (parent_id) REFERENCES public.commontator_comments(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4581 (class 2606 OID 10133919)
-- Name: thredded_user_post_notifications fk_rails_5908eec802; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_5908eec802 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4530 (class 2606 OID 10133924)
-- Name: announcements fk_rails_5b3f1d7737; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_5b3f1d7737 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4567 (class 2606 OID 10133929)
-- Name: registration_user_registrations fk_rails_5c6f8c15b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_5c6f8c15b3 FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4574 (class 2606 OID 10133934)
-- Name: submissions fk_rails_61cac0823d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_61cac0823d FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- TOC entry 4534 (class 2606 OID 10133939)
-- Name: cohort_memberships fk_rails_65ac42442f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_65ac42442f FOREIGN KEY (cohort_id) REFERENCES public.cohorts(id);


--
-- TOC entry 4588 (class 2606 OID 10133944)
-- Name: tutorials fk_rails_66221d24a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT fk_rails_66221d24a3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4563 (class 2606 OID 10133949)
-- Name: registration_policies fk_rails_6664a314dd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_policies
    ADD CONSTRAINT fk_rails_6664a314dd FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4539 (class 2606 OID 10133954)
-- Name: commontator_subscriptions fk_rails_68cc24d064; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT fk_rails_68cc24d064 FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4596 (class 2606 OID 10133959)
-- Name: vignettes_codenames fk_rails_69dbadb217; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT fk_rails_69dbadb217 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4597 (class 2606 OID 10133964)
-- Name: vignettes_completion_messages fk_rails_6aade677d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages
    ADD CONSTRAINT fk_rails_6aade677d3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4552 (class 2606 OID 10133969)
-- Name: links fk_rails_6b5cb429ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_6b5cb429ed FOREIGN KEY (linked_medium_id) REFERENCES public.media(id);


--
-- TOC entry 4575 (class 2606 OID 10133974)
-- Name: talk_tag_joins fk_rails_6bcb0e8e5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_6bcb0e8e5f FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- TOC entry 4606 (class 2606 OID 10133979)
-- Name: vouchers fk_rails_7676476332; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT fk_rails_7676476332 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4590 (class 2606 OID 10133984)
-- Name: user_favorite_lecture_joins fk_rails_77bc049c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_77bc049c12 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4535 (class 2606 OID 10133989)
-- Name: cohort_memberships fk_rails_7bc5d74a9d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_7bc5d74a9d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4559 (class 2606 OID 10133994)
-- Name: redemptions fk_rails_8377a88a56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT fk_rails_8377a88a56 FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id);


--
-- TOC entry 4576 (class 2606 OID 10133999)
-- Name: talk_tag_joins fk_rails_85b7c429a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_85b7c429a2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 4610 (class 2606 OID 10134004)
-- Name: watchlists fk_rails_8780bd5b5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_8780bd5b5a FOREIGN KEY (watchlist_entry_id) REFERENCES public.watchlist_entries(id);


--
-- TOC entry 4604 (class 2606 OID 10134009)
-- Name: vignettes_user_answers fk_rails_8c438b6e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT fk_rails_8c438b6e8e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4605 (class 2606 OID 10134014)
-- Name: vignettes_user_answers fk_rails_8dc710c13d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT fk_rails_8dc710c13d FOREIGN KEY (vignettes_questionnaire_id) REFERENCES public.vignettes_questionnaires(id);


--
-- TOC entry 4601 (class 2606 OID 10134019)
-- Name: vignettes_slide_statistics fk_rails_8f79f13530; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT fk_rails_8f79f13530 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4568 (class 2606 OID 10134024)
-- Name: registration_user_registrations fk_rails_95b64a53dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_95b64a53dc FOREIGN KEY (registration_item_id) REFERENCES public.registration_items(id);


--
-- TOC entry 4538 (class 2606 OID 10134029)
-- Name: commontator_comments fk_rails_96666eb19a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_96666eb19a FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4579 (class 2606 OID 10134034)
-- Name: thredded_messageboard_users fk_rails_966803d714; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_966803d714 FOREIGN KEY (thredded_messageboard_id) REFERENCES public.thredded_messageboards(id) ON DELETE CASCADE;


--
-- TOC entry 4527 (class 2606 OID 10134039)
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 4562 (class 2606 OID 10134044)
-- Name: registration_items fk_rails_998ff8f041; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_items
    ADD CONSTRAINT fk_rails_998ff8f041 FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4544 (class 2606 OID 10134049)
-- Name: items fk_rails_99dcbdef9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_99dcbdef9f FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- TOC entry 4602 (class 2606 OID 10134054)
-- Name: vignettes_slide_statistics fk_rails_9a8745e04d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT fk_rails_9a8745e04d FOREIGN KEY (vignettes_answer_id) REFERENCES public.vignettes_answers(id);


--
-- TOC entry 4533 (class 2606 OID 10134059)
-- Name: claims fk_rails_9b419d5bd5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT fk_rails_9b419d5bd5 FOREIGN KEY (redemption_id) REFERENCES public.redemptions(id);


--
-- TOC entry 4560 (class 2606 OID 10134064)
-- Name: referrals fk_rails_9c4f45c15c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_9c4f45c15c FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4541 (class 2606 OID 10134069)
-- Name: divisions fk_rails_a1b344ef36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT fk_rails_a1b344ef36 FOREIGN KEY (program_id) REFERENCES public.programs(id);


--
-- TOC entry 4536 (class 2606 OID 10134074)
-- Name: cohort_memberships fk_rails_a81dcb9b7f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_a81dcb9b7f FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4545 (class 2606 OID 10134079)
-- Name: items fk_rails_add0a302a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_add0a302a9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4553 (class 2606 OID 10134084)
-- Name: medium_tag_joins fk_rails_b11130c931; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b11130c931 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4554 (class 2606 OID 10134089)
-- Name: medium_tag_joins fk_rails_b181027fb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b181027fb2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 4582 (class 2606 OID 10134094)
-- Name: tutor_tutorial_joins fk_rails_b781447eb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_b781447eb1 FOREIGN KEY (tutor_id) REFERENCES public.users(id);


--
-- TOC entry 4547 (class 2606 OID 10134099)
-- Name: lecture_memberships fk_rails_b952417d8f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_b952417d8f FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4584 (class 2606 OID 10134104)
-- Name: tutorial_memberships fk_rails_bc5fc1eb43; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_bc5fc1eb43 FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4550 (class 2606 OID 10134109)
-- Name: lecture_user_joins fk_rails_bdbf7bc779; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_bdbf7bc779 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4556 (class 2606 OID 10134114)
-- Name: quiz_certificates fk_rails_c10d7b5c91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_c10d7b5c91 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4526 (class 2606 OID 10134119)
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 4548 (class 2606 OID 10134124)
-- Name: lecture_memberships fk_rails_c4d0979517; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_c4d0979517 FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4542 (class 2606 OID 10134129)
-- Name: feedbacks fk_rails_c57bb6cf28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk_rails_c57bb6cf28 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4565 (class 2606 OID 10134134)
-- Name: registration_student_messages fk_rails_c97d206d38; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT fk_rails_c97d206d38 FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- TOC entry 4585 (class 2606 OID 10134139)
-- Name: tutorial_memberships fk_rails_cb8342e46b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_cb8342e46b FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4593 (class 2606 OID 10134144)
-- Name: vignettes_answers fk_rails_cc5b64b41a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_cc5b64b41a FOREIGN KEY (vignettes_slide_id) REFERENCES public.vignettes_slides(id);


--
-- TOC entry 4599 (class 2606 OID 10134149)
-- Name: vignettes_questionnaires fk_rails_cf4ca40f5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires
    ADD CONSTRAINT fk_rails_cf4ca40f5b FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4586 (class 2606 OID 10134154)
-- Name: tutorial_memberships fk_rails_d9260fbd52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_d9260fbd52 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4557 (class 2606 OID 10134159)
-- Name: quiz_certificates fk_rails_da91c72f96; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_da91c72f96 FOREIGN KEY (quiz_id) REFERENCES public.media(id);


--
-- TOC entry 4561 (class 2606 OID 10134164)
-- Name: referrals fk_rails_dce931e0f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_dce931e0f7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4594 (class 2606 OID 10134169)
-- Name: vignettes_answers fk_rails_dd314d5106; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_dd314d5106 FOREIGN KEY (vignettes_user_answer_id) REFERENCES public.vignettes_user_answers(id);


--
-- TOC entry 4572 (class 2606 OID 10134174)
-- Name: speaker_talk_joins fk_rails_e5bafe887c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_e5bafe887c FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- TOC entry 4603 (class 2606 OID 10134179)
-- Name: vignettes_slides fk_rails_e6d1817e26; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides
    ADD CONSTRAINT fk_rails_e6d1817e26 FOREIGN KEY (vignettes_questionnaire_id) REFERENCES public.vignettes_questionnaires(id);


--
-- TOC entry 4569 (class 2606 OID 10134184)
-- Name: registration_user_registrations fk_rails_ead649079d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_ead649079d FOREIGN KEY (rejection_policy_id) REFERENCES public.registration_policies(id);


--
-- TOC entry 4540 (class 2606 OID 10134189)
-- Name: course_self_joins fk_rails_ecb46f40b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT fk_rails_ecb46f40b3 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4583 (class 2606 OID 10134194)
-- Name: tutor_tutorial_joins fk_rails_f1a97a6dc5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_f1a97a6dc5 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4587 (class 2606 OID 10134199)
-- Name: tutorial_memberships fk_rails_fc3a3973e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_fc3a3973e1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4531 (class 2606 OID 10134204)
-- Name: announcements fk_rails_fd9bbf1b15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_fd9bbf1b15 FOREIGN KEY (announcer_id) REFERENCES public.users(id);


-- Completed on 2026-08-28 22:58:28 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict Md5qUXVycYdGPp37axZABbhEkbajm4yIfErDnwrKrmAMeyQZ5dH3bfjb9T0jnFd

