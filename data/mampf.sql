--
-- PostgreSQL database dump
--

\restrict Mofc2AT5q2ddESPwZxeUae4WfeNQEbdzEYlEjoEWCDd254TsThS1WzN1x7xCpxz

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

-- Started on 2026-08-28 15:09:52 UTC

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
-- TOC entry 2 (class 3079 OID 9663290)
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
-- TOC entry 3 (class 3079 OID 9663371)
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
-- TOC entry 4 (class 3079 OID 9663409)
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
-- TOC entry 222 (class 1259 OID 9663416)
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
-- TOC entry 223 (class 1259 OID 9663427)
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
-- TOC entry 224 (class 1259 OID 9663428)
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
-- TOC entry 225 (class 1259 OID 9663439)
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
-- TOC entry 226 (class 1259 OID 9663440)
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
-- TOC entry 227 (class 1259 OID 9663451)
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
-- TOC entry 228 (class 1259 OID 9663452)
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 9663460)
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
-- TOC entry 230 (class 1259 OID 9663461)
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
-- TOC entry 231 (class 1259 OID 9663476)
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
-- TOC entry 232 (class 1259 OID 9663477)
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
-- TOC entry 233 (class 1259 OID 9663486)
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
-- TOC entry 234 (class 1259 OID 9663487)
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
-- TOC entry 235 (class 1259 OID 9663495)
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
-- TOC entry 236 (class 1259 OID 9663496)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 9663504)
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
-- TOC entry 238 (class 1259 OID 9663516)
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
-- TOC entry 239 (class 1259 OID 9663517)
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
-- TOC entry 240 (class 1259 OID 9663525)
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
-- TOC entry 241 (class 1259 OID 9663526)
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
-- TOC entry 242 (class 1259 OID 9663537)
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
-- TOC entry 243 (class 1259 OID 9663538)
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
-- TOC entry 244 (class 1259 OID 9663547)
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
-- TOC entry 245 (class 1259 OID 9663564)
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
-- TOC entry 246 (class 1259 OID 9663565)
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
-- TOC entry 247 (class 1259 OID 9663579)
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
-- TOC entry 248 (class 1259 OID 9663580)
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
-- TOC entry 249 (class 1259 OID 9663591)
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
-- TOC entry 250 (class 1259 OID 9663592)
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
-- TOC entry 251 (class 1259 OID 9663600)
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
-- TOC entry 252 (class 1259 OID 9663601)
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
-- TOC entry 253 (class 1259 OID 9663607)
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
-- TOC entry 254 (class 1259 OID 9663608)
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
-- TOC entry 255 (class 1259 OID 9663614)
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
-- TOC entry 256 (class 1259 OID 9663615)
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
-- TOC entry 257 (class 1259 OID 9663624)
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
-- TOC entry 258 (class 1259 OID 9663625)
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
-- TOC entry 259 (class 1259 OID 9663633)
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
-- TOC entry 260 (class 1259 OID 9663634)
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
-- TOC entry 261 (class 1259 OID 9663644)
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
-- TOC entry 262 (class 1259 OID 9663645)
-- Name: divisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.divisions (
    id bigint NOT NULL,
    program_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 9663651)
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
-- TOC entry 264 (class 1259 OID 9663652)
-- Name: editable_user_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.editable_user_joins (
    id bigint NOT NULL,
    editable_id integer,
    editable_type character varying,
    user_id integer
);


--
-- TOC entry 265 (class 1259 OID 9663658)
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
-- TOC entry 266 (class 1259 OID 9663659)
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
-- TOC entry 267 (class 1259 OID 9663670)
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
-- TOC entry 268 (class 1259 OID 9663671)
-- Name: flipper_features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flipper_features (
    id bigint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 9663680)
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
-- TOC entry 270 (class 1259 OID 9663681)
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
-- TOC entry 271 (class 1259 OID 9663691)
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
-- TOC entry 272 (class 1259 OID 9663692)
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
-- TOC entry 273 (class 1259 OID 9663700)
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
-- TOC entry 274 (class 1259 OID 9663701)
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
-- TOC entry 275 (class 1259 OID 9663712)
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
-- TOC entry 276 (class 1259 OID 9663713)
-- Name: item_self_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_self_joins (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    related_item_id bigint NOT NULL
);


--
-- TOC entry 277 (class 1259 OID 9663719)
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
-- TOC entry 278 (class 1259 OID 9663720)
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
-- TOC entry 279 (class 1259 OID 9663728)
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
-- TOC entry 280 (class 1259 OID 9663729)
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
-- TOC entry 281 (class 1259 OID 9663738)
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
-- TOC entry 282 (class 1259 OID 9663746)
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
-- TOC entry 283 (class 1259 OID 9663747)
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
-- TOC entry 284 (class 1259 OID 9663762)
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
-- TOC entry 285 (class 1259 OID 9663763)
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
-- TOC entry 286 (class 1259 OID 9663769)
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
-- TOC entry 287 (class 1259 OID 9663770)
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
-- TOC entry 288 (class 1259 OID 9663776)
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
-- TOC entry 289 (class 1259 OID 9663777)
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
-- TOC entry 290 (class 1259 OID 9663785)
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
-- TOC entry 291 (class 1259 OID 9663786)
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
-- TOC entry 292 (class 1259 OID 9663792)
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
-- TOC entry 293 (class 1259 OID 9663793)
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
-- TOC entry 294 (class 1259 OID 9663806)
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
-- TOC entry 295 (class 1259 OID 9663807)
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
-- TOC entry 296 (class 1259 OID 9663813)
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
-- TOC entry 297 (class 1259 OID 9663814)
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
-- TOC entry 298 (class 1259 OID 9663822)
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
-- TOC entry 299 (class 1259 OID 9663823)
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
-- TOC entry 300 (class 1259 OID 9663831)
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
-- TOC entry 301 (class 1259 OID 9663832)
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
-- TOC entry 302 (class 1259 OID 9663842)
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
-- TOC entry 303 (class 1259 OID 9663843)
-- Name: programs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    subject_id bigint
);


--
-- TOC entry 304 (class 1259 OID 9663849)
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
-- TOC entry 305 (class 1259 OID 9663850)
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
-- TOC entry 306 (class 1259 OID 9663860)
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
-- TOC entry 307 (class 1259 OID 9663866)
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
-- TOC entry 308 (class 1259 OID 9663867)
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
-- TOC entry 309 (class 1259 OID 9663875)
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
-- TOC entry 310 (class 1259 OID 9663876)
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
-- TOC entry 311 (class 1259 OID 9663884)
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
-- TOC entry 312 (class 1259 OID 9663885)
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
-- TOC entry 313 (class 1259 OID 9663901)
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
-- TOC entry 314 (class 1259 OID 9663915)
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
-- TOC entry 315 (class 1259 OID 9663932)
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
-- TOC entry 316 (class 1259 OID 9663948)
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
-- TOC entry 317 (class 1259 OID 9663949)
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
-- TOC entry 318 (class 1259 OID 9663965)
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
-- TOC entry 319 (class 1259 OID 9663971)
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
-- TOC entry 320 (class 1259 OID 9663972)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 9663978)
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
-- TOC entry 322 (class 1259 OID 9663984)
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
-- TOC entry 323 (class 1259 OID 9663985)
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
-- TOC entry 324 (class 1259 OID 9663993)
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
-- TOC entry 325 (class 1259 OID 9663994)
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
-- TOC entry 326 (class 1259 OID 9664002)
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
-- TOC entry 327 (class 1259 OID 9664003)
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
-- TOC entry 328 (class 1259 OID 9664013)
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
-- TOC entry 329 (class 1259 OID 9664014)
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 330 (class 1259 OID 9664020)
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
-- TOC entry 331 (class 1259 OID 9664021)
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
-- TOC entry 332 (class 1259 OID 9664033)
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 333 (class 1259 OID 9664039)
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
-- TOC entry 334 (class 1259 OID 9664040)
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
-- TOC entry 335 (class 1259 OID 9664048)
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
-- TOC entry 336 (class 1259 OID 9664049)
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
-- TOC entry 337 (class 1259 OID 9664064)
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
-- TOC entry 338 (class 1259 OID 9664065)
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
-- TOC entry 339 (class 1259 OID 9664074)
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
-- TOC entry 340 (class 1259 OID 9664075)
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
-- TOC entry 341 (class 1259 OID 9664086)
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
-- TOC entry 342 (class 1259 OID 9664087)
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
-- TOC entry 343 (class 1259 OID 9664096)
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
-- TOC entry 344 (class 1259 OID 9664097)
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
-- TOC entry 345 (class 1259 OID 9664106)
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
-- TOC entry 346 (class 1259 OID 9664107)
-- Name: thredded_messageboard_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_users (
    id bigint NOT NULL,
    thredded_user_detail_id bigint NOT NULL,
    thredded_messageboard_id bigint NOT NULL,
    last_seen_at timestamp without time zone NOT NULL
);


--
-- TOC entry 347 (class 1259 OID 9664114)
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
-- TOC entry 348 (class 1259 OID 9664115)
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
-- TOC entry 349 (class 1259 OID 9664129)
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
-- TOC entry 350 (class 1259 OID 9664130)
-- Name: thredded_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) CONSTRAINT thredded_notifications_for_followed_topic_notifier_key_not_null NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 351 (class 1259 OID 9664138)
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
-- TOC entry 352 (class 1259 OID 9664139)
-- Name: thredded_notifications_for_private_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_private_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- TOC entry 353 (class 1259 OID 9664147)
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
-- TOC entry 354 (class 1259 OID 9664148)
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
-- TOC entry 355 (class 1259 OID 9664157)
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
-- TOC entry 356 (class 1259 OID 9664158)
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
-- TOC entry 357 (class 1259 OID 9664170)
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
-- TOC entry 358 (class 1259 OID 9664171)
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
-- TOC entry 359 (class 1259 OID 9664180)
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
-- TOC entry 360 (class 1259 OID 9664181)
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
-- TOC entry 361 (class 1259 OID 9664193)
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
-- TOC entry 362 (class 1259 OID 9664194)
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
-- TOC entry 363 (class 1259 OID 9664200)
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
-- TOC entry 364 (class 1259 OID 9664201)
-- Name: thredded_topic_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_topic_categories (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- TOC entry 365 (class 1259 OID 9664207)
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
-- TOC entry 366 (class 1259 OID 9664208)
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
-- TOC entry 367 (class 1259 OID 9664227)
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
-- TOC entry 368 (class 1259 OID 9664228)
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
-- TOC entry 369 (class 1259 OID 9664239)
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
-- TOC entry 370 (class 1259 OID 9664240)
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
-- TOC entry 371 (class 1259 OID 9664252)
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
-- TOC entry 372 (class 1259 OID 9664253)
-- Name: thredded_user_post_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_post_notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    notified_at timestamp without time zone NOT NULL
);


--
-- TOC entry 373 (class 1259 OID 9664260)
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
-- TOC entry 374 (class 1259 OID 9664261)
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
-- TOC entry 375 (class 1259 OID 9664272)
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
-- TOC entry 376 (class 1259 OID 9664273)
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
-- TOC entry 377 (class 1259 OID 9664286)
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
-- TOC entry 378 (class 1259 OID 9664287)
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
-- TOC entry 379 (class 1259 OID 9664294)
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
-- TOC entry 380 (class 1259 OID 9664295)
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
-- TOC entry 381 (class 1259 OID 9664309)
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
-- TOC entry 382 (class 1259 OID 9664310)
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
-- TOC entry 383 (class 1259 OID 9664318)
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
-- TOC entry 384 (class 1259 OID 9664319)
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
-- TOC entry 385 (class 1259 OID 9664329)
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
-- TOC entry 386 (class 1259 OID 9664343)
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
-- TOC entry 387 (class 1259 OID 9664344)
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
-- TOC entry 388 (class 1259 OID 9664352)
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
-- TOC entry 389 (class 1259 OID 9664353)
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
-- TOC entry 390 (class 1259 OID 9664360)
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
-- TOC entry 391 (class 1259 OID 9664361)
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
-- TOC entry 392 (class 1259 OID 9664383)
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
-- TOC entry 393 (class 1259 OID 9664384)
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
-- TOC entry 394 (class 1259 OID 9664395)
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
-- TOC entry 395 (class 1259 OID 9664396)
-- Name: vignettes_answers_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_answers_options (
    vignettes_answer_id bigint NOT NULL,
    vignettes_option_id bigint NOT NULL
);


--
-- TOC entry 396 (class 1259 OID 9664401)
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
-- TOC entry 397 (class 1259 OID 9664409)
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
-- TOC entry 398 (class 1259 OID 9664410)
-- Name: vignettes_completion_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_completion_messages (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 399 (class 1259 OID 9664417)
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
-- TOC entry 400 (class 1259 OID 9664418)
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
-- TOC entry 401 (class 1259 OID 9664428)
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
-- TOC entry 402 (class 1259 OID 9664429)
-- Name: vignettes_info_slides_slides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_info_slides_slides (
    vignettes_info_slide_id bigint NOT NULL,
    vignettes_slide_id bigint NOT NULL
);


--
-- TOC entry 403 (class 1259 OID 9664434)
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
-- TOC entry 404 (class 1259 OID 9664443)
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
-- TOC entry 405 (class 1259 OID 9664444)
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
-- TOC entry 406 (class 1259 OID 9664454)
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
-- TOC entry 407 (class 1259 OID 9664455)
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
-- TOC entry 408 (class 1259 OID 9664466)
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
-- TOC entry 409 (class 1259 OID 9664467)
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
-- TOC entry 410 (class 1259 OID 9664476)
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
-- TOC entry 411 (class 1259 OID 9664477)
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
-- TOC entry 412 (class 1259 OID 9664488)
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
-- TOC entry 413 (class 1259 OID 9664489)
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
-- TOC entry 414 (class 1259 OID 9664497)
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
-- TOC entry 415 (class 1259 OID 9664498)
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
-- TOC entry 416 (class 1259 OID 9664506)
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
-- TOC entry 417 (class 1259 OID 9664507)
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
-- TOC entry 418 (class 1259 OID 9664519)
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
-- TOC entry 419 (class 1259 OID 9664527)
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
-- TOC entry 420 (class 1259 OID 9664528)
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
-- TOC entry 421 (class 1259 OID 9664538)
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
-- TOC entry 3898 (class 2604 OID 9664539)
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- TOC entry 3899 (class 2604 OID 9664540)
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- TOC entry 3900 (class 2604 OID 9664541)
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- TOC entry 3901 (class 2604 OID 9664542)
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- TOC entry 3902 (class 2604 OID 9664543)
-- Name: annotations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations ALTER COLUMN id SET DEFAULT nextval('public.annotations_id_seq'::regclass);


--
-- TOC entry 3904 (class 2604 OID 9664544)
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- TOC entry 3906 (class 2604 OID 9664545)
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- TOC entry 3907 (class 2604 OID 9664546)
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- TOC entry 3910 (class 2604 OID 9664547)
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- TOC entry 3911 (class 2604 OID 9664548)
-- Name: claims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims ALTER COLUMN id SET DEFAULT nextval('public.claims_id_seq'::regclass);


--
-- TOC entry 3913 (class 2604 OID 9664549)
-- Name: cohorts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohorts ALTER COLUMN id SET DEFAULT nextval('public.cohorts_id_seq'::regclass);


--
-- TOC entry 3917 (class 2604 OID 9664550)
-- Name: commontator_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments ALTER COLUMN id SET DEFAULT nextval('public.commontator_comments_id_seq'::regclass);


--
-- TOC entry 3920 (class 2604 OID 9664551)
-- Name: commontator_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.commontator_subscriptions_id_seq'::regclass);


--
-- TOC entry 3921 (class 2604 OID 9664552)
-- Name: commontator_threads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads ALTER COLUMN id SET DEFAULT nextval('public.commontator_threads_id_seq'::regclass);


--
-- TOC entry 3922 (class 2604 OID 9664553)
-- Name: course_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins ALTER COLUMN id SET DEFAULT nextval('public.course_self_joins_id_seq'::regclass);


--
-- TOC entry 3923 (class 2604 OID 9664554)
-- Name: course_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.course_tag_joins_id_seq'::regclass);


--
-- TOC entry 3924 (class 2604 OID 9664555)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 3926 (class 2604 OID 9664556)
-- Name: division_course_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins ALTER COLUMN id SET DEFAULT nextval('public.division_course_joins_id_seq'::regclass);


--
-- TOC entry 3927 (class 2604 OID 9664557)
-- Name: division_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations ALTER COLUMN id SET DEFAULT nextval('public.division_translations_id_seq'::regclass);


--
-- TOC entry 3928 (class 2604 OID 9664558)
-- Name: divisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions ALTER COLUMN id SET DEFAULT nextval('public.divisions_id_seq'::regclass);


--
-- TOC entry 3929 (class 2604 OID 9664559)
-- Name: editable_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins ALTER COLUMN id SET DEFAULT nextval('public.editable_user_joins_id_seq'::regclass);


--
-- TOC entry 3930 (class 2604 OID 9664560)
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- TOC entry 3932 (class 2604 OID 9664561)
-- Name: flipper_features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_features ALTER COLUMN id SET DEFAULT nextval('public.flipper_features_id_seq'::regclass);


--
-- TOC entry 3933 (class 2604 OID 9664562)
-- Name: flipper_gates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_gates ALTER COLUMN id SET DEFAULT nextval('public.flipper_gates_id_seq'::regclass);


--
-- TOC entry 3934 (class 2604 OID 9664563)
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- TOC entry 3935 (class 2604 OID 9664564)
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- TOC entry 3936 (class 2604 OID 9664565)
-- Name: item_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins ALTER COLUMN id SET DEFAULT nextval('public.item_self_joins_id_seq'::regclass);


--
-- TOC entry 3937 (class 2604 OID 9664566)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3939 (class 2604 OID 9664567)
-- Name: lecture_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins ALTER COLUMN id SET DEFAULT nextval('public.lecture_user_joins_id_seq'::regclass);


--
-- TOC entry 3940 (class 2604 OID 9664568)
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lectures_id_seq'::regclass);


--
-- TOC entry 3946 (class 2604 OID 9664569)
-- Name: lesson_section_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_section_joins_id_seq'::regclass);


--
-- TOC entry 3947 (class 2604 OID 9664570)
-- Name: lesson_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_tag_joins_id_seq'::regclass);


--
-- TOC entry 3948 (class 2604 OID 9664571)
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- TOC entry 3949 (class 2604 OID 9664572)
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- TOC entry 3950 (class 2604 OID 9664573)
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- TOC entry 3954 (class 2604 OID 9664574)
-- Name: medium_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.medium_tag_joins_id_seq'::regclass);


--
-- TOC entry 3955 (class 2604 OID 9664575)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 3956 (class 2604 OID 9664576)
-- Name: notions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions ALTER COLUMN id SET DEFAULT nextval('public.notions_id_seq'::regclass);


--
-- TOC entry 3957 (class 2604 OID 9664577)
-- Name: program_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations ALTER COLUMN id SET DEFAULT nextval('public.program_translations_id_seq'::regclass);


--
-- TOC entry 3958 (class 2604 OID 9664578)
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- TOC entry 3960 (class 2604 OID 9664579)
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- TOC entry 3961 (class 2604 OID 9664580)
-- Name: redemptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions ALTER COLUMN id SET DEFAULT nextval('public.redemptions_id_seq'::regclass);


--
-- TOC entry 3962 (class 2604 OID 9664581)
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- TOC entry 3972 (class 2604 OID 9664582)
-- Name: registration_student_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages ALTER COLUMN id SET DEFAULT nextval('public.registration_student_messages_id_seq'::regclass);


--
-- TOC entry 3978 (class 2604 OID 9664583)
-- Name: relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations ALTER COLUMN id SET DEFAULT nextval('public.relations_id_seq'::regclass);


--
-- TOC entry 3979 (class 2604 OID 9664584)
-- Name: section_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.section_tag_joins_id_seq'::regclass);


--
-- TOC entry 3980 (class 2604 OID 9664585)
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- TOC entry 3981 (class 2604 OID 9664586)
-- Name: speaker_talk_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins ALTER COLUMN id SET DEFAULT nextval('public.speaker_talk_joins_id_seq'::regclass);


--
-- TOC entry 3982 (class 2604 OID 9664587)
-- Name: subject_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations ALTER COLUMN id SET DEFAULT nextval('public.subject_translations_id_seq'::regclass);


--
-- TOC entry 3983 (class 2604 OID 9664588)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 3986 (class 2604 OID 9664589)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3987 (class 2604 OID 9664590)
-- Name: talk_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.talk_tag_joins_id_seq'::regclass);


--
-- TOC entry 3988 (class 2604 OID 9664591)
-- Name: talks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks ALTER COLUMN id SET DEFAULT nextval('public.talks_id_seq'::regclass);


--
-- TOC entry 3993 (class 2604 OID 9664592)
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- TOC entry 3995 (class 2604 OID 9664593)
-- Name: thredded_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_categories_id_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 9664594)
-- Name: thredded_messageboard_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_groups_id_seq'::regclass);


--
-- TOC entry 3997 (class 2604 OID 9664595)
-- Name: thredded_messageboard_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_notifications_for_followed_topics_id_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 9664596)
-- Name: thredded_messageboard_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_users_id_seq'::regclass);


--
-- TOC entry 4000 (class 2604 OID 9664597)
-- Name: thredded_messageboards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboards_id_seq'::regclass);


--
-- TOC entry 4004 (class 2604 OID 9664598)
-- Name: thredded_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_followed_topics_id_seq'::regclass);


--
-- TOC entry 4006 (class 2604 OID 9664599)
-- Name: thredded_notifications_for_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_private_topics_id_seq'::regclass);


--
-- TOC entry 4008 (class 2604 OID 9664600)
-- Name: thredded_post_moderation_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records ALTER COLUMN id SET DEFAULT nextval('public.thredded_post_moderation_records_id_seq'::regclass);


--
-- TOC entry 4009 (class 2604 OID 9664601)
-- Name: thredded_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_posts_id_seq'::regclass);


--
-- TOC entry 4011 (class 2604 OID 9664602)
-- Name: thredded_private_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_posts_id_seq'::regclass);


--
-- TOC entry 4012 (class 2604 OID 9664603)
-- Name: thredded_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_topics_id_seq'::regclass);


--
-- TOC entry 4014 (class 2604 OID 9664604)
-- Name: thredded_private_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_users_id_seq'::regclass);


--
-- TOC entry 4015 (class 2604 OID 9664605)
-- Name: thredded_topic_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_topic_categories_id_seq'::regclass);


--
-- TOC entry 4016 (class 2604 OID 9664606)
-- Name: thredded_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_topics_id_seq'::regclass);


--
-- TOC entry 4020 (class 2604 OID 9664607)
-- Name: thredded_user_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_details_id_seq'::regclass);


--
-- TOC entry 4024 (class 2604 OID 9664608)
-- Name: thredded_user_messageboard_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_messageboard_preferences_id_seq'::regclass);


--
-- TOC entry 4027 (class 2604 OID 9664609)
-- Name: thredded_user_post_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_post_notifications_id_seq'::regclass);


--
-- TOC entry 4028 (class 2604 OID 9664610)
-- Name: thredded_user_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_preferences_id_seq'::regclass);


--
-- TOC entry 4031 (class 2604 OID 9664611)
-- Name: thredded_user_private_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_private_topic_read_states_id_seq'::regclass);


--
-- TOC entry 4035 (class 2604 OID 9664612)
-- Name: thredded_user_topic_follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_follows_id_seq'::regclass);


--
-- TOC entry 4036 (class 2604 OID 9664613)
-- Name: thredded_user_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_read_states_id_seq'::regclass);


--
-- TOC entry 4040 (class 2604 OID 9664614)
-- Name: tutor_tutorial_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins ALTER COLUMN id SET DEFAULT nextval('public.tutor_tutorial_joins_id_seq'::regclass);


--
-- TOC entry 4042 (class 2604 OID 9664615)
-- Name: tutorials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials ALTER COLUMN id SET DEFAULT nextval('public.tutorials_id_seq'::regclass);


--
-- TOC entry 4045 (class 2604 OID 9664616)
-- Name: user_favorite_lecture_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins ALTER COLUMN id SET DEFAULT nextval('public.user_favorite_lecture_joins_id_seq'::regclass);


--
-- TOC entry 4046 (class 2604 OID 9664617)
-- Name: user_submission_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins ALTER COLUMN id SET DEFAULT nextval('public.user_submission_joins_id_seq'::regclass);


--
-- TOC entry 4047 (class 2604 OID 9664618)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4056 (class 2604 OID 9664619)
-- Name: vignettes_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers ALTER COLUMN id SET DEFAULT nextval('public.vignettes_answers_id_seq'::regclass);


--
-- TOC entry 4057 (class 2604 OID 9664620)
-- Name: vignettes_codenames id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames ALTER COLUMN id SET DEFAULT nextval('public.vignettes_codenames_id_seq'::regclass);


--
-- TOC entry 4058 (class 2604 OID 9664621)
-- Name: vignettes_completion_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages ALTER COLUMN id SET DEFAULT nextval('public.vignettes_completion_messages_id_seq'::regclass);


--
-- TOC entry 4059 (class 2604 OID 9664622)
-- Name: vignettes_info_slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_info_slides ALTER COLUMN id SET DEFAULT nextval('public.vignettes_info_slides_id_seq'::regclass);


--
-- TOC entry 4060 (class 2604 OID 9664623)
-- Name: vignettes_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options ALTER COLUMN id SET DEFAULT nextval('public.vignettes_options_id_seq'::regclass);


--
-- TOC entry 4061 (class 2604 OID 9664624)
-- Name: vignettes_questionnaires id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires ALTER COLUMN id SET DEFAULT nextval('public.vignettes_questionnaires_id_seq'::regclass);


--
-- TOC entry 4063 (class 2604 OID 9664625)
-- Name: vignettes_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions ALTER COLUMN id SET DEFAULT nextval('public.vignettes_questions_id_seq'::regclass);


--
-- TOC entry 4066 (class 2604 OID 9664626)
-- Name: vignettes_slide_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics ALTER COLUMN id SET DEFAULT nextval('public.vignettes_slide_statistics_id_seq'::regclass);


--
-- TOC entry 4067 (class 2604 OID 9664627)
-- Name: vignettes_slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides ALTER COLUMN id SET DEFAULT nextval('public.vignettes_slides_id_seq'::regclass);


--
-- TOC entry 4068 (class 2604 OID 9664628)
-- Name: vignettes_user_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers ALTER COLUMN id SET DEFAULT nextval('public.vignettes_user_answers_id_seq'::regclass);


--
-- TOC entry 4069 (class 2604 OID 9664629)
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- TOC entry 4071 (class 2604 OID 9664630)
-- Name: watchlist_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries ALTER COLUMN id SET DEFAULT nextval('public.watchlist_entries_id_seq'::regclass);


--
-- TOC entry 4072 (class 2604 OID 9664631)
-- Name: watchlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists ALTER COLUMN id SET DEFAULT nextval('public.watchlists_id_seq'::regclass);


--
-- TOC entry 4758 (class 0 OID 9663416)
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
-- TOC entry 4760 (class 0 OID 9663428)
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
-- TOC entry 4762 (class 0 OID 9663440)
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
-- TOC entry 4764 (class 0 OID 9663452)
-- Dependencies: 228
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
3	5	wjqVtOuFppDd1oEBBMUc2TyD8vk=
4	6	g9oDsuZ2Ke1OimlPvx7V2sj306E=
\.


--
-- TOC entry 4766 (class 0 OID 9663461)
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
-- TOC entry 4768 (class 0 OID 9663477)
-- Dependencies: 232
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, lecture_id, announcer_id, details, created_at, updated_at, on_main_page) FROM stdin;
1	\N	1	<div>Das ist die Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:13:06.111759	2020-07-24 13:13:06.111759	f
2	1	2	<div>Das ist eine Mitteilung für die LA2 in der Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:40:47.403705	2020-07-24 13:40:47.403705	f
3	27	2	<div>Today's session is cancelled due to a corona infection of the speaker.</div>	2022-08-05 14:24:49.642445	2022-08-05 14:24:49.642445	f
4	\N	1	<div>Mampf will be down from 5pm to 7pm this afternoon.</div>	2022-08-05 14:26:46.610612	2022-08-05 14:26:46.610612	f
5	\N	1	Am Freitag ist MaMpf zwischen 8 und 10 Uhr wegen Wartungsarbeiten nicht erreichbar.	2026-08-26 19:49:16.042897	2026-08-26 19:49:16.042897	f
6	\N	1	Die Anmeldung für die Veranstaltungen des kommenden Semesters ist freigeschaltet.	2026-08-26 19:49:16.424748	2026-08-26 19:49:16.424748	f
7	1	2	Die Vorlesung am Donnerstag entfällt.	2026-08-26 19:49:16.729718	2026-08-26 19:49:16.729718	f
8	3	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-26 19:49:16.822864	2026-08-26 19:49:16.822864	f
9	28	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-26 19:49:16.842773	2026-08-26 19:49:16.842773	f
10	29	2	Die Vorlesung am Donnerstag entfällt.	2026-08-26 19:49:16.854799	2026-08-26 19:49:16.854799	f
11	30	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-26 19:49:16.866986	2026-08-26 19:49:16.866986	f
12	31	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-26 19:49:16.891519	2026-08-26 19:49:16.891519	f
13	35	2	Die Vorlesung am Donnerstag entfällt.	2026-08-26 19:49:16.900124	2026-08-26 19:49:16.900124	f
14	36	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-26 19:49:16.905568	2026-08-26 19:49:16.905568	f
15	\N	1	Am Freitag ist MaMpf zwischen 8 und 10 Uhr wegen Wartungsarbeiten nicht erreichbar.	2026-08-28 15:08:35.098469	2026-08-28 15:08:35.098469	f
16	\N	1	Die Anmeldung für die Veranstaltungen des kommenden Semesters ist freigeschaltet.	2026-08-28 15:08:35.344198	2026-08-28 15:08:35.344198	f
17	1	2	Die Vorlesung am Donnerstag entfällt.	2026-08-28 15:08:35.565468	2026-08-28 15:08:35.565468	f
18	3	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-28 15:08:35.627372	2026-08-28 15:08:35.627372	f
19	28	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-28 15:08:35.639533	2026-08-28 15:08:35.639533	f
20	29	2	Die Vorlesung am Donnerstag entfällt.	2026-08-28 15:08:35.64622	2026-08-28 15:08:35.64622	f
21	35	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-28 15:08:35.653339	2026-08-28 15:08:35.653339	f
22	36	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-28 15:08:35.657431	2026-08-28 15:08:35.657431	f
23	30	2	Die Vorlesung am Donnerstag entfällt.	2026-08-28 15:08:35.665711	2026-08-28 15:08:35.665711	f
\.


--
-- TOC entry 4770 (class 0 OID 9663487)
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
-- TOC entry 4772 (class 0 OID 9663496)
-- Dependencies: 236
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-07-24 13:03:53.932392	2025-07-14 10:42:06.530578
\.


--
-- TOC entry 4773 (class 0 OID 9663504)
-- Dependencies: 237
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments (id, lecture_id, medium_id, title, deadline, created_at, updated_at, accepted_file_type, deletion_date) FROM stdin;
2	1	45	Blatt 5	2026-05-09 16:00:00	2020-11-28 16:54:41.933526	2025-07-14 11:05:22.969571	.pdf	2026-10-15
1	1	12	Blatt 4	2026-05-01 15:50:00	2020-11-28 16:32:30.987364	2025-07-14 11:05:48.488131	.pdf	2026-10-15
3	1	45	Blatt 6	2026-09-03 17:00:00	2022-08-05 14:49:41.819884	2025-07-14 11:06:21.422622	.pdf	2026-10-15
\.


--
-- TOC entry 4775 (class 0 OID 9663517)
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
-- TOC entry 4777 (class 0 OID 9663526)
-- Dependencies: 241
-- Data for Name: claims; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.claims (id, redemption_id, claimable_type, claimable_id, created_at, updated_at) FROM stdin;
1	1	Talk	2	2025-07-15 12:11:14.690491	2025-07-15 12:11:14.690491
2	2	Talk	2	2025-07-15 12:11:39.225067	2025-07-15 12:11:39.225067
3	3	Talk	3	2025-07-15 12:11:59.002407	2025-07-15 12:11:59.002407
\.


--
-- TOC entry 4779 (class 0 OID 9663538)
-- Dependencies: 243
-- Data for Name: cohort_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cohort_memberships (id, user_id, cohort_id, source_campaign_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4780 (class 0 OID 9663547)
-- Dependencies: 244
-- Data for Name: cohorts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cohorts (id, title, description, capacity, context_type, context_id, propagate_to_lecture, created_at, updated_at, skip_campaigns, self_materialization_mode) FROM stdin;
5	Repeaters	If you failed last year's exam and don't want to go through tutorials again, register here.	15	Lecture	39	t	2026-08-28 15:08:31.671769	2026-08-28 15:08:31.671769	f	0
6	Waitlist	If you failed last year's exam and don't want to go through tutorials again, register here.	20	Lecture	39	f	2026-08-28 15:08:31.68079	2026-08-28 15:08:31.68079	f	0
7	Interest Survey	If you failed last year's exam and don't want to go through tutorials again, register here.	\N	Lecture	31	f	2026-08-28 15:08:32.112845	2026-08-28 15:08:32.112845	f	0
8	Nachrücker	If you failed last year's exam and don't want to go through tutorials again, register here.	5	Lecture	31	f	2026-08-28 15:08:32.28314	2026-08-28 15:08:32.28314	f	0
\.


--
-- TOC entry 4782 (class 0 OID 9663565)
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
-- TOC entry 4784 (class 0 OID 9663580)
-- Dependencies: 248
-- Data for Name: commontator_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_subscriptions (id, thread_id, subscriber_type, subscriber_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4786 (class 0 OID 9663592)
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
-- TOC entry 4788 (class 0 OID 9663601)
-- Dependencies: 252
-- Data for Name: course_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_self_joins (id, course_id, preceding_course_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4790 (class 0 OID 9663608)
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
-- TOC entry 4792 (class 0 OID 9663615)
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
-- TOC entry 4794 (class 0 OID 9663625)
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
-- TOC entry 4796 (class 0 OID 9663634)
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
-- TOC entry 4798 (class 0 OID 9663645)
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
-- TOC entry 4800 (class 0 OID 9663652)
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
-- TOC entry 4802 (class 0 OID 9663659)
-- Dependencies: 266
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.feedbacks (id, title, feedback, can_contact, user_id, created_at, updated_at) FROM stdin;
1	Beschwerde	Alles Mist!	t	8	2025-07-14 11:29:43.122178	2025-07-14 11:29:43.122178
\.


--
-- TOC entry 4804 (class 0 OID 9663671)
-- Dependencies: 268
-- Data for Name: flipper_features; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flipper_features (id, key, created_at, updated_at) FROM stdin;
1	next_term_banner	2026-08-26 19:49:13.923275	2026-08-26 19:49:13.923275
\.


--
-- TOC entry 4806 (class 0 OID 9663681)
-- Dependencies: 270
-- Data for Name: flipper_gates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flipper_gates (id, feature_key, key, value, created_at, updated_at) FROM stdin;
2	next_term_banner	boolean	true	2026-08-28 15:08:32.347917	2026-08-28 15:08:32.347917
\.


--
-- TOC entry 4808 (class 0 OID 9663692)
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
-- TOC entry 4810 (class 0 OID 9663701)
-- Dependencies: 274
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.imports (id, medium_id, teachable_type, teachable_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4812 (class 0 OID 9663713)
-- Dependencies: 276
-- Data for Name: item_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_self_joins (id, item_id, related_item_id) FROM stdin;
\.


--
-- TOC entry 4814 (class 0 OID 9663720)
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
-- TOC entry 4816 (class 0 OID 9663729)
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
\.


--
-- TOC entry 4817 (class 0 OID 9663738)
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
\.


--
-- TOC entry 4819 (class 0 OID 9663747)
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
31	2026-08-26 19:49:06.390838	2026-08-28 15:08:32.224577	12	6	2	\N	\N	\N	\N	\N	\N	t	video	\N	en	seminar	7	\N	\N	f	\N	15	f	1	0	<div><strong>Campaign Test Seminar</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
39	2026-08-28 15:08:31.305681	2026-08-28 15:08:31.641193	20	6	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	<div><strong>Registration Playground</strong> next term</div><div>The course starts in the first week of term. Registration for the exercise groups is already running: you name the slots that suit you, in the order they suit you, and are given a group once the deadline has passed.</div><div>Your place in the course does not hang on it — subscribing here is not a binding registration.</div>	\N
1	2020-07-24 13:17:08.173027	2026-08-28 15:08:35.567127	1	5	2	0	t	0	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	1	\N	\N	f	2	15	f	1	0	<div>Willkommen bei <strong>Lineare Algebra 2</strong>!</div><div>Auf dieser Seite findest Du alles zur Veranstaltung: das Skript, die Videos zu den einzelnen Sitzungen und die Übungsblätter. Die Aufzeichnung steht in der Regel am Abend nach der Vorlesung bereit, die Kapitelmarken kommen am Tag darauf dazu.</div><div>Die Übungsblätter erscheinen mittwochs und werden bis zum Freitag der Folgewoche abgegeben — in Zweiergruppen, direkt hier über MaMpf. Deine Tutorin oder Dein Tutor lädt die Korrektur an derselben Stelle wieder hoch.</div>	{"id":"97d461394b4fdf0983e1785c570a1641.pdf","storage":"cache","metadata":{"filename":"shrine20260828-169712-qo13ee.pdf","size":1138473,"mime_type":"application/pdf"}}
3	2020-07-24 17:01:18.424312	2026-08-28 15:08:35.628271	3	5	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	manuscript		de	lecture	3	\N	\N	f	\N	15	f	1	0	<div>Diese Seite ist die Anlaufstelle für <strong>Einführung in die Geometrie</strong>.</div><div>Fragen zwischendurch stellst Du am besten im Forum — dort antworten auch die Tutorinnen und Tutoren. Wichtige Hinweise erscheinen als Ankündigung ganz oben; wenn Du die Veranstaltung abonniert hast, bekommst Du sie außerdem als Benachrichtigung.</div><div>Das Skript wächst mit der Vorlesung mit. Wo etwas unklar bleibt, hilft oft die verlinkte Wiederholung aus dem vorigen Semester.</div>	\N
28	2025-07-14 11:37:42.454732	2026-08-28 15:08:35.640688	9	5	2	\N	\N	\N	<!-- BEGIN app/views/lectures/organizational/_lecture.html.erb --><div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul><!-- END app/views/lectures/organizational/_lecture.html.erb -->	\N	\N	all	video	\N	de	vignettes	4	\N	\N	f	\N	15	f	1	0	<div><strong>Vignetten</strong></div><div>Der Ablauf ist der übliche: zwei Vorlesungen und eine Übung pro Woche, dazu ein Übungsblatt, von dem die Hälfte der Punkte zur Klausurzulassung reicht.</div><div>Alles, was Du dafür brauchst, steht hier: das Skript unter „Manuskript“, die Aufzeichnungen unter „Lektionen“ und die Blätter unter „Übungen“. Die Sprechstunde findet dienstags um 14 Uhr statt.</div>	\N
29	2025-07-15 12:03:30.235477	2026-08-28 15:08:35.647141	10	5	2	\N	\N	\N	<!-- BEGIN app/views/lectures/organizational/_seminar.html.erb --><div><strong>Termine</strong></div><div><br></div><ul><li>Seminar: Do 14-16 Uhr im SR 4 im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Tutorium: n.V. bei <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a></li><li>Vorbesprechung: Mi, 24. Juli 2019, 13.15 Uhr in SR 3&nbsp; im Mathematikon, INF 205</li></ul><div><br></div><div><strong>Vorträge</strong></div><div><br>Im Seminar wird jede TeilnehmerIn einen Vortrag halten. Die Vorträge werden bei der <strong>Vorbesprechung</strong> vergeben. Ob nach der Vorbesprechung noch Themen frei sind, können Sie bei der DozentIn in Erfahrung bringen. Beim Vortrag sollen Sie&nbsp; den Ihnen zugewiesenen Stoff in der Ihnen zugewiesenen Zeit behandeln - und zwar so, dass jeder dass jeder der Anwesenden davon profitiert. Um das zu erreichen, ist es wichtig, dass Sie <em>frühzeitig</em> mit der Vorbereitung Ihres Vortrags beginnen. Außerdem erwarten wir, dass Sie rechtzeitig vor dem Vortrag Kontakt mit <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a> aufnehmen, um Details zum Inhalt und zur Strukturierung des Vortrags zu besprechen. Rechtzeitig wäre beispielsweise zwei Wochen vor Ihrem Vortrag - eine Viertelstunde vor Vortragsbeginn ist nicht rechtzeitig. Sie sollten daraufhin arbeiten, sämtliche Details ihres Vortragsinhaltes gründlich zu verstehen. Auf der anderen Seite ist es wichtig für Ihren Vortrag, dass Sie diesen so gestalten, dass Ihre KommilitonInnen - für die der Inhalt Ihres Vortrages in der Regel neu sein wird - eine Chance haben, diesen auch zu verstehen. Viele nützliche Hinweise zum Halten mathematischer Vorträge finden Sie <a href="http://download.uni-mainz.de/mathematik/Topologie%20und%20Geometrie/Lehre/Wie-halte-ich-einen-Seminarvortrag.pdf">hier</a>.<br><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen des Vortrags notwendig.</li><li>Die Anmeldung zum Vortrag erfolgt über MÜSLI. Die Anmeldung wird am 15. August 2019 geschlossen. Wer danach noch im MÜSLI für das Seminar eingetragen ist, erhält bei Nichtabhalten seines/ihres Vortrags die Note 5 (nicht bestanden).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note des bestandenen Vortrags, bzw. der Note 5.0, wenn der Vortrag nicht bestanden oder nicht abgehalten wurde.</li></ul><!-- END app/views/lectures/organizational/_seminar.html.erb -->	\N	\N	all	video	\N	de	proseminar	5	\N	\N	f	\N	15	f	1	0	<div>Willkommen bei <strong>Elementare Zahlentheorie</strong>!</div><div>Auf dieser Seite findest Du alles zur Veranstaltung: das Skript, die Videos zu den einzelnen Sitzungen und die Übungsblätter. Die Aufzeichnung steht in der Regel am Abend nach der Vorlesung bereit, die Kapitelmarken kommen am Tag darauf dazu.</div><div>Die Übungsblätter erscheinen mittwochs und werden bis zum Freitag der Folgewoche abgegeben — in Zweiergruppen, direkt hier über MaMpf. Deine Tutorin oder Dein Tutor lädt die Korrektur an derselben Stelle wieder hoch.</div>	\N
35	2026-08-26 19:49:15.332297	2026-08-28 15:08:35.654372	16	5	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	8	\N	\N	f	\N	15	f	1	0	<div>This is where <strong>Analysis SS 2026</strong> starts.</div><div>Ask what comes up in the forum; the tutors read it too. Anything that matters is announced at the top of this page, and reaches you as a notification once you have subscribed to the course.</div><div>The notes grow with the lecture. Where something stays unclear, the linked revision from last term often helps.</div>	\N
36	2026-08-26 19:49:15.453156	2026-08-28 15:08:35.65836	17	5	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	seminar	9	\N	\N	f	\N	15	f	1	0	<div><strong>Seminar SS 2026</strong></div><div>The week runs as usual: two lectures, one exercise class, and a sheet of which half the points admit you to the exam.</div><div>Everything you need for that is here: the notes under “Manuscript”, the recordings under “Lessons” and the sheets under “Exercises”. Office hours are on Tuesdays at 2 pm.</div>	\N
30	2026-08-26 19:48:20.910268	2026-08-28 15:08:35.666651	11	5	2	\N	\N	\N	\N	\N	\N	t	video	\N	en	seminar	6	\N	\N	f	\N	15	f	1	0	<div>Welcome to <strong>Demo Roster Seminar</strong>!</div><div>This page holds everything the course comes with: the notes, the recording of every session and the exercise sheets. A recording is usually up the evening after the lecture, its chapter marks the day after that.</div><div>Sheets appear on Wednesdays and are handed in by the Friday of the week after — in pairs, here on MaMpf. Your tutor uploads the correction in the same place.</div>	\N
\.


--
-- TOC entry 4821 (class 0 OID 9663763)
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
-- TOC entry 4823 (class 0 OID 9663770)
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
-- TOC entry 4825 (class 0 OID 9663777)
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
-- TOC entry 4827 (class 0 OID 9663786)
-- Dependencies: 291
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, medium_id, linked_medium_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4829 (class 0 OID 9663793)
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
-- TOC entry 4831 (class 0 OID 9663807)
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
-- TOC entry 4833 (class 0 OID 9663814)
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
144	1	5	Announcement	create	2026-08-26 19:49:16.079909	2026-08-26 19:49:16.079909
145	2	5	Announcement	create	2026-08-26 19:49:16.086122	2026-08-26 19:49:16.086122
146	5	5	Announcement	create	2026-08-26 19:49:16.088563	2026-08-26 19:49:16.088563
147	6	5	Announcement	create	2026-08-26 19:49:16.090604	2026-08-26 19:49:16.090604
148	7	5	Announcement	create	2026-08-26 19:49:16.092725	2026-08-26 19:49:16.092725
149	8	5	Announcement	create	2026-08-26 19:49:16.093894	2026-08-26 19:49:16.093894
150	9	5	Announcement	create	2026-08-26 19:49:16.095108	2026-08-26 19:49:16.095108
151	10	5	Announcement	create	2026-08-26 19:49:16.096282	2026-08-26 19:49:16.096282
152	12	5	Announcement	create	2026-08-26 19:49:16.097406	2026-08-26 19:49:16.097406
153	13	5	Announcement	create	2026-08-26 19:49:16.098487	2026-08-26 19:49:16.098487
154	14	5	Announcement	create	2026-08-26 19:49:16.099996	2026-08-26 19:49:16.099996
155	15	5	Announcement	create	2026-08-26 19:49:16.101948	2026-08-26 19:49:16.101948
156	16	5	Announcement	create	2026-08-26 19:49:16.103988	2026-08-26 19:49:16.103988
157	17	5	Announcement	create	2026-08-26 19:49:16.105702	2026-08-26 19:49:16.105702
158	18	5	Announcement	create	2026-08-26 19:49:16.107108	2026-08-26 19:49:16.107108
159	19	5	Announcement	create	2026-08-26 19:49:16.10819	2026-08-26 19:49:16.10819
160	20	5	Announcement	create	2026-08-26 19:49:16.109279	2026-08-26 19:49:16.109279
161	21	5	Announcement	create	2026-08-26 19:49:16.138341	2026-08-26 19:49:16.138341
162	22	5	Announcement	create	2026-08-26 19:49:16.139994	2026-08-26 19:49:16.139994
163	23	5	Announcement	create	2026-08-26 19:49:16.141333	2026-08-26 19:49:16.141333
164	24	5	Announcement	create	2026-08-26 19:49:16.142545	2026-08-26 19:49:16.142545
165	25	5	Announcement	create	2026-08-26 19:49:16.14426	2026-08-26 19:49:16.14426
166	26	5	Announcement	create	2026-08-26 19:49:16.145452	2026-08-26 19:49:16.145452
167	27	5	Announcement	create	2026-08-26 19:49:16.146872	2026-08-26 19:49:16.146872
168	28	5	Announcement	create	2026-08-26 19:49:16.147889	2026-08-26 19:49:16.147889
169	29	5	Announcement	create	2026-08-26 19:49:16.148863	2026-08-26 19:49:16.148863
170	30	5	Announcement	create	2026-08-26 19:49:16.149918	2026-08-26 19:49:16.149918
171	31	5	Announcement	create	2026-08-26 19:49:16.151682	2026-08-26 19:49:16.151682
172	32	5	Announcement	create	2026-08-26 19:49:16.153134	2026-08-26 19:49:16.153134
173	33	5	Announcement	create	2026-08-26 19:49:16.155094	2026-08-26 19:49:16.155094
174	34	5	Announcement	create	2026-08-26 19:49:16.156695	2026-08-26 19:49:16.156695
175	35	5	Announcement	create	2026-08-26 19:49:16.158197	2026-08-26 19:49:16.158197
176	36	5	Announcement	create	2026-08-26 19:49:16.15957	2026-08-26 19:49:16.15957
177	37	5	Announcement	create	2026-08-26 19:49:16.160658	2026-08-26 19:49:16.160658
178	38	5	Announcement	create	2026-08-26 19:49:16.162045	2026-08-26 19:49:16.162045
179	39	5	Announcement	create	2026-08-26 19:49:16.163589	2026-08-26 19:49:16.163589
180	40	5	Announcement	create	2026-08-26 19:49:16.164811	2026-08-26 19:49:16.164811
181	41	5	Announcement	create	2026-08-26 19:49:16.167501	2026-08-26 19:49:16.167501
182	42	5	Announcement	create	2026-08-26 19:49:16.170363	2026-08-26 19:49:16.170363
183	43	5	Announcement	create	2026-08-26 19:49:16.172354	2026-08-26 19:49:16.172354
184	44	5	Announcement	create	2026-08-26 19:49:16.173878	2026-08-26 19:49:16.173878
185	45	5	Announcement	create	2026-08-26 19:49:16.175043	2026-08-26 19:49:16.175043
186	46	5	Announcement	create	2026-08-26 19:49:16.176085	2026-08-26 19:49:16.176085
187	47	5	Announcement	create	2026-08-26 19:49:16.177579	2026-08-26 19:49:16.177579
188	48	5	Announcement	create	2026-08-26 19:49:16.179051	2026-08-26 19:49:16.179051
189	49	5	Announcement	create	2026-08-26 19:49:16.180137	2026-08-26 19:49:16.180137
190	50	5	Announcement	create	2026-08-26 19:49:16.181216	2026-08-26 19:49:16.181216
191	51	5	Announcement	create	2026-08-26 19:49:16.182597	2026-08-26 19:49:16.182597
192	52	5	Announcement	create	2026-08-26 19:49:16.183953	2026-08-26 19:49:16.183953
193	53	5	Announcement	create	2026-08-26 19:49:16.185794	2026-08-26 19:49:16.185794
194	54	5	Announcement	create	2026-08-26 19:49:16.188153	2026-08-26 19:49:16.188153
195	55	5	Announcement	create	2026-08-26 19:49:16.189537	2026-08-26 19:49:16.189537
196	56	5	Announcement	create	2026-08-26 19:49:16.191445	2026-08-26 19:49:16.191445
197	57	5	Announcement	create	2026-08-26 19:49:16.193325	2026-08-26 19:49:16.193325
198	58	5	Announcement	create	2026-08-26 19:49:16.194787	2026-08-26 19:49:16.194787
199	59	5	Announcement	create	2026-08-26 19:49:16.19657	2026-08-26 19:49:16.19657
200	60	5	Announcement	create	2026-08-26 19:49:16.19822	2026-08-26 19:49:16.19822
201	61	5	Announcement	create	2026-08-26 19:49:16.199277	2026-08-26 19:49:16.199277
202	62	5	Announcement	create	2026-08-26 19:49:16.212875	2026-08-26 19:49:16.212875
203	63	5	Announcement	create	2026-08-26 19:49:16.214305	2026-08-26 19:49:16.214305
204	64	5	Announcement	create	2026-08-26 19:49:16.221106	2026-08-26 19:49:16.221106
205	65	5	Announcement	create	2026-08-26 19:49:16.222714	2026-08-26 19:49:16.222714
206	66	5	Announcement	create	2026-08-26 19:49:16.224362	2026-08-26 19:49:16.224362
207	67	5	Announcement	create	2026-08-26 19:49:16.225734	2026-08-26 19:49:16.225734
208	68	5	Announcement	create	2026-08-26 19:49:16.226884	2026-08-26 19:49:16.226884
209	69	5	Announcement	create	2026-08-26 19:49:16.229707	2026-08-26 19:49:16.229707
210	70	5	Announcement	create	2026-08-26 19:49:16.231357	2026-08-26 19:49:16.231357
211	71	5	Announcement	create	2026-08-26 19:49:16.232641	2026-08-26 19:49:16.232641
212	72	5	Announcement	create	2026-08-26 19:49:16.233849	2026-08-26 19:49:16.233849
213	73	5	Announcement	create	2026-08-26 19:49:16.235406	2026-08-26 19:49:16.235406
214	74	5	Announcement	create	2026-08-26 19:49:16.237058	2026-08-26 19:49:16.237058
215	75	5	Announcement	create	2026-08-26 19:49:16.238965	2026-08-26 19:49:16.238965
216	76	5	Announcement	create	2026-08-26 19:49:16.24172	2026-08-26 19:49:16.24172
217	77	5	Announcement	create	2026-08-26 19:49:16.243732	2026-08-26 19:49:16.243732
218	78	5	Announcement	create	2026-08-26 19:49:16.245451	2026-08-26 19:49:16.245451
219	79	5	Announcement	create	2026-08-26 19:49:16.247022	2026-08-26 19:49:16.247022
220	80	5	Announcement	create	2026-08-26 19:49:16.248319	2026-08-26 19:49:16.248319
221	81	5	Announcement	create	2026-08-26 19:49:16.249503	2026-08-26 19:49:16.249503
222	82	5	Announcement	create	2026-08-26 19:49:16.250976	2026-08-26 19:49:16.250976
223	83	5	Announcement	create	2026-08-26 19:49:16.253797	2026-08-26 19:49:16.253797
224	84	5	Announcement	create	2026-08-26 19:49:16.255313	2026-08-26 19:49:16.255313
225	85	5	Announcement	create	2026-08-26 19:49:16.256454	2026-08-26 19:49:16.256454
226	86	5	Announcement	create	2026-08-26 19:49:16.257889	2026-08-26 19:49:16.257889
227	87	5	Announcement	create	2026-08-26 19:49:16.259718	2026-08-26 19:49:16.259718
228	88	5	Announcement	create	2026-08-26 19:49:16.26144	2026-08-26 19:49:16.26144
229	89	5	Announcement	create	2026-08-26 19:49:16.26297	2026-08-26 19:49:16.26297
230	90	5	Announcement	create	2026-08-26 19:49:16.264858	2026-08-26 19:49:16.264858
231	91	5	Announcement	create	2026-08-26 19:49:16.26619	2026-08-26 19:49:16.26619
232	92	5	Announcement	create	2026-08-26 19:49:16.267884	2026-08-26 19:49:16.267884
233	93	5	Announcement	create	2026-08-26 19:49:16.269239	2026-08-26 19:49:16.269239
234	94	5	Announcement	create	2026-08-26 19:49:16.270887	2026-08-26 19:49:16.270887
235	95	5	Announcement	create	2026-08-26 19:49:16.272277	2026-08-26 19:49:16.272277
236	96	5	Announcement	create	2026-08-26 19:49:16.273689	2026-08-26 19:49:16.273689
237	97	5	Announcement	create	2026-08-26 19:49:16.275294	2026-08-26 19:49:16.275294
238	98	5	Announcement	create	2026-08-26 19:49:16.27748	2026-08-26 19:49:16.27748
239	99	5	Announcement	create	2026-08-26 19:49:16.278562	2026-08-26 19:49:16.278562
240	100	5	Announcement	create	2026-08-26 19:49:16.279602	2026-08-26 19:49:16.279602
241	101	5	Announcement	create	2026-08-26 19:49:16.280803	2026-08-26 19:49:16.280803
242	102	5	Announcement	create	2026-08-26 19:49:16.28199	2026-08-26 19:49:16.28199
243	103	5	Announcement	create	2026-08-26 19:49:16.282976	2026-08-26 19:49:16.282976
244	104	5	Announcement	create	2026-08-26 19:49:16.284466	2026-08-26 19:49:16.284466
245	105	5	Announcement	create	2026-08-26 19:49:16.286738	2026-08-26 19:49:16.286738
246	106	5	Announcement	create	2026-08-26 19:49:16.288404	2026-08-26 19:49:16.288404
247	107	5	Announcement	create	2026-08-26 19:49:16.289955	2026-08-26 19:49:16.289955
248	108	5	Announcement	create	2026-08-26 19:49:16.29159	2026-08-26 19:49:16.29159
249	109	5	Announcement	create	2026-08-26 19:49:16.293875	2026-08-26 19:49:16.293875
250	110	5	Announcement	create	2026-08-26 19:49:16.295256	2026-08-26 19:49:16.295256
251	111	5	Announcement	create	2026-08-26 19:49:16.296639	2026-08-26 19:49:16.296639
252	112	5	Announcement	create	2026-08-26 19:49:16.297804	2026-08-26 19:49:16.297804
253	113	5	Announcement	create	2026-08-26 19:49:16.29956	2026-08-26 19:49:16.29956
254	114	5	Announcement	create	2026-08-26 19:49:16.300826	2026-08-26 19:49:16.300826
255	115	5	Announcement	create	2026-08-26 19:49:16.302274	2026-08-26 19:49:16.302274
256	116	5	Announcement	create	2026-08-26 19:49:16.303684	2026-08-26 19:49:16.303684
257	117	5	Announcement	create	2026-08-26 19:49:16.304935	2026-08-26 19:49:16.304935
258	118	5	Announcement	create	2026-08-26 19:49:16.306712	2026-08-26 19:49:16.306712
259	119	5	Announcement	create	2026-08-26 19:49:16.308131	2026-08-26 19:49:16.308131
260	120	5	Announcement	create	2026-08-26 19:49:16.310442	2026-08-26 19:49:16.310442
261	121	5	Announcement	create	2026-08-26 19:49:16.312019	2026-08-26 19:49:16.312019
262	122	5	Announcement	create	2026-08-26 19:49:16.313277	2026-08-26 19:49:16.313277
263	123	5	Announcement	create	2026-08-26 19:49:16.315404	2026-08-26 19:49:16.315404
264	124	5	Announcement	create	2026-08-26 19:49:16.316644	2026-08-26 19:49:16.316644
265	125	5	Announcement	create	2026-08-26 19:49:16.318115	2026-08-26 19:49:16.318115
266	126	5	Announcement	create	2026-08-26 19:49:16.320253	2026-08-26 19:49:16.320253
267	127	5	Announcement	create	2026-08-26 19:49:16.322905	2026-08-26 19:49:16.322905
268	128	5	Announcement	create	2026-08-26 19:49:16.324342	2026-08-26 19:49:16.324342
269	129	5	Announcement	create	2026-08-26 19:49:16.32592	2026-08-26 19:49:16.32592
270	130	5	Announcement	create	2026-08-26 19:49:16.327455	2026-08-26 19:49:16.327455
271	131	5	Announcement	create	2026-08-26 19:49:16.328682	2026-08-26 19:49:16.328682
272	132	5	Announcement	create	2026-08-26 19:49:16.329934	2026-08-26 19:49:16.329934
273	133	5	Announcement	create	2026-08-26 19:49:16.331105	2026-08-26 19:49:16.331105
274	134	5	Announcement	create	2026-08-26 19:49:16.332156	2026-08-26 19:49:16.332156
275	135	5	Announcement	create	2026-08-26 19:49:16.333699	2026-08-26 19:49:16.333699
276	136	5	Announcement	create	2026-08-26 19:49:16.335104	2026-08-26 19:49:16.335104
277	137	5	Announcement	create	2026-08-26 19:49:16.336665	2026-08-26 19:49:16.336665
278	138	5	Announcement	create	2026-08-26 19:49:16.338045	2026-08-26 19:49:16.338045
279	139	5	Announcement	create	2026-08-26 19:49:16.339335	2026-08-26 19:49:16.339335
280	140	5	Announcement	create	2026-08-26 19:49:16.340647	2026-08-26 19:49:16.340647
281	141	5	Announcement	create	2026-08-26 19:49:16.342587	2026-08-26 19:49:16.342587
282	142	5	Announcement	create	2026-08-26 19:49:16.344155	2026-08-26 19:49:16.344155
283	143	5	Announcement	create	2026-08-26 19:49:16.345192	2026-08-26 19:49:16.345192
284	144	5	Announcement	create	2026-08-26 19:49:16.361511	2026-08-26 19:49:16.361511
285	145	5	Announcement	create	2026-08-26 19:49:16.363002	2026-08-26 19:49:16.363002
286	146	5	Announcement	create	2026-08-26 19:49:16.364236	2026-08-26 19:49:16.364236
287	147	5	Announcement	create	2026-08-26 19:49:16.36522	2026-08-26 19:49:16.36522
288	148	5	Announcement	create	2026-08-26 19:49:16.366222	2026-08-26 19:49:16.366222
289	149	5	Announcement	create	2026-08-26 19:49:16.367207	2026-08-26 19:49:16.367207
290	150	5	Announcement	create	2026-08-26 19:49:16.368444	2026-08-26 19:49:16.368444
291	151	5	Announcement	create	2026-08-26 19:49:16.369953	2026-08-26 19:49:16.369953
292	152	5	Announcement	create	2026-08-26 19:49:16.371582	2026-08-26 19:49:16.371582
293	153	5	Announcement	create	2026-08-26 19:49:16.372632	2026-08-26 19:49:16.372632
294	154	5	Announcement	create	2026-08-26 19:49:16.373973	2026-08-26 19:49:16.373973
295	155	5	Announcement	create	2026-08-26 19:49:16.375414	2026-08-26 19:49:16.375414
296	156	5	Announcement	create	2026-08-26 19:49:16.376673	2026-08-26 19:49:16.376673
297	157	5	Announcement	create	2026-08-26 19:49:16.37793	2026-08-26 19:49:16.37793
298	158	5	Announcement	create	2026-08-26 19:49:16.37901	2026-08-26 19:49:16.37901
299	159	5	Announcement	create	2026-08-26 19:49:16.380172	2026-08-26 19:49:16.380172
300	160	5	Announcement	create	2026-08-26 19:49:16.381752	2026-08-26 19:49:16.381752
301	161	5	Announcement	create	2026-08-26 19:49:16.383401	2026-08-26 19:49:16.383401
302	162	5	Announcement	create	2026-08-26 19:49:16.384665	2026-08-26 19:49:16.384665
303	163	5	Announcement	create	2026-08-26 19:49:16.386442	2026-08-26 19:49:16.386442
304	164	5	Announcement	create	2026-08-26 19:49:16.387953	2026-08-26 19:49:16.387953
305	165	5	Announcement	create	2026-08-26 19:49:16.38971	2026-08-26 19:49:16.38971
306	166	5	Announcement	create	2026-08-26 19:49:16.391322	2026-08-26 19:49:16.391322
307	167	5	Announcement	create	2026-08-26 19:49:16.392432	2026-08-26 19:49:16.392432
308	168	5	Announcement	create	2026-08-26 19:49:16.393435	2026-08-26 19:49:16.393435
309	169	5	Announcement	create	2026-08-26 19:49:16.39457	2026-08-26 19:49:16.39457
310	170	5	Announcement	create	2026-08-26 19:49:16.39585	2026-08-26 19:49:16.39585
311	171	5	Announcement	create	2026-08-26 19:49:16.397104	2026-08-26 19:49:16.397104
312	172	5	Announcement	create	2026-08-26 19:49:16.398292	2026-08-26 19:49:16.398292
313	173	5	Announcement	create	2026-08-26 19:49:16.399391	2026-08-26 19:49:16.399391
314	174	5	Announcement	create	2026-08-26 19:49:16.400607	2026-08-26 19:49:16.400607
315	175	5	Announcement	create	2026-08-26 19:49:16.40207	2026-08-26 19:49:16.40207
316	176	5	Announcement	create	2026-08-26 19:49:16.403615	2026-08-26 19:49:16.403615
317	177	5	Announcement	create	2026-08-26 19:49:16.404795	2026-08-26 19:49:16.404795
318	178	5	Announcement	create	2026-08-26 19:49:16.406278	2026-08-26 19:49:16.406278
319	179	5	Announcement	create	2026-08-26 19:49:16.41699	2026-08-26 19:49:16.41699
320	180	5	Announcement	create	2026-08-26 19:49:16.418938	2026-08-26 19:49:16.418938
321	181	5	Announcement	create	2026-08-26 19:49:16.420536	2026-08-26 19:49:16.420536
322	182	5	Announcement	create	2026-08-26 19:49:16.422038	2026-08-26 19:49:16.422038
323	183	5	Announcement	create	2026-08-26 19:49:16.423127	2026-08-26 19:49:16.423127
324	1	6	Announcement	create	2026-08-26 19:49:16.431852	2026-08-26 19:49:16.431852
325	2	6	Announcement	create	2026-08-26 19:49:16.433196	2026-08-26 19:49:16.433196
326	5	6	Announcement	create	2026-08-26 19:49:16.434439	2026-08-26 19:49:16.434439
327	6	6	Announcement	create	2026-08-26 19:49:16.435777	2026-08-26 19:49:16.435777
328	7	6	Announcement	create	2026-08-26 19:49:16.437182	2026-08-26 19:49:16.437182
329	8	6	Announcement	create	2026-08-26 19:49:16.439287	2026-08-26 19:49:16.439287
330	9	6	Announcement	create	2026-08-26 19:49:16.440993	2026-08-26 19:49:16.440993
331	10	6	Announcement	create	2026-08-26 19:49:16.442315	2026-08-26 19:49:16.442315
332	12	6	Announcement	create	2026-08-26 19:49:16.443961	2026-08-26 19:49:16.443961
333	13	6	Announcement	create	2026-08-26 19:49:16.445365	2026-08-26 19:49:16.445365
334	14	6	Announcement	create	2026-08-26 19:49:16.446505	2026-08-26 19:49:16.446505
335	15	6	Announcement	create	2026-08-26 19:49:16.448124	2026-08-26 19:49:16.448124
336	16	6	Announcement	create	2026-08-26 19:49:16.449471	2026-08-26 19:49:16.449471
337	17	6	Announcement	create	2026-08-26 19:49:16.452029	2026-08-26 19:49:16.452029
338	18	6	Announcement	create	2026-08-26 19:49:16.45376	2026-08-26 19:49:16.45376
339	19	6	Announcement	create	2026-08-26 19:49:16.455167	2026-08-26 19:49:16.455167
340	20	6	Announcement	create	2026-08-26 19:49:16.456501	2026-08-26 19:49:16.456501
341	21	6	Announcement	create	2026-08-26 19:49:16.45795	2026-08-26 19:49:16.45795
342	22	6	Announcement	create	2026-08-26 19:49:16.459907	2026-08-26 19:49:16.459907
343	23	6	Announcement	create	2026-08-26 19:49:16.462016	2026-08-26 19:49:16.462016
344	24	6	Announcement	create	2026-08-26 19:49:16.464385	2026-08-26 19:49:16.464385
345	25	6	Announcement	create	2026-08-26 19:49:16.465905	2026-08-26 19:49:16.465905
346	26	6	Announcement	create	2026-08-26 19:49:16.467465	2026-08-26 19:49:16.467465
347	27	6	Announcement	create	2026-08-26 19:49:16.468875	2026-08-26 19:49:16.468875
348	28	6	Announcement	create	2026-08-26 19:49:16.470285	2026-08-26 19:49:16.470285
349	29	6	Announcement	create	2026-08-26 19:49:16.471662	2026-08-26 19:49:16.471662
350	30	6	Announcement	create	2026-08-26 19:49:16.473302	2026-08-26 19:49:16.473302
351	31	6	Announcement	create	2026-08-26 19:49:16.475496	2026-08-26 19:49:16.475496
352	32	6	Announcement	create	2026-08-26 19:49:16.477126	2026-08-26 19:49:16.477126
353	33	6	Announcement	create	2026-08-26 19:49:16.47819	2026-08-26 19:49:16.47819
354	34	6	Announcement	create	2026-08-26 19:49:16.479489	2026-08-26 19:49:16.479489
355	35	6	Announcement	create	2026-08-26 19:49:16.480741	2026-08-26 19:49:16.480741
356	36	6	Announcement	create	2026-08-26 19:49:16.482321	2026-08-26 19:49:16.482321
357	37	6	Announcement	create	2026-08-26 19:49:16.483814	2026-08-26 19:49:16.483814
358	38	6	Announcement	create	2026-08-26 19:49:16.485254	2026-08-26 19:49:16.485254
359	39	6	Announcement	create	2026-08-26 19:49:16.487637	2026-08-26 19:49:16.487637
360	40	6	Announcement	create	2026-08-26 19:49:16.489182	2026-08-26 19:49:16.489182
361	41	6	Announcement	create	2026-08-26 19:49:16.490457	2026-08-26 19:49:16.490457
362	42	6	Announcement	create	2026-08-26 19:49:16.491597	2026-08-26 19:49:16.491597
363	43	6	Announcement	create	2026-08-26 19:49:16.493126	2026-08-26 19:49:16.493126
364	44	6	Announcement	create	2026-08-26 19:49:16.494667	2026-08-26 19:49:16.494667
365	45	6	Announcement	create	2026-08-26 19:49:16.495965	2026-08-26 19:49:16.495965
366	46	6	Announcement	create	2026-08-26 19:49:16.49809	2026-08-26 19:49:16.49809
367	47	6	Announcement	create	2026-08-26 19:49:16.500271	2026-08-26 19:49:16.500271
368	48	6	Announcement	create	2026-08-26 19:49:16.502198	2026-08-26 19:49:16.502198
369	49	6	Announcement	create	2026-08-26 19:49:16.503827	2026-08-26 19:49:16.503827
370	50	6	Announcement	create	2026-08-26 19:49:16.505513	2026-08-26 19:49:16.505513
371	51	6	Announcement	create	2026-08-26 19:49:16.506731	2026-08-26 19:49:16.506731
372	52	6	Announcement	create	2026-08-26 19:49:16.508342	2026-08-26 19:49:16.508342
373	53	6	Announcement	create	2026-08-26 19:49:16.510206	2026-08-26 19:49:16.510206
374	54	6	Announcement	create	2026-08-26 19:49:16.512373	2026-08-26 19:49:16.512373
375	55	6	Announcement	create	2026-08-26 19:49:16.513639	2026-08-26 19:49:16.513639
376	56	6	Announcement	create	2026-08-26 19:49:16.515195	2026-08-26 19:49:16.515195
377	57	6	Announcement	create	2026-08-26 19:49:16.516258	2026-08-26 19:49:16.516258
378	58	6	Announcement	create	2026-08-26 19:49:16.517196	2026-08-26 19:49:16.517196
379	59	6	Announcement	create	2026-08-26 19:49:16.518378	2026-08-26 19:49:16.518378
380	60	6	Announcement	create	2026-08-26 19:49:16.519705	2026-08-26 19:49:16.519705
381	61	6	Announcement	create	2026-08-26 19:49:16.522761	2026-08-26 19:49:16.522761
382	62	6	Announcement	create	2026-08-26 19:49:16.524172	2026-08-26 19:49:16.524172
383	63	6	Announcement	create	2026-08-26 19:49:16.52588	2026-08-26 19:49:16.52588
384	64	6	Announcement	create	2026-08-26 19:49:16.527399	2026-08-26 19:49:16.527399
385	65	6	Announcement	create	2026-08-26 19:49:16.528796	2026-08-26 19:49:16.528796
386	66	6	Announcement	create	2026-08-26 19:49:16.53004	2026-08-26 19:49:16.53004
387	67	6	Announcement	create	2026-08-26 19:49:16.531192	2026-08-26 19:49:16.531192
388	68	6	Announcement	create	2026-08-26 19:49:16.532223	2026-08-26 19:49:16.532223
389	69	6	Announcement	create	2026-08-26 19:49:16.533545	2026-08-26 19:49:16.533545
390	70	6	Announcement	create	2026-08-26 19:49:16.534774	2026-08-26 19:49:16.534774
391	71	6	Announcement	create	2026-08-26 19:49:16.536248	2026-08-26 19:49:16.536248
392	72	6	Announcement	create	2026-08-26 19:49:16.537756	2026-08-26 19:49:16.537756
393	73	6	Announcement	create	2026-08-26 19:49:16.53943	2026-08-26 19:49:16.53943
394	74	6	Announcement	create	2026-08-26 19:49:16.5411	2026-08-26 19:49:16.5411
395	75	6	Announcement	create	2026-08-26 19:49:16.542827	2026-08-26 19:49:16.542827
396	76	6	Announcement	create	2026-08-26 19:49:16.544456	2026-08-26 19:49:16.544456
397	77	6	Announcement	create	2026-08-26 19:49:16.558834	2026-08-26 19:49:16.558834
398	78	6	Announcement	create	2026-08-26 19:49:16.560504	2026-08-26 19:49:16.560504
399	79	6	Announcement	create	2026-08-26 19:49:16.561951	2026-08-26 19:49:16.561951
400	80	6	Announcement	create	2026-08-26 19:49:16.563085	2026-08-26 19:49:16.563085
401	81	6	Announcement	create	2026-08-26 19:49:16.564081	2026-08-26 19:49:16.564081
402	82	6	Announcement	create	2026-08-26 19:49:16.565584	2026-08-26 19:49:16.565584
403	83	6	Announcement	create	2026-08-26 19:49:16.567099	2026-08-26 19:49:16.567099
404	84	6	Announcement	create	2026-08-26 19:49:16.568328	2026-08-26 19:49:16.568328
405	85	6	Announcement	create	2026-08-26 19:49:16.570041	2026-08-26 19:49:16.570041
406	86	6	Announcement	create	2026-08-26 19:49:16.571529	2026-08-26 19:49:16.571529
407	87	6	Announcement	create	2026-08-26 19:49:16.572865	2026-08-26 19:49:16.572865
408	88	6	Announcement	create	2026-08-26 19:49:16.574057	2026-08-26 19:49:16.574057
409	89	6	Announcement	create	2026-08-26 19:49:16.575476	2026-08-26 19:49:16.575476
410	90	6	Announcement	create	2026-08-26 19:49:16.576889	2026-08-26 19:49:16.576889
411	91	6	Announcement	create	2026-08-26 19:49:16.578246	2026-08-26 19:49:16.578246
412	92	6	Announcement	create	2026-08-26 19:49:16.579348	2026-08-26 19:49:16.579348
413	93	6	Announcement	create	2026-08-26 19:49:16.580815	2026-08-26 19:49:16.580815
414	94	6	Announcement	create	2026-08-26 19:49:16.582314	2026-08-26 19:49:16.582314
415	95	6	Announcement	create	2026-08-26 19:49:16.583508	2026-08-26 19:49:16.583508
416	96	6	Announcement	create	2026-08-26 19:49:16.584784	2026-08-26 19:49:16.584784
417	97	6	Announcement	create	2026-08-26 19:49:16.586547	2026-08-26 19:49:16.586547
418	98	6	Announcement	create	2026-08-26 19:49:16.587848	2026-08-26 19:49:16.587848
419	99	6	Announcement	create	2026-08-26 19:49:16.589346	2026-08-26 19:49:16.589346
420	100	6	Announcement	create	2026-08-26 19:49:16.590436	2026-08-26 19:49:16.590436
421	101	6	Announcement	create	2026-08-26 19:49:16.591781	2026-08-26 19:49:16.591781
422	102	6	Announcement	create	2026-08-26 19:49:16.593234	2026-08-26 19:49:16.593234
423	103	6	Announcement	create	2026-08-26 19:49:16.59502	2026-08-26 19:49:16.59502
424	104	6	Announcement	create	2026-08-26 19:49:16.596235	2026-08-26 19:49:16.596235
425	105	6	Announcement	create	2026-08-26 19:49:16.597792	2026-08-26 19:49:16.597792
426	106	6	Announcement	create	2026-08-26 19:49:16.598965	2026-08-26 19:49:16.598965
427	107	6	Announcement	create	2026-08-26 19:49:16.599951	2026-08-26 19:49:16.599951
428	108	6	Announcement	create	2026-08-26 19:49:16.600926	2026-08-26 19:49:16.600926
429	109	6	Announcement	create	2026-08-26 19:49:16.602221	2026-08-26 19:49:16.602221
430	110	6	Announcement	create	2026-08-26 19:49:16.603403	2026-08-26 19:49:16.603403
431	111	6	Announcement	create	2026-08-26 19:49:16.605025	2026-08-26 19:49:16.605025
432	112	6	Announcement	create	2026-08-26 19:49:16.615785	2026-08-26 19:49:16.615785
433	113	6	Announcement	create	2026-08-26 19:49:16.617062	2026-08-26 19:49:16.617062
434	114	6	Announcement	create	2026-08-26 19:49:16.618056	2026-08-26 19:49:16.618056
435	115	6	Announcement	create	2026-08-26 19:49:16.619551	2026-08-26 19:49:16.619551
436	116	6	Announcement	create	2026-08-26 19:49:16.621283	2026-08-26 19:49:16.621283
437	117	6	Announcement	create	2026-08-26 19:49:16.622876	2026-08-26 19:49:16.622876
438	118	6	Announcement	create	2026-08-26 19:49:16.624245	2026-08-26 19:49:16.624245
439	119	6	Announcement	create	2026-08-26 19:49:16.626891	2026-08-26 19:49:16.626891
440	120	6	Announcement	create	2026-08-26 19:49:16.62835	2026-08-26 19:49:16.62835
441	121	6	Announcement	create	2026-08-26 19:49:16.629985	2026-08-26 19:49:16.629985
442	122	6	Announcement	create	2026-08-26 19:49:16.631276	2026-08-26 19:49:16.631276
443	123	6	Announcement	create	2026-08-26 19:49:16.63273	2026-08-26 19:49:16.63273
444	124	6	Announcement	create	2026-08-26 19:49:16.634047	2026-08-26 19:49:16.634047
445	125	6	Announcement	create	2026-08-26 19:49:16.635478	2026-08-26 19:49:16.635478
446	126	6	Announcement	create	2026-08-26 19:49:16.637915	2026-08-26 19:49:16.637915
447	127	6	Announcement	create	2026-08-26 19:49:16.639392	2026-08-26 19:49:16.639392
448	128	6	Announcement	create	2026-08-26 19:49:16.640996	2026-08-26 19:49:16.640996
449	129	6	Announcement	create	2026-08-26 19:49:16.642805	2026-08-26 19:49:16.642805
450	130	6	Announcement	create	2026-08-26 19:49:16.644558	2026-08-26 19:49:16.644558
451	131	6	Announcement	create	2026-08-26 19:49:16.645904	2026-08-26 19:49:16.645904
452	132	6	Announcement	create	2026-08-26 19:49:16.647146	2026-08-26 19:49:16.647146
453	133	6	Announcement	create	2026-08-26 19:49:16.648399	2026-08-26 19:49:16.648399
454	134	6	Announcement	create	2026-08-26 19:49:16.650892	2026-08-26 19:49:16.650892
455	135	6	Announcement	create	2026-08-26 19:49:16.652147	2026-08-26 19:49:16.652147
456	136	6	Announcement	create	2026-08-26 19:49:16.653368	2026-08-26 19:49:16.653368
457	137	6	Announcement	create	2026-08-26 19:49:16.655122	2026-08-26 19:49:16.655122
458	138	6	Announcement	create	2026-08-26 19:49:16.656749	2026-08-26 19:49:16.656749
459	139	6	Announcement	create	2026-08-26 19:49:16.658008	2026-08-26 19:49:16.658008
460	140	6	Announcement	create	2026-08-26 19:49:16.659312	2026-08-26 19:49:16.659312
461	141	6	Announcement	create	2026-08-26 19:49:16.661444	2026-08-26 19:49:16.661444
462	142	6	Announcement	create	2026-08-26 19:49:16.662686	2026-08-26 19:49:16.662686
463	143	6	Announcement	create	2026-08-26 19:49:16.664307	2026-08-26 19:49:16.664307
464	144	6	Announcement	create	2026-08-26 19:49:16.665778	2026-08-26 19:49:16.665778
465	145	6	Announcement	create	2026-08-26 19:49:16.666945	2026-08-26 19:49:16.666945
466	146	6	Announcement	create	2026-08-26 19:49:16.668413	2026-08-26 19:49:16.668413
467	147	6	Announcement	create	2026-08-26 19:49:16.66993	2026-08-26 19:49:16.66993
468	148	6	Announcement	create	2026-08-26 19:49:16.672551	2026-08-26 19:49:16.672551
469	149	6	Announcement	create	2026-08-26 19:49:16.674186	2026-08-26 19:49:16.674186
470	150	6	Announcement	create	2026-08-26 19:49:16.675625	2026-08-26 19:49:16.675625
471	151	6	Announcement	create	2026-08-26 19:49:16.676738	2026-08-26 19:49:16.676738
472	152	6	Announcement	create	2026-08-26 19:49:16.677885	2026-08-26 19:49:16.677885
473	153	6	Announcement	create	2026-08-26 19:49:16.679073	2026-08-26 19:49:16.679073
474	154	6	Announcement	create	2026-08-26 19:49:16.680689	2026-08-26 19:49:16.680689
475	155	6	Announcement	create	2026-08-26 19:49:16.682412	2026-08-26 19:49:16.682412
476	156	6	Announcement	create	2026-08-26 19:49:16.6845	2026-08-26 19:49:16.6845
477	157	6	Announcement	create	2026-08-26 19:49:16.686304	2026-08-26 19:49:16.686304
478	158	6	Announcement	create	2026-08-26 19:49:16.687586	2026-08-26 19:49:16.687586
479	159	6	Announcement	create	2026-08-26 19:49:16.689254	2026-08-26 19:49:16.689254
480	160	6	Announcement	create	2026-08-26 19:49:16.690831	2026-08-26 19:49:16.690831
481	161	6	Announcement	create	2026-08-26 19:49:16.69253	2026-08-26 19:49:16.69253
482	162	6	Announcement	create	2026-08-26 19:49:16.694025	2026-08-26 19:49:16.694025
483	163	6	Announcement	create	2026-08-26 19:49:16.695998	2026-08-26 19:49:16.695998
484	164	6	Announcement	create	2026-08-26 19:49:16.697873	2026-08-26 19:49:16.697873
485	165	6	Announcement	create	2026-08-26 19:49:16.69905	2026-08-26 19:49:16.69905
486	166	6	Announcement	create	2026-08-26 19:49:16.700117	2026-08-26 19:49:16.700117
487	167	6	Announcement	create	2026-08-26 19:49:16.701135	2026-08-26 19:49:16.701135
488	168	6	Announcement	create	2026-08-26 19:49:16.702323	2026-08-26 19:49:16.702323
489	169	6	Announcement	create	2026-08-26 19:49:16.703553	2026-08-26 19:49:16.703553
490	170	6	Announcement	create	2026-08-26 19:49:16.705316	2026-08-26 19:49:16.705316
491	171	6	Announcement	create	2026-08-26 19:49:16.706666	2026-08-26 19:49:16.706666
492	172	6	Announcement	create	2026-08-26 19:49:16.708172	2026-08-26 19:49:16.708172
493	173	6	Announcement	create	2026-08-26 19:49:16.709557	2026-08-26 19:49:16.709557
494	174	6	Announcement	create	2026-08-26 19:49:16.712316	2026-08-26 19:49:16.712316
495	175	6	Announcement	create	2026-08-26 19:49:16.71411	2026-08-26 19:49:16.71411
496	176	6	Announcement	create	2026-08-26 19:49:16.715649	2026-08-26 19:49:16.715649
497	177	6	Announcement	create	2026-08-26 19:49:16.717151	2026-08-26 19:49:16.717151
498	178	6	Announcement	create	2026-08-26 19:49:16.71855	2026-08-26 19:49:16.71855
499	179	6	Announcement	create	2026-08-26 19:49:16.720276	2026-08-26 19:49:16.720276
500	180	6	Announcement	create	2026-08-26 19:49:16.722057	2026-08-26 19:49:16.722057
501	181	6	Announcement	create	2026-08-26 19:49:16.723953	2026-08-26 19:49:16.723953
502	182	6	Announcement	create	2026-08-26 19:49:16.725347	2026-08-26 19:49:16.725347
503	183	6	Announcement	create	2026-08-26 19:49:16.726845	2026-08-26 19:49:16.726845
504	1	7	Announcement	create	2026-08-26 19:49:16.746067	2026-08-26 19:49:16.746067
505	2	7	Announcement	create	2026-08-26 19:49:16.747503	2026-08-26 19:49:16.747503
506	5	7	Announcement	create	2026-08-26 19:49:16.748575	2026-08-26 19:49:16.748575
507	6	7	Announcement	create	2026-08-26 19:49:16.74957	2026-08-26 19:49:16.74957
508	7	7	Announcement	create	2026-08-26 19:49:16.751125	2026-08-26 19:49:16.751125
509	8	7	Announcement	create	2026-08-26 19:49:16.76504	2026-08-26 19:49:16.76504
510	9	7	Announcement	create	2026-08-26 19:49:16.76642	2026-08-26 19:49:16.76642
511	10	7	Announcement	create	2026-08-26 19:49:16.767381	2026-08-26 19:49:16.767381
512	14	7	Announcement	create	2026-08-26 19:49:16.768432	2026-08-26 19:49:16.768432
513	15	7	Announcement	create	2026-08-26 19:49:16.770219	2026-08-26 19:49:16.770219
514	16	7	Announcement	create	2026-08-26 19:49:16.772021	2026-08-26 19:49:16.772021
515	17	7	Announcement	create	2026-08-26 19:49:16.77347	2026-08-26 19:49:16.77347
516	18	7	Announcement	create	2026-08-26 19:49:16.774728	2026-08-26 19:49:16.774728
517	19	7	Announcement	create	2026-08-26 19:49:16.775806	2026-08-26 19:49:16.775806
518	20	7	Announcement	create	2026-08-26 19:49:16.777219	2026-08-26 19:49:16.777219
519	21	7	Announcement	create	2026-08-26 19:49:16.778338	2026-08-26 19:49:16.778338
520	22	7	Announcement	create	2026-08-26 19:49:16.779909	2026-08-26 19:49:16.779909
521	23	7	Announcement	create	2026-08-26 19:49:16.781483	2026-08-26 19:49:16.781483
522	24	7	Announcement	create	2026-08-26 19:49:16.78303	2026-08-26 19:49:16.78303
523	25	7	Announcement	create	2026-08-26 19:49:16.784332	2026-08-26 19:49:16.784332
524	26	7	Announcement	create	2026-08-26 19:49:16.785464	2026-08-26 19:49:16.785464
525	27	7	Announcement	create	2026-08-26 19:49:16.787161	2026-08-26 19:49:16.787161
526	28	7	Announcement	create	2026-08-26 19:49:16.788978	2026-08-26 19:49:16.788978
527	29	7	Announcement	create	2026-08-26 19:49:16.790481	2026-08-26 19:49:16.790481
528	30	7	Announcement	create	2026-08-26 19:49:16.791888	2026-08-26 19:49:16.791888
529	31	7	Announcement	create	2026-08-26 19:49:16.793253	2026-08-26 19:49:16.793253
530	32	7	Announcement	create	2026-08-26 19:49:16.794825	2026-08-26 19:49:16.794825
531	33	7	Announcement	create	2026-08-26 19:49:16.796331	2026-08-26 19:49:16.796331
532	34	7	Announcement	create	2026-08-26 19:49:16.797549	2026-08-26 19:49:16.797549
533	35	7	Announcement	create	2026-08-26 19:49:16.798803	2026-08-26 19:49:16.798803
534	36	7	Announcement	create	2026-08-26 19:49:16.800032	2026-08-26 19:49:16.800032
535	37	7	Announcement	create	2026-08-26 19:49:16.801232	2026-08-26 19:49:16.801232
536	38	7	Announcement	create	2026-08-26 19:49:16.802418	2026-08-26 19:49:16.802418
537	39	7	Announcement	create	2026-08-26 19:49:16.804033	2026-08-26 19:49:16.804033
538	40	7	Announcement	create	2026-08-26 19:49:16.805437	2026-08-26 19:49:16.805437
539	41	7	Announcement	create	2026-08-26 19:49:16.806823	2026-08-26 19:49:16.806823
540	42	7	Announcement	create	2026-08-26 19:49:16.807892	2026-08-26 19:49:16.807892
541	43	7	Announcement	create	2026-08-26 19:49:16.80892	2026-08-26 19:49:16.80892
542	44	7	Announcement	create	2026-08-26 19:49:16.810467	2026-08-26 19:49:16.810467
543	45	7	Announcement	create	2026-08-26 19:49:16.812099	2026-08-26 19:49:16.812099
544	1	8	Announcement	create	2026-08-26 19:49:16.82683	2026-08-26 19:49:16.82683
545	2	8	Announcement	create	2026-08-26 19:49:16.828195	2026-08-26 19:49:16.828195
546	5	8	Announcement	create	2026-08-26 19:49:16.829429	2026-08-26 19:49:16.829429
547	6	8	Announcement	create	2026-08-26 19:49:16.831703	2026-08-26 19:49:16.831703
548	7	8	Announcement	create	2026-08-26 19:49:16.832843	2026-08-26 19:49:16.832843
549	8	8	Announcement	create	2026-08-26 19:49:16.833936	2026-08-26 19:49:16.833936
550	9	8	Announcement	create	2026-08-26 19:49:16.835215	2026-08-26 19:49:16.835215
551	10	8	Announcement	create	2026-08-26 19:49:16.837089	2026-08-26 19:49:16.837089
552	5	9	Announcement	create	2026-08-26 19:49:16.848593	2026-08-26 19:49:16.848593
553	6	9	Announcement	create	2026-08-26 19:49:16.850222	2026-08-26 19:49:16.850222
554	7	9	Announcement	create	2026-08-26 19:49:16.851745	2026-08-26 19:49:16.851745
555	2	10	Announcement	create	2026-08-26 19:49:16.859775	2026-08-26 19:49:16.859775
556	5	10	Announcement	create	2026-08-26 19:49:16.861458	2026-08-26 19:49:16.861458
557	6	10	Announcement	create	2026-08-26 19:49:16.863275	2026-08-26 19:49:16.863275
558	7	10	Announcement	create	2026-08-26 19:49:16.864442	2026-08-26 19:49:16.864442
559	2	11	Announcement	create	2026-08-26 19:49:16.872886	2026-08-26 19:49:16.872886
560	46	11	Announcement	create	2026-08-26 19:49:16.874471	2026-08-26 19:49:16.874471
561	47	11	Announcement	create	2026-08-26 19:49:16.875801	2026-08-26 19:49:16.875801
562	48	11	Announcement	create	2026-08-26 19:49:16.877653	2026-08-26 19:49:16.877653
563	50	11	Announcement	create	2026-08-26 19:49:16.879607	2026-08-26 19:49:16.879607
564	51	11	Announcement	create	2026-08-26 19:49:16.880727	2026-08-26 19:49:16.880727
565	52	11	Announcement	create	2026-08-26 19:49:16.883241	2026-08-26 19:49:16.883241
566	53	11	Announcement	create	2026-08-26 19:49:16.884554	2026-08-26 19:49:16.884554
567	55	11	Announcement	create	2026-08-26 19:49:16.885863	2026-08-26 19:49:16.885863
568	56	11	Announcement	create	2026-08-26 19:49:16.887366	2026-08-26 19:49:16.887366
569	57	11	Announcement	create	2026-08-26 19:49:16.888858	2026-08-26 19:49:16.888858
570	2	12	Announcement	create	2026-08-26 19:49:16.89719	2026-08-26 19:49:16.89719
571	1	15	Announcement	create	2026-08-28 15:08:35.125311	2026-08-28 15:08:35.125311
572	2	15	Announcement	create	2026-08-28 15:08:35.130554	2026-08-28 15:08:35.130554
573	5	15	Announcement	create	2026-08-28 15:08:35.132128	2026-08-28 15:08:35.132128
574	6	15	Announcement	create	2026-08-28 15:08:35.133046	2026-08-28 15:08:35.133046
575	7	15	Announcement	create	2026-08-28 15:08:35.133944	2026-08-28 15:08:35.133944
576	8	15	Announcement	create	2026-08-28 15:08:35.13511	2026-08-28 15:08:35.13511
577	9	15	Announcement	create	2026-08-28 15:08:35.136045	2026-08-28 15:08:35.136045
578	10	15	Announcement	create	2026-08-28 15:08:35.136943	2026-08-28 15:08:35.136943
579	12	15	Announcement	create	2026-08-28 15:08:35.137854	2026-08-28 15:08:35.137854
580	13	15	Announcement	create	2026-08-28 15:08:35.138833	2026-08-28 15:08:35.138833
581	14	15	Announcement	create	2026-08-28 15:08:35.140007	2026-08-28 15:08:35.140007
582	15	15	Announcement	create	2026-08-28 15:08:35.141249	2026-08-28 15:08:35.141249
583	16	15	Announcement	create	2026-08-28 15:08:35.14214	2026-08-28 15:08:35.14214
584	17	15	Announcement	create	2026-08-28 15:08:35.143078	2026-08-28 15:08:35.143078
585	18	15	Announcement	create	2026-08-28 15:08:35.144413	2026-08-28 15:08:35.144413
586	19	15	Announcement	create	2026-08-28 15:08:35.145589	2026-08-28 15:08:35.145589
587	20	15	Announcement	create	2026-08-28 15:08:35.146588	2026-08-28 15:08:35.146588
588	21	15	Announcement	create	2026-08-28 15:08:35.147499	2026-08-28 15:08:35.147499
589	22	15	Announcement	create	2026-08-28 15:08:35.148385	2026-08-28 15:08:35.148385
590	23	15	Announcement	create	2026-08-28 15:08:35.14953	2026-08-28 15:08:35.14953
591	24	15	Announcement	create	2026-08-28 15:08:35.150571	2026-08-28 15:08:35.150571
592	25	15	Announcement	create	2026-08-28 15:08:35.151488	2026-08-28 15:08:35.151488
593	26	15	Announcement	create	2026-08-28 15:08:35.152417	2026-08-28 15:08:35.152417
594	27	15	Announcement	create	2026-08-28 15:08:35.153499	2026-08-28 15:08:35.153499
595	28	15	Announcement	create	2026-08-28 15:08:35.155378	2026-08-28 15:08:35.155378
596	29	15	Announcement	create	2026-08-28 15:08:35.15628	2026-08-28 15:08:35.15628
597	30	15	Announcement	create	2026-08-28 15:08:35.157495	2026-08-28 15:08:35.157495
598	31	15	Announcement	create	2026-08-28 15:08:35.15839	2026-08-28 15:08:35.15839
599	32	15	Announcement	create	2026-08-28 15:08:35.159321	2026-08-28 15:08:35.159321
600	33	15	Announcement	create	2026-08-28 15:08:35.160263	2026-08-28 15:08:35.160263
601	34	15	Announcement	create	2026-08-28 15:08:35.161406	2026-08-28 15:08:35.161406
602	35	15	Announcement	create	2026-08-28 15:08:35.163323	2026-08-28 15:08:35.163323
603	36	15	Announcement	create	2026-08-28 15:08:35.164287	2026-08-28 15:08:35.164287
604	37	15	Announcement	create	2026-08-28 15:08:35.165179	2026-08-28 15:08:35.165179
605	38	15	Announcement	create	2026-08-28 15:08:35.166054	2026-08-28 15:08:35.166054
606	39	15	Announcement	create	2026-08-28 15:08:35.16745	2026-08-28 15:08:35.16745
607	40	15	Announcement	create	2026-08-28 15:08:35.168403	2026-08-28 15:08:35.168403
608	41	15	Announcement	create	2026-08-28 15:08:35.169251	2026-08-28 15:08:35.169251
609	42	15	Announcement	create	2026-08-28 15:08:35.170092	2026-08-28 15:08:35.170092
610	43	15	Announcement	create	2026-08-28 15:08:35.171028	2026-08-28 15:08:35.171028
611	44	15	Announcement	create	2026-08-28 15:08:35.172258	2026-08-28 15:08:35.172258
612	45	15	Announcement	create	2026-08-28 15:08:35.180589	2026-08-28 15:08:35.180589
613	46	15	Announcement	create	2026-08-28 15:08:35.181804	2026-08-28 15:08:35.181804
614	47	15	Announcement	create	2026-08-28 15:08:35.183048	2026-08-28 15:08:35.183048
615	48	15	Announcement	create	2026-08-28 15:08:35.184128	2026-08-28 15:08:35.184128
616	49	15	Announcement	create	2026-08-28 15:08:35.185075	2026-08-28 15:08:35.185075
617	50	15	Announcement	create	2026-08-28 15:08:35.185956	2026-08-28 15:08:35.185956
618	51	15	Announcement	create	2026-08-28 15:08:35.186825	2026-08-28 15:08:35.186825
619	52	15	Announcement	create	2026-08-28 15:08:35.187735	2026-08-28 15:08:35.187735
620	53	15	Announcement	create	2026-08-28 15:08:35.18868	2026-08-28 15:08:35.18868
621	54	15	Announcement	create	2026-08-28 15:08:35.189587	2026-08-28 15:08:35.189587
622	55	15	Announcement	create	2026-08-28 15:08:35.190442	2026-08-28 15:08:35.190442
623	56	15	Announcement	create	2026-08-28 15:08:35.191416	2026-08-28 15:08:35.191416
624	57	15	Announcement	create	2026-08-28 15:08:35.192375	2026-08-28 15:08:35.192375
625	58	15	Announcement	create	2026-08-28 15:08:35.193301	2026-08-28 15:08:35.193301
626	59	15	Announcement	create	2026-08-28 15:08:35.19418	2026-08-28 15:08:35.19418
627	60	15	Announcement	create	2026-08-28 15:08:35.195616	2026-08-28 15:08:35.195616
628	61	15	Announcement	create	2026-08-28 15:08:35.196519	2026-08-28 15:08:35.196519
629	62	15	Announcement	create	2026-08-28 15:08:35.197362	2026-08-28 15:08:35.197362
630	63	15	Announcement	create	2026-08-28 15:08:35.198203	2026-08-28 15:08:35.198203
631	64	15	Announcement	create	2026-08-28 15:08:35.199335	2026-08-28 15:08:35.199335
632	65	15	Announcement	create	2026-08-28 15:08:35.200208	2026-08-28 15:08:35.200208
633	66	15	Announcement	create	2026-08-28 15:08:35.201058	2026-08-28 15:08:35.201058
634	67	15	Announcement	create	2026-08-28 15:08:35.201898	2026-08-28 15:08:35.201898
635	68	15	Announcement	create	2026-08-28 15:08:35.202739	2026-08-28 15:08:35.202739
636	69	15	Announcement	create	2026-08-28 15:08:35.203635	2026-08-28 15:08:35.203635
637	70	15	Announcement	create	2026-08-28 15:08:35.204483	2026-08-28 15:08:35.204483
638	71	15	Announcement	create	2026-08-28 15:08:35.205343	2026-08-28 15:08:35.205343
639	72	15	Announcement	create	2026-08-28 15:08:35.206187	2026-08-28 15:08:35.206187
640	73	15	Announcement	create	2026-08-28 15:08:35.207095	2026-08-28 15:08:35.207095
641	74	15	Announcement	create	2026-08-28 15:08:35.208955	2026-08-28 15:08:35.208955
642	75	15	Announcement	create	2026-08-28 15:08:35.21	2026-08-28 15:08:35.21
643	76	15	Announcement	create	2026-08-28 15:08:35.210896	2026-08-28 15:08:35.210896
644	77	15	Announcement	create	2026-08-28 15:08:35.211829	2026-08-28 15:08:35.211829
645	78	15	Announcement	create	2026-08-28 15:08:35.212716	2026-08-28 15:08:35.212716
646	79	15	Announcement	create	2026-08-28 15:08:35.213561	2026-08-28 15:08:35.213561
647	80	15	Announcement	create	2026-08-28 15:08:35.214455	2026-08-28 15:08:35.214455
648	81	15	Announcement	create	2026-08-28 15:08:35.215337	2026-08-28 15:08:35.215337
649	82	15	Announcement	create	2026-08-28 15:08:35.21652	2026-08-28 15:08:35.21652
650	83	15	Announcement	create	2026-08-28 15:08:35.221053	2026-08-28 15:08:35.221053
651	84	15	Announcement	create	2026-08-28 15:08:35.222011	2026-08-28 15:08:35.222011
652	85	15	Announcement	create	2026-08-28 15:08:35.223497	2026-08-28 15:08:35.223497
653	86	15	Announcement	create	2026-08-28 15:08:35.224611	2026-08-28 15:08:35.224611
654	87	15	Announcement	create	2026-08-28 15:08:35.225572	2026-08-28 15:08:35.225572
655	88	15	Announcement	create	2026-08-28 15:08:35.226443	2026-08-28 15:08:35.226443
656	89	15	Announcement	create	2026-08-28 15:08:35.227332	2026-08-28 15:08:35.227332
657	90	15	Announcement	create	2026-08-28 15:08:35.228438	2026-08-28 15:08:35.228438
658	91	15	Announcement	create	2026-08-28 15:08:35.229307	2026-08-28 15:08:35.229307
659	92	15	Announcement	create	2026-08-28 15:08:35.230138	2026-08-28 15:08:35.230138
660	93	15	Announcement	create	2026-08-28 15:08:35.231035	2026-08-28 15:08:35.231035
661	94	15	Announcement	create	2026-08-28 15:08:35.231919	2026-08-28 15:08:35.231919
662	95	15	Announcement	create	2026-08-28 15:08:35.232761	2026-08-28 15:08:35.232761
663	96	15	Announcement	create	2026-08-28 15:08:35.233605	2026-08-28 15:08:35.233605
664	97	15	Announcement	create	2026-08-28 15:08:35.246405	2026-08-28 15:08:35.246405
665	98	15	Announcement	create	2026-08-28 15:08:35.247701	2026-08-28 15:08:35.247701
666	99	15	Announcement	create	2026-08-28 15:08:35.248626	2026-08-28 15:08:35.248626
667	100	15	Announcement	create	2026-08-28 15:08:35.249513	2026-08-28 15:08:35.249513
668	101	15	Announcement	create	2026-08-28 15:08:35.250417	2026-08-28 15:08:35.250417
669	102	15	Announcement	create	2026-08-28 15:08:35.251372	2026-08-28 15:08:35.251372
670	103	15	Announcement	create	2026-08-28 15:08:35.252267	2026-08-28 15:08:35.252267
671	104	15	Announcement	create	2026-08-28 15:08:35.253983	2026-08-28 15:08:35.253983
672	105	15	Announcement	create	2026-08-28 15:08:35.254926	2026-08-28 15:08:35.254926
673	106	15	Announcement	create	2026-08-28 15:08:35.255843	2026-08-28 15:08:35.255843
674	107	15	Announcement	create	2026-08-28 15:08:35.256901	2026-08-28 15:08:35.256901
675	108	15	Announcement	create	2026-08-28 15:08:35.257882	2026-08-28 15:08:35.257882
676	109	15	Announcement	create	2026-08-28 15:08:35.258752	2026-08-28 15:08:35.258752
677	110	15	Announcement	create	2026-08-28 15:08:35.259666	2026-08-28 15:08:35.259666
678	111	15	Announcement	create	2026-08-28 15:08:35.260524	2026-08-28 15:08:35.260524
679	112	15	Announcement	create	2026-08-28 15:08:35.26197	2026-08-28 15:08:35.26197
680	113	15	Announcement	create	2026-08-28 15:08:35.262881	2026-08-28 15:08:35.262881
681	114	15	Announcement	create	2026-08-28 15:08:35.263778	2026-08-28 15:08:35.263778
682	115	15	Announcement	create	2026-08-28 15:08:35.264667	2026-08-28 15:08:35.264667
683	116	15	Announcement	create	2026-08-28 15:08:35.265517	2026-08-28 15:08:35.265517
684	117	15	Announcement	create	2026-08-28 15:08:35.266874	2026-08-28 15:08:35.266874
685	118	15	Announcement	create	2026-08-28 15:08:35.268176	2026-08-28 15:08:35.268176
686	119	15	Announcement	create	2026-08-28 15:08:35.269301	2026-08-28 15:08:35.269301
687	120	15	Announcement	create	2026-08-28 15:08:35.270827	2026-08-28 15:08:35.270827
688	121	15	Announcement	create	2026-08-28 15:08:35.271769	2026-08-28 15:08:35.271769
689	122	15	Announcement	create	2026-08-28 15:08:35.272797	2026-08-28 15:08:35.272797
690	123	15	Announcement	create	2026-08-28 15:08:35.274666	2026-08-28 15:08:35.274666
691	124	15	Announcement	create	2026-08-28 15:08:35.275689	2026-08-28 15:08:35.275689
692	125	15	Announcement	create	2026-08-28 15:08:35.276557	2026-08-28 15:08:35.276557
693	126	15	Announcement	create	2026-08-28 15:08:35.277402	2026-08-28 15:08:35.277402
694	127	15	Announcement	create	2026-08-28 15:08:35.278675	2026-08-28 15:08:35.278675
695	128	15	Announcement	create	2026-08-28 15:08:35.279655	2026-08-28 15:08:35.279655
696	129	15	Announcement	create	2026-08-28 15:08:35.280538	2026-08-28 15:08:35.280538
697	130	15	Announcement	create	2026-08-28 15:08:35.281369	2026-08-28 15:08:35.281369
698	131	15	Announcement	create	2026-08-28 15:08:35.28221	2026-08-28 15:08:35.28221
699	132	15	Announcement	create	2026-08-28 15:08:35.283123	2026-08-28 15:08:35.283123
700	133	15	Announcement	create	2026-08-28 15:08:35.284013	2026-08-28 15:08:35.284013
701	134	15	Announcement	create	2026-08-28 15:08:35.284877	2026-08-28 15:08:35.284877
702	135	15	Announcement	create	2026-08-28 15:08:35.286053	2026-08-28 15:08:35.286053
703	136	15	Announcement	create	2026-08-28 15:08:35.286983	2026-08-28 15:08:35.286983
704	137	15	Announcement	create	2026-08-28 15:08:35.287843	2026-08-28 15:08:35.287843
705	138	15	Announcement	create	2026-08-28 15:08:35.288735	2026-08-28 15:08:35.288735
706	139	15	Announcement	create	2026-08-28 15:08:35.289613	2026-08-28 15:08:35.289613
707	140	15	Announcement	create	2026-08-28 15:08:35.290463	2026-08-28 15:08:35.290463
708	141	15	Announcement	create	2026-08-28 15:08:35.291338	2026-08-28 15:08:35.291338
709	142	15	Announcement	create	2026-08-28 15:08:35.292183	2026-08-28 15:08:35.292183
710	143	15	Announcement	create	2026-08-28 15:08:35.293676	2026-08-28 15:08:35.293676
711	144	15	Announcement	create	2026-08-28 15:08:35.294567	2026-08-28 15:08:35.294567
712	145	15	Announcement	create	2026-08-28 15:08:35.295499	2026-08-28 15:08:35.295499
713	146	15	Announcement	create	2026-08-28 15:08:35.296547	2026-08-28 15:08:35.296547
714	147	15	Announcement	create	2026-08-28 15:08:35.297816	2026-08-28 15:08:35.297816
715	148	15	Announcement	create	2026-08-28 15:08:35.298991	2026-08-28 15:08:35.298991
716	149	15	Announcement	create	2026-08-28 15:08:35.299914	2026-08-28 15:08:35.299914
717	150	15	Announcement	create	2026-08-28 15:08:35.300772	2026-08-28 15:08:35.300772
718	151	15	Announcement	create	2026-08-28 15:08:35.301605	2026-08-28 15:08:35.301605
719	152	15	Announcement	create	2026-08-28 15:08:35.303026	2026-08-28 15:08:35.303026
720	153	15	Announcement	create	2026-08-28 15:08:35.303978	2026-08-28 15:08:35.303978
721	154	15	Announcement	create	2026-08-28 15:08:35.304902	2026-08-28 15:08:35.304902
722	155	15	Announcement	create	2026-08-28 15:08:35.305789	2026-08-28 15:08:35.305789
723	156	15	Announcement	create	2026-08-28 15:08:35.30664	2026-08-28 15:08:35.30664
724	157	15	Announcement	create	2026-08-28 15:08:35.307604	2026-08-28 15:08:35.307604
725	158	15	Announcement	create	2026-08-28 15:08:35.308473	2026-08-28 15:08:35.308473
726	159	15	Announcement	create	2026-08-28 15:08:35.309331	2026-08-28 15:08:35.309331
727	160	15	Announcement	create	2026-08-28 15:08:35.310573	2026-08-28 15:08:35.310573
728	161	15	Announcement	create	2026-08-28 15:08:35.311491	2026-08-28 15:08:35.311491
729	162	15	Announcement	create	2026-08-28 15:08:35.320269	2026-08-28 15:08:35.320269
730	163	15	Announcement	create	2026-08-28 15:08:35.321941	2026-08-28 15:08:35.321941
731	164	15	Announcement	create	2026-08-28 15:08:35.322903	2026-08-28 15:08:35.322903
732	165	15	Announcement	create	2026-08-28 15:08:35.323938	2026-08-28 15:08:35.323938
733	166	15	Announcement	create	2026-08-28 15:08:35.324917	2026-08-28 15:08:35.324917
734	167	15	Announcement	create	2026-08-28 15:08:35.325854	2026-08-28 15:08:35.325854
735	168	15	Announcement	create	2026-08-28 15:08:35.326784	2026-08-28 15:08:35.326784
736	169	15	Announcement	create	2026-08-28 15:08:35.327932	2026-08-28 15:08:35.327932
737	170	15	Announcement	create	2026-08-28 15:08:35.329145	2026-08-28 15:08:35.329145
738	171	15	Announcement	create	2026-08-28 15:08:35.330213	2026-08-28 15:08:35.330213
739	172	15	Announcement	create	2026-08-28 15:08:35.331212	2026-08-28 15:08:35.331212
740	173	15	Announcement	create	2026-08-28 15:08:35.332155	2026-08-28 15:08:35.332155
741	174	15	Announcement	create	2026-08-28 15:08:35.333251	2026-08-28 15:08:35.333251
742	175	15	Announcement	create	2026-08-28 15:08:35.334272	2026-08-28 15:08:35.334272
743	176	15	Announcement	create	2026-08-28 15:08:35.335484	2026-08-28 15:08:35.335484
744	177	15	Announcement	create	2026-08-28 15:08:35.336519	2026-08-28 15:08:35.336519
745	178	15	Announcement	create	2026-08-28 15:08:35.337441	2026-08-28 15:08:35.337441
746	179	15	Announcement	create	2026-08-28 15:08:35.338459	2026-08-28 15:08:35.338459
747	180	15	Announcement	create	2026-08-28 15:08:35.339426	2026-08-28 15:08:35.339426
748	181	15	Announcement	create	2026-08-28 15:08:35.340349	2026-08-28 15:08:35.340349
749	182	15	Announcement	create	2026-08-28 15:08:35.341252	2026-08-28 15:08:35.341252
750	183	15	Announcement	create	2026-08-28 15:08:35.342126	2026-08-28 15:08:35.342126
751	184	15	Announcement	create	2026-08-28 15:08:35.343038	2026-08-28 15:08:35.343038
752	1	16	Announcement	create	2026-08-28 15:08:35.349411	2026-08-28 15:08:35.349411
753	2	16	Announcement	create	2026-08-28 15:08:35.351055	2026-08-28 15:08:35.351055
754	5	16	Announcement	create	2026-08-28 15:08:35.352397	2026-08-28 15:08:35.352397
755	6	16	Announcement	create	2026-08-28 15:08:35.353607	2026-08-28 15:08:35.353607
756	7	16	Announcement	create	2026-08-28 15:08:35.354819	2026-08-28 15:08:35.354819
757	8	16	Announcement	create	2026-08-28 15:08:35.355986	2026-08-28 15:08:35.355986
758	9	16	Announcement	create	2026-08-28 15:08:35.357112	2026-08-28 15:08:35.357112
759	10	16	Announcement	create	2026-08-28 15:08:35.358042	2026-08-28 15:08:35.358042
760	12	16	Announcement	create	2026-08-28 15:08:35.35942	2026-08-28 15:08:35.35942
761	13	16	Announcement	create	2026-08-28 15:08:35.360742	2026-08-28 15:08:35.360742
762	14	16	Announcement	create	2026-08-28 15:08:35.36167	2026-08-28 15:08:35.36167
763	15	16	Announcement	create	2026-08-28 15:08:35.362596	2026-08-28 15:08:35.362596
764	16	16	Announcement	create	2026-08-28 15:08:35.363578	2026-08-28 15:08:35.363578
765	17	16	Announcement	create	2026-08-28 15:08:35.364513	2026-08-28 15:08:35.364513
766	18	16	Announcement	create	2026-08-28 15:08:35.36545	2026-08-28 15:08:35.36545
767	19	16	Announcement	create	2026-08-28 15:08:35.366455	2026-08-28 15:08:35.366455
768	20	16	Announcement	create	2026-08-28 15:08:35.367558	2026-08-28 15:08:35.367558
769	21	16	Announcement	create	2026-08-28 15:08:35.369009	2026-08-28 15:08:35.369009
770	22	16	Announcement	create	2026-08-28 15:08:35.370108	2026-08-28 15:08:35.370108
771	23	16	Announcement	create	2026-08-28 15:08:35.371068	2026-08-28 15:08:35.371068
772	24	16	Announcement	create	2026-08-28 15:08:35.372392	2026-08-28 15:08:35.372392
773	25	16	Announcement	create	2026-08-28 15:08:35.373363	2026-08-28 15:08:35.373363
774	26	16	Announcement	create	2026-08-28 15:08:35.374253	2026-08-28 15:08:35.374253
775	27	16	Announcement	create	2026-08-28 15:08:35.375199	2026-08-28 15:08:35.375199
776	28	16	Announcement	create	2026-08-28 15:08:35.376118	2026-08-28 15:08:35.376118
777	29	16	Announcement	create	2026-08-28 15:08:35.385216	2026-08-28 15:08:35.385216
778	30	16	Announcement	create	2026-08-28 15:08:35.386533	2026-08-28 15:08:35.386533
779	31	16	Announcement	create	2026-08-28 15:08:35.387534	2026-08-28 15:08:35.387534
780	32	16	Announcement	create	2026-08-28 15:08:35.388467	2026-08-28 15:08:35.388467
781	33	16	Announcement	create	2026-08-28 15:08:35.389372	2026-08-28 15:08:35.389372
782	34	16	Announcement	create	2026-08-28 15:08:35.390247	2026-08-28 15:08:35.390247
783	35	16	Announcement	create	2026-08-28 15:08:35.391167	2026-08-28 15:08:35.391167
784	36	16	Announcement	create	2026-08-28 15:08:35.393018	2026-08-28 15:08:35.393018
785	37	16	Announcement	create	2026-08-28 15:08:35.394025	2026-08-28 15:08:35.394025
786	38	16	Announcement	create	2026-08-28 15:08:35.394923	2026-08-28 15:08:35.394923
787	39	16	Announcement	create	2026-08-28 15:08:35.395876	2026-08-28 15:08:35.395876
788	40	16	Announcement	create	2026-08-28 15:08:35.396743	2026-08-28 15:08:35.396743
789	41	16	Announcement	create	2026-08-28 15:08:35.397602	2026-08-28 15:08:35.397602
790	42	16	Announcement	create	2026-08-28 15:08:35.398489	2026-08-28 15:08:35.398489
791	43	16	Announcement	create	2026-08-28 15:08:35.399521	2026-08-28 15:08:35.399521
792	44	16	Announcement	create	2026-08-28 15:08:35.401299	2026-08-28 15:08:35.401299
793	45	16	Announcement	create	2026-08-28 15:08:35.402852	2026-08-28 15:08:35.402852
794	46	16	Announcement	create	2026-08-28 15:08:35.404119	2026-08-28 15:08:35.404119
795	47	16	Announcement	create	2026-08-28 15:08:35.405167	2026-08-28 15:08:35.405167
796	48	16	Announcement	create	2026-08-28 15:08:35.406265	2026-08-28 15:08:35.406265
797	49	16	Announcement	create	2026-08-28 15:08:35.407293	2026-08-28 15:08:35.407293
798	50	16	Announcement	create	2026-08-28 15:08:35.40835	2026-08-28 15:08:35.40835
799	51	16	Announcement	create	2026-08-28 15:08:35.409909	2026-08-28 15:08:35.409909
800	52	16	Announcement	create	2026-08-28 15:08:35.411087	2026-08-28 15:08:35.411087
801	53	16	Announcement	create	2026-08-28 15:08:35.412072	2026-08-28 15:08:35.412072
802	54	16	Announcement	create	2026-08-28 15:08:35.413157	2026-08-28 15:08:35.413157
803	55	16	Announcement	create	2026-08-28 15:08:35.414297	2026-08-28 15:08:35.414297
804	56	16	Announcement	create	2026-08-28 15:08:35.415679	2026-08-28 15:08:35.415679
805	57	16	Announcement	create	2026-08-28 15:08:35.416796	2026-08-28 15:08:35.416796
806	58	16	Announcement	create	2026-08-28 15:08:35.417765	2026-08-28 15:08:35.417765
807	59	16	Announcement	create	2026-08-28 15:08:35.419348	2026-08-28 15:08:35.419348
808	60	16	Announcement	create	2026-08-28 15:08:35.420448	2026-08-28 15:08:35.420448
809	61	16	Announcement	create	2026-08-28 15:08:35.421521	2026-08-28 15:08:35.421521
810	62	16	Announcement	create	2026-08-28 15:08:35.422461	2026-08-28 15:08:35.422461
811	63	16	Announcement	create	2026-08-28 15:08:35.42355	2026-08-28 15:08:35.42355
812	64	16	Announcement	create	2026-08-28 15:08:35.424519	2026-08-28 15:08:35.424519
813	65	16	Announcement	create	2026-08-28 15:08:35.425687	2026-08-28 15:08:35.425687
814	66	16	Announcement	create	2026-08-28 15:08:35.426759	2026-08-28 15:08:35.426759
815	67	16	Announcement	create	2026-08-28 15:08:35.428728	2026-08-28 15:08:35.428728
816	68	16	Announcement	create	2026-08-28 15:08:35.430246	2026-08-28 15:08:35.430246
817	69	16	Announcement	create	2026-08-28 15:08:35.431651	2026-08-28 15:08:35.431651
818	70	16	Announcement	create	2026-08-28 15:08:35.432898	2026-08-28 15:08:35.432898
819	71	16	Announcement	create	2026-08-28 15:08:35.433867	2026-08-28 15:08:35.433867
820	72	16	Announcement	create	2026-08-28 15:08:35.434997	2026-08-28 15:08:35.434997
821	73	16	Announcement	create	2026-08-28 15:08:35.435967	2026-08-28 15:08:35.435967
822	74	16	Announcement	create	2026-08-28 15:08:35.436888	2026-08-28 15:08:35.436888
823	75	16	Announcement	create	2026-08-28 15:08:35.43831	2026-08-28 15:08:35.43831
824	76	16	Announcement	create	2026-08-28 15:08:35.439304	2026-08-28 15:08:35.439304
825	77	16	Announcement	create	2026-08-28 15:08:35.440207	2026-08-28 15:08:35.440207
826	78	16	Announcement	create	2026-08-28 15:08:35.441158	2026-08-28 15:08:35.441158
827	79	16	Announcement	create	2026-08-28 15:08:35.442064	2026-08-28 15:08:35.442064
828	80	16	Announcement	create	2026-08-28 15:08:35.443019	2026-08-28 15:08:35.443019
829	81	16	Announcement	create	2026-08-28 15:08:35.443903	2026-08-28 15:08:35.443903
830	82	16	Announcement	create	2026-08-28 15:08:35.444769	2026-08-28 15:08:35.444769
831	83	16	Announcement	create	2026-08-28 15:08:35.445619	2026-08-28 15:08:35.445619
832	84	16	Announcement	create	2026-08-28 15:08:35.447366	2026-08-28 15:08:35.447366
833	85	16	Announcement	create	2026-08-28 15:08:35.448675	2026-08-28 15:08:35.448675
834	86	16	Announcement	create	2026-08-28 15:08:35.449614	2026-08-28 15:08:35.449614
835	87	16	Announcement	create	2026-08-28 15:08:35.450474	2026-08-28 15:08:35.450474
836	88	16	Announcement	create	2026-08-28 15:08:35.451445	2026-08-28 15:08:35.451445
837	89	16	Announcement	create	2026-08-28 15:08:35.452321	2026-08-28 15:08:35.452321
838	90	16	Announcement	create	2026-08-28 15:08:35.453321	2026-08-28 15:08:35.453321
839	91	16	Announcement	create	2026-08-28 15:08:35.454432	2026-08-28 15:08:35.454432
840	92	16	Announcement	create	2026-08-28 15:08:35.455673	2026-08-28 15:08:35.455673
841	93	16	Announcement	create	2026-08-28 15:08:35.463597	2026-08-28 15:08:35.463597
842	94	16	Announcement	create	2026-08-28 15:08:35.465041	2026-08-28 15:08:35.465041
843	95	16	Announcement	create	2026-08-28 15:08:35.466127	2026-08-28 15:08:35.466127
844	96	16	Announcement	create	2026-08-28 15:08:35.467086	2026-08-28 15:08:35.467086
845	97	16	Announcement	create	2026-08-28 15:08:35.467983	2026-08-28 15:08:35.467983
846	98	16	Announcement	create	2026-08-28 15:08:35.468926	2026-08-28 15:08:35.468926
847	99	16	Announcement	create	2026-08-28 15:08:35.46992	2026-08-28 15:08:35.46992
848	100	16	Announcement	create	2026-08-28 15:08:35.470918	2026-08-28 15:08:35.470918
849	101	16	Announcement	create	2026-08-28 15:08:35.472127	2026-08-28 15:08:35.472127
850	102	16	Announcement	create	2026-08-28 15:08:35.47355	2026-08-28 15:08:35.47355
851	103	16	Announcement	create	2026-08-28 15:08:35.474727	2026-08-28 15:08:35.474727
852	104	16	Announcement	create	2026-08-28 15:08:35.475959	2026-08-28 15:08:35.475959
853	105	16	Announcement	create	2026-08-28 15:08:35.476914	2026-08-28 15:08:35.476914
854	106	16	Announcement	create	2026-08-28 15:08:35.477846	2026-08-28 15:08:35.477846
855	107	16	Announcement	create	2026-08-28 15:08:35.478702	2026-08-28 15:08:35.478702
856	108	16	Announcement	create	2026-08-28 15:08:35.479793	2026-08-28 15:08:35.479793
857	109	16	Announcement	create	2026-08-28 15:08:35.480859	2026-08-28 15:08:35.480859
858	110	16	Announcement	create	2026-08-28 15:08:35.481867	2026-08-28 15:08:35.481867
859	111	16	Announcement	create	2026-08-28 15:08:35.482716	2026-08-28 15:08:35.482716
860	112	16	Announcement	create	2026-08-28 15:08:35.483777	2026-08-28 15:08:35.483777
861	113	16	Announcement	create	2026-08-28 15:08:35.485243	2026-08-28 15:08:35.485243
862	114	16	Announcement	create	2026-08-28 15:08:35.486283	2026-08-28 15:08:35.486283
863	115	16	Announcement	create	2026-08-28 15:08:35.487224	2026-08-28 15:08:35.487224
864	116	16	Announcement	create	2026-08-28 15:08:35.488085	2026-08-28 15:08:35.488085
865	117	16	Announcement	create	2026-08-28 15:08:35.488962	2026-08-28 15:08:35.488962
866	118	16	Announcement	create	2026-08-28 15:08:35.489798	2026-08-28 15:08:35.489798
867	119	16	Announcement	create	2026-08-28 15:08:35.490652	2026-08-28 15:08:35.490652
868	120	16	Announcement	create	2026-08-28 15:08:35.491555	2026-08-28 15:08:35.491555
869	121	16	Announcement	create	2026-08-28 15:08:35.492423	2026-08-28 15:08:35.492423
870	122	16	Announcement	create	2026-08-28 15:08:35.493269	2026-08-28 15:08:35.493269
871	123	16	Announcement	create	2026-08-28 15:08:35.49421	2026-08-28 15:08:35.49421
872	124	16	Announcement	create	2026-08-28 15:08:35.495105	2026-08-28 15:08:35.495105
873	125	16	Announcement	create	2026-08-28 15:08:35.496244	2026-08-28 15:08:35.496244
874	126	16	Announcement	create	2026-08-28 15:08:35.497245	2026-08-28 15:08:35.497245
875	127	16	Announcement	create	2026-08-28 15:08:35.498111	2026-08-28 15:08:35.498111
876	128	16	Announcement	create	2026-08-28 15:08:35.49902	2026-08-28 15:08:35.49902
877	129	16	Announcement	create	2026-08-28 15:08:35.499901	2026-08-28 15:08:35.499901
878	130	16	Announcement	create	2026-08-28 15:08:35.500753	2026-08-28 15:08:35.500753
879	131	16	Announcement	create	2026-08-28 15:08:35.501619	2026-08-28 15:08:35.501619
880	132	16	Announcement	create	2026-08-28 15:08:35.502465	2026-08-28 15:08:35.502465
881	133	16	Announcement	create	2026-08-28 15:08:35.503357	2026-08-28 15:08:35.503357
882	134	16	Announcement	create	2026-08-28 15:08:35.504243	2026-08-28 15:08:35.504243
883	135	16	Announcement	create	2026-08-28 15:08:35.505095	2026-08-28 15:08:35.505095
884	136	16	Announcement	create	2026-08-28 15:08:35.50595	2026-08-28 15:08:35.50595
885	137	16	Announcement	create	2026-08-28 15:08:35.506839	2026-08-28 15:08:35.506839
886	138	16	Announcement	create	2026-08-28 15:08:35.507805	2026-08-28 15:08:35.507805
887	139	16	Announcement	create	2026-08-28 15:08:35.508669	2026-08-28 15:08:35.508669
888	140	16	Announcement	create	2026-08-28 15:08:35.50952	2026-08-28 15:08:35.50952
889	141	16	Announcement	create	2026-08-28 15:08:35.510406	2026-08-28 15:08:35.510406
890	142	16	Announcement	create	2026-08-28 15:08:35.511745	2026-08-28 15:08:35.511745
891	143	16	Announcement	create	2026-08-28 15:08:35.519953	2026-08-28 15:08:35.519953
892	144	16	Announcement	create	2026-08-28 15:08:35.521305	2026-08-28 15:08:35.521305
893	145	16	Announcement	create	2026-08-28 15:08:35.522442	2026-08-28 15:08:35.522442
894	146	16	Announcement	create	2026-08-28 15:08:35.52348	2026-08-28 15:08:35.52348
895	147	16	Announcement	create	2026-08-28 15:08:35.524424	2026-08-28 15:08:35.524424
896	148	16	Announcement	create	2026-08-28 15:08:35.525418	2026-08-28 15:08:35.525418
897	149	16	Announcement	create	2026-08-28 15:08:35.526331	2026-08-28 15:08:35.526331
898	150	16	Announcement	create	2026-08-28 15:08:35.52852	2026-08-28 15:08:35.52852
899	151	16	Announcement	create	2026-08-28 15:08:35.529588	2026-08-28 15:08:35.529588
900	152	16	Announcement	create	2026-08-28 15:08:35.530445	2026-08-28 15:08:35.530445
901	153	16	Announcement	create	2026-08-28 15:08:35.531388	2026-08-28 15:08:35.531388
902	154	16	Announcement	create	2026-08-28 15:08:35.532281	2026-08-28 15:08:35.532281
903	155	16	Announcement	create	2026-08-28 15:08:35.533198	2026-08-28 15:08:35.533198
904	156	16	Announcement	create	2026-08-28 15:08:35.534052	2026-08-28 15:08:35.534052
905	157	16	Announcement	create	2026-08-28 15:08:35.534989	2026-08-28 15:08:35.534989
906	158	16	Announcement	create	2026-08-28 15:08:35.536648	2026-08-28 15:08:35.536648
907	159	16	Announcement	create	2026-08-28 15:08:35.537617	2026-08-28 15:08:35.537617
908	160	16	Announcement	create	2026-08-28 15:08:35.538658	2026-08-28 15:08:35.538658
909	161	16	Announcement	create	2026-08-28 15:08:35.539642	2026-08-28 15:08:35.539642
910	162	16	Announcement	create	2026-08-28 15:08:35.540556	2026-08-28 15:08:35.540556
911	163	16	Announcement	create	2026-08-28 15:08:35.541511	2026-08-28 15:08:35.541511
912	164	16	Announcement	create	2026-08-28 15:08:35.542434	2026-08-28 15:08:35.542434
913	165	16	Announcement	create	2026-08-28 15:08:35.544019	2026-08-28 15:08:35.544019
914	166	16	Announcement	create	2026-08-28 15:08:35.54508	2026-08-28 15:08:35.54508
915	167	16	Announcement	create	2026-08-28 15:08:35.54596	2026-08-28 15:08:35.54596
916	168	16	Announcement	create	2026-08-28 15:08:35.546889	2026-08-28 15:08:35.546889
917	169	16	Announcement	create	2026-08-28 15:08:35.547828	2026-08-28 15:08:35.547828
918	170	16	Announcement	create	2026-08-28 15:08:35.548681	2026-08-28 15:08:35.548681
919	171	16	Announcement	create	2026-08-28 15:08:35.549536	2026-08-28 15:08:35.549536
920	172	16	Announcement	create	2026-08-28 15:08:35.550385	2026-08-28 15:08:35.550385
921	173	16	Announcement	create	2026-08-28 15:08:35.551821	2026-08-28 15:08:35.551821
922	174	16	Announcement	create	2026-08-28 15:08:35.552771	2026-08-28 15:08:35.552771
923	175	16	Announcement	create	2026-08-28 15:08:35.553627	2026-08-28 15:08:35.553627
924	176	16	Announcement	create	2026-08-28 15:08:35.554452	2026-08-28 15:08:35.554452
925	177	16	Announcement	create	2026-08-28 15:08:35.555343	2026-08-28 15:08:35.555343
926	178	16	Announcement	create	2026-08-28 15:08:35.556211	2026-08-28 15:08:35.556211
927	179	16	Announcement	create	2026-08-28 15:08:35.557165	2026-08-28 15:08:35.557165
928	180	16	Announcement	create	2026-08-28 15:08:35.558342	2026-08-28 15:08:35.558342
929	181	16	Announcement	create	2026-08-28 15:08:35.56024	2026-08-28 15:08:35.56024
930	182	16	Announcement	create	2026-08-28 15:08:35.561292	2026-08-28 15:08:35.561292
931	183	16	Announcement	create	2026-08-28 15:08:35.562158	2026-08-28 15:08:35.562158
932	184	16	Announcement	create	2026-08-28 15:08:35.563071	2026-08-28 15:08:35.563071
933	1	17	Announcement	create	2026-08-28 15:08:35.576842	2026-08-28 15:08:35.576842
934	2	17	Announcement	create	2026-08-28 15:08:35.578041	2026-08-28 15:08:35.578041
935	5	17	Announcement	create	2026-08-28 15:08:35.578992	2026-08-28 15:08:35.578992
936	6	17	Announcement	create	2026-08-28 15:08:35.579865	2026-08-28 15:08:35.579865
937	7	17	Announcement	create	2026-08-28 15:08:35.580738	2026-08-28 15:08:35.580738
938	8	17	Announcement	create	2026-08-28 15:08:35.581602	2026-08-28 15:08:35.581602
939	9	17	Announcement	create	2026-08-28 15:08:35.582451	2026-08-28 15:08:35.582451
940	10	17	Announcement	create	2026-08-28 15:08:35.583375	2026-08-28 15:08:35.583375
941	14	17	Announcement	create	2026-08-28 15:08:35.584783	2026-08-28 15:08:35.584783
942	15	17	Announcement	create	2026-08-28 15:08:35.585709	2026-08-28 15:08:35.585709
943	16	17	Announcement	create	2026-08-28 15:08:35.586549	2026-08-28 15:08:35.586549
944	17	17	Announcement	create	2026-08-28 15:08:35.587475	2026-08-28 15:08:35.587475
945	18	17	Announcement	create	2026-08-28 15:08:35.588416	2026-08-28 15:08:35.588416
946	19	17	Announcement	create	2026-08-28 15:08:35.589783	2026-08-28 15:08:35.589783
947	20	17	Announcement	create	2026-08-28 15:08:35.592252	2026-08-28 15:08:35.592252
948	21	17	Announcement	create	2026-08-28 15:08:35.59384	2026-08-28 15:08:35.59384
949	22	17	Announcement	create	2026-08-28 15:08:35.595242	2026-08-28 15:08:35.595242
950	23	17	Announcement	create	2026-08-28 15:08:35.596967	2026-08-28 15:08:35.596967
951	24	17	Announcement	create	2026-08-28 15:08:35.598157	2026-08-28 15:08:35.598157
952	25	17	Announcement	create	2026-08-28 15:08:35.60558	2026-08-28 15:08:35.60558
953	26	17	Announcement	create	2026-08-28 15:08:35.607203	2026-08-28 15:08:35.607203
954	27	17	Announcement	create	2026-08-28 15:08:35.608363	2026-08-28 15:08:35.608363
955	28	17	Announcement	create	2026-08-28 15:08:35.609381	2026-08-28 15:08:35.609381
956	29	17	Announcement	create	2026-08-28 15:08:35.610268	2026-08-28 15:08:35.610268
957	30	17	Announcement	create	2026-08-28 15:08:35.611165	2026-08-28 15:08:35.611165
958	31	17	Announcement	create	2026-08-28 15:08:35.612082	2026-08-28 15:08:35.612082
959	32	17	Announcement	create	2026-08-28 15:08:35.612954	2026-08-28 15:08:35.612954
960	33	17	Announcement	create	2026-08-28 15:08:35.613806	2026-08-28 15:08:35.613806
961	34	17	Announcement	create	2026-08-28 15:08:35.614667	2026-08-28 15:08:35.614667
962	35	17	Announcement	create	2026-08-28 15:08:35.615561	2026-08-28 15:08:35.615561
963	36	17	Announcement	create	2026-08-28 15:08:35.616453	2026-08-28 15:08:35.616453
964	37	17	Announcement	create	2026-08-28 15:08:35.617356	2026-08-28 15:08:35.617356
965	38	17	Announcement	create	2026-08-28 15:08:35.618222	2026-08-28 15:08:35.618222
966	39	17	Announcement	create	2026-08-28 15:08:35.619297	2026-08-28 15:08:35.619297
967	40	17	Announcement	create	2026-08-28 15:08:35.620185	2026-08-28 15:08:35.620185
968	41	17	Announcement	create	2026-08-28 15:08:35.621048	2026-08-28 15:08:35.621048
969	42	17	Announcement	create	2026-08-28 15:08:35.621904	2026-08-28 15:08:35.621904
970	43	17	Announcement	create	2026-08-28 15:08:35.62281	2026-08-28 15:08:35.62281
971	44	17	Announcement	create	2026-08-28 15:08:35.624287	2026-08-28 15:08:35.624287
972	45	17	Announcement	create	2026-08-28 15:08:35.62546	2026-08-28 15:08:35.62546
973	1	18	Announcement	create	2026-08-28 15:08:35.630168	2026-08-28 15:08:35.630168
974	2	18	Announcement	create	2026-08-28 15:08:35.631138	2026-08-28 15:08:35.631138
975	5	18	Announcement	create	2026-08-28 15:08:35.632025	2026-08-28 15:08:35.632025
976	6	18	Announcement	create	2026-08-28 15:08:35.632905	2026-08-28 15:08:35.632905
977	7	18	Announcement	create	2026-08-28 15:08:35.633834	2026-08-28 15:08:35.633834
978	8	18	Announcement	create	2026-08-28 15:08:35.634889	2026-08-28 15:08:35.634889
979	9	18	Announcement	create	2026-08-28 15:08:35.636135	2026-08-28 15:08:35.636135
980	10	18	Announcement	create	2026-08-28 15:08:35.637169	2026-08-28 15:08:35.637169
981	5	19	Announcement	create	2026-08-28 15:08:35.642639	2026-08-28 15:08:35.642639
982	6	19	Announcement	create	2026-08-28 15:08:35.643662	2026-08-28 15:08:35.643662
983	7	19	Announcement	create	2026-08-28 15:08:35.644538	2026-08-28 15:08:35.644538
984	2	20	Announcement	create	2026-08-28 15:08:35.648956	2026-08-28 15:08:35.648956
985	5	20	Announcement	create	2026-08-28 15:08:35.649859	2026-08-28 15:08:35.649859
986	6	20	Announcement	create	2026-08-28 15:08:35.650706	2026-08-28 15:08:35.650706
987	7	20	Announcement	create	2026-08-28 15:08:35.651646	2026-08-28 15:08:35.651646
988	2	23	Announcement	create	2026-08-28 15:08:35.66866	2026-08-28 15:08:35.66866
989	46	23	Announcement	create	2026-08-28 15:08:35.669684	2026-08-28 15:08:35.669684
990	47	23	Announcement	create	2026-08-28 15:08:35.670724	2026-08-28 15:08:35.670724
991	48	23	Announcement	create	2026-08-28 15:08:35.672804	2026-08-28 15:08:35.672804
992	49	23	Announcement	create	2026-08-28 15:08:35.673843	2026-08-28 15:08:35.673843
993	50	23	Announcement	create	2026-08-28 15:08:35.674723	2026-08-28 15:08:35.674723
994	51	23	Announcement	create	2026-08-28 15:08:35.675724	2026-08-28 15:08:35.675724
995	52	23	Announcement	create	2026-08-28 15:08:35.676683	2026-08-28 15:08:35.676683
996	53	23	Announcement	create	2026-08-28 15:08:35.677574	2026-08-28 15:08:35.677574
997	55	23	Announcement	create	2026-08-28 15:08:35.678464	2026-08-28 15:08:35.678464
998	56	23	Announcement	create	2026-08-28 15:08:35.679431	2026-08-28 15:08:35.679431
999	57	23	Announcement	create	2026-08-28 15:08:35.681124	2026-08-28 15:08:35.681124
\.


--
-- TOC entry 4835 (class 0 OID 9663823)
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
-- TOC entry 4837 (class 0 OID 9663832)
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
-- TOC entry 4839 (class 0 OID 9663843)
-- Dependencies: 303
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programs (id, created_at, updated_at, subject_id) FROM stdin;
1	2020-07-24 13:11:01.069662	2020-07-24 13:11:01.069662	1
2	2020-07-24 13:11:37.794408	2020-07-24 13:11:37.794408	2
\.


--
-- TOC entry 4841 (class 0 OID 9663850)
-- Dependencies: 305
-- Data for Name: quiz_certificates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quiz_certificates (id, quiz_id, user_id, code, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4842 (class 0 OID 9663860)
-- Dependencies: 306
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.readers (id, user_id, thread_id, created_at, updated_at) FROM stdin;
1	3	1	2020-09-02 09:20:23.743252	2020-09-02 09:20:23.750381
\.


--
-- TOC entry 4844 (class 0 OID 9663867)
-- Dependencies: 308
-- Data for Name: redemptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.redemptions (id, voucher_id, user_id, created_at, updated_at) FROM stdin;
1	8ed8a767-7faa-486c-a757-7417ffd04c3d	5	2025-07-15 12:11:14.688568	2025-07-15 12:11:14.688568
2	8ed8a767-7faa-486c-a757-7417ffd04c3d	6	2025-07-15 12:11:39.223198	2025-07-15 12:11:39.223198
3	8ed8a767-7faa-486c-a757-7417ffd04c3d	7	2025-07-15 12:11:58.999334	2025-07-15 12:11:58.999334
\.


--
-- TOC entry 4846 (class 0 OID 9663876)
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
-- TOC entry 4848 (class 0 OID 9663885)
-- Dependencies: 312
-- Data for Name: registration_campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_campaigns (campaignable_type, campaignable_id, description, allocation_mode, status, registration_deadline, created_at, updated_at, id, last_allocation_calculated_at, allocation_decided_at) FROM stdin;
Lecture	1	Demo Lecture Roster Campaign	1	4	2026-09-04 15:08:29.569206	2026-08-28 15:08:29.576429	2026-08-28 15:08:30.403479	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.08062	2026-08-28 15:08:30.081868
Lecture	30	Demo Seminar Roster Campaign	1	4	2026-09-04 15:08:30.737033	2026-08-28 15:08:30.743557	2026-08-28 15:08:31.139952	099ac67d-2bdb-4bc7-902c-54f400285823	2026-08-28 15:08:31.079421	2026-08-28 15:08:31.080016
Lecture	31	Stage 1: Planning	0	2	2026-09-04 15:08:32.10935	2026-08-28 15:08:32.110408	2026-08-28 15:08:32.15833	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	\N	\N
Lecture	32	Anmeldung	0	1	2027-08-28 15:08:32.746724	2026-08-26 19:49:14.408239	2026-08-26 19:49:14.430417	114e0f13-144d-4e47-93d6-c4926bec2fa1	\N	\N
Lecture	37	Anmeldung zu den Übungsgruppen	0	1	2027-08-28 15:08:32.746724	2026-08-26 19:49:15.598413	2026-08-26 19:49:15.635743	f3abc265-8d50-4fbe-b44c-0fa27d228f47	\N	\N
Lecture	38	Vergabe der Vortragsthemen	0	1	2027-08-28 15:08:32.746724	2026-08-26 19:49:15.704716	2026-08-26 19:49:15.893139	42b6546f-5f6d-4741-abc7-f7d169d09b87	\N	\N
Lecture	39	Solver Test Campaign	1	1	2027-08-28 15:08:32.746724	2026-08-28 15:08:31.407163	2026-08-28 15:08:31.440607	bafa1987-373b-46ab-ace9-b2ad19518b66	\N	\N
Lecture	39	Cohort FCFS Campaign	0	1	2027-08-28 15:08:32.746724	2026-08-28 15:08:31.61006	2026-08-28 15:08:31.696953	b23b10c6-caee-4b71-a496-92be8f5a37c0	\N	\N
Lecture	31	Stage 2: Allocation	1	1	2027-08-28 15:08:32.746724	2026-08-28 15:08:32.159464	2026-08-28 15:08:32.229806	96c5857f-932a-4b78-9445-8485f0b25244	\N	\N
Lecture	31	Stage 3: Nachrücker (FCFS)	0	1	2027-08-28 15:08:32.746724	2026-08-28 15:08:32.281375	2026-08-28 15:08:32.28566	c66974da-cdfe-45c1-92b2-456a49dd392d	\N	\N
\.


--
-- TOC entry 4849 (class 0 OID 9663901)
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
Tutorial	2	2026-08-28 15:08:29.605335	2026-08-28 15:08:29.605335	d96dfd9c-8bb3-4713-b2a7-f36549670f15	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	10
Tutorial	3	2026-08-28 15:08:29.615039	2026-08-28 15:08:29.615039	62e29033-19dd-40e7-9c93-a909aca0e770	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	8
Tutorial	4	2026-08-28 15:08:29.620431	2026-08-28 15:08:29.620431	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	8
Tutorial	5	2026-08-28 15:08:29.62949	2026-08-28 15:08:29.62949	21a0df48-0ba1-487b-a21c-a553f7059431	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	6
Talk	5	2026-08-28 15:08:30.763912	2026-08-28 15:08:30.763912	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	6	2026-08-28 15:08:30.769273	2026-08-28 15:08:30.769273	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	7	2026-08-28 15:08:30.770831	2026-08-28 15:08:30.770831	5304e963-6d17-436d-b156-69964a8e3a5a	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	8	2026-08-28 15:08:30.773797	2026-08-28 15:08:30.773797	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	9	2026-08-28 15:08:30.775241	2026-08-28 15:08:30.775241	e9a44c20-e20f-466b-8e15-6843c7e1b633	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	10	2026-08-28 15:08:30.776743	2026-08-28 15:08:30.776743	03c9b7eb-4986-4b91-bcad-1c36b68b132b	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	11	2026-08-28 15:08:30.778517	2026-08-28 15:08:30.778517	02eb271e-974b-4b3c-b2ff-97c365c1dcad	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	12	2026-08-28 15:08:30.78116	2026-08-28 15:08:30.78116	f241480c-ea5a-43f9-b056-503e649bfd17	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	13	2026-08-28 15:08:30.783251	2026-08-28 15:08:30.783251	b765b632-ab35-4458-9a08-9cff6bedc781	099ac67d-2bdb-4bc7-902c-54f400285823	1
Talk	14	2026-08-28 15:08:30.785139	2026-08-28 15:08:30.785139	e0df752e-dc34-4160-97ec-b441b3beb9bc	099ac67d-2bdb-4bc7-902c-54f400285823	1
Tutorial	23	2026-08-28 15:08:31.426919	2026-08-28 15:08:31.426919	31bb644f-7280-454d-9ba1-9f3d425dddb5	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	24	2026-08-28 15:08:31.430712	2026-08-28 15:08:31.430712	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	25	2026-08-28 15:08:31.435147	2026-08-28 15:08:31.435147	0759131b-7aac-4d34-8442-9d7abff1d0ab	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	26	2026-08-28 15:08:31.43821	2026-08-28 15:08:31.43821	4f07ce44-78b3-429e-b74f-653e2057f745	bafa1987-373b-46ab-ace9-b2ad19518b66	0
Tutorial	27	2026-08-28 15:08:31.634828	2026-08-28 15:08:31.634828	a3208082-123d-45ce-a563-fb1e4f4776b4	b23b10c6-caee-4b71-a496-92be8f5a37c0	12
Tutorial	28	2026-08-28 15:08:31.638846	2026-08-28 15:08:31.638846	83104a52-54b7-4468-abdf-548e81d458b6	b23b10c6-caee-4b71-a496-92be8f5a37c0	10
Tutorial	29	2026-08-28 15:08:31.642538	2026-08-28 15:08:31.642538	c0e50193-27a7-4a5c-b3e3-c14a4264af11	b23b10c6-caee-4b71-a496-92be8f5a37c0	8
Cohort	5	2026-08-28 15:08:31.677992	2026-08-28 15:08:31.677992	602b7284-620b-431b-860b-6ff79255a1b5	b23b10c6-caee-4b71-a496-92be8f5a37c0	5
Cohort	6	2026-08-28 15:08:31.693027	2026-08-28 15:08:31.693027	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	b23b10c6-caee-4b71-a496-92be8f5a37c0	12
Cohort	7	2026-08-28 15:08:32.114252	2026-08-28 15:08:32.114252	f3bb2df4-eeff-443d-9923-817725e81e60	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	12
Talk	43	2026-08-28 15:08:32.189319	2026-08-28 15:08:32.189319	76c50ff1-5e27-4fb3-b85d-4517c550f65a	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	44	2026-08-28 15:08:32.192946	2026-08-28 15:08:32.192946	4b7387aa-2773-49e8-a844-af7e841665ea	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	45	2026-08-28 15:08:32.196538	2026-08-28 15:08:32.196538	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	46	2026-08-28 15:08:32.200154	2026-08-28 15:08:32.200154	2de088d0-99cd-4a46-be7e-01a0d366d17f	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	47	2026-08-28 15:08:32.203826	2026-08-28 15:08:32.203826	7da22c21-80c9-4c16-a2d4-5d1990ad0db2	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	48	2026-08-28 15:08:32.207656	2026-08-28 15:08:32.207656	c197fc84-fbc6-4cf7-800d-243e24e1bd5e	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	49	2026-08-28 15:08:32.210289	2026-08-28 15:08:32.210289	63e0212f-dbff-4c53-98e9-dbb3cd183c0e	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	50	2026-08-28 15:08:32.214154	2026-08-28 15:08:32.214154	a11485e0-5ba0-422b-a662-cb0c88c16175	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	51	2026-08-28 15:08:32.217147	2026-08-28 15:08:32.217147	dace82ab-2dee-4ce0-bc15-3a8a429ff796	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	52	2026-08-28 15:08:32.219834	2026-08-28 15:08:32.219834	79ae1f85-f5d0-40ef-a690-02831ba41aad	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	53	2026-08-28 15:08:32.222676	2026-08-28 15:08:32.222676	c78bafe6-2072-429e-a176-50a64990b770	96c5857f-932a-4b78-9445-8485f0b25244	0
Talk	54	2026-08-28 15:08:32.225629	2026-08-28 15:08:32.225629	6b0602ff-f026-47bf-b503-0d567d79096e	96c5857f-932a-4b78-9445-8485f0b25244	0
Cohort	8	2026-08-28 15:08:32.284708	2026-08-28 15:08:32.284708	d970dbb8-a967-469c-91c4-673793afacef	c66974da-cdfe-45c1-92b2-456a49dd392d	5
\.


--
-- TOC entry 4850 (class 0 OID 9663915)
-- Dependencies: 314
-- Data for Name: registration_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_policies (kind, phase, "position", active, config, created_at, updated_at, id, registration_campaign_id) FROM stdin;
0	1	1	t	{"allowed_domains": "mampf.edu"}	2026-08-28 15:08:30.798217	2026-08-28 15:08:30.798217	8a86af66-4378-43d7-b2a1-f7760385dce0	099ac67d-2bdb-4bc7-902c-54f400285823
0	1	1	t	{"allowed_domains": "example.com"}	2026-08-28 15:08:31.627576	2026-08-28 15:08:31.627576	c1253339-f52b-4c05-a8d2-5798739fbb5c	b23b10c6-caee-4b71-a496-92be8f5a37c0
1	1	1	t	{"prerequisite_campaign_id": "f3cade5e-ea10-4b75-be3c-a3797f4d48d0"}	2026-08-28 15:08:32.163222	2026-08-28 15:08:32.163222	62b5f80c-ac0b-4c6e-96e4-b3aac2b00637	96c5857f-932a-4b78-9445-8485f0b25244
\.


--
-- TOC entry 4851 (class 0 OID 9663932)
-- Dependencies: 315
-- Data for Name: registration_student_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_student_messages (id, lecture_id, sender_id, subject, body, attachment_data, recipient_emails, recipients_count, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4853 (class 0 OID 9663949)
-- Dependencies: 317
-- Data for Name: registration_user_registrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_user_registrations (user_id, preference_rank, status, created_at, updated_at, id, registration_campaign_id, registration_item_id, materialized_at, exclusive_assignment, rejection_reason_type, rejection_reason_code, rejection_reason_label, rejected_at, rejection_overridden_at, rejection_policy_id) FROM stdin;
15	1	1	2026-08-28 15:08:29.679333	2026-08-28 15:08:30.062732	641eb6ae-d71f-49a7-b15f-1deb3df02009	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	2026-08-28 15:08:30.133985	f	\N	\N	\N	\N	\N	\N
18	1	1	2026-08-28 15:08:29.722736	2026-08-28 15:08:30.062732	50207d00-3f9c-44b5-bf05-f12c941dedd2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	2026-08-28 15:08:30.133985	f	\N	\N	\N	\N	\N	\N
21	1	1	2026-08-28 15:08:29.757596	2026-08-28 15:08:30.062732	0e6cfeef-051e-4b6b-b135-ab8989591ea4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	2026-08-28 15:08:30.133985	f	\N	\N	\N	\N	\N	\N
23	1	1	2026-08-28 15:08:29.772478	2026-08-28 15:08:30.062732	a1c1ac66-81e0-4f37-ace9-d09bcac6dbf5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	2026-08-28 15:08:30.133985	f	\N	\N	\N	\N	\N	\N
41	1	1	2026-08-28 15:08:29.883115	2026-08-28 15:08:30.062732	2efa998c-ca60-42d5-badd-08254b021064	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	2026-08-28 15:08:30.133985	f	\N	\N	\N	\N	\N	\N
43	1	1	2026-08-28 15:08:29.916344	2026-08-28 15:08:30.062732	cc0404d3-6a72-4d15-9c11-2895e30d06ce	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	2026-08-28 15:08:30.133985	f	\N	\N	\N	\N	\N	\N
24	1	1	2026-08-28 15:08:29.783547	2026-08-28 15:08:30.065725	b4c72dc5-16f0-49fb-9444-ebc199d60c5d	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
25	1	1	2026-08-28 15:08:29.787574	2026-08-28 15:08:30.065725	e9ac8e9b-839a-46fc-997c-39f43f74b6e9	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
26	1	1	2026-08-28 15:08:29.793067	2026-08-28 15:08:30.065725	056d2770-f46e-404c-92e6-47ee99a7ff20	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
27	1	1	2026-08-28 15:08:29.80618	2026-08-28 15:08:30.065725	6b32fa54-236c-4063-bb05-b6758afd362c	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
33	1	1	2026-08-28 15:08:29.836449	2026-08-28 15:08:30.065725	90767e00-f2f3-4373-bcc2-f92410eb05e7	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
37	1	1	2026-08-28 15:08:29.858196	2026-08-28 15:08:30.065725	3ad9061f-b9f9-4a88-80b0-1cd1fc39f6c1	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
40	1	1	2026-08-28 15:08:29.878876	2026-08-28 15:08:30.065725	f05309bd-91e3-4d02-8022-ccb8cbfb4037	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
44	1	1	2026-08-28 15:08:29.924158	2026-08-28 15:08:30.065725	bd15a446-e1e2-4f47-abde-697d7559d844	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	2026-08-28 15:08:30.14587	f	\N	\N	\N	\N	\N	\N
14	1	1	2026-08-28 15:08:29.661329	2026-08-28 15:08:30.059113	7e2daf06-1c8a-44b4-b9bb-565531bfa0fa	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
16	2	1	2026-08-28 15:08:29.700961	2026-08-28 15:08:30.059113	1d424756-e849-42be-a657-647d6b6f647c	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
17	1	1	2026-08-28 15:08:29.70609	2026-08-28 15:08:30.059113	49782bbe-2f10-4989-9cb2-460cf16c73ba	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
19	1	1	2026-08-28 15:08:29.732628	2026-08-28 15:08:30.059113	8b57cbbc-b301-4f97-a862-866e8772fd1f	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
20	1	1	2026-08-28 15:08:29.746481	2026-08-28 15:08:30.059113	41af8cec-3fdb-48e0-a9fd-8a57669b2873	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
31	1	1	2026-08-28 15:08:29.828965	2026-08-28 15:08:30.059113	2fd89e93-c404-4c20-8f55-1b60da117af5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
34	1	1	2026-08-28 15:08:29.844099	2026-08-28 15:08:30.059113	ae6a8ce4-d848-4077-b178-0d400e4cab8c	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
42	1	1	2026-08-28 15:08:29.898149	2026-08-28 15:08:30.059113	b15c1505-d9d8-48f8-b3d3-5d1b006ced70	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	2026-08-28 15:08:30.151877	f	\N	\N	\N	\N	\N	\N
22	1	1	2026-08-28 15:08:29.764917	2026-08-28 15:08:30.064421	a46b9720-16bc-4e4f-a224-36dfc28f3106	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
28	1	1	2026-08-28 15:08:29.815116	2026-08-28 15:08:30.064421	eab7b285-9ea2-4160-b9fc-bcc18936d598	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
29	1	1	2026-08-28 15:08:29.820295	2026-08-28 15:08:30.064421	c8c37230-b397-4a0b-9b17-8fc34e9fd3fb	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
30	1	1	2026-08-28 15:08:29.824524	2026-08-28 15:08:30.064421	bd4b2c3c-e125-4e82-af39-5e2db2ff76ae	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
32	1	1	2026-08-28 15:08:29.832634	2026-08-28 15:08:30.064421	a31a17b5-c286-43bd-ae46-a628bef9bf14	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
35	1	1	2026-08-28 15:08:29.848766	2026-08-28 15:08:30.064421	d70077cb-0937-4a78-8a12-343a289aea3b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
36	2	1	2026-08-28 15:08:29.853742	2026-08-28 15:08:30.064421	7d22f940-2c22-40b7-bcad-64cc38f97fb1	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
38	1	1	2026-08-28 15:08:29.863851	2026-08-28 15:08:30.064421	e3d9612d-d85f-433c-bb9a-e036026f4f56	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
39	1	1	2026-08-28 15:08:29.867807	2026-08-28 15:08:30.064421	0dc2fb23-483d-45ac-8368-bc9169c34ea7	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
45	1	1	2026-08-28 15:08:29.927518	2026-08-28 15:08:30.064421	88cfbef1-998c-4b23-bde0-54367443a896	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	2026-08-28 15:08:30.158096	f	\N	\N	\N	\N	\N	\N
14	2	2	2026-08-28 15:08:29.666304	2026-08-28 15:08:30.158827	6ce55d46-d590-4fe3-9b38-cc7fd43c6f29	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
14	3	2	2026-08-28 15:08:29.674817	2026-08-28 15:08:30.158827	a28c2558-ce72-4f6c-9de9-e22a8b0e867d	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
14	4	2	2026-08-28 15:08:29.677141	2026-08-28 15:08:30.158827	e5090616-b5f8-475b-8084-4d018e34e748	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
15	2	2	2026-08-28 15:08:29.687981	2026-08-28 15:08:30.158827	496acd99-9014-46e4-89ff-dbea5be3a8bd	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
15	3	2	2026-08-28 15:08:29.692977	2026-08-28 15:08:30.158827	eeada507-1f6f-4cef-b6cf-0aa11306fb1a	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
15	4	2	2026-08-28 15:08:29.696803	2026-08-28 15:08:30.158827	7977544e-5801-4e6c-b22c-4a760844ef31	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
16	1	2	2026-08-28 15:08:29.69874	2026-08-28 15:08:30.158827	d3c97d9b-d989-496e-83b1-1f41f1cd57bf	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
16	3	2	2026-08-28 15:08:29.702303	2026-08-28 15:08:30.158827	fdaada11-b3d9-4c47-a88d-77cdbefb9de5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
16	4	2	2026-08-28 15:08:29.703956	2026-08-28 15:08:30.158827	5fd4f627-6d2a-4f76-b131-052d8f8de347	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
17	2	2	2026-08-28 15:08:29.708338	2026-08-28 15:08:30.158827	8251ae36-e416-44a3-bb80-ad459163c5ba	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
17	3	2	2026-08-28 15:08:29.709626	2026-08-28 15:08:30.158827	bfc976d7-cb91-4278-bb50-0b5d3d9e547c	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
17	4	2	2026-08-28 15:08:29.714855	2026-08-28 15:08:30.158827	81813dd1-0c8b-4956-98d6-a3e722f54a8a	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
18	2	2	2026-08-28 15:08:29.724816	2026-08-28 15:08:30.158827	6543273e-33fc-4387-b509-24df10451895	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
18	3	2	2026-08-28 15:08:29.72653	2026-08-28 15:08:30.158827	3ef12606-c2b2-4904-84a4-2c0d51822b46	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
18	4	2	2026-08-28 15:08:29.729588	2026-08-28 15:08:30.158827	510d781f-12bd-4c7d-b10d-815f4a5b2bf5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
19	2	2	2026-08-28 15:08:29.736302	2026-08-28 15:08:30.158827	efeedd5c-620e-4cd0-b436-31f1ba7480e4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
19	3	2	2026-08-28 15:08:29.741974	2026-08-28 15:08:30.158827	28ba9c40-ce15-49d3-88cf-b27f08cc1883	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
19	4	2	2026-08-28 15:08:29.744837	2026-08-28 15:08:30.158827	0c573a2d-53ec-4121-82cd-d58d43026b60	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
20	2	2	2026-08-28 15:08:29.748166	2026-08-28 15:08:30.158827	3164cf10-82e5-457f-b982-68218dd6daed	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
20	3	2	2026-08-28 15:08:29.754046	2026-08-28 15:08:30.158827	e2519605-d2e4-4dde-b538-9f93f56ebd1a	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
20	4	2	2026-08-28 15:08:29.756422	2026-08-28 15:08:30.158827	fdabfce9-3d76-48d5-8f84-e6dcd8758bd4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
21	2	2	2026-08-28 15:08:29.761361	2026-08-28 15:08:30.158827	f7d63191-284c-4060-938c-143d97c6a630	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
21	3	2	2026-08-28 15:08:29.762832	2026-08-28 15:08:30.158827	29dbb224-c6cd-4dd2-9b20-0de5d402cbc3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
21	4	2	2026-08-28 15:08:29.763901	2026-08-28 15:08:30.158827	f73d543b-90a5-4250-9ec1-00bc73d1b348	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
22	2	2	2026-08-28 15:08:29.766368	2026-08-28 15:08:30.158827	df07652c-a4fd-43db-9527-56be1f6e2c3d	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
22	3	2	2026-08-28 15:08:29.767742	2026-08-28 15:08:30.158827	65f5f0b9-d5c4-445c-8a94-d5f4ed453039	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
22	4	2	2026-08-28 15:08:29.769641	2026-08-28 15:08:30.158827	f4169c90-fe08-4949-a740-a9f07adf7394	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
23	2	2	2026-08-28 15:08:29.7777	2026-08-28 15:08:30.158827	f5fb36b8-60c2-47df-9b72-241bf73f028e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
23	3	2	2026-08-28 15:08:29.779078	2026-08-28 15:08:30.158827	727f8c23-0228-496a-b428-99f0603bd9ca	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
23	4	2	2026-08-28 15:08:29.782024	2026-08-28 15:08:30.158827	9297fb0b-f453-4e39-ace9-25265416dd0b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
24	2	2	2026-08-28 15:08:29.784417	2026-08-28 15:08:30.158827	e69a9ec7-3871-40aa-9d2e-52d58c5dd30f	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
24	3	2	2026-08-28 15:08:29.785695	2026-08-28 15:08:30.158827	175e4759-65ee-4e24-9b40-f07e4833bf56	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
24	4	2	2026-08-28 15:08:29.786584	2026-08-28 15:08:30.158827	80312c48-bec3-41f2-8b16-e0581e43e53e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
25	2	2	2026-08-28 15:08:29.788436	2026-08-28 15:08:30.158827	1803fbac-e4c8-43b3-8b6b-9471fa4959aa	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
25	3	2	2026-08-28 15:08:29.789607	2026-08-28 15:08:30.158827	dc79c34a-b026-4ae3-b2d3-0917a777f569	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
25	4	2	2026-08-28 15:08:29.791713	2026-08-28 15:08:30.158827	121a4bfe-93ce-4be6-b4de-afac9e5003da	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
26	2	2	2026-08-28 15:08:29.794456	2026-08-28 15:08:30.158827	c7e462fd-c6a0-436b-8531-eef9b45a6e27	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
26	3	2	2026-08-28 15:08:29.795776	2026-08-28 15:08:30.158827	cdd2d8a4-304e-4257-be00-134810b9ed9e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
26	4	2	2026-08-28 15:08:29.798664	2026-08-28 15:08:30.158827	9f35a358-4113-4e0e-bf60-c74497a170a7	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
27	2	2	2026-08-28 15:08:29.810286	2026-08-28 15:08:30.158827	1ef953d4-ce0c-41b8-af1f-4f54d31df49f	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
27	3	2	2026-08-28 15:08:29.811812	2026-08-28 15:08:30.158827	fbbf2c68-bb24-4d4b-a833-779be0c5a261	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
27	4	2	2026-08-28 15:08:29.813667	2026-08-28 15:08:30.158827	c9d1a400-05e9-4d66-ba5b-201d5ea95bc7	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
28	2	2	2026-08-28 15:08:29.816772	2026-08-28 15:08:30.158827	b04c47be-5eaf-44ee-a6a6-5f91a9baaaf4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
28	3	2	2026-08-28 15:08:29.817717	2026-08-28 15:08:30.158827	b7ffe65b-6a2c-477b-bdf2-969658eea322	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
28	4	2	2026-08-28 15:08:29.819211	2026-08-28 15:08:30.158827	20a35969-310a-4db3-9c45-acb121ea3566	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
29	2	2	2026-08-28 15:08:29.821204	2026-08-28 15:08:30.158827	51f161b5-757d-40af-9483-f213e3348b7e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
29	3	2	2026-08-28 15:08:29.822108	2026-08-28 15:08:30.158827	288f061f-d19d-4065-8053-967ad81d4918	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
29	4	2	2026-08-28 15:08:29.823349	2026-08-28 15:08:30.158827	8323bc6b-ec50-4058-81d5-021198393bf3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
30	2	2	2026-08-28 15:08:29.825541	2026-08-28 15:08:30.158827	ce312c75-8941-4fb3-aa91-5cf666a782bb	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
30	3	2	2026-08-28 15:08:29.827103	2026-08-28 15:08:30.158827	3ed7e71f-10f4-4137-b3e3-4c516aa70d3b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
30	4	2	2026-08-28 15:08:29.828085	2026-08-28 15:08:30.158827	a73abd01-86c2-46ae-8491-491d3d1f89a5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
31	2	2	2026-08-28 15:08:29.829801	2026-08-28 15:08:30.158827	c9c086bd-506b-4dc1-835d-db3eb0688788	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
31	3	2	2026-08-28 15:08:29.830833	2026-08-28 15:08:30.158827	3a1fffa4-4d96-4d9e-9784-359cf34abe9f	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
31	4	2	2026-08-28 15:08:29.831758	2026-08-28 15:08:30.158827	d651adc8-2839-47b6-b641-d04d227d7ed5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
32	2	2	2026-08-28 15:08:29.833465	2026-08-28 15:08:30.158827	5accb630-a67b-4ef1-bb13-023f67be40ee	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
32	3	2	2026-08-28 15:08:29.834286	2026-08-28 15:08:30.158827	9c46da73-28b8-4286-b0e0-9a216a24d165	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
32	4	2	2026-08-28 15:08:29.835154	2026-08-28 15:08:30.158827	25b2376f-3e81-4892-9576-069b1da2ed57	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
33	2	2	2026-08-28 15:08:29.837426	2026-08-28 15:08:30.158827	74d61d11-03a6-4ac1-b604-d720c0efc8aa	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
33	3	2	2026-08-28 15:08:29.83826	2026-08-28 15:08:30.158827	20f7ad5e-604a-4d52-a814-16fd885cdd88	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
33	4	2	2026-08-28 15:08:29.839196	2026-08-28 15:08:30.158827	da779db1-7d85-4fbd-99ee-890648756c5e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
34	2	2	2026-08-28 15:08:29.845744	2026-08-28 15:08:30.158827	00c30921-878b-459c-9c44-6fe9c285c886	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
34	3	2	2026-08-28 15:08:29.84706	2026-08-28 15:08:30.158827	aaac4691-6b6e-4c92-a13c-bd9e0a0182ed	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
34	4	2	2026-08-28 15:08:29.847918	2026-08-28 15:08:30.158827	e1e03a8c-3422-4d7d-9255-5cb7d5240efe	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
35	2	2	2026-08-28 15:08:29.849652	2026-08-28 15:08:30.158827	dade9a47-c712-4edb-aca9-89978203b2a1	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
35	3	2	2026-08-28 15:08:29.85068	2026-08-28 15:08:30.158827	f729c944-18dc-4f8e-b2b3-0fb8efb25c57	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
35	4	2	2026-08-28 15:08:29.851909	2026-08-28 15:08:30.158827	fef8aa09-f8a8-4116-ba3d-90d5a2be3a8c	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
36	1	2	2026-08-28 15:08:29.852879	2026-08-28 15:08:30.158827	1cf568db-e2ac-4d2c-944b-bd435ba3a6f3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
36	3	2	2026-08-28 15:08:29.854991	2026-08-28 15:08:30.158827	1fc6b612-f17a-4bdd-ac3b-28065dd9a78e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
36	4	2	2026-08-28 15:08:29.856726	2026-08-28 15:08:30.158827	3f7e8f57-bb5d-40f1-a784-59816973e09d	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
37	2	2	2026-08-28 15:08:29.860225	2026-08-28 15:08:30.158827	c6bb03eb-2138-4b15-aff2-c360911a8c33	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
37	3	2	2026-08-28 15:08:29.86162	2026-08-28 15:08:30.158827	9c86121e-df8c-4266-ac58-efed77792f46	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
37	4	2	2026-08-28 15:08:29.862723	2026-08-28 15:08:30.158827	b4b427b5-26f1-4155-84fb-ac738851efd4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
38	2	2	2026-08-28 15:08:29.864778	2026-08-28 15:08:30.158827	26794f10-a325-45d5-83ec-44635ada3f98	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
38	3	2	2026-08-28 15:08:29.865739	2026-08-28 15:08:30.158827	4f5a61f6-8be4-4ff7-9f52-4c4ede75bb90	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
38	4	2	2026-08-28 15:08:29.866647	2026-08-28 15:08:30.158827	c65d961f-95bc-4ed9-a34d-3a01eb3f4174	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
39	2	2	2026-08-28 15:08:29.869177	2026-08-28 15:08:30.158827	1060cc68-afea-4575-b60a-fce51afec954	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
39	3	2	2026-08-28 15:08:29.872462	2026-08-28 15:08:30.158827	a265c9ca-0f74-4628-895b-2abb1622e95d	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
39	4	2	2026-08-28 15:08:29.874729	2026-08-28 15:08:30.158827	f7498132-3824-417c-818e-18a0bdf207eb	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
40	2	2	2026-08-28 15:08:29.87982	2026-08-28 15:08:30.158827	21dbf26d-e731-4ae2-8450-02a6cf3c719b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
40	3	2	2026-08-28 15:08:29.881133	2026-08-28 15:08:30.158827	68a220ff-2c3e-4263-bfd4-dbd950eb0316	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
40	4	2	2026-08-28 15:08:29.882165	2026-08-28 15:08:30.158827	7202a9cf-6d3f-4495-a4fc-0eb9dd058b4b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
41	2	2	2026-08-28 15:08:29.883967	2026-08-28 15:08:30.158827	e2a707a6-186b-44fd-a923-a43bffa4b29e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
41	3	2	2026-08-28 15:08:29.891462	2026-08-28 15:08:30.158827	cfa92eda-889e-492d-aba8-3dd963693f2a	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
41	4	2	2026-08-28 15:08:29.896858	2026-08-28 15:08:30.158827	4ce086cf-d31c-410e-ad47-4dfc714deeeb	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
42	2	2	2026-08-28 15:08:29.899091	2026-08-28 15:08:30.158827	398925e6-2e10-41f7-901f-c7e6db919fc4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
42	3	2	2026-08-28 15:08:29.903621	2026-08-28 15:08:30.158827	ed82cd19-d6e6-4d91-b8ab-87e333274577	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
42	4	2	2026-08-28 15:08:29.915317	2026-08-28 15:08:30.158827	58cc860c-58f7-4838-abfc-15cdb3af0c4b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
43	2	2	2026-08-28 15:08:29.917269	2026-08-28 15:08:30.158827	1fe59a28-b97e-4f63-bcd2-928107bcdb43	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
43	3	2	2026-08-28 15:08:29.919108	2026-08-28 15:08:30.158827	b075ca6d-4eb7-48e0-a811-9cc06d833dda	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
43	4	2	2026-08-28 15:08:29.923047	2026-08-28 15:08:30.158827	01f842b8-09bc-47e1-b2aa-af4aaa431d86	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
44	2	2	2026-08-28 15:08:29.924984	2026-08-28 15:08:30.158827	4543fd6d-0572-44c4-ae17-348b6c03893b	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
44	3	2	2026-08-28 15:08:29.925776	2026-08-28 15:08:30.158827	0e1aba88-ef50-47ad-bd55-6ad554ec63fb	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
44	4	2	2026-08-28 15:08:29.926592	2026-08-28 15:08:30.158827	541ae970-d535-49ca-b961-01cd7292037e	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	d96dfd9c-8bb3-4713-b2a7-f36549670f15	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
45	2	2	2026-08-28 15:08:29.928326	2026-08-28 15:08:30.158827	ec5119e8-0614-465a-84ef-ad94ad658e17	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	21a0df48-0ba1-487b-a21c-a553f7059431	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
45	3	2	2026-08-28 15:08:29.929113	2026-08-28 15:08:30.158827	47a70598-624c-490f-8917-605dbe5c9df8	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	865980b1-9ca7-4d2a-9056-5bbe1abc4b9c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
45	4	2	2026-08-28 15:08:29.929966	2026-08-28 15:08:30.158827	6a5ee543-3f09-4a9f-984b-efb2312a1fe9	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	62e29033-19dd-40e7-9c93-a909aca0e770	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:30.158827	\N	\N
58	1	2	2026-08-28 15:08:30.945975	2026-08-28 15:08:31.011523	0efd9c38-e25a-463e-a2d0-74ac3f85d3c1	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	2	2	2026-08-28 15:08:30.946812	2026-08-28 15:08:31.015918	71008f9f-0a05-4105-b778-5562ce0ba32f	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	3	2	2026-08-28 15:08:30.947697	2026-08-28 15:08:31.017613	56f0ae6f-fe64-4ad0-b64c-819b4d6d3b21	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	4	2	2026-08-28 15:08:30.948555	2026-08-28 15:08:31.019456	fe6a1471-4392-4894-9d45-dc78734c3c3e	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	5	2	2026-08-28 15:08:30.949365	2026-08-28 15:08:31.021039	253069ea-9f56-48ff-b8a3-0a3f84629fea	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	6	2	2026-08-28 15:08:30.950309	2026-08-28 15:08:31.02251	95bc16cb-bc86-46a7-9596-e201210d0849	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	7	2	2026-08-28 15:08:30.951439	2026-08-28 15:08:31.02483	fbff8cfd-a0c7-4b87-b3b4-815ed630cc7d	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	8	2	2026-08-28 15:08:30.952372	2026-08-28 15:08:31.02665	45e9f802-da5c-4a98-8aa7-ac3aaff46eeb	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	9	2	2026-08-28 15:08:30.953198	2026-08-28 15:08:31.028038	ef6d473d-d940-4268-90e2-0631f7aabde5	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
58	10	2	2026-08-28 15:08:30.954002	2026-08-28 15:08:31.03279	724f47b0-d007-407e-9a1e-a703d5e4a77d	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	1	2	2026-08-28 15:08:30.955028	2026-08-28 15:08:31.034333	5064e642-2ad7-4071-8797-96e381a98471	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	2	2	2026-08-28 15:08:30.955856	2026-08-28 15:08:31.035761	425864a1-9bc3-41a1-af64-fb6f1c11756d	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	3	2	2026-08-28 15:08:30.956686	2026-08-28 15:08:31.0379	a5799302-46b0-4213-bb61-1bcc8e9e99d6	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	4	2	2026-08-28 15:08:30.957498	2026-08-28 15:08:31.039355	f5935010-4820-4227-b1d2-8e21b3f21cf9	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	5	2	2026-08-28 15:08:30.958289	2026-08-28 15:08:31.041057	60d4d82d-8915-4b33-9420-f487c898807a	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	6	2	2026-08-28 15:08:30.959186	2026-08-28 15:08:31.043366	7b4dab48-422a-4a3b-a37f-0c28fe13d551	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	7	2	2026-08-28 15:08:30.960143	2026-08-28 15:08:31.044616	125e8527-efda-4fce-a38a-2381e159a186	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	8	2	2026-08-28 15:08:30.961043	2026-08-28 15:08:31.04598	c05b86d1-974f-4948-8396-f531c0f1fe06	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	9	2	2026-08-28 15:08:30.961836	2026-08-28 15:08:31.047288	9faf7615-1399-41bf-ad26-40afeb266a04	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
59	10	2	2026-08-28 15:08:30.962622	2026-08-28 15:08:31.048531	4f4d0abd-fc66-4319-a233-831b82e27faf	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-28 15:08:30.996544	\N	8a86af66-4378-43d7-b2a1-f7760385dce0
46	1	1	2026-08-28 15:08:30.819385	2026-08-28 15:08:31.054676	5bbc21da-241d-4b6e-808b-e0f57c996db3	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	2026-08-28 15:08:31.091861	f	\N	\N	\N	\N	\N	\N
55	1	1	2026-08-28 15:08:30.914557	2026-08-28 15:08:31.063077	8eded9b9-a2ef-4f79-bdef-a722fd165d8f	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	2026-08-28 15:08:31.096346	f	\N	\N	\N	\N	\N	\N
49	1	1	2026-08-28 15:08:30.851837	2026-08-28 15:08:31.056516	0ed56fc9-dcb2-4090-b346-0c0aeddf9a8d	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	2026-08-28 15:08:31.101338	f	\N	\N	\N	\N	\N	\N
52	2	1	2026-08-28 15:08:30.885396	2026-08-28 15:08:31.059114	aa7b3ed5-73e8-4db1-8725-e8826ab88c2a	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	2026-08-28 15:08:31.104925	f	\N	\N	\N	\N	\N	\N
56	1	1	2026-08-28 15:08:30.924818	2026-08-28 15:08:31.063827	4dd6dce2-5ce5-49df-96a6-69b6c3dde7f3	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	2026-08-28 15:08:31.108516	f	\N	\N	\N	\N	\N	\N
51	2	1	2026-08-28 15:08:30.875033	2026-08-28 15:08:31.057963	68b1c193-deb4-429d-9b79-0eb743e7a8c7	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	2026-08-28 15:08:31.115549	f	\N	\N	\N	\N	\N	\N
57	1	1	2026-08-28 15:08:30.936031	2026-08-28 15:08:31.064559	3505263c-e6c7-4191-98d6-1ac86d8ddeca	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	2026-08-28 15:08:31.119745	f	\N	\N	\N	\N	\N	\N
50	1	1	2026-08-28 15:08:30.864084	2026-08-28 15:08:31.057228	5db56ad5-320a-426e-ba27-cb082dff60f9	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	2026-08-28 15:08:31.124943	f	\N	\N	\N	\N	\N	\N
47	1	1	2026-08-28 15:08:30.830781	2026-08-28 15:08:31.055753	7aa112bc-d2cb-4635-89ee-ea068fc7b697	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	2026-08-28 15:08:31.128339	f	\N	\N	\N	\N	\N	\N
53	1	1	2026-08-28 15:08:30.89612	2026-08-28 15:08:31.062256	70c94d87-ee40-47b1-92d5-2c11dc355e7d	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	2026-08-28 15:08:31.132246	f	\N	\N	\N	\N	\N	\N
46	2	2	2026-08-28 15:08:30.82128	2026-08-28 15:08:31.132699	e495f89d-398c-4b8a-a6b2-eaaa33c8b8f8	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	3	2	2026-08-28 15:08:30.822133	2026-08-28 15:08:31.132699	788a6b98-e90b-4d0a-a113-413f09d71858	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	4	2	2026-08-28 15:08:30.823165	2026-08-28 15:08:31.132699	dbaa9285-90eb-4e26-ad48-93ebe6782c8f	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	5	2	2026-08-28 15:08:30.824131	2026-08-28 15:08:31.132699	4e3787e0-5249-4698-97e0-55af71b07c54	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	6	2	2026-08-28 15:08:30.824976	2026-08-28 15:08:31.132699	6edc8489-e32f-40b5-83e8-0af12f019a08	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	7	2	2026-08-28 15:08:30.825837	2026-08-28 15:08:31.132699	acc7a781-9bee-4e0c-b2ae-a1d07ec2d2ea	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	8	2	2026-08-28 15:08:30.827026	2026-08-28 15:08:31.132699	d88b2e2e-e4b5-41b7-9db3-0c2321bf1f0c	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	9	2	2026-08-28 15:08:30.828676	2026-08-28 15:08:31.132699	cbaf6cbc-bd4d-42e9-ba32-01779212d1d1	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
46	10	2	2026-08-28 15:08:30.829759	2026-08-28 15:08:31.132699	af586f4e-694e-4bc0-8a5b-30eadc8057d6	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	2	2	2026-08-28 15:08:30.832032	2026-08-28 15:08:31.132699	cec83dc5-10b6-47fd-9820-0f5d5213c2cc	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	3	2	2026-08-28 15:08:30.832976	2026-08-28 15:08:31.132699	972f74d2-669a-4b65-8c05-a9cbbffe446e	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	4	2	2026-08-28 15:08:30.833971	2026-08-28 15:08:31.132699	f3e6588a-a1a4-4f9f-8bbb-67043187bfb3	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	5	2	2026-08-28 15:08:30.83485	2026-08-28 15:08:31.132699	415ffb4d-1ba8-490e-940e-b1c534f12065	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	6	2	2026-08-28 15:08:30.836505	2026-08-28 15:08:31.132699	592ec6a8-5ca8-4ca5-821d-4d8621dd11eb	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	7	2	2026-08-28 15:08:30.837393	2026-08-28 15:08:31.132699	dd73b805-3767-4579-ba20-d210a137e394	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	8	2	2026-08-28 15:08:30.838211	2026-08-28 15:08:31.132699	40ef984e-8387-4745-ba39-d91b0895b6ed	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	9	2	2026-08-28 15:08:30.839065	2026-08-28 15:08:31.132699	c8059ae3-7631-472c-a401-b2a4382c4853	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
47	10	2	2026-08-28 15:08:30.840157	2026-08-28 15:08:31.132699	635cfc38-b652-4054-b703-ba7c4530f44c	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	1	2	2026-08-28 15:08:30.841016	2026-08-28 15:08:31.132699	055c7dd8-0a88-4b9d-af81-0b7bacc492a9	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	2	2	2026-08-28 15:08:30.841874	2026-08-28 15:08:31.132699	bf6c2e0e-6160-4850-851c-28de0de37972	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	3	2	2026-08-28 15:08:30.842724	2026-08-28 15:08:31.132699	8470e166-af9c-4367-838a-920c0de46adc	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	4	2	2026-08-28 15:08:30.844598	2026-08-28 15:08:31.132699	ba621c41-6eff-4b30-bcb2-563ba52ed95e	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	5	2	2026-08-28 15:08:30.84578	2026-08-28 15:08:31.132699	682521cf-12f5-4f0d-8010-2f892e27f3fb	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	6	2	2026-08-28 15:08:30.846659	2026-08-28 15:08:31.132699	e9fba327-b81c-491a-adc7-2736b7f18ca1	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	7	2	2026-08-28 15:08:30.847579	2026-08-28 15:08:31.132699	c471eb1e-bacb-4152-85df-ec14b46ee55f	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	8	2	2026-08-28 15:08:30.848386	2026-08-28 15:08:31.132699	91861cd3-77ee-4274-b62a-b2c5e35c566c	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	9	2	2026-08-28 15:08:30.849277	2026-08-28 15:08:31.132699	123bf4ef-1f15-4505-8a47-5784cda1f505	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
48	10	2	2026-08-28 15:08:30.850165	2026-08-28 15:08:31.132699	c7f0b3bc-a59a-4d53-951e-06a4e7cb04cd	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	2	2	2026-08-28 15:08:30.852907	2026-08-28 15:08:31.132699	8028d922-c2ce-401a-b219-6280c1273fe0	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	3	2	2026-08-28 15:08:30.854418	2026-08-28 15:08:31.132699	14d35cad-87a0-4836-b8f8-a322855b9bb9	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	4	2	2026-08-28 15:08:30.855507	2026-08-28 15:08:31.132699	6ac84381-ae4d-4d95-8837-f1420675d1fb	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	5	2	2026-08-28 15:08:30.856662	2026-08-28 15:08:31.132699	667a8570-7e74-41c1-af37-f3900bbf1262	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	6	2	2026-08-28 15:08:30.857784	2026-08-28 15:08:31.132699	b665df47-028a-4aae-a2e6-6f7c568bbc98	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	7	2	2026-08-28 15:08:30.858918	2026-08-28 15:08:31.132699	5089226e-c80b-4b45-9fb2-608396577965	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	8	2	2026-08-28 15:08:30.860238	2026-08-28 15:08:31.132699	073d30ff-8e1e-4cc6-b3b9-d36eb098a335	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	9	2	2026-08-28 15:08:30.862076	2026-08-28 15:08:31.132699	f2087ca2-8c50-4ae1-a00a-ceb1b7d61fbb	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
49	10	2	2026-08-28 15:08:30.863069	2026-08-28 15:08:31.132699	f48c48a6-97aa-4829-82a9-4cadf8f9f7be	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	2	2	2026-08-28 15:08:30.864979	2026-08-28 15:08:31.132699	89e5f310-e93b-41a2-82ea-27185ff76f36	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	3	2	2026-08-28 15:08:30.865826	2026-08-28 15:08:31.132699	9bdf53f2-9a36-4aa4-96c5-dfb0e4f68d85	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	4	2	2026-08-28 15:08:30.8667	2026-08-28 15:08:31.132699	0e0a95de-ee17-47ee-b2f6-ee725e58ebab	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	5	2	2026-08-28 15:08:30.867662	2026-08-28 15:08:31.132699	3ee9c340-5996-42fd-b79a-ff45d751b74f	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	6	2	2026-08-28 15:08:30.868633	2026-08-28 15:08:31.132699	ab18fc14-042a-4346-bd1d-2e33fe3ff33a	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	7	2	2026-08-28 15:08:30.869639	2026-08-28 15:08:31.132699	0df2ba00-e705-4023-9851-75b93dd6d53e	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	8	2	2026-08-28 15:08:30.87049	2026-08-28 15:08:31.132699	2fc18a5e-01bb-44fd-8ac0-1da5e423b8ca	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	9	2	2026-08-28 15:08:30.872341	2026-08-28 15:08:31.132699	9044bd90-3cb5-4c53-a7b0-045a4821c7cf	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
50	10	2	2026-08-28 15:08:30.873191	2026-08-28 15:08:31.132699	e93986b1-e338-4c98-a1e3-b7bb5acf222a	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	1	2	2026-08-28 15:08:30.874021	2026-08-28 15:08:31.132699	dc30672f-ba14-4f70-b26f-119dd54689b0	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	3	2	2026-08-28 15:08:30.876091	2026-08-28 15:08:31.132699	e22df0f4-36c9-4a10-a682-90823b565689	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	4	2	2026-08-28 15:08:30.877114	2026-08-28 15:08:31.132699	a125bba2-4988-4b83-abc0-37ea8eb9ed02	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	5	2	2026-08-28 15:08:30.878121	2026-08-28 15:08:31.132699	e1cb2701-75b5-4f89-908a-c4f7b89360ff	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	6	2	2026-08-28 15:08:30.879016	2026-08-28 15:08:31.132699	5d21d8a7-bee1-4fb7-80d2-0268d8a23f92	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	7	2	2026-08-28 15:08:30.879867	2026-08-28 15:08:31.132699	b188a6f8-7233-45c7-ab4c-0fa9f4b65137	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	8	2	2026-08-28 15:08:30.880689	2026-08-28 15:08:31.132699	06e2514b-0367-4520-a611-263c3f955e26	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	9	2	2026-08-28 15:08:30.882548	2026-08-28 15:08:31.132699	c127dcc8-6266-4e08-ad81-c851686beaa0	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
51	10	2	2026-08-28 15:08:30.883639	2026-08-28 15:08:31.132699	c060d81d-361c-46d2-a29a-556ad8551317	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	1	2	2026-08-28 15:08:30.88453	2026-08-28 15:08:31.132699	a739dec5-3c2f-40a1-80c0-eae88a3fd632	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	3	2	2026-08-28 15:08:30.88624	2026-08-28 15:08:31.132699	8e4a8d58-a6d4-4a00-9890-b603b9d20867	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	4	2	2026-08-28 15:08:30.887364	2026-08-28 15:08:31.132699	573fa33e-8d2a-42f1-ad79-d7caa88d8ebd	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	5	2	2026-08-28 15:08:30.888475	2026-08-28 15:08:31.132699	b6ddcc13-18dd-42ba-96bb-2a0ebdb3d59e	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	6	2	2026-08-28 15:08:30.889631	2026-08-28 15:08:31.132699	dcf43ea6-5765-49b9-9a1e-a57b26eea0bb	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	7	2	2026-08-28 15:08:30.890913	2026-08-28 15:08:31.132699	01329951-404e-4efa-a805-0908625aaab1	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	8	2	2026-08-28 15:08:30.892184	2026-08-28 15:08:31.132699	54f9b7e9-8f4b-4780-97c7-629f7ac7add9	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	9	2	2026-08-28 15:08:30.894191	2026-08-28 15:08:31.132699	2e301f87-4e23-4076-8fce-aa1e3d2da364	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
52	10	2	2026-08-28 15:08:30.895122	2026-08-28 15:08:31.132699	7314a241-dea6-4d19-bcc0-c2ff9c1ba75e	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	2	2	2026-08-28 15:08:30.897009	2026-08-28 15:08:31.132699	78bba4d7-1b30-49b0-9323-89618ee31171	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	3	2	2026-08-28 15:08:30.897789	2026-08-28 15:08:31.132699	55d6b649-2c5d-4e2b-be30-7b7d1af7d7d1	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	4	2	2026-08-28 15:08:30.898568	2026-08-28 15:08:31.132699	bebbbf5a-cc77-4557-960c-5ed2b6efcbbf	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	5	2	2026-08-28 15:08:30.899455	2026-08-28 15:08:31.132699	5bdc0913-4628-489c-995e-9d5a70fb8bab	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	6	2	2026-08-28 15:08:30.9003	2026-08-28 15:08:31.132699	81a80f66-b11f-46b5-b232-7c1765f3decc	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	7	2	2026-08-28 15:08:30.901243	2026-08-28 15:08:31.132699	000c0464-b014-4ab2-a89a-dcea3d5fe5fc	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	8	2	2026-08-28 15:08:30.902108	2026-08-28 15:08:31.132699	8a354c7b-d895-4532-826a-1a51edb55fce	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	9	2	2026-08-28 15:08:30.9036	2026-08-28 15:08:31.132699	25879277-e1ef-454e-bb63-06113783151e	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
53	10	2	2026-08-28 15:08:30.904441	2026-08-28 15:08:31.132699	0bd960ba-4502-443e-86c2-5fde2eb8b61a	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	1	2	2026-08-28 15:08:30.905392	2026-08-28 15:08:31.132699	7b30cb4c-1c16-4b9a-8ab4-3d2e4670620c	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	2	2	2026-08-28 15:08:30.906221	2026-08-28 15:08:31.132699	452ea9aa-03d9-40ba-b2cb-16a5ca09fd2a	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	3	2	2026-08-28 15:08:30.9073	2026-08-28 15:08:31.132699	621dfa29-9b50-4376-8200-b46a2e46db25	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	4	2	2026-08-28 15:08:30.908321	2026-08-28 15:08:31.132699	3f6d5172-74c8-48d8-a305-10e528ba1a16	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	5	2	2026-08-28 15:08:30.909172	2026-08-28 15:08:31.132699	1ff1813d-1c3b-4535-811d-48987b068c1f	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	6	2	2026-08-28 15:08:30.910387	2026-08-28 15:08:31.132699	01e6080c-d6c3-4283-a294-9ef409174cd5	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	7	2	2026-08-28 15:08:30.911254	2026-08-28 15:08:31.132699	2de9bffd-a354-4cc4-a14d-1b30aadba04c	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	8	2	2026-08-28 15:08:30.912051	2026-08-28 15:08:31.132699	6178de84-cf40-4ee2-bdc8-b5cf923d73ee	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	9	2	2026-08-28 15:08:30.912839	2026-08-28 15:08:31.132699	81bf89cf-bb56-45cf-ad92-817d6b0467ee	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
54	10	2	2026-08-28 15:08:30.913629	2026-08-28 15:08:31.132699	0c829081-46b8-44a3-96dc-e3e3932e5c5a	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	2	2	2026-08-28 15:08:30.915599	2026-08-28 15:08:31.132699	29e5dc67-5a26-42f4-bd43-bfc47ad307fe	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	3	2	2026-08-28 15:08:30.916721	2026-08-28 15:08:31.132699	88bc9892-2e50-49d8-a27f-1f4a7a626bad	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	4	2	2026-08-28 15:08:30.917577	2026-08-28 15:08:31.132699	4f34b098-d1ea-4493-b904-e204a7af119e	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	5	2	2026-08-28 15:08:30.918413	2026-08-28 15:08:31.132699	bd4f41fd-5538-4194-a666-e15868816fea	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	6	2	2026-08-28 15:08:30.919304	2026-08-28 15:08:31.132699	7b643473-5522-407d-bb51-9064d14006e4	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	7	2	2026-08-28 15:08:30.920121	2026-08-28 15:08:31.132699	28453e55-56cd-4c5d-9658-641086fbb20a	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	8	2	2026-08-28 15:08:30.920971	2026-08-28 15:08:31.132699	937cddd1-8195-4c60-962a-868eeaa5ba39	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	9	2	2026-08-28 15:08:30.921949	2026-08-28 15:08:31.132699	79ad2596-9f14-46e5-9280-1280836a551a	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
55	10	2	2026-08-28 15:08:30.92316	2026-08-28 15:08:31.132699	89315674-ed02-4b5b-acfd-b80238af929d	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	2	2	2026-08-28 15:08:30.926005	2026-08-28 15:08:31.132699	a85ecf95-64a0-4ba3-bba4-8f7f1da363fb	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	3	2	2026-08-28 15:08:30.927088	2026-08-28 15:08:31.132699	5ebdeb3a-1940-4067-bfbc-bd259e072245	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	4	2	2026-08-28 15:08:30.928568	2026-08-28 15:08:31.132699	9c2b440d-9ab2-439b-bec3-75fc42c9e202	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	5	2	2026-08-28 15:08:30.929879	2026-08-28 15:08:31.132699	0dc7f532-2b08-40af-9a59-d8bd899fdd2d	099ac67d-2bdb-4bc7-902c-54f400285823	dddafd2d-f04c-4f7f-8ce2-83fa217c89ae	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	6	2	2026-08-28 15:08:30.93091	2026-08-28 15:08:31.132699	f74f7f4d-c77d-4f20-a082-efd8049c41f9	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	7	2	2026-08-28 15:08:30.932128	2026-08-28 15:08:31.132699	ab02491f-ed29-412b-868d-177690bb3461	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	8	2	2026-08-28 15:08:30.933058	2026-08-28 15:08:31.132699	e0506eba-f628-462a-b33c-0ff87cf665c2	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	9	2	2026-08-28 15:08:30.934249	2026-08-28 15:08:31.132699	94573fed-52e6-4af2-9b00-41c18b9203b1	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
56	10	2	2026-08-28 15:08:30.935184	2026-08-28 15:08:31.132699	fd062d1b-4a52-4bb3-9dcd-871037c34505	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	2	2	2026-08-28 15:08:30.937016	2026-08-28 15:08:31.132699	1b6351fa-1037-47d5-a131-eaa24b2d861a	099ac67d-2bdb-4bc7-902c-54f400285823	b765b632-ab35-4458-9a08-9cff6bedc781	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	3	2	2026-08-28 15:08:30.937894	2026-08-28 15:08:31.132699	fc47b55d-28b8-4987-8f90-db76f252a257	099ac67d-2bdb-4bc7-902c-54f400285823	f241480c-ea5a-43f9-b056-503e649bfd17	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	4	2	2026-08-28 15:08:30.938747	2026-08-28 15:08:31.132699	2e62da88-cf80-4778-b78c-0c61fe3e8639	099ac67d-2bdb-4bc7-902c-54f400285823	02eb271e-974b-4b3c-b2ff-97c365c1dcad	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	5	2	2026-08-28 15:08:30.939779	2026-08-28 15:08:31.132699	ad8c58c0-aca0-4dc7-9a5f-c0135e8f15d5	099ac67d-2bdb-4bc7-902c-54f400285823	e0df752e-dc34-4160-97ec-b441b3beb9bc	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	6	2	2026-08-28 15:08:30.94068	2026-08-28 15:08:31.132699	d3e98137-f29c-4ee5-a5d0-13b77731e245	099ac67d-2bdb-4bc7-902c-54f400285823	e9a44c20-e20f-466b-8e15-6843c7e1b633	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	7	2	2026-08-28 15:08:30.941854	2026-08-28 15:08:31.132699	9eebbe08-3f05-45c7-9031-67532d062b63	099ac67d-2bdb-4bc7-902c-54f400285823	03c9b7eb-4986-4b91-bcad-1c36b68b132b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	8	2	2026-08-28 15:08:30.942903	2026-08-28 15:08:31.132699	61ef1cb6-56ab-4ebd-be76-053ecea3d6ca	099ac67d-2bdb-4bc7-902c-54f400285823	6bf8fb28-a9e9-44fe-9d70-8087fd0b8575	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	9	2	2026-08-28 15:08:30.944185	2026-08-28 15:08:31.132699	9f6e64b1-39e2-4d7c-a50a-2a01c07ae78e	099ac67d-2bdb-4bc7-902c-54f400285823	b7cb3149-2d2e-4f3e-a1ae-cea79aa9e91b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
57	10	2	2026-08-28 15:08:30.945164	2026-08-28 15:08:31.132699	e317a77c-8c14-4e34-b58a-39ba7bd9418d	099ac67d-2bdb-4bc7-902c-54f400285823	5304e963-6d17-436d-b156-69964a8e3a5a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-28 15:08:31.132699	\N	\N
60	1	0	2026-08-28 15:08:31.449221	2026-08-28 15:08:31.449221	5667100e-f80b-4cdc-a602-26d92e731402	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
60	2	0	2026-08-28 15:08:31.450891	2026-08-28 15:08:31.450891	ebc80aa8-985e-4c64-9fb2-0d21c0e9f9ae	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
60	3	0	2026-08-28 15:08:31.452109	2026-08-28 15:08:31.452109	a38c07a0-5c57-4fff-8bf1-87a535130313	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
61	1	0	2026-08-28 15:08:31.453981	2026-08-28 15:08:31.453981	d425c1a7-4f4f-4c8e-81fe-12b5e32acd6c	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
61	2	0	2026-08-28 15:08:31.455165	2026-08-28 15:08:31.455165	4d16622c-4b86-4ea9-baad-2452cbec550f	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
62	1	0	2026-08-28 15:08:31.457132	2026-08-28 15:08:31.457132	0c419990-0f61-465a-8bec-3cf77e29fb72	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
63	1	0	2026-08-28 15:08:31.459257	2026-08-28 15:08:31.459257	f7391adf-6757-4a68-b8ce-71dc34e4564e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
63	2	0	2026-08-28 15:08:31.460807	2026-08-28 15:08:31.460807	37f5b3a8-d73c-432b-8aa8-1840d2916838	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
64	1	0	2026-08-28 15:08:31.46422	2026-08-28 15:08:31.46422	06edb77d-b07f-48f9-a276-eb5e8f439741	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
65	1	0	2026-08-28 15:08:31.466266	2026-08-28 15:08:31.466266	61908ede-2531-46d6-a08a-e68d0442d8bc	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
66	1	0	2026-08-28 15:08:31.468501	2026-08-28 15:08:31.468501	2b30b0b4-e946-4637-9788-5f5d573564ca	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
66	2	0	2026-08-28 15:08:31.469848	2026-08-28 15:08:31.469848	791fded5-1f69-4c4f-bd4f-64062871c5fc	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
67	1	0	2026-08-28 15:08:31.471835	2026-08-28 15:08:31.471835	dad2aa35-ae12-49cb-b2df-943ecac42929	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
67	2	0	2026-08-28 15:08:31.47286	2026-08-28 15:08:31.47286	4be7a05d-0d87-44bf-8236-875c6ce0ceb2	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
68	1	0	2026-08-28 15:08:31.476206	2026-08-28 15:08:31.476206	5e0758a0-a0f1-41e4-975a-53f046f38a66	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
69	1	0	2026-08-28 15:08:31.47816	2026-08-28 15:08:31.47816	aae94ffe-84fd-4a68-a51f-3583efabd0dc	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
69	2	0	2026-08-28 15:08:31.479604	2026-08-28 15:08:31.479604	7d2cef06-dba4-4d78-9893-fa3ca7b6b415	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
70	1	0	2026-08-28 15:08:31.481373	2026-08-28 15:08:31.481373	e36928af-46fc-40f2-b550-a6b2a851cb8b	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
71	1	0	2026-08-28 15:08:31.483723	2026-08-28 15:08:31.483723	c6dd4687-7cd9-4ac8-93d0-176dd267dd60	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
72	1	0	2026-08-28 15:08:31.485625	2026-08-28 15:08:31.485625	ed8d07ed-f7c6-45c9-95d9-3d2fb066f425	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
72	2	0	2026-08-28 15:08:31.486587	2026-08-28 15:08:31.486587	35a3fcae-dd53-4002-bc4f-167d125f12fd	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
73	1	0	2026-08-28 15:08:31.488223	2026-08-28 15:08:31.488223	296429f5-940e-4c13-9a34-19d7c6ce450e	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
73	2	0	2026-08-28 15:08:31.489183	2026-08-28 15:08:31.489183	c47d1666-90be-4b5f-ac1a-d12883b37928	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
73	3	0	2026-08-28 15:08:31.490286	2026-08-28 15:08:31.490286	5fd78330-c330-46a8-b811-162b9b31e1f1	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
74	1	0	2026-08-28 15:08:31.491991	2026-08-28 15:08:31.491991	331ac461-787c-411c-ac57-2ff4041d83f4	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
74	2	0	2026-08-28 15:08:31.493153	2026-08-28 15:08:31.493153	97cd8b44-1d24-410c-b344-8dc51e24ea6b	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
75	1	0	2026-08-28 15:08:31.494845	2026-08-28 15:08:31.494845	633b330d-a8fe-4415-8934-b3f0496da135	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
76	1	0	2026-08-28 15:08:31.497393	2026-08-28 15:08:31.497393	ba4abbf3-6393-4cdf-868e-d479d70d2c35	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
76	2	0	2026-08-28 15:08:31.499745	2026-08-28 15:08:31.499745	552bf926-8e2f-4b2a-8439-0fe113a936f5	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
77	1	0	2026-08-28 15:08:31.501282	2026-08-28 15:08:31.501282	8717b58f-64c2-486c-b576-74783062eede	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
77	2	0	2026-08-28 15:08:31.502337	2026-08-28 15:08:31.502337	e91f1ea5-2003-499e-b943-203e2e8cb1e7	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
78	1	0	2026-08-28 15:08:31.503982	2026-08-28 15:08:31.503982	44f35abb-b69a-4a5f-b308-7e1bda0ca73a	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
78	2	0	2026-08-28 15:08:31.505365	2026-08-28 15:08:31.505365	3967886f-1534-401e-aa7a-91109f34f014	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
79	1	0	2026-08-28 15:08:31.506852	2026-08-28 15:08:31.506852	03044668-3a88-4240-8d03-26bae683e455	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
80	1	0	2026-08-28 15:08:31.508217	2026-08-28 15:08:31.508217	120fc7cf-d6c4-4d19-8db6-d6aca3feff6e	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
80	2	0	2026-08-28 15:08:31.509261	2026-08-28 15:08:31.509261	79445099-7ab7-47ff-a4f6-524764e8c038	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
81	1	0	2026-08-28 15:08:31.510626	2026-08-28 15:08:31.510626	df27e7a4-9d4e-441c-9171-49e628ea44e9	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
81	2	0	2026-08-28 15:08:31.511852	2026-08-28 15:08:31.511852	19e44a21-b413-4d4c-aef3-f2b158aaf11b	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
82	1	0	2026-08-28 15:08:31.514111	2026-08-28 15:08:31.514111	217a278a-1e66-4ec3-88c1-afcade6711aa	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
82	2	0	2026-08-28 15:08:31.515376	2026-08-28 15:08:31.515376	6d76b1e2-bbf4-4f61-b654-063f031ac50d	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
83	1	0	2026-08-28 15:08:31.517495	2026-08-28 15:08:31.517495	8fb7e3aa-b068-4c48-9ff1-9f00586312fc	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
84	1	0	2026-08-28 15:08:31.519129	2026-08-28 15:08:31.519129	466de7dd-78e7-4b9a-a906-c8f0a32e90ff	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
85	1	0	2026-08-28 15:08:31.520698	2026-08-28 15:08:31.520698	2b3cf22d-decd-4017-b07b-cf9fd2a4a9fe	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
86	1	0	2026-08-28 15:08:31.522014	2026-08-28 15:08:31.522014	1984f9a0-93e4-4c33-96e9-3b176ed2126f	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
86	2	0	2026-08-28 15:08:31.523201	2026-08-28 15:08:31.523201	5a60566b-2f55-4550-876a-44639449e1e7	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
86	3	0	2026-08-28 15:08:31.524423	2026-08-28 15:08:31.524423	90121927-46bb-442d-8675-8d1c765b3347	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
87	1	0	2026-08-28 15:08:31.525935	2026-08-28 15:08:31.525935	7dda8854-1928-4d43-bed6-9b63fc9c7a78	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
88	1	0	2026-08-28 15:08:31.528267	2026-08-28 15:08:31.528267	e375502b-c4b9-47bd-bd1a-a41caf3fb238	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
88	2	0	2026-08-28 15:08:31.53174	2026-08-28 15:08:31.53174	10183072-ca74-437f-bfa2-975a220ab48b	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
89	1	0	2026-08-28 15:08:31.533397	2026-08-28 15:08:31.533397	2e36a663-3911-407a-b9af-8f228b22b735	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
90	1	0	2026-08-28 15:08:31.535006	2026-08-28 15:08:31.535006	f47b88f6-e64c-43ae-8b3a-80d8ec9e439e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
90	2	0	2026-08-28 15:08:31.536167	2026-08-28 15:08:31.536167	53efaa0d-cdfe-4b07-ba61-365209f70634	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
91	1	0	2026-08-28 15:08:31.537506	2026-08-28 15:08:31.537506	edb81ad3-122d-4a7e-be27-53a424eee677	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
91	2	0	2026-08-28 15:08:31.53849	2026-08-28 15:08:31.53849	18a0585e-8343-4075-b8e9-b4211a231cdb	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
91	3	0	2026-08-28 15:08:31.539693	2026-08-28 15:08:31.539693	220b6f2b-3d8b-49a5-a7ae-f71471508f38	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
92	1	0	2026-08-28 15:08:31.541027	2026-08-28 15:08:31.541027	68645323-19ee-408a-bbff-3223dc815d3d	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
93	1	0	2026-08-28 15:08:31.542729	2026-08-28 15:08:31.542729	6d08192d-28af-4fae-aea4-a5058dc9d7e4	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
93	2	0	2026-08-28 15:08:31.544071	2026-08-28 15:08:31.544071	82bf40c2-f02a-444a-a263-7b79f55a8448	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
94	1	0	2026-08-28 15:08:31.54598	2026-08-28 15:08:31.54598	fa7b9333-9742-4ea2-926f-4bb1d1d4914e	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
95	1	0	2026-08-28 15:08:31.547973	2026-08-28 15:08:31.547973	130d0e34-4d83-4e80-a809-37095d1f18ca	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
95	2	0	2026-08-28 15:08:31.548949	2026-08-28 15:08:31.548949	c6157f07-9963-43ff-add7-8137a44bfb2f	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
96	1	0	2026-08-28 15:08:31.550602	2026-08-28 15:08:31.550602	26e1b23b-acbf-4341-8bfa-ae665b7571e8	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
96	2	0	2026-08-28 15:08:31.551684	2026-08-28 15:08:31.551684	9621685a-8baf-40f4-97df-2d9b400d251c	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
97	1	0	2026-08-28 15:08:31.553206	2026-08-28 15:08:31.553206	6e60e78c-dbfd-4a30-ba36-6463a23f58cc	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
97	2	0	2026-08-28 15:08:31.554143	2026-08-28 15:08:31.554143	fcefedb7-eb67-4fd4-8bcc-461fd41a2e64	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
97	3	0	2026-08-28 15:08:31.555269	2026-08-28 15:08:31.555269	7ae01735-60c2-4870-a450-20fb21b67da6	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
98	1	0	2026-08-28 15:08:31.556855	2026-08-28 15:08:31.556855	bf4a135e-7945-48f7-b6cd-583916125bb0	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
99	1	0	2026-08-28 15:08:31.558288	2026-08-28 15:08:31.558288	e50e8756-74e8-457a-8b96-b689e00fe962	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
99	2	0	2026-08-28 15:08:31.559404	2026-08-28 15:08:31.559404	1b9e2cc4-2d66-4405-a039-337e50ea66ab	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
100	1	0	2026-08-28 15:08:31.560834	2026-08-28 15:08:31.560834	79e621f1-7b57-4a48-87c9-c422056a1a12	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
100	2	0	2026-08-28 15:08:31.562169	2026-08-28 15:08:31.562169	d14c8a9d-3aa1-4008-b590-cc2deb1e3c70	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
101	1	0	2026-08-28 15:08:31.563924	2026-08-28 15:08:31.563924	e8ddc4c6-fc64-4409-85ec-3b656ed077f9	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
102	1	0	2026-08-28 15:08:31.565984	2026-08-28 15:08:31.565984	ea8235cd-e15f-4b52-b37f-93496e19953c	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
102	2	0	2026-08-28 15:08:31.567448	2026-08-28 15:08:31.567448	3ff551e0-e6c1-46c2-91c6-d59f0866d78d	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
103	1	0	2026-08-28 15:08:31.569838	2026-08-28 15:08:31.569838	3e8fce6e-6b7c-4847-8b70-b7ead92db68a	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
103	2	0	2026-08-28 15:08:31.571321	2026-08-28 15:08:31.571321	9a57dd4e-b186-4c70-8dd6-b708d9487cc3	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
104	1	0	2026-08-28 15:08:31.574438	2026-08-28 15:08:31.574438	8ff65092-f4d8-401b-a2de-28e704ebfa51	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
105	1	0	2026-08-28 15:08:31.576233	2026-08-28 15:08:31.576233	098be178-2c0d-4fc9-a79a-3344a54a19dd	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
105	2	0	2026-08-28 15:08:31.577324	2026-08-28 15:08:31.577324	0e61c762-52da-4e7e-ad88-cdcacb60e885	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
106	1	0	2026-08-28 15:08:31.57885	2026-08-28 15:08:31.57885	e69d7a41-034f-484f-b69c-05f8f5427f0f	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
107	1	0	2026-08-28 15:08:31.580306	2026-08-28 15:08:31.580306	79ee931c-8c51-4570-aae1-fcec0f087eba	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
108	1	0	2026-08-28 15:08:31.581625	2026-08-28 15:08:31.581625	c7e8422c-ce46-410b-9c00-79fc9f608942	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
108	2	0	2026-08-28 15:08:31.582627	2026-08-28 15:08:31.582627	82004784-4a7a-444a-b6ec-e902e199a424	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
109	1	0	2026-08-28 15:08:31.584072	2026-08-28 15:08:31.584072	e72cf2aa-551e-40ea-bfa8-e1f7b0234323	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
109	2	0	2026-08-28 15:08:31.585183	2026-08-28 15:08:31.585183	cac84b58-be99-4d4e-97ce-d8a61033e319	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
110	1	0	2026-08-28 15:08:31.587482	2026-08-28 15:08:31.587482	8923c626-3413-47c4-8112-19c2cf02551a	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
110	2	0	2026-08-28 15:08:31.588547	2026-08-28 15:08:31.588547	020a4647-3642-4bb5-8409-c67f4fb0d98f	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
110	3	0	2026-08-28 15:08:31.589501	2026-08-28 15:08:31.589501	7dba4ddc-0648-451c-82e0-e40605e4d837	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
111	1	0	2026-08-28 15:08:31.59082	2026-08-28 15:08:31.59082	5fc1bc34-dd34-42ba-9981-8d6ace8b7e6c	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
112	1	0	2026-08-28 15:08:31.593273	2026-08-28 15:08:31.593273	8ca985fa-0a3e-4a12-8c02-c3db1ddf73f5	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
112	2	0	2026-08-28 15:08:31.594812	2026-08-28 15:08:31.594812	99d6da73-f732-4ac4-82a5-308153001bba	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
112	3	0	2026-08-28 15:08:31.59651	2026-08-28 15:08:31.59651	45b84d32-877a-49de-981c-763d13d9e546	bafa1987-373b-46ab-ace9-b2ad19518b66	ef6f0774-0c2c-4404-97b2-6077aeaa0d85	\N	f	\N	\N	\N	\N	\N	\N
113	1	0	2026-08-28 15:08:31.598244	2026-08-28 15:08:31.598244	f48e9937-e8aa-44c3-9574-8878a9dc0bfc	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
114	1	0	2026-08-28 15:08:31.600014	2026-08-28 15:08:31.600014	94fa283f-a4a9-49c5-a019-e0cacac6e3be	bafa1987-373b-46ab-ace9-b2ad19518b66	4f07ce44-78b3-429e-b74f-653e2057f745	\N	f	\N	\N	\N	\N	\N	\N
114	2	0	2026-08-28 15:08:31.601231	2026-08-28 15:08:31.601231	9de31e3d-d602-4b40-a8d6-afddfef6422b	bafa1987-373b-46ab-ace9-b2ad19518b66	0759131b-7aac-4d34-8442-9d7abff1d0ab	\N	f	\N	\N	\N	\N	\N	\N
114	3	0	2026-08-28 15:08:31.602892	2026-08-28 15:08:31.602892	f30fed1e-8a49-4110-9ad0-c42a21a6b732	bafa1987-373b-46ab-ace9-b2ad19518b66	31bb644f-7280-454d-9ba1-9f3d425dddb5	\N	f	\N	\N	\N	\N	\N	\N
115	\N	1	2026-08-28 15:08:31.723191	2026-08-28 15:08:31.723191	3a9069b7-46cf-4813-8770-2bf881074df9	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
116	\N	1	2026-08-28 15:08:31.733766	2026-08-28 15:08:31.733766	55d29fff-3ff8-4eb6-8330-36207c0b7cdc	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
117	\N	1	2026-08-28 15:08:31.738745	2026-08-28 15:08:31.738745	321bd883-9731-4613-b25d-79946a7cdf45	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
118	\N	1	2026-08-28 15:08:31.743448	2026-08-28 15:08:31.743448	2d7fb27b-48ef-4dc6-9eec-7759ef04bcd3	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
119	\N	1	2026-08-28 15:08:31.74885	2026-08-28 15:08:31.74885	9ed00097-679f-4aa1-ab02-0b0c2d4879b9	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
120	\N	1	2026-08-28 15:08:31.754478	2026-08-28 15:08:31.754478	795d797d-92b2-49d8-8448-aa217728449f	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
121	\N	1	2026-08-28 15:08:31.758729	2026-08-28 15:08:31.758729	6468973d-2641-4ffe-a8e5-99ab53554cb8	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
122	\N	1	2026-08-28 15:08:31.762464	2026-08-28 15:08:31.762464	949abb44-66d6-4f1f-b347-563f1beebb65	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
123	\N	1	2026-08-28 15:08:31.766532	2026-08-28 15:08:31.766532	b9849e98-1725-4183-998d-d30942ec6526	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
124	\N	1	2026-08-28 15:08:31.771351	2026-08-28 15:08:31.771351	5e297f3e-a7d5-43a0-8cae-7b1e6efc73db	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
125	\N	1	2026-08-28 15:08:31.775353	2026-08-28 15:08:31.775353	a1fd6a78-da1b-43dd-8f41-651caedd1060	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
126	\N	1	2026-08-28 15:08:31.779932	2026-08-28 15:08:31.779932	909f7474-e826-4971-b3c8-c723b41903ff	b23b10c6-caee-4b71-a496-92be8f5a37c0	a3208082-123d-45ce-a563-fb1e4f4776b4	\N	t	\N	\N	\N	\N	\N	\N
127	\N	1	2026-08-28 15:08:31.784702	2026-08-28 15:08:31.784702	dc225c07-5ad3-441e-9bf5-eafdb59ded77	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
128	\N	1	2026-08-28 15:08:31.788815	2026-08-28 15:08:31.788815	025738bb-799e-45ac-b472-3e42e44848ef	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
129	\N	1	2026-08-28 15:08:31.793905	2026-08-28 15:08:31.793905	6b33d2e2-00f4-486a-9df5-62b24a0a25da	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
130	\N	1	2026-08-28 15:08:31.799535	2026-08-28 15:08:31.799535	141749b1-78ad-41c6-9ba0-c8675bf41fdb	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
131	\N	1	2026-08-28 15:08:31.80335	2026-08-28 15:08:31.80335	64d0a800-7558-454d-b4e6-158efe77554b	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
132	\N	1	2026-08-28 15:08:31.807453	2026-08-28 15:08:31.807453	386fe062-fb7c-45f5-a2ec-a4ad23715aac	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
133	\N	1	2026-08-28 15:08:31.811587	2026-08-28 15:08:31.811587	3988e2a7-db08-4396-82bd-93ae9f3afa0a	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
134	\N	1	2026-08-28 15:08:31.815237	2026-08-28 15:08:31.815237	ae78defa-e65b-466b-8792-4fcc1a37f87b	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
135	\N	1	2026-08-28 15:08:31.820861	2026-08-28 15:08:31.820861	1ab249c4-1bba-4b09-9add-1ef65f0fb9c0	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
136	\N	1	2026-08-28 15:08:31.824548	2026-08-28 15:08:31.824548	650797cd-592b-43b0-b4bf-310d4c61d0e4	b23b10c6-caee-4b71-a496-92be8f5a37c0	83104a52-54b7-4468-abdf-548e81d458b6	\N	t	\N	\N	\N	\N	\N	\N
137	\N	1	2026-08-28 15:08:31.82835	2026-08-28 15:08:31.82835	62f815ec-3664-40ea-8b3b-abeaf77fb652	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
138	\N	1	2026-08-28 15:08:31.832359	2026-08-28 15:08:31.832359	2e525f16-81fa-40b5-80ba-9f6829cc9151	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
139	\N	1	2026-08-28 15:08:31.836635	2026-08-28 15:08:31.836635	649d6a24-aabb-4d36-a9aa-e1ad3e68355e	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
140	\N	1	2026-08-28 15:08:31.840567	2026-08-28 15:08:31.840567	6ea7e44b-940d-4f73-bca7-9b15df02bc94	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
141	\N	1	2026-08-28 15:08:31.844417	2026-08-28 15:08:31.844417	36facb1e-ef70-4e91-b67a-2ecb1360bff7	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
142	\N	1	2026-08-28 15:08:31.851595	2026-08-28 15:08:31.851595	e3ec5473-a0af-4a94-a9ca-74dc52460cea	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
143	\N	1	2026-08-28 15:08:31.85586	2026-08-28 15:08:31.85586	a91bef01-6975-49f4-92cf-1bdf84318261	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
144	\N	1	2026-08-28 15:08:31.860558	2026-08-28 15:08:31.860558	72dc3ea4-de05-41ea-9eb2-f4ece85d466e	b23b10c6-caee-4b71-a496-92be8f5a37c0	c0e50193-27a7-4a5c-b3e3-c14a4264af11	\N	t	\N	\N	\N	\N	\N	\N
145	\N	1	2026-08-28 15:08:31.864473	2026-08-28 15:08:31.864473	037ea71b-8d82-4d83-840a-c3acab963bcb	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
146	\N	1	2026-08-28 15:08:31.86957	2026-08-28 15:08:31.86957	bf185053-612c-4ded-a266-83faa0bd6733	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
147	\N	1	2026-08-28 15:08:31.872959	2026-08-28 15:08:31.872959	ae9a5c38-f300-47bb-aa1e-fb7861bc029c	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
148	\N	1	2026-08-28 15:08:31.876333	2026-08-28 15:08:31.876333	5b83b625-096a-4420-833f-a2408a067761	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
149	\N	1	2026-08-28 15:08:31.880075	2026-08-28 15:08:31.880075	71d7faad-c7b0-4c3e-a8b0-e3544d7a3332	b23b10c6-caee-4b71-a496-92be8f5a37c0	602b7284-620b-431b-860b-6ff79255a1b5	\N	f	\N	\N	\N	\N	\N	\N
150	\N	1	2026-08-28 15:08:31.883609	2026-08-28 15:08:31.883609	1382fd60-16fe-44c9-8650-88e4cf539963	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
151	\N	1	2026-08-28 15:08:31.909461	2026-08-28 15:08:31.909461	c1884ef3-7ad6-4835-b72e-ce46ebf2104e	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
152	\N	1	2026-08-28 15:08:31.914747	2026-08-28 15:08:31.914747	8a696baa-046b-4ce8-86a2-900ae1951d78	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
153	\N	1	2026-08-28 15:08:31.918347	2026-08-28 15:08:31.918347	6f6be5c1-b5d9-48a0-9dde-2e613f513152	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
154	\N	1	2026-08-28 15:08:31.922549	2026-08-28 15:08:31.922549	4c42c9b4-d496-4627-9c26-7e1fa0b0ddfb	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
155	\N	1	2026-08-28 15:08:31.926591	2026-08-28 15:08:31.926591	60462ab6-7d40-4c0a-a003-c73c1d1aa72f	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
156	\N	1	2026-08-28 15:08:31.931624	2026-08-28 15:08:31.931624	f740d517-7a80-411e-84da-05a374ab9992	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
157	\N	1	2026-08-28 15:08:31.935207	2026-08-28 15:08:31.935207	e47181f8-1bb1-479f-b308-2d2e55481be7	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
158	\N	1	2026-08-28 15:08:31.939336	2026-08-28 15:08:31.939336	f402c3d1-d2b1-4068-8f82-4be64f9047ca	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
159	\N	1	2026-08-28 15:08:31.942626	2026-08-28 15:08:31.942626	e5cc0fb9-5625-4e94-a0a6-1385a1fbe88a	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
160	\N	1	2026-08-28 15:08:31.947252	2026-08-28 15:08:31.947252	e3e1cf36-3fb1-4f81-bd6b-99639bf0af0b	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
161	\N	1	2026-08-28 15:08:31.950526	2026-08-28 15:08:31.950526	3289435b-82ad-4ec3-a615-05ce620ca1da	b23b10c6-caee-4b71-a496-92be8f5a37c0	35bb1dc7-71e5-43ff-8d1a-099a9e82807a	\N	f	\N	\N	\N	\N	\N	\N
162	\N	1	2026-08-28 15:08:32.119501	2026-08-28 15:08:32.119501	f32b4f60-84bb-4826-a76f-673df6f9e1fd	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
163	\N	1	2026-08-28 15:08:32.123156	2026-08-28 15:08:32.123156	f03e9e3e-0c8a-4504-97c1-591928282e5e	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
164	\N	1	2026-08-28 15:08:32.12604	2026-08-28 15:08:32.12604	c9f5ec73-3e44-405b-b283-18f58611fd3e	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
165	\N	1	2026-08-28 15:08:32.12936	2026-08-28 15:08:32.12936	fa32b9ce-7340-4541-827e-c6648ca103bd	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
166	\N	1	2026-08-28 15:08:32.132324	2026-08-28 15:08:32.132324	063e19fb-70dd-4273-a130-e02e677b4396	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
167	\N	1	2026-08-28 15:08:32.135538	2026-08-28 15:08:32.135538	93349544-04bd-4ab9-a4c3-ee14f2c55558	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
168	\N	1	2026-08-28 15:08:32.138737	2026-08-28 15:08:32.138737	45f9668a-0863-46d9-9ed4-65b14d7fc118	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
169	\N	1	2026-08-28 15:08:32.141648	2026-08-28 15:08:32.141648	49d7f99a-ec8e-4238-abb8-41979f2bd638	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
170	\N	1	2026-08-28 15:08:32.145393	2026-08-28 15:08:32.145393	a21fb875-af7c-471c-9a96-6bef2ff01f15	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
171	\N	1	2026-08-28 15:08:32.149587	2026-08-28 15:08:32.149587	c195cf83-ff59-4ab7-92ac-2fed30520f1a	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
172	\N	1	2026-08-28 15:08:32.154194	2026-08-28 15:08:32.154194	27e3a93e-8f43-4c6e-8b40-b860c02250fb	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
173	\N	1	2026-08-28 15:08:32.15745	2026-08-28 15:08:32.15745	50344692-9443-49c6-bc14-b25e4a30a835	f3cade5e-ea10-4b75-be3c-a3797f4d48d0	f3bb2df4-eeff-443d-9923-817725e81e60	\N	f	\N	\N	\N	\N	\N	\N
162	1	0	2026-08-28 15:08:32.232069	2026-08-28 15:08:32.232069	647e59f5-87b2-40b3-ad61-718f69efc895	96c5857f-932a-4b78-9445-8485f0b25244	4b7387aa-2773-49e8-a844-af7e841665ea	\N	f	\N	\N	\N	\N	\N	\N
162	2	0	2026-08-28 15:08:32.233287	2026-08-28 15:08:32.233287	d47b3058-a1ef-4a13-98bf-c84ebd6d4e2f	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
162	3	0	2026-08-28 15:08:32.234924	2026-08-28 15:08:32.234924	41c96c79-8853-45de-81f7-3e5109ca873c	96c5857f-932a-4b78-9445-8485f0b25244	63e0212f-dbff-4c53-98e9-dbb3cd183c0e	\N	f	\N	\N	\N	\N	\N	\N
163	1	0	2026-08-28 15:08:32.235986	2026-08-28 15:08:32.235986	df2c130c-164e-474d-8c34-f18919c84c26	96c5857f-932a-4b78-9445-8485f0b25244	4b7387aa-2773-49e8-a844-af7e841665ea	\N	f	\N	\N	\N	\N	\N	\N
163	2	0	2026-08-28 15:08:32.236918	2026-08-28 15:08:32.236918	ea785e4b-728d-403e-91d1-8525d93eae67	96c5857f-932a-4b78-9445-8485f0b25244	c197fc84-fbc6-4cf7-800d-243e24e1bd5e	\N	f	\N	\N	\N	\N	\N	\N
163	3	0	2026-08-28 15:08:32.237843	2026-08-28 15:08:32.237843	38fc6cef-6767-4a67-ba8b-3b3fe749b84a	96c5857f-932a-4b78-9445-8485f0b25244	63e0212f-dbff-4c53-98e9-dbb3cd183c0e	\N	f	\N	\N	\N	\N	\N	\N
164	1	0	2026-08-28 15:08:32.23912	2026-08-28 15:08:32.23912	41f4b545-085f-48b8-b11e-aa3db85a23ec	96c5857f-932a-4b78-9445-8485f0b25244	7da22c21-80c9-4c16-a2d4-5d1990ad0db2	\N	f	\N	\N	\N	\N	\N	\N
164	2	0	2026-08-28 15:08:32.240095	2026-08-28 15:08:32.240095	99aa3e09-ca7e-4055-b64a-bac3fb7dd777	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
164	3	0	2026-08-28 15:08:32.241072	2026-08-28 15:08:32.241072	59299474-150b-413d-952d-9c5d50b81190	96c5857f-932a-4b78-9445-8485f0b25244	79ae1f85-f5d0-40ef-a690-02831ba41aad	\N	f	\N	\N	\N	\N	\N	\N
165	1	0	2026-08-28 15:08:32.242193	2026-08-28 15:08:32.242193	09d35d20-1ac0-439e-8907-b5afbe548559	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
165	2	0	2026-08-28 15:08:32.243232	2026-08-28 15:08:32.243232	bbbab1b0-3f41-46ef-82a3-c0e765562a65	96c5857f-932a-4b78-9445-8485f0b25244	4b7387aa-2773-49e8-a844-af7e841665ea	\N	f	\N	\N	\N	\N	\N	\N
165	3	0	2026-08-28 15:08:32.244302	2026-08-28 15:08:32.244302	30119028-0b46-40e9-8542-4004c1ec7b51	96c5857f-932a-4b78-9445-8485f0b25244	c197fc84-fbc6-4cf7-800d-243e24e1bd5e	\N	f	\N	\N	\N	\N	\N	\N
166	1	0	2026-08-28 15:08:32.245519	2026-08-28 15:08:32.245519	37252ba8-6037-46f5-a4e1-017da8a2f903	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
166	2	0	2026-08-28 15:08:32.246784	2026-08-28 15:08:32.246784	3ad5b9ec-dae6-4958-b692-753d6dcf5991	96c5857f-932a-4b78-9445-8485f0b25244	c78bafe6-2072-429e-a176-50a64990b770	\N	f	\N	\N	\N	\N	\N	\N
166	3	0	2026-08-28 15:08:32.247943	2026-08-28 15:08:32.247943	52371fe4-4e91-4032-9cdf-615b7097d734	96c5857f-932a-4b78-9445-8485f0b25244	dace82ab-2dee-4ce0-bc15-3a8a429ff796	\N	f	\N	\N	\N	\N	\N	\N
167	1	0	2026-08-28 15:08:32.249018	2026-08-28 15:08:32.249018	77f4479e-d590-447c-a524-b5e84ceb5d5b	96c5857f-932a-4b78-9445-8485f0b25244	4b7387aa-2773-49e8-a844-af7e841665ea	\N	f	\N	\N	\N	\N	\N	\N
167	2	0	2026-08-28 15:08:32.250119	2026-08-28 15:08:32.250119	0e92322e-685d-40c2-842a-b50dc5506e47	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
167	3	0	2026-08-28 15:08:32.251112	2026-08-28 15:08:32.251112	4c3f3db9-4d50-45e8-8735-56af4e1036a8	96c5857f-932a-4b78-9445-8485f0b25244	79ae1f85-f5d0-40ef-a690-02831ba41aad	\N	f	\N	\N	\N	\N	\N	\N
168	1	0	2026-08-28 15:08:32.252281	2026-08-28 15:08:32.252281	129b241a-c1e4-4fbc-9350-22c54a713f52	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
168	2	0	2026-08-28 15:08:32.253392	2026-08-28 15:08:32.253392	1704b76a-3918-43a5-b5ad-4b2eab045fca	96c5857f-932a-4b78-9445-8485f0b25244	79ae1f85-f5d0-40ef-a690-02831ba41aad	\N	f	\N	\N	\N	\N	\N	\N
168	3	0	2026-08-28 15:08:32.254353	2026-08-28 15:08:32.254353	7dcf01d4-c4ee-40c5-ae92-729f416ae784	96c5857f-932a-4b78-9445-8485f0b25244	c197fc84-fbc6-4cf7-800d-243e24e1bd5e	\N	f	\N	\N	\N	\N	\N	\N
169	1	0	2026-08-28 15:08:32.255366	2026-08-28 15:08:32.255366	823248fb-44e0-4ad9-aff5-4cf0f16602fe	96c5857f-932a-4b78-9445-8485f0b25244	4b7387aa-2773-49e8-a844-af7e841665ea	\N	f	\N	\N	\N	\N	\N	\N
169	2	0	2026-08-28 15:08:32.256285	2026-08-28 15:08:32.256285	0bf9ad7b-5489-4ce5-ac7d-0d0ed00a6ea7	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
169	3	0	2026-08-28 15:08:32.257359	2026-08-28 15:08:32.257359	6dfd6afc-b569-432e-ae53-fc0ded9d695b	96c5857f-932a-4b78-9445-8485f0b25244	7da22c21-80c9-4c16-a2d4-5d1990ad0db2	\N	f	\N	\N	\N	\N	\N	\N
170	1	0	2026-08-28 15:08:32.258302	2026-08-28 15:08:32.258302	e90b4e19-3bee-4558-b9cc-f2ed2cc8511c	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
170	2	0	2026-08-28 15:08:32.259374	2026-08-28 15:08:32.259374	50b6c7f8-3de5-43c5-b23b-7022a01d0924	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
170	3	0	2026-08-28 15:08:32.260658	2026-08-28 15:08:32.260658	55cecbc1-f73e-4409-b229-e6621cb6fb31	96c5857f-932a-4b78-9445-8485f0b25244	dace82ab-2dee-4ce0-bc15-3a8a429ff796	\N	f	\N	\N	\N	\N	\N	\N
171	1	0	2026-08-28 15:08:32.26175	2026-08-28 15:08:32.26175	167f4dfb-a907-4355-8bf0-3536e9e2548b	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
171	2	0	2026-08-28 15:08:32.263094	2026-08-28 15:08:32.263094	721f27f6-6867-408d-b03f-cb848eaea419	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
171	3	0	2026-08-28 15:08:32.264218	2026-08-28 15:08:32.264218	9edf9ed9-56d3-4572-bf81-5d49f2c22ba1	96c5857f-932a-4b78-9445-8485f0b25244	c78bafe6-2072-429e-a176-50a64990b770	\N	f	\N	\N	\N	\N	\N	\N
172	1	0	2026-08-28 15:08:32.265383	2026-08-28 15:08:32.265383	5dd19b14-b465-43d0-a159-748606cefcc9	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
172	2	0	2026-08-28 15:08:32.267085	2026-08-28 15:08:32.267085	8eb12c2c-c107-4b51-8933-8018abcd70b0	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
172	3	0	2026-08-28 15:08:32.268502	2026-08-28 15:08:32.268502	40c5ac2d-f05e-4320-9615-f801184b4add	96c5857f-932a-4b78-9445-8485f0b25244	63e0212f-dbff-4c53-98e9-dbb3cd183c0e	\N	f	\N	\N	\N	\N	\N	\N
173	1	0	2026-08-28 15:08:32.270296	2026-08-28 15:08:32.270296	c876e48b-7979-44c1-85cd-5e203ce7a76b	96c5857f-932a-4b78-9445-8485f0b25244	b6343ee3-d77a-4dfb-a29a-c5a05a509b3b	\N	f	\N	\N	\N	\N	\N	\N
173	2	0	2026-08-28 15:08:32.271643	2026-08-28 15:08:32.271643	4b351a29-28dc-48dd-b0c1-06fa55fde90e	96c5857f-932a-4b78-9445-8485f0b25244	7da22c21-80c9-4c16-a2d4-5d1990ad0db2	\N	f	\N	\N	\N	\N	\N	\N
173	3	0	2026-08-28 15:08:32.272597	2026-08-28 15:08:32.272597	da0c3803-02d6-4453-bcb9-90eb9b5bc04a	96c5857f-932a-4b78-9445-8485f0b25244	63e0212f-dbff-4c53-98e9-dbb3cd183c0e	\N	f	\N	\N	\N	\N	\N	\N
174	1	0	2026-08-28 15:08:32.274096	2026-08-28 15:08:32.274096	58bf3cdc-defd-4936-b4e8-de48131552c3	96c5857f-932a-4b78-9445-8485f0b25244	2de088d0-99cd-4a46-be7e-01a0d366d17f	\N	f	\N	\N	\N	\N	\N	\N
174	2	0	2026-08-28 15:08:32.275054	2026-08-28 15:08:32.275054	470746ee-e673-4241-9964-de1ae8dd9338	96c5857f-932a-4b78-9445-8485f0b25244	a11485e0-5ba0-422b-a662-cb0c88c16175	\N	f	\N	\N	\N	\N	\N	\N
174	3	0	2026-08-28 15:08:32.276179	2026-08-28 15:08:32.276179	486a5c6e-6785-4368-9a85-9a4c07c2fac8	96c5857f-932a-4b78-9445-8485f0b25244	dace82ab-2dee-4ce0-bc15-3a8a429ff796	\N	f	\N	\N	\N	\N	\N	\N
175	1	0	2026-08-28 15:08:32.277934	2026-08-28 15:08:32.277934	4f398c17-04bf-4aa5-9ec0-ebf7e122ec2c	96c5857f-932a-4b78-9445-8485f0b25244	a11485e0-5ba0-422b-a662-cb0c88c16175	\N	f	\N	\N	\N	\N	\N	\N
175	2	0	2026-08-28 15:08:32.278984	2026-08-28 15:08:32.278984	3946ccd6-7d6c-4c54-9784-9c55a180a1b2	96c5857f-932a-4b78-9445-8485f0b25244	c78bafe6-2072-429e-a176-50a64990b770	\N	f	\N	\N	\N	\N	\N	\N
175	3	0	2026-08-28 15:08:32.279929	2026-08-28 15:08:32.279929	a78483d1-80e3-4293-91be-92b673f47859	96c5857f-932a-4b78-9445-8485f0b25244	76c50ff1-5e27-4fb3-b85d-4517c550f65a	\N	f	\N	\N	\N	\N	\N	\N
176	\N	1	2026-08-28 15:08:32.288314	2026-08-28 15:08:32.288314	948a9d32-cc1a-4511-bfe5-da0672914ca1	c66974da-cdfe-45c1-92b2-456a49dd392d	d970dbb8-a967-469c-91c4-673793afacef	\N	f	\N	\N	\N	\N	\N	\N
177	\N	1	2026-08-28 15:08:32.290507	2026-08-28 15:08:32.290507	2cca1b2e-f872-416f-a12d-68c70f7b1263	c66974da-cdfe-45c1-92b2-456a49dd392d	d970dbb8-a967-469c-91c4-673793afacef	\N	f	\N	\N	\N	\N	\N	\N
178	\N	1	2026-08-28 15:08:32.295751	2026-08-28 15:08:32.295751	5e4b0b65-c212-4bd4-81b6-89054c238736	c66974da-cdfe-45c1-92b2-456a49dd392d	d970dbb8-a967-469c-91c4-673793afacef	\N	f	\N	\N	\N	\N	\N	\N
179	\N	1	2026-08-28 15:08:32.297764	2026-08-28 15:08:32.297764	771ddece-a456-4088-b21d-87081d9fa0f4	c66974da-cdfe-45c1-92b2-456a49dd392d	d970dbb8-a967-469c-91c4-673793afacef	\N	f	\N	\N	\N	\N	\N	\N
180	\N	1	2026-08-28 15:08:32.300341	2026-08-28 15:08:32.300341	bcb98e1d-352c-4ac2-ada7-1d25d3d819a1	c66974da-cdfe-45c1-92b2-456a49dd392d	d970dbb8-a967-469c-91c4-673793afacef	\N	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 4854 (class 0 OID 9663965)
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
-- TOC entry 4856 (class 0 OID 9663972)
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
-- TOC entry 4857 (class 0 OID 9663978)
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
-- TOC entry 4859 (class 0 OID 9663985)
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
-- TOC entry 4861 (class 0 OID 9663994)
-- Dependencies: 325
-- Data for Name: speaker_talk_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.speaker_talk_joins (id, talk_id, speaker_id, created_at, updated_at, source_campaign_id) FROM stdin;
1	1	5	2022-08-05 13:27:59.320402	2022-08-05 13:27:59.320402	\N
2	1	6	2022-08-05 13:31:37.207743	2022-08-05 13:31:37.207743	\N
3	2	5	2025-07-15 12:11:14.651103	2025-07-15 12:11:14.651103	\N
4	2	6	2025-07-15 12:11:39.202251	2025-07-15 12:11:39.202251	\N
5	3	7	2025-07-15 12:11:58.989642	2025-07-15 12:11:58.989642	\N
16	11	46	2026-08-28 15:08:31.085405	2026-08-28 15:08:31.085405	099ac67d-2bdb-4bc7-902c-54f400285823
17	10	55	2026-08-28 15:08:31.093229	2026-08-28 15:08:31.093229	099ac67d-2bdb-4bc7-902c-54f400285823
18	7	49	2026-08-28 15:08:31.097675	2026-08-28 15:08:31.097675	099ac67d-2bdb-4bc7-902c-54f400285823
19	6	52	2026-08-28 15:08:31.102587	2026-08-28 15:08:31.102587	099ac67d-2bdb-4bc7-902c-54f400285823
20	13	56	2026-08-28 15:08:31.105984	2026-08-28 15:08:31.105984	099ac67d-2bdb-4bc7-902c-54f400285823
21	8	51	2026-08-28 15:08:31.111859	2026-08-28 15:08:31.111859	099ac67d-2bdb-4bc7-902c-54f400285823
22	5	57	2026-08-28 15:08:31.117041	2026-08-28 15:08:31.117041	099ac67d-2bdb-4bc7-902c-54f400285823
23	14	50	2026-08-28 15:08:31.120874	2026-08-28 15:08:31.120874	099ac67d-2bdb-4bc7-902c-54f400285823
24	9	47	2026-08-28 15:08:31.12607	2026-08-28 15:08:31.12607	099ac67d-2bdb-4bc7-902c-54f400285823
25	12	53	2026-08-28 15:08:31.130044	2026-08-28 15:08:31.130044	099ac67d-2bdb-4bc7-902c-54f400285823
\.


--
-- TOC entry 4863 (class 0 OID 9664003)
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
-- TOC entry 4865 (class 0 OID 9664014)
-- Dependencies: 329
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subjects (id, created_at, updated_at) FROM stdin;
1	2020-07-24 13:10:54.791691	2020-07-24 13:10:54.791691
2	2020-07-24 13:11:31.484615	2020-07-24 13:11:31.484615
\.


--
-- TOC entry 4867 (class 0 OID 9664021)
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
\.


--
-- TOC entry 4868 (class 0 OID 9664033)
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
-- TOC entry 4870 (class 0 OID 9664040)
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
-- TOC entry 4872 (class 0 OID 9664049)
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
5	30	2026-08-26 19:48:21.088138	2026-08-28 15:08:30.66648	Demo Talk 1	1	\N	{}	\N	f	1	f	0
6	30	2026-08-26 19:48:21.121654	2026-08-28 15:08:30.678109	Demo Talk 2	2	\N	{}	\N	f	1	f	0
7	30	2026-08-26 19:48:21.128718	2026-08-28 15:08:30.700103	Demo Talk 3	3	\N	{}	\N	f	1	f	0
8	30	2026-08-26 19:48:21.133048	2026-08-28 15:08:30.703198	Demo Talk 4	4	\N	{}	\N	f	1	f	0
9	30	2026-08-26 19:48:21.139088	2026-08-28 15:08:30.70777	Demo Talk 5	5	\N	{}	\N	f	1	f	0
10	30	2026-08-26 19:48:21.146787	2026-08-28 15:08:30.711578	Demo Talk 6	6	\N	{}	\N	f	1	f	0
11	30	2026-08-26 19:48:21.152863	2026-08-28 15:08:30.715101	Demo Talk 7	7	\N	{}	\N	f	1	f	0
12	30	2026-08-26 19:48:21.159243	2026-08-28 15:08:30.724322	Demo Talk 8	8	\N	{}	\N	f	1	f	0
13	30	2026-08-26 19:48:21.164837	2026-08-28 15:08:30.727724	Demo Talk 9	9	\N	{}	\N	f	1	f	0
14	30	2026-08-26 19:48:21.170807	2026-08-28 15:08:30.732333	Demo Talk 10	10	\N	{}	\N	f	1	f	0
15	31	2026-08-26 19:49:11.035361	2026-08-26 19:49:11.035361	Wilhelm Tell	1	\N	{2026-01-02}	\N	f	1	t	0
16	31	2026-08-26 19:49:11.04881	2026-08-26 19:49:11.04881	Biedermann und die Brandstifter	2	\N	{2026-05-08}	\N	f	1	t	0
17	31	2026-08-26 19:49:11.053573	2026-08-26 19:49:11.053573	Frühlings Erwachen	3	\N	{2026-12-15}	\N	f	1	t	0
18	31	2026-08-26 19:49:11.056668	2026-08-26 19:49:11.056668	Minna von Barnhelm	4	\N	{2026-12-17}	\N	f	1	t	0
19	31	2026-08-26 19:49:11.059849	2026-08-26 19:49:11.059849	Der zerbrochene Krug	5	\N	{2026-11-08}	\N	f	1	t	0
20	31	2026-08-26 19:49:11.064114	2026-08-26 19:49:11.064114	Romulus der Große	6	\N	{2026-06-12}	\N	f	1	t	0
21	31	2026-08-26 19:49:11.069439	2026-08-26 19:49:11.069439	Bekenntnisse des Hochstaplers Felix Krull	7	\N	{2026-10-07}	\N	f	1	t	0
22	31	2026-08-26 19:49:11.073455	2026-08-26 19:49:11.073455	Unterhaltungen deutscher Ausgewanderten	8	\N	{2026-05-10}	\N	f	1	t	0
23	31	2026-08-26 19:49:11.076549	2026-08-26 19:49:11.076549	Winnetou II	9	\N	{2026-10-28}	\N	f	1	t	0
24	31	2026-08-26 19:49:11.081414	2026-08-26 19:49:11.081414	Stolz und Vorurteil	10	\N	{2026-08-22}	\N	f	1	t	0
25	31	2026-08-26 19:49:11.087856	2026-08-26 19:49:11.087856	Fabian	11	\N	{2026-12-24}	\N	f	1	t	0
26	31	2026-08-26 19:49:11.091936	2026-08-26 19:49:11.091936	Also sprach Zarathustra	12	\N	{2026-12-11}	\N	f	1	t	0
43	31	2026-08-28 15:08:32.172469	2026-08-28 15:08:32.172469	Das Boot	13	\N	{2026-12-02}	\N	f	1	f	0
44	31	2026-08-28 15:08:32.190188	2026-08-28 15:08:32.190188	Stolz und Vorurteil	14	\N	{2026-01-24}	\N	f	1	f	0
45	31	2026-08-28 15:08:32.193892	2026-08-28 15:08:32.193892	Effi Briest	15	\N	{2026-07-24}	\N	f	1	f	0
46	31	2026-08-28 15:08:32.197477	2026-08-28 15:08:32.197477	Der grüne Heinrich	16	\N	{2026-05-27}	\N	f	1	f	0
47	31	2026-08-28 15:08:32.200895	2026-08-28 15:08:32.200895	Der Vorleser	17	\N	{2026-12-01}	\N	f	1	f	0
48	31	2026-08-28 15:08:32.204754	2026-08-28 15:08:32.204754	Der eiserne Gustav	18	\N	{2026-10-29}	\N	f	1	f	0
49	31	2026-08-28 15:08:32.208379	2026-08-28 15:08:32.208379	Helden wie wir	19	\N	{2026-07-02}	\N	f	1	f	0
50	31	2026-08-28 15:08:32.211082	2026-08-28 15:08:32.211082	Das Versprechen	20	\N	{2026-05-23}	\N	f	1	f	0
51	31	2026-08-28 15:08:32.215141	2026-08-28 15:08:32.215141	Lenz	21	\N	{2026-05-13}	\N	f	1	f	0
52	31	2026-08-28 15:08:32.217816	2026-08-28 15:08:32.217816	Woyzeck	22	\N	{2026-12-14}	\N	f	1	f	0
53	31	2026-08-28 15:08:32.220762	2026-08-28 15:08:32.220762	Der Mann ohne Eigenschaften	23	\N	{2026-05-05}	\N	f	1	f	0
54	31	2026-08-28 15:08:32.223513	2026-08-28 15:08:32.223513	Mephisto	24	\N	{2026-05-05}	\N	f	1	f	0
27	36	2026-08-26 19:49:15.474802	2026-08-26 19:49:15.474802	Die Leiden des jungen Werther 3904	1	\N	{2026-12-31}	\N	f	\N	t	0
28	36	2026-08-26 19:49:15.481879	2026-08-26 19:49:15.481879	Das kalte Herz 2239	2	\N	{2026-04-22}	\N	f	\N	t	0
29	36	2026-08-26 19:49:15.489396	2026-08-26 19:49:15.489396	Unterhaltungen deutscher Ausgewanderten 8114	3	\N	{2026-09-18}	\N	f	\N	t	0
30	36	2026-08-26 19:49:15.494567	2026-08-26 19:49:15.494567	Über das Studium der griechischen Poesie 4864	4	\N	{2026-04-21}	\N	f	\N	t	0
31	36	2026-08-26 19:49:15.500548	2026-08-26 19:49:15.500548	Till Eulenspiegel 115	5	\N	{2026-02-24}	\N	f	\N	t	0
32	36	2026-08-26 19:49:15.512155	2026-08-26 19:49:15.512155	Das Marmorbild 8163	6	\N	{2026-12-06}	\N	f	\N	t	0
33	36	2026-08-26 19:49:15.517929	2026-08-26 19:49:15.517929	Der Vorleser 9804	7	\N	{2026-12-02}	\N	f	\N	t	0
34	36	2026-08-26 19:49:15.52468	2026-08-26 19:49:15.52468	Effi Briest 8041	8	\N	{2026-09-12}	\N	f	\N	t	0
\.


--
-- TOC entry 4874 (class 0 OID 9664065)
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
-- TOC entry 4876 (class 0 OID 9664075)
-- Dependencies: 340
-- Data for Name: thredded_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_categories (id, messageboard_id, name, description, created_at, updated_at, slug) FROM stdin;
\.


--
-- TOC entry 4878 (class 0 OID 9664087)
-- Dependencies: 342
-- Data for Name: thredded_messageboard_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_groups (id, name, "position", created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4880 (class 0 OID 9664097)
-- Dependencies: 344
-- Data for Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_notifications_for_followed_topics (id, user_id, messageboard_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4882 (class 0 OID 9664107)
-- Dependencies: 346
-- Data for Name: thredded_messageboard_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_users (id, thredded_user_detail_id, thredded_messageboard_id, last_seen_at) FROM stdin;
1	1	1	2020-07-24 15:13:57.225997
\.


--
-- TOC entry 4884 (class 0 OID 9664115)
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
-- TOC entry 4886 (class 0 OID 9664130)
-- Dependencies: 350
-- Data for Name: thredded_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_followed_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4888 (class 0 OID 9664139)
-- Dependencies: 352
-- Data for Name: thredded_notifications_for_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_private_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 9664148)
-- Dependencies: 354
-- Data for Name: thredded_post_moderation_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_post_moderation_records (id, post_id, messageboard_id, post_content, post_user_id, post_user_name, moderator_id, moderation_state, previous_moderation_state, created_at) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 9664158)
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
-- TOC entry 4894 (class 0 OID 9664171)
-- Dependencies: 358
-- Data for Name: thredded_private_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_posts (id, user_id, content, postable_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4896 (class 0 OID 9664181)
-- Dependencies: 360
-- Data for Name: thredded_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_topics (id, user_id, last_user_id, title, slug, posts_count, hash_id, last_post_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 9664194)
-- Dependencies: 362
-- Data for Name: thredded_private_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_users (id, private_topic_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 9664201)
-- Dependencies: 364
-- Data for Name: thredded_topic_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topic_categories (id, topic_id, category_id) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 9664208)
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
-- TOC entry 4904 (class 0 OID 9664228)
-- Dependencies: 368
-- Data for Name: thredded_user_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_details (id, user_id, latest_activity_at, posts_count, topics_count, last_seen_at, moderation_state, moderation_state_changed_at, created_at, updated_at) FROM stdin;
3	9	\N	16	16	\N	0	\N	2026-08-26 19:49:17.084897	2026-08-26 19:49:17.084897
4	7	\N	16	0	\N	0	\N	2026-08-26 19:49:17.219565	2026-08-26 19:49:17.219565
1	2	\N	17	1	2020-07-24 15:13:57.225997	0	\N	2020-07-24 15:13:41.254846	2020-07-24 15:13:57.240353
\.


--
-- TOC entry 4906 (class 0 OID 9664240)
-- Dependencies: 370
-- Data for Name: thredded_user_messageboard_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_messageboard_preferences (id, user_id, messageboard_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4908 (class 0 OID 9664253)
-- Dependencies: 372
-- Data for Name: thredded_user_post_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_post_notifications (id, user_id, post_id, notified_at) FROM stdin;
\.


--
-- TOC entry 4910 (class 0 OID 9664261)
-- Dependencies: 374
-- Data for Name: thredded_user_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_preferences (id, user_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4912 (class 0 OID 9664273)
-- Dependencies: 376
-- Data for Name: thredded_user_private_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_private_topic_read_states (id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
\.


--
-- TOC entry 4914 (class 0 OID 9664287)
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
-- TOC entry 4916 (class 0 OID 9664295)
-- Dependencies: 380
-- Data for Name: thredded_user_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_read_states (id, messageboard_id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
1	1	2	1	0	1	0	2020-07-24 15:13:56.535875
\.


--
-- TOC entry 4918 (class 0 OID 9664310)
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
-- TOC entry 4920 (class 0 OID 9664319)
-- Dependencies: 384
-- Data for Name: tutorial_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutorial_memberships (id, user_id, tutorial_id, source_campaign_id, created_at, updated_at, lecture_id) FROM stdin;
78cbc2c6-efe2-4eca-bb0a-7d14379a412c	15	5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.094126	2026-08-28 15:08:30.094126	1
a68c6d6c-8b26-4c6c-b3ac-de26de803530	18	5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.094126	2026-08-28 15:08:30.094126	1
afbca34e-b561-4bbe-b92a-66b252dc9842	21	5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.094126	2026-08-28 15:08:30.094126	1
cfbf8665-df13-49b8-8753-127fe10b3b0f	23	5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.094126	2026-08-28 15:08:30.094126	1
1d4ff5b4-0f0a-40d8-a412-3a98bba632b7	41	5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.094126	2026-08-28 15:08:30.094126	1
bd5ab6d5-688b-4a5a-bd78-6c6462694f19	43	5	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.094126	2026-08-28 15:08:30.094126	1
1b25bbb3-380d-4ee0-87f3-37809bed1dd3	24	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
7ef67add-13f7-4a8c-b080-8d85446740f4	25	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
6fd08fa7-69ec-4ee8-87df-de00afd55218	26	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
454bd998-ca50-4585-97b5-f3f8ae1077b7	27	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
39aa4525-97e0-4776-b245-68657f2c23b8	33	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
7a8a4719-a351-4d68-9700-333ba670bbc2	37	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
76bf8238-2c5a-49ed-b146-7a29f9d46d9e	40	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
e90d8023-88f2-45df-8136-e389eb2286e3	44	3	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.137062	2026-08-28 15:08:30.137062	1
33d556bc-426c-464d-8d28-ddec4457de0f	14	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
2eb87bf1-8337-4a0a-a6d6-12753a68e377	16	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
c2a6d82b-f40f-4e12-8d8a-5012d5488c88	17	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
770a038b-1166-44f4-a2f9-1a0f52672fe0	19	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
4ed144f5-22bc-406b-8ced-bda867ec9621	20	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
8aacd96e-7d55-414a-b609-5338ca439def	31	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
a3b918dd-fb6f-483a-b03a-81b675722ec1	34	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
1f154df4-9331-40d3-813f-69a3ff8036a0	42	4	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.147824	2026-08-28 15:08:30.147824	1
495b34bf-da29-40cc-be44-cf6c25107063	22	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
9ad3e614-c654-466f-bbf1-9df0c5d08b1a	28	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
335e3de5-e00a-43ed-8c4a-a24c05fa5b1d	29	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
63cc005c-2f44-456b-a4b2-c86fc7bcb187	30	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
e06977af-27c3-4cd3-bce8-e8046e130789	32	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
509bcb94-2983-4779-a45a-648b2c4f11fb	35	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
2df94117-7201-49df-97b3-07f9a5d7d82a	36	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
cf4f2b97-a21c-4730-9d6a-fd6c4d08a5fd	38	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
caf37264-61ee-4a58-9d5e-968f46354cca	39	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
18a7af8b-cafd-4eb2-a496-ff6cb82bcd43	45	2	0f1147a8-017c-4de2-b4be-2f2f4d2e079a	2026-08-28 15:08:30.153677	2026-08-28 15:08:30.153677	1
28769f82-0442-4ba9-ab4c-7510f4f264e4	5	1	\N	2026-08-28 15:08:33.612295	2026-08-28 15:08:33.612295	1
986599a4-563d-42dd-916d-9c2430d56016	6	1	\N	2026-08-28 15:08:33.629827	2026-08-28 15:08:33.629827	1
957e85f5-6a57-49ea-863a-e4c6595de9d5	7	1	\N	2026-08-28 15:08:33.719449	2026-08-28 15:08:33.719449	1
410083f1-cab8-4ff7-aa3f-fe1465d227e0	8	1	\N	2026-08-28 15:08:33.72863	2026-08-28 15:08:33.72863	1
e0e1a193-866b-4c61-8ed1-0166f1792357	9	1	\N	2026-08-28 15:08:33.736616	2026-08-28 15:08:33.736616	1
\.


--
-- TOC entry 4921 (class 0 OID 9664329)
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
2	Demo Tutorial 1	1	2026-08-26 19:48:06.418487	2026-08-28 15:08:29.518782	10	f	0	\N
3	Demo Tutorial 2	1	2026-08-26 19:48:06.458667	2026-08-28 15:08:29.551781	8	f	0	\N
4	Demo Tutorial 3	1	2026-08-26 19:48:06.466547	2026-08-28 15:08:29.559994	8	f	0	\N
5	Demo Tutorial 4	1	2026-08-26 19:48:06.47115	2026-08-28 15:08:29.565888	6	f	0	\N
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
\.


--
-- TOC entry 4923 (class 0 OID 9664344)
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
-- TOC entry 4925 (class 0 OID 9664353)
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
\.


--
-- TOC entry 4927 (class 0 OID 9664361)
-- Dependencies: 391
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, admin, subscription_type, consents, consented_at, name, homepage, no_notifications, locale, email_for_medium, email_for_announcement, email_for_teachable, email_for_news, current_lecture_id, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, unread_comments, email_for_submission_upload, email_for_submission_removal, email_for_submission_join, email_for_submission_leave, email_for_correction_upload, email_for_submission_decision, name_in_tutorials, archived, locked_at, image_data, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, deletion_date, failed_attempts, unlock_token, password_policy_version, password_changed_at) FROM stdin;
68	solver_user_8@example.com	$2a$11$aARd6mR2wCcqb4sYq7zWp.WGzGMY9DT5PLNLQ6Azb2kljGTKtjaxO	\N	\N	\N	2026-08-26 19:48:30.56596	2026-08-28 15:09:01.428438	f	1	t	2026-08-26 19:48:30.565921	Solver User 8	\N	f	en	\N	\N	\N	\N	\N	5vKG6hjzFBW2CypqYCoN	2026-08-26 19:48:30.567206	2026-08-26 19:48:30.565997	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:01.428259
1	admin@mampf.edu	$2a$11$pd3/OrF8gJcq5f7qT5ZGT.Kx6T9UotZ0bZK7oHSEV0YUKyXFuTLkq	\N	\N	\N	2020-07-24 13:07:48.807973	2026-08-28 15:08:37.468685	t	1	t	2020-07-24 13:07:48.811417	admin	\N	f	en	t	t	t	t	\N	UguwyiyL_B65bQkMZMQf	2020-07-24 13:07:56.770723	2020-07-24 13:07:48.808231	\N	t	f	f	f	f	f	f		\N	\N	\N	3	2025-07-15 12:02:24.48997	2025-07-14 11:35:13.666864	\N	\N	\N	0	\N	1	2026-08-28 15:08:37.467752
2	teacher@mampf.edu	$2a$11$22ZXV3GtkNDpy6LF4agFk.czpFGkeBkB11HtTuOE5/lhzw73xtFWm	\N	\N	\N	2020-07-24 13:14:59.543985	2026-08-28 15:08:37.857582	f	1	t	2020-07-24 13:14:59.547776	DozentIn	\N	f	en	t	t	t	t	\N	quSs9sq1VAMQCbDgRyhU	2020-07-24 13:15:13.670023	2020-07-24 13:14:59.544082	\N	t	f	f	f	f	f	f		\N	\N	\N	12	2025-07-15 12:03:11.254407	2025-07-15 11:59:27.082351	\N	\N	\N	0	\N	1	2026-08-28 15:08:37.857322
5	student1@mampf.edu	$2a$11$xK6x/ognudB/DADnyRMcGusJmKf2pv0.VZW/PQBWvV.ba5VLymt4i	\N	\N	\N	2020-11-28 16:25:23.437946	2026-08-28 15:08:38.21506	f	1	t	2020-11-28 16:25:23.440059	student1	\N	f	en	f	f	f	t	\N	qwPPGpBwzjn7o_NE1cMd	2020-11-28 16:25:28.248539	2020-11-28 16:25:23.438158	\N	t	t	t	t	t	t	t	Max Mustermann	\N	\N	\N	6	2025-07-15 12:12:31.120017	2025-07-15 12:10:11.284039	\N	\N	\N	0	\N	1	2026-08-28 15:08:38.214885
6	student2@mampf.edu	$2a$11$KGjNv7njlFl/IIHF3jDQ9eHN.t7fGY3DatLp2MCS7Ifk1MjXQJa.W	\N	\N	\N	2020-11-28 16:26:55.50289	2026-08-28 15:08:38.570526	f	1	t	2020-11-28 16:26:55.504637	student2	\N	f	en	t	t	t	f	\N	4DVzmJnsA4PJx9StS_Js	2020-11-28 16:27:07.826099	2020-11-28 16:26:55.502947	\N	t	f	f	f	f	f	f	Max Musterfrau	\N	\N	\N	5	2026-08-26 19:51:17.687287	2025-07-15 12:15:20.813542	\N	\N	\N	0	\N	1	2026-08-28 15:08:38.570383
7	student3@mampf.edu	$2a$11$fZHFttvXxQjT4wIderKhk.UegRCvnxwjzIwswc8MJhF5QUZGOyRFa	\N	\N	\N	2020-11-28 16:28:02.121432	2026-08-28 15:08:38.914842	f	1	t	2020-11-28 16:28:02.123082	student3	\N	f	en	t	t	t	f	\N	ZUzqyXACyQrBNVGGrWxm	2020-11-28 16:28:09.870025	2020-11-28 16:28:02.121486	\N	t	f	f	f	f	f	f	Berta Musterfrau	\N	\N	\N	3	2025-07-15 12:11:49.670511	2025-07-14 15:04:06.537713	\N	\N	\N	0	\N	1	2026-08-28 15:08:38.914682
8	student4@mampf.edu	$2a$11$xPsT7Q0oVcMBXYB26u2ATOF2kxYGsdt3hRaIDTz8.8JAZIouBqPnu	\N	\N	\N	2020-11-28 16:29:07.923841	2026-08-28 15:08:39.249014	f	1	t	2020-11-28 16:29:07.925959	student4	\N	f	en	t	t	t	f	\N	j5hzKj7ePDPVbKGJsyqx	2020-11-28 16:29:14.406097	2020-11-28 16:29:07.923915	\N	t	f	f	f	f	f	f	Berta Mustermann	\N	\N	\N	1	2025-07-14 11:29:25.560481	2025-07-14 11:29:25.560481	\N	\N	\N	0	\N	1	2026-08-28 15:08:39.248878
10	tutor@mampf.edu	$2a$11$PtvRepovvlxd87j8Vmvy6Ov27.QkbLnSx0Z/RTJeKX5uYS7PyTt32	\N	\N	\N	2020-11-28 16:34:08.325163	2026-08-28 15:08:39.927911	f	1	t	2020-11-28 16:34:08.326859	tutor	\N	f	en	t	t	t	f	\N	dbg8mcD6CmtfAfgAfX4Q	2020-11-28 16:34:11.824042	2020-11-28 16:34:08.325214	\N	t	f	f	f	f	f	f	Benjamin Tutor	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:39.927759
13	ed@mampf.edu	$2a$11$0m6GWtpxBy8WSjbGl0notOr/zi52H/YrgTEwS9ZShNaeSHI0rP3yu	\N	\N	\N	2022-08-05 13:14:08.705536	2026-08-28 15:08:40.597148	f	1	t	2022-08-05 13:14:08.706967	ed	\N	f	en	f	f	f	f	\N	NhEfb358TxX5788uqSZy	2022-08-05 13:14:16.480332	2022-08-05 13:14:08.705583	\N	f	f	f	f	f	f	f		\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:40.596992
14	demo_lecture_student_0@example.com	$2a$11$ozuIx2MJ296BuXqjjg3xbuwyGqzsZ72itd2HwCqOaZIk.WTGqT7Zm	\N	\N	\N	2026-08-26 19:48:07.214925	2026-08-28 15:08:40.930405	f	1	t	2026-08-26 19:48:07.214846	Demo Lecture Student 0	\N	f	en	\N	\N	\N	\N	\N	z_YGpnA-TN8KnzG3sLjM	2026-08-26 19:48:07.232542	2026-08-26 19:48:07.215757	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:40.93027
15	demo_lecture_student_1@example.com	$2a$11$/fRvEdgLagWxz0lWZ3b9Q.97GoYKOjClZc.KoF8ldqYEQKiK/X6S.	\N	\N	\N	2026-08-26 19:48:07.809522	2026-08-28 15:08:41.261785	f	1	t	2026-08-26 19:48:07.809474	Demo Lecture Student 1	\N	f	en	\N	\N	\N	\N	\N	re-1t-yEsB_YZG7PHZRG	2026-08-26 19:48:07.814687	2026-08-26 19:48:07.809561	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:41.261644
16	demo_lecture_student_2@example.com	$2a$11$ym.Ceu9jEyvwZc5YDBzDuuPZyv9r0nockZD9X13zXBVfzyJa4Mc.m	\N	\N	\N	2026-08-26 19:48:08.365155	2026-08-28 15:08:41.590832	f	1	t	2026-08-26 19:48:08.365075	Demo Lecture Student 2	\N	f	en	\N	\N	\N	\N	\N	WsnLyjxV3fS7szcn-pCg	2026-08-26 19:48:08.368977	2026-08-26 19:48:08.365207	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:41.590677
17	demo_lecture_student_3@example.com	$2a$11$7nVp82.diEe6XxPvVjChsepAHFy7TFTZf8A1se7v5be238QKL0QCy	\N	\N	\N	2026-08-26 19:48:08.927997	2026-08-28 15:08:41.923485	f	1	t	2026-08-26 19:48:08.927851	Demo Lecture Student 3	\N	f	en	\N	\N	\N	\N	\N	RGXSH9EzPaLzDTrdmpLC	2026-08-26 19:48:08.929793	2026-08-26 19:48:08.928046	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:41.923347
18	demo_lecture_student_4@example.com	$2a$11$V7kYAzNG55.R3RRZC01nH.gICuxASNS6dRH8IXzkbUXL2B1RssrOK	\N	\N	\N	2026-08-26 19:48:09.342082	2026-08-28 15:08:42.252386	f	1	t	2026-08-26 19:48:09.342037	Demo Lecture Student 4	\N	f	en	\N	\N	\N	\N	\N	1xueoytYbn468cDHiK1u	2026-08-26 19:48:09.344055	2026-08-26 19:48:09.34245	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:42.252249
19	demo_lecture_student_5@example.com	$2a$11$155TgLSbpN8BM.cwg4ngc.uCmsx6xcC72F7diRCZxa8pnMbcavrjS	\N	\N	\N	2026-08-26 19:48:09.764081	2026-08-28 15:08:42.580341	f	1	t	2026-08-26 19:48:09.764032	Demo Lecture Student 5	\N	f	en	\N	\N	\N	\N	\N	GUYx_hwQbyZPxFZEkL3-	2026-08-26 19:48:09.765377	2026-08-26 19:48:09.764116	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:42.580198
20	demo_lecture_student_6@example.com	$2a$11$lKzg9DuO4u7ATobHt8HhluFGh3DOnb43yIzv0kEnYDUThtY3YNnOu	\N	\N	\N	2026-08-26 19:48:10.137806	2026-08-28 15:08:42.910628	f	1	t	2026-08-26 19:48:10.137712	Demo Lecture Student 6	\N	f	en	\N	\N	\N	\N	\N	m3ypBPiQBjEiJALpiTuV	2026-08-26 19:48:10.139577	2026-08-26 19:48:10.137847	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:42.910493
21	demo_lecture_student_7@example.com	$2a$11$xKEXYGDre8Qq49WFJtp7eurhPzZELWlLl3Mih0Zhco8P7XrTN35U.	\N	\N	\N	2026-08-26 19:48:10.558701	2026-08-28 15:08:43.238288	f	1	t	2026-08-26 19:48:10.558655	Demo Lecture Student 7	\N	f	en	\N	\N	\N	\N	\N	S-FGSsxuUC2DKDyKjzwW	2026-08-26 19:48:10.562155	2026-08-26 19:48:10.558771	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:43.23798
22	demo_lecture_student_8@example.com	$2a$11$ORHiyLhUaAMd/l33fwRhB.dMjTOHB6WvMzqwDypfk5fT1ghvTCOGq	\N	\N	\N	2026-08-26 19:48:10.941096	2026-08-28 15:08:43.566067	f	1	t	2026-08-26 19:48:10.941055	Demo Lecture Student 8	\N	f	en	\N	\N	\N	\N	\N	EDKTJ1bK8Mz7qZ6fq1wJ	2026-08-26 19:48:10.948131	2026-08-26 19:48:10.941493	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:43.565932
23	demo_lecture_student_9@example.com	$2a$11$9K6OETYROQFVVprPqmjYFOWGtFifS4F2BOBTITfqhIcuTrRwqxAnW	\N	\N	\N	2026-08-26 19:48:11.347141	2026-08-28 15:08:43.906688	f	1	t	2026-08-26 19:48:11.347018	Demo Lecture Student 9	\N	f	en	\N	\N	\N	\N	\N	dGsc8yrt12a_yNgmHFHd	2026-08-26 19:48:11.354067	2026-08-26 19:48:11.347176	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:43.906558
24	demo_lecture_student_10@example.com	$2a$11$mwXc.g.KMrqGtxEhpuQWxejmgUOgmTY/Oeeo6YvYrCpr1hoCPwOYe	\N	\N	\N	2026-08-26 19:48:11.746935	2026-08-28 15:08:44.243769	f	1	t	2026-08-26 19:48:11.746881	Demo Lecture Student 10	\N	f	en	\N	\N	\N	\N	\N	cj4USzWcz6ZBptE1PUb5	2026-08-26 19:48:11.748509	2026-08-26 19:48:11.746973	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:44.243613
25	demo_lecture_student_11@example.com	$2a$11$Es55yy376vKblvmtI2G4wu8ZcS36mmS1O09fNI/yIPWKbRpPRbcfq	\N	\N	\N	2026-08-26 19:48:12.137225	2026-08-28 15:08:44.57522	f	1	t	2026-08-26 19:48:12.13718	Demo Lecture Student 11	\N	f	en	\N	\N	\N	\N	\N	Zbx3hSYa1b7jmZbY-uDt	2026-08-26 19:48:12.138682	2026-08-26 19:48:12.137257	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:44.575086
26	demo_lecture_student_12@example.com	$2a$11$JnQbPbY8lqW3GcW5rmI20OvD7U2RRuyW10XtL7p6v4sXj05KNCGlm	\N	\N	\N	2026-08-26 19:48:12.527363	2026-08-28 15:08:44.905545	f	1	t	2026-08-26 19:48:12.527215	Demo Lecture Student 12	\N	f	en	\N	\N	\N	\N	\N	7-E77vspWzpDQkVkCzSP	2026-08-26 19:48:12.528888	2026-08-26 19:48:12.527406	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:44.905411
27	demo_lecture_student_13@example.com	$2a$11$UTpgq.aWvBaUrWlRUGY.quowu9peM9T0nmu6MBUw80ay4gYpYq9he	\N	\N	\N	2026-08-26 19:48:12.911069	2026-08-28 15:08:45.246131	f	1	t	2026-08-26 19:48:12.911027	Demo Lecture Student 13	\N	f	en	\N	\N	\N	\N	\N	p6NCVAuY8uY2mDAR5_BE	2026-08-26 19:48:12.912761	2026-08-26 19:48:12.911102	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:45.245948
28	demo_lecture_student_14@example.com	$2a$11$ro5.Ppvq6uEWf/6DlhmspewSnKTLklrUFf3QIMRNtoSnW8x3mj7Hm	\N	\N	\N	2026-08-26 19:48:13.286724	2026-08-28 15:08:45.585837	f	1	t	2026-08-26 19:48:13.286676	Demo Lecture Student 14	\N	f	en	\N	\N	\N	\N	\N	jeAXcSFAJeQZynyiv4t9	2026-08-26 19:48:13.288394	2026-08-26 19:48:13.286758	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:45.585698
29	demo_lecture_student_15@example.com	$2a$11$zeSmgtjsWiCMM94YB22KBeC5TtjmM1xWBFIbClt2GCUnkfnnRne4u	\N	\N	\N	2026-08-26 19:48:13.683043	2026-08-28 15:08:45.923263	f	1	t	2026-08-26 19:48:13.682978	Demo Lecture Student 15	\N	f	en	\N	\N	\N	\N	\N	y4hHVy2DTVZSiLG55rpk	2026-08-26 19:48:13.684784	2026-08-26 19:48:13.683105	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:45.923128
30	demo_lecture_student_16@example.com	$2a$11$kL61wtjqCLgC8zXPg0PZ0OcTDOIveNYyTQQMMxsO1V53PSwCz688O	\N	\N	\N	2026-08-26 19:48:14.060239	2026-08-28 15:08:46.261873	f	1	t	2026-08-26 19:48:14.059848	Demo Lecture Student 16	\N	f	en	\N	\N	\N	\N	\N	Y-BQdE3CRGaaNj_xcQKk	2026-08-26 19:48:14.062919	2026-08-26 19:48:14.060316	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:46.261734
31	demo_lecture_student_17@example.com	$2a$11$Bcn1Wi.rkr0wOq4oaGwJc.jRdEb53ta.FksNt59LMz9TgfJFRjqFW	\N	\N	\N	2026-08-26 19:48:14.43704	2026-08-28 15:08:46.613411	f	1	t	2026-08-26 19:48:14.436998	Demo Lecture Student 17	\N	f	en	\N	\N	\N	\N	\N	z2Ms-i3dR4DBR5qBBhVE	2026-08-26 19:48:14.438323	2026-08-26 19:48:14.437074	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:46.613275
32	demo_lecture_student_18@example.com	$2a$11$hD5GQQNGkwSK7hghT.Vn3Oxh9EGWOiuJPfKIyXiMPCmbskYfNEPLi	\N	\N	\N	2026-08-26 19:48:14.826853	2026-08-28 15:08:46.956252	f	1	t	2026-08-26 19:48:14.826811	Demo Lecture Student 18	\N	f	en	\N	\N	\N	\N	\N	zDHr7z-J5eJsvK3rY157	2026-08-26 19:48:14.828083	2026-08-26 19:48:14.826889	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:46.956109
33	demo_lecture_student_19@example.com	$2a$11$GubeDN837U9/yH.v7r3/d.p8G6/OoCwU1GqPzL807caI0hx06kvZ.	\N	\N	\N	2026-08-26 19:48:15.207163	2026-08-28 15:08:47.313448	f	1	t	2026-08-26 19:48:15.207122	Demo Lecture Student 19	\N	f	en	\N	\N	\N	\N	\N	tT8Q1maryAmpGjxRYhpM	2026-08-26 19:48:15.208569	2026-08-26 19:48:15.207195	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:47.313309
34	demo_lecture_student_20@example.com	$2a$11$ND4KPSZLwz5fEYGXSZKmpOU3SLslFpSc1oOe.a3JHiIXukkO7MWNS	\N	\N	\N	2026-08-26 19:48:15.603818	2026-08-28 15:08:47.68643	f	1	t	2026-08-26 19:48:15.603775	Demo Lecture Student 20	\N	f	en	\N	\N	\N	\N	\N	KtCvdseRBQkBAxKsRteC	2026-08-26 19:48:15.605363	2026-08-26 19:48:15.603855	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:47.686294
35	demo_lecture_student_21@example.com	$2a$11$N7643kujSXu9X/rFpUwJH.TyMeLsrcUWlZzFhu8EO.Ewb54UrjHdy	\N	\N	\N	2026-08-26 19:48:15.981463	2026-08-28 15:08:48.038445	f	1	t	2026-08-26 19:48:15.981425	Demo Lecture Student 21	\N	f	en	\N	\N	\N	\N	\N	oXyyQFqL-76ti2D2szUQ	2026-08-26 19:48:15.982649	2026-08-26 19:48:15.981495	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:48.038311
36	demo_lecture_student_22@example.com	$2a$11$HgeISFUPwdcVDi61no1TV.drpXcGn59wuGHXd2AZwFnR7nzbAD4Ou	\N	\N	\N	2026-08-26 19:48:16.36663	2026-08-28 15:08:48.384559	f	1	t	2026-08-26 19:48:16.366589	Demo Lecture Student 22	\N	f	en	\N	\N	\N	\N	\N	zoettit89ZGCM7tTfnrR	2026-08-26 19:48:16.368112	2026-08-26 19:48:16.366663	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:48.384424
37	demo_lecture_student_23@example.com	$2a$11$1N/EZsfOsBLsgxhVNNAOKurw/YT2umRdVn5VWcgRSc15k/eOcSC1K	\N	\N	\N	2026-08-26 19:48:16.756622	2026-08-28 15:08:48.722055	f	1	t	2026-08-26 19:48:16.756585	Demo Lecture Student 23	\N	f	en	\N	\N	\N	\N	\N	_wAgQVhEqW44NrFGB6Xy	2026-08-26 19:48:16.757721	2026-08-26 19:48:16.756652	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:48.721886
38	demo_lecture_student_24@example.com	$2a$11$X38AnelPq5ipOQEBW.sps.ZHR8w/dU6JqCWUuyxxiUy5Pfc5BzXMC	\N	\N	\N	2026-08-26 19:48:17.14132	2026-08-28 15:08:49.056718	f	1	t	2026-08-26 19:48:17.141284	Demo Lecture Student 24	\N	f	en	\N	\N	\N	\N	\N	-XKNd2yjpdWWZyBYxWpn	2026-08-26 19:48:17.142493	2026-08-26 19:48:17.141391	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:49.056582
39	demo_lecture_student_25@example.com	$2a$11$tRCMuqhiM1hLPTCow1/5aOoslOzWV/IOut81.F8dQVM.Xya0fFUnS	\N	\N	\N	2026-08-26 19:48:17.524694	2026-08-28 15:08:49.392422	f	1	t	2026-08-26 19:48:17.524023	Demo Lecture Student 25	\N	f	en	\N	\N	\N	\N	\N	1RTXpByHFusEMN-n9xkC	2026-08-26 19:48:17.526235	2026-08-26 19:48:17.524735	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:49.392276
40	demo_lecture_student_26@example.com	$2a$11$/yaRV3bgoTvLPaPbQBmcReu.LjP4ZLufz8uaAiLZSKvkyYX7kOOBC	\N	\N	\N	2026-08-26 19:48:17.904308	2026-08-28 15:08:49.758132	f	1	t	2026-08-26 19:48:17.90427	Demo Lecture Student 26	\N	f	en	\N	\N	\N	\N	\N	_y4iBrf1_A5FDwNmvtov	2026-08-26 19:48:17.905466	2026-08-26 19:48:17.904339	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:49.757996
41	demo_lecture_student_27@example.com	$2a$11$dxIvyKeieBzNpW5ceXxge.i/484sI9igIBDTOVMJ5Nbkk8WvHzO0C	\N	\N	\N	2026-08-26 19:48:18.282456	2026-08-28 15:08:50.111925	f	1	t	2026-08-26 19:48:18.282419	Demo Lecture Student 27	\N	f	en	\N	\N	\N	\N	\N	y5zcKsj2eSsd9GiPcetk	2026-08-26 19:48:18.283562	2026-08-26 19:48:18.282488	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:50.11108
42	demo_lecture_student_28@example.com	$2a$11$BvBCaOkhVFJvxYZUJlNjHOnUHoFtRRZBNIs9VkxJwEPQkfASlnGr2	\N	\N	\N	2026-08-26 19:48:18.659858	2026-08-28 15:08:50.462972	f	1	t	2026-08-26 19:48:18.659822	Demo Lecture Student 28	\N	f	en	\N	\N	\N	\N	\N	mMdUaaebtBJFJnbScRgw	2026-08-26 19:48:18.661458	2026-08-26 19:48:18.659887	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:50.462803
43	demo_lecture_student_29@example.com	$2a$11$fyxVj3.4BZjHICQ9hr0qZ.JG7Cl.wG0iG8nsjxFAGIGk9Tspa4GXe	\N	\N	\N	2026-08-26 19:48:19.041229	2026-08-28 15:08:50.829435	f	1	t	2026-08-26 19:48:19.041193	Demo Lecture Student 29	\N	f	en	\N	\N	\N	\N	\N	8FLnmoe7XtxxF3pEQdmt	2026-08-26 19:48:19.042522	2026-08-26 19:48:19.041259	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:50.829296
44	demo_lecture_student_30@example.com	$2a$11$ZW0MVYwZA6IKdXAZ3I0XvuVS8bB9DB0barg8cInO0yr9ZDH1SQiA2	\N	\N	\N	2026-08-26 19:48:19.414755	2026-08-28 15:08:51.175952	f	1	t	2026-08-26 19:48:19.414719	Demo Lecture Student 30	\N	f	en	\N	\N	\N	\N	\N	ngiKay5Hh4hFHess6YLN	2026-08-26 19:48:19.416212	2026-08-26 19:48:19.414785	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:51.175814
45	demo_lecture_student_31@example.com	$2a$11$0/gT74GsbzAs.h8tDd9dVeN0KRF5vlbic8E8DhQs6tCByQipbJnV6	\N	\N	\N	2026-08-26 19:48:19.793031	2026-08-28 15:08:51.509511	f	1	t	2026-08-26 19:48:19.792993	Demo Lecture Student 31	\N	f	en	\N	\N	\N	\N	\N	gLg1XHucCxiyYQGeeCkx	2026-08-26 19:48:19.794394	2026-08-26 19:48:19.793067	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:51.509377
46	demo_seminar_student_0@mampf.edu	$2a$11$adlCFdiSw5QdkiN/xj9YcOrlCDKwNgytCOToAReidK5cg45/U.JwO	\N	\N	\N	2026-08-26 19:48:21.667102	2026-08-28 15:08:51.84734	f	1	t	2026-08-26 19:48:21.666825	Demo Seminar Student 0	\N	f	en	\N	\N	\N	\N	\N	Bez1V5NYMcKtfBB1g8LZ	2026-08-26 19:48:21.668969	2026-08-26 19:48:21.667235	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:51.847193
47	demo_seminar_student_1@mampf.edu	$2a$11$jzolVy9iXT2dllOlA2gf2.3Ev.K6wujtRzvKmD81X6M3mFxYE3Ge2	\N	\N	\N	2026-08-26 19:48:22.070093	2026-08-28 15:08:52.185403	f	1	t	2026-08-26 19:48:22.070056	Demo Seminar Student 1	\N	f	en	\N	\N	\N	\N	\N	sr1FfqjSFSHW87gc7V-g	2026-08-26 19:48:22.071198	2026-08-26 19:48:22.070129	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:52.185249
48	demo_seminar_student_2@mampf.edu	$2a$11$FhX/2x24bx7HFR7Yvb7S.OyFpUhwh72NnAfjg2u0JVgbUIco6Toxi	\N	\N	\N	2026-08-26 19:48:22.43313	2026-08-28 15:08:52.545429	f	1	t	2026-08-26 19:48:22.433092	Demo Seminar Student 2	\N	f	en	\N	\N	\N	\N	\N	CFX4Xvrfx68mYkywV_-b	2026-08-26 19:48:22.434311	2026-08-26 19:48:22.433179	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:52.545294
49	demo_seminar_student_3@mampf.edu	$2a$11$3uM7dRBEYb8ZgCp0O/yPAeLMU8/4ZCniQfQe9jzqA1xPJy0Xzd1bC	\N	\N	\N	2026-08-26 19:48:22.806947	2026-08-28 15:08:52.902633	f	1	t	2026-08-26 19:48:22.806911	Demo Seminar Student 3	\N	f	en	\N	\N	\N	\N	\N	DViz-FcSqXSzVNjrb2BB	2026-08-26 19:48:22.808035	2026-08-26 19:48:22.80698	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:52.902481
50	demo_seminar_student_4@mampf.edu	$2a$11$icV7JXJ4MIqqLNgeteGhI.lOdp345bSr8JyGj3DMFnjyy4PkA5v2a	\N	\N	\N	2026-08-26 19:48:23.164034	2026-08-28 15:08:53.261864	f	1	t	2026-08-26 19:48:23.163988	Demo Seminar Student 4	\N	f	en	\N	\N	\N	\N	\N	Y3k6twnJ3zMnN52NekWN	2026-08-26 19:48:23.165327	2026-08-26 19:48:23.164073	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:53.261732
51	demo_seminar_student_5@mampf.edu	$2a$11$3h6Q.7hAEBrkmbAvyK4H4OlZ9oYl1kq89wTNEupKTF8.f4f5PpQIC	\N	\N	\N	2026-08-26 19:48:23.660159	2026-08-28 15:08:53.625736	f	1	t	2026-08-26 19:48:23.660118	Demo Seminar Student 5	\N	f	en	\N	\N	\N	\N	\N	zmbZjJ2PNtMeiE6v2eLZ	2026-08-26 19:48:23.661385	2026-08-26 19:48:23.660206	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:53.625591
52	demo_seminar_student_6@mampf.edu	$2a$11$dkgKNMxETc3gXKpkkBx/senfD/miy0oYC3hMIIXDIzt40auqZ454a	\N	\N	\N	2026-08-26 19:48:24.022698	2026-08-28 15:08:53.988749	f	1	t	2026-08-26 19:48:24.022663	Demo Seminar Student 6	\N	f	en	\N	\N	\N	\N	\N	6QqvvLNemQq5ACqrCxz3	2026-08-26 19:48:24.023795	2026-08-26 19:48:24.022734	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:53.988587
53	demo_seminar_student_7@mampf.edu	$2a$11$gmNr/eTOaSDvEBdVcBy4wO/ONrdUWvWIo9XR5pDj.UB6iZ5wcEFJS	\N	\N	\N	2026-08-26 19:48:24.429429	2026-08-28 15:08:54.360867	f	1	t	2026-08-26 19:48:24.429393	Demo Seminar Student 7	\N	f	en	\N	\N	\N	\N	\N	HpMzYZQ2S1QEnCgw2sSE	2026-08-26 19:48:24.430856	2026-08-26 19:48:24.429465	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:54.360675
54	demo_seminar_student_8@mampf.edu	$2a$11$Rb1uRit9lCSZDv.YJvXWEu11rpIT53T57xTgBjmc5oB3gBSodNw7e	\N	\N	\N	2026-08-26 19:48:24.778494	2026-08-28 15:08:54.754387	f	1	t	2026-08-26 19:48:24.778455	Demo Seminar Student 8	\N	f	en	\N	\N	\N	\N	\N	KzDDMcwSB17BahNBWyRr	2026-08-26 19:48:24.779645	2026-08-26 19:48:24.778534	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:54.754043
55	demo_seminar_student_9@mampf.edu	$2a$11$KijBt6nB3/iJnFxp9vwk3uer0yYQKXz3C1/Ldl0HmFyTOHQk2NoNq	\N	\N	\N	2026-08-26 19:48:25.151005	2026-08-28 15:08:55.107257	f	1	t	2026-08-26 19:48:25.150961	Demo Seminar Student 9	\N	f	en	\N	\N	\N	\N	\N	t3FjNsRjckHx7GkAv6Gu	2026-08-26 19:48:25.152273	2026-08-26 19:48:25.151048	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:55.10713
56	demo_seminar_student_10@mampf.edu	$2a$11$n9tgFKyCbbh9Yvfw6lC.xe9SpbD60ZN1J35mdl8YqWmDbFF0qcAaq	\N	\N	\N	2026-08-26 19:48:25.50142	2026-08-28 15:08:55.517427	f	1	t	2026-08-26 19:48:25.500969	Demo Seminar Student 10	\N	f	en	\N	\N	\N	\N	\N	yhmZxNP7r9wgvkNXiNbL	2026-08-26 19:48:25.502932	2026-08-26 19:48:25.501469	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:55.516447
57	demo_seminar_student_11@mampf.edu	$2a$11$Kf1u2Icvg8LlvvJZqZ7JWekaiflVM/bvejucBDFBXrdHepCYacoBK	\N	\N	\N	2026-08-26 19:48:25.877974	2026-08-28 15:08:56.065413	f	1	t	2026-08-26 19:48:25.877686	Demo Seminar Student 11	\N	f	en	\N	\N	\N	\N	\N	5fnjws97WUsqW8EEboLK	2026-08-26 19:48:25.879618	2026-08-26 19:48:25.87849	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:56.065234
58	demo_seminar_rejected_0@example.com	$2a$11$kYNdz8qCLkQjUJ4XnALtYeQlzAYqI0PtAOUQW9p6BA5PQDAjj/oU6	\N	\N	\N	2026-08-26 19:48:26.217589	2026-08-28 15:08:57.87515	f	1	t	2026-08-26 19:48:26.217556	Demo Seminar Rejected 0	\N	f	en	\N	\N	\N	\N	\N	87ovjJE3eGwGsZ1HtawD	2026-08-26 19:48:26.218782	2026-08-26 19:48:26.217622	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:57.875018
59	demo_seminar_rejected_1@example.com	$2a$11$uB5ZULpxXnqPadUYiSg.keRxCL8rhjrIlNc.C9J0Mgc7Zh4i5NsnO	\N	\N	\N	2026-08-26 19:48:26.584305	2026-08-28 15:08:58.222096	f	1	t	2026-08-26 19:48:26.584273	Demo Seminar Rejected 1	\N	f	en	\N	\N	\N	\N	\N	9V_JULqBMpbWRVQysUZn	2026-08-26 19:48:26.585473	2026-08-26 19:48:26.584336	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:58.221966
60	solver_user_0@example.com	$2a$11$qUtOOz2SPCM2YWM8TItDle11ukjWcJRHu.bfb8o3yWqG0EC.bnxTu	\N	\N	\N	2026-08-26 19:48:27.51481	2026-08-28 15:08:58.575646	f	1	t	2026-08-26 19:48:27.514766	Solver User 0	\N	f	en	\N	\N	\N	\N	\N	V-s657wkamGfuWHLzxr_	2026-08-26 19:48:27.51596	2026-08-26 19:48:27.514854	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:58.575499
61	solver_user_1@example.com	$2a$11$K/nLU8kuhmeejG20xmjkIOZ2w2l9OBfY76MUZWYkVjeb6mlJcoMfK	\N	\N	\N	2026-08-26 19:48:27.889997	2026-08-28 15:08:58.910492	f	1	t	2026-08-26 19:48:27.889945	Solver User 1	\N	f	en	\N	\N	\N	\N	\N	UeuyaVLmqwwmK_gPRmQF	2026-08-26 19:48:27.891128	2026-08-26 19:48:27.890036	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:58.910334
62	solver_user_2@example.com	$2a$11$ggkjKMMAoxPLhmC1uH4Z7OkneOZ1rff6PY0ZEEGC6.xezhW9iAJwq	\N	\N	\N	2026-08-26 19:48:28.277957	2026-08-28 15:08:59.248625	f	1	t	2026-08-26 19:48:28.277923	Solver User 2	\N	f	en	\N	\N	\N	\N	\N	VFuadniEjbsyztTtEy_N	2026-08-26 19:48:28.279126	2026-08-26 19:48:28.27799	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:59.248491
63	solver_user_3@example.com	$2a$11$ziDkZt6IiW6ifttVCt8qcuLkqxrOh8J6cgJXOLSO9dGiTNUdC0pwm	\N	\N	\N	2026-08-26 19:48:28.650515	2026-08-28 15:08:59.64493	f	1	t	2026-08-26 19:48:28.650483	Solver User 3	\N	f	en	\N	\N	\N	\N	\N	_ynBNH8v6VxdNxMKRxRq	2026-08-26 19:48:28.651677	2026-08-26 19:48:28.650553	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:08:59.644752
64	solver_user_4@example.com	$2a$11$.y7Nnad/JmA3bv3Prz4Ih.ulaUW7rn9ngbODK7YNDFCEHpUE79Vue	\N	\N	\N	2026-08-26 19:48:29.029028	2026-08-28 15:09:00.01561	f	1	t	2026-08-26 19:48:29.028993	Solver User 4	\N	f	en	\N	\N	\N	\N	\N	D-nbT8Xzzi2MUhW-g6rt	2026-08-26 19:48:29.030264	2026-08-26 19:48:29.029064	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:00.015454
65	solver_user_5@example.com	$2a$11$Au08wGTcQBQkw7KH3JD64uELqOT7z19Gp8xhfeh6w9WgVmsleZ6xu	\N	\N	\N	2026-08-26 19:48:29.420129	2026-08-28 15:09:00.381946	f	1	t	2026-08-26 19:48:29.420096	Solver User 5	\N	f	en	\N	\N	\N	\N	\N	CMafyCfD3yVfEnFN3-aq	2026-08-26 19:48:29.421263	2026-08-26 19:48:29.420166	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:00.381756
66	solver_user_6@example.com	$2a$11$Crbjw0RRxdnt.eXlAVk5iOuXOZW/xHa/FbThdMxGLe3onAiQUocba	\N	\N	\N	2026-08-26 19:48:29.794009	2026-08-28 15:09:00.724618	f	1	t	2026-08-26 19:48:29.793974	Solver User 6	\N	f	en	\N	\N	\N	\N	\N	jHFS2qWvMP6YYvVfCxU_	2026-08-26 19:48:29.795233	2026-08-26 19:48:29.794063	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:00.724468
67	solver_user_7@example.com	$2a$11$ZnSkwqE6k5uD0/fIdpdzO.YFG4uY0P192Wl47M9M5jGIXDbjxYYE6	\N	\N	\N	2026-08-26 19:48:30.189193	2026-08-28 15:09:01.068243	f	1	t	2026-08-26 19:48:30.189159	Solver User 7	\N	f	en	\N	\N	\N	\N	\N	mbmNxusKB5VzgBQzQsks	2026-08-26 19:48:30.190555	2026-08-26 19:48:30.189229	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:01.068069
69	solver_user_9@example.com	$2a$11$Ft4B2o3V8uhOwKISlIUrUOFO55q/UREu/dTjc4AHtDOmZUmQjbGZy	\N	\N	\N	2026-08-26 19:48:30.92305	2026-08-28 15:09:01.77534	f	1	t	2026-08-26 19:48:30.923016	Solver User 9	\N	f	en	\N	\N	\N	\N	\N	612XG-eb-DDxE7xcD6Jo	2026-08-26 19:48:30.924151	2026-08-26 19:48:30.923085	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:01.775194
70	solver_user_10@example.com	$2a$11$3vgHNPbhtDWCRXAG/JZ6ReOLSYvEx0b3kMQ0haD7oswJX8DkaMfiC	\N	\N	\N	2026-08-26 19:48:31.301441	2026-08-28 15:09:02.113846	f	1	t	2026-08-26 19:48:31.301408	Solver User 10	\N	f	en	\N	\N	\N	\N	\N	y9HSBTZ-1UGDiAe5UFKs	2026-08-26 19:48:31.302594	2026-08-26 19:48:31.301474	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:02.1137
71	solver_user_11@example.com	$2a$11$GjHmREcjtuKhOzxnjVzf5.5NJeehHxqkgVuZ8i1J/qs/DJDaf/ali	\N	\N	\N	2026-08-26 19:48:31.659411	2026-08-28 15:09:02.449879	f	1	t	2026-08-26 19:48:31.65938	Solver User 11	\N	f	en	\N	\N	\N	\N	\N	c9affA9SLtomwDoxqo3x	2026-08-26 19:48:31.66059	2026-08-26 19:48:31.659443	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:02.449738
72	solver_user_12@example.com	$2a$11$QS9CxC.z/.G5mM1PkxHSNOF1.ebcpKY0Vaestauxu3DO2NXwN6dEi	\N	\N	\N	2026-08-26 19:48:32.029917	2026-08-28 15:09:02.776032	f	1	t	2026-08-26 19:48:32.029883	Solver User 12	\N	f	en	\N	\N	\N	\N	\N	VEA4TB4PxRv_z2dva7zD	2026-08-26 19:48:32.031003	2026-08-26 19:48:32.029953	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:02.775889
73	solver_user_13@example.com	$2a$11$nXD2WSJ/pKCHUNwrkTAE7O4gdmCXI/PF9DkW3NtU14Mxcpyg6Ue.m	\N	\N	\N	2026-08-26 19:48:32.398932	2026-08-28 15:09:03.132198	f	1	t	2026-08-26 19:48:32.398899	Solver User 13	\N	f	en	\N	\N	\N	\N	\N	NyDej8SSeamRMySiVGNZ	2026-08-26 19:48:32.401516	2026-08-26 19:48:32.39959	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:03.132064
74	solver_user_14@example.com	$2a$11$YaD3Usw2jO/XE8etPW22n.xzUBhDumQnMkDQqL9ThXopfMtNBCC9y	\N	\N	\N	2026-08-26 19:48:32.748551	2026-08-28 15:09:03.474777	f	1	t	2026-08-26 19:48:32.748515	Solver User 14	\N	f	en	\N	\N	\N	\N	\N	zKn66VKgNjzQRL8to82y	2026-08-26 19:48:32.749766	2026-08-26 19:48:32.748583	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:03.47458
75	solver_user_15@example.com	$2a$11$k6lbbUVmjR8ZkQUpEnGZrukSY/Xi1aDXfe1l0jm6KCqDkYJBfP1Ku	\N	\N	\N	2026-08-26 19:48:33.117156	2026-08-28 15:09:03.810153	f	1	t	2026-08-26 19:48:33.116896	Solver User 15	\N	f	en	\N	\N	\N	\N	\N	tyza6eaRacRMz_zYc4jQ	2026-08-26 19:48:33.118383	2026-08-26 19:48:33.117196	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:03.810012
76	solver_user_16@example.com	$2a$11$jQOd2WGbOU348Yv4u.UlUOKRoZnacWyl3FmB1x2az6emRHya/XVyG	\N	\N	\N	2026-08-26 19:48:33.48573	2026-08-28 15:09:04.147894	f	1	t	2026-08-26 19:48:33.485698	Solver User 16	\N	f	en	\N	\N	\N	\N	\N	Vy9SEGpKzxS3A89yCyM2	2026-08-26 19:48:33.487118	2026-08-26 19:48:33.485761	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:04.14774
77	solver_user_17@example.com	$2a$11$2F8ozhlNMLfLKVN6xf/RJOknA4gPGnm/FpLD0iGOJbRjY0cQu57YW	\N	\N	\N	2026-08-26 19:48:33.840001	2026-08-28 15:09:04.469993	f	1	t	2026-08-26 19:48:33.839968	Solver User 17	\N	f	en	\N	\N	\N	\N	\N	S4W2jWdsmgGwQH9C5asz	2026-08-26 19:48:33.841086	2026-08-26 19:48:33.840033	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:04.469859
78	solver_user_18@example.com	$2a$11$59mmNm.Fr0S5WQSGvUjmYuBa3NOordH56AL.So6wHHUylMH58MGfu	\N	\N	\N	2026-08-26 19:48:34.207645	2026-08-28 15:09:04.807125	f	1	t	2026-08-26 19:48:34.207613	Solver User 18	\N	f	en	\N	\N	\N	\N	\N	kEef2LWZgwNnTV4GANAj	2026-08-26 19:48:34.208909	2026-08-26 19:48:34.207678	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:04.806966
79	solver_user_19@example.com	$2a$11$z1rIY27A1PRS2zuywOlxJ.I2ullDDBLCN8L/n6ukfsb0NoTIexkWC	\N	\N	\N	2026-08-26 19:48:34.562486	2026-08-28 15:09:05.14401	f	1	t	2026-08-26 19:48:34.562444	Solver User 19	\N	f	en	\N	\N	\N	\N	\N	AyBJK3PsyzLysHxYvUS-	2026-08-26 19:48:34.564079	2026-08-26 19:48:34.56252	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:05.14385
80	solver_user_20@example.com	$2a$11$05aW4rGBiDLOLgXIYJYjrebBrIzj2fj5uqeseasymgjctSMceSMHC	\N	\N	\N	2026-08-26 19:48:34.932963	2026-08-28 15:09:05.477235	f	1	t	2026-08-26 19:48:34.932924	Solver User 20	\N	f	en	\N	\N	\N	\N	\N	xzSzDzPTTo8CYfynp7ac	2026-08-26 19:48:34.934409	2026-08-26 19:48:34.932999	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:05.477095
81	solver_user_21@example.com	$2a$11$z8IBp7H58kOfMB7V6HybP.jpyJI87JC86eBXKrXko5zoNo0QI5sFy	\N	\N	\N	2026-08-26 19:48:35.31679	2026-08-28 15:09:05.813215	f	1	t	2026-08-26 19:48:35.316756	Solver User 21	\N	f	en	\N	\N	\N	\N	\N	4dHzJoPdo4YQYNbTUzG3	2026-08-26 19:48:35.318046	2026-08-26 19:48:35.316822	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:05.813057
82	solver_user_22@example.com	$2a$11$3friNvAm/NrXZjy9X5AzX.uf8yuOReQFznnq1l1kpICCTmN6dKvxW	\N	\N	\N	2026-08-26 19:48:35.706971	2026-08-28 15:09:06.142315	f	1	t	2026-08-26 19:48:35.706887	Solver User 22	\N	f	en	\N	\N	\N	\N	\N	JeSfLfNREbtWn1y6Hosm	2026-08-26 19:48:35.708352	2026-08-26 19:48:35.707023	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:06.142175
83	solver_user_23@example.com	$2a$11$hJarM.dak9JTCjHWHgDg.uHNsDR5.sTUXvtLwPqcptMqnOVxeDv4y	\N	\N	\N	2026-08-26 19:48:36.101474	2026-08-28 15:09:06.516592	f	1	t	2026-08-26 19:48:36.101431	Solver User 23	\N	f	en	\N	\N	\N	\N	\N	btxVCAz2kf8tA3YvoFw7	2026-08-26 19:48:36.102809	2026-08-26 19:48:36.101511	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:06.516438
84	solver_user_24@example.com	$2a$11$F5feQlqZIPgDxk4flL3tUuTzmXnAzRidKq.VgJ82YH76Wf3n6TJsm	\N	\N	\N	2026-08-26 19:48:36.497327	2026-08-28 15:09:06.861386	f	1	t	2026-08-26 19:48:36.497293	Solver User 24	\N	f	en	\N	\N	\N	\N	\N	VgdFsxP742ps9EMEZZgs	2026-08-26 19:48:36.498558	2026-08-26 19:48:36.497361	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:06.861191
85	solver_user_25@example.com	$2a$11$PZmvrUl7/9IwuwBKpeyVB.iCgoTTeuaq1v3CJR1FNhH536B/TPRTq	\N	\N	\N	2026-08-26 19:48:36.892575	2026-08-28 15:09:07.199055	f	1	t	2026-08-26 19:48:36.892542	Solver User 25	\N	f	en	\N	\N	\N	\N	\N	JuxgET6z7LtutDYKbrtx	2026-08-26 19:48:36.893709	2026-08-26 19:48:36.892605	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:07.198923
86	solver_user_26@example.com	$2a$11$AWqcOFCPS6IzLXgyoCQJauOtQvB9xajuQYHsOqAxIIWsd75Ryb8JG	\N	\N	\N	2026-08-26 19:48:37.274405	2026-08-28 15:09:07.53168	f	1	t	2026-08-26 19:48:37.27437	Solver User 26	\N	f	en	\N	\N	\N	\N	\N	jdwDNSsdWN-mky99Y3UC	2026-08-26 19:48:37.27586	2026-08-26 19:48:37.27444	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:07.531544
87	solver_user_27@example.com	$2a$11$E94qxBXr2Doixd5XcgVEj.1YctrIZes2MtZ80y0ZYhGXSsjb0NyU.	\N	\N	\N	2026-08-26 19:48:37.647646	2026-08-28 15:09:07.859336	f	1	t	2026-08-26 19:48:37.647613	Solver User 27	\N	f	en	\N	\N	\N	\N	\N	T2ZsNhHS_f4TzkxBeZKg	2026-08-26 19:48:37.648764	2026-08-26 19:48:37.647679	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:07.859202
88	solver_user_28@example.com	$2a$11$LkvmC3trCEYey7R4mn8qSerNq8d/7xdia0og4.Zkq2EIegR1FpM7S	\N	\N	\N	2026-08-26 19:48:38.008577	2026-08-28 15:09:08.221395	f	1	t	2026-08-26 19:48:38.00854	Solver User 28	\N	f	en	\N	\N	\N	\N	\N	hE-nEiJF78EqzqqNX87i	2026-08-26 19:48:38.010149	2026-08-26 19:48:38.008635	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:08.221258
89	solver_user_29@example.com	$2a$11$J7v43YT581cWMLKaJSpEmeJ/vHj5wY0hgTnXY/Mh9xfnRaRO.kcri	\N	\N	\N	2026-08-26 19:48:38.40139	2026-08-28 15:09:08.571111	f	1	t	2026-08-26 19:48:38.40135	Solver User 29	\N	f	en	\N	\N	\N	\N	\N	YJ1jpWzkX9cTybaes7AW	2026-08-26 19:48:38.402826	2026-08-26 19:48:38.401432	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:08.570978
90	solver_user_30@example.com	$2a$11$sZuSME3M4dU7aJ5UaUVs6ugU38iZ5/0kLGZ4x91yNJGNqs7k5Axn2	\N	\N	\N	2026-08-26 19:48:38.773417	2026-08-28 15:09:08.896097	f	1	t	2026-08-26 19:48:38.773384	Solver User 30	\N	f	en	\N	\N	\N	\N	\N	R47sKsJ3jiUaFTg46J_T	2026-08-26 19:48:38.774981	2026-08-26 19:48:38.773452	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:08.895931
91	solver_user_31@example.com	$2a$11$0SRBtfj6/v7d6rzxFRdEz.fwELaVMnjL7/sA8/DCKhoZT85kNk1pm	\N	\N	\N	2026-08-26 19:48:39.149572	2026-08-28 15:09:09.237886	f	1	t	2026-08-26 19:48:39.149533	Solver User 31	\N	f	en	\N	\N	\N	\N	\N	3AFJvpz_3nLqr6KNQP41	2026-08-26 19:48:39.151066	2026-08-26 19:48:39.149629	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:09.237744
92	solver_user_32@example.com	$2a$11$UOPqbmB18VUpAsmke.6yZO4jSSlklSptBkPGzISzqKh3f1BdlRRoC	\N	\N	\N	2026-08-26 19:48:39.552711	2026-08-28 15:09:09.574759	f	1	t	2026-08-26 19:48:39.552677	Solver User 32	\N	f	en	\N	\N	\N	\N	\N	e89WdwMHsN3DgsnxGhFP	2026-08-26 19:48:39.554023	2026-08-26 19:48:39.552745	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:09.57462
93	solver_user_33@example.com	$2a$11$VNwV0vUbJwcrp6cg/hBx5./Ocn3xf31OSKpWVgj/UWXqczbhXoUC6	\N	\N	\N	2026-08-26 19:48:39.923175	2026-08-28 15:09:09.925562	f	1	t	2026-08-26 19:48:39.923134	Solver User 33	\N	f	en	\N	\N	\N	\N	\N	djRpJeuxxHy9TiDYbsyg	2026-08-26 19:48:39.924566	2026-08-26 19:48:39.923217	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:09.92542
94	solver_user_34@example.com	$2a$11$9QCBYFi1pjUFmj5H3QVFP.7/Dmtd0WUWQbT.9k7nGgShnqWGoY6I2	\N	\N	\N	2026-08-26 19:48:40.305242	2026-08-28 15:09:10.266945	f	1	t	2026-08-26 19:48:40.305206	Solver User 34	\N	f	en	\N	\N	\N	\N	\N	tq6bVr-QJzAu1KtYehwy	2026-08-26 19:48:40.306532	2026-08-26 19:48:40.305279	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:10.266806
95	solver_user_35@example.com	$2a$11$d1IAGM441.2GwAQWGzgs7udmgello7/pkG7DWMZXmRZ4lSywcqyym	\N	\N	\N	2026-08-26 19:48:40.730029	2026-08-28 15:09:10.602514	f	1	t	2026-08-26 19:48:40.729995	Solver User 35	\N	f	en	\N	\N	\N	\N	\N	4fNP78u5pB-YjrJpKR8i	2026-08-26 19:48:40.732497	2026-08-26 19:48:40.730062	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:10.60238
96	solver_user_36@example.com	$2a$11$cH7y3MfpvCFnIlX4EwsGkOswz9tQ4kfFnS5sHFE1D8xPdwVU0iaJG	\N	\N	\N	2026-08-26 19:48:41.103435	2026-08-28 15:09:10.931317	f	1	t	2026-08-26 19:48:41.103401	Solver User 36	\N	f	en	\N	\N	\N	\N	\N	GMgx7Ff8txUfzZKRGxyL	2026-08-26 19:48:41.104643	2026-08-26 19:48:41.103469	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:10.930965
97	solver_user_37@example.com	$2a$11$mvzQ/J61cVJyj0.RYGPJn.UdraB1OFRHfbjym1SoJHQtSrC587Y6S	\N	\N	\N	2026-08-26 19:48:41.4944	2026-08-28 15:09:11.260428	f	1	t	2026-08-26 19:48:41.494366	Solver User 37	\N	f	en	\N	\N	\N	\N	\N	zjUBDsPuJCyQ_Hsi6tdn	2026-08-26 19:48:41.495673	2026-08-26 19:48:41.494432	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:11.260288
98	solver_user_38@example.com	$2a$11$jv4ZEQ9e4yPCeDgb4S61KO.IemSKF4yfR/LeH6tUpkEmHdWu6UUCG	\N	\N	\N	2026-08-26 19:48:41.862229	2026-08-28 15:09:11.612864	f	1	t	2026-08-26 19:48:41.862196	Solver User 38	\N	f	en	\N	\N	\N	\N	\N	58P_duxP8UjDkceJCYLq	2026-08-26 19:48:41.863353	2026-08-26 19:48:41.862262	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:11.612708
99	solver_user_39@example.com	$2a$11$OQ8/8k6vlovwQKxtKMlbzuosmvJjFrao.0/5bjXE73sxDLr8/m7/G	\N	\N	\N	2026-08-26 19:48:42.239841	2026-08-28 15:09:11.960896	f	1	t	2026-08-26 19:48:42.239808	Solver User 39	\N	f	en	\N	\N	\N	\N	\N	eBziXWBbDzpsjXz_-2C1	2026-08-26 19:48:42.241115	2026-08-26 19:48:42.239873	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:11.960489
100	solver_user_40@example.com	$2a$11$sfz/ZHZB/2.UH6HvYFKnO./g8XlHOJQbm3WmHrj0BdKVe6om1XG/i	\N	\N	\N	2026-08-26 19:48:42.624455	2026-08-28 15:09:12.298291	f	1	t	2026-08-26 19:48:42.624423	Solver User 40	\N	f	en	\N	\N	\N	\N	\N	RgwzcaUQncACkTpxBLm4	2026-08-26 19:48:42.625568	2026-08-26 19:48:42.624486	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:12.298136
101	solver_user_41@example.com	$2a$11$EeltSAHFIrvmBzaG.ejuVOok4Wbfn0ycDcEldYvfbu7/kDRMs/3gm	\N	\N	\N	2026-08-26 19:48:42.9974	2026-08-28 15:09:12.629638	f	1	t	2026-08-26 19:48:42.997364	Solver User 41	\N	f	en	\N	\N	\N	\N	\N	rGemd-g5YYNV5X_pgwcf	2026-08-26 19:48:42.99875	2026-08-26 19:48:42.997432	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:12.629507
102	solver_user_42@example.com	$2a$11$HIwD4XNRDu6ZuxsmL1436Ogb9PuOLaiwOwutb8EbXn2xbo.VAYURi	\N	\N	\N	2026-08-26 19:48:43.398829	2026-08-28 15:09:12.963705	f	1	t	2026-08-26 19:48:43.398794	Solver User 42	\N	f	en	\N	\N	\N	\N	\N	4SdABSqtkmJZHhRbUcPW	2026-08-26 19:48:43.400026	2026-08-26 19:48:43.398864	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:12.963565
103	solver_user_43@example.com	$2a$11$82GsZs6.IpgqYiBXTWMJz.YOnJ8aE.yPWW6dhTMnGDzuXmCRYH7xy	\N	\N	\N	2026-08-26 19:48:43.808352	2026-08-28 15:09:13.309129	f	1	t	2026-08-26 19:48:43.808318	Solver User 43	\N	f	en	\N	\N	\N	\N	\N	LsgyCCQFoFJVgLKPWz-9	2026-08-26 19:48:43.809524	2026-08-26 19:48:43.808389	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:13.308997
104	solver_user_44@example.com	$2a$11$iS9VqesAjIdLHWdt6kYBzOtg6BQka0FoiZmGG94iXUutdTYhqzSXO	\N	\N	\N	2026-08-26 19:48:44.201047	2026-08-28 15:09:13.649909	f	1	t	2026-08-26 19:48:44.201012	Solver User 44	\N	f	en	\N	\N	\N	\N	\N	j3LNQCaMWSWdDfPQsJRa	2026-08-26 19:48:44.202187	2026-08-26 19:48:44.201079	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:13.649766
105	solver_user_45@example.com	$2a$11$XE20JyUiQzAPd5Rl9PgVJeZJqqDXIN76JyzS1sxENvO/vtF4UIapi	\N	\N	\N	2026-08-26 19:48:44.607021	2026-08-28 15:09:14.002959	f	1	t	2026-08-26 19:48:44.606974	Solver User 45	\N	f	en	\N	\N	\N	\N	\N	_fsP8-UJQ3WKVLcZQVBs	2026-08-26 19:48:44.609389	2026-08-26 19:48:44.607063	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:14.002721
106	solver_user_46@example.com	$2a$11$rUkLIh0XANNIU85yfw.sQu80urqSKzl1zV/0iiuvXX0o9cZmNA5iC	\N	\N	\N	2026-08-26 19:48:45.005309	2026-08-28 15:09:14.350296	f	1	t	2026-08-26 19:48:45.005266	Solver User 46	\N	f	en	\N	\N	\N	\N	\N	H_KXi1qFgJGADoumLWYw	2026-08-26 19:48:45.006732	2026-08-26 19:48:45.005348	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:14.350163
107	solver_user_47@example.com	$2a$11$zlVo.7eKD3gviiKvYmNHqe7DVBB88k1anSVxaAexnCmqUX/EcFwUm	\N	\N	\N	2026-08-26 19:48:45.406275	2026-08-28 15:09:14.689255	f	1	t	2026-08-26 19:48:45.406231	Solver User 47	\N	f	en	\N	\N	\N	\N	\N	kh7Svii9Tj_JbDZo974Q	2026-08-26 19:48:45.408029	2026-08-26 19:48:45.406314	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:14.689125
108	solver_user_48@example.com	$2a$11$fvPsyvl9q6DlosG7chX5COxROlrVpOauMB6Yc6a6YT6gYwpDWgQdi	\N	\N	\N	2026-08-26 19:48:45.806639	2026-08-28 15:09:15.062613	f	1	t	2026-08-26 19:48:45.806606	Solver User 48	\N	f	en	\N	\N	\N	\N	\N	75xzmBn4egh4SLCNoztz	2026-08-26 19:48:45.807738	2026-08-26 19:48:45.806669	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:15.062473
109	solver_user_49@example.com	$2a$11$QR1hvK2y8gdxQHyxuIqAAOeAkVk5bJ5B1/5JmLv162eRdB/CEDvgi	\N	\N	\N	2026-08-26 19:48:46.186853	2026-08-28 15:09:15.410152	f	1	t	2026-08-26 19:48:46.186819	Solver User 49	\N	f	en	\N	\N	\N	\N	\N	4U48qS_BAQwj5-yWY784	2026-08-26 19:48:46.188038	2026-08-26 19:48:46.186885	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:15.410014
110	solver_user_50@example.com	$2a$11$Vs9LdAVhMxCRincQcFqSfuQJaw2HXW.PsnjHR.kNELgFMeR8eJVPe	\N	\N	\N	2026-08-26 19:48:46.592361	2026-08-28 15:09:15.755809	f	1	t	2026-08-26 19:48:46.592329	Solver User 50	\N	f	en	\N	\N	\N	\N	\N	c99BN5Fs1kfa9WNG7xsE	2026-08-26 19:48:46.593713	2026-08-26 19:48:46.592391	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:15.755663
111	solver_user_51@example.com	$2a$11$3SxirENfG6mIIt5ODARxeOTHH2hlc9MsUsrfu5BfEvFXvJkQHUPBO	\N	\N	\N	2026-08-26 19:48:46.960592	2026-08-28 15:09:16.096452	f	1	t	2026-08-26 19:48:46.960561	Solver User 51	\N	f	en	\N	\N	\N	\N	\N	rjz_fqXWBTY36GqjxYpC	2026-08-26 19:48:46.961712	2026-08-26 19:48:46.960624	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:16.096308
112	solver_user_52@example.com	$2a$11$rjqSlSGdfNw9v7xTnoLPPeKekurOEkK/xwrzM0WK2vMQEpZmddI7C	\N	\N	\N	2026-08-26 19:48:47.312663	2026-08-28 15:09:16.414849	f	1	t	2026-08-26 19:48:47.3126	Solver User 52	\N	f	en	\N	\N	\N	\N	\N	Qs4KM8j5uyHRTZrXKwCe	2026-08-26 19:48:47.313762	2026-08-26 19:48:47.312699	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:16.41472
113	solver_user_53@example.com	$2a$11$k/81GzIRE4tVuc2.u3BFB.SnFeE4k64Bie5uGWjRNvypHEP5t0bri	\N	\N	\N	2026-08-26 19:48:47.811715	2026-08-28 15:09:16.760994	f	1	t	2026-08-26 19:48:47.811676	Solver User 53	\N	f	en	\N	\N	\N	\N	\N	xt2Rzwz1sRt-F69g7dbd	2026-08-26 19:48:47.813295	2026-08-26 19:48:47.811762	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:16.760858
114	solver_user_54@example.com	$2a$11$RNG2kQX8ya8qJddHmON6F.46Y/ybslzxf/urbbDJvLBmsmqlTSK6a	\N	\N	\N	2026-08-26 19:48:48.211566	2026-08-28 15:09:17.101687	f	1	t	2026-08-26 19:48:48.211526	Solver User 54	\N	f	en	\N	\N	\N	\N	\N	t-yPMcoMhNZFjAxmzzDR	2026-08-26 19:48:48.212952	2026-08-26 19:48:48.211604	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:17.101552
115	cohort_user_0@example.com	$2a$11$cegw2l/AnarOVwhFo8yDtet/tp.Uxa2T9yBCS5.e13XrTPGx5CCnK	\N	\N	\N	2026-08-26 19:48:48.755642	2026-08-28 15:09:17.43643	f	1	t	2026-08-26 19:48:48.755606	Cohort User 0	\N	f	en	\N	\N	\N	\N	\N	j3UetLFZjzxFEuRE2tX2	2026-08-26 19:48:48.756968	2026-08-26 19:48:48.755682	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:17.436296
116	cohort_user_1@example.com	$2a$11$NSw3/PPEnhexEUZYvKW.vOEN90mycf1JproxaJx3ebFu6UU9r11pS	\N	\N	\N	2026-08-26 19:48:49.175811	2026-08-28 15:09:17.766704	f	1	t	2026-08-26 19:48:49.17577	Cohort User 1	\N	f	en	\N	\N	\N	\N	\N	R9r1njjsxywm1xhxccQz	2026-08-26 19:48:49.17717	2026-08-26 19:48:49.175855	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:17.766569
117	cohort_user_2@external.org	$2a$11$PrBMvv/FBRtB0vpSQsOqX.wLGE9OEAzfKhVFhwyGFx7GgUSXsX9Ae	\N	\N	\N	2026-08-26 19:48:49.700036	2026-08-28 15:09:18.094025	f	1	t	2026-08-26 19:48:49.700004	Cohort User 2	\N	f	en	\N	\N	\N	\N	\N	to6rQ-T9sVxTaUdsYeNq	2026-08-26 19:48:49.701212	2026-08-26 19:48:49.700073	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:18.093893
118	cohort_user_3@example.com	$2a$11$aqQd9XWV.cOaWcKsiI.AnOPy2iEJuHknk7Pe8cq8ATPa5g1Qfduxa	\N	\N	\N	2026-08-26 19:48:50.075554	2026-08-28 15:09:18.442455	f	1	t	2026-08-26 19:48:50.075521	Cohort User 3	\N	f	en	\N	\N	\N	\N	\N	yt4PsEyVCLRfiYxhsdC6	2026-08-26 19:48:50.076698	2026-08-26 19:48:50.075587	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:18.442328
119	cohort_user_4@example.com	$2a$11$FaPsxU.hc1Etij5XE6V/2.IZahH/rgCPWw5bH52P3mKM4Kh32O0f.	\N	\N	\N	2026-08-26 19:48:50.446068	2026-08-28 15:09:18.792004	f	1	t	2026-08-26 19:48:50.44602	Cohort User 4	\N	f	en	\N	\N	\N	\N	\N	6ewyrJBCLbuWLBFyPvzX	2026-08-26 19:48:50.447871	2026-08-26 19:48:50.446125	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:18.791838
120	cohort_user_5@example.com	$2a$11$.ZfhzQ0EEmi3v08BVnqKluOvinAHWc4dV6.Cw1foodWtdiiIaLi2m	\N	\N	\N	2026-08-26 19:48:50.824304	2026-08-28 15:09:19.13539	f	1	t	2026-08-26 19:48:50.824272	Cohort User 5	\N	f	en	\N	\N	\N	\N	\N	GZu-n7fZx2LhpvvGfNFy	2026-08-26 19:48:50.82547	2026-08-26 19:48:50.824337	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:19.135054
121	cohort_user_6@example.com	$2a$11$Sm36SLgDSLgLV6ac5kgqiOUdEJNKmnqGZXHA4WRGC4TfjawYVrqx6	\N	\N	\N	2026-08-26 19:48:51.182835	2026-08-28 15:09:19.47621	f	1	t	2026-08-26 19:48:51.182802	Cohort User 6	\N	f	en	\N	\N	\N	\N	\N	paSc_kzjdfbU1zYSeBQK	2026-08-26 19:48:51.184103	2026-08-26 19:48:51.182868	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:19.474524
122	cohort_user_7@external.org	$2a$11$HQ5WAkF1XGlu3zO2DAZ6XuuJeoi5lLA/gp9POYnVHg58V3hQpuGxa	\N	\N	\N	2026-08-26 19:48:51.551795	2026-08-28 15:09:19.812024	f	1	t	2026-08-26 19:48:51.551759	Cohort User 7	\N	f	en	\N	\N	\N	\N	\N	w9W3jau374jKdeZiK1ZG	2026-08-26 19:48:51.553365	2026-08-26 19:48:51.55183	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:19.811903
123	cohort_user_8@example.com	$2a$11$30hHZpafD.vdjIxJGofZrOzzFLN94qSykH2t.EZzq9XOOAcdc50.e	\N	\N	\N	2026-08-26 19:48:51.925838	2026-08-28 15:09:20.164217	f	1	t	2026-08-26 19:48:51.9258	Cohort User 8	\N	f	en	\N	\N	\N	\N	\N	4SZtGvswQ6M_quzyMyAv	2026-08-26 19:48:51.926992	2026-08-26 19:48:51.92589	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:20.164096
124	cohort_user_9@example.com	$2a$11$tJjOMOlia/Lwfneyf/QfUe9t2kvYulHwlOViX1exl2Hkz9.po52ve	\N	\N	\N	2026-08-26 19:48:52.285548	2026-08-28 15:09:20.504984	f	1	t	2026-08-26 19:48:52.285512	Cohort User 9	\N	f	en	\N	\N	\N	\N	\N	GGkyPQ22ZpHQRyFUoryR	2026-08-26 19:48:52.286663	2026-08-26 19:48:52.285583	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:20.504732
125	cohort_user_10@example.com	$2a$11$guuk5e2jXRzPiY7ABIzD5Oy4w/2fUbGcgb.FfVibreWG.ZRjF4BGa	\N	\N	\N	2026-08-26 19:48:52.669263	2026-08-28 15:09:20.837865	f	1	t	2026-08-26 19:48:52.669227	Cohort User 10	\N	f	en	\N	\N	\N	\N	\N	zeVbBshoqnCktL3s-FjK	2026-08-26 19:48:52.670942	2026-08-26 19:48:52.6693	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:20.837745
126	cohort_user_11@example.com	$2a$11$JLANifJHl9uj6cUYUDbJSOCiSqya0YCxE5XY47Q4zFR9FSez4kO1S	\N	\N	\N	2026-08-26 19:48:53.043884	2026-08-28 15:09:21.18145	f	1	t	2026-08-26 19:48:53.04385	Cohort User 11	\N	f	en	\N	\N	\N	\N	\N	kRpLovZPbThYvsyKiemL	2026-08-26 19:48:53.045114	2026-08-26 19:48:53.043918	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:21.181327
127	cohort_user_12@example.com	$2a$11$Vb4VDYeR8vprF14kCb336OKcGOaWLmXowfrpPksSW.MtubxRlhqUy	\N	\N	\N	2026-08-26 19:48:53.450104	2026-08-28 15:09:21.506823	f	1	t	2026-08-26 19:48:53.450067	Cohort User 12	\N	f	en	\N	\N	\N	\N	\N	q3PsXGgL_9yA2p39tuY5	2026-08-26 19:48:53.451405	2026-08-26 19:48:53.450139	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:21.506703
128	cohort_user_13@example.com	$2a$11$KautGytDeo2AXaTNyYzNdu3hxSzB9CEZkAWkln/tE4cZ1gUkKc9oC	\N	\N	\N	2026-08-26 19:48:53.819468	2026-08-28 15:09:21.863719	f	1	t	2026-08-26 19:48:53.819433	Cohort User 13	\N	f	en	\N	\N	\N	\N	\N	rzJfDntCXkNV9iyGoHy2	2026-08-26 19:48:53.820657	2026-08-26 19:48:53.819504	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:21.86359
129	cohort_user_14@external.org	$2a$11$Hk34/gGDCk34xYOqqt1WvukMVqMnG82xiGoZpuNRzWTelNAH0QAJ.	\N	\N	\N	2026-08-26 19:48:54.196646	2026-08-28 15:09:22.20282	f	1	t	2026-08-26 19:48:54.196561	Cohort User 14	\N	f	en	\N	\N	\N	\N	\N	AjvBDdbcy5NKN_UePjHz	2026-08-26 19:48:54.20294	2026-08-26 19:48:54.196691	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:22.2027
130	cohort_user_15@example.com	$2a$11$pwIz2LfqB9WewMXNa8cLaeMFpJaMq/XRZ10ZyUjO6wp0jz0OdRBTC	\N	\N	\N	2026-08-26 19:48:54.564805	2026-08-28 15:09:22.537953	f	1	t	2026-08-26 19:48:54.564772	Cohort User 15	\N	f	en	\N	\N	\N	\N	\N	R6JrFtnHe85z4xvwxEmQ	2026-08-26 19:48:54.566206	2026-08-26 19:48:54.564836	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:22.53783
131	cohort_user_16@example.com	$2a$11$5ZwiJPKUfZ8uKHxxQ4wOSOCEd7Rs8xBIwRM5r.JjAQCGuo5KXHzDe	\N	\N	\N	2026-08-26 19:48:54.925797	2026-08-28 15:09:22.874655	f	1	t	2026-08-26 19:48:54.925754	Cohort User 16	\N	f	en	\N	\N	\N	\N	\N	ibXeHe8fz8qY5cw1rug8	2026-08-26 19:48:54.927107	2026-08-26 19:48:54.925837	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:22.874522
132	cohort_user_17@example.com	$2a$11$NqgTG.WKG/fenhw20kGNgeDCxOHgDB4tGbyjrSqKoIbE1GhhReDWm	\N	\N	\N	2026-08-26 19:48:55.281257	2026-08-28 15:09:23.207275	f	1	t	2026-08-26 19:48:55.281223	Cohort User 17	\N	f	en	\N	\N	\N	\N	\N	KVzmciyv6zzjUByRXT_8	2026-08-26 19:48:55.282375	2026-08-26 19:48:55.281289	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:23.207152
133	cohort_user_18@example.com	$2a$11$Hu.yjbyLPz8ujuwfTV3ppeqJ.TsGoF.GHE1C4OUAk2qASf6bsevwu	\N	\N	\N	2026-08-26 19:48:55.648568	2026-08-28 15:09:23.565457	f	1	t	2026-08-26 19:48:55.648291	Cohort User 18	\N	f	en	\N	\N	\N	\N	\N	CBiWfjxrzo1x7FGnwB9x	2026-08-26 19:48:55.653411	2026-08-26 19:48:55.650069	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:23.565327
134	cohort_user_19@external.org	$2a$11$m1o2mPjsJWFgQdjnQ3DiN.e600wvTWhjN/coa2LjoOrZkosCdhag2	\N	\N	\N	2026-08-26 19:48:56.170754	2026-08-28 15:09:23.914203	f	1	t	2026-08-26 19:48:56.170721	Cohort User 19	\N	f	en	\N	\N	\N	\N	\N	Rag3NoM6eTCnp4oxTP5E	2026-08-26 19:48:56.171848	2026-08-26 19:48:56.170783	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:23.91408
135	cohort_user_20@example.com	$2a$11$B6OTOokCwTiRxZD4QH4nPOYSAMizt7uNXCn7sRslkabpBcGsKlGfC	\N	\N	\N	2026-08-26 19:48:56.550042	2026-08-28 15:09:24.245854	f	1	t	2026-08-26 19:48:56.549988	Cohort User 20	\N	f	en	\N	\N	\N	\N	\N	4TL5D2MFdFyG8rdxasDm	2026-08-26 19:48:56.55129	2026-08-26 19:48:56.550072	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:24.245729
136	cohort_user_21@example.com	$2a$11$BkOO1rbEb8KIFYHwx/V9V.ATMD9Dae.rMAfnM1RC.rBtlEJYUFZJK	\N	\N	\N	2026-08-26 19:48:56.91773	2026-08-28 15:09:24.569596	f	1	t	2026-08-26 19:48:56.917701	Cohort User 21	\N	f	en	\N	\N	\N	\N	\N	ozVYL9_Js8inTJawSfmi	2026-08-26 19:48:56.918837	2026-08-26 19:48:56.917755	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:24.569474
137	cohort_user_22@example.com	$2a$11$VXYkJUjg/OUIQzKHNRbQh.yASLViVFY0hHas6e32HWsAz0BYMAcni	\N	\N	\N	2026-08-26 19:48:57.283039	2026-08-28 15:09:24.886492	f	1	t	2026-08-26 19:48:57.28301	Cohort User 22	\N	f	en	\N	\N	\N	\N	\N	E8x7kHQyNyMtmSD-kCkQ	2026-08-26 19:48:57.284122	2026-08-26 19:48:57.283064	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:24.886368
138	cohort_user_23@example.com	$2a$11$42y2zMNLhNQUD0L65OzuK.dbjwxg9Nh20fPv34hCHqsLyOVTe5cfG	\N	\N	\N	2026-08-26 19:48:57.755354	2026-08-28 15:09:25.229921	f	1	t	2026-08-26 19:48:57.755324	Cohort User 23	\N	f	en	\N	\N	\N	\N	\N	9aue6B7v-sfGL9rgUjiC	2026-08-26 19:48:57.756508	2026-08-26 19:48:57.755381	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:25.229797
139	cohort_user_24@example.com	$2a$11$EzuBnaJNQPhxFrh.OMmsTO94jwj43y3WCNscBDojaxnmoDm.aVMqO	\N	\N	\N	2026-08-26 19:48:58.112259	2026-08-28 15:09:25.570411	f	1	t	2026-08-26 19:48:58.11223	Cohort User 24	\N	f	en	\N	\N	\N	\N	\N	4UWBWAyNppxa4uNSCoJ2	2026-08-26 19:48:58.113342	2026-08-26 19:48:58.112284	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:25.570287
140	cohort_user_25@example.com	$2a$11$p3dG8pcL.lEwC0C3pDj73uF7jE7mzrQCpv8BPZmoOVLCWiasv6dyK	\N	\N	\N	2026-08-26 19:48:58.48861	2026-08-28 15:09:25.905628	f	1	t	2026-08-26 19:48:58.488564	Cohort User 25	\N	f	en	\N	\N	\N	\N	\N	BWE3ZVN7v-DRZhxUT3rP	2026-08-26 19:48:58.489847	2026-08-26 19:48:58.488661	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:25.905488
141	cohort_user_26@example.com	$2a$11$6MVzMChvEzjYFhxNib5rxO7FqD/gr2mTKGwdsrPA18tZ5EeiQd9Zi	\N	\N	\N	2026-08-26 19:48:58.86665	2026-08-28 15:09:26.244324	f	1	t	2026-08-26 19:48:58.866616	Cohort User 26	\N	f	en	\N	\N	\N	\N	\N	hhSyiB9XjcCPLhgo1emf	2026-08-26 19:48:58.867768	2026-08-26 19:48:58.866679	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:26.244204
142	cohort_user_27@example.com	$2a$11$O9b.sExCVdEq58ZKCejc4.Fc6iK0ykpx7KwGHh5ePbHXLlWTtA.AK	\N	\N	\N	2026-08-26 19:48:59.220201	2026-08-28 15:09:26.561439	f	1	t	2026-08-26 19:48:59.220172	Cohort User 27	\N	f	en	\N	\N	\N	\N	\N	eHvGSqq1iDnsN6xf9fZV	2026-08-26 19:48:59.221268	2026-08-26 19:48:59.220226	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:26.561318
143	cohort_user_28@example.com	$2a$11$Z44Enn45E8x2hrP7lvu18uepVnp/kckWiWp9S/tz2uvZAhnJbNHqS	\N	\N	\N	2026-08-26 19:48:59.675657	2026-08-28 15:09:26.89996	f	1	t	2026-08-26 19:48:59.675625	Cohort User 28	\N	f	en	\N	\N	\N	\N	\N	xLuR8pjmcwDR_U96EwYJ	2026-08-26 19:48:59.676756	2026-08-26 19:48:59.675682	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:26.899825
144	cohort_user_29@example.com	$2a$11$kUBUOf5P/llNSdyt6SnXz.nDPbg8PGp9qazeu2yl8oEcDDp75lRV6	\N	\N	\N	2026-08-26 19:49:00.015238	2026-08-28 15:09:27.233694	f	1	t	2026-08-26 19:49:00.015207	Cohort User 29	\N	f	en	\N	\N	\N	\N	\N	eyyi-QAu34Tq-hJv_vDy	2026-08-26 19:49:00.016388	2026-08-26 19:49:00.015262	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:27.233573
145	cohort_user_30@example.com	$2a$11$3wt2PxYcNHZjN9Q1p6Mm7OmCqKAX845a2iWzluqdHnOv.KP3CJPTG	\N	\N	\N	2026-08-26 19:49:00.384646	2026-08-28 15:09:27.559992	f	1	t	2026-08-26 19:49:00.384606	Cohort User 30	\N	f	en	\N	\N	\N	\N	\N	65S82T-fSf9dsPrGx24R	2026-08-26 19:49:00.385704	2026-08-26 19:49:00.384673	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:27.559852
146	cohort_user_31@example.com	$2a$11$daFXOMUeoVWpHSM.hTqSFuxl/F/mxHlqL1xNgGpo.Tg048o6P0bRG	\N	\N	\N	2026-08-26 19:49:00.739188	2026-08-28 15:09:29.315222	f	1	t	2026-08-26 19:49:00.739157	Cohort User 31	\N	f	en	\N	\N	\N	\N	\N	3_-9VNCz3p8_2etYShF6	2026-08-26 19:49:00.740323	2026-08-26 19:49:00.739214	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:29.315102
147	cohort_user_32@example.com	$2a$11$x6somuzO22BvPO5k1pdurOawnu0G7NT6LH9KUV//j0bg42s89.ig6	\N	\N	\N	2026-08-26 19:49:01.083851	2026-08-28 15:09:29.638986	f	1	t	2026-08-26 19:49:01.08381	Cohort User 32	\N	f	en	\N	\N	\N	\N	\N	jX-8gCfsTgS4xaq1EnWe	2026-08-26 19:49:01.085034	2026-08-26 19:49:01.083881	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:29.638844
148	cohort_user_33@external.org	$2a$11$rprrJnOTkQXZxS8B1oHRROVIgj9.iiXRuKcR3uW/auVHBDoiKHjfS	\N	\N	\N	2026-08-26 19:49:01.548803	2026-08-28 15:09:29.985962	f	1	t	2026-08-26 19:49:01.548772	Cohort User 33	\N	f	en	\N	\N	\N	\N	\N	3kW6sdsEK4ykXyM5hjzz	2026-08-26 19:49:01.54993	2026-08-26 19:49:01.548828	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:29.985815
149	cohort_user_34@example.com	$2a$11$HVwjuPrysnEDyvrY63c6JeDQDfMJDj0sqcvHKFufAf4gjPOKybLoO	\N	\N	\N	2026-08-26 19:49:01.913335	2026-08-28 15:09:30.319028	f	1	t	2026-08-26 19:49:01.913305	Cohort User 34	\N	f	en	\N	\N	\N	\N	\N	1LUwbuoX8mDvyss7dWbC	2026-08-26 19:49:01.914648	2026-08-26 19:49:01.913361	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:30.318889
150	cohort_user_35@example.com	$2a$11$BHeFnJ.fXPFBBY4dOmi0M.vMoohnYkHZcu1GGe9sikiXiVM70lmRW	\N	\N	\N	2026-08-26 19:49:02.26714	2026-08-28 15:09:30.642889	f	1	t	2026-08-26 19:49:02.267109	Cohort User 35	\N	f	en	\N	\N	\N	\N	\N	g_9z4wSRZsmmq9eFgqA6	2026-08-26 19:49:02.268167	2026-08-26 19:49:02.267167	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:30.642752
151	cohort_user_36@example.com	$2a$11$LIodDooV0D0n0ibbDFwXaO7U/yxM/aUxiyvGLk73jc.BeA3biMxjW	\N	\N	\N	2026-08-26 19:49:02.608377	2026-08-28 15:09:30.982407	f	1	t	2026-08-26 19:49:02.608347	Cohort User 36	\N	f	en	\N	\N	\N	\N	\N	Um2gVT4Cbs26Th8yCxH9	2026-08-26 19:49:02.609496	2026-08-26 19:49:02.608401	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:30.982285
152	cohort_user_37@example.com	$2a$11$v39gNII0X/niLxa47aPz1uKFMHa72HCoWPbjfwynHCRHHDMXP0gBm	\N	\N	\N	2026-08-26 19:49:02.977824	2026-08-28 15:09:31.307624	f	1	t	2026-08-26 19:49:02.977792	Cohort User 37	\N	f	en	\N	\N	\N	\N	\N	-mXksvwMbJ1qFPHAG3mm	2026-08-26 19:49:02.979036	2026-08-26 19:49:02.977851	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:31.307331
153	cohort_user_38@example.com	$2a$11$9PDmjwdXAV1pcOQP43RFJublFx/.euUAzeO9HBKib4UO9.X1uDnL2	\N	\N	\N	2026-08-26 19:49:03.440905	2026-08-28 15:09:31.657127	f	1	t	2026-08-26 19:49:03.440871	Cohort User 38	\N	f	en	\N	\N	\N	\N	\N	qaq6jWuy5tsxmC11yn3c	2026-08-26 19:49:03.442302	2026-08-26 19:49:03.440938	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:31.657007
154	cohort_user_39@example.com	$2a$11$SZ9AwrWfgrkFsuBPNnSnvuCU.LPzoQ9tE67ck.MzOS8uKCdyTJBNm	\N	\N	\N	2026-08-26 19:49:03.787501	2026-08-28 15:09:31.998874	f	1	t	2026-08-26 19:49:03.787467	Cohort User 39	\N	f	en	\N	\N	\N	\N	\N	mt_KYekbyJ696TvTPEmb	2026-08-26 19:49:03.7887	2026-08-26 19:49:03.78753	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:31.998751
155	cohort_user_40@example.com	$2a$11$uFi9BHhkJ01q3rFzZeS58eu675UR6XMg3RmA062BBlnq.2ktE2QlO	\N	\N	\N	2026-08-26 19:49:04.16075	2026-08-28 15:09:32.332086	f	1	t	2026-08-26 19:49:04.160706	Cohort User 40	\N	f	en	\N	\N	\N	\N	\N	8h-FsYgyrcLau9xPtyo7	2026-08-26 19:49:04.161955	2026-08-26 19:49:04.16078	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:32.331958
156	cohort_user_41@example.com	$2a$11$SrzX2jtn/2Q2wf7kUOzWw.u9I4QsuEf9ML85a8hg6lY807dK5WpRa	\N	\N	\N	2026-08-26 19:49:04.507082	2026-08-28 15:09:32.666927	f	1	t	2026-08-26 19:49:04.507051	Cohort User 41	\N	f	en	\N	\N	\N	\N	\N	Q9R8EYhzB8PWxNPZFg1E	2026-08-26 19:49:04.508189	2026-08-26 19:49:04.507108	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:32.666792
157	cohort_user_42@example.com	$2a$11$CFRfVXtzkCjHHHyxpSAxFuI4CiZcqnRYABuscE51UrgQqwbxAPVGK	\N	\N	\N	2026-08-26 19:49:04.883203	2026-08-28 15:09:32.990607	f	1	t	2026-08-26 19:49:04.883173	Cohort User 42	\N	f	en	\N	\N	\N	\N	\N	NjrQq27HC6Pcr_VNCpzn	2026-08-26 19:49:04.884332	2026-08-26 19:49:04.883229	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:32.990484
158	cohort_user_43@example.com	$2a$11$ACziWd19cbq5JR2C0G4hheoOiSBNvlmQlNzoO0AOvwcALBH73TjRm	\N	\N	\N	2026-08-26 19:49:05.255865	2026-08-28 15:09:33.335573	f	1	t	2026-08-26 19:49:05.255832	Cohort User 43	\N	f	en	\N	\N	\N	\N	\N	dP6McyFDah5hp9ta3HtH	2026-08-26 19:49:05.257029	2026-08-26 19:49:05.255891	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:33.335448
159	cohort_user_44@example.com	$2a$11$6LV/ddEPJVBI6rrzxP9Tz.3.BhXGLCEgXkKaCTZqZU6Y5cEwI/WWy	\N	\N	\N	2026-08-26 19:49:05.617487	2026-08-28 15:09:33.667894	f	1	t	2026-08-26 19:49:05.617453	Cohort User 44	\N	f	en	\N	\N	\N	\N	\N	_VvbRQggzJ6n95tzWFJU	2026-08-26 19:49:05.618679	2026-08-26 19:49:05.617515	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:33.667774
160	cohort_user_45@example.com	$2a$11$LC2SRhq0Pv5LLFi8YKIAJ.mzosLpTabHySk11aJ7bkC/6nmOeaVJa	\N	\N	\N	2026-08-26 19:49:05.98615	2026-08-28 15:09:33.9998	f	1	t	2026-08-26 19:49:05.98612	Cohort User 45	\N	f	en	\N	\N	\N	\N	\N	hfT7ustuQKaLacDDsH6c	2026-08-26 19:49:05.98719	2026-08-26 19:49:05.986176	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:33.999677
161	cohort_user_46@example.com	$2a$11$JnZK1Z.wZGN0KMcb0N32NeoWsnmAaw9cCmUL5KbL6GUwSvpjr6c9W	\N	\N	\N	2026-08-26 19:49:06.356013	2026-08-28 15:09:34.325101	f	1	t	2026-08-26 19:49:06.355975	Cohort User 46	\N	f	en	\N	\N	\N	\N	\N	GB1-d4hZxw4k8Fb-Qr1d	2026-08-26 19:49:06.357409	2026-08-26 19:49:06.356042	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:34.324943
162	seminar_student_0@mampf.edu	$2a$11$b..l2N2Wx3EUvxCFB3dtBuYys1uZSADtlAm7Nj886EjzGHcjgK9Ke	\N	\N	\N	2026-08-26 19:49:06.839909	2026-08-28 15:09:34.64984	f	1	t	2026-08-26 19:49:06.839877	Seminar Student 0	\N	f	en	\N	\N	\N	\N	\N	KSsj9UMqzyMY65zT9FpG	2026-08-26 19:49:06.841306	2026-08-26 19:49:06.839934	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:34.649716
163	seminar_student_1@mampf.edu	$2a$11$KZh5j3JTt5OA5gQJuJaR4.yw.cwX.RPaI07N6lVMXR0kXf2l34bSa	\N	\N	\N	2026-08-26 19:49:07.212604	2026-08-28 15:09:34.997518	f	1	t	2026-08-26 19:49:07.212564	Seminar Student 1	\N	f	en	\N	\N	\N	\N	\N	SyMT1aHfsCLPKXea-oTe	2026-08-26 19:49:07.213909	2026-08-26 19:49:07.212675	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:34.997377
164	seminar_student_2@mampf.edu	$2a$11$qy.ud4OUjFMJoBre0HB0huwWVcPm/83xQvQElMUD8qv9VDOMKms.O	\N	\N	\N	2026-08-26 19:49:07.608118	2026-08-28 15:09:35.333641	f	1	t	2026-08-26 19:49:07.608085	Seminar Student 2	\N	f	en	\N	\N	\N	\N	\N	zQotxxfLNCf74HU3ioTw	2026-08-26 19:49:07.609509	2026-08-26 19:49:07.608148	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:35.333521
165	seminar_student_3@mampf.edu	$2a$11$t./NotMrpTnuC4rBZqWenOwABsmK/BkAf4W77MOj8U047VnT29ZSu	\N	\N	\N	2026-08-26 19:49:07.986028	2026-08-28 15:09:35.665493	f	1	t	2026-08-26 19:49:07.985997	Seminar Student 3	\N	f	en	\N	\N	\N	\N	\N	zeiFd1DsRN9zeLwVxBHM	2026-08-26 19:49:07.987127	2026-08-26 19:49:07.986054	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:35.665358
166	seminar_student_4@mampf.edu	$2a$11$eS.VS9AyLQYDEyVrq4NW1.IY0cGukLAOw/NO/w57EDDvkSYlabcNu	\N	\N	\N	2026-08-26 19:49:08.348105	2026-08-28 15:09:35.989311	f	1	t	2026-08-26 19:49:08.348073	Seminar Student 4	\N	f	en	\N	\N	\N	\N	\N	1PUZgsTMGH7LAwa9jxud	2026-08-26 19:49:08.349249	2026-08-26 19:49:08.348131	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:35.989188
167	seminar_student_5@mampf.edu	$2a$11$lNkatLEd/7G5.y5R2k9zIubEfB5THuHRumB1oL7OnOXzhVNN/VxdW	\N	\N	\N	2026-08-26 19:49:08.725561	2026-08-28 15:09:36.311163	f	1	t	2026-08-26 19:49:08.725523	Seminar Student 5	\N	f	en	\N	\N	\N	\N	\N	Q184oVSzs13EFzrX9gXv	2026-08-26 19:49:08.72684	2026-08-26 19:49:08.725599	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:36.311041
168	seminar_student_6@mampf.edu	$2a$11$rZJBCyYjqUp8/bwc6kRL5eAZwDgwSwmsawwfJ1msdpB7dQJ1YOPLO	\N	\N	\N	2026-08-26 19:49:09.105464	2026-08-28 15:09:36.66005	f	1	t	2026-08-26 19:49:09.105434	Seminar Student 6	\N	f	en	\N	\N	\N	\N	\N	4FV6TXM7f__xECh7p3U-	2026-08-26 19:49:09.106678	2026-08-26 19:49:09.105488	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:36.659929
169	seminar_student_7@mampf.edu	$2a$11$v57D.wcHyPDRJF3t/zrOcuMhKadpe1TicigIYCQWCRKi7CMbV.SZi	\N	\N	\N	2026-08-26 19:49:09.484028	2026-08-28 15:09:37.00481	f	1	t	2026-08-26 19:49:09.483998	Seminar Student 7	\N	f	en	\N	\N	\N	\N	\N	Dc4bhCzEZe6NFC2W2Mwk	2026-08-26 19:49:09.485255	2026-08-26 19:49:09.484053	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:37.004685
170	seminar_student_8@mampf.edu	$2a$11$LAPy9mTcvqnne1RczNWIGO04lEGdwWaiNoSxCfjhoQIY/lJnIKQ2a	\N	\N	\N	2026-08-26 19:49:09.860674	2026-08-28 15:09:37.342092	f	1	t	2026-08-26 19:49:09.860606	Seminar Student 8	\N	f	en	\N	\N	\N	\N	\N	WG6N7YytstRYrgzqyRhf	2026-08-26 19:49:09.861738	2026-08-26 19:49:09.860699	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:37.34186
171	seminar_student_9@mampf.edu	$2a$11$niMWYifQn2.KMIeQFp9CXeSbSCTvvvmQ9qdjecidLYCmRmlXC.Kny	\N	\N	\N	2026-08-26 19:49:10.233142	2026-08-28 15:09:37.675145	f	1	t	2026-08-26 19:49:10.233108	Seminar Student 9	\N	f	en	\N	\N	\N	\N	\N	pWY22vUGS2rYNF6wj5ZM	2026-08-26 19:49:10.234386	2026-08-26 19:49:10.233168	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:37.675021
172	seminar_student_10@mampf.edu	$2a$11$gPaWOe3UKQSMFw9jICdRmuyW8l7TpNteb/P9R0H6b5S/TkzZan53a	\N	\N	\N	2026-08-26 19:49:10.645526	2026-08-28 15:09:38.003297	f	1	t	2026-08-26 19:49:10.645495	Seminar Student 10	\N	f	en	\N	\N	\N	\N	\N	gFxKngprgPxr9DJaSY5y	2026-08-26 19:49:10.64709	2026-08-26 19:49:10.645551	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:38.003136
173	seminar_student_11@mampf.edu	$2a$11$B8hk0PCkW42ZWd/rKg9vmunr4CWe4cwNgwJpEsQkU7bEEKcz46Hze	\N	\N	\N	2026-08-26 19:49:11.017304	2026-08-28 15:09:38.356425	f	1	t	2026-08-26 19:49:11.017275	Seminar Student 11	\N	f	en	\N	\N	\N	\N	\N	wjqB6MJofAVoHyK3AtXc	2026-08-26 19:49:11.018421	2026-08-26 19:49:11.017329	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:38.356261
174	external_student_0@mampf.edu	$2a$11$N1IZw4i2xa4uMNWunPIGieNWIQjWgdBIviGc/GcilkUDPBt9gq99m	\N	\N	\N	2026-08-26 19:49:11.542474	2026-08-28 15:09:38.687823	f	1	t	2026-08-26 19:49:11.542442	External Student 0	\N	f	en	\N	\N	\N	\N	\N	_w8WH3rayxMdNVp7Atox	2026-08-26 19:49:11.543709	2026-08-26 19:49:11.542503	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:38.687698
175	external_student_1@mampf.edu	$2a$11$bjLvgBmU27Y5hC7vimwnr.Fh9VWUwAn1B.dXhXVEvfELdcC7Y2MpC	\N	\N	\N	2026-08-26 19:49:11.944519	2026-08-28 15:09:39.014844	f	1	t	2026-08-26 19:49:11.944487	External Student 1	\N	f	en	\N	\N	\N	\N	\N	Jp1yo7is46LfnAUXxhkb	2026-08-26 19:49:11.945618	2026-08-26 19:49:11.944545	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:39.0147
176	nachruecker_0@mampf.edu	$2a$11$2LBrwx.iRWc4wdIQI1W3wO7Hz2qGiibsDlNDjY4gWWTf5NbaCuHki	\N	\N	\N	2026-08-26 19:49:12.343176	2026-08-28 15:09:39.343886	f	1	t	2026-08-26 19:49:12.343135	Nachrücker 0	\N	f	en	\N	\N	\N	\N	\N	nqYxEXM2uMsQ9LyNtRxx	2026-08-26 19:49:12.344483	2026-08-26 19:49:12.343209	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:39.343764
177	nachruecker_1@mampf.edu	$2a$11$aHgupDuFk.EXTdZ60LfHW.PCj7bAGIYydHKujrjcrRCw7jB94Ywn.	\N	\N	\N	2026-08-26 19:49:12.755363	2026-08-28 15:09:39.666363	f	1	t	2026-08-26 19:49:12.755322	Nachrücker 1	\N	f	en	\N	\N	\N	\N	\N	pDFvxa6eas-y_ucSRkKJ	2026-08-26 19:49:12.756598	2026-08-26 19:49:12.755394	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:39.66623
178	nachruecker_2@mampf.edu	$2a$11$y2TW74PbvAceHf9KGPkZqO98T7qMnkus6/qHq4drlTiM6qSMijFyK	\N	\N	\N	2026-08-26 19:49:13.135653	2026-08-28 15:09:40.011273	f	1	t	2026-08-26 19:49:13.135618	Nachrücker 2	\N	f	en	\N	\N	\N	\N	\N	RXJHqLj7_SP2CTa3Utko	2026-08-26 19:49:13.136942	2026-08-26 19:49:13.135682	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:40.01113
179	nachruecker_3@mampf.edu	$2a$11$vB2IlROljC63WJYgn2NO1.vJOYCsHmleX9lYSuvc8rLCS..112kry	\N	\N	\N	2026-08-26 19:49:13.511281	2026-08-28 15:09:40.3476	f	1	t	2026-08-26 19:49:13.51125	Nachrücker 3	\N	f	en	\N	\N	\N	\N	\N	jH5bXcQ2e5J6AvTtoob8	2026-08-26 19:49:13.512424	2026-08-26 19:49:13.511308	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:40.347478
180	nachruecker_4@mampf.edu	$2a$11$icTSHssZQ1y84uqMVg5GZ.QgtWZdVM2Z8LurjgH8QAvZy/HMANkra	\N	\N	\N	2026-08-26 19:49:13.888892	2026-08-28 15:09:40.676401	f	1	t	2026-08-26 19:49:13.888852	Nachrücker 4	\N	f	en	\N	\N	\N	\N	\N	WSL3UBqzMp_csTxe6wxF	2026-08-26 19:49:13.890224	2026-08-26 19:49:13.888922	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:40.676279
181	yahaira.glover@skiles-skiles.test	$2a$11$xJqSlXTtlOFBlOeo9R0YWOFFlfNZW7jZy15g23Jw5LkxmyoP20yCu	\N	\N	\N	2026-08-26 19:49:14.359724	2026-08-28 15:09:41.000399	f	1	t	2026-08-26 19:49:14.359692	Valerie von Eifert	\N	f	en	\N	\N	\N	\N	\N	kAtuqafkxsS_RrajR4LQ	2026-08-26 19:49:14.361743	2026-08-26 19:49:14.359751	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:41.000278
182	adena_von@ziemann.test	$2a$11$iSwDa6kmqVkLtpGBE0I8m.H4mEXbxl2lMn8l39TuiNw/6WKHz47Iy	\N	\N	\N	2026-08-26 19:49:14.81331	2026-08-28 15:09:41.315377	f	1	t	2026-08-26 19:49:14.813278	Mathis Steinert	\N	f	en	\N	\N	\N	\N	\N	KDCxbQqTxtunzX2iBPVU	2026-08-26 19:49:14.815229	2026-08-26 19:49:14.813339	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:41.315249
183	alexis_bayer@mcclure.test	$2a$11$EeDcHAWY7HKQbeZPgXMaYur0ke4FffqLnpkc1StjMSjK/R5IDy3hy	\N	\N	\N	2026-08-26 19:49:15.258682	2026-08-28 15:09:41.731577	f	1	t	2026-08-26 19:49:15.258648	Hr. Sönke Weigel	\N	f	en	\N	\N	\N	\N	\N	GupsnKZS2GKszd_yQQyU	2026-08-26 19:49:15.260875	2026-08-26 19:49:15.258712	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:41.731407
184	tutor2@mampf.edu	$2a$11$MQJ669GN32UPD7ldywWh.OXq19gi5hUG46H.rP35pQEQ.qTtVvgHe	\N	\N	\N	2026-08-28 15:08:33.470488	2026-08-28 15:09:42.079763	f	1	t	2026-08-28 15:08:33.469896	Toni Tutor	\N	f	en	\N	\N	\N	\N	\N	D3jhzk9hwaoqu6bfGdSo	2026-08-28 15:08:33.475336	2026-08-28 15:08:33.470927	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	1	2026-08-28 15:09:42.07964
9	student5@mampf.edu	$2a$11$v7mkG8PYjSeznUv4c0UFsekQfxek/d4OGwfwrHxUftQayH8A.LM0G	\N	\N	\N	2020-11-28 16:30:12.956799	2026-08-28 15:08:39.588696	f	1	t	2020-11-28 16:30:12.958778	student5	\N	f	en	f	f	f	t	\N	eWAAGQqtUt9P31_dpHey	2020-11-28 16:30:18.870235	2020-11-28 16:30:12.956859	\N	t	t	t	t	t	t	t	Erika Musterfrau	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	0	\N
12	moded@mampf.edu	$2a$11$w8AvJqcdxKUUOr21bT7R4O8AN1CPySDwPym80R/FlEGi9M57Xm1l.	\N	\N	\N	2022-08-05 13:13:27.138526	2026-08-28 15:08:40.263843	f	1	t	2022-08-05 13:13:27.140572	moded	\N	f	en	f	f	f	f	\N	GEw-LMkj1zw73bsu-Jy5	2022-08-05 13:13:35.913881	2022-08-05 13:13:27.138906	\N	f	f	f	f	f	f	f		\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N	0	\N
\.


--
-- TOC entry 4929 (class 0 OID 9664384)
-- Dependencies: 393
-- Data for Name: vignettes_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_answers (id, type, vignettes_question_id, vignettes_slide_id, vignettes_user_answer_id, text, likert_scale_value, created_at, updated_at) FROM stdin;
8	Vignettes::TextAnswer	4	4	4	Schlangenlemma	\N	2025-07-14 15:12:42.170271	2025-07-14 15:12:42.170271
9	Vignettes::MultipleChoiceAnswer	5	5	4	\N	\N	2025-07-14 15:13:10.788364	2025-07-14 15:13:10.788364
10	Vignettes::LikertScaleAnswer	6	6	4	\N	disagree	2025-07-14 15:13:15.60867	2025-07-14 15:13:15.60867
\.


--
-- TOC entry 4931 (class 0 OID 9664396)
-- Dependencies: 395
-- Data for Name: vignettes_answers_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_answers_options (vignettes_answer_id, vignettes_option_id) FROM stdin;
9	7
\.


--
-- TOC entry 4932 (class 0 OID 9664401)
-- Dependencies: 396
-- Data for Name: vignettes_codenames; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_codenames (id, pseudonym, user_id, lecture_id, created_at, updated_at) FROM stdin;
1	HZUS57	5	28	2025-07-14 11:50:20.413531	2025-07-14 11:50:20.413531
2	UJSBGATR	6	28	2025-07-14 14:02:29.627335	2025-07-14 14:02:29.627335
3	7HZSGRE	7	28	2025-07-14 15:04:23.913466	2025-07-14 15:04:23.913466
\.


--
-- TOC entry 4934 (class 0 OID 9664410)
-- Dependencies: 398
-- Data for Name: vignettes_completion_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_completion_messages (id, lecture_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4936 (class 0 OID 9664418)
-- Dependencies: 400
-- Data for Name: vignettes_info_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_info_slides (id, title, vignettes_questionnaire_id, icon_type, created_at, updated_at) FROM stdin;
2	Informationen	2	eye	2025-07-14 15:09:29.112665	2025-07-14 15:09:29.116847
\.


--
-- TOC entry 4938 (class 0 OID 9664429)
-- Dependencies: 402
-- Data for Name: vignettes_info_slides_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_info_slides_slides (vignettes_info_slide_id, vignettes_slide_id) FROM stdin;
2	5
\.


--
-- TOC entry 4939 (class 0 OID 9664434)
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
-- TOC entry 4941 (class 0 OID 9664444)
-- Dependencies: 405
-- Data for Name: vignettes_questionnaires; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_questionnaires (id, title, lecture_id, published, editable, created_at, updated_at) FROM stdin;
2	Testvignette	28	t	f	2025-07-14 15:09:11.919174	2025-07-14 15:12:00.430996
\.


--
-- TOC entry 4943 (class 0 OID 9664455)
-- Dependencies: 407
-- Data for Name: vignettes_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_questions (id, type, question_text, vignettes_slide_id, only_integer, min_number, max_number, language, created_at, updated_at) FROM stdin;
4	Vignettes::TextQuestion	Was ist das?	4	f	\N	\N	en	2025-07-14 15:10:15.639754	2025-07-14 15:10:15.639754
5	Vignettes::MultipleChoiceQuestion	Welches Tastaturlayout ist das?	5	f	\N	\N	en	2025-07-14 15:11:22.028604	2025-07-14 15:11:22.028604
6	Vignettes::LikertScaleQuestion	Wurden deine Erwartungen erfüllt?	6	f	\N	\N	de	2025-07-14 15:11:52.25297	2025-07-14 15:11:52.25297
\.


--
-- TOC entry 4945 (class 0 OID 9664467)
-- Dependencies: 409
-- Data for Name: vignettes_slide_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_slide_statistics (id, user_id, vignettes_answer_id, time_on_slide, total_time_on_slide, time_on_info_slides, info_slides_access_count, info_slides_first_access_time, created_at, updated_at) FROM stdin;
2	5	8	23	23	{}	{}	{}	2025-07-14 15:12:42.171486	2025-07-14 15:12:42.171486
3	5	9	28	28	{}	{}	{}	2025-07-14 15:13:10.789473	2025-07-14 15:13:10.789473
4	5	10	4	4	{}	{}	{}	2025-07-14 15:13:15.610299	2025-07-14 15:13:15.610299
\.


--
-- TOC entry 4947 (class 0 OID 9664477)
-- Dependencies: 411
-- Data for Name: vignettes_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_slides (id, title, vignettes_questionnaire_id, "position", created_at, updated_at) FROM stdin;
4	Erste Slide	2	1	2025-07-14 15:10:15.622982	2025-07-14 15:10:15.700008
5	Zweite Slide	2	2	2025-07-14 15:11:22.015487	2025-07-14 15:11:22.055107
6	Letzte Slide	2	3	2025-07-14 15:11:52.25048	2025-07-14 15:11:52.252295
\.


--
-- TOC entry 4949 (class 0 OID 9664489)
-- Dependencies: 413
-- Data for Name: vignettes_user_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_user_answers (id, user_id, vignettes_questionnaire_id, created_at, updated_at) FROM stdin;
4	5	2	2025-07-14 15:12:18.622235	2025-07-14 15:12:18.622235
\.


--
-- TOC entry 4951 (class 0 OID 9664498)
-- Dependencies: 415
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
1	Commontator::Comment	3	User	6	t	\N	1	2022-08-05 13:39:47.797346	2022-08-05 13:39:47.797346
\.


--
-- TOC entry 4953 (class 0 OID 9664507)
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
-- TOC entry 4954 (class 0 OID 9664519)
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
9	7	42	1	2026-08-26 19:49:19.068679	2026-08-26 19:49:19.068679
10	7	49	2	2026-08-26 19:49:19.075649	2026-08-26 19:49:19.075649
11	7	51	3	2026-08-26 19:49:19.082077	2026-08-26 19:49:19.082077
12	8	42	1	2026-08-26 19:49:19.095078	2026-08-26 19:49:19.095078
13	8	41	2	2026-08-26 19:49:19.101322	2026-08-26 19:49:19.101322
14	8	51	3	2026-08-26 19:49:19.108334	2026-08-26 19:49:19.108334
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
\.


--
-- TOC entry 4956 (class 0 OID 9664528)
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

SELECT pg_catalog.setval('public.announcements_id_seq', 23, true);


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

SELECT pg_catalog.setval('public.cohorts_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.flipper_gates_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.lecture_user_joins_id_seq', 179, true);


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

SELECT pg_catalog.setval('public.notifications_id_seq', 999, true);


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

SELECT pg_catalog.setval('public.speaker_talk_joins_id_seq', 25, true);


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

SELECT pg_catalog.setval('public.talks_id_seq', 54, true);


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

SELECT pg_catalog.setval('public.user_submission_joins_id_seq', 44, true);


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

SELECT pg_catalog.setval('public.watchlist_entries_id_seq', 46, true);


--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 421
-- Name: watchlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlists_id_seq', 18, true);


--
-- TOC entry 4075 (class 2606 OID 9664643)
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- TOC entry 4078 (class 2606 OID 9664645)
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 4082 (class 2606 OID 9664647)
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4085 (class 2606 OID 9664649)
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- TOC entry 4088 (class 2606 OID 9664651)
-- Name: annotations annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- TOC entry 4092 (class 2606 OID 9664653)
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- TOC entry 4096 (class 2606 OID 9664655)
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4101 (class 2606 OID 9664657)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 4103 (class 2606 OID 9664659)
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 4107 (class 2606 OID 9664661)
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4110 (class 2606 OID 9664663)
-- Name: claims claims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT claims_pkey PRIMARY KEY (id);


--
-- TOC entry 4114 (class 2606 OID 9664665)
-- Name: cohort_memberships cohort_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT cohort_memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 4120 (class 2606 OID 9664667)
-- Name: cohorts cohorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohorts
    ADD CONSTRAINT cohorts_pkey PRIMARY KEY (id);


--
-- TOC entry 4125 (class 2606 OID 9664669)
-- Name: commontator_comments commontator_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT commontator_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4133 (class 2606 OID 9664671)
-- Name: commontator_subscriptions commontator_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT commontator_subscriptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4137 (class 2606 OID 9664673)
-- Name: commontator_threads commontator_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads
    ADD CONSTRAINT commontator_threads_pkey PRIMARY KEY (id);


--
-- TOC entry 4141 (class 2606 OID 9664675)
-- Name: course_self_joins course_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT course_self_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4146 (class 2606 OID 9664677)
-- Name: course_tag_joins course_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins
    ADD CONSTRAINT course_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4150 (class 2606 OID 9664679)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 4156 (class 2606 OID 9664681)
-- Name: division_course_joins division_course_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins
    ADD CONSTRAINT division_course_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4160 (class 2606 OID 9664683)
-- Name: division_translations division_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations
    ADD CONSTRAINT division_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4164 (class 2606 OID 9664685)
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- TOC entry 4167 (class 2606 OID 9664687)
-- Name: editable_user_joins editable_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins
    ADD CONSTRAINT editable_user_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4171 (class 2606 OID 9664689)
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- TOC entry 4174 (class 2606 OID 9664691)
-- Name: flipper_features flipper_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_features
    ADD CONSTRAINT flipper_features_pkey PRIMARY KEY (id);


--
-- TOC entry 4177 (class 2606 OID 9664693)
-- Name: flipper_gates flipper_gates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_gates
    ADD CONSTRAINT flipper_gates_pkey PRIMARY KEY (id);


--
-- TOC entry 4180 (class 2606 OID 9664695)
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- TOC entry 4186 (class 2606 OID 9664697)
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- TOC entry 4192 (class 2606 OID 9664699)
-- Name: item_self_joins item_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins
    ADD CONSTRAINT item_self_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4196 (class 2606 OID 9664701)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 4202 (class 2606 OID 9664703)
-- Name: lecture_memberships lecture_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT lecture_memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 4207 (class 2606 OID 9664705)
-- Name: lecture_user_joins lecture_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT lecture_user_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4213 (class 2606 OID 9664707)
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- TOC entry 4217 (class 2606 OID 9664709)
-- Name: lesson_section_joins lesson_section_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins
    ADD CONSTRAINT lesson_section_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4221 (class 2606 OID 9664711)
-- Name: lesson_tag_joins lesson_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins
    ADD CONSTRAINT lesson_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4224 (class 2606 OID 9664713)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 4229 (class 2606 OID 9664715)
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- TOC entry 4239 (class 2606 OID 9664717)
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- TOC entry 4243 (class 2606 OID 9664719)
-- Name: medium_tag_joins medium_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT medium_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4247 (class 2606 OID 9664721)
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4253 (class 2606 OID 9664723)
-- Name: notions notions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions
    ADD CONSTRAINT notions_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 9664725)
-- Name: program_translations program_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations
    ADD CONSTRAINT program_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4260 (class 2606 OID 9664727)
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- TOC entry 4264 (class 2606 OID 9664729)
-- Name: quiz_certificates quiz_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT quiz_certificates_pkey PRIMARY KEY (id);


--
-- TOC entry 4266 (class 2606 OID 9664731)
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- TOC entry 4270 (class 2606 OID 9664733)
-- Name: redemptions redemptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT redemptions_pkey PRIMARY KEY (id);


--
-- TOC entry 4274 (class 2606 OID 9664735)
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- TOC entry 4279 (class 2606 OID 9664737)
-- Name: registration_campaigns registration_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_campaigns
    ADD CONSTRAINT registration_campaigns_pkey PRIMARY KEY (id);


--
-- TOC entry 4283 (class 2606 OID 9664739)
-- Name: registration_items registration_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_items
    ADD CONSTRAINT registration_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4290 (class 2606 OID 9664741)
-- Name: registration_policies registration_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_policies
    ADD CONSTRAINT registration_policies_pkey PRIMARY KEY (id);


--
-- TOC entry 4294 (class 2606 OID 9664743)
-- Name: registration_student_messages registration_student_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT registration_student_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 9664745)
-- Name: registration_user_registrations registration_user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT registration_user_registrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4310 (class 2606 OID 9664747)
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- TOC entry 4312 (class 2606 OID 9664749)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 4316 (class 2606 OID 9664751)
-- Name: section_tag_joins section_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins
    ADD CONSTRAINT section_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4320 (class 2606 OID 9664753)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 4326 (class 2606 OID 9664755)
-- Name: speaker_talk_joins speaker_talk_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT speaker_talk_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4330 (class 2606 OID 9664757)
-- Name: subject_translations subject_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations
    ADD CONSTRAINT subject_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4332 (class 2606 OID 9664759)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 9664761)
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4339 (class 2606 OID 9664763)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 4343 (class 2606 OID 9664765)
-- Name: talk_tag_joins talk_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT talk_tag_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 9664767)
-- Name: talks talks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT talks_pkey PRIMARY KEY (id);


--
-- TOC entry 4350 (class 2606 OID 9664769)
-- Name: terms terms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT terms_pkey PRIMARY KEY (id);


--
-- TOC entry 4355 (class 2606 OID 9664771)
-- Name: thredded_categories thredded_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories
    ADD CONSTRAINT thredded_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4357 (class 2606 OID 9664773)
-- Name: thredded_messageboard_groups thredded_messageboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups
    ADD CONSTRAINT thredded_messageboard_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4359 (class 2606 OID 9664775)
-- Name: thredded_messageboard_notifications_for_followed_topics thredded_messageboard_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics
    ADD CONSTRAINT thredded_messageboard_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4364 (class 2606 OID 9664777)
-- Name: thredded_messageboard_users thredded_messageboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT thredded_messageboard_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4368 (class 2606 OID 9664779)
-- Name: thredded_messageboards thredded_messageboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards
    ADD CONSTRAINT thredded_messageboards_pkey PRIMARY KEY (id);


--
-- TOC entry 4370 (class 2606 OID 9664781)
-- Name: thredded_notifications_for_followed_topics thredded_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics
    ADD CONSTRAINT thredded_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4373 (class 2606 OID 9664783)
-- Name: thredded_notifications_for_private_topics thredded_notifications_for_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics
    ADD CONSTRAINT thredded_notifications_for_private_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4377 (class 2606 OID 9664785)
-- Name: thredded_post_moderation_records thredded_post_moderation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records
    ADD CONSTRAINT thredded_post_moderation_records_pkey PRIMARY KEY (id);


--
-- TOC entry 4385 (class 2606 OID 9664787)
-- Name: thredded_posts thredded_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts
    ADD CONSTRAINT thredded_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4388 (class 2606 OID 9664789)
-- Name: thredded_private_posts thredded_private_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts
    ADD CONSTRAINT thredded_private_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4393 (class 2606 OID 9664791)
-- Name: thredded_private_topics thredded_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics
    ADD CONSTRAINT thredded_private_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4397 (class 2606 OID 9664793)
-- Name: thredded_private_users thredded_private_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users
    ADD CONSTRAINT thredded_private_users_pkey PRIMARY KEY (id);


--
-- TOC entry 4401 (class 2606 OID 9664795)
-- Name: thredded_topic_categories thredded_topic_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories
    ADD CONSTRAINT thredded_topic_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4409 (class 2606 OID 9664797)
-- Name: thredded_topics thredded_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics
    ADD CONSTRAINT thredded_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 4415 (class 2606 OID 9664799)
-- Name: thredded_user_details thredded_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details
    ADD CONSTRAINT thredded_user_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4417 (class 2606 OID 9664801)
-- Name: thredded_user_messageboard_preferences thredded_user_messageboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences
    ADD CONSTRAINT thredded_user_messageboard_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 4422 (class 2606 OID 9664803)
-- Name: thredded_user_post_notifications thredded_user_post_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT thredded_user_post_notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 4425 (class 2606 OID 9664805)
-- Name: thredded_user_preferences thredded_user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences
    ADD CONSTRAINT thredded_user_preferences_pkey PRIMARY KEY (id);


--
-- TOC entry 4427 (class 2606 OID 9664807)
-- Name: thredded_user_private_topic_read_states thredded_user_private_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states
    ADD CONSTRAINT thredded_user_private_topic_read_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4430 (class 2606 OID 9664809)
-- Name: thredded_user_topic_follows thredded_user_topic_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows
    ADD CONSTRAINT thredded_user_topic_follows_pkey PRIMARY KEY (id);


--
-- TOC entry 4434 (class 2606 OID 9664811)
-- Name: thredded_user_topic_read_states thredded_user_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states
    ADD CONSTRAINT thredded_user_topic_read_states_pkey PRIMARY KEY (id);


--
-- TOC entry 4441 (class 2606 OID 9664813)
-- Name: tutor_tutorial_joins tutor_tutorial_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT tutor_tutorial_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4448 (class 2606 OID 9664815)
-- Name: tutorial_memberships tutorial_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT tutorial_memberships_pkey PRIMARY KEY (id);


--
-- TOC entry 4453 (class 2606 OID 9664817)
-- Name: tutorials tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT tutorials_pkey PRIMARY KEY (id);


--
-- TOC entry 4457 (class 2606 OID 9664819)
-- Name: user_favorite_lecture_joins user_favorite_lecture_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT user_favorite_lecture_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4461 (class 2606 OID 9664821)
-- Name: user_submission_joins user_submission_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT user_submission_joins_pkey PRIMARY KEY (id);


--
-- TOC entry 4467 (class 2606 OID 9664823)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4472 (class 2606 OID 9664825)
-- Name: vignettes_answers vignettes_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT vignettes_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4478 (class 2606 OID 9664827)
-- Name: vignettes_codenames vignettes_codenames_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT vignettes_codenames_pkey PRIMARY KEY (id);


--
-- TOC entry 4481 (class 2606 OID 9664829)
-- Name: vignettes_completion_messages vignettes_completion_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages
    ADD CONSTRAINT vignettes_completion_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4484 (class 2606 OID 9664831)
-- Name: vignettes_info_slides vignettes_info_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_info_slides
    ADD CONSTRAINT vignettes_info_slides_pkey PRIMARY KEY (id);


--
-- TOC entry 4489 (class 2606 OID 9664833)
-- Name: vignettes_options vignettes_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options
    ADD CONSTRAINT vignettes_options_pkey PRIMARY KEY (id);


--
-- TOC entry 4492 (class 2606 OID 9664835)
-- Name: vignettes_questionnaires vignettes_questionnaires_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires
    ADD CONSTRAINT vignettes_questionnaires_pkey PRIMARY KEY (id);


--
-- TOC entry 4495 (class 2606 OID 9664837)
-- Name: vignettes_questions vignettes_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions
    ADD CONSTRAINT vignettes_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4499 (class 2606 OID 9664839)
-- Name: vignettes_slide_statistics vignettes_slide_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT vignettes_slide_statistics_pkey PRIMARY KEY (id);


--
-- TOC entry 4503 (class 2606 OID 9664841)
-- Name: vignettes_slides vignettes_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides
    ADD CONSTRAINT vignettes_slides_pkey PRIMARY KEY (id);


--
-- TOC entry 4507 (class 2606 OID 9664843)
-- Name: vignettes_user_answers vignettes_user_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT vignettes_user_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4513 (class 2606 OID 9664845)
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- TOC entry 4517 (class 2606 OID 9664847)
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 4521 (class 2606 OID 9664849)
-- Name: watchlist_entries watchlist_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT watchlist_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 4525 (class 2606 OID 9664851)
-- Name: watchlists watchlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_pkey PRIMARY KEY (id);


--
-- TOC entry 4485 (class 1259 OID 9664852)
-- Name: idx_on_vignettes_info_slide_id_vignettes_slide_id_2bdc65ab76; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_vignettes_info_slide_id_vignettes_slide_id_2bdc65ab76 ON public.vignettes_info_slides_slides USING btree (vignettes_info_slide_id, vignettes_slide_id);


--
-- TOC entry 4486 (class 1259 OID 9664853)
-- Name: idx_on_vignettes_slide_id_vignettes_info_slide_id_c74f04e951; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_vignettes_slide_id_vignettes_info_slide_id_c74f04e951 ON public.vignettes_info_slides_slides USING btree (vignettes_slide_id, vignettes_info_slide_id);


--
-- TOC entry 4076 (class 1259 OID 9664854)
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- TOC entry 4079 (class 1259 OID 9664855)
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- TOC entry 4080 (class 1259 OID 9664856)
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- TOC entry 4083 (class 1259 OID 9664857)
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- TOC entry 4086 (class 1259 OID 9664858)
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- TOC entry 4089 (class 1259 OID 9664859)
-- Name: index_annotations_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_annotations_on_medium_id ON public.annotations USING btree (medium_id);


--
-- TOC entry 4090 (class 1259 OID 9664860)
-- Name: index_annotations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_annotations_on_user_id ON public.annotations USING btree (user_id);


--
-- TOC entry 4093 (class 1259 OID 9664861)
-- Name: index_announcements_on_announcer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_announcer_id ON public.announcements USING btree (announcer_id);


--
-- TOC entry 4094 (class 1259 OID 9664862)
-- Name: index_announcements_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_lecture_id ON public.announcements USING btree (lecture_id);


--
-- TOC entry 4097 (class 1259 OID 9664863)
-- Name: index_answers_on_explanation_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_explanation_trgm ON public.answers USING gin (explanation public.gin_trgm_ops);


--
-- TOC entry 4098 (class 1259 OID 9664864)
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- TOC entry 4099 (class 1259 OID 9664865)
-- Name: index_answers_on_text_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_text_trgm ON public.answers USING gin (text public.gin_trgm_ops);


--
-- TOC entry 4473 (class 1259 OID 9664866)
-- Name: index_answers_options_on_answer_id_and_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_options_on_answer_id_and_option_id ON public.vignettes_answers_options USING btree (vignettes_answer_id, vignettes_option_id);


--
-- TOC entry 4474 (class 1259 OID 9664867)
-- Name: index_answers_options_on_option_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_options_on_option_id_and_answer_id ON public.vignettes_answers_options USING btree (vignettes_option_id, vignettes_answer_id);


--
-- TOC entry 4104 (class 1259 OID 9664868)
-- Name: index_assignments_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_lecture_id ON public.assignments USING btree (lecture_id);


--
-- TOC entry 4105 (class 1259 OID 9664869)
-- Name: index_assignments_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_medium_id ON public.assignments USING btree (medium_id);


--
-- TOC entry 4108 (class 1259 OID 9664870)
-- Name: index_chapters_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_lecture_id ON public.chapters USING btree (lecture_id);


--
-- TOC entry 4111 (class 1259 OID 9664871)
-- Name: index_claims_on_claimable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_claims_on_claimable ON public.claims USING btree (claimable_type, claimable_id);


--
-- TOC entry 4112 (class 1259 OID 9664872)
-- Name: index_claims_on_redemption_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_claims_on_redemption_id ON public.claims USING btree (redemption_id);


--
-- TOC entry 4115 (class 1259 OID 9664873)
-- Name: index_cohort_memberships_on_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_cohort_id ON public.cohort_memberships USING btree (cohort_id);


--
-- TOC entry 4116 (class 1259 OID 9664874)
-- Name: index_cohort_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_source_campaign_id ON public.cohort_memberships USING btree (source_campaign_id);


--
-- TOC entry 4117 (class 1259 OID 9664875)
-- Name: index_cohort_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_user_id ON public.cohort_memberships USING btree (user_id);


--
-- TOC entry 4118 (class 1259 OID 9664876)
-- Name: index_cohort_memberships_on_user_id_and_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cohort_memberships_on_user_id_and_cohort_id ON public.cohort_memberships USING btree (user_id, cohort_id);


--
-- TOC entry 4121 (class 1259 OID 9664877)
-- Name: index_cohorts_on_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_context ON public.cohorts USING btree (context_type, context_id);


--
-- TOC entry 4122 (class 1259 OID 9664878)
-- Name: index_cohorts_on_context_and_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cohorts_on_context_and_title_unique ON public.cohorts USING btree (context_type, context_id, title);


--
-- TOC entry 4123 (class 1259 OID 9664879)
-- Name: index_cohorts_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_self_materialization_mode ON public.cohorts USING btree (self_materialization_mode);


--
-- TOC entry 4126 (class 1259 OID 9664880)
-- Name: index_commontator_comments_on_c_id_and_c_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_c_id_and_c_type_and_t_id ON public.commontator_comments USING btree (creator_id, creator_type, thread_id);


--
-- TOC entry 4127 (class 1259 OID 9664881)
-- Name: index_commontator_comments_on_cached_votes_down; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_down ON public.commontator_comments USING btree (cached_votes_down);


--
-- TOC entry 4128 (class 1259 OID 9664882)
-- Name: index_commontator_comments_on_cached_votes_up; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_up ON public.commontator_comments USING btree (cached_votes_up);


--
-- TOC entry 4129 (class 1259 OID 9664883)
-- Name: index_commontator_comments_on_editor_type_and_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_editor_type_and_editor_id ON public.commontator_comments USING btree (editor_type, editor_id);


--
-- TOC entry 4130 (class 1259 OID 9664884)
-- Name: index_commontator_comments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_parent_id ON public.commontator_comments USING btree (parent_id);


--
-- TOC entry 4131 (class 1259 OID 9664885)
-- Name: index_commontator_comments_on_thread_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_thread_id_and_created_at ON public.commontator_comments USING btree (thread_id, created_at);


--
-- TOC entry 4134 (class 1259 OID 9664886)
-- Name: index_commontator_subscriptions_on_s_id_and_s_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_subscriptions_on_s_id_and_s_type_and_t_id ON public.commontator_subscriptions USING btree (subscriber_id, subscriber_type, thread_id);


--
-- TOC entry 4135 (class 1259 OID 9664887)
-- Name: index_commontator_subscriptions_on_thread_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_subscriptions_on_thread_id ON public.commontator_subscriptions USING btree (thread_id);


--
-- TOC entry 4138 (class 1259 OID 9664888)
-- Name: index_commontator_threads_on_c_id_and_c_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_threads_on_c_id_and_c_type ON public.commontator_threads USING btree (commontable_type, commontable_id);


--
-- TOC entry 4139 (class 1259 OID 9664889)
-- Name: index_commontator_threads_on_closer_type_and_closer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_threads_on_closer_type_and_closer_id ON public.commontator_threads USING btree (closer_type, closer_id);


--
-- TOC entry 4142 (class 1259 OID 9664890)
-- Name: index_course_self_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_course_id ON public.course_self_joins USING btree (course_id);


--
-- TOC entry 4143 (class 1259 OID 9664891)
-- Name: index_course_self_joins_on_course_id_and_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_course_self_joins_on_course_id_and_preceding_course_id ON public.course_self_joins USING btree (course_id, preceding_course_id);


--
-- TOC entry 4144 (class 1259 OID 9664892)
-- Name: index_course_self_joins_on_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_preceding_course_id ON public.course_self_joins USING btree (preceding_course_id);


--
-- TOC entry 4147 (class 1259 OID 9664893)
-- Name: index_course_tag_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_course_id ON public.course_tag_joins USING btree (course_id);


--
-- TOC entry 4148 (class 1259 OID 9664894)
-- Name: index_course_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_tag_id ON public.course_tag_joins USING btree (tag_id);


--
-- TOC entry 4151 (class 1259 OID 9664895)
-- Name: index_courses_on_short_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_short_title_trgm ON public.courses USING gin (short_title public.gin_trgm_ops);


--
-- TOC entry 4152 (class 1259 OID 9664896)
-- Name: index_courses_on_term_independent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_term_independent ON public.courses USING btree (term_independent);


--
-- TOC entry 4153 (class 1259 OID 9664897)
-- Name: index_courses_on_title_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_title_trigram ON public.courses USING gin (title public.gin_trgm_ops);


--
-- TOC entry 4154 (class 1259 OID 9664898)
-- Name: index_courses_on_title_tsearch; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_title_tsearch ON public.courses USING gin (to_tsvector('simple'::regconfig, (title)::text));


--
-- TOC entry 4157 (class 1259 OID 9664899)
-- Name: index_division_course_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_course_id ON public.division_course_joins USING btree (course_id);


--
-- TOC entry 4158 (class 1259 OID 9664900)
-- Name: index_division_course_joins_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_division_id ON public.division_course_joins USING btree (division_id);


--
-- TOC entry 4161 (class 1259 OID 9664901)
-- Name: index_division_translations_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_division_id ON public.division_translations USING btree (division_id);


--
-- TOC entry 4162 (class 1259 OID 9664902)
-- Name: index_division_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_locale ON public.division_translations USING btree (locale);


--
-- TOC entry 4165 (class 1259 OID 9664903)
-- Name: index_divisions_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_divisions_on_program_id ON public.divisions USING btree (program_id);


--
-- TOC entry 4172 (class 1259 OID 9664904)
-- Name: index_feedbacks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feedbacks_on_user_id ON public.feedbacks USING btree (user_id);


--
-- TOC entry 4175 (class 1259 OID 9664905)
-- Name: index_flipper_features_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_flipper_features_on_key ON public.flipper_features USING btree (key);


--
-- TOC entry 4178 (class 1259 OID 9664906)
-- Name: index_flipper_gates_on_feature_key_and_key_and_value; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_flipper_gates_on_feature_key_and_key_and_value ON public.flipper_gates USING btree (feature_key, key, value);


--
-- TOC entry 4181 (class 1259 OID 9664907)
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- TOC entry 4182 (class 1259 OID 9664908)
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- TOC entry 4183 (class 1259 OID 9664909)
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- TOC entry 4184 (class 1259 OID 9664910)
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- TOC entry 4187 (class 1259 OID 9664911)
-- Name: index_imports_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_medium_id ON public.imports USING btree (medium_id);


--
-- TOC entry 4188 (class 1259 OID 9664912)
-- Name: index_imports_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_teachable_type_and_teachable_id ON public.imports USING btree (teachable_type, teachable_id);


--
-- TOC entry 4189 (class 1259 OID 9664913)
-- Name: index_item_self_joins_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_item_id ON public.item_self_joins USING btree (item_id);


--
-- TOC entry 4190 (class 1259 OID 9664914)
-- Name: index_item_self_joins_on_related_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_related_item_id ON public.item_self_joins USING btree (related_item_id);


--
-- TOC entry 4193 (class 1259 OID 9664915)
-- Name: index_items_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_medium_id ON public.items USING btree (medium_id);


--
-- TOC entry 4194 (class 1259 OID 9664916)
-- Name: index_items_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_section_id ON public.items USING btree (section_id);


--
-- TOC entry 4197 (class 1259 OID 9664917)
-- Name: index_lecture_memberships_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_lecture_id ON public.lecture_memberships USING btree (lecture_id);


--
-- TOC entry 4198 (class 1259 OID 9664918)
-- Name: index_lecture_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_source_campaign_id ON public.lecture_memberships USING btree (source_campaign_id);


--
-- TOC entry 4199 (class 1259 OID 9664919)
-- Name: index_lecture_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_user_id ON public.lecture_memberships USING btree (user_id);


--
-- TOC entry 4200 (class 1259 OID 9664920)
-- Name: index_lecture_memberships_on_user_id_and_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_lecture_memberships_on_user_id_and_lecture_id ON public.lecture_memberships USING btree (user_id, lecture_id);


--
-- TOC entry 4203 (class 1259 OID 9664921)
-- Name: index_lecture_user_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_lecture_id ON public.lecture_user_joins USING btree (lecture_id);


--
-- TOC entry 4204 (class 1259 OID 9664922)
-- Name: index_lecture_user_joins_on_lecture_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_lecture_user_joins_on_lecture_id_and_user_id ON public.lecture_user_joins USING btree (lecture_id, user_id);


--
-- TOC entry 4205 (class 1259 OID 9664923)
-- Name: index_lecture_user_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_user_id ON public.lecture_user_joins USING btree (user_id);


--
-- TOC entry 4208 (class 1259 OID 9664924)
-- Name: index_lectures_on_released; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_released ON public.lectures USING btree (released);


--
-- TOC entry 4209 (class 1259 OID 9664925)
-- Name: index_lectures_on_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_sort ON public.lectures USING btree (sort);


--
-- TOC entry 4210 (class 1259 OID 9664926)
-- Name: index_lectures_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_teacher_id ON public.lectures USING btree (teacher_id);


--
-- TOC entry 4211 (class 1259 OID 9664927)
-- Name: index_lectures_on_term_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_term_id ON public.lectures USING btree (term_id);


--
-- TOC entry 4214 (class 1259 OID 9664928)
-- Name: index_lesson_section_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_lesson_id ON public.lesson_section_joins USING btree (lesson_id);


--
-- TOC entry 4215 (class 1259 OID 9664929)
-- Name: index_lesson_section_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_section_id ON public.lesson_section_joins USING btree (section_id);


--
-- TOC entry 4218 (class 1259 OID 9664930)
-- Name: index_lesson_tag_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_lesson_id ON public.lesson_tag_joins USING btree (lesson_id);


--
-- TOC entry 4219 (class 1259 OID 9664931)
-- Name: index_lesson_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_tag_id ON public.lesson_tag_joins USING btree (tag_id);


--
-- TOC entry 4222 (class 1259 OID 9664932)
-- Name: index_lessons_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lessons_on_lecture_id ON public.lessons USING btree (lecture_id);


--
-- TOC entry 4225 (class 1259 OID 9664933)
-- Name: index_links_on_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linked_medium_id ON public.links USING btree (linked_medium_id);


--
-- TOC entry 4226 (class 1259 OID 9664934)
-- Name: index_links_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_medium_id ON public.links USING btree (medium_id);


--
-- TOC entry 4227 (class 1259 OID 9664935)
-- Name: index_links_on_medium_id_and_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_links_on_medium_id_and_linked_medium_id ON public.links USING btree (medium_id, linked_medium_id);


--
-- TOC entry 4230 (class 1259 OID 9664936)
-- Name: index_media_on_answers_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_answers_count ON public.media USING btree (answers_count);


--
-- TOC entry 4231 (class 1259 OID 9664937)
-- Name: index_media_on_content_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_content_trgm ON public.media USING gin (content public.gin_trgm_ops);


--
-- TOC entry 4232 (class 1259 OID 9664938)
-- Name: index_media_on_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_description_trgm ON public.media USING gin (description public.gin_trgm_ops);


--
-- TOC entry 4233 (class 1259 OID 9664939)
-- Name: index_media_on_external_link_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_external_link_description_trgm ON public.media USING gin (external_link_description public.gin_trgm_ops);


--
-- TOC entry 4234 (class 1259 OID 9664940)
-- Name: index_media_on_released; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_released ON public.media USING btree (released);


--
-- TOC entry 4235 (class 1259 OID 9664941)
-- Name: index_media_on_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_sort ON public.media USING btree (sort);


--
-- TOC entry 4236 (class 1259 OID 9664942)
-- Name: index_media_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_teachable_type_and_teachable_id ON public.media USING btree (teachable_type, teachable_id);


--
-- TOC entry 4237 (class 1259 OID 9664943)
-- Name: index_media_on_text_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_text_trgm ON public.media USING gin (text public.gin_trgm_ops);


--
-- TOC entry 4240 (class 1259 OID 9664944)
-- Name: index_medium_tag_joins_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_medium_id ON public.medium_tag_joins USING btree (medium_id);


--
-- TOC entry 4241 (class 1259 OID 9664945)
-- Name: index_medium_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_tag_id ON public.medium_tag_joins USING btree (tag_id);


--
-- TOC entry 4244 (class 1259 OID 9664946)
-- Name: index_notifications_on_notifiable_id_and_notifiable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_notifiable_id_and_notifiable_type ON public.notifications USING btree (notifiable_id, notifiable_type);


--
-- TOC entry 4245 (class 1259 OID 9664947)
-- Name: index_notifications_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_recipient_id ON public.notifications USING btree (recipient_id);


--
-- TOC entry 4248 (class 1259 OID 9664948)
-- Name: index_notions_on_aliased_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_aliased_tag_id ON public.notions USING btree (aliased_tag_id);


--
-- TOC entry 4249 (class 1259 OID 9664949)
-- Name: index_notions_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_tag_id ON public.notions USING btree (tag_id);


--
-- TOC entry 4250 (class 1259 OID 9664950)
-- Name: index_notions_on_title_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_title_trigram ON public.notions USING gin (title public.gin_trgm_ops);


--
-- TOC entry 4251 (class 1259 OID 9664951)
-- Name: index_notions_on_title_tsearch; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_title_tsearch ON public.notions USING gin (to_tsvector('simple'::regconfig, title));


--
-- TOC entry 4254 (class 1259 OID 9664952)
-- Name: index_program_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_locale ON public.program_translations USING btree (locale);


--
-- TOC entry 4255 (class 1259 OID 9664953)
-- Name: index_program_translations_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_program_id ON public.program_translations USING btree (program_id);


--
-- TOC entry 4258 (class 1259 OID 9664954)
-- Name: index_programs_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_programs_on_subject_id ON public.programs USING btree (subject_id);


--
-- TOC entry 4261 (class 1259 OID 9664955)
-- Name: index_quiz_certificates_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_quiz_id ON public.quiz_certificates USING btree (quiz_id);


--
-- TOC entry 4262 (class 1259 OID 9664956)
-- Name: index_quiz_certificates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_user_id ON public.quiz_certificates USING btree (user_id);


--
-- TOC entry 4267 (class 1259 OID 9664957)
-- Name: index_redemptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_redemptions_on_user_id ON public.redemptions USING btree (user_id);


--
-- TOC entry 4268 (class 1259 OID 9664958)
-- Name: index_redemptions_on_voucher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_redemptions_on_voucher_id ON public.redemptions USING btree (voucher_id);


--
-- TOC entry 4271 (class 1259 OID 9664959)
-- Name: index_referrals_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_item_id ON public.referrals USING btree (item_id);


--
-- TOC entry 4272 (class 1259 OID 9664960)
-- Name: index_referrals_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_medium_id ON public.referrals USING btree (medium_id);


--
-- TOC entry 4295 (class 1259 OID 9664961)
-- Name: index_reg_user_regs_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reg_user_regs_on_campaign_id ON public.registration_user_registrations USING btree (registration_campaign_id);


--
-- TOC entry 4296 (class 1259 OID 9664962)
-- Name: index_reg_user_regs_on_rejection_overridden_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reg_user_regs_on_rejection_overridden_at ON public.registration_user_registrations USING btree (rejection_overridden_at);


--
-- TOC entry 4297 (class 1259 OID 9664963)
-- Name: index_reg_user_regs_unique_exclusive_assignment_unranked; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_exclusive_assignment_unranked ON public.registration_user_registrations USING btree (registration_campaign_id, user_id) WHERE ((exclusive_assignment = true) AND (preference_rank IS NULL));


--
-- TOC entry 4298 (class 1259 OID 9664964)
-- Name: index_reg_user_regs_unique_item_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_item_user ON public.registration_user_registrations USING btree (registration_campaign_id, user_id, registration_item_id);


--
-- TOC entry 4299 (class 1259 OID 9664965)
-- Name: index_reg_user_regs_unique_ranked; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_ranked ON public.registration_user_registrations USING btree (registration_campaign_id, user_id, preference_rank) WHERE (preference_rank IS NOT NULL);


--
-- TOC entry 4275 (class 1259 OID 9664966)
-- Name: index_registration_campaigns_on_allocation_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_allocation_mode ON public.registration_campaigns USING btree (allocation_mode);


--
-- TOC entry 4276 (class 1259 OID 9664967)
-- Name: index_registration_campaigns_on_campaignable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_campaignable ON public.registration_campaigns USING btree (campaignable_type, campaignable_id);


--
-- TOC entry 4277 (class 1259 OID 9664968)
-- Name: index_registration_campaigns_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_status ON public.registration_campaigns USING btree (status);


--
-- TOC entry 4280 (class 1259 OID 9664969)
-- Name: index_registration_items_on_registration_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_items_on_registration_campaign_id ON public.registration_items USING btree (registration_campaign_id);


--
-- TOC entry 4281 (class 1259 OID 9664970)
-- Name: index_registration_items_on_unique_registerable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_registration_items_on_unique_registerable ON public.registration_items USING btree (registerable_type, registerable_id);


--
-- TOC entry 4284 (class 1259 OID 9664971)
-- Name: index_registration_policies_on_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_active ON public.registration_policies USING btree (active);


--
-- TOC entry 4285 (class 1259 OID 9664972)
-- Name: index_registration_policies_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_kind ON public.registration_policies USING btree (kind);


--
-- TOC entry 4286 (class 1259 OID 9664973)
-- Name: index_registration_policies_on_phase; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_phase ON public.registration_policies USING btree (phase);


--
-- TOC entry 4287 (class 1259 OID 9664974)
-- Name: index_registration_policies_on_registration_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_registration_campaign_id ON public.registration_policies USING btree (registration_campaign_id);


--
-- TOC entry 4288 (class 1259 OID 9664975)
-- Name: index_registration_policies_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_position ON public.registration_policies USING btree (registration_campaign_id, "position");


--
-- TOC entry 4291 (class 1259 OID 9664976)
-- Name: index_registration_student_messages_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_student_messages_on_lecture_id ON public.registration_student_messages USING btree (lecture_id);


--
-- TOC entry 4292 (class 1259 OID 9664977)
-- Name: index_registration_student_messages_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_student_messages_on_sender_id ON public.registration_student_messages USING btree (sender_id);


--
-- TOC entry 4300 (class 1259 OID 9664978)
-- Name: index_registration_user_registrations_on_registration_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_registration_item_id ON public.registration_user_registrations USING btree (registration_item_id);


--
-- TOC entry 4301 (class 1259 OID 9664979)
-- Name: index_registration_user_registrations_on_rejection_policy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_rejection_policy_id ON public.registration_user_registrations USING btree (rejection_policy_id);


--
-- TOC entry 4302 (class 1259 OID 9664980)
-- Name: index_registration_user_registrations_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_status ON public.registration_user_registrations USING btree (status);


--
-- TOC entry 4303 (class 1259 OID 9664981)
-- Name: index_registration_user_registrations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_user_id ON public.registration_user_registrations USING btree (user_id);


--
-- TOC entry 4306 (class 1259 OID 9664982)
-- Name: index_relations_on_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_related_tag_id ON public.relations USING btree (related_tag_id);


--
-- TOC entry 4307 (class 1259 OID 9664983)
-- Name: index_relations_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_tag_id ON public.relations USING btree (tag_id);


--
-- TOC entry 4308 (class 1259 OID 9664984)
-- Name: index_relations_on_tag_id_and_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_relations_on_tag_id_and_related_tag_id ON public.relations USING btree (tag_id, related_tag_id);


--
-- TOC entry 4313 (class 1259 OID 9664985)
-- Name: index_section_tag_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_section_id ON public.section_tag_joins USING btree (section_id);


--
-- TOC entry 4314 (class 1259 OID 9664986)
-- Name: index_section_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_tag_id ON public.section_tag_joins USING btree (tag_id);


--
-- TOC entry 4317 (class 1259 OID 9664987)
-- Name: index_sections_on_chapter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_chapter_id ON public.sections USING btree (chapter_id);


--
-- TOC entry 4318 (class 1259 OID 9664988)
-- Name: index_sections_on_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_title_trgm ON public.sections USING gin (title public.gin_trgm_ops);


--
-- TOC entry 4321 (class 1259 OID 9664989)
-- Name: index_speaker_talk_joins_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_source_campaign_id ON public.speaker_talk_joins USING btree (source_campaign_id);


--
-- TOC entry 4322 (class 1259 OID 9664990)
-- Name: index_speaker_talk_joins_on_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_speaker_id ON public.speaker_talk_joins USING btree (speaker_id);


--
-- TOC entry 4323 (class 1259 OID 9664991)
-- Name: index_speaker_talk_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_talk_id ON public.speaker_talk_joins USING btree (talk_id);


--
-- TOC entry 4324 (class 1259 OID 9664992)
-- Name: index_speaker_talk_joins_on_talk_id_and_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_speaker_talk_joins_on_talk_id_and_speaker_id ON public.speaker_talk_joins USING btree (talk_id, speaker_id);


--
-- TOC entry 4327 (class 1259 OID 9664993)
-- Name: index_subject_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_locale ON public.subject_translations USING btree (locale);


--
-- TOC entry 4328 (class 1259 OID 9664994)
-- Name: index_subject_translations_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_subject_id ON public.subject_translations USING btree (subject_id);


--
-- TOC entry 4333 (class 1259 OID 9664995)
-- Name: index_submissions_on_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_assignment_id ON public.submissions USING btree (assignment_id);


--
-- TOC entry 4334 (class 1259 OID 9664996)
-- Name: index_submissions_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_submissions_on_token ON public.submissions USING btree (token);


--
-- TOC entry 4335 (class 1259 OID 9664997)
-- Name: index_submissions_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_tutorial_id ON public.submissions USING btree (tutorial_id);


--
-- TOC entry 4340 (class 1259 OID 9664998)
-- Name: index_talk_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_tag_id ON public.talk_tag_joins USING btree (tag_id);


--
-- TOC entry 4341 (class 1259 OID 9664999)
-- Name: index_talk_tag_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_talk_id ON public.talk_tag_joins USING btree (talk_id);


--
-- TOC entry 4344 (class 1259 OID 9665000)
-- Name: index_talks_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_lecture_id ON public.talks USING btree (lecture_id);


--
-- TOC entry 4345 (class 1259 OID 9665001)
-- Name: index_talks_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_self_materialization_mode ON public.talks USING btree (self_materialization_mode);


--
-- TOC entry 4348 (class 1259 OID 9665002)
-- Name: index_terms_on_year_and_season; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_terms_on_year_and_season ON public.terms USING btree (year, season);


--
-- TOC entry 4351 (class 1259 OID 9665003)
-- Name: index_thredded_categories_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_categories_on_messageboard_id ON public.thredded_categories USING btree (messageboard_id);


--
-- TOC entry 4352 (class 1259 OID 9665004)
-- Name: index_thredded_categories_on_messageboard_id_and_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_categories_on_messageboard_id_and_slug ON public.thredded_categories USING btree (messageboard_id, slug);


--
-- TOC entry 4361 (class 1259 OID 9665005)
-- Name: index_thredded_messageboard_users_for_recently_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboard_users_for_recently_active ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, last_seen_at);


--
-- TOC entry 4362 (class 1259 OID 9665006)
-- Name: index_thredded_messageboard_users_primary; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboard_users_primary ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, thredded_user_detail_id);


--
-- TOC entry 4365 (class 1259 OID 9665007)
-- Name: index_thredded_messageboards_on_messageboard_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboards_on_messageboard_group_id ON public.thredded_messageboards USING btree (messageboard_group_id);


--
-- TOC entry 4366 (class 1259 OID 9665008)
-- Name: index_thredded_messageboards_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboards_on_slug ON public.thredded_messageboards USING btree (slug);


--
-- TOC entry 4375 (class 1259 OID 9665009)
-- Name: index_thredded_moderation_records_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_moderation_records_for_display ON public.thredded_post_moderation_records USING btree (messageboard_id, created_at DESC);


--
-- TOC entry 4378 (class 1259 OID 9665010)
-- Name: index_thredded_posts_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_for_display ON public.thredded_posts USING btree (moderation_state, updated_at);


--
-- TOC entry 4379 (class 1259 OID 9665011)
-- Name: index_thredded_posts_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_messageboard_id ON public.thredded_posts USING btree (messageboard_id);


--
-- TOC entry 4380 (class 1259 OID 9665012)
-- Name: index_thredded_posts_on_postable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id ON public.thredded_posts USING btree (postable_id);


--
-- TOC entry 4381 (class 1259 OID 9665013)
-- Name: index_thredded_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id_and_created_at ON public.thredded_posts USING btree (postable_id, created_at);


--
-- TOC entry 4382 (class 1259 OID 9665014)
-- Name: index_thredded_posts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_user_id ON public.thredded_posts USING btree (user_id);


--
-- TOC entry 4386 (class 1259 OID 9665015)
-- Name: index_thredded_private_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_posts_on_postable_id_and_created_at ON public.thredded_private_posts USING btree (postable_id, created_at);


--
-- TOC entry 4389 (class 1259 OID 9665016)
-- Name: index_thredded_private_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_hash_id ON public.thredded_private_topics USING btree (hash_id);


--
-- TOC entry 4390 (class 1259 OID 9665017)
-- Name: index_thredded_private_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_last_post_at ON public.thredded_private_topics USING btree (last_post_at);


--
-- TOC entry 4391 (class 1259 OID 9665018)
-- Name: index_thredded_private_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_private_topics_on_slug ON public.thredded_private_topics USING btree (slug);


--
-- TOC entry 4394 (class 1259 OID 9665019)
-- Name: index_thredded_private_users_on_private_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_private_topic_id ON public.thredded_private_users USING btree (private_topic_id);


--
-- TOC entry 4395 (class 1259 OID 9665020)
-- Name: index_thredded_private_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_user_id ON public.thredded_private_users USING btree (user_id);


--
-- TOC entry 4398 (class 1259 OID 9665021)
-- Name: index_thredded_topic_categories_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_category_id ON public.thredded_topic_categories USING btree (category_id);


--
-- TOC entry 4399 (class 1259 OID 9665022)
-- Name: index_thredded_topic_categories_on_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_topic_id ON public.thredded_topic_categories USING btree (topic_id);


--
-- TOC entry 4402 (class 1259 OID 9665023)
-- Name: index_thredded_topics_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_for_display ON public.thredded_topics USING btree (moderation_state, sticky DESC, updated_at DESC);


--
-- TOC entry 4403 (class 1259 OID 9665024)
-- Name: index_thredded_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_hash_id ON public.thredded_topics USING btree (hash_id);


--
-- TOC entry 4404 (class 1259 OID 9665025)
-- Name: index_thredded_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_last_post_at ON public.thredded_topics USING btree (last_post_at);


--
-- TOC entry 4405 (class 1259 OID 9665026)
-- Name: index_thredded_topics_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_messageboard_id ON public.thredded_topics USING btree (messageboard_id);


--
-- TOC entry 4406 (class 1259 OID 9665027)
-- Name: index_thredded_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_topics_on_slug ON public.thredded_topics USING btree (slug);


--
-- TOC entry 4407 (class 1259 OID 9665028)
-- Name: index_thredded_topics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_user_id ON public.thredded_topics USING btree (user_id);


--
-- TOC entry 4411 (class 1259 OID 9665029)
-- Name: index_thredded_user_details_for_moderations; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_for_moderations ON public.thredded_user_details USING btree (moderation_state, moderation_state_changed_at DESC);


--
-- TOC entry 4412 (class 1259 OID 9665030)
-- Name: index_thredded_user_details_on_latest_activity_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_on_latest_activity_at ON public.thredded_user_details USING btree (latest_activity_at);


--
-- TOC entry 4413 (class 1259 OID 9665031)
-- Name: index_thredded_user_details_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_details_on_user_id ON public.thredded_user_details USING btree (user_id);


--
-- TOC entry 4419 (class 1259 OID 9665032)
-- Name: index_thredded_user_post_notifications_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_post_notifications_on_post_id ON public.thredded_user_post_notifications USING btree (post_id);


--
-- TOC entry 4420 (class 1259 OID 9665033)
-- Name: index_thredded_user_post_notifications_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_post_notifications_on_user_id_and_post_id ON public.thredded_user_post_notifications USING btree (user_id, post_id);


--
-- TOC entry 4423 (class 1259 OID 9665034)
-- Name: index_thredded_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_preferences_on_user_id ON public.thredded_user_preferences USING btree (user_id);


--
-- TOC entry 4432 (class 1259 OID 9665035)
-- Name: index_thredded_user_topic_read_states_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_topic_read_states_on_messageboard_id ON public.thredded_user_topic_read_states USING btree (messageboard_id);


--
-- TOC entry 4437 (class 1259 OID 9665036)
-- Name: index_tutor_tutorial_joins_on_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutor_id ON public.tutor_tutorial_joins USING btree (tutor_id);


--
-- TOC entry 4438 (class 1259 OID 9665037)
-- Name: index_tutor_tutorial_joins_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutorial_id ON public.tutor_tutorial_joins USING btree (tutorial_id);


--
-- TOC entry 4439 (class 1259 OID 9665038)
-- Name: index_tutor_tutorial_joins_on_tutorial_id_and_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutor_tutorial_joins_on_tutorial_id_and_tutor_id ON public.tutor_tutorial_joins USING btree (tutorial_id, tutor_id);


--
-- TOC entry 4442 (class 1259 OID 9665039)
-- Name: index_tutorial_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_source_campaign_id ON public.tutorial_memberships USING btree (source_campaign_id);


--
-- TOC entry 4443 (class 1259 OID 9665040)
-- Name: index_tutorial_memberships_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_tutorial_id ON public.tutorial_memberships USING btree (tutorial_id);


--
-- TOC entry 4444 (class 1259 OID 9665041)
-- Name: index_tutorial_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_user_id ON public.tutorial_memberships USING btree (user_id);


--
-- TOC entry 4445 (class 1259 OID 9665042)
-- Name: index_tutorial_memberships_on_user_id_and_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorial_memberships_on_user_id_and_lecture_id ON public.tutorial_memberships USING btree (user_id, lecture_id);


--
-- TOC entry 4446 (class 1259 OID 9665043)
-- Name: index_tutorial_memberships_on_user_id_and_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorial_memberships_on_user_id_and_tutorial_id ON public.tutorial_memberships USING btree (user_id, tutorial_id);


--
-- TOC entry 4449 (class 1259 OID 9665044)
-- Name: index_tutorials_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_lecture_id ON public.tutorials USING btree (lecture_id);


--
-- TOC entry 4450 (class 1259 OID 9665045)
-- Name: index_tutorials_on_lecture_id_and_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorials_on_lecture_id_and_title_unique ON public.tutorials USING btree (lecture_id, title);


--
-- TOC entry 4451 (class 1259 OID 9665046)
-- Name: index_tutorials_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_self_materialization_mode ON public.tutorials USING btree (self_materialization_mode);


--
-- TOC entry 4454 (class 1259 OID 9665047)
-- Name: index_user_favorite_lecture_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_lecture_id ON public.user_favorite_lecture_joins USING btree (lecture_id);


--
-- TOC entry 4455 (class 1259 OID 9665048)
-- Name: index_user_favorite_lecture_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_user_id ON public.user_favorite_lecture_joins USING btree (user_id);


--
-- TOC entry 4458 (class 1259 OID 9665049)
-- Name: index_user_submission_joins_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_submission_id ON public.user_submission_joins USING btree (submission_id);


--
-- TOC entry 4459 (class 1259 OID 9665050)
-- Name: index_user_submission_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_user_id ON public.user_submission_joins USING btree (user_id);


--
-- TOC entry 4462 (class 1259 OID 9665051)
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- TOC entry 4463 (class 1259 OID 9665052)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 4464 (class 1259 OID 9665053)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 4465 (class 1259 OID 9665054)
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- TOC entry 4468 (class 1259 OID 9665055)
-- Name: index_vignettes_answers_on_vignettes_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_question_id ON public.vignettes_answers USING btree (vignettes_question_id);


--
-- TOC entry 4469 (class 1259 OID 9665056)
-- Name: index_vignettes_answers_on_vignettes_slide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_slide_id ON public.vignettes_answers USING btree (vignettes_slide_id);


--
-- TOC entry 4470 (class 1259 OID 9665057)
-- Name: index_vignettes_answers_on_vignettes_user_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_user_answer_id ON public.vignettes_answers USING btree (vignettes_user_answer_id);


--
-- TOC entry 4475 (class 1259 OID 9665058)
-- Name: index_vignettes_codenames_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_codenames_on_lecture_id ON public.vignettes_codenames USING btree (lecture_id);


--
-- TOC entry 4476 (class 1259 OID 9665059)
-- Name: index_vignettes_codenames_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_codenames_on_user_id ON public.vignettes_codenames USING btree (user_id);


--
-- TOC entry 4479 (class 1259 OID 9665060)
-- Name: index_vignettes_completion_messages_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_completion_messages_on_lecture_id ON public.vignettes_completion_messages USING btree (lecture_id);


--
-- TOC entry 4482 (class 1259 OID 9665061)
-- Name: index_vignettes_info_slides_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_info_slides_on_vignettes_questionnaire_id ON public.vignettes_info_slides USING btree (vignettes_questionnaire_id);


--
-- TOC entry 4487 (class 1259 OID 9665062)
-- Name: index_vignettes_options_on_vignettes_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_options_on_vignettes_question_id ON public.vignettes_options USING btree (vignettes_question_id);


--
-- TOC entry 4490 (class 1259 OID 9665063)
-- Name: index_vignettes_questionnaires_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_questionnaires_on_lecture_id ON public.vignettes_questionnaires USING btree (lecture_id);


--
-- TOC entry 4493 (class 1259 OID 9665064)
-- Name: index_vignettes_questions_on_vignettes_slide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_questions_on_vignettes_slide_id ON public.vignettes_questions USING btree (vignettes_slide_id);


--
-- TOC entry 4496 (class 1259 OID 9665065)
-- Name: index_vignettes_slide_statistics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slide_statistics_on_user_id ON public.vignettes_slide_statistics USING btree (user_id);


--
-- TOC entry 4497 (class 1259 OID 9665066)
-- Name: index_vignettes_slide_statistics_on_vignettes_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slide_statistics_on_vignettes_answer_id ON public.vignettes_slide_statistics USING btree (vignettes_answer_id);


--
-- TOC entry 4500 (class 1259 OID 9665067)
-- Name: index_vignettes_slides_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slides_on_position ON public.vignettes_slides USING btree ("position");


--
-- TOC entry 4501 (class 1259 OID 9665068)
-- Name: index_vignettes_slides_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slides_on_vignettes_questionnaire_id ON public.vignettes_slides USING btree (vignettes_questionnaire_id);


--
-- TOC entry 4504 (class 1259 OID 9665069)
-- Name: index_vignettes_user_answers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_user_answers_on_user_id ON public.vignettes_user_answers USING btree (user_id);


--
-- TOC entry 4505 (class 1259 OID 9665070)
-- Name: index_vignettes_user_answers_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_user_answers_on_vignettes_questionnaire_id ON public.vignettes_user_answers USING btree (vignettes_questionnaire_id);


--
-- TOC entry 4508 (class 1259 OID 9665071)
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON public.votes USING btree (votable_id, votable_type, vote_scope);


--
-- TOC entry 4509 (class 1259 OID 9665072)
-- Name: index_votes_on_votable_type_and_votable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_type_and_votable_id ON public.votes USING btree (votable_type, votable_id);


--
-- TOC entry 4510 (class 1259 OID 9665073)
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON public.votes USING btree (voter_id, voter_type, vote_scope);


--
-- TOC entry 4511 (class 1259 OID 9665074)
-- Name: index_votes_on_voter_type_and_voter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_type_and_voter_id ON public.votes USING btree (voter_type, voter_id);


--
-- TOC entry 4514 (class 1259 OID 9665075)
-- Name: index_vouchers_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vouchers_on_lecture_id ON public.vouchers USING btree (lecture_id);


--
-- TOC entry 4515 (class 1259 OID 9665076)
-- Name: index_vouchers_on_secure_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_vouchers_on_secure_hash ON public.vouchers USING btree (secure_hash);


--
-- TOC entry 4518 (class 1259 OID 9665077)
-- Name: index_watchlist_entries_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_medium_id ON public.watchlist_entries USING btree (medium_id);


--
-- TOC entry 4519 (class 1259 OID 9665078)
-- Name: index_watchlist_entries_on_watchlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_watchlist_id ON public.watchlist_entries USING btree (watchlist_id);


--
-- TOC entry 4522 (class 1259 OID 9665079)
-- Name: index_watchlists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_user_id ON public.watchlists USING btree (user_id);


--
-- TOC entry 4523 (class 1259 OID 9665080)
-- Name: index_watchlists_on_watchlist_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_watchlist_entry_id ON public.watchlists USING btree (watchlist_entry_id);


--
-- TOC entry 4168 (class 1259 OID 9665081)
-- Name: polymorphic_editable_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_editable_idx ON public.editable_user_joins USING btree (editable_id, editable_type);


--
-- TOC entry 4169 (class 1259 OID 9665082)
-- Name: polymorphic_many_to_many_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_many_to_many_idx ON public.editable_user_joins USING btree (editable_id, editable_type, user_id);


--
-- TOC entry 4353 (class 1259 OID 9665083)
-- Name: thredded_categories_name_ci; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_categories_name_ci ON public.thredded_categories USING btree (lower(name) text_pattern_ops);


--
-- TOC entry 4360 (class 1259 OID 9665084)
-- Name: thredded_messageboard_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_messageboard_notifications_for_followed_topics_unique ON public.thredded_messageboard_notifications_for_followed_topics USING btree (user_id, messageboard_id, notifier_key);


--
-- TOC entry 4371 (class 1259 OID 9665085)
-- Name: thredded_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_followed_topics_unique ON public.thredded_notifications_for_followed_topics USING btree (user_id, notifier_key);


--
-- TOC entry 4374 (class 1259 OID 9665086)
-- Name: thredded_notifications_for_private_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_private_topics_unique ON public.thredded_notifications_for_private_topics USING btree (user_id, notifier_key);


--
-- TOC entry 4383 (class 1259 OID 9665087)
-- Name: thredded_posts_content_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_posts_content_fts ON public.thredded_posts USING gist (to_tsvector('english'::regconfig, content));


--
-- TOC entry 4410 (class 1259 OID 9665088)
-- Name: thredded_topics_title_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_topics_title_fts ON public.thredded_topics USING gist (to_tsvector('english'::regconfig, title));


--
-- TOC entry 4418 (class 1259 OID 9665089)
-- Name: thredded_user_messageboard_preferences_user_id_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_messageboard_preferences_user_id_messageboard_id ON public.thredded_user_messageboard_preferences USING btree (user_id, messageboard_id);


--
-- TOC entry 4428 (class 1259 OID 9665090)
-- Name: thredded_user_private_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_private_topic_read_states_user_postable ON public.thredded_user_private_topic_read_states USING btree (user_id, postable_id);


--
-- TOC entry 4431 (class 1259 OID 9665091)
-- Name: thredded_user_topic_follows_user_topic; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_follows_user_topic ON public.thredded_user_topic_follows USING btree (user_id, topic_id);


--
-- TOC entry 4435 (class 1259 OID 9665092)
-- Name: thredded_user_topic_read_states_user_messageboard; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_user_topic_read_states_user_messageboard ON public.thredded_user_topic_read_states USING btree (user_id, messageboard_id);


--
-- TOC entry 4436 (class 1259 OID 9665093)
-- Name: thredded_user_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_read_states_user_postable ON public.thredded_user_topic_read_states USING btree (user_id, postable_id);


--
-- TOC entry 4543 (class 2606 OID 9665094)
-- Name: imports fk_rails_018d34d0a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT fk_rails_018d34d0a7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4607 (class 2606 OID 9665099)
-- Name: watchlist_entries fk_rails_021aafbf37; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_021aafbf37 FOREIGN KEY (watchlist_id) REFERENCES public.watchlists(id);


--
-- TOC entry 4595 (class 2606 OID 9665104)
-- Name: vignettes_codenames fk_rails_02690186bc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT fk_rails_02690186bc FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4570 (class 2606 OID 9665109)
-- Name: speaker_talk_joins fk_rails_06579d230c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_06579d230c FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4578 (class 2606 OID 9665114)
-- Name: thredded_messageboard_users fk_rails_06e42c62f5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_06e42c62f5 FOREIGN KEY (thredded_user_detail_id) REFERENCES public.thredded_user_details(id) ON DELETE CASCADE;


--
-- TOC entry 4609 (class 2606 OID 9665119)
-- Name: watchlists fk_rails_0dc1a4cbcb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_0dc1a4cbcb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4564 (class 2606 OID 9665124)
-- Name: registration_student_messages fk_rails_11439afa9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT fk_rails_11439afa9f FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4577 (class 2606 OID 9665129)
-- Name: talks fk_rails_1210911b58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT fk_rails_1210911b58 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4591 (class 2606 OID 9665134)
-- Name: user_submission_joins fk_rails_12d41a7e23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT fk_rails_12d41a7e23 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4558 (class 2606 OID 9665139)
-- Name: redemptions fk_rails_14fa576d5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT fk_rails_14fa576d5b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4600 (class 2606 OID 9665144)
-- Name: vignettes_questions fk_rails_166147907b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions
    ADD CONSTRAINT fk_rails_166147907b FOREIGN KEY (vignettes_slide_id) REFERENCES public.vignettes_slides(id);


--
-- TOC entry 4555 (class 2606 OID 9665149)
-- Name: programs fk_rails_174715887a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT fk_rails_174715887a FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 4571 (class 2606 OID 9665154)
-- Name: speaker_talk_joins fk_rails_1d337b4d3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_1d337b4d3d FOREIGN KEY (speaker_id) REFERENCES public.users(id);


--
-- TOC entry 4549 (class 2606 OID 9665159)
-- Name: lecture_user_joins fk_rails_1e48112fae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_1e48112fae FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4566 (class 2606 OID 9665164)
-- Name: registration_user_registrations fk_rails_2c25a6b50a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_2c25a6b50a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4532 (class 2606 OID 9665169)
-- Name: assignments fk_rails_2d7bf5a691; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_rails_2d7bf5a691 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4546 (class 2606 OID 9665174)
-- Name: lecture_memberships fk_rails_32871c16bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_32871c16bd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4608 (class 2606 OID 9665179)
-- Name: watchlist_entries fk_rails_32f03600d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_32f03600d9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4592 (class 2606 OID 9665184)
-- Name: vignettes_answers fk_rails_341ebaf06f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_341ebaf06f FOREIGN KEY (vignettes_question_id) REFERENCES public.vignettes_questions(id);


--
-- TOC entry 4580 (class 2606 OID 9665189)
-- Name: thredded_user_post_notifications fk_rails_364d7e370a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_364d7e370a FOREIGN KEY (post_id) REFERENCES public.thredded_posts(id) ON DELETE CASCADE;


--
-- TOC entry 4573 (class 2606 OID 9665194)
-- Name: submissions fk_rails_3a2b44e658; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_3a2b44e658 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4598 (class 2606 OID 9665199)
-- Name: vignettes_options fk_rails_3fbca24de5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options
    ADD CONSTRAINT fk_rails_3fbca24de5 FOREIGN KEY (vignettes_question_id) REFERENCES public.vignettes_questions(id);


--
-- TOC entry 4528 (class 2606 OID 9665204)
-- Name: annotations fk_rails_4043df79bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_4043df79bf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4589 (class 2606 OID 9665209)
-- Name: user_favorite_lecture_joins fk_rails_40985ebb4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_40985ebb4f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4551 (class 2606 OID 9665214)
-- Name: links fk_rails_49020b7472; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_49020b7472 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4529 (class 2606 OID 9665219)
-- Name: annotations fk_rails_4f1a0f89b4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_4f1a0f89b4 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4537 (class 2606 OID 9665224)
-- Name: commontator_comments fk_rails_558e599d00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_558e599d00 FOREIGN KEY (parent_id) REFERENCES public.commontator_comments(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4581 (class 2606 OID 9665229)
-- Name: thredded_user_post_notifications fk_rails_5908eec802; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_5908eec802 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4530 (class 2606 OID 9665234)
-- Name: announcements fk_rails_5b3f1d7737; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_5b3f1d7737 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4567 (class 2606 OID 9665239)
-- Name: registration_user_registrations fk_rails_5c6f8c15b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_5c6f8c15b3 FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4574 (class 2606 OID 9665244)
-- Name: submissions fk_rails_61cac0823d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_61cac0823d FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- TOC entry 4534 (class 2606 OID 9665249)
-- Name: cohort_memberships fk_rails_65ac42442f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_65ac42442f FOREIGN KEY (cohort_id) REFERENCES public.cohorts(id);


--
-- TOC entry 4588 (class 2606 OID 9665254)
-- Name: tutorials fk_rails_66221d24a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT fk_rails_66221d24a3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4563 (class 2606 OID 9665259)
-- Name: registration_policies fk_rails_6664a314dd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_policies
    ADD CONSTRAINT fk_rails_6664a314dd FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4539 (class 2606 OID 9665264)
-- Name: commontator_subscriptions fk_rails_68cc24d064; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT fk_rails_68cc24d064 FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4596 (class 2606 OID 9665269)
-- Name: vignettes_codenames fk_rails_69dbadb217; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT fk_rails_69dbadb217 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4597 (class 2606 OID 9665274)
-- Name: vignettes_completion_messages fk_rails_6aade677d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages
    ADD CONSTRAINT fk_rails_6aade677d3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4552 (class 2606 OID 9665279)
-- Name: links fk_rails_6b5cb429ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_6b5cb429ed FOREIGN KEY (linked_medium_id) REFERENCES public.media(id);


--
-- TOC entry 4575 (class 2606 OID 9665284)
-- Name: talk_tag_joins fk_rails_6bcb0e8e5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_6bcb0e8e5f FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- TOC entry 4606 (class 2606 OID 9665289)
-- Name: vouchers fk_rails_7676476332; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT fk_rails_7676476332 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4590 (class 2606 OID 9665294)
-- Name: user_favorite_lecture_joins fk_rails_77bc049c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_77bc049c12 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4535 (class 2606 OID 9665299)
-- Name: cohort_memberships fk_rails_7bc5d74a9d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_7bc5d74a9d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4559 (class 2606 OID 9665304)
-- Name: redemptions fk_rails_8377a88a56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT fk_rails_8377a88a56 FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id);


--
-- TOC entry 4576 (class 2606 OID 9665309)
-- Name: talk_tag_joins fk_rails_85b7c429a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_85b7c429a2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 4610 (class 2606 OID 9665314)
-- Name: watchlists fk_rails_8780bd5b5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_8780bd5b5a FOREIGN KEY (watchlist_entry_id) REFERENCES public.watchlist_entries(id);


--
-- TOC entry 4604 (class 2606 OID 9665319)
-- Name: vignettes_user_answers fk_rails_8c438b6e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT fk_rails_8c438b6e8e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4605 (class 2606 OID 9665324)
-- Name: vignettes_user_answers fk_rails_8dc710c13d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT fk_rails_8dc710c13d FOREIGN KEY (vignettes_questionnaire_id) REFERENCES public.vignettes_questionnaires(id);


--
-- TOC entry 4601 (class 2606 OID 9665329)
-- Name: vignettes_slide_statistics fk_rails_8f79f13530; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT fk_rails_8f79f13530 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4568 (class 2606 OID 9665334)
-- Name: registration_user_registrations fk_rails_95b64a53dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_95b64a53dc FOREIGN KEY (registration_item_id) REFERENCES public.registration_items(id);


--
-- TOC entry 4538 (class 2606 OID 9665339)
-- Name: commontator_comments fk_rails_96666eb19a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_96666eb19a FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4579 (class 2606 OID 9665344)
-- Name: thredded_messageboard_users fk_rails_966803d714; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_966803d714 FOREIGN KEY (thredded_messageboard_id) REFERENCES public.thredded_messageboards(id) ON DELETE CASCADE;


--
-- TOC entry 4527 (class 2606 OID 9665349)
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 4562 (class 2606 OID 9665354)
-- Name: registration_items fk_rails_998ff8f041; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_items
    ADD CONSTRAINT fk_rails_998ff8f041 FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4544 (class 2606 OID 9665359)
-- Name: items fk_rails_99dcbdef9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_99dcbdef9f FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- TOC entry 4602 (class 2606 OID 9665364)
-- Name: vignettes_slide_statistics fk_rails_9a8745e04d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT fk_rails_9a8745e04d FOREIGN KEY (vignettes_answer_id) REFERENCES public.vignettes_answers(id);


--
-- TOC entry 4533 (class 2606 OID 9665369)
-- Name: claims fk_rails_9b419d5bd5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT fk_rails_9b419d5bd5 FOREIGN KEY (redemption_id) REFERENCES public.redemptions(id);


--
-- TOC entry 4560 (class 2606 OID 9665374)
-- Name: referrals fk_rails_9c4f45c15c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_9c4f45c15c FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 4541 (class 2606 OID 9665379)
-- Name: divisions fk_rails_a1b344ef36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT fk_rails_a1b344ef36 FOREIGN KEY (program_id) REFERENCES public.programs(id);


--
-- TOC entry 4536 (class 2606 OID 9665384)
-- Name: cohort_memberships fk_rails_a81dcb9b7f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_a81dcb9b7f FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4545 (class 2606 OID 9665389)
-- Name: items fk_rails_add0a302a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_add0a302a9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4553 (class 2606 OID 9665394)
-- Name: medium_tag_joins fk_rails_b11130c931; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b11130c931 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4554 (class 2606 OID 9665399)
-- Name: medium_tag_joins fk_rails_b181027fb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b181027fb2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 4582 (class 2606 OID 9665404)
-- Name: tutor_tutorial_joins fk_rails_b781447eb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_b781447eb1 FOREIGN KEY (tutor_id) REFERENCES public.users(id);


--
-- TOC entry 4547 (class 2606 OID 9665409)
-- Name: lecture_memberships fk_rails_b952417d8f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_b952417d8f FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4584 (class 2606 OID 9665414)
-- Name: tutorial_memberships fk_rails_bc5fc1eb43; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_bc5fc1eb43 FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4550 (class 2606 OID 9665419)
-- Name: lecture_user_joins fk_rails_bdbf7bc779; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_bdbf7bc779 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4556 (class 2606 OID 9665424)
-- Name: quiz_certificates fk_rails_c10d7b5c91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_c10d7b5c91 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4526 (class 2606 OID 9665429)
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- TOC entry 4548 (class 2606 OID 9665434)
-- Name: lecture_memberships fk_rails_c4d0979517; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_c4d0979517 FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- TOC entry 4542 (class 2606 OID 9665439)
-- Name: feedbacks fk_rails_c57bb6cf28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk_rails_c57bb6cf28 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4565 (class 2606 OID 9665444)
-- Name: registration_student_messages fk_rails_c97d206d38; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT fk_rails_c97d206d38 FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- TOC entry 4585 (class 2606 OID 9665449)
-- Name: tutorial_memberships fk_rails_cb8342e46b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_cb8342e46b FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4593 (class 2606 OID 9665454)
-- Name: vignettes_answers fk_rails_cc5b64b41a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_cc5b64b41a FOREIGN KEY (vignettes_slide_id) REFERENCES public.vignettes_slides(id);


--
-- TOC entry 4599 (class 2606 OID 9665459)
-- Name: vignettes_questionnaires fk_rails_cf4ca40f5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires
    ADD CONSTRAINT fk_rails_cf4ca40f5b FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- TOC entry 4586 (class 2606 OID 9665464)
-- Name: tutorial_memberships fk_rails_d9260fbd52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_d9260fbd52 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4557 (class 2606 OID 9665469)
-- Name: quiz_certificates fk_rails_da91c72f96; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_da91c72f96 FOREIGN KEY (quiz_id) REFERENCES public.media(id);


--
-- TOC entry 4561 (class 2606 OID 9665474)
-- Name: referrals fk_rails_dce931e0f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_dce931e0f7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- TOC entry 4594 (class 2606 OID 9665479)
-- Name: vignettes_answers fk_rails_dd314d5106; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_dd314d5106 FOREIGN KEY (vignettes_user_answer_id) REFERENCES public.vignettes_user_answers(id);


--
-- TOC entry 4572 (class 2606 OID 9665484)
-- Name: speaker_talk_joins fk_rails_e5bafe887c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_e5bafe887c FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- TOC entry 4603 (class 2606 OID 9665489)
-- Name: vignettes_slides fk_rails_e6d1817e26; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides
    ADD CONSTRAINT fk_rails_e6d1817e26 FOREIGN KEY (vignettes_questionnaire_id) REFERENCES public.vignettes_questionnaires(id);


--
-- TOC entry 4569 (class 2606 OID 9665494)
-- Name: registration_user_registrations fk_rails_ead649079d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_ead649079d FOREIGN KEY (rejection_policy_id) REFERENCES public.registration_policies(id);


--
-- TOC entry 4540 (class 2606 OID 9665499)
-- Name: course_self_joins fk_rails_ecb46f40b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT fk_rails_ecb46f40b3 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 4583 (class 2606 OID 9665504)
-- Name: tutor_tutorial_joins fk_rails_f1a97a6dc5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_f1a97a6dc5 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- TOC entry 4587 (class 2606 OID 9665509)
-- Name: tutorial_memberships fk_rails_fc3a3973e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_fc3a3973e1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4531 (class 2606 OID 9665514)
-- Name: announcements fk_rails_fd9bbf1b15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_fd9bbf1b15 FOREIGN KEY (announcer_id) REFERENCES public.users(id);


-- Completed on 2026-08-28 15:09:52 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict Mofc2AT5q2ddESPwZxeUae4WfeNQEbdzEYlEjoEWCDd254TsThS1WzN1x7xCpxz

