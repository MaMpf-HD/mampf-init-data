--
-- PostgreSQL database dump
--

\restrict gYQUIrVUoSl35SDr3c7yOUDjJNEZl0MxpjUSPg4tRPH5gpW0QoWg8vJYJM2dYen

-- Dumped from database version 18.4 (Debian 18.4-1.pgdg13+1)
-- Dumped by pg_dump version 18.6 (Debian 18.6-1.pgdg13+2)

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
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
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
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
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
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
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
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
-- Name: annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.annotations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.annotations_id_seq OWNED BY public.annotations.id;


--
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
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
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
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
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
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
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
-- Name: chapters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chapters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chapters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chapters_id_seq OWNED BY public.chapters.id;


--
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
-- Name: claims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.claims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: claims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.claims_id_seq OWNED BY public.claims.id;


--
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
-- Name: cohorts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cohorts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cohorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cohorts_id_seq OWNED BY public.cohorts.id;


--
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
-- Name: commontator_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commontator_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_comments_id_seq OWNED BY public.commontator_comments.id;


--
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
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_subscriptions_id_seq OWNED BY public.commontator_subscriptions.id;


--
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
-- Name: commontator_threads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.commontator_threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commontator_threads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.commontator_threads_id_seq OWNED BY public.commontator_threads.id;


--
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
-- Name: course_self_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_self_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_self_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_self_joins_id_seq OWNED BY public.course_self_joins.id;


--
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
-- Name: course_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.course_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: course_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.course_tag_joins_id_seq OWNED BY public.course_tag_joins.id;


--
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
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
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
-- Name: division_course_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.division_course_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: division_course_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.division_course_joins_id_seq OWNED BY public.division_course_joins.id;


--
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
-- Name: division_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.division_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: division_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.division_translations_id_seq OWNED BY public.division_translations.id;


--
-- Name: divisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.divisions (
    id bigint NOT NULL,
    program_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.divisions_id_seq OWNED BY public.divisions.id;


--
-- Name: editable_user_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.editable_user_joins (
    id bigint NOT NULL,
    editable_id integer,
    editable_type character varying,
    user_id integer
);


--
-- Name: editable_user_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.editable_user_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: editable_user_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.editable_user_joins_id_seq OWNED BY public.editable_user_joins.id;


--
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
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: flipper_features; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flipper_features (
    id bigint NOT NULL,
    key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: flipper_features_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flipper_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flipper_features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flipper_features_id_seq OWNED BY public.flipper_features.id;


--
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
-- Name: flipper_gates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flipper_gates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flipper_gates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flipper_gates_id_seq OWNED BY public.flipper_gates.id;


--
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
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
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
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: item_self_joins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_self_joins (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    related_item_id bigint NOT NULL
);


--
-- Name: item_self_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_self_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_self_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_self_joins_id_seq OWNED BY public.item_self_joins.id;


--
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
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
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
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lecture_user_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lecture_user_joins_id_seq OWNED BY public.lecture_user_joins.id;


--
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
-- Name: lectures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lectures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lectures_id_seq OWNED BY public.lectures.id;


--
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
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_section_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_section_joins_id_seq OWNED BY public.lesson_section_joins.id;


--
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
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lesson_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lesson_tag_joins_id_seq OWNED BY public.lesson_tag_joins.id;


--
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
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
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
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
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
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
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
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.medium_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.medium_tag_joins_id_seq OWNED BY public.medium_tag_joins.id;


--
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
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
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
-- Name: notions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notions_id_seq OWNED BY public.notions.id;


--
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
-- Name: program_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.program_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: program_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.program_translations_id_seq OWNED BY public.program_translations.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.programs (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    subject_id bigint
);


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
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
-- Name: readers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.readers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: readers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.readers_id_seq OWNED BY public.readers.id;


--
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
-- Name: redemptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.redemptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redemptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redemptions_id_seq OWNED BY public.redemptions.id;


--
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
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
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
-- Name: registration_student_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.registration_student_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registration_student_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.registration_student_messages_id_seq OWNED BY public.registration_student_messages.id;


--
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
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.relations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.relations_id_seq OWNED BY public.relations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
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
-- Name: section_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.section_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: section_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.section_tag_joins_id_seq OWNED BY public.section_tag_joins.id;


--
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
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
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
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.speaker_talk_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.speaker_talk_joins_id_seq OWNED BY public.speaker_talk_joins.id;


--
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
-- Name: subject_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subject_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subject_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subject_translations_id_seq OWNED BY public.subject_translations.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
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
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
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
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talk_tag_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talk_tag_joins_id_seq OWNED BY public.talk_tag_joins.id;


--
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
-- Name: talks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.talks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: talks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.talks_id_seq OWNED BY public.talks.id;


--
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
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.terms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.terms_id_seq OWNED BY public.terms.id;


--
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
-- Name: thredded_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_categories_id_seq OWNED BY public.thredded_categories.id;


--
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
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_groups_id_seq OWNED BY public.thredded_messageboard_groups.id;


--
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
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_notifications_for_followed_topics_id_seq OWNED BY public.thredded_messageboard_notifications_for_followed_topics.id;


--
-- Name: thredded_messageboard_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_messageboard_users (
    id bigint NOT NULL,
    thredded_user_detail_id bigint NOT NULL,
    thredded_messageboard_id bigint NOT NULL,
    last_seen_at timestamp without time zone NOT NULL
);


--
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboard_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboard_users_id_seq OWNED BY public.thredded_messageboard_users.id;


--
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
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_messageboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_messageboards_id_seq OWNED BY public.thredded_messageboards.id;


--
-- Name: thredded_notifications_for_followed_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_followed_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) CONSTRAINT thredded_notifications_for_followed_topic_notifier_key_not_null NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_notifications_for_followed_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_notifications_for_followed_topics_id_seq OWNED BY public.thredded_notifications_for_followed_topics.id;


--
-- Name: thredded_notifications_for_private_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_notifications_for_private_topics (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    notifier_key character varying(90) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


--
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_notifications_for_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_notifications_for_private_topics_id_seq OWNED BY public.thredded_notifications_for_private_topics.id;


--
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
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_post_moderation_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_post_moderation_records_id_seq OWNED BY public.thredded_post_moderation_records.id;


--
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
-- Name: thredded_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_posts_id_seq OWNED BY public.thredded_posts.id;


--
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
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_posts_id_seq OWNED BY public.thredded_private_posts.id;


--
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
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_topics_id_seq OWNED BY public.thredded_private_topics.id;


--
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
-- Name: thredded_private_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_private_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_private_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_private_users_id_seq OWNED BY public.thredded_private_users.id;


--
-- Name: thredded_topic_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_topic_categories (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_topic_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_topic_categories_id_seq OWNED BY public.thredded_topic_categories.id;


--
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
-- Name: thredded_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_topics_id_seq OWNED BY public.thredded_topics.id;


--
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
-- Name: thredded_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_details_id_seq OWNED BY public.thredded_user_details.id;


--
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
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_messageboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_messageboard_preferences_id_seq OWNED BY public.thredded_user_messageboard_preferences.id;


--
-- Name: thredded_user_post_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.thredded_user_post_notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    post_id bigint NOT NULL,
    notified_at timestamp without time zone NOT NULL
);


--
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_post_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_post_notifications_id_seq OWNED BY public.thredded_user_post_notifications.id;


--
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
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_preferences_id_seq OWNED BY public.thredded_user_preferences.id;


--
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
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_private_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_private_topic_read_states_id_seq OWNED BY public.thredded_user_private_topic_read_states.id;


--
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
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_topic_follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_topic_follows_id_seq OWNED BY public.thredded_user_topic_follows.id;


--
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
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.thredded_user_topic_read_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.thredded_user_topic_read_states_id_seq OWNED BY public.thredded_user_topic_read_states.id;


--
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
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tutor_tutorial_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tutor_tutorial_joins_id_seq OWNED BY public.tutor_tutorial_joins.id;


--
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
-- Name: tutorials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tutorials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tutorials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tutorials_id_seq OWNED BY public.tutorials.id;


--
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
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_favorite_lecture_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_favorite_lecture_joins_id_seq OWNED BY public.user_favorite_lecture_joins.id;


--
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
-- Name: user_submission_joins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_submission_joins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_submission_joins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_submission_joins_id_seq OWNED BY public.user_submission_joins.id;


--
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
    unlock_token character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
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
-- Name: vignettes_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_answers_id_seq OWNED BY public.vignettes_answers.id;


--
-- Name: vignettes_answers_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_answers_options (
    vignettes_answer_id bigint NOT NULL,
    vignettes_option_id bigint NOT NULL
);


--
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
-- Name: vignettes_codenames_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_codenames_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_codenames_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_codenames_id_seq OWNED BY public.vignettes_codenames.id;


--
-- Name: vignettes_completion_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_completion_messages (
    id bigint NOT NULL,
    lecture_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: vignettes_completion_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_completion_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_completion_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_completion_messages_id_seq OWNED BY public.vignettes_completion_messages.id;


--
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
-- Name: vignettes_info_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_info_slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_info_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_info_slides_id_seq OWNED BY public.vignettes_info_slides.id;


--
-- Name: vignettes_info_slides_slides; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vignettes_info_slides_slides (
    vignettes_info_slide_id bigint NOT NULL,
    vignettes_slide_id bigint NOT NULL
);


--
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
-- Name: vignettes_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_options_id_seq OWNED BY public.vignettes_options.id;


--
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
-- Name: vignettes_questionnaires_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_questionnaires_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_questionnaires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_questionnaires_id_seq OWNED BY public.vignettes_questionnaires.id;


--
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
-- Name: vignettes_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_questions_id_seq OWNED BY public.vignettes_questions.id;


--
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
-- Name: vignettes_slide_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_slide_statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_slide_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_slide_statistics_id_seq OWNED BY public.vignettes_slide_statistics.id;


--
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
-- Name: vignettes_slides_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_slides_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_slides_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_slides_id_seq OWNED BY public.vignettes_slides.id;


--
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
-- Name: vignettes_user_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vignettes_user_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vignettes_user_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vignettes_user_answers_id_seq OWNED BY public.vignettes_user_answers.id;


--
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
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
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
-- Name: watchlist_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchlist_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: watchlist_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchlist_entries_id_seq OWNED BY public.watchlist_entries.id;


--
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
-- Name: watchlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.watchlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: watchlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.watchlists_id_seq OWNED BY public.watchlists.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: annotations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations ALTER COLUMN id SET DEFAULT nextval('public.annotations_id_seq'::regclass);


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: chapters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters ALTER COLUMN id SET DEFAULT nextval('public.chapters_id_seq'::regclass);


--
-- Name: claims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims ALTER COLUMN id SET DEFAULT nextval('public.claims_id_seq'::regclass);


--
-- Name: cohorts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohorts ALTER COLUMN id SET DEFAULT nextval('public.cohorts_id_seq'::regclass);


--
-- Name: commontator_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments ALTER COLUMN id SET DEFAULT nextval('public.commontator_comments_id_seq'::regclass);


--
-- Name: commontator_subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.commontator_subscriptions_id_seq'::regclass);


--
-- Name: commontator_threads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads ALTER COLUMN id SET DEFAULT nextval('public.commontator_threads_id_seq'::regclass);


--
-- Name: course_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins ALTER COLUMN id SET DEFAULT nextval('public.course_self_joins_id_seq'::regclass);


--
-- Name: course_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.course_tag_joins_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: division_course_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins ALTER COLUMN id SET DEFAULT nextval('public.division_course_joins_id_seq'::regclass);


--
-- Name: division_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations ALTER COLUMN id SET DEFAULT nextval('public.division_translations_id_seq'::regclass);


--
-- Name: divisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions ALTER COLUMN id SET DEFAULT nextval('public.divisions_id_seq'::regclass);


--
-- Name: editable_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins ALTER COLUMN id SET DEFAULT nextval('public.editable_user_joins_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Name: flipper_features id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_features ALTER COLUMN id SET DEFAULT nextval('public.flipper_features_id_seq'::regclass);


--
-- Name: flipper_gates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_gates ALTER COLUMN id SET DEFAULT nextval('public.flipper_gates_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: item_self_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins ALTER COLUMN id SET DEFAULT nextval('public.item_self_joins_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: lecture_user_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins ALTER COLUMN id SET DEFAULT nextval('public.lecture_user_joins_id_seq'::regclass);


--
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lectures_id_seq'::regclass);


--
-- Name: lesson_section_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_section_joins_id_seq'::regclass);


--
-- Name: lesson_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.lesson_tag_joins_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: medium_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.medium_tag_joins_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: notions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions ALTER COLUMN id SET DEFAULT nextval('public.notions_id_seq'::regclass);


--
-- Name: program_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations ALTER COLUMN id SET DEFAULT nextval('public.program_translations_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: readers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers ALTER COLUMN id SET DEFAULT nextval('public.readers_id_seq'::regclass);


--
-- Name: redemptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions ALTER COLUMN id SET DEFAULT nextval('public.redemptions_id_seq'::regclass);


--
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- Name: registration_student_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages ALTER COLUMN id SET DEFAULT nextval('public.registration_student_messages_id_seq'::regclass);


--
-- Name: relations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations ALTER COLUMN id SET DEFAULT nextval('public.relations_id_seq'::regclass);


--
-- Name: section_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.section_tag_joins_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: speaker_talk_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins ALTER COLUMN id SET DEFAULT nextval('public.speaker_talk_joins_id_seq'::regclass);


--
-- Name: subject_translations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations ALTER COLUMN id SET DEFAULT nextval('public.subject_translations_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: talk_tag_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins ALTER COLUMN id SET DEFAULT nextval('public.talk_tag_joins_id_seq'::regclass);


--
-- Name: talks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks ALTER COLUMN id SET DEFAULT nextval('public.talks_id_seq'::regclass);


--
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- Name: thredded_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_categories_id_seq'::regclass);


--
-- Name: thredded_messageboard_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_groups_id_seq'::regclass);


--
-- Name: thredded_messageboard_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_notifications_for_followed_topics_id_seq'::regclass);


--
-- Name: thredded_messageboard_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboard_users_id_seq'::regclass);


--
-- Name: thredded_messageboards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards ALTER COLUMN id SET DEFAULT nextval('public.thredded_messageboards_id_seq'::regclass);


--
-- Name: thredded_notifications_for_followed_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_followed_topics_id_seq'::regclass);


--
-- Name: thredded_notifications_for_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_notifications_for_private_topics_id_seq'::regclass);


--
-- Name: thredded_post_moderation_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records ALTER COLUMN id SET DEFAULT nextval('public.thredded_post_moderation_records_id_seq'::regclass);


--
-- Name: thredded_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_posts_id_seq'::regclass);


--
-- Name: thredded_private_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_posts_id_seq'::regclass);


--
-- Name: thredded_private_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_topics_id_seq'::regclass);


--
-- Name: thredded_private_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users ALTER COLUMN id SET DEFAULT nextval('public.thredded_private_users_id_seq'::regclass);


--
-- Name: thredded_topic_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories ALTER COLUMN id SET DEFAULT nextval('public.thredded_topic_categories_id_seq'::regclass);


--
-- Name: thredded_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics ALTER COLUMN id SET DEFAULT nextval('public.thredded_topics_id_seq'::regclass);


--
-- Name: thredded_user_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_details_id_seq'::regclass);


--
-- Name: thredded_user_messageboard_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_messageboard_preferences_id_seq'::regclass);


--
-- Name: thredded_user_post_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_post_notifications_id_seq'::regclass);


--
-- Name: thredded_user_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_preferences_id_seq'::regclass);


--
-- Name: thredded_user_private_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_private_topic_read_states_id_seq'::regclass);


--
-- Name: thredded_user_topic_follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_follows_id_seq'::regclass);


--
-- Name: thredded_user_topic_read_states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states ALTER COLUMN id SET DEFAULT nextval('public.thredded_user_topic_read_states_id_seq'::regclass);


--
-- Name: tutor_tutorial_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins ALTER COLUMN id SET DEFAULT nextval('public.tutor_tutorial_joins_id_seq'::regclass);


--
-- Name: tutorials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials ALTER COLUMN id SET DEFAULT nextval('public.tutorials_id_seq'::regclass);


--
-- Name: user_favorite_lecture_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins ALTER COLUMN id SET DEFAULT nextval('public.user_favorite_lecture_joins_id_seq'::regclass);


--
-- Name: user_submission_joins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins ALTER COLUMN id SET DEFAULT nextval('public.user_submission_joins_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vignettes_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers ALTER COLUMN id SET DEFAULT nextval('public.vignettes_answers_id_seq'::regclass);


--
-- Name: vignettes_codenames id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames ALTER COLUMN id SET DEFAULT nextval('public.vignettes_codenames_id_seq'::regclass);


--
-- Name: vignettes_completion_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages ALTER COLUMN id SET DEFAULT nextval('public.vignettes_completion_messages_id_seq'::regclass);


--
-- Name: vignettes_info_slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_info_slides ALTER COLUMN id SET DEFAULT nextval('public.vignettes_info_slides_id_seq'::regclass);


--
-- Name: vignettes_options id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options ALTER COLUMN id SET DEFAULT nextval('public.vignettes_options_id_seq'::regclass);


--
-- Name: vignettes_questionnaires id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires ALTER COLUMN id SET DEFAULT nextval('public.vignettes_questionnaires_id_seq'::regclass);


--
-- Name: vignettes_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions ALTER COLUMN id SET DEFAULT nextval('public.vignettes_questions_id_seq'::regclass);


--
-- Name: vignettes_slide_statistics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics ALTER COLUMN id SET DEFAULT nextval('public.vignettes_slide_statistics_id_seq'::regclass);


--
-- Name: vignettes_slides id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides ALTER COLUMN id SET DEFAULT nextval('public.vignettes_slides_id_seq'::regclass);


--
-- Name: vignettes_user_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers ALTER COLUMN id SET DEFAULT nextval('public.vignettes_user_answers_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- Name: watchlist_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries ALTER COLUMN id SET DEFAULT nextval('public.watchlist_entries_id_seq'::regclass);


--
-- Name: watchlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists ALTER COLUMN id SET DEFAULT nextval('public.watchlists_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
7	content	<div><action-text-attachment sgid="eyJfcmFpbHMiOnsiZGF0YSI6ImdpZDovL21hbXBmL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvNj9leHBpcmVzX2luIiwicHVyIjoiYXR0YWNoYWJsZSJ9fQ==--615d6ebbec4c72a2331d1c80b1b8e3cec4d58f16" content-type="image/jpeg" url="http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6NiwicHVyIjoiYmxvYl9pZCJ9fQ==--fd958f5a679f7aa955027eb1aa21be0072bca9cf/tastatur.jpg" filename="tastatur.jpg" filesize="1402645" width="3950" height="1584" presentation="gallery"></action-text-attachment></div>	Vignettes::Slide	5	2025-07-14 15:11:22.019999	2025-07-14 15:11:22.052028
8	content		Vignettes::Slide	6	2025-07-14 15:11:52.251469	2025-07-14 15:11:52.251469
5	content	<div>Bitte durchlesen!</div>	Vignettes::InfoSlide	2	2025-07-14 15:09:29.115796	2025-07-14 15:09:29.115796
6	content	<div>Toller Inhalt.<action-text-attachment sgid="eyJfcmFpbHMiOnsiZGF0YSI6ImdpZDovL21hbXBmL0FjdGl2ZVN0b3JhZ2U6OkJsb2IvNT9leHBpcmVzX2luIiwicHVyIjoiYXR0YWNoYWJsZSJ9fQ==--607d17d7c9e4312b77c26c8f48d3610916e6df8a" content-type="image/png" url="http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6NSwicHVyIjoiYmxvYl9pZCJ9fQ==--4eb9e75cf64bea211cf6c53313b82b6d4d7df597/Screenshot%202025-06-03%20172757.png" filename="Screenshot 2025-06-03 172757.png" filesize="25125" width="708" height="316" presentation="gallery"></action-text-attachment></div>	Vignettes::Slide	4	2025-07-14 15:10:15.628111	2025-07-14 15:10:15.678124
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
5	embeds	ActionText::RichText	6	5	2025-07-14 15:10:15.637747
6	embeds	ActionText::RichText	7	6	2025-07-14 15:11:22.026505
7	image	ActiveStorage::VariantRecord	3	7	2025-07-14 15:12:18.737584
8	image	ActiveStorage::VariantRecord	4	8	2025-07-14 15:12:42.431624
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
5	qgzgwq1dc5858lg1wzdhace37i48	Screenshot 2025-06-03 172757.png	image/png	{"identified":true,"width":708,"height":316,"analyzed":true}	development	25125	KCnVXo3CVnb3jSCvOweGeA==	2025-07-14 15:10:08.464248
6	dn46q40a36irllg85e4on7fn990w	tastatur.jpg	image/jpeg	{"identified":true,"width":3950,"height":1584,"analyzed":true}	development	1402645	tfC5FiG/ILRsq1xUkvCG9A==	2025-07-14 15:11:18.915158
7	errb2kvp1x0ftm0q46hbcz8fk4ym	Screenshot 2025-06-03 172757.png	image/png	{"identified":true,"width":708,"height":316,"analyzed":true}	development	22038	gQPC5tgnMHWELlip5A7eNg==	2025-07-14 15:12:18.736021
8	5it2sori3mauv68avn2tuob08zps	tastatur.jpg	image/jpeg	{"identified":true,"width":1024,"height":411,"analyzed":true}	development	74117	ekLcjqhoQ+9o8UsapSq8oA==	2025-07-14 15:12:42.428673
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
3	5	wjqVtOuFppDd1oEBBMUc2TyD8vk=
4	6	g9oDsuZ2Ke1OimlPvx7V2sj306E=
\.


--
-- Data for Name: annotations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.annotations (id, medium_id, user_id, "timestamp", comment, color, category, subcategory, visible_for_teacher, public_comment_id, created_at, updated_at) FROM stdin;
1	9	7	--- !ruby/object:TimeStamp\nmilliseconds: 284\nminutes: 0\nseconds: 11\nhours: 0\n	Die Rechnung muss ich mir mal in Ruhe später ansehen.	#F2711C	0	\N	t	\N	2025-07-14 11:25:30.853804	2025-07-14 11:25:30.853804
2	9	7	--- !ruby/object:TimeStamp\nmilliseconds: 448\nminutes: 0\nseconds: 19\nhours: 0\n	\N	#21BA45	0	\N	f	8	2025-07-14 11:26:44.703541	2025-07-14 11:26:44.716281
3	9	7	--- !ruby/object:TimeStamp\nmilliseconds: 616\nminutes: 0\nseconds: 39\nhours: 0\n	Ganz schöne Sauklaue.	#D05D41	3	\N	t	\N	2025-07-14 11:27:07.83318	2025-07-14 11:27:07.83318
4	9	8	--- !ruby/object:TimeStamp\nmilliseconds: 910\nminutes: 0\nseconds: 24\nhours: 0\n	Hä?	#00B5AD	1	1	t	\N	2025-07-14 11:31:11.663613	2025-07-14 11:31:11.663613
5	13	6	--- !ruby/object:TimeStamp\nmilliseconds: 550\nminutes: 0\nseconds: 16\nhours: 0\n	Itaque vitae qui asperiores.	#A333C8	0	\N	f	\N	2026-08-24 19:07:39.266399	2026-08-24 19:07:39.266399
6	13	8	--- !ruby/object:TimeStamp\nmilliseconds: 290\nminutes: 0\nseconds: 29\nhours: 0\n	Id omnis perspiciatis voluptas.	#00B5AD	1	\N	f	\N	2026-08-24 19:07:39.283743	2026-08-24 19:07:39.283743
7	13	5	--- !ruby/object:TimeStamp\nmilliseconds: 420\nminutes: 0\nseconds: 10\nhours: 0\n	Hic necessitatibus quas cum.	#00B5AD	3	\N	f	\N	2026-08-24 19:07:39.295872	2026-08-24 19:07:39.295872
8	47	6	--- !ruby/object:TimeStamp\nmilliseconds: 10\nminutes: 0\nseconds: 31\nhours: 0\n	Iure et aut architecto.	#DB2828	1	\N	f	\N	2026-08-24 19:07:39.312015	2026-08-24 19:07:39.312015
9	47	8	--- !ruby/object:TimeStamp\nmilliseconds: 740\nminutes: 0\nseconds: 20\nhours: 0\n	Doloribus consectetur quis hic.	#FBBD08	0	\N	f	\N	2026-08-24 19:07:39.334658	2026-08-24 19:07:39.334658
10	47	5	--- !ruby/object:TimeStamp\nmilliseconds: 60\nminutes: 0\nseconds: 26\nhours: 0\n	Qui ut quo non.	#DB2828	1	\N	f	\N	2026-08-24 19:07:39.344068	2026-08-24 19:07:39.344068
11	8	6	--- !ruby/object:TimeStamp\nmilliseconds: 480\nminutes: 0\nseconds: 24\nhours: 0\n	Eos cupiditate omnis porro.	#6435C9	2	\N	f	\N	2026-08-24 19:07:39.353277	2026-08-24 19:07:39.353277
12	8	8	--- !ruby/object:TimeStamp\nmilliseconds: 230\nminutes: 0\nseconds: 12\nhours: 0\n	Sint harum ipsa similique.	#6435C9	2	\N	f	\N	2026-08-24 19:07:39.366493	2026-08-24 19:07:39.366493
13	8	5	--- !ruby/object:TimeStamp\nmilliseconds: 580\nminutes: 0\nseconds: 28\nhours: 0\n	Sapiente velit in sunt.	#444444	0	\N	f	\N	2026-08-24 19:07:39.390353	2026-08-24 19:07:39.390353
14	38	6	--- !ruby/object:TimeStamp\nmilliseconds: 810\nminutes: 0\nseconds: 31\nhours: 0\n	Laudantium voluptatibus ipsa quae.	#FBBD08	1	\N	f	\N	2026-08-24 19:07:39.406751	2026-08-24 19:07:39.406751
15	38	8	--- !ruby/object:TimeStamp\nmilliseconds: 350\nminutes: 0\nseconds: 38\nhours: 0\n	Dolor eum eos aut.	#A333C8	3	\N	f	\N	2026-08-24 19:07:39.415787	2026-08-24 19:07:39.415787
16	38	5	--- !ruby/object:TimeStamp\nmilliseconds: 760\nminutes: 0\nseconds: 29\nhours: 0\n	Minima dolorem voluptate non.	#E03997	2	\N	f	\N	2026-08-24 19:07:39.42613	2026-08-24 19:07:39.42613
17	9	6	--- !ruby/object:TimeStamp\nmilliseconds: 240\nminutes: 0\nseconds: 33\nhours: 0\n	Doloribus aut blanditiis et.	#DB2828	0	\N	f	\N	2026-08-24 19:07:39.435544	2026-08-24 19:07:39.435544
18	9	5	--- !ruby/object:TimeStamp\nmilliseconds: 50\nminutes: 0\nseconds: 25\nhours: 0\n	Eos odio ab excepturi.	#A333C8	3	\N	f	\N	2026-08-24 19:07:39.445802	2026-08-24 19:07:39.445802
19	10	6	--- !ruby/object:TimeStamp\nmilliseconds: 660\nminutes: 0\nseconds: 12\nhours: 0\n	Veritatis tempora maxime corrupti.	#E03997	2	\N	f	\N	2026-08-24 19:07:39.457866	2026-08-24 19:07:39.457866
20	10	8	--- !ruby/object:TimeStamp\nmilliseconds: 140\nminutes: 0\nseconds: 20\nhours: 0\n	Id consectetur molestiae vero.	#A333C8	0	\N	f	\N	2026-08-24 19:07:39.473762	2026-08-24 19:07:39.473762
21	10	5	--- !ruby/object:TimeStamp\nmilliseconds: 380\nminutes: 0\nseconds: 32\nhours: 0\n	Consectetur inventore porro autem.	#444444	0	\N	f	\N	2026-08-24 19:07:39.48247	2026-08-24 19:07:39.48247
22	2	6	--- !ruby/object:TimeStamp\nmilliseconds: 920\nminutes: 0\nseconds: 10\nhours: 0\n	Dicta vel neque velit.	#A333C8	0	\N	f	\N	2026-08-24 19:07:39.492983	2026-08-24 19:07:39.492983
23	2	8	--- !ruby/object:TimeStamp\nmilliseconds: 830\nminutes: 0\nseconds: 14\nhours: 0\n	Ipsa et laboriosam vel.	#EEEEEE	1	\N	f	\N	2026-08-24 19:07:39.501649	2026-08-24 19:07:39.501649
24	2	5	--- !ruby/object:TimeStamp\nmilliseconds: 890\nminutes: 0\nseconds: 19\nhours: 0\n	Qui nihil quo est.	#E03997	3	\N	f	\N	2026-08-24 19:07:39.510906	2026-08-24 19:07:39.510906
25	6	6	--- !ruby/object:TimeStamp\nmilliseconds: 310\nminutes: 0\nseconds: 18\nhours: 0\n	Corrupti consectetur veniam asperiores.	#2185D0	1	\N	f	\N	2026-08-24 19:07:39.520395	2026-08-24 19:07:39.520395
26	6	8	--- !ruby/object:TimeStamp\nmilliseconds: 590\nminutes: 0\nseconds: 13\nhours: 0\n	Aspernatur nihil qui ut.	#E03997	0	\N	f	\N	2026-08-24 19:07:39.530062	2026-08-24 19:07:39.530062
27	6	5	--- !ruby/object:TimeStamp\nmilliseconds: 710\nminutes: 0\nseconds: 10\nhours: 0\n	Blanditiis in molestias ut.	#444444	3	\N	f	\N	2026-08-24 19:07:39.54781	2026-08-24 19:07:39.54781
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.announcements (id, lecture_id, announcer_id, details, created_at, updated_at, on_main_page) FROM stdin;
1	\N	1	<div>Das ist die Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:13:06.111759	2020-07-24 13:13:06.111759	f
2	1	2	<div>Das ist eine Mitteilung für die LA2 in der Docker-Entwicklungsumgebung für MaMpf.</div>	2020-07-24 13:40:47.403705	2020-07-24 13:40:47.403705	f
3	27	2	<div>Today's session is cancelled due to a corona infection of the speaker.</div>	2022-08-05 14:24:49.642445	2022-08-05 14:24:49.642445	f
4	\N	1	<div>Mampf will be down from 5pm to 7pm this afternoon.</div>	2022-08-05 14:26:46.610612	2022-08-05 14:26:46.610612	f
5	\N	1	Am Freitag ist MaMpf zwischen 8 und 10 Uhr wegen Wartungsarbeiten nicht erreichbar.	2026-08-24 19:07:33.24389	2026-08-24 19:07:33.24389	f
6	\N	1	Die Anmeldung für die Veranstaltungen des kommenden Semesters ist freigeschaltet.	2026-08-24 19:07:34.385033	2026-08-24 19:07:34.385033	f
7	3	2	Die Vorlesung am Donnerstag entfällt.	2026-08-24 19:07:35.375855	2026-08-24 19:07:35.375855	f
8	28	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-24 19:07:35.445178	2026-08-24 19:07:35.445178	f
9	29	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-24 19:07:35.476032	2026-08-24 19:07:35.476032	f
10	32	2	Die Vorlesung am Donnerstag entfällt.	2026-08-24 19:07:35.50354	2026-08-24 19:07:35.50354	f
11	1	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-24 19:07:35.51149	2026-08-24 19:07:35.51149	f
12	33	2	Der Hörsaal für die Übung hat sich geändert.	2026-08-24 19:07:35.765344	2026-08-24 19:07:35.765344	f
13	30	2	Die Vorlesung am Donnerstag entfällt.	2026-08-24 19:07:35.782091	2026-08-24 19:07:35.782091	f
14	31	2	Das nächste Übungsblatt liegt ab heute bereit.	2026-08-24 19:07:35.862684	2026-08-24 19:07:35.862684	f
\.


--
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
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-07-24 13:03:53.932392	2025-07-14 10:42:06.530578
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.assignments (id, lecture_id, medium_id, title, deadline, created_at, updated_at, accepted_file_type, deletion_date) FROM stdin;
2	1	45	Blatt 5	2026-05-09 16:00:00	2020-11-28 16:54:41.933526	2025-07-14 11:05:22.969571	.pdf	2026-10-15
1	1	12	Blatt 4	2026-05-01 15:50:00	2020-11-28 16:32:30.987364	2025-07-14 11:05:48.488131	.pdf	2026-10-15
3	1	45	Blatt 6	2026-09-03 17:00:00	2022-08-05 14:49:41.819884	2025-07-14 11:06:21.422622	.pdf	2026-10-15
\.


--
-- Data for Name: chapters; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.chapters (id, lecture_id, title, created_at, updated_at, "position", display_number, hidden, details) FROM stdin;
1	1	Unitäre Räume und der Spektralsatz	2020-07-24 13:17:57.127274	2025-07-14 10:50:08.885313	1	\N	\N	\N
3	1	Normalformen von Endomorphismen	2020-07-24 13:18:28.913528	2025-07-14 10:57:51.353522	3	\N	\N	\N
2	1	Ringe	2020-07-24 13:18:08.753046	2025-07-14 11:01:53.20273	2	\N	\N	\N
4	2	Einführung	2020-07-24 16:52:55.533057	2025-07-14 11:12:42.261212	1	\N	\N	\N
6	3	Inzidenzgeometrie	2020-07-24 17:04:34.200541	2026-08-24 19:07:35.924857	2	\N	\N	\N
7	3	Hilbertebenen	2020-07-24 17:04:34.220647	2026-08-24 19:07:35.924857	3	\N	\N	\N
8	3	Euklidische Geometrie	2020-07-24 17:04:34.241839	2026-08-24 19:07:35.924857	4	\N	\N	\N
9	3	Nichteuklidische Geometrie	2020-07-24 17:04:34.263575	2026-08-24 19:07:35.924857	5	\N	\N	\N
5	3	Analytische Geometrie	2020-07-24 17:04:34.178653	2026-08-24 19:07:35.924857	1	\N	\N	\N
\.


--
-- Data for Name: claims; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.claims (id, redemption_id, claimable_type, claimable_id, created_at, updated_at) FROM stdin;
1	1	Talk	2	2025-07-15 12:11:14.690491	2025-07-15 12:11:14.690491
2	2	Talk	2	2025-07-15 12:11:39.225067	2025-07-15 12:11:39.225067
3	3	Talk	3	2025-07-15 12:11:59.002407	2025-07-15 12:11:59.002407
\.


--
-- Data for Name: cohort_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cohort_memberships (id, user_id, cohort_id, source_campaign_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cohorts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cohorts (id, title, description, capacity, context_type, context_id, propagate_to_lecture, created_at, updated_at, skip_campaigns, self_materialization_mode) FROM stdin;
1	Repeaters	If you failed last year's exam and don't want to go through tutorials again, register here.	15	Lecture	1	t	2026-08-24 19:07:25.059707	2026-08-24 19:07:25.059707	f	0
2	Waitlist	If you failed last year's exam and don't want to go through tutorials again, register here.	20	Lecture	1	f	2026-08-24 19:07:25.07236	2026-08-24 19:07:25.07236	f	0
3	Interest Survey	If you failed last year's exam and don't want to go through tutorials again, register here.	\N	Lecture	31	f	2026-08-24 19:07:30.180071	2026-08-24 19:07:30.180071	f	0
4	Nachrücker	If you failed last year's exam and don't want to go through tutorials again, register here.	5	Lecture	31	f	2026-08-24 19:07:31.888998	2026-08-24 19:07:31.888998	f	0
\.


--
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
11	52	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.042186	2026-08-24 19:07:39.042186	\N
12	52	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.04949	2026-08-24 19:07:39.04949	\N
13	52	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.055664	2026-08-24 19:07:39.055664	\N
14	42	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.063318	2026-08-24 19:07:39.063318	\N
15	42	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.069054	2026-08-24 19:07:39.069054	\N
16	42	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.075211	2026-08-24 19:07:39.075211	\N
17	43	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.082772	2026-08-24 19:07:39.082772	\N
18	43	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.088507	2026-08-24 19:07:39.088507	\N
19	43	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.096096	2026-08-24 19:07:39.096096	\N
20	51	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.103919	2026-08-24 19:07:39.103919	\N
21	51	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.109225	2026-08-24 19:07:39.109225	\N
22	51	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.114603	2026-08-24 19:07:39.114603	\N
23	41	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.122766	2026-08-24 19:07:39.122766	\N
24	41	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.128575	2026-08-24 19:07:39.128575	\N
25	41	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.133777	2026-08-24 19:07:39.133777	\N
26	48	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.142152	2026-08-24 19:07:39.142152	\N
27	48	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.14763	2026-08-24 19:07:39.14763	\N
28	48	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.153309	2026-08-24 19:07:39.153309	\N
29	49	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.171978	2026-08-24 19:07:39.171978	\N
30	49	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.177517	2026-08-24 19:07:39.177517	\N
31	49	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.183421	2026-08-24 19:07:39.183421	\N
32	40	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.191902	2026-08-24 19:07:39.191902	\N
33	40	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.196828	2026-08-24 19:07:39.196828	\N
34	40	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.202392	2026-08-24 19:07:39.202392	\N
35	30	User	6	\N	\N	Ab Minute 12 ist der Ton etwas leise.	\N	0	0	2026-08-24 19:07:39.21104	2026-08-24 19:07:39.21104	\N
36	30	User	8	\N	\N	Sehr schön erklärt, danke!	\N	0	0	2026-08-24 19:07:39.216014	2026-08-24 19:07:39.216014	\N
37	30	User	5	\N	\N	Gibt es dazu noch ein weiteres Beispiel?	\N	0	0	2026-08-24 19:07:39.22265	2026-08-24 19:07:39.22265	\N
\.


--
-- Data for Name: commontator_subscriptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.commontator_subscriptions (id, thread_id, subscriber_type, subscriber_id, created_at, updated_at) FROM stdin;
\.


--
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
-- Data for Name: course_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.course_self_joins (id, course_id, preceding_course_id, created_at, updated_at) FROM stdin;
\.


--
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
11	Demo Roster Seminar	2026-08-24 19:07:16.371104	2026-08-24 19:07:16.371104	DRS	\N	\N	\N	f	\N
12	Campaign Test Seminar	2026-08-24 19:07:30.100008	2026-08-24 19:07:30.100008	CTS	\N	\N	en	f	\N
13	Analysis SS 2026	2026-08-24 19:07:32.431868	2026-08-24 19:07:32.431868	Ana SS 2026	\N	\N	\N	f	\N
14	Seminar SS 2026	2026-08-24 19:07:32.567106	2026-08-24 19:07:32.567106	Sem SS 2026	\N	\N	\N	f	\N
15	Analysis WS 2026	2026-08-24 19:07:32.844496	2026-08-24 19:07:32.844496	Ana WS 2026	\N	\N	\N	f	\N
16	Seminar WS 2026	2026-08-24 19:07:32.950406	2026-08-24 19:07:32.950406	Sem WS 2026	\N	\N	\N	f	\N
\.


--
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
-- Data for Name: divisions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.divisions (id, program_id, created_at, updated_at) FROM stdin;
1	1	2020-07-24 13:11:06.845633	2020-07-24 13:11:06.845633
2	1	2020-07-24 13:11:13.366328	2020-07-24 13:11:13.366328
3	2	2020-07-24 13:11:43.555597	2020-07-24 13:11:43.555597
4	2	2020-07-24 13:16:19.425481	2020-07-24 13:16:19.425481
\.


--
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
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.feedbacks (id, title, feedback, can_contact, user_id, created_at, updated_at) FROM stdin;
1	Beschwerde	Alles Mist!	t	8	2025-07-14 11:29:43.122178	2025-07-14 11:29:43.122178
\.


--
-- Data for Name: flipper_features; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flipper_features (id, key, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: flipper_gates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.flipper_gates (id, feature_key, key, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
1	testpost-in-der-docker-umgebung	1	Thredded::Topic	\N	2020-07-24 15:13:56.562819
2	neuer-testpost	2	Thredded::Topic	\N	2020-09-03 11:09:21.560051
3	frage-zu-blatt-3-aufgabe-2	3	Thredded::Topic	\N	2026-08-24 19:07:36.157088
4	lerngruppe-fuer-die-klausur	4	Thredded::Topic	\N	2026-08-24 19:07:36.48768
5	frage-zu-blatt-3-aufgabe-2-v-vignetten-ss-2026-dozentin	5	Thredded::Topic	\N	2026-08-24 19:07:36.704677
6	lerngruppe-fuer-die-klausur-v-vignetten-ss-2026-dozentin	6	Thredded::Topic	\N	2026-08-24 19:07:36.870444
7	frage-zu-blatt-3-aufgabe-2-ps-elementare-zahlentheorie-ss-2026-dozentin	7	Thredded::Topic	\N	2026-08-24 19:07:37.056721
8	lerngruppe-fuer-die-klausur-ps-elementare-zahlentheorie-ss-2026-dozentin	8	Thredded::Topic	\N	2026-08-24 19:07:37.206084
9	frage-zu-blatt-3-aufgabe-2-v-analysis-ss-2026-ss-2026-dozentin	9	Thredded::Topic	\N	2026-08-24 19:07:37.389525
10	lerngruppe-fuer-die-klausur-v-analysis-ss-2026-ss-2026-dozentin	10	Thredded::Topic	\N	2026-08-24 19:07:37.533802
11	frage-zu-blatt-3-aufgabe-2-v-lineare-algebra-2-ss-2026-dozentin	11	Thredded::Topic	\N	2026-08-24 19:07:37.693868
12	lerngruppe-fuer-die-klausur-v-lineare-algebra-2-ss-2026-dozentin	12	Thredded::Topic	\N	2026-08-24 19:07:37.850007
13	frage-zu-blatt-3-aufgabe-2-s-seminar-ss-2026-ss-2026-dozentin	13	Thredded::Topic	\N	2026-08-24 19:07:38.027581
14	lerngruppe-fuer-die-klausur-s-seminar-ss-2026-ss-2026-dozentin	14	Thredded::Topic	\N	2026-08-24 19:07:38.188131
15	frage-zu-blatt-3-aufgabe-2-s-demo-roster-seminar-ss-2026-dozentin	15	Thredded::Topic	\N	2026-08-24 19:07:38.367147
16	lerngruppe-fuer-die-klausur-s-demo-roster-seminar-ss-2026-dozentin	16	Thredded::Topic	\N	2026-08-24 19:07:38.514124
17	frage-zu-blatt-3-aufgabe-2-s-campaign-test-seminar-ss-2026-dozentin	17	Thredded::Topic	\N	2026-08-24 19:07:38.684071
18	lerngruppe-fuer-die-klausur-s-campaign-test-seminar-ss-2026-dozentin	18	Thredded::Topic	\N	2026-08-24 19:07:38.826196
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.imports (id, medium_id, teachable_type, teachable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: item_self_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_self_joins (id, item_id, related_item_id) FROM stdin;
\.


--
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
-- Data for Name: lecture_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lecture_memberships (id, user_id, lecture_id, source_campaign_id, created_at, updated_at) FROM stdin;
c6a1a033-c950-43ef-9740-1f7faa961576	14	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
bd1c40b6-a952-4f59-a3a9-591bbc419491	21	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
4aeca63f-92f7-452d-b3fe-57cd18f57900	25	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
05441b49-29c3-4e4f-aeb2-3f735bc2087d	28	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
f7973210-e976-4433-8a61-7a189677fda4	29	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
8118d6c0-ef4d-4d98-920b-45b131b9e7ed	30	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
17265a8c-a0d9-41af-a0c3-bd756e91abea	32	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
c158c16f-7424-47bf-8e90-55c7ce65cdf8	35	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
8654428e-a1a2-4b42-ba17-e124c4223be8	16	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
6a527b53-fdc7-44f1-adb8-fd3fb1857293	18	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
0a027fac-94da-4c6c-8f34-f9f73090c83b	34	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
2510fc35-99f1-4b7c-bc03-60e5fbbc81d5	36	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
200f057b-91b7-4856-a512-352a71c2da53	41	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
734e0a3b-cbdf-45ff-9e81-0a15e12a207c	43	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
63f7187c-18b0-455f-9037-cc114682c684	15	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
f2d75bb2-ecf1-49b5-81fd-2de6dbb28a67	19	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
cf0ccd13-f5df-4d49-9612-7fa784cfa6de	20	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
55d02f80-59e3-41f9-b2bb-d8b14d989bca	26	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
3a2c9858-20b5-4a2a-a273-20c76c6f6348	31	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
fb8b7873-f887-4de7-8ee4-b7514bef66ed	33	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
ce32024c-f580-4fc6-9227-840578887744	37	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
23ccb204-5bb9-4795-99d8-5c1c8648abdd	38	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
a8c729d6-08c2-4234-a1d1-35950cb3f670	42	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
19e5998c-20a7-4c50-858d-dc42f9aa502a	44	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
a684fa0a-88e9-4892-816b-b889df3b2e96	17	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
9b557601-5b5f-4ee6-b274-81453e6ea724	22	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
af60923c-a89e-4110-9b27-0c72eaaef04a	23	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
1cdd5e8c-3730-455a-b59e-c05b32e53828	24	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
c2bdf5be-d94c-4116-aee7-90eaa2c8f153	27	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
0ca6c014-9871-438c-a2eb-3f4e9cb812fb	39	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
51dc4d27-293a-4c46-8c9f-baa238c1f531	40	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
53fcbb74-193c-456a-838c-ba275ec4bf59	45	1	\N	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
abfb8c2a-f544-4df8-ba8e-d8ac2947b8a2	46	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
138fcf2a-00c8-4526-9651-70e7f0a8e065	49	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
e2941902-f7f4-460f-87fe-b75ec7a534c7	56	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
3acc568e-1e57-41d6-a96c-d4600c36f024	50	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
bdc2ff05-2ca1-47ec-9867-b262e49437b4	53	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
b4f85b92-bdba-41d6-a1f9-286aa4a5719a	55	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
e64d1023-4a32-4ff4-98ad-e2c6a27f6707	47	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
cefdde09-6c6e-4cf5-948a-e9004941754e	57	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
92537c49-9deb-40c0-9e78-5adee9ab11ea	54	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
fb9e76fe-1cfd-415a-8b3a-81f3412baff9	52	30	\N	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
\.


--
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
94	1	14	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
95	1	21	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
96	1	25	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
97	1	28	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
98	1	29	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
99	1	30	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
100	1	32	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
101	1	35	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
102	1	16	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
103	1	18	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
104	1	34	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
105	1	36	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
106	1	41	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
107	1	43	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
108	1	15	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
109	1	19	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
110	1	20	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
111	1	26	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
112	1	31	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
113	1	33	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
114	1	37	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
115	1	38	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
116	1	42	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
117	1	44	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
118	1	17	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
119	1	22	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
120	1	23	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
121	1	24	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
122	1	27	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
123	1	39	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
124	1	40	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
125	1	45	2026-08-24 19:07:15.955127	2026-08-24 19:07:15.955127
126	30	2	2026-08-24 19:07:16.69621	2026-08-24 19:07:16.69621
127	30	46	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
128	30	49	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
129	30	56	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
130	30	50	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
131	30	53	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
132	30	55	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
133	30	47	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
134	30	57	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
135	30	54	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
136	30	52	2026-08-24 19:07:18.936919	2026-08-24 19:07:18.936919
137	31	2	2026-08-24 19:07:30.17095	2026-08-24 19:07:30.17095
\.


--
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lectures (id, created_at, updated_at, course_id, term_id, teacher_id, start_chapter, absolute_numbering, start_section, organizational_concept, organizational, muesli, released, content_mode, passphrase, locale, sort, forum_id, comments_disabled, organizational_on_top, disable_teacher_display, submission_max_team_size, submission_grace_period, legacy_seminar, annotations_status, self_materialization_mode, home_intro, home_attachment_data) FROM stdin;
24	2020-08-12 10:25:53.80801	2020-09-07 12:25:30.26636	1	3	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	\N	video	\N	de	lecture	\N	\N	\N	f	\N	15	f	1	0	\N	\N
25	2020-08-12 10:26:24.860043	2020-09-07 12:25:30.26636	1	2	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	video	test	de	lecture	\N	\N	\N	f	\N	15	f	1	0	\N	\N
4	2020-08-10 12:56:57.917228	2022-09-02 16:52:53.227357	4	\N	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	f	all	video		de	special	\N	\N	t	t	\N	15	f	1	0	\N	\N
26	2020-09-01 09:16:03.22769	2025-07-14 11:11:15.58856	2	6	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	\N	video		de	lecture	\N	\N	\N	f	\N	15	f	1	0	\N	\N
2	2020-07-24 16:52:00.370572	2025-07-14 11:12:42.279881	2	9	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	2	\N	\N	f	\N	15	f	1	0	\N	\N
27	2022-08-05 13:19:57.44893	2025-07-14 11:12:30.473055	2	10	2	\N	\N	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Seminar: Do 14-16 Uhr im SR 4 im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Tutorium: n.V. bei <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a></li><li>Vorbesprechung: Mi, 24. Juli 2019, 13.15 Uhr in SR 3&nbsp; im Mathematikon, INF 205</li></ul><div><br></div><div><strong>Vorträge</strong></div><div><br>Im Seminar wird jede TeilnehmerIn einen Vortrag halten. Die Vorträge werden bei der <strong>Vorbesprechung</strong> vergeben. Ob nach der Vorbesprechung noch Themen frei sind, können Sie bei der DozentIn in Erfahrung bringen. Beim Vortrag sollen Sie&nbsp; den Ihnen zugewiesenen Stoff in der Ihnen zugewiesenen Zeit behandeln - und zwar so, dass jeder dass jeder der Anwesenden davon profitiert. Um das zu erreichen, ist es wichtig, dass Sie <em>frühzeitig</em> mit der Vorbereitung Ihres Vortrags beginnen. Außerdem erwarten wir, dass Sie rechtzeitig vor dem Vortrag Kontakt mit <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a> aufnehmen, um Details zum Inhalt und zur Strukturierung des Vortrags zu besprechen. Rechtzeitig wäre beispielsweise zwei Wochen vor Ihrem Vortrag - eine Viertelstunde vor Vortragsbeginn ist nicht rechtzeitig. Sie sollten daraufhin arbeiten, sämtliche Details ihres Vortragsinhaltes gründlich zu verstehen. Auf der anderen Seite ist es wichtig für Ihren Vortrag, dass Sie diesen so gestalten, dass Ihre KommilitonInnen - für die der Inhalt Ihres Vortrages in der Regel neu sein wird - eine Chance haben, diesen auch zu verstehen. Viele nützliche Hinweise zum Halten mathematischer Vorträge finden Sie <a href="http://download.uni-mainz.de/mathematik/Topologie%20und%20Geometrie/Lehre/Wie-halte-ich-einen-Seminarvortrag.pdf">hier</a>.<br><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen des Vortrags notwendig.</li><li>Die Anmeldung zum Vortrag erfolgt über MÜSLI. Die Anmeldung wird am 15. August 2019 geschlossen. Wer danach noch im MÜSLI für das Seminar eingetragen ist, erhält bei Nichtabhalten seines/ihres Vortrags die Note 5 (nicht bestanden).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note des bestandenen Vortrags, bzw. der Note 5.0, wenn der Vortrag nicht bestanden oder nicht abgehalten wurde.</li></ul>	\N	\N	all	video	key	en	seminar	\N	\N	\N	f	\N	15	f	1	0	\N	\N
1	2020-07-24 13:17:08.173027	2026-08-24 19:07:35.513266	1	5	2	0	t	0	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	t	t	all	video		de	lecture	1	\N	\N	f	2	15	f	1	0	\N	\N
35	2026-08-24 19:07:32.961666	2026-08-24 19:07:33.057873	16	6	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	seminar	\N	\N	\N	f	\N	15	f	1	0	\N	\N
3	2020-07-24 17:01:18.424312	2026-08-24 19:07:35.914151	3	5	2	1	f	\N	<div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul>	\N	\N	all	manuscript		de	lecture	3	\N	\N	f	\N	15	f	1	0	\N	\N
28	2025-07-14 11:37:42.454732	2026-08-24 19:07:36.661059	9	5	2	\N	\N	\N	<!-- BEGIN app/views/lectures/organizational/_lecture.html.erb --><div><strong>Termine</strong></div><div><br></div><ul><li>Vorlesung: Mo, Mi 9-11 Uhr im Hörsaal im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Plenarübung: Do 14-16 Uhr in SR A im Mathematikon, INF 205 (Dozentin: <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a>)</li><li>Modulprüfung:&nbsp;<ul><li>Erste Klausur: Montag, den 30. Februar 2001 von 9.30-11.30 Uhr in SR A+B im Mathematikon, INF 205</li><li>Zweite Klausur: Termin wird noch bekanntgegeben&nbsp;</li></ul></li></ul><div><br></div><div><strong>Übungsbetrieb</strong></div><div><br></div><div>Für die Zulassung zur Modulklausur ist die erfolgreiche Teilnahme am Übungsbetrieb erforderlich. Jeden Montag wird das jeweils neue Aufgabenblatt über MaMpf online gestellt. <br>Die Lösungen sollen bis Montag der Folgewoche um 12 Uhr in die dafür vorgesehenen Einwurfkästen im Mathematikon abgegeben werden. Zum Besprechen der Lösungen und für Fragen zum aktuellen Stoff gibt es Tutorien, die im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet werden. Bitte tragen Sie sich rechtzeitig für diese ein. Die Tutorien werden ab der zweiten Vorlesungswoche stattfinden. Die Abgabe der Übungsaufgaben ist nachdrücklich in Zweierteams gewünscht.</div><div><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen einer der beiden Klausuren notwendig.</li><li><strong>Klausurzulassung:</strong>&nbsp;<ul><li>Für die Zulassung zur <em>ersten Klausur</em> ist die regelmäßige Teilnahme an den Tutorien und die erfolgreiche Bearbeitung der Übungsblätter notwendig. Hinreichend für die erfolgreiche Bearbeitung ist dabei das Erreichen von 50% der erreichbaren Punkte in den Übungsaufgaben.&nbsp;</li><li>Zur <em>zweiten Klausur</em> ist zugelassen, wer zur ersten Klausur zugelassen war und diese nicht bestanden hat (sei es durch Nicht-Erreichen der nötigen Punktzahl oder durch Nicht-Antreten).</li><li><em>Achtung:</em> Wer an der ersten Klausur nicht teilnimmt, verschenkt somit einen Versuch, das Modul zu bestehen.</li></ul></li><li><strong>Klausuranmeldung:</strong> Die Anmeldung zur Klausur wird im <a href="https://www.mathi.uni-heidelberg.de/muesli/user/login">MÜSLI</a> verwaltet und läuft vom 15. Januar 2001&nbsp; bis zum 31. Januar 2001.</li><li><strong>Teilnahme an der Modulprüfung:</strong> Wer zur Klausur zugelassen und angemeldet ist, nimmt offiziell an der Modulprüfung teil, selbst wenn er/sie an keiner Klausur teilnimmt. In letzterem Falle erhält er/sie die Note 5.0.&nbsp;</li><li><strong>Nachprüfung:</strong> Für diejenigen, die bei einem der Klausurtermine verhindert waren und bei dem anderen nicht bestanden haben, wird die Möglichkeit einer mündlichen oder schriftlichen Nachprüfung eingeräumt. "Verhindert" bedeutet dabei verhindert durch Krankheit (ärztliches Attest bis eine Woche nach der betreffenden Klausur im Prüfungssekretariat nachreichen) oder ähnlich triftige Gründe. <em>Achtung:</em> Wer etwa an der ersten Klausur nicht teilnimmt ohne im obigem Sinne verhindert zu sein und die zweite Klausur nicht besteht, bekommt keine Möglichkeit zur Nachprüfung. Der erste Versuch wurde schlichtweg verschenkt (s.o.).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note der bestandenen Klausur (oder evtl. gewährte Nachprüfung), bzw. der Note 5.0, wenn keine Klausur (oder evtl. gewährte Nachprüfung) bestanden wurde.</li></ul><!-- END app/views/lectures/organizational/_lecture.html.erb -->	\N	\N	all	video	\N	de	vignettes	4	\N	\N	f	\N	15	f	1	0	\N	\N
34	2026-08-24 19:07:32.857115	2026-08-24 19:07:32.911543	15	6	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	\N	\N	\N	f	\N	15	f	1	0	\N	\N
32	2026-08-24 19:07:32.457906	2026-08-24 19:07:37.350854	13	5	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	lecture	6	\N	\N	f	\N	15	f	1	0	\N	\N
33	2026-08-24 19:07:32.581036	2026-08-24 19:07:37.992119	14	5	2	\N	\N	\N	\N	\N	\N	all	video	\N	en	seminar	7	\N	\N	f	\N	15	f	1	0	\N	\N
30	2026-08-24 19:07:16.526541	2026-08-24 19:07:38.332112	11	5	2	\N	\N	\N	\N	\N	\N	t	video	\N	en	seminar	8	\N	\N	f	\N	15	f	1	0	\N	\N
31	2026-08-24 19:07:30.116727	2026-08-24 19:07:38.654002	12	5	2	\N	\N	\N	\N	\N	\N	t	video	\N	en	seminar	9	\N	\N	f	\N	15	f	1	0	\N	\N
29	2025-07-15 12:03:30.235477	2026-08-24 19:07:37.018436	10	5	2	\N	\N	\N	<!-- BEGIN app/views/lectures/organizational/_seminar.html.erb --><div><strong>Termine</strong></div><div><br></div><ul><li>Seminar: Do 14-16 Uhr im SR 4 im Mathematikon, INF 205 (Dozent: <a href="https://en.wikipedia.org/wiki/Mickey_Mouse">Mickey Mouse</a>)</li><li>Tutorium: n.V. bei <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a></li><li>Vorbesprechung: Mi, 24. Juli 2019, 13.15 Uhr in SR 3&nbsp; im Mathematikon, INF 205</li></ul><div><br></div><div><strong>Vorträge</strong></div><div><br>Im Seminar wird jede TeilnehmerIn einen Vortrag halten. Die Vorträge werden bei der <strong>Vorbesprechung</strong> vergeben. Ob nach der Vorbesprechung noch Themen frei sind, können Sie bei der DozentIn in Erfahrung bringen. Beim Vortrag sollen Sie&nbsp; den Ihnen zugewiesenen Stoff in der Ihnen zugewiesenen Zeit behandeln - und zwar so, dass jeder dass jeder der Anwesenden davon profitiert. Um das zu erreichen, ist es wichtig, dass Sie <em>frühzeitig</em> mit der Vorbereitung Ihres Vortrags beginnen. Außerdem erwarten wir, dass Sie rechtzeitig vor dem Vortrag Kontakt mit <a href="https://en.wikipedia.org/wiki/Minnie_Mouse">Minnie Mouse</a> aufnehmen, um Details zum Inhalt und zur Strukturierung des Vortrags zu besprechen. Rechtzeitig wäre beispielsweise zwei Wochen vor Ihrem Vortrag - eine Viertelstunde vor Vortragsbeginn ist nicht rechtzeitig. Sie sollten daraufhin arbeiten, sämtliche Details ihres Vortragsinhaltes gründlich zu verstehen. Auf der anderen Seite ist es wichtig für Ihren Vortrag, dass Sie diesen so gestalten, dass Ihre KommilitonInnen - für die der Inhalt Ihres Vortrages in der Regel neu sein wird - eine Chance haben, diesen auch zu verstehen. Viele nützliche Hinweise zum Halten mathematischer Vorträge finden Sie <a href="http://download.uni-mainz.de/mathematik/Topologie%20und%20Geometrie/Lehre/Wie-halte-ich-einen-Seminarvortrag.pdf">hier</a>.<br><br></div><div><strong>Literatur</strong></div><div><br></div><ul><li>G. Fischer: <a href="https://link.springer.com/book/10.1007%2F978-3-322-88921-8">Analytische Geometrie</a></li><li>H. Kasten, D. Vogel: <a href="http://www.ub.uni-heidelberg.de/cgi-bin/edok?dok=https%3A%2F%2Fdoi.org%2F10.1007%2F978-3-662-57621-2&amp;katkey=68311803">Grundlagen der ebenen Geometrie</a></li></ul><div><br></div><div><strong>Prüfungs- und Benotungsregeln</strong></div><div><br></div><ul><li>Zum erfolgreichen Absolvieren der Modulprüfung ist das Bestehen des Vortrags notwendig.</li><li>Die Anmeldung zum Vortrag erfolgt über MÜSLI. Die Anmeldung wird am 15. August 2019 geschlossen. Wer danach noch im MÜSLI für das Seminar eingetragen ist, erhält bei Nichtabhalten seines/ihres Vortrags die Note 5 (nicht bestanden).</li><li><strong>Benotung:</strong> Die Note für das Modul besteht aus der Note des bestandenen Vortrags, bzw. der Note 5.0, wenn der Vortrag nicht bestanden oder nicht abgehalten wurde.</li></ul><!-- END app/views/lectures/organizational/_seminar.html.erb -->	\N	\N	all	video	\N	de	proseminar	5	\N	\N	f	\N	15	f	1	0	\N	\N
\.


--
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
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lessons (id, date, lecture_id, created_at, updated_at, start_destination, end_destination, details) FROM stdin;
12	2020-10-21	2	2020-07-24 16:53:25.575141	2025-07-14 11:12:42.259389	\N	\N	
1	2026-04-21	1	2020-07-24 13:46:15.926855	2025-07-14 11:01:53.204542	\N	\N	
2	2026-04-23	1	2020-07-24 13:47:35.445993	2025-07-14 11:01:53.204542	\N	\N	
9	2026-05-19	1	2020-07-24 13:52:24.40245	2025-07-14 11:01:53.204542	\N	\N	
10	2026-05-28	1	2020-07-24 13:52:50.724565	2025-07-14 11:01:53.204542	\N	\N	
3	2026-04-28	1	2020-07-24 13:48:26.566012	2025-07-14 11:01:53.204542	\N	\N	
5	2026-05-05	1	2020-07-24 13:49:32.40135	2025-07-14 11:01:53.204542	\N	\N	
4	2026-04-30	1	2020-07-24 13:49:04.235057	2025-07-14 11:01:53.204542	\N	\N	
6	2026-05-07	1	2020-07-24 13:49:56.825933	2025-07-14 11:01:53.204542	\N	\N	
7	2026-05-12	1	2020-07-24 13:50:20.217324	2025-07-14 11:01:53.204542	\N	\N	
8	2026-05-14	1	2020-07-24 13:50:41.367319	2025-07-14 11:01:53.213988	\N	\N	
\.


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.links (id, medium_id, linked_medium_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.media (id, external_reference_link, created_at, updated_at, sort, description, teachable_type, teachable_id, video_data, screenshot_data, manuscript_data, released, imported_manuscript, hint, parent_id, quiz_graph, level, type, text, independent, locale, solution, question_sort, content, geogebra_data, geogebra_app_name, "position", text_input, released_at, publisher, file_last_edited, external_link_description, annotations_status, answers_count) FROM stdin;
39	\N	2020-07-24 17:03:37.785021	2026-08-24 19:07:35.92225	Script	Vorlesungsskript	Lecture	3	\N	\N	{"id":"medium/39/manuscript/02c2ff5ef750d0b3bdbd44dad9b0ceea.pdf","storage":"store","metadata":{"filename":"Skript.V.Geo.SS20.Vorlesungsskript.pdf","size":6388579,"mime_type":"application/pdf","pages":152,"destinations":["chap:Analytische-Geometrie","sect:Affine-Raeume","defn:affiner-Raum","defn:affine-Dimension","bsp:affiner-Standardraum","Aktion-der-Translationen","Vektoraddition","defn:affiner-Unterraum","bsp:affine-Unterraeume","prop:Dimension-affiner-Unterraum","defn:Dimension-affiner-Unterraum","prop:affine-Unterraeume-sind-affine-Raeume","prop:Durchschnitt-und-Verbindungsraum-affin","Durchschnitt","Verbindungsraum-Fall-1","Verbindungsraum-Fall-2","satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","satz:Dimensionsformel-fuer-affine-Unterraeume","defn:parallel-und-windschief","bem:keine-windschiefen-Hyperebenen","bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sect:Affine-Abbildungen","defn:affine-Abbildung","affine-Abbildung","bsp:affine-Abb","prop:Kriterium-fuer-affine-Abbildung","prop:Zusammenhang-affine-und-lineare-Abbildungen","affine-Abbildung-aus-linearer-Abbildung","bsp:affine-Abbildungen-in-der-affinen-Standardebene","W-Bahn","prop:Parallelprojektion","defn:kollinear","defn:n-Eck","defn:Parallelogramm","prop:affine-Abbildungen-erhalten-Parallelogramme","affine-Abbildungen-erhalten-Parallelogramme","Bild-ist-Parallelogramm-1","Bild-ist-Parallelogramm-2","gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht","sect:Affine-Koordinaten","defn:affine-Basis","bsp:Standardbasis-des-affinen-Standardraums","bem:affine-Unabhaengigkeit","satz:affine-Abbildung","defn:affines-Koordinatensystem","defn:Teilverhaeltnis","Teilverhaeltnis","bem:Teilverhaeltnis-in-Standardraum","prop:TV-affine-Invariante","satz:affiner-Strahlensatz","defn:Mittelpunkt","satz:Diagonalensatz","satz:Schwerpunktsatz","defn:Winkel-affin","euklidisches-Winkelmass","Winkelgroesse","defn:Seitenlaengen-und-Innenwinkelgroessen","satz:Kosinussatz","Kosinussatz","coro:Pythagoras","satz:Winkelsumme-im-Dreieck","Winkelsumme-Kosinuswerte","Sinus-des-Winkelmasses","Rechnung-zu-Cauchy-Schwartz","Winkelsumme-Sinuswerte","satz:Sinussatz","coro:Hypothenuse-und-Katheten","sect:Polytope","defn:Polytop","bsp:Durchschnitt-von-Halbraeumen","bem:Rand-eines-Polytops","defn:Ecken-Kanten-Flaechen","bsp:Wuerfel","satz:Polyederformel","defn:Platonischer-Koerper","prop:Polytop","coro:Platonische-Koerper","defn:Aehnlichkeitsabbildung-analytisch","satz:Klassifikation-der-Platonischen-Koerper","sect:Projektive-Raeume","defn:projektiver-Raum","bsp:projektiver-Standardraum","bsp:Einbettungen-projektiver-Standardraeume","defn:projektiver-Unterraum","prop:Durchschnitt-und-Verbindungsraum-projektiv","abb:Boyflaeche","Beschreibung-projektiver-Verbindungsraum","satz:Dimensionsformel-fuer-projektive-Unterraeume","sect:Projektive-Abbildungen","defn:projektive-Abbildung","prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb","bsp:kanonische-Einbettung","defn:Zentralprojektion","Wohldefiniertheit-Zentralprojektion-1","Wohldefiniertheit-Zentralprojektion-2","bem:Beschreibung-Zentralprojektion","prop:Zentralprojektionen-sind-Projektivitaeten","satz:projektiver-Abschluss","bsp:projektiver-Abschluss","ZcapX","dim-ZcapX","sect:Projektive-Koordinaten","defn:projektive-Basis","bsp:kanonische-projektive-Basis","abb:projektive-Standardbasis","lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis","satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph","defn:projektives-Koordinatensystem","defn:Doppelverhaeltnis-projektiv","prop:DV-projektive-Invariante","DV-projektive-Invariante","prop:DV-Berechnung","bem:Zusammenhang-DV-und-TV","satz:projektiver-Desargues","sect:Computergraphik","Transformationen-in-R3","defn:Quader","defn:Kegelstumpf","sect:Uebungsaufgaben-Analytische-Geometrie","aufg:Verbindungsgerade-ist-Gerade","aufg:Eigenschaften-affiner-Abbildungen","aufg:Abbildungsgeometrie","aufg:Tangenssatz","aufg:Heronsche-Formel","aufg:Vergleich-rechtwinkliger-Dreiecke","aufg:Durchschnitt-Gerade-mit-Einheitssphaere","aufg:fast-jede-Projektivitaet-ist-Zentralprojektion","aufg:projektiver-Pappos","chap:Inzidenzgeometrie","sect:Inzidenzebenen","defn:Inzidenzebene","bsp:Inzidenzebene","prop:Geradenschnittpunkt","prop:Kriterium-Punkt-auf-Gerade","prop:Trennung-von-Punkt-und-Gerade","satz:A2(K)-Inzidenzebene","bem:Parallelitaet-in-A2(K)","defn:Isomorphismus-von-Inzidenzebenen","bsp:affine-Ebenen-sind-Inzidenzebenen","sect:affine-Ebenen","defn:Parallelenaxiome","defn:affine-Ebene","bsp:Parallelenaxiome","prop:Parallelitaet-Aequivalenzrelation","defn:Parallelenbueschel-und-Geradenbueschel","bsp:Parallelenbueschel-und-Geradenbueschel","defn:affiner-Isomorphismus","bsp:affiner-Isomorphismus","sect:Uebungsaufgaben-Inzidenzgeometrie","aufg:Isomorphismen-von-Inzidenzebenen","aufg:affine-Ebene-mit-fuenf-Punkten","aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig","chap:Hilbertebenen","sect:Anordnungsaxiome","defn:Anordnungsaxiome","prop:Seiten-einer-Geraden","abb:Geradenseiten","bsp:affine-Standardebene-und-Anordnung","Anordnung-fuer-affine-Standardebenen","Hessesche-Normalform","defn:Lage-auf-verschiedenen-Geradenseiten","prop:Seiten-von-Geraden-und-Punkten","coro:Seiten-eines-Punktes","defn:Anordnung-vieler-Punkte","prop:Anordnung-von-Punkten-auf-Geraden","bem:alternatives-Anordnungsaxiom","defn:strecke-und-strahl","prop:Strecken-und-Strahlen","prop:gerade-vereinigung-von-strahlen","satz:Pasch","sect:Die-Kongruenzaxiome-fuer-Strecken","defn:Kongruenzaxiome-fuer-Strecken","bsp:affine-Standardebene-und-Kongruenzen-von-Strecken","prop:Streckensubtraktion","defn:<-fuer-Strecken","prop:<-fuer-Strecken","sect:Kongruenzaxiome-fuer-Winkel","defn:Winkel","abb:Winkel","prop:winkel","defn:Inneres-eines-Winkels","lemma:im-Inneren-eines-Winkels","defn:Kongruenzaxiome-fuer-Winkel","defn:<-fuer-Winkel","prop:<-fuer-Winkel","defn:Dreieck","bem:dreieck","defn:ebene-Geometrie","defn:Bewegung","bsp:Bewegungen-in-der-affinen-Standardebene","defn:gvB","satz:genug-Bewegung","Voraussetzungen-SWS","bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln","Kongruenz-von-Winkeln-in-der-affinen-Standardebene","sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel","defn:Ergaenzungswinkel-Gegenwinkel","prop:Ergaenzungswinkel","coro:Gegenwinkel","defn:rechter-Winkel","prop:rechter-Winkel","satz:Viertes-euklidisches-Postulat","coro:rechte-Winkel","sect:Orthogonalitaet-und-Parallelitaet","defn:orthogonal","satz:Orthogonale-Gerade","abb:Orthogonale","defn:Wechselwinkel-und-Stufenwinkel","bem:Wechselwinkel-und-Stufenwinkel","satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz","coro:zum-schwachen-wws","coro:Lot-eindeutig","coro:Existenz-von-Parallelen","satz:Parallelenaxiom-in-Hilbertebenen","sect:Kongruenzsatz","prop:eindeutiges-Dreieck","defn:gleichschenkliges-Dreieck","prop:gleichschenkliges-Dreieck","prop:Winkeladdsubtraktion","satz:Kongruenzsatz-fuer-Dreiecke","wsw-1","sect:Mittelsenkrechte-und-Winkelhalbierende","defn:Streckenmittelpunkt","lemma:Mittelpunkt-liegt-zwischen-Randpunkten","satz:Mittelpunkt","Mittelpunkt-1","Mittelpunkt-2","defn:Mittelsenkrechte","prop:Charakterisierung-Mittelsenkrechte","defn:Winkelhalbierende","prop:Existenz-der-Winkelhalbierenden","sect:Innen-und-Aussenwinkel-im-Dreieck","defn:Innenwinkel","prop:schwache-Winkelsumme-im-Dreieck-1","schwache-Winkelsumme-im-Dreieck","satz:Aussenwinkelsatz","satz:grosse-Dreiecksseite-hat-grossen-Winkel","abb:grosse-Dreiecksseite-hat-grossen-Winkel","satz:SSrechterWinkel","sect:Kreise","defn:Kreis","prop:Kreise-haben-genau-einen-Mittelpunkt","satz:Umkreissatz","defn:Hoehe","satz:Hoehensatz","satz:Inkreissatz","sect:Uebungsaufgaben-Hilbertebenen","aufg:Anordnung-von-Punkten-auf-Geraden","aufg:unendlich-viele-Punkte-mit-I-+-A","aufg:Anordnung-Modell-alternativ","aufg:<-fuer-Winkel","aufg:Inneres-bestimmt-den-Winkel","aufg:konvexe-Mengen","aufg:Parallelogramm-synthetisch","aufg:Spiegelungen-in-Hilbertebenen","aufg:Abschaetzung-Abstand-Punkt-Gerade","aufg:Hoehenformel","chap:Euklidische-Geometrie-kurz","sect:Vollstaendigkeitsaxiom","defn:Dedekindschnitt","defn:Vollstaendigkeitsaxiom","bsp:Vollstaendigkeitsaxiom","satz:Archimedisches-Axiom","sect:Euklidische-Ebenen","defn:Euklidsche-Ebene","defn:Isomorphismus-euklidischer-Ebenen","satz:Hauptsatz-fuer-euklidische-Ebenen","prop:Groesse-der-Winkelsumme","sect:Kreise-in-der-euklidischen-Ebene","prop:Durchschnitt-Kreis-Gerade","coro:Tangente","defn:Potenz","satz:Zweisehnensatz","satz:Sehnen-Tangenten-Satz","prop:potenzgerade","satz:Kreis-Kreis-Schnitt-Eigenschaft","coro:Kreis-Kreis-Schnitt-Eigenschaft","satz:Peripheriewinkelsatz","satz:Thales","satz:Sinussatz-Verschaerfung","satz:Eulergleichung","coro:Eulergerade","sect:Inversion-am-Kreis","defn:Inversion-am-Kreis","prop:Inversionen-am-Kreis-sind-bijektiv","prop:Tangentenschnittpunkt-mit-Inversion","prop:Eigenschaften-der-Inversion","defn:verallgemeinerte-Gerade","prop:orthogonale-verallgemeinerte-Geraden","prop:orthogonale-Kreise","prop:Inversion-Kreis-an-Kreis","Schnittpunktanzahl-bleibt-unter-Inversion-erhalten","Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2","Inversion-fuer-verallgemeinerte-Geraden","lemma:Beruehrpunkte-unter-der-Inversion","prop:Inversion-und-Tangenten","defn:verallgemeinerte-Winkelgroesse","satz:Inversion-winkeltreu","defn:Doppelverhaeltnis","prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis","DV-1","DV-2","sect:Uebungsaufgaben-Euklidische-Geometrie","aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl","aufg:Peripheriewinkelsatz","aufg:Tangentenschnittpunkt-mit-Inversion","aufg:gleichseitige-Dreiecke-SHU","chap:Nichteuklidsche-Geometrie","sect:Hyperbolische-Ebenen","defn:Hyperbolische-Ebene","defn:Endpunkte-von-k-Geraden","prop:Kreismodell-ist-Inzidenzebene","I2-hyperbolisch","Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs","prop:Kreismodell-erfuellt-Anordnungsaxiome","hyperbolischer-Abstand","lemma:k-Anordnung-von-k-Punkten","Kongruenz-von-k-Strecken","prop:Kreismodell-erfuellt-Streckenkongruenzaxiome","prop:Kreismodell-erfuellt-Winkelkongruenzaxiome","prop:k-Bewegung-in-den-Ursprung","prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom","prop:hyperbolisches-Axiom-im-Poincaremodell","satz:Kreismodell-ist-hyperbolische-Ebene","sect:Hyperbolische-Geometrie","Additionstheorem-cosh","hyperbolisches-Pythagorasaequivalent","lemma:k-Abstand-zum-Ursprung","lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung","lemma:Norm-im-Klein-Modell","satz:Trigonometrie-rechtwinkliges-k-Dreieck","satz:hyperbolische-Trigonometrie","hyperbolische-Trigonometrie","satz:Winkelsumme-im-k-Dreieck","beta+gamma<pi","sect:Uebungsaufgaben-Nichteuklidische-Geometrie","aufg:hyperbolische-Geradenspiegelung-ist-Bewegung","aufg:Poincarehalbebene"],"bookmarks":[{"destination":"chap:Analytische-Geometrie","sort":"Kapitel","label":"1","description":"Analytische Geometrie","chapter":"1","section":"1.0","subsection":"1.0.0","page":"3","counter":0},{"destination":"sect:Affine-Raeume","sort":"Abschnitt","label":"1.1","description":"Affine Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"3","counter":1},{"destination":"defn:affiner-Raum","sort":"Definition","label":"1.1","description":"affiner Raum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"3","counter":2},{"destination":"defn:affine-Dimension","sort":"Definition","label":"1.2","description":"affine Dimension","chapter":"1","section":"1.1","subsection":"1.1.0","page":"4","counter":3},{"destination":"bsp:affiner-Standardraum","sort":"Beispiel","label":"1.3","description":"affiner Standardraum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"4","counter":4},{"destination":"Aktion-der-Translationen","sort":"Gleichung","label":"1.1","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":5},{"destination":"Vektoraddition","sort":"Gleichung","label":"1.2","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":6},{"destination":"defn:affiner-Unterraum","sort":"Definition","label":"1.4","description":"affiner Unterraum","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":7},{"destination":"bsp:affine-Unterraeume","sort":"Beispiel","label":"1.5","description":"affine Unterräume der affinen Standardräume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"5","counter":8},{"destination":"prop:Dimension-affiner-Unterraum","sort":"Proposition","label":"1.6","description":"Beliebigkeit des Aufpunkts eines affinen Unterraums","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":9},{"destination":"defn:Dimension-affiner-Unterraum","sort":"Definition","label":"1.7","description":"Dimension eines affinen Unterraums","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":10},{"destination":"prop:affine-Unterraeume-sind-affine-Raeume","sort":"Proposition","label":"1.8","description":"affine Unterräume sind affine Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"6","counter":11},{"destination":"prop:Durchschnitt-und-Verbindungsraum-affin","sort":"Proposition","label":"1.9","description":"Durchschnitt und Verbindungsraum affiner Räume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":12},{"destination":"Durchschnitt","sort":"Gleichung","label":"1.3","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":13},{"destination":"Verbindungsraum-Fall-1","sort":"Gleichung","label":"1.4","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"7","counter":14},{"destination":"Verbindungsraum-Fall-2","sort":"Gleichung","label":"1.5","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"8","counter":15},{"destination":"satz:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sort":"Satz","label":"1.10","description":"Verbindungsraum als Vereinigung von Verbindungsgeraden","chapter":"1","section":"1.1","subsection":"1.1.0","page":"9","counter":16},{"destination":"satz:Dimensionsformel-fuer-affine-Unterraeume","sort":"Satz","label":"1.11","description":"Dimensionsformel für affine Unterräume","chapter":"1","section":"1.1","subsection":"1.1.0","page":"9","counter":17},{"destination":"defn:parallel-und-windschief","sort":"Definition","label":"1.12","description":"parallel und windschief","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":18},{"destination":"bem:keine-windschiefen-Hyperebenen","sort":"Bemerkung","label":"1.13","description":"eine Hyperebene ist zu keinem affinen Unterraum windschief","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":19},{"destination":"bem:Verbindungsraum-als-Vereinigung-von-Verbindungsgeraden","sort":"Bemerkung","label":"1.14","description":"","chapter":"1","section":"1.1","subsection":"1.1.0","page":"10","counter":20},{"destination":"sect:Affine-Abbildungen","sort":"Abschnitt","label":"1.2","description":"Affine Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":21},{"destination":"defn:affine-Abbildung","sort":"Definition","label":"1.15","description":"affine Abbildung","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":22},{"destination":"affine-Abbildung","sort":"Gleichung","label":"1.6","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":23},{"destination":"bsp:affine-Abb","sort":"Beispiel","label":"1.16","description":"affine Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":24},{"destination":"prop:Kriterium-fuer-affine-Abbildung","sort":"Proposition","label":"1.17","description":"Kriterium für affine Abbildung","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":25},{"destination":"prop:Zusammenhang-affine-und-lineare-Abbildungen","sort":"Proposition","label":"1.18","description":"Zusammenhang zwischen affinen und linearen Abbildungen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"11","counter":26},{"destination":"affine-Abbildung-aus-linearer-Abbildung","sort":"Gleichung","label":"1.7","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"12","counter":27},{"destination":"bsp:affine-Abbildungen-in-der-affinen-Standardebene","sort":"Beispiel","label":"1.19","description":"affine Abbildungen in der affinen Standardebene","chapter":"1","section":"1.2","subsection":"1.2.0","page":"12","counter":28},{"destination":"W-Bahn","sort":"Gleichung","label":"1.8","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"13","counter":29},{"destination":"prop:Parallelprojektion","sort":"Proposition","label":"1.20","description":"Parallelprojektionen","chapter":"1","section":"1.2","subsection":"1.2.0","page":"13","counter":30},{"destination":"defn:kollinear","sort":"Definition","label":"1.21","description":"kollinear","chapter":"1","section":"1.2","subsection":"1.2.0","page":"14","counter":31},{"destination":"defn:n-Eck","sort":"Definition","label":"1.22","description":"n-Eck","chapter":"1","section":"1.2","subsection":"1.2.0","page":"14","counter":32},{"destination":"defn:Parallelogramm","sort":"Definition","label":"1.23","description":"Parallelogramm","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":33},{"destination":"prop:affine-Abbildungen-erhalten-Parallelogramme","sort":"Proposition","label":"1.24","description":"affine Abbildungen erhalten Parallelogramme","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":34},{"destination":"affine-Abbildungen-erhalten-Parallelogramme","sort":"Gleichung","label":"1.9","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":35},{"destination":"Bild-ist-Parallelogramm-1","sort":"Gleichung","label":"1.10","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":36},{"destination":"Bild-ist-Parallelogramm-2","sort":"Gleichung","label":"1.11","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":37},{"destination":"gegenueberliegende-Seiten-im-Parallelogramm-schneiden-sich-nicht","sort":"Gleichung","label":"1.12","description":"","chapter":"1","section":"1.2","subsection":"1.2.0","page":"15","counter":38},{"destination":"sect:Affine-Koordinaten","sort":"Abschnitt","label":"1.3","description":"Affine Koordinaten","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":39},{"destination":"defn:affine-Basis","sort":"Definition","label":"1.25","description":"affine Basis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":40},{"destination":"bsp:Standardbasis-des-affinen-Standardraums","sort":"Beispiel","label":"1.26","description":"Standardbasis des affinen Standardraums","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":41},{"destination":"bem:affine-Unabhaengigkeit","sort":"Bemerkung","label":"1.27","description":"affine Unabhängigkeit hängt nicht von der Reihenfolge ab","chapter":"1","section":"1.3","subsection":"1.3.0","page":"16","counter":42},{"destination":"satz:affine-Abbildung","sort":"Satz","label":"1.28","description":"Eindeutigkeit der affinen Abbildung mit gegebenen Bildern einer affinen Basis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"17","counter":43},{"destination":"defn:affines-Koordinatensystem","sort":"Definition","label":"1.29","description":"affines Koordinatensystem","chapter":"1","section":"1.3","subsection":"1.3.0","page":"17","counter":44},{"destination":"defn:Teilverhaeltnis","sort":"Definition","label":"1.30","description":"Teilverhältnis","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":45},{"destination":"Teilverhaeltnis","sort":"Gleichung","label":"1.13","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":46},{"destination":"bem:Teilverhaeltnis-in-Standardraum","sort":"Bemerkung","label":"1.31","description":"Teilverhältnis im affinen Standardraum","chapter":"1","section":"1.3","subsection":"1.3.0","page":"18","counter":47},{"destination":"prop:TV-affine-Invariante","sort":"Proposition","label":"1.32","description":"Teilverhältnis ist affine Invariante","chapter":"1","section":"1.3","subsection":"1.3.0","page":"19","counter":48},{"destination":"satz:affiner-Strahlensatz","sort":"Satz","label":"1.33","description":"Strahlensatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"19","counter":49},{"destination":"defn:Mittelpunkt","sort":"Definition","label":"1.35","description":"Mittelpunkt","chapter":"1","section":"1.3","subsection":"1.3.0","page":"21","counter":50},{"destination":"satz:Diagonalensatz","sort":"Satz","label":"1.36","description":"Diagonalensatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"21","counter":51},{"destination":"satz:Schwerpunktsatz","sort":"Satz","label":"1.37","description":"Schwerpunktsatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"22","counter":52},{"destination":"defn:Winkel-affin","sort":"Definition","label":"1.38","description":"Strecke, Strahl und Winkel","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":53},{"destination":"euklidisches-Winkelmass","sort":"Gleichung","label":"1.14","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":54},{"destination":"Winkelgroesse","sort":"Gleichung","label":"1.15","description":"Winkelgröße","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":55},{"destination":"defn:Seitenlaengen-und-Innenwinkelgroessen","sort":"Definition","label":"1.39","description":"Seitenlängen und Innenwinkelgrößen eines Dreicks","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":56},{"destination":"satz:Kosinussatz","sort":"Satz","label":"1.40","description":"Kosinussatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"23","counter":57},{"destination":"Kosinussatz","sort":"Gleichung","label":"1.16","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":58},{"destination":"coro:Pythagoras","sort":"Korollar","label":"1.41","description":"Satz des Pythagoras","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":59},{"destination":"satz:Winkelsumme-im-Dreieck","sort":"Satz","label":"1.42","description":"Winkelsumme im Dreieck","chapter":"1","section":"1.3","subsection":"1.3.0","page":"24","counter":60},{"destination":"Winkelsumme-Kosinuswerte","sort":"Gleichung","label":"1.17","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":61},{"destination":"Sinus-des-Winkelmasses","sort":"Gleichung","label":"1.18","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":62},{"destination":"Rechnung-zu-Cauchy-Schwartz","sort":"Gleichung","label":"1.19","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"25","counter":63},{"destination":"Winkelsumme-Sinuswerte","sort":"Gleichung","label":"1.20","description":"","chapter":"1","section":"1.3","subsection":"1.3.0","page":"26","counter":64},{"destination":"satz:Sinussatz","sort":"Satz","label":"1.43","description":"Sinussatz","chapter":"1","section":"1.3","subsection":"1.3.0","page":"26","counter":65},{"destination":"coro:Hypothenuse-und-Katheten","sort":"Korollar","label":"1.44","description":"Sinus und Kosinus als Quotient der Katheten durch die Hypothenuse","chapter":"1","section":"1.3","subsection":"1.3.0","page":"27","counter":66},{"destination":"sect:Polytope","sort":"Abschnitt","label":"1.4","description":"Polytope","chapter":"1","section":"1.4","subsection":"1.4.0","page":"27","counter":67},{"destination":"defn:Polytop","sort":"Definition","label":"1.45","description":"Konvexes Polyeder und Polytop","chapter":"1","section":"1.4","subsection":"1.4.0","page":"27","counter":68},{"destination":"bsp:Durchschnitt-von-Halbraeumen","sort":"Beispiel","label":"1.46","description":"Durchschnitte orthogonaler Halbräume","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":69},{"destination":"bem:Rand-eines-Polytops","sort":"Bemerkung","label":"1.47","description":"Rand eines Polytops","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":70},{"destination":"defn:Ecken-Kanten-Flaechen","sort":"Definition","label":"1.48","description":"Ecken, Kanten, Flächen eines Polytops","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":71},{"destination":"bsp:Wuerfel","sort":"Beispiel","label":"1.49","description":"Ecken, Kanten, Flächen beim Würfel","chapter":"1","section":"1.4","subsection":"1.4.0","page":"28","counter":72},{"destination":"satz:Polyederformel","sort":"Satz","label":"1.50","description":"Euler'sche Polyederformel","chapter":"1","section":"1.4","subsection":"1.4.0","page":"29","counter":73},{"destination":"defn:Platonischer-Koerper","sort":"Definition","label":"1.51","description":"regelmäßige n-Ecke und Platonische Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":74},{"destination":"prop:Polytop","sort":"Proposition","label":"1.52","description":"Beschreibung regulärer Polytope durch Grad und Anzahl der Kanten pro Ecke","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":75},{"destination":"coro:Platonische-Koerper","sort":"Korollar","label":"1.53","description":"Platonische Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"33","counter":76},{"destination":"defn:Aehnlichkeitsabbildung-analytisch","sort":"Definition","label":"1.54","description":"Ähnlichkeitsabbildung","chapter":"1","section":"1.4","subsection":"1.4.0","page":"34","counter":77},{"destination":"satz:Klassifikation-der-Platonischen-Koerper","sort":"Satz","label":"1.55","description":"Klassifikation der Platonischen Körper","chapter":"1","section":"1.4","subsection":"1.4.0","page":"34","counter":78},{"destination":"sect:Projektive-Raeume","sort":"Abschnitt","label":"1.5","description":"Projektive Räume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"36","counter":79},{"destination":"defn:projektiver-Raum","sort":"Definition","label":"1.56","description":"projektiver Raum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"36","counter":80},{"destination":"bsp:projektiver-Standardraum","sort":"Beispiel","label":"1.57","description":"projektiver Standardraum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"37","counter":81},{"destination":"bsp:Einbettungen-projektiver-Standardraeume","sort":"Beispiel","label":"1.58","description":"Veranschaulichung projektiver Standardräume der Dimension 1 und 2 als affine Einbettungen","chapter":"1","section":"1.5","subsection":"1.5.0","page":"37","counter":82},{"destination":"defn:projektiver-Unterraum","sort":"Definition","label":"1.59","description":"projektiver Unterraum","chapter":"1","section":"1.5","subsection":"1.5.0","page":"38","counter":83},{"destination":"prop:Durchschnitt-und-Verbindungsraum-projektiv","sort":"Proposition","label":"1.60","description":"Durchschnitt und Verbindungsraum projektiver Räume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"38","counter":84},{"destination":"abb:Boyflaeche","sort":"Abbildung","label":"1.3","description":"","chapter":"1","section":"1.5","subsection":"1.5.0","page":"39","counter":85},{"destination":"Beschreibung-projektiver-Verbindungsraum","sort":"Gleichung","label":"1.21","description":"","chapter":"1","section":"1.5","subsection":"1.5.0","page":"40","counter":86},{"destination":"satz:Dimensionsformel-fuer-projektive-Unterraeume","sort":"Satz","label":"1.61","description":"Dimensionsformel für projektive Unterräume","chapter":"1","section":"1.5","subsection":"1.5.0","page":"40","counter":87},{"destination":"sect:Projektive-Abbildungen","sort":"Abschnitt","label":"1.6","description":"Projektive Abbildungen","chapter":"1","section":"1.6","subsection":"1.6.0","page":"40","counter":88},{"destination":"defn:projektive-Abbildung","sort":"Definition","label":"1.62","description":"projektive Abbildung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"40","counter":89},{"destination":"prop:Uneindeutigkeit-der-lin-Abb-zu-einer-proj-Abb","sort":"Proposition","label":"1.63","description":"Zusammenhang zwischen den linearen Abbildungen zu einer gegebenen projektiven Abbildung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"41","counter":90},{"destination":"bsp:kanonische-Einbettung","sort":"Beispiel","label":"1.64","description":"kanonische Einbettung","chapter":"1","section":"1.6","subsection":"1.6.0","page":"41","counter":91},{"destination":"defn:Zentralprojektion","sort":"Definition","label":"1.65","description":"Zentralprojektion","chapter":"1","section":"1.6","subsection":"1.6.0","page":"42","counter":92},{"destination":"Wohldefiniertheit-Zentralprojektion-1","sort":"Gleichung","label":"1.22","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":93},{"destination":"Wohldefiniertheit-Zentralprojektion-2","sort":"Gleichung","label":"1.23","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":94},{"destination":"bem:Beschreibung-Zentralprojektion","sort":"Bemerkung","label":"1.66","description":"alternative Beschreibung des Begriffs der Zentralprojektion","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":95},{"destination":"prop:Zentralprojektionen-sind-Projektivitaeten","sort":"Proposition","label":"1.67","description":"Zentralprojektionen sind Projektivitäten","chapter":"1","section":"1.6","subsection":"1.6.0","page":"43","counter":96},{"destination":"satz:projektiver-Abschluss","sort":"Satz","label":"1.68","description":"projektiver Abschluss","chapter":"1","section":"1.6","subsection":"1.6.0","page":"44","counter":97},{"destination":"bsp:projektiver-Abschluss","sort":"Beispiel","label":"1.69","description":"projektiver Abschluss einer Hyperebene in K³","chapter":"1","section":"1.6","subsection":"1.6.0","page":"45","counter":98},{"destination":"ZcapX","sort":"Gleichung","label":"1.24","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"46","counter":99},{"destination":"dim-ZcapX","sort":"Gleichung","label":"1.25","description":"","chapter":"1","section":"1.6","subsection":"1.6.0","page":"47","counter":100},{"destination":"sect:Projektive-Koordinaten","sort":"Abschnitt","label":"1.7","description":"Projektive Koordinaten","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":101},{"destination":"defn:projektive-Basis","sort":"Definition","label":"1.70","description":"projektive Basis","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":102},{"destination":"bsp:kanonische-projektive-Basis","sort":"Beispiel","label":"1.71","description":"Standardbasis des projektiven Standardraums","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":103},{"destination":"abb:projektive-Standardbasis","sort":"Abbildung","label":"1.4","description":"","chapter":"1","section":"1.7","subsection":"1.7.0","page":"49","counter":104},{"destination":"lemma:Zusammenhang-zwischen-projektiver-Basis-und-VR-Basis","sort":"Lemma","label":"1.72","description":"Zusammenhang zwischen projektiver Basis und Basis des zugrunde liegenden Vektorraums","chapter":"1","section":"1.7","subsection":"1.7.0","page":"50","counter":105},{"destination":"satz:projektive-Raeume-gleicher-Dimension-sind-kanonisch-isomorph","sort":"Satz","label":"1.73","description":"projektive Räume gleicher Dimension sind kanonisch isomorph","chapter":"1","section":"1.7","subsection":"1.7.0","page":"50","counter":106},{"destination":"defn:projektives-Koordinatensystem","sort":"Definition","label":"1.74","description":"projektives Koordinatensystem","chapter":"1","section":"1.7","subsection":"1.7.0","page":"51","counter":107},{"destination":"defn:Doppelverhaeltnis-projektiv","sort":"Definition","label":"1.75","description":"Doppelverhältnis","chapter":"1","section":"1.7","subsection":"1.7.0","page":"51","counter":108},{"destination":"prop:DV-projektive-Invariante","sort":"Proposition","label":"1.76","description":"Doppelverhältnis ist projektive Invariante","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":109},{"destination":"DV-projektive-Invariante","sort":"Gleichung","label":"1.26","description":"","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":110},{"destination":"prop:DV-Berechnung","sort":"Proposition","label":"1.77","description":"Berechnung des Doppelverhältnisses aus den homogenen Koordinaten","chapter":"1","section":"1.7","subsection":"1.7.0","page":"52","counter":111},{"destination":"bem:Zusammenhang-DV-und-TV","sort":"Bemerkung","label":"1.78","description":"Zusammenhang zwischen Doppelverhältnis und bestimmten Teilverhältnissen","chapter":"1","section":"1.7","subsection":"1.7.0","page":"54","counter":112},{"destination":"satz:projektiver-Desargues","sort":"Satz","label":"1.79","description":"projektiver Satz von Desargues","chapter":"1","section":"1.7","subsection":"1.7.0","page":"55","counter":113},{"destination":"sect:Computergraphik","sort":"Abschnitt","label":"1.8","description":"Computergraphik","chapter":"1","section":"1.8","subsection":"1.8.0","page":"58","counter":114},{"destination":"Transformationen-in-R3","sort":"Gleichung","label":"1.27","description":"","chapter":"1","section":"1.8","subsection":"1.8.0","page":"59","counter":115},{"destination":"defn:Quader","sort":"Definition","label":"1.80","description":"Quader","chapter":"1","section":"1.8","subsection":"1.8.0","page":"60","counter":116},{"destination":"defn:Kegelstumpf","sort":"Definition","label":"1.81","description":"Rechteckkegelstumpf","chapter":"1","section":"1.8","subsection":"1.8.0","page":"60","counter":117},{"destination":"sect:Uebungsaufgaben-Analytische-Geometrie","sort":"Abschnitt","label":"1.9","description":"Übungsaufgaben","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":118},{"destination":"aufg:Verbindungsgerade-ist-Gerade","sort":"Aufgabe","label":"1.1","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":119},{"destination":"aufg:Eigenschaften-affiner-Abbildungen","sort":"Aufgabe","label":"1.2","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":120},{"destination":"aufg:Abbildungsgeometrie","sort":"Aufgabe","label":"1.4","description":"Transfer: Abbildungsgeometrie","chapter":"1","section":"1.9","subsection":"1.9.0","page":"61","counter":121},{"destination":"aufg:Tangenssatz","sort":"Aufgabe","label":"1.5","description":"Tangenssatz","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":122},{"destination":"aufg:Heronsche-Formel","sort":"Aufgabe","label":"1.6","description":"Heron'sche Formel","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":123},{"destination":"aufg:Vergleich-rechtwinkliger-Dreiecke","sort":"Aufgabe","label":"1.8","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":124},{"destination":"aufg:Durchschnitt-Gerade-mit-Einheitssphaere","sort":"Aufgabe","label":"1.9","description":"","chapter":"1","section":"1.9","subsection":"1.9.0","page":"62","counter":125},{"destination":"aufg:fast-jede-Projektivitaet-ist-Zentralprojektion","sort":"Aufgabe","label":"1.11","description":"Jede Projektivität, die den Durchschnitt von Start- und Zielraum punktweise festlässt, ist eine Zentralprojektion","chapter":"1","section":"1.9","subsection":"1.9.0","page":"63","counter":126},{"destination":"aufg:projektiver-Pappos","sort":"Aufgabe","label":"1.13","description":"projektiver Satz von Pappos","chapter":"1","section":"1.9","subsection":"1.9.0","page":"63","counter":127},{"destination":"chap:Inzidenzgeometrie","sort":"Kapitel","label":"2","description":"Inzidenzgeometrie","chapter":"2","section":"2.0","subsection":"2.0.0","page":"64","counter":128},{"destination":"sect:Inzidenzebenen","sort":"Abschnitt","label":"2.1","description":"Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"64","counter":129},{"destination":"defn:Inzidenzebene","sort":"Definition","label":"2.1","description":"Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":130},{"destination":"bsp:Inzidenzebene","sort":"Beispiel","label":"2.2","description":"Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":131},{"destination":"prop:Geradenschnittpunkt","sort":"Proposition","label":"2.3","description":"nichtparallele Geraden besitzen eindeutigen Schnittpunkt","chapter":"2","section":"2.1","subsection":"2.1.0","page":"65","counter":132},{"destination":"prop:Kriterium-Punkt-auf-Gerade","sort":"Proposition","label":"2.4","description":"Kriterium dafür, ob ein Punkt auf einer Geraden liegt","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":133},{"destination":"prop:Trennung-von-Punkt-und-Gerade","sort":"Proposition","label":"2.5","description":"Trennung von Punkt und Gerade","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":134},{"destination":"satz:A2(K)-Inzidenzebene","sort":"Satz","label":"2.6","description":"affine Standardebene ist Inzidenzebene","chapter":"2","section":"2.1","subsection":"2.1.0","page":"66","counter":135},{"destination":"bem:Parallelitaet-in-A2(K)","sort":"Bemerkung","label":"2.7","description":"Parallelitätsbegriffe in der affinen Standardebene stimmen überein","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":136},{"destination":"defn:Isomorphismus-von-Inzidenzebenen","sort":"Definition","label":"2.8","description":"Isomorphismus von Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":137},{"destination":"bsp:affine-Ebenen-sind-Inzidenzebenen","sort":"Beispiel","label":"2.9","description":"affine Ebenen (analytisch definiert) sind Inzidenzebenen","chapter":"2","section":"2.1","subsection":"2.1.0","page":"67","counter":138},{"destination":"sect:affine-Ebenen","sort":"Abschnitt","label":"2.2","description":"Affine Ebenen","chapter":"2","section":"2.2","subsection":"2.2.0","page":"67","counter":139},{"destination":"defn:Parallelenaxiome","sort":"Definition","label":"2.10","description":"Parallelenaxiom","chapter":"2","section":"2.2","subsection":"2.2.0","page":"67","counter":140},{"destination":"defn:affine-Ebene","sort":"Definition","label":"2.11","description":"affine Ebene","chapter":"2","section":"2.2","subsection":"2.2.0","page":"68","counter":141},{"destination":"bsp:Parallelenaxiome","sort":"Beispiel","label":"2.12","description":"Parallelenaxiom","chapter":"2","section":"2.2","subsection":"2.2.0","page":"68","counter":142},{"destination":"prop:Parallelitaet-Aequivalenzrelation","sort":"Proposition","label":"2.13","description":"Parallelität ist Äquivalenzrelation","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":143},{"destination":"defn:Parallelenbueschel-und-Geradenbueschel","sort":"Definition","label":"2.14","description":"Parallelenbüschel und Geradenbüschel","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":144},{"destination":"bsp:Parallelenbueschel-und-Geradenbueschel","sort":"Beispiel","label":"2.15","description":"Parallelenbüschel und Geradenbüschel in der affinen Standardebene","chapter":"2","section":"2.2","subsection":"2.2.0","page":"69","counter":145},{"destination":"defn:affiner-Isomorphismus","sort":"Definition","label":"2.16","description":"affiner Isomorphismus","chapter":"2","section":"2.2","subsection":"2.2.0","page":"70","counter":146},{"destination":"bsp:affiner-Isomorphismus","sort":"Beispiel","label":"2.17","description":"affiner Isomorphismus","chapter":"2","section":"2.2","subsection":"2.2.0","page":"70","counter":147},{"destination":"sect:Uebungsaufgaben-Inzidenzgeometrie","sort":"Abschnitt","label":"2.3","description":"Übungsaufgaben","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":148},{"destination":"aufg:Isomorphismen-von-Inzidenzebenen","sort":"Aufgabe","label":"2.2","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":149},{"destination":"aufg:affine-Ebene-mit-fuenf-Punkten","sort":"Aufgabe","label":"2.3","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":150},{"destination":"aufg:Geraden-in-affiner-Ebene-sind-gleichmaechtig","sort":"Aufgabe","label":"2.4","description":"","chapter":"2","section":"2.3","subsection":"2.3.0","page":"70","counter":151},{"destination":"chap:Hilbertebenen","sort":"Kapitel","label":"3","description":"Hilbertebenen","chapter":"3","section":"3.0","subsection":"3.0.0","page":"72","counter":152},{"destination":"sect:Anordnungsaxiome","sort":"Abschnitt","label":"3.1","description":"Die Anordnungsaxiome","chapter":"3","section":"3.1","subsection":"3.1.0","page":"72","counter":153},{"destination":"defn:Anordnungsaxiome","sort":"Definition","label":"3.1","description":"Anordnungsaxiome","chapter":"3","section":"3.1","subsection":"3.1.0","page":"72","counter":154},{"destination":"prop:Seiten-einer-Geraden","sort":"Proposition","label":"3.2","description":"Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"73","counter":155},{"destination":"abb:Geradenseiten","sort":"Abbildung","label":"3.1","description":"Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"73","counter":156},{"destination":"bsp:affine-Standardebene-und-Anordnung","sort":"Beispiel","label":"3.3","description":"Anordnung in der affinen Standardebene","chapter":"3","section":"3.1","subsection":"3.1.0","page":"74","counter":157},{"destination":"Anordnung-fuer-affine-Standardebenen","sort":"Gleichung","label":"3.1","description":"","chapter":"3","section":"3.1","subsection":"3.1.0","page":"74","counter":158},{"destination":"Hessesche-Normalform","sort":"Gleichung","label":"3.2","description":"Hesse'sche Normalform","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":159},{"destination":"defn:Lage-auf-verschiedenen-Geradenseiten","sort":"Definition","label":"3.4","description":"Lage auf verschiedenen Seiten einer Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":160},{"destination":"prop:Seiten-von-Geraden-und-Punkten","sort":"Proposition","label":"3.5","description":"Seiten von Geraden und Punkten","chapter":"3","section":"3.1","subsection":"3.1.0","page":"75","counter":161},{"destination":"coro:Seiten-eines-Punktes","sort":"Korollar","label":"3.6","description":"Lage auf gleicher Seite ist Äquivalenzrelation","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":162},{"destination":"defn:Anordnung-vieler-Punkte","sort":"Definition","label":"3.7","description":"Erweiterung des Anordnungsbegriffs auf beliebig viele kollineare Punkte","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":163},{"destination":"prop:Anordnung-von-Punkten-auf-Geraden","sort":"Proposition","label":"3.8","description":"Anordnungen von Punkten auf Geraden","chapter":"3","section":"3.1","subsection":"3.1.0","page":"76","counter":164},{"destination":"bem:alternatives-Anordnungsaxiom","sort":"Bemerkung","label":"3.9","description":"alternatives Anordnungsaxiom (A'2)","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":165},{"destination":"defn:strecke-und-strahl","sort":"Definition","label":"3.10","description":"Strecke und Strahl","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":166},{"destination":"prop:Strecken-und-Strahlen","sort":"Proposition","label":"3.11","description":"Strecken und Strahlen","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":167},{"destination":"prop:gerade-vereinigung-von-strahlen","sort":"Proposition","label":"3.12","description":"Gerade als Vereinigung von Strahlen","chapter":"3","section":"3.1","subsection":"3.1.0","page":"77","counter":168},{"destination":"satz:Pasch","sort":"Satz","label":"3.13","description":"Satz von Pasch","chapter":"3","section":"3.1","subsection":"3.1.0","page":"78","counter":169},{"destination":"sect:Die-Kongruenzaxiome-fuer-Strecken","sort":"Abschnitt","label":"3.2","description":"Die Kongruenzaxiome für Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"78","counter":170},{"destination":"defn:Kongruenzaxiome-fuer-Strecken","sort":"Definition","label":"3.14","description":"Kongruenzaxiome für Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"78","counter":171},{"destination":"bsp:affine-Standardebene-und-Kongruenzen-von-Strecken","sort":"Beispiel","label":"3.15","description":"Streckenkongruenzen in der affinen Standardebene","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":172},{"destination":"prop:Streckensubtraktion","sort":"Proposition","label":"3.16","description":"Streckensubtraktion","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":173},{"destination":"defn:<-fuer-Strecken","sort":"Definition","label":"3.17","description":"Vergleich von Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"79","counter":174},{"destination":"prop:<-fuer-Strecken","sort":"Proposition","label":"3.18","description":"Vergleich von Strecken","chapter":"3","section":"3.2","subsection":"3.2.0","page":"80","counter":175},{"destination":"sect:Kongruenzaxiome-fuer-Winkel","sort":"Abschnitt","label":"3.3","description":"Die Kongruenzaxiome für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":176},{"destination":"defn:Winkel","sort":"Definition","label":"3.19","description":"Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":177},{"destination":"abb:Winkel","sort":"Abbildung","label":"3.2","description":"Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":178},{"destination":"prop:winkel","sort":"Proposition","label":"3.20","description":"Identitätskriterium für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"80","counter":179},{"destination":"defn:Inneres-eines-Winkels","sort":"Definition","label":"3.21","description":"Inneres eines Winkels","chapter":"3","section":"3.3","subsection":"3.3.0","page":"81","counter":180},{"destination":"lemma:im-Inneren-eines-Winkels","sort":"Lemma","label":"3.22","description":"Kriterium für die Lage im Inneren eines Winkels","chapter":"3","section":"3.3","subsection":"3.3.0","page":"81","counter":181},{"destination":"defn:Kongruenzaxiome-fuer-Winkel","sort":"Definition","label":"3.23","description":"Kongruenzaxiome für Winkel","chapter":"3","section":"3.3","subsection":"3.3.0","page":"82","counter":182},{"destination":"defn:<-fuer-Winkel","sort":"Definition","label":"3.24","description":"Vergleich von Winkeln","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":183},{"destination":"prop:<-fuer-Winkel","sort":"Proposition","label":"3.25","description":"Vergleich von Winkeln","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":184},{"destination":"defn:Dreieck","sort":"Definition","label":"3.26","description":"Dreieck","chapter":"3","section":"3.3","subsection":"3.3.0","page":"83","counter":185},{"destination":"bem:dreieck","sort":"Bemerkung","label":"3.27","description":"Kongruenz von Dreiecken","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":186},{"destination":"defn:ebene-Geometrie","sort":"Definition","label":"3.28","description":"ebene Geometrie","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":187},{"destination":"defn:Bewegung","sort":"Definition","label":"3.29","description":"Bewegung","chapter":"3","section":"3.3","subsection":"3.3.0","page":"84","counter":188},{"destination":"bsp:Bewegungen-in-der-affinen-Standardebene","sort":"Beispiel","label":"3.30","description":"Bewegungen in der affinen Standardebene","chapter":"3","section":"3.3","subsection":"3.3.0","page":"85","counter":189},{"destination":"defn:gvB","sort":"Definition","label":"3.31","description":"genügend viele Bewegungen","chapter":"3","section":"3.3","subsection":"3.3.0","page":"85","counter":190},{"destination":"satz:genug-Bewegung","sort":"Satz","label":"3.32","description":"Existenz genügend vieler Bewegungen impliziert (K'6)","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":191},{"destination":"Voraussetzungen-SWS","sort":"Gleichung","label":"3.3","description":"","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":192},{"destination":"bsp:affine-Standardebene-und-Kongruenzen-von-Winkeln","sort":"Beispiel","label":"3.33","description":"Winkelkongruenzen in der affinen Standardebene","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":193},{"destination":"Kongruenz-von-Winkeln-in-der-affinen-Standardebene","sort":"Gleichung","label":"3.4","description":"","chapter":"3","section":"3.3","subsection":"3.3.0","page":"86","counter":194},{"destination":"sect:Ergaenzungswinkel,-Gegenwinkel-und-rechte-Winkel","sort":"Abschnitt","label":"3.4","description":"Ergänzungswinkel, Gegenwinkel und rechte Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":195},{"destination":"defn:Ergaenzungswinkel-Gegenwinkel","sort":"Definition","label":"3.34","description":"Ergänzungswinkel und Gegenwinkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":196},{"destination":"prop:Ergaenzungswinkel","sort":"Proposition","label":"3.35","description":"Ergänzungswinkel kongruenter Winkel sind kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"87","counter":197},{"destination":"coro:Gegenwinkel","sort":"Korollar","label":"3.36","description":"ein Winkel ist zu seinem Gegenwinkel kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":198},{"destination":"defn:rechter-Winkel","sort":"Definition","label":"3.37","description":"rechter Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":199},{"destination":"prop:rechter-Winkel","sort":"Proposition","label":"3.38","description":"Ergänzungswinkel eines rechten Winkels ist rechter Winkel","chapter":"3","section":"3.4","subsection":"3.4.0","page":"88","counter":200},{"destination":"satz:Viertes-euklidisches-Postulat","sort":"Satz","label":"3.39","description":"rechte Winkel sind zueinander kongruent","chapter":"3","section":"3.4","subsection":"3.4.0","page":"89","counter":201},{"destination":"coro:rechte-Winkel","sort":"Korollar","label":"3.40","description":"die rechten Winkel bilden eine Kongruenzklasse","chapter":"3","section":"3.4","subsection":"3.4.0","page":"89","counter":202},{"destination":"sect:Orthogonalitaet-und-Parallelitaet","sort":"Abschnitt","label":"3.5","description":"Orthogonalität und Parallelität","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":203},{"destination":"defn:orthogonal","sort":"Definition","label":"3.41","description":"orthogonal","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":204},{"destination":"satz:Orthogonale-Gerade","sort":"Satz","label":"3.42","description":"Existenz des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"89","counter":205},{"destination":"abb:Orthogonale","sort":"Abbildung","label":"3.3","description":"Existenz des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"90","counter":206},{"destination":"defn:Wechselwinkel-und-Stufenwinkel","sort":"Definition","label":"3.43","description":"Wechselwinkel und Stufenwinkel","chapter":"3","section":"3.5","subsection":"3.5.0","page":"90","counter":207},{"destination":"bem:Wechselwinkel-und-Stufenwinkel","sort":"Bemerkung","label":"3.44","description":"Zusammenhang zwischen Wechsel- und Stufenwinkel","chapter":"3","section":"3.5","subsection":"3.5.0","page":"91","counter":208},{"destination":"satz:Schwacher-Wechselwinkelsatz-und-schwacher-Stufenwinkelsatz","sort":"Satz","label":"3.45","description":"schwacher Wechselwinkelsatz","chapter":"3","section":"3.5","subsection":"3.5.0","page":"91","counter":209},{"destination":"coro:zum-schwachen-wws","sort":"Korollar","label":"3.46","description":"zweifaches Lotfällen gibt Parallele","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":210},{"destination":"coro:Lot-eindeutig","sort":"Korollar","label":"3.47","description":"Eindeutigkeit des Lots","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":211},{"destination":"coro:Existenz-von-Parallelen","sort":"Korollar","label":"3.48","description":"Existenz von Parallelen","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":212},{"destination":"satz:Parallelenaxiom-in-Hilbertebenen","sort":"Satz","label":"3.49","description":"starker Wechselwinkelsatz","chapter":"3","section":"3.5","subsection":"3.5.0","page":"92","counter":213},{"destination":"sect:Kongruenzsatz","sort":"Abschnitt","label":"3.6","description":"Der Kongruenzsatz für Dreiecke","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":214},{"destination":"prop:eindeutiges-Dreieck","sort":"Proposition","label":"3.51","description":"Abtragung eines Dreiecks","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":215},{"destination":"defn:gleichschenkliges-Dreieck","sort":"Definition","label":"3.52","description":"gleichschenkliges Dreieck","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":216},{"destination":"prop:gleichschenkliges-Dreieck","sort":"Proposition","label":"3.53","description":"gleichschenkliges Dreieck","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":217},{"destination":"prop:Winkeladdsubtraktion","sort":"Proposition","label":"3.54","description":"Winkeladdition und -subtraktion","chapter":"3","section":"3.6","subsection":"3.6.0","page":"94","counter":218},{"destination":"satz:Kongruenzsatz-fuer-Dreiecke","sort":"Satz","label":"3.55","description":"Kongruenzsatz für Dreiecke","chapter":"3","section":"3.6","subsection":"3.6.0","page":"95","counter":219},{"destination":"wsw-1","sort":"Gleichung","label":"3.5","description":"","chapter":"3","section":"3.6","subsection":"3.6.0","page":"96","counter":220},{"destination":"sect:Mittelsenkrechte-und-Winkelhalbierende","sort":"Abschnitt","label":"3.7","description":"Mittelsenkrechte und Winkelhalbierende","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":221},{"destination":"defn:Streckenmittelpunkt","sort":"Definition","label":"3.56","description":"Streckenmittelpunkt","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":222},{"destination":"lemma:Mittelpunkt-liegt-zwischen-Randpunkten","sort":"Lemma","label":"3.57","description":"Streckenmittelpunkt liegt zwischen den Randpunkten der Strecke","chapter":"3","section":"3.7","subsection":"3.7.0","page":"97","counter":223},{"destination":"satz:Mittelpunkt","sort":"Satz","label":"3.58","description":"Existenz und Eindeutigkeit des Streckenmittelpunkts","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":224},{"destination":"Mittelpunkt-1","sort":"Gleichung","label":"3.6","description":"","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":225},{"destination":"Mittelpunkt-2","sort":"Gleichung","label":"3.7","description":"","chapter":"3","section":"3.7","subsection":"3.7.0","page":"98","counter":226},{"destination":"defn:Mittelsenkrechte","sort":"Definition","label":"3.59","description":"Mittelsenkrechte","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":227},{"destination":"prop:Charakterisierung-Mittelsenkrechte","sort":"Proposition","label":"3.60","description":"Charakterisierung der Mittelsenkrechten","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":228},{"destination":"defn:Winkelhalbierende","sort":"Definition","label":"3.61","description":"Winkelhalbierende","chapter":"3","section":"3.7","subsection":"3.7.0","page":"99","counter":229},{"destination":"prop:Existenz-der-Winkelhalbierenden","sort":"Proposition","label":"3.62","description":"Existenz der Winkelhalbierenden","chapter":"3","section":"3.7","subsection":"3.7.0","page":"100","counter":230},{"destination":"sect:Innen-und-Aussenwinkel-im-Dreieck","sort":"Abschnitt","label":"3.8","description":"Innen- und Außenwinkel im Dreieck","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":231},{"destination":"defn:Innenwinkel","sort":"Definition","label":"3.63","description":"Innenwinkel","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":232},{"destination":"prop:schwache-Winkelsumme-im-Dreieck-1","sort":"Proposition","label":"3.64","description":"schwache Winkelsumme im Dreieck","chapter":"3","section":"3.8","subsection":"3.8.0","page":"100","counter":233},{"destination":"schwache-Winkelsumme-im-Dreieck","sort":"Gleichung","label":"3.8","description":"","chapter":"3","section":"3.8","subsection":"3.8.0","page":"101","counter":234},{"destination":"satz:Aussenwinkelsatz","sort":"Satz","label":"3.65","description":"Außenwinkelsatz","chapter":"3","section":"3.8","subsection":"3.8.0","page":"101","counter":235},{"destination":"satz:grosse-Dreiecksseite-hat-grossen-Winkel","sort":"Satz","label":"3.66","description":"der größeren Dreiecksseite liegt der größere Winkel gegenüber","chapter":"3","section":"3.8","subsection":"3.8.0","page":"102","counter":236},{"destination":"abb:grosse-Dreiecksseite-hat-grossen-Winkel","sort":"Abbildung","label":"3.4","description":"der größeren Dreiecksseite liegt der größere Winkel gegenüber","chapter":"3","section":"3.8","subsection":"3.8.0","page":"102","counter":237},{"destination":"satz:SSrechterWinkel","sort":"Satz","label":"3.67","description":"SSrW-Kriterium","chapter":"3","section":"3.8","subsection":"3.8.0","page":"103","counter":238},{"destination":"sect:Kreise","sort":"Abschnitt","label":"3.9","description":"In- und Umkreis","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":239},{"destination":"defn:Kreis","sort":"Definition","label":"3.68","description":"Kreis","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":240},{"destination":"prop:Kreise-haben-genau-einen-Mittelpunkt","sort":"Proposition","label":"3.69","description":"Eindeutigkeit des Kreismittelpunkts","chapter":"3","section":"3.9","subsection":"3.9.0","page":"104","counter":241},{"destination":"satz:Umkreissatz","sort":"Satz","label":"3.70","description":"Umkreissatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":242},{"destination":"defn:Hoehe","sort":"Definition","label":"3.72","description":"Höhe","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":243},{"destination":"satz:Hoehensatz","sort":"Satz","label":"3.73","description":"Höhensatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"105","counter":244},{"destination":"satz:Inkreissatz","sort":"Satz","label":"3.74","description":"Inkreissatz","chapter":"3","section":"3.9","subsection":"3.9.0","page":"106","counter":245},{"destination":"sect:Uebungsaufgaben-Hilbertebenen","sort":"Abschnitt","label":"3.10","description":"Übungsaufgaben","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":246},{"destination":"aufg:Anordnung-von-Punkten-auf-Geraden","sort":"Aufgabe","label":"3.1","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":247},{"destination":"aufg:unendlich-viele-Punkte-mit-I-+-A","sort":"Aufgabe","label":"3.2","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":248},{"destination":"aufg:Anordnung-Modell-alternativ","sort":"Aufgabe","label":"3.4","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":249},{"destination":"aufg:<-fuer-Winkel","sort":"Aufgabe","label":"3.5","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":250},{"destination":"aufg:Inneres-bestimmt-den-Winkel","sort":"Aufgabe","label":"3.6","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":251},{"destination":"aufg:konvexe-Mengen","sort":"Aufgabe","label":"3.7","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"108","counter":252},{"destination":"aufg:Parallelogramm-synthetisch","sort":"Aufgabe","label":"3.10","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"109","counter":253},{"destination":"aufg:Spiegelungen-in-Hilbertebenen","sort":"Aufgabe","label":"3.12","description":"Geradenspiegelung","chapter":"3","section":"3.10","subsection":"3.10.0","page":"109","counter":254},{"destination":"aufg:Abschaetzung-Abstand-Punkt-Gerade","sort":"Aufgabe","label":"3.13","description":"","chapter":"3","section":"3.10","subsection":"3.10.0","page":"110","counter":255},{"destination":"aufg:Hoehenformel","sort":"Aufgabe","label":"3.14","description":"Höhenformel","chapter":"3","section":"3.10","subsection":"3.10.0","page":"110","counter":256},{"destination":"chap:Euklidische-Geometrie-kurz","sort":"Kapitel","label":"4","description":"Euklidische Geometrie","chapter":"4","section":"4.0","subsection":"4.0.0","page":"111","counter":257},{"destination":"sect:Vollstaendigkeitsaxiom","sort":"Abschnitt","label":"4.1","description":"Das Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"111","counter":258},{"destination":"defn:Dedekindschnitt","sort":"Definition","label":"4.1","description":"Dedekindschnitt","chapter":"4","section":"4.1","subsection":"4.1.0","page":"112","counter":259},{"destination":"defn:Vollstaendigkeitsaxiom","sort":"Definition","label":"4.2","description":"Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"112","counter":260},{"destination":"bsp:Vollstaendigkeitsaxiom","sort":"Beispiel","label":"4.3","description":"Vollständigkeitsaxiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"113","counter":261},{"destination":"satz:Archimedisches-Axiom","sort":"Satz","label":"4.4","description":"Archimedisches Axiom","chapter":"4","section":"4.1","subsection":"4.1.0","page":"113","counter":262},{"destination":"sect:Euklidische-Ebenen","sort":"Abschnitt","label":"4.2","description":"Euklidische Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":263},{"destination":"defn:Euklidsche-Ebene","sort":"Definition","label":"4.5","description":"euklidische Ebene","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":264},{"destination":"defn:Isomorphismus-euklidischer-Ebenen","sort":"Definition","label":"4.6","description":"Isomorphismus euklidischer Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":265},{"destination":"satz:Hauptsatz-fuer-euklidische-Ebenen","sort":"Satz","label":"4.8","description":"Hauptsatz für euklidische Ebenen","chapter":"4","section":"4.2","subsection":"4.2.0","page":"114","counter":266},{"destination":"prop:Groesse-der-Winkelsumme","sort":"Proposition","label":"4.9","description":"Größe der Winkelsumme","chapter":"4","section":"4.2","subsection":"4.2.0","page":"115","counter":267},{"destination":"sect:Kreise-in-der-euklidischen-Ebene","sort":"Abschnitt","label":"4.3","description":"Kreise","chapter":"4","section":"4.3","subsection":"4.3.0","page":"116","counter":268},{"destination":"prop:Durchschnitt-Kreis-Gerade","sort":"Proposition","label":"4.10","description":"Durchschnitt von Kreis und Gerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"117","counter":269},{"destination":"coro:Tangente","sort":"Korollar","label":"4.11","description":"Charakterisierung der Tangente","chapter":"4","section":"4.3","subsection":"4.3.0","page":"118","counter":270},{"destination":"defn:Potenz","sort":"Definition","label":"4.12","description":"Potenz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"118","counter":271},{"destination":"satz:Zweisehnensatz","sort":"Satz","label":"4.13","description":"Zweisehnensatz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"119","counter":272},{"destination":"satz:Sehnen-Tangenten-Satz","sort":"Satz","label":"4.14","description":"Sehnen-Tangenten-Satz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"119","counter":273},{"destination":"prop:potenzgerade","sort":"Proposition","label":"4.15","description":"Potenzgerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"120","counter":274},{"destination":"satz:Kreis-Kreis-Schnitt-Eigenschaft","sort":"Satz","label":"4.17","description":"Kreis-Kreis-Schnitt-Eigenschaft","chapter":"4","section":"4.3","subsection":"4.3.0","page":"121","counter":275},{"destination":"coro:Kreis-Kreis-Schnitt-Eigenschaft","sort":"Korollar","label":"4.18","description":"Kreis-Kreis-Schnitt-Eigenschaft","chapter":"4","section":"4.3","subsection":"4.3.0","page":"122","counter":276},{"destination":"satz:Peripheriewinkelsatz","sort":"Satz","label":"4.19","description":"Peripheriewinkelsatz","chapter":"4","section":"4.3","subsection":"4.3.0","page":"123","counter":277},{"destination":"satz:Thales","sort":"Satz","label":"4.20","description":"Satz des Thales","chapter":"4","section":"4.3","subsection":"4.3.0","page":"124","counter":278},{"destination":"satz:Sinussatz-Verschaerfung","sort":"Satz","label":"4.21","description":"Verschärfung des Sinussatzes","chapter":"4","section":"4.3","subsection":"4.3.0","page":"124","counter":279},{"destination":"satz:Eulergleichung","sort":"Satz","label":"4.22","description":"Eulergleichung","chapter":"4","section":"4.3","subsection":"4.3.0","page":"125","counter":280},{"destination":"coro:Eulergerade","sort":"Korollar","label":"4.23","description":"Eulergerade","chapter":"4","section":"4.3","subsection":"4.3.0","page":"125","counter":281},{"destination":"sect:Inversion-am-Kreis","sort":"Abschnitt","label":"4.4","description":"Die Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":282},{"destination":"defn:Inversion-am-Kreis","sort":"Definition","label":"4.24","description":"Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":283},{"destination":"prop:Inversionen-am-Kreis-sind-bijektiv","sort":"Proposition","label":"4.25","description":"Inversionen am Kreis sind bijektiv und bilden Punkte von innen nach außen ab","chapter":"4","section":"4.4","subsection":"4.4.0","page":"126","counter":284},{"destination":"prop:Tangentenschnittpunkt-mit-Inversion","sort":"Proposition","label":"4.26","description":"Konstruktion des Bildpunkts unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"127","counter":285},{"destination":"prop:Eigenschaften-der-Inversion","sort":"Proposition","label":"4.27","description":"Eigenschaften der Inversion am Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"127","counter":286},{"destination":"defn:verallgemeinerte-Gerade","sort":"Definition","label":"4.28","description":"verallgemeinerte Gerade","chapter":"4","section":"4.4","subsection":"4.4.0","page":"129","counter":287},{"destination":"prop:orthogonale-verallgemeinerte-Geraden","sort":"Proposition","label":"4.29","description":"orthogonale verallgemeinerte Gerade","chapter":"4","section":"4.4","subsection":"4.4.0","page":"129","counter":288},{"destination":"prop:orthogonale-Kreise","sort":"Proposition","label":"4.30","description":"Eigenschaften orthogonaler Kreise","chapter":"4","section":"4.4","subsection":"4.4.0","page":"130","counter":289},{"destination":"prop:Inversion-Kreis-an-Kreis","sort":"Proposition","label":"4.31","description":"Inversion eines Kreises an einem anderen Kreis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":290},{"destination":"Schnittpunktanzahl-bleibt-unter-Inversion-erhalten","sort":"Gleichung","label":"4.1","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":291},{"destination":"Schnittpunktanzahl-bleibt-unter-Inversion-erhalten-2","sort":"Gleichung","label":"4.2","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":292},{"destination":"Inversion-fuer-verallgemeinerte-Geraden","sort":"Gleichung","label":"4.3","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"131","counter":293},{"destination":"lemma:Beruehrpunkte-unter-der-Inversion","sort":"Lemma","label":"4.32","description":"Verhalten von Berührpunkten unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":294},{"destination":"prop:Inversion-und-Tangenten","sort":"Proposition","label":"4.33","description":"Verhalten von Tangenten unter der Inversion","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":295},{"destination":"defn:verallgemeinerte-Winkelgroesse","sort":"Definition","label":"4.34","description":"verallgemeinerte Winkelgröße","chapter":"4","section":"4.4","subsection":"4.4.0","page":"132","counter":296},{"destination":"satz:Inversion-winkeltreu","sort":"Satz","label":"4.35","description":"Inversion ist winkeltreu","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":297},{"destination":"defn:Doppelverhaeltnis","sort":"Definition","label":"4.36","description":"Doppelverhältnis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":298},{"destination":"prop:Inversion-am-Kreis-erhaelt-Doppelverhaeltnis","sort":"Proposition","label":"4.37","description":"Inversion erhält Doppelverhältnis","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":299},{"destination":"DV-1","sort":"Gleichung","label":"4.4","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"133","counter":300},{"destination":"DV-2","sort":"Gleichung","label":"4.5","description":"","chapter":"4","section":"4.4","subsection":"4.4.0","page":"134","counter":301},{"destination":"sect:Uebungsaufgaben-Euklidische-Geometrie","sort":"Abschnitt","label":"4.5","description":"Übungsaufgaben","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":302},{"destination":"aufg:zwischen-Kreis-und-Tangente-passt-kein-Strahl","sort":"Aufgabe","label":"4.1","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":303},{"destination":"aufg:Peripheriewinkelsatz","sort":"Aufgabe","label":"4.4","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":304},{"destination":"aufg:Tangentenschnittpunkt-mit-Inversion","sort":"Aufgabe","label":"4.5","description":"","chapter":"4","section":"4.5","subsection":"4.5.0","page":"135","counter":305},{"destination":"aufg:gleichseitige-Dreiecke-SHU","sort":"Aufgabe","label":"4.6","description":"gleichseitiges Dreieck","chapter":"4","section":"4.5","subsection":"4.5.0","page":"136","counter":306},{"destination":"chap:Nichteuklidsche-Geometrie","sort":"Kapitel","label":"5","description":"Nichteuklidische Geometrie","chapter":"5","section":"5.0","subsection":"5.0.0","page":"137","counter":307},{"destination":"sect:Hyperbolische-Ebenen","sort":"Abschnitt","label":"5.1","description":"Das Poincaré'sche Kreismodell","chapter":"5","section":"5.1","subsection":"5.1.0","page":"137","counter":308},{"destination":"defn:Hyperbolische-Ebene","sort":"Definition","label":"5.1","description":"hyperbolische Ebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"137","counter":309},{"destination":"defn:Endpunkte-von-k-Geraden","sort":"Definition","label":"5.2","description":"Endpunkte einer k-Geraden","chapter":"5","section":"5.1","subsection":"5.1.0","page":"138","counter":310},{"destination":"prop:Kreismodell-ist-Inzidenzebene","sort":"Proposition","label":"5.3","description":"Poincaré'sches Kreismodell ist Inzidenzebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"138","counter":311},{"destination":"I2-hyperbolisch","sort":"Gleichung","label":"5.1","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"139","counter":312},{"destination":"Anordnung-von-Punkten-auf-k-Gerader-zweiten-Typs","sort":"Gleichung","label":"5.2","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":313},{"destination":"prop:Kreismodell-erfuellt-Anordnungsaxiome","sort":"Proposition","label":"5.4","description":"Poincaré'sches Kreismodell erfüllt Anordnungsaxiome","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":314},{"destination":"hyperbolischer-Abstand","sort":"Gleichung","label":"5.3","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"140","counter":315},{"destination":"lemma:k-Anordnung-von-k-Punkten","sort":"Lemma","label":"5.5","description":"k-Anordnung von k-Punkten","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":316},{"destination":"Kongruenz-von-k-Strecken","sort":"Gleichung","label":"5.4","description":"","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":317},{"destination":"prop:Kreismodell-erfuellt-Streckenkongruenzaxiome","sort":"Proposition","label":"5.6","description":"Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Strecken","chapter":"5","section":"5.1","subsection":"5.1.0","page":"141","counter":318},{"destination":"prop:Kreismodell-erfuellt-Winkelkongruenzaxiome","sort":"Proposition","label":"5.7","description":"Poincaré'sches Kreismodell erfüllt Kongruenzaxiome für Winkel","chapter":"5","section":"5.1","subsection":"5.1.0","page":"142","counter":319},{"destination":"prop:k-Bewegung-in-den-Ursprung","sort":"Proposition","label":"5.8","description":"Existenz einer k-Bewegung, die gegebenen k-Punkt auf den Ursprung schickt","chapter":"5","section":"5.1","subsection":"5.1.0","page":"142","counter":320},{"destination":"prop:Kreismodell-erfuellt-Vollstaendigkeitsaxiom","sort":"Proposition","label":"5.9","description":"Poincaré'sches Kreismodell erfüllt Vollständigkeitsaxiom","chapter":"5","section":"5.1","subsection":"5.1.0","page":"143","counter":321},{"destination":"prop:hyperbolisches-Axiom-im-Poincaremodell","sort":"Proposition","label":"5.10","description":"Poincaré'sche Kreismodell erfüllt das hyperbolische Axiom","chapter":"5","section":"5.1","subsection":"5.1.0","page":"143","counter":322},{"destination":"satz:Kreismodell-ist-hyperbolische-Ebene","sort":"Satz","label":"5.11","description":"Poincaré'sches Kreismodell ist hyperbolische Ebene","chapter":"5","section":"5.1","subsection":"5.1.0","page":"144","counter":323},{"destination":"sect:Hyperbolische-Geometrie","sort":"Abschnitt","label":"5.2","description":"Hyperbolische Geometrie","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":324},{"destination":"Additionstheorem-cosh","sort":"Gleichung","label":"5.5","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":325},{"destination":"hyperbolisches-Pythagorasaequivalent","sort":"Gleichung","label":"5.6","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":326},{"destination":"lemma:k-Abstand-zum-Ursprung","sort":"Lemma","label":"5.12","description":"k-Abstand zum Ursprung","chapter":"5","section":"5.2","subsection":"5.2.0","page":"144","counter":327},{"destination":"lemma:sinh-und-cosh-vom-k-Abstand-zum-Ursprung","sort":"Lemma","label":"5.13","description":"sinh und cosh vom k-Abstand zum Ursprung","chapter":"5","section":"5.2","subsection":"5.2.0","page":"145","counter":328},{"destination":"lemma:Norm-im-Klein-Modell","sort":"Lemma","label":"5.14","description":"Projektion von k-Punkten auf die Verbindungssehne der Endpunkte der zugehörigen k-Geraden","chapter":"5","section":"5.2","subsection":"5.2.0","page":"145","counter":329},{"destination":"satz:Trigonometrie-rechtwinkliges-k-Dreieck","sort":"Satz","label":"5.15","description":"Trigonometrie im rechtwinkligen k-Dreieck","chapter":"5","section":"5.2","subsection":"5.2.0","page":"146","counter":330},{"destination":"satz:hyperbolische-Trigonometrie","sort":"Satz","label":"5.16","description":"hyperbolische Trigonometrie","chapter":"5","section":"5.2","subsection":"5.2.0","page":"148","counter":331},{"destination":"hyperbolische-Trigonometrie","sort":"Gleichung","label":"5.7","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"149","counter":332},{"destination":"satz:Winkelsumme-im-k-Dreieck","sort":"Satz","label":"5.17","description":"Winkelsumme im k-Dreieck","chapter":"5","section":"5.2","subsection":"5.2.0","page":"150","counter":333},{"destination":"beta+gamma<pi","sort":"Gleichung","label":"5.8","description":"","chapter":"5","section":"5.2","subsection":"5.2.0","page":"150","counter":334},{"destination":"sect:Uebungsaufgaben-Nichteuklidische-Geometrie","sort":"Abschnitt","label":"5.3","description":"Übungsaufgaben","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":335},{"destination":"aufg:hyperbolische-Geradenspiegelung-ist-Bewegung","sort":"Aufgabe","label":"5.1","description":"","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":336},{"destination":"aufg:Poincarehalbebene","sort":"Aufgabe","label":"5.2","description":"","chapter":"5","section":"5.3","subsection":"5.3.0","page":"151","counter":337}],"linked_media":[102,98,10,104,10,95,98,98,98,110,491,349,350,351,353,360]},"derivatives":{"screenshot":{"id":"medium/39/manuscript/screenshot-3decee3284df294f13fd31a8a444715d.png","storage":"store","metadata":{"filename":"image_processing20200724-1-7uc3mi.png","size":7126,"mime_type":"image/png"}}}}	all	t	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 17:03:37.785021	\N	\N	\N	-1	0
52		2025-07-15 12:12:56.371975	2026-08-24 19:07:37.028841	LessonMaterial	Teilbarkeit	Talk	2	\N	\N	{"id":"medium/52/manuscript/1d248e204bee6e98adcc72bc1bb78caf.pdf","storage":"store","metadata":{"filename":"Vortrag1.pdf","size":61563,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[],"version":null},"derivatives":{"screenshot":{"id":"medium/52/manuscript/screenshot-c50180167bc81e896748fa0189b4a57f.png","storage":"store","metadata":{"filename":"image_processing20250715-149-3um9kx.png","size":7014,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2026-07-15 12:14:43.286356	\N	\N		-1	0
42	\N	2020-09-02 11:47:59.54323	2020-09-02 11:47:59.54323	RandomQuiz	Zufallsquiz Lineare Algebra 2 2020-09-02 11:47:59 +0000	\N	\N	\N	\N	\N	\N	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 17\n  2:\n    :type: Question\n    :id: 18\n  3:\n    :type: Question\n    :id: 35\n  4:\n    :type: Question\n    :id: 20\n  5:\n    :type: Question\n    :id: 37\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N	\N	\N	0	f	\N	\N	\N	\N	-1	0
43	\N	2020-09-03 10:31:05.824135	2020-09-07 12:25:30.264455	Quiz	Testquiz	Course	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 24\nedges: {}\nroot: 1\ndefault_table:\n  1: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N	\N	\N	\N	2	f	2021-09-03 10:31:05.824135	\N	\N	\N	-1	0
51	\N	2022-08-05 14:35:35.026043	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Locked	Lecture	27	\N	\N	\N	locked	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	4	f	2023-08-05 14:35:41.774619	\N	\N	\N	-1	0
41	\N	2020-09-01 14:30:02.64804	2020-09-07 12:25:30.264455	Quiz	Tensorprodukt	Course	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 25\nedges: {}\nroot: 1\ndefault_table:\n  1: -1\nhide_solution: []\n	1	Quiz	\N	\N	\N	\N	\N		\N	\N	1	f	2021-09-01 14:30:02.64804	\N	\N	\N	-1	0
48	\N	2022-08-05 14:32:29.847968	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Unpublished	Lecture	27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	1	f	\N	\N	\N	\N	-1	0
49	\N	2022-08-05 14:33:54.439745	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Registered	Lecture	27	\N	\N	\N	users	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	2	f	2023-08-05 14:34:12.32618	\N	\N	\N	-1	0
40	\N	2020-08-10 16:09:44.690925	2022-09-02 16:52:53.2142	LessonMaterial	Vorlesungszusatzvideo	Lecture	4	\N	\N	\N	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N	\N	\N	\N	0	f	2021-08-10 16:09:44.690925	\N	\N	\N	-1	0
30	\N	2020-07-24 16:29:29.670149	2025-07-14 11:01:53.19958	Remark	Wiederholung Ideal ankündigen	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Wir schauen uns nochmal den Begriff des Ideals genauer an.	\N	\N	\N	\N	\N	\N	\N	18	f	2021-07-24 16:29:29.670149	\N	\N	\N	-1	0
19	\N	2020-07-24 16:06:37.911565	2026-08-24 19:07:05.375089	Question	Beispiele für Primideale in Q	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche dieser Aussagen sind wahr?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	7	f	2021-07-24 16:06:37.911565	\N	\N	\N	-1	4
13		2020-07-24 15:43:22.719009	2020-09-07 12:25:30.264455	WorkedExample	Frobenius-Normalform	Course	1	{"id":"medium/13/video/a6ea48bef517cd2fb6b2a56e0c30c80a.mp4","storage":"store","metadata":{"filename":"Worked Example.v.la 2.ss17.frobenius-normalform.mp4","size":1556998,"mime_type":"video/mp4","duration":60.024,"bitrate":207516,"resolution":"1620x1080","frame_rate":"20/1"}}	\N	{"id":"medium/13/manuscript/bb2ae64c3a094be17d3b1addb8c43c15.pdf","storage":"store","metadata":{"filename":"Worked Example.V.LA 2.SS17.Frobenius-Normalform.pdf","size":593628,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/13/manuscript/screenshot-1b2c2c1a6b4412914b430ffb21c7231f.png","storage":"store","metadata":{"filename":"image_processing20200724-1-vyhz0w.png","size":36276,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	classic	0	f	2021-07-24 15:43:22.719009	\N	\N	\N	-1	0
47		2022-08-05 14:30:40.379007	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Free	Lecture	27	{"id":"medium/47/video/8fbbda33353ed60cae247f1e5230dcb0.mp4","storage":"store","metadata":{"filename":"WorkedExample.mp4","size":1461881,"mime_type":"video/mp4","duration":53.526,"bitrate":218492,"resolution":"1624x1080","frame_rate":"20/1"}}	{"id":"medium/47/screenshot/a85c6e67b74319702fe1226b2084cbf4.png","storage":"store","metadata":{"filename":"screenshot20220805-1-bony1x.png","size":150856,"mime_type":"image/png","width":750,"height":498},"derivatives":{"normalized":{"id":"medium/47/screenshot/normalized-1ff53c1c3c65c4119a4e0d8f1bf088c4.png","storage":"store","metadata":{"filename":"image_processing20220805-1-43smh4.png","size":31267,"mime_type":"image/png","width":405,"height":269}}}}	\N	all	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N		\N	classic	0	f	2023-08-05 14:31:00.873873	\N	\N	\N	-1	0
21	\N	2020-07-24 16:10:17.951738	2026-08-24 19:07:05.389311	Question	Beispiele für Primideale in K[X]	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei $K$ ein Körper und $a\\in K$. Betrachte den Polynomring in einer Variable $K[X]$ über $K$.\n\nWelche der folgenden Ideale sind Primideale in $K[X]$?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	9	f	2021-07-24 16:10:17.951738	\N	\N	\N	-1	3
23	\N	2020-07-24 16:16:21.665364	2025-07-14 11:01:53.19958	Remark	Ideale in Z Start	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	In diesem angeleiteten Beweis wollen wir zeigen, dass jedes Ideal in $\\mathbb{Z}$ von einem Element erzeugt wird. Ein Ideal $I$ eins (kommutativen) Ringes $R,$ welches von einem Element erzeugt wird, nennt man $\\textbf{Hauptideal}.$ In diesem Fall gibt es ein $x \\in I,$ sodass für jedes $y\\in I$ ein $a \\in R$ existiert mit $y = ax.$ Man schreibt dann auch $$I = (x) := Rx = \\{ax \\mid a\\in R\\}.$$\nEin kommutativer nullteilerfreier Ring, in dem jedes Ideal ein Hauptideal ist, wird $\\textbf{Hauptidealring}$ genannt. Die ganzen Zahlen $\\mathbb{Z}$ sind bekanntlich nullteilerfrei. Wir werden in diesem Quiz folglich zeigen, dass $\\mathbb{Z}$ ein Hauptidealring ist.	\N	\N	\N	\N	\N	\N	\N	11	f	2021-07-24 16:16:21.665364	\N	\N	\N	-1	0
17	\N	2020-07-24 16:02:04.55872	2026-08-24 19:07:05.353434	Question	Primideale in Körpern	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche dieser Aussagen ist stets wahr?\n	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	5	f	2021-07-24 16:02:04.55872	\N	\N	\N	-1	4
12		2020-07-24 15:15:19.693823	2025-07-14 11:01:53.19958	Exercise	Blatt4	Lecture	1	\N	\N	{"id":"medium/12/manuscript/d8024479ea26e6e6b5d17cdfb9bf02b3.pdf","storage":"store","metadata":{"filename":"Übung.V.LA 2.SS20.LA2-Blatt02.pdf","size":67599,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/12/manuscript/screenshot-16b55aeefffa834857b4a3e1e515a8f3.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12sjf5y.png","size":40172,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	1	f	2021-07-24 15:15:19.693823	\N	\N	\N	-1	0
33	\N	2020-07-24 16:42:58.569127	2025-07-14 11:01:53.19958	Quiz	Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 34\n  2:\n    :type: Question\n    :id: 35\n  3:\n    :type: Question\n    :id: 36\n  4:\n    :type: Question\n    :id: 37\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: -1\nhide_solution: []\n	1	Quiz	\N	\N	de	\N	\N		\N	\N	21	f	2021-07-24 16:42:58.569127	\N	\N	\N	-1	0
8		2020-07-24 14:46:06.857134	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	8	{"id":"medium/8/video/c66bbf9059e1cb15f4ef25fca67a5d81.mp4","storage":"store","metadata":{"filename":"LA2E08.mp4","size":1636141,"mime_type":"video/mp4","duration":60.024,"bitrate":218064,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/8/screenshot/b1b718054ad08f98391c9e370a66949a.png","storage":"store","metadata":{"filename":"screenshot20200724-1-18a3lza.png","size":119674,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/8/screenshot/normalized-55cae70265a6b310bbbe6b95af8c0462.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12sd2sb.png","size":12571,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/8/manuscript/bbc747724b0ff16f074a0ed4d6241c65.pdf","storage":"store","metadata":{"filename":"LA2.E08.pdf","size":816914,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/8/manuscript/screenshot-cf1744a864646413b4678bddbc9a6704.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1kmhlcg.png","size":108129,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:46:06.857134	\N	\N	\N	-1	0
38		2020-07-24 16:56:38.642606	2025-07-14 11:12:42.258782	LessonMaterial		Lesson	12	{"id":"medium/38/video/fd2c06150fe18ebfee91b6a73c833be3.mp4","storage":"store","metadata":{"filename":"Lektion.v.alg 1.ws17 18.e1-1.mp4","size":1915023,"mime_type":"video/mp4","duration":60.024,"bitrate":255234,"resolution":"1440x1070","frame_rate":"20/1"}}	\N	{"id":"medium/38/manuscript/66ca156dcebc7c8b2f4497dd65d68a9b.pdf","storage":"store","metadata":{"filename":"Lektion.V.Alg 1.WS17_18.E1.pdf","size":486317,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/38/manuscript/screenshot-e21a2c087545cd09eef48c484fd2081a.png","storage":"store","metadata":{"filename":"image_processing20200724-1-12owwue.png","size":7455,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 16:56:38.642606	\N	\N	\N	-1	0
18		2020-07-24 16:04:00.205352	2026-08-24 19:07:05.36761	Question	Beispiele für Primideale in Z	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche dieser Aussagen sind wahr?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc		\N	\N	6	f	2021-07-24 16:04:00.205352	\N	\N	\N	-1	4
26	\N	2020-07-24 16:20:48.588701	2026-08-24 19:07:05.41311	Question	Ideal in Z minimales Element	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei nun $I \\subset \\mathbb{Z}$ ein Ideal. Um zu zeigen, dass $I$ von einem Element erzeugt wird, müssen wir einen Kandidaten für dieses Element finden. \nAus dem Beispiel davor geht hervor, dass ein sinnvoller Kandidat "die kleinste natürliche Zahl, welche in $I$ liegt" wäre. Formal müssen wir noch ein bisschen aufpassen. Welche der folgenden Aussagen sind wahr?	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	14	f	2021-07-24 16:20:48.588701	\N	\N	\N	-1	4
22	\N	2020-07-24 16:15:52.01113	2025-07-14 11:01:53.19958	Quiz	Angeleiteter Beweis: Ideale in Z	Lecture	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Remark\n    :id: 23\n  2:\n    :type: Question\n    :id: 24\n  3:\n    :type: Question\n    :id: 25\n  4:\n    :type: Question\n    :id: 26\n  5:\n    :type: Remark\n    :id: 27\n  6:\n    :type: Question\n    :id: 28\n  7:\n    :type: Remark\n    :id: 29\n  8:\n    :type: Remark\n    :id: 30\n  9:\n    :type: Question\n    :id: 31\n  10:\n    :type: Remark\n    :id: 32\nedges:\n  ? - 2\n    - 8\n  : - 20: false\n      21: false\n      22: true\n    - 20: false\n      21: true\n      22: false\n    - 20: false\n      21: true\n      22: true\n    - 20: true\n      21: false\n      22: false\n    - 20: true\n      21: false\n      22: true\n    - 20: false\n      21: false\n      22: false\n    - 20: true\n      21: true\n      22: true\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: 6\n  6: 7\n  7: -1\n  8: 9\n  9: 10\n  10: 2\nhide_solution:\n- - 2\n  - 20: false\n    21: false\n    22: true\n- - 2\n  - 20: false\n    21: true\n    22: false\n- - 2\n  - 20: false\n    21: true\n    22: true\n- - 2\n  - 20: true\n    21: false\n    22: false\n- - 2\n  - 20: true\n    21: false\n    22: true\n- - 2\n  - 20: false\n    21: false\n    22: false\n- - 2\n  - 20: true\n    21: true\n    22: true\n	1	Quiz	\N	\N	de	\N	\N		\N	\N	10	f	2021-07-24 16:15:52.01113	\N	\N	\N	-1	0
9		2020-07-24 14:51:14.920111	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	9	{"id":"medium/9/video/6187a6877c63eb1f436c609233b6734f.mp4","storage":"store","metadata":{"filename":"LA2E09.mp4","size":1956825,"mime_type":"video/mp4","duration":60.024,"bitrate":260805,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/9/screenshot/50ce3e38dfa67e91de39afe6e819a55e.png","storage":"store","metadata":{"filename":"screenshot20200724-1-17n4aon.png","size":181298,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/9/screenshot/normalized-208498c706d6e610ce9bedd0c1423b54.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1dieo3r.png","size":52223,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/9/manuscript/7f21bce51aa2568c3b2735f06ee6fae9.pdf","storage":"store","metadata":{"filename":"LA2.E09.pdf","size":1166711,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/9/manuscript/screenshot-c314b7d368b987b1ced90857682be068.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1jcn8b5.png","size":148996,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:51:14.920111	\N	\N	\N	-1	0
10		2020-07-24 14:56:40.100167	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	10	{"id":"medium/10/video/4d452e06ae4c401055930a78f3c99e5b.mp4","storage":"store","metadata":{"filename":"LA2E10.mp4","size":1770925,"mime_type":"video/mp4","duration":60.024,"bitrate":236028,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/10/screenshot/c4d2ddda7fe38c385e8dca2341ffc8e6.png","storage":"store","metadata":{"filename":"screenshot20200724-1-mo0aeb.png","size":125109,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/10/screenshot/normalized-e0e7e6399d6a452317e3f2eb9e640cf7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-13kkkad.png","size":32713,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/10/manuscript/a02e7d985f2c2a514071775902e439c8.pdf","storage":"store","metadata":{"filename":"LA2.E10.pdf","size":638000,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/10/manuscript/screenshot-83029d5d314509f94f5d2f545dc587a3.png","storage":"store","metadata":{"filename":"image_processing20200724-1-o1213x.png","size":78449,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:56:40.100167	\N	\N	\N	-1	0
2		2020-07-24 14:06:58.962512	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	2	{"id":"medium/2/video/6e46aab6179623cfed897b663cd723a9.mp4","storage":"store","metadata":{"filename":"LA2E02.mp4","size":1955566,"mime_type":"video/mp4","duration":60.024,"bitrate":260637,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/2/screenshot/da504c00a54f7ff2cb78cd1062af949b.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1k4u0et.png","size":190159,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/2/screenshot/normalized-a0b4b7e41202fb1abd8b5a8360c54f37.png","storage":"store","metadata":{"filename":"image_processing20200724-1-18sealr.png","size":45542,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/2/manuscript/e1582e2dea166d0e78f6504bbacc625a.pdf","storage":"store","metadata":{"filename":"LA2.E02.pdf","size":1130194,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/2/manuscript/screenshot-f4b924397fe7ada1576b2f8d0360f1f9.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1levfn8.png","size":149968,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:06:58.962512	\N	\N	\N	-1	0
6		2020-07-24 14:29:17.501435	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	6	{"id":"medium/6/video/71f29269c49e634630e53741e5c4b80c.mp4","storage":"store","metadata":{"filename":"LA2E06.mp4","size":1914014,"mime_type":"video/mp4","duration":60.024,"bitrate":255099,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/6/screenshot/32c82f68b8808e9c2550c5918c034918.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1ar4gk2.png","size":213364,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/6/screenshot/normalized-5c573a2d2d5e5a0d93c932e51fcb95cc.png","storage":"store","metadata":{"filename":"image_processing20200724-1-dzinn4.png","size":57533,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/6/manuscript/48ce537f46f30e41f531c0dd4a1155fb.pdf","storage":"store","metadata":{"filename":"LA2.E06.pdf","size":1146440,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/6/manuscript/screenshot-80c2cb074e0c72693d3221b4d926c5ec.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1v5nulk.png","size":142931,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:29:17.501435	\N	\N	\N	-1	0
3		2020-07-24 14:12:39.663351	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	3	{"id":"medium/3/video/9c61a69cb2ad6b460f32810ed366d8f4.mp4","storage":"store","metadata":{"filename":"LAL2E03.mp4","size":1752814,"mime_type":"video/mp4","duration":60.024,"bitrate":233615,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/3/screenshot/3366a1ac75c28b56e165987c425574ba.png","storage":"store","metadata":{"filename":"screenshot20200724-1-6gkzy3.png","size":174370,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/3/screenshot/normalized-c6188e6a3d396811d283a153ddafa567.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1qykrfz.png","size":42558,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/3/manuscript/02875aacacb6c00ceedf955ed0885bf8.pdf","storage":"store","metadata":{"filename":"LA2.E03.pdf","size":911950,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/3/manuscript/screenshot-09d32e534c82c32213076811e637c5d5.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1jctkbr.png","size":108707,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:12:39.663351	\N	\N	\N	-1	0
50	\N	2022-08-05 14:34:37.266105	2025-07-14 11:12:30.462343	WorkedExample	Worked Example Subscribers	Lecture	27	\N	\N	\N	subscribers	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	\N	\N	\N	3	f	2023-08-05 14:34:46.647792	\N	\N	\N	-1	0
46	https://en.wikipedia.org/wiki/Group_(mathematics)	2022-08-05 13:33:25.078745	2025-07-14 11:12:30.462343	Miscellaneous	Groups	Talk	1	\N	\N	{"id":"medium/46/manuscript/16faf389e47502a6662ef2168b02f312.pdf","storage":"store","metadata":{"filename":"empty.pdf","size":1154,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[],"version":null},"derivatives":{"screenshot":{"id":"medium/46/manuscript/screenshot-5842b6968e935e05ee874bdbbffa6918.png","storage":"store","metadata":{"filename":"image_processing20220805-1-hgctcd.png","size":10234,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	en	\N	\N	<div>Paper with lines.</div>	\N	\N	0	f	2023-08-05 13:36:01.791177	\N	\N	\N	-1	0
7		2020-07-24 14:33:16.150404	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	7	{"id":"medium/7/video/9a75b21e25ae51bee58281bff24ae7e2.mp4","storage":"store","metadata":{"filename":"LA2E07.mp4","size":1742925,"mime_type":"video/mp4","duration":60.024,"bitrate":232297,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/7/screenshot/f452ec799399d32c84390c6bfec896c3.png","storage":"store","metadata":{"filename":"screenshot20200724-1-1i8ba8i.png","size":169612,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/7/screenshot/normalized-f7108a74864a48d622f1ca0d0ea18e8b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-16c2dut.png","size":41756,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/7/manuscript/abe54aaef2c42a27155ce88753ed59ba.pdf","storage":"store","metadata":{"filename":"LA2.E07.pdf","size":1106134,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/7/manuscript/screenshot-7b8d24fe3103d89a98e0cd135abf1390.png","storage":"store","metadata":{"filename":"image_processing20200724-1-vqwyb8.png","size":133262,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:33:16.150404	\N	\N	\N	-1	0
16	\N	2020-07-24 16:01:47.120356	2025-07-14 11:01:53.19958	Quiz	Primideale und maximale Ideale	Lecture	1	\N	\N	\N	all	\N	\N	\N	--- !ruby/object:QuizGraph\nvertices:\n  1:\n    :type: Question\n    :id: 17\n  2:\n    :type: Question\n    :id: 18\n  3:\n    :type: Question\n    :id: 19\n  4:\n    :type: Question\n    :id: 20\n  5:\n    :type: Question\n    :id: 21\nedges: {}\nroot: 1\ndefault_table:\n  1: 2\n  2: 3\n  3: 4\n  4: 5\n  5: -1\nhide_solution: []\n	1	Quiz	\N	\N	de	\N	\N		\N	\N	4	f	2021-07-24 16:01:47.120356	\N	\N	\N	-1	0
5		2020-07-24 14:23:41.519702	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	5	{"id":"medium/5/video/20c0f8f5b7f84bdba5fc08789f703533.mp4","storage":"store","metadata":{"filename":"LA2E05.mp4","size":2035152,"mime_type":"video/mp4","duration":60.024,"bitrate":271245,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/5/screenshot/df65c704b2cd27b51f4e1bc1a8e3d346.png","storage":"store","metadata":{"filename":"screenshot20200724-1-swmdmi.png","size":260866,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/5/screenshot/normalized-b13c583f59f7c34e185c02b71341b31b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1sz19jf.png","size":65008,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/5/manuscript/aa230cc1ddea2de68359e0e4a47bb7dc.pdf","storage":"store","metadata":{"filename":"LA2.E05.pdf","size":1446454,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/5/manuscript/screenshot-42ea4fa7150abd860db7e446ad95426b.png","storage":"store","metadata":{"filename":"image_processing20200724-1-g5cacj.png","size":164433,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:23:41.519702	\N	\N	\N	-1	0
15		2020-07-24 15:58:26.59272	2025-07-14 11:01:53.19958	Miscellaneous	Informationen zur Vorlesung	Lecture	1	\N	\N	{"id":"medium/15/manuscript/6abae2f9d76fc3cf81f061e982a17b4c.pdf","storage":"store","metadata":{"filename":"Sonstiges.V.LA 2.SS20.Informationen zur Vorlesung.pdf","size":134035,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/15/manuscript/screenshot-78c940c61c11b7ea563edd44d9e08b11.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1gee8hy.png","size":73051,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	3	f	2021-07-24 15:58:26.59272	\N	\N	\N	-1	0
14		2020-07-24 15:54:03.017896	2025-07-14 11:01:53.19958	Repetition	Euklidische Räume	Lecture	1	{"id":"medium/14/video/2f175f5305281b157e749a69cb29df98.mp4","storage":"store","metadata":{"filename":"Wiederholung.v.la 2.ss20.euklidische Räume-1.mp4","size":1952112,"mime_type":"video/mp4","duration":60.024,"bitrate":260177,"resolution":"1620x1080","frame_rate":"20/1"}}	\N	{"id":"medium/14/manuscript/b442dd2f1fa978c2e097c18a9c00d4e7.pdf","storage":"store","metadata":{"filename":"Wiederholung.V.LA 2.SS20.Euklidische Räume.pdf","size":76310,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/14/manuscript/screenshot-5a6c59528e7a5f4867c4cf55f65b6070.png","storage":"store","metadata":{"filename":"image_processing20200724-1-131qq54.png","size":9310,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	2	f	2021-07-24 15:54:03.017896	\N	\N	\N	-1	0
4		2020-07-24 14:18:30.391486	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	4	{"id":"medium/4/video/dd9017f21d168a56f365f54d24236133.mp4","storage":"store","metadata":{"filename":"LA2E04.mp4","size":2332822,"mime_type":"video/mp4","duration":60.024,"bitrate":310918,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/4/screenshot/91927569e5f74dd421a334cf864bf97f.png","storage":"store","metadata":{"filename":"screenshot20200724-1-18t9svm.png","size":217053,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/4/screenshot/normalized-ce2d108f74aa61caf947f27b7f2e91d7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-1i2mktm.png","size":63907,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/4/manuscript/cdb87ae3926c61a4989cfc0d97b1277e.pdf","storage":"store","metadata":{"filename":"LA2.E04.pdf","size":1359479,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/4/manuscript/screenshot-9ab7c7f3c704645eb480721a53a4614e.png","storage":"store","metadata":{"filename":"image_processing20200724-1-qhhu3w.png","size":158255,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 14:18:30.391486	\N	\N	\N	-1	0
11	\N	2020-07-24 15:09:22.028739	2025-07-14 11:01:53.19958	Script	Skript	Lecture	1	\N	\N	{"id":"medium/11/manuscript/6a7f68166c0f73c5e52e5c3e04edbe91.pdf","storage":"store","metadata":{"filename":"skript.pdf","size":958764,"mime_type":"application/pdf","pages":2,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/11/manuscript/screenshot-9bfae6984bf1c9058e39961b5e47209e.png","storage":"store","metadata":{"filename":"image_processing20200724-1-7kqb5h.png","size":10393,"mime_type":"image/png"}}}}	all	f	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 15:09:22.028739	\N	\N	\N	-1	0
45		2020-11-28 16:23:26.308384	2025-07-14 11:01:53.19958	Exercise	Blatt 5	Lecture	1	\N	\N	{"id":"medium/45/manuscript/1cf0c8f0baf4dcb98931fd2c1bb9a6b5.pdf","storage":"store","metadata":{"filename":"Übung.V.LA 2.SS20.LA2-Blatt05.pdf","size":70765,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/45/manuscript/screenshot-06c628555c0925a1461a265e77b619ca.png","storage":"store","metadata":{"filename":"image_processing20201128-1-h318j9.png","size":43176,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	26	f	2021-11-28 16:23:26.308384	\N	\N	\N	-1	0
32		2020-07-24 16:34:24.982063	2025-07-14 11:01:53.19958	Remark	nächster Versuch	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Damit gehen wir die obige Frage nochmal an.	\N	\N	\N	\N		\N	classic	20	f	2021-07-24 16:34:24.982063	\N	\N	\N	-1	0
27	\N	2020-07-24 16:22:40.781556	2025-07-14 11:01:53.19958	Remark	Ideale in Z Erzeuger Kandidat	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Wir können annehmen, dass $I$ nicht das Nullideal ist, da dieses bereits ein Hauptideal ist.\nWenn $I$ nicht das Nullideal ist, dann enthält es ein von $0$ verschiedenes Element $y$ und damit auch eine natürliche Zahl $\\lvert y \\rvert.$\nInsgesamt können wir folgern, dass $I\\cap \\mathbb{N}$ eine nicht-leere Teilmenge der natürlichen Zahlen ist und daher ein minimales Element $x$ besitzt. \nUm zu zeigen, dass $x$ ein Erzeuger von $I$ ist, müssen wir zeigen, dass jedes Element $y \\in I$ von der Form $y=ax$ ist für ein $a \\in \\mathbb{Z}.$  Eine wichtige Zutat wird die Division mit Rest.	\N	\N	\N	\N	\N	\N	\N	15	f	2021-07-24 16:22:40.781556	\N	\N	\N	-1	0
29	\N	2020-07-24 16:24:37.74309	2025-07-14 11:01:53.19958	Remark	Ideale in Z final	Lecture	1	\N	\N	\N	all	\N	\N	\N	\N	\N	Remark	Damit haben wir gezeigt: Jedes $y \\in I$ ist von der Form $y= ax$ für ein $a \\in \\mathbb{Z}.$ Daher wird $I$ von $x$ erzeugt. Essentiell für den Beweis war die Division mit Rest. Divison mit Rest ist in jedem $\\textbf{``euklidischen Ring''}$ möglich. Die ganzen Zahl sind ein Beispiel eines euklidischen Rings. Der Beweis, den wir in diesem Quiz geführt haben, lässt sich auch auf euklidische Ringe übertragen. Damit würde man das folgende Ergebnis erhalten: Jeder $\\textbf{euklidische Ring}$ ist ein $\\textbf{Hauptidealring}.$	\N	\N	\N	\N	\N	\N	\N	17	f	2021-07-24 16:24:37.74309	\N	\N	\N	-1	0
1		2020-07-24 13:54:47.104217	2025-07-14 11:01:53.19958	LessonMaterial		Lesson	1	{"id":"medium/1/video/269c5ce0c48ed4a23891abd1346125aa.mp4","storage":"store","metadata":{"filename":"LA2.E01.mp4","size":2078859,"mime_type":"video/mp4","duration":60.024,"bitrate":277070,"resolution":"1620x1080","frame_rate":"20/1"}}	{"id":"medium/1/screenshot/9b259def551649d827b7a40d33ece6d6.png","storage":"store","metadata":{"filename":"screenshot20200724-1-16f6c1d.png","size":230732,"mime_type":"image/png","width":1071,"height":714},"derivatives":{"normalized":{"id":"medium/1/screenshot/normalized-62b8405499916239163ce7ff3df213e7.png","storage":"store","metadata":{"filename":"image_processing20200724-1-x9wc6t.png","size":60200,"mime_type":"image/png","width":405,"height":270}}}}	{"id":"medium/1/manuscript/d7d911f3ade1888e7c44445c573aa3d4.pdf","storage":"store","metadata":{"filename":"LA2.E01.pdf","size":1138473,"mime_type":"application/pdf","pages":1,"destinations":[],"bookmarks":[],"linked_media":[]},"derivatives":{"screenshot":{"id":"medium/1/manuscript/screenshot-d85053a28beb894430567279403be368.png","storage":"store","metadata":{"filename":"image_processing20200724-1-h1cbbu.png","size":149022,"mime_type":"image/png"}}}}	all	\N	\N	\N	\N	\N	\N	\N	\N	de	\N	\N		\N	\N	0	f	2021-07-24 13:54:47.104217	\N	\N	\N	-1	0
20	\N	2020-07-24 16:08:25.960801	2026-08-24 19:07:05.381483	Question	Beispiele für Maximalideale in Z	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Betrachte den Ring der ganzen Zahlen $\\mathbb Z$. \n\nWelche dieser Ideale sind Maximalideale in $\\mathbb Z$?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	8	f	2021-07-24 16:08:25.960801	\N	\N	\N	-1	4
24	\N	2020-07-24 16:17:11.021084	2026-08-24 19:07:05.396989	Question	Ideale in Z erkennen	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Welche der folgenden Teilmengen von $\\mathbb{Z}$ sind Ideale?	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	12	f	2021-07-24 16:17:11.021084	\N	\N	\N	-1	3
25	\N	2020-07-24 16:18:56.962113	2026-08-24 19:07:05.403422	Question	Ideale in Z Erzeuger finden	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Bevor wir einen allgemeinen Beweis der Aussage führen, schauen wir uns ein Beispiel an. Betrachte das Ideal $$I:= 4\\mathbb{Z} + 6 \\mathbb{Z} = \\{a4+b6 \\mid a,b \\in \\mathbb{Z}\\}.$$\nWir wollen zeigen, dass jedes Ideal in $\\mathbb{Z}$ von einem Element erzeugt wird. Diese Aussage müsste insbesondere für $I$ stimmen.\nWelche der folgenden Antwortoptionen sind wahr?	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	13	f	2021-07-24 16:18:56.962113	\N	\N	\N	-1	4
28	\N	2020-07-24 16:23:22.686316	2026-08-24 19:07:05.420917	Question	Ideale in Z Division mit Rest	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei wie zuvor $0 \\neq I\\subset \\mathbb{Z}$ ein Ideal und $x \\in I$ die kleinste natürliche Zahl in $I$. Sei weiterhin $y \\in I$ ein weiteres Element. Mit Hilfe von Division mit Rest finden wir ein $a \\in \\mathbb{Z}$ und ein $0 \\leq r < \\lvert x\\rvert$ mit $$y = ax+r.$$\nWas können wir ableiten?	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc	\N	\N	\N	16	f	2021-07-24 16:23:22.686316	\N	\N	\N	-1	3
31		2020-07-24 16:30:41.490936	2026-08-24 19:07:05.428616	Question	Ideale Definition	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Sei $R$ ein kommutativer Ring mit Eins. Eine Teilmenge $I$ von $R$ von heißt Ideal, wenn $0\\in I$ ist, für alle $a,b\\in I$ stets $a+b\\in I$ gilt und	f	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: '0'\n  tex: '0'\n  nerd: '0'\n	mc		\N	\N	19	f	2021-07-24 16:30:41.490936	\N	\N	\N	-1	2
34		2020-07-24 16:43:21.322066	2026-08-24 19:07:05.434699	Question	Zusammenhang Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{4,4}(\\mathbb{Q})$ habe die Invariantenteiler $1,t-2,t-2,(t-2)(t-3)$. Gib die Determinantenteiler $d_1(A),\\ldots,d_4(A)$ als Tupel von Polynomen aus $\\mathbb{Q}[t]$ an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfTuple\n  value: 1,t-2,(t-2)^2,(t-2)^3*(t-3)\n  tex: "(1, t-2, \\\\left(t-2\\\\right)^{2}, \\\\left(t-2\\\\right)^{3} \\\\cdot \\\\left(t-3\\\\right))"\n  nerd: vector(1,t-2,(t-2)^2,(t-2)^3*(t-3))\nexplanation: ''\n	free		\N	\N	22	f	2021-07-24 16:43:21.322066	\N	\N	\N	-1	1
35		2020-07-24 16:44:51.271122	2026-08-24 19:07:05.466119	Question	Zusammenhang Invariantenteiler und charakteristisches Polynom	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{5,5}(\\mathbb{Q})$ habe die Invariantenteiler $1,1,t-2,(t-2)(t-3),(t-2)(t-3)$. Gib das charakteristische Polynom von $A$ (als Polynom aus $\\mathbb{Q}[t]$) an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfExpression\n  value: "(t-2)^3*(t-3)^2"\n  tex: "\\\\left(t-2\\\\right)^{3} \\\\cdot \\\\left(t-3\\\\right)^{2}"\n  nerd: "(t-2)^3*(t-3)^2"\nexplanation: Es ist $d_5(A)=c_1(A)\\cdot\\ldots\\cdot c_5(A)$ und $d_5(A)=\\chi^{\\operatorname{char}}_A$.\n	free		\N	\N	23	f	2021-07-24 16:44:51.271122	\N	\N	\N	-1	1
36	\N	2020-07-24 16:46:02.067418	2026-08-24 19:07:05.472326	Question	Zusammenhang Invarianten- und Determinantenteiler	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{6,6}(\\mathbb{Q})$ habe die Determinantenteiler $1,1,t-2,(t-2)^2,(t-2)^3,(t-2)^5(t-3)$. Gib die Invariantenteiler $c_1(A),\\ldots,c_6(A)$ als Tupel von Polynomen aus $\\mathbb{Q}[t]$ an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfTuple\n  value: 1,1,t-2,t-2,t-2,(t-2)^2*(t-3)\n  tex: "(1, 1, t-2, t-2, t-2, \\\\left(t-2\\\\right)^{2} \\\\cdot \\\\left(t-3\\\\right))"\n  nerd: vector(1,1,t-2,t-2,t-2,(t-2)^2*(t-3))\nexplanation: ''\n	free	\N	\N	\N	24	f	2021-07-24 16:46:02.067418	\N	\N	\N	-1	1
37	\N	2020-07-24 16:48:30.034301	2026-08-24 19:07:05.478181	Question	Frobenius-Normalform bestimmen	Lecture	1	\N	\N	\N	all	\N		\N	\N	1	Question	Die Matrix $A\\in M_{4,4}(\\mathbb{Q})$ habe die Invariantenteiler $1,1,(t-3)^2,(t-3)^2$. Gib die Frobenius-Normalform von $A$ an.	t	\N	--- !ruby/object:Solution\ncontent: !ruby/object:MampfMatrix\n  row_count: 4\n  column_count: 4\n  coefficients:\n  - '0'\n  - "-9"\n  - '0'\n  - '0'\n  - '1'\n  - '6'\n  - '0'\n  - '0'\n  - '0'\n  - '0'\n  - '0'\n  - "-9"\n  - '0'\n  - '0'\n  - '1'\n  - '6'\n  tex: "\\\\begin{pmatrix}0 & -9 & 0 & 0 \\\\cr 1 & 6 & 0 & 0 \\\\cr 0 & 0 & 0 & -9 \\\\cr\n    0 & 0 & 1 & 6\\\\end{pmatrix}"\n  nerd: matrix([0,-9,0,0],[1,6,0,0],[0,0,0,-9],[0,0,1,6])\nexplanation: ''\n	free	\N	\N	\N	25	f	2021-07-24 16:48:30.034301	\N	\N	\N	-1	1
\.


--
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
144	1	5	Announcement	create	2026-08-24 19:07:33.279533	2026-08-24 19:07:33.279533
145	2	5	Announcement	create	2026-08-24 19:07:33.291006	2026-08-24 19:07:33.291006
146	5	5	Announcement	create	2026-08-24 19:07:33.297814	2026-08-24 19:07:33.297814
147	6	5	Announcement	create	2026-08-24 19:07:33.303868	2026-08-24 19:07:33.303868
148	7	5	Announcement	create	2026-08-24 19:07:33.308747	2026-08-24 19:07:33.308747
149	8	5	Announcement	create	2026-08-24 19:07:33.314255	2026-08-24 19:07:33.314255
150	9	5	Announcement	create	2026-08-24 19:07:33.319461	2026-08-24 19:07:33.319461
151	10	5	Announcement	create	2026-08-24 19:07:33.324053	2026-08-24 19:07:33.324053
152	12	5	Announcement	create	2026-08-24 19:07:33.339563	2026-08-24 19:07:33.339563
153	13	5	Announcement	create	2026-08-24 19:07:33.344708	2026-08-24 19:07:33.344708
154	14	5	Announcement	create	2026-08-24 19:07:33.35157	2026-08-24 19:07:33.35157
155	15	5	Announcement	create	2026-08-24 19:07:33.356261	2026-08-24 19:07:33.356261
156	16	5	Announcement	create	2026-08-24 19:07:33.362085	2026-08-24 19:07:33.362085
157	17	5	Announcement	create	2026-08-24 19:07:33.367659	2026-08-24 19:07:33.367659
158	18	5	Announcement	create	2026-08-24 19:07:33.373653	2026-08-24 19:07:33.373653
159	19	5	Announcement	create	2026-08-24 19:07:33.379878	2026-08-24 19:07:33.379878
160	20	5	Announcement	create	2026-08-24 19:07:33.385181	2026-08-24 19:07:33.385181
161	21	5	Announcement	create	2026-08-24 19:07:33.390666	2026-08-24 19:07:33.390666
162	22	5	Announcement	create	2026-08-24 19:07:33.395723	2026-08-24 19:07:33.395723
163	23	5	Announcement	create	2026-08-24 19:07:33.401396	2026-08-24 19:07:33.401396
164	24	5	Announcement	create	2026-08-24 19:07:33.407467	2026-08-24 19:07:33.407467
165	25	5	Announcement	create	2026-08-24 19:07:33.412606	2026-08-24 19:07:33.412606
166	26	5	Announcement	create	2026-08-24 19:07:33.423986	2026-08-24 19:07:33.423986
167	27	5	Announcement	create	2026-08-24 19:07:33.429611	2026-08-24 19:07:33.429611
168	28	5	Announcement	create	2026-08-24 19:07:33.435119	2026-08-24 19:07:33.435119
169	29	5	Announcement	create	2026-08-24 19:07:33.441382	2026-08-24 19:07:33.441382
170	30	5	Announcement	create	2026-08-24 19:07:33.446974	2026-08-24 19:07:33.446974
171	31	5	Announcement	create	2026-08-24 19:07:33.453166	2026-08-24 19:07:33.453166
172	32	5	Announcement	create	2026-08-24 19:07:33.458379	2026-08-24 19:07:33.458379
173	33	5	Announcement	create	2026-08-24 19:07:33.4637	2026-08-24 19:07:33.4637
174	34	5	Announcement	create	2026-08-24 19:07:33.46905	2026-08-24 19:07:33.46905
175	35	5	Announcement	create	2026-08-24 19:07:33.473766	2026-08-24 19:07:33.473766
176	36	5	Announcement	create	2026-08-24 19:07:33.478928	2026-08-24 19:07:33.478928
177	37	5	Announcement	create	2026-08-24 19:07:33.491018	2026-08-24 19:07:33.491018
178	38	5	Announcement	create	2026-08-24 19:07:33.496672	2026-08-24 19:07:33.496672
179	39	5	Announcement	create	2026-08-24 19:07:33.502985	2026-08-24 19:07:33.502985
180	40	5	Announcement	create	2026-08-24 19:07:33.508806	2026-08-24 19:07:33.508806
181	41	5	Announcement	create	2026-08-24 19:07:33.514243	2026-08-24 19:07:33.514243
182	42	5	Announcement	create	2026-08-24 19:07:33.521007	2026-08-24 19:07:33.521007
183	43	5	Announcement	create	2026-08-24 19:07:33.527899	2026-08-24 19:07:33.527899
184	44	5	Announcement	create	2026-08-24 19:07:33.534875	2026-08-24 19:07:33.534875
185	45	5	Announcement	create	2026-08-24 19:07:33.540946	2026-08-24 19:07:33.540946
186	46	5	Announcement	create	2026-08-24 19:07:33.548232	2026-08-24 19:07:33.548232
187	47	5	Announcement	create	2026-08-24 19:07:33.554216	2026-08-24 19:07:33.554216
188	48	5	Announcement	create	2026-08-24 19:07:33.559788	2026-08-24 19:07:33.559788
189	49	5	Announcement	create	2026-08-24 19:07:33.567181	2026-08-24 19:07:33.567181
190	50	5	Announcement	create	2026-08-24 19:07:33.571586	2026-08-24 19:07:33.571586
191	51	5	Announcement	create	2026-08-24 19:07:33.582667	2026-08-24 19:07:33.582667
192	52	5	Announcement	create	2026-08-24 19:07:33.586992	2026-08-24 19:07:33.586992
193	53	5	Announcement	create	2026-08-24 19:07:33.591429	2026-08-24 19:07:33.591429
194	54	5	Announcement	create	2026-08-24 19:07:33.596749	2026-08-24 19:07:33.596749
195	55	5	Announcement	create	2026-08-24 19:07:33.601193	2026-08-24 19:07:33.601193
196	56	5	Announcement	create	2026-08-24 19:07:33.607019	2026-08-24 19:07:33.607019
197	57	5	Announcement	create	2026-08-24 19:07:33.612048	2026-08-24 19:07:33.612048
198	58	5	Announcement	create	2026-08-24 19:07:33.616876	2026-08-24 19:07:33.616876
199	59	5	Announcement	create	2026-08-24 19:07:33.621464	2026-08-24 19:07:33.621464
200	60	5	Announcement	create	2026-08-24 19:07:33.626672	2026-08-24 19:07:33.626672
201	61	5	Announcement	create	2026-08-24 19:07:33.631993	2026-08-24 19:07:33.631993
202	62	5	Announcement	create	2026-08-24 19:07:33.646729	2026-08-24 19:07:33.646729
203	63	5	Announcement	create	2026-08-24 19:07:33.652971	2026-08-24 19:07:33.652971
204	64	5	Announcement	create	2026-08-24 19:07:33.660485	2026-08-24 19:07:33.660485
205	65	5	Announcement	create	2026-08-24 19:07:33.672561	2026-08-24 19:07:33.672561
206	66	5	Announcement	create	2026-08-24 19:07:33.683303	2026-08-24 19:07:33.683303
207	67	5	Announcement	create	2026-08-24 19:07:33.689173	2026-08-24 19:07:33.689173
208	68	5	Announcement	create	2026-08-24 19:07:33.694289	2026-08-24 19:07:33.694289
209	69	5	Announcement	create	2026-08-24 19:07:33.700147	2026-08-24 19:07:33.700147
210	70	5	Announcement	create	2026-08-24 19:07:33.705822	2026-08-24 19:07:33.705822
211	71	5	Announcement	create	2026-08-24 19:07:33.711701	2026-08-24 19:07:33.711701
212	72	5	Announcement	create	2026-08-24 19:07:33.718413	2026-08-24 19:07:33.718413
213	73	5	Announcement	create	2026-08-24 19:07:33.723247	2026-08-24 19:07:33.723247
214	74	5	Announcement	create	2026-08-24 19:07:33.731266	2026-08-24 19:07:33.731266
215	75	5	Announcement	create	2026-08-24 19:07:33.736257	2026-08-24 19:07:33.736257
216	76	5	Announcement	create	2026-08-24 19:07:33.747224	2026-08-24 19:07:33.747224
217	77	5	Announcement	create	2026-08-24 19:07:33.752791	2026-08-24 19:07:33.752791
218	78	5	Announcement	create	2026-08-24 19:07:33.757266	2026-08-24 19:07:33.757266
219	79	5	Announcement	create	2026-08-24 19:07:33.763713	2026-08-24 19:07:33.763713
220	80	5	Announcement	create	2026-08-24 19:07:33.769264	2026-08-24 19:07:33.769264
221	81	5	Announcement	create	2026-08-24 19:07:33.774215	2026-08-24 19:07:33.774215
222	82	5	Announcement	create	2026-08-24 19:07:33.780433	2026-08-24 19:07:33.780433
223	83	5	Announcement	create	2026-08-24 19:07:33.786076	2026-08-24 19:07:33.786076
224	84	5	Announcement	create	2026-08-24 19:07:33.790709	2026-08-24 19:07:33.790709
225	85	5	Announcement	create	2026-08-24 19:07:33.797309	2026-08-24 19:07:33.797309
226	86	5	Announcement	create	2026-08-24 19:07:33.803368	2026-08-24 19:07:33.803368
227	87	5	Announcement	create	2026-08-24 19:07:33.814004	2026-08-24 19:07:33.814004
228	88	5	Announcement	create	2026-08-24 19:07:33.819273	2026-08-24 19:07:33.819273
229	89	5	Announcement	create	2026-08-24 19:07:33.824291	2026-08-24 19:07:33.824291
230	90	5	Announcement	create	2026-08-24 19:07:33.832122	2026-08-24 19:07:33.832122
231	91	5	Announcement	create	2026-08-24 19:07:33.837913	2026-08-24 19:07:33.837913
232	92	5	Announcement	create	2026-08-24 19:07:33.843784	2026-08-24 19:07:33.843784
233	93	5	Announcement	create	2026-08-24 19:07:33.849064	2026-08-24 19:07:33.849064
234	94	5	Announcement	create	2026-08-24 19:07:33.85527	2026-08-24 19:07:33.85527
235	95	5	Announcement	create	2026-08-24 19:07:33.859872	2026-08-24 19:07:33.859872
236	96	5	Announcement	create	2026-08-24 19:07:33.865307	2026-08-24 19:07:33.865307
237	97	5	Announcement	create	2026-08-24 19:07:33.871252	2026-08-24 19:07:33.871252
238	98	5	Announcement	create	2026-08-24 19:07:33.875799	2026-08-24 19:07:33.875799
239	99	5	Announcement	create	2026-08-24 19:07:33.882381	2026-08-24 19:07:33.882381
240	100	5	Announcement	create	2026-08-24 19:07:33.887703	2026-08-24 19:07:33.887703
241	101	5	Announcement	create	2026-08-24 19:07:33.897793	2026-08-24 19:07:33.897793
242	102	5	Announcement	create	2026-08-24 19:07:33.902891	2026-08-24 19:07:33.902891
243	103	5	Announcement	create	2026-08-24 19:07:33.907745	2026-08-24 19:07:33.907745
244	104	5	Announcement	create	2026-08-24 19:07:33.914213	2026-08-24 19:07:33.914213
245	105	5	Announcement	create	2026-08-24 19:07:33.919502	2026-08-24 19:07:33.919502
246	106	5	Announcement	create	2026-08-24 19:07:33.923789	2026-08-24 19:07:33.923789
247	107	5	Announcement	create	2026-08-24 19:07:33.929648	2026-08-24 19:07:33.929648
248	108	5	Announcement	create	2026-08-24 19:07:33.934881	2026-08-24 19:07:33.934881
249	109	5	Announcement	create	2026-08-24 19:07:33.939305	2026-08-24 19:07:33.939305
250	110	5	Announcement	create	2026-08-24 19:07:33.944676	2026-08-24 19:07:33.944676
251	111	5	Announcement	create	2026-08-24 19:07:33.94998	2026-08-24 19:07:33.94998
252	112	5	Announcement	create	2026-08-24 19:07:33.957245	2026-08-24 19:07:33.957245
253	113	5	Announcement	create	2026-08-24 19:07:33.963438	2026-08-24 19:07:33.963438
254	114	5	Announcement	create	2026-08-24 19:07:33.967959	2026-08-24 19:07:33.967959
255	115	5	Announcement	create	2026-08-24 19:07:33.974737	2026-08-24 19:07:33.974737
256	116	5	Announcement	create	2026-08-24 19:07:33.980169	2026-08-24 19:07:33.980169
257	117	5	Announcement	create	2026-08-24 19:07:33.985712	2026-08-24 19:07:33.985712
258	118	5	Announcement	create	2026-08-24 19:07:33.98977	2026-08-24 19:07:33.98977
259	119	5	Announcement	create	2026-08-24 19:07:33.99697	2026-08-24 19:07:33.99697
260	120	5	Announcement	create	2026-08-24 19:07:34.003014	2026-08-24 19:07:34.003014
261	121	5	Announcement	create	2026-08-24 19:07:34.009566	2026-08-24 19:07:34.009566
262	122	5	Announcement	create	2026-08-24 19:07:34.01645	2026-08-24 19:07:34.01645
263	123	5	Announcement	create	2026-08-24 19:07:34.022805	2026-08-24 19:07:34.022805
264	124	5	Announcement	create	2026-08-24 19:07:34.030185	2026-08-24 19:07:34.030185
265	125	5	Announcement	create	2026-08-24 19:07:34.035685	2026-08-24 19:07:34.035685
266	126	5	Announcement	create	2026-08-24 19:07:34.046035	2026-08-24 19:07:34.046035
267	127	5	Announcement	create	2026-08-24 19:07:34.050968	2026-08-24 19:07:34.050968
268	128	5	Announcement	create	2026-08-24 19:07:34.055376	2026-08-24 19:07:34.055376
269	129	5	Announcement	create	2026-08-24 19:07:34.061304	2026-08-24 19:07:34.061304
270	130	5	Announcement	create	2026-08-24 19:07:34.066379	2026-08-24 19:07:34.066379
271	131	5	Announcement	create	2026-08-24 19:07:34.070917	2026-08-24 19:07:34.070917
272	132	5	Announcement	create	2026-08-24 19:07:34.076097	2026-08-24 19:07:34.076097
273	133	5	Announcement	create	2026-08-24 19:07:34.081588	2026-08-24 19:07:34.081588
274	134	5	Announcement	create	2026-08-24 19:07:34.086347	2026-08-24 19:07:34.086347
275	135	5	Announcement	create	2026-08-24 19:07:34.090644	2026-08-24 19:07:34.090644
276	136	5	Announcement	create	2026-08-24 19:07:34.096582	2026-08-24 19:07:34.096582
277	137	5	Announcement	create	2026-08-24 19:07:34.104076	2026-08-24 19:07:34.104076
278	138	5	Announcement	create	2026-08-24 19:07:34.109743	2026-08-24 19:07:34.109743
279	139	5	Announcement	create	2026-08-24 19:07:34.115576	2026-08-24 19:07:34.115576
280	140	5	Announcement	create	2026-08-24 19:07:34.122026	2026-08-24 19:07:34.122026
281	141	5	Announcement	create	2026-08-24 19:07:34.127627	2026-08-24 19:07:34.127627
282	142	5	Announcement	create	2026-08-24 19:07:34.133894	2026-08-24 19:07:34.133894
283	143	5	Announcement	create	2026-08-24 19:07:34.139265	2026-08-24 19:07:34.139265
284	144	5	Announcement	create	2026-08-24 19:07:34.14536	2026-08-24 19:07:34.14536
285	145	5	Announcement	create	2026-08-24 19:07:34.151576	2026-08-24 19:07:34.151576
286	146	5	Announcement	create	2026-08-24 19:07:34.156164	2026-08-24 19:07:34.156164
287	147	5	Announcement	create	2026-08-24 19:07:34.163126	2026-08-24 19:07:34.163126
288	148	5	Announcement	create	2026-08-24 19:07:34.169643	2026-08-24 19:07:34.169643
289	149	5	Announcement	create	2026-08-24 19:07:34.175849	2026-08-24 19:07:34.175849
290	150	5	Announcement	create	2026-08-24 19:07:34.182265	2026-08-24 19:07:34.182265
291	151	5	Announcement	create	2026-08-24 19:07:34.187608	2026-08-24 19:07:34.187608
292	152	5	Announcement	create	2026-08-24 19:07:34.197446	2026-08-24 19:07:34.197446
293	153	5	Announcement	create	2026-08-24 19:07:34.202225	2026-08-24 19:07:34.202225
294	154	5	Announcement	create	2026-08-24 19:07:34.206416	2026-08-24 19:07:34.206416
295	155	5	Announcement	create	2026-08-24 19:07:34.211843	2026-08-24 19:07:34.211843
296	156	5	Announcement	create	2026-08-24 19:07:34.21723	2026-08-24 19:07:34.21723
297	157	5	Announcement	create	2026-08-24 19:07:34.221598	2026-08-24 19:07:34.221598
298	158	5	Announcement	create	2026-08-24 19:07:34.226572	2026-08-24 19:07:34.226572
299	159	5	Announcement	create	2026-08-24 19:07:34.245245	2026-08-24 19:07:34.245245
300	160	5	Announcement	create	2026-08-24 19:07:34.251728	2026-08-24 19:07:34.251728
301	161	5	Announcement	create	2026-08-24 19:07:34.258157	2026-08-24 19:07:34.258157
302	162	5	Announcement	create	2026-08-24 19:07:34.268972	2026-08-24 19:07:34.268972
303	163	5	Announcement	create	2026-08-24 19:07:34.275006	2026-08-24 19:07:34.275006
304	164	5	Announcement	create	2026-08-24 19:07:34.281213	2026-08-24 19:07:34.281213
305	165	5	Announcement	create	2026-08-24 19:07:34.288981	2026-08-24 19:07:34.288981
306	166	5	Announcement	create	2026-08-24 19:07:34.295097	2026-08-24 19:07:34.295097
307	167	5	Announcement	create	2026-08-24 19:07:34.30267	2026-08-24 19:07:34.30267
308	168	5	Announcement	create	2026-08-24 19:07:34.308561	2026-08-24 19:07:34.308561
309	169	5	Announcement	create	2026-08-24 19:07:34.314527	2026-08-24 19:07:34.314527
310	170	5	Announcement	create	2026-08-24 19:07:34.320679	2026-08-24 19:07:34.320679
311	171	5	Announcement	create	2026-08-24 19:07:34.326895	2026-08-24 19:07:34.326895
312	172	5	Announcement	create	2026-08-24 19:07:34.33423	2026-08-24 19:07:34.33423
313	173	5	Announcement	create	2026-08-24 19:07:34.33897	2026-08-24 19:07:34.33897
314	174	5	Announcement	create	2026-08-24 19:07:34.345175	2026-08-24 19:07:34.345175
315	175	5	Announcement	create	2026-08-24 19:07:34.350994	2026-08-24 19:07:34.350994
316	176	5	Announcement	create	2026-08-24 19:07:34.35563	2026-08-24 19:07:34.35563
317	177	5	Announcement	create	2026-08-24 19:07:34.365206	2026-08-24 19:07:34.365206
318	178	5	Announcement	create	2026-08-24 19:07:34.370003	2026-08-24 19:07:34.370003
319	179	5	Announcement	create	2026-08-24 19:07:34.374838	2026-08-24 19:07:34.374838
320	180	5	Announcement	create	2026-08-24 19:07:34.380112	2026-08-24 19:07:34.380112
321	1	6	Announcement	create	2026-08-24 19:07:34.39305	2026-08-24 19:07:34.39305
322	2	6	Announcement	create	2026-08-24 19:07:34.398584	2026-08-24 19:07:34.398584
323	5	6	Announcement	create	2026-08-24 19:07:34.403365	2026-08-24 19:07:34.403365
324	6	6	Announcement	create	2026-08-24 19:07:34.408468	2026-08-24 19:07:34.408468
325	7	6	Announcement	create	2026-08-24 19:07:34.413363	2026-08-24 19:07:34.413363
326	8	6	Announcement	create	2026-08-24 19:07:34.420981	2026-08-24 19:07:34.420981
327	9	6	Announcement	create	2026-08-24 19:07:34.426237	2026-08-24 19:07:34.426237
328	10	6	Announcement	create	2026-08-24 19:07:34.431163	2026-08-24 19:07:34.431163
329	12	6	Announcement	create	2026-08-24 19:07:34.437512	2026-08-24 19:07:34.437512
330	13	6	Announcement	create	2026-08-24 19:07:34.443096	2026-08-24 19:07:34.443096
331	14	6	Announcement	create	2026-08-24 19:07:34.449548	2026-08-24 19:07:34.449548
332	15	6	Announcement	create	2026-08-24 19:07:34.454361	2026-08-24 19:07:34.454361
333	16	6	Announcement	create	2026-08-24 19:07:34.460899	2026-08-24 19:07:34.460899
334	17	6	Announcement	create	2026-08-24 19:07:34.465529	2026-08-24 19:07:34.465529
335	18	6	Announcement	create	2026-08-24 19:07:34.470166	2026-08-24 19:07:34.470166
336	19	6	Announcement	create	2026-08-24 19:07:34.476001	2026-08-24 19:07:34.476001
337	20	6	Announcement	create	2026-08-24 19:07:34.481623	2026-08-24 19:07:34.481623
338	21	6	Announcement	create	2026-08-24 19:07:34.486578	2026-08-24 19:07:34.486578
339	22	6	Announcement	create	2026-08-24 19:07:34.491493	2026-08-24 19:07:34.491493
340	23	6	Announcement	create	2026-08-24 19:07:34.501108	2026-08-24 19:07:34.501108
341	24	6	Announcement	create	2026-08-24 19:07:34.506143	2026-08-24 19:07:34.506143
342	25	6	Announcement	create	2026-08-24 19:07:34.511601	2026-08-24 19:07:34.511601
343	26	6	Announcement	create	2026-08-24 19:07:34.516288	2026-08-24 19:07:34.516288
344	27	6	Announcement	create	2026-08-24 19:07:34.520592	2026-08-24 19:07:34.520592
345	28	6	Announcement	create	2026-08-24 19:07:34.525998	2026-08-24 19:07:34.525998
346	29	6	Announcement	create	2026-08-24 19:07:34.530853	2026-08-24 19:07:34.530853
347	30	6	Announcement	create	2026-08-24 19:07:34.535528	2026-08-24 19:07:34.535528
348	31	6	Announcement	create	2026-08-24 19:07:34.540444	2026-08-24 19:07:34.540444
349	32	6	Announcement	create	2026-08-24 19:07:34.546589	2026-08-24 19:07:34.546589
350	33	6	Announcement	create	2026-08-24 19:07:34.551488	2026-08-24 19:07:34.551488
351	34	6	Announcement	create	2026-08-24 19:07:34.560497	2026-08-24 19:07:34.560497
352	35	6	Announcement	create	2026-08-24 19:07:34.565326	2026-08-24 19:07:34.565326
353	36	6	Announcement	create	2026-08-24 19:07:34.57128	2026-08-24 19:07:34.57128
354	37	6	Announcement	create	2026-08-24 19:07:34.576761	2026-08-24 19:07:34.576761
355	38	6	Announcement	create	2026-08-24 19:07:34.582017	2026-08-24 19:07:34.582017
356	39	6	Announcement	create	2026-08-24 19:07:34.586448	2026-08-24 19:07:34.586448
357	40	6	Announcement	create	2026-08-24 19:07:34.591596	2026-08-24 19:07:34.591596
358	41	6	Announcement	create	2026-08-24 19:07:34.598247	2026-08-24 19:07:34.598247
359	42	6	Announcement	create	2026-08-24 19:07:34.603148	2026-08-24 19:07:34.603148
360	43	6	Announcement	create	2026-08-24 19:07:34.609354	2026-08-24 19:07:34.609354
361	44	6	Announcement	create	2026-08-24 19:07:34.613867	2026-08-24 19:07:34.613867
362	45	6	Announcement	create	2026-08-24 19:07:34.61817	2026-08-24 19:07:34.61817
363	46	6	Announcement	create	2026-08-24 19:07:34.623237	2026-08-24 19:07:34.623237
364	47	6	Announcement	create	2026-08-24 19:07:34.629055	2026-08-24 19:07:34.629055
365	48	6	Announcement	create	2026-08-24 19:07:34.638412	2026-08-24 19:07:34.638412
366	49	6	Announcement	create	2026-08-24 19:07:34.644104	2026-08-24 19:07:34.644104
367	50	6	Announcement	create	2026-08-24 19:07:34.649338	2026-08-24 19:07:34.649338
368	51	6	Announcement	create	2026-08-24 19:07:34.653951	2026-08-24 19:07:34.653951
369	52	6	Announcement	create	2026-08-24 19:07:34.659356	2026-08-24 19:07:34.659356
370	53	6	Announcement	create	2026-08-24 19:07:34.664034	2026-08-24 19:07:34.664034
371	54	6	Announcement	create	2026-08-24 19:07:34.668335	2026-08-24 19:07:34.668335
372	55	6	Announcement	create	2026-08-24 19:07:34.672722	2026-08-24 19:07:34.672722
373	56	6	Announcement	create	2026-08-24 19:07:34.678065	2026-08-24 19:07:34.678065
374	57	6	Announcement	create	2026-08-24 19:07:34.682184	2026-08-24 19:07:34.682184
375	58	6	Announcement	create	2026-08-24 19:07:34.68999	2026-08-24 19:07:34.68999
376	59	6	Announcement	create	2026-08-24 19:07:34.695742	2026-08-24 19:07:34.695742
377	60	6	Announcement	create	2026-08-24 19:07:34.700439	2026-08-24 19:07:34.700439
378	61	6	Announcement	create	2026-08-24 19:07:34.706592	2026-08-24 19:07:34.706592
379	62	6	Announcement	create	2026-08-24 19:07:34.71149	2026-08-24 19:07:34.71149
380	63	6	Announcement	create	2026-08-24 19:07:34.716837	2026-08-24 19:07:34.716837
381	64	6	Announcement	create	2026-08-24 19:07:34.721059	2026-08-24 19:07:34.721059
382	65	6	Announcement	create	2026-08-24 19:07:34.727883	2026-08-24 19:07:34.727883
383	66	6	Announcement	create	2026-08-24 19:07:34.732399	2026-08-24 19:07:34.732399
384	67	6	Announcement	create	2026-08-24 19:07:34.736702	2026-08-24 19:07:34.736702
385	68	6	Announcement	create	2026-08-24 19:07:34.743855	2026-08-24 19:07:34.743855
386	69	6	Announcement	create	2026-08-24 19:07:34.748514	2026-08-24 19:07:34.748514
387	70	6	Announcement	create	2026-08-24 19:07:34.753245	2026-08-24 19:07:34.753245
388	71	6	Announcement	create	2026-08-24 19:07:34.758307	2026-08-24 19:07:34.758307
389	72	6	Announcement	create	2026-08-24 19:07:34.766678	2026-08-24 19:07:34.766678
390	73	6	Announcement	create	2026-08-24 19:07:34.772627	2026-08-24 19:07:34.772627
391	74	6	Announcement	create	2026-08-24 19:07:34.777859	2026-08-24 19:07:34.777859
392	75	6	Announcement	create	2026-08-24 19:07:34.782026	2026-08-24 19:07:34.782026
393	76	6	Announcement	create	2026-08-24 19:07:34.786251	2026-08-24 19:07:34.786251
394	77	6	Announcement	create	2026-08-24 19:07:34.791246	2026-08-24 19:07:34.791246
395	78	6	Announcement	create	2026-08-24 19:07:34.796376	2026-08-24 19:07:34.796376
396	79	6	Announcement	create	2026-08-24 19:07:34.801376	2026-08-24 19:07:34.801376
397	80	6	Announcement	create	2026-08-24 19:07:34.806998	2026-08-24 19:07:34.806998
398	81	6	Announcement	create	2026-08-24 19:07:34.811614	2026-08-24 19:07:34.811614
399	82	6	Announcement	create	2026-08-24 19:07:34.815821	2026-08-24 19:07:34.815821
400	83	6	Announcement	create	2026-08-24 19:07:34.823991	2026-08-24 19:07:34.823991
401	84	6	Announcement	create	2026-08-24 19:07:34.829527	2026-08-24 19:07:34.829527
402	85	6	Announcement	create	2026-08-24 19:07:34.835613	2026-08-24 19:07:34.835613
403	86	6	Announcement	create	2026-08-24 19:07:34.841242	2026-08-24 19:07:34.841242
404	87	6	Announcement	create	2026-08-24 19:07:34.846435	2026-08-24 19:07:34.846435
405	88	6	Announcement	create	2026-08-24 19:07:34.851698	2026-08-24 19:07:34.851698
406	89	6	Announcement	create	2026-08-24 19:07:34.856539	2026-08-24 19:07:34.856539
407	90	6	Announcement	create	2026-08-24 19:07:34.862612	2026-08-24 19:07:34.862612
408	91	6	Announcement	create	2026-08-24 19:07:34.867074	2026-08-24 19:07:34.867074
409	92	6	Announcement	create	2026-08-24 19:07:34.871818	2026-08-24 19:07:34.871818
410	93	6	Announcement	create	2026-08-24 19:07:34.8781	2026-08-24 19:07:34.8781
411	94	6	Announcement	create	2026-08-24 19:07:34.88247	2026-08-24 19:07:34.88247
412	95	6	Announcement	create	2026-08-24 19:07:34.887286	2026-08-24 19:07:34.887286
413	96	6	Announcement	create	2026-08-24 19:07:34.892602	2026-08-24 19:07:34.892602
414	97	6	Announcement	create	2026-08-24 19:07:34.901196	2026-08-24 19:07:34.901196
415	98	6	Announcement	create	2026-08-24 19:07:34.906452	2026-08-24 19:07:34.906452
416	99	6	Announcement	create	2026-08-24 19:07:34.911278	2026-08-24 19:07:34.911278
417	100	6	Announcement	create	2026-08-24 19:07:34.915425	2026-08-24 19:07:34.915425
418	101	6	Announcement	create	2026-08-24 19:07:34.919516	2026-08-24 19:07:34.919516
419	102	6	Announcement	create	2026-08-24 19:07:34.925179	2026-08-24 19:07:34.925179
420	103	6	Announcement	create	2026-08-24 19:07:34.929455	2026-08-24 19:07:34.929455
421	104	6	Announcement	create	2026-08-24 19:07:34.934124	2026-08-24 19:07:34.934124
422	105	6	Announcement	create	2026-08-24 19:07:34.939141	2026-08-24 19:07:34.939141
423	106	6	Announcement	create	2026-08-24 19:07:34.944374	2026-08-24 19:07:34.944374
424	107	6	Announcement	create	2026-08-24 19:07:34.951136	2026-08-24 19:07:34.951136
425	108	6	Announcement	create	2026-08-24 19:07:34.956648	2026-08-24 19:07:34.956648
426	109	6	Announcement	create	2026-08-24 19:07:34.962379	2026-08-24 19:07:34.962379
427	110	6	Announcement	create	2026-08-24 19:07:34.968001	2026-08-24 19:07:34.968001
428	111	6	Announcement	create	2026-08-24 19:07:34.974409	2026-08-24 19:07:34.974409
429	112	6	Announcement	create	2026-08-24 19:07:34.980916	2026-08-24 19:07:34.980916
430	113	6	Announcement	create	2026-08-24 19:07:34.98554	2026-08-24 19:07:34.98554
431	114	6	Announcement	create	2026-08-24 19:07:34.991235	2026-08-24 19:07:34.991235
432	115	6	Announcement	create	2026-08-24 19:07:34.996523	2026-08-24 19:07:34.996523
433	116	6	Announcement	create	2026-08-24 19:07:35.002355	2026-08-24 19:07:35.002355
434	117	6	Announcement	create	2026-08-24 19:07:35.009948	2026-08-24 19:07:35.009948
435	118	6	Announcement	create	2026-08-24 19:07:35.014317	2026-08-24 19:07:35.014317
436	119	6	Announcement	create	2026-08-24 19:07:35.019285	2026-08-24 19:07:35.019285
437	120	6	Announcement	create	2026-08-24 19:07:35.025982	2026-08-24 19:07:35.025982
438	121	6	Announcement	create	2026-08-24 19:07:35.030918	2026-08-24 19:07:35.030918
439	122	6	Announcement	create	2026-08-24 19:07:35.040913	2026-08-24 19:07:35.040913
440	123	6	Announcement	create	2026-08-24 19:07:35.045297	2026-08-24 19:07:35.045297
441	124	6	Announcement	create	2026-08-24 19:07:35.049839	2026-08-24 19:07:35.049839
442	125	6	Announcement	create	2026-08-24 19:07:35.054993	2026-08-24 19:07:35.054993
443	126	6	Announcement	create	2026-08-24 19:07:35.060759	2026-08-24 19:07:35.060759
444	127	6	Announcement	create	2026-08-24 19:07:35.065452	2026-08-24 19:07:35.065452
445	128	6	Announcement	create	2026-08-24 19:07:35.069991	2026-08-24 19:07:35.069991
446	129	6	Announcement	create	2026-08-24 19:07:35.075333	2026-08-24 19:07:35.075333
447	130	6	Announcement	create	2026-08-24 19:07:35.080007	2026-08-24 19:07:35.080007
448	131	6	Announcement	create	2026-08-24 19:07:35.084215	2026-08-24 19:07:35.084215
449	132	6	Announcement	create	2026-08-24 19:07:35.092467	2026-08-24 19:07:35.092467
450	133	6	Announcement	create	2026-08-24 19:07:35.098435	2026-08-24 19:07:35.098435
451	134	6	Announcement	create	2026-08-24 19:07:35.103666	2026-08-24 19:07:35.103666
452	135	6	Announcement	create	2026-08-24 19:07:35.110583	2026-08-24 19:07:35.110583
453	136	6	Announcement	create	2026-08-24 19:07:35.115745	2026-08-24 19:07:35.115745
454	137	6	Announcement	create	2026-08-24 19:07:35.121744	2026-08-24 19:07:35.121744
455	138	6	Announcement	create	2026-08-24 19:07:35.127612	2026-08-24 19:07:35.127612
456	139	6	Announcement	create	2026-08-24 19:07:35.133671	2026-08-24 19:07:35.133671
457	140	6	Announcement	create	2026-08-24 19:07:35.139075	2026-08-24 19:07:35.139075
458	141	6	Announcement	create	2026-08-24 19:07:35.144722	2026-08-24 19:07:35.144722
459	142	6	Announcement	create	2026-08-24 19:07:35.150644	2026-08-24 19:07:35.150644
460	143	6	Announcement	create	2026-08-24 19:07:35.1557	2026-08-24 19:07:35.1557
461	144	6	Announcement	create	2026-08-24 19:07:35.161799	2026-08-24 19:07:35.161799
462	145	6	Announcement	create	2026-08-24 19:07:35.167066	2026-08-24 19:07:35.167066
463	146	6	Announcement	create	2026-08-24 19:07:35.176411	2026-08-24 19:07:35.176411
464	147	6	Announcement	create	2026-08-24 19:07:35.181248	2026-08-24 19:07:35.181248
465	148	6	Announcement	create	2026-08-24 19:07:35.186091	2026-08-24 19:07:35.186091
466	149	6	Announcement	create	2026-08-24 19:07:35.192722	2026-08-24 19:07:35.192722
467	150	6	Announcement	create	2026-08-24 19:07:35.198477	2026-08-24 19:07:35.198477
468	151	6	Announcement	create	2026-08-24 19:07:35.203692	2026-08-24 19:07:35.203692
469	152	6	Announcement	create	2026-08-24 19:07:35.209419	2026-08-24 19:07:35.209419
470	153	6	Announcement	create	2026-08-24 19:07:35.214421	2026-08-24 19:07:35.214421
471	154	6	Announcement	create	2026-08-24 19:07:35.219722	2026-08-24 19:07:35.219722
472	155	6	Announcement	create	2026-08-24 19:07:35.225204	2026-08-24 19:07:35.225204
473	156	6	Announcement	create	2026-08-24 19:07:35.229852	2026-08-24 19:07:35.229852
474	157	6	Announcement	create	2026-08-24 19:07:35.238556	2026-08-24 19:07:35.238556
475	158	6	Announcement	create	2026-08-24 19:07:35.243691	2026-08-24 19:07:35.243691
476	159	6	Announcement	create	2026-08-24 19:07:35.249711	2026-08-24 19:07:35.249711
477	160	6	Announcement	create	2026-08-24 19:07:35.255023	2026-08-24 19:07:35.255023
478	161	6	Announcement	create	2026-08-24 19:07:35.259631	2026-08-24 19:07:35.259631
479	162	6	Announcement	create	2026-08-24 19:07:35.265033	2026-08-24 19:07:35.265033
480	163	6	Announcement	create	2026-08-24 19:07:35.26957	2026-08-24 19:07:35.26957
481	164	6	Announcement	create	2026-08-24 19:07:35.275483	2026-08-24 19:07:35.275483
482	165	6	Announcement	create	2026-08-24 19:07:35.280043	2026-08-24 19:07:35.280043
483	166	6	Announcement	create	2026-08-24 19:07:35.284442	2026-08-24 19:07:35.284442
484	167	6	Announcement	create	2026-08-24 19:07:35.290907	2026-08-24 19:07:35.290907
485	168	6	Announcement	create	2026-08-24 19:07:35.295365	2026-08-24 19:07:35.295365
486	169	6	Announcement	create	2026-08-24 19:07:35.301163	2026-08-24 19:07:35.301163
487	170	6	Announcement	create	2026-08-24 19:07:35.307136	2026-08-24 19:07:35.307136
488	171	6	Announcement	create	2026-08-24 19:07:35.316572	2026-08-24 19:07:35.316572
489	172	6	Announcement	create	2026-08-24 19:07:35.321708	2026-08-24 19:07:35.321708
490	173	6	Announcement	create	2026-08-24 19:07:35.327127	2026-08-24 19:07:35.327127
491	174	6	Announcement	create	2026-08-24 19:07:35.333811	2026-08-24 19:07:35.333811
492	175	6	Announcement	create	2026-08-24 19:07:35.339064	2026-08-24 19:07:35.339064
493	176	6	Announcement	create	2026-08-24 19:07:35.34408	2026-08-24 19:07:35.34408
494	177	6	Announcement	create	2026-08-24 19:07:35.34816	2026-08-24 19:07:35.34816
495	178	6	Announcement	create	2026-08-24 19:07:35.352399	2026-08-24 19:07:35.352399
496	179	6	Announcement	create	2026-08-24 19:07:35.357934	2026-08-24 19:07:35.357934
497	180	6	Announcement	create	2026-08-24 19:07:35.363035	2026-08-24 19:07:35.363035
498	1	7	Announcement	create	2026-08-24 19:07:35.400775	2026-08-24 19:07:35.400775
499	2	7	Announcement	create	2026-08-24 19:07:35.406451	2026-08-24 19:07:35.406451
500	5	7	Announcement	create	2026-08-24 19:07:35.411005	2026-08-24 19:07:35.411005
501	6	7	Announcement	create	2026-08-24 19:07:35.416495	2026-08-24 19:07:35.416495
502	7	7	Announcement	create	2026-08-24 19:07:35.422526	2026-08-24 19:07:35.422526
503	8	7	Announcement	create	2026-08-24 19:07:35.428225	2026-08-24 19:07:35.428225
504	9	7	Announcement	create	2026-08-24 19:07:35.433064	2026-08-24 19:07:35.433064
505	10	7	Announcement	create	2026-08-24 19:07:35.438304	2026-08-24 19:07:35.438304
506	5	8	Announcement	create	2026-08-24 19:07:35.453164	2026-08-24 19:07:35.453164
507	6	8	Announcement	create	2026-08-24 19:07:35.45965	2026-08-24 19:07:35.45965
508	7	8	Announcement	create	2026-08-24 19:07:35.465343	2026-08-24 19:07:35.465343
509	2	9	Announcement	create	2026-08-24 19:07:35.483045	2026-08-24 19:07:35.483045
510	5	9	Announcement	create	2026-08-24 19:07:35.488583	2026-08-24 19:07:35.488583
511	6	9	Announcement	create	2026-08-24 19:07:35.493284	2026-08-24 19:07:35.493284
512	7	9	Announcement	create	2026-08-24 19:07:35.497681	2026-08-24 19:07:35.497681
513	1	11	Announcement	create	2026-08-24 19:07:35.518247	2026-08-24 19:07:35.518247
514	2	11	Announcement	create	2026-08-24 19:07:35.523693	2026-08-24 19:07:35.523693
515	5	11	Announcement	create	2026-08-24 19:07:35.532001	2026-08-24 19:07:35.532001
516	6	11	Announcement	create	2026-08-24 19:07:35.537173	2026-08-24 19:07:35.537173
517	7	11	Announcement	create	2026-08-24 19:07:35.54264	2026-08-24 19:07:35.54264
518	8	11	Announcement	create	2026-08-24 19:07:35.548938	2026-08-24 19:07:35.548938
519	9	11	Announcement	create	2026-08-24 19:07:35.554795	2026-08-24 19:07:35.554795
520	10	11	Announcement	create	2026-08-24 19:07:35.561105	2026-08-24 19:07:35.561105
521	14	11	Announcement	create	2026-08-24 19:07:35.56625	2026-08-24 19:07:35.56625
522	15	11	Announcement	create	2026-08-24 19:07:35.571549	2026-08-24 19:07:35.571549
523	16	11	Announcement	create	2026-08-24 19:07:35.577515	2026-08-24 19:07:35.577515
524	17	11	Announcement	create	2026-08-24 19:07:35.581998	2026-08-24 19:07:35.581998
525	18	11	Announcement	create	2026-08-24 19:07:35.588398	2026-08-24 19:07:35.588398
526	19	11	Announcement	create	2026-08-24 19:07:35.593653	2026-08-24 19:07:35.593653
527	20	11	Announcement	create	2026-08-24 19:07:35.598893	2026-08-24 19:07:35.598893
528	21	11	Announcement	create	2026-08-24 19:07:35.605326	2026-08-24 19:07:35.605326
529	22	11	Announcement	create	2026-08-24 19:07:35.614441	2026-08-24 19:07:35.614441
530	23	11	Announcement	create	2026-08-24 19:07:35.620116	2026-08-24 19:07:35.620116
531	24	11	Announcement	create	2026-08-24 19:07:35.625767	2026-08-24 19:07:35.625767
532	25	11	Announcement	create	2026-08-24 19:07:35.630787	2026-08-24 19:07:35.630787
533	26	11	Announcement	create	2026-08-24 19:07:35.635641	2026-08-24 19:07:35.635641
534	27	11	Announcement	create	2026-08-24 19:07:35.641331	2026-08-24 19:07:35.641331
535	28	11	Announcement	create	2026-08-24 19:07:35.646568	2026-08-24 19:07:35.646568
536	29	11	Announcement	create	2026-08-24 19:07:35.651076	2026-08-24 19:07:35.651076
537	30	11	Announcement	create	2026-08-24 19:07:35.656894	2026-08-24 19:07:35.656894
538	31	11	Announcement	create	2026-08-24 19:07:35.66156	2026-08-24 19:07:35.66156
539	32	11	Announcement	create	2026-08-24 19:07:35.666289	2026-08-24 19:07:35.666289
540	33	11	Announcement	create	2026-08-24 19:07:35.675274	2026-08-24 19:07:35.675274
541	34	11	Announcement	create	2026-08-24 19:07:35.681188	2026-08-24 19:07:35.681188
542	35	11	Announcement	create	2026-08-24 19:07:35.688928	2026-08-24 19:07:35.688928
543	36	11	Announcement	create	2026-08-24 19:07:35.694309	2026-08-24 19:07:35.694309
544	37	11	Announcement	create	2026-08-24 19:07:35.70072	2026-08-24 19:07:35.70072
545	38	11	Announcement	create	2026-08-24 19:07:35.706112	2026-08-24 19:07:35.706112
546	39	11	Announcement	create	2026-08-24 19:07:35.711074	2026-08-24 19:07:35.711074
547	40	11	Announcement	create	2026-08-24 19:07:35.717816	2026-08-24 19:07:35.717816
548	41	11	Announcement	create	2026-08-24 19:07:35.723372	2026-08-24 19:07:35.723372
549	42	11	Announcement	create	2026-08-24 19:07:35.729509	2026-08-24 19:07:35.729509
550	43	11	Announcement	create	2026-08-24 19:07:35.737806	2026-08-24 19:07:35.737806
551	44	11	Announcement	create	2026-08-24 19:07:35.746505	2026-08-24 19:07:35.746505
552	45	11	Announcement	create	2026-08-24 19:07:35.755623	2026-08-24 19:07:35.755623
553	2	13	Announcement	create	2026-08-24 19:07:35.794143	2026-08-24 19:07:35.794143
554	46	13	Announcement	create	2026-08-24 19:07:35.798911	2026-08-24 19:07:35.798911
555	47	13	Announcement	create	2026-08-24 19:07:35.808152	2026-08-24 19:07:35.808152
556	49	13	Announcement	create	2026-08-24 19:07:35.816897	2026-08-24 19:07:35.816897
557	50	13	Announcement	create	2026-08-24 19:07:35.822817	2026-08-24 19:07:35.822817
558	52	13	Announcement	create	2026-08-24 19:07:35.82746	2026-08-24 19:07:35.82746
559	53	13	Announcement	create	2026-08-24 19:07:35.831691	2026-08-24 19:07:35.831691
560	54	13	Announcement	create	2026-08-24 19:07:35.836997	2026-08-24 19:07:35.836997
561	55	13	Announcement	create	2026-08-24 19:07:35.845514	2026-08-24 19:07:35.845514
562	56	13	Announcement	create	2026-08-24 19:07:35.849995	2026-08-24 19:07:35.849995
563	57	13	Announcement	create	2026-08-24 19:07:35.855808	2026-08-24 19:07:35.855808
564	2	14	Announcement	create	2026-08-24 19:07:35.87109	2026-08-24 19:07:35.87109
\.


--
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
-- Data for Name: program_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.program_translations (id, program_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:11:01.072876	2020-07-24 13:11:01.072876	BSc 100%
2	1	en	2020-07-24 13:11:01.075914	2020-07-24 13:11:01.075914	BSc 100%
3	2	de	2020-07-24 13:11:37.797744	2020-07-24 13:11:37.797744	BSc 100%
4	2	en	2020-07-24 13:11:37.800449	2020-07-24 13:11:37.800449	BSc 100%
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.programs (id, created_at, updated_at, subject_id) FROM stdin;
1	2020-07-24 13:11:01.069662	2020-07-24 13:11:01.069662	1
2	2020-07-24 13:11:37.794408	2020-07-24 13:11:37.794408	2
\.


--
-- Data for Name: quiz_certificates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quiz_certificates (id, quiz_id, user_id, code, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: readers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.readers (id, user_id, thread_id, created_at, updated_at) FROM stdin;
1	3	1	2020-09-02 09:20:23.743252	2020-09-02 09:20:23.750381
\.


--
-- Data for Name: redemptions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.redemptions (id, voucher_id, user_id, created_at, updated_at) FROM stdin;
1	8ed8a767-7faa-486c-a757-7417ffd04c3d	5	2025-07-15 12:11:14.688568	2025-07-15 12:11:14.688568
2	8ed8a767-7faa-486c-a757-7417ffd04c3d	6	2025-07-15 12:11:39.223198	2025-07-15 12:11:39.223198
3	8ed8a767-7faa-486c-a757-7417ffd04c3d	7	2025-07-15 12:11:58.999334	2025-07-15 12:11:58.999334
\.


--
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
-- Data for Name: registration_campaigns; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_campaigns (campaignable_type, campaignable_id, description, allocation_mode, status, registration_deadline, created_at, updated_at, id, last_allocation_calculated_at, allocation_decided_at) FROM stdin;
Lecture	1	Demo Lecture Roster Campaign	1	4	2026-08-31 19:07:11.610214	2026-08-24 19:07:11.63195	2026-08-24 19:07:16.306482	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.947573	2026-08-24 19:07:15.949223
Lecture	30	Demo Seminar Roster Campaign	1	4	2026-08-31 19:07:16.835092	2026-08-24 19:07:16.84092	2026-08-24 19:07:19.03269	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	2026-08-24 19:07:18.931759	2026-08-24 19:07:18.93244
Lecture	31	Stage 1: Planning	0	2	2026-08-31 19:07:30.174754	2026-08-24 19:07:30.176679	2026-08-24 19:07:31.417009	56255bd8-1718-4134-ac3b-11bef35b9c86	\N	\N
Lecture	1	Solver Test Campaign	1	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:19.047917	2026-08-24 19:07:19.106407	e8573fe3-def3-4e68-bfd2-31819dd535d8	\N	\N
Lecture	1	Cohort FCFS Campaign	0	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:24.989256	2026-08-24 19:07:25.0798	44b94de3-7f1f-402a-8c5d-9be150bafa60	\N	\N
Lecture	31	Stage 2: Allocation	1	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:31.421067	2026-08-24 19:07:31.537058	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	\N	\N
Lecture	31	Stage 3: Nachrücker (FCFS)	0	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:31.882828	2026-08-24 19:07:31.896609	612b0032-10b0-47da-a077-b5e54f8b3088	\N	\N
Lecture	32	Anmeldung zu den Übungsgruppen	0	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:32.484093	2026-08-24 19:07:32.558988	23028648-83a6-49db-a47f-f44230e96563	\N	\N
Lecture	33	Vergabe der Vortragsthemen	0	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:32.621388	2026-08-24 19:07:32.837031	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	\N	\N
Lecture	34	Anmeldung zu den Übungsgruppen	0	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:32.87083	2026-08-24 19:07:32.942386	828ec552-d8dc-4b6b-be75-9aa598dd158f	\N	\N
Lecture	35	Vergabe der Vortragsthemen	0	1	2027-08-24 19:07:33.119424	2026-08-24 19:07:32.985152	2026-08-24 19:07:33.115777	a4555537-77a4-49a3-9a99-6459bdb6f9fd	\N	\N
\.


--
-- Data for Name: registration_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_items (registerable_type, registerable_id, created_at, updated_at, id, registration_campaign_id, confirmed_registrations_count) FROM stdin;
Tutorial	2	2026-08-24 19:07:11.691148	2026-08-24 19:07:11.691148	a668a11c-b39e-4602-942c-36218eb70c59	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	10
Tutorial	3	2026-08-24 19:07:11.703696	2026-08-24 19:07:11.703696	cf2c6363-9e22-48b6-be04-5184b458b19c	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8
Tutorial	4	2026-08-24 19:07:11.713789	2026-08-24 19:07:11.713789	8344bdb1-4432-40c6-9609-d0c5520206c4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8
Tutorial	5	2026-08-24 19:07:11.721236	2026-08-24 19:07:11.721236	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	6
Talk	5	2026-08-24 19:07:16.914584	2026-08-24 19:07:16.914584	e9885503-f7af-4442-b062-5515d0a8bf5d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	6	2026-08-24 19:07:16.920823	2026-08-24 19:07:16.920823	739a1174-e350-4750-958e-a9e14ad8615a	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	7	2026-08-24 19:07:16.925819	2026-08-24 19:07:16.925819	bfdb067a-f3e7-4532-a1cf-27356150e4db	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	8	2026-08-24 19:07:16.932049	2026-08-24 19:07:16.932049	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	9	2026-08-24 19:07:16.936126	2026-08-24 19:07:16.936126	a4fc6e0e-e900-451d-812a-049ddaa3990e	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	10	2026-08-24 19:07:16.940371	2026-08-24 19:07:16.940371	76acf1d8-bc6b-4aad-9788-e803566db1ee	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	11	2026-08-24 19:07:16.943797	2026-08-24 19:07:16.943797	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	12	2026-08-24 19:07:16.947136	2026-08-24 19:07:16.947136	4e96d824-daeb-436c-b3df-ec0b98e0c30f	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	13	2026-08-24 19:07:16.951243	2026-08-24 19:07:16.951243	904504bb-ff57-4372-a203-89b6f24b66ca	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Talk	14	2026-08-24 19:07:16.955817	2026-08-24 19:07:16.955817	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	1
Tutorial	6	2026-08-24 19:07:19.073104	2026-08-24 19:07:19.073104	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	e8573fe3-def3-4e68-bfd2-31819dd535d8	0
Tutorial	7	2026-08-24 19:07:19.086112	2026-08-24 19:07:19.086112	b10acdae-8a5e-4faf-87b7-285d6dc97092	e8573fe3-def3-4e68-bfd2-31819dd535d8	0
Tutorial	8	2026-08-24 19:07:19.094781	2026-08-24 19:07:19.094781	3d40c921-c5ec-4ff9-9fd4-0c534f625275	e8573fe3-def3-4e68-bfd2-31819dd535d8	0
Tutorial	9	2026-08-24 19:07:19.102265	2026-08-24 19:07:19.102265	d8540279-3a51-4e2d-b459-c1a22ddbce85	e8573fe3-def3-4e68-bfd2-31819dd535d8	0
Tutorial	12	2026-08-24 19:07:25.032013	2026-08-24 19:07:25.032013	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	44b94de3-7f1f-402a-8c5d-9be150bafa60	8
Cohort	1	2026-08-24 19:07:25.068493	2026-08-24 19:07:25.068493	3f768664-4dc3-4062-9c1a-53494818da75	44b94de3-7f1f-402a-8c5d-9be150bafa60	5
Cohort	4	2026-08-24 19:07:31.893779	2026-08-24 19:07:31.893779	7ff2ddd9-7a40-4163-9968-7422e5976dbe	612b0032-10b0-47da-a077-b5e54f8b3088	5
Tutorial	13	2026-08-24 19:07:32.528692	2026-08-24 19:07:32.528692	3148d265-ddae-4185-bc76-0b6901f86374	23028648-83a6-49db-a47f-f44230e96563	0
Tutorial	14	2026-08-24 19:07:32.538818	2026-08-24 19:07:32.538818	1248b175-0b0b-4a43-aad1-016d1859bea5	23028648-83a6-49db-a47f-f44230e96563	0
Tutorial	15	2026-08-24 19:07:32.544999	2026-08-24 19:07:32.544999	e909bed3-8bcc-4d3a-81d9-dfc9a3d3e7d8	23028648-83a6-49db-a47f-f44230e96563	0
Tutorial	10	2026-08-24 19:07:25.016407	2026-08-24 19:07:25.016407	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	44b94de3-7f1f-402a-8c5d-9be150bafa60	12
Tutorial	16	2026-08-24 19:07:32.552971	2026-08-24 19:07:32.552971	64b1b87c-11be-4658-9200-47fb91da722f	23028648-83a6-49db-a47f-f44230e96563	0
Talk	27	2026-08-24 19:07:32.779699	2026-08-24 19:07:32.779699	59c7333c-047e-485c-9147-eb7afd04e8b2	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Talk	28	2026-08-24 19:07:32.786727	2026-08-24 19:07:32.786727	cf0642d2-c886-4753-a7e8-49f5517da280	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Talk	29	2026-08-24 19:07:32.792116	2026-08-24 19:07:32.792116	6a5ccfbb-6805-4192-902b-8a819ea56510	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Talk	30	2026-08-24 19:07:32.798179	2026-08-24 19:07:32.798179	07efefe4-ccd3-4318-b129-56204451a9b6	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Talk	31	2026-08-24 19:07:32.812612	2026-08-24 19:07:32.812612	398c2c20-693c-4ea3-a94a-88a3ac7e4188	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Talk	32	2026-08-24 19:07:32.819854	2026-08-24 19:07:32.819854	c2054a69-ba6b-4d1f-9ffd-e64ba0dc2b8d	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Cohort	2	2026-08-24 19:07:25.075791	2026-08-24 19:07:25.075791	129344e5-5434-4c03-b243-ad6554c13b3f	44b94de3-7f1f-402a-8c5d-9be150bafa60	12
Tutorial	11	2026-08-24 19:07:25.023198	2026-08-24 19:07:25.023198	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	44b94de3-7f1f-402a-8c5d-9be150bafa60	10
Talk	33	2026-08-24 19:07:32.825741	2026-08-24 19:07:32.825741	24e86fb9-f2e9-42c3-a06a-f91fe750fda4	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Talk	34	2026-08-24 19:07:32.831164	2026-08-24 19:07:32.831164	eb1867c1-4650-4bb7-98fd-6faf4f29fcf3	ee9768a2-7fb7-4f5b-b2f4-d94264e5fa72	0
Tutorial	17	2026-08-24 19:07:32.918755	2026-08-24 19:07:32.918755	a32fa23a-25b0-4671-80cb-48021ba09681	828ec552-d8dc-4b6b-be75-9aa598dd158f	0
Tutorial	18	2026-08-24 19:07:32.924585	2026-08-24 19:07:32.924585	d6090d50-4eaf-46cb-9b83-5a74234f4e6d	828ec552-d8dc-4b6b-be75-9aa598dd158f	0
Tutorial	19	2026-08-24 19:07:32.93159	2026-08-24 19:07:32.93159	d430d2bf-678a-4cdc-bdfd-7f4aa755c075	828ec552-d8dc-4b6b-be75-9aa598dd158f	0
Tutorial	20	2026-08-24 19:07:32.937848	2026-08-24 19:07:32.937848	623a39f3-7445-4be6-9dab-b48fb893cfdb	828ec552-d8dc-4b6b-be75-9aa598dd158f	0
Talk	35	2026-08-24 19:07:33.065174	2026-08-24 19:07:33.065174	4a365196-34be-4c6e-91e7-78bf0e698866	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Talk	36	2026-08-24 19:07:33.072149	2026-08-24 19:07:33.072149	1ae05d6e-b5e1-4483-aa97-7b67ede4f5ca	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Talk	37	2026-08-24 19:07:33.077514	2026-08-24 19:07:33.077514	914cec78-a474-4162-9f33-df8fad8d5ea5	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Talk	38	2026-08-24 19:07:33.084387	2026-08-24 19:07:33.084387	31b73581-f7a9-47bd-88ca-c5ebf3e2b7a9	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Talk	39	2026-08-24 19:07:33.090845	2026-08-24 19:07:33.090845	d7ae8b16-101f-4cbb-bc73-ef002ce935e5	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Talk	40	2026-08-24 19:07:33.096529	2026-08-24 19:07:33.096529	4bab37f7-966e-4b6d-91db-4204f5f5000a	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Cohort	3	2026-08-24 19:07:30.182987	2026-08-24 19:07:30.182987	30f8b845-45b7-44d7-975b-99a0988e627f	56255bd8-1718-4134-ac3b-11bef35b9c86	12
Talk	15	2026-08-24 19:07:31.446875	2026-08-24 19:07:31.446875	a1fd3322-1289-43d1-9f24-3811388c29a5	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	16	2026-08-24 19:07:31.456945	2026-08-24 19:07:31.456945	485c7b31-9a4f-471c-a21f-72bcf9683b5a	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	17	2026-08-24 19:07:31.464611	2026-08-24 19:07:31.464611	77a517f0-bcc8-4523-813d-82801d86a999	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	18	2026-08-24 19:07:31.472536	2026-08-24 19:07:31.472536	c6308b6a-c52c-4bc5-a2c0-e69b80d7c6e2	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	19	2026-08-24 19:07:31.479779	2026-08-24 19:07:31.479779	f021a725-7b48-4a66-b0b3-875050c40435	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	20	2026-08-24 19:07:31.489385	2026-08-24 19:07:31.489385	d5fe8d66-7385-4d09-a43e-71d6d66fe385	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	21	2026-08-24 19:07:31.497262	2026-08-24 19:07:31.497262	ea2440ba-5d0f-4b31-a10f-61de4ea6f52e	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	22	2026-08-24 19:07:31.50454	2026-08-24 19:07:31.50454	23ef98c1-a1b5-4d7b-a983-25f3dd277dd4	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	23	2026-08-24 19:07:31.510765	2026-08-24 19:07:31.510765	84d9f571-eb93-4286-a674-93ed10d293c4	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	24	2026-08-24 19:07:31.517107	2026-08-24 19:07:31.517107	12701cbf-ba67-4645-ade2-15cc0b5129a2	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	25	2026-08-24 19:07:31.524577	2026-08-24 19:07:31.524577	addfef10-22a4-4400-8d3d-c8784dd039e2	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	26	2026-08-24 19:07:31.530489	2026-08-24 19:07:31.530489	0a47eeef-b76d-4951-8b31-780c59e8b627	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0
Talk	41	2026-08-24 19:07:33.103304	2026-08-24 19:07:33.103304	f2ee1e2a-71be-4308-8899-e60ce6fed7a1	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
Talk	42	2026-08-24 19:07:33.108687	2026-08-24 19:07:33.108687	40b7fecc-f621-4472-b172-8b42afe86adf	a4555537-77a4-49a3-9a99-6459bdb6f9fd	0
\.


--
-- Data for Name: registration_policies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_policies (kind, phase, "position", active, config, created_at, updated_at, id, registration_campaign_id) FROM stdin;
0	1	1	t	{"allowed_domains": "mampf.edu"}	2026-08-24 19:07:16.978708	2026-08-24 19:07:16.978708	54a1602b-1b00-4126-94f3-533830abc436	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
0	1	1	t	{"allowed_domains": "example.com"}	2026-08-24 19:07:25.002015	2026-08-24 19:07:25.002015	c8b57299-2415-47e1-a919-1e9eff2213db	44b94de3-7f1f-402a-8c5d-9be150bafa60
1	1	1	t	{"prerequisite_campaign_id": "56255bd8-1718-4134-ac3b-11bef35b9c86"}	2026-08-24 19:07:31.426922	2026-08-24 19:07:31.426922	554f38c7-76cf-400a-873e-389008a66d7d	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e
\.


--
-- Data for Name: registration_student_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_student_messages (id, lecture_id, sender_id, subject, body, attachment_data, recipient_emails, recipients_count, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: registration_user_registrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.registration_user_registrations (user_id, preference_rank, status, created_at, updated_at, id, registration_campaign_id, registration_item_id, materialized_at, exclusive_assignment, rejection_reason_type, rejection_reason_code, rejection_reason_label, rejected_at, rejection_overridden_at, rejection_policy_id) FROM stdin;
14	2	2	2026-08-24 19:07:15.203023	2026-08-24 19:07:16.05889	328c2cc8-4d76-4302-9d30-ac6d7c3b95ba	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
14	3	2	2026-08-24 19:07:15.207845	2026-08-24 19:07:16.05889	2e731986-4773-4fff-8d96-630dd7dc0456	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
14	4	2	2026-08-24 19:07:15.211297	2026-08-24 19:07:16.05889	fe0fab9d-b9fb-4098-bc1e-660fb9d09fc6	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
15	2	2	2026-08-24 19:07:15.219552	2026-08-24 19:07:16.05889	208cd6a8-b692-4588-b2f7-4e6f73cc5710	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
15	3	2	2026-08-24 19:07:15.223554	2026-08-24 19:07:16.05889	820a0cfd-e37f-46fb-a4b9-fa127b134e4c	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
15	4	2	2026-08-24 19:07:15.22757	2026-08-24 19:07:16.05889	99975924-aca7-4f25-ad43-967911130491	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
16	2	2	2026-08-24 19:07:15.234821	2026-08-24 19:07:16.05889	5da5af92-020f-4b7c-ab22-fcce0266e909	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
16	3	2	2026-08-24 19:07:15.238104	2026-08-24 19:07:16.05889	03ea0f13-6441-45c4-a56c-61b7119b3755	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
16	4	2	2026-08-24 19:07:15.243324	2026-08-24 19:07:16.05889	caab3929-cb3b-4692-b1f2-7df1a9f0d4ab	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
17	2	2	2026-08-24 19:07:15.25433	2026-08-24 19:07:16.05889	b2299abc-f431-418e-9d26-d3a2fbad4a88	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
17	3	2	2026-08-24 19:07:15.257888	2026-08-24 19:07:16.05889	cdcdd1ce-54aa-4a6c-bf70-7f8e379091ee	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
14	1	1	2026-08-24 19:07:15.189482	2026-08-24 19:07:15.928034	c60a6e9a-ddd3-4128-a684-9586166aff93	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
21	1	1	2026-08-24 19:07:15.327475	2026-08-24 19:07:15.928034	4d99e7d8-a71d-4e70-b1ec-fd19f38e7169	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
25	1	1	2026-08-24 19:07:15.394767	2026-08-24 19:07:15.928034	b0b414e8-8a54-45e9-9486-3162c11cf5c6	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
28	1	1	2026-08-24 19:07:15.45673	2026-08-24 19:07:15.928034	9787c4bc-df9f-430a-af00-90b683794f41	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
30	4	2	2026-08-24 19:07:15.492262	2026-08-24 19:07:16.05889	2894335f-eae8-43a5-b2e3-61cb0916a7b4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
31	1	2	2026-08-24 19:07:15.496004	2026-08-24 19:07:16.05889	624b8e99-4752-448a-8309-f58ac6231bdf	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
31	3	2	2026-08-24 19:07:15.501785	2026-08-24 19:07:16.05889	ae6760f3-09b1-4fa6-8e90-116121137b86	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
31	4	2	2026-08-24 19:07:15.504191	2026-08-24 19:07:16.05889	c4a65d2c-fe4b-463d-941a-ddd5265e358a	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
32	2	2	2026-08-24 19:07:15.509377	2026-08-24 19:07:16.05889	85afc9b8-2e1b-40e8-b6ce-ec48e49365cb	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
32	3	2	2026-08-24 19:07:15.512969	2026-08-24 19:07:16.05889	c0523003-518e-4b3e-8e37-63d962057ee6	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
32	4	2	2026-08-24 19:07:15.51774	2026-08-24 19:07:16.05889	f62d0f10-ba2b-484f-ab37-60f496a16391	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
29	1	1	2026-08-24 19:07:15.469146	2026-08-24 19:07:15.928034	8585fb50-46ed-4c00-9baf-d94caa9f6d9f	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
30	1	1	2026-08-24 19:07:15.483861	2026-08-24 19:07:15.928034	26c1dd3c-1677-4920-a075-779258deea76	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
32	1	1	2026-08-24 19:07:15.507069	2026-08-24 19:07:15.928034	693e06f1-09e9-4695-877f-13b8bd577754	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
35	2	1	2026-08-24 19:07:15.56555	2026-08-24 19:07:15.928034	09f3204e-20ba-4f00-9aff-799a48a392d6	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	2026-08-24 19:07:16.027454	f	\N	\N	\N	\N	\N	\N
16	1	1	2026-08-24 19:07:15.231718	2026-08-24 19:07:15.934074	f38aaa64-53e7-42e2-b52e-f0ea374ab0e2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	2026-08-24 19:07:16.040465	f	\N	\N	\N	\N	\N	\N
18	1	1	2026-08-24 19:07:15.266704	2026-08-24 19:07:15.934074	6cade63f-f42b-40f0-820c-64f7d2366943	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	2026-08-24 19:07:16.040465	f	\N	\N	\N	\N	\N	\N
34	1	1	2026-08-24 19:07:15.552822	2026-08-24 19:07:15.934074	d951ecb4-e479-4988-a8db-9bf965a9b956	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	2026-08-24 19:07:16.040465	f	\N	\N	\N	\N	\N	\N
36	1	1	2026-08-24 19:07:15.572651	2026-08-24 19:07:15.934074	05b09d75-761d-434a-90b4-786662d8cc36	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	2026-08-24 19:07:16.040465	f	\N	\N	\N	\N	\N	\N
41	1	1	2026-08-24 19:07:15.626235	2026-08-24 19:07:15.934074	3a9e0cb1-322c-4d88-b127-79b4960d85e8	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	2026-08-24 19:07:16.040465	f	\N	\N	\N	\N	\N	\N
43	1	1	2026-08-24 19:07:15.646804	2026-08-24 19:07:15.934074	894cb8fa-aaf3-4ab1-99d4-58431e2cd1ec	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	2026-08-24 19:07:16.040465	f	\N	\N	\N	\N	\N	\N
15	1	1	2026-08-24 19:07:15.215356	2026-08-24 19:07:15.9318	a29cb401-da7a-479b-9e70-e18492483a78	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
19	1	1	2026-08-24 19:07:15.292013	2026-08-24 19:07:15.9318	3a5852ed-c523-4a22-932f-a2f274becc90	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
20	1	1	2026-08-24 19:07:15.304854	2026-08-24 19:07:15.9318	3796c526-2cff-4fea-9974-88cc59b00244	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
26	1	1	2026-08-24 19:07:15.41917	2026-08-24 19:07:15.9318	f7816cbc-57ff-4d87-9216-b4c21c049d91	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
31	2	1	2026-08-24 19:07:15.499165	2026-08-24 19:07:15.9318	088d7f65-94a0-4ef3-99a6-a86b00079003	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
33	1	1	2026-08-24 19:07:15.520435	2026-08-24 19:07:15.9318	7f69b433-64b0-4587-89f3-d2c40416bad7	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
37	1	1	2026-08-24 19:07:15.584041	2026-08-24 19:07:15.9318	1f149f3f-f3db-4f5f-8709-c5f534a74df3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
38	1	1	2026-08-24 19:07:15.593614	2026-08-24 19:07:15.9318	dd664e29-5e57-4695-b48e-d1a811effebb	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
42	1	1	2026-08-24 19:07:15.635963	2026-08-24 19:07:15.9318	c3f1544a-d304-4238-98f7-4a9aaff58e6e	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
44	1	1	2026-08-24 19:07:15.661295	2026-08-24 19:07:15.9318	d524675e-7dac-41f8-b558-8d86e5abb125	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	2026-08-24 19:07:16.048969	f	\N	\N	\N	\N	\N	\N
17	1	1	2026-08-24 19:07:15.248952	2026-08-24 19:07:15.935221	a4b4559d-e853-4b3c-8b69-f74945118564	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
22	1	1	2026-08-24 19:07:15.346917	2026-08-24 19:07:15.935221	ae20655d-40ec-47de-8e63-762084535653	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
23	1	1	2026-08-24 19:07:15.366364	2026-08-24 19:07:15.935221	cd7355fd-6980-4d43-b590-b97f1ecbd579	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
24	1	1	2026-08-24 19:07:15.380375	2026-08-24 19:07:15.935221	6d493a6b-53d4-4726-8e96-f825818fd1c2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
27	1	1	2026-08-24 19:07:15.443308	2026-08-24 19:07:15.935221	4a454788-e875-41e6-818d-7f95433a4d0a	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
39	1	1	2026-08-24 19:07:15.604838	2026-08-24 19:07:15.935221	6ecf3c51-3e86-4627-bb8d-84cd5e6ee6a5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
40	1	1	2026-08-24 19:07:15.616654	2026-08-24 19:07:15.935221	b659c77e-2ad6-42b4-ac28-7d0c58c3edaa	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
45	2	1	2026-08-24 19:07:15.673004	2026-08-24 19:07:15.935221	0fbc827f-2ed3-4231-bba8-698b3159ffec	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	2026-08-24 19:07:16.057714	f	\N	\N	\N	\N	\N	\N
17	4	2	2026-08-24 19:07:15.26061	2026-08-24 19:07:16.05889	7bc06997-aa74-459f-9262-2906c548d06c	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
18	2	2	2026-08-24 19:07:15.27033	2026-08-24 19:07:16.05889	4d1fd402-156e-4adc-a237-1b94d425b268	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
18	3	2	2026-08-24 19:07:15.273819	2026-08-24 19:07:16.05889	cc1b5594-b714-4334-b71a-72156522e152	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
18	4	2	2026-08-24 19:07:15.279557	2026-08-24 19:07:16.05889	60a8bddf-4c25-4a24-a8f7-c3dbfac98c54	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
19	2	2	2026-08-24 19:07:15.296119	2026-08-24 19:07:16.05889	74a20314-130e-4752-bf96-8bd7234f35ce	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
19	3	2	2026-08-24 19:07:15.299228	2026-08-24 19:07:16.05889	ceeeaa1e-c604-406d-affb-da10514d8fb3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
19	4	2	2026-08-24 19:07:15.301976	2026-08-24 19:07:16.05889	4417a8a4-d7d8-4b45-af39-ecb24f0ffc76	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
20	2	2	2026-08-24 19:07:15.310211	2026-08-24 19:07:16.05889	51982dbb-a1d8-4d99-8425-eb7e3a653605	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
20	3	2	2026-08-24 19:07:15.318182	2026-08-24 19:07:16.05889	7b411e2a-3e21-4252-9a49-59a524d2a11d	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
20	4	2	2026-08-24 19:07:15.322179	2026-08-24 19:07:16.05889	c8f0b032-e7cf-40fa-8f5e-8a7081a74e1e	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
21	2	2	2026-08-24 19:07:15.332852	2026-08-24 19:07:16.05889	d31aa7eb-bfab-4b14-85f5-153672e84358	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
21	3	2	2026-08-24 19:07:15.336094	2026-08-24 19:07:16.05889	571ad99c-36da-44b4-b23e-316af1e3a210	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
21	4	2	2026-08-24 19:07:15.34063	2026-08-24 19:07:16.05889	d3496cdf-f2e9-4d18-b87d-0775a8eed630	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
22	2	2	2026-08-24 19:07:15.350587	2026-08-24 19:07:16.05889	32af4a4d-081e-4352-92cd-564f87d8fde3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
22	3	2	2026-08-24 19:07:15.357065	2026-08-24 19:07:16.05889	2bef51e7-5f43-43e6-ad6a-c7f8afe927a3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
22	4	2	2026-08-24 19:07:15.362577	2026-08-24 19:07:16.05889	6b4eca91-2eed-4ada-ae65-fea52558e263	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
23	2	2	2026-08-24 19:07:15.368847	2026-08-24 19:07:16.05889	227cb9d0-9e94-4372-87ee-3a7b8efa1e6a	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
23	3	2	2026-08-24 19:07:15.372197	2026-08-24 19:07:16.05889	18531b67-c5ce-435e-b76f-6a551fc64a9d	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
23	4	2	2026-08-24 19:07:15.37659	2026-08-24 19:07:16.05889	644eef2e-08e4-42e9-b979-0e7156e35332	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
24	2	2	2026-08-24 19:07:15.384264	2026-08-24 19:07:16.05889	88373548-1fb3-4d90-9b8e-392be2e5627a	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
24	3	2	2026-08-24 19:07:15.387155	2026-08-24 19:07:16.05889	11929c64-037e-4c00-baca-966f05234abc	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
24	4	2	2026-08-24 19:07:15.390848	2026-08-24 19:07:16.05889	fa8257dc-8a77-4378-986a-602cee55f517	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
25	2	2	2026-08-24 19:07:15.398765	2026-08-24 19:07:16.05889	395e6ab2-a18a-471b-88a5-93a950b87fe1	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
25	3	2	2026-08-24 19:07:15.406623	2026-08-24 19:07:16.05889	df005a49-3439-4c6d-846e-e0df7692fdb9	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
25	4	2	2026-08-24 19:07:15.415038	2026-08-24 19:07:16.05889	1992d8ce-264c-4794-8454-3b0c67710908	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
26	2	2	2026-08-24 19:07:15.42232	2026-08-24 19:07:16.05889	5b6544f5-a017-4678-bcf1-4cfef1a8b481	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
26	3	2	2026-08-24 19:07:15.42855	2026-08-24 19:07:16.05889	62122783-a433-4986-84c3-68853e9efd6b	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
26	4	2	2026-08-24 19:07:15.43267	2026-08-24 19:07:16.05889	e4ed8d71-3efb-4a4f-930a-ee2406efc7d9	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
27	2	2	2026-08-24 19:07:15.447689	2026-08-24 19:07:16.05889	a73c55df-0605-43ca-a4c7-d0fd4972dc43	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
27	3	2	2026-08-24 19:07:15.450964	2026-08-24 19:07:16.05889	b8357739-5816-47ae-ac33-4a0b4c66136e	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
27	4	2	2026-08-24 19:07:15.45394	2026-08-24 19:07:16.05889	8b32e85a-93cf-4810-a911-675016874e02	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
28	2	2	2026-08-24 19:07:15.459256	2026-08-24 19:07:16.05889	fe2585b4-92fb-455d-b428-f7b8b5972350	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
28	3	2	2026-08-24 19:07:15.462812	2026-08-24 19:07:16.05889	f4859add-f014-4545-b828-5d6564efeff9	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
28	4	2	2026-08-24 19:07:15.466486	2026-08-24 19:07:16.05889	e14d51f1-679f-45d1-a3ff-c907c34f884b	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
29	2	2	2026-08-24 19:07:15.471424	2026-08-24 19:07:16.05889	d55bf98c-7899-46c7-a97d-87e8779fa3e2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
29	3	2	2026-08-24 19:07:15.473795	2026-08-24 19:07:16.05889	de14a790-36bc-45e8-9bd6-8cd51f853eb0	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
29	4	2	2026-08-24 19:07:15.480535	2026-08-24 19:07:16.05889	2b49104f-2ef4-4eb2-876c-259e53288c77	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
30	2	2	2026-08-24 19:07:15.486388	2026-08-24 19:07:16.05889	18c46bc0-2ba3-4c2e-942a-b62a50cb22bd	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
30	3	2	2026-08-24 19:07:15.489741	2026-08-24 19:07:16.05889	ab51ace3-1a86-4022-a3b8-b1d3f9dad956	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
33	2	2	2026-08-24 19:07:15.524489	2026-08-24 19:07:16.05889	ed6845a7-ab75-4d0c-8c0b-d76ce8b33e73	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
33	3	2	2026-08-24 19:07:15.532494	2026-08-24 19:07:16.05889	b026e669-d962-44af-a852-a85d4c8885f5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
33	4	2	2026-08-24 19:07:15.549982	2026-08-24 19:07:16.05889	ab108710-d23e-4fdd-ac90-c2c0015b5644	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
34	2	2	2026-08-24 19:07:15.555096	2026-08-24 19:07:16.05889	161acf01-de42-44f3-ae55-569e4a91f76b	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
34	3	2	2026-08-24 19:07:15.557322	2026-08-24 19:07:16.05889	d1e621af-8533-4757-9c74-7b300487cddf	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
34	4	2	2026-08-24 19:07:15.559644	2026-08-24 19:07:16.05889	4f2a6863-541f-405c-92e7-7390a05a2029	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
35	1	2	2026-08-24 19:07:15.562409	2026-08-24 19:07:16.05889	5d9ba242-7556-4a7f-abbf-b9a7f35ba8ea	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
35	3	2	2026-08-24 19:07:15.568133	2026-08-24 19:07:16.05889	5d51e31c-b413-48e2-b88f-5671c5fd0a89	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
35	4	2	2026-08-24 19:07:15.570429	2026-08-24 19:07:16.05889	ad3fd7a0-860e-44cf-9662-43fbf0992cd0	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
36	2	2	2026-08-24 19:07:15.574911	2026-08-24 19:07:16.05889	b3ac7054-9174-4320-94b6-500abfeaadc7	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
36	3	2	2026-08-24 19:07:15.577903	2026-08-24 19:07:16.05889	2ce39f5e-43ed-461e-9b0e-5771a3a03e6f	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
36	4	2	2026-08-24 19:07:15.581151	2026-08-24 19:07:16.05889	b8167464-4c6c-4da0-90f1-9560442ced7c	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
37	2	2	2026-08-24 19:07:15.586431	2026-08-24 19:07:16.05889	4e26ef97-c2c4-4576-a3db-9e44a234ee1d	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
37	3	2	2026-08-24 19:07:15.588682	2026-08-24 19:07:16.05889	4a39c64e-d993-4378-a6d7-0ac532c71ce8	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
37	4	2	2026-08-24 19:07:15.590969	2026-08-24 19:07:16.05889	f8ef8cfb-b84c-4dea-9bae-683e64d3adf8	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
38	2	2	2026-08-24 19:07:15.596726	2026-08-24 19:07:16.05889	d5fe2d08-ecad-4127-8dd0-4eb24ae0fc89	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
38	3	2	2026-08-24 19:07:15.599295	2026-08-24 19:07:16.05889	11535e7f-f5f2-4368-afac-ec44117088cb	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
38	4	2	2026-08-24 19:07:15.601915	2026-08-24 19:07:16.05889	e58ae001-7d94-4ec5-8e9a-ca59f0959fa0	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
39	2	2	2026-08-24 19:07:15.607629	2026-08-24 19:07:16.05889	efb444d7-102c-493c-8b6e-33ec33743dff	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
39	3	2	2026-08-24 19:07:15.610961	2026-08-24 19:07:16.05889	93259e69-74a9-4392-be68-32b839819502	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
39	4	2	2026-08-24 19:07:15.614042	2026-08-24 19:07:16.05889	f08b4890-a04d-495e-a54b-e00ac93e56f1	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
40	2	2	2026-08-24 19:07:15.618928	2026-08-24 19:07:16.05889	63e6db87-f60f-4967-91ed-8409eba0d1e2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
40	3	2	2026-08-24 19:07:15.621342	2026-08-24 19:07:16.05889	7eb7f10e-8fa3-4684-9128-5dd4cd8907d8	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
40	4	2	2026-08-24 19:07:15.623676	2026-08-24 19:07:16.05889	404e2d66-3529-40a7-bd01-a5abcc1eca56	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
41	2	2	2026-08-24 19:07:15.629008	2026-08-24 19:07:16.05889	1077ae57-fda0-4cb3-90df-955b1042a6d7	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
41	3	2	2026-08-24 19:07:15.631395	2026-08-24 19:07:16.05889	46329f1c-659a-4fcd-9c4c-f2441a1d4775	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
41	4	2	2026-08-24 19:07:15.633723	2026-08-24 19:07:16.05889	d86a61fb-9b9c-47b0-af55-197f8d55db86	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
42	2	2	2026-08-24 19:07:15.638187	2026-08-24 19:07:16.05889	c800907b-af2e-4e9d-ac83-96cf340a6d5b	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
42	3	2	2026-08-24 19:07:15.640493	2026-08-24 19:07:16.05889	6590f65a-614e-495f-a2f3-cc4f3f4d1e31	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
42	4	2	2026-08-24 19:07:15.643783	2026-08-24 19:07:16.05889	f3516b0a-ea8e-4ed1-a86c-6c41f9cf8353	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
43	2	2	2026-08-24 19:07:15.650224	2026-08-24 19:07:16.05889	6f5b48d6-c507-4108-a15b-082b67c04536	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
43	3	2	2026-08-24 19:07:15.652819	2026-08-24 19:07:16.05889	a1061b21-c558-4f63-b157-73ef86758880	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
43	4	2	2026-08-24 19:07:15.657955	2026-08-24 19:07:16.05889	9ccecd36-6085-408a-b942-3edca89f3f5e	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
44	2	2	2026-08-24 19:07:15.663973	2026-08-24 19:07:16.05889	1b53c41d-d48f-4877-b635-6fb324ba78a0	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
44	3	2	2026-08-24 19:07:15.666333	2026-08-24 19:07:16.05889	fe5a7cbc-db7c-40a6-aebe-bd8329422860	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
44	4	2	2026-08-24 19:07:15.668595	2026-08-24 19:07:16.05889	a8435510-4bc6-4984-a944-133310302486	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	cf2c6363-9e22-48b6-be04-5184b458b19c	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
45	1	2	2026-08-24 19:07:15.670796	2026-08-24 19:07:16.05889	f0cfbe7b-ea05-4a90-844d-7239636720a7	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8dc59aa1-8cf9-4f26-8a3f-0121466c8d90	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
45	3	2	2026-08-24 19:07:15.675217	2026-08-24 19:07:16.05889	3a4682d7-c8fc-4713-8459-1d669fa49bd0	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	a668a11c-b39e-4602-942c-36218eb70c59	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
45	4	2	2026-08-24 19:07:15.678594	2026-08-24 19:07:16.05889	7b9b0670-4bba-4115-a4a0-49e06163108b	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	8344bdb1-4432-40c6-9609-d0c5520206c4	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:16.05889	\N	\N
46	2	2	2026-08-24 19:07:18.406095	2026-08-24 19:07:19.023534	4b1e1d52-4855-4b8a-a153-e3ad5b93fd0a	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	3	2	2026-08-24 19:07:18.409281	2026-08-24 19:07:19.023534	2b8f7585-759c-4550-bca7-c884426c510d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	4	2	2026-08-24 19:07:18.412126	2026-08-24 19:07:19.023534	a4104aa3-c719-4329-9927-c8028bab95ec	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	5	2	2026-08-24 19:07:18.414623	2026-08-24 19:07:19.023534	c1a12c2a-dcf0-4f78-b9bd-f9aafd6ce8f2	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	6	2	2026-08-24 19:07:18.416951	2026-08-24 19:07:19.023534	4b6843d9-dacf-46a7-b10c-d18b42ccfa41	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	7	2	2026-08-24 19:07:18.419592	2026-08-24 19:07:19.023534	c7a6d147-0edc-47fc-a5b4-6e661ea00465	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	8	2	2026-08-24 19:07:18.423185	2026-08-24 19:07:19.023534	c99cacfe-b609-40ac-9368-5425b0dbd891	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	9	2	2026-08-24 19:07:18.426683	2026-08-24 19:07:19.023534	9598530b-0154-421b-bc0e-75af3e8cfd85	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
46	10	2	2026-08-24 19:07:18.429194	2026-08-24 19:07:19.023534	edd6db0a-a6ef-4d85-ab08-752439072e8d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	2	2	2026-08-24 19:07:18.433803	2026-08-24 19:07:19.023534	57e9c0c6-46de-49ff-b15e-3905cd8a68a7	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	3	2	2026-08-24 19:07:18.436428	2026-08-24 19:07:19.023534	b65496cd-7344-4fd0-8ae9-726697d908b6	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	4	2	2026-08-24 19:07:18.43982	2026-08-24 19:07:19.023534	2a49498b-c44a-48ac-bf63-5488f1af1f2e	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	6	2	2026-08-24 19:07:18.615239	2026-08-24 19:07:19.023534	ec10e66f-5f27-4c4d-b66c-49966131bc67	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	7	2	2026-08-24 19:07:18.617905	2026-08-24 19:07:19.023534	277264ec-ca31-44c8-8d63-54e1af318ca1	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	8	2	2026-08-24 19:07:18.621081	2026-08-24 19:07:19.023534	1cbd0395-0b21-4b94-a943-10968949b825	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	9	2	2026-08-24 19:07:18.625082	2026-08-24 19:07:19.023534	be299a04-8777-439c-a4b0-deede8894796	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	10	2	2026-08-24 19:07:18.62834	2026-08-24 19:07:19.023534	d53bc2c9-1510-493e-98cd-825c5ddef3be	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	1	2	2026-08-24 19:07:18.631284	2026-08-24 19:07:19.023534	52329fd1-bc10-4bd0-9753-61e44d39ee25	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	3	2	2026-08-24 19:07:18.637176	2026-08-24 19:07:19.023534	9b441d98-c1ce-410a-8a49-12b7eaf909f5	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	4	2	2026-08-24 19:07:18.640545	2026-08-24 19:07:19.023534	ab08261d-d4e2-4033-b63d-5f8cccddda89	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	5	2	2026-08-24 19:07:18.643192	2026-08-24 19:07:19.023534	968e51b0-5a58-4040-aaa6-fb26cd58fda9	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	6	2	2026-08-24 19:07:18.645552	2026-08-24 19:07:19.023534	7b958d07-d185-41ff-b5e4-b05261860687	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	7	2	2026-08-24 19:07:18.648334	2026-08-24 19:07:19.023534	42931f0e-7438-4cde-8761-6f339726fb7a	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	8	2	2026-08-24 19:07:18.651142	2026-08-24 19:07:19.023534	64fd223d-f710-4056-80d9-dbe886e843d4	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	9	2	2026-08-24 19:07:18.65443	2026-08-24 19:07:19.023534	7dc14e15-27ac-47e7-8c62-f8981c40c008	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
54	10	2	2026-08-24 19:07:18.657615	2026-08-24 19:07:19.023534	e80bc90c-1621-42da-9997-e9af841c5083	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	1	2	2026-08-24 19:07:18.6605	2026-08-24 19:07:19.023534	48a7b9bb-d850-47a5-bceb-a5acd50b1a47	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
58	1	2	2026-08-24 19:07:18.747426	2026-08-24 19:07:18.854554	e6df5432-1fdd-4799-8293-82e28c13605d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	2	2	2026-08-24 19:07:18.750156	2026-08-24 19:07:18.860705	c1433001-2174-444a-8b2d-8487cdf6db57	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	3	2	2026-08-24 19:07:18.752652	2026-08-24 19:07:18.862361	f459aadc-bc3d-47c1-9f1a-35b4f8d34339	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	4	2	2026-08-24 19:07:18.754977	2026-08-24 19:07:18.864745	89bcce78-c8c8-45e0-a723-318958023da3	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	5	2	2026-08-24 19:07:18.757995	2026-08-24 19:07:18.866214	93e128ae-207f-496f-a84b-cb78c8fbd6ea	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	6	2	2026-08-24 19:07:18.761453	2026-08-24 19:07:18.867623	b5be7cbe-3a0d-4b21-bf95-b4a3e4b5fea2	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	7	2	2026-08-24 19:07:18.764341	2026-08-24 19:07:18.869683	1a7af724-05a8-4c3a-a1f5-d6e802ac3bd8	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	8	2	2026-08-24 19:07:18.766697	2026-08-24 19:07:18.872157	9096f856-6d4a-49d3-af71-ea29ba4efe8e	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	9	2	2026-08-24 19:07:18.769173	2026-08-24 19:07:18.874816	95831fb2-621c-49da-9650-0551ed2f94cc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
58	10	2	2026-08-24 19:07:18.771608	2026-08-24 19:07:18.876798	1dc683eb-3ef8-4e2d-9c31-a4c3dcca0208	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	1	2	2026-08-24 19:07:18.774935	2026-08-24 19:07:18.878834	9f651f5f-d35e-41a5-bf4e-2b9c69e15185	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	2	2	2026-08-24 19:07:18.778083	2026-08-24 19:07:18.880423	1312a197-3f4b-4296-8439-847fd2aaa998	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	3	2	2026-08-24 19:07:18.780608	2026-08-24 19:07:18.883861	bf7fcc59-e726-4c4e-8705-58f6900eed21	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	4	2	2026-08-24 19:07:18.782915	2026-08-24 19:07:18.885607	e70f5384-1da8-408a-828d-77f1ed2e5b32	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	5	2	2026-08-24 19:07:18.785309	2026-08-24 19:07:18.887295	5b6f9e5f-7c49-45f5-a263-be291b94ffbc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	6	2	2026-08-24 19:07:18.787843	2026-08-24 19:07:18.889343	40382bc2-afb4-42c2-88e1-27531c01c972	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	7	2	2026-08-24 19:07:18.79089	2026-08-24 19:07:18.892299	a2b19027-2cdc-4b64-8d68-b7f3bfbcc68f	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	8	2	2026-08-24 19:07:18.793999	2026-08-24 19:07:18.894295	cd8e6909-1953-4f3a-82ae-e1cdb67e255b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	9	2	2026-08-24 19:07:18.796771	2026-08-24 19:07:18.895682	416fd9ca-5bc9-41fa-aa35-1e535d811bc6	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
59	10	2	2026-08-24 19:07:18.800203	2026-08-24 19:07:18.897641	f66e592c-8e55-46e7-b0e5-bd53287d6546	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	policy	institutional_email_mismatch	E-Mail-Domain nicht erlaubt.	2026-08-24 19:07:18.839999	\N	54a1602b-1b00-4126-94f3-533830abc436
46	1	1	2026-08-24 19:07:18.402378	2026-08-24 19:07:18.906128	b2b13cf6-2378-4336-9dea-030819e87bf9	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	2026-08-24 19:07:18.965907	f	\N	\N	\N	\N	\N	\N
49	1	1	2026-08-24 19:07:18.489407	2026-08-24 19:07:18.90918	8faf92f1-70e0-4637-b44c-bab754ef5b48	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	2026-08-24 19:07:18.973058	f	\N	\N	\N	\N	\N	\N
56	2	1	2026-08-24 19:07:18.694775	2026-08-24 19:07:18.914057	1d43aaf8-9bfe-40b9-99e4-0e25e9f056fe	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	2026-08-24 19:07:18.981071	f	\N	\N	\N	\N	\N	\N
50	1	1	2026-08-24 19:07:18.515945	2026-08-24 19:07:18.909982	6b98601a-6d14-43ef-80f7-c7336e69070e	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	2026-08-24 19:07:18.98601	f	\N	\N	\N	\N	\N	\N
53	3	1	2026-08-24 19:07:18.606907	2026-08-24 19:07:18.911653	ca455294-0e1b-4f41-bd40-935cb2daced1	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	2026-08-24 19:07:18.990985	f	\N	\N	\N	\N	\N	\N
55	3	1	2026-08-24 19:07:18.66554	2026-08-24 19:07:18.913286	4ccb366e-d808-4dcb-ac0a-f54bc6369574	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	2026-08-24 19:07:18.998924	f	\N	\N	\N	\N	\N	\N
47	1	1	2026-08-24 19:07:18.43153	2026-08-24 19:07:18.907965	784020e4-2043-4996-8255-a26f4a0f999a	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	2026-08-24 19:07:19.003203	f	\N	\N	\N	\N	\N	\N
57	2	1	2026-08-24 19:07:18.720298	2026-08-24 19:07:18.915159	d800168c-1fd5-46e2-8f03-9b0e9ec2d47b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	2026-08-24 19:07:19.010081	f	\N	\N	\N	\N	\N	\N
54	2	1	2026-08-24 19:07:18.634557	2026-08-24 19:07:18.912469	b90d533c-a939-4665-9dd5-af7af2a9df9d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	2026-08-24 19:07:19.01496	f	\N	\N	\N	\N	\N	\N
52	1	1	2026-08-24 19:07:18.575021	2026-08-24 19:07:18.910826	50da5b05-c2ed-45af-8b27-83e3ba639291	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	2026-08-24 19:07:19.022753	f	\N	\N	\N	\N	\N	\N
47	5	2	2026-08-24 19:07:18.442422	2026-08-24 19:07:19.023534	f3093bbc-3ab8-47f8-a37b-dd2ffbd566bc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	6	2	2026-08-24 19:07:18.445686	2026-08-24 19:07:19.023534	ead12eea-5aa9-4c5b-bf81-5f290146fdd3	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	7	2	2026-08-24 19:07:18.448809	2026-08-24 19:07:19.023534	5948e6d5-3449-40d1-beb1-8d0c2d32e0e9	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	8	2	2026-08-24 19:07:18.451451	2026-08-24 19:07:19.023534	b517b5ac-31e0-4658-8769-a869176880df	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	9	2	2026-08-24 19:07:18.454598	2026-08-24 19:07:19.023534	7eb77d93-4795-43ca-b422-5daef79fa989	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
47	10	2	2026-08-24 19:07:18.457436	2026-08-24 19:07:19.023534	1bc3f7a2-2753-45dd-9ed4-8c4b63083544	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	1	2	2026-08-24 19:07:18.460156	2026-08-24 19:07:19.023534	7fde2912-4eeb-4b4b-b4fd-9ac6cb3d0815	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	2	2	2026-08-24 19:07:18.463153	2026-08-24 19:07:19.023534	96308144-1bbb-4c16-8bcc-ff1c0a328c53	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	3	2	2026-08-24 19:07:18.465966	2026-08-24 19:07:19.023534	02e1eee9-5190-4b01-95ad-b59d5af754f6	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	4	2	2026-08-24 19:07:18.468484	2026-08-24 19:07:19.023534	62c95ab9-75a7-4ca6-b4e9-7c4e594cf5c1	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	5	2	2026-08-24 19:07:18.472548	2026-08-24 19:07:19.023534	5c45c8d9-b2cc-4a05-8925-595486352285	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	6	2	2026-08-24 19:07:18.475372	2026-08-24 19:07:19.023534	24d75ff7-c411-4090-acec-302e1508d6f8	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	7	2	2026-08-24 19:07:18.477851	2026-08-24 19:07:19.023534	42a37333-16df-48d1-b706-1c18d95725ba	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	8	2	2026-08-24 19:07:18.480126	2026-08-24 19:07:19.023534	a98bdbc3-8ff3-4da2-9ab3-35e1100f52bc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	9	2	2026-08-24 19:07:18.482922	2026-08-24 19:07:19.023534	937101a4-213a-44ca-8dff-2e079776d30d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
48	10	2	2026-08-24 19:07:18.485911	2026-08-24 19:07:19.023534	e3be9ffb-4fbb-4095-8d48-8cf9a013322d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	2	2	2026-08-24 19:07:18.492718	2026-08-24 19:07:19.023534	0d58e0a6-fdc6-4893-93e2-0ce40499907d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	3	2	2026-08-24 19:07:18.495244	2026-08-24 19:07:19.023534	d1f5de39-5cb9-4434-bcb9-d6e0d34ad0dc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	4	2	2026-08-24 19:07:18.497631	2026-08-24 19:07:19.023534	68be63a7-27f6-497e-a558-e7fddf265ddc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	5	2	2026-08-24 19:07:18.50003	2026-08-24 19:07:19.023534	f59eff2e-4b94-41d1-a719-0b93a131cbc7	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	6	2	2026-08-24 19:07:18.502487	2026-08-24 19:07:19.023534	c0a1b525-7de3-41c5-9608-a47dc8a2c0d9	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	7	2	2026-08-24 19:07:18.505637	2026-08-24 19:07:19.023534	718cc4a8-913e-4186-8970-dbe643342c76	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	8	2	2026-08-24 19:07:18.508831	2026-08-24 19:07:19.023534	f147b0b0-2a25-4b12-a7ba-a7dbaba3c7ae	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	9	2	2026-08-24 19:07:18.51135	2026-08-24 19:07:19.023534	423345d4-ac34-4a01-91c7-fdd74ac64229	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
49	10	2	2026-08-24 19:07:18.513646	2026-08-24 19:07:19.023534	5784069d-e506-4854-9c30-e22f51d6d763	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	2	2	2026-08-24 19:07:18.518347	2026-08-24 19:07:19.023534	e76a3fae-c6f1-4284-9d72-daf00f2a6a35	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	3	2	2026-08-24 19:07:18.521484	2026-08-24 19:07:19.023534	1edb9ca1-c11d-410a-85b4-0f35f6feb56b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	4	2	2026-08-24 19:07:18.52482	2026-08-24 19:07:19.023534	bcfa7738-0319-4bcb-989b-b8b26648f939	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	5	2	2026-08-24 19:07:18.527709	2026-08-24 19:07:19.023534	b47d1c50-2c74-41e1-b36f-4270e1fbba59	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	6	2	2026-08-24 19:07:18.530609	2026-08-24 19:07:19.023534	d4a96b60-62ab-4da8-9c6c-d8e441c5f138	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	7	2	2026-08-24 19:07:18.533373	2026-08-24 19:07:19.023534	9edd0bee-44ba-4c94-a4a5-5d0c32120335	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	8	2	2026-08-24 19:07:18.535979	2026-08-24 19:07:19.023534	651bb914-7a1f-4070-8453-7ff3761e52f2	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	9	2	2026-08-24 19:07:18.539055	2026-08-24 19:07:19.023534	3afd0081-186d-4a09-bc59-c38a96fc719c	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
50	10	2	2026-08-24 19:07:18.542221	2026-08-24 19:07:19.023534	b3cc97cc-ca5f-4002-9cf8-fe526eda4876	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	1	2	2026-08-24 19:07:18.544818	2026-08-24 19:07:19.023534	f2d6688b-3512-4594-97ae-3b4799a3b5db	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	2	2	2026-08-24 19:07:18.547477	2026-08-24 19:07:19.023534	051c180d-233b-405d-afe7-78afcf9b1eeb	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	3	2	2026-08-24 19:07:18.550933	2026-08-24 19:07:19.023534	eb5b54cd-bb85-404b-ab28-2b94cfa2cc40	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	4	2	2026-08-24 19:07:18.554271	2026-08-24 19:07:19.023534	eeda651f-7edf-4339-aa53-a7f35444a707	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	5	2	2026-08-24 19:07:18.558057	2026-08-24 19:07:19.023534	03aaf423-543f-4053-a961-5e175f1adab8	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	6	2	2026-08-24 19:07:18.561469	2026-08-24 19:07:19.023534	aaf74a0f-de53-4b77-85d4-4a8bcc73b848	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	7	2	2026-08-24 19:07:18.563755	2026-08-24 19:07:19.023534	4a24c2a9-cc70-45d1-a419-6f47c7b64081	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	8	2	2026-08-24 19:07:18.566404	2026-08-24 19:07:19.023534	0a93372b-f31c-4c44-94ec-33865fe439cf	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	9	2	2026-08-24 19:07:18.568923	2026-08-24 19:07:19.023534	b5a5694a-6b9b-41ef-92a0-fdec6d8f569f	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
51	10	2	2026-08-24 19:07:18.571988	2026-08-24 19:07:19.023534	f3818310-2b55-4bc9-b354-53367f739669	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	2	2	2026-08-24 19:07:18.577401	2026-08-24 19:07:19.023534	9a46c62f-6205-436b-b9e9-bad6cec475f7	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	3	2	2026-08-24 19:07:18.579888	2026-08-24 19:07:19.023534	ef723ac3-4270-4ae1-a15a-bbbb3291bf2d	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	4	2	2026-08-24 19:07:18.582251	2026-08-24 19:07:19.023534	31c610ee-a0ad-4d10-a93c-b5673b743c62	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	5	2	2026-08-24 19:07:18.584698	2026-08-24 19:07:19.023534	8216a47d-64b3-4d4d-8184-87433e378421	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	6	2	2026-08-24 19:07:18.587479	2026-08-24 19:07:19.023534	2ebdf487-b74d-436d-8a98-269ab45893ac	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	7	2	2026-08-24 19:07:18.590758	2026-08-24 19:07:19.023534	4db62796-668d-4317-82a0-151eacffbc0b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	8	2	2026-08-24 19:07:18.59345	2026-08-24 19:07:19.023534	17869078-4411-4483-a81b-7bc72b50f5a5	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	9	2	2026-08-24 19:07:18.595912	2026-08-24 19:07:19.023534	54e1efdc-d98d-4b9f-b4d1-09f79681e246	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
52	10	2	2026-08-24 19:07:18.598244	2026-08-24 19:07:19.023534	8c8752da-38a5-4e95-9651-8c0953a83658	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	1	2	2026-08-24 19:07:18.600535	2026-08-24 19:07:19.023534	28c75427-04e0-48c4-9369-c215fb889d68	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	2	2	2026-08-24 19:07:18.602836	2026-08-24 19:07:19.023534	dcdfb489-67ef-494e-aaa4-003173c0fcc6	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	4	2	2026-08-24 19:07:18.609821	2026-08-24 19:07:19.023534	b7baec38-6888-41a1-9527-a4d91289713b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
53	5	2	2026-08-24 19:07:18.612517	2026-08-24 19:07:19.023534	f741d4a9-7111-4a30-ab75-e8aa0ed99747	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	2	2	2026-08-24 19:07:18.662992	2026-08-24 19:07:19.023534	c21d7849-cfb1-47c4-b4cc-f3055c1a8925	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	4	2	2026-08-24 19:07:18.668207	2026-08-24 19:07:19.023534	22ecb86c-3c4b-4b40-8fb6-a3b899b9cf5c	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	5	2	2026-08-24 19:07:18.671061	2026-08-24 19:07:19.023534	6c556a3e-2152-4f34-bf96-ce3ed6c90a8c	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	6	2	2026-08-24 19:07:18.674368	2026-08-24 19:07:19.023534	007a3783-7119-48ed-950e-e4aa48913beb	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	7	2	2026-08-24 19:07:18.677346	2026-08-24 19:07:19.023534	b3deb1ca-289b-4b32-a6b7-9215bd1290c1	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	8	2	2026-08-24 19:07:18.679722	2026-08-24 19:07:19.023534	5a56d3d0-b536-4ac9-848f-8ee2a7febee2	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	9	2	2026-08-24 19:07:18.685805	2026-08-24 19:07:19.023534	de4994c1-021a-4d0b-b897-1e89cea1ad0c	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
55	10	2	2026-08-24 19:07:18.689083	2026-08-24 19:07:19.023534	04ef682d-e205-4bb0-af1c-87ed728ca5d8	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	1	2	2026-08-24 19:07:18.692163	2026-08-24 19:07:19.023534	ab5984f4-47b3-487a-97e5-19548e3f9ae0	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	3	2	2026-08-24 19:07:18.697192	2026-08-24 19:07:19.023534	c9710325-3acf-4727-906c-443e3187c0e7	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	4	2	2026-08-24 19:07:18.699689	2026-08-24 19:07:19.023534	7bf464fc-ce36-4432-9f84-c947c34abd99	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	5	2	2026-08-24 19:07:18.702023	2026-08-24 19:07:19.023534	7060622f-b785-41a4-be65-528716096e91	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	6	2	2026-08-24 19:07:18.704318	2026-08-24 19:07:19.023534	19bb9fce-de91-4bec-bc20-ebd496d32abc	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	a4fc6e0e-e900-451d-812a-049ddaa3990e	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	7	2	2026-08-24 19:07:18.707347	2026-08-24 19:07:19.023534	719c173d-5e6a-470b-b0db-2c074e07bd0c	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	8	2	2026-08-24 19:07:18.70997	2026-08-24 19:07:19.023534	ab2e14ba-b384-46f4-8d6d-1782f44a0207	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	9	2	2026-08-24 19:07:18.712454	2026-08-24 19:07:19.023534	4d3b873f-3c11-4c2b-bb85-7bcbdc16fdff	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
56	10	2	2026-08-24 19:07:18.714808	2026-08-24 19:07:19.023534	360bdec1-6d73-4e45-95b2-ad10e71e6f4b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	1	2	2026-08-24 19:07:18.717108	2026-08-24 19:07:19.023534	5dbd542e-3efb-4646-ad3b-d6239de315dd	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	904504bb-ff57-4372-a203-89b6f24b66ca	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	3	2	2026-08-24 19:07:18.724112	2026-08-24 19:07:19.023534	8db4e3d0-5a93-4d6b-b5c9-549d60f16d9a	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	7b8e9b6a-d2af-4031-87a2-ad7f21fe9bc3	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	4	2	2026-08-24 19:07:18.727889	2026-08-24 19:07:19.023534	f41997ea-764c-47ad-9d06-d4c3d18d99dd	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4b71e92e-9a9f-45e4-bc29-ce3d5517e17b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	5	2	2026-08-24 19:07:18.73115	2026-08-24 19:07:19.023534	7a41cfdf-310c-48e9-88ef-e166f04cba8b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	4e96d824-daeb-436c-b3df-ec0b98e0c30f	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	6	2	2026-08-24 19:07:18.733683	2026-08-24 19:07:19.023534	6d143dc8-a366-4693-a133-7e0001944a79	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	e9885503-f7af-4442-b062-5515d0a8bf5d	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	7	2	2026-08-24 19:07:18.736551	2026-08-24 19:07:19.023534	b3ac1a60-dba5-49c5-8a7d-c11d67c23570	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	76acf1d8-bc6b-4aad-9788-e803566db1ee	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	8	2	2026-08-24 19:07:18.739449	2026-08-24 19:07:19.023534	12372cda-117a-43ff-bc85-4bd39ce7dd5c	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	bfdb067a-f3e7-4532-a1cf-27356150e4db	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	9	2	2026-08-24 19:07:18.742279	2026-08-24 19:07:19.023534	57182f4a-4456-42ce-acd4-a72b3faeae4b	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	78b194ce-b7d0-4479-9542-0ef6b88d4d8b	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
57	10	2	2026-08-24 19:07:18.745089	2026-08-24 19:07:19.023534	40aa2a7b-cad6-4922-80df-b55ca12722f5	4b09bf37-3bd7-41e4-af3a-97d887d8e1be	739a1174-e350-4750-958e-a9e14ad8615a	\N	f	capacity	solver_unassigned	Nicht durch Solver zugeteilt	2026-08-24 19:07:19.023534	\N	\N
60	1	0	2026-08-24 19:07:19.219525	2026-08-24 19:07:19.219525	2f778677-967d-4a7b-9bd9-cc8b76947c19	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
61	1	0	2026-08-24 19:07:19.325472	2026-08-24 19:07:19.325472	d730928a-bd6a-4806-b479-f5d69a292715	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
61	2	0	2026-08-24 19:07:19.330079	2026-08-24 19:07:19.330079	f7150267-5d52-48b8-97ce-4ed844dabea4	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
62	1	0	2026-08-24 19:07:19.432865	2026-08-24 19:07:19.432865	02adfb65-f3f2-49d8-9409-b174b6c93f41	e8573fe3-def3-4e68-bfd2-31819dd535d8	b10acdae-8a5e-4faf-87b7-285d6dc97092	\N	f	\N	\N	\N	\N	\N	\N
62	2	0	2026-08-24 19:07:19.436372	2026-08-24 19:07:19.436372	c8f1fa5e-9a19-460b-9066-bd8703c219bd	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
62	3	0	2026-08-24 19:07:19.439638	2026-08-24 19:07:19.439638	8d51729b-c7de-4fd8-b20a-dc322d78c789	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
63	1	0	2026-08-24 19:07:19.542979	2026-08-24 19:07:19.542979	5a267731-a283-4f9c-8ce4-8947540e4554	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
63	2	0	2026-08-24 19:07:19.546768	2026-08-24 19:07:19.546768	1bb64459-eed5-4202-ac9a-f43b00151161	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
64	1	0	2026-08-24 19:07:19.656682	2026-08-24 19:07:19.656682	bc988566-ae77-4f4a-a646-dc33f07b02fc	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
64	2	0	2026-08-24 19:07:19.659626	2026-08-24 19:07:19.659626	622b9b2f-55d5-4a50-b8f6-cb9c1d32b31e	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
65	1	0	2026-08-24 19:07:19.772777	2026-08-24 19:07:19.772777	256b3f99-222b-4ffd-bedd-3133562d6bac	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
65	2	0	2026-08-24 19:07:19.775714	2026-08-24 19:07:19.775714	36761f24-2ad4-4514-bdf6-212d9a1dea63	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
66	1	0	2026-08-24 19:07:19.882619	2026-08-24 19:07:19.882619	5bd601c7-84f1-43d6-b483-495d872b4625	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
66	2	0	2026-08-24 19:07:19.885567	2026-08-24 19:07:19.885567	661e0ec0-1235-49d2-9784-29a12aa6640c	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
67	1	0	2026-08-24 19:07:19.994804	2026-08-24 19:07:19.994804	fa5f2547-4350-4043-8de2-c074371c4142	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
68	1	0	2026-08-24 19:07:20.096549	2026-08-24 19:07:20.096549	75eb2261-4af1-435f-87d6-6c987f28d711	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
68	2	0	2026-08-24 19:07:20.100014	2026-08-24 19:07:20.100014	9c29bbb1-f95c-4c64-bdde-80e7b4e9478f	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
69	1	0	2026-08-24 19:07:20.207665	2026-08-24 19:07:20.207665	61a2ffb7-0aeb-4e2e-ac62-decf624e615c	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
70	1	0	2026-08-24 19:07:20.309208	2026-08-24 19:07:20.309208	1b3605e5-ad97-40f7-9c70-2978acdab430	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
70	2	0	2026-08-24 19:07:20.311858	2026-08-24 19:07:20.311858	a445d5fb-7d39-43a0-8018-9f5fd140baed	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
71	1	0	2026-08-24 19:07:20.420049	2026-08-24 19:07:20.420049	114acfcc-90fa-4aac-aa49-5c12a03e0126	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
71	2	0	2026-08-24 19:07:20.422991	2026-08-24 19:07:20.422991	4d2c89b5-d1fc-4584-a488-b75ea0643cfa	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
71	3	0	2026-08-24 19:07:20.425521	2026-08-24 19:07:20.425521	b3192255-dd47-4190-81f7-44eb17149865	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
72	1	0	2026-08-24 19:07:20.528047	2026-08-24 19:07:20.528047	82c5e6b8-2c31-4fa3-89a7-7080a8cade6a	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
72	2	0	2026-08-24 19:07:20.531058	2026-08-24 19:07:20.531058	2cbf7a14-90b4-4c43-92ae-a95e8964061f	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
73	1	0	2026-08-24 19:07:20.642383	2026-08-24 19:07:20.642383	17de5496-3d96-4ee0-99b7-d238fad119d3	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
74	1	0	2026-08-24 19:07:20.745464	2026-08-24 19:07:20.745464	77cc2bc0-1de4-4ddc-9ffa-e388a7fc6f77	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
74	2	0	2026-08-24 19:07:20.748463	2026-08-24 19:07:20.748463	1dbfa698-dd8d-47a8-899a-de92ff388968	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
75	1	0	2026-08-24 19:07:20.855951	2026-08-24 19:07:20.855951	2b7fa8b4-204c-47a1-acb3-7bd509d2d456	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
75	2	0	2026-08-24 19:07:20.859043	2026-08-24 19:07:20.859043	bd98ddbc-bb22-4ed5-9c57-62a2d99097e4	e8573fe3-def3-4e68-bfd2-31819dd535d8	b10acdae-8a5e-4faf-87b7-285d6dc97092	\N	f	\N	\N	\N	\N	\N	\N
75	3	0	2026-08-24 19:07:20.861805	2026-08-24 19:07:20.861805	eceaaa4e-8d52-45f1-858e-71b92c6032ef	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
76	1	0	2026-08-24 19:07:20.962948	2026-08-24 19:07:20.962948	b939ec1e-551c-4b20-b364-1df5e670f1e4	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
76	2	0	2026-08-24 19:07:20.965558	2026-08-24 19:07:20.965558	f96ed643-3545-4a3c-bf22-54ac01ffe7be	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
77	1	0	2026-08-24 19:07:21.070022	2026-08-24 19:07:21.070022	810767d0-eb15-4fe2-9084-8348a1f814ca	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
78	1	0	2026-08-24 19:07:21.176549	2026-08-24 19:07:21.176549	681c493f-b86d-4ead-b835-be34d091c91f	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
78	2	0	2026-08-24 19:07:21.179454	2026-08-24 19:07:21.179454	822c337d-4f4d-4ada-8e5d-974c047705a4	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
79	1	0	2026-08-24 19:07:21.281311	2026-08-24 19:07:21.281311	f0120a7b-a689-417a-b98b-69593b000fe2	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
80	1	0	2026-08-24 19:07:21.382871	2026-08-24 19:07:21.382871	51ee5919-e84d-4cf5-90c3-3d33efea885d	e8573fe3-def3-4e68-bfd2-31819dd535d8	b10acdae-8a5e-4faf-87b7-285d6dc97092	\N	f	\N	\N	\N	\N	\N	\N
80	2	0	2026-08-24 19:07:21.385695	2026-08-24 19:07:21.385695	4f187687-789a-42a6-946c-8bee58090047	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
80	3	0	2026-08-24 19:07:21.388877	2026-08-24 19:07:21.388877	c9e9c161-206b-4d89-a1fb-41e69c9a372b	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
81	1	0	2026-08-24 19:07:21.501872	2026-08-24 19:07:21.501872	fedefa37-6f3b-494d-a9e4-c1f4ee70d0b2	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
81	2	0	2026-08-24 19:07:21.505214	2026-08-24 19:07:21.505214	f9cb7993-d740-46f9-b82e-c48b016c76a2	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
82	1	0	2026-08-24 19:07:21.610604	2026-08-24 19:07:21.610604	e531108f-944c-4681-af7a-2bc657fd0623	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
82	2	0	2026-08-24 19:07:21.614292	2026-08-24 19:07:21.614292	483b0ff2-ee92-4fb8-a2d5-d1baaa9efc0c	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
83	1	0	2026-08-24 19:07:21.71637	2026-08-24 19:07:21.71637	6e754c1f-05e7-4ac5-97d7-e51029c1d883	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
84	1	0	2026-08-24 19:07:21.824022	2026-08-24 19:07:21.824022	fdcdd377-cfd6-4945-b3e9-0a50187d9e6c	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
85	1	0	2026-08-24 19:07:21.926833	2026-08-24 19:07:21.926833	0b240dd9-8417-450e-833a-c58b1a2c934e	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
86	1	0	2026-08-24 19:07:22.031672	2026-08-24 19:07:22.031672	ec1844f5-afb4-4341-834b-8d82c5e30980	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
87	1	0	2026-08-24 19:07:22.135928	2026-08-24 19:07:22.135928	88bc3c72-2dd7-42f1-95f8-2386a84cd693	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
87	2	0	2026-08-24 19:07:22.138895	2026-08-24 19:07:22.138895	d362d72f-77d0-4698-9d62-da171b67e7d1	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
88	1	0	2026-08-24 19:07:22.239185	2026-08-24 19:07:22.239185	4c0cbd92-204b-470b-aaa4-abd7fae7ac07	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
89	1	0	2026-08-24 19:07:22.344977	2026-08-24 19:07:22.344977	79d628f7-8892-4946-96a7-db2f98afb0b3	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
89	2	0	2026-08-24 19:07:22.348014	2026-08-24 19:07:22.348014	3a7635db-2200-4641-8c1f-00b64e909594	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
90	1	0	2026-08-24 19:07:22.45387	2026-08-24 19:07:22.45387	e714e689-1fea-4cc8-b7c9-a2bc627adea8	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
91	1	0	2026-08-24 19:07:22.554321	2026-08-24 19:07:22.554321	cd298c3c-6ce3-4bd1-a29e-157da016fa8d	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
91	2	0	2026-08-24 19:07:22.557353	2026-08-24 19:07:22.557353	90aac500-3b3b-4df0-b162-2115ddc30b4e	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
91	3	0	2026-08-24 19:07:22.56072	2026-08-24 19:07:22.56072	a7eb5173-1242-406a-8904-f2a170f426ff	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
92	1	0	2026-08-24 19:07:22.666268	2026-08-24 19:07:22.666268	13ea8d13-e91b-4e44-8180-efbb6ebe7efe	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
93	1	0	2026-08-24 19:07:22.773141	2026-08-24 19:07:22.773141	910e44fd-0cbf-4500-bdf1-4371ffe3b203	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
93	2	0	2026-08-24 19:07:22.775961	2026-08-24 19:07:22.775961	89acc863-cccb-457b-9878-f52efa591ac0	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
93	3	0	2026-08-24 19:07:22.779634	2026-08-24 19:07:22.779634	578ea54c-d288-46c8-bfe9-e20d1105821c	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
94	1	0	2026-08-24 19:07:22.888312	2026-08-24 19:07:22.888312	d6d0cd58-4e11-4d1f-8fc7-ca4df56ba0ef	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
94	2	0	2026-08-24 19:07:22.891351	2026-08-24 19:07:22.891351	ea78b18b-d20c-4be5-8118-e57fd0c75022	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
95	1	0	2026-08-24 19:07:22.999248	2026-08-24 19:07:22.999248	a803da60-23f9-460a-80c8-c1df450779bb	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
95	2	0	2026-08-24 19:07:23.002742	2026-08-24 19:07:23.002742	6f8dc2ab-882e-45a5-b496-fb6e98a0895d	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
95	3	0	2026-08-24 19:07:23.005657	2026-08-24 19:07:23.005657	71cb0fc4-7b5f-4e4c-af1b-a59773530d7c	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
96	1	0	2026-08-24 19:07:23.109403	2026-08-24 19:07:23.109403	89519c33-8c11-4e41-b430-3198b92a02c0	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
96	2	0	2026-08-24 19:07:23.113295	2026-08-24 19:07:23.113295	f398c24e-416a-4203-95f5-1ef48ae3817d	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
97	1	0	2026-08-24 19:07:23.219645	2026-08-24 19:07:23.219645	90730811-3ccb-4929-baa0-c5b26d6ec995	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
98	1	0	2026-08-24 19:07:23.318555	2026-08-24 19:07:23.318555	5a662d25-a971-486a-b0a5-3a5c01d78e52	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
98	2	0	2026-08-24 19:07:23.321328	2026-08-24 19:07:23.321328	dcca89be-a8b4-4822-8972-ab89da3bb8eb	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
99	1	0	2026-08-24 19:07:23.420448	2026-08-24 19:07:23.420448	371d31b0-e704-4fab-894a-74751029e225	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
99	2	0	2026-08-24 19:07:23.423115	2026-08-24 19:07:23.423115	88709f2b-d443-4333-952b-75897337e805	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
100	1	0	2026-08-24 19:07:23.540099	2026-08-24 19:07:23.540099	980fbe8d-c7d8-45e1-a824-8e6dbd838644	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
100	2	0	2026-08-24 19:07:23.54378	2026-08-24 19:07:23.54378	e2435f9f-7467-44e3-a3b1-d1db4edb0052	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
100	3	0	2026-08-24 19:07:23.547786	2026-08-24 19:07:23.547786	7259b03f-d8aa-4f6a-be43-11b00ba96b3c	e8573fe3-def3-4e68-bfd2-31819dd535d8	3a7e3c56-0930-42bd-aebd-f5e91ad731fe	\N	f	\N	\N	\N	\N	\N	\N
101	1	0	2026-08-24 19:07:23.648037	2026-08-24 19:07:23.648037	27396c38-cef0-4c0f-ad07-51813288b38e	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
102	1	0	2026-08-24 19:07:23.755108	2026-08-24 19:07:23.755108	f58a3ca7-9b9a-4892-84f9-28c5040bf5e5	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
103	1	0	2026-08-24 19:07:23.854738	2026-08-24 19:07:23.854738	9453600e-8630-4b98-96bf-cca819d014ae	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
104	1	0	2026-08-24 19:07:23.95483	2026-08-24 19:07:23.95483	b059cb88-8c20-437e-a581-4193d9978588	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
105	1	0	2026-08-24 19:07:24.055753	2026-08-24 19:07:24.055753	f231da2d-b0c4-456e-b0b1-daf8209ae126	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
106	1	0	2026-08-24 19:07:24.156485	2026-08-24 19:07:24.156485	2ff7d6a1-023d-4751-a2e6-c6916e8cd80a	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
107	1	0	2026-08-24 19:07:24.268289	2026-08-24 19:07:24.268289	f0aa75a2-8d05-419f-876e-440c5e7754a6	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
108	1	0	2026-08-24 19:07:24.36811	2026-08-24 19:07:24.36811	99e94102-5fcf-4489-86f4-347d5a341909	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
109	1	0	2026-08-24 19:07:24.467471	2026-08-24 19:07:24.467471	b169f6fb-c699-4683-9f26-9402ae9950f1	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
109	2	0	2026-08-24 19:07:24.470219	2026-08-24 19:07:24.470219	1a16c300-011b-47ff-bccf-8485dcd43041	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
110	1	0	2026-08-24 19:07:24.569492	2026-08-24 19:07:24.569492	73e84124-947d-4e70-add4-8df293d90bca	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
110	2	0	2026-08-24 19:07:24.573161	2026-08-24 19:07:24.573161	6bded414-d6e0-481b-926a-58f2331a310a	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
111	1	0	2026-08-24 19:07:24.673591	2026-08-24 19:07:24.673591	85679353-4768-48ba-9153-ed5cee2bbe07	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
111	2	0	2026-08-24 19:07:24.676152	2026-08-24 19:07:24.676152	bc1283ed-641f-44a0-9ac4-705376e2751f	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
112	1	0	2026-08-24 19:07:24.777944	2026-08-24 19:07:24.777944	0a4e1b73-3cd6-4631-9ecf-8fd253c01f38	e8573fe3-def3-4e68-bfd2-31819dd535d8	d8540279-3a51-4e2d-b459-c1a22ddbce85	\N	f	\N	\N	\N	\N	\N	\N
113	1	0	2026-08-24 19:07:24.881172	2026-08-24 19:07:24.881172	37badee7-83d8-43e3-97fb-0ec41fda162c	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
114	1	0	2026-08-24 19:07:24.98163	2026-08-24 19:07:24.98163	5c71a27c-389a-4225-bf67-f2d1c78fc608	e8573fe3-def3-4e68-bfd2-31819dd535d8	3d40c921-c5ec-4ff9-9fd4-0c534f625275	\N	f	\N	\N	\N	\N	\N	\N
115	\N	1	2026-08-24 19:07:25.191507	2026-08-24 19:07:25.191507	7f34710a-cacc-4911-b658-a742a8ed28eb	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
116	\N	1	2026-08-24 19:07:25.303887	2026-08-24 19:07:25.303887	1b7cf533-e985-4dd3-96d4-5762e296eb12	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
117	\N	1	2026-08-24 19:07:25.40679	2026-08-24 19:07:25.40679	a6917cb2-07ae-4136-8a1b-26dd8c065df3	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
118	\N	1	2026-08-24 19:07:25.507397	2026-08-24 19:07:25.507397	6d550d5e-a1ae-4e18-ba5a-d3da2b0229e2	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
119	\N	1	2026-08-24 19:07:25.607574	2026-08-24 19:07:25.607574	98562980-cc17-44ac-aefb-42ea74e34cc8	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
120	\N	1	2026-08-24 19:07:25.708171	2026-08-24 19:07:25.708171	0537b5b9-9bfd-4632-9622-abfa9bcf99e0	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
121	\N	1	2026-08-24 19:07:25.820497	2026-08-24 19:07:25.820497	56439dca-0ca8-40bd-9961-7c33e4bc6b35	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
122	\N	1	2026-08-24 19:07:25.926189	2026-08-24 19:07:25.926189	0fce4f56-a496-484d-89a8-69b3b9ae7608	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
123	\N	1	2026-08-24 19:07:26.052046	2026-08-24 19:07:26.052046	8b3d7c94-9d86-44d0-bcb8-3037318624e0	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
124	\N	1	2026-08-24 19:07:26.177009	2026-08-24 19:07:26.177009	a1f48992-7f1f-46e6-8b54-5896f6132041	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
125	\N	1	2026-08-24 19:07:26.301843	2026-08-24 19:07:26.301843	c7d52a63-c5a9-42f0-8bb1-314456bc4707	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
126	\N	1	2026-08-24 19:07:26.414498	2026-08-24 19:07:26.414498	f56184aa-7e26-4604-92f9-9dbe7f3f24fd	44b94de3-7f1f-402a-8c5d-9be150bafa60	0a7b2828-fb09-4f46-ba0a-bfb3c411dd89	\N	t	\N	\N	\N	\N	\N	\N
127	\N	1	2026-08-24 19:07:26.520265	2026-08-24 19:07:26.520265	156f702c-be0b-469b-8639-69f752c17230	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
128	\N	1	2026-08-24 19:07:26.622252	2026-08-24 19:07:26.622252	cea64ee8-009d-4564-9e45-4a6b787cbba7	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
129	\N	1	2026-08-24 19:07:26.725493	2026-08-24 19:07:26.725493	3a4a40d4-f489-4069-9d8f-0ea8add7dad4	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
130	\N	1	2026-08-24 19:07:26.827779	2026-08-24 19:07:26.827779	ef86fbe6-7d59-4c7a-bf67-636064079a19	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
131	\N	1	2026-08-24 19:07:26.933386	2026-08-24 19:07:26.933386	7099fc3a-34c7-488d-afb4-c4f806b39c40	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
132	\N	1	2026-08-24 19:07:27.039525	2026-08-24 19:07:27.039525	c4a0010f-cd0c-4070-a85a-5d1d0bc35d3a	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
133	\N	1	2026-08-24 19:07:27.16588	2026-08-24 19:07:27.16588	60fce049-e54d-4d10-9333-0aa3f411a01f	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
134	\N	1	2026-08-24 19:07:27.269184	2026-08-24 19:07:27.269184	7ef12f53-8beb-487d-883a-6dc2221866b8	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
135	\N	1	2026-08-24 19:07:27.373639	2026-08-24 19:07:27.373639	30ab91c1-ffef-4a56-9619-111c9b3f9d45	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
136	\N	1	2026-08-24 19:07:27.487296	2026-08-24 19:07:27.487296	851fd802-7a3b-4ace-a757-26efe438ceab	44b94de3-7f1f-402a-8c5d-9be150bafa60	6e5645dd-27cf-448b-b4d7-9b65dfb452ff	\N	t	\N	\N	\N	\N	\N	\N
137	\N	1	2026-08-24 19:07:27.592425	2026-08-24 19:07:27.592425	29681f65-d3fb-4732-b7a0-c2c6930d7f13	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
138	\N	1	2026-08-24 19:07:27.698916	2026-08-24 19:07:27.698916	ac9c2970-d581-42c8-a7dd-2b49487b235b	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
139	\N	1	2026-08-24 19:07:27.801729	2026-08-24 19:07:27.801729	8994681e-0ec1-4380-92d2-e97f151fa887	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
140	\N	1	2026-08-24 19:07:27.908548	2026-08-24 19:07:27.908548	bae329a2-a61b-466f-8312-306e7af4ce8a	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
141	\N	1	2026-08-24 19:07:28.017882	2026-08-24 19:07:28.017882	6366808d-ffa4-4292-9a86-3e4a6e12e5fe	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
142	\N	1	2026-08-24 19:07:28.118609	2026-08-24 19:07:28.118609	56d93285-f2e6-4226-b339-91a1ce889fed	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
143	\N	1	2026-08-24 19:07:28.219155	2026-08-24 19:07:28.219155	f3bf41a8-3993-4239-948e-bdefbe01d3d0	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
144	\N	1	2026-08-24 19:07:28.321868	2026-08-24 19:07:28.321868	c5d979ee-492f-4228-8f77-cafc296cce02	44b94de3-7f1f-402a-8c5d-9be150bafa60	91c8d47b-ddb5-4590-af5b-dce6d0b8c5cb	\N	t	\N	\N	\N	\N	\N	\N
145	\N	1	2026-08-24 19:07:28.421812	2026-08-24 19:07:28.421812	27815cde-8b94-4b49-98b9-df578e86b5c0	44b94de3-7f1f-402a-8c5d-9be150bafa60	3f768664-4dc3-4062-9c1a-53494818da75	\N	f	\N	\N	\N	\N	\N	\N
146	\N	1	2026-08-24 19:07:28.523641	2026-08-24 19:07:28.523641	1606456c-8cec-40df-9313-867656f9fa42	44b94de3-7f1f-402a-8c5d-9be150bafa60	3f768664-4dc3-4062-9c1a-53494818da75	\N	f	\N	\N	\N	\N	\N	\N
147	\N	1	2026-08-24 19:07:28.625671	2026-08-24 19:07:28.625671	f709c759-46c7-4e4b-9617-a75868920d16	44b94de3-7f1f-402a-8c5d-9be150bafa60	3f768664-4dc3-4062-9c1a-53494818da75	\N	f	\N	\N	\N	\N	\N	\N
148	\N	1	2026-08-24 19:07:28.730635	2026-08-24 19:07:28.730635	c5463e10-1895-4a90-bf1f-a6f47fe73df3	44b94de3-7f1f-402a-8c5d-9be150bafa60	3f768664-4dc3-4062-9c1a-53494818da75	\N	f	\N	\N	\N	\N	\N	\N
149	\N	1	2026-08-24 19:07:28.832636	2026-08-24 19:07:28.832636	868eddf3-bda9-4a73-a4b8-93cc58a1a6cd	44b94de3-7f1f-402a-8c5d-9be150bafa60	3f768664-4dc3-4062-9c1a-53494818da75	\N	f	\N	\N	\N	\N	\N	\N
150	\N	1	2026-08-24 19:07:28.934139	2026-08-24 19:07:28.934139	3590053d-dfe6-4869-919c-70f21c63db39	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
151	\N	1	2026-08-24 19:07:29.038755	2026-08-24 19:07:29.038755	25648fcf-dfa9-474f-ab60-5c95c1d624d1	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
152	\N	1	2026-08-24 19:07:29.142711	2026-08-24 19:07:29.142711	c07b62e8-7a7c-46ba-b9d7-84629f8bfaf8	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
153	\N	1	2026-08-24 19:07:29.245786	2026-08-24 19:07:29.245786	e2d3e00d-9726-41eb-9b7a-5832e25b994c	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
154	\N	1	2026-08-24 19:07:29.349514	2026-08-24 19:07:29.349514	e2535ed1-7630-425e-b4a6-53abceccd4d2	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
155	\N	1	2026-08-24 19:07:29.455775	2026-08-24 19:07:29.455775	833a6be9-0825-451d-813f-358d30b62a1e	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
156	\N	1	2026-08-24 19:07:29.559478	2026-08-24 19:07:29.559478	a95a4e24-16cb-4a8c-b178-73aad56fab70	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
157	\N	1	2026-08-24 19:07:29.668166	2026-08-24 19:07:29.668166	15bcee9d-5d71-4544-9723-be1d68066b6e	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
158	\N	1	2026-08-24 19:07:29.775822	2026-08-24 19:07:29.775822	eb100cea-c862-48d8-9449-cf964250494a	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
159	\N	1	2026-08-24 19:07:29.881391	2026-08-24 19:07:29.881391	43d2d56d-1d25-45de-b75f-1e2e9a94dacc	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
160	\N	1	2026-08-24 19:07:29.988758	2026-08-24 19:07:29.988758	4c5396ed-ba22-4d9e-9fab-2f34c5a92cc5	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
161	\N	1	2026-08-24 19:07:30.09121	2026-08-24 19:07:30.09121	5f50772b-f0cc-448e-aa8c-7f8bcf2a3fef	44b94de3-7f1f-402a-8c5d-9be150bafa60	129344e5-5434-4c03-b243-ad6554c13b3f	\N	f	\N	\N	\N	\N	\N	\N
162	\N	1	2026-08-24 19:07:30.293111	2026-08-24 19:07:30.293111	3270fb0a-0e06-459a-94cd-17058d87f599	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
163	\N	1	2026-08-24 19:07:30.39491	2026-08-24 19:07:30.39491	1990f17e-816e-44bd-9896-f1d8802b4307	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
164	\N	1	2026-08-24 19:07:30.496364	2026-08-24 19:07:30.496364	de50bfa0-ac09-4ba8-ac39-90e1a453f5ad	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
165	\N	1	2026-08-24 19:07:30.598192	2026-08-24 19:07:30.598192	304149b3-a04b-4b9a-a578-c88f5e6f890f	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
166	\N	1	2026-08-24 19:07:30.699886	2026-08-24 19:07:30.699886	ca7ad9f0-22fb-44e4-9474-53d9a7b76088	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
167	\N	1	2026-08-24 19:07:30.799951	2026-08-24 19:07:30.799951	97961dc7-cfdc-4913-952a-e9899519a628	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
168	\N	1	2026-08-24 19:07:30.904895	2026-08-24 19:07:30.904895	cf841fdf-2362-4bce-8cfd-cea34f1a6608	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
169	\N	1	2026-08-24 19:07:31.005764	2026-08-24 19:07:31.005764	d022ab59-8916-4d79-b539-a37d2965c616	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
170	\N	1	2026-08-24 19:07:31.110559	2026-08-24 19:07:31.110559	7319ee03-dd25-49ca-8730-2766dc56ecba	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
171	\N	1	2026-08-24 19:07:31.211254	2026-08-24 19:07:31.211254	41bdfcfd-6d74-4fde-9758-4e4d8d57e9ba	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
172	\N	1	2026-08-24 19:07:31.314181	2026-08-24 19:07:31.314181	fd302fbc-61fa-4259-9de8-ed66d252ec06	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
173	\N	1	2026-08-24 19:07:31.414701	2026-08-24 19:07:31.414701	34015c02-a2ca-4c7e-9c2d-25e72d5ce5be	56255bd8-1718-4134-ac3b-11bef35b9c86	30f8b845-45b7-44d7-975b-99a0988e627f	\N	f	\N	\N	\N	\N	\N	\N
162	1	0	2026-08-24 19:07:31.541746	2026-08-24 19:07:31.541746	78ef2a7b-ed60-4727-85f1-92e610986ca0	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	77a517f0-bcc8-4523-813d-82801d86a999	\N	f	\N	\N	\N	\N	\N	\N
162	2	0	2026-08-24 19:07:31.544402	2026-08-24 19:07:31.544402	e5dfaa5b-0fdd-43dd-aa5b-6b8c384eabfd	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
162	3	0	2026-08-24 19:07:31.546765	2026-08-24 19:07:31.546765	0fb0efbf-ae49-4b41-9947-0b4013ac5e18	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	c6308b6a-c52c-4bc5-a2c0-e69b80d7c6e2	\N	f	\N	\N	\N	\N	\N	\N
163	1	0	2026-08-24 19:07:31.549302	2026-08-24 19:07:31.549302	ffc8ba97-d4ed-4a7b-ad2a-9031b64b775d	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	ea2440ba-5d0f-4b31-a10f-61de4ea6f52e	\N	f	\N	\N	\N	\N	\N	\N
163	2	0	2026-08-24 19:07:31.55316	2026-08-24 19:07:31.55316	cce63b22-f284-4aca-96d7-f301b5e36114	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	77a517f0-bcc8-4523-813d-82801d86a999	\N	f	\N	\N	\N	\N	\N	\N
163	3	0	2026-08-24 19:07:31.556523	2026-08-24 19:07:31.556523	221bca58-80ac-4414-b5f6-bc94cc001ac1	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	d5fe8d66-7385-4d09-a43e-71d6d66fe385	\N	f	\N	\N	\N	\N	\N	\N
164	1	0	2026-08-24 19:07:31.55938	2026-08-24 19:07:31.55938	67af836a-3e9f-4de6-bc3c-d22fb995a1a7	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	0a47eeef-b76d-4951-8b31-780c59e8b627	\N	f	\N	\N	\N	\N	\N	\N
164	2	0	2026-08-24 19:07:31.561959	2026-08-24 19:07:31.561959	3ee4068a-1a02-4dfb-94d1-5341feaa8602	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	77a517f0-bcc8-4523-813d-82801d86a999	\N	f	\N	\N	\N	\N	\N	\N
164	3	0	2026-08-24 19:07:31.564511	2026-08-24 19:07:31.564511	0de9b8eb-d7c7-4de9-a528-60538bcec88f	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	d5fe8d66-7385-4d09-a43e-71d6d66fe385	\N	f	\N	\N	\N	\N	\N	\N
165	1	0	2026-08-24 19:07:31.567145	2026-08-24 19:07:31.567145	cf3e35cb-3b24-4864-9638-e43f0ded045b	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
165	2	0	2026-08-24 19:07:31.570779	2026-08-24 19:07:31.570779	1f33210f-8eec-49f8-82ce-a8d8b8d980cb	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	77a517f0-bcc8-4523-813d-82801d86a999	\N	f	\N	\N	\N	\N	\N	\N
165	3	0	2026-08-24 19:07:31.573866	2026-08-24 19:07:31.573866	759a33c6-ba6c-488f-9d0e-673b18c9e2dc	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
166	1	0	2026-08-24 19:07:31.576845	2026-08-24 19:07:31.576845	335e0406-d1b4-496d-9253-095ddbef97bc	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
166	2	0	2026-08-24 19:07:31.579758	2026-08-24 19:07:31.579758	688e13e9-6dfa-4d17-9100-c12ec413f367	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
166	3	0	2026-08-24 19:07:31.582335	2026-08-24 19:07:31.582335	b1607d5a-d974-4d7a-8ad8-b61e978eec73	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	ea2440ba-5d0f-4b31-a10f-61de4ea6f52e	\N	f	\N	\N	\N	\N	\N	\N
167	1	0	2026-08-24 19:07:31.585264	2026-08-24 19:07:31.585264	1a985a54-90e7-4a2a-8f60-6bec8afd78d9	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
167	2	0	2026-08-24 19:07:31.588979	2026-08-24 19:07:31.588979	0ffa766a-c066-4f46-99eb-fdcf201dfd6e	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	ea2440ba-5d0f-4b31-a10f-61de4ea6f52e	\N	f	\N	\N	\N	\N	\N	\N
167	3	0	2026-08-24 19:07:31.591553	2026-08-24 19:07:31.591553	80931a54-062b-465c-a762-a62230956ce7	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
168	1	0	2026-08-24 19:07:31.594047	2026-08-24 19:07:31.594047	57e3e91d-deff-4cff-96a0-0a0ae96cb556	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	77a517f0-bcc8-4523-813d-82801d86a999	\N	f	\N	\N	\N	\N	\N	\N
168	2	0	2026-08-24 19:07:31.5965	2026-08-24 19:07:31.5965	5d8113f4-7da4-4343-b1fd-232ec61eb974	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
168	3	0	2026-08-24 19:07:31.598876	2026-08-24 19:07:31.598876	f8bfa13a-1fae-403a-9ead-d1818cd360b9	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	ea2440ba-5d0f-4b31-a10f-61de4ea6f52e	\N	f	\N	\N	\N	\N	\N	\N
169	1	0	2026-08-24 19:07:31.601736	2026-08-24 19:07:31.601736	144918a5-34da-448a-a29a-031cc0bb0992	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
169	2	0	2026-08-24 19:07:31.605339	2026-08-24 19:07:31.605339	67d438b7-7242-4908-bb22-756f50fcaa3a	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	84d9f571-eb93-4286-a674-93ed10d293c4	\N	f	\N	\N	\N	\N	\N	\N
169	3	0	2026-08-24 19:07:31.608564	2026-08-24 19:07:31.608564	be926aad-7624-47c0-8b51-688fa7ed8c27	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	ea2440ba-5d0f-4b31-a10f-61de4ea6f52e	\N	f	\N	\N	\N	\N	\N	\N
170	1	0	2026-08-24 19:07:31.611028	2026-08-24 19:07:31.611028	ce158ad9-0c3e-42ed-869a-730eb431e329	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
170	2	0	2026-08-24 19:07:31.613408	2026-08-24 19:07:31.613408	d47323f9-0dec-49a6-8cd1-42362c8eeb61	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	f021a725-7b48-4a66-b0b3-875050c40435	\N	f	\N	\N	\N	\N	\N	\N
170	3	0	2026-08-24 19:07:31.615781	2026-08-24 19:07:31.615781	39fb66df-e8bf-4f38-9941-27cf85dd06c8	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	23ef98c1-a1b5-4d7b-a983-25f3dd277dd4	\N	f	\N	\N	\N	\N	\N	\N
171	1	0	2026-08-24 19:07:31.619098	2026-08-24 19:07:31.619098	7b1b261b-4d9b-4969-a783-f790482c6b5a	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
171	2	0	2026-08-24 19:07:31.62264	2026-08-24 19:07:31.62264	46452b3a-a8b1-42fa-bdb4-4537cb713daa	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
171	3	0	2026-08-24 19:07:31.62554	2026-08-24 19:07:31.62554	372416f3-34cb-404c-a100-ff05e21f37b2	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	77a517f0-bcc8-4523-813d-82801d86a999	\N	f	\N	\N	\N	\N	\N	\N
172	1	0	2026-08-24 19:07:31.628015	2026-08-24 19:07:31.628015	b63b448a-50d8-41a0-99c8-f1e7374d731d	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
172	2	0	2026-08-24 19:07:31.630488	2026-08-24 19:07:31.630488	7a3dfe65-c350-4110-9826-d0ac15426749	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	485c7b31-9a4f-471c-a21f-72bcf9683b5a	\N	f	\N	\N	\N	\N	\N	\N
172	3	0	2026-08-24 19:07:31.633009	2026-08-24 19:07:31.633009	5988e167-e7a3-4e7e-9f52-6fc4cfcd846a	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	f021a725-7b48-4a66-b0b3-875050c40435	\N	f	\N	\N	\N	\N	\N	\N
173	1	0	2026-08-24 19:07:31.636527	2026-08-24 19:07:31.636527	d2b60889-18c7-449c-85a6-f5bd4dfb6207	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
173	2	0	2026-08-24 19:07:31.639497	2026-08-24 19:07:31.639497	a1089a50-9939-42d9-9f01-d9a8ceae0a48	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	d5fe8d66-7385-4d09-a43e-71d6d66fe385	\N	f	\N	\N	\N	\N	\N	\N
173	3	0	2026-08-24 19:07:31.642224	2026-08-24 19:07:31.642224	4f550649-24e5-425d-84b4-783ea0e2bc98	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	addfef10-22a4-4400-8d3d-c8784dd039e2	\N	f	\N	\N	\N	\N	\N	\N
174	1	0	2026-08-24 19:07:31.74553	2026-08-24 19:07:31.74553	91a465d3-d368-4dbf-8291-8226641805c1	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	a1fd3322-1289-43d1-9f24-3811388c29a5	\N	f	\N	\N	\N	\N	\N	\N
174	2	0	2026-08-24 19:07:31.748251	2026-08-24 19:07:31.748251	51e0c1ca-c99d-4249-ae14-bca2aae54ab9	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	f021a725-7b48-4a66-b0b3-875050c40435	\N	f	\N	\N	\N	\N	\N	\N
174	3	0	2026-08-24 19:07:31.75144	2026-08-24 19:07:31.75144	1c0565c3-8c61-43a2-a0ee-4067be92362d	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	23ef98c1-a1b5-4d7b-a983-25f3dd277dd4	\N	f	\N	\N	\N	\N	\N	\N
175	1	0	2026-08-24 19:07:31.854595	2026-08-24 19:07:31.854595	fd63f1ca-7be5-4cf7-b61d-13ef0371c4cc	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	f021a725-7b48-4a66-b0b3-875050c40435	\N	f	\N	\N	\N	\N	\N	\N
175	2	0	2026-08-24 19:07:31.858173	2026-08-24 19:07:31.858173	4be20793-9b82-4da5-8fd2-efcd6c81c6ee	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	84d9f571-eb93-4286-a674-93ed10d293c4	\N	f	\N	\N	\N	\N	\N	\N
175	3	0	2026-08-24 19:07:31.879103	2026-08-24 19:07:31.879103	d004bd3f-0070-4add-8894-bbc45efb75ac	df8d6f56-cf47-4833-89ad-e7ab3a6c8e6e	d5fe8d66-7385-4d09-a43e-71d6d66fe385	\N	f	\N	\N	\N	\N	\N	\N
176	\N	1	2026-08-24 19:07:32.001601	2026-08-24 19:07:32.001601	7c0f4b6e-8d7a-479b-b3e7-9d7243673cc1	612b0032-10b0-47da-a077-b5e54f8b3088	7ff2ddd9-7a40-4163-9968-7422e5976dbe	\N	f	\N	\N	\N	\N	\N	\N
177	\N	1	2026-08-24 19:07:32.106603	2026-08-24 19:07:32.106603	08b48cad-d5dc-4708-8708-20ebb62958a1	612b0032-10b0-47da-a077-b5e54f8b3088	7ff2ddd9-7a40-4163-9968-7422e5976dbe	\N	f	\N	\N	\N	\N	\N	\N
178	\N	1	2026-08-24 19:07:32.210476	2026-08-24 19:07:32.210476	ffc7db30-d3be-4ab1-a3cf-52b8162e52bf	612b0032-10b0-47da-a077-b5e54f8b3088	7ff2ddd9-7a40-4163-9968-7422e5976dbe	\N	f	\N	\N	\N	\N	\N	\N
179	\N	1	2026-08-24 19:07:32.314554	2026-08-24 19:07:32.314554	5312ee40-4960-44e4-9d16-13c8d337efcb	612b0032-10b0-47da-a077-b5e54f8b3088	7ff2ddd9-7a40-4163-9968-7422e5976dbe	\N	f	\N	\N	\N	\N	\N	\N
180	\N	1	2026-08-24 19:07:32.417622	2026-08-24 19:07:32.417622	f3547024-da61-4290-ab61-b865e9bfbe20	612b0032-10b0-47da-a077-b5e54f8b3088	7ff2ddd9-7a40-4163-9968-7422e5976dbe	\N	f	\N	\N	\N	\N	\N	\N
\.


--
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
\.


--
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
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sections (id, chapter_id, title, created_at, updated_at, "position", display_number, hidden, tags_order, details) FROM stdin;
7	4	Eine kurze Geschichte der Algebra	2020-07-24 16:53:07.753998	2025-07-14 11:12:42.262119	1	\N	\N	\N	\N
2	1	Unitäre Räume und der Spektralsatz	2020-07-24 13:19:21.145061	2025-07-14 10:50:08.883405	1		f	\N	
5	3	Invarianten- und Determinantenteiler	2020-07-24 13:19:58.558913	2025-07-14 10:57:31.46756	1		f	\N	
6	3	Normalformen	2020-07-24 13:20:07.536377	2025-07-14 10:57:51.35145	2		f	\N	
1	2	Ringe und Ideale	2020-07-24 13:18:45.156279	2025-07-14 10:58:59.950033	1		f	\N	
3	2	Teilbarkeit	2020-07-24 13:19:33.31142	2025-07-14 11:01:16.885737	2		f	\N	
4	2	Euklidische Ringe	2020-07-24 13:19:42.036437	2025-07-14 11:01:53.200333	3		f	\N	
25	7	Der Kongruenzsatz für Dreiecke	2020-07-24 17:04:34.840428	2026-08-24 19:07:35.926082	6	\N	\N	\N	\N
26	7	Mittelsenkrechte und Winkelhalbierende	2020-07-24 17:04:34.871461	2026-08-24 19:07:35.926082	7	\N	\N	\N	\N
27	7	Innen- und Außenwinkel im Dreieck	2020-07-24 17:04:34.90258	2026-08-24 19:07:35.926082	8	\N	\N	\N	\N
28	7	In- und Umkreis	2020-07-24 17:04:34.934588	2026-08-24 19:07:35.926082	9	\N	\N	\N	\N
9	5	Affine Abbildungen	2020-07-24 17:04:34.31982	2026-08-24 19:07:35.926082	2	\N	\N	\N	\N
10	5	Affine Koordinaten	2020-07-24 17:04:34.351367	2026-08-24 19:07:35.926082	3	\N	\N	\N	\N
11	5	Polytope	2020-07-24 17:04:34.386976	2026-08-24 19:07:35.926082	4	\N	\N	\N	\N
29	7	Übungsaufgaben	2020-07-24 17:04:34.966316	2026-08-24 19:07:35.926082	10	\N	\N	\N	\N
12	5	Projektive Räume	2020-07-24 17:04:34.426172	2026-08-24 19:07:35.926082	5	\N	\N	\N	\N
13	5	Projektive Abbildungen	2020-07-24 17:04:34.459566	2026-08-24 19:07:35.926082	6	\N	\N	\N	\N
14	5	Projektive Koordinaten	2020-07-24 17:04:34.491447	2026-08-24 19:07:35.926082	7	\N	\N	\N	\N
30	8	Das Vollständigkeitsaxiom	2020-07-24 17:04:34.99914	2026-08-24 19:07:35.926082	1	\N	\N	\N	\N
15	5	Computergraphik	2020-07-24 17:04:34.523458	2026-08-24 19:07:35.926082	8	\N	\N	\N	\N
16	5	Übungsaufgaben	2020-07-24 17:04:34.556461	2026-08-24 19:07:35.926082	9	\N	\N	\N	\N
31	8	Euklidische Ebenen	2020-07-24 17:04:35.027944	2026-08-24 19:07:35.926082	2	\N	\N	\N	\N
32	8	Kreise	2020-07-24 17:04:35.060817	2026-08-24 19:07:35.926082	3	\N	\N	\N	\N
17	6	Inzidenzebenen	2020-07-24 17:04:34.590767	2026-08-24 19:07:35.926082	1	\N	\N	\N	\N
33	8	Die Inversion am Kreis	2020-07-24 17:04:35.092405	2026-08-24 19:07:35.926082	4	\N	\N	\N	\N
18	6	Affine Ebenen	2020-07-24 17:04:34.621909	2026-08-24 19:07:35.926082	2	\N	\N	\N	\N
19	6	Übungsaufgaben	2020-07-24 17:04:34.651674	2026-08-24 19:07:35.926082	3	\N	\N	\N	\N
20	7	Die Anordnungsaxiome	2020-07-24 17:04:34.684294	2026-08-24 19:07:35.926082	1	\N	\N	\N	\N
34	8	Übungsaufgaben	2020-07-24 17:04:35.123464	2026-08-24 19:07:35.926082	5	\N	\N	\N	\N
21	7	Die Kongruenzaxiome für Strecken	2020-07-24 17:04:34.715512	2026-08-24 19:07:35.926082	2	\N	\N	\N	\N
22	7	Die Kongruenzaxiome für Winkel	2020-07-24 17:04:34.745589	2026-08-24 19:07:35.926082	3	\N	\N	\N	\N
23	7	Ergänzungswinkel, Gegenwinkel und rechte Winkel	2020-07-24 17:04:34.77568	2026-08-24 19:07:35.926082	4	\N	\N	\N	\N
35	9	Das Poincaré'sche Kreismodell	2020-07-24 17:04:35.160116	2026-08-24 19:07:35.926082	1	\N	\N	\N	\N
24	7	Orthogonalität und Parallelität	2020-07-24 17:04:34.806388	2026-08-24 19:07:35.926082	5	\N	\N	\N	\N
36	9	Hyperbolische Geometrie	2020-07-24 17:04:35.190516	2026-08-24 19:07:35.926082	2	\N	\N	\N	\N
8	5	Affine Räume	2020-07-24 17:04:34.287564	2026-08-24 19:07:35.926082	1	\N	\N	\N	\N
37	9	Übungsaufgaben	2020-07-24 17:04:35.220559	2026-08-24 19:07:35.926082	3	\N	\N	\N	\N
\.


--
-- Data for Name: speaker_talk_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.speaker_talk_joins (id, talk_id, speaker_id, created_at, updated_at, source_campaign_id) FROM stdin;
1	1	5	2022-08-05 13:27:59.320402	2022-08-05 13:27:59.320402	\N
2	1	6	2022-08-05 13:31:37.207743	2022-08-05 13:31:37.207743	\N
3	2	5	2025-07-15 12:11:14.651103	2025-07-15 12:11:14.651103	\N
4	2	6	2025-07-15 12:11:39.202251	2025-07-15 12:11:39.202251	\N
5	3	7	2025-07-15 12:11:58.989642	2025-07-15 12:11:58.989642	\N
6	8	46	2026-08-24 19:07:18.951402	2026-08-24 19:07:18.951402	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
7	12	49	2026-08-24 19:07:18.968056	2026-08-24 19:07:18.968056	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
8	6	56	2026-08-24 19:07:18.976386	2026-08-24 19:07:18.976386	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
9	10	50	2026-08-24 19:07:18.982861	2026-08-24 19:07:18.982861	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
10	14	53	2026-08-24 19:07:18.987422	2026-08-24 19:07:18.987422	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
11	11	55	2026-08-24 19:07:18.994536	2026-08-24 19:07:18.994536	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
12	13	47	2026-08-24 19:07:19.000736	2026-08-24 19:07:19.000736	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
13	9	57	2026-08-24 19:07:19.004757	2026-08-24 19:07:19.004757	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
14	7	54	2026-08-24 19:07:19.011906	2026-08-24 19:07:19.011906	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
15	5	52	2026-08-24 19:07:19.019078	2026-08-24 19:07:19.019078	4b09bf37-3bd7-41e4-af3a-97d887d8e1be
\.


--
-- Data for Name: subject_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subject_translations (id, subject_id, locale, created_at, updated_at, name) FROM stdin;
1	1	de	2020-07-24 13:10:54.797363	2020-07-24 13:10:54.797363	Mathematik
2	1	en	2020-07-24 13:10:54.800296	2020-07-24 13:10:54.800296	Mathematics
3	2	de	2020-07-24 13:11:31.488701	2020-07-24 13:11:31.488701	Informatik
4	2	en	2020-07-24 13:11:31.492281	2020-07-24 13:11:31.492281	Computer Science
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.subjects (id, created_at, updated_at) FROM stdin;
1	2020-07-24 13:10:54.791691	2020-07-24 13:10:54.791691
2	2020-07-24 13:11:31.484615	2020-07-24 13:11:31.484615
\.


--
-- Data for Name: submissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.submissions (tutorial_id, assignment_id, token, created_at, updated_at, manuscript_data, invited_user_ids, correction_data, id, last_modification_by_users_at, accepted) FROM stdin;
1	1	9iVG9t	2020-11-28 16:47:39.509532	2020-11-28 16:53:54.375618	{"id":"2053b3abc33881461a4bd884d867ca4c.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"b2e1169bf837f544df8f1e0627e7481e.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	6e088ccc-9568-4dc6-8354-9b46c2c7d135	2021-11-28 16:51:20.326433	t
1	2	DHQ7Yd	2020-11-28 16:55:33.791975	2020-11-28 16:55:33.822069	{"id":"c07f01e9f7400fa298b639d41ccc84f8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	\N	e5c5f104-94c2-4f6d-b3ee-ec84b26c81ed	2021-11-28 16:55:33.821883	\N
1	1	7ZuBdv	2020-11-28 16:48:16.014103	2020-11-28 16:53:45.950681	{"id":"78f53faef661f736a9f775ce2946d3a4.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"feca3ab66f00c78344785b4de2de4dee.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	21e42f50-a50d-4ea6-9239-94ef2c0f238a	2021-11-28 16:48:36.102696	\N
1	1	soywYN	2020-11-28 16:48:56.729104	2020-11-28 16:53:49.943971	{"id":"1baef7a77688a207fc32b595406433d8.pdf","storage":"submission_store","metadata":{"filename":"abgabe.pdf","size":12437,"mime_type":"application/pdf"}}	{}	{"id":"8768adf897b9786221e25eb12b2c4956.pdf","storage":"submission_store","metadata":{"filename":"korrektur.pdf","size":37997,"mime_type":"application/pdf"}}	d6ce28ca-e8b4-4f3c-8ad4-61ef035c88aa	2021-11-28 16:49:20.704658	\N
1	3	r9Hqx5	2022-08-05 14:51:06.864604	2022-08-05 14:52:06.705536	{"id":"1a0fd5eabca55ff91c0ca56e20e16fa1.pdf","storage":"submission_store","metadata":{"filename":"empty.pdf","size":1154,"mime_type":"application/pdf"}}	{}	\N	d9d47c3a-f53b-4afc-adc2-61a6e050cb30	2023-08-05 14:52:06.704508	\N
\.


--
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
-- Data for Name: talks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.talks (id, lecture_id, created_at, updated_at, title, "position", details, dates, description, display_description, capacity, skip_campaigns, self_materialization_mode) FROM stdin;
1	27	2022-08-05 13:21:29.874189	2022-08-05 13:57:32.718902	Gruppen	1	<div>Test</div>	{2022-08-05}	<div>Ich halte einen Vortrag über Gruppen.</div>	t	\N	t	0
3	29	2025-07-15 12:05:05.908031	2025-07-15 12:05:05.908031	Primzahlen	2	<div>Es soll gezeigt werden, dass es unendlich viele Primzahlen gibt.</div>	{2025-07-23}	\N	f	\N	t	0
4	29	2025-07-15 12:06:17.796623	2025-07-15 12:06:17.796623	Das RSA-Verfahren	3	<div>Verschlüsselung mit dem RSA-Verfahren</div>	{2025-08-07}	\N	f	\N	t	0
2	29	2025-07-15 12:04:15.654601	2025-07-15 12:14:43.2905	Teilbarkeit	1	<div>Definition von Teilbarkeit, grundlegende Eigenschaften</div>	{2025-07-17}	\N	f	\N	t	0
5	30	2026-08-24 19:07:16.731224	2026-08-24 19:07:16.731224	Demo Talk 1	1	\N	{}	\N	f	1	f	0
6	30	2026-08-24 19:07:16.765527	2026-08-24 19:07:16.765527	Demo Talk 2	2	\N	{}	\N	f	1	f	0
7	30	2026-08-24 19:07:16.775469	2026-08-24 19:07:16.775469	Demo Talk 3	3	\N	{}	\N	f	1	f	0
8	30	2026-08-24 19:07:16.783287	2026-08-24 19:07:16.783287	Demo Talk 4	4	\N	{}	\N	f	1	f	0
9	30	2026-08-24 19:07:16.79096	2026-08-24 19:07:16.79096	Demo Talk 5	5	\N	{}	\N	f	1	f	0
10	30	2026-08-24 19:07:16.797075	2026-08-24 19:07:16.797075	Demo Talk 6	6	\N	{}	\N	f	1	f	0
11	30	2026-08-24 19:07:16.804508	2026-08-24 19:07:16.804508	Demo Talk 7	7	\N	{}	\N	f	1	f	0
12	30	2026-08-24 19:07:16.812077	2026-08-24 19:07:16.812077	Demo Talk 8	8	\N	{}	\N	f	1	f	0
13	30	2026-08-24 19:07:16.818404	2026-08-24 19:07:16.818404	Demo Talk 9	9	\N	{}	\N	f	1	f	0
14	30	2026-08-24 19:07:16.828022	2026-08-24 19:07:16.828022	Demo Talk 10	10	\N	{}	\N	f	1	f	0
15	31	2026-08-24 19:07:31.433834	2026-08-24 19:07:31.433834	Paare, Passanten	1	\N	{2026-05-03}	\N	f	1	f	0
16	31	2026-08-24 19:07:31.450077	2026-08-24 19:07:31.450077	Heidi	2	\N	{2026-09-10}	\N	f	1	f	0
17	31	2026-08-24 19:07:31.459667	2026-08-24 19:07:31.459667	Franziska Linkerhand	3	\N	{2026-09-16}	\N	f	1	f	0
18	31	2026-08-24 19:07:31.467148	2026-08-24 19:07:31.467148	Ganz unten	4	\N	{2026-12-08}	\N	f	1	f	0
19	31	2026-08-24 19:07:31.475132	2026-08-24 19:07:31.475132	Wer einmal aus dem Blechnapf frisst	5	\N	{2026-11-24}	\N	f	1	f	0
20	31	2026-08-24 19:07:31.482349	2026-08-24 19:07:31.482349	Über das Studium der griechischen Poesie	6	\N	{2026-07-16}	\N	f	1	f	0
21	31	2026-08-24 19:07:31.492701	2026-08-24 19:07:31.492701	Catharina von Georgien	7	\N	{2026-04-16}	\N	f	1	f	0
22	31	2026-08-24 19:07:31.499516	2026-08-24 19:07:31.499516	Franziska Linkerhand	8	\N	{2026-01-13}	\N	f	1	f	0
23	31	2026-08-24 19:07:31.506816	2026-08-24 19:07:31.506816	Das Schiff Esperanza	9	\N	{2026-12-20}	\N	f	1	f	0
24	31	2026-08-24 19:07:31.51289	2026-08-24 19:07:31.51289	Haus ohne Hüter	10	\N	{2026-10-24}	\N	f	1	f	0
25	31	2026-08-24 19:07:31.519977	2026-08-24 19:07:31.519977	Minna von Barnhelm	11	\N	{2026-12-27}	\N	f	1	f	0
26	31	2026-08-24 19:07:31.526635	2026-08-24 19:07:31.526635	Der Tod in Venedig und andere Erzählungen	12	\N	{2026-03-27}	\N	f	1	f	0
27	33	2026-08-24 19:07:32.633978	2026-08-24 19:07:32.633978	Der eiserne Gustav 6477	1	\N	{2026-03-16}	\N	f	\N	f	0
28	33	2026-08-24 19:07:32.652759	2026-08-24 19:07:32.652759	Die Box 2707	2	\N	{2026-12-07}	\N	f	\N	f	0
29	33	2026-08-24 19:07:32.722935	2026-08-24 19:07:32.722935	Miss Sara Sampson 8876	3	\N	{2026-05-27}	\N	f	\N	f	0
30	33	2026-08-24 19:07:32.732723	2026-08-24 19:07:32.732723	Das Parfum 5141	4	\N	{2026-10-31}	\N	f	\N	f	0
31	33	2026-08-24 19:07:32.741577	2026-08-24 19:07:32.741577	Der zerbrochene Krug 6214	5	\N	{2026-09-26}	\N	f	\N	f	0
32	33	2026-08-24 19:07:32.752961	2026-08-24 19:07:32.752961	Der Zauberberg 285	6	\N	{2026-02-18}	\N	f	\N	f	0
33	33	2026-08-24 19:07:32.760553	2026-08-24 19:07:32.760553	Emilia Galotti 4317	7	\N	{2026-04-19}	\N	f	\N	f	0
34	33	2026-08-24 19:07:32.76969	2026-08-24 19:07:32.76969	Lenz 692	8	\N	{2026-01-24}	\N	f	\N	f	0
35	35	2026-08-24 19:07:32.98962	2026-08-24 19:07:32.98962	Die Lehre der Sainte-Victoire 2278	1	\N	{2026-11-01}	\N	f	\N	f	0
36	35	2026-08-24 19:07:32.997462	2026-08-24 19:07:32.997462	Die zärtlichen Schwestern 5603	2	\N	{2026-03-14}	\N	f	\N	f	0
37	35	2026-08-24 19:07:33.00596	2026-08-24 19:07:33.00596	Reigen 4817	3	\N	{2026-04-09}	\N	f	\N	f	0
38	35	2026-08-24 19:07:33.015407	2026-08-24 19:07:33.015407	Gehirne 3869	4	\N	{2026-07-31}	\N	f	\N	f	0
39	35	2026-08-24 19:07:33.023566	2026-08-24 19:07:33.023566	Maria Stuart 5441	5	\N	{2026-06-21}	\N	f	\N	f	0
40	35	2026-08-24 19:07:33.031159	2026-08-24 19:07:33.031159	Der Besuch der alten Dame 1926	6	\N	{2026-02-15}	\N	f	\N	f	0
41	35	2026-08-24 19:07:33.039452	2026-08-24 19:07:33.039452	Das Boot 5431	7	\N	{2026-12-20}	\N	f	\N	f	0
42	35	2026-08-24 19:07:33.053662	2026-08-24 19:07:33.053662	Der Sandmann 941	8	\N	{2026-04-14}	\N	f	\N	f	0
\.


--
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
-- Data for Name: thredded_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_categories (id, messageboard_id, name, description, created_at, updated_at, slug) FROM stdin;
\.


--
-- Data for Name: thredded_messageboard_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_groups (id, name, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_messageboard_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_notifications_for_followed_topics (id, user_id, messageboard_id, notifier_key, enabled) FROM stdin;
\.


--
-- Data for Name: thredded_messageboard_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboard_users (id, thredded_user_detail_id, thredded_messageboard_id, last_seen_at) FROM stdin;
1	1	1	2020-07-24 15:13:57.225997
\.


--
-- Data for Name: thredded_messageboards; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_messageboards (id, name, slug, description, topics_count, posts_count, "position", last_topic_id, messageboard_group_id, created_at, updated_at, locked) FROM stdin;
2	(V) Algebra 1, WS 2025/26 [DozentIn]	v-algebra-1-ws-2019-20-dozentin	\N	0	0	1595609557	\N	\N	2020-07-24 16:52:37.056125	2026-08-24 19:07:33.214252	f
6	(V) Analysis SS 2026, SS 2026 [DozentIn]	v-analysis-ss-2026-ss-2026-dozentin	\N	2	6	1787598457	10	\N	2026-08-24 19:07:37.335978	2026-08-24 19:07:37.564777	f
3	(V) Einführung in die Geometrie, SS 2026 [DozentIn]	v-einfuehrung-in-die-geometrie-ss-2026-dozentin	\N	2	6	1787598455	4	\N	2026-08-24 19:07:35.899032	2026-08-24 19:07:36.532254	f
9	(S) Campaign Test Seminar, SS 2026 [DozentIn]	s-campaign-test-seminar-ss-2026-dozentin	\N	2	6	1787598458	18	\N	2026-08-24 19:07:38.645359	2026-08-24 19:07:38.851244	f
1	(V) Lineare Algebra 2, SS 2026 [DozentIn]	v-lineare-algebra-2-ss-2020-dozentin	\N	4	8	1595597956	12	\N	2020-07-24 13:39:16.058555	2026-08-24 19:07:37.878066	f
4	(V) Vignetten, SS 2026 [DozentIn]	v-vignetten-ss-2026-dozentin	\N	2	6	1787598456	6	\N	2026-08-24 19:07:36.646902	2026-08-24 19:07:36.903123	f
7	(S) Seminar SS 2026, SS 2026 [DozentIn]	s-seminar-ss-2026-ss-2026-dozentin	\N	2	6	1787598457	14	\N	2026-08-24 19:07:37.982436	2026-08-24 19:07:38.221852	f
5	(PS) Elementare Zahlentheorie, SS 2026 [DozentIn]	ps-elementare-zahlentheorie-ss-2026-dozentin	\N	2	6	1787598457	8	\N	2026-08-24 19:07:37.007348	2026-08-24 19:07:37.237993	f
8	(S) Demo Roster Seminar, SS 2026 [DozentIn]	s-demo-roster-seminar-ss-2026-dozentin	\N	2	6	1787598458	16	\N	2026-08-24 19:07:38.322225	2026-08-24 19:07:38.542184	f
\.


--
-- Data for Name: thredded_notifications_for_followed_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_followed_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- Data for Name: thredded_notifications_for_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_notifications_for_private_topics (id, user_id, notifier_key, enabled) FROM stdin;
\.


--
-- Data for Name: thredded_post_moderation_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_post_moderation_records (id, post_id, messageboard_id, post_content, post_user_id, post_user_name, moderator_id, moderation_state, previous_moderation_state, created_at) FROM stdin;
\.


--
-- Data for Name: thredded_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_posts (id, user_id, content, source, postable_id, messageboard_id, moderation_state, created_at, updated_at) FROM stdin;
1	2	Klappt das?	web	1	1	0	2020-07-24 15:13:56.535875	2020-07-24 15:13:56.535875
2	\N	ssssss	web	2	1	0	2020-09-03 11:09:21.527677	2020-09-03 11:09:21.527677
3	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	3	3	0	2026-08-24 19:07:36.209185	2026-08-24 19:07:36.209185
4	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	3	3	0	2026-08-24 19:07:36.386884	2026-08-24 19:07:36.386884
5	2	Danke, damit hat es geklappt.	web	3	3	0	2026-08-24 19:07:36.438352	2026-08-24 19:07:36.438352
6	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	4	3	0	2026-08-24 19:07:36.512674	2026-08-24 19:07:36.512674
7	8	Kann man da noch dazukommen?	web	4	3	0	2026-08-24 19:07:36.55593	2026-08-24 19:07:36.55593
8	2	Klar, kommt einfach vorbei.	web	4	3	0	2026-08-24 19:07:36.5939	2026-08-24 19:07:36.5939
9	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	5	4	0	2026-08-24 19:07:36.71969	2026-08-24 19:07:36.71969
10	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	5	4	0	2026-08-24 19:07:36.764284	2026-08-24 19:07:36.764284
11	2	Danke, damit hat es geklappt.	web	5	4	0	2026-08-24 19:07:36.812403	2026-08-24 19:07:36.812403
12	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	6	4	0	2026-08-24 19:07:36.881106	2026-08-24 19:07:36.881106
13	8	Kann man da noch dazukommen?	web	6	4	0	2026-08-24 19:07:36.924365	2026-08-24 19:07:36.924365
14	2	Klar, kommt einfach vorbei.	web	6	4	0	2026-08-24 19:07:36.965773	2026-08-24 19:07:36.965773
15	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	7	5	0	2026-08-24 19:07:37.066204	2026-08-24 19:07:37.066204
16	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	7	5	0	2026-08-24 19:07:37.108713	2026-08-24 19:07:37.108713
17	2	Danke, damit hat es geklappt.	web	7	5	0	2026-08-24 19:07:37.141325	2026-08-24 19:07:37.141325
18	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	8	5	0	2026-08-24 19:07:37.215985	2026-08-24 19:07:37.215985
19	8	Kann man da noch dazukommen?	web	8	5	0	2026-08-24 19:07:37.260733	2026-08-24 19:07:37.260733
20	2	Klar, kommt einfach vorbei.	web	8	5	0	2026-08-24 19:07:37.296129	2026-08-24 19:07:37.296129
21	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	9	6	0	2026-08-24 19:07:37.401392	2026-08-24 19:07:37.401392
22	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	9	6	0	2026-08-24 19:07:37.440927	2026-08-24 19:07:37.440927
23	2	Danke, damit hat es geklappt.	web	9	6	0	2026-08-24 19:07:37.472979	2026-08-24 19:07:37.472979
24	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	10	6	0	2026-08-24 19:07:37.542413	2026-08-24 19:07:37.542413
25	8	Kann man da noch dazukommen?	web	10	6	0	2026-08-24 19:07:37.584625	2026-08-24 19:07:37.584625
26	2	Klar, kommt einfach vorbei.	web	10	6	0	2026-08-24 19:07:37.622194	2026-08-24 19:07:37.622194
27	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	11	1	0	2026-08-24 19:07:37.708538	2026-08-24 19:07:37.708538
28	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	11	1	0	2026-08-24 19:07:37.747314	2026-08-24 19:07:37.747314
29	2	Danke, damit hat es geklappt.	web	11	1	0	2026-08-24 19:07:37.783554	2026-08-24 19:07:37.783554
30	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	12	1	0	2026-08-24 19:07:37.862329	2026-08-24 19:07:37.862329
31	8	Kann man da noch dazukommen?	web	12	1	0	2026-08-24 19:07:37.903817	2026-08-24 19:07:37.903817
32	2	Klar, kommt einfach vorbei.	web	12	1	0	2026-08-24 19:07:37.939893	2026-08-24 19:07:37.939893
33	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	13	7	0	2026-08-24 19:07:38.042774	2026-08-24 19:07:38.042774
34	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	13	7	0	2026-08-24 19:07:38.085073	2026-08-24 19:07:38.085073
35	2	Danke, damit hat es geklappt.	web	13	7	0	2026-08-24 19:07:38.122726	2026-08-24 19:07:38.122726
36	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	14	7	0	2026-08-24 19:07:38.199226	2026-08-24 19:07:38.199226
37	8	Kann man da noch dazukommen?	web	14	7	0	2026-08-24 19:07:38.250048	2026-08-24 19:07:38.250048
38	2	Klar, kommt einfach vorbei.	web	14	7	0	2026-08-24 19:07:38.280481	2026-08-24 19:07:38.280481
39	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	15	8	0	2026-08-24 19:07:38.3782	2026-08-24 19:07:38.3782
40	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	15	8	0	2026-08-24 19:07:38.418946	2026-08-24 19:07:38.418946
41	2	Danke, damit hat es geklappt.	web	15	8	0	2026-08-24 19:07:38.45892	2026-08-24 19:07:38.45892
42	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	16	8	0	2026-08-24 19:07:38.525632	2026-08-24 19:07:38.525632
43	8	Kann man da noch dazukommen?	web	16	8	0	2026-08-24 19:07:38.571411	2026-08-24 19:07:38.571411
44	2	Klar, kommt einfach vorbei.	web	16	8	0	2026-08-24 19:07:38.604839	2026-08-24 19:07:38.604839
45	6	Ich komme bei Teil b) nicht weiter. Hat jemand einen Tipp?	web	17	9	0	2026-08-24 19:07:38.698027	2026-08-24 19:07:38.698027
46	8	Schau Dir Satz 4.2 an, damit lässt sich der Term abschätzen.	web	17	9	0	2026-08-24 19:07:38.737571	2026-08-24 19:07:38.737571
47	2	Danke, damit hat es geklappt.	web	17	9	0	2026-08-24 19:07:38.77104	2026-08-24 19:07:38.77104
48	6	Wir treffen uns donnerstags um 16 Uhr in der Mathematikbibliothek.	web	18	9	0	2026-08-24 19:07:38.835195	2026-08-24 19:07:38.835195
49	8	Kann man da noch dazukommen?	web	18	9	0	2026-08-24 19:07:38.87517	2026-08-24 19:07:38.87517
50	2	Klar, kommt einfach vorbei.	web	18	9	0	2026-08-24 19:07:38.904318	2026-08-24 19:07:38.904318
\.


--
-- Data for Name: thredded_private_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_posts (id, user_id, content, postable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_private_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_topics (id, user_id, last_user_id, title, slug, posts_count, hash_id, last_post_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_private_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_private_users (id, private_topic_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_topic_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topic_categories (id, topic_id, category_id) FROM stdin;
\.


--
-- Data for Name: thredded_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_topics (id, user_id, last_user_id, title, slug, messageboard_id, posts_count, sticky, locked, hash_id, moderation_state, last_post_at, created_at, updated_at) FROM stdin;
1	2	2	Testpost in der Docker-Umgebung	testpost-in-der-docker-umgebung	1	1	f	f	755be586701a955a9678	0	2020-07-24 15:13:56.535875	2020-07-24 15:13:56.506852	2020-07-24 15:13:56.632465
2	\N	\N	neuer Testpost	neuer-testpost	1	1	f	f	f62fa65b5e6217e961af	0	2020-09-03 11:09:21.527677	2020-09-03 11:09:21.498003	2020-09-03 11:09:21.629468
16	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-s-demo-roster-seminar-ss-2026-dozentin	8	3	f	f	d0a6622228e05707fec0	0	2026-08-24 19:07:38.604839	2026-08-24 19:07:38.507492	2026-08-24 19:07:38.614734
7	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-ps-elementare-zahlentheorie-ss-2026-dozentin	5	3	f	f	18992fa4ff168113cc1d	0	2026-08-24 19:07:37.141325	2026-08-24 19:07:37.050812	2026-08-24 19:07:37.155542
3	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2	3	3	f	f	d747e0b4f21bd9c9abe7	0	2026-08-24 19:07:36.438352	2026-08-24 19:07:36.115528	2026-08-24 19:07:36.448405
4	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur	3	3	f	f	b80256aff0e6a69fcd6e	0	2026-08-24 19:07:36.5939	2026-08-24 19:07:36.478534	2026-08-24 19:07:36.604345
5	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-v-vignetten-ss-2026-dozentin	4	3	f	f	ed7c8846f3e9b0a820f3	0	2026-08-24 19:07:36.812403	2026-08-24 19:07:36.69695	2026-08-24 19:07:36.825045
8	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-ps-elementare-zahlentheorie-ss-2026-dozentin	5	3	f	f	56141f5ea4dc90045b4b	0	2026-08-24 19:07:37.296129	2026-08-24 19:07:37.189886	2026-08-24 19:07:37.306858
6	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-v-vignetten-ss-2026-dozentin	4	3	f	f	f4d2d296175b37732b00	0	2026-08-24 19:07:36.965773	2026-08-24 19:07:36.863086	2026-08-24 19:07:36.977272
11	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-v-lineare-algebra-2-ss-2026-dozentin	1	3	f	f	e649f9d345b7d3603c27	0	2026-08-24 19:07:37.783554	2026-08-24 19:07:37.683869	2026-08-24 19:07:37.79554
9	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-v-analysis-ss-2026-ss-2026-dozentin	6	3	f	f	d1c89412675b35d43a5c	0	2026-08-24 19:07:37.472979	2026-08-24 19:07:37.381846	2026-08-24 19:07:37.487051
10	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-v-analysis-ss-2026-ss-2026-dozentin	6	3	f	f	909e6416983830998752	0	2026-08-24 19:07:37.622194	2026-08-24 19:07:37.524964	2026-08-24 19:07:37.635644
14	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-s-seminar-ss-2026-ss-2026-dozentin	7	3	f	f	5a19ec6e004f7c3e7b2d	0	2026-08-24 19:07:38.280481	2026-08-24 19:07:38.178819	2026-08-24 19:07:38.291481
12	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-v-lineare-algebra-2-ss-2026-dozentin	1	3	f	f	ed15b7ec263953255c0f	0	2026-08-24 19:07:37.939893	2026-08-24 19:07:37.840696	2026-08-24 19:07:37.95162
13	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-s-seminar-ss-2026-ss-2026-dozentin	7	3	f	f	96eab6f1a3ac3c0cbddb	0	2026-08-24 19:07:38.122726	2026-08-24 19:07:38.018279	2026-08-24 19:07:38.137318
15	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-s-demo-roster-seminar-ss-2026-dozentin	8	3	f	f	d258eb1819d80f8ee382	0	2026-08-24 19:07:38.45892	2026-08-24 19:07:38.360546	2026-08-24 19:07:38.4689
17	6	2	Frage zu Blatt 3, Aufgabe 2	frage-zu-blatt-3-aufgabe-2-s-campaign-test-seminar-ss-2026-dozentin	9	3	f	f	31a6b27d951dda166bac	0	2026-08-24 19:07:38.77104	2026-08-24 19:07:38.678903	2026-08-24 19:07:38.780693
18	6	2	Lerngruppe für die Klausur	lerngruppe-fuer-die-klausur-s-campaign-test-seminar-ss-2026-dozentin	9	3	f	f	7f2223983a4d76b6dcc1	0	2026-08-24 19:07:38.904318	2026-08-24 19:07:38.818868	2026-08-24 19:07:38.913642
\.


--
-- Data for Name: thredded_user_details; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_details (id, user_id, latest_activity_at, posts_count, topics_count, last_seen_at, moderation_state, moderation_state_changed_at, created_at, updated_at) FROM stdin;
3	6	\N	16	16	\N	0	\N	2026-08-24 19:07:36.094516	2026-08-24 19:07:36.094516
4	8	\N	16	0	\N	0	\N	2026-08-24 19:07:36.382702	2026-08-24 19:07:36.382702
1	2	\N	17	1	2020-07-24 15:13:57.225997	0	\N	2020-07-24 15:13:41.254846	2020-07-24 15:13:57.240353
\.


--
-- Data for Name: thredded_user_messageboard_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_messageboard_preferences (id, user_id, messageboard_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_post_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_post_notifications (id, user_id, post_id, notified_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_preferences; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_preferences (id, user_id, follow_topics_on_mention, auto_follow_topics, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_private_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_private_topic_read_states (id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
\.


--
-- Data for Name: thredded_user_topic_follows; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_follows (id, user_id, topic_id, created_at, reason) FROM stdin;
1	2	1	2020-07-24 15:13:56.61965	1
3	6	3	2026-08-24 19:07:36.331992	1
4	8	3	2026-08-24 19:07:36.4204	1
5	2	3	2026-08-24 19:07:36.460404	1
6	6	4	2026-08-24 19:07:36.545466	1
7	8	4	2026-08-24 19:07:36.585241	1
8	2	4	2026-08-24 19:07:36.615794	1
9	6	5	2026-08-24 19:07:36.755876	1
10	8	5	2026-08-24 19:07:36.791389	1
11	2	5	2026-08-24 19:07:36.838052	1
12	6	6	2026-08-24 19:07:36.915983	1
13	8	6	2026-08-24 19:07:36.955469	1
14	2	6	2026-08-24 19:07:36.991148	1
15	6	7	2026-08-24 19:07:37.100535	1
16	8	7	2026-08-24 19:07:37.132419	1
17	2	7	2026-08-24 19:07:37.16865	1
18	6	8	2026-08-24 19:07:37.251039	1
19	8	8	2026-08-24 19:07:37.283815	1
20	2	8	2026-08-24 19:07:37.31894	1
21	6	9	2026-08-24 19:07:37.432878	1
22	8	9	2026-08-24 19:07:37.464755	1
23	2	9	2026-08-24 19:07:37.501014	1
24	6	10	2026-08-24 19:07:37.575505	1
25	8	10	2026-08-24 19:07:37.613147	1
26	2	10	2026-08-24 19:07:37.651359	1
27	6	11	2026-08-24 19:07:37.738935	1
28	8	11	2026-08-24 19:07:37.773026	1
29	2	11	2026-08-24 19:07:37.811543	1
30	6	12	2026-08-24 19:07:37.895917	1
31	8	12	2026-08-24 19:07:37.929171	1
32	2	12	2026-08-24 19:07:37.968422	1
33	6	13	2026-08-24 19:07:38.074769	1
34	8	13	2026-08-24 19:07:38.114402	1
35	2	13	2026-08-24 19:07:38.149019	1
36	6	14	2026-08-24 19:07:38.237519	1
37	8	14	2026-08-24 19:07:38.271716	1
38	2	14	2026-08-24 19:07:38.307787	1
39	6	15	2026-08-24 19:07:38.41085	1
40	8	15	2026-08-24 19:07:38.449635	1
41	2	15	2026-08-24 19:07:38.480554	1
42	6	16	2026-08-24 19:07:38.558485	1
43	8	16	2026-08-24 19:07:38.595722	1
44	2	16	2026-08-24 19:07:38.631925	1
45	6	17	2026-08-24 19:07:38.729128	1
46	8	17	2026-08-24 19:07:38.76331	1
47	2	17	2026-08-24 19:07:38.792003	1
48	6	18	2026-08-24 19:07:38.862713	1
49	8	18	2026-08-24 19:07:38.895762	1
50	2	18	2026-08-24 19:07:38.929916	1
\.


--
-- Data for Name: thredded_user_topic_read_states; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.thredded_user_topic_read_states (id, messageboard_id, user_id, postable_id, unread_posts_count, read_posts_count, "integer", read_at) FROM stdin;
1	1	2	1	0	1	0	2020-07-24 15:13:56.535875
\.


--
-- Data for Name: tutor_tutorial_joins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutor_tutorial_joins (id, tutorial_id, tutor_id, created_at, updated_at) FROM stdin;
1	1	10	2020-11-28 16:42:53.098756	2020-11-28 16:42:53.098756
\.


--
-- Data for Name: tutorial_memberships; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutorial_memberships (id, user_id, tutorial_id, source_campaign_id, created_at, updated_at, lecture_id) FROM stdin;
6f02dbc4-c0c3-40e3-b2eb-bc0f3cb34393	14	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
930029ab-0b27-418e-962c-3ffc115f249e	21	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
e7dca946-e087-4596-b53c-dd66fab75a4d	25	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
6af071eb-2fa5-4173-b234-9aef64d17411	28	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
bfef4a0e-c98f-4e89-8c3f-580c9d3b4a94	29	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
ecd8c3b0-14bb-4705-b349-111857b9771d	30	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
5e835e14-a768-472f-a765-61310b671e17	32	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
190404cd-bb70-43bc-a43a-d3c7469bc999	35	4	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:15.96405	2026-08-24 19:07:15.96405	1
144cc2e9-c3ce-42ef-aa89-dbcbfa1d8b00	16	5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.029686	2026-08-24 19:07:16.029686	1
73334547-570f-4aae-b8df-4260e7c0f4b3	18	5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.029686	2026-08-24 19:07:16.029686	1
5c943459-4c85-4882-b4b5-c3100ffaab3d	34	5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.029686	2026-08-24 19:07:16.029686	1
56698334-b604-433a-913f-2cc5a0d4b523	36	5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.029686	2026-08-24 19:07:16.029686	1
5dd135d1-6d62-4676-9159-730cb02944c2	41	5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.029686	2026-08-24 19:07:16.029686	1
12dc7a4e-f213-4ad6-85ef-09317e10e948	43	5	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.029686	2026-08-24 19:07:16.029686	1
d70ae510-2766-4fae-9955-cf7c4f8c4ab7	15	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
99975a32-b21b-47e5-9778-8a7a5c7f25bc	19	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
0b38eec8-6798-4f9c-b4aa-8d3b24e67cd7	20	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
31d06145-74f4-411d-b194-c4bc8f4d4ebd	26	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
54b30f83-986a-4f23-9d0c-caa0d84dbe67	31	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
76f513f9-3095-409d-9cd4-5ff6db6e2012	33	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
d20697ac-4de5-4a13-93ea-a183cae6f9e5	37	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
27b336b7-341f-4e8f-822c-9134781d48d0	38	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
cbb97de8-77d1-4770-a204-dc7499fe633c	42	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
43ee8063-755c-421a-9e28-4051197bd10b	44	2	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.042435	2026-08-24 19:07:16.042435	1
65d4e1f5-b36f-49e8-ab38-6a0f4435011c	17	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
a4a44433-274c-483b-ab72-fa088901235a	22	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
5d230fe9-b579-40e1-881c-3e00ee2cf008	23	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
6398833c-d0b4-461d-862c-c262f7139813	24	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
9bdeab10-8912-4ac4-b7bc-ea37fe53cb69	27	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
3b5c32f8-46f0-4544-906b-ce80c190f2e5	39	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
4be6f1f8-326c-431b-bb9b-301aa99a95bf	40	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
0c73c404-c61e-428b-bbc7-721b9ec00a56	45	3	bba99d9b-ba58-4693-89bd-9b3a4aa953b7	2026-08-24 19:07:16.051262	2026-08-24 19:07:16.051262	1
\.


--
-- Data for Name: tutorials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tutorials (id, title, lecture_id, created_at, updated_at, capacity, skip_campaigns, self_materialization_mode, location) FROM stdin;
1	Mo 14-16	1	2020-11-28 16:42:53.096527	2020-11-28 16:42:53.096527	\N	t	0	\N
2	Demo Tutorial 1	1	2026-08-24 19:07:11.499443	2026-08-24 19:07:11.499443	10	f	0	\N
3	Demo Tutorial 2	1	2026-08-24 19:07:11.574808	2026-08-24 19:07:11.574808	8	f	0	\N
4	Demo Tutorial 3	1	2026-08-24 19:07:11.588465	2026-08-24 19:07:11.588465	8	f	0	\N
5	Demo Tutorial 4	1	2026-08-24 19:07:11.59494	2026-08-24 19:07:11.59494	6	f	0	\N
6	Tutorial 1	1	2026-08-24 19:07:19.060462	2026-08-24 19:07:19.060462	20	f	0	INF 205
7	Tutorial 2	1	2026-08-24 19:07:19.078626	2026-08-24 19:07:19.078626	15	f	0	INF 205
8	Tutorial 3	1	2026-08-24 19:07:19.089568	2026-08-24 19:07:19.089568	10	f	0	INF 205
9	Tutorial 4	1	2026-08-24 19:07:19.098138	2026-08-24 19:07:19.098138	5	f	0	INF 205
10	FCFS Tutorial 5	1	2026-08-24 19:07:25.009173	2026-08-24 19:07:25.009173	12	f	0	INF 205
11	FCFS Tutorial 6	1	2026-08-24 19:07:25.01956	2026-08-24 19:07:25.01956	10	f	0	INF 205
12	FCFS Tutorial 7	1	2026-08-24 19:07:25.02661	2026-08-24 19:07:25.02661	8	f	0	INF 205
13	12 Angry Men 1913988202	32	2026-08-24 19:07:32.492876	2026-08-24 19:07:32.492876	12	f	0	INF 205
14	The Lord of the Rings: The Two Towers 5139684190	32	2026-08-24 19:07:32.50087	2026-08-24 19:07:32.50087	12	f	0	INF 205
15	Spirited Away 5041957082	32	2026-08-24 19:07:32.510033	2026-08-24 19:07:32.510033	12	f	0	INF 205
16	Once Upon a Time in America 8875989021	32	2026-08-24 19:07:32.519404	2026-08-24 19:07:32.519404	12	f	0	INF 205
17	Shutter Island 9522712487	34	2026-08-24 19:07:32.885231	2026-08-24 19:07:32.885231	12	f	0	INF 205
18	Nuovo Cinema Paradiso 9176944912	34	2026-08-24 19:07:32.89259	2026-08-24 19:07:32.89259	12	f	0	INF 205
19	Prisoners 2085406832	34	2026-08-24 19:07:32.902463	2026-08-24 19:07:32.902463	12	f	0	INF 205
20	Full Metal Jacket 4608107363	34	2026-08-24 19:07:32.910349	2026-08-24 19:07:32.910349	12	f	0	INF 205
\.


--
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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, admin, subscription_type, consents, consented_at, name, homepage, no_notifications, locale, email_for_medium, email_for_announcement, email_for_teachable, email_for_news, current_lecture_id, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, unread_comments, email_for_submission_upload, email_for_submission_removal, email_for_submission_join, email_for_submission_leave, email_for_correction_upload, email_for_submission_decision, name_in_tutorials, archived, locked_at, image_data, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, deletion_date, failed_attempts, unlock_token) FROM stdin;
18	demo_lecture_student_4@example.com	$2a$11$ABQ41/vSXufgbA8KF2m/OuCju1kPXgd66r5RYbDD74dcFjMmvghs.	\N	\N	\N	2026-08-24 19:07:12.278569	2026-08-24 19:07:41.149962	f	1	t	2026-08-24 19:07:12.2785	Demo Lecture Student 4	\N	f	en	\N	\N	\N	\N	\N	JNx6mKEy11scYYvMryxs	2026-08-24 19:07:12.281334	2026-08-24 19:07:12.278654	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
19	demo_lecture_student_5@example.com	$2a$11$vNnggZZ.d9ppp6tanBD5d.PqqsGsKSQdtfzuJN6nRrcH9hyCDXnxi	\N	\N	\N	2026-08-24 19:07:12.384378	2026-08-24 19:07:41.244877	f	1	t	2026-08-24 19:07:12.384338	Demo Lecture Student 5	\N	f	en	\N	\N	\N	\N	\N	AGY5xoSzWAfLsB84ZQr8	2026-08-24 19:07:12.387538	2026-08-24 19:07:12.384413	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
20	demo_lecture_student_6@example.com	$2a$11$AG6w8WcPbuyA7EViD/6/XeK7b8JgDj4mvU7dAyKfuP5LM3uaEGb1C	\N	\N	\N	2026-08-24 19:07:12.485438	2026-08-24 19:07:41.33978	f	1	t	2026-08-24 19:07:12.485369	Demo Lecture Student 6	\N	f	en	\N	\N	\N	\N	\N	XmDn8ct4ikJDFg2sMKby	2026-08-24 19:07:12.48787	2026-08-24 19:07:12.485474	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
21	demo_lecture_student_7@example.com	$2a$11$eU0VlpxHFlzUKo1SNRpb4u8j564ciKu1n9mW/7/YzzwXyLiZSfq1u	\N	\N	\N	2026-08-24 19:07:12.593072	2026-08-24 19:07:41.433848	f	1	t	2026-08-24 19:07:12.593027	Demo Lecture Student 7	\N	f	en	\N	\N	\N	\N	\N	BTa1q7Aa5aLu8Nivu94q	2026-08-24 19:07:12.597104	2026-08-24 19:07:12.593109	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
22	demo_lecture_student_8@example.com	$2a$11$0woCa35TNiz5N4xD0hTrc.UkPubbcPb8/0vp0BRvwFW07qA0zhhWq	\N	\N	\N	2026-08-24 19:07:12.69957	2026-08-24 19:07:41.528398	f	1	t	2026-08-24 19:07:12.699532	Demo Lecture Student 8	\N	f	en	\N	\N	\N	\N	\N	DpY-AmqcofToTj7doQTB	2026-08-24 19:07:12.732618	2026-08-24 19:07:12.699606	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
23	demo_lecture_student_9@example.com	$2a$11$SNnY8i3cbORoaPstGSJfveCsAAdxcfkSys0yRkVP0.RRPL7//pGkO	\N	\N	\N	2026-08-24 19:07:12.84054	2026-08-24 19:07:41.622496	f	1	t	2026-08-24 19:07:12.840495	Demo Lecture Student 9	\N	f	en	\N	\N	\N	\N	\N	_fyPshhBsqsLf6ccqLKz	2026-08-24 19:07:12.843795	2026-08-24 19:07:12.840577	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
24	demo_lecture_student_10@example.com	$2a$11$go7CRuLrl1/XfkUPI/1IvuNNtPUxP59dZeafAZflbfHYsR2W6N0Su	\N	\N	\N	2026-08-24 19:07:12.94777	2026-08-24 19:07:41.718723	f	1	t	2026-08-24 19:07:12.947736	Demo Lecture Student 10	\N	f	en	\N	\N	\N	\N	\N	z7Rd5s7yFaZdvsrURiCm	2026-08-24 19:07:12.950555	2026-08-24 19:07:12.947803	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
25	demo_lecture_student_11@example.com	$2a$11$8uEfo/Um.ORP2xBUABTZ3efp.mTmY5yTQ43mcp/y9Z0q87lTEE2UC	\N	\N	\N	2026-08-24 19:07:13.056146	2026-08-24 19:07:41.814478	f	1	t	2026-08-24 19:07:13.056112	Demo Lecture Student 11	\N	f	en	\N	\N	\N	\N	\N	Etn7s1AgBKbdEAyugPj4	2026-08-24 19:07:13.059978	2026-08-24 19:07:13.05618	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
26	demo_lecture_student_12@example.com	$2a$11$yl5Bu4qk2SAsyKajIqNveugoV7Kd/EymMv5EwiQ98LgrmWoq47/Ny	\N	\N	\N	2026-08-24 19:07:13.16046	2026-08-24 19:07:41.909411	f	1	t	2026-08-24 19:07:13.160423	Demo Lecture Student 12	\N	f	en	\N	\N	\N	\N	\N	_22BXe8RadwaTP6R_79E	2026-08-24 19:07:13.163756	2026-08-24 19:07:13.160494	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
27	demo_lecture_student_13@example.com	$2a$11$ZHW23oniz8PhvocbYl.rjuTp2kF2hrzNJlYcNWr8d7Fi96twsQeYy	\N	\N	\N	2026-08-24 19:07:13.259705	2026-08-24 19:07:42.004483	f	1	t	2026-08-24 19:07:13.259673	Demo Lecture Student 13	\N	f	en	\N	\N	\N	\N	\N	5ni5qKycWeaLND1x9FZJ	2026-08-24 19:07:13.262216	2026-08-24 19:07:13.259737	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
28	demo_lecture_student_14@example.com	$2a$11$vdTLUMebFKVu6M3UcwSUMOJU8Xzd2GSr519fl0RJoMPjQ3lJhfLyO	\N	\N	\N	2026-08-24 19:07:13.360019	2026-08-24 19:07:42.099815	f	1	t	2026-08-24 19:07:13.35998	Demo Lecture Student 14	\N	f	en	\N	\N	\N	\N	\N	2XvLcVQRaxoGHwzKy-EW	2026-08-24 19:07:13.362595	2026-08-24 19:07:13.360053	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
29	demo_lecture_student_15@example.com	$2a$11$/1YL/c2DK/P7U3QfRk.kgutskbQz44JGMiPsceTOpMej1Qlpx4fK6	\N	\N	\N	2026-08-24 19:07:13.458269	2026-08-24 19:07:42.196909	f	1	t	2026-08-24 19:07:13.458237	Demo Lecture Student 15	\N	f	en	\N	\N	\N	\N	\N	r-DmiPys4LPf6rHt5euK	2026-08-24 19:07:13.462622	2026-08-24 19:07:13.45852	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
30	demo_lecture_student_16@example.com	$2a$11$bKWprT/YAQEiyaUXOZ1Alupe9lZ7pBGqOCQCcjDA7hBDlXpy7bXfi	\N	\N	\N	2026-08-24 19:07:13.558559	2026-08-24 19:07:42.297601	f	1	t	2026-08-24 19:07:13.558084	Demo Lecture Student 16	\N	f	en	\N	\N	\N	\N	\N	9mx9DvYy7DMuMY8BnXFS	2026-08-24 19:07:13.561587	2026-08-24 19:07:13.558603	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
31	demo_lecture_student_17@example.com	$2a$11$WTL3UkP4/CgCpDOO6qhZX.3rWmPksMlkOTpM9Gw0h7PUWPSgxTrHS	\N	\N	\N	2026-08-24 19:07:13.660922	2026-08-24 19:07:42.39331	f	1	t	2026-08-24 19:07:13.660895	Demo Lecture Student 17	\N	f	en	\N	\N	\N	\N	\N	W4nWZbFKL55tXn3_VXfU	2026-08-24 19:07:13.663201	2026-08-24 19:07:13.660951	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
32	demo_lecture_student_18@example.com	$2a$11$ntgxbIO5zjgcuqVgEgtPJOH8oSZKkAm5tO/fYLwPO44IF8BTTlt7O	\N	\N	\N	2026-08-24 19:07:13.764179	2026-08-24 19:07:42.489426	f	1	t	2026-08-24 19:07:13.764152	Demo Lecture Student 18	\N	f	en	\N	\N	\N	\N	\N	TZXfo_YexNjs4PhEUcHY	2026-08-24 19:07:13.766681	2026-08-24 19:07:13.76421	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
1	admin@mampf.edu	$2a$11$3ULP5YOT0U04HVmZMhNVI.yeMQ6gMAIIWlUPoAxcIEkHOTrszrcuG	\N	\N	\N	2020-07-24 13:07:48.807973	2026-08-24 19:07:39.809323	t	1	t	2020-07-24 13:07:48.811417	admin	\N	f	en	t	t	t	t	\N	UguwyiyL_B65bQkMZMQf	2020-07-24 13:07:56.770723	2020-07-24 13:07:48.808231	\N	t	f	f	f	f	f	f		\N	\N	\N	3	2025-07-15 12:02:24.48997	2025-07-14 11:35:13.666864	\N	\N	\N	0	\N
5	student1@mampf.edu	$2a$11$VyECxmeUmndBDAQME0D2Ku7Hm0K5giFUItupuwk4h9DggieUprg5q	\N	\N	\N	2020-11-28 16:25:23.437946	2026-08-24 19:07:39.999508	f	1	t	2020-11-28 16:25:23.440059	student1	\N	f	en	f	f	f	t	\N	qwPPGpBwzjn7o_NE1cMd	2020-11-28 16:25:28.248539	2020-11-28 16:25:23.438158	\N	t	t	t	t	t	t	t	Max Mustermann	\N	\N	\N	6	2025-07-15 12:12:31.120017	2025-07-15 12:10:11.284039	\N	\N	\N	0	\N
7	student3@mampf.edu	$2a$11$T5uh/soAlHCQSICyENXxLOlLwerMW1YQE8nuCINbNtQ4rHx1yachC	\N	\N	\N	2020-11-28 16:28:02.121432	2026-08-24 19:07:40.187734	f	1	t	2020-11-28 16:28:02.123082	student3	\N	f	en	t	t	t	f	\N	ZUzqyXACyQrBNVGGrWxm	2020-11-28 16:28:09.870025	2020-11-28 16:28:02.121486	\N	t	f	f	f	f	f	f	Berta Musterfrau	\N	\N	\N	3	2025-07-15 12:11:49.670511	2025-07-14 15:04:06.537713	\N	\N	\N	0	\N
9	student5@mampf.edu	$2a$11$/ah0Gs/HdH8G0zOVPQH4WeNKb8CKjIiQFzfXaRQyPujwtIoKYAbuK	\N	\N	\N	2020-11-28 16:30:12.956799	2026-08-24 19:07:40.375907	f	1	t	2020-11-28 16:30:12.958778	student5	\N	f	en	f	f	f	t	\N	eWAAGQqtUt9P31_dpHey	2020-11-28 16:30:18.870235	2020-11-28 16:30:12.956859	\N	t	t	t	t	t	t	t	Erika Musterfrau	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
2	teacher@mampf.edu	$2a$11$nsbgeYAj.m6jnKNnr5NQU.KGAuJUoUcjg1/4OBlczfA0evTJ8ltZ.	\N	\N	\N	2020-07-24 13:14:59.543985	2026-08-24 19:07:39.905492	f	1	t	2020-07-24 13:14:59.547776	DozentIn	\N	f	en	t	t	t	t	\N	quSs9sq1VAMQCbDgRyhU	2020-07-24 13:15:13.670023	2020-07-24 13:14:59.544082	\N	t	f	f	f	f	f	f		\N	\N	\N	12	2025-07-15 12:03:11.254407	2025-07-15 11:59:27.082351	\N	\N	\N	0	\N
6	student2@mampf.edu	$2a$11$28QtujgQwXmAkCv9uYCsHOnsyzQRTbx4k/bkHDD64PnZipYIuq53q	\N	\N	\N	2020-11-28 16:26:55.50289	2026-08-24 19:07:40.093602	f	1	t	2020-11-28 16:26:55.504637	student2	\N	f	en	t	t	t	f	\N	4DVzmJnsA4PJx9StS_Js	2020-11-28 16:27:07.826099	2020-11-28 16:26:55.502947	\N	t	f	f	f	f	f	f	Max Musterfrau	\N	\N	\N	4	2025-07-15 12:15:20.813542	2025-07-15 12:11:27.154704	\N	\N	\N	0	\N
10	tutor@mampf.edu	$2a$11$gEGNJVh91uYIRevvV/Tovuox7lWipGGScxalYHMG2zdo2gdKF6iSK	\N	\N	\N	2020-11-28 16:34:08.325163	2026-08-24 19:07:40.470534	f	1	t	2020-11-28 16:34:08.326859	tutor	\N	f	en	t	t	t	f	\N	dbg8mcD6CmtfAfgAfX4Q	2020-11-28 16:34:11.824042	2020-11-28 16:34:08.325214	\N	t	f	f	f	f	f	f	Benjamin Tutor	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
12	moded@mampf.edu	$2a$11$jVES7.idVdi/AYW7GDI78.o6aCn1HZ5uinb730mnIcBqNF3affumO	\N	\N	\N	2022-08-05 13:13:27.138526	2026-08-24 19:07:40.577006	f	1	t	2022-08-05 13:13:27.140572	moded	\N	f	en	f	f	f	f	\N	GEw-LMkj1zw73bsu-Jy5	2022-08-05 13:13:35.913881	2022-08-05 13:13:27.138906	\N	f	f	f	f	f	f	f		\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
15	demo_lecture_student_1@example.com	$2a$11$lGV7P60QbpOjnCXQcwTaueB5laAdRqwAajUwocd.Ai14cRB98iiLq	\N	\N	\N	2026-08-24 19:07:11.968404	2026-08-24 19:07:40.865038	f	1	t	2026-08-24 19:07:11.968364	Demo Lecture Student 1	\N	f	en	\N	\N	\N	\N	\N	Uf1dZ3gi2uLo9jo1Zxts	2026-08-24 19:07:11.974183	2026-08-24 19:07:11.968441	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
8	student4@mampf.edu	$2a$11$jTB48U0UkdtJqVR46gmREO2knLUPBlxNihiQ0g1t.89TXq/XDyZS.	\N	\N	\N	2020-11-28 16:29:07.923841	2026-08-24 19:07:40.281631	f	1	t	2020-11-28 16:29:07.925959	student4	\N	f	en	t	t	t	f	\N	j5hzKj7ePDPVbKGJsyqx	2020-11-28 16:29:14.406097	2020-11-28 16:29:07.923915	\N	t	f	f	f	f	f	f	Berta Mustermann	\N	\N	\N	1	2025-07-14 11:29:25.560481	2025-07-14 11:29:25.560481	\N	\N	\N	0	\N
13	ed@mampf.edu	$2a$11$v.LBYRmK2sRCfOm0X.NHKOa.MXojPgTDUHWewnHuK1ijit.shMYtK	\N	\N	\N	2022-08-05 13:14:08.705536	2026-08-24 19:07:40.67386	f	1	t	2022-08-05 13:14:08.706967	ed	\N	f	en	f	f	f	f	\N	NhEfb358TxX5788uqSZy	2022-08-05 13:14:16.480332	2022-08-05 13:14:08.705583	\N	f	f	f	f	f	f	f		\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
14	demo_lecture_student_0@example.com	$2a$11$gVkW08rE9hdUr957pVXGOeyCsf2dBsEVwz7v0CrxJYhxmGjadpMlW	\N	\N	\N	2026-08-24 19:07:11.838823	2026-08-24 19:07:40.770358	f	1	t	2026-08-24 19:07:11.838772	Demo Lecture Student 0	\N	f	en	\N	\N	\N	\N	\N	WVio5yEzue7j1HVRpjfw	2026-08-24 19:07:11.852608	2026-08-24 19:07:11.839449	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
16	demo_lecture_student_2@example.com	$2a$11$qrCqbhRSJks16Bp1uUQacO1pJBh4wK2qfc7SfjKD8DXh1.i1evgUu	\N	\N	\N	2026-08-24 19:07:12.069437	2026-08-24 19:07:40.959687	f	1	t	2026-08-24 19:07:12.069401	Demo Lecture Student 2	\N	f	en	\N	\N	\N	\N	\N	eYBRHhk8wa_yBzGS8Z1o	2026-08-24 19:07:12.073817	2026-08-24 19:07:12.070786	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
17	demo_lecture_student_3@example.com	$2a$11$KIjdtQzMf5eoshPTDlGOUuRFcohy//x4oLQfGvDd47HkR30NLhAQ.	\N	\N	\N	2026-08-24 19:07:12.173229	2026-08-24 19:07:41.054478	f	1	t	2026-08-24 19:07:12.173191	Demo Lecture Student 3	\N	f	en	\N	\N	\N	\N	\N	DKa8WPGMKESCgD7jfe2y	2026-08-24 19:07:12.182441	2026-08-24 19:07:12.173263	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
38	demo_lecture_student_24@example.com	$2a$11$bNGavprJ6vsioYI9qJ.gHuz30AH2Bsy3yBMRHCIXXk6xWpXubyfw.	\N	\N	\N	2026-08-24 19:07:14.384229	2026-08-24 19:07:43.060853	f	1	t	2026-08-24 19:07:14.384197	Demo Lecture Student 24	\N	f	en	\N	\N	\N	\N	\N	5xKKtXsdRbtwbcTzmjzR	2026-08-24 19:07:14.386959	2026-08-24 19:07:14.384262	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
39	demo_lecture_student_25@example.com	$2a$11$QTWLiLSJknTRGeFkppeoAOACXdwN9uEAVb4/Sjj.Ve8d4t4IwgWem	\N	\N	\N	2026-08-24 19:07:14.481898	2026-08-24 19:07:43.157609	f	1	t	2026-08-24 19:07:14.481358	Demo Lecture Student 25	\N	f	en	\N	\N	\N	\N	\N	DwxEHUsGXrfL9a4e3XgR	2026-08-24 19:07:14.487289	2026-08-24 19:07:14.48194	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
40	demo_lecture_student_26@example.com	$2a$11$OO33/yJDD9bLpgZDeTH99uRZXpBhcZd8MbsHGAElLkOa.QhVwrcg.	\N	\N	\N	2026-08-24 19:07:14.588062	2026-08-24 19:07:43.252616	f	1	t	2026-08-24 19:07:14.588027	Demo Lecture Student 26	\N	f	en	\N	\N	\N	\N	\N	XG2221gV6NQcsDU6GsLb	2026-08-24 19:07:14.590768	2026-08-24 19:07:14.588099	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
41	demo_lecture_student_27@example.com	$2a$11$cY.fFTJPGtcexO9cdp.yLOJbDIBKMOELG0u67tpGZoLf2fvwouwTu	\N	\N	\N	2026-08-24 19:07:14.686225	2026-08-24 19:07:43.34868	f	1	t	2026-08-24 19:07:14.686201	Demo Lecture Student 27	\N	f	en	\N	\N	\N	\N	\N	sx4-jC5TLxMPgQqTxeT6	2026-08-24 19:07:14.68845	2026-08-24 19:07:14.686257	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
42	demo_lecture_student_28@example.com	$2a$11$yiWVnJ2f9IRkcfwavGwZ2uLOQTS9eRvjfYytpZzttPScdZw15gbZm	\N	\N	\N	2026-08-24 19:07:14.78697	2026-08-24 19:07:43.44413	f	1	t	2026-08-24 19:07:14.786941	Demo Lecture Student 28	\N	f	en	\N	\N	\N	\N	\N	fZG8Mhh6DjW7RGzfmLj7	2026-08-24 19:07:14.789505	2026-08-24 19:07:14.787002	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
43	demo_lecture_student_29@example.com	$2a$11$oDFl/lfFiaigKwIUju7K3.aDBvPeiFsTk2xDOvfGI0Pan9fx4L12.	\N	\N	\N	2026-08-24 19:07:14.890931	2026-08-24 19:07:43.540239	f	1	t	2026-08-24 19:07:14.890905	Demo Lecture Student 29	\N	f	en	\N	\N	\N	\N	\N	GvxxAyBfsLt4C-GN1pv4	2026-08-24 19:07:14.89345	2026-08-24 19:07:14.890961	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
44	demo_lecture_student_30@example.com	$2a$11$lMSam9Syy0vMXHBr68Xq0eHqLVkgrjYdRL4y89z.ioGHC21OJDqWG	\N	\N	\N	2026-08-24 19:07:14.990139	2026-08-24 19:07:43.642535	f	1	t	2026-08-24 19:07:14.990114	Demo Lecture Student 30	\N	f	en	\N	\N	\N	\N	\N	y5Pz4fPC4-R6zcxsfw9e	2026-08-24 19:07:14.992654	2026-08-24 19:07:14.990169	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
45	demo_lecture_student_31@example.com	$2a$11$jLQbgmLJDtHuLO2GMuYk5eUlytawl6.TyhGKEq33Ll4Q0KtuGsWi6	\N	\N	\N	2026-08-24 19:07:15.088428	2026-08-24 19:07:43.739864	f	1	t	2026-08-24 19:07:15.088401	Demo Lecture Student 31	\N	f	en	\N	\N	\N	\N	\N	bfMQ-usUNJSdA-Z7xVNE	2026-08-24 19:07:15.090703	2026-08-24 19:07:15.088458	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
46	demo_seminar_student_0@mampf.edu	$2a$11$QV/uCQwYwk4pqD90qQMzTOCPsuK1P.0.XCOxAD/wVLk2ny6HgvlG6	\N	\N	\N	2026-08-24 19:07:17.089927	2026-08-24 19:07:43.835999	f	1	t	2026-08-24 19:07:17.089602	Demo Seminar Student 0	\N	f	en	\N	\N	\N	\N	\N	FwQXkZMx5ZhSqsTdaAw1	2026-08-24 19:07:17.093014	2026-08-24 19:07:17.090048	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
47	demo_seminar_student_1@mampf.edu	$2a$11$BgIZtNGssxrIviE/O0ukcOb2hTtgJbCfRsP9nWVze/Ja7ASiRy.6W	\N	\N	\N	2026-08-24 19:07:17.192233	2026-08-24 19:07:43.930901	f	1	t	2026-08-24 19:07:17.192179	Demo Seminar Student 1	\N	f	en	\N	\N	\N	\N	\N	ByGLhhUAhmzx8iW6_-VN	2026-08-24 19:07:17.195268	2026-08-24 19:07:17.192301	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
48	demo_seminar_student_2@mampf.edu	$2a$11$z5C9xH14Bha.borhE2stkuTQFk57BTh/HdI3pONEM/iON2zhHb30e	\N	\N	\N	2026-08-24 19:07:17.291894	2026-08-24 19:07:44.026983	f	1	t	2026-08-24 19:07:17.291859	Demo Seminar Student 2	\N	f	en	\N	\N	\N	\N	\N	bG8RmsQsSFHTWR1_iuaT	2026-08-24 19:07:17.295586	2026-08-24 19:07:17.29193	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
50	demo_seminar_student_4@mampf.edu	$2a$11$34jBqEk4OuQaBeLvGRVoHeEWemZrJ4UT4rHp01Mydr5Of4NOAfqc2	\N	\N	\N	2026-08-24 19:07:17.490536	2026-08-24 19:07:44.216297	f	1	t	2026-08-24 19:07:17.490513	Demo Seminar Student 4	\N	f	en	\N	\N	\N	\N	\N	W3nxt1xK28FGZeECFCJs	2026-08-24 19:07:17.493031	2026-08-24 19:07:17.490567	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
49	demo_seminar_student_3@mampf.edu	$2a$11$lXFGFz9WuEFar2Ifj.CTzeJ5sLV2p3urj1VGG2wiuwWYMz6sGS3je	\N	\N	\N	2026-08-24 19:07:17.393176	2026-08-24 19:07:44.121492	f	1	t	2026-08-24 19:07:17.393146	Demo Seminar Student 3	\N	f	en	\N	\N	\N	\N	\N	oJB8KYkAAhE5bkyiwELe	2026-08-24 19:07:17.395642	2026-08-24 19:07:17.393209	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
51	demo_seminar_student_5@mampf.edu	$2a$11$1Oa3Lv1d4tTOrlnkQW7IqeJ8yAULvt94.xWKvWunQd8Ho4gxo9vHG	\N	\N	\N	2026-08-24 19:07:17.588916	2026-08-24 19:07:44.311987	f	1	t	2026-08-24 19:07:17.588893	Demo Seminar Student 5	\N	f	en	\N	\N	\N	\N	\N	SanBZurJVXwdw1w_gB_E	2026-08-24 19:07:17.591163	2026-08-24 19:07:17.588945	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
53	demo_seminar_student_7@mampf.edu	$2a$11$IoZOWwXOIcqYdAhWlfYsvuoBYORhxuvkQdtK.aIV7/LzaJ./KlM7a	\N	\N	\N	2026-08-24 19:07:17.78781	2026-08-24 19:07:44.503394	f	1	t	2026-08-24 19:07:17.787774	Demo Seminar Student 7	\N	f	en	\N	\N	\N	\N	\N	dguKZiA1-MK68i9v_PR-	2026-08-24 19:07:17.790544	2026-08-24 19:07:17.787845	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
52	demo_seminar_student_6@mampf.edu	$2a$11$AnmJhCEmzeUh3QTY.619EulI7i/ysscFc1ABWiz8FtrbpoAg/YM6K	\N	\N	\N	2026-08-24 19:07:17.688552	2026-08-24 19:07:44.407904	f	1	t	2026-08-24 19:07:17.688528	Demo Seminar Student 6	\N	f	en	\N	\N	\N	\N	\N	HbsTk576fpC_BWa9J2Lp	2026-08-24 19:07:17.69075	2026-08-24 19:07:17.688583	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
54	demo_seminar_student_8@mampf.edu	$2a$11$L449wEwxXYlxGuoch0CVcejirjbRdrG7QZXn8bH1BrZKH4qDYOQT.	\N	\N	\N	2026-08-24 19:07:17.887353	2026-08-24 19:07:44.599098	f	1	t	2026-08-24 19:07:17.887328	Demo Seminar Student 8	\N	f	en	\N	\N	\N	\N	\N	gKsukKoQfMyXc3F8y4Z-	2026-08-24 19:07:17.889937	2026-08-24 19:07:17.88741	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
55	demo_seminar_student_9@mampf.edu	$2a$11$28OpXJmvP0FeoqSSenvCZunyD3mfO4KIRRQTLCWKGbSnNpveaKlWK	\N	\N	\N	2026-08-24 19:07:17.987203	2026-08-24 19:07:44.694893	f	1	t	2026-08-24 19:07:17.987171	Demo Seminar Student 9	\N	f	en	\N	\N	\N	\N	\N	cUsp_HvANsZDU5yyT9zG	2026-08-24 19:07:17.990031	2026-08-24 19:07:17.987235	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
56	demo_seminar_student_10@mampf.edu	$2a$11$uxPgAC0HbH8HQhMiGctDM.FbEpJgP1zKaZdn9idFhANQKwui1mm2C	\N	\N	\N	2026-08-24 19:07:18.087117	2026-08-24 19:07:44.79114	f	1	t	2026-08-24 19:07:18.086705	Demo Seminar Student 10	\N	f	en	\N	\N	\N	\N	\N	FgRW4QEcwUw-75gTtjQB	2026-08-24 19:07:18.089799	2026-08-24 19:07:18.087158	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
57	demo_seminar_student_11@mampf.edu	$2a$11$iq3wp66GV6yRvP315yHZ5eH72KfiwiezhGjxaqcFUAouwyOQ98VgG	\N	\N	\N	2026-08-24 19:07:18.189506	2026-08-24 19:07:44.885427	f	1	t	2026-08-24 19:07:18.189218	Demo Seminar Student 11	\N	f	en	\N	\N	\N	\N	\N	zjmiGbiAzfVbsPP9ePu5	2026-08-24 19:07:18.19337	2026-08-24 19:07:18.190099	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
58	demo_seminar_rejected_0@example.com	$2a$11$Tb0z9kD6R8BV.e12ZsRkEuAZSGrW7smygu53b7TorTFTEom9hHLAm	\N	\N	\N	2026-08-24 19:07:18.292501	2026-08-24 19:07:44.981282	f	1	t	2026-08-24 19:07:18.292479	Demo Seminar Rejected 0	\N	f	en	\N	\N	\N	\N	\N	MUXgyEewGkYjAyh7s6hf	2026-08-24 19:07:18.29476	2026-08-24 19:07:18.292529	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
33	demo_lecture_student_19@example.com	$2a$11$AkMcuzhCINvAbQYYb1s4b.4I9JJP79VJoCFi8lgVS45UlmRGv.emC	\N	\N	\N	2026-08-24 19:07:13.870314	2026-08-24 19:07:42.584561	f	1	t	2026-08-24 19:07:13.870273	Demo Lecture Student 19	\N	f	en	\N	\N	\N	\N	\N	9PGygoEcCVQgzLdNRyxF	2026-08-24 19:07:13.873186	2026-08-24 19:07:13.870352	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
59	demo_seminar_rejected_1@example.com	$2a$11$WUXUwXUdBWEiw7P.i.ty..enBnVRlxza1bRWIbujpheMxSjCJRGkK	\N	\N	\N	2026-08-24 19:07:18.392905	2026-08-24 19:07:45.077251	f	1	t	2026-08-24 19:07:18.392885	Demo Seminar Rejected 1	\N	f	en	\N	\N	\N	\N	\N	PnqL9LyrnbAQ_aCQFy27	2026-08-24 19:07:18.395193	2026-08-24 19:07:18.392934	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
60	solver_user_0@example.com	$2a$11$ugxzVJ5wT3e/Vr1hOt.CHe/HqkFHVwHLyD.LnJRV//hzn9A.851nq	\N	\N	\N	2026-08-24 19:07:19.206808	2026-08-24 19:07:45.172418	f	1	t	2026-08-24 19:07:19.206783	Solver User 0	\N	f	en	\N	\N	\N	\N	\N	b_zGwp5zoRHMxXYREsit	2026-08-24 19:07:19.209418	2026-08-24 19:07:19.20684	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
61	solver_user_1@example.com	$2a$11$NaSGMpDFYfUjWtk2DGvNT.HetC5u2dugZNuEBJraHbT/4ICV9LCw2	\N	\N	\N	2026-08-24 19:07:19.319322	2026-08-24 19:07:45.267576	f	1	t	2026-08-24 19:07:19.319297	Solver User 1	\N	f	en	\N	\N	\N	\N	\N	c3EwUbPgB_ggcP53JMQH	2026-08-24 19:07:19.321602	2026-08-24 19:07:19.319353	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
34	demo_lecture_student_20@example.com	$2a$11$tvNm2aDlF3FHcR2OBXBB7.6DnaOlItGs8gees7BAOrJAXPKR03uDe	\N	\N	\N	2026-08-24 19:07:13.972565	2026-08-24 19:07:42.679242	f	1	t	2026-08-24 19:07:13.972535	Demo Lecture Student 20	\N	f	en	\N	\N	\N	\N	\N	uGdh2hpefzqss3Jytixa	2026-08-24 19:07:13.974907	2026-08-24 19:07:13.972599	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
35	demo_lecture_student_21@example.com	$2a$11$IS5dGdHeiMGlQvxOTOgIt.XN5I9SA7R2Nl0A/eOcPZzjsUb9Hj1TC	\N	\N	\N	2026-08-24 19:07:14.073967	2026-08-24 19:07:42.774649	f	1	t	2026-08-24 19:07:14.073938	Demo Lecture Student 21	\N	f	en	\N	\N	\N	\N	\N	A26zfxvDhbyx6gz-KFs7	2026-08-24 19:07:14.076637	2026-08-24 19:07:14.074	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
36	demo_lecture_student_22@example.com	$2a$11$23FfATNZzittsxDR2rxifOF7X0k7nCHcD9geNNrAcDC1VmMxptPHu	\N	\N	\N	2026-08-24 19:07:14.176018	2026-08-24 19:07:42.869972	f	1	t	2026-08-24 19:07:14.175991	Demo Lecture Student 22	\N	f	en	\N	\N	\N	\N	\N	SBut1KhTpigGS--e315x	2026-08-24 19:07:14.178499	2026-08-24 19:07:14.17622	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
37	demo_lecture_student_23@example.com	$2a$11$r9xdBV8LB4/D.DV40w7/UuxIjohuc/1HZI6323EK/NI5EoPDyHpta	\N	\N	\N	2026-08-24 19:07:14.282932	2026-08-24 19:07:42.965042	f	1	t	2026-08-24 19:07:14.282895	Demo Lecture Student 23	\N	f	en	\N	\N	\N	\N	\N	WTWRgXzvqCou2H6Rjj1t	2026-08-24 19:07:14.286104	2026-08-24 19:07:14.282971	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
66	solver_user_6@example.com	$2a$11$g/CDJsbPezODdm29g5yjneUrBvoRDMWYr/.p9TZhEQa7qKEBF6sJC	\N	\N	\N	2026-08-24 19:07:19.876592	2026-08-24 19:07:45.747753	f	1	t	2026-08-24 19:07:19.876569	Solver User 6	\N	f	en	\N	\N	\N	\N	\N	s2VNxFjyzgrvcse1K1am	2026-08-24 19:07:19.878886	2026-08-24 19:07:19.876621	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
67	solver_user_7@example.com	$2a$11$BBbTV6dIuHq95cM98ZBNX.U1jsQrabtA6nTWUW6d//g3ay2fkkCfW	\N	\N	\N	2026-08-24 19:07:19.988268	2026-08-24 19:07:45.843505	f	1	t	2026-08-24 19:07:19.988202	Solver User 7	\N	f	en	\N	\N	\N	\N	\N	D87baL-pH9MUXrWDRq48	2026-08-24 19:07:19.990941	2026-08-24 19:07:19.988304	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
68	solver_user_8@example.com	$2a$11$kZTIGoRgf1VkyVYmXOB0xuzXOcBxa8KWGNZlfYIJpRy95bqFBJMKi	\N	\N	\N	2026-08-24 19:07:20.090865	2026-08-24 19:07:45.93856	f	1	t	2026-08-24 19:07:20.09084	Solver User 8	\N	f	en	\N	\N	\N	\N	\N	vfCtiCYGiuFdo1actEc7	2026-08-24 19:07:20.093357	2026-08-24 19:07:20.090895	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
69	solver_user_9@example.com	$2a$11$FJx388JAn/jdfoR7NnEZ6Otf8CQbP9euik7eVESmdH407XWkCQCMy	\N	\N	\N	2026-08-24 19:07:20.202007	2026-08-24 19:07:46.033949	f	1	t	2026-08-24 19:07:20.201981	Solver User 9	\N	f	en	\N	\N	\N	\N	\N	1cUdgNx4EcwFzFSyQHC5	2026-08-24 19:07:20.204363	2026-08-24 19:07:20.202039	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
70	solver_user_10@example.com	$2a$11$Xy3e6iNPsR7z8M9fU6sFROUq7vHrsIN3vssifwC8kJO6kfBgMY0ie	\N	\N	\N	2026-08-24 19:07:20.302458	2026-08-24 19:07:46.129163	f	1	t	2026-08-24 19:07:20.302435	Solver User 10	\N	f	en	\N	\N	\N	\N	\N	evb62u76W5dzMzRZn-bg	2026-08-24 19:07:20.305175	2026-08-24 19:07:20.302488	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
71	solver_user_11@example.com	$2a$11$oQ/2dDv8leJdAtqPvn0dbulLzYpDD.Y1FEa.5ntmmmz5KuZ7k1D3.	\N	\N	\N	2026-08-24 19:07:20.413943	2026-08-24 19:07:46.22372	f	1	t	2026-08-24 19:07:20.41392	Solver User 11	\N	f	en	\N	\N	\N	\N	\N	uPvBExNrt-9kfmENkp2t	2026-08-24 19:07:20.416441	2026-08-24 19:07:20.413973	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
72	solver_user_12@example.com	$2a$11$URtnm49yjzey1M1oc.LFbOsTTRtMMjW6OnUAMSYO8T4ydjrhX44fq	\N	\N	\N	2026-08-24 19:07:20.521746	2026-08-24 19:07:46.318519	f	1	t	2026-08-24 19:07:20.521724	Solver User 12	\N	f	en	\N	\N	\N	\N	\N	M2MrDbgNteFYRKRYUEsd	2026-08-24 19:07:20.524266	2026-08-24 19:07:20.521775	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
73	solver_user_13@example.com	$2a$11$DZDUtGW92XWKsiYENH/G9eBsmmAUnr0KKpLxOz6BwhjY/j5Czvblm	\N	\N	\N	2026-08-24 19:07:20.63239	2026-08-24 19:07:46.413043	f	1	t	2026-08-24 19:07:20.632368	Solver User 13	\N	f	en	\N	\N	\N	\N	\N	1g_vtbEX4danEJat8X9G	2026-08-24 19:07:20.636001	2026-08-24 19:07:20.632421	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
74	solver_user_14@example.com	$2a$11$vlvU1oxckfcgH417ZCNqaO5pYZA6O.A5M0EHG0YI/Mj5A6vlhdWiG	\N	\N	\N	2026-08-24 19:07:20.739461	2026-08-24 19:07:46.508612	f	1	t	2026-08-24 19:07:20.739426	Solver User 14	\N	f	en	\N	\N	\N	\N	\N	EVzvTZg2_stNG94UDK9k	2026-08-24 19:07:20.742082	2026-08-24 19:07:20.739495	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
75	solver_user_15@example.com	$2a$11$QhW8l8oJD7n1a1YbzRAgKOJgcYI2nk5VEuXI23dL3tRK5wffPOuvW	\N	\N	\N	2026-08-24 19:07:20.849574	2026-08-24 19:07:46.603802	f	1	t	2026-08-24 19:07:20.849551	Solver User 15	\N	f	en	\N	\N	\N	\N	\N	BWsc-GXyHemmFn_JVyp7	2026-08-24 19:07:20.851893	2026-08-24 19:07:20.849602	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
76	solver_user_16@example.com	$2a$11$5NASi9KK0OaM6Jgrjubci.nS3uC41ZseIsUuovkTyujInHdKY52ES	\N	\N	\N	2026-08-24 19:07:20.957628	2026-08-24 19:07:46.705074	f	1	t	2026-08-24 19:07:20.957607	Solver User 16	\N	f	en	\N	\N	\N	\N	\N	3ibY85vGyVvp967kGeXT	2026-08-24 19:07:20.960013	2026-08-24 19:07:20.957656	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
77	solver_user_17@example.com	$2a$11$UCcu2lJ4NTCkhspHX3r7C.BE6hCiKr6IrP/WFrrzQIFLKMBRXVti.	\N	\N	\N	2026-08-24 19:07:21.062253	2026-08-24 19:07:46.799634	f	1	t	2026-08-24 19:07:21.062223	Solver User 17	\N	f	en	\N	\N	\N	\N	\N	XhnDoozvzqS7hduvtxKh	2026-08-24 19:07:21.064765	2026-08-24 19:07:21.062291	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
78	solver_user_18@example.com	$2a$11$kPWRu/VQhZnEvJQF95iV8OtsMvHdei0NYrVdrhkXlDz6F.vun8gnq	\N	\N	\N	2026-08-24 19:07:21.169363	2026-08-24 19:07:46.944528	f	1	t	2026-08-24 19:07:21.169341	Solver User 18	\N	f	en	\N	\N	\N	\N	\N	EGeWC-bx3_dV7ysPPkgR	2026-08-24 19:07:21.172275	2026-08-24 19:07:21.169392	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
79	solver_user_19@example.com	$2a$11$UNNoAMbquplQGv/7FwLzQOCcqzMBzgj1FCoqClBh.SUmlQ1wFgOQm	\N	\N	\N	2026-08-24 19:07:21.275501	2026-08-24 19:07:47.040401	f	1	t	2026-08-24 19:07:21.275477	Solver User 19	\N	f	en	\N	\N	\N	\N	\N	DMXAgfHDrBNGaTpz8QhH	2026-08-24 19:07:21.277875	2026-08-24 19:07:21.275529	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
80	solver_user_20@example.com	$2a$11$.MJ9ET56OMJCD8VPuCRUHOXAzUwqk1r6zf/w2Jm6/bdxQeGNOylBG	\N	\N	\N	2026-08-24 19:07:21.377498	2026-08-24 19:07:47.138202	f	1	t	2026-08-24 19:07:21.377475	Solver User 20	\N	f	en	\N	\N	\N	\N	\N	gyZJ_CCinikca44vrZcc	2026-08-24 19:07:21.37975	2026-08-24 19:07:21.377526	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
81	solver_user_21@example.com	$2a$11$ijq4R8RJkfGSNY.v75Ef2utfwE8rSljwo0JqPGwnD/uSaZDbZw0SC	\N	\N	\N	2026-08-24 19:07:21.495554	2026-08-24 19:07:47.23509	f	1	t	2026-08-24 19:07:21.495532	Solver User 21	\N	f	en	\N	\N	\N	\N	\N	v-f_EWd877sKyQRHz-4h	2026-08-24 19:07:21.498218	2026-08-24 19:07:21.495584	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
82	solver_user_22@example.com	$2a$11$OEhxizSWJv.s5PiE.4V3CuT4Ee35PVrfuYgGvW2U1mRIB/sOcLYOa	\N	\N	\N	2026-08-24 19:07:21.604312	2026-08-24 19:07:47.331921	f	1	t	2026-08-24 19:07:21.60429	Solver User 22	\N	f	en	\N	\N	\N	\N	\N	a_ggmPyjsrse93XSU4ms	2026-08-24 19:07:21.606842	2026-08-24 19:07:21.604341	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
83	solver_user_23@example.com	$2a$11$LoURxQy1zJltW7F7WqKDU.J0t.nJ1bPBxnOzP5VWp1l6S4wGdtHj.	\N	\N	\N	2026-08-24 19:07:21.71116	2026-08-24 19:07:47.430457	f	1	t	2026-08-24 19:07:21.711139	Solver User 23	\N	f	en	\N	\N	\N	\N	\N	qBduWDU6WxsmKJ3Emdna	2026-08-24 19:07:21.71341	2026-08-24 19:07:21.711192	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
84	solver_user_24@example.com	$2a$11$KMJOUwtVmOkR2hyU4p.wmutoWhnaf4m4OcVaghp5FyYs7MgL.SZe.	\N	\N	\N	2026-08-24 19:07:21.81806	2026-08-24 19:07:47.528982	f	1	t	2026-08-24 19:07:21.818038	Solver User 24	\N	f	en	\N	\N	\N	\N	\N	9SeNhxjHzYTA7bFhB5M9	2026-08-24 19:07:21.820315	2026-08-24 19:07:21.818089	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
85	solver_user_25@example.com	$2a$11$8jTxB1YOUnEbqiTxC.uFgeLV1J9MZ7lFUiNe1mCUmRs7lMhm72xHi	\N	\N	\N	2026-08-24 19:07:21.920429	2026-08-24 19:07:47.62698	f	1	t	2026-08-24 19:07:21.920406	Solver User 25	\N	f	en	\N	\N	\N	\N	\N	DHKxqikXBBDHxCDNzs8q	2026-08-24 19:07:21.922661	2026-08-24 19:07:21.920458	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
86	solver_user_26@example.com	$2a$11$MFLSlzw9GNn0fOneG/EmGujI7yP2EtGQlraszNBK41onn.TPFSZTq	\N	\N	\N	2026-08-24 19:07:22.025164	2026-08-24 19:07:47.724649	f	1	t	2026-08-24 19:07:22.02513	Solver User 26	\N	f	en	\N	\N	\N	\N	\N	hNxniE_XasZmuyZe-gYe	2026-08-24 19:07:22.02816	2026-08-24 19:07:22.025197	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
87	solver_user_27@example.com	$2a$11$fqT1.CDYMpTH8KXANcB9deu8FFJs9R/gBf0I/W5Kcnvx15waFhP.K	\N	\N	\N	2026-08-24 19:07:22.130499	2026-08-24 19:07:47.821133	f	1	t	2026-08-24 19:07:22.130477	Solver User 27	\N	f	en	\N	\N	\N	\N	\N	YnhE45pRc3JBfoZTzhuM	2026-08-24 19:07:22.132848	2026-08-24 19:07:22.130526	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
88	solver_user_28@example.com	$2a$11$mr1bVBHLp6PY3nL8JhyGwOj9gq86yNOo9GDCWJnXV4INTZp5v5e0O	\N	\N	\N	2026-08-24 19:07:22.233555	2026-08-24 19:07:47.917736	f	1	t	2026-08-24 19:07:22.233532	Solver User 28	\N	f	en	\N	\N	\N	\N	\N	Vue7tW1sbYiYTDHoSMfd	2026-08-24 19:07:22.235976	2026-08-24 19:07:22.233582	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
89	solver_user_29@example.com	$2a$11$DPDyWvZ6JUmzLaHSBaul7.GBFw7WWi9uLxFevvzQM7MyBIAqPkt1O	\N	\N	\N	2026-08-24 19:07:22.338847	2026-08-24 19:07:48.01354	f	1	t	2026-08-24 19:07:22.338825	Solver User 29	\N	f	en	\N	\N	\N	\N	\N	tx7Dh_QyDH1FLv5Ns2ns	2026-08-24 19:07:22.341069	2026-08-24 19:07:22.338875	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
90	solver_user_30@example.com	$2a$11$67nDSCe29Rpp8Ex//RsI7eXoIV/V6AcxH.BpWgfCcGRNHRU53iCAa	\N	\N	\N	2026-08-24 19:07:22.447797	2026-08-24 19:07:48.110832	f	1	t	2026-08-24 19:07:22.447774	Solver User 30	\N	f	en	\N	\N	\N	\N	\N	uPw-2Hdqydty9NHhLjzM	2026-08-24 19:07:22.450348	2026-08-24 19:07:22.447829	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
91	solver_user_31@example.com	$2a$11$pfrXX1P4TUlJGW9.RJwiQemIpCxChaBXjW.oQSYjBEasLhicI1Jc6	\N	\N	\N	2026-08-24 19:07:22.548411	2026-08-24 19:07:48.207385	f	1	t	2026-08-24 19:07:22.548379	Solver User 31	\N	f	en	\N	\N	\N	\N	\N	YG8Punz7djHvGCud3ab7	2026-08-24 19:07:22.550938	2026-08-24 19:07:22.548452	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
92	solver_user_32@example.com	$2a$11$ppuFytsMx3cE04U5xQfuH.g9uyIR7qwwVWLqZYloParmFIYCs17tu	\N	\N	\N	2026-08-24 19:07:22.660111	2026-08-24 19:07:48.304355	f	1	t	2026-08-24 19:07:22.660084	Solver User 32	\N	f	en	\N	\N	\N	\N	\N	nyWCc9BvG8nVEGuz7eSR	2026-08-24 19:07:22.662613	2026-08-24 19:07:22.660145	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
93	solver_user_33@example.com	$2a$11$47MZSK/r6S4yCjh/Q0SJHuwVgLKar3hLmT4WUSxMz1g6qeiHALi2e	\N	\N	\N	2026-08-24 19:07:22.76745	2026-08-24 19:07:48.400166	f	1	t	2026-08-24 19:07:22.767429	Solver User 33	\N	f	en	\N	\N	\N	\N	\N	xCdnT4ZaFPsUxqZyjMnd	2026-08-24 19:07:22.76981	2026-08-24 19:07:22.767479	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
63	solver_user_3@example.com	$2a$11$BqA/S/2Hn49NdUkj7zYZQeorVqmeLel.31J5keJ0HApzZsSOS4/0W	\N	\N	\N	2026-08-24 19:07:19.535517	2026-08-24 19:07:45.462581	f	1	t	2026-08-24 19:07:19.535484	Solver User 3	\N	f	en	\N	\N	\N	\N	\N	8Bey1N_t8G7ZfzmZ_RxA	2026-08-24 19:07:19.538353	2026-08-24 19:07:19.535552	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
64	solver_user_4@example.com	$2a$11$GNWiQLzlMjPvScl4ojUdH./MDsLCRE.LPEPZgih2hf3thRZJymwkW	\N	\N	\N	2026-08-24 19:07:19.651346	2026-08-24 19:07:45.558536	f	1	t	2026-08-24 19:07:19.651324	Solver User 4	\N	f	en	\N	\N	\N	\N	\N	Yynkg_hMR1ftWzgrRGPf	2026-08-24 19:07:19.653597	2026-08-24 19:07:19.651373	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
65	solver_user_5@example.com	$2a$11$BuuQEVIVZhgrROi./eDmPO2VTcSph.CMmM.nuQA3AJz7QiR/czRry	\N	\N	\N	2026-08-24 19:07:19.767377	2026-08-24 19:07:45.6532	f	1	t	2026-08-24 19:07:19.767354	Solver User 5	\N	f	en	\N	\N	\N	\N	\N	wUUCD8iNaWNxCRdUfPfz	2026-08-24 19:07:19.769808	2026-08-24 19:07:19.767406	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
98	solver_user_38@example.com	$2a$11$LpzMu9/6XZd6N61wqKxOquC2XtXxGxW/lsxHFpQpZ1M9OhJ2EHTha	\N	\N	\N	2026-08-24 19:07:23.312855	2026-08-24 19:07:48.885142	f	1	t	2026-08-24 19:07:23.312831	Solver User 38	\N	f	en	\N	\N	\N	\N	\N	WcohTeMipLzJKtccwzzg	2026-08-24 19:07:23.31526	2026-08-24 19:07:23.312886	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
99	solver_user_39@example.com	$2a$11$4Dm45RcXs6EdW60/va3V7OVP1ksDUfo71WLLhWWxgfxrrFPkJnR/2	\N	\N	\N	2026-08-24 19:07:23.414819	2026-08-24 19:07:48.980577	f	1	t	2026-08-24 19:07:23.414797	Solver User 39	\N	f	en	\N	\N	\N	\N	\N	w49rWbaWUm7bz5RWqvmZ	2026-08-24 19:07:23.417329	2026-08-24 19:07:23.414851	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
100	solver_user_40@example.com	$2a$11$TGAeNgYUqUitcmb8Y36/MusM712iPFhwDXjoh90V68Axf6rbja/Be	\N	\N	\N	2026-08-24 19:07:23.534889	2026-08-24 19:07:49.076802	f	1	t	2026-08-24 19:07:23.534868	Solver User 40	\N	f	en	\N	\N	\N	\N	\N	EipDX4hxqq8jwbC7XAXV	2026-08-24 19:07:23.537147	2026-08-24 19:07:23.534921	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
101	solver_user_41@example.com	$2a$11$93Jg.Ri1VzKlcX/TFNT8L.w9DJ7rr7KE7pOEJTHB.1DKP91EyUlqu	\N	\N	\N	2026-08-24 19:07:23.640968	2026-08-24 19:07:49.172707	f	1	t	2026-08-24 19:07:23.640947	Solver User 41	\N	f	en	\N	\N	\N	\N	\N	jVCHgpKyxLW3a9BwqJ1V	2026-08-24 19:07:23.644075	2026-08-24 19:07:23.640999	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
102	solver_user_42@example.com	$2a$11$.woxRn7uAyHLE28.SXQB5.JZgRgiyc0mNhXPTP/6.x4m8l.GREhhm	\N	\N	\N	2026-08-24 19:07:23.748366	2026-08-24 19:07:49.267524	f	1	t	2026-08-24 19:07:23.748345	Solver User 42	\N	f	en	\N	\N	\N	\N	\N	s3U9tN-pxDAEW5DX3azu	2026-08-24 19:07:23.751916	2026-08-24 19:07:23.748497	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
103	solver_user_43@example.com	$2a$11$KnK5I71NCs/W3.xVBhPfz.5dvkQlEbn50Re.9nDU32fwBbAjQifja	\N	\N	\N	2026-08-24 19:07:23.8488	2026-08-24 19:07:49.362753	f	1	t	2026-08-24 19:07:23.84878	Solver User 43	\N	f	en	\N	\N	\N	\N	\N	kQzTyNbW-GtEApE-3YxW	2026-08-24 19:07:23.851091	2026-08-24 19:07:23.848829	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
104	solver_user_44@example.com	$2a$11$VfQhxi1JBVWHS0FQhxiM3uqrUhWzgfRmenP8.YNROSUQ4khcWAevS	\N	\N	\N	2026-08-24 19:07:23.94797	2026-08-24 19:07:49.458857	f	1	t	2026-08-24 19:07:23.947947	Solver User 44	\N	f	en	\N	\N	\N	\N	\N	xM7SBV3vMNKzK49dSTDM	2026-08-24 19:07:23.950937	2026-08-24 19:07:23.948002	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
105	solver_user_45@example.com	$2a$11$p7bcQGywgHcpjoa/EmZPtuF9i6jJx0HMWbVPogPhfu4vKt11/punC	\N	\N	\N	2026-08-24 19:07:24.049493	2026-08-24 19:07:49.553924	f	1	t	2026-08-24 19:07:24.049464	Solver User 45	\N	f	en	\N	\N	\N	\N	\N	QYXqSNT-dxhhz8sasZLT	2026-08-24 19:07:24.052332	2026-08-24 19:07:24.049526	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
106	solver_user_46@example.com	$2a$11$3vrRw8STCumL3ioCRE2BWeRltydoiATPYSylbc/5Sg4i62jGqLVN2	\N	\N	\N	2026-08-24 19:07:24.150254	2026-08-24 19:07:49.649151	f	1	t	2026-08-24 19:07:24.150228	Solver User 46	\N	f	en	\N	\N	\N	\N	\N	KNHjy1MB-URvuF5XhJvc	2026-08-24 19:07:24.152844	2026-08-24 19:07:24.150285	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
107	solver_user_47@example.com	$2a$11$tFD812bYqW4TXdn4.6vXfeh2AleLGPiTG70maRB0/nKsVXwt5Z4YC	\N	\N	\N	2026-08-24 19:07:24.262032	2026-08-24 19:07:49.745834	f	1	t	2026-08-24 19:07:24.262007	Solver User 47	\N	f	en	\N	\N	\N	\N	\N	Dyg2ch5xj7yV99Jtoeeo	2026-08-24 19:07:24.264746	2026-08-24 19:07:24.262067	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
108	solver_user_48@example.com	$2a$11$vCdIXN6eiB4UOPSDmOhh4.wcAkd62cIFM21wBd6u4q4ihb2Ror5BG	\N	\N	\N	2026-08-24 19:07:24.362073	2026-08-24 19:07:49.847305	f	1	t	2026-08-24 19:07:24.362049	Solver User 48	\N	f	en	\N	\N	\N	\N	\N	eQg4hayzMT9shAfv-BsB	2026-08-24 19:07:24.364623	2026-08-24 19:07:24.362105	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
109	solver_user_49@example.com	$2a$11$r4agSEIMT8ztohMa3Xljq.05lLEMBjZ9MmX//jSPhKB7yHIstDCFW	\N	\N	\N	2026-08-24 19:07:24.460661	2026-08-24 19:07:49.942602	f	1	t	2026-08-24 19:07:24.46064	Solver User 49	\N	f	en	\N	\N	\N	\N	\N	M6a3UdQoycCGivbyiLBt	2026-08-24 19:07:24.463285	2026-08-24 19:07:24.460691	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
110	solver_user_50@example.com	$2a$11$9BRAmVe9j9emrtWA6q4YKOosv9t6kr9.BeFl4.Z/Odm0lyZ85YzO6	\N	\N	\N	2026-08-24 19:07:24.563097	2026-08-24 19:07:50.039038	f	1	t	2026-08-24 19:07:24.56306	Solver User 50	\N	f	en	\N	\N	\N	\N	\N	DnQuCyPPYe89jfqsasR8	2026-08-24 19:07:24.565889	2026-08-24 19:07:24.563134	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
111	solver_user_51@example.com	$2a$11$e1q1fBQJccl9d4UkinhX7umC0acy66vjiJTgkR0/I.D5gTGu7GIzq	\N	\N	\N	2026-08-24 19:07:24.668544	2026-08-24 19:07:50.134374	f	1	t	2026-08-24 19:07:24.668524	Solver User 51	\N	f	en	\N	\N	\N	\N	\N	MS7ozx9TDkrBEPu1qBU_	2026-08-24 19:07:24.670755	2026-08-24 19:07:24.668574	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
112	solver_user_52@example.com	$2a$11$vBTzuwl/A5eQU8jEzJCnXuem1vrfILjbLdOy9xk6t/s90WxrWpoFu	\N	\N	\N	2026-08-24 19:07:24.772448	2026-08-24 19:07:50.232273	f	1	t	2026-08-24 19:07:24.772428	Solver User 52	\N	f	en	\N	\N	\N	\N	\N	PPYxqFhPV2nENdKLDutz	2026-08-24 19:07:24.774654	2026-08-24 19:07:24.772477	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
113	solver_user_53@example.com	$2a$11$xxlmNMxra/9s31JrfymbEu1M7TYXBiH.f4bnKtbCovR4.BQlGTrNS	\N	\N	\N	2026-08-24 19:07:24.874265	2026-08-24 19:07:50.328841	f	1	t	2026-08-24 19:07:24.874245	Solver User 53	\N	f	en	\N	\N	\N	\N	\N	wsPWLA7DdN2LGefrMy_Y	2026-08-24 19:07:24.876547	2026-08-24 19:07:24.874302	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
114	solver_user_54@example.com	$2a$11$YS7WauS6bc36VJtGRzIJ5e0sS7f4QhjAm60JJEhyhub8f0uTo2Pou	\N	\N	\N	2026-08-24 19:07:24.975614	2026-08-24 19:07:50.424462	f	1	t	2026-08-24 19:07:24.975593	Solver User 54	\N	f	en	\N	\N	\N	\N	\N	YcmgyNakhszHANKoKwRQ	2026-08-24 19:07:24.977965	2026-08-24 19:07:24.975645	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
115	cohort_user_0@example.com	$2a$11$GDlXqpa0loD6O8S3p7QH0.39oq9l33dnmD9rKj0E7BX6fz61aKeca	\N	\N	\N	2026-08-24 19:07:25.183279	2026-08-24 19:07:50.523038	f	1	t	2026-08-24 19:07:25.183257	Cohort User 0	\N	f	en	\N	\N	\N	\N	\N	Uo7LCuFH2d1MgXVFczkZ	2026-08-24 19:07:25.18576	2026-08-24 19:07:25.18331	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
116	cohort_user_1@example.com	$2a$11$uEea8lCq9GLPWxHNeXM1YumeQ0M.uFLBYZ107P00PTTeIn6oKu9pi	\N	\N	\N	2026-08-24 19:07:25.29413	2026-08-24 19:07:50.620366	f	1	t	2026-08-24 19:07:25.294109	Cohort User 1	\N	f	en	\N	\N	\N	\N	\N	Jwzca9PaL3wqwZv2squ-	2026-08-24 19:07:25.296569	2026-08-24 19:07:25.294161	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
117	cohort_user_2@external.org	$2a$11$gQaFymYVEP0pjbjxCQlb7OQX8vF8qSe/f4207b/tmseI0GBU9qmFi	\N	\N	\N	2026-08-24 19:07:25.399795	2026-08-24 19:07:50.718694	f	1	t	2026-08-24 19:07:25.399761	Cohort User 2	\N	f	en	\N	\N	\N	\N	\N	t-aUczAgsGGywMZqrVu_	2026-08-24 19:07:25.40248	2026-08-24 19:07:25.399829	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
118	cohort_user_3@example.com	$2a$11$bQu252iRG4Ovxt1iMgE6TO7gjPqDcJEbUZtwYjb2tk7zV2ahqt64u	\N	\N	\N	2026-08-24 19:07:25.500816	2026-08-24 19:07:50.816332	f	1	t	2026-08-24 19:07:25.500795	Cohort User 3	\N	f	en	\N	\N	\N	\N	\N	ZSxkFu2GHhVrAt33-coh	2026-08-24 19:07:25.503294	2026-08-24 19:07:25.500845	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
119	cohort_user_4@example.com	$2a$11$urPQn9K8XIC.ge2/w9YneOwgielmvNpnHXaWBKfnCyo.MDyR4OvN6	\N	\N	\N	2026-08-24 19:07:25.601553	2026-08-24 19:07:50.913402	f	1	t	2026-08-24 19:07:25.60153	Cohort User 4	\N	f	en	\N	\N	\N	\N	\N	3TYkroYb6UKFYac9HCzv	2026-08-24 19:07:25.603821	2026-08-24 19:07:25.601585	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
120	cohort_user_5@example.com	$2a$11$pHh7PajQkJ7.Pak/l72vLek5G/Jcc0B12uVF1zSox6wd3n2BQKNpm	\N	\N	\N	2026-08-24 19:07:25.701789	2026-08-24 19:07:51.010942	f	1	t	2026-08-24 19:07:25.701768	Cohort User 5	\N	f	en	\N	\N	\N	\N	\N	ydSraGEbJfxjyYvpeHmS	2026-08-24 19:07:25.70403	2026-08-24 19:07:25.701818	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
121	cohort_user_6@example.com	$2a$11$/HhxCKENuoxgM71ToiB..u8kiTG6ixf289d1UnaWIWLnpOrxZbHDi	\N	\N	\N	2026-08-24 19:07:25.810638	2026-08-24 19:07:51.108041	f	1	t	2026-08-24 19:07:25.810599	Cohort User 6	\N	f	en	\N	\N	\N	\N	\N	xjH32NEwLTXzpRQTzEPb	2026-08-24 19:07:25.813442	2026-08-24 19:07:25.810681	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
122	cohort_user_7@external.org	$2a$11$PebehEqlAMEbGItzBUx0j.PfAg5UwHd4qT0VG0k.Bj8fN.A0q97A2	\N	\N	\N	2026-08-24 19:07:25.918835	2026-08-24 19:07:51.206384	f	1	t	2026-08-24 19:07:25.918813	Cohort User 7	\N	f	en	\N	\N	\N	\N	\N	yue9zoM8rhyZV4nz9aW-	2026-08-24 19:07:25.921241	2026-08-24 19:07:25.918864	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
123	cohort_user_8@example.com	$2a$11$UGSJ.4TuFBKMfMCBtPFP5OKNI8vma4l5YkwyxOksgzbz6wm6lj0EG	\N	\N	\N	2026-08-24 19:07:26.034364	2026-08-24 19:07:51.305843	f	1	t	2026-08-24 19:07:26.034333	Cohort User 8	\N	f	en	\N	\N	\N	\N	\N	pUp_qYbJshnizh1m9Q_N	2026-08-24 19:07:26.040058	2026-08-24 19:07:26.0344	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
124	cohort_user_9@example.com	$2a$11$yHxnKIlNBkGqWCYWvCiRqe8/nsFASvF8Cyva92OPf/AgnJRdQbJHK	\N	\N	\N	2026-08-24 19:07:26.160084	2026-08-24 19:07:51.404633	f	1	t	2026-08-24 19:07:26.160051	Cohort User 9	\N	f	en	\N	\N	\N	\N	\N	jTj5ezgjPX4kgQ3BysFi	2026-08-24 19:07:26.166782	2026-08-24 19:07:26.160119	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
125	cohort_user_10@example.com	$2a$11$frSZcgAYnj5eeOc2ArvC2.dtUi1.xzidkH1.hq4j/wzuEjK35tlFC	\N	\N	\N	2026-08-24 19:07:26.289813	2026-08-24 19:07:51.499871	f	1	t	2026-08-24 19:07:26.28978	Cohort User 10	\N	f	en	\N	\N	\N	\N	\N	GjhNuKLUUfcXVJ2yzZjr	2026-08-24 19:07:26.295843	2026-08-24 19:07:26.289845	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
95	solver_user_35@example.com	$2a$11$w1.s0vjAAdmJB23WuxKo5OITHyCYeHl6zwwS3RmGJsNXCgGLM3/yO	\N	\N	\N	2026-08-24 19:07:22.99056	2026-08-24 19:07:48.596367	f	1	t	2026-08-24 19:07:22.990537	Solver User 35	\N	f	en	\N	\N	\N	\N	\N	BjVi4Afqpjbnxa1EKaTx	2026-08-24 19:07:22.994042	2026-08-24 19:07:22.990591	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
96	solver_user_36@example.com	$2a$11$zlNZ27aJ9x6DSGdayyMZSORZuNI3i0s6VVE2wq0b6vWVPDI8BuXF.	\N	\N	\N	2026-08-24 19:07:23.103085	2026-08-24 19:07:48.691866	f	1	t	2026-08-24 19:07:23.103059	Solver User 36	\N	f	en	\N	\N	\N	\N	\N	PsxyyxqVxoox3pyVJuXE	2026-08-24 19:07:23.105519	2026-08-24 19:07:23.103119	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
97	solver_user_37@example.com	$2a$11$/Gax4pBxpA8Y5I/sLCfcQOu6t6z8g5tETrrAqqlYzOwDd2.KRDF1y	\N	\N	\N	2026-08-24 19:07:23.213101	2026-08-24 19:07:48.788713	f	1	t	2026-08-24 19:07:23.213077	Solver User 37	\N	f	en	\N	\N	\N	\N	\N	TZGmn2gTFXPcF7XDK5T_	2026-08-24 19:07:23.216264	2026-08-24 19:07:23.213133	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
130	cohort_user_15@example.com	$2a$11$VWUIPeerNDrNoTpRkBTb7.EFWfETTeBTnWZQSUtPWvpjkcbrZXfjy	\N	\N	\N	2026-08-24 19:07:26.821016	2026-08-24 19:07:51.980068	f	1	t	2026-08-24 19:07:26.820994	Cohort User 15	\N	f	en	\N	\N	\N	\N	\N	-j9JDsweCSBybHzPTYGo	2026-08-24 19:07:26.823301	2026-08-24 19:07:26.821046	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
131	cohort_user_16@example.com	$2a$11$VRtDvzndzTtcbE2VMaWLXe1.eMTUaIrfvEPgOojVk4enb/RspqFY2	\N	\N	\N	2026-08-24 19:07:26.925937	2026-08-24 19:07:52.075509	f	1	t	2026-08-24 19:07:26.925916	Cohort User 16	\N	f	en	\N	\N	\N	\N	\N	CSZ7jFsw_PW_5yssrwWi	2026-08-24 19:07:26.92833	2026-08-24 19:07:26.925965	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
132	cohort_user_17@example.com	$2a$11$dVGIKVBV6OUtI7CC7ZBFKusGFUIDCLH9iDNcVsd1EnfDM0XoaDJAy	\N	\N	\N	2026-08-24 19:07:27.031854	2026-08-24 19:07:52.171056	f	1	t	2026-08-24 19:07:27.031817	Cohort User 17	\N	f	en	\N	\N	\N	\N	\N	GiCGTSfsQkytnPseyQTV	2026-08-24 19:07:27.034516	2026-08-24 19:07:27.031891	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
133	cohort_user_18@example.com	$2a$11$WU45Pnrv3o5RHmw8a6uHBuWWem86Hzmv9fXmrZvrP.fo506cpowli	\N	\N	\N	2026-08-24 19:07:27.148952	2026-08-24 19:07:52.274555	f	1	t	2026-08-24 19:07:27.148705	Cohort User 18	\N	f	en	\N	\N	\N	\N	\N	4nx5nfaadjiDMDGAL2Jh	2026-08-24 19:07:27.155433	2026-08-24 19:07:27.151069	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
134	cohort_user_19@external.org	$2a$11$OJpTeMf9AIVsH68jaWUbQO0IaFHZEHAXk1MqR7QCSvu8jAslVaZIS	\N	\N	\N	2026-08-24 19:07:27.262075	2026-08-24 19:07:52.379322	f	1	t	2026-08-24 19:07:27.26204	Cohort User 19	\N	f	en	\N	\N	\N	\N	\N	KJZDhNkoD7CJBrwdnKhB	2026-08-24 19:07:27.264683	2026-08-24 19:07:27.2621	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
135	cohort_user_20@example.com	$2a$11$s.ayFkDI/W.L5iQU0o1PQe/hgRXqDwtxBNPEnDM.YQKc/4sE8zoEu	\N	\N	\N	2026-08-24 19:07:27.366915	2026-08-24 19:07:52.48437	f	1	t	2026-08-24 19:07:27.366893	Cohort User 20	\N	f	en	\N	\N	\N	\N	\N	9mvi5sPawwoUeLGyyJ7x	2026-08-24 19:07:27.369376	2026-08-24 19:07:27.36694	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
136	cohort_user_21@example.com	$2a$11$1bj1iFZ40lJhsTTIFD/MsuB4Yvps5.15aZdX0N1mmsiBya7LNbvFi	\N	\N	\N	2026-08-24 19:07:27.473233	2026-08-24 19:07:52.59165	f	1	t	2026-08-24 19:07:27.47321	Cohort User 21	\N	f	en	\N	\N	\N	\N	\N	C7x92F7dku-xSvPzkykw	2026-08-24 19:07:27.479374	2026-08-24 19:07:27.473255	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
137	cohort_user_22@example.com	$2a$11$ggYeLJsF5T.tXUvziTeN4uUimGcjAx0XcGxQ.crUBrvKO2wpO/JhC	\N	\N	\N	2026-08-24 19:07:27.586201	2026-08-24 19:07:52.697408	f	1	t	2026-08-24 19:07:27.58618	Cohort User 22	\N	f	en	\N	\N	\N	\N	\N	FZpqXyvuyUqpDSY4qCBP	2026-08-24 19:07:27.588497	2026-08-24 19:07:27.586221	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
138	cohort_user_23@example.com	$2a$11$Bb2R4DFv/oFQPeFvqpZuOuDykjim.M6L62pT5Nix1bVmjrQgsVJJu	\N	\N	\N	2026-08-24 19:07:27.688908	2026-08-24 19:07:52.803571	f	1	t	2026-08-24 19:07:27.688887	Cohort User 23	\N	f	en	\N	\N	\N	\N	\N	hwMaAvgcH1C5d8r1vadg	2026-08-24 19:07:27.694391	2026-08-24 19:07:27.688931	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
139	cohort_user_24@example.com	$2a$11$b8gCkv9/QW9d.JwV2RFWWO3IiQO3F6LvYfJ3CJXhnOc/AdQW.4wdm	\N	\N	\N	2026-08-24 19:07:27.79348	2026-08-24 19:07:52.909924	f	1	t	2026-08-24 19:07:27.793454	Cohort User 24	\N	f	en	\N	\N	\N	\N	\N	hvTqeoZxeE2JPFn7KjSw	2026-08-24 19:07:27.796276	2026-08-24 19:07:27.793505	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
140	cohort_user_25@example.com	$2a$11$sD4.mXKDfRCKANmimNMmk.IraalNbzVw5E9uSftIfToy95lhTn7ZW	\N	\N	\N	2026-08-24 19:07:27.901074	2026-08-24 19:07:53.023659	f	1	t	2026-08-24 19:07:27.901053	Cohort User 25	\N	f	en	\N	\N	\N	\N	\N	5_xS7-rojBbnWyz5N73J	2026-08-24 19:07:27.9038	2026-08-24 19:07:27.901095	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
141	cohort_user_26@example.com	$2a$11$FMOM3xCkwMPS48pbKr4t1uZUPZ7eaP7jKxJ9o3edfnRU4EMHS6vMC	\N	\N	\N	2026-08-24 19:07:28.010136	2026-08-24 19:07:53.128607	f	1	t	2026-08-24 19:07:28.01011	Cohort User 26	\N	f	en	\N	\N	\N	\N	\N	zWQib4SENBxtPxriyvU4	2026-08-24 19:07:28.012845	2026-08-24 19:07:28.010159	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
142	cohort_user_27@example.com	$2a$11$MiaFB7s2NXlHumK4pL6zY.wttrQjLUQqqmV9ZtJc4dA/Ta2FxF382	\N	\N	\N	2026-08-24 19:07:28.112398	2026-08-24 19:07:53.235073	f	1	t	2026-08-24 19:07:28.112377	Cohort User 27	\N	f	en	\N	\N	\N	\N	\N	8w7Y35tH8X1y88QSwwY8	2026-08-24 19:07:28.114699	2026-08-24 19:07:28.112422	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
143	cohort_user_28@example.com	$2a$11$lSBpd471rtAX7w.7HkrvmO.g5E.1sn9aExopwAAaGOP8NqeWPt6AO	\N	\N	\N	2026-08-24 19:07:28.213001	2026-08-24 19:07:53.340546	f	1	t	2026-08-24 19:07:28.212979	Cohort User 28	\N	f	en	\N	\N	\N	\N	\N	F2UDtGbd-6aDsB7tBDms	2026-08-24 19:07:28.215361	2026-08-24 19:07:28.213023	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
144	cohort_user_29@example.com	$2a$11$aSc.x6pgbQ3AFYsKHIVFx.8FlceLrnMVCe21FfyF0Lfglo8yqvg5m	\N	\N	\N	2026-08-24 19:07:28.315716	2026-08-24 19:07:53.445614	f	1	t	2026-08-24 19:07:28.315696	Cohort User 29	\N	f	en	\N	\N	\N	\N	\N	fSmnkfatoybqDY2AipKT	2026-08-24 19:07:28.318164	2026-08-24 19:07:28.315738	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
145	cohort_user_30@example.com	$2a$11$Tg3mFJXeY250m3cVb5jOyeTzbJpnSUfI1wDgvk94p1U6dLF3pWLoG	\N	\N	\N	2026-08-24 19:07:28.416099	2026-08-24 19:07:53.553625	f	1	t	2026-08-24 19:07:28.416079	Cohort User 30	\N	f	en	\N	\N	\N	\N	\N	fq_LJBxJg3wRyPdVcJL_	2026-08-24 19:07:28.41831	2026-08-24 19:07:28.416119	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
146	cohort_user_31@example.com	$2a$11$0B6r3o/le1A7zKCmEuTIGuoZdUvJSPUqNFv4ff46EzqCyk6UBwyyi	\N	\N	\N	2026-08-24 19:07:28.517357	2026-08-24 19:07:53.656755	f	1	t	2026-08-24 19:07:28.517337	Cohort User 31	\N	f	en	\N	\N	\N	\N	\N	jxNk-XK9RxnyvEycK1uP	2026-08-24 19:07:28.519506	2026-08-24 19:07:28.517379	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
147	cohort_user_32@example.com	$2a$11$eqS6MgXFSPFcInitRIKjZet9eggYc8nX9uOVIbSMLqS9uCfBBR1yq	\N	\N	\N	2026-08-24 19:07:28.619159	2026-08-24 19:07:53.763905	f	1	t	2026-08-24 19:07:28.619139	Cohort User 32	\N	f	en	\N	\N	\N	\N	\N	xGFjJFBaCiFCbKH2zQkP	2026-08-24 19:07:28.621399	2026-08-24 19:07:28.61918	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
148	cohort_user_33@external.org	$2a$11$Eatmj6Sl5xBecWdfj8PtW.PkfQ5z67fuv9P40ro.DA4Ygyc6YRghy	\N	\N	\N	2026-08-24 19:07:28.723049	2026-08-24 19:07:53.869629	f	1	t	2026-08-24 19:07:28.723029	Cohort User 33	\N	f	en	\N	\N	\N	\N	\N	UQvXqEruEtTpy7xcwpK_	2026-08-24 19:07:28.725469	2026-08-24 19:07:28.723071	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
149	cohort_user_34@example.com	$2a$11$wmx8qHEf2xyajwkgqdlP4OjU8rTz1quQAvXepjgBHeIFUnePxkgdO	\N	\N	\N	2026-08-24 19:07:28.82629	2026-08-24 19:07:53.977695	f	1	t	2026-08-24 19:07:28.826263	Cohort User 34	\N	f	en	\N	\N	\N	\N	\N	2aSwB-B7CrPzmZmQb_FW	2026-08-24 19:07:28.828796	2026-08-24 19:07:28.826313	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
150	cohort_user_35@example.com	$2a$11$PJKTkQuAmraieShB3RdqxeOWDM6Obx5YamWBKgS3TOA6adb2j/ucK	\N	\N	\N	2026-08-24 19:07:28.928455	2026-08-24 19:07:54.083401	f	1	t	2026-08-24 19:07:28.928434	Cohort User 35	\N	f	en	\N	\N	\N	\N	\N	wELPg9TQoXrpyTgj_Dio	2026-08-24 19:07:28.930663	2026-08-24 19:07:28.928476	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
151	cohort_user_36@example.com	$2a$11$F/Fq5wn8ulWOjUwrpnPrjefDrGrKsOrNnGoRijvlcP0xxvWYPgZZC	\N	\N	\N	2026-08-24 19:07:29.030307	2026-08-24 19:07:54.189932	f	1	t	2026-08-24 19:07:29.030286	Cohort User 36	\N	f	en	\N	\N	\N	\N	\N	2uyVdqfowX-WwjZX4W3c	2026-08-24 19:07:29.032796	2026-08-24 19:07:29.030329	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
152	cohort_user_37@example.com	$2a$11$BRlzh7InmjTUFclt0tvPreAP5xlV50DCK3M9z68FbQzVj9LNTH67O	\N	\N	\N	2026-08-24 19:07:29.135356	2026-08-24 19:07:54.287261	f	1	t	2026-08-24 19:07:29.135334	Cohort User 37	\N	f	en	\N	\N	\N	\N	\N	QhHz2sNZtZyY_5K_h7NQ	2026-08-24 19:07:29.13787	2026-08-24 19:07:29.135378	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
153	cohort_user_38@example.com	$2a$11$7TgMFtl1LmzEgH.sDCfn8.ajFaD2jGecCYcpX40p.bcAYDqzU5D6C	\N	\N	\N	2026-08-24 19:07:29.238543	2026-08-24 19:07:54.385685	f	1	t	2026-08-24 19:07:29.238515	Cohort User 38	\N	f	en	\N	\N	\N	\N	\N	d98r3e5cCBA_AdN5mtq3	2026-08-24 19:07:29.240936	2026-08-24 19:07:29.238568	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
154	cohort_user_39@example.com	$2a$11$CTnuVb40H5F3La73Pj7lku9awqs1VUZgUnVL/.1XMBPfBjpkelZVK	\N	\N	\N	2026-08-24 19:07:29.342928	2026-08-24 19:07:54.483166	f	1	t	2026-08-24 19:07:29.342904	Cohort User 39	\N	f	en	\N	\N	\N	\N	\N	A2f51eCyWf66S5kyRNEz	2026-08-24 19:07:29.345477	2026-08-24 19:07:29.342951	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
155	cohort_user_40@example.com	$2a$11$rX17nUTxCgkpjlvyAg7uKuelk8i3hIP..FaNecttpd59QBaCYRrye	\N	\N	\N	2026-08-24 19:07:29.448369	2026-08-24 19:07:54.580884	f	1	t	2026-08-24 19:07:29.448338	Cohort User 40	\N	f	en	\N	\N	\N	\N	\N	3cmxYRQUofYQzRaTWXPX	2026-08-24 19:07:29.450852	2026-08-24 19:07:29.448393	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
156	cohort_user_41@example.com	$2a$11$7XutpnvOScpJyrGJwNBs5.w7/2vE/DPttRLVxMTIUKNIqhqOeeN4y	\N	\N	\N	2026-08-24 19:07:29.551976	2026-08-24 19:07:54.678016	f	1	t	2026-08-24 19:07:29.551952	Cohort User 41	\N	f	en	\N	\N	\N	\N	\N	FxXLAQsf835F8sbGfxxk	2026-08-24 19:07:29.554469	2026-08-24 19:07:29.551997	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
126	cohort_user_11@example.com	$2a$11$wwydSQNZIwwQVHQ./IZGdeHOfRrLBA/iPeJz05fhMsaYkRJjZ6T7a	\N	\N	\N	2026-08-24 19:07:26.406319	2026-08-24 19:07:51.599044	f	1	t	2026-08-24 19:07:26.406298	Cohort User 11	\N	f	en	\N	\N	\N	\N	\N	jtAzx1b4xQKRnpPrxcVD	2026-08-24 19:07:26.408609	2026-08-24 19:07:26.406348	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
127	cohort_user_12@example.com	$2a$11$NnB8.8BkStMvb3hBPgW5n.pbZyfcNGU9.XPeZOKngSAkVL3LrO9IS	\N	\N	\N	2026-08-24 19:07:26.513138	2026-08-24 19:07:51.69379	f	1	t	2026-08-24 19:07:26.513104	Cohort User 12	\N	f	en	\N	\N	\N	\N	\N	64nndv3ZUAbiAuY7pqam	2026-08-24 19:07:26.516004	2026-08-24 19:07:26.51317	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
128	cohort_user_13@example.com	$2a$11$H3AuL3tv1Qw4TDBSrRPmq.QKYgrBEXbNhrSaszKO9g4j9PNtZKW/G	\N	\N	\N	2026-08-24 19:07:26.615736	2026-08-24 19:07:51.790068	f	1	t	2026-08-24 19:07:26.615702	Cohort User 13	\N	f	en	\N	\N	\N	\N	\N	PkBfK3F9pP-CUiFrBxoY	2026-08-24 19:07:26.618187	2026-08-24 19:07:26.615772	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
129	cohort_user_14@external.org	$2a$11$J6yHWhFJH95yvkXCT9RTW.OeW6Ue4Wrc0FCf21Ju3TBNgq9OcQnoi	\N	\N	\N	2026-08-24 19:07:26.715961	2026-08-24 19:07:51.885176	f	1	t	2026-08-24 19:07:26.715941	Cohort User 14	\N	f	en	\N	\N	\N	\N	\N	BH2q5GJ1_gKrmcuVEdwe	2026-08-24 19:07:26.721478	2026-08-24 19:07:26.715993	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
163	seminar_student_1@mampf.edu	$2a$11$QI01oAPbAZ1lGEp2xqK11u9xyHYWEOU9.4kcGavxjPvEUeOGYy9P6	\N	\N	\N	2026-08-24 19:07:30.386816	2026-08-24 19:07:55.393924	f	1	t	2026-08-24 19:07:30.386797	Seminar Student 1	\N	f	en	\N	\N	\N	\N	\N	kAtFaWts2sQSA-_3knsN	2026-08-24 19:07:30.389691	2026-08-24 19:07:30.386836	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
166	seminar_student_4@mampf.edu	$2a$11$1ILAjOx/lCVBlKQLaTteE.Uhv0RBJ/knarqRwlwkODEkC/AuCzedu	\N	\N	\N	2026-08-24 19:07:30.693359	2026-08-24 19:07:55.713447	f	1	t	2026-08-24 19:07:30.69334	Seminar Student 4	\N	f	en	\N	\N	\N	\N	\N	-dJfqSoXYgQDqyhbTaQu	2026-08-24 19:07:30.695536	2026-08-24 19:07:30.69338	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
169	seminar_student_7@mampf.edu	$2a$11$ZH.7nFWjPseD6B5J/ADM6e5a1qdQC2GchrwLA4h259/LMIYT/tVue	\N	\N	\N	2026-08-24 19:07:30.998446	2026-08-24 19:07:55.999914	f	1	t	2026-08-24 19:07:30.998426	Seminar Student 7	\N	f	en	\N	\N	\N	\N	\N	cvFjzGeG2myNVsegidhz	2026-08-24 19:07:31.000713	2026-08-24 19:07:30.998466	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
170	seminar_student_8@mampf.edu	$2a$11$GS1Fmh4FfbJ9cn9ClCYNGee4bypSwrqBeI41LHboAvYj0mcjkHATO	\N	\N	\N	2026-08-24 19:07:31.103788	2026-08-24 19:07:56.095677	f	1	t	2026-08-24 19:07:31.103765	Seminar Student 8	\N	f	en	\N	\N	\N	\N	\N	8H4yPSVyrLevo6NbwNmy	2026-08-24 19:07:31.106148	2026-08-24 19:07:31.103812	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
171	seminar_student_9@mampf.edu	$2a$11$cyCCz13jDHUpcn47INm9WOwh657Uve0uIgGUh5rHcHHCtGuZg9SkS	\N	\N	\N	2026-08-24 19:07:31.204366	2026-08-24 19:07:56.19085	f	1	t	2026-08-24 19:07:31.204346	Seminar Student 9	\N	f	en	\N	\N	\N	\N	\N	5DbFcWxz-Vk6SqLUN7me	2026-08-24 19:07:31.206642	2026-08-24 19:07:31.204386	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
172	seminar_student_10@mampf.edu	$2a$11$Mp6d/ZujF7eTVLQu.kb6fOX9PFACsFVs8v6562SeSHK8BjOuRSWrK	\N	\N	\N	2026-08-24 19:07:31.305463	2026-08-24 19:07:56.290962	f	1	t	2026-08-24 19:07:31.305443	Seminar Student 10	\N	f	en	\N	\N	\N	\N	\N	ERSgdtFn38nqNZKKgM8h	2026-08-24 19:07:31.307922	2026-08-24 19:07:31.305485	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
173	seminar_student_11@mampf.edu	$2a$11$SxM0.xXnP/WuCUCrkA1Cuead.MKKF.4coP0uKti5ymw8kM8Oc2WYS	\N	\N	\N	2026-08-24 19:07:31.408122	2026-08-24 19:07:56.386484	f	1	t	2026-08-24 19:07:31.408102	Seminar Student 11	\N	f	en	\N	\N	\N	\N	\N	LKAGN4vo9FuySxY-iZSz	2026-08-24 19:07:31.410377	2026-08-24 19:07:31.408143	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
174	external_student_0@mampf.edu	$2a$11$FCTRrIglaJGPdZq//W8Yx.nt.3pQkyhPWgeSrPdc/QxC5TViMvrfu	\N	\N	\N	2026-08-24 19:07:31.738899	2026-08-24 19:07:56.48449	f	1	t	2026-08-24 19:07:31.738878	External Student 0	\N	f	en	\N	\N	\N	\N	\N	kRf3gEnFt3ZzwCGinD3m	2026-08-24 19:07:31.741347	2026-08-24 19:07:31.738922	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
175	external_student_1@mampf.edu	$2a$11$gKYnhCu/VRNw6yawRDavf.R5BNrmNqdBIktYjMJ5bVuE0OoLVsSf6	\N	\N	\N	2026-08-24 19:07:31.848144	2026-08-24 19:07:56.582466	f	1	t	2026-08-24 19:07:31.848124	External Student 1	\N	f	en	\N	\N	\N	\N	\N	BWS2xnrdZuJbsrvRP78K	2026-08-24 19:07:31.850574	2026-08-24 19:07:31.848165	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
176	nachruecker_0@mampf.edu	$2a$11$jq6OF2/mzS9bqEWvjt5aueku7CLbWRIKrEqKgGJhOyvorLyygfNwu	\N	\N	\N	2026-08-24 19:07:31.993084	2026-08-24 19:07:56.67848	f	1	t	2026-08-24 19:07:31.993063	Nachrücker 0	\N	f	en	\N	\N	\N	\N	\N	Hh3z6QJesayxdxPfi9n2	2026-08-24 19:07:31.995532	2026-08-24 19:07:31.993107	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
177	nachruecker_1@mampf.edu	$2a$11$DnJjh5Y7rfiVZWai/kBeWu5E3PlejnZUkdXc/kjvIC1I972jTPz/e	\N	\N	\N	2026-08-24 19:07:32.098556	2026-08-24 19:07:56.777399	f	1	t	2026-08-24 19:07:32.098533	Nachrücker 1	\N	f	en	\N	\N	\N	\N	\N	EoWxHGoc_VSkUYcyszp2	2026-08-24 19:07:32.101166	2026-08-24 19:07:32.098581	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
178	nachruecker_2@mampf.edu	$2a$11$izwjGYReW8D38EAKrHm0mu6yE3nXIkfhkLTom1Zr5EpJvtaMsHJzu	\N	\N	\N	2026-08-24 19:07:32.202862	2026-08-24 19:07:56.872403	f	1	t	2026-08-24 19:07:32.202831	Nachrücker 2	\N	f	en	\N	\N	\N	\N	\N	geBZuHrqTDjr6fDPiB6R	2026-08-24 19:07:32.20545	2026-08-24 19:07:32.202886	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
179	nachruecker_3@mampf.edu	$2a$11$sCf/2yjKMfJiwv98QhdhHeB3WhgBnaMIfcCW8jcQl1mKmNw5LR5su	\N	\N	\N	2026-08-24 19:07:32.307288	2026-08-24 19:07:56.968586	f	1	t	2026-08-24 19:07:32.307265	Nachrücker 3	\N	f	en	\N	\N	\N	\N	\N	sjsAw9Dxm1aW-c_xzTv6	2026-08-24 19:07:32.310001	2026-08-24 19:07:32.307313	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
180	nachruecker_4@mampf.edu	$2a$11$Dm5TrIS3hqBEtpQJgw06xeBRoGQ3IIHl67z1a4Pkf4Wdeovd6W8Eu	\N	\N	\N	2026-08-24 19:07:32.410721	2026-08-24 19:07:57.064475	f	1	t	2026-08-24 19:07:32.410701	Nachrücker 4	\N	f	en	\N	\N	\N	\N	\N	ujChVHWPBfdPHydPNHTF	2026-08-24 19:07:32.41306	2026-08-24 19:07:32.410742	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
62	solver_user_2@example.com	$2a$11$WBb.xMvT7GEuGwhz0Ry2mulixWHkXb35PgB20iTMmRTzhEg9il0Nm	\N	\N	\N	2026-08-24 19:07:19.425421	2026-08-24 19:07:45.366448	f	1	t	2026-08-24 19:07:19.4254	Solver User 2	\N	f	en	\N	\N	\N	\N	\N	aQUdoYqFobYvY3x_S9ZZ	2026-08-24 19:07:19.42827	2026-08-24 19:07:19.425451	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
94	solver_user_34@example.com	$2a$11$.eUbk9/9Q2UrnTHeSsRh3e0t/zKRVBMwExlGczU1LtsOO6Z1vtB1.	\N	\N	\N	2026-08-24 19:07:22.878845	2026-08-24 19:07:48.500291	f	1	t	2026-08-24 19:07:22.878821	Solver User 34	\N	f	en	\N	\N	\N	\N	\N	BBq8vdQSGTq2MqvRNCKj	2026-08-24 19:07:22.881301	2026-08-24 19:07:22.878876	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
157	cohort_user_42@example.com	$2a$11$DvqJL9qg8rj63QJxFgm7S.R5AdxGQi4csv9t/PP5c2V.ZsOIEAov6	\N	\N	\N	2026-08-24 19:07:29.662048	2026-08-24 19:07:54.77594	f	1	t	2026-08-24 19:07:29.662027	Cohort User 42	\N	f	en	\N	\N	\N	\N	\N	kfztWcfe-Bm7RWLWtpSr	2026-08-24 19:07:29.664548	2026-08-24 19:07:29.66207	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
158	cohort_user_43@example.com	$2a$11$TUfeYx5ytT4kvdUOh1M9Ae0XWWtTJQThcx9XYAhVMgHBUH1/00ehO	\N	\N	\N	2026-08-24 19:07:29.768377	2026-08-24 19:07:54.87666	f	1	t	2026-08-24 19:07:29.768357	Cohort User 43	\N	f	en	\N	\N	\N	\N	\N	EP5LSg4dCDHsGTay8uw6	2026-08-24 19:07:29.770699	2026-08-24 19:07:29.768397	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
159	cohort_user_44@example.com	$2a$11$Gyi8uqTN4G5O8BF82sqqHe./p2Wq9JwrsKrreHn1FicdH6XQTYVii	\N	\N	\N	2026-08-24 19:07:29.875254	2026-08-24 19:07:54.974751	f	1	t	2026-08-24 19:07:29.875232	Cohort User 44	\N	f	en	\N	\N	\N	\N	\N	XEAJg3DzgmbDnxNrUVZ1	2026-08-24 19:07:29.877524	2026-08-24 19:07:29.875276	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
160	cohort_user_45@example.com	$2a$11$yvV1VhZEsuFFDc7P8j3eSOL/NW1WHrFnatuaINOijJ7Fe4JYZ.8Yu	\N	\N	\N	2026-08-24 19:07:29.982665	2026-08-24 19:07:55.075385	f	1	t	2026-08-24 19:07:29.982645	Cohort User 45	\N	f	en	\N	\N	\N	\N	\N	zsZZNAqPyLuEnVwCbyEo	2026-08-24 19:07:29.984879	2026-08-24 19:07:29.982686	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
161	cohort_user_46@example.com	$2a$11$qbnqHo8YWcx6WNpEeWH4EOAjlVwH35QbJT.ZVEDO.g7xXSc6o4R/q	\N	\N	\N	2026-08-24 19:07:30.084604	2026-08-24 19:07:55.181805	f	1	t	2026-08-24 19:07:30.084584	Cohort User 46	\N	f	en	\N	\N	\N	\N	\N	1REphXvu4dfKxRLBu9za	2026-08-24 19:07:30.086781	2026-08-24 19:07:30.084625	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
164	seminar_student_2@mampf.edu	$2a$11$DZIy7RoIcyiwJNQeTVHLke6I1Exlj3hAUqCGKoZnntZsuDEcaJX9C	\N	\N	\N	2026-08-24 19:07:30.489782	2026-08-24 19:07:55.500091	f	1	t	2026-08-24 19:07:30.489762	Seminar Student 2	\N	f	en	\N	\N	\N	\N	\N	eSwioJMDFm84yQ72JByz	2026-08-24 19:07:30.491969	2026-08-24 19:07:30.489804	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
167	seminar_student_5@mampf.edu	$2a$11$8BeXuUr0a3ArFG5eWWgmveOJxJ2f6yIXDwmhXRMsaZ5pz/iCrhHoG	\N	\N	\N	2026-08-24 19:07:30.79291	2026-08-24 19:07:55.809141	f	1	t	2026-08-24 19:07:30.79289	Seminar Student 5	\N	f	en	\N	\N	\N	\N	\N	5XjPVKXGZb2vqeUkL5mQ	2026-08-24 19:07:30.795164	2026-08-24 19:07:30.792931	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
168	seminar_student_6@mampf.edu	$2a$11$sG7Gp7QKeFacssOuh623fepyYI3BCyNwqOf3nI92M3CeRS041yr0O	\N	\N	\N	2026-08-24 19:07:30.897456	2026-08-24 19:07:55.905067	f	1	t	2026-08-24 19:07:30.897436	Seminar Student 6	\N	f	en	\N	\N	\N	\N	\N	ztdfddtnyU4hXCbHA3gC	2026-08-24 19:07:30.899665	2026-08-24 19:07:30.897477	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
162	seminar_student_0@mampf.edu	$2a$11$YXsb6qJJVISodK1wpsGsjeIkmpg16DhfwGPGy4HSzE8Q85gW1J7Jy	\N	\N	\N	2026-08-24 19:07:30.2825	2026-08-24 19:07:55.289358	f	1	t	2026-08-24 19:07:30.282478	Seminar Student 0	\N	f	en	\N	\N	\N	\N	\N	tzXq1s4xsxdLjKYzskeE	2026-08-24 19:07:30.285147	2026-08-24 19:07:30.282521	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
165	seminar_student_3@mampf.edu	$2a$11$y3aD2TYjppkavY3OcvEtV.l2h158TOOmYxFVeY3ZLAgAZjtbHEiS2	\N	\N	\N	2026-08-24 19:07:30.591623	2026-08-24 19:07:55.606726	f	1	t	2026-08-24 19:07:30.591604	Seminar Student 3	\N	f	en	\N	\N	\N	\N	\N	yzLfdV2RFnH3FfNJnfcK	2026-08-24 19:07:30.59389	2026-08-24 19:07:30.591646	\N	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	0	\N
\.


--
-- Data for Name: vignettes_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_answers (id, type, vignettes_question_id, vignettes_slide_id, vignettes_user_answer_id, text, likert_scale_value, created_at, updated_at) FROM stdin;
8	Vignettes::TextAnswer	4	4	4	Schlangenlemma	\N	2025-07-14 15:12:42.170271	2025-07-14 15:12:42.170271
9	Vignettes::MultipleChoiceAnswer	5	5	4	\N	\N	2025-07-14 15:13:10.788364	2025-07-14 15:13:10.788364
10	Vignettes::LikertScaleAnswer	6	6	4	\N	disagree	2025-07-14 15:13:15.60867	2025-07-14 15:13:15.60867
\.


--
-- Data for Name: vignettes_answers_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_answers_options (vignettes_answer_id, vignettes_option_id) FROM stdin;
9	7
\.


--
-- Data for Name: vignettes_codenames; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_codenames (id, pseudonym, user_id, lecture_id, created_at, updated_at) FROM stdin;
1	HZUS57	5	28	2025-07-14 11:50:20.413531	2025-07-14 11:50:20.413531
2	UJSBGATR	6	28	2025-07-14 14:02:29.627335	2025-07-14 14:02:29.627335
3	7HZSGRE	7	28	2025-07-14 15:04:23.913466	2025-07-14 15:04:23.913466
\.


--
-- Data for Name: vignettes_completion_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_completion_messages (id, lecture_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: vignettes_info_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_info_slides (id, title, vignettes_questionnaire_id, icon_type, created_at, updated_at) FROM stdin;
2	Informationen	2	eye	2025-07-14 15:09:29.112665	2025-07-14 15:09:29.116847
\.


--
-- Data for Name: vignettes_info_slides_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_info_slides_slides (vignettes_info_slide_id, vignettes_slide_id) FROM stdin;
2	5
\.


--
-- Data for Name: vignettes_options; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_options (id, text, vignettes_question_id, created_at, updated_at) FROM stdin;
5	Tschechisch	5	2025-07-14 15:11:22.029809	2025-07-14 15:11:22.029809
6	Slowakisch	5	2025-07-14 15:11:22.030968	2025-07-14 15:11:22.030968
7	Slowenisch	5	2025-07-14 15:11:22.03184	2025-07-14 15:11:22.03184
8	Kroatisch	5	2025-07-14 15:11:22.032543	2025-07-14 15:11:22.032543
\.


--
-- Data for Name: vignettes_questionnaires; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_questionnaires (id, title, lecture_id, published, editable, created_at, updated_at) FROM stdin;
2	Testvignette	28	t	f	2025-07-14 15:09:11.919174	2025-07-14 15:12:00.430996
\.


--
-- Data for Name: vignettes_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_questions (id, type, question_text, vignettes_slide_id, only_integer, min_number, max_number, language, created_at, updated_at) FROM stdin;
4	Vignettes::TextQuestion	Was ist das?	4	f	\N	\N	en	2025-07-14 15:10:15.639754	2025-07-14 15:10:15.639754
5	Vignettes::MultipleChoiceQuestion	Welches Tastaturlayout ist das?	5	f	\N	\N	en	2025-07-14 15:11:22.028604	2025-07-14 15:11:22.028604
6	Vignettes::LikertScaleQuestion	Wurden deine Erwartungen erfüllt?	6	f	\N	\N	de	2025-07-14 15:11:52.25297	2025-07-14 15:11:52.25297
\.


--
-- Data for Name: vignettes_slide_statistics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_slide_statistics (id, user_id, vignettes_answer_id, time_on_slide, total_time_on_slide, time_on_info_slides, info_slides_access_count, info_slides_first_access_time, created_at, updated_at) FROM stdin;
2	5	8	23	23	{}	{}	{}	2025-07-14 15:12:42.171486	2025-07-14 15:12:42.171486
3	5	9	28	28	{}	{}	{}	2025-07-14 15:13:10.789473	2025-07-14 15:13:10.789473
4	5	10	4	4	{}	{}	{}	2025-07-14 15:13:15.610299	2025-07-14 15:13:15.610299
\.


--
-- Data for Name: vignettes_slides; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_slides (id, title, vignettes_questionnaire_id, "position", created_at, updated_at) FROM stdin;
4	Erste Slide	2	1	2025-07-14 15:10:15.622982	2025-07-14 15:10:15.700008
5	Zweite Slide	2	2	2025-07-14 15:11:22.015487	2025-07-14 15:11:22.055107
6	Letzte Slide	2	3	2025-07-14 15:11:52.25048	2025-07-14 15:11:52.252295
\.


--
-- Data for Name: vignettes_user_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vignettes_user_answers (id, user_id, vignettes_questionnaire_id, created_at, updated_at) FROM stdin;
4	5	2	2025-07-14 15:12:18.622235	2025-07-14 15:12:18.622235
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.votes (id, votable_type, votable_id, voter_type, voter_id, vote_flag, vote_scope, vote_weight, created_at, updated_at) FROM stdin;
1	Commontator::Comment	3	User	6	t	\N	1	2022-08-05 13:39:47.797346	2022-08-05 13:39:47.797346
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.vouchers (id, role, lecture_id, secure_hash, invalidated_at, expires_at, created_at, updated_at) FROM stdin;
1fd281f2-0192-4fa0-897b-27718cc28511	0	1	2e6af40b0f95b636aa2d1a974f876b8f	2026-07-14 11:07:37.673926	2026-07-28 11:07:23.901548	2025-07-14 11:07:23.901548	2025-07-14 11:07:37.674734
e2273c2f-fd1d-4d58-950e-a01d33aeac33	1	3	50b4626ef862f2ea57711560312435ce	\N	2026-07-17 11:09:15.735269	2025-07-14 11:09:15.735269	2025-07-14 11:09:15.735269
ccc50df8-0262-4372-bb3e-d8cc1650663e	0	3	551e12e67488e373418dd0ea9e22acbc	\N	2026-07-28 11:09:16.709169	2025-07-14 11:09:16.709169	2025-07-14 11:09:16.709169
8ed8a767-7faa-486c-a757-7417ffd04c3d	3	29	431d5aa6f1131afcb2765a2d7053f1f6	\N	2026-08-14 12:09:41.03965	2025-07-15 12:09:41.03965	2025-07-15 12:09:41.03965
\.


--
-- Data for Name: watchlist_entries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.watchlist_entries (id, watchlist_id, medium_id, medium_position, created_at, updated_at) FROM stdin;
1	3	39	0	2022-08-05 13:52:07.795377	2022-08-05 13:52:07.795377
2	3	11	1	2022-08-05 13:52:15.489454	2022-08-05 13:52:15.489454
3	4	39	0	2022-08-05 13:53:14.826467	2022-08-05 13:53:14.826467
4	5	9	0	2025-07-14 11:30:21.726398	2025-07-14 11:30:21.726398
5	5	7	1	2025-07-14 11:30:24.602332	2025-07-14 11:30:24.602332
6	6	42	1	2026-08-24 19:07:39.606724	2026-08-24 19:07:39.606724
7	6	39	2	2026-08-24 19:07:39.621735	2026-08-24 19:07:39.621735
8	6	41	3	2026-08-24 19:07:39.630712	2026-08-24 19:07:39.630712
9	7	52	1	2026-08-24 19:07:39.649346	2026-08-24 19:07:39.649346
10	7	39	2	2026-08-24 19:07:39.658756	2026-08-24 19:07:39.658756
11	7	51	3	2026-08-24 19:07:39.666689	2026-08-24 19:07:39.666689
12	8	43	1	2026-08-24 19:07:39.685879	2026-08-24 19:07:39.685879
13	8	42	2	2026-08-24 19:07:39.694944	2026-08-24 19:07:39.694944
14	8	52	3	2026-08-24 19:07:39.703385	2026-08-24 19:07:39.703385
\.


--
-- Data for Name: watchlists; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.watchlists (id, user_id, watchlist_entry_id, created_at, updated_at, name, public, description) FROM stdin;
3	5	\N	2022-08-05 13:51:36.010128	2022-08-05 13:51:52.069354	My public watchlist	t	Here's my public watchlist
4	5	\N	2022-08-05 13:52:49.485056	2022-08-05 13:52:49.485056	My private watchlist	f	Here's my private watchlist.
5	8	\N	2025-07-14 11:30:08.902407	2025-07-14 11:30:08.902407	Neue Watchlist	f	Libeslingsmedien
6	6	\N	2026-08-24 19:07:39.579769	2026-08-24 19:07:39.579769	Wiederholung 1	f	\N
7	9	\N	2026-08-24 19:07:39.643703	2026-08-24 19:07:39.643703	Wiederholung 4	f	\N
8	7	\N	2026-08-24 19:07:39.680067	2026-08-24 19:07:39.680067	Wiederholung 5	f	\N
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 8, true);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 8, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 8, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 4, true);


--
-- Name: annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.annotations_id_seq', 27, true);


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.announcements_id_seq', 14, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.answers_id_seq', 39, true);


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.assignments_id_seq', 3, true);


--
-- Name: chapters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.chapters_id_seq', 10, true);


--
-- Name: claims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.claims_id_seq', 3, true);


--
-- Name: cohorts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cohorts_id_seq', 4, true);


--
-- Name: commontator_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_comments_id_seq', 37, true);


--
-- Name: commontator_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_subscriptions_id_seq', 1, false);


--
-- Name: commontator_threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.commontator_threads_id_seq', 52, true);


--
-- Name: course_self_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_self_joins_id_seq', 1, false);


--
-- Name: course_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.course_tag_joins_id_seq', 48, true);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 16, true);


--
-- Name: division_course_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.division_course_joins_id_seq', 9, true);


--
-- Name: division_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.division_translations_id_seq', 8, true);


--
-- Name: divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.divisions_id_seq', 4, true);


--
-- Name: editable_user_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.editable_user_joins_id_seq', 187, true);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 1, true);


--
-- Name: flipper_features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flipper_features_id_seq', 1, false);


--
-- Name: flipper_gates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flipper_gates_id_seq', 1, false);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 18, true);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- Name: item_self_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_self_joins_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_id_seq', 388, true);


--
-- Name: lecture_user_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lecture_user_joins_id_seq', 137, true);


--
-- Name: lectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lectures_id_seq', 35, true);


--
-- Name: lesson_section_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_section_joins_id_seq', 12, true);


--
-- Name: lesson_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lesson_tag_joins_id_seq', 55, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lessons_id_seq', 12, true);


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 1, false);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.media_id_seq', 52, true);


--
-- Name: medium_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.medium_tag_joins_id_seq', 49, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 564, true);


--
-- Name: notions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notions_id_seq', 84, true);


--
-- Name: program_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.program_translations_id_seq', 4, true);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.programs_id_seq', 2, true);


--
-- Name: readers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.readers_id_seq', 1, true);


--
-- Name: redemptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.redemptions_id_seq', 3, true);


--
-- Name: referrals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.referrals_id_seq', 12, true);


--
-- Name: registration_student_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.registration_student_messages_id_seq', 1, false);


--
-- Name: relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.relations_id_seq', 58, true);


--
-- Name: section_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.section_tag_joins_id_seq', 45, true);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sections_id_seq', 37, true);


--
-- Name: speaker_talk_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.speaker_talk_joins_id_seq', 15, true);


--
-- Name: subject_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subject_translations_id_seq', 4, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 2, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 48, true);


--
-- Name: talk_tag_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talk_tag_joins_id_seq', 5, true);


--
-- Name: talks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.talks_id_seq', 42, true);


--
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.terms_id_seq', 10, true);


--
-- Name: thredded_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_categories_id_seq', 1, false);


--
-- Name: thredded_messageboard_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_groups_id_seq', 1, false);


--
-- Name: thredded_messageboard_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_notifications_for_followed_topics_id_seq', 1, false);


--
-- Name: thredded_messageboard_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboard_users_id_seq', 2, true);


--
-- Name: thredded_messageboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_messageboards_id_seq', 9, true);


--
-- Name: thredded_notifications_for_followed_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_notifications_for_followed_topics_id_seq', 1, false);


--
-- Name: thredded_notifications_for_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_notifications_for_private_topics_id_seq', 1, false);


--
-- Name: thredded_post_moderation_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_post_moderation_records_id_seq', 1, false);


--
-- Name: thredded_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_posts_id_seq', 50, true);


--
-- Name: thredded_private_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_posts_id_seq', 1, false);


--
-- Name: thredded_private_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_topics_id_seq', 1, false);


--
-- Name: thredded_private_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_private_users_id_seq', 1, false);


--
-- Name: thredded_topic_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_topic_categories_id_seq', 1, false);


--
-- Name: thredded_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_topics_id_seq', 18, true);


--
-- Name: thredded_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_details_id_seq', 4, true);


--
-- Name: thredded_user_messageboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_messageboard_preferences_id_seq', 1, false);


--
-- Name: thredded_user_post_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_post_notifications_id_seq', 1, false);


--
-- Name: thredded_user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_preferences_id_seq', 1, false);


--
-- Name: thredded_user_private_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_private_topic_read_states_id_seq', 1, false);


--
-- Name: thredded_user_topic_follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_topic_follows_id_seq', 50, true);


--
-- Name: thredded_user_topic_read_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.thredded_user_topic_read_states_id_seq', 2, true);


--
-- Name: tutor_tutorial_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tutor_tutorial_joins_id_seq', 1, true);


--
-- Name: tutorials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tutorials_id_seq', 20, true);


--
-- Name: user_favorite_lecture_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_favorite_lecture_joins_id_seq', 7, true);


--
-- Name: user_submission_joins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_submission_joins_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 180, true);


--
-- Name: vignettes_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_answers_id_seq', 10, true);


--
-- Name: vignettes_codenames_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_codenames_id_seq', 3, true);


--
-- Name: vignettes_completion_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_completion_messages_id_seq', 1, false);


--
-- Name: vignettes_info_slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_info_slides_id_seq', 2, true);


--
-- Name: vignettes_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_options_id_seq', 8, true);


--
-- Name: vignettes_questionnaires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_questionnaires_id_seq', 2, true);


--
-- Name: vignettes_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_questions_id_seq', 6, true);


--
-- Name: vignettes_slide_statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_slide_statistics_id_seq', 4, true);


--
-- Name: vignettes_slides_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_slides_id_seq', 6, true);


--
-- Name: vignettes_user_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.vignettes_user_answers_id_seq', 4, true);


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.votes_id_seq', 1, true);


--
-- Name: watchlist_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlist_entries_id_seq', 14, true);


--
-- Name: watchlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.watchlists_id_seq', 8, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: annotations annotations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT annotations_pkey PRIMARY KEY (id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: chapters chapters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chapters
    ADD CONSTRAINT chapters_pkey PRIMARY KEY (id);


--
-- Name: claims claims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT claims_pkey PRIMARY KEY (id);


--
-- Name: cohort_memberships cohort_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT cohort_memberships_pkey PRIMARY KEY (id);


--
-- Name: cohorts cohorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohorts
    ADD CONSTRAINT cohorts_pkey PRIMARY KEY (id);


--
-- Name: commontator_comments commontator_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT commontator_comments_pkey PRIMARY KEY (id);


--
-- Name: commontator_subscriptions commontator_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT commontator_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: commontator_threads commontator_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_threads
    ADD CONSTRAINT commontator_threads_pkey PRIMARY KEY (id);


--
-- Name: course_self_joins course_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT course_self_joins_pkey PRIMARY KEY (id);


--
-- Name: course_tag_joins course_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_tag_joins
    ADD CONSTRAINT course_tag_joins_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: division_course_joins division_course_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_course_joins
    ADD CONSTRAINT division_course_joins_pkey PRIMARY KEY (id);


--
-- Name: division_translations division_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.division_translations
    ADD CONSTRAINT division_translations_pkey PRIMARY KEY (id);


--
-- Name: divisions divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- Name: editable_user_joins editable_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.editable_user_joins
    ADD CONSTRAINT editable_user_joins_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: flipper_features flipper_features_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_features
    ADD CONSTRAINT flipper_features_pkey PRIMARY KEY (id);


--
-- Name: flipper_gates flipper_gates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flipper_gates
    ADD CONSTRAINT flipper_gates_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: item_self_joins item_self_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_self_joins
    ADD CONSTRAINT item_self_joins_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: lecture_memberships lecture_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT lecture_memberships_pkey PRIMARY KEY (id);


--
-- Name: lecture_user_joins lecture_user_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT lecture_user_joins_pkey PRIMARY KEY (id);


--
-- Name: lectures lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lectures_pkey PRIMARY KEY (id);


--
-- Name: lesson_section_joins lesson_section_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_section_joins
    ADD CONSTRAINT lesson_section_joins_pkey PRIMARY KEY (id);


--
-- Name: lesson_tag_joins lesson_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lesson_tag_joins
    ADD CONSTRAINT lesson_tag_joins_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: medium_tag_joins medium_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT medium_tag_joins_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: notions notions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notions
    ADD CONSTRAINT notions_pkey PRIMARY KEY (id);


--
-- Name: program_translations program_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program_translations
    ADD CONSTRAINT program_translations_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: quiz_certificates quiz_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT quiz_certificates_pkey PRIMARY KEY (id);


--
-- Name: readers readers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.readers
    ADD CONSTRAINT readers_pkey PRIMARY KEY (id);


--
-- Name: redemptions redemptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT redemptions_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: registration_campaigns registration_campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_campaigns
    ADD CONSTRAINT registration_campaigns_pkey PRIMARY KEY (id);


--
-- Name: registration_items registration_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_items
    ADD CONSTRAINT registration_items_pkey PRIMARY KEY (id);


--
-- Name: registration_policies registration_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_policies
    ADD CONSTRAINT registration_policies_pkey PRIMARY KEY (id);


--
-- Name: registration_student_messages registration_student_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT registration_student_messages_pkey PRIMARY KEY (id);


--
-- Name: registration_user_registrations registration_user_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT registration_user_registrations_pkey PRIMARY KEY (id);


--
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: section_tag_joins section_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.section_tag_joins
    ADD CONSTRAINT section_tag_joins_pkey PRIMARY KEY (id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: speaker_talk_joins speaker_talk_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT speaker_talk_joins_pkey PRIMARY KEY (id);


--
-- Name: subject_translations subject_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subject_translations
    ADD CONSTRAINT subject_translations_pkey PRIMARY KEY (id);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: talk_tag_joins talk_tag_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT talk_tag_joins_pkey PRIMARY KEY (id);


--
-- Name: talks talks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT talks_pkey PRIMARY KEY (id);


--
-- Name: terms terms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT terms_pkey PRIMARY KEY (id);


--
-- Name: thredded_categories thredded_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_categories
    ADD CONSTRAINT thredded_categories_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboard_groups thredded_messageboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_groups
    ADD CONSTRAINT thredded_messageboard_groups_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboard_notifications_for_followed_topics thredded_messageboard_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_notifications_for_followed_topics
    ADD CONSTRAINT thredded_messageboard_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboard_users thredded_messageboard_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT thredded_messageboard_users_pkey PRIMARY KEY (id);


--
-- Name: thredded_messageboards thredded_messageboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboards
    ADD CONSTRAINT thredded_messageboards_pkey PRIMARY KEY (id);


--
-- Name: thredded_notifications_for_followed_topics thredded_notifications_for_followed_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_followed_topics
    ADD CONSTRAINT thredded_notifications_for_followed_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_notifications_for_private_topics thredded_notifications_for_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_notifications_for_private_topics
    ADD CONSTRAINT thredded_notifications_for_private_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_post_moderation_records thredded_post_moderation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_post_moderation_records
    ADD CONSTRAINT thredded_post_moderation_records_pkey PRIMARY KEY (id);


--
-- Name: thredded_posts thredded_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_posts
    ADD CONSTRAINT thredded_posts_pkey PRIMARY KEY (id);


--
-- Name: thredded_private_posts thredded_private_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_posts
    ADD CONSTRAINT thredded_private_posts_pkey PRIMARY KEY (id);


--
-- Name: thredded_private_topics thredded_private_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_topics
    ADD CONSTRAINT thredded_private_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_private_users thredded_private_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_private_users
    ADD CONSTRAINT thredded_private_users_pkey PRIMARY KEY (id);


--
-- Name: thredded_topic_categories thredded_topic_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topic_categories
    ADD CONSTRAINT thredded_topic_categories_pkey PRIMARY KEY (id);


--
-- Name: thredded_topics thredded_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_topics
    ADD CONSTRAINT thredded_topics_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_details thredded_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_details
    ADD CONSTRAINT thredded_user_details_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_messageboard_preferences thredded_user_messageboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_messageboard_preferences
    ADD CONSTRAINT thredded_user_messageboard_preferences_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_post_notifications thredded_user_post_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT thredded_user_post_notifications_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_preferences thredded_user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_preferences
    ADD CONSTRAINT thredded_user_preferences_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_private_topic_read_states thredded_user_private_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_private_topic_read_states
    ADD CONSTRAINT thredded_user_private_topic_read_states_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_topic_follows thredded_user_topic_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_follows
    ADD CONSTRAINT thredded_user_topic_follows_pkey PRIMARY KEY (id);


--
-- Name: thredded_user_topic_read_states thredded_user_topic_read_states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_topic_read_states
    ADD CONSTRAINT thredded_user_topic_read_states_pkey PRIMARY KEY (id);


--
-- Name: tutor_tutorial_joins tutor_tutorial_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT tutor_tutorial_joins_pkey PRIMARY KEY (id);


--
-- Name: tutorial_memberships tutorial_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT tutorial_memberships_pkey PRIMARY KEY (id);


--
-- Name: tutorials tutorials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT tutorials_pkey PRIMARY KEY (id);


--
-- Name: user_favorite_lecture_joins user_favorite_lecture_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT user_favorite_lecture_joins_pkey PRIMARY KEY (id);


--
-- Name: user_submission_joins user_submission_joins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT user_submission_joins_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vignettes_answers vignettes_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT vignettes_answers_pkey PRIMARY KEY (id);


--
-- Name: vignettes_codenames vignettes_codenames_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT vignettes_codenames_pkey PRIMARY KEY (id);


--
-- Name: vignettes_completion_messages vignettes_completion_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages
    ADD CONSTRAINT vignettes_completion_messages_pkey PRIMARY KEY (id);


--
-- Name: vignettes_info_slides vignettes_info_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_info_slides
    ADD CONSTRAINT vignettes_info_slides_pkey PRIMARY KEY (id);


--
-- Name: vignettes_options vignettes_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options
    ADD CONSTRAINT vignettes_options_pkey PRIMARY KEY (id);


--
-- Name: vignettes_questionnaires vignettes_questionnaires_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires
    ADD CONSTRAINT vignettes_questionnaires_pkey PRIMARY KEY (id);


--
-- Name: vignettes_questions vignettes_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions
    ADD CONSTRAINT vignettes_questions_pkey PRIMARY KEY (id);


--
-- Name: vignettes_slide_statistics vignettes_slide_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT vignettes_slide_statistics_pkey PRIMARY KEY (id);


--
-- Name: vignettes_slides vignettes_slides_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides
    ADD CONSTRAINT vignettes_slides_pkey PRIMARY KEY (id);


--
-- Name: vignettes_user_answers vignettes_user_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT vignettes_user_answers_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- Name: watchlist_entries watchlist_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT watchlist_entries_pkey PRIMARY KEY (id);


--
-- Name: watchlists watchlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT watchlists_pkey PRIMARY KEY (id);


--
-- Name: idx_on_vignettes_info_slide_id_vignettes_slide_id_2bdc65ab76; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_vignettes_info_slide_id_vignettes_slide_id_2bdc65ab76 ON public.vignettes_info_slides_slides USING btree (vignettes_info_slide_id, vignettes_slide_id);


--
-- Name: idx_on_vignettes_slide_id_vignettes_info_slide_id_c74f04e951; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_on_vignettes_slide_id_vignettes_info_slide_id_c74f04e951 ON public.vignettes_info_slides_slides USING btree (vignettes_slide_id, vignettes_info_slide_id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_annotations_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_annotations_on_medium_id ON public.annotations USING btree (medium_id);


--
-- Name: index_annotations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_annotations_on_user_id ON public.annotations USING btree (user_id);


--
-- Name: index_announcements_on_announcer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_announcer_id ON public.announcements USING btree (announcer_id);


--
-- Name: index_announcements_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_announcements_on_lecture_id ON public.announcements USING btree (lecture_id);


--
-- Name: index_answers_on_explanation_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_explanation_trgm ON public.answers USING gin (explanation public.gin_trgm_ops);


--
-- Name: index_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_question_id ON public.answers USING btree (question_id);


--
-- Name: index_answers_on_text_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_text_trgm ON public.answers USING gin (text public.gin_trgm_ops);


--
-- Name: index_answers_options_on_answer_id_and_option_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_options_on_answer_id_and_option_id ON public.vignettes_answers_options USING btree (vignettes_answer_id, vignettes_option_id);


--
-- Name: index_answers_options_on_option_id_and_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_options_on_option_id_and_answer_id ON public.vignettes_answers_options USING btree (vignettes_option_id, vignettes_answer_id);


--
-- Name: index_assignments_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_lecture_id ON public.assignments USING btree (lecture_id);


--
-- Name: index_assignments_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assignments_on_medium_id ON public.assignments USING btree (medium_id);


--
-- Name: index_chapters_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chapters_on_lecture_id ON public.chapters USING btree (lecture_id);


--
-- Name: index_claims_on_claimable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_claims_on_claimable ON public.claims USING btree (claimable_type, claimable_id);


--
-- Name: index_claims_on_redemption_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_claims_on_redemption_id ON public.claims USING btree (redemption_id);


--
-- Name: index_cohort_memberships_on_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_cohort_id ON public.cohort_memberships USING btree (cohort_id);


--
-- Name: index_cohort_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_source_campaign_id ON public.cohort_memberships USING btree (source_campaign_id);


--
-- Name: index_cohort_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohort_memberships_on_user_id ON public.cohort_memberships USING btree (user_id);


--
-- Name: index_cohort_memberships_on_user_id_and_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cohort_memberships_on_user_id_and_cohort_id ON public.cohort_memberships USING btree (user_id, cohort_id);


--
-- Name: index_cohorts_on_context; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_context ON public.cohorts USING btree (context_type, context_id);


--
-- Name: index_cohorts_on_context_and_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_cohorts_on_context_and_title_unique ON public.cohorts USING btree (context_type, context_id, title);


--
-- Name: index_cohorts_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_self_materialization_mode ON public.cohorts USING btree (self_materialization_mode);


--
-- Name: index_commontator_comments_on_c_id_and_c_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_c_id_and_c_type_and_t_id ON public.commontator_comments USING btree (creator_id, creator_type, thread_id);


--
-- Name: index_commontator_comments_on_cached_votes_down; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_down ON public.commontator_comments USING btree (cached_votes_down);


--
-- Name: index_commontator_comments_on_cached_votes_up; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_cached_votes_up ON public.commontator_comments USING btree (cached_votes_up);


--
-- Name: index_commontator_comments_on_editor_type_and_editor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_editor_type_and_editor_id ON public.commontator_comments USING btree (editor_type, editor_id);


--
-- Name: index_commontator_comments_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_parent_id ON public.commontator_comments USING btree (parent_id);


--
-- Name: index_commontator_comments_on_thread_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_comments_on_thread_id_and_created_at ON public.commontator_comments USING btree (thread_id, created_at);


--
-- Name: index_commontator_subscriptions_on_s_id_and_s_type_and_t_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_subscriptions_on_s_id_and_s_type_and_t_id ON public.commontator_subscriptions USING btree (subscriber_id, subscriber_type, thread_id);


--
-- Name: index_commontator_subscriptions_on_thread_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_subscriptions_on_thread_id ON public.commontator_subscriptions USING btree (thread_id);


--
-- Name: index_commontator_threads_on_c_id_and_c_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_commontator_threads_on_c_id_and_c_type ON public.commontator_threads USING btree (commontable_type, commontable_id);


--
-- Name: index_commontator_threads_on_closer_type_and_closer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_commontator_threads_on_closer_type_and_closer_id ON public.commontator_threads USING btree (closer_type, closer_id);


--
-- Name: index_course_self_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_course_id ON public.course_self_joins USING btree (course_id);


--
-- Name: index_course_self_joins_on_course_id_and_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_course_self_joins_on_course_id_and_preceding_course_id ON public.course_self_joins USING btree (course_id, preceding_course_id);


--
-- Name: index_course_self_joins_on_preceding_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_self_joins_on_preceding_course_id ON public.course_self_joins USING btree (preceding_course_id);


--
-- Name: index_course_tag_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_course_id ON public.course_tag_joins USING btree (course_id);


--
-- Name: index_course_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_course_tag_joins_on_tag_id ON public.course_tag_joins USING btree (tag_id);


--
-- Name: index_courses_on_short_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_short_title_trgm ON public.courses USING gin (short_title public.gin_trgm_ops);


--
-- Name: index_courses_on_term_independent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_term_independent ON public.courses USING btree (term_independent);


--
-- Name: index_courses_on_title_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_title_trigram ON public.courses USING gin (title public.gin_trgm_ops);


--
-- Name: index_courses_on_title_tsearch; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courses_on_title_tsearch ON public.courses USING gin (to_tsvector('simple'::regconfig, (title)::text));


--
-- Name: index_division_course_joins_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_course_id ON public.division_course_joins USING btree (course_id);


--
-- Name: index_division_course_joins_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_course_joins_on_division_id ON public.division_course_joins USING btree (division_id);


--
-- Name: index_division_translations_on_division_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_division_id ON public.division_translations USING btree (division_id);


--
-- Name: index_division_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_division_translations_on_locale ON public.division_translations USING btree (locale);


--
-- Name: index_divisions_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_divisions_on_program_id ON public.divisions USING btree (program_id);


--
-- Name: index_feedbacks_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_feedbacks_on_user_id ON public.feedbacks USING btree (user_id);


--
-- Name: index_flipper_features_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_flipper_features_on_key ON public.flipper_features USING btree (key);


--
-- Name: index_flipper_gates_on_feature_key_and_key_and_value; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_flipper_gates_on_feature_key_and_key_and_value ON public.flipper_gates USING btree (feature_key, key, value);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_imports_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_medium_id ON public.imports USING btree (medium_id);


--
-- Name: index_imports_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_imports_on_teachable_type_and_teachable_id ON public.imports USING btree (teachable_type, teachable_id);


--
-- Name: index_item_self_joins_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_item_id ON public.item_self_joins USING btree (item_id);


--
-- Name: index_item_self_joins_on_related_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_self_joins_on_related_item_id ON public.item_self_joins USING btree (related_item_id);


--
-- Name: index_items_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_medium_id ON public.items USING btree (medium_id);


--
-- Name: index_items_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_section_id ON public.items USING btree (section_id);


--
-- Name: index_lecture_memberships_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_lecture_id ON public.lecture_memberships USING btree (lecture_id);


--
-- Name: index_lecture_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_source_campaign_id ON public.lecture_memberships USING btree (source_campaign_id);


--
-- Name: index_lecture_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_memberships_on_user_id ON public.lecture_memberships USING btree (user_id);


--
-- Name: index_lecture_memberships_on_user_id_and_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_lecture_memberships_on_user_id_and_lecture_id ON public.lecture_memberships USING btree (user_id, lecture_id);


--
-- Name: index_lecture_user_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_lecture_id ON public.lecture_user_joins USING btree (lecture_id);


--
-- Name: index_lecture_user_joins_on_lecture_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_lecture_user_joins_on_lecture_id_and_user_id ON public.lecture_user_joins USING btree (lecture_id, user_id);


--
-- Name: index_lecture_user_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lecture_user_joins_on_user_id ON public.lecture_user_joins USING btree (user_id);


--
-- Name: index_lectures_on_released; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_released ON public.lectures USING btree (released);


--
-- Name: index_lectures_on_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_sort ON public.lectures USING btree (sort);


--
-- Name: index_lectures_on_teacher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_teacher_id ON public.lectures USING btree (teacher_id);


--
-- Name: index_lectures_on_term_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lectures_on_term_id ON public.lectures USING btree (term_id);


--
-- Name: index_lesson_section_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_lesson_id ON public.lesson_section_joins USING btree (lesson_id);


--
-- Name: index_lesson_section_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_section_joins_on_section_id ON public.lesson_section_joins USING btree (section_id);


--
-- Name: index_lesson_tag_joins_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_lesson_id ON public.lesson_tag_joins USING btree (lesson_id);


--
-- Name: index_lesson_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_tag_joins_on_tag_id ON public.lesson_tag_joins USING btree (tag_id);


--
-- Name: index_lessons_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lessons_on_lecture_id ON public.lessons USING btree (lecture_id);


--
-- Name: index_links_on_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_linked_medium_id ON public.links USING btree (linked_medium_id);


--
-- Name: index_links_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_links_on_medium_id ON public.links USING btree (medium_id);


--
-- Name: index_links_on_medium_id_and_linked_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_links_on_medium_id_and_linked_medium_id ON public.links USING btree (medium_id, linked_medium_id);


--
-- Name: index_media_on_answers_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_answers_count ON public.media USING btree (answers_count);


--
-- Name: index_media_on_content_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_content_trgm ON public.media USING gin (content public.gin_trgm_ops);


--
-- Name: index_media_on_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_description_trgm ON public.media USING gin (description public.gin_trgm_ops);


--
-- Name: index_media_on_external_link_description_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_external_link_description_trgm ON public.media USING gin (external_link_description public.gin_trgm_ops);


--
-- Name: index_media_on_released; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_released ON public.media USING btree (released);


--
-- Name: index_media_on_sort; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_sort ON public.media USING btree (sort);


--
-- Name: index_media_on_teachable_type_and_teachable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_teachable_type_and_teachable_id ON public.media USING btree (teachable_type, teachable_id);


--
-- Name: index_media_on_text_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_media_on_text_trgm ON public.media USING gin (text public.gin_trgm_ops);


--
-- Name: index_medium_tag_joins_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_medium_id ON public.medium_tag_joins USING btree (medium_id);


--
-- Name: index_medium_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_medium_tag_joins_on_tag_id ON public.medium_tag_joins USING btree (tag_id);


--
-- Name: index_notifications_on_notifiable_id_and_notifiable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_notifiable_id_and_notifiable_type ON public.notifications USING btree (notifiable_id, notifiable_type);


--
-- Name: index_notifications_on_recipient_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_recipient_id ON public.notifications USING btree (recipient_id);


--
-- Name: index_notions_on_aliased_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_aliased_tag_id ON public.notions USING btree (aliased_tag_id);


--
-- Name: index_notions_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_tag_id ON public.notions USING btree (tag_id);


--
-- Name: index_notions_on_title_trigram; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_title_trigram ON public.notions USING gin (title public.gin_trgm_ops);


--
-- Name: index_notions_on_title_tsearch; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notions_on_title_tsearch ON public.notions USING gin (to_tsvector('simple'::regconfig, title));


--
-- Name: index_program_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_locale ON public.program_translations USING btree (locale);


--
-- Name: index_program_translations_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_translations_on_program_id ON public.program_translations USING btree (program_id);


--
-- Name: index_programs_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_programs_on_subject_id ON public.programs USING btree (subject_id);


--
-- Name: index_quiz_certificates_on_quiz_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_quiz_id ON public.quiz_certificates USING btree (quiz_id);


--
-- Name: index_quiz_certificates_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_quiz_certificates_on_user_id ON public.quiz_certificates USING btree (user_id);


--
-- Name: index_redemptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_redemptions_on_user_id ON public.redemptions USING btree (user_id);


--
-- Name: index_redemptions_on_voucher_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_redemptions_on_voucher_id ON public.redemptions USING btree (voucher_id);


--
-- Name: index_referrals_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_item_id ON public.referrals USING btree (item_id);


--
-- Name: index_referrals_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_referrals_on_medium_id ON public.referrals USING btree (medium_id);


--
-- Name: index_reg_user_regs_on_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reg_user_regs_on_campaign_id ON public.registration_user_registrations USING btree (registration_campaign_id);


--
-- Name: index_reg_user_regs_on_rejection_overridden_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reg_user_regs_on_rejection_overridden_at ON public.registration_user_registrations USING btree (rejection_overridden_at);


--
-- Name: index_reg_user_regs_unique_exclusive_assignment_unranked; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_exclusive_assignment_unranked ON public.registration_user_registrations USING btree (registration_campaign_id, user_id) WHERE ((exclusive_assignment = true) AND (preference_rank IS NULL));


--
-- Name: index_reg_user_regs_unique_item_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_item_user ON public.registration_user_registrations USING btree (registration_campaign_id, user_id, registration_item_id);


--
-- Name: index_reg_user_regs_unique_ranked; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reg_user_regs_unique_ranked ON public.registration_user_registrations USING btree (registration_campaign_id, user_id, preference_rank) WHERE (preference_rank IS NOT NULL);


--
-- Name: index_registration_campaigns_on_allocation_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_allocation_mode ON public.registration_campaigns USING btree (allocation_mode);


--
-- Name: index_registration_campaigns_on_campaignable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_campaignable ON public.registration_campaigns USING btree (campaignable_type, campaignable_id);


--
-- Name: index_registration_campaigns_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_campaigns_on_status ON public.registration_campaigns USING btree (status);


--
-- Name: index_registration_items_on_registration_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_items_on_registration_campaign_id ON public.registration_items USING btree (registration_campaign_id);


--
-- Name: index_registration_items_on_unique_registerable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_registration_items_on_unique_registerable ON public.registration_items USING btree (registerable_type, registerable_id);


--
-- Name: index_registration_policies_on_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_active ON public.registration_policies USING btree (active);


--
-- Name: index_registration_policies_on_kind; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_kind ON public.registration_policies USING btree (kind);


--
-- Name: index_registration_policies_on_phase; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_phase ON public.registration_policies USING btree (phase);


--
-- Name: index_registration_policies_on_registration_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_on_registration_campaign_id ON public.registration_policies USING btree (registration_campaign_id);


--
-- Name: index_registration_policies_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_policies_position ON public.registration_policies USING btree (registration_campaign_id, "position");


--
-- Name: index_registration_student_messages_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_student_messages_on_lecture_id ON public.registration_student_messages USING btree (lecture_id);


--
-- Name: index_registration_student_messages_on_sender_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_student_messages_on_sender_id ON public.registration_student_messages USING btree (sender_id);


--
-- Name: index_registration_user_registrations_on_registration_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_registration_item_id ON public.registration_user_registrations USING btree (registration_item_id);


--
-- Name: index_registration_user_registrations_on_rejection_policy_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_rejection_policy_id ON public.registration_user_registrations USING btree (rejection_policy_id);


--
-- Name: index_registration_user_registrations_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_status ON public.registration_user_registrations USING btree (status);


--
-- Name: index_registration_user_registrations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registration_user_registrations_on_user_id ON public.registration_user_registrations USING btree (user_id);


--
-- Name: index_relations_on_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_related_tag_id ON public.relations USING btree (related_tag_id);


--
-- Name: index_relations_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_relations_on_tag_id ON public.relations USING btree (tag_id);


--
-- Name: index_relations_on_tag_id_and_related_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_relations_on_tag_id_and_related_tag_id ON public.relations USING btree (tag_id, related_tag_id);


--
-- Name: index_section_tag_joins_on_section_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_section_id ON public.section_tag_joins USING btree (section_id);


--
-- Name: index_section_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_section_tag_joins_on_tag_id ON public.section_tag_joins USING btree (tag_id);


--
-- Name: index_sections_on_chapter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_chapter_id ON public.sections USING btree (chapter_id);


--
-- Name: index_sections_on_title_trgm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sections_on_title_trgm ON public.sections USING gin (title public.gin_trgm_ops);


--
-- Name: index_speaker_talk_joins_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_source_campaign_id ON public.speaker_talk_joins USING btree (source_campaign_id);


--
-- Name: index_speaker_talk_joins_on_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_speaker_id ON public.speaker_talk_joins USING btree (speaker_id);


--
-- Name: index_speaker_talk_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_speaker_talk_joins_on_talk_id ON public.speaker_talk_joins USING btree (talk_id);


--
-- Name: index_speaker_talk_joins_on_talk_id_and_speaker_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_speaker_talk_joins_on_talk_id_and_speaker_id ON public.speaker_talk_joins USING btree (talk_id, speaker_id);


--
-- Name: index_subject_translations_on_locale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_locale ON public.subject_translations USING btree (locale);


--
-- Name: index_subject_translations_on_subject_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subject_translations_on_subject_id ON public.subject_translations USING btree (subject_id);


--
-- Name: index_submissions_on_assignment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_assignment_id ON public.submissions USING btree (assignment_id);


--
-- Name: index_submissions_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_submissions_on_token ON public.submissions USING btree (token);


--
-- Name: index_submissions_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_tutorial_id ON public.submissions USING btree (tutorial_id);


--
-- Name: index_talk_tag_joins_on_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_tag_id ON public.talk_tag_joins USING btree (tag_id);


--
-- Name: index_talk_tag_joins_on_talk_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talk_tag_joins_on_talk_id ON public.talk_tag_joins USING btree (talk_id);


--
-- Name: index_talks_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_lecture_id ON public.talks USING btree (lecture_id);


--
-- Name: index_talks_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_talks_on_self_materialization_mode ON public.talks USING btree (self_materialization_mode);


--
-- Name: index_terms_on_year_and_season; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_terms_on_year_and_season ON public.terms USING btree (year, season);


--
-- Name: index_thredded_categories_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_categories_on_messageboard_id ON public.thredded_categories USING btree (messageboard_id);


--
-- Name: index_thredded_categories_on_messageboard_id_and_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_categories_on_messageboard_id_and_slug ON public.thredded_categories USING btree (messageboard_id, slug);


--
-- Name: index_thredded_messageboard_users_for_recently_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboard_users_for_recently_active ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, last_seen_at);


--
-- Name: index_thredded_messageboard_users_primary; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboard_users_primary ON public.thredded_messageboard_users USING btree (thredded_messageboard_id, thredded_user_detail_id);


--
-- Name: index_thredded_messageboards_on_messageboard_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_messageboards_on_messageboard_group_id ON public.thredded_messageboards USING btree (messageboard_group_id);


--
-- Name: index_thredded_messageboards_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_messageboards_on_slug ON public.thredded_messageboards USING btree (slug);


--
-- Name: index_thredded_moderation_records_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_moderation_records_for_display ON public.thredded_post_moderation_records USING btree (messageboard_id, created_at DESC);


--
-- Name: index_thredded_posts_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_for_display ON public.thredded_posts USING btree (moderation_state, updated_at);


--
-- Name: index_thredded_posts_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_messageboard_id ON public.thredded_posts USING btree (messageboard_id);


--
-- Name: index_thredded_posts_on_postable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id ON public.thredded_posts USING btree (postable_id);


--
-- Name: index_thredded_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_postable_id_and_created_at ON public.thredded_posts USING btree (postable_id, created_at);


--
-- Name: index_thredded_posts_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_posts_on_user_id ON public.thredded_posts USING btree (user_id);


--
-- Name: index_thredded_private_posts_on_postable_id_and_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_posts_on_postable_id_and_created_at ON public.thredded_private_posts USING btree (postable_id, created_at);


--
-- Name: index_thredded_private_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_hash_id ON public.thredded_private_topics USING btree (hash_id);


--
-- Name: index_thredded_private_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_topics_on_last_post_at ON public.thredded_private_topics USING btree (last_post_at);


--
-- Name: index_thredded_private_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_private_topics_on_slug ON public.thredded_private_topics USING btree (slug);


--
-- Name: index_thredded_private_users_on_private_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_private_topic_id ON public.thredded_private_users USING btree (private_topic_id);


--
-- Name: index_thredded_private_users_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_private_users_on_user_id ON public.thredded_private_users USING btree (user_id);


--
-- Name: index_thredded_topic_categories_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_category_id ON public.thredded_topic_categories USING btree (category_id);


--
-- Name: index_thredded_topic_categories_on_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topic_categories_on_topic_id ON public.thredded_topic_categories USING btree (topic_id);


--
-- Name: index_thredded_topics_for_display; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_for_display ON public.thredded_topics USING btree (moderation_state, sticky DESC, updated_at DESC);


--
-- Name: index_thredded_topics_on_hash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_hash_id ON public.thredded_topics USING btree (hash_id);


--
-- Name: index_thredded_topics_on_last_post_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_last_post_at ON public.thredded_topics USING btree (last_post_at);


--
-- Name: index_thredded_topics_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_messageboard_id ON public.thredded_topics USING btree (messageboard_id);


--
-- Name: index_thredded_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_topics_on_slug ON public.thredded_topics USING btree (slug);


--
-- Name: index_thredded_topics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_topics_on_user_id ON public.thredded_topics USING btree (user_id);


--
-- Name: index_thredded_user_details_for_moderations; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_for_moderations ON public.thredded_user_details USING btree (moderation_state, moderation_state_changed_at DESC);


--
-- Name: index_thredded_user_details_on_latest_activity_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_details_on_latest_activity_at ON public.thredded_user_details USING btree (latest_activity_at);


--
-- Name: index_thredded_user_details_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_details_on_user_id ON public.thredded_user_details USING btree (user_id);


--
-- Name: index_thredded_user_post_notifications_on_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_post_notifications_on_post_id ON public.thredded_user_post_notifications USING btree (post_id);


--
-- Name: index_thredded_user_post_notifications_on_user_id_and_post_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_post_notifications_on_user_id_and_post_id ON public.thredded_user_post_notifications USING btree (user_id, post_id);


--
-- Name: index_thredded_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_thredded_user_preferences_on_user_id ON public.thredded_user_preferences USING btree (user_id);


--
-- Name: index_thredded_user_topic_read_states_on_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_thredded_user_topic_read_states_on_messageboard_id ON public.thredded_user_topic_read_states USING btree (messageboard_id);


--
-- Name: index_tutor_tutorial_joins_on_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutor_id ON public.tutor_tutorial_joins USING btree (tutor_id);


--
-- Name: index_tutor_tutorial_joins_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutor_tutorial_joins_on_tutorial_id ON public.tutor_tutorial_joins USING btree (tutorial_id);


--
-- Name: index_tutor_tutorial_joins_on_tutorial_id_and_tutor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutor_tutorial_joins_on_tutorial_id_and_tutor_id ON public.tutor_tutorial_joins USING btree (tutorial_id, tutor_id);


--
-- Name: index_tutorial_memberships_on_source_campaign_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_source_campaign_id ON public.tutorial_memberships USING btree (source_campaign_id);


--
-- Name: index_tutorial_memberships_on_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_tutorial_id ON public.tutorial_memberships USING btree (tutorial_id);


--
-- Name: index_tutorial_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorial_memberships_on_user_id ON public.tutorial_memberships USING btree (user_id);


--
-- Name: index_tutorial_memberships_on_user_id_and_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorial_memberships_on_user_id_and_lecture_id ON public.tutorial_memberships USING btree (user_id, lecture_id);


--
-- Name: index_tutorial_memberships_on_user_id_and_tutorial_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorial_memberships_on_user_id_and_tutorial_id ON public.tutorial_memberships USING btree (user_id, tutorial_id);


--
-- Name: index_tutorials_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_lecture_id ON public.tutorials USING btree (lecture_id);


--
-- Name: index_tutorials_on_lecture_id_and_title_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_tutorials_on_lecture_id_and_title_unique ON public.tutorials USING btree (lecture_id, title);


--
-- Name: index_tutorials_on_self_materialization_mode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tutorials_on_self_materialization_mode ON public.tutorials USING btree (self_materialization_mode);


--
-- Name: index_user_favorite_lecture_joins_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_lecture_id ON public.user_favorite_lecture_joins USING btree (lecture_id);


--
-- Name: index_user_favorite_lecture_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_favorite_lecture_joins_on_user_id ON public.user_favorite_lecture_joins USING btree (user_id);


--
-- Name: index_user_submission_joins_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_submission_id ON public.user_submission_joins USING btree (submission_id);


--
-- Name: index_user_submission_joins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_submission_joins_on_user_id ON public.user_submission_joins USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: index_vignettes_answers_on_vignettes_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_question_id ON public.vignettes_answers USING btree (vignettes_question_id);


--
-- Name: index_vignettes_answers_on_vignettes_slide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_slide_id ON public.vignettes_answers USING btree (vignettes_slide_id);


--
-- Name: index_vignettes_answers_on_vignettes_user_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_answers_on_vignettes_user_answer_id ON public.vignettes_answers USING btree (vignettes_user_answer_id);


--
-- Name: index_vignettes_codenames_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_codenames_on_lecture_id ON public.vignettes_codenames USING btree (lecture_id);


--
-- Name: index_vignettes_codenames_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_codenames_on_user_id ON public.vignettes_codenames USING btree (user_id);


--
-- Name: index_vignettes_completion_messages_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_completion_messages_on_lecture_id ON public.vignettes_completion_messages USING btree (lecture_id);


--
-- Name: index_vignettes_info_slides_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_info_slides_on_vignettes_questionnaire_id ON public.vignettes_info_slides USING btree (vignettes_questionnaire_id);


--
-- Name: index_vignettes_options_on_vignettes_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_options_on_vignettes_question_id ON public.vignettes_options USING btree (vignettes_question_id);


--
-- Name: index_vignettes_questionnaires_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_questionnaires_on_lecture_id ON public.vignettes_questionnaires USING btree (lecture_id);


--
-- Name: index_vignettes_questions_on_vignettes_slide_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_questions_on_vignettes_slide_id ON public.vignettes_questions USING btree (vignettes_slide_id);


--
-- Name: index_vignettes_slide_statistics_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slide_statistics_on_user_id ON public.vignettes_slide_statistics USING btree (user_id);


--
-- Name: index_vignettes_slide_statistics_on_vignettes_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slide_statistics_on_vignettes_answer_id ON public.vignettes_slide_statistics USING btree (vignettes_answer_id);


--
-- Name: index_vignettes_slides_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slides_on_position ON public.vignettes_slides USING btree ("position");


--
-- Name: index_vignettes_slides_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_slides_on_vignettes_questionnaire_id ON public.vignettes_slides USING btree (vignettes_questionnaire_id);


--
-- Name: index_vignettes_user_answers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_user_answers_on_user_id ON public.vignettes_user_answers USING btree (user_id);


--
-- Name: index_vignettes_user_answers_on_vignettes_questionnaire_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vignettes_user_answers_on_vignettes_questionnaire_id ON public.vignettes_user_answers USING btree (vignettes_questionnaire_id);


--
-- Name: index_votes_on_votable_id_and_votable_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_id_and_votable_type_and_vote_scope ON public.votes USING btree (votable_id, votable_type, vote_scope);


--
-- Name: index_votes_on_votable_type_and_votable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_type_and_votable_id ON public.votes USING btree (votable_type, votable_id);


--
-- Name: index_votes_on_voter_id_and_voter_type_and_vote_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_id_and_voter_type_and_vote_scope ON public.votes USING btree (voter_id, voter_type, vote_scope);


--
-- Name: index_votes_on_voter_type_and_voter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_voter_type_and_voter_id ON public.votes USING btree (voter_type, voter_id);


--
-- Name: index_vouchers_on_lecture_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vouchers_on_lecture_id ON public.vouchers USING btree (lecture_id);


--
-- Name: index_vouchers_on_secure_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_vouchers_on_secure_hash ON public.vouchers USING btree (secure_hash);


--
-- Name: index_watchlist_entries_on_medium_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_medium_id ON public.watchlist_entries USING btree (medium_id);


--
-- Name: index_watchlist_entries_on_watchlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlist_entries_on_watchlist_id ON public.watchlist_entries USING btree (watchlist_id);


--
-- Name: index_watchlists_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_user_id ON public.watchlists USING btree (user_id);


--
-- Name: index_watchlists_on_watchlist_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_watchlists_on_watchlist_entry_id ON public.watchlists USING btree (watchlist_entry_id);


--
-- Name: polymorphic_editable_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_editable_idx ON public.editable_user_joins USING btree (editable_id, editable_type);


--
-- Name: polymorphic_many_to_many_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX polymorphic_many_to_many_idx ON public.editable_user_joins USING btree (editable_id, editable_type, user_id);


--
-- Name: thredded_categories_name_ci; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_categories_name_ci ON public.thredded_categories USING btree (lower(name) text_pattern_ops);


--
-- Name: thredded_messageboard_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_messageboard_notifications_for_followed_topics_unique ON public.thredded_messageboard_notifications_for_followed_topics USING btree (user_id, messageboard_id, notifier_key);


--
-- Name: thredded_notifications_for_followed_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_followed_topics_unique ON public.thredded_notifications_for_followed_topics USING btree (user_id, notifier_key);


--
-- Name: thredded_notifications_for_private_topics_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_notifications_for_private_topics_unique ON public.thredded_notifications_for_private_topics USING btree (user_id, notifier_key);


--
-- Name: thredded_posts_content_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_posts_content_fts ON public.thredded_posts USING gist (to_tsvector('english'::regconfig, content));


--
-- Name: thredded_topics_title_fts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_topics_title_fts ON public.thredded_topics USING gist (to_tsvector('english'::regconfig, title));


--
-- Name: thredded_user_messageboard_preferences_user_id_messageboard_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_messageboard_preferences_user_id_messageboard_id ON public.thredded_user_messageboard_preferences USING btree (user_id, messageboard_id);


--
-- Name: thredded_user_private_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_private_topic_read_states_user_postable ON public.thredded_user_private_topic_read_states USING btree (user_id, postable_id);


--
-- Name: thredded_user_topic_follows_user_topic; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_follows_user_topic ON public.thredded_user_topic_follows USING btree (user_id, topic_id);


--
-- Name: thredded_user_topic_read_states_user_messageboard; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX thredded_user_topic_read_states_user_messageboard ON public.thredded_user_topic_read_states USING btree (user_id, messageboard_id);


--
-- Name: thredded_user_topic_read_states_user_postable; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX thredded_user_topic_read_states_user_postable ON public.thredded_user_topic_read_states USING btree (user_id, postable_id);


--
-- Name: imports fk_rails_018d34d0a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT fk_rails_018d34d0a7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: watchlist_entries fk_rails_021aafbf37; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_021aafbf37 FOREIGN KEY (watchlist_id) REFERENCES public.watchlists(id);


--
-- Name: vignettes_codenames fk_rails_02690186bc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT fk_rails_02690186bc FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: speaker_talk_joins fk_rails_06579d230c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_06579d230c FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: thredded_messageboard_users fk_rails_06e42c62f5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_06e42c62f5 FOREIGN KEY (thredded_user_detail_id) REFERENCES public.thredded_user_details(id) ON DELETE CASCADE;


--
-- Name: watchlists fk_rails_0dc1a4cbcb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_0dc1a4cbcb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: registration_student_messages fk_rails_11439afa9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT fk_rails_11439afa9f FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: talks fk_rails_1210911b58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talks
    ADD CONSTRAINT fk_rails_1210911b58 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: user_submission_joins fk_rails_12d41a7e23; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_submission_joins
    ADD CONSTRAINT fk_rails_12d41a7e23 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: redemptions fk_rails_14fa576d5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT fk_rails_14fa576d5b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vignettes_questions fk_rails_166147907b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questions
    ADD CONSTRAINT fk_rails_166147907b FOREIGN KEY (vignettes_slide_id) REFERENCES public.vignettes_slides(id);


--
-- Name: programs fk_rails_174715887a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT fk_rails_174715887a FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- Name: speaker_talk_joins fk_rails_1d337b4d3d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_1d337b4d3d FOREIGN KEY (speaker_id) REFERENCES public.users(id);


--
-- Name: lecture_user_joins fk_rails_1e48112fae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_1e48112fae FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: registration_user_registrations fk_rails_2c25a6b50a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_2c25a6b50a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: assignments fk_rails_2d7bf5a691; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT fk_rails_2d7bf5a691 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: lecture_memberships fk_rails_32871c16bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_32871c16bd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: watchlist_entries fk_rails_32f03600d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlist_entries
    ADD CONSTRAINT fk_rails_32f03600d9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: vignettes_answers fk_rails_341ebaf06f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_341ebaf06f FOREIGN KEY (vignettes_question_id) REFERENCES public.vignettes_questions(id);


--
-- Name: thredded_user_post_notifications fk_rails_364d7e370a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_364d7e370a FOREIGN KEY (post_id) REFERENCES public.thredded_posts(id) ON DELETE CASCADE;


--
-- Name: submissions fk_rails_3a2b44e658; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_3a2b44e658 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- Name: vignettes_options fk_rails_3fbca24de5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_options
    ADD CONSTRAINT fk_rails_3fbca24de5 FOREIGN KEY (vignettes_question_id) REFERENCES public.vignettes_questions(id);


--
-- Name: annotations fk_rails_4043df79bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_4043df79bf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_favorite_lecture_joins fk_rails_40985ebb4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_40985ebb4f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: links fk_rails_49020b7472; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_49020b7472 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: annotations fk_rails_4f1a0f89b4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.annotations
    ADD CONSTRAINT fk_rails_4f1a0f89b4 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: commontator_comments fk_rails_558e599d00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_558e599d00 FOREIGN KEY (parent_id) REFERENCES public.commontator_comments(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: thredded_user_post_notifications fk_rails_5908eec802; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_user_post_notifications
    ADD CONSTRAINT fk_rails_5908eec802 FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: announcements fk_rails_5b3f1d7737; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_5b3f1d7737 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: registration_user_registrations fk_rails_5c6f8c15b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_5c6f8c15b3 FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: submissions fk_rails_61cac0823d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_61cac0823d FOREIGN KEY (assignment_id) REFERENCES public.assignments(id);


--
-- Name: cohort_memberships fk_rails_65ac42442f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_65ac42442f FOREIGN KEY (cohort_id) REFERENCES public.cohorts(id);


--
-- Name: tutorials fk_rails_66221d24a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorials
    ADD CONSTRAINT fk_rails_66221d24a3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: registration_policies fk_rails_6664a314dd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_policies
    ADD CONSTRAINT fk_rails_6664a314dd FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: commontator_subscriptions fk_rails_68cc24d064; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_subscriptions
    ADD CONSTRAINT fk_rails_68cc24d064 FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: vignettes_codenames fk_rails_69dbadb217; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_codenames
    ADD CONSTRAINT fk_rails_69dbadb217 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vignettes_completion_messages fk_rails_6aade677d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_completion_messages
    ADD CONSTRAINT fk_rails_6aade677d3 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: links fk_rails_6b5cb429ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_rails_6b5cb429ed FOREIGN KEY (linked_medium_id) REFERENCES public.media(id);


--
-- Name: talk_tag_joins fk_rails_6bcb0e8e5f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_6bcb0e8e5f FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- Name: vouchers fk_rails_7676476332; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT fk_rails_7676476332 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: user_favorite_lecture_joins fk_rails_77bc049c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_favorite_lecture_joins
    ADD CONSTRAINT fk_rails_77bc049c12 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: cohort_memberships fk_rails_7bc5d74a9d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_7bc5d74a9d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: redemptions fk_rails_8377a88a56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redemptions
    ADD CONSTRAINT fk_rails_8377a88a56 FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id);


--
-- Name: talk_tag_joins fk_rails_85b7c429a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.talk_tag_joins
    ADD CONSTRAINT fk_rails_85b7c429a2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: watchlists fk_rails_8780bd5b5a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.watchlists
    ADD CONSTRAINT fk_rails_8780bd5b5a FOREIGN KEY (watchlist_entry_id) REFERENCES public.watchlist_entries(id);


--
-- Name: vignettes_user_answers fk_rails_8c438b6e8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT fk_rails_8c438b6e8e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vignettes_user_answers fk_rails_8dc710c13d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_user_answers
    ADD CONSTRAINT fk_rails_8dc710c13d FOREIGN KEY (vignettes_questionnaire_id) REFERENCES public.vignettes_questionnaires(id);


--
-- Name: vignettes_slide_statistics fk_rails_8f79f13530; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT fk_rails_8f79f13530 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: registration_user_registrations fk_rails_95b64a53dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_95b64a53dc FOREIGN KEY (registration_item_id) REFERENCES public.registration_items(id);


--
-- Name: commontator_comments fk_rails_96666eb19a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.commontator_comments
    ADD CONSTRAINT fk_rails_96666eb19a FOREIGN KEY (thread_id) REFERENCES public.commontator_threads(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: thredded_messageboard_users fk_rails_966803d714; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.thredded_messageboard_users
    ADD CONSTRAINT fk_rails_966803d714 FOREIGN KEY (thredded_messageboard_id) REFERENCES public.thredded_messageboards(id) ON DELETE CASCADE;


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: registration_items fk_rails_998ff8f041; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_items
    ADD CONSTRAINT fk_rails_998ff8f041 FOREIGN KEY (registration_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: items fk_rails_99dcbdef9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_99dcbdef9f FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- Name: vignettes_slide_statistics fk_rails_9a8745e04d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slide_statistics
    ADD CONSTRAINT fk_rails_9a8745e04d FOREIGN KEY (vignettes_answer_id) REFERENCES public.vignettes_answers(id);


--
-- Name: claims fk_rails_9b419d5bd5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT fk_rails_9b419d5bd5 FOREIGN KEY (redemption_id) REFERENCES public.redemptions(id);


--
-- Name: referrals fk_rails_9c4f45c15c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_9c4f45c15c FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: divisions fk_rails_a1b344ef36; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.divisions
    ADD CONSTRAINT fk_rails_a1b344ef36 FOREIGN KEY (program_id) REFERENCES public.programs(id);


--
-- Name: cohort_memberships fk_rails_a81dcb9b7f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cohort_memberships
    ADD CONSTRAINT fk_rails_a81dcb9b7f FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: items fk_rails_add0a302a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_add0a302a9 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: medium_tag_joins fk_rails_b11130c931; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b11130c931 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: medium_tag_joins fk_rails_b181027fb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.medium_tag_joins
    ADD CONSTRAINT fk_rails_b181027fb2 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: tutor_tutorial_joins fk_rails_b781447eb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_b781447eb1 FOREIGN KEY (tutor_id) REFERENCES public.users(id);


--
-- Name: lecture_memberships fk_rails_b952417d8f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_b952417d8f FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: tutorial_memberships fk_rails_bc5fc1eb43; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_bc5fc1eb43 FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: lecture_user_joins fk_rails_bdbf7bc779; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_user_joins
    ADD CONSTRAINT fk_rails_bdbf7bc779 FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: quiz_certificates fk_rails_c10d7b5c91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_c10d7b5c91 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: lecture_memberships fk_rails_c4d0979517; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lecture_memberships
    ADD CONSTRAINT fk_rails_c4d0979517 FOREIGN KEY (source_campaign_id) REFERENCES public.registration_campaigns(id);


--
-- Name: feedbacks fk_rails_c57bb6cf28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT fk_rails_c57bb6cf28 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: registration_student_messages fk_rails_c97d206d38; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_student_messages
    ADD CONSTRAINT fk_rails_c97d206d38 FOREIGN KEY (sender_id) REFERENCES public.users(id);


--
-- Name: tutorial_memberships fk_rails_cb8342e46b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_cb8342e46b FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: vignettes_answers fk_rails_cc5b64b41a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_cc5b64b41a FOREIGN KEY (vignettes_slide_id) REFERENCES public.vignettes_slides(id);


--
-- Name: vignettes_questionnaires fk_rails_cf4ca40f5b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_questionnaires
    ADD CONSTRAINT fk_rails_cf4ca40f5b FOREIGN KEY (lecture_id) REFERENCES public.lectures(id);


--
-- Name: tutorial_memberships fk_rails_d9260fbd52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_d9260fbd52 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- Name: quiz_certificates fk_rails_da91c72f96; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quiz_certificates
    ADD CONSTRAINT fk_rails_da91c72f96 FOREIGN KEY (quiz_id) REFERENCES public.media(id);


--
-- Name: referrals fk_rails_dce931e0f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT fk_rails_dce931e0f7 FOREIGN KEY (medium_id) REFERENCES public.media(id);


--
-- Name: vignettes_answers fk_rails_dd314d5106; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_answers
    ADD CONSTRAINT fk_rails_dd314d5106 FOREIGN KEY (vignettes_user_answer_id) REFERENCES public.vignettes_user_answers(id);


--
-- Name: speaker_talk_joins fk_rails_e5bafe887c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.speaker_talk_joins
    ADD CONSTRAINT fk_rails_e5bafe887c FOREIGN KEY (talk_id) REFERENCES public.talks(id);


--
-- Name: vignettes_slides fk_rails_e6d1817e26; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vignettes_slides
    ADD CONSTRAINT fk_rails_e6d1817e26 FOREIGN KEY (vignettes_questionnaire_id) REFERENCES public.vignettes_questionnaires(id);


--
-- Name: registration_user_registrations fk_rails_ead649079d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_user_registrations
    ADD CONSTRAINT fk_rails_ead649079d FOREIGN KEY (rejection_policy_id) REFERENCES public.registration_policies(id);


--
-- Name: course_self_joins fk_rails_ecb46f40b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.course_self_joins
    ADD CONSTRAINT fk_rails_ecb46f40b3 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: tutor_tutorial_joins fk_rails_f1a97a6dc5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutor_tutorial_joins
    ADD CONSTRAINT fk_rails_f1a97a6dc5 FOREIGN KEY (tutorial_id) REFERENCES public.tutorials(id);


--
-- Name: tutorial_memberships fk_rails_fc3a3973e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tutorial_memberships
    ADD CONSTRAINT fk_rails_fc3a3973e1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: announcements fk_rails_fd9bbf1b15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT fk_rails_fd9bbf1b15 FOREIGN KEY (announcer_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict gYQUIrVUoSl35SDr3c7yOUDjJNEZl0MxpjUSPg4tRPH5gpW0QoWg8vJYJM2dYen

