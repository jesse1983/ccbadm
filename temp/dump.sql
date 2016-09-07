--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE attachments (
    id integer NOT NULL,
    attachment character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    attachable_id integer,
    attachable_type character varying(255)
);


ALTER TABLE attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attachments_id_seq
    START WITH 193
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: churches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE churches_id_seq
    START WITH 104
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE churches_id_seq OWNER TO postgres;

--
-- Name: churches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE churches (
    id integer DEFAULT nextval('churches_id_seq'::regclass) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    bras_code character varying(510) DEFAULT NULL::character varying,
    heritage_code character varying(510) DEFAULT NULL::character varying,
    "2000_code" character varying(510) DEFAULT NULL::character varying,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    group_id integer,
    picture character varying(255)
);


ALTER TABLE churches OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comments (
    id integer NOT NULL,
    commentable_type text,
    commentable_id integer,
    text text,
    user_id integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    is_archived boolean DEFAULT false
);


ALTER TABLE comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: corrections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE corrections_id_seq
    START WITH 31
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corrections_id_seq OWNER TO postgres;

--
-- Name: document_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE document_types (
    id integer NOT NULL,
    title character varying(255),
    "order" integer,
    is_mandatory boolean DEFAULT true,
    is_active boolean DEFAULT true,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    code character varying(255),
    short_name character varying(255),
    is_expirable boolean DEFAULT false
);


ALTER TABLE document_types OWNER TO postgres;

--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE documents (
    id integer NOT NULL,
    document_type_id integer,
    expires_at timestamp(6) without time zone,
    is_possible boolean,
    is_active boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    documentable_id integer,
    documentable_type character varying(255),
    attachments_count integer DEFAULT 0,
    number character varying(255),
    issue_date timestamp(6) without time zone,
    active_requests_count integer,
    status_id character varying,
    comments_count integer DEFAULT 0
);


ALTER TABLE documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE documents_id_seq
    START WITH 4394
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: file_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE file_packages_id_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE file_packages_id_seq OWNER TO postgres;

--
-- Name: good_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE good_statuses_id_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE good_statuses_id_seq OWNER TO postgres;

--
-- Name: good_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE good_types_id_seq
    START WITH 1191
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE good_types_id_seq OWNER TO postgres;

--
-- Name: good_types_materials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE good_types_materials (
    good_type_id integer DEFAULT 0,
    material_id integer DEFAULT 0
);


ALTER TABLE good_types_materials OWNER TO postgres;

--
-- Name: goods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE goods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goods_id_seq OWNER TO postgres;

--
-- Name: goods_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE goods_invoices_id_seq
    START WITH 2871
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE goods_invoices_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    id integer DEFAULT nextval('groups_id_seq'::regclass) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    is_readonly boolean,
    group_id integer,
    lft integer,
    rgt integer,
    depth integer
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: groups_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_users_id_seq OWNER TO postgres;

--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups_users (
    id integer DEFAULT nextval('groups_users_id_seq'::regclass) NOT NULL,
    group_id integer,
    user_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE groups_users OWNER TO postgres;

--
-- Name: import_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE import_errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE import_errors_id_seq OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE imports_id_seq
    START WITH 1191
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE imports_id_seq OWNER TO postgres;

--
-- Name: imports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE imports (
    id integer DEFAULT nextval('imports_id_seq'::regclass) NOT NULL,
    good_id integer,
    church_id integer,
    invoice_id integer,
    epc_rfid character varying(510) DEFAULT NULL::character varying,
    codigo_interno character varying(510) DEFAULT NULL::character varying,
    objeto character varying(510) DEFAULT NULL::character varying,
    quantidade character varying(510) DEFAULT NULL::character varying,
    marca character varying(510) DEFAULT NULL::character varying,
    modelo character varying(510) DEFAULT NULL::character varying,
    num_serie character varying(510) DEFAULT NULL::character varying,
    altura character varying(510) DEFAULT NULL::character varying,
    largura character varying(510) DEFAULT NULL::character varying,
    comprimento character varying(510) DEFAULT NULL::character varying,
    material character varying(510) DEFAULT NULL::character varying,
    potencia character varying(510) DEFAULT NULL::character varying,
    tensao character varying(510) DEFAULT NULL::character varying,
    localizacao character varying(510) DEFAULT NULL::character varying,
    ano_contabil character varying(510) DEFAULT NULL::character varying,
    conta_contabil character varying(510) DEFAULT NULL::character varying,
    mes_arquivo character varying(510) DEFAULT NULL::character varying,
    pacote_arquivo character varying(510) DEFAULT NULL::character varying,
    num_nf character varying(510) DEFAULT NULL::character varying,
    data_nf character varying(510) DEFAULT NULL::character varying,
    fornecedor character varying(510) DEFAULT NULL::character varying,
    valor_bem character varying(510) DEFAULT NULL::character varying,
    observacao character varying(510) DEFAULT NULL::character varying,
    conta_contabil_correta character varying(510) DEFAULT NULL::character varying
);


ALTER TABLE imports OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE invoices_id_seq
    START WITH 181
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE invoices_id_seq OWNER TO postgres;

--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materials_id_seq
    START WITH 8
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE materials_id_seq OWNER TO postgres;

--
-- Name: mouths_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mouths_id_seq
    START WITH 12
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mouths_id_seq OWNER TO postgres;

--
-- Name: mouths; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mouths (
    id integer DEFAULT nextval('mouths_id_seq'::regclass) NOT NULL,
    nome character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE mouths OWNER TO postgres;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE places_id_seq
    START WITH 111
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE places_id_seq OWNER TO postgres;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profiles_id_seq
    START WITH 31
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profiles_id_seq OWNER TO postgres;

--
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE profiles (
    id integer DEFAULT nextval('profiles_id_seq'::regclass) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    is_admin boolean,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    level integer
);


ALTER TABLE profiles OWNER TO postgres;

--
-- Name: profiles_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profiles_skills_id_seq
    START WITH 532
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profiles_skills_id_seq OWNER TO postgres;

--
-- Name: profiles_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE profiles_skills (
    id integer DEFAULT nextval('profiles_skills_id_seq'::regclass) NOT NULL,
    profile_id integer,
    skill_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE profiles_skills OWNER TO postgres;

--
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE properties (
    id integer NOT NULL,
    code character varying(255),
    church_id integer,
    group_code character varying(255),
    accountant_code character varying(255),
    cartographic_code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    is_active boolean DEFAULT true,
    has_church boolean DEFAULT false,
    market_price numeric(10,2),
    object json,
    title character varying(255),
    category character varying(64),
    status character varying(64),
    situation character varying(64),
    address character varying(256),
    zipcode character varying(9),
    zone character varying(12),
    income integer,
    quarter character varying(12),
    court character varying(12),
    lot character varying(12),
    terrain_area numeric(12,2),
    width_area numeric(12,2),
    main_area numeric(12,2),
    trash_area numeric(12,2),
    secondary_area numeric(12,2),
    excess_area numeric(12,2),
    default_type character varying(64),
    default_category character varying(64),
    rate numeric(12,2),
    comment text,
    object_terrain text,
    latitude double precision,
    longitude double precision,
    full_address character varying(255),
    tax_code character varying(255)
);


ALTER TABLE properties OWNER TO postgres;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE properties_id_seq
    START WITH 257
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE properties_id_seq OWNER TO postgres;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE requests (
    id integer NOT NULL,
    requested_at timestamp(6) without time zone,
    returned_at timestamp(6) without time zone,
    return_in timestamp(6) without time zone,
    is_active boolean,
    user_id integer,
    requestable_type text,
    requestable_id integer,
    requester text,
    requester_phone_number text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    requester_church character varying,
    comment text,
    meta json
);


ALTER TABLE requests OWNER TO postgres;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE requests_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE requests_id_seq OWNER TO postgres;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE requests_id_seq OWNED BY requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying(510) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE skills_id_seq
    START WITH 648
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_id_seq OWNER TO postgres;

--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE skills (
    id integer DEFAULT nextval('skills_id_seq'::regclass) NOT NULL,
    name character varying(510) DEFAULT NULL::character varying,
    model character varying(510) DEFAULT NULL::character varying,
    name_pt_br character varying(510) DEFAULT NULL::character varying,
    model_pt_br character varying(510) DEFAULT NULL::character varying,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE skills OWNER TO postgres;

--
-- Name: skills_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE skills_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skills_users_id_seq OWNER TO postgres;

--
-- Name: skills_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE skills_users (
    id integer DEFAULT nextval('skills_users_id_seq'::regclass) NOT NULL,
    user_id integer,
    skill_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE skills_users OWNER TO postgres;

--
-- Name: statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE statuses (
    uid character varying NOT NULL,
    statusable_type character varying NOT NULL,
    title character varying NOT NULL,
    color character varying,
    is_active boolean,
    description character varying,
    "order" integer,
    meta json,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE statuses OWNER TO postgres;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tokens (
    id integer NOT NULL,
    token character varying(255),
    user_id integer,
    expire_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tokens_id_seq
    START WITH 3062
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tokens_id_seq OWNED BY tokens.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1473
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer DEFAULT nextval('users_id_seq'::regclass) NOT NULL,
    email character varying(510) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(510) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(510) DEFAULT NULL::character varying,
    reset_password_sent_at timestamp(6) with time zone,
    remember_created_at timestamp(6) with time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp(6) with time zone,
    last_sign_in_at timestamp(6) with time zone,
    current_sign_in_ip character varying(510) DEFAULT NULL::character varying,
    last_sign_in_ip character varying(510) DEFAULT NULL::character varying,
    group_id integer,
    is_admin boolean,
    church_id integer,
    profile_id integer,
    first_name character varying(510) DEFAULT NULL::character varying,
    last_name character varying(510) DEFAULT NULL::character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE versions_id_seq
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE versions_id_seq OWNER TO postgres;

--
-- Name: versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE versions (
    id integer DEFAULT nextval('versions_id_seq'::regclass) NOT NULL,
    item_type character varying(510) NOT NULL,
    item_id integer NOT NULL,
    event character varying(510) NOT NULL,
    whodunnit character varying(510) DEFAULT NULL::character varying,
    object text,
    created_at timestamp(6) with time zone
);


ALTER TABLE versions OWNER TO postgres;

--
-- Name: voltages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE voltages_id_seq
    START WITH 21
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voltages_id_seq OWNER TO postgres;

--
-- Name: voltages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE voltages (
    id integer DEFAULT nextval('voltages_id_seq'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE voltages OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tokens ALTER COLUMN id SET DEFAULT nextval('tokens_id_seq'::regclass);


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attachments (id, attachment, created_at, updated_at, attachable_id, attachable_type) FROM stdin;
60	image/upload/v1436023992/pgr9acmnkse1ikveg01a.pdf	2015-07-04 15:33:12.764795	2015-07-04 15:33:12.764795	1038	Document
61	image/upload/v1436025589/gljb6jthtfph5nwxiyqb.pdf	2015-07-04 15:59:48.960979	2015-07-04 15:59:48.960979	144	Document
62	image/upload/v1436025780/k9egiscmz78bg7rjj04y.pdf	2015-07-04 16:03:00.025246	2015-07-04 16:03:00.025246	226	Document
63	image/upload/v1436026059/o8whflsz4jseymiws7jr.pdf	2015-07-04 16:07:39.649084	2015-07-04 16:07:39.649084	223	Document
64	image/upload/v1436026178/dmvrxiwjxizvvveezfxe.pdf	2015-07-04 16:09:38.341506	2015-07-04 16:09:38.341506	4270	Document
65	image/upload/v1436026244/gqxnygpdfui9mplxqxtn.pdf	2015-07-04 16:10:44.219699	2015-07-04 16:10:44.219699	4266	Document
66	image/upload/v1436026284/hkwbcqgw11k12a63j0qr.pdf	2015-07-04 16:11:24.543929	2015-07-04 16:11:24.543929	692	Document
94	image/upload/v1466724026/zmxvooxoza4jt8znhgdl.pdf	2016-06-23 23:20:26.781513	2016-06-23 23:20:26.781513	544	Document
71	image/upload/v1449525028/u71u7hvjmuophiyesiex.pdf	2015-12-07 21:50:26.598649	2015-12-07 21:50:26.598649	772	Document
82	image/upload/v1449526478/nsqqce7qfcn5sbchq4sz.pdf	2015-12-07 22:14:38.450376	2015-12-07 22:14:38.450376	1002	Document
83	image/upload/v1449526517/uduuc0iawslszlxh2ofd.pdf	2015-12-07 22:15:17.080338	2015-12-07 22:15:17.080338	998	Document
58	image/upload/v1436023718/bt1qfd3xdk8esebl91mb.pdf	2015-07-04 15:28:37.670987	2015-07-04 15:28:37.670987	13	Document
59	image/upload/v1436023796/la5xnvgv1bmnvp0r9ljr.pdf	2015-07-04 15:29:56.122754	2015-07-04 15:29:56.122754	1051	Document
84	image/upload/v1449526556/z6o3fznrbl5ad5floxao.pdf	2015-12-07 22:15:56.479713	2015-12-07 22:15:56.479713	138	Document
85	image/upload/v1449526593/udhd2l0mdps0kzyhbqdp.pdf	2015-12-07 22:16:33.512623	2015-12-07 22:16:33.512623	135	Document
86	image/upload/v1449526609/o1tr8wjxp5dbzv57rw1z.pdf	2015-12-07 22:16:49.009765	2015-12-07 22:16:49.009765	141	Document
87	image/upload/v1449526643/v3txemlb8yrhdkchnvur.pdf	2015-12-07 22:17:23.106471	2015-12-07 22:17:23.106471	996	Document
88	image/upload/v1449528000/c4hj5gyv8ie6wve8gqwr.pdf	2015-12-07 22:39:59.901696	2015-12-07 22:39:59.901696	150	Document
89	image/upload/v1449528042/pt9cd9l7eb4axz9i3dqz.pdf	2015-12-07 22:40:42.54014	2015-12-07 22:40:42.54014	152	Document
90	image/upload/v1449528078/dmtdjkvdvnvicdj3pukw.pdf	2015-12-07 22:41:18.551536	2015-12-07 22:41:18.551536	151	Document
91	image/upload/v1466723439/ust1guqebgic9sr5uyyo.jpg	2016-06-23 23:10:39.563954	2016-06-23 23:10:39.563954	4176	Document
92	image/upload/v1466723535/azxg9zxltw6s5xeokt0a.pdf	2016-06-23 23:12:15.504679	2016-06-23 23:12:15.504679	4177	Document
93	image/upload/v1466723710/ptcrzy8lylakb1yerow9.pdf	2016-06-23 23:15:09.204762	2016-06-23 23:15:09.204762	4179	Document
96	image/upload/v1466724976/pn5dt2ov7h3wq1glmeld.jpg	2016-06-23 23:36:16.421421	2016-06-23 23:36:16.421421	4187	Document
100	image/upload/v1466725126/xdj5ur4ihfzyyr8rxi0l.jpg	2016-06-23 23:38:46.482304	2016-06-23 23:38:46.482304	543	Document
101	image/upload/v1466725423/lq7rhgapykaoufwc5snj.pdf	2016-06-23 23:43:43.610932	2016-06-23 23:43:43.610932	448	Document
102	image/upload/v1466725516/vvwmxgpscv4ajmzbyqmf.pdf	2016-06-23 23:45:16.733309	2016-06-23 23:45:16.733309	449	Document
103	image/upload/v1466725598/was8ucrigwtudofkt46y.pdf	2016-06-23 23:46:37.959903	2016-06-23 23:46:37.959903	450	Document
104	image/upload/v1466725749/jeajdxoxpu6j2asjidaq.pdf	2016-06-23 23:49:08.980577	2016-06-23 23:49:08.980577	452	Document
105	image/upload/v1466725805/psdbc34fljssy1hrp8as.pdf	2016-06-23 23:50:04.941659	2016-06-23 23:50:04.941659	453	Document
106	image/upload/v1466726080/qeiguzd8eccgkra9qtfg.pdf	2016-06-23 23:54:40.205464	2016-06-23 23:54:40.205464	455	Document
107	image/upload/v1466726102/tpjsr8edjyt9f9pmai3u.pdf	2016-06-23 23:55:02.371657	2016-06-23 23:55:02.371657	457	Document
108	image/upload/v1466726128/ke9smokcomcodc7pl80s.pdf	2016-06-23 23:55:28.045233	2016-06-23 23:55:28.045233	1560	Document
109	image/upload/v1466726143/esflfwtdzfaeahmbuvfr.pdf	2016-06-23 23:55:43.145227	2016-06-23 23:55:43.145227	456	Document
110	image/upload/v1466726441/cvguxd4fb21zsjrq5ktq.pdf	2016-06-24 00:00:41.433973	2016-06-24 00:00:41.433973	546	Document
113	image/upload/v1466726754/je7cnzvvsugek90ef39x.pdf	2016-06-24 00:05:54.75889	2016-06-24 00:05:54.75889	550	Document
114	image/upload/v1466726779/byfstq1y4i8mtziylji2.pdf	2016-06-24 00:06:18.953536	2016-06-24 00:06:18.953536	551	Document
115	image/upload/v1466726816/hcfs51fhnkfm8vxwlque.pdf	2016-06-24 00:06:56.476818	2016-06-24 00:06:56.476818	547	Document
116	image/upload/v1466726841/iuabyt5ceuksh4t17ily.pdf	2016-06-24 00:07:21.14858	2016-06-24 00:07:21.14858	552	Document
125	image/upload/v1467331762/yhpucpzpipmk8gx9rxdq.pdf	2016-07-01 00:09:22.579164	2016-07-01 00:09:22.579164	1512	Document
119	image/upload/v1467327825/zmfk9qh5x2jdqnb0lqe2.jpg	2016-06-30 23:03:45.34524	2016-06-30 23:03:45.34524	446	Document
130	image/upload/v1467332654/clbkoegfwajbjzkyboir.jpg	2016-07-01 00:24:14.582075	2016-07-01 00:24:14.582075	86	Document
124	image/upload/v1467331478/jevmyqccw8jklbxsqe2g.pdf	2016-07-01 00:04:37.727931	2016-07-01 00:04:37.727931	447	Document
127	image/upload/v1467332221/lkoi9qufmkxcpoofplcm.jpg	2016-07-01 00:17:01.885842	2016-07-01 00:17:01.885842	84	Document
128	image/upload/v1467332506/csodgchprck4jzcpyx6n.pdf	2016-07-01 00:21:46.618901	2016-07-01 00:21:46.618901	1499	Document
129	image/upload/v1467332583/voiuqbjsqrcyeoubd6uf.pdf	2016-07-01 00:23:02.527244	2016-07-01 00:23:02.527244	1513	Document
132	image/upload/v1467333090/aa6xhc7ukkna8ldsqi5u.pdf	2016-07-01 00:31:29.945648	2016-07-01 00:31:29.945648	435	Document
136	image/upload/v1467932898/ezobjb2wkltqvxho82tl.pdf	2016-07-07 23:08:18.485845	2016-07-07 23:08:18.485845	421	Document
135	image/upload/v1467932789/wbzyd0j51fhbhqken9wp.pdf	2016-07-07 23:06:29.455934	2016-07-07 23:06:29.455934	416	Document
137	image/upload/v1467932929/at8hsyn8iay12k5lcl6o.pdf	2016-07-07 23:08:49.886781	2016-07-07 23:08:49.886781	418	Document
138	image/upload/v1467932956/ut8h3khs3oodunoulftw.pdf	2016-07-07 23:09:16.093083	2016-07-07 23:09:16.093083	419	Document
139	image/upload/v1467932991/avcreazcaze3rfmcvgql.pdf	2016-07-07 23:09:51.090216	2016-07-07 23:09:51.090216	417	Document
140	image/upload/v1467933010/f1bnyvjvt9mxaua1agfh.pdf	2016-07-07 23:10:10.048693	2016-07-07 23:10:10.048693	420	Document
141	image/upload/v1467933057/i6qahsnne8vnmens4dzx.pdf	2016-07-07 23:10:57.281713	2016-07-07 23:10:57.281713	422	Document
142	image/upload/v1467933077/uy3rzujo7yi9gzesnu10.pdf	2016-07-07 23:11:17.348647	2016-07-07 23:11:17.348647	414	Document
143	image/upload/v1467933314/jlm9h2rnktx6kwpdoako.pdf	2016-07-07 23:15:13.621349	2016-07-07 23:15:13.621349	413	Document
146	image/upload/v1468537202/ga6jvkcbhiiir9rezuxv.pdf	2016-07-14 23:00:01.705115	2016-07-14 23:00:01.705115	828	Document
147	image/upload/v1468537252/whtomkpkbfp4xpvuanyg.pdf	2016-07-14 23:00:52.328885	2016-07-14 23:00:52.328885	827	Document
148	image/upload/v1468537336/cb3n34nluxscchu9awho.pdf	2016-07-14 23:02:16.576709	2016-07-14 23:02:16.576709	831	Document
155	image/upload/v1468539949/ywjawdqakq4w78rbahby.pdf	2016-07-14 23:45:49.005278	2016-07-14 23:45:49.005278	834	Document
156	image/upload/v1468540086/gutbifpnbjhp6wlqhv4u.pdf	2016-07-14 23:48:05.63219	2016-07-14 23:48:05.63219	841	Document
157	image/upload/v1468540242/wog9hkdygzwek7u9n8sc.pdf	2016-07-14 23:50:42.251484	2016-07-14 23:50:42.251484	838	Document
158	image/upload/v1468540292/xfvy5n1pqs4vjqonfl04.pdf	2016-07-14 23:51:32.512501	2016-07-14 23:51:32.512501	833	Document
159	image/upload/v1468540336/hkealpyzsb4k6v9hmp5v.pdf	2016-07-14 23:52:16.517417	2016-07-14 23:52:16.517417	840	Document
161	image/upload/v1468540418/pfrgeoz1xzyb0kavx0xo.pdf	2016-07-14 23:53:38.836438	2016-07-14 23:53:38.836438	839	Document
162	image/upload/v1468540529/o6w0zymnji5akmqx4xum.pdf	2016-07-14 23:55:29.268858	2016-07-14 23:55:29.268858	829	Document
164	image/upload/v1468540767/dntgbs3sqgzgpk4facvk.pdf	2016-07-14 23:59:27.259607	2016-07-14 23:59:27.259607	399	Document
165	image/upload/v1468540957/q843ykiehuwxj83jpjlr.pdf	2016-07-15 00:02:37.724693	2016-07-15 00:02:37.724693	2860	Document
166	image/upload/v1468541376/dloxhyzkmbecvnqp4vmc.pdf	2016-07-15 00:09:36.816025	2016-07-15 00:09:36.816025	2862	Document
167	image/upload/v1468541606/j3gmizntfhevmsprznop.pdf	2016-07-15 00:13:26.755034	2016-07-15 00:13:26.755034	398	Document
169	image/upload/v1468883300/cgf7kla4kxd4d7w3mqpk.pdf	2016-07-18 23:08:20.762751	2016-07-18 23:08:20.762751	1751	Document
170	image/upload/v1468883345/zba8geu3ldvlibb8lu68.pdf	2016-07-18 23:09:05.65084	2016-07-18 23:09:05.65084	385	Document
171	image/upload/v1468883443/lpt6sqae8ppew8pf3qxz.pdf	2016-07-18 23:10:43.137004	2016-07-18 23:10:43.137004	386	Document
174	image/upload/v1468883789/lz3hfkfbtrpzfskb89le.pdf	2016-07-18 23:16:29.128603	2016-07-18 23:16:29.128603	388	Document
175	image/upload/v1468883934/dlwyieuk4vpqjo5h9xfd.pdf	2016-07-18 23:18:54.520047	2016-07-18 23:18:54.520047	383	Document
176	image/upload/v1468884062/sclt0bmbs0qsvv9dkzlw.pdf	2016-07-18 23:21:02.365277	2016-07-18 23:21:02.365277	390	Document
177	image/upload/v1468884171/khzvwcr3pfpc42nogtkc.jpg	2016-07-18 23:22:51.151608	2016-07-18 23:22:51.151608	389	Document
178	image/upload/v1468884223/pfsdgxbybxtxhogfokn9.pdf	2016-07-18 23:23:43.573923	2016-07-18 23:23:43.573923	387	Document
179	image/upload/v1468884240/eaqqekdppztjnzimxkir.pdf	2016-07-18 23:24:00.643837	2016-07-18 23:24:00.643837	392	Document
180	image/upload/v1468884472/iuj1znncmzmohho3skd0.pdf	2016-07-18 23:27:52.727107	2016-07-18 23:27:52.727107	1750	Document
181	image/upload/v1468884506/heb8sf7ee9hfk5lrwyso.pdf	2016-07-18 23:28:26.482424	2016-07-18 23:28:26.482424	391	Document
186	image/upload/v1470697752/lngovjziwgfbkcfb6leh.pdf	2016-08-08 23:09:12.181826	2016-08-08 23:09:12.181826	375	Document
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attachments_id_seq', 195, true);


--
-- Data for Name: churches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY churches (id, name, bras_code, heritage_code, "2000_code", created_at, updated_at, group_id, picture) FROM stdin;
40	Ch. Recanto dos Dourados	22-23-76	0180.00	41	\N	2014-07-22 14:02:30+00	11	\N
43	Jd. Rossim (Serralheria)	98-00-08	0220.00	44	\N	2014-07-22 14:02:32+00	11	\N
57	Village Campinas	22-28-52	0160.01	58	\N	2014-07-22 14:02:40+00	11	\N
59	Recanto dos Velinhos	98-00-07	0460.02	60	\N	2014-07-22 14:02:41+00	11	\N
71	Jd. Lisa	22-36-36	0320.00	\N	\N	2014-07-22 14:02:45+00	11	\N
75	Ch. Gargantilha	22-36-37	0630.00	\N	\N	2014-07-22 14:02:48+00	11	\N
90	Ch. Pouso Alegre	22-37-52	0950.01	\N	\N	2014-07-22 14:02:55+00	11	\N
5	Jd. Aurélia	22-02-89	0260.00	05	\N	2015-04-28 23:46:21.400337+00	11	image/upload/v1430264788/nc2xncmlwehqmbkbddbf.jpg
8	Vl. Boa Vista	22-02-84	0820.00	08	\N	2015-04-28 23:47:16.924765+00	11	image/upload/v1430264844/khg7jdur3w49uud97qm7.jpg
11	Jd. Campineiro	22-03-15	0270.00	11	\N	2015-04-28 23:47:37.32687+00	11	image/upload/v1430264873/umhybnra2qr6gs8evrzy.jpg
13	Jd. Carlos Lourenço	22-18-12	0290.00	13	\N	2015-04-28 23:48:24.429891+00	11	image/upload/v1430264911/wooahkuj2pkztnfpdpmz.jpg
15	Pq. Dom Pedro II	22-02-92	0610.00	15	\N	2015-04-28 23:50:41.716761+00	11	image/upload/v1430265043/bm4nkzxr7mabhdcrrlfw.jpg
16	Jd. Eulina	22-03-02	0300.00	16	\N	2015-04-28 23:55:17.974685+00	11	image/upload/v1430265321/cpijyx1dhyr0sgjesh8w.jpg
17	Pq. Fazendinha	22-03-14	0620.00	17	\N	2015-04-28 23:56:20.003341+00	11	image/upload/v1430265389/qdfepacbufxzz9vsncla.jpg
19	Jd. Florence	22-03-18	0330.00	19	\N	2015-04-28 23:57:45.271901+00	11	image/upload/v1430265467/ozzrjmmaalhecva80blq.jpg
20	Pq. Industrial	22-02-83	0640.00	20	\N	2015-04-28 23:58:36.075783+00	11	image/upload/v1430265518/qbe9toajqimhcmgyrsdf.jpg
22	Vl. Ipê	22-22-23	0830.00	22	\N	2015-04-29 00:00:46.643593+00	11	image/upload/v1430265649/pp3yby8odd64tr73e8yq.jpg
25	Jd. do Lago II	22-29-67	0350.02	26	\N	2015-06-04 01:46:50.458726+00	11	image/upload/v1433382419/g0qpkec0pwx1ysvacyz6.jpg
24	Joaquim Egídio	22-29-44	0570.00	25	\N	2015-06-04 01:49:13.587204+00	11	image/upload/v1433382557/vo6vl3keirgz7jmeb6qy.jpg
27	Jd. Maisa	22-03-07	0370.00	28	\N	2015-06-04 01:58:44.719237+00	11	image/upload/v1433383130/blqvxxmac7fdjsitiokq.jpg
30	Jd. Melina	22-25-47	0380.00	31	\N	2015-06-04 02:01:50.693318+00	11	image/upload/v1433383317/a9okyxnetqegjcg90xsd.jpg
34	Jd. Nova América	22-03-17	0420.00	35	\N	2015-06-04 02:02:02.282939+00	11	image/upload/v1433383327/fydisdqqgqvbfmunz9r9.jpg
37	Jd. Novo Campos Elíseos	22-03-06	0440.00	38	\N	2015-06-04 02:02:17.080997+00	11	image/upload/v1433383341/pnr9wy60fgernlofsuqj.jpg
38	Jd. dos Oliveiras	22-02-86	0480.00	39	\N	2015-06-04 02:02:22.08095+00	11	image/upload/v1433383346/u2diqzx0snz8fzlfuu17.jpg
44	Pq. Santa Cândida	22-03-11	0700.00	45	\N	2015-06-04 02:02:32.828081+00	11	image/upload/v1433383356/lxgdmsamqy3a25snxi3b.jpg
45	Jd. Santa Mônica	22-02-95	0500.00	46	\N	2015-06-04 02:02:37.465172+00	11	image/upload/v1433383362/tmuok7ilz2rihibrmsg7.jpg
47	Jd. Santana	22-02-88	0520.00	48	\N	2015-06-04 02:02:47.359211+00	11	image/upload/v1433383371/ucmsf9et1zntwb0orarj.jpg
49	Jd. São José	22-03-03	0550.00	50	\N	2015-06-04 02:02:57.103429+00	11	image/upload/v1433383381/uofy1joir32xxxsnzcth.jpg
50	Cidade Satelite Iris I	22-28-46	0230.00	51	\N	2015-06-04 02:03:02.329849+00	11	image/upload/v1433383385/tkgdcrm2kwchccsql2dg.jpg
52	Sousas (Vl. Iório)	22-02-85	0780.00	53	\N	2015-06-04 02:03:48.997767+00	11	image/upload/v1433383434/v3wimyxnyllufduvdsgn.jpg
53	Taquaral	22-02-82	0810.00	54	\N	2015-06-04 02:03:54.795413+00	11	image/upload/v1433383438/i2mzeqqfn9zyjm3svkym.jpg
58	Pq. Vista Alegre	22-29-40	0740.04	59	\N	2015-06-04 02:04:06.817243+00	11	image/upload/v1433383451/chemlwj22hmt6ioovaao.jpg
60	Pq. Das Camélias	22-31-12	0590.00	61	\N	2015-06-04 02:04:12.022553+00	11	image/upload/v1433383514/iph2zmguid00g4epxoqh.jpg
67	Vl. Lunardi	22-23-77	0100.01	\N	\N	2015-06-04 02:05:20.534256+00	11	image/upload/v1433383525/a1i53m5nhdzdreqvjt0k.jpg
72	Jd. Nova Esperança	22-36-38	0470.01	\N	\N	2015-06-04 02:05:32.210174+00	11	image/upload/v1433383536/uly73d38ikggc4dm8mzh.jpg
73	Jd. Santa Lúcia	22-33-46	0490.07	\N	\N	2015-06-04 02:05:37.320101+00	11	image/upload/v1433383541/axtn6whoa35xu1lpdomv.jpg
76	Pq. dos Pomares	22-36-40	0680.02	\N	\N	2015-06-04 02:05:52.707907+00	11	image/upload/v1433383558/ndmtplfeemqnlicif4v1.jpg
77	Pq. Universitário de Viracopos	22-36-41	0720.00	\N	\N	2015-06-04 02:05:58.99591+00	11	image/upload/v1433383563/wp1jgaakkvpuk7sdhgig.jpg
80	Vl. Palácios	22-31-20	0850.00	\N	\N	2015-06-04 02:06:09.50814+00	11	image/upload/v1433383573/f6nbjwjanasjee7fpr0j.jpg
81	Campituba	22-33-40	0860.00	\N	\N	2015-06-04 02:06:14.643858+00	11	image/upload/v1433383579/u3cmdz9irib88wvr2erd.jpg
84	Jd. Uruguai	22-36-39	0890.00	\N	\N	2015-06-04 02:06:25.435125+00	11	image/upload/v1433383591/nperdguywph75pr7bojt.jpg
85	Jd. Tamoio	22-35-13	0900.03	\N	\N	2015-06-04 02:06:32.201761+00	11	image/upload/v1433383596/zgi6ye8wvy6efmsd7qhw.jpg
89	Jd. Ouro Verde	22-37-83	0940.00	\N	\N	2015-06-04 02:06:41.981031+00	11	image/upload/v1433383605/kfcekvyc71f4y9qa4txu.jpg
91	Jd. Monte Cristo	22-37-81	0960.00	\N	\N	2015-06-04 02:06:46.799532+00	11	image/upload/v1433383613/qk1zlwlsztvxq1umo1zw.jpg
41	Pq. Res. Campina Grande	22-21-35	0690.01	42	\N	2015-06-04 02:09:03.279605+00	11	image/upload/v1433383749/qhkslkbuyzsr05abjeyo.jpg
55	Ch. Três Marias	22-03-01	0200.00	56	\N	2015-06-04 02:09:17.914221+00	11	image/upload/v1433383770/tnlkttpig13tjh8vmle8.jpg
62	Ch. Recreio Santa Fé	22-31-69	0190.00	68	\N	2015-06-04 02:09:31.687767+00	11	image/upload/v1433383778/rzzdfpihqt6jgr09mfxp.jpg
88	Res. São José	22-36-97	0930.00	\N	\N	2015-06-04 02:09:43.895302+00	11	image/upload/v1433383787/shzfxlhpiqmzf1fiqgcd.jpg
69	Cidade Satelite Iris IV	22-23-38	0220.02	\N	\N	2015-06-04 02:26:15.764708+00	11	image/upload/v1433384779/t5ri7s7adqhmcmyo89dq.jpg
28	Pq. Maria Helena	22-19-92	0670.00	29	\N	2015-06-04 02:20:04.265875+00	11	image/upload/v1433384409/iukg2ttdum8y5hntkwu1.jpg
32	Jd. Myriam	22-26-15	0400.00	33	\N	2015-06-04 02:20:38.433968+00	11	image/upload/v1433384447/msaomquxfr8acudbwted.jpg
33	Jd. N.S. Lourdes	22-03-12	0410.02	34	\N	2015-06-04 02:20:48.123082+00	11	image/upload/v1433384453/gerdq7hbpxhgbi0qunia.jpg
56	Jd. Santa Lúcia	22-88-88	00.00	57	\N	2015-06-04 02:21:01.014471+00	11	image/upload/v1433384465/b1va6cwaeq5eynalwkj4.jpg
61	Jd. Conceição (Sousas)	22-33-56	0760.00	64	\N	2015-06-04 02:25:56.928137+00	11	image/upload/v1433384763/ca2j22iryljjpa5ohmcb.jpg
79	Jd. Icaraí	22-40-74	0770.01	\N	\N	2015-06-04 02:26:04.382119+00	11	image/upload/v1433384770/tpnsscjrrbz6unlfxvrf.jpg
101	Vl. Santa Isabel (Anexo Piedade)	98-00-06	0840.00	\N	2014-09-09 21:04:16+00	2014-09-09 21:04:19+00	11	\N
1	Jd. Adhemar de Barros	22-21-34	0250.00	01	\N	2015-02-26 21:17:33.378044+00	11	v1424985456/vpqkgp33vytit10fxoun.jpg
104	Church Name	Bras	08890890	123	2015-02-26 22:19:53.186516+00	2015-02-26 23:57:31.941877+00	1	v1424989204/zcqmqj4rqwrmffwbie6e.jpg
2	Jd. Aeroporto (R. Cairí)	22-03-13	0800.00	02	\N	2015-02-27 01:45:10.126564+00	11	v1425001514/nsxh48vszudktdldtqd4.jpg
3	Vl. Aeroporto (Maria Rosa)	22-03-08	0790.02	03	\N	2015-02-27 01:46:14.929377+00	11	v1425001579/tvulfllsmschgg2lkgt6.jpg
10	Pq. Brasília	22-02-97	0580.00	10	\N	2015-04-24 23:51:05.43282+00	11	image/upload/v1429919469/iggrqchqczvfcoc12ucz.jpg
9	Bonfim	22-02-81	0170.00	09	\N	2015-04-25 00:42:29.425467+00	11	image/upload/v1429922554/vyldrlptx6elhtcjmaz4.jpg
4	Alto Cidade Universitária	22-25-58	0110.00	04	\N	2015-04-28 23:45:24.001501+00	11	image/upload/v1430264732/zrntrgmdq6tsk3aw7enk.jpg
6	Barão Geraldo	22-02-94	0120.00	06	\N	2015-04-28 23:46:48.66412+00	11	image/upload/v1430264816/khvi3vsdospkukhcp0g1.jpg
12	Campos Elíseos	22-02-93	0450.00	12	\N	2015-04-28 23:48:02.276101+00	11	image/upload/v1430264891/ugya4d8evun7ptedjn7a.jpg
14	Jd. São Domingos (Descampado)	22-02-90	0530.00	14	\N	2015-04-28 23:49:59.227978+00	11	image/upload/v1430265001/k4cfrrnficfyawwbtsu7.jpg
18	Jd. Fernanda	22-24-54	0310.01	18	\N	2015-04-28 23:57:12.35775+00	11	image/upload/v1430265440/r0awra3avfjws7vvhpzu.jpg
21	Jd. Ipaussurama	22-17-12	0340.00	21	\N	2015-04-28 23:59:26.145302+00	11	image/upload/v1430265568/qo7wzfcawpsm3t4n0rge.jpg
23	Pq. Ipiranga	22-02-91	0650.00	23	\N	2015-06-04 01:43:40.93471+00	11	image/upload/v1433382225/ayjsfhzgqhynyd54jdz1.jpg
26	Jd. Londres	22-02-87	0360.00	27	\N	2015-06-04 01:50:45.384712+00	11	image/upload/v1433382650/gffnu0g2weyedqh2cvte.jpg
31	Jd. Metonópolis	22-03-16	0390.00	32	\N	2015-06-04 02:01:57.730896+00	11	image/upload/v1433383321/thwms58xcabbjs80yjmt.jpg
36	Jd. Nova Europa	22-02-96	0430.00	37	\N	2015-06-04 02:02:07.916207+00	11	image/upload/v1433383336/fwex1yjcflbxdsdowdzm.jpg
39	Real Parque	22-19-69	0140.00	40	\N	2015-06-04 02:02:27.668412+00	11	image/upload/v1433383352/mnbvjwok3gd3kl5agqd2.jpg
46	Jd. Santa Rosa	22-23-39	0510.00	47	\N	2015-06-04 02:02:42.850073+00	11	image/upload/v1433383366/ffyid8sk5s7y3aiot8i8.jpg
48	Jd. São Fernando	22-03-04	0540.00	49	\N	2015-06-04 02:02:51.89469+00	11	image/upload/v1433383376/gslitwdrkxmh9nu1pudo.jpg
51	Jd. São Vicente	22-03-00	0560.00	52	\N	2015-06-04 02:03:06.841337+00	11	image/upload/v1433383391/s1wy1rs595x1be6hglm2.jpg
54	Pq. Taquaral	22-02-98	0710.02	55	\N	2015-06-04 02:04:00.096771+00	11	image/upload/v1433383445/lmsdazj28blv2tjvflai.jpg
63	Pq. Jambeiro	22-25-81	0660.00	84	\N	2015-06-04 02:05:15.409494+00	11	image/upload/v1433383519/tpk94dryahu9mipp80zb.jpg
70	Cidade Satelite Iris III (Pirelli)	22-33-48	0240.00	\N	\N	2015-06-04 02:05:25.855213+00	11	image/upload/v1433383531/my9mfjgzzdq89gxsf369.jpg
74	Pq. Centenário (Saltinho)	22-33-52	0600.00	\N	\N	2015-06-04 02:05:42.274703+00	11	image/upload/v1433383551/jfrok6slvztwpgh1yila.jpg
78	Pq. Valença II	22-32-29	0730.01	\N	\N	2015-06-04 02:06:04.180875+00	11	image/upload/v1433383568/olhrnlcnkamxthstkxd3.jpg
83	Jd. Planalto de Viracopos	22-35-27	0880.00	\N	\N	2015-06-04 02:06:19.808473+00	11	image/upload/v1433383584/eqvbkxxtk59ignboxcv9.jpg
86	Pq. Santa Bárbara	22-39-20	0910.01	\N	\N	2015-06-04 02:06:37.042392+00	11	image/upload/v1433383601/mslrqbuqw6v7k2vaolwp.jpg
92	Jd. Santo Antonio	22-38-49	0970.00	\N	\N	2015-06-04 02:06:54.144628+00	11	image/upload/v1433383620/im5ed5xu5b3oxa6x8yky.jpg
97	Ch. Nova Itaguaçu	22-43-49	1060.00	\N	\N	2014-07-22 14:02:59+00	11	\N
93	Jd. São Pedro de Viracopos	22-38-50	0980.04	\N	\N	2015-06-04 02:07:00.812114+00	11	image/upload/v1433383624/tfyg3i7j5z2grcsm9ghf.jpg
68	Cidade Satelite Iris II	22-32-25	0210.00	\N	\N	2015-06-04 02:26:11.209943+00	11	image/upload/v1433384774/txxp3gea12qe89mjjlx1.jpg
94	Jd. Mirassol	22-41-25	0990.00	\N	\N	2015-06-04 02:07:05.1177+00	11	image/upload/v1433383653/l6ebjmcjvjfvifkudp3x.jpg
95	Cidade Satelite Iris - Dunlop	22-43-89	1030.00	\N	\N	2015-06-04 02:07:34.781286+00	11	image/upload/v1433383660/yfypmou9cdhyodturhly.jpg
96	Jd. Campo Belo	22-43-46	1050.00	\N	\N	2015-06-04 02:26:20.167827+00	11	image/upload/v1433384785/mee7znilx1jlv2hd4asc.jpg
98	Pq. São Martinho	22-42-95	1070.00	\N	\N	2015-06-04 02:07:40.999146+00	11	image/upload/v1433383667/uyojrwvm3uzr1chzup2u.jpg
99	Jd. das Andorinhas	22-43-48	1080.00	\N	\N	2015-06-04 02:07:47.937254+00	11	image/upload/v1433383673/scezrqlfacdxaspjimtr.jpg
100	Vl. Brandina	22-03-05	920.00	\N	\N	2015-06-04 02:07:53.785211+00	11	image/upload/v1433383683/xmcre8f6emoqdui9goph.jpg
42	Res. Mauro Marcondes	22-21-36	0750.00	43	\N	2015-06-04 02:09:10.001525+00	11	image/upload/v1433383756/ylrtuqblj8kvp2zyuhc6.jpg
82	Pq. Res. São Bento	22-33-44	0870.03	\N	\N	2015-06-04 02:09:39.284461+00	11	image/upload/v1433383783/oh3b0qh27k6xwwp3bqus.jpg
29	Ch. Marujo - Barão Geraldo	22-03-09	0130.00	30	\N	2015-06-04 02:20:09.923005+00	11	image/upload/v1433384437/qy92fhw31hpcbciqyt8a.jpg
35	Jd. Carlos Gomes / Nova Campinas	22-30-50	0280.00	36	\N	2015-06-04 02:20:54.499412+00	11	image/upload/v1433384460/bhiis5uufrqs9w0gjiyk.jpg
\.


--
-- Name: churches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('churches_id_seq', 104, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comments (id, commentable_type, commentable_id, text, user_id, created_at, updated_at, is_archived) FROM stdin;
2	Document	4054	cco	1237	2016-08-16 00:28:39.418841	2016-08-16 00:49:05.440559	t
1	Document	4045	Teste de comentário	1	2016-08-06 01:53:17.22408	2016-08-16 01:03:13.541369	t
3	Document	4051	yjuu	1237	2016-08-16 01:03:49.467267	2016-08-16 01:03:58.752062	t
4	Document	1796	NÃO TEM PROJETO - LOTE UNICO	1237	2016-08-24 00:02:23.225675	2016-08-24 00:02:23.225675	f
5	Document	346	FALTA DIGITALIZAÇÃO DO PROJETO COMPLETO	1237	2016-08-24 00:05:46.856697	2016-08-24 00:07:14.214645	t
6	Document	1795	NÃO TEMOS NO MOMENTO	1237	2016-08-24 00:46:29.792671	2016-08-24 00:46:29.792671	f
7	Document	1797	NÃO TEM ANEXAÇÃO	1237	2016-08-24 00:46:57.595446	2016-08-24 00:46:57.595446	f
8	Document	1798	NÃO TEM ANEXAÇÃO	1237	2016-08-24 00:47:23.029698	2016-08-24 00:47:23.029698	f
9	Document	1800	TEMOS APENAS O NUMERO DA CEI: 21-096.00622-76	1237	2016-08-24 00:49:15.171452	2016-08-24 00:49:15.171452	f
10	Document	1799	NÃO TINHA NA ÉPOCA	1237	2016-08-24 00:49:35.491614	2016-08-24 00:49:35.491614	f
11	Document	348	AVERBADA NA MATRICULA: 30055 - 3º C.R.	1237	2016-08-24 00:50:41.874223	2016-08-24 00:50:41.874223	f
12	Document	1801	ENDEREÇO: BONFIM - IMUNIDADE DO IPTU OK - ISENÇÃO DO SINISTRO = OK	1237	2016-08-24 00:58:29.69774	2016-08-24 00:58:29.69774	f
14	Document	347	ALVARA 1461 DE 31/03/1976	1237	2016-08-24 01:00:01.139068	2016-08-24 01:00:01.139068	f
15	Document	349	PROJETO ANTIGO = OK (ANTES DA AMPLIAÇÃO) - PROTOCOLO 0711/0778/2009	1237	2016-08-24 01:01:06.175672	2016-08-24 01:01:06.175672	f
16	Document	350	AVCB 873736	1237	2016-08-24 01:02:12.234799	2016-08-24 01:02:12.234799	f
17	Document	351	HABITE-SE 0782 DE 14/08/1978 = OK	1237	2016-08-24 01:08:31.075842	2016-08-24 01:08:31.075842	f
18	Document	353	CND DO INSS Nº 995876 - PCND Nº 01752/94-995876 DE 29/04/1994 = OK	1237	2016-08-24 01:10:46.148029	2016-08-24 01:10:46.148029	f
19	Document	345	MATRICULA 30.055 - 3º CART. DE REGISTROS	1237	2016-08-24 01:16:42.969218	2016-08-24 01:16:42.969218	f
20	Document	352	PROTOCOLO DE ORIGEM Nº 2010 / 17 / 00689 - ALVARÁ Nº 1970 / 2011	1237	2016-08-24 01:19:42.895648	2016-08-24 01:19:42.895648	f
22	Document	346	PROTOCOLO Nº 2466 / 1976 - APROVADO EM 05/02/1976 - ÁREA CONSTRUIDA DE 283,70m²	1237	2016-08-24 01:21:41.035911	2016-08-24 01:21:41.035911	f
21	Document	346	PROTOCOLO Nº 2466 / 1976 - APROVADO EM 05/02/1976	1237	2016-08-24 01:20:56.01656	2016-08-24 01:21:46.969015	t
23	Document	344	1º CART DE NOTAS - LIVRO 759 - FOLHAS 164 - LOTE 19	1237	2016-08-24 01:26:08.338496	2016-08-24 01:26:08.338496	f
13	Document	344	LOTE 19 = OK	1237	2016-08-24 00:58:55.024545	2016-08-24 01:26:12.021454	t
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comments_id_seq', 23, true);


--
-- Name: corrections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('corrections_id_seq', 31, false);


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY document_types (id, title, "order", is_mandatory, is_active, created_at, updated_at, code, short_name, is_expirable) FROM stdin;
2	01 Escritura da Compra	0	t	t	2015-03-02 16:52:47.029729	2015-03-27 23:36:55.880179	01	Escritura de Compra	f
1	02 Contrato do imóvel	1	t	t	2015-03-02 16:52:46.21329	2015-03-27 23:36:55.355388	02	Contrato do imóvel	f
4	03 Projeto de anexação	2	t	t	2015-03-02 16:52:48.028438	2015-03-27 23:36:56.562362	03	Projeto de anexação	f
5	03.1 Certidão de anexação	3	t	t	2015-03-02 16:52:48.513919	2015-03-27 23:36:56.942703	03.1	Certidão de anexação	f
6	03.2 Protocolo da averbação da anexação	4	t	t	2015-03-02 16:52:49.00119	2015-03-27 23:36:57.263216	03.2	Protocolo da averbação da anexação	f
22	03.3 ART (Projeto de Anexação)	5	t	t	\N	\N	03.3	ART (Projeto de Anexação)	f
7	04 Planta aprovada (prefeitura)	6	t	t	2015-03-02 16:52:49.504781	2015-03-27 23:36:57.602153	04	Planta aprovada (prefeitura)	f
23	04.1 ART (Planta)	7	t	t	\N	\N	04.1	ART (Planta)	f
8	04.2 Alvará de execução da obra	8	t	t	2015-03-02 16:52:49.993844	2015-03-27 23:36:57.916079	04.2	Alvará de execução da obra	t
11	04.3 CEI Receita Federal	9	t	t	2015-03-02 16:52:51.463703	2015-03-27 23:36:58.879459	04.3	CEI Receita Federal	f
9	04.4 DIC Matrícula da obra PMC	10	t	t	2015-03-02 16:52:50.489027	2015-03-27 23:36:58.233157	04.4	DIC Matrícula da obra PMC	f
10	04.5 Averbação da construção	11	t	t	2015-03-02 16:52:50.975876	2015-03-27 23:36:58.565692	04.5	Averbação da construção	f
12	05 Projeto de bombeiros	12	t	t	2015-03-02 16:52:51.957851	2015-03-27 23:36:59.199262	05	Projeto de bombeiros	f
13	05.1 Vistoria de bombeiros	13	t	t	2015-03-02 16:52:52.466864	2015-03-27 23:36:59.509098	05.1	Vistoria de bombeiros	t
14	06 CCO	14	t	t	2015-03-02 16:52:52.966244	2015-03-27 23:36:59.829467	06	CCO	f
16	07 CND Receita Federal	15	t	t	2015-03-02 16:52:53.976158	2015-03-27 23:37:00.466273	07	CND Receita Federal	f
3	08 Matrícula registral	16	t	t	2015-03-02 16:52:47.520186	2015-03-27 23:36:56.21792	08	Matrícula registral	f
15	09 Alvará de uso	17	t	t	2015-03-02 16:52:53.476279	2015-03-27 23:37:00.146024	09	Alvará de uso	t
17	10 Cópia do IPTU	18	t	t	2015-03-02 16:52:54.469296	2015-03-27 23:37:00.797269	10	Atualização IPTU	t
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY documents (id, document_type_id, expires_at, is_possible, is_active, created_at, updated_at, documentable_id, documentable_type, attachments_count, number, issue_date, active_requests_count, status_id, comments_count) FROM stdin;
16	16	\N	t	t	2015-03-28 10:34:56.962241	2016-08-05 22:34:39.607577	21	Property	0	\N	\N	\N	DOC_AVAILABLE	0
182	2	\N	t	t	2015-03-28 10:37:49.265213	2016-08-05 22:34:40.101394	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
643	7	\N	t	t	2015-03-28 10:43:28.745659	2016-08-05 22:34:41.141571	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
57	3	\N	t	f	2015-03-28 10:35:42.380413	2016-08-05 22:34:41.639966	237	Property	0	\N	\N	\N	DOC_NONE	0
479	15	\N	t	t	2015-03-28 10:41:26.257098	2016-08-05 22:34:42.54368	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
478	14	\N	t	t	2015-03-28 10:41:25.587884	2016-08-05 22:34:43.70927	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
499	15	\N	t	t	2015-03-28 10:41:41.911807	2016-08-05 22:34:44.195989	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1449	2	\N	t	f	2015-04-08 12:41:37.571127	2016-08-08 23:02:42.992992	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1039	4	\N	t	f	2015-04-08 12:30:21.924591	2016-08-05 22:34:45.705501	19	Property	0	\N	\N	\N	DOC_NONE	0
1080	13	\N	t	f	2015-04-08 12:31:19.738354	2016-08-05 22:34:46.571541	21	Property	0	\N	\N	\N	DOC_NONE	0
1082	15	\N	t	f	2015-04-08 12:31:22.386177	2016-08-05 22:34:47.558072	21	Property	0	\N	\N	\N	DOC_NONE	0
1077	10	\N	t	f	2015-04-08 12:31:15.785194	2016-08-05 22:34:48.052018	21	Property	0	\N	\N	\N	DOC_NONE	0
1078	11	\N	t	f	2015-04-08 12:31:17.102309	2016-08-05 22:34:48.553564	21	Property	0	\N	\N	\N	DOC_NONE	0
1079	12	\N	t	f	2015-04-08 12:31:18.420444	2016-08-05 22:34:49.050208	21	Property	0	\N	\N	\N	DOC_NONE	0
1083	17	\N	t	f	2015-04-08 12:31:24.537101	2016-08-05 22:34:49.533169	21	Property	0	\N	\N	\N	DOC_NONE	0
1084	1	\N	t	f	2015-04-08 12:31:26.023633	2016-08-05 22:34:51.121784	22	Property	0	\N	\N	\N	DOC_NONE	0
1086	5	\N	t	f	2015-04-08 12:31:30.350495	2016-08-05 22:34:52.161806	22	Property	0	\N	\N	\N	DOC_NONE	0
1087	6	\N	t	f	2015-04-08 12:31:31.670488	2016-08-05 22:34:52.643324	22	Property	0	\N	\N	\N	DOC_NONE	0
1089	9	\N	t	f	2015-04-08 12:31:35.534079	2016-08-05 22:34:53.146586	22	Property	0	\N	\N	\N	DOC_NONE	0
1090	10	\N	t	f	2015-04-08 12:31:36.854764	2016-08-05 22:34:53.644403	22	Property	0	\N	\N	\N	DOC_NONE	0
1159	6	\N	t	f	2015-04-08 12:33:21.891635	2016-08-05 22:34:54.121545	28	Property	0	\N	\N	\N	DOC_NONE	0
1211	7	\N	t	f	2015-04-08 12:35:03.429185	2016-08-05 22:34:55.091307	33	Property	0	\N	\N	\N	DOC_NONE	0
1212	8	\N	t	f	2015-04-08 12:35:04.748341	2016-08-05 22:34:55.585545	33	Property	0	\N	\N	\N	DOC_NONE	0
1213	9	\N	t	f	2015-04-08 12:35:06.073912	2016-08-05 22:34:56.077609	33	Property	0	\N	\N	\N	DOC_NONE	0
1214	10	\N	t	f	2015-04-08 12:35:07.407106	2016-08-05 22:34:56.588532	33	Property	0	\N	\N	\N	DOC_NONE	0
1216	12	\N	t	f	2015-04-08 12:35:10.115421	2016-08-05 22:34:57.585549	33	Property	0	\N	\N	\N	DOC_NONE	0
1217	13	\N	t	f	2015-04-08 12:35:11.456058	2016-08-05 22:34:58.08058	33	Property	0	\N	\N	\N	DOC_NONE	0
1218	14	\N	t	f	2015-04-08 12:35:12.779645	2016-08-05 22:34:58.589955	33	Property	0	\N	\N	\N	DOC_NONE	0
1219	15	\N	t	f	2015-04-08 12:35:14.106574	2016-08-05 22:34:59.094844	33	Property	0	\N	\N	\N	DOC_NONE	0
1220	16	\N	t	f	2015-04-08 12:35:15.432848	2016-08-05 22:34:59.950562	33	Property	0	\N	\N	\N	DOC_NONE	0
1222	1	\N	t	f	2015-04-08 12:35:18.247713	2016-08-05 22:35:01.32008	34	Property	0	\N	\N	\N	DOC_NONE	0
1223	2	\N	t	f	2015-04-08 12:35:19.578511	2016-08-05 22:35:01.802594	34	Property	0	\N	\N	\N	DOC_NONE	0
1224	3	\N	t	f	2015-04-08 12:35:20.897609	2016-08-05 22:35:02.30647	34	Property	0	\N	\N	\N	DOC_NONE	0
1225	4	\N	t	f	2015-04-08 12:35:22.216388	2016-08-05 22:35:02.874924	34	Property	0	\N	\N	\N	DOC_NONE	0
1227	6	\N	t	f	2015-04-08 12:35:24.858429	2016-08-05 22:35:05.395002	34	Property	0	\N	\N	\N	DOC_NONE	0
1228	7	\N	t	f	2015-04-08 12:35:26.186501	2016-08-05 22:35:05.915908	34	Property	0	\N	\N	\N	DOC_NONE	0
1229	8	\N	t	f	2015-04-08 12:35:27.501676	2016-08-05 22:35:06.872873	34	Property	0	\N	\N	\N	DOC_NONE	0
1230	9	\N	t	f	2015-04-08 12:35:29.198284	2016-08-05 22:35:07.390985	34	Property	0	\N	\N	\N	DOC_NONE	0
1233	12	\N	t	f	2015-04-08 12:35:33.192501	2016-08-05 22:35:08.415922	34	Property	0	\N	\N	\N	DOC_NONE	0
1234	13	\N	t	f	2015-04-08 12:35:34.51384	2016-08-05 22:35:08.945686	34	Property	0	\N	\N	\N	DOC_NONE	0
1235	14	\N	t	f	2015-04-08 12:35:35.846492	2016-08-05 22:35:09.454692	34	Property	0	\N	\N	\N	DOC_NONE	0
1236	15	\N	t	f	2015-04-08 12:35:37.161142	2016-08-05 22:35:09.945171	34	Property	0	\N	\N	\N	DOC_NONE	0
1237	16	\N	t	f	2015-04-08 12:35:38.479285	2016-08-05 22:35:10.438016	34	Property	0	\N	\N	\N	DOC_NONE	0
1239	1	\N	t	f	2015-04-08 12:35:42.027622	2016-08-05 22:35:11.427823	35	Property	0	\N	\N	\N	DOC_NONE	0
1240	2	\N	t	f	2015-04-08 12:35:43.361163	2016-08-05 22:35:11.915032	35	Property	0	\N	\N	\N	DOC_NONE	0
1241	3	\N	t	f	2015-04-08 12:35:44.701339	2016-08-05 22:35:12.422883	35	Property	0	\N	\N	\N	DOC_NONE	0
1242	4	\N	t	f	2015-04-08 12:35:46.066015	2016-08-05 22:35:12.983221	35	Property	0	\N	\N	\N	DOC_NONE	0
1244	6	\N	t	f	2015-04-08 12:35:49.081388	2016-08-05 22:35:14.050316	35	Property	0	\N	\N	\N	DOC_NONE	0
1245	7	\N	t	f	2015-04-08 12:35:50.405561	2016-08-05 22:35:14.552278	35	Property	0	\N	\N	\N	DOC_NONE	0
1246	8	\N	t	f	2015-04-08 12:35:51.726056	2016-08-05 22:35:15.411215	35	Property	0	\N	\N	\N	DOC_NONE	0
1247	9	\N	t	f	2015-04-08 12:35:53.0459	2016-08-05 22:35:16.415326	35	Property	0	\N	\N	\N	DOC_NONE	0
91	13	\N	t	f	2015-03-28 10:36:28.685247	2016-08-05 22:35:18.891647	50	Property	0	\N	\N	\N	DOC_NONE	0
186	14	\N	t	t	2015-03-28 10:37:51.850587	2016-08-05 22:35:19.3809	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
185	11	\N	t	t	2015-03-28 10:37:51.201274	2016-08-05 22:35:19.882516	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
370	12	\N	t	f	2015-03-28 10:40:06.746647	2016-08-05 22:35:20.365677	169	Property	0	\N	\N	\N	DOC_NONE	0
396	10	\N	t	f	2015-03-28 10:40:26.01821	2016-08-05 22:35:20.879857	170	Property	0	\N	\N	\N	DOC_NONE	0
550	13	\N	t	t	2015-03-28 10:42:19.395269	2016-08-05 22:35:21.359551	29	Property	1	\N	\N	\N	DOC_UPLOADED	0
1558	17	\N	t	t	2015-04-08 12:44:27.410243	2016-08-05 22:35:21.84942	60	Property	0	\N	\N	\N	DOC_AVAILABLE	0
734	13	\N	t	t	2015-03-28 10:44:37.566138	2016-08-05 22:35:22.335666	239	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1614	8	\N	t	f	2015-04-08 12:46:04.642366	2016-08-05 22:35:22.830836	66	Property	0	\N	\N	\N	DOC_NONE	0
1703	13	\N	t	f	2015-04-08 12:48:55.975442	2016-08-05 22:35:23.335773	73	Property	0	\N	\N	\N	DOC_NONE	0
1792	6	\N	t	f	2015-04-08 12:51:34.095912	2016-08-05 22:35:23.860097	81	Property	0	\N	\N	\N	DOC_NONE	0
1883	8	\N	t	f	2015-04-08 12:54:23.852796	2016-08-05 22:35:24.349578	88	Property	0	\N	\N	\N	DOC_NONE	0
1884	9	\N	t	f	2015-04-08 12:54:25.341739	2016-08-05 22:35:24.858721	88	Property	0	\N	\N	\N	DOC_NONE	0
1885	10	\N	t	f	2015-04-08 12:54:26.838942	2016-08-05 22:35:25.362938	88	Property	0	\N	\N	\N	DOC_NONE	0
1886	11	\N	t	f	2015-04-08 12:54:28.325767	2016-08-05 22:35:25.865172	88	Property	0	\N	\N	\N	DOC_NONE	0
1892	17	\N	t	f	2015-04-08 12:54:38.404107	2016-08-05 22:35:26.37512	88	Property	0	\N	\N	\N	DOC_NONE	0
1893	1	\N	t	f	2015-04-08 12:54:40.053278	2016-08-05 22:35:27.02205	89	Property	0	\N	\N	\N	DOC_NONE	0
1894	2	\N	t	f	2015-04-08 12:54:41.548095	2016-08-05 22:35:27.502873	89	Property	0	\N	\N	\N	DOC_NONE	0
1896	4	\N	t	f	2015-04-08 12:54:44.525746	2016-08-05 22:35:28.491409	89	Property	0	\N	\N	\N	DOC_NONE	0
1880	5	\N	t	t	2015-04-08 12:54:19.380441	2016-08-05 22:35:29.275449	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1887	12	\N	t	t	2015-04-08 12:54:30.195249	2016-08-05 22:35:30.39372	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1888	13	\N	t	t	2015-04-08 12:54:32.072723	2016-08-05 22:35:31.161655	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1889	14	\N	t	t	2015-04-08 12:54:33.935275	2016-08-05 22:35:31.652944	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1979	17	\N	t	f	2015-04-08 12:57:08.249284	2016-08-05 22:35:32.619112	96	Property	0	\N	\N	\N	DOC_NONE	0
1980	1	\N	t	f	2015-04-08 12:57:09.979241	2016-08-05 22:35:33.107842	97	Property	0	\N	\N	\N	DOC_NONE	0
1982	3	\N	t	f	2015-04-08 12:57:13.339387	2016-08-05 22:35:33.593214	97	Property	0	\N	\N	\N	DOC_NONE	0
1983	4	\N	t	f	2015-04-08 12:57:14.822517	2016-08-05 22:35:34.234292	97	Property	0	\N	\N	\N	DOC_NONE	0
1984	5	\N	t	f	2015-04-08 12:57:16.314616	2016-08-05 22:35:34.876892	97	Property	0	\N	\N	\N	DOC_NONE	0
2058	14	\N	t	f	2015-04-08 12:59:11.627433	2016-08-05 22:35:35.915487	101	Property	0	\N	\N	\N	DOC_NONE	0
2148	9	\N	t	f	2015-04-08 13:02:12.846846	2016-08-05 22:35:36.438206	110	Property	0	\N	\N	\N	DOC_NONE	0
2149	10	\N	t	f	2015-04-08 13:02:14.343605	2016-08-05 22:35:37.031144	110	Property	0	\N	\N	\N	DOC_NONE	0
2150	11	\N	t	f	2015-04-08 13:02:15.85548	2016-08-05 22:35:37.746733	110	Property	0	\N	\N	\N	DOC_NONE	0
2313	16	\N	t	f	2015-04-08 13:07:15.394577	2016-08-05 22:35:38.815967	124	Property	0	\N	\N	\N	DOC_NONE	0
2236	1	\N	t	f	2015-04-08 13:04:51.943961	2016-08-05 22:35:39.308729	117	Property	0	\N	\N	\N	DOC_NONE	0
2237	2	\N	t	f	2015-04-08 13:04:53.439678	2016-08-05 22:35:39.812755	117	Property	0	\N	\N	\N	DOC_NONE	0
2238	3	\N	t	f	2015-04-08 13:04:54.935191	2016-08-05 22:35:40.889681	117	Property	0	\N	\N	\N	DOC_NONE	0
2240	5	\N	t	f	2015-04-08 13:04:57.936877	2016-08-05 22:35:43.071276	117	Property	0	\N	\N	\N	DOC_NONE	0
2241	6	\N	t	f	2015-04-08 13:04:59.816862	2016-08-05 22:35:44.901988	117	Property	0	\N	\N	\N	DOC_NONE	0
2245	10	\N	t	f	2015-04-08 13:05:06.298759	2016-08-05 22:35:48.863575	117	Property	0	\N	\N	\N	DOC_NONE	0
2246	11	\N	t	f	2015-04-08 13:05:07.791259	2016-08-05 22:35:49.369129	117	Property	0	\N	\N	\N	DOC_NONE	0
2247	12	\N	t	f	2015-04-08 13:05:09.2927	2016-08-05 22:35:49.895548	117	Property	0	\N	\N	\N	DOC_NONE	0
2248	13	\N	t	f	2015-04-08 13:05:10.786962	2016-08-05 22:35:50.374188	117	Property	0	\N	\N	\N	DOC_NONE	0
2292	1	\N	t	f	2015-04-08 13:06:32.25298	2016-08-05 22:35:50.899638	123	Property	0	\N	\N	\N	DOC_NONE	0
2293	2	\N	t	f	2015-04-08 13:06:33.754865	2016-08-05 22:35:51.420925	123	Property	0	\N	\N	\N	DOC_NONE	0
2295	9	\N	t	f	2015-04-08 13:06:41.741377	2016-08-05 22:35:51.949253	123	Property	0	\N	\N	\N	DOC_NONE	0
2298	1	\N	t	f	2015-04-08 13:06:52.478846	2016-08-05 22:35:52.483009	124	Property	0	\N	\N	\N	DOC_NONE	0
2299	2	\N	t	f	2015-04-08 13:06:54.342889	2016-08-05 22:35:53.043039	124	Property	0	\N	\N	\N	DOC_NONE	0
2300	3	\N	t	f	2015-04-08 13:06:55.843897	2016-08-05 22:35:54.24588	124	Property	0	\N	\N	\N	DOC_NONE	0
2301	4	\N	t	f	2015-04-08 13:06:57.341341	2016-08-05 22:35:55.039671	124	Property	0	\N	\N	\N	DOC_NONE	0
2302	5	\N	t	f	2015-04-08 13:06:58.843133	2016-08-05 22:35:55.830037	124	Property	0	\N	\N	\N	DOC_NONE	0
2303	6	\N	t	f	2015-04-08 13:07:00.400767	2016-08-05 22:35:56.722646	124	Property	0	\N	\N	\N	DOC_NONE	0
2304	7	\N	t	f	2015-04-08 13:07:01.903411	2016-08-05 22:35:57.393825	124	Property	0	\N	\N	\N	DOC_NONE	0
2305	8	\N	t	f	2015-04-08 13:07:03.405781	2016-08-05 22:35:57.887741	124	Property	0	\N	\N	\N	DOC_NONE	0
2306	9	\N	t	f	2015-04-08 13:07:04.897223	2016-08-05 22:35:58.360625	124	Property	0	\N	\N	\N	DOC_NONE	0
2308	11	\N	t	f	2015-04-08 13:07:07.896035	2016-08-05 22:35:59.336486	124	Property	0	\N	\N	\N	DOC_NONE	0
2309	12	\N	t	f	2015-04-08 13:07:09.40363	2016-08-05 22:35:59.823692	124	Property	0	\N	\N	\N	DOC_NONE	0
2310	13	\N	t	f	2015-04-08 13:07:10.897848	2016-08-05 22:36:00.330823	124	Property	0	\N	\N	\N	DOC_NONE	0
2311	14	\N	t	f	2015-04-08 13:07:12.394642	2016-08-05 22:36:04.722793	124	Property	0	\N	\N	\N	DOC_NONE	0
2315	1	\N	t	f	2015-04-08 13:07:18.565837	2016-08-05 22:36:05.85105	125	Property	0	\N	\N	\N	DOC_NONE	0
2296	13	\N	t	t	2015-04-08 13:06:46.243492	2016-08-05 22:36:06.439558	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2317	6	\N	t	f	2015-04-08 13:07:24.590298	2016-08-05 22:36:06.944609	125	Property	0	\N	\N	\N	DOC_NONE	0
2318	7	\N	t	f	2015-04-08 13:07:26.09375	2016-08-05 22:36:07.835484	125	Property	0	\N	\N	\N	DOC_NONE	0
2319	8	\N	t	f	2015-04-08 13:07:27.599149	2016-08-05 22:36:08.317541	125	Property	0	\N	\N	\N	DOC_NONE	0
2326	15	\N	t	f	2015-04-08 13:07:38.143611	2016-08-05 22:36:09.324685	125	Property	0	\N	\N	\N	DOC_NONE	0
2416	10	\N	t	f	2015-04-08 13:10:22.203334	2016-08-05 22:36:09.983032	133	Property	0	\N	\N	\N	DOC_NONE	0
2417	11	\N	t	f	2015-04-08 13:10:23.709816	2016-08-05 22:36:10.765701	133	Property	0	\N	\N	\N	DOC_NONE	0
2418	12	\N	t	f	2015-04-08 13:10:25.204901	2016-08-05 22:36:11.291229	133	Property	0	\N	\N	\N	DOC_NONE	0
2420	14	\N	t	f	2015-04-08 13:10:28.571238	2016-08-05 22:36:13.172955	133	Property	0	\N	\N	\N	DOC_NONE	0
2421	15	\N	t	f	2015-04-08 13:10:30.066177	2016-08-05 22:36:14.275871	133	Property	0	\N	\N	\N	DOC_NONE	0
2422	16	\N	t	f	2015-04-08 13:10:31.56867	2016-08-05 22:36:15.016058	133	Property	0	\N	\N	\N	DOC_NONE	0
2423	17	\N	t	f	2015-04-08 13:10:33.071913	2016-08-05 22:36:15.912106	133	Property	0	\N	\N	\N	DOC_NONE	0
2426	5	\N	t	f	2015-04-08 13:10:40.130309	2016-08-05 22:36:16.636775	134	Property	0	\N	\N	\N	DOC_NONE	0
2415	9	\N	t	f	2015-04-08 13:10:20.70036	2016-08-05 22:36:18.618537	133	Property	0	\N	\N	\N	DOC_NONE	0
2435	10	\N	t	f	2015-04-08 13:11:10.418999	2016-08-05 22:36:19.394244	135	Property	0	\N	\N	\N	DOC_NONE	0
2438	1	\N	t	f	2015-04-08 13:11:21.320745	2016-08-05 22:36:20.03633	136	Property	0	\N	\N	\N	DOC_NONE	0
2440	4	\N	t	f	2015-04-08 13:11:25.348408	2016-08-05 22:36:20.71094	136	Property	0	\N	\N	\N	DOC_NONE	0
2441	5	\N	t	f	2015-04-08 13:11:27.228997	2016-08-05 22:36:21.213034	136	Property	0	\N	\N	\N	DOC_NONE	0
2442	8	\N	t	f	2015-04-08 13:11:30.737003	2016-08-05 22:36:21.697268	136	Property	0	\N	\N	\N	DOC_NONE	0
2443	9	\N	t	f	2015-04-08 13:11:32.607138	2016-08-05 22:36:22.17839	136	Property	0	\N	\N	\N	DOC_NONE	0
2444	10	\N	t	f	2015-04-08 13:11:34.103157	2016-08-05 22:36:22.68847	136	Property	0	\N	\N	\N	DOC_NONE	0
2445	17	\N	t	f	2015-04-08 13:11:42.067019	2016-08-05 22:36:23.177506	136	Property	0	\N	\N	\N	DOC_NONE	0
2504	2	\N	t	f	2015-04-08 13:13:26.78971	2016-08-05 22:36:23.658928	141	Property	0	\N	\N	\N	DOC_NONE	0
2593	17	\N	t	f	2015-04-08 13:15:56.513406	2016-08-05 22:36:24.141357	148	Property	0	\N	\N	\N	DOC_NONE	0
2682	13	\N	t	f	2015-04-08 13:18:47.124607	2016-08-05 22:36:24.629646	155	Property	0	\N	\N	\N	DOC_NONE	0
2771	6	\N	t	f	2015-04-08 13:21:23.408042	2016-08-05 22:36:25.295531	163	Property	0	\N	\N	\N	DOC_NONE	0
2948	1	\N	t	f	2015-04-08 13:27:19.004326	2016-08-05 22:36:26.325158	178	Property	0	\N	\N	\N	DOC_NONE	0
3037	13	\N	t	f	2015-04-08 13:29:52.389908	2016-08-05 22:36:26.819794	183	Property	0	\N	\N	\N	DOC_NONE	0
3130	17	\N	t	f	2015-04-08 13:32:39.893752	2016-08-05 22:36:27.812427	191	Property	0	\N	\N	\N	DOC_NONE	0
3215	12	\N	t	f	2015-04-08 13:35:14.931469	2016-08-05 22:36:29.549937	197	Property	0	\N	\N	\N	DOC_NONE	0
3393	17	\N	t	f	2015-04-08 13:40:47.101916	2016-08-05 22:36:30.520085	209	Property	0	\N	\N	\N	DOC_NONE	0
3482	13	\N	t	f	2015-04-08 13:43:22.715574	2016-08-05 22:36:31.371642	216	Property	0	\N	\N	\N	DOC_NONE	0
3660	10	\N	t	f	2015-04-08 13:48:43.029638	2016-08-05 22:36:32.333722	229	Property	0	\N	\N	\N	DOC_NONE	0
3749	16	\N	t	f	2015-04-08 13:51:10.908851	2016-08-05 22:36:32.89211	234	Property	0	\N	\N	\N	DOC_NONE	0
3838	9	\N	t	f	2015-04-08 13:53:53.369283	2016-08-05 22:36:33.37233	243	Property	0	\N	\N	\N	DOC_NONE	0
4016	8	\N	t	f	2015-04-08 13:59:12.246318	2016-08-05 22:36:34.43961	26	Property	0	\N	\N	\N	DOC_NONE	0
4105	3	\N	t	f	2015-04-08 14:01:52.85833	2016-08-05 22:36:34.940738	254	Property	0	\N	\N	\N	DOC_NONE	0
4194	11	\N	t	f	2015-04-08 14:04:29.684977	2016-08-05 22:36:35.428007	118	Property	0	\N	\N	\N	DOC_NONE	0
4283	2	\N	t	f	2015-04-08 14:07:24.564943	2016-08-05 22:36:35.905302	187	Property	0	\N	\N	\N	DOC_NONE	0
4387	10	\N	t	f	2015-04-08 14:10:24.246211	2016-08-05 22:36:36.886171	252	Property	0	\N	\N	\N	DOC_NONE	0
575	2	\N	t	t	2015-03-28 10:42:38.608587	2016-08-05 22:36:37.387511	4	Property	0	\N	\N	0	DOC_AVAILABLE	0
1095	17	\N	t	f	2015-04-08 12:31:45.188945	2016-08-05 22:36:37.860923	22	Property	0	\N	\N	\N	DOC_NONE	0
604	16	\N	t	t	2015-03-28 10:42:58.906746	2016-08-05 22:36:38.342892	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1963	17	\N	t	f	2015-04-08 12:56:41.722508	2016-08-05 22:36:38.834026	95	Property	0	\N	\N	\N	DOC_NONE	0
62	1	\N	t	f	2015-03-28 10:35:47.794067	2016-08-05 22:36:39.829572	241	Property	0	\N	\N	\N	DOC_NONE	0
4	4	\N	t	t	2015-03-28 10:34:43.567488	2016-08-05 22:36:40.324949	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2479	2	\N	t	f	2015-04-08 13:12:38.505057	2016-08-05 22:36:40.809165	139	Property	0	\N	\N	\N	DOC_NONE	0
5	5	\N	t	t	2015-03-28 10:34:44.274676	2016-08-05 22:36:41.299949	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
7	7	\N	t	t	2015-03-28 10:34:45.609398	2016-08-05 22:36:42.27267	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
8	8	\N	t	t	2015-03-28 10:34:46.269251	2016-08-05 22:36:42.808723	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3	3	\N	t	t	2015-03-28 10:34:42.570537	2016-08-05 22:36:43.299327	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
21	16	\N	t	t	2015-03-28 10:35:00.998659	2016-08-05 22:36:44.75715	22	Property	0	\N	\N	\N	DOC_AVAILABLE	0
25	2	\N	t	t	2015-03-28 10:35:10.101488	2016-08-05 22:36:45.245787	25	Property	0	\N	\N	\N	DOC_AVAILABLE	0
28	3	\N	t	t	2015-03-28 10:35:13.370574	2016-08-05 22:36:45.725376	26	Property	0	\N	\N	\N	DOC_AVAILABLE	0
29	2	\N	t	t	2015-03-28 10:35:14.689599	2016-08-05 22:36:46.612106	27	Property	0	\N	\N	\N	DOC_AVAILABLE	0
43	2	\N	t	t	2015-03-28 10:35:28.565416	2016-08-05 22:36:47.618625	94	Property	0	\N	\N	\N	DOC_AVAILABLE	0
72	3	\N	t	t	2015-03-28 10:36:08.18193	2016-08-05 22:36:49.539717	83	Property	0	\N	\N	\N	DOC_AVAILABLE	0
90	3	\N	t	t	2015-03-28 10:36:28.035226	2016-08-05 22:36:50.049863	50	Property	0	\N	\N	\N	DOC_AVAILABLE	0
139	12	\N	t	t	2015-03-28 10:37:16.587732	2016-08-05 22:36:50.522785	16	Property	0	\N	\N	\N	DOC_AVAILABLE	0
138	7	\N	t	t	2015-03-28 10:37:15.915836	2016-08-05 22:36:50.998235	16	Property	1	\N	\N	\N	DOC_UPLOADED	0
137	5	\N	t	t	2015-03-28 10:37:15.218818	2016-08-05 22:36:51.474266	16	Property	0	\N	\N	\N	DOC_AVAILABLE	0
146	14	\N	t	t	2015-03-28 10:37:22.085776	2016-08-05 22:36:51.946885	173	Property	0	\N	\N	\N	DOC_AVAILABLE	0
147	15	\N	t	t	2015-03-28 10:37:22.761718	2016-08-05 22:36:52.425186	173	Property	0	\N	\N	\N	DOC_AVAILABLE	0
148	16	\N	t	t	2015-03-28 10:37:23.427155	2016-08-05 22:36:52.914121	173	Property	0	\N	\N	\N	DOC_AVAILABLE	0
151	5	\N	t	t	2015-03-28 10:37:26.128103	2016-08-05 22:36:53.396648	130	Property	1	\N	\N	\N	DOC_UPLOADED	0
150	4	\N	t	t	2015-03-28 10:37:25.447699	2016-08-05 22:36:53.885525	130	Property	1	\N	\N	\N	DOC_UPLOADED	0
149	2	\N	t	t	2015-03-28 10:37:24.726388	2016-08-05 22:36:54.359359	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
393	2	\N	t	t	2015-03-28 10:40:24.081031	2016-08-05 22:36:54.842516	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
177	4	\N	t	t	2015-03-28 10:37:45.288119	2016-08-05 22:36:55.325579	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
188	2	\N	t	t	2015-03-28 10:37:53.816009	2016-08-05 22:36:56.296414	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
211	14	\N	t	t	2015-03-28 10:38:10.465663	2016-08-05 22:36:57.141434	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
212	15	\N	t	t	2015-03-28 10:38:11.123505	2016-08-05 22:36:57.987485	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
213	16	\N	t	t	2015-03-28 10:38:11.787205	2016-08-05 22:36:58.51216	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
243	7	\N	t	t	2015-03-28 10:38:34.06663	2016-08-05 22:37:00.520284	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
258	16	\N	t	t	2015-03-28 10:38:44.754762	2016-08-05 22:37:01.385648	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
268	14	\N	t	t	2015-03-28 10:38:52.062356	2016-08-05 22:37:01.861041	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
267	13	\N	t	t	2015-03-28 10:38:51.39922	2016-08-05 22:37:02.342932	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
266	12	\N	t	t	2015-03-28 10:38:50.746207	2016-08-05 22:37:02.819664	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
302	9	\N	t	t	2015-03-28 10:39:17.108745	2016-08-05 22:37:03.792925	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
300	7	\N	t	t	2015-03-28 10:39:15.822047	2016-08-05 22:37:04.298001	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
317	15	\N	t	t	2015-03-28 10:39:27.676985	2016-08-05 22:37:04.800642	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
318	16	\N	t	t	2015-03-28 10:39:28.314739	2016-08-05 22:37:05.284675	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
363	2	\N	t	t	2015-03-28 10:40:02.070735	2016-08-05 22:37:07.31885	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
376	3	\N	t	t	2015-03-28 10:40:11.35534	2016-08-05 22:37:07.797971	7	Property	0	\N	\N	\N	DOC_AVAILABLE	0
394	4	\N	t	t	2015-03-28 10:40:24.728082	2016-08-05 22:37:09.244135	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
413	2	\N	t	t	2015-03-28 10:40:38.972559	2016-08-05 22:37:09.725248	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
488	15	\N	t	t	2015-03-28 10:41:33.979297	2016-08-05 22:37:10.202037	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
489	16	\N	t	t	2015-03-28 10:41:34.63449	2016-08-05 22:37:10.675743	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
506	8	\N	t	t	2015-03-28 10:41:47.153463	2016-08-05 22:37:11.641873	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
518	12	\N	t	t	2015-03-28 10:41:55.663793	2016-08-05 22:37:12.131562	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
517	11	\N	t	t	2015-03-28 10:41:55.018607	2016-08-05 22:37:12.622772	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
515	5	\N	t	t	2015-03-28 10:41:53.66739	2016-08-05 22:37:13.130552	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
513	3	\N	t	t	2015-03-28 10:41:52.352646	2016-08-05 22:37:14.132463	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
512	2	\N	t	t	2015-03-28 10:41:51.68521	2016-08-05 22:37:14.61251	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
532	2	\N	t	t	2015-03-28 10:42:06.26162	2016-08-05 22:37:15.109217	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
170	10	\N	t	f	2015-03-28 10:37:40.008915	2016-08-05 22:37:15.586504	166	Property	0	\N	\N	\N	DOC_NONE	0
559	8	\N	t	f	2015-03-28 10:42:26.759878	2016-08-05 22:37:16.43781	222	Property	0	\N	\N	\N	DOC_NONE	0
568	10	\N	t	t	2015-03-28 10:42:33.345048	2016-08-05 22:37:17.883037	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
375	2	\N	t	f	2015-03-28 10:40:10.702452	2016-08-08 23:09:34.649961	7	Property	1	\N	\N	\N	DOC_AVAILABLE	0
595	2	\N	t	t	2015-03-28 10:42:53.041581	2016-08-05 22:37:19.821609	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
634	8	\N	t	t	2015-03-28 10:43:22.036726	2016-08-05 22:37:20.301062	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
635	10	\N	t	t	2015-03-28 10:43:22.709391	2016-08-05 22:37:20.776571	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
646	11	\N	t	t	2015-03-28 10:43:30.718366	2016-08-05 22:37:21.254907	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
645	9	\N	t	t	2015-03-28 10:43:30.048252	2016-08-05 22:37:21.750002	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
644	8	\N	t	t	2015-03-28 10:43:29.39885	2016-08-05 22:37:22.223925	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
655	14	\N	t	t	2015-03-28 10:43:37.321962	2016-08-05 22:37:22.709933	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
662	5	\N	t	t	2015-03-28 10:43:43.309061	2016-08-05 22:37:23.226602	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
669	7	\N	t	t	2015-03-28 10:43:48.638162	2016-08-05 22:37:23.737837	103	Property	0	\N	\N	\N	DOC_AVAILABLE	0
684	8	\N	t	t	2015-03-28 10:43:59.876086	2016-08-05 22:37:24.241638	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
683	7	\N	t	t	2015-03-28 10:43:59.23056	2016-08-05 22:37:24.8165	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
682	3	\N	t	t	2015-03-28 10:43:58.559119	2016-08-05 22:37:25.611703	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
707	7	\N	t	t	2015-03-28 10:44:17.778983	2016-08-05 22:37:26.690556	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
345	3	\N	t	f	2015-03-28 10:39:48.839275	2016-08-24 01:16:43.460507	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
10	13	\N	t	t	2015-03-28 10:34:48.776872	2016-08-05 22:36:43.802313	180	Property	0	\N	\N	\N	DOC_AVAILABLE	0
706	3	\N	t	t	2015-03-28 10:44:17.109956	2016-08-05 22:37:27.165134	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
726	7	\N	t	t	2015-03-28 10:44:31.696443	2016-08-05 22:37:27.698637	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
725	5	\N	t	t	2015-03-28 10:44:31.046644	2016-08-05 22:37:28.182963	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
171	11	\N	t	f	2015-03-28 10:37:40.666002	2016-08-05 22:37:29.159295	166	Property	0	\N	\N	\N	DOC_NONE	0
762	6	\N	t	t	2015-03-28 10:44:59.367836	2016-08-05 22:37:29.673433	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
763	12	\N	t	t	2015-03-28 10:45:00.009626	2016-08-05 22:37:30.150286	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
764	13	\N	t	t	2015-03-28 10:45:00.68077	2016-08-05 22:37:30.624035	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1529	4	\N	t	f	2015-04-08 12:43:45.643299	2016-08-05 22:37:31.301657	59	Property	0	\N	\N	\N	DOC_NONE	0
1061	10	\N	t	f	2015-04-08 12:30:53.165614	2016-08-05 22:37:32.255591	20	Property	0	\N	\N	\N	DOC_NONE	0
1232	11	\N	t	f	2015-04-08 12:35:31.86822	2016-08-05 22:37:32.764308	34	Property	0	\N	\N	\N	DOC_NONE	0
1388	3	\N	t	f	2015-04-08 12:39:53.872711	2016-08-05 22:37:33.264082	48	Property	0	\N	\N	\N	DOC_NONE	0
579	12	\N	t	t	2015-03-28 10:42:41.226494	2016-08-05 22:37:34.12621	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
291	9	\N	t	f	2015-03-28 10:39:09.315549	2016-08-05 22:37:35.702349	113	Property	0	\N	\N	\N	DOC_NONE	0
54	3	\N	t	t	2015-03-28 10:35:39.730957	2016-08-05 22:37:36.196853	108	Property	0	\N	\N	\N	DOC_AVAILABLE	0
98	1	\N	t	f	2015-03-28 10:36:36.66549	2016-08-05 22:37:36.677475	70	Property	0	\N	\N	\N	DOC_NONE	0
56	2	\N	t	t	2015-03-28 10:35:41.688434	2016-08-05 22:37:37.159912	237	Property	0	\N	\N	\N	DOC_AVAILABLE	0
63	2	\N	t	t	2015-03-28 10:35:49.106481	2016-08-05 22:37:37.676418	119	Property	0	\N	\N	\N	DOC_AVAILABLE	0
112	15	\N	t	t	2015-03-28 10:36:50.667323	2016-08-05 22:37:38.657674	101	Property	0	\N	\N	\N	DOC_AVAILABLE	0
111	8	\N	t	t	2015-03-28 10:36:50.008886	2016-08-05 22:37:39.140028	101	Property	0	\N	\N	\N	DOC_AVAILABLE	0
141	14	\N	t	t	2015-03-28 10:37:17.903675	2016-08-05 22:37:39.642665	16	Property	1	\N	\N	\N	DOC_UPLOADED	0
142	16	\N	t	t	2015-03-28 10:37:18.566368	2016-08-05 22:37:40.128571	16	Property	0	\N	\N	\N	DOC_AVAILABLE	0
157	14	\N	t	t	2015-03-28 10:37:30.12138	2016-08-05 22:37:41.10896	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
827	1	\N	t	t	2015-04-08 12:24:40.311248	2016-08-05 22:37:41.597244	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
910	10	\N	t	f	2015-04-08 12:26:55.965462	2016-08-05 22:37:42.088377	8	Property	0	\N	\N	\N	DOC_NONE	0
1107	14	\N	t	f	2015-04-08 12:32:03.024968	2016-08-05 22:37:42.579881	23	Property	0	\N	\N	\N	DOC_NONE	0
1194	5	\N	t	f	2015-04-08 12:34:38.034016	2016-08-05 22:37:43.548082	32	Property	0	\N	\N	\N	DOC_NONE	0
1266	8	\N	t	f	2015-04-08 12:36:30.614519	2016-08-05 22:37:44.03206	37	Property	0	\N	\N	\N	DOC_NONE	0
75	2	\N	t	t	2015-03-28 10:36:12.130648	2016-08-05 22:37:44.527136	171	Property	0	\N	\N	\N	DOC_AVAILABLE	0
737	2	\N	t	f	2015-03-28 10:44:40.813017	2016-08-05 22:37:45.016621	213	Property	0	\N	\N	\N	DOC_NONE	0
145	11	\N	t	t	2015-03-28 10:37:21.410754	2016-08-05 22:37:45.541857	173	Property	0	\N	\N	\N	DOC_AVAILABLE	0
167	16	\N	t	t	2015-03-28 10:37:37.321952	2016-08-05 22:37:46.996817	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
49	1	\N	t	f	2015-03-28 10:35:33.832089	2016-08-05 22:37:49.797157	96	Property	0	\N	\N	\N	DOC_NONE	0
187	15	\N	t	t	2015-03-28 10:37:52.520082	2016-08-05 22:37:50.27362	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
189	4	\N	t	t	2015-03-28 10:37:54.485355	2016-08-05 22:37:50.780143	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
222	16	\N	t	t	2015-03-28 10:38:18.347679	2016-08-05 22:37:51.267099	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
221	15	\N	t	t	2015-03-28 10:38:17.672048	2016-08-05 22:37:51.745156	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
220	14	\N	t	t	2015-03-28 10:38:17.033344	2016-08-05 22:37:52.228831	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
219	11	\N	t	t	2015-03-28 10:38:16.358695	2016-08-05 22:37:52.71279	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
233	16	\N	t	t	2015-03-28 10:38:26.192683	2016-08-05 22:37:53.202779	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
249	16	\N	t	t	2015-03-28 10:38:38.106634	2016-08-05 22:37:53.693675	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
270	16	\N	t	t	2015-03-28 10:38:53.396053	2016-08-05 22:37:54.217435	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
263	8	\N	t	t	2015-03-28 10:38:48.734206	2016-08-05 22:37:54.824505	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
269	15	\N	t	t	2015-03-28 10:38:52.704874	2016-08-05 22:37:55.303185	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
280	12	\N	t	t	2015-03-28 10:39:01.363981	2016-08-05 22:37:55.778075	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
279	5	\N	t	t	2015-03-28 10:39:00.700683	2016-08-05 22:37:56.252206	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
278	3	\N	t	t	2015-03-28 10:39:00.055018	2016-08-05 22:37:56.739941	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
297	16	\N	t	t	2015-03-28 10:39:13.201264	2016-08-05 22:37:57.223309	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
296	15	\N	t	t	2015-03-28 10:39:12.551523	2016-08-05 22:37:57.717231	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
295	14	\N	t	t	2015-03-28 10:39:11.911361	2016-08-05 22:37:58.192993	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
294	13	\N	t	t	2015-03-28 10:39:11.26558	2016-08-05 22:37:58.688428	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
293	12	\N	t	t	2015-03-28 10:39:10.615364	2016-08-05 22:37:59.162835	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
464	13	\N	t	f	2015-03-28 10:41:15.718757	2016-08-05 22:37:59.635408	49	Property	0	\N	\N	\N	DOC_NONE	0
381	14	\N	t	t	2015-03-28 10:40:14.859417	2016-08-05 22:38:00.599822	7	Property	0	\N	\N	\N	DOC_AVAILABLE	0
401	16	\N	t	t	2015-03-28 10:40:29.373554	2016-08-05 22:38:01.51185	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
412	16	\N	t	t	2015-03-28 10:40:37.683207	2016-08-05 22:38:01.99385	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
411	15	\N	t	t	2015-03-28 10:40:37.03694	2016-08-05 22:38:02.463368	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
457	16	\N	t	t	2015-03-28 10:41:10.461202	2016-08-05 22:38:03.454837	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
466	16	\N	t	t	2015-03-28 10:41:17.040746	2016-08-05 22:38:03.934974	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
477	13	\N	t	t	2015-03-28 10:41:24.938502	2016-08-05 22:38:04.890482	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
476	12	\N	t	t	2015-03-28 10:41:24.285111	2016-08-05 22:38:05.365555	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
497	13	\N	t	t	2015-03-28 10:41:40.584194	2016-08-05 22:38:05.849488	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
510	14	\N	t	t	2015-03-28 10:41:49.759068	2016-08-05 22:38:06.798313	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
508	12	\N	t	t	2015-03-28 10:41:48.456425	2016-08-05 22:38:07.284909	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
541	15	\N	t	t	2015-03-28 10:42:12.178947	2016-08-05 22:38:07.768499	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
553	16	\N	t	t	2015-03-28 10:42:21.366386	2016-08-05 22:38:08.246202	29	Property	0	\N	\N	\N	DOC_AVAILABLE	0
574	16	\N	t	t	2015-03-28 10:42:37.280972	2016-08-05 22:38:08.730756	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
572	14	\N	t	t	2015-03-28 10:42:35.960179	2016-08-05 22:38:09.714438	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
571	13	\N	t	t	2015-03-28 10:42:35.319762	2016-08-05 22:38:10.200775	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
570	12	\N	t	t	2015-03-28 10:42:34.647335	2016-08-05 22:38:10.679221	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
624	4	\N	t	t	2015-03-28 10:43:14.743885	2016-08-05 22:38:11.17213	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
704	16	\N	t	t	2015-03-28 10:44:15.08438	2016-08-05 22:38:12.137906	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
702	12	\N	t	t	2015-03-28 10:44:13.785841	2016-08-05 22:38:12.623004	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
701	7	\N	t	t	2015-03-28 10:44:13.110661	2016-08-05 22:38:13.106331	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
699	2	\N	t	t	2015-03-28 10:44:11.763377	2016-08-05 22:38:13.590687	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
721	15	\N	t	t	2015-03-28 10:44:27.736404	2016-08-05 22:38:14.560303	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
719	13	\N	t	t	2015-03-28 10:44:26.41254	2016-08-05 22:38:15.045432	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
750	8	\N	t	t	2015-03-28 10:44:50.025743	2016-08-05 22:38:15.536318	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1890	15	\N	t	t	2015-04-08 12:54:35.42418	2016-08-05 22:38:16.396988	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1619	13	\N	t	f	2015-04-08 12:46:12.088982	2016-08-05 22:38:16.879608	66	Property	0	\N	\N	\N	DOC_NONE	0
3156	10	\N	t	t	2015-04-08 13:33:24.621491	2016-08-05 22:38:18.319088	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1981	2	\N	t	f	2015-04-08 12:57:11.851323	2016-08-05 22:38:18.812231	97	Property	0	\N	\N	\N	DOC_NONE	0
2072	15	\N	t	f	2015-04-08 12:59:36.654971	2016-08-05 22:38:19.29393	102	Property	0	\N	\N	\N	DOC_NONE	0
2251	16	\N	t	f	2015-04-08 13:05:16.119205	2016-08-05 22:38:20.252014	117	Property	0	\N	\N	\N	DOC_NONE	0
786	3	\N	t	f	2015-03-28 13:45:21	2016-08-05 22:38:20.729449	204	Property	0	\N	\N	\N	DOC_NONE	0
2431	17	\N	t	f	2015-04-08 13:10:55.01836	2016-08-05 22:38:21.21414	134	Property	0	\N	\N	\N	DOC_NONE	0
2522	10	\N	t	f	2015-04-08 13:14:02.634479	2016-08-05 22:38:21.697567	142	Property	0	\N	\N	\N	DOC_NONE	0
2612	3	\N	t	f	2015-04-08 13:16:44.706272	2016-08-05 22:38:22.203011	151	Property	0	\N	\N	\N	DOC_NONE	0
2794	12	\N	t	f	2015-04-08 13:22:03.148254	2016-08-05 22:38:23.187004	164	Property	0	\N	\N	\N	DOC_NONE	0
2974	17	\N	t	f	2015-04-08 13:28:08.282306	2016-08-05 22:38:23.682979	179	Property	0	\N	\N	\N	DOC_NONE	0
3065	3	\N	t	f	2015-04-08 13:30:53.977924	2016-08-05 22:38:24.165881	188	Property	0	\N	\N	\N	DOC_NONE	0
253	7	\N	t	f	2015-03-28 10:38:41.443393	2016-08-05 22:38:24.643703	104	Property	0	\N	\N	\N	DOC_NONE	0
3337	10	\N	t	f	2015-04-08 13:39:02.948719	2016-08-05 22:38:25.595287	206	Property	0	\N	\N	\N	DOC_NONE	0
3428	1	\N	t	f	2015-04-08 13:41:45.126321	2016-08-05 22:38:26.097359	212	Property	0	\N	\N	\N	DOC_NONE	0
3519	5	\N	t	f	2015-04-08 13:44:32.405821	2016-08-05 22:38:26.611329	219	Property	0	\N	\N	\N	DOC_NONE	0
22	2	\N	t	t	2015-03-28 10:35:02.291863	2016-08-05 22:38:27.096469	23	Property	0	\N	\N	\N	DOC_AVAILABLE	0
26	3	\N	t	t	2015-03-28 10:35:11.267971	2016-08-05 22:38:28.070457	25	Property	0	\N	\N	\N	DOC_AVAILABLE	0
143	2	\N	t	t	2015-03-28 10:37:20.082919	2016-08-05 22:38:28.549178	173	Property	0	\N	\N	\N	DOC_AVAILABLE	0
159	16	\N	t	t	2015-03-28 10:37:31.423602	2016-08-05 22:38:29.023436	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
210	13	\N	t	t	2015-03-28 10:38:09.803866	2016-08-05 22:38:29.517432	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
324	11	\N	t	f	2015-03-28 10:39:32.909384	2016-08-05 22:38:30.001489	111	Property	0	\N	\N	\N	DOC_NONE	0
255	11	\N	t	t	2015-03-28 10:38:42.759414	2016-08-05 22:38:31.456477	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
256	14	\N	t	t	2015-03-28 10:38:43.420038	2016-08-05 22:38:31.937244	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
311	8	\N	t	t	2015-03-28 10:39:23.744455	2016-08-05 22:38:32.422295	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
312	10	\N	t	t	2015-03-28 10:39:24.412292	2016-08-05 22:38:32.910114	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
314	12	\N	t	t	2015-03-28 10:39:25.711765	2016-08-05 22:38:33.928299	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
315	13	\N	t	t	2015-03-28 10:39:26.373266	2016-08-05 22:38:34.404172	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
387	11	\N	t	t	2015-03-28 10:40:19.498871	2016-08-05 22:38:34.888134	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
325	14	\N	t	t	2015-03-28 10:39:33.581842	2016-08-05 22:38:35.374528	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
326	15	\N	t	t	2015-03-28 10:39:34.221361	2016-08-05 22:38:35.848532	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
389	13	\N	t	t	2015-03-28 10:40:20.798365	2016-08-05 22:38:36.826066	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
392	16	\N	t	t	2015-03-28 10:40:22.769341	2016-08-05 22:38:37.312728	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
391	15	\N	t	t	2015-03-28 10:40:22.104114	2016-08-05 22:38:37.804172	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
429	11	\N	t	t	2015-03-28 10:40:50.184329	2016-08-05 22:38:38.291825	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
431	13	\N	t	t	2015-03-28 10:40:51.484148	2016-08-05 22:38:39.315673	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
432	14	\N	t	t	2015-03-28 10:40:52.130704	2016-08-05 22:38:39.803608	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
433	15	\N	t	t	2015-03-28 10:40:52.830848	2016-08-05 22:38:40.28129	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
434	16	\N	t	t	2015-03-28 10:40:53.479595	2016-08-05 22:38:40.762689	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
482	6	\N	t	t	2015-03-28 10:41:28.918907	2016-08-05 22:38:41.75886	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
483	7	\N	t	t	2015-03-28 10:41:29.559789	2016-08-05 22:38:42.255305	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
484	11	\N	t	t	2015-03-28 10:41:30.292831	2016-08-05 22:38:42.742809	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
485	12	\N	t	t	2015-03-28 10:41:31.990602	2016-08-05 22:38:43.227807	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
486	13	\N	t	t	2015-03-28 10:41:32.647904	2016-08-05 22:38:43.709976	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
500	16	\N	t	t	2015-03-28 10:41:42.558491	2016-08-05 22:38:44.68362	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
588	7	\N	t	t	2015-03-28 10:42:47.797675	2016-08-05 22:38:45.195427	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
589	8	\N	t	t	2015-03-28 10:42:48.477604	2016-08-05 22:38:45.724456	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
590	11	\N	t	t	2015-03-28 10:42:49.126997	2016-08-05 22:38:46.545468	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
593	14	\N	t	t	2015-03-28 10:42:51.066543	2016-08-05 22:38:47.524731	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
594	16	\N	t	t	2015-03-28 10:42:51.732503	2016-08-05 22:38:48.009101	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
621	16	\N	t	t	2015-03-28 10:43:12.135271	2016-08-05 22:38:49.46497	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
658	2	\N	t	t	2015-03-28 10:43:40.022716	2016-08-05 22:38:49.947607	32	Property	0	\N	\N	\N	DOC_AVAILABLE	0
659	3	\N	t	t	2015-03-28 10:43:40.691809	2016-08-05 22:38:50.424883	32	Property	0	\N	\N	\N	DOC_AVAILABLE	0
664	8	\N	t	t	2015-03-28 10:43:44.62146	2016-08-05 22:38:50.903314	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
665	14	\N	t	t	2015-03-28 10:43:45.287583	2016-08-05 22:38:51.378308	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
666	15	\N	t	t	2015-03-28 10:43:45.946439	2016-08-05 22:38:51.857866	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
667	16	\N	t	t	2015-03-28 10:43:46.654197	2016-08-05 22:38:52.32916	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3610	9	\N	t	f	2015-04-08 13:47:16.276529	2016-08-05 22:38:52.818534	225	Property	0	\N	\N	\N	DOC_NONE	0
3882	3	\N	t	f	2015-04-08 13:55:11.176918	2016-08-05 22:38:53.795351	246	Property	0	\N	\N	\N	DOC_NONE	0
3973	11	\N	t	f	2015-04-08 13:57:55.811432	2016-08-05 22:38:54.278073	251	Property	0	\N	\N	\N	DOC_NONE	0
4064	10	\N	t	t	2015-04-08 14:00:29.991496	2016-08-05 22:38:54.7615	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4155	4	\N	t	f	2015-04-08 14:03:10.504162	2016-08-05 22:38:55.319411	94	Property	0	\N	\N	\N	DOC_NONE	0
4332	16	\N	t	f	2015-04-08 14:08:54.089085	2016-08-05 22:38:56.316679	226	Property	0	\N	\N	\N	DOC_NONE	0
869	3	\N	t	t	2015-04-08 12:25:46.291475	2016-08-05 22:38:56.799986	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4334	1	\N	t	f	2015-04-08 14:08:57.246748	2016-08-05 22:38:57.325262	238	Property	0	\N	\N	\N	DOC_NONE	0
4335	4	\N	t	f	2015-04-08 14:09:00.715396	2016-08-05 22:38:57.831979	238	Property	0	\N	\N	\N	DOC_NONE	0
4337	6	\N	t	f	2015-04-08 14:09:03.694239	2016-08-05 22:38:58.816754	238	Property	0	\N	\N	\N	DOC_NONE	0
4338	7	\N	t	f	2015-04-08 14:09:05.182941	2016-08-05 22:38:59.289676	238	Property	0	\N	\N	\N	DOC_NONE	0
4339	8	\N	t	f	2015-04-08 14:09:06.670032	2016-08-05 22:38:59.766498	238	Property	0	\N	\N	\N	DOC_NONE	0
4340	9	\N	t	f	2015-04-08 14:09:08.157826	2016-08-05 22:39:00.240587	238	Property	0	\N	\N	\N	DOC_NONE	0
4341	10	\N	t	f	2015-04-08 14:09:09.647776	2016-08-05 22:39:00.717753	238	Property	0	\N	\N	\N	DOC_NONE	0
4343	12	\N	t	f	2015-04-08 14:09:12.630293	2016-08-05 22:39:02.037622	238	Property	0	\N	\N	\N	DOC_NONE	0
4344	13	\N	t	f	2015-04-08 14:09:14.120262	2016-08-05 22:39:02.515768	238	Property	0	\N	\N	\N	DOC_NONE	0
4345	14	\N	t	f	2015-04-08 14:09:15.616958	2016-08-05 22:39:03.012091	238	Property	0	\N	\N	\N	DOC_NONE	0
4346	15	\N	t	f	2015-04-08 14:09:17.106682	2016-08-05 22:39:03.498205	238	Property	0	\N	\N	\N	DOC_NONE	0
832	6	\N	t	f	2015-04-08 12:24:46.917481	2016-08-05 22:39:04.490446	2	Property	0	\N	\N	\N	DOC_NONE	0
840	14	\N	t	t	2015-04-08 12:24:58.020409	2016-08-05 22:39:04.969323	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
841	15	\N	t	t	2015-04-08 12:24:59.373807	2016-08-05 22:39:05.457077	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
835	9	\N	t	f	2015-04-08 12:24:51.267775	2016-08-05 22:39:05.997021	2	Property	0	\N	\N	\N	DOC_NONE	0
836	10	\N	t	f	2015-04-08 12:24:52.597862	2016-08-05 22:39:06.505131	2	Property	0	\N	\N	\N	DOC_NONE	0
833	7	\N	t	t	2015-04-08 12:24:48.617058	2016-08-05 22:39:07.910849	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
839	13	\N	t	t	2015-04-08 12:24:56.670678	2016-08-05 22:39:08.388981	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
829	3	\N	t	t	2015-04-08 12:24:42.961031	2016-08-05 22:39:08.883531	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
838	12	\N	t	t	2015-04-08 12:24:55.316276	2016-08-05 22:39:09.359323	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
843	17	\N	t	f	2015-04-08 12:25:02.198527	2016-08-05 22:39:10.312293	2	Property	0	\N	\N	\N	DOC_NONE	0
844	2	\N	t	f	2015-04-08 12:25:04.51574	2016-08-05 22:39:10.79604	3	Property	0	\N	\N	\N	DOC_NONE	0
845	3	\N	t	f	2015-04-08 12:25:05.842699	2016-08-05 22:39:11.270799	3	Property	0	\N	\N	\N	DOC_NONE	0
846	4	\N	t	f	2015-04-08 12:25:07.168278	2016-08-05 22:39:11.782317	3	Property	0	\N	\N	\N	DOC_NONE	0
848	6	\N	t	f	2015-04-08 12:25:09.815501	2016-08-05 22:39:12.743817	3	Property	0	\N	\N	\N	DOC_NONE	0
849	7	\N	t	f	2015-04-08 12:25:11.139673	2016-08-05 22:39:13.225278	3	Property	0	\N	\N	\N	DOC_NONE	0
850	8	\N	t	f	2015-04-08 12:25:12.460278	2016-08-05 22:39:13.706916	3	Property	0	\N	\N	\N	DOC_NONE	0
851	9	\N	t	f	2015-04-08 12:25:13.779436	2016-08-05 22:39:14.19114	3	Property	0	\N	\N	\N	DOC_NONE	0
852	10	\N	t	f	2015-04-08 12:25:15.100965	2016-08-05 22:39:14.670511	3	Property	0	\N	\N	\N	DOC_NONE	0
855	13	\N	t	f	2015-04-08 12:25:19.069839	2016-08-05 22:39:15.642035	3	Property	0	\N	\N	\N	DOC_NONE	0
856	14	\N	t	f	2015-04-08 12:25:20.398409	2016-08-05 22:39:16.483956	3	Property	0	\N	\N	\N	DOC_NONE	0
857	15	\N	t	f	2015-04-08 12:25:21.729825	2016-08-05 22:39:16.963342	3	Property	0	\N	\N	\N	DOC_NONE	0
858	16	\N	t	f	2015-04-08 12:25:23.055777	2016-08-05 22:39:17.452312	3	Property	0	\N	\N	\N	DOC_NONE	0
863	6	\N	t	f	2015-04-08 12:25:31.51969	2016-08-05 22:39:19.394582	4	Property	0	\N	\N	\N	DOC_NONE	0
864	8	\N	t	f	2015-04-08 12:25:33.674628	2016-08-05 22:39:19.867061	4	Property	0	\N	\N	\N	DOC_NONE	0
865	9	\N	t	f	2015-04-08 12:25:35.002827	2016-08-05 22:39:20.339628	4	Property	0	\N	\N	\N	DOC_NONE	0
866	10	\N	t	f	2015-04-08 12:25:36.329614	2016-08-05 22:39:20.817257	4	Property	0	\N	\N	\N	DOC_NONE	0
867	17	\N	t	f	2015-04-08 12:25:42.629744	2016-08-05 22:39:21.289341	4	Property	0	\N	\N	\N	DOC_NONE	0
868	1	\N	t	f	2015-04-08 12:25:44.131339	2016-08-05 22:39:21.771629	5	Property	0	\N	\N	\N	DOC_NONE	0
831	5	\N	t	t	2015-04-08 12:24:45.598779	2016-08-05 22:39:22.244361	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
870	4	\N	t	f	2015-04-08 12:25:47.62329	2016-08-05 22:39:22.751768	5	Property	0	\N	\N	\N	DOC_NONE	0
871	5	\N	t	f	2015-04-08 12:25:49.029292	2016-08-05 22:39:23.229905	5	Property	0	\N	\N	\N	DOC_NONE	0
872	6	\N	t	f	2015-04-08 12:25:50.35774	2016-08-05 22:39:23.711648	5	Property	0	\N	\N	\N	DOC_NONE	0
873	8	\N	t	f	2015-04-08 12:25:52.509966	2016-08-05 22:39:24.193592	5	Property	0	\N	\N	\N	DOC_NONE	0
874	9	\N	t	f	2015-04-08 12:25:53.848505	2016-08-05 22:39:24.673222	5	Property	0	\N	\N	\N	DOC_NONE	0
875	10	\N	t	f	2015-04-08 12:25:55.168641	2016-08-05 22:39:25.154324	5	Property	0	\N	\N	\N	DOC_NONE	0
879	4	\N	t	f	2015-04-08 12:26:06.62221	2016-08-05 22:39:26.117052	6	Property	0	\N	\N	\N	DOC_NONE	0
880	5	\N	t	f	2015-04-08 12:26:07.962112	2016-08-05 22:39:26.601507	6	Property	0	\N	\N	\N	DOC_NONE	0
881	6	\N	t	f	2015-04-08 12:26:09.288553	2016-08-05 22:39:27.075701	6	Property	0	\N	\N	\N	DOC_NONE	0
882	7	\N	t	f	2015-04-08 12:26:10.614056	2016-08-05 22:39:27.560976	6	Property	0	\N	\N	\N	DOC_NONE	0
883	8	\N	t	f	2015-04-08 12:26:11.943916	2016-08-05 22:39:28.040164	6	Property	0	\N	\N	\N	DOC_NONE	0
18	4	\N	t	t	2015-03-28 10:34:58.914194	2016-08-05 22:39:28.99179	22	Property	0	\N	\N	\N	DOC_AVAILABLE	0
661	4	\N	t	t	2015-03-28 10:43:42.656162	2016-08-05 22:39:29.464366	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
689	16	\N	t	t	2015-03-28 10:44:03.210418	2016-08-05 22:39:29.941124	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
760	4	\N	t	t	2015-03-28 10:44:57.961064	2016-08-05 22:39:30.421964	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
885	10	\N	t	f	2015-04-08 12:26:14.596061	2016-08-05 22:39:31.791131	6	Property	0	\N	\N	\N	DOC_NONE	0
886	11	\N	t	f	2015-04-08 12:26:15.919914	2016-08-05 22:39:32.266429	6	Property	0	\N	\N	\N	DOC_NONE	0
888	13	\N	t	f	2015-04-08 12:26:18.607411	2016-08-05 22:39:33.225611	6	Property	0	\N	\N	\N	DOC_NONE	0
889	14	\N	t	f	2015-04-08 12:26:19.934817	2016-08-05 22:39:33.723518	6	Property	0	\N	\N	\N	DOC_NONE	0
890	15	\N	t	f	2015-04-08 12:26:21.267487	2016-08-05 22:39:34.199526	6	Property	0	\N	\N	\N	DOC_NONE	0
894	5	\N	t	f	2015-04-08 12:26:29.228298	2016-08-08 23:12:54.297442	7	Property	0	\N	\N	\N	DOC_MISSING	0
900	16	\N	t	f	2015-04-08 12:26:41.737146	2016-08-08 23:13:31.041806	7	Property	0	\N	\N	\N	DOC_MISSING	0
895	6	\N	t	f	2015-04-08 12:26:30.563637	2016-08-05 22:39:36.110527	7	Property	0	\N	\N	\N	DOC_NONE	0
896	8	\N	t	f	2015-04-08 12:26:33.088182	2016-08-05 22:39:36.588747	7	Property	0	\N	\N	\N	DOC_NONE	0
897	9	\N	t	f	2015-04-08 12:26:34.41043	2016-08-05 22:39:37.06886	7	Property	0	\N	\N	\N	DOC_NONE	0
899	11	\N	t	f	2015-04-08 12:26:37.05727	2016-08-05 22:39:38.045784	7	Property	0	\N	\N	\N	DOC_NONE	0
901	17	\N	t	f	2015-04-08 12:26:43.064983	2016-08-05 22:39:39.007694	7	Property	0	\N	\N	\N	DOC_NONE	0
902	2	\N	t	f	2015-04-08 12:26:45.393791	2016-08-05 22:39:39.480753	8	Property	0	\N	\N	\N	DOC_NONE	0
904	4	\N	t	f	2015-04-08 12:26:48.032801	2016-08-05 22:39:40.448484	8	Property	0	\N	\N	\N	DOC_NONE	0
905	5	\N	t	f	2015-04-08 12:26:49.355153	2016-08-05 22:39:40.931501	8	Property	0	\N	\N	\N	DOC_NONE	0
906	6	\N	t	f	2015-04-08 12:26:50.683347	2016-08-05 22:39:41.406926	8	Property	0	\N	\N	\N	DOC_NONE	0
907	7	\N	t	f	2015-04-08 12:26:52.001405	2016-08-05 22:39:41.881904	8	Property	0	\N	\N	\N	DOC_NONE	0
909	9	\N	t	f	2015-04-08 12:26:54.642247	2016-08-05 22:39:42.845968	8	Property	0	\N	\N	\N	DOC_NONE	0
911	11	\N	t	f	2015-04-08 12:26:57.286152	2016-08-05 22:39:43.359215	8	Property	0	\N	\N	\N	DOC_NONE	0
912	12	\N	t	f	2015-04-08 12:26:58.621198	2016-08-05 22:39:43.832884	8	Property	0	\N	\N	\N	DOC_NONE	0
913	13	\N	t	f	2015-04-08 12:26:59.952315	2016-08-05 22:39:44.313785	8	Property	0	\N	\N	\N	DOC_NONE	0
914	14	\N	t	f	2015-04-08 12:27:01.367062	2016-08-05 22:39:44.797367	8	Property	0	\N	\N	\N	DOC_NONE	0
917	17	\N	t	f	2015-04-08 12:27:05.335073	2016-08-05 22:39:45.905937	8	Property	0	\N	\N	\N	DOC_NONE	0
918	1	\N	t	f	2015-04-08 12:27:06.827515	2016-08-05 22:39:47.33701	9	Property	0	\N	\N	\N	DOC_NONE	0
923	6	\N	t	f	2015-04-08 12:27:13.443934	2016-08-05 22:39:50.678331	9	Property	0	\N	\N	\N	DOC_NONE	0
924	7	\N	t	f	2015-04-08 12:27:14.771258	2016-08-05 22:39:51.162213	9	Property	0	\N	\N	\N	DOC_NONE	0
925	8	\N	t	f	2015-04-08 12:27:16.098751	2016-08-05 22:39:51.643227	9	Property	0	\N	\N	\N	DOC_NONE	0
926	9	\N	t	f	2015-04-08 12:27:17.43395	2016-08-05 22:39:52.120428	9	Property	0	\N	\N	\N	DOC_NONE	0
927	10	\N	t	f	2015-04-08 12:27:18.759852	2016-08-05 22:39:52.616412	9	Property	0	\N	\N	\N	DOC_NONE	0
928	11	\N	t	f	2015-04-08 12:27:20.083801	2016-08-05 22:39:53.092453	9	Property	0	\N	\N	\N	DOC_NONE	0
929	12	\N	t	f	2015-04-08 12:27:21.407778	2016-08-05 22:39:53.578505	9	Property	0	\N	\N	\N	DOC_NONE	0
930	13	\N	t	f	2015-04-08 12:27:23.109894	2016-08-05 22:39:54.06797	9	Property	0	\N	\N	\N	DOC_NONE	0
931	14	\N	t	f	2015-04-08 12:27:24.436301	2016-08-05 22:39:54.548206	9	Property	0	\N	\N	\N	DOC_NONE	0
932	15	\N	t	f	2015-04-08 12:27:25.758758	2016-08-05 22:39:55.024312	9	Property	0	\N	\N	\N	DOC_NONE	0
933	16	\N	t	f	2015-04-08 12:27:27.086234	2016-08-05 22:39:55.513718	9	Property	0	\N	\N	\N	DOC_NONE	0
934	17	\N	t	f	2015-04-08 12:27:28.409849	2016-08-05 22:39:56.003344	9	Property	0	\N	\N	\N	DOC_NONE	0
1428	6	\N	t	f	2015-04-08 12:41:00.712491	2016-08-05 22:39:56.485608	51	Property	0	\N	\N	\N	DOC_NONE	0
1429	9	\N	t	f	2015-04-08 12:41:04.128536	2016-08-05 22:39:56.973	51	Property	0	\N	\N	\N	DOC_NONE	0
1431	1	\N	t	f	2015-04-08 12:41:12.831425	2016-08-05 22:39:57.448927	53	Property	0	\N	\N	\N	DOC_NONE	0
1432	2	\N	t	f	2015-04-08 12:41:14.170937	2016-08-05 22:39:57.929582	53	Property	0	\N	\N	\N	DOC_NONE	0
1433	3	\N	t	f	2015-04-08 12:41:15.496889	2016-08-05 22:39:58.426926	53	Property	0	\N	\N	\N	DOC_NONE	0
1434	4	\N	t	f	2015-04-08 12:41:16.840924	2016-08-05 22:39:58.924692	53	Property	0	\N	\N	\N	DOC_NONE	0
1435	5	\N	t	f	2015-04-08 12:41:18.162226	2016-08-05 22:39:59.411785	53	Property	0	\N	\N	\N	DOC_NONE	0
1436	6	\N	t	f	2015-04-08 12:41:19.483818	2016-08-05 22:39:59.888647	53	Property	0	\N	\N	\N	DOC_NONE	0
1438	8	\N	t	f	2015-04-08 12:41:22.281594	2016-08-05 22:40:01.025306	53	Property	0	\N	\N	\N	DOC_NONE	0
1439	9	\N	t	f	2015-04-08 12:41:23.642457	2016-08-05 22:40:01.535781	53	Property	0	\N	\N	\N	DOC_NONE	0
1440	10	\N	t	f	2015-04-08 12:41:24.975493	2016-08-05 22:40:02.01605	53	Property	0	\N	\N	\N	DOC_NONE	0
1441	11	\N	t	f	2015-04-08 12:41:26.316331	2016-08-05 22:40:02.502051	53	Property	0	\N	\N	\N	DOC_NONE	0
1443	13	\N	t	f	2015-04-08 12:41:29.396933	2016-08-05 22:40:03.46135	53	Property	0	\N	\N	\N	DOC_NONE	0
1444	14	\N	t	f	2015-04-08 12:41:30.72642	2016-08-05 22:40:03.950225	53	Property	0	\N	\N	\N	DOC_NONE	0
1445	15	\N	t	f	2015-04-08 12:41:32.053634	2016-08-05 22:40:04.429887	53	Property	0	\N	\N	\N	DOC_NONE	0
1446	16	\N	t	f	2015-04-08 12:41:33.387506	2016-08-05 22:40:04.906067	53	Property	0	\N	\N	\N	DOC_NONE	0
1447	17	\N	t	f	2015-04-08 12:41:34.72804	2016-08-05 22:40:05.395594	53	Property	0	\N	\N	\N	DOC_NONE	0
1448	1	\N	t	t	2015-04-08 12:41:36.223126	2016-08-05 22:40:06.368899	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
935	1	\N	t	t	2015-04-08 12:27:29.900202	2016-08-05 22:40:06.839225	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1452	5	\N	t	t	2015-04-08 12:41:41.596726	2016-08-05 22:40:07.318003	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1450	3	\N	t	t	2015-04-08 12:41:38.895368	2016-08-05 22:40:07.800852	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1456	9	\N	t	f	2015-04-08 12:41:49.665469	2016-08-05 22:40:08.763687	54	Property	0	\N	\N	\N	DOC_NONE	0
1457	10	\N	t	f	2015-04-08 12:41:51.016058	2016-08-05 22:40:09.254328	54	Property	0	\N	\N	\N	DOC_NONE	0
1458	11	\N	t	f	2015-04-08 12:41:52.363531	2016-08-05 22:40:09.733432	54	Property	0	\N	\N	\N	DOC_NONE	0
1461	14	\N	t	t	2015-04-08 12:41:56.753909	2016-08-05 22:40:10.232047	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1477	13	\N	t	t	2015-04-08 12:42:22.399388	2016-08-05 22:40:11.218251	55	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1462	15	\N	t	t	2015-04-08 12:41:58.859833	2016-08-05 22:40:11.697273	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
581	14	\N	t	t	2015-03-28 10:42:42.522989	2016-08-05 22:40:12.183573	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1464	17	\N	t	f	2015-04-08 12:42:02.023316	2016-08-05 22:40:12.668804	54	Property	0	\N	\N	\N	DOC_NONE	0
1467	3	\N	t	f	2015-04-08 12:42:06.209372	2016-08-05 22:40:13.148863	55	Property	0	\N	\N	\N	DOC_NONE	0
981	17	\N	t	t	2015-04-08 12:28:51.10166	2016-08-05 22:40:14.108147	13	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1468	4	\N	t	f	2015-04-08 12:42:07.922934	2016-08-05 22:40:14.59128	55	Property	0	\N	\N	\N	DOC_NONE	0
1469	5	\N	t	f	2015-04-08 12:42:09.636559	2016-08-05 22:40:15.098458	55	Property	0	\N	\N	\N	DOC_NONE	0
1470	6	\N	t	f	2015-04-08 12:42:10.973776	2016-08-05 22:40:15.622997	55	Property	0	\N	\N	\N	DOC_NONE	0
1472	8	\N	t	f	2015-04-08 12:42:13.675689	2016-08-05 22:40:17.039811	55	Property	0	\N	\N	\N	DOC_NONE	0
1473	9	\N	t	f	2015-04-08 12:42:15.400607	2016-08-05 22:40:17.559516	55	Property	0	\N	\N	\N	DOC_NONE	0
893	1	\N	t	f	2015-04-08 12:26:25.416248	2016-08-08 23:12:24.282105	7	Property	0	\N	\N	\N	DOC_MISSING	0
1480	16	\N	t	f	2015-04-08 12:42:26.463822	2016-08-05 22:40:18.980097	55	Property	0	\N	\N	\N	DOC_NONE	0
1482	1	\N	t	f	2015-04-08 12:42:29.347495	2016-08-05 22:40:19.962655	56	Property	0	\N	\N	\N	DOC_NONE	0
1478	14	\N	t	f	2015-04-08 12:42:23.773877	2016-08-05 22:40:20.442972	55	Property	0	\N	\N	\N	DOC_NONE	0
1479	15	\N	t	f	2015-04-08 12:42:25.11205	2016-08-05 22:40:20.938494	55	Property	0	\N	\N	\N	DOC_NONE	0
1481	17	\N	t	f	2015-04-08 12:42:27.822274	2016-08-05 22:40:21.422711	55	Property	0	\N	\N	\N	DOC_NONE	0
1466	2	\N	t	t	2015-04-08 12:42:04.887137	2016-08-05 22:40:21.907466	55	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1489	8	\N	t	t	2015-04-08 12:42:38.640533	2016-08-05 22:40:22.381824	56	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1465	1	\N	t	t	2015-04-08 12:42:03.561027	2016-08-05 22:40:22.885185	55	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1486	5	\N	t	f	2015-04-08 12:42:34.665565	2016-08-05 22:40:23.857968	56	Property	0	\N	\N	\N	DOC_NONE	0
1487	6	\N	t	f	2015-04-08 12:42:35.995596	2016-08-05 22:40:24.346814	56	Property	0	\N	\N	\N	DOC_NONE	0
1484	3	\N	t	t	2015-04-08 12:42:32.007583	2016-08-05 22:40:24.838975	56	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1488	7	\N	t	t	2015-04-08 12:42:37.312954	2016-08-05 22:40:25.365379	56	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1491	10	\N	t	f	2015-04-08 12:42:41.308853	2016-08-05 22:40:26.35908	56	Property	0	\N	\N	\N	DOC_NONE	0
938	1	\N	t	f	2015-04-08 12:27:46.047796	2016-08-05 22:40:26.854802	11	Property	0	\N	\N	\N	DOC_NONE	0
939	4	\N	t	f	2015-04-08 12:27:49.032913	2016-08-05 22:40:27.355276	11	Property	0	\N	\N	\N	DOC_NONE	0
941	6	\N	t	f	2015-04-08 12:27:51.687426	2016-08-05 22:40:27.847151	11	Property	0	\N	\N	\N	DOC_NONE	0
943	8	\N	t	f	2015-04-08 12:27:54.715701	2016-08-05 22:40:28.844786	11	Property	0	\N	\N	\N	DOC_NONE	0
944	9	\N	t	f	2015-04-08 12:27:56.036307	2016-08-05 22:40:29.335351	11	Property	0	\N	\N	\N	DOC_NONE	0
945	10	\N	t	f	2015-04-08 12:27:57.360147	2016-08-05 22:40:29.815917	11	Property	0	\N	\N	\N	DOC_NONE	0
946	11	\N	t	f	2015-04-08 12:27:58.687617	2016-08-05 22:40:30.305341	11	Property	0	\N	\N	\N	DOC_NONE	0
947	12	\N	t	f	2015-04-08 12:28:00.018432	2016-08-05 22:40:31.267937	11	Property	0	\N	\N	\N	DOC_NONE	0
949	14	\N	t	f	2015-04-08 12:28:02.665572	2016-08-05 22:40:32.25569	11	Property	0	\N	\N	\N	DOC_NONE	0
950	15	\N	t	f	2015-04-08 12:28:03.994008	2016-08-05 22:40:32.800326	11	Property	0	\N	\N	\N	DOC_NONE	0
951	16	\N	t	f	2015-04-08 12:28:05.322611	2016-08-05 22:40:33.290102	11	Property	0	\N	\N	\N	DOC_NONE	0
952	17	\N	t	f	2015-04-08 12:28:06.645027	2016-08-05 22:40:33.779561	11	Property	0	\N	\N	\N	DOC_NONE	0
954	2	\N	t	f	2015-04-08 12:28:09.449595	2016-08-05 22:40:34.781937	12	Property	0	\N	\N	\N	DOC_NONE	0
955	3	\N	t	f	2015-04-08 12:28:11.901911	2016-08-05 22:40:35.259619	12	Property	0	\N	\N	\N	DOC_NONE	0
956	4	\N	t	f	2015-04-08 12:28:13.232457	2016-08-05 22:40:35.749349	12	Property	0	\N	\N	\N	DOC_NONE	0
957	5	\N	t	f	2015-04-08 12:28:14.571005	2016-08-05 22:40:36.235925	12	Property	0	\N	\N	\N	DOC_NONE	0
958	6	\N	t	f	2015-04-08 12:28:15.895425	2016-08-05 22:40:36.746722	12	Property	0	\N	\N	\N	DOC_NONE	0
960	8	\N	t	f	2015-04-08 12:28:18.561723	2016-08-05 22:40:37.720154	12	Property	0	\N	\N	\N	DOC_NONE	0
961	9	\N	t	f	2015-04-08 12:28:19.883907	2016-08-05 22:40:38.220986	12	Property	0	\N	\N	\N	DOC_NONE	0
962	10	\N	t	f	2015-04-08 12:28:21.253935	2016-08-05 22:40:38.69788	12	Property	0	\N	\N	\N	DOC_NONE	0
964	12	\N	t	f	2015-04-08 12:28:23.909265	2016-08-05 22:40:39.175536	12	Property	0	\N	\N	\N	DOC_NONE	0
966	14	\N	t	f	2015-04-08 12:28:26.557248	2016-08-05 22:40:40.150479	12	Property	0	\N	\N	\N	DOC_NONE	0
967	15	\N	t	f	2015-04-08 12:28:27.882959	2016-08-05 22:40:40.656804	12	Property	0	\N	\N	\N	DOC_NONE	0
968	16	\N	t	f	2015-04-08 12:28:29.207254	2016-08-05 22:40:41.146288	12	Property	0	\N	\N	\N	DOC_NONE	0
969	17	\N	t	f	2015-04-08 12:28:30.913637	2016-08-05 22:40:41.624053	12	Property	0	\N	\N	\N	DOC_NONE	0
971	4	\N	t	f	2015-04-08 12:28:35.394313	2016-08-05 22:40:42.604271	13	Property	0	\N	\N	\N	DOC_NONE	0
972	5	\N	t	f	2015-04-08 12:28:36.717551	2016-08-05 22:40:43.08425	13	Property	0	\N	\N	\N	DOC_NONE	0
973	6	\N	t	f	2015-04-08 12:28:38.039554	2016-08-05 22:40:43.56379	13	Property	0	\N	\N	\N	DOC_NONE	0
974	10	\N	t	f	2015-04-08 12:28:41.838754	2016-08-05 22:40:44.039091	13	Property	0	\N	\N	\N	DOC_NONE	0
975	11	\N	t	f	2015-04-08 12:28:43.161845	2016-08-05 22:40:44.528169	13	Property	0	\N	\N	\N	DOC_NONE	0
977	13	\N	t	f	2015-04-08 12:28:45.804889	2016-08-05 22:40:46.319052	13	Property	0	\N	\N	\N	DOC_NONE	0
978	14	\N	t	f	2015-04-08 12:28:47.126436	2016-08-05 22:40:47.927378	13	Property	0	\N	\N	\N	DOC_NONE	0
982	1	\N	t	f	2015-04-08 12:28:52.60383	2016-08-05 22:40:49.877957	15	Property	0	\N	\N	\N	DOC_NONE	0
1454	7	\N	t	t	2015-04-08 12:41:46.999062	2016-08-05 22:40:50.377802	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
984	5	\N	t	f	2015-04-08 12:28:56.914084	2016-08-05 22:40:50.860313	15	Property	0	\N	\N	\N	DOC_NONE	0
985	6	\N	t	f	2015-04-08 12:28:58.236379	2016-08-05 22:40:51.339605	15	Property	0	\N	\N	\N	DOC_NONE	0
986	8	\N	t	f	2015-04-08 12:29:00.489691	2016-08-05 22:40:51.852527	15	Property	0	\N	\N	\N	DOC_NONE	0
1002	15	\N	t	t	2015-04-08 12:29:29.100112	2016-08-05 22:40:52.343927	16	Property	1	\N	\N	\N	DOC_UPLOADED	0
1037	1	\N	t	f	2015-04-08 12:30:18.462877	2016-08-05 22:40:52.829371	19	Property	0	\N	\N	\N	DOC_NONE	0
987	9	\N	t	f	2015-04-08 12:29:01.81314	2016-08-05 22:40:53.3111	15	Property	0	\N	\N	\N	DOC_NONE	0
988	10	\N	t	f	2015-04-08 12:29:03.137004	2016-08-05 22:40:53.796069	15	Property	0	\N	\N	\N	DOC_NONE	0
989	11	\N	t	f	2015-04-08 12:29:04.467892	2016-08-05 22:40:54.294121	15	Property	0	\N	\N	\N	DOC_NONE	0
990	13	\N	t	f	2015-04-08 12:29:06.623429	2016-08-05 22:40:54.770774	15	Property	0	\N	\N	\N	DOC_NONE	0
991	14	\N	t	f	2015-04-08 12:29:07.947492	2016-08-05 22:40:55.271722	15	Property	0	\N	\N	\N	DOC_NONE	0
992	15	\N	t	f	2015-04-08 12:29:09.268062	2016-08-05 22:40:55.793332	15	Property	0	\N	\N	\N	DOC_NONE	0
993	16	\N	t	f	2015-04-08 12:29:10.666513	2016-08-05 22:40:56.285585	15	Property	0	\N	\N	\N	DOC_NONE	0
994	17	\N	t	f	2015-04-08 12:29:11.98838	2016-08-05 22:40:56.771882	15	Property	0	\N	\N	\N	DOC_NONE	0
996	3	\N	t	f	2015-04-08 12:29:15.634658	2016-08-05 22:40:57.780262	16	Property	1	\N	\N	\N	DOC_NONE	0
997	6	\N	t	f	2015-04-08 12:29:18.625379	2016-08-05 22:40:58.256933	16	Property	0	\N	\N	\N	DOC_NONE	0
998	8	\N	t	f	2015-04-08 12:29:20.775827	2016-08-05 22:40:58.732303	16	Property	1	\N	\N	\N	DOC_NONE	0
999	9	\N	t	f	2015-04-08 12:29:22.129117	2016-08-05 22:40:59.208379	16	Property	0	\N	\N	\N	DOC_NONE	0
1000	10	\N	t	f	2015-04-08 12:29:23.472497	2016-08-05 22:40:59.689505	16	Property	0	\N	\N	\N	DOC_NONE	0
1004	1	\N	t	f	2015-04-08 12:29:32.723132	2016-08-05 22:41:00.65203	17	Property	0	\N	\N	\N	DOC_NONE	0
1005	2	\N	t	f	2015-04-08 12:29:34.041512	2016-08-05 22:41:01.498209	17	Property	0	\N	\N	\N	DOC_NONE	0
1006	3	\N	t	f	2015-04-08 12:29:35.361977	2016-08-05 22:41:01.975411	17	Property	0	\N	\N	\N	DOC_NONE	0
1007	4	\N	t	f	2015-04-08 12:29:36.682527	2016-08-05 22:41:02.447177	17	Property	0	\N	\N	\N	DOC_NONE	0
1009	6	\N	t	f	2015-04-08 12:29:39.319555	2016-08-05 22:41:03.508834	17	Property	0	\N	\N	\N	DOC_NONE	0
1010	7	\N	t	f	2015-04-08 12:29:40.63454	2016-08-05 22:41:03.996503	17	Property	0	\N	\N	\N	DOC_NONE	0
1012	9	\N	t	f	2015-04-08 12:29:43.280923	2016-08-05 22:41:04.95721	17	Property	0	\N	\N	\N	DOC_NONE	0
1013	10	\N	t	f	2015-04-08 12:29:44.605771	2016-08-05 22:41:05.44957	17	Property	0	\N	\N	\N	DOC_NONE	0
1014	11	\N	t	f	2015-04-08 12:29:45.925848	2016-08-05 22:41:05.924624	17	Property	0	\N	\N	\N	DOC_NONE	0
1016	13	\N	t	f	2015-04-08 12:29:48.571719	2016-08-05 22:41:06.877485	17	Property	0	\N	\N	\N	DOC_NONE	0
1017	14	\N	t	f	2015-04-08 12:29:49.892179	2016-08-05 22:41:07.353752	17	Property	0	\N	\N	\N	DOC_NONE	0
1018	15	\N	t	f	2015-04-08 12:29:51.247096	2016-08-05 22:41:07.84064	17	Property	0	\N	\N	\N	DOC_NONE	0
1019	16	\N	t	f	2015-04-08 12:29:52.60746	2016-08-05 22:41:08.328494	17	Property	0	\N	\N	\N	DOC_NONE	0
1020	17	\N	t	f	2015-04-08 12:29:53.92702	2016-08-05 22:41:08.807888	17	Property	0	\N	\N	\N	DOC_NONE	0
1022	3	\N	t	f	2015-04-08 12:29:57.587574	2016-08-05 22:41:09.761741	18	Property	0	\N	\N	\N	DOC_NONE	0
1024	5	\N	t	f	2015-04-08 12:30:00.29074	2016-08-05 22:41:10.240736	18	Property	0	\N	\N	\N	DOC_NONE	0
1026	7	\N	t	f	2015-04-08 12:30:02.943813	2016-08-05 22:41:10.71468	18	Property	0	\N	\N	\N	DOC_NONE	0
1027	8	\N	t	f	2015-04-08 12:30:04.267638	2016-08-05 22:41:11.192197	18	Property	0	\N	\N	\N	DOC_NONE	0
1029	10	\N	t	f	2015-04-08 12:30:07.298144	2016-08-05 22:41:12.146913	18	Property	0	\N	\N	\N	DOC_NONE	0
1030	11	\N	t	f	2015-04-08 12:30:08.619355	2016-08-05 22:41:12.618425	18	Property	0	\N	\N	\N	DOC_NONE	0
1031	12	\N	t	f	2015-04-08 12:30:09.935758	2016-08-05 22:41:13.089835	18	Property	0	\N	\N	\N	DOC_NONE	0
1032	13	\N	t	f	2015-04-08 12:30:11.25736	2016-08-05 22:41:13.571332	18	Property	0	\N	\N	\N	DOC_NONE	0
1034	15	\N	t	f	2015-04-08 12:30:13.913441	2016-08-05 22:41:14.582075	18	Property	0	\N	\N	\N	DOC_NONE	0
1035	16	\N	t	f	2015-04-08 12:30:15.245159	2016-08-05 22:41:15.167972	18	Property	0	\N	\N	\N	DOC_NONE	0
1036	17	\N	t	f	2015-04-08 12:30:16.951876	2016-08-05 22:41:15.645784	18	Property	0	\N	\N	\N	DOC_NONE	0
1040	5	\N	t	f	2015-04-08 12:30:23.256949	2016-08-05 22:41:16.505432	19	Property	0	\N	\N	\N	DOC_NONE	0
1041	6	\N	t	f	2015-04-08 12:30:24.581871	2016-08-05 22:41:16.980611	19	Property	0	\N	\N	\N	DOC_NONE	0
1043	8	\N	t	f	2015-04-08 12:30:27.228633	2016-08-05 22:41:17.938493	19	Property	0	\N	\N	\N	DOC_NONE	0
1044	9	\N	t	f	2015-04-08 12:30:28.548295	2016-08-05 22:41:18.414504	19	Property	0	\N	\N	\N	DOC_NONE	0
1045	10	\N	t	f	2015-04-08 12:30:29.869136	2016-08-05 22:41:18.91834	19	Property	0	\N	\N	\N	DOC_NONE	0
1046	11	\N	t	f	2015-04-08 12:30:31.944405	2016-08-05 22:41:19.413319	19	Property	0	\N	\N	\N	DOC_NONE	0
1048	13	\N	t	f	2015-04-08 12:30:34.964525	2016-08-05 22:41:20.436891	19	Property	0	\N	\N	\N	DOC_NONE	0
1049	14	\N	t	f	2015-04-08 12:30:36.291991	2016-08-05 22:41:20.94613	19	Property	0	\N	\N	\N	DOC_NONE	0
1050	15	\N	t	f	2015-04-08 12:30:37.62724	2016-08-05 22:41:21.436139	19	Property	0	\N	\N	\N	DOC_NONE	0
1053	1	\N	t	f	2015-04-08 12:30:41.751098	2016-08-05 22:41:21.929519	20	Property	0	\N	\N	\N	DOC_NONE	0
1054	3	\N	t	f	2015-04-08 12:30:43.905961	2016-08-05 22:41:22.41305	20	Property	0	\N	\N	\N	DOC_NONE	0
1056	5	\N	t	f	2015-04-08 12:30:46.55393	2016-08-05 22:41:23.397616	20	Property	0	\N	\N	\N	DOC_NONE	0
1057	6	\N	t	f	2015-04-08 12:30:47.87316	2016-08-05 22:41:23.883895	20	Property	0	\N	\N	\N	DOC_NONE	0
1058	7	\N	t	f	2015-04-08 12:30:49.203734	2016-08-05 22:41:24.379104	20	Property	0	\N	\N	\N	DOC_NONE	0
1059	8	\N	t	f	2015-04-08 12:30:50.520888	2016-08-05 22:41:24.868227	20	Property	0	\N	\N	\N	DOC_NONE	0
1062	11	\N	t	f	2015-04-08 12:30:54.491248	2016-08-05 22:41:25.835423	20	Property	0	\N	\N	\N	DOC_NONE	0
1063	12	\N	t	f	2015-04-08 12:30:56.185283	2016-08-05 22:41:26.325014	20	Property	0	\N	\N	\N	DOC_NONE	0
1064	13	\N	t	f	2015-04-08 12:30:57.503888	2016-08-05 22:41:26.802746	20	Property	0	\N	\N	\N	DOC_NONE	0
1065	14	\N	t	f	2015-04-08 12:30:58.830434	2016-08-05 22:41:27.288031	20	Property	0	\N	\N	\N	DOC_NONE	0
1067	16	\N	t	f	2015-04-08 12:31:01.515319	2016-08-05 22:41:28.268155	20	Property	0	\N	\N	\N	DOC_NONE	0
1068	17	\N	t	f	2015-04-08 12:31:02.863039	2016-08-05 22:41:28.749284	20	Property	0	\N	\N	\N	DOC_NONE	0
1070	3	\N	t	f	2015-04-08 12:31:06.513919	2016-08-05 22:41:29.224036	21	Property	0	\N	\N	\N	DOC_NONE	0
1071	4	\N	t	f	2015-04-08 12:31:07.838922	2016-08-05 22:41:29.713225	21	Property	0	\N	\N	\N	DOC_NONE	0
1072	5	\N	t	f	2015-04-08 12:31:09.163626	2016-08-05 22:41:30.181875	21	Property	0	\N	\N	\N	DOC_NONE	0
1074	7	\N	t	f	2015-04-08 12:31:11.8044	2016-08-05 22:41:31.496185	21	Property	0	\N	\N	\N	DOC_NONE	0
1075	8	\N	t	f	2015-04-08 12:31:13.140769	2016-08-05 22:41:31.973309	21	Property	0	\N	\N	\N	DOC_NONE	0
1091	11	\N	t	f	2015-04-08 12:31:38.17856	2016-08-05 22:41:32.453647	22	Property	0	\N	\N	\N	DOC_NONE	0
1092	12	\N	t	f	2015-04-08 12:31:39.532393	2016-08-05 22:41:32.923727	22	Property	0	\N	\N	\N	DOC_NONE	0
1094	15	\N	t	f	2015-04-08 12:31:43.030573	2016-08-05 22:41:33.87501	22	Property	0	\N	\N	\N	DOC_NONE	0
1096	1	\N	t	f	2015-04-08 12:31:46.676682	2016-08-05 22:41:34.358865	23	Property	0	\N	\N	\N	DOC_NONE	0
1097	4	\N	t	f	2015-04-08 12:31:49.642547	2016-08-05 22:41:34.84251	23	Property	0	\N	\N	\N	DOC_NONE	0
1098	5	\N	t	f	2015-04-08 12:31:50.966162	2016-08-05 22:41:35.34692	23	Property	0	\N	\N	\N	DOC_NONE	0
1099	6	\N	t	f	2015-04-08 12:31:52.295735	2016-08-05 22:41:35.849499	23	Property	0	\N	\N	\N	DOC_NONE	0
1101	8	\N	t	f	2015-04-08 12:31:54.958383	2016-08-05 22:41:36.822827	23	Property	0	\N	\N	\N	DOC_NONE	0
1102	9	\N	t	f	2015-04-08 12:31:56.300255	2016-08-05 22:41:37.307824	23	Property	0	\N	\N	\N	DOC_NONE	0
1103	10	\N	t	f	2015-04-08 12:31:57.643746	2016-08-05 22:41:37.800792	23	Property	0	\N	\N	\N	DOC_NONE	0
1104	11	\N	t	f	2015-04-08 12:31:58.977546	2016-08-05 22:41:38.299127	23	Property	0	\N	\N	\N	DOC_NONE	0
1106	13	\N	t	f	2015-04-08 12:32:01.690456	2016-08-05 22:41:39.668905	23	Property	0	\N	\N	\N	DOC_NONE	0
1492	11	\N	t	f	2015-04-08 12:42:42.661875	2016-08-05 22:41:40.194075	56	Property	0	\N	\N	\N	DOC_NONE	0
1493	12	\N	t	f	2015-04-08 12:42:44.141837	2016-08-05 22:41:40.773356	56	Property	0	\N	\N	\N	DOC_NONE	0
1494	13	\N	t	f	2015-04-08 12:42:45.475967	2016-08-05 22:41:41.266405	56	Property	0	\N	\N	\N	DOC_NONE	0
1496	15	\N	t	f	2015-04-08 12:42:48.150039	2016-08-05 22:41:42.26276	56	Property	0	\N	\N	\N	DOC_NONE	0
1498	17	\N	t	f	2015-04-08 12:42:50.828147	2016-08-05 22:41:42.766076	56	Property	0	\N	\N	\N	DOC_NONE	0
1109	16	\N	t	f	2015-04-08 12:32:05.664079	2016-08-05 22:41:43.296664	23	Property	0	\N	\N	\N	DOC_NONE	0
1110	17	\N	t	f	2015-04-08 12:32:06.986128	2016-08-05 22:41:43.774763	23	Property	0	\N	\N	\N	DOC_NONE	0
1111	1	\N	t	f	2015-04-08 12:32:08.469532	2016-08-05 22:41:44.276068	24	Property	0	\N	\N	\N	DOC_NONE	0
1114	5	\N	t	f	2015-04-08 12:32:13.257364	2016-08-05 22:41:45.28273	24	Property	0	\N	\N	\N	DOC_NONE	0
1115	6	\N	t	f	2015-04-08 12:32:14.576418	2016-08-05 22:41:46.22677	24	Property	0	\N	\N	\N	DOC_NONE	0
1116	7	\N	t	f	2015-04-08 12:32:15.898163	2016-08-05 22:41:46.727648	24	Property	0	\N	\N	\N	DOC_NONE	0
1117	8	\N	t	f	2015-04-08 12:32:17.218946	2016-08-05 22:41:47.218274	24	Property	0	\N	\N	\N	DOC_NONE	0
1119	10	\N	t	f	2015-04-08 12:32:19.87989	2016-08-05 22:41:48.606379	24	Property	0	\N	\N	\N	DOC_NONE	0
1120	11	\N	t	f	2015-04-08 12:32:21.199545	2016-08-05 22:41:49.224581	24	Property	0	\N	\N	\N	DOC_NONE	0
1122	13	\N	t	f	2015-04-08 12:32:23.846582	2016-08-05 22:41:51.04107	24	Property	0	\N	\N	\N	DOC_NONE	0
1123	14	\N	t	f	2015-04-08 12:32:25.167825	2016-08-05 22:41:51.781703	24	Property	0	\N	\N	\N	DOC_NONE	0
1124	15	\N	t	f	2015-04-08 12:32:26.484922	2016-08-05 22:41:52.664489	24	Property	0	\N	\N	\N	DOC_NONE	0
1126	17	\N	t	f	2015-04-08 12:32:29.221427	2016-08-05 22:41:53.680434	24	Property	0	\N	\N	\N	DOC_NONE	0
1127	1	\N	t	f	2015-04-08 12:32:30.704173	2016-08-05 22:41:54.226107	25	Property	0	\N	\N	\N	DOC_NONE	0
1128	4	\N	t	f	2015-04-08 12:32:33.68776	2016-08-05 22:41:55.111726	25	Property	0	\N	\N	\N	DOC_NONE	0
1129	5	\N	t	f	2015-04-08 12:32:35.013331	2016-08-05 22:41:55.658286	25	Property	0	\N	\N	\N	DOC_NONE	0
1130	6	\N	t	f	2015-04-08 12:32:36.353915	2016-08-05 22:41:56.408212	25	Property	0	\N	\N	\N	DOC_NONE	0
1132	8	\N	t	f	2015-04-08 12:32:39.752869	2016-08-05 22:41:58.207871	25	Property	0	\N	\N	\N	DOC_NONE	0
1133	9	\N	t	f	2015-04-08 12:32:41.07933	2016-08-05 22:41:59.304315	25	Property	0	\N	\N	\N	DOC_NONE	0
1134	10	\N	t	f	2015-04-08 12:32:42.400195	2016-08-05 22:42:00.143295	25	Property	0	\N	\N	\N	DOC_NONE	0
1135	11	\N	t	f	2015-04-08 12:32:43.729448	2016-08-05 22:42:02.49186	25	Property	0	\N	\N	\N	DOC_NONE	0
1138	14	\N	t	f	2015-04-08 12:32:47.688025	2016-08-05 22:42:04.659491	25	Property	0	\N	\N	\N	DOC_NONE	0
1139	15	\N	t	f	2015-04-08 12:32:49.382594	2016-08-05 22:42:05.749555	25	Property	0	\N	\N	\N	DOC_NONE	0
1140	16	\N	t	f	2015-04-08 12:32:51.078724	2016-08-05 22:42:06.707822	25	Property	0	\N	\N	\N	DOC_NONE	0
1141	17	\N	t	f	2015-04-08 12:32:52.405048	2016-08-05 22:42:07.241678	25	Property	0	\N	\N	\N	DOC_NONE	0
1143	4	\N	t	f	2015-04-08 12:32:56.859169	2016-08-05 22:42:08.658099	27	Property	0	\N	\N	\N	DOC_NONE	0
1144	5	\N	t	f	2015-04-08 12:32:58.178817	2016-08-05 22:42:09.151312	27	Property	0	\N	\N	\N	DOC_NONE	0
1145	6	\N	t	f	2015-04-08 12:32:59.501486	2016-08-05 22:42:09.665538	27	Property	0	\N	\N	\N	DOC_NONE	0
1497	16	\N	t	t	2015-04-08 12:42:49.501277	2016-08-05 22:42:10.162172	56	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1088	8	\N	t	f	2015-04-08 12:31:34.19656	2016-08-05 22:42:10.654625	22	Property	0	\N	\N	\N	DOC_NONE	0
1249	11	\N	t	f	2015-04-08 12:35:55.767498	2016-08-05 22:42:11.648508	35	Property	0	\N	\N	\N	DOC_NONE	0
1250	12	\N	t	f	2015-04-08 12:35:57.083014	2016-08-05 22:42:12.135145	35	Property	0	\N	\N	\N	DOC_NONE	0
1251	13	\N	t	f	2015-04-08 12:35:58.398521	2016-08-05 22:42:12.629487	35	Property	0	\N	\N	\N	DOC_NONE	0
1252	14	\N	t	f	2015-04-08 12:35:59.71384	2016-08-05 22:42:13.773419	35	Property	0	\N	\N	\N	DOC_NONE	0
1254	16	\N	t	f	2015-04-08 12:36:02.480273	2016-08-05 22:42:16.575081	35	Property	0	\N	\N	\N	DOC_NONE	0
1255	17	\N	t	f	2015-04-08 12:36:03.807325	2016-08-05 22:42:17.133837	35	Property	0	\N	\N	\N	DOC_NONE	0
1256	1	\N	t	f	2015-04-08 12:36:05.302654	2016-08-05 22:42:17.653776	36	Property	0	\N	\N	\N	DOC_NONE	0
1257	6	\N	t	f	2015-04-08 12:36:09.921351	2016-08-05 22:42:18.289623	36	Property	0	\N	\N	\N	DOC_NONE	0
1258	9	\N	t	f	2015-04-08 12:36:12.893006	2016-08-05 22:42:20.209304	36	Property	0	\N	\N	\N	DOC_NONE	0
1260	11	\N	t	f	2015-04-08 12:36:15.527675	2016-08-05 22:42:21.172588	36	Property	0	\N	\N	\N	DOC_NONE	0
1261	16	\N	t	f	2015-04-08 12:36:20.547847	2016-08-05 22:42:21.657082	36	Property	0	\N	\N	\N	DOC_NONE	0
1262	17	\N	t	f	2015-04-08 12:36:21.876464	2016-08-05 22:42:22.153423	36	Property	0	\N	\N	\N	DOC_NONE	0
1263	1	\N	t	f	2015-04-08 12:36:23.36463	2016-08-05 22:42:22.680601	37	Property	0	\N	\N	\N	DOC_NONE	0
1500	5	\N	t	f	2015-04-08 12:42:56.17569	2016-08-05 22:42:23.663775	57	Property	0	\N	\N	\N	DOC_NONE	0
1501	6	\N	t	f	2015-04-08 12:42:57.552775	2016-08-05 22:42:24.178676	57	Property	0	\N	\N	\N	DOC_NONE	0
1503	8	\N	t	f	2015-04-08 12:43:00.227866	2016-08-05 22:42:24.664053	57	Property	0	\N	\N	\N	DOC_NONE	0
1504	9	\N	t	f	2015-04-08 12:43:01.621319	2016-08-05 22:42:25.150473	57	Property	0	\N	\N	\N	DOC_NONE	0
1506	11	\N	t	f	2015-04-08 12:43:04.726879	2016-08-05 22:42:26.158458	57	Property	0	\N	\N	\N	DOC_NONE	0
1507	12	\N	t	f	2015-04-08 12:43:06.462311	2016-08-05 22:42:26.654159	57	Property	0	\N	\N	\N	DOC_NONE	0
1508	13	\N	t	f	2015-04-08 12:43:07.786012	2016-08-05 22:42:27.146551	57	Property	0	\N	\N	\N	DOC_NONE	0
1509	14	\N	t	f	2015-04-08 12:43:09.120412	2016-08-05 22:42:27.624849	57	Property	0	\N	\N	\N	DOC_NONE	0
1510	15	\N	t	f	2015-04-08 12:43:10.446673	2016-08-05 22:42:28.146022	57	Property	0	\N	\N	\N	DOC_NONE	0
1513	1	\N	t	t	2015-04-08 12:43:14.631036	2016-08-05 22:42:29.116171	58	Property	1	\N	\N	\N	DOC_UPLOADED	0
1514	4	\N	t	f	2015-04-08 12:43:18.899906	2016-08-05 22:42:29.596497	58	Property	0	\N	\N	\N	DOC_NONE	0
1515	5	\N	t	f	2015-04-08 12:43:20.222803	2016-08-05 22:42:30.073309	58	Property	0	\N	\N	\N	DOC_NONE	0
1516	6	\N	t	f	2015-04-08 12:43:21.557518	2016-08-05 22:42:30.576451	58	Property	0	\N	\N	\N	DOC_NONE	0
1267	9	\N	t	f	2015-04-08 12:36:31.931196	2016-08-05 22:42:31.884323	37	Property	0	\N	\N	\N	DOC_NONE	0
1268	10	\N	t	f	2015-04-08 12:36:33.249628	2016-08-05 22:42:32.564595	37	Property	0	\N	\N	\N	DOC_NONE	0
1270	17	\N	t	f	2015-04-08 12:36:40.050169	2016-08-05 22:42:33.041339	37	Property	0	\N	\N	\N	DOC_NONE	0
1271	1	\N	t	f	2015-04-08 12:36:41.538713	2016-08-05 22:42:33.527522	38	Property	0	\N	\N	\N	DOC_NONE	0
1272	2	\N	t	f	2015-04-08 12:36:42.862962	2016-08-05 22:42:34.00431	38	Property	0	\N	\N	\N	DOC_NONE	0
1275	5	\N	t	f	2015-04-08 12:36:46.828983	2016-08-05 22:42:35.12317	38	Property	0	\N	\N	\N	DOC_NONE	0
1276	6	\N	t	f	2015-04-08 12:36:48.149582	2016-08-05 22:42:35.606399	38	Property	0	\N	\N	\N	DOC_NONE	0
1277	7	\N	t	f	2015-04-08 12:36:49.478769	2016-08-05 22:42:36.080346	38	Property	0	\N	\N	\N	DOC_NONE	0
1278	8	\N	t	f	2015-04-08 12:36:50.796813	2016-08-05 22:42:36.567628	38	Property	0	\N	\N	\N	DOC_NONE	0
1280	10	\N	t	f	2015-04-08 12:36:53.439412	2016-08-05 22:42:37.519046	38	Property	0	\N	\N	\N	DOC_NONE	0
1281	11	\N	t	f	2015-04-08 12:36:54.756593	2016-08-05 22:42:38.01578	38	Property	0	\N	\N	\N	DOC_NONE	0
1282	12	\N	t	f	2015-04-08 12:36:56.07294	2016-08-05 22:42:38.502265	38	Property	0	\N	\N	\N	DOC_NONE	0
1283	13	\N	t	f	2015-04-08 12:36:57.397361	2016-08-05 22:42:39.027413	38	Property	0	\N	\N	\N	DOC_NONE	0
1285	15	\N	t	f	2015-04-08 12:37:00.034653	2016-08-05 22:42:40.105862	38	Property	0	\N	\N	\N	DOC_NONE	0
1286	16	\N	t	f	2015-04-08 12:37:01.372438	2016-08-05 22:42:40.672498	38	Property	0	\N	\N	\N	DOC_NONE	0
1287	17	\N	t	f	2015-04-08 12:37:02.685983	2016-08-05 22:42:41.169651	38	Property	0	\N	\N	\N	DOC_NONE	0
1288	1	\N	t	f	2015-04-08 12:37:04.17326	2016-08-05 22:42:41.859303	40	Property	0	\N	\N	\N	DOC_NONE	0
1289	4	\N	t	f	2015-04-08 12:37:07.146633	2016-08-05 22:42:42.511922	40	Property	0	\N	\N	\N	DOC_NONE	0
1291	6	\N	t	f	2015-04-08 12:37:09.788018	2016-08-05 22:42:43.624247	40	Property	0	\N	\N	\N	DOC_NONE	0
1292	8	\N	t	f	2015-04-08 12:37:11.932099	2016-08-05 22:42:44.10874	40	Property	0	\N	\N	\N	DOC_NONE	0
1293	9	\N	t	f	2015-04-08 12:37:13.255481	2016-08-05 22:42:44.59474	40	Property	0	\N	\N	\N	DOC_NONE	0
1294	10	\N	t	f	2015-04-08 12:37:14.940479	2016-08-05 22:42:45.075299	40	Property	0	\N	\N	\N	DOC_NONE	0
1297	17	\N	t	f	2015-04-08 12:37:22.195863	2016-08-05 22:42:46.389418	40	Property	0	\N	\N	\N	DOC_NONE	0
1298	1	\N	t	f	2015-04-08 12:37:23.696754	2016-08-05 22:42:46.86626	41	Property	0	\N	\N	\N	DOC_NONE	0
1300	3	\N	t	f	2015-04-08 12:37:26.728181	2016-08-05 22:42:47.927153	41	Property	0	\N	\N	\N	DOC_NONE	0
1301	4	\N	t	f	2015-04-08 12:37:28.062704	2016-08-05 22:42:48.400888	41	Property	0	\N	\N	\N	DOC_NONE	0
1302	5	\N	t	f	2015-04-08 12:37:29.385456	2016-08-05 22:42:48.872102	41	Property	0	\N	\N	\N	DOC_NONE	0
1304	7	\N	t	f	2015-04-08 12:37:32.050781	2016-08-05 22:42:49.830561	41	Property	0	\N	\N	\N	DOC_NONE	0
1305	8	\N	t	f	2015-04-08 12:37:33.372123	2016-08-05 22:42:50.309751	41	Property	0	\N	\N	\N	DOC_NONE	0
1306	9	\N	t	f	2015-04-08 12:37:34.689214	2016-08-05 22:42:50.790443	41	Property	0	\N	\N	\N	DOC_NONE	0
1307	10	\N	t	f	2015-04-08 12:37:36.005426	2016-08-05 22:42:51.268354	41	Property	0	\N	\N	\N	DOC_NONE	0
1308	11	\N	t	f	2015-04-08 12:37:37.692677	2016-08-05 22:42:52.107596	41	Property	0	\N	\N	\N	DOC_NONE	0
1310	13	\N	t	f	2015-04-08 12:37:40.328537	2016-08-05 22:42:53.078061	41	Property	0	\N	\N	\N	DOC_NONE	0
1311	14	\N	t	f	2015-04-08 12:37:41.642956	2016-08-05 22:42:53.558073	41	Property	0	\N	\N	\N	DOC_NONE	0
1312	15	\N	t	f	2015-04-08 12:37:43.333971	2016-08-05 22:42:54.051612	41	Property	0	\N	\N	\N	DOC_NONE	0
1313	16	\N	t	f	2015-04-08 12:37:44.647879	2016-08-05 22:42:54.527996	41	Property	0	\N	\N	\N	DOC_NONE	0
1315	1	\N	t	f	2015-04-08 12:37:47.449135	2016-08-05 22:42:55.513844	42	Property	0	\N	\N	\N	DOC_NONE	0
1316	4	\N	t	f	2015-04-08 12:37:50.414636	2016-08-05 22:42:56.030202	42	Property	0	\N	\N	\N	DOC_NONE	0
1317	5	\N	t	f	2015-04-08 12:37:51.730174	2016-08-05 22:42:56.501953	42	Property	0	\N	\N	\N	DOC_NONE	0
1318	6	\N	t	f	2015-04-08 12:37:53.046078	2016-08-05 22:42:57.022125	42	Property	0	\N	\N	\N	DOC_NONE	0
1323	5	\N	t	f	2015-04-08 12:38:09.770101	2016-08-05 22:42:57.975182	43	Property	0	\N	\N	\N	DOC_NONE	0
1324	8	\N	t	f	2015-04-08 12:38:12.785579	2016-08-05 22:42:58.450147	43	Property	0	\N	\N	\N	DOC_NONE	0
1325	9	\N	t	f	2015-04-08 12:38:14.150107	2016-08-05 22:42:58.925073	43	Property	0	\N	\N	\N	DOC_NONE	0
1326	12	\N	t	f	2015-04-08 12:38:17.208226	2016-08-05 22:42:59.40059	43	Property	0	\N	\N	\N	DOC_NONE	0
1327	13	\N	t	f	2015-04-08 12:38:18.537466	2016-08-05 22:42:59.875399	43	Property	0	\N	\N	\N	DOC_NONE	0
1329	17	\N	t	f	2015-04-08 12:38:22.869646	2016-08-05 22:43:01.198509	43	Property	0	\N	\N	\N	DOC_NONE	0
1330	2	\N	t	f	2015-04-08 12:38:25.173978	2016-08-05 22:43:01.675437	44	Property	0	\N	\N	\N	DOC_NONE	0
1331	3	\N	t	f	2015-04-08 12:38:26.497047	2016-08-05 22:43:02.176872	44	Property	0	\N	\N	\N	DOC_NONE	0
1332	4	\N	t	f	2015-04-08 12:38:27.818513	2016-08-05 22:43:02.650062	44	Property	0	\N	\N	\N	DOC_NONE	0
1334	6	\N	t	f	2015-04-08 12:38:30.478278	2016-08-05 22:43:03.668234	44	Property	0	\N	\N	\N	DOC_NONE	0
1335	7	\N	t	f	2015-04-08 12:38:31.820713	2016-08-05 22:43:04.148174	44	Property	0	\N	\N	\N	DOC_NONE	0
1336	8	\N	t	f	2015-04-08 12:38:33.170395	2016-08-05 22:43:04.634192	44	Property	0	\N	\N	\N	DOC_NONE	0
1337	9	\N	t	f	2015-04-08 12:38:34.505735	2016-08-05 22:43:05.103169	44	Property	0	\N	\N	\N	DOC_NONE	0
1339	11	\N	t	f	2015-04-08 12:38:37.197044	2016-08-05 22:43:05.60215	44	Property	0	\N	\N	\N	DOC_NONE	0
1341	13	\N	t	f	2015-04-08 12:38:39.831685	2016-08-05 22:43:06.576963	44	Property	0	\N	\N	\N	DOC_NONE	0
1342	14	\N	t	f	2015-04-08 12:38:41.541635	2016-08-05 22:43:07.102693	44	Property	0	\N	\N	\N	DOC_NONE	0
1343	15	\N	t	f	2015-04-08 12:38:42.863201	2016-08-05 22:43:07.904324	44	Property	0	\N	\N	\N	DOC_NONE	0
1344	16	\N	t	f	2015-04-08 12:38:44.195721	2016-08-05 22:43:08.379124	44	Property	0	\N	\N	\N	DOC_NONE	0
1346	1	\N	t	f	2015-04-08 12:38:47.017989	2016-08-05 22:43:09.334692	45	Property	0	\N	\N	\N	DOC_NONE	0
1347	5	\N	t	f	2015-04-08 12:38:50.907409	2016-08-05 22:43:09.835864	45	Property	0	\N	\N	\N	DOC_NONE	0
1348	6	\N	t	f	2015-04-08 12:38:52.2426	2016-08-05 22:43:10.40743	45	Property	0	\N	\N	\N	DOC_NONE	0
1350	9	\N	t	f	2015-04-08 12:38:55.740688	2016-08-05 22:43:11.426125	45	Property	0	\N	\N	\N	DOC_NONE	0
1368	17	\N	t	t	2015-04-08 12:39:26.251252	2016-08-05 22:43:12.915173	46	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1353	2	\N	t	f	2015-04-08 12:39:05.807686	2016-08-05 22:43:13.422031	46	Property	0	\N	\N	\N	DOC_NONE	0
1354	3	\N	t	f	2015-04-08 12:39:07.133926	2016-08-05 22:43:13.936087	46	Property	0	\N	\N	\N	DOC_NONE	0
1355	4	\N	t	f	2015-04-08 12:39:08.459487	2016-08-05 22:43:14.418088	46	Property	0	\N	\N	\N	DOC_NONE	0
1356	5	\N	t	f	2015-04-08 12:39:09.777026	2016-08-05 22:43:14.952767	46	Property	0	\N	\N	\N	DOC_NONE	0
1358	7	\N	t	f	2015-04-08 12:39:12.428029	2016-08-05 22:43:16.332573	46	Property	0	\N	\N	\N	DOC_NONE	0
1359	8	\N	t	f	2015-04-08 12:39:13.767572	2016-08-05 22:43:16.829742	46	Property	0	\N	\N	\N	DOC_NONE	0
1360	9	\N	t	f	2015-04-08 12:39:15.084774	2016-08-05 22:43:17.311157	46	Property	0	\N	\N	\N	DOC_NONE	0
1362	11	\N	t	f	2015-04-08 12:39:17.922917	2016-08-05 22:43:17.783866	46	Property	0	\N	\N	\N	DOC_NONE	0
1367	16	\N	t	f	2015-04-08 12:39:24.930874	2016-08-05 22:43:20.643466	46	Property	0	\N	\N	\N	DOC_NONE	0
70	2	\N	t	f	2015-03-28 10:36:04.57393	2016-08-05 22:43:21.768879	199	Property	0	\N	\N	\N	DOC_NONE	0
1369	1	\N	t	f	2015-04-08 12:39:27.74516	2016-08-05 22:43:22.690264	47	Property	0	\N	\N	\N	DOC_NONE	0
1370	2	\N	t	f	2015-04-08 12:39:29.064783	2016-08-05 22:43:23.614834	47	Property	0	\N	\N	\N	DOC_NONE	0
1371	3	\N	t	f	2015-04-08 12:39:30.385877	2016-08-05 22:43:24.328788	47	Property	0	\N	\N	\N	DOC_NONE	0
1372	4	\N	t	f	2015-04-08 12:39:31.702821	2016-08-05 22:43:25.354047	47	Property	0	\N	\N	\N	DOC_NONE	0
1373	5	\N	t	f	2015-04-08 12:39:33.041525	2016-08-05 22:43:25.985878	47	Property	0	\N	\N	\N	DOC_NONE	0
1374	6	\N	t	f	2015-04-08 12:39:34.371981	2016-08-05 22:43:26.650016	47	Property	0	\N	\N	\N	DOC_NONE	0
1375	7	\N	t	f	2015-04-08 12:39:35.693105	2016-08-05 22:43:27.186378	47	Property	0	\N	\N	\N	DOC_NONE	0
1376	8	\N	t	f	2015-04-08 12:39:37.013334	2016-08-05 22:43:27.877153	47	Property	0	\N	\N	\N	DOC_NONE	0
1377	9	\N	t	f	2015-04-08 12:39:38.705055	2016-08-05 22:43:28.40645	47	Property	0	\N	\N	\N	DOC_NONE	0
1378	10	\N	t	f	2015-04-08 12:39:40.025899	2016-08-05 22:43:28.904407	47	Property	0	\N	\N	\N	DOC_NONE	0
1379	11	\N	t	f	2015-04-08 12:39:41.351146	2016-08-05 22:43:29.425801	47	Property	0	\N	\N	\N	DOC_NONE	0
1380	12	\N	t	f	2015-04-08 12:39:43.061391	2016-08-05 22:43:29.92687	47	Property	0	\N	\N	\N	DOC_NONE	0
1381	13	\N	t	f	2015-04-08 12:39:44.380637	2016-08-05 22:43:30.410248	47	Property	0	\N	\N	\N	DOC_NONE	0
1382	14	\N	t	f	2015-04-08 12:39:45.712414	2016-08-05 22:43:31.26403	47	Property	0	\N	\N	\N	DOC_NONE	0
1383	15	\N	t	f	2015-04-08 12:39:47.047831	2016-08-05 22:43:31.737671	47	Property	0	\N	\N	\N	DOC_NONE	0
1385	17	\N	t	f	2015-04-08 12:39:49.716506	2016-08-05 22:43:32.212349	47	Property	0	\N	\N	\N	DOC_NONE	0
1387	2	\N	t	f	2015-04-08 12:39:52.545344	2016-08-05 22:43:33.187301	48	Property	0	\N	\N	\N	DOC_NONE	0
1389	4	\N	t	f	2015-04-08 12:39:55.193142	2016-08-05 22:43:33.659648	48	Property	0	\N	\N	\N	DOC_NONE	0
1390	5	\N	t	f	2015-04-08 12:39:56.524402	2016-08-05 22:43:34.141073	48	Property	0	\N	\N	\N	DOC_NONE	0
1391	6	\N	t	f	2015-04-08 12:39:57.856673	2016-08-05 22:43:34.661103	48	Property	0	\N	\N	\N	DOC_NONE	0
2	2	\N	t	f	2015-03-23 22:00:48.417324	2016-08-05 22:43:35.646524	1	Property	0	\N	\N	\N	DOC_NONE	0
52	1	\N	t	t	2015-03-28 10:35:37.78507	2016-08-05 22:43:36.158858	44	Property	0	\N	\N	\N	DOC_AVAILABLE	0
55	1	\N	t	t	2015-03-28 10:35:41.018954	2016-08-05 22:43:37.136619	237	Property	0	\N	\N	\N	DOC_AVAILABLE	0
61	1	\N	t	t	2015-03-28 10:35:46.453484	2016-08-05 22:43:37.625583	6	Property	0	\N	\N	\N	DOC_AVAILABLE	0
64	7	\N	t	t	2015-03-28 10:35:49.777294	2016-08-05 22:43:38.11518	119	Property	0	\N	\N	\N	DOC_AVAILABLE	0
66	2	\N	t	t	2015-03-28 10:35:52.421638	2016-08-05 22:43:39.08908	243	Property	0	\N	\N	\N	DOC_AVAILABLE	0
68	2	\N	t	t	2015-03-28 10:35:55.04799	2016-08-05 22:43:39.578336	110	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1349	8	\N	t	t	2015-04-08 12:38:54.4181	2016-08-05 22:43:40.059108	45	Property	0	\N	\N	\N	DOC_AVAILABLE	0
71	2	\N	t	t	2015-03-28 10:36:07.519432	2016-08-05 22:43:40.535758	83	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1352	17	\N	t	t	2015-04-08 12:39:03.432155	2016-08-05 22:43:41.01249	45	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1328	14	\N	t	t	2015-04-08 12:38:19.854153	2016-08-05 22:43:42.018433	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
104	2	\N	t	f	2015-03-28 10:36:42.644645	2016-08-05 22:43:42.49767	157	Property	0	\N	\N	\N	DOC_NONE	0
83	2	\N	t	t	2015-03-28 10:36:20.752351	2016-08-05 22:43:42.976586	58	Property	0	\N	\N	\N	DOC_AVAILABLE	0
163	8	\N	t	t	2015-03-28 10:37:34.71361	2016-08-05 22:43:43.447026	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
87	1	\N	t	t	2015-03-28 10:36:24.722521	2016-08-05 22:43:44.41175	60	Property	0	\N	\N	\N	DOC_AVAILABLE	0
88	3	\N	t	t	2015-03-28 10:36:26.024863	2016-08-05 22:43:44.888701	62	Property	0	\N	\N	\N	DOC_AVAILABLE	0
14	2	\N	t	t	2015-03-28 10:34:54.857677	2016-08-05 22:43:45.365927	20	Property	0	\N	\N	\N	DOC_AVAILABLE	0
17	2	\N	t	t	2015-03-28 10:34:58.249104	2016-08-05 22:43:46.243279	22	Property	0	\N	\N	\N	DOC_AVAILABLE	0
27	2	\N	t	t	2015-03-28 10:35:12.67958	2016-08-05 22:43:47.202825	26	Property	0	\N	\N	\N	DOC_AVAILABLE	0
31	8	\N	t	t	2015-03-28 10:35:16.043344	2016-08-05 22:43:47.691546	27	Property	0	\N	\N	\N	DOC_AVAILABLE	0
30	3	\N	t	t	2015-03-28 10:35:15.358921	2016-08-05 22:43:48.160777	27	Property	0	\N	\N	\N	DOC_AVAILABLE	0
35	14	\N	t	t	2015-03-28 10:35:19.277933	2016-08-05 22:43:48.642846	28	Property	0	\N	\N	\N	DOC_AVAILABLE	0
34	9	\N	t	t	2015-03-28 10:35:18.634731	2016-08-05 22:43:49.118023	28	Property	0	\N	\N	\N	DOC_AVAILABLE	0
37	1	\N	t	t	2015-03-28 10:35:21.873396	2016-08-05 22:43:50.561927	132	Property	0	\N	\N	\N	DOC_AVAILABLE	0
38	1	\N	t	t	2015-03-28 10:35:23.221313	2016-08-05 22:43:51.043041	133	Property	0	\N	\N	\N	DOC_AVAILABLE	0
84	3	\N	t	t	2015-03-28 10:36:21.426429	2016-08-05 22:43:51.524631	58	Property	1	\N	\N	\N	DOC_UPLOADED	0
41	3	\N	t	t	2015-03-28 10:35:26.594322	2016-08-05 22:43:52.005729	92	Property	0	\N	\N	\N	DOC_AVAILABLE	0
40	2	\N	t	t	2015-03-28 10:35:25.912439	2016-08-05 22:43:52.493722	92	Property	0	\N	\N	\N	DOC_AVAILABLE	0
44	3	\N	t	t	2015-03-28 10:35:29.215401	2016-08-05 22:43:52.975867	94	Property	0	\N	\N	\N	DOC_AVAILABLE	0
48	8	\N	t	t	2015-03-28 10:35:32.475431	2016-08-05 22:43:53.459473	95	Property	0	\N	\N	\N	DOC_AVAILABLE	0
47	3	\N	t	t	2015-03-28 10:35:31.806081	2016-08-05 22:43:53.933897	95	Property	0	\N	\N	\N	DOC_AVAILABLE	0
60	5	\N	t	t	2015-03-28 10:35:44.99781	2016-08-05 22:43:54.410734	125	Property	0	\N	\N	\N	DOC_AVAILABLE	0
101	13	\N	t	f	2015-03-28 10:36:39.341011	2016-08-05 22:43:55.363476	251	Property	0	\N	\N	\N	DOC_NONE	0
69	3	\N	t	t	2015-03-28 10:35:56.594025	2016-08-05 22:43:55.846794	110	Property	0	\N	\N	\N	DOC_AVAILABLE	0
80	1	\N	t	t	2015-03-28 10:36:17.430448	2016-08-05 22:43:56.332797	46	Property	0	\N	\N	\N	DOC_AVAILABLE	0
161	6	\N	t	f	2015-03-28 10:37:33.384937	2016-08-05 22:43:56.823108	174	Property	0	\N	\N	\N	DOC_NONE	0
93	3	\N	t	t	2015-03-28 10:36:30.627694	2016-08-05 22:43:57.771757	11	Property	0	\N	\N	\N	DOC_AVAILABLE	0
94	2	\N	t	t	2015-03-28 10:36:32.064772	2016-08-05 22:43:58.255368	137	Property	0	\N	\N	\N	DOC_AVAILABLE	0
95	3	\N	t	t	2015-03-28 10:36:32.726581	2016-08-05 22:43:58.739284	137	Property	0	\N	\N	\N	DOC_AVAILABLE	0
96	1	\N	t	t	2015-03-28 10:36:34.028486	2016-08-05 22:43:59.2225	244	Property	0	\N	\N	\N	DOC_AVAILABLE	0
78	2	\N	t	f	2015-03-28 10:36:15.439887	2016-08-05 22:44:00.183693	127	Property	0	\N	\N	\N	DOC_NONE	0
100	3	\N	t	t	2015-03-28 10:36:38.687886	2016-08-05 22:44:00.654675	251	Property	0	\N	\N	\N	DOC_AVAILABLE	0
102	2	\N	t	t	2015-03-28 10:36:40.64445	2016-08-05 22:44:01.62381	39	Property	0	\N	\N	\N	DOC_AVAILABLE	0
103	3	\N	t	t	2015-03-28 10:36:41.313677	2016-08-05 22:44:02.181605	39	Property	0	\N	\N	\N	DOC_AVAILABLE	0
106	1	\N	t	f	2015-03-28 10:36:44.570619	2016-08-05 22:44:02.655949	121	Property	0	\N	\N	\N	DOC_NONE	0
245	12	\N	t	f	2015-03-28 10:38:35.413112	2016-08-05 22:44:03.666738	5	Property	0	\N	\N	\N	DOC_NONE	0
108	3	\N	t	t	2015-03-28 10:36:46.556361	2016-08-05 22:44:04.162847	33	Property	0	\N	\N	\N	DOC_AVAILABLE	0
110	7	\N	t	t	2015-03-28 10:36:49.342388	2016-08-05 22:44:04.743624	101	Property	0	\N	\N	\N	DOC_AVAILABLE	0
109	3	\N	t	t	2015-03-28 10:36:48.699292	2016-08-05 22:44:05.241441	101	Property	0	\N	\N	\N	DOC_AVAILABLE	0
115	3	\N	t	t	2015-03-28 10:36:53.300226	2016-08-05 22:44:06.240859	102	Property	0	\N	\N	\N	DOC_AVAILABLE	0
116	2	\N	t	t	2015-03-28 10:36:54.599574	2016-08-05 22:44:06.732118	238	Property	0	\N	\N	\N	DOC_AVAILABLE	0
117	3	\N	t	t	2015-03-28 10:36:55.258384	2016-08-05 22:44:07.235316	238	Property	0	\N	\N	\N	DOC_AVAILABLE	0
67	1	\N	t	f	2015-03-28 10:35:53.724383	2016-08-05 22:44:07.725741	112	Property	0	\N	\N	\N	DOC_NONE	0
119	2	\N	t	t	2015-03-28 10:36:57.871979	2016-08-05 22:44:08.224602	195	Property	0	\N	\N	\N	DOC_AVAILABLE	0
123	2	\N	t	t	2015-03-28 10:37:02.000669	2016-08-05 22:44:09.186028	216	Property	0	\N	\N	\N	DOC_AVAILABLE	0
124	3	\N	t	t	2015-03-28 10:37:02.687869	2016-08-05 22:44:09.663927	216	Property	0	\N	\N	\N	DOC_AVAILABLE	0
125	2	\N	t	t	2015-03-28 10:37:04.006313	2016-08-05 22:44:10.17212	217	Property	0	\N	\N	\N	DOC_AVAILABLE	0
126	3	\N	t	t	2015-03-28 10:37:04.681949	2016-08-05 22:44:10.674237	217	Property	0	\N	\N	\N	DOC_AVAILABLE	0
128	3	\N	t	t	2015-03-28 10:37:06.708987	2016-08-05 22:44:11.65326	218	Property	0	\N	\N	\N	DOC_AVAILABLE	0
129	2	\N	t	t	2015-03-28 10:37:08.016917	2016-08-05 22:44:12.149549	219	Property	0	\N	\N	\N	DOC_AVAILABLE	0
131	2	\N	t	t	2015-03-28 10:37:09.98155	2016-08-05 22:44:12.650782	220	Property	0	\N	\N	\N	DOC_AVAILABLE	0
132	3	\N	t	t	2015-03-28 10:37:10.632706	2016-08-05 22:44:13.15717	220	Property	0	\N	\N	\N	DOC_AVAILABLE	0
134	3	\N	t	t	2015-03-28 10:37:12.597513	2016-08-05 22:44:14.484824	221	Property	0	\N	\N	\N	DOC_AVAILABLE	0
140	13	\N	t	t	2015-03-28 10:37:17.250728	2016-08-05 22:44:14.956494	16	Property	0	\N	\N	\N	DOC_AVAILABLE	0
156	13	\N	t	t	2015-03-28 10:37:29.472483	2016-08-05 22:44:16.920648	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
155	11	\N	t	t	2015-03-28 10:37:28.802549	2016-08-05 22:44:17.394413	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
153	8	\N	t	t	2015-03-28 10:37:27.468617	2016-08-05 22:44:17.864732	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
160	2	\N	t	t	2015-03-28 10:37:32.722785	2016-08-05 22:44:20.180668	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
202	16	\N	t	t	2015-03-28 10:38:03.899128	2016-08-05 22:44:20.699188	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
201	15	\N	t	t	2015-03-28 10:38:03.249675	2016-08-05 22:44:21.187903	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
208	11	\N	t	t	2015-03-28 10:38:08.516477	2016-08-05 22:44:21.982251	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
207	8	\N	t	t	2015-03-28 10:38:07.874304	2016-08-05 22:44:22.483534	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
247	14	\N	t	t	2015-03-28 10:38:36.750748	2016-08-05 22:44:23.461243	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
246	13	\N	t	t	2015-03-28 10:38:36.080197	2016-08-05 22:44:23.967412	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
118	1	\N	t	f	2015-03-28 10:36:56.539052	2016-08-05 22:44:24.508679	205	Property	0	\N	\N	\N	DOC_NONE	0
250	2	\N	t	t	2015-03-28 10:38:39.458501	2016-08-05 22:44:25.548518	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
184	7	\N	t	t	2015-03-28 10:37:50.561731	2016-08-05 22:44:26.05061	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
194	16	\N	t	t	2015-03-28 10:37:57.829067	2016-08-05 22:44:26.564642	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
193	15	\N	t	t	2015-03-28 10:37:57.17404	2016-08-05 22:44:27.055627	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
192	14	\N	t	t	2015-03-28 10:37:56.513026	2016-08-05 22:44:27.542306	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
190	5	\N	t	t	2015-03-28 10:37:55.1434	2016-08-05 22:44:28.528631	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
199	10	\N	t	f	2015-03-28 10:38:01.820813	2016-08-05 22:44:29.002346	43	Property	0	\N	\N	\N	DOC_NONE	0
237	10	\N	t	f	2015-03-28 10:38:29.489984	2016-08-05 22:44:29.480881	85	Property	0	\N	\N	\N	DOC_NONE	0
198	7	\N	t	t	2015-03-28 10:38:01.146791	2016-08-05 22:44:29.96252	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
196	4	\N	t	t	2015-03-28 10:37:59.835461	2016-08-05 22:44:31.322916	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
218	10	\N	t	t	2015-03-28 10:38:15.711271	2016-08-05 22:44:31.804363	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
217	8	\N	t	t	2015-03-28 10:38:15.023192	2016-08-05 22:44:32.278487	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
216	7	\N	t	t	2015-03-28 10:38:14.350871	2016-08-05 22:44:32.77086	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
214	2	\N	t	t	2015-03-28 10:38:13.068242	2016-08-05 22:44:33.735817	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
231	14	\N	t	t	2015-03-28 10:38:24.885015	2016-08-05 22:44:34.21405	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
230	12	\N	t	t	2015-03-28 10:38:24.229097	2016-08-05 22:44:34.694756	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
229	11	\N	t	t	2015-03-28 10:38:23.557551	2016-08-05 22:44:35.193655	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
228	10	\N	t	t	2015-03-28 10:38:22.914323	2016-08-05 22:44:35.680681	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
236	7	\N	t	t	2015-03-28 10:38:28.821894	2016-08-05 22:44:36.734618	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
235	3	\N	t	t	2015-03-28 10:38:28.153795	2016-08-05 22:44:37.215504	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
234	2	\N	t	t	2015-03-28 10:38:27.505893	2016-08-05 22:44:37.712583	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
241	16	\N	t	t	2015-03-28 10:38:32.114285	2016-08-05 22:44:38.208902	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
239	13	\N	t	t	2015-03-28 10:38:30.831444	2016-08-05 22:44:39.168743	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
238	12	\N	t	t	2015-03-28 10:38:30.139837	2016-08-05 22:44:39.652232	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
251	4	\N	t	t	2015-03-28 10:38:40.143413	2016-08-05 22:44:40.133326	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
260	4	\N	t	t	2015-03-28 10:38:46.744081	2016-08-05 22:44:40.614919	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
259	2	\N	t	t	2015-03-28 10:38:46.081702	2016-08-05 22:44:41.102301	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
274	7	\N	t	t	2015-03-28 10:38:56.708624	2016-08-05 22:44:42.06574	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
273	4	\N	t	t	2015-03-28 10:38:56.065232	2016-08-05 22:44:42.549295	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
191	10	\N	t	f	2015-03-28 10:37:55.843165	2016-08-05 22:44:43.028498	106	Property	0	\N	\N	\N	DOC_NONE	0
277	2	\N	t	t	2015-03-28 10:38:59.379891	2016-08-05 22:44:43.549281	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
282	14	\N	t	t	2015-03-28 10:39:02.70282	2016-08-05 22:44:44.522854	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
343	13	\N	t	f	2015-03-28 10:39:46.875052	2016-08-05 22:44:45.013023	200	Property	0	\N	\N	\N	DOC_NONE	0
290	8	\N	t	t	2015-03-28 10:39:08.670664	2016-08-05 22:44:45.500294	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
289	7	\N	t	t	2015-03-28 10:39:08.027411	2016-08-05 22:44:46.412923	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
299	3	\N	t	t	2015-03-28 10:39:15.175961	2016-08-05 22:44:47.358894	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
307	15	\N	t	t	2015-03-28 10:39:20.369781	2016-08-05 22:44:47.841327	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
323	8	\N	t	t	2015-03-28 10:39:32.26241	2016-08-05 22:44:49.285676	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
322	7	\N	t	t	2015-03-28 10:39:31.619401	2016-08-05 22:48:57.997582	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
321	5	\N	t	t	2015-03-28 10:39:30.954739	2016-08-05 22:48:58.007673	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
320	4	\N	t	t	2015-03-28 10:39:30.30465	2016-08-05 22:48:58.015944	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
319	2	\N	t	t	2015-03-28 10:39:29.632895	2016-08-05 22:48:58.026632	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
335	15	\N	t	t	2015-03-28 10:39:40.788364	2016-08-05 22:48:58.031191	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
334	14	\N	t	t	2015-03-28 10:39:40.144766	2016-08-05 22:48:58.036533	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
333	11	\N	t	t	2015-03-28 10:39:39.495116	2016-08-05 22:48:58.042323	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
332	8	\N	t	t	2015-03-28 10:39:38.848144	2016-08-05 22:48:58.046942	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
330	5	\N	t	t	2015-03-28 10:39:37.533831	2016-08-05 22:48:58.051114	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
329	4	\N	t	t	2015-03-28 10:39:36.886817	2016-08-05 22:48:58.05521	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
338	3	\N	t	f	2015-03-28 10:39:43.592451	2016-08-05 22:48:58.059802	200	Property	0	\N	\N	\N	DOC_NONE	0
340	8	\N	t	t	2015-03-28 10:39:44.902694	2016-08-05 22:48:58.069833	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
339	7	\N	t	t	2015-03-28 10:39:44.250807	2016-08-05 22:48:58.0752	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
271	2	\N	t	t	2015-03-28 10:38:54.762242	2016-08-05 22:48:58.079508	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
357	7	\N	t	t	2015-03-28 10:39:57.466775	2016-08-05 22:48:58.107072	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
355	4	\N	t	t	2015-03-28 10:39:56.160875	2016-08-05 22:48:58.119354	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
354	2	\N	t	t	2015-03-28 10:39:55.514957	2016-08-05 22:48:58.123473	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
310	7	\N	t	t	2015-03-28 10:39:23.077636	2016-08-05 22:48:58.127793	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
309	5	\N	t	t	2015-03-28 10:39:22.424898	2016-08-05 22:48:58.132283	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
374	16	\N	t	t	2015-03-28 10:40:09.387307	2016-08-05 22:48:58.145132	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
373	15	\N	t	t	2015-03-28 10:40:08.715481	2016-08-05 22:48:58.14913	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
372	14	\N	t	t	2015-03-28 10:40:08.032858	2016-08-05 22:48:58.15342	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
371	13	\N	t	t	2015-03-28 10:40:07.395875	2016-08-05 22:48:58.158036	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
382	15	\N	t	t	2015-03-28 10:40:15.505687	2016-08-05 22:48:58.166037	7	Property	0	\N	\N	\N	DOC_AVAILABLE	0
380	13	\N	t	t	2015-03-28 10:40:14.171518	2016-08-05 22:48:58.170298	7	Property	0	\N	\N	\N	DOC_AVAILABLE	0
377	4	\N	t	f	2015-03-28 10:40:11.997921	2016-08-08 23:34:45.068616	7	Property	0	\N	\N	\N	DOC_MISSING	0
385	7	\N	t	t	2015-03-28 10:40:18.165119	2016-08-05 22:48:58.273089	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
400	15	\N	t	t	2015-03-28 10:40:28.709314	2016-08-05 22:48:58.280855	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
399	13	\N	t	t	2015-03-28 10:40:28.046229	2016-08-05 22:48:58.284986	170	Property	1	\N	\N	\N	DOC_UPLOADED	0
398	12	\N	t	t	2015-03-28 10:40:27.377698	2016-08-05 22:48:58.288786	170	Property	1	\N	\N	\N	DOC_UPLOADED	0
426	6	\N	t	f	2015-03-28 10:40:48.183151	2016-08-05 22:48:58.294005	71	Property	0	\N	\N	\N	DOC_NONE	0
409	13	\N	t	t	2015-03-28 10:40:35.70177	2016-08-05 22:48:58.299582	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
407	11	\N	t	t	2015-03-28 10:40:34.20913	2016-08-05 22:48:58.309729	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
406	7	\N	t	t	2015-03-28 10:40:33.554587	2016-08-05 22:48:58.31353	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
405	6	\N	t	t	2015-03-28 10:40:32.710311	2016-08-05 22:48:58.31769	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
404	5	\N	t	t	2015-03-28 10:40:32.035424	2016-08-05 22:48:58.321956	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
402	2	\N	t	t	2015-03-28 10:40:30.713705	2016-08-05 22:48:58.329896	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
422	16	\N	t	t	2015-03-28 10:40:44.895963	2016-08-05 22:48:58.33363	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
421	15	\N	t	t	2015-03-28 10:40:44.243954	2016-08-05 22:48:58.337365	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
420	14	\N	t	t	2015-03-28 10:40:43.577765	2016-08-05 22:48:58.341166	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
418	12	\N	t	t	2015-03-28 10:40:42.294547	2016-08-05 22:48:58.349519	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
383	2	\N	t	t	2015-03-28 10:40:16.840012	2016-08-05 22:48:58.353666	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
415	4	\N	t	t	2015-03-28 10:40:40.288936	2016-08-05 22:48:58.358317	45	Property	0	\N	\N	\N	DOC_AVAILABLE	0
414	3	\N	t	t	2015-03-28 10:40:39.628574	2016-08-05 22:48:58.362405	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
451	10	\N	t	f	2015-03-28 10:41:06.533447	2016-08-05 22:48:58.366413	61	Property	0	\N	\N	\N	DOC_NONE	0
428	10	\N	t	f	2015-03-28 10:40:49.511082	2016-08-05 22:48:58.374633	71	Property	0	\N	\N	\N	DOC_NONE	0
425	4	\N	t	t	2015-03-28 10:40:47.52969	2016-08-05 22:48:58.378416	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
424	3	\N	t	t	2015-03-28 10:40:46.883168	2016-08-05 22:48:58.382076	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
443	15	\N	t	t	2015-03-28 10:41:00.033899	2016-08-05 22:48:58.386119	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
441	13	\N	t	t	2015-03-28 10:40:58.724875	2016-08-05 22:48:58.394389	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
440	12	\N	t	t	2015-03-28 10:40:58.06733	2016-08-05 22:48:58.398457	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
439	8	\N	t	t	2015-03-28 10:40:57.419569	2016-08-05 22:48:58.402911	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
436	4	\N	t	t	2015-03-28 10:40:55.486663	2016-08-05 22:48:58.407159	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
435	2	\N	t	t	2015-03-28 10:40:54.820547	2016-08-05 22:48:58.412147	78	Property	1	\N	\N	\N	DOC_UPLOADED	0
453	12	\N	t	t	2015-03-28 10:41:07.829052	2016-08-05 22:48:58.421501	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
452	11	\N	t	t	2015-03-28 10:41:07.18065	2016-08-05 22:48:58.425877	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
416	7	\N	t	t	2015-03-28 10:40:41.002103	2016-08-05 22:48:58.430194	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
450	7	\N	t	t	2015-03-28 10:41:05.887795	2016-08-05 22:48:58.434305	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
448	2	\N	t	t	2015-03-28 10:41:04.596787	2016-08-05 22:48:58.443207	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
463	12	\N	t	t	2015-03-28 10:41:15.063204	2016-08-05 22:48:58.447479	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
475	11	\N	t	t	2015-03-28 10:41:23.645123	2016-08-05 22:48:58.451953	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
474	10	\N	t	t	2015-03-28 10:41:22.98316	2016-08-05 22:48:58.457031	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
496	12	\N	t	t	2015-03-28 10:41:39.927649	2016-08-05 22:48:58.46494	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
495	11	\N	t	t	2015-03-28 10:41:39.285031	2016-08-05 22:48:58.468766	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
494	10	\N	t	t	2015-03-28 10:41:38.625552	2016-08-05 22:48:58.472507	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
493	8	\N	t	t	2015-03-28 10:41:37.918259	2016-08-05 22:48:58.47629	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
492	7	\N	t	t	2015-03-28 10:41:37.248825	2016-08-05 22:48:58.480145	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
490	2	\N	t	t	2015-03-28 10:41:35.930572	2016-08-05 22:48:58.489773	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
505	7	\N	t	t	2015-03-28 10:41:46.506842	2016-08-05 22:48:58.494216	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
504	5	\N	t	t	2015-03-28 10:41:45.848163	2016-08-05 22:48:58.499821	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
501	2	\N	t	t	2015-03-28 10:41:43.886742	2016-08-05 22:48:58.505514	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
521	15	\N	t	t	2015-03-28 10:41:57.639663	2016-08-05 22:48:58.513852	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
520	14	\N	t	t	2015-03-28 10:41:56.987328	2016-08-05 22:48:58.518084	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
519	13	\N	t	t	2015-03-28 10:41:56.340861	2016-08-05 22:48:58.522669	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
531	16	\N	t	t	2015-03-28 10:42:04.948866	2016-08-05 22:48:58.527604	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
529	13	\N	t	t	2015-03-28 10:42:03.631115	2016-08-05 22:48:58.53189	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
527	11	\N	t	t	2015-03-28 10:42:02.285924	2016-08-05 22:48:58.540998	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
526	10	\N	t	t	2015-03-28 10:42:01.604882	2016-08-05 22:48:58.545299	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
525	8	\N	t	t	2015-03-28 10:42:00.954852	2016-08-05 22:48:58.549442	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
349	12	\N	t	f	2015-03-28 10:39:51.530807	2016-08-24 01:01:06.666193	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
351	14	\N	t	f	2015-03-28 10:39:52.871057	2016-08-24 01:08:31.56604	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
350	13	2014-03-28 03:00:00	t	f	2015-03-28 10:39:52.199281	2016-08-24 01:02:16.155092	82	Property	0	\N	\N	\N	DOC_EXPIRED	1
353	16	\N	t	f	2015-03-28 10:39:54.173615	2016-08-24 01:10:46.638272	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
524	7	\N	t	t	2015-03-28 10:42:00.289469	2016-08-05 22:48:58.553766	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
540	14	\N	t	t	2015-03-28 10:42:11.500022	2016-08-05 22:48:58.56263	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
539	13	\N	t	t	2015-03-28 10:42:10.824139	2016-08-05 22:48:58.56703	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
538	12	\N	t	t	2015-03-28 10:42:10.178335	2016-08-05 22:48:58.571015	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
537	8	\N	t	t	2015-03-28 10:42:09.532527	2016-08-05 22:48:58.575722	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
535	5	\N	t	t	2015-03-28 10:42:08.228563	2016-08-05 22:48:58.585291	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
534	4	\N	t	t	2015-03-28 10:42:07.579331	2016-08-05 22:48:58.589615	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
533	3	\N	t	t	2015-03-28 10:42:06.920711	2016-08-05 22:48:58.594089	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
542	11	\N	t	t	2015-03-28 10:42:13.484013	2016-08-05 22:48:58.598836	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
551	14	\N	t	t	2015-03-28 10:42:20.068972	2016-08-05 22:48:58.603282	29	Property	1	\N	\N	\N	DOC_UPLOADED	0
548	7	\N	t	t	2015-03-28 10:42:18.098983	2016-08-05 22:48:58.613044	29	Property	0	\N	\N	\N	DOC_AVAILABLE	0
563	15	\N	t	f	2015-03-28 10:42:29.399487	2016-08-05 22:48:58.617755	222	Property	0	\N	\N	\N	DOC_NONE	0
1403	1	\N	t	t	2015-04-08 12:40:13.987466	2016-08-05 22:48:58.623326	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
565	2	\N	t	t	2015-03-28 10:42:31.350778	2016-08-05 22:48:58.629033	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
582	15	\N	t	t	2015-03-28 10:42:43.179107	2016-08-05 22:48:58.639547	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
580	13	\N	t	t	2015-03-28 10:42:41.873096	2016-08-05 22:48:58.645281	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
378	7	\N	t	f	2015-03-28 10:40:12.664197	2016-08-08 23:34:52.301718	7	Property	0	\N	\N	\N	DOC_AVAILABLE	0
576	3	\N	t	t	2015-03-28 10:42:39.265417	2016-08-05 22:48:58.655514	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
584	2	\N	t	t	2015-03-28 10:42:45.172944	2016-08-05 22:48:58.659887	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
587	6	\N	t	t	2015-03-28 10:42:47.143224	2016-08-05 22:48:58.664269	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
585	4	\N	t	t	2015-03-28 10:42:45.822055	2016-08-05 22:48:58.673984	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
603	15	\N	t	t	2015-03-28 10:42:58.251206	2016-08-05 22:48:58.678301	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
602	14	\N	t	t	2015-03-28 10:42:57.597922	2016-08-05 22:48:58.683271	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
601	13	\N	t	t	2015-03-28 10:42:56.951596	2016-08-05 22:48:58.68824	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
599	11	\N	t	t	2015-03-28 10:42:55.651637	2016-08-05 22:48:58.692693	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
597	7	\N	t	t	2015-03-28 10:42:54.334501	2016-08-05 22:48:58.700799	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
596	3	\N	t	t	2015-03-28 10:42:53.694644	2016-08-05 22:48:58.706066	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
612	14	\N	t	t	2015-03-28 10:43:04.734191	2016-08-05 22:48:58.710433	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
611	13	\N	t	t	2015-03-28 10:43:04.094424	2016-08-05 22:48:58.714874	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
608	7	\N	t	t	2015-03-28 10:43:02.16475	2016-08-05 22:48:58.724354	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
607	4	\N	t	t	2015-03-28 10:43:01.512361	2016-08-05 22:48:58.728692	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
606	3	\N	t	t	2015-03-28 10:43:00.862319	2016-08-05 22:48:58.733144	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
605	2	\N	t	t	2015-03-28 10:43:00.217791	2016-08-05 22:48:58.737514	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
617	12	\N	t	t	2015-03-28 10:43:08.631397	2016-08-05 22:48:58.747795	15	Property	0	\N	\N	\N	DOC_AVAILABLE	0
616	7	\N	t	t	2015-03-28 10:43:07.988878	2016-08-05 22:48:58.752277	15	Property	0	\N	\N	\N	DOC_AVAILABLE	0
615	3	\N	t	t	2015-03-28 10:43:07.342755	2016-08-05 22:48:58.757247	15	Property	0	\N	\N	\N	DOC_AVAILABLE	0
614	2	\N	t	t	2015-03-28 10:43:06.696085	2016-08-05 22:48:58.761605	15	Property	0	\N	\N	\N	DOC_AVAILABLE	0
609	11	\N	t	f	2015-03-28 10:43:02.805005	2016-08-05 22:48:58.765887	37	Property	0	\N	\N	\N	DOC_NONE	0
622	2	\N	t	t	2015-03-28 10:43:13.432346	2016-08-05 22:48:58.775179	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
628	9	\N	t	t	2015-03-28 10:43:17.365153	2016-08-05 22:48:58.779767	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
626	7	\N	t	t	2015-03-28 10:43:16.023799	2016-08-05 22:48:58.784073	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
618	11	\N	t	f	2015-03-28 10:43:10.139481	2016-08-05 22:48:58.788687	158	Property	0	\N	\N	\N	DOC_NONE	0
631	4	\N	t	t	2015-03-28 10:43:20.027173	2016-08-05 22:48:58.79761	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
630	2	\N	t	t	2015-03-28 10:43:19.371374	2016-08-05 22:48:58.801961	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
640	16	\N	t	t	2015-03-28 10:43:26.026012	2016-08-05 22:48:58.806582	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
639	15	\N	t	t	2015-03-28 10:43:25.374831	2016-08-05 22:48:58.811259	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
638	14	\N	t	t	2015-03-28 10:43:24.716579	2016-08-05 22:48:58.815946	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
636	12	\N	t	t	2015-03-28 10:43:23.359212	2016-08-05 22:48:58.825631	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
641	2	\N	t	t	2015-03-28 10:43:27.367789	2016-08-05 22:48:58.830795	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1394	9	\N	t	f	2015-04-08 12:40:01.914635	2016-08-05 22:48:58.836082	48	Property	0	\N	\N	\N	DOC_NONE	0
1395	10	\N	t	f	2015-04-08 12:40:03.232462	2016-08-05 22:48:58.840815	48	Property	0	\N	\N	\N	DOC_NONE	0
1397	12	\N	t	f	2015-04-08 12:40:05.876096	2016-08-05 22:48:58.849859	48	Property	0	\N	\N	\N	DOC_NONE	0
1398	13	\N	t	f	2015-04-08 12:40:07.196075	2016-08-05 22:48:58.854572	48	Property	0	\N	\N	\N	DOC_NONE	0
1399	14	\N	t	f	2015-04-08 12:40:08.527251	2016-08-05 22:48:58.858933	48	Property	0	\N	\N	\N	DOC_NONE	0
1400	15	\N	t	f	2015-04-08 12:40:09.851674	2016-08-05 22:48:58.862947	48	Property	0	\N	\N	\N	DOC_NONE	0
1402	17	\N	t	f	2015-04-08 12:40:12.494809	2016-08-05 22:48:58.872455	48	Property	0	\N	\N	\N	DOC_NONE	0
1404	3	\N	t	t	2015-04-08 12:40:16.143538	2016-08-05 22:48:58.876882	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1409	15	\N	t	t	2015-04-08 12:40:28.610866	2016-08-05 22:48:58.881156	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
543	12	\N	t	t	2015-03-28 10:42:14.162588	2016-08-05 22:48:58.885647	105	Property	1	\N	\N	\N	DOC_UPLOADED	0
1406	9	\N	t	f	2015-04-08 12:40:22.133858	2016-08-05 22:48:58.890246	49	Property	0	\N	\N	\N	DOC_NONE	0
1408	11	\N	t	f	2015-04-08 12:40:24.799703	2016-08-05 22:48:58.899849	49	Property	0	\N	\N	\N	DOC_NONE	0
1410	17	\N	t	t	2015-04-08 12:40:30.787869	2016-08-05 22:48:58.904456	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1424	17	\N	t	t	2015-04-08 12:40:52.786827	2016-08-05 22:48:58.908756	50	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1405	5	\N	t	f	2015-04-08 12:40:18.314034	2016-08-05 22:48:58.913207	49	Property	0	\N	\N	\N	DOC_NONE	0
1413	5	\N	t	f	2015-04-08 12:40:36.589985	2016-08-05 22:48:58.921674	50	Property	0	\N	\N	\N	DOC_NONE	0
1414	6	\N	t	f	2015-04-08 12:40:37.94614	2016-08-05 22:48:58.925896	50	Property	0	\N	\N	\N	DOC_NONE	0
1415	7	\N	t	f	2015-04-08 12:40:39.270697	2016-08-05 22:48:58.930221	50	Property	0	\N	\N	\N	DOC_NONE	0
1416	8	\N	t	f	2015-04-08 12:40:40.592729	2016-08-05 22:48:58.934688	50	Property	0	\N	\N	\N	DOC_NONE	0
1417	9	\N	t	f	2015-04-08 12:40:41.915693	2016-08-05 22:48:58.939187	50	Property	0	\N	\N	\N	DOC_NONE	0
1419	11	\N	t	f	2015-04-08 12:40:44.555155	2016-08-05 22:48:58.948759	50	Property	0	\N	\N	\N	DOC_NONE	0
1420	12	\N	t	f	2015-04-08 12:40:45.886575	2016-08-05 22:48:58.953709	50	Property	0	\N	\N	\N	DOC_NONE	0
1421	14	\N	t	f	2015-04-08 12:40:48.035755	2016-08-05 22:48:58.957954	50	Property	0	\N	\N	\N	DOC_NONE	0
1422	15	\N	t	f	2015-04-08 12:40:49.738061	2016-08-05 22:48:58.962207	50	Property	0	\N	\N	\N	DOC_NONE	0
1407	10	\N	t	t	2015-04-08 12:40:23.452039	2016-08-05 22:48:58.970979	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1425	1	\N	t	f	2015-04-08 12:40:55.030131	2016-08-05 22:48:58.975029	51	Property	0	\N	\N	\N	DOC_NONE	0
1426	3	\N	t	t	2015-04-08 12:40:57.195733	2016-08-05 22:48:58.979018	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1518	8	\N	t	f	2015-04-08 12:43:24.603425	2016-08-05 22:48:58.986674	58	Property	0	\N	\N	\N	DOC_NONE	0
1520	10	\N	t	f	2015-04-08 12:43:27.674695	2016-08-05 22:48:58.995635	58	Property	0	\N	\N	\N	DOC_NONE	0
1521	11	\N	t	f	2015-04-08 12:43:29.372996	2016-08-05 22:48:58.999741	58	Property	0	\N	\N	\N	DOC_NONE	0
1522	12	\N	t	f	2015-04-08 12:43:31.891423	2016-08-05 22:48:59.004198	58	Property	0	\N	\N	\N	DOC_NONE	0
1523	13	\N	t	f	2015-04-08 12:43:33.64886	2016-08-05 22:48:59.008896	58	Property	0	\N	\N	\N	DOC_NONE	0
1524	14	\N	t	f	2015-04-08 12:43:34.975347	2016-08-05 22:48:59.017462	58	Property	0	\N	\N	\N	DOC_NONE	0
1526	16	\N	t	f	2015-04-08 12:43:37.69089	2016-08-05 22:48:59.029977	58	Property	0	\N	\N	\N	DOC_NONE	0
1527	17	\N	t	f	2015-04-08 12:43:39.036518	2016-08-05 22:48:59.035357	58	Property	0	\N	\N	\N	DOC_NONE	0
1528	1	\N	t	t	2015-04-08 12:43:41.362409	2016-08-05 22:48:59.04053	59	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1530	5	\N	t	f	2015-04-08 12:43:46.973032	2016-08-05 22:48:59.045307	59	Property	0	\N	\N	\N	DOC_NONE	0
1532	7	\N	t	f	2015-04-08 12:43:49.680715	2016-08-05 22:48:59.054064	59	Property	0	\N	\N	\N	DOC_NONE	0
85	2	\N	t	t	2015-03-28 10:36:22.754883	2016-08-05 22:48:59.058516	59	Property	0	\N	\N	\N	DOC_AVAILABLE	0
657	16	\N	t	t	2015-03-28 10:43:38.682305	2016-08-05 22:48:59.068242	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
648	2	\N	t	t	2015-03-28 10:43:32.663823	2016-08-05 22:48:59.073121	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
673	15	\N	t	t	2015-03-28 10:43:51.277728	2016-08-05 22:48:59.077567	103	Property	0	\N	\N	\N	DOC_AVAILABLE	0
671	12	\N	t	t	2015-03-28 10:43:49.976267	2016-08-05 22:48:59.087178	103	Property	0	\N	\N	\N	DOC_AVAILABLE	0
670	8	\N	t	t	2015-03-28 10:43:49.309654	2016-08-05 22:48:59.091595	103	Property	0	\N	\N	\N	DOC_AVAILABLE	0
668	4	\N	t	t	2015-03-28 10:43:47.966252	2016-08-05 22:48:59.096336	103	Property	0	\N	\N	\N	DOC_AVAILABLE	0
680	15	\N	t	t	2015-03-28 10:43:56.571149	2016-08-05 22:48:59.100369	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
678	13	\N	t	t	2015-03-28 10:43:55.261593	2016-08-05 22:48:59.104549	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
675	3	\N	t	t	2015-03-28 10:43:53.280395	2016-08-05 22:48:59.113796	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
674	2	\N	t	t	2015-03-28 10:43:52.621028	2016-08-05 22:48:59.118216	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
688	15	\N	t	t	2015-03-28 10:44:02.512699	2016-08-05 22:48:59.122243	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
687	14	\N	t	t	2015-03-28 10:44:01.873835	2016-08-05 22:48:59.126614	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
685	12	\N	t	t	2015-03-28 10:44:00.557555	2016-08-05 22:48:59.138843	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
695	13	\N	t	t	2015-03-28 10:44:07.84292	2016-08-05 22:48:59.143721	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
694	9	\N	t	t	2015-03-28 10:44:07.171002	2016-08-05 22:48:59.14788	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
693	8	\N	t	t	2015-03-28 10:44:06.495034	2016-08-05 22:48:59.152327	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
690	2	\N	t	t	2015-03-28 10:44:04.526132	2016-08-05 22:48:59.161011	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
698	13	\N	t	t	2015-03-28 10:44:10.463233	2016-08-05 22:48:59.165385	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
696	9	\N	t	t	2015-03-28 10:44:09.158442	2016-08-05 22:48:59.169238	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
705	2	\N	t	t	2015-03-28 10:44:16.463223	2016-08-05 22:48:59.17341	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
712	15	\N	t	t	2015-03-28 10:44:21.050314	2016-08-05 22:48:59.178242	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
713	2	\N	t	t	2015-03-28 10:44:22.364568	2016-08-05 22:48:59.188448	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1533	8	\N	t	f	2015-04-08 12:43:51.027937	2016-08-05 22:48:59.192328	59	Property	0	\N	\N	\N	DOC_NONE	0
1534	9	\N	t	f	2015-04-08 12:43:52.363639	2016-08-05 22:48:59.196315	59	Property	0	\N	\N	\N	DOC_NONE	0
1535	10	\N	t	f	2015-04-08 12:43:54.100411	2016-08-05 22:48:59.2002	59	Property	0	\N	\N	\N	DOC_NONE	0
1537	12	\N	t	f	2015-04-08 12:43:56.784363	2016-08-05 22:48:59.209865	59	Property	0	\N	\N	\N	DOC_NONE	0
1538	13	\N	t	f	2015-04-08 12:43:58.525375	2016-08-05 22:48:59.214087	59	Property	0	\N	\N	\N	DOC_NONE	0
1539	14	\N	t	f	2015-04-08 12:43:59.860316	2016-08-05 22:48:59.218138	59	Property	0	\N	\N	\N	DOC_NONE	0
1540	15	\N	t	f	2015-04-08 12:44:01.23836	2016-08-05 22:48:59.221995	59	Property	0	\N	\N	\N	DOC_NONE	0
1541	16	\N	t	f	2015-04-08 12:44:02.639323	2016-08-05 22:48:59.22604	59	Property	0	\N	\N	\N	DOC_NONE	0
1543	2	\N	t	f	2015-04-08 12:44:06.463741	2016-08-05 22:48:59.234851	60	Property	0	\N	\N	\N	DOC_NONE	0
1544	3	\N	t	f	2015-04-08 12:44:07.858096	2016-08-05 22:48:59.239076	60	Property	0	\N	\N	\N	DOC_NONE	0
1545	4	\N	t	f	2015-04-08 12:44:09.215322	2016-08-05 22:48:59.243519	60	Property	0	\N	\N	\N	DOC_NONE	0
1546	5	\N	t	f	2015-04-08 12:44:10.570194	2016-08-05 22:48:59.247792	60	Property	0	\N	\N	\N	DOC_NONE	0
1548	7	\N	t	f	2015-04-08 12:44:13.367922	2016-08-05 22:48:59.255796	60	Property	0	\N	\N	\N	DOC_NONE	0
1549	8	\N	t	f	2015-04-08 12:44:14.68971	2016-08-05 22:48:59.260249	60	Property	0	\N	\N	\N	DOC_NONE	0
1551	10	\N	t	f	2015-04-08 12:44:17.366725	2016-08-05 22:48:59.264636	60	Property	0	\N	\N	\N	DOC_NONE	0
1552	11	\N	t	f	2015-04-08 12:44:19.061491	2016-08-05 22:48:59.268688	60	Property	0	\N	\N	\N	DOC_NONE	0
1554	13	\N	t	f	2015-04-08 12:44:21.716141	2016-08-05 22:48:59.277276	60	Property	0	\N	\N	\N	DOC_NONE	0
1555	14	\N	t	f	2015-04-08 12:44:23.037577	2016-08-05 22:48:59.281591	60	Property	0	\N	\N	\N	DOC_NONE	0
1556	15	\N	t	f	2015-04-08 12:44:24.360843	2016-08-05 22:48:59.285485	60	Property	0	\N	\N	\N	DOC_NONE	0
1557	16	\N	t	f	2015-04-08 12:44:25.698859	2016-08-05 22:48:59.289531	60	Property	0	\N	\N	\N	DOC_NONE	0
1560	3	\N	t	t	2015-04-08 12:44:31.07847	2016-08-05 22:48:59.293329	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
1561	5	\N	t	f	2015-04-08 12:44:33.272456	2016-08-05 22:48:59.301792	61	Property	0	\N	\N	\N	DOC_NONE	0
1562	6	\N	t	f	2015-04-08 12:44:34.605543	2016-08-05 22:48:59.306242	61	Property	0	\N	\N	\N	DOC_NONE	0
1563	8	\N	t	f	2015-04-08 12:44:36.77924	2016-08-05 22:48:59.31101	61	Property	0	\N	\N	\N	DOC_NONE	0
32	2	\N	t	t	2015-03-28 10:35:17.335197	2016-08-05 22:48:59.315621	28	Property	0	\N	\N	\N	DOC_AVAILABLE	0
718	12	\N	t	t	2015-03-28 10:44:25.765971	2016-08-05 22:48:59.323384	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
717	11	\N	t	t	2015-03-28 10:44:25.103425	2016-08-05 22:48:59.32739	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
716	8	\N	t	t	2015-03-28 10:44:24.454527	2016-08-05 22:48:59.331745	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
715	7	\N	t	t	2015-03-28 10:44:23.803983	2016-08-05 22:48:59.335764	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
730	15	\N	t	t	2015-03-28 10:44:34.316056	2016-08-05 22:48:59.33968	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
728	13	\N	t	t	2015-03-28 10:44:33.007748	2016-08-05 22:48:59.347382	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
733	12	\N	t	t	2015-03-28 10:44:36.922193	2016-08-05 22:48:59.351157	239	Property	0	\N	\N	\N	DOC_AVAILABLE	0
776	1	\N	t	f	2015-03-28 10:45:14.687686	2016-08-05 22:48:59.355511	202	Property	0	\N	\N	\N	DOC_NONE	0
735	12	\N	t	t	2015-03-28 10:44:38.873627	2016-08-05 22:48:59.360006	208	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1565	17	\N	t	t	2015-04-08 12:44:45.279792	2016-08-05 22:48:59.368652	61	Property	0	\N	\N	\N	DOC_AVAILABLE	0
739	4	\N	t	t	2015-03-28 10:44:42.16326	2016-08-05 22:48:59.372858	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
744	12	\N	t	t	2015-03-28 10:44:45.446597	2016-08-05 22:48:59.377072	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
738	3	\N	t	t	2015-03-28 10:44:41.497151	2016-08-05 22:48:59.381429	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
740	5	\N	t	f	2015-03-28 10:44:42.812692	2016-08-05 22:48:59.39103	213	Property	0	\N	\N	\N	DOC_NONE	0
745	13	\N	t	t	2015-03-28 10:44:46.086851	2016-08-05 22:48:59.395257	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
752	12	\N	t	t	2015-03-28 10:44:51.318524	2016-08-05 22:48:59.399551	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
751	11	\N	t	t	2015-03-28 10:44:50.672655	2016-08-05 22:48:59.404322	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
757	9	\N	t	t	2015-03-28 10:44:55.357454	2016-08-05 22:48:59.408682	13	Property	0	\N	\N	\N	DOC_AVAILABLE	0
755	7	\N	t	t	2015-03-28 10:44:54.067743	2016-08-05 22:48:59.419101	13	Property	0	\N	\N	\N	DOC_AVAILABLE	0
754	3	\N	t	t	2015-03-28 10:44:53.414842	2016-08-05 22:48:59.423527	13	Property	0	\N	\N	\N	DOC_AVAILABLE	0
759	3	\N	t	t	2015-03-28 10:44:57.301991	2016-08-05 22:48:59.427962	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
769	15	\N	t	t	2015-03-28 10:45:04.683703	2016-08-05 22:48:59.432217	214	Property	0	\N	\N	\N	DOC_AVAILABLE	0
767	12	\N	t	t	2015-03-28 10:45:03.337179	2016-08-05 22:48:59.441375	214	Property	0	\N	\N	\N	DOC_AVAILABLE	0
766	3	\N	t	t	2015-03-28 10:45:02.684413	2016-08-05 22:48:59.445827	214	Property	0	\N	\N	\N	DOC_AVAILABLE	0
770	12	\N	t	t	2015-03-28 10:45:06.009346	2016-08-05 22:48:59.454907	230	Property	0	\N	\N	\N	DOC_AVAILABLE	0
771	13	\N	t	t	2015-03-28 10:45:06.656146	2016-08-05 22:48:59.459162	230	Property	0	\N	\N	\N	DOC_AVAILABLE	0
772	12	\N	t	t	2015-03-28 10:45:07.967226	2016-08-05 22:48:59.463803	225	Property	1	\N	\N	\N	DOC_UPLOADED	0
775	2	\N	t	t	2015-03-28 10:45:13.389007	2016-08-05 22:48:59.473011	252	Property	0	\N	\N	\N	DOC_AVAILABLE	0
778	3	\N	t	t	2015-03-28 10:45:16.002762	2016-08-05 22:48:59.477461	202	Property	0	\N	\N	\N	DOC_AVAILABLE	0
777	2	\N	t	t	2015-03-28 10:45:15.336812	2016-08-05 22:48:59.482008	202	Property	0	\N	\N	\N	DOC_AVAILABLE	0
780	2	\N	t	f	2015-03-28 10:45:18.018274	2016-08-05 22:48:59.487006	203	Property	0	\N	\N	\N	DOC_NONE	0
783	2	\N	t	f	2015-03-28 10:45:20.661278	2016-08-05 22:48:59.492469	204	Property	0	\N	\N	\N	DOC_NONE	0
781	3	\N	t	f	2015-03-28 10:45:18.686913	2016-08-05 22:48:59.501047	203	Property	0	\N	\N	\N	DOC_NONE	0
782	1	\N	t	f	2015-03-28 10:45:20.002756	2016-08-05 22:48:59.506184	204	Property	0	\N	\N	\N	DOC_NONE	0
732	2	\N	t	t	2015-03-28 10:44:36.272731	2016-08-05 22:48:59.510617	239	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1564	9	\N	t	f	2015-04-08 12:44:38.100511	2016-08-05 22:48:59.515091	61	Property	0	\N	\N	\N	DOC_NONE	0
1566	1	\N	t	f	2015-04-08 12:44:46.772048	2016-08-05 22:48:59.523861	62	Property	0	\N	\N	\N	DOC_NONE	0
1568	4	\N	t	f	2015-04-08 12:44:50.685478	2016-08-05 22:48:59.528238	62	Property	0	\N	\N	\N	DOC_NONE	0
1569	5	\N	t	f	2015-04-08 12:44:52.025884	2016-08-05 22:48:59.532626	62	Property	0	\N	\N	\N	DOC_NONE	0
1570	6	\N	t	f	2015-04-08 12:44:53.35577	2016-08-05 22:48:59.537041	62	Property	0	\N	\N	\N	DOC_NONE	0
1572	8	\N	t	f	2015-04-08 12:44:56.026515	2016-08-05 22:48:59.545555	62	Property	0	\N	\N	\N	DOC_NONE	0
1573	9	\N	t	f	2015-04-08 12:44:57.371244	2016-08-05 22:48:59.549834	62	Property	0	\N	\N	\N	DOC_NONE	0
1574	10	\N	t	f	2015-04-08 12:44:58.717022	2016-08-05 22:48:59.554176	62	Property	0	\N	\N	\N	DOC_NONE	0
1575	11	\N	t	f	2015-04-08 12:45:00.551462	2016-08-05 22:48:59.558724	62	Property	0	\N	\N	\N	DOC_NONE	0
1576	12	\N	t	f	2015-04-08 12:45:01.8929	2016-08-05 22:48:59.562936	62	Property	0	\N	\N	\N	DOC_NONE	0
1578	14	\N	t	f	2015-04-08 12:45:04.583028	2016-08-05 22:48:59.571472	62	Property	0	\N	\N	\N	DOC_NONE	0
1579	15	\N	t	f	2015-04-08 12:45:05.931934	2016-08-05 22:48:59.576112	62	Property	0	\N	\N	\N	DOC_NONE	0
1580	16	\N	t	f	2015-04-08 12:45:07.269839	2016-08-05 22:48:59.580532	62	Property	0	\N	\N	\N	DOC_NONE	0
1582	1	\N	t	f	2015-04-08 12:45:10.142359	2016-08-05 22:48:59.585549	63	Property	0	\N	\N	\N	DOC_NONE	0
1584	3	\N	t	f	2015-04-08 12:45:12.836886	2016-08-05 22:48:59.594249	63	Property	0	\N	\N	\N	DOC_NONE	0
1585	4	\N	t	f	2015-04-08 12:45:14.178377	2016-08-05 22:48:59.5989	63	Property	0	\N	\N	\N	DOC_NONE	0
1586	5	\N	t	f	2015-04-08 12:45:15.508725	2016-08-05 22:48:59.603286	63	Property	0	\N	\N	\N	DOC_NONE	0
1587	6	\N	t	f	2015-04-08 12:45:16.841371	2016-08-05 22:48:59.607591	63	Property	0	\N	\N	\N	DOC_NONE	0
1588	7	\N	t	f	2015-04-08 12:45:18.181716	2016-08-05 22:48:59.612214	63	Property	0	\N	\N	\N	DOC_NONE	0
1591	10	\N	t	f	2015-04-08 12:45:22.595218	2016-08-05 22:48:59.621414	63	Property	0	\N	\N	\N	DOC_NONE	0
1592	11	\N	t	f	2015-04-08 12:45:23.941258	2016-08-05 22:48:59.625714	63	Property	0	\N	\N	\N	DOC_NONE	0
1594	13	\N	t	t	2015-04-08 12:45:26.637794	2016-08-05 22:48:59.629964	63	Property	0	\N	\N	\N	DOC_AVAILABLE	0
741	7	\N	t	t	2015-03-28 10:44:43.453715	2016-08-05 22:48:59.634314	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1596	15	\N	t	f	2015-04-08 12:45:29.75447	2016-08-05 22:48:59.642791	63	Property	0	\N	\N	\N	DOC_NONE	0
1597	16	\N	t	f	2015-04-08 12:45:31.453794	2016-08-05 22:48:59.647531	63	Property	0	\N	\N	\N	DOC_NONE	0
1598	17	\N	t	f	2015-04-08 12:45:32.784245	2016-08-05 22:48:59.651615	63	Property	0	\N	\N	\N	DOC_NONE	0
1599	1	\N	t	f	2015-04-08 12:45:34.293517	2016-08-05 22:48:59.656067	64	Property	0	\N	\N	\N	DOC_NONE	0
1601	10	\N	t	f	2015-04-08 12:45:42.836779	2016-08-05 22:48:59.666126	64	Property	0	\N	\N	\N	DOC_NONE	0
1602	11	\N	t	f	2015-04-08 12:45:44.165405	2016-08-05 22:48:59.670711	64	Property	0	\N	\N	\N	DOC_NONE	0
1603	13	\N	t	f	2015-04-08 12:45:46.688635	2016-08-05 22:48:59.675392	64	Property	0	\N	\N	\N	DOC_NONE	0
1604	14	\N	t	f	2015-04-08 12:45:48.176102	2016-08-05 22:48:59.679872	64	Property	0	\N	\N	\N	DOC_NONE	0
1605	15	\N	t	f	2015-04-08 12:45:49.992713	2016-08-05 22:48:59.684063	64	Property	0	\N	\N	\N	DOC_NONE	0
1607	17	\N	t	f	2015-04-08 12:45:52.965007	2016-08-05 22:48:59.69257	64	Property	0	\N	\N	\N	DOC_NONE	0
1600	6	\N	t	t	2015-04-08 12:45:39.014521	2016-08-05 22:48:59.697184	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1609	3	\N	t	f	2015-04-08 12:45:57.09864	2016-08-05 22:48:59.701468	66	Property	0	\N	\N	\N	DOC_NONE	0
1610	4	\N	t	f	2015-04-08 12:45:58.590048	2016-08-05 22:48:59.705791	66	Property	0	\N	\N	\N	DOC_NONE	0
1612	6	\N	t	f	2015-04-08 12:46:01.663179	2016-08-05 22:48:59.715381	66	Property	0	\N	\N	\N	DOC_NONE	0
1615	9	\N	t	f	2015-04-08 12:46:06.133982	2016-08-05 22:48:59.719985	66	Property	0	\N	\N	\N	DOC_NONE	0
1616	10	\N	t	f	2015-04-08 12:46:07.623969	2016-08-05 22:48:59.724079	66	Property	0	\N	\N	\N	DOC_NONE	0
1617	11	\N	t	f	2015-04-08 12:46:09.110508	2016-08-05 22:48:59.728916	66	Property	0	\N	\N	\N	DOC_NONE	0
1618	12	\N	t	f	2015-04-08 12:46:10.598826	2016-08-05 22:48:59.733296	66	Property	0	\N	\N	\N	DOC_NONE	0
1621	15	\N	t	f	2015-04-08 12:46:15.067748	2016-08-05 22:48:59.741952	66	Property	0	\N	\N	\N	DOC_NONE	0
1622	16	\N	t	f	2015-04-08 12:46:16.556244	2016-08-05 22:48:59.746149	66	Property	0	\N	\N	\N	DOC_NONE	0
1623	17	\N	t	f	2015-04-08 12:46:18.123908	2016-08-05 22:48:59.750366	66	Property	0	\N	\N	\N	DOC_NONE	0
1649	3	\N	t	t	2015-04-08 12:47:08.964764	2016-08-05 22:48:59.754665	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1627	5	\N	t	f	2015-04-08 12:46:25.26499	2016-08-05 22:48:59.763591	67	Property	0	\N	\N	\N	DOC_NONE	0
1628	6	\N	t	f	2015-04-08 12:46:26.752003	2016-08-05 22:48:59.767877	67	Property	0	\N	\N	\N	DOC_NONE	0
1629	7	\N	t	f	2015-04-08 12:46:28.240203	2016-08-05 22:48:59.772561	67	Property	0	\N	\N	\N	DOC_NONE	0
1630	8	\N	t	f	2015-04-08 12:46:29.735062	2016-08-05 22:48:59.777215	67	Property	0	\N	\N	\N	DOC_NONE	0
1632	10	\N	t	f	2015-04-08 12:46:32.71183	2016-08-05 22:48:59.786122	67	Property	0	\N	\N	\N	DOC_NONE	0
1633	11	\N	t	f	2015-04-08 12:46:34.199948	2016-08-05 22:48:59.790743	67	Property	0	\N	\N	\N	DOC_NONE	0
1634	12	\N	t	f	2015-04-08 12:46:35.696358	2016-08-05 22:48:59.795309	67	Property	0	\N	\N	\N	DOC_NONE	0
1635	13	\N	t	f	2015-04-08 12:46:37.186236	2016-08-05 22:48:59.799745	67	Property	0	\N	\N	\N	DOC_NONE	0
1636	14	\N	t	f	2015-04-08 12:46:38.677447	2016-08-05 22:48:59.804297	67	Property	0	\N	\N	\N	DOC_NONE	0
1638	16	\N	t	f	2015-04-08 12:46:41.662867	2016-08-05 22:48:59.813459	67	Property	0	\N	\N	\N	DOC_NONE	0
1639	17	\N	t	f	2015-04-08 12:46:43.165232	2016-08-05 22:48:59.817783	67	Property	0	\N	\N	\N	DOC_NONE	0
1640	1	\N	t	f	2015-04-08 12:46:44.855233	2016-08-05 22:48:59.82233	68	Property	0	\N	\N	\N	DOC_NONE	0
1646	15	\N	t	t	2015-04-08 12:47:02.257711	2016-08-05 22:48:59.82662	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1643	9	\N	t	f	2015-04-08 12:46:54.673553	2016-08-05 22:48:59.835058	68	Property	0	\N	\N	\N	DOC_NONE	0
1644	12	\N	t	f	2015-04-08 12:46:58.141414	2016-08-05 22:48:59.839298	68	Property	0	\N	\N	\N	DOC_NONE	0
1647	17	\N	t	f	2015-04-08 12:47:04.746795	2016-08-05 22:48:59.84841	68	Property	0	\N	\N	\N	DOC_NONE	0
1648	1	\N	t	f	2015-04-08 12:47:06.41911	2016-08-05 22:48:59.852916	69	Property	0	\N	\N	\N	DOC_NONE	0
1641	3	\N	t	t	2015-04-08 12:46:47.345817	2016-08-05 22:48:59.857799	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1653	9	\N	t	f	2015-04-08 12:47:16.92522	2016-08-05 22:48:59.86699	69	Property	0	\N	\N	\N	DOC_NONE	0
1654	17	\N	t	f	2015-04-08 12:47:25.727048	2016-08-05 22:48:59.871238	69	Property	0	\N	\N	\N	DOC_NONE	0
1655	2	\N	t	f	2015-04-08 12:47:28.746793	2016-08-05 22:48:59.875575	70	Property	0	\N	\N	\N	DOC_NONE	0
1656	3	\N	t	f	2015-04-08 12:47:30.235689	2016-08-05 22:48:59.880036	70	Property	0	\N	\N	\N	DOC_NONE	0
1657	4	\N	t	f	2015-04-08 12:47:32.115365	2016-08-05 22:48:59.88435	70	Property	0	\N	\N	\N	DOC_NONE	0
1659	6	\N	t	f	2015-04-08 12:47:35.897585	2016-08-05 22:48:59.893178	70	Property	0	\N	\N	\N	DOC_NONE	0
1660	7	\N	t	f	2015-04-08 12:47:37.398217	2016-08-05 22:48:59.897664	70	Property	0	\N	\N	\N	DOC_NONE	0
1661	8	\N	t	f	2015-04-08 12:47:38.882721	2016-08-05 22:48:59.902022	70	Property	0	\N	\N	\N	DOC_NONE	0
1662	9	\N	t	f	2015-04-08 12:47:40.370162	2016-08-05 22:48:59.906594	70	Property	0	\N	\N	\N	DOC_NONE	0
1664	11	\N	t	f	2015-04-08 12:47:43.350811	2016-08-05 22:48:59.915811	70	Property	0	\N	\N	\N	DOC_NONE	0
1665	12	\N	t	f	2015-04-08 12:47:44.84036	2016-08-05 22:48:59.920704	70	Property	0	\N	\N	\N	DOC_NONE	0
1666	13	\N	t	f	2015-04-08 12:47:46.332937	2016-08-05 22:48:59.9254	70	Property	0	\N	\N	\N	DOC_NONE	0
1667	14	\N	t	f	2015-04-08 12:47:47.822672	2016-08-05 22:48:59.93009	70	Property	0	\N	\N	\N	DOC_NONE	0
1669	16	\N	t	f	2015-04-08 12:47:50.794051	2016-08-05 22:48:59.939204	70	Property	0	\N	\N	\N	DOC_NONE	0
1670	17	\N	t	f	2015-04-08 12:47:52.286034	2016-08-05 22:48:59.944016	70	Property	0	\N	\N	\N	DOC_NONE	0
1671	1	\N	t	f	2015-04-08 12:47:53.935205	2016-08-05 22:48:59.948535	71	Property	0	\N	\N	\N	DOC_NONE	0
1672	5	\N	t	f	2015-04-08 12:47:58.396391	2016-08-05 22:48:59.953432	71	Property	0	\N	\N	\N	DOC_NONE	0
1673	8	\N	t	f	2015-04-08 12:48:01.864368	2016-08-05 22:48:59.9577	71	Property	0	\N	\N	\N	DOC_NONE	0
1675	17	\N	t	f	2015-04-08 12:48:11.790693	2016-08-05 22:48:59.966234	71	Property	0	\N	\N	\N	DOC_NONE	0
1676	1	\N	t	f	2015-04-08 12:48:13.445248	2016-08-05 22:48:59.971124	72	Property	0	\N	\N	\N	DOC_NONE	0
1677	2	\N	t	f	2015-04-08 12:48:14.940329	2016-08-05 22:48:59.975855	72	Property	0	\N	\N	\N	DOC_NONE	0
1678	3	\N	t	f	2015-04-08 12:48:16.439833	2016-08-05 22:48:59.980257	72	Property	0	\N	\N	\N	DOC_NONE	0
1680	5	\N	t	f	2015-04-08 12:48:19.423928	2016-08-05 22:48:59.991065	72	Property	0	\N	\N	\N	DOC_NONE	0
1681	6	\N	t	f	2015-04-08 12:48:20.91298	2016-08-05 22:48:59.996245	72	Property	0	\N	\N	\N	DOC_NONE	0
1682	7	\N	t	f	2015-04-08 12:48:22.404045	2016-08-05 22:49:00.002116	72	Property	0	\N	\N	\N	DOC_NONE	0
1683	8	\N	t	f	2015-04-08 12:48:23.897972	2016-08-05 22:49:00.007124	72	Property	0	\N	\N	\N	DOC_NONE	0
1684	9	\N	t	f	2015-04-08 12:48:25.407929	2016-08-05 22:49:00.012013	72	Property	0	\N	\N	\N	DOC_NONE	0
1686	11	\N	t	f	2015-04-08 12:48:28.387975	2016-08-05 22:49:00.025477	72	Property	0	\N	\N	\N	DOC_NONE	0
1687	12	\N	t	f	2015-04-08 12:48:29.883221	2016-08-05 22:49:00.029753	72	Property	0	\N	\N	\N	DOC_NONE	0
1688	13	\N	t	f	2015-04-08 12:48:31.387903	2016-08-05 22:49:00.034826	72	Property	0	\N	\N	\N	DOC_NONE	0
1689	14	\N	t	f	2015-04-08 12:48:32.881517	2016-08-05 22:49:00.044191	72	Property	0	\N	\N	\N	DOC_NONE	0
1691	16	\N	t	f	2015-04-08 12:48:35.858915	2016-08-05 22:49:00.074953	72	Property	0	\N	\N	\N	DOC_NONE	0
1692	17	\N	t	f	2015-04-08 12:48:37.34579	2016-08-05 22:49:00.07998	72	Property	0	\N	\N	\N	DOC_NONE	0
1693	1	\N	t	f	2015-04-08 12:48:39.002339	2016-08-05 22:49:00.084851	73	Property	0	\N	\N	\N	DOC_NONE	0
1694	4	\N	t	f	2015-04-08 12:48:42.49288	2016-08-05 22:49:00.089256	73	Property	0	\N	\N	\N	DOC_NONE	0
1696	6	\N	t	f	2015-04-08 12:48:45.470484	2016-08-05 22:49:00.099948	73	Property	0	\N	\N	\N	DOC_NONE	0
1697	7	\N	t	f	2015-04-08 12:48:46.996542	2016-08-05 22:49:00.104657	73	Property	0	\N	\N	\N	DOC_NONE	0
1698	8	\N	t	f	2015-04-08 12:48:48.486641	2016-08-05 22:49:00.109653	73	Property	0	\N	\N	\N	DOC_NONE	0
1699	9	\N	t	f	2015-04-08 12:48:49.973055	2016-08-05 22:49:00.114285	73	Property	0	\N	\N	\N	DOC_NONE	0
1700	10	\N	t	f	2015-04-08 12:48:51.465635	2016-08-05 22:49:00.118524	73	Property	0	\N	\N	\N	DOC_NONE	0
1704	14	\N	t	f	2015-04-08 12:48:57.462103	2016-08-05 22:49:00.127737	73	Property	0	\N	\N	\N	DOC_NONE	0
1705	15	\N	t	f	2015-04-08 12:48:58.950543	2016-08-05 22:49:00.13178	73	Property	0	\N	\N	\N	DOC_NONE	0
1706	16	\N	t	f	2015-04-08 12:49:00.483819	2016-08-05 22:49:00.136264	73	Property	0	\N	\N	\N	DOC_NONE	0
1707	17	\N	t	f	2015-04-08 12:49:01.967588	2016-08-05 22:49:00.141157	73	Property	0	\N	\N	\N	DOC_NONE	0
1709	4	\N	t	f	2015-04-08 12:49:07.108193	2016-08-05 22:49:00.149877	74	Property	0	\N	\N	\N	DOC_NONE	0
1711	6	\N	t	f	2015-04-08 12:49:10.09332	2016-08-05 22:49:00.154826	74	Property	0	\N	\N	\N	DOC_NONE	0
1712	9	\N	t	f	2015-04-08 12:49:13.571737	2016-08-05 22:49:00.1594	74	Property	0	\N	\N	\N	DOC_NONE	0
1713	10	\N	t	f	2015-04-08 12:49:15.059581	2016-08-05 22:49:00.16373	74	Property	0	\N	\N	\N	DOC_NONE	0
1714	17	\N	t	f	2015-04-08 12:49:22.516989	2016-08-05 22:49:00.168308	74	Property	0	\N	\N	\N	DOC_NONE	0
1716	2	\N	t	f	2015-04-08 12:49:25.663143	2016-08-05 22:49:00.177601	75	Property	0	\N	\N	\N	DOC_NONE	0
1717	3	\N	t	f	2015-04-08 12:49:27.150458	2016-08-05 22:49:00.182107	75	Property	0	\N	\N	\N	DOC_NONE	0
1718	4	\N	t	f	2015-04-08 12:49:28.636854	2016-08-05 22:49:00.186811	75	Property	0	\N	\N	\N	DOC_NONE	0
1719	5	\N	t	f	2015-04-08 12:49:30.129476	2016-08-05 22:49:00.191303	75	Property	0	\N	\N	\N	DOC_NONE	0
1721	7	\N	t	f	2015-04-08 12:49:33.121876	2016-08-05 22:49:00.200563	75	Property	0	\N	\N	\N	DOC_NONE	0
1723	9	\N	t	f	2015-04-08 12:49:36.103306	2016-08-05 22:49:00.204951	75	Property	0	\N	\N	\N	DOC_NONE	0
1724	10	\N	t	f	2015-04-08 12:49:37.591963	2016-08-05 22:49:00.210557	75	Property	0	\N	\N	\N	DOC_NONE	0
1725	11	\N	t	f	2015-04-08 12:49:39.078706	2016-08-05 22:49:00.215772	75	Property	0	\N	\N	\N	DOC_NONE	0
1727	13	\N	t	f	2015-04-08 12:49:42.053176	2016-08-05 22:49:00.225594	75	Property	0	\N	\N	\N	DOC_NONE	0
1728	14	\N	t	f	2015-04-08 12:49:43.544327	2016-08-05 22:49:00.229621	75	Property	0	\N	\N	\N	DOC_NONE	0
1729	15	\N	t	f	2015-04-08 12:49:45.037015	2016-08-05 22:49:00.233629	75	Property	0	\N	\N	\N	DOC_NONE	0
1730	16	\N	t	f	2015-04-08 12:49:46.524175	2016-08-05 22:49:00.238297	75	Property	0	\N	\N	\N	DOC_NONE	0
1731	17	\N	t	f	2015-04-08 12:49:48.01549	2016-08-05 22:49:00.242532	75	Property	0	\N	\N	\N	DOC_NONE	0
1733	2	\N	t	f	2015-04-08 12:49:51.16457	2016-08-05 22:49:00.251335	76	Property	0	\N	\N	\N	DOC_NONE	0
1734	3	\N	t	f	2015-04-08 12:49:52.65564	2016-08-05 22:49:00.255575	76	Property	0	\N	\N	\N	DOC_NONE	0
1735	4	\N	t	f	2015-04-08 12:49:54.149478	2016-08-05 22:49:00.259572	76	Property	0	\N	\N	\N	DOC_NONE	0
1736	5	\N	t	f	2015-04-08 12:49:55.639443	2016-08-05 22:49:00.263863	76	Property	0	\N	\N	\N	DOC_NONE	0
1738	7	\N	t	f	2015-04-08 12:49:58.618395	2016-08-05 22:49:00.27289	76	Property	0	\N	\N	\N	DOC_NONE	0
1739	8	\N	t	f	2015-04-08 12:50:00.187171	2016-08-05 22:49:00.276879	76	Property	0	\N	\N	\N	DOC_NONE	0
1741	10	\N	t	f	2015-04-08 12:50:03.185792	2016-08-05 22:49:00.288204	76	Property	0	\N	\N	\N	DOC_NONE	0
1742	11	\N	t	f	2015-04-08 12:50:04.750777	2016-08-05 22:49:00.292158	76	Property	0	\N	\N	\N	DOC_NONE	0
1743	12	\N	t	f	2015-04-08 12:50:06.246414	2016-08-05 22:49:00.296085	76	Property	0	\N	\N	\N	DOC_NONE	0
1746	15	\N	t	f	2015-04-08 12:50:11.102093	2016-08-05 22:49:00.303749	76	Property	0	\N	\N	\N	DOC_NONE	0
1747	16	\N	t	f	2015-04-08 12:50:12.965563	2016-08-05 22:49:00.30772	76	Property	0	\N	\N	\N	DOC_NONE	0
1748	17	\N	t	f	2015-04-08 12:50:14.456629	2016-08-05 22:49:00.311761	76	Property	0	\N	\N	\N	DOC_NONE	0
1749	1	\N	t	f	2015-04-08 12:50:16.119486	2016-08-05 22:49:00.316265	77	Property	0	\N	\N	\N	DOC_NONE	0
1751	4	\N	t	t	2015-04-08 12:50:20.102042	2016-08-05 22:49:00.320895	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
1753	9	\N	t	f	2015-04-08 12:50:26.059482	2016-08-05 22:49:00.329392	77	Property	0	\N	\N	\N	DOC_NONE	0
1754	10	\N	t	f	2015-04-08 12:50:27.56337	2016-08-05 22:49:00.333301	77	Property	0	\N	\N	\N	DOC_NONE	0
1755	17	\N	t	f	2015-04-08 12:50:35.008159	2016-08-05 22:49:00.341011	77	Property	0	\N	\N	\N	DOC_NONE	0
1756	1	\N	t	f	2015-04-08 12:50:36.664707	2016-08-05 22:49:00.345053	79	Property	0	\N	\N	\N	DOC_NONE	0
1758	3	\N	t	f	2015-04-08 12:50:39.661811	2016-08-05 22:49:00.352624	79	Property	0	\N	\N	\N	DOC_NONE	0
1759	4	\N	t	f	2015-04-08 12:50:41.150735	2016-08-05 22:49:00.356494	79	Property	0	\N	\N	\N	DOC_NONE	0
1760	5	\N	t	f	2015-04-08 12:50:42.638302	2016-08-05 22:49:00.360564	79	Property	0	\N	\N	\N	DOC_NONE	0
1761	6	\N	t	f	2015-04-08 12:50:44.12882	2016-08-05 22:49:00.364734	79	Property	0	\N	\N	\N	DOC_NONE	0
1763	8	\N	t	f	2015-04-08 12:50:47.102361	2016-08-05 22:49:00.37341	79	Property	0	\N	\N	\N	DOC_NONE	0
1764	9	\N	t	f	2015-04-08 12:50:48.589572	2016-08-05 22:49:00.377553	79	Property	0	\N	\N	\N	DOC_NONE	0
1765	10	\N	t	f	2015-04-08 12:50:50.075153	2016-08-05 22:49:00.381416	79	Property	0	\N	\N	\N	DOC_NONE	0
1766	11	\N	t	f	2015-04-08 12:50:51.564618	2016-08-05 22:49:00.386006	79	Property	0	\N	\N	\N	DOC_NONE	0
1767	12	\N	t	f	2015-04-08 12:50:53.05453	2016-08-05 22:49:00.389814	79	Property	0	\N	\N	\N	DOC_NONE	0
1770	15	\N	t	f	2015-04-08 12:50:57.537074	2016-08-05 22:49:00.398377	79	Property	0	\N	\N	\N	DOC_NONE	0
1771	16	\N	t	f	2015-04-08 12:50:59.023384	2016-08-05 22:49:00.402845	79	Property	0	\N	\N	\N	DOC_NONE	0
1772	17	\N	t	f	2015-04-08 12:51:00.508395	2016-08-05 22:49:00.407663	79	Property	0	\N	\N	\N	DOC_NONE	0
1773	1	\N	t	f	2015-04-08 12:51:02.172663	2016-08-05 22:49:00.411965	80	Property	0	\N	\N	\N	DOC_NONE	0
1775	3	\N	t	f	2015-04-08 12:51:05.148302	2016-08-05 22:49:00.42135	80	Property	0	\N	\N	\N	DOC_NONE	0
1776	4	\N	t	f	2015-04-08 12:51:06.637185	2016-08-05 22:49:00.425733	80	Property	0	\N	\N	\N	DOC_NONE	0
1777	5	\N	t	f	2015-04-08 12:51:08.123548	2016-08-05 22:49:00.430635	80	Property	0	\N	\N	\N	DOC_NONE	0
1778	6	\N	t	f	2015-04-08 12:51:09.616656	2016-08-05 22:49:00.435028	80	Property	0	\N	\N	\N	DOC_NONE	0
1779	7	\N	t	f	2015-04-08 12:51:11.131294	2016-08-05 22:49:00.439572	80	Property	0	\N	\N	\N	DOC_NONE	0
1781	9	\N	t	f	2015-04-08 12:51:14.127386	2016-08-05 22:49:00.448699	80	Property	0	\N	\N	\N	DOC_NONE	0
1782	10	\N	t	f	2015-04-08 12:51:15.611416	2016-08-05 22:49:00.453397	80	Property	0	\N	\N	\N	DOC_NONE	0
1783	11	\N	t	f	2015-04-08 12:51:17.109139	2016-08-05 22:49:00.457749	80	Property	0	\N	\N	\N	DOC_NONE	0
1784	12	\N	t	f	2015-04-08 12:51:18.609062	2016-08-05 22:49:00.46519	80	Property	0	\N	\N	\N	DOC_NONE	0
1786	14	\N	t	f	2015-04-08 12:51:21.608144	2016-08-05 22:49:00.475082	80	Property	0	\N	\N	\N	DOC_NONE	0
1787	15	\N	t	f	2015-04-08 12:51:23.106991	2016-08-05 22:49:00.479463	80	Property	0	\N	\N	\N	DOC_NONE	0
1788	16	\N	t	f	2015-04-08 12:51:24.973855	2016-08-05 22:49:00.483867	80	Property	0	\N	\N	\N	DOC_NONE	0
1789	17	\N	t	f	2015-04-08 12:51:26.464762	2016-08-05 22:49:00.488577	80	Property	0	\N	\N	\N	DOC_NONE	0
1793	9	\N	t	f	2015-04-08 12:51:37.588763	2016-08-05 22:49:00.4979	81	Property	0	\N	\N	\N	DOC_NONE	0
1794	17	\N	t	f	2015-04-08 12:51:46.061866	2016-08-05 22:49:00.502276	81	Property	0	\N	\N	\N	DOC_NONE	0
1802	1	\N	t	f	2015-04-08 12:52:08.266141	2016-08-05 22:49:00.538278	83	Property	0	\N	\N	\N	DOC_NONE	0
1803	4	\N	t	f	2015-04-08 12:52:11.739008	2016-08-05 22:49:00.543424	83	Property	0	\N	\N	\N	DOC_NONE	0
1805	6	\N	t	f	2015-04-08 12:52:14.715325	2016-08-05 22:49:00.5542	83	Property	0	\N	\N	\N	DOC_NONE	0
1806	7	\N	t	f	2015-04-08 12:52:16.201293	2016-08-05 22:49:00.56036	83	Property	0	\N	\N	\N	DOC_NONE	0
1807	8	\N	t	f	2015-04-08 12:52:17.686072	2016-08-05 22:49:00.565333	83	Property	0	\N	\N	\N	DOC_NONE	0
1808	9	\N	t	f	2015-04-08 12:52:19.173574	2016-08-05 22:49:00.570001	83	Property	0	\N	\N	\N	DOC_NONE	0
1809	10	\N	t	f	2015-04-08 12:52:20.667555	2016-08-05 22:49:00.575099	83	Property	0	\N	\N	\N	DOC_NONE	0
1812	13	\N	t	f	2015-04-08 12:52:25.133477	2016-08-05 22:49:00.622933	83	Property	0	\N	\N	\N	DOC_NONE	0
1813	14	\N	t	f	2015-04-08 12:52:26.62379	2016-08-05 22:49:00.627377	83	Property	0	\N	\N	\N	DOC_NONE	0
1814	15	\N	t	f	2015-04-08 12:52:28.112294	2016-08-05 22:49:00.632345	83	Property	0	\N	\N	\N	DOC_NONE	0
1815	16	\N	t	f	2015-04-08 12:52:29.610823	2016-08-05 22:49:00.636905	83	Property	0	\N	\N	\N	DOC_NONE	0
1818	3	\N	t	t	2015-04-08 12:52:35.608467	2016-08-05 22:49:00.64583	84	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1819	4	\N	t	f	2015-04-08 12:52:37.098625	2016-08-05 22:49:00.650171	84	Property	0	\N	\N	\N	DOC_NONE	0
1804	5	\N	t	f	2015-04-08 12:52:13.228954	2016-08-05 22:49:00.654297	83	Property	0	\N	\N	\N	DOC_NONE	0
1821	6	\N	t	f	2015-04-08 12:52:40.076129	2016-08-05 22:49:00.659246	84	Property	0	\N	\N	\N	DOC_NONE	0
1823	8	\N	t	f	2015-04-08 12:52:43.053622	2016-08-05 22:49:00.668056	84	Property	0	\N	\N	\N	DOC_NONE	0
1824	9	\N	t	f	2015-04-08 12:52:44.541104	2016-08-05 22:49:00.672307	84	Property	0	\N	\N	\N	DOC_NONE	0
1825	10	\N	t	f	2015-04-08 12:52:46.037542	2016-08-05 22:49:00.677108	84	Property	0	\N	\N	\N	DOC_NONE	0
1826	11	\N	t	f	2015-04-08 12:52:47.524996	2016-08-05 22:49:00.681419	84	Property	0	\N	\N	\N	DOC_NONE	0
1827	12	\N	t	f	2015-04-08 12:52:49.014823	2016-08-05 22:49:00.685853	84	Property	0	\N	\N	\N	DOC_NONE	0
1829	14	\N	t	f	2015-04-08 12:52:51.993862	2016-08-05 22:49:00.694581	84	Property	0	\N	\N	\N	DOC_NONE	0
1830	15	\N	t	f	2015-04-08 12:52:53.497384	2016-08-05 22:49:00.698553	84	Property	0	\N	\N	\N	DOC_NONE	0
1831	16	\N	t	f	2015-04-08 12:52:54.98496	2016-08-05 22:49:00.703488	84	Property	0	\N	\N	\N	DOC_NONE	0
1832	17	\N	t	f	2015-04-08 12:52:56.470475	2016-08-05 22:49:00.708583	84	Property	0	\N	\N	\N	DOC_NONE	0
1835	5	\N	t	f	2015-04-08 12:53:03.101622	2016-08-05 22:49:00.71896	85	Property	0	\N	\N	\N	DOC_NONE	0
1836	6	\N	t	f	2015-04-08 12:53:04.988702	2016-08-05 22:49:00.723291	85	Property	0	\N	\N	\N	DOC_NONE	0
1838	9	\N	t	f	2015-04-08 12:53:08.958697	2016-08-05 22:49:00.732094	85	Property	0	\N	\N	\N	DOC_NONE	0
1839	11	\N	t	f	2015-04-08 12:53:11.455032	2016-08-05 22:49:00.736531	85	Property	0	\N	\N	\N	DOC_NONE	0
1877	2	\N	t	t	2015-04-08 12:54:14.925027	2016-08-05 22:49:00.741232	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1795	1	\N	t	f	2015-04-08 12:51:47.719553	2016-08-24 00:46:38.773653	82	Property	0	\N	\N	\N	DOC_UNNECESSARY	1
1797	5	\N	t	f	2015-04-08 12:51:52.675956	2016-08-24 00:47:05.229189	82	Property	0	\N	\N	\N	DOC_UNNECESSARY	1
1800	11	\N	t	f	2015-04-08 12:52:00.135197	2016-08-24 01:25:05.460314	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
1801	17	\N	t	f	2015-04-08 12:52:06.60225	2016-08-24 00:58:36.627862	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
1842	1	\N	t	f	2015-04-08 12:53:20.09901	2016-08-05 22:49:00.752113	86	Property	0	\N	\N	\N	DOC_NONE	0
1843	2	\N	t	f	2015-04-08 12:53:21.966964	2016-08-05 22:49:00.757259	86	Property	0	\N	\N	\N	DOC_NONE	0
1844	3	\N	t	f	2015-04-08 12:53:23.451857	2016-08-05 22:49:00.765128	86	Property	0	\N	\N	\N	DOC_NONE	0
1845	4	\N	t	f	2015-04-08 12:53:24.945828	2016-08-05 22:49:00.769949	86	Property	0	\N	\N	\N	DOC_NONE	0
1846	5	\N	t	f	2015-04-08 12:53:26.442355	2016-08-05 22:49:00.774616	86	Property	0	\N	\N	\N	DOC_NONE	0
1848	7	\N	t	f	2015-04-08 12:53:29.795051	2016-08-05 22:49:00.784138	86	Property	0	\N	\N	\N	DOC_NONE	0
1849	8	\N	t	f	2015-04-08 12:53:31.660474	2016-08-05 22:49:00.788573	86	Property	0	\N	\N	\N	DOC_NONE	0
1850	9	\N	t	f	2015-04-08 12:53:33.524646	2016-08-05 22:49:00.793027	86	Property	0	\N	\N	\N	DOC_NONE	0
1851	10	\N	t	f	2015-04-08 12:53:35.016382	2016-08-05 22:49:00.797549	86	Property	0	\N	\N	\N	DOC_NONE	0
1853	12	\N	t	f	2015-04-08 12:53:38.372722	2016-08-05 22:49:00.807803	86	Property	0	\N	\N	\N	DOC_NONE	0
1854	13	\N	t	f	2015-04-08 12:53:39.860137	2016-08-05 22:49:00.812523	86	Property	0	\N	\N	\N	DOC_NONE	0
1855	14	\N	t	f	2015-04-08 12:53:41.350049	2016-08-05 22:49:00.817434	86	Property	0	\N	\N	\N	DOC_NONE	0
1856	15	\N	t	f	2015-04-08 12:53:42.846841	2016-08-05 22:49:00.822779	86	Property	0	\N	\N	\N	DOC_NONE	0
1859	1	\N	t	f	2015-04-08 12:53:47.494978	2016-08-05 22:49:00.831977	87	Property	0	\N	\N	\N	DOC_NONE	0
1860	2	\N	t	f	2015-04-08 12:53:49.35875	2016-08-05 22:49:00.836398	87	Property	0	\N	\N	\N	DOC_NONE	0
1861	3	\N	t	f	2015-04-08 12:53:50.846996	2016-08-05 22:49:00.8408	87	Property	0	\N	\N	\N	DOC_NONE	0
1862	4	\N	t	f	2015-04-08 12:53:52.3364	2016-08-05 22:49:00.845332	87	Property	0	\N	\N	\N	DOC_NONE	0
1863	5	\N	t	f	2015-04-08 12:53:53.906002	2016-08-05 22:49:00.849586	87	Property	0	\N	\N	\N	DOC_NONE	0
1865	7	\N	t	f	2015-04-08 12:53:56.889925	2016-08-05 22:49:00.859577	87	Property	0	\N	\N	\N	DOC_NONE	0
1866	8	\N	t	f	2015-04-08 12:53:58.37776	2016-08-05 22:49:00.864143	87	Property	0	\N	\N	\N	DOC_NONE	0
1867	9	\N	t	f	2015-04-08 12:53:59.866421	2016-08-05 22:49:00.868887	87	Property	0	\N	\N	\N	DOC_NONE	0
1868	10	\N	t	f	2015-04-08 12:54:01.354684	2016-08-05 22:49:00.874529	87	Property	0	\N	\N	\N	DOC_NONE	0
1870	12	\N	t	f	2015-04-08 12:54:04.33007	2016-08-05 22:49:00.885098	87	Property	0	\N	\N	\N	DOC_NONE	0
1871	13	\N	t	f	2015-04-08 12:54:05.815098	2016-08-05 22:49:00.888994	87	Property	0	\N	\N	\N	DOC_NONE	0
1872	14	\N	t	f	2015-04-08 12:54:07.309496	2016-08-05 22:49:00.894132	87	Property	0	\N	\N	\N	DOC_NONE	0
1873	15	\N	t	f	2015-04-08 12:54:08.799219	2016-08-05 22:49:00.900492	87	Property	0	\N	\N	\N	DOC_NONE	0
1874	16	\N	t	f	2015-04-08 12:54:10.286172	2016-08-05 22:49:00.905221	87	Property	0	\N	\N	\N	DOC_NONE	0
1876	1	\N	t	f	2015-04-08 12:54:13.43798	2016-08-05 22:49:00.913904	88	Property	0	\N	\N	\N	DOC_NONE	0
1879	4	\N	t	t	2015-04-08 12:54:17.895104	2016-08-05 22:49:00.918194	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1820	5	\N	t	f	2015-04-08 12:52:38.587731	2016-08-05 22:49:00.92269	84	Property	0	\N	\N	\N	DOC_NONE	0
1878	3	\N	t	t	2015-04-08 12:54:16.409978	2016-08-05 22:49:00.927143	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1987	8	\N	t	f	2015-04-08 12:57:20.776215	2016-08-05 22:49:00.936232	97	Property	0	\N	\N	\N	DOC_NONE	0
1988	9	\N	t	f	2015-04-08 12:57:22.267907	2016-08-05 22:49:00.940459	97	Property	0	\N	\N	\N	DOC_NONE	0
1989	10	\N	t	f	2015-04-08 12:57:23.753904	2016-08-05 22:49:00.945695	97	Property	0	\N	\N	\N	DOC_NONE	0
1990	11	\N	t	f	2015-04-08 12:57:25.240358	2016-08-05 22:49:00.95015	97	Property	0	\N	\N	\N	DOC_NONE	0
1992	13	\N	t	f	2015-04-08 12:57:28.223876	2016-08-05 22:49:00.961104	97	Property	0	\N	\N	\N	DOC_NONE	0
1993	14	\N	t	f	2015-04-08 12:57:29.705912	2016-08-05 22:49:00.965436	97	Property	0	\N	\N	\N	DOC_NONE	0
1994	15	\N	t	f	2015-04-08 12:57:31.194576	2016-08-05 22:49:00.970058	97	Property	0	\N	\N	\N	DOC_NONE	0
1995	16	\N	t	f	2015-04-08 12:57:32.679743	2016-08-05 22:49:00.974576	97	Property	0	\N	\N	\N	DOC_NONE	0
1996	17	\N	t	f	2015-04-08 12:57:34.165078	2016-08-05 22:49:00.979354	97	Property	0	\N	\N	\N	DOC_NONE	0
1998	2	\N	t	f	2015-04-08 12:57:37.30509	2016-08-05 22:49:00.988566	98	Property	0	\N	\N	\N	DOC_NONE	0
2011	15	\N	t	t	2015-04-08 12:57:56.747738	2016-08-05 22:49:00.993632	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2006	10	\N	t	t	2015-04-08 12:57:49.32408	2016-08-05 22:49:00.998259	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2001	5	\N	t	f	2015-04-08 12:57:41.875823	2016-08-05 22:49:01.003019	98	Property	0	\N	\N	\N	DOC_NONE	0
2008	12	\N	t	t	2015-04-08 12:57:52.29487	2016-08-05 22:49:01.013176	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2004	8	\N	t	f	2015-04-08 12:57:46.353301	2016-08-05 22:49:01.017434	98	Property	0	\N	\N	\N	DOC_NONE	0
2005	9	\N	t	f	2015-04-08 12:57:47.842693	2016-08-05 22:49:01.021918	98	Property	0	\N	\N	\N	DOC_NONE	0
2003	7	\N	t	t	2015-04-08 12:57:44.864859	2016-08-05 22:49:01.026437	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2007	11	\N	t	f	2015-04-08 12:57:50.809688	2016-08-05 22:49:01.030575	98	Property	0	\N	\N	\N	DOC_NONE	0
1999	3	\N	t	t	2015-04-08 12:57:38.900053	2016-08-05 22:49:01.040434	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2010	14	\N	t	f	2015-04-08 12:57:55.264843	2016-08-05 22:49:01.045411	98	Property	0	\N	\N	\N	DOC_NONE	0
2012	16	\N	t	f	2015-04-08 12:57:58.2339	2016-08-05 22:49:01.050545	98	Property	0	\N	\N	\N	DOC_NONE	0
2013	17	\N	t	f	2015-04-08 12:57:59.71993	2016-08-05 22:49:01.055713	98	Property	0	\N	\N	\N	DOC_NONE	0
2015	2	\N	t	f	2015-04-08 12:58:02.917137	2016-08-05 22:49:01.065219	99	Property	0	\N	\N	\N	DOC_NONE	0
2016	3	\N	t	f	2015-04-08 12:58:04.408641	2016-08-05 22:49:01.069165	99	Property	0	\N	\N	\N	DOC_NONE	0
2017	4	\N	t	f	2015-04-08 12:58:05.911983	2016-08-05 22:49:01.07353	99	Property	0	\N	\N	\N	DOC_NONE	0
2018	5	\N	t	f	2015-04-08 12:58:07.402086	2016-08-05 22:49:01.078169	99	Property	0	\N	\N	\N	DOC_NONE	0
2020	7	\N	t	f	2015-04-08 12:58:10.372126	2016-08-05 22:49:01.08811	99	Property	0	\N	\N	\N	DOC_NONE	0
2021	8	\N	t	f	2015-04-08 12:58:11.861287	2016-08-05 22:49:01.093231	99	Property	0	\N	\N	\N	DOC_NONE	0
2022	9	\N	t	f	2015-04-08 12:58:13.345693	2016-08-05 22:49:01.098914	99	Property	0	\N	\N	\N	DOC_NONE	0
2023	10	\N	t	f	2015-04-08 12:58:15.201103	2016-08-05 22:49:01.104259	99	Property	0	\N	\N	\N	DOC_NONE	0
2024	11	\N	t	f	2015-04-08 12:58:16.689298	2016-08-05 22:49:01.110027	99	Property	0	\N	\N	\N	DOC_NONE	0
2026	13	\N	t	f	2015-04-08 12:58:19.684365	2016-08-05 22:49:01.120538	99	Property	0	\N	\N	\N	DOC_NONE	0
2027	14	\N	t	f	2015-04-08 12:58:21.179412	2016-08-05 22:49:01.127357	99	Property	0	\N	\N	\N	DOC_NONE	0
2028	15	\N	t	f	2015-04-08 12:58:22.68123	2016-08-05 22:49:01.1326	99	Property	0	\N	\N	\N	DOC_NONE	0
2029	16	\N	t	f	2015-04-08 12:58:24.180361	2016-08-05 22:49:01.137638	99	Property	0	\N	\N	\N	DOC_NONE	0
2031	1	\N	t	f	2015-04-08 12:58:27.317467	2016-08-05 22:49:01.147988	100	Property	0	\N	\N	\N	DOC_NONE	0
2032	2	\N	t	f	2015-04-08 12:58:28.797788	2016-08-05 22:49:01.153047	100	Property	0	\N	\N	\N	DOC_NONE	0
2034	4	\N	t	f	2015-04-08 12:58:31.758059	2016-08-05 22:49:01.168289	100	Property	0	\N	\N	\N	DOC_NONE	0
2035	5	\N	t	f	2015-04-08 12:58:33.24128	2016-08-05 22:49:01.173337	100	Property	0	\N	\N	\N	DOC_NONE	0
2036	6	\N	t	f	2015-04-08 12:58:34.725144	2016-08-05 22:49:01.178593	100	Property	0	\N	\N	\N	DOC_NONE	0
2038	8	\N	t	f	2015-04-08 12:58:37.704615	2016-08-05 22:49:01.191811	100	Property	0	\N	\N	\N	DOC_NONE	0
2039	9	\N	t	f	2015-04-08 12:58:39.192774	2016-08-05 22:49:01.197316	100	Property	0	\N	\N	\N	DOC_NONE	0
2040	10	\N	t	f	2015-04-08 12:58:40.71145	2016-08-05 22:49:01.205024	100	Property	0	\N	\N	\N	DOC_NONE	0
2041	11	\N	t	f	2015-04-08 12:58:42.203637	2016-08-05 22:49:01.211852	100	Property	0	\N	\N	\N	DOC_NONE	0
2042	12	\N	t	f	2015-04-08 12:58:43.705236	2016-08-05 22:49:01.217064	100	Property	0	\N	\N	\N	DOC_NONE	0
2044	14	\N	t	f	2015-04-08 12:58:46.771242	2016-08-05 22:49:01.231988	100	Property	0	\N	\N	\N	DOC_NONE	0
2045	15	\N	t	f	2015-04-08 12:58:48.257458	2016-08-05 22:49:01.237916	100	Property	0	\N	\N	\N	DOC_NONE	0
2046	16	\N	t	f	2015-04-08 12:58:49.75169	2016-08-05 22:49:01.243293	100	Property	0	\N	\N	\N	DOC_NONE	0
2047	17	\N	t	f	2015-04-08 12:58:51.248188	2016-08-05 22:49:01.249578	100	Property	0	\N	\N	\N	DOC_NONE	0
2049	2	\N	t	f	2015-04-08 12:58:54.416355	2016-08-05 22:49:01.261863	101	Property	0	\N	\N	\N	DOC_NONE	0
2050	4	\N	t	f	2015-04-08 12:58:56.917464	2016-08-05 22:49:01.266238	101	Property	0	\N	\N	\N	DOC_NONE	0
2051	5	\N	t	f	2015-04-08 12:58:58.408621	2016-08-05 22:49:01.272235	101	Property	0	\N	\N	\N	DOC_NONE	0
2052	6	\N	t	f	2015-04-08 12:59:00.666634	2016-08-05 22:49:01.277292	101	Property	0	\N	\N	\N	DOC_NONE	0
2054	10	\N	t	f	2015-04-08 12:59:05.70066	2016-08-05 22:49:01.290874	101	Property	0	\N	\N	\N	DOC_NONE	0
2055	11	\N	t	f	2015-04-08 12:59:07.186551	2016-08-05 22:49:01.296548	101	Property	0	\N	\N	\N	DOC_NONE	0
2056	12	\N	t	f	2015-04-08 12:59:08.667325	2016-08-05 22:49:01.303769	101	Property	0	\N	\N	\N	DOC_NONE	0
2057	13	\N	t	f	2015-04-08 12:59:10.147503	2016-08-05 22:49:01.31014	101	Property	0	\N	\N	\N	DOC_NONE	0
1997	1	\N	t	t	2015-04-08 12:57:35.820134	2016-08-05 22:49:01.315215	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2060	1	\N	t	f	2015-04-08 12:59:16.750473	2016-08-05 22:49:01.328755	102	Property	0	\N	\N	\N	DOC_NONE	0
2061	4	\N	t	f	2015-04-08 12:59:20.221973	2016-08-05 22:49:01.33345	102	Property	0	\N	\N	\N	DOC_NONE	0
2062	5	\N	t	f	2015-04-08 12:59:21.702562	2016-08-05 22:49:01.338104	102	Property	0	\N	\N	\N	DOC_NONE	0
2063	6	\N	t	f	2015-04-08 12:59:23.235361	2016-08-05 22:49:01.342959	102	Property	0	\N	\N	\N	DOC_NONE	0
2065	8	\N	t	f	2015-04-08 12:59:26.21928	2016-08-05 22:49:01.354091	102	Property	0	\N	\N	\N	DOC_NONE	0
2066	9	\N	t	f	2015-04-08 12:59:27.707232	2016-08-05 22:49:01.359276	102	Property	0	\N	\N	\N	DOC_NONE	0
2067	10	\N	t	f	2015-04-08 12:59:29.187005	2016-08-05 22:49:01.366591	102	Property	0	\N	\N	\N	DOC_NONE	0
2068	11	\N	t	f	2015-04-08 12:59:30.678827	2016-08-05 22:49:01.371199	102	Property	0	\N	\N	\N	DOC_NONE	0
2069	12	\N	t	f	2015-04-08 12:59:32.181658	2016-08-05 22:49:01.375833	102	Property	0	\N	\N	\N	DOC_NONE	0
2071	14	\N	t	f	2015-04-08 12:59:35.158134	2016-08-05 22:49:01.385529	102	Property	0	\N	\N	\N	DOC_NONE	0
2073	16	\N	t	f	2015-04-08 12:59:38.141772	2016-08-05 22:49:01.394365	102	Property	0	\N	\N	\N	DOC_NONE	0
2074	17	\N	t	f	2015-04-08 12:59:39.630648	2016-08-05 22:49:01.399273	102	Property	0	\N	\N	\N	DOC_NONE	0
2075	1	\N	t	f	2015-04-08 12:59:41.280074	2016-08-05 22:49:01.404408	103	Property	0	\N	\N	\N	DOC_NONE	0
2078	5	\N	t	f	2015-04-08 12:59:47.113694	2016-08-05 22:49:01.417373	103	Property	0	\N	\N	\N	DOC_NONE	0
2079	6	\N	t	f	2015-04-08 12:59:48.984875	2016-08-05 22:49:01.422012	103	Property	0	\N	\N	\N	DOC_NONE	0
2080	9	\N	t	f	2015-04-08 12:59:52.481386	2016-08-05 22:49:01.427687	103	Property	0	\N	\N	\N	DOC_NONE	0
2081	10	\N	t	f	2015-04-08 12:59:54.361617	2016-08-05 22:49:01.439784	103	Property	0	\N	\N	\N	DOC_NONE	0
2083	14	\N	t	f	2015-04-08 12:59:59.350646	2016-08-05 22:49:01.450985	103	Property	0	\N	\N	\N	DOC_NONE	0
2084	16	\N	t	f	2015-04-08 13:00:02.251962	2016-08-05 22:49:01.460584	103	Property	0	\N	\N	\N	DOC_NONE	0
2085	17	\N	t	f	2015-04-08 13:00:03.799129	2016-08-05 22:49:01.465747	103	Property	0	\N	\N	\N	DOC_NONE	0
2089	4	\N	t	t	2015-04-08 13:00:10.71254	2016-08-05 22:49:01.470366	186	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2087	2	\N	t	f	2015-04-08 13:00:07.31564	2016-08-05 22:49:01.475354	186	Property	0	\N	\N	\N	DOC_NONE	0
2091	6	\N	t	t	2015-04-08 13:00:13.694902	2016-08-05 22:49:01.484176	186	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2098	13	\N	t	t	2015-04-08 13:00:24.181499	2016-08-05 22:49:01.48834	186	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2090	5	\N	t	t	2015-04-08 13:00:12.201721	2016-08-05 22:49:01.492804	186	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2092	7	\N	t	f	2015-04-08 13:00:15.206893	2016-08-05 22:49:01.497329	186	Property	0	\N	\N	\N	DOC_NONE	0
2094	9	\N	t	f	2015-04-08 13:00:18.185099	2016-08-05 22:49:01.507407	186	Property	0	\N	\N	\N	DOC_NONE	0
2095	10	\N	t	f	2015-04-08 13:00:19.682664	2016-08-05 22:49:01.51166	186	Property	0	\N	\N	\N	DOC_NONE	0
2096	11	\N	t	f	2015-04-08 13:00:21.183918	2016-08-05 22:49:01.516191	186	Property	0	\N	\N	\N	DOC_NONE	0
2097	12	\N	t	f	2015-04-08 13:00:22.681666	2016-08-05 22:49:01.520201	186	Property	0	\N	\N	\N	DOC_NONE	0
2134	1	\N	t	t	2015-04-08 13:01:39.967787	2016-08-05 22:49:01.524567	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2101	16	\N	t	f	2015-04-08 13:00:28.661766	2016-08-05 22:49:01.532938	186	Property	0	\N	\N	\N	DOC_NONE	0
2102	17	\N	t	f	2015-04-08 13:00:30.166291	2016-08-05 22:49:01.536879	186	Property	0	\N	\N	\N	DOC_NONE	0
2115	6	\N	t	t	2015-04-08 13:01:00.68585	2016-08-05 22:49:01.540837	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2105	6	\N	t	f	2015-04-08 13:00:38.212804	2016-08-05 22:49:01.544712	106	Property	0	\N	\N	\N	DOC_NONE	0
2107	8	\N	t	f	2015-04-08 13:00:41.197548	2016-08-05 22:49:01.552324	106	Property	0	\N	\N	\N	DOC_NONE	0
2108	9	\N	t	f	2015-04-08 13:00:42.698095	2016-08-05 22:49:01.556846	106	Property	0	\N	\N	\N	DOC_NONE	0
2109	11	\N	t	f	2015-04-08 13:00:45.195289	2016-08-05 22:49:01.562281	106	Property	0	\N	\N	\N	DOC_NONE	0
2110	12	\N	t	f	2015-04-08 13:00:46.720299	2016-08-05 22:49:01.567136	106	Property	0	\N	\N	\N	DOC_NONE	0
2112	17	\N	t	f	2015-04-08 13:00:52.811598	2016-08-05 22:49:01.578866	106	Property	0	\N	\N	\N	DOC_NONE	0
2113	1	\N	t	f	2015-04-08 13:00:54.545657	2016-08-05 22:49:01.583335	107	Property	0	\N	\N	\N	DOC_NONE	0
2086	1	\N	t	t	2015-04-08 13:00:05.451326	2016-08-05 22:49:01.587381	186	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2114	3	\N	t	t	2015-04-08 13:00:57.069882	2016-08-05 22:49:01.591356	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2116	9	\N	t	f	2015-04-08 13:01:04.195258	2016-08-05 22:49:01.596239	107	Property	0	\N	\N	\N	DOC_NONE	0
2118	17	\N	t	f	2015-04-08 13:01:13.18903	2016-08-05 22:49:01.606459	107	Property	0	\N	\N	\N	DOC_NONE	0
2119	1	\N	t	f	2015-04-08 13:01:14.848925	2016-08-05 22:49:01.611141	108	Property	0	\N	\N	\N	DOC_NONE	0
2120	4	\N	t	f	2015-04-08 13:01:18.70316	2016-08-05 22:49:01.616706	108	Property	0	\N	\N	\N	DOC_NONE	0
2121	5	\N	t	f	2015-04-08 13:01:20.210162	2016-08-05 22:49:01.621397	108	Property	0	\N	\N	\N	DOC_NONE	0
2123	7	\N	t	f	2015-04-08 13:01:23.196271	2016-08-05 22:49:01.632507	108	Property	0	\N	\N	\N	DOC_NONE	0
2125	9	\N	t	f	2015-04-08 13:01:26.294118	2016-08-05 22:49:01.636855	108	Property	0	\N	\N	\N	DOC_NONE	0
2127	11	\N	t	f	2015-04-08 13:01:29.300796	2016-08-05 22:49:01.649994	108	Property	0	\N	\N	\N	DOC_NONE	0
2128	12	\N	t	f	2015-04-08 13:01:30.796219	2016-08-05 22:49:01.655212	108	Property	0	\N	\N	\N	DOC_NONE	0
2129	13	\N	t	f	2015-04-08 13:01:32.297707	2016-08-05 22:49:01.661097	108	Property	0	\N	\N	\N	DOC_NONE	0
2131	15	\N	t	f	2015-04-08 13:01:35.296783	2016-08-05 22:49:01.670896	108	Property	0	\N	\N	\N	DOC_NONE	0
2132	16	\N	t	f	2015-04-08 13:01:36.793647	2016-08-05 22:49:01.676141	108	Property	0	\N	\N	\N	DOC_NONE	0
2133	17	\N	t	f	2015-04-08 13:01:38.301144	2016-08-05 22:49:01.68083	108	Property	0	\N	\N	\N	DOC_NONE	0
2142	1	\N	t	t	2015-04-08 13:02:01.488452	2016-08-05 22:49:01.685851	110	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2135	3	\N	t	f	2015-04-08 13:01:42.466054	2016-08-05 22:49:01.690917	109	Property	0	\N	\N	\N	DOC_NONE	0
2137	9	\N	t	f	2015-04-08 13:01:49.454194	2016-08-05 22:49:01.701568	109	Property	0	\N	\N	\N	DOC_NONE	0
2138	10	\N	t	f	2015-04-08 13:01:50.940818	2016-08-05 22:49:01.707089	109	Property	0	\N	\N	\N	DOC_NONE	0
2139	12	\N	t	f	2015-04-08 13:01:53.812285	2016-08-05 22:49:01.712479	109	Property	0	\N	\N	\N	DOC_NONE	0
2140	13	\N	t	f	2015-04-08 13:01:55.315741	2016-08-05 22:49:01.718327	109	Property	0	\N	\N	\N	DOC_NONE	0
2143	4	\N	t	f	2015-04-08 13:02:04.995439	2016-08-05 22:49:01.728689	110	Property	0	\N	\N	\N	DOC_NONE	0
2144	5	\N	t	f	2015-04-08 13:02:06.4919	2016-08-05 22:49:01.73389	110	Property	0	\N	\N	\N	DOC_NONE	0
2145	6	\N	t	f	2015-04-08 13:02:08.357936	2016-08-05 22:49:01.739334	110	Property	0	\N	\N	\N	DOC_NONE	0
2146	7	\N	t	f	2015-04-08 13:02:09.844348	2016-08-05 22:49:01.744584	110	Property	0	\N	\N	\N	DOC_NONE	0
2152	13	\N	t	f	2015-04-08 13:02:18.846791	2016-08-05 22:49:01.755421	110	Property	0	\N	\N	\N	DOC_NONE	0
2153	14	\N	t	f	2015-04-08 13:02:20.344484	2016-08-05 22:49:01.760638	110	Property	0	\N	\N	\N	DOC_NONE	0
2154	15	\N	t	f	2015-04-08 13:02:21.84803	2016-08-05 22:49:01.766035	110	Property	0	\N	\N	\N	DOC_NONE	0
2155	16	\N	t	f	2015-04-08 13:02:23.351233	2016-08-05 22:49:01.771891	110	Property	0	\N	\N	\N	DOC_NONE	0
2156	17	\N	t	f	2015-04-08 13:02:24.841871	2016-08-05 22:49:01.777209	110	Property	0	\N	\N	\N	DOC_NONE	0
2165	2	\N	t	t	2015-04-08 13:02:48.624725	2016-08-05 22:49:01.789002	112	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2159	6	\N	t	f	2015-04-08 13:02:32.502342	2016-08-05 22:49:01.793833	111	Property	0	\N	\N	\N	DOC_NONE	0
2160	9	\N	t	f	2015-04-08 13:02:35.973624	2016-08-05 22:49:01.798228	111	Property	0	\N	\N	\N	DOC_NONE	0
2162	12	\N	t	f	2015-04-08 13:02:39.964841	2016-08-05 22:49:01.802585	111	Property	0	\N	\N	\N	DOC_NONE	0
2164	17	\N	t	f	2015-04-08 13:02:45.936722	2016-08-05 22:49:01.812757	111	Property	0	\N	\N	\N	DOC_NONE	0
2166	3	\N	t	t	2015-04-08 13:02:50.132663	2016-08-05 22:49:01.819635	112	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2157	1	\N	t	f	2015-04-08 13:02:26.520155	2016-08-05 22:49:01.825059	111	Property	0	\N	\N	\N	DOC_NONE	0
2168	5	\N	t	f	2015-04-08 13:02:53.136245	2016-08-05 22:49:01.829755	112	Property	0	\N	\N	\N	DOC_NONE	0
2169	6	\N	t	f	2015-04-08 13:02:54.63426	2016-08-05 22:49:01.834742	112	Property	0	\N	\N	\N	DOC_NONE	0
2171	8	\N	t	f	2015-04-08 13:02:57.621998	2016-08-05 22:49:01.844142	112	Property	0	\N	\N	\N	DOC_NONE	0
2172	9	\N	t	f	2015-04-08 13:02:59.125579	2016-08-05 22:49:01.849306	112	Property	0	\N	\N	\N	DOC_NONE	0
2173	10	\N	t	f	2015-04-08 13:03:00.631172	2016-08-05 22:49:01.854303	112	Property	0	\N	\N	\N	DOC_NONE	0
2174	11	\N	t	f	2015-04-08 13:03:02.19328	2016-08-05 22:49:01.859428	112	Property	0	\N	\N	\N	DOC_NONE	0
2176	13	\N	t	f	2015-04-08 13:03:05.193278	2016-08-05 22:49:01.869445	112	Property	0	\N	\N	\N	DOC_NONE	0
2177	14	\N	t	f	2015-04-08 13:03:06.687382	2016-08-05 22:49:01.873813	112	Property	0	\N	\N	\N	DOC_NONE	0
2178	15	\N	t	f	2015-04-08 13:03:08.188671	2016-08-05 22:49:01.877858	112	Property	0	\N	\N	\N	DOC_NONE	0
2179	16	\N	t	f	2015-04-08 13:03:09.683142	2016-08-05 22:49:01.882814	112	Property	0	\N	\N	\N	DOC_NONE	0
2182	6	\N	t	f	2015-04-08 13:03:18.412784	2016-08-05 22:49:01.892501	113	Property	0	\N	\N	\N	DOC_NONE	0
2183	10	\N	t	f	2015-04-08 13:03:22.917496	2016-08-05 22:49:01.897369	113	Property	0	\N	\N	\N	DOC_NONE	0
2184	17	\N	t	f	2015-04-08 13:03:30.760603	2016-08-05 22:49:01.902024	113	Property	0	\N	\N	\N	DOC_NONE	0
2185	1	\N	t	f	2015-04-08 13:03:32.421883	2016-08-05 22:49:01.906593	114	Property	0	\N	\N	\N	DOC_NONE	0
2186	2	\N	t	f	2015-04-08 13:03:33.926571	2016-08-05 22:49:01.91126	114	Property	0	\N	\N	\N	DOC_NONE	0
2188	4	\N	t	f	2015-04-08 13:03:36.931909	2016-08-05 22:49:01.920999	114	Property	0	\N	\N	\N	DOC_NONE	0
2189	5	\N	t	f	2015-04-08 13:03:38.446275	2016-08-05 22:49:01.925595	114	Property	0	\N	\N	\N	DOC_NONE	0
2191	7	\N	t	f	2015-04-08 13:03:41.435557	2016-08-05 22:49:01.930423	114	Property	0	\N	\N	\N	DOC_NONE	0
2192	8	\N	t	f	2015-04-08 13:03:42.979325	2016-08-05 22:49:01.935405	114	Property	0	\N	\N	\N	DOC_NONE	0
2194	10	\N	t	f	2015-04-08 13:03:46.006979	2016-08-05 22:49:01.94796	114	Property	0	\N	\N	\N	DOC_NONE	0
2195	11	\N	t	f	2015-04-08 13:03:47.880857	2016-08-05 22:49:01.953354	114	Property	0	\N	\N	\N	DOC_NONE	0
2196	12	\N	t	f	2015-04-08 13:03:49.38822	2016-08-05 22:49:01.958339	114	Property	0	\N	\N	\N	DOC_NONE	0
2197	13	\N	t	f	2015-04-08 13:03:50.939268	2016-08-05 22:49:01.963214	114	Property	0	\N	\N	\N	DOC_NONE	0
2198	14	\N	t	f	2015-04-08 13:03:52.497402	2016-08-05 22:49:01.967285	114	Property	0	\N	\N	\N	DOC_NONE	0
2200	16	\N	t	f	2015-04-08 13:03:55.503137	2016-08-05 22:49:01.98147	114	Property	0	\N	\N	\N	DOC_NONE	0
2201	17	\N	t	f	2015-04-08 13:03:57.001586	2016-08-05 22:49:01.986665	114	Property	0	\N	\N	\N	DOC_NONE	0
2202	1	\N	t	f	2015-04-08 13:03:58.698002	2016-08-05 22:49:01.991721	115	Property	0	\N	\N	\N	DOC_NONE	0
2203	2	\N	t	f	2015-04-08 13:04:00.309475	2016-08-05 22:49:01.996546	115	Property	0	\N	\N	\N	DOC_NONE	0
2205	4	\N	t	f	2015-04-08 13:04:03.342963	2016-08-05 22:49:02.006558	115	Property	0	\N	\N	\N	DOC_NONE	0
2206	5	\N	t	f	2015-04-08 13:04:04.842198	2016-08-05 22:49:02.012287	115	Property	0	\N	\N	\N	DOC_NONE	0
2207	6	\N	t	f	2015-04-08 13:04:06.35725	2016-08-05 22:49:02.017434	115	Property	0	\N	\N	\N	DOC_NONE	0
2208	7	\N	t	f	2015-04-08 13:04:07.901768	2016-08-05 22:49:02.022541	115	Property	0	\N	\N	\N	DOC_NONE	0
2210	9	\N	t	f	2015-04-08 13:04:10.958362	2016-08-05 22:49:02.03336	115	Property	0	\N	\N	\N	DOC_NONE	0
2211	10	\N	t	f	2015-04-08 13:04:12.840374	2016-08-05 22:49:02.038599	115	Property	0	\N	\N	\N	DOC_NONE	0
2212	11	\N	t	f	2015-04-08 13:04:14.342206	2016-08-05 22:49:02.04388	115	Property	0	\N	\N	\N	DOC_NONE	0
2214	13	\N	t	f	2015-04-08 13:04:17.360642	2016-08-05 22:49:02.048912	115	Property	0	\N	\N	\N	DOC_NONE	0
2215	14	\N	t	f	2015-04-08 13:04:18.922577	2016-08-05 22:49:02.053618	115	Property	0	\N	\N	\N	DOC_NONE	0
2217	16	\N	t	f	2015-04-08 13:04:21.956568	2016-08-05 22:49:02.063437	115	Property	0	\N	\N	\N	DOC_NONE	0
2218	17	\N	t	f	2015-04-08 13:04:23.450659	2016-08-05 22:49:02.068529	115	Property	0	\N	\N	\N	DOC_NONE	0
2219	1	\N	t	f	2015-04-08 13:04:25.122626	2016-08-05 22:49:02.073932	116	Property	0	\N	\N	\N	DOC_NONE	0
2220	2	\N	t	f	2015-04-08 13:04:26.615141	2016-08-05 22:49:02.079614	116	Property	0	\N	\N	\N	DOC_NONE	0
2222	4	\N	t	f	2015-04-08 13:04:29.608392	2016-08-05 22:49:02.089575	116	Property	0	\N	\N	\N	DOC_NONE	0
2223	5	\N	t	f	2015-04-08 13:04:31.119485	2016-08-05 22:49:02.095827	116	Property	0	\N	\N	\N	DOC_NONE	0
2225	7	\N	t	f	2015-04-08 13:04:34.114356	2016-08-05 22:49:02.107602	116	Property	0	\N	\N	\N	DOC_NONE	0
2226	8	\N	t	f	2015-04-08 13:04:35.614476	2016-08-05 22:49:02.112966	116	Property	0	\N	\N	\N	DOC_NONE	0
2227	9	\N	t	f	2015-04-08 13:04:37.116079	2016-08-05 22:49:02.118002	116	Property	0	\N	\N	\N	DOC_NONE	0
2229	11	\N	t	f	2015-04-08 13:04:40.104495	2016-08-05 22:49:02.128067	116	Property	0	\N	\N	\N	DOC_NONE	0
2230	12	\N	t	f	2015-04-08 13:04:42.009587	2016-08-05 22:49:02.133552	116	Property	0	\N	\N	\N	DOC_NONE	0
2234	16	\N	t	f	2015-04-08 13:04:48.77584	2016-08-05 22:49:02.14056	116	Property	0	\N	\N	\N	DOC_NONE	0
2235	17	\N	t	f	2015-04-08 13:04:50.27187	2016-08-05 22:49:02.146136	116	Property	0	\N	\N	\N	DOC_NONE	0
2181	1	\N	t	t	2015-04-08 13:03:12.838446	2016-08-05 22:49:02.151161	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2322	11	\N	t	f	2015-04-08 13:07:32.133364	2016-08-05 22:49:02.161363	125	Property	0	\N	\N	\N	DOC_NONE	0
2323	12	\N	t	f	2015-04-08 13:07:33.651158	2016-08-05 22:49:02.1661	125	Property	0	\N	\N	\N	DOC_NONE	0
2324	13	\N	t	f	2015-04-08 13:07:35.149485	2016-08-05 22:49:02.171285	125	Property	0	\N	\N	\N	DOC_NONE	0
2316	4	\N	t	t	2015-04-08 13:07:22.062041	2016-08-05 22:49:02.176455	125	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2327	16	\N	t	f	2015-04-08 13:07:39.655668	2016-08-05 22:49:02.186253	125	Property	0	\N	\N	\N	DOC_NONE	0
2328	17	\N	t	f	2015-04-08 13:07:41.150268	2016-08-05 22:49:02.191337	125	Property	0	\N	\N	\N	DOC_NONE	0
2329	1	\N	t	f	2015-04-08 13:07:42.814338	2016-08-05 22:49:02.196458	126	Property	0	\N	\N	\N	DOC_NONE	0
2331	8	\N	t	f	2015-04-08 13:07:51.210346	2016-08-05 22:49:02.201556	126	Property	0	\N	\N	\N	DOC_NONE	0
2333	10	\N	t	f	2015-04-08 13:07:54.207407	2016-08-05 22:49:02.211926	126	Property	0	\N	\N	\N	DOC_NONE	0
2334	17	\N	t	f	2015-04-08 13:08:01.705669	2016-08-05 22:49:02.218131	126	Property	0	\N	\N	\N	DOC_NONE	0
2347	13	\N	t	t	2015-04-08 13:08:21.436156	2016-08-05 22:49:02.224027	128	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2336	2	\N	t	f	2015-04-08 13:08:04.874035	2016-08-05 22:49:02.229111	128	Property	0	\N	\N	\N	DOC_NONE	0
2337	3	\N	t	f	2015-04-08 13:08:06.377609	2016-08-05 22:49:02.23436	128	Property	0	\N	\N	\N	DOC_NONE	0
2339	5	\N	t	f	2015-04-08 13:08:09.447666	2016-08-05 22:49:02.248569	128	Property	0	\N	\N	\N	DOC_NONE	0
2340	6	\N	t	f	2015-04-08 13:08:10.948135	2016-08-05 22:49:02.253401	128	Property	0	\N	\N	\N	DOC_NONE	0
2342	8	\N	t	f	2015-04-08 13:08:13.929535	2016-08-05 22:49:02.258543	128	Property	0	\N	\N	\N	DOC_NONE	0
2343	9	\N	t	f	2015-04-08 13:08:15.430777	2016-08-05 22:49:02.265433	128	Property	0	\N	\N	\N	DOC_NONE	0
2346	12	\N	t	f	2015-04-08 13:08:19.936525	2016-08-05 22:49:02.281351	128	Property	0	\N	\N	\N	DOC_NONE	0
2330	3	\N	t	t	2015-04-08 13:07:45.310432	2016-08-05 22:49:02.286199	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2348	14	\N	t	f	2015-04-08 13:08:22.944975	2016-08-05 22:49:02.290084	128	Property	0	\N	\N	\N	DOC_NONE	0
2349	15	\N	t	f	2015-04-08 13:08:24.432589	2016-08-05 22:49:02.294413	128	Property	0	\N	\N	\N	DOC_NONE	0
2350	16	\N	t	f	2015-04-08 13:08:25.94086	2016-08-05 22:49:02.29864	128	Property	0	\N	\N	\N	DOC_NONE	0
2352	1	\N	t	f	2015-04-08 13:08:29.143971	2016-08-05 22:49:02.307719	129	Property	0	\N	\N	\N	DOC_NONE	0
2353	2	\N	t	f	2015-04-08 13:08:31.035218	2016-08-05 22:49:02.312129	129	Property	0	\N	\N	\N	DOC_NONE	0
2354	3	\N	t	f	2015-04-08 13:08:32.529142	2016-08-05 22:49:02.316441	129	Property	0	\N	\N	\N	DOC_NONE	0
2355	4	\N	t	f	2015-04-08 13:08:34.023145	2016-08-05 22:49:02.32065	129	Property	0	\N	\N	\N	DOC_NONE	0
2357	6	\N	t	f	2015-04-08 13:08:37.022049	2016-08-05 22:49:02.329443	129	Property	0	\N	\N	\N	DOC_NONE	0
2358	7	\N	t	f	2015-04-08 13:08:38.517533	2016-08-05 22:49:02.334562	129	Property	0	\N	\N	\N	DOC_NONE	0
2359	8	\N	t	f	2015-04-08 13:08:40.018809	2016-08-05 22:49:02.339306	129	Property	0	\N	\N	\N	DOC_NONE	0
2360	9	\N	t	f	2015-04-08 13:08:41.884952	2016-08-05 22:49:02.345046	129	Property	0	\N	\N	\N	DOC_NONE	0
2362	11	\N	t	f	2015-04-08 13:08:44.881537	2016-08-05 22:49:02.354942	129	Property	0	\N	\N	\N	DOC_NONE	0
2363	12	\N	t	f	2015-04-08 13:08:46.379484	2016-08-05 22:49:02.361238	129	Property	0	\N	\N	\N	DOC_NONE	0
2364	13	\N	t	f	2015-04-08 13:08:48.255314	2016-08-05 22:49:02.366798	129	Property	0	\N	\N	\N	DOC_NONE	0
2365	14	\N	t	f	2015-04-08 13:08:49.784279	2016-08-05 22:49:02.371813	129	Property	0	\N	\N	\N	DOC_NONE	0
2366	15	\N	t	f	2015-04-08 13:08:51.310308	2016-08-05 22:49:02.376202	129	Property	0	\N	\N	\N	DOC_NONE	0
2369	1	\N	t	f	2015-04-08 13:08:55.976815	2016-08-05 22:49:02.38603	130	Property	0	\N	\N	\N	DOC_NONE	0
2335	1	\N	t	t	2015-04-08 13:08:03.372476	2016-08-05 22:49:02.390493	128	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2371	6	\N	t	f	2015-04-08 13:09:02.344115	2016-08-05 22:49:02.397425	130	Property	0	\N	\N	\N	DOC_NONE	0
2372	9	\N	t	f	2015-04-08 13:09:05.836698	2016-08-05 22:49:02.402154	130	Property	0	\N	\N	\N	DOC_NONE	0
2374	17	\N	t	f	2015-04-08 13:09:14.94012	2016-08-05 22:49:02.410819	130	Property	0	\N	\N	\N	DOC_NONE	0
2375	1	\N	t	f	2015-04-08 13:09:16.610988	2016-08-05 22:49:02.417572	144	Property	0	\N	\N	\N	DOC_NONE	0
2376	2	\N	t	f	2015-04-08 13:09:18.103019	2016-08-05 22:49:02.423262	144	Property	0	\N	\N	\N	DOC_NONE	0
2377	3	\N	t	f	2015-04-08 13:09:19.639328	2016-08-05 22:49:02.428223	144	Property	0	\N	\N	\N	DOC_NONE	0
2378	4	\N	t	f	2015-04-08 13:09:21.509576	2016-08-05 22:49:02.433506	144	Property	0	\N	\N	\N	DOC_NONE	0
2380	6	\N	t	f	2015-04-08 13:09:24.534943	2016-08-05 22:49:02.442959	144	Property	0	\N	\N	\N	DOC_NONE	0
2381	7	\N	t	f	2015-04-08 13:09:26.030094	2016-08-05 22:49:02.447607	144	Property	0	\N	\N	\N	DOC_NONE	0
2382	8	\N	t	f	2015-04-08 13:09:27.535351	2016-08-05 22:49:02.451837	144	Property	0	\N	\N	\N	DOC_NONE	0
2383	9	\N	t	f	2015-04-08 13:09:29.037302	2016-08-05 22:49:02.457349	144	Property	0	\N	\N	\N	DOC_NONE	0
2385	11	\N	t	f	2015-04-08 13:09:32.027156	2016-08-05 22:49:02.467227	144	Property	0	\N	\N	\N	DOC_NONE	0
2386	12	\N	t	f	2015-04-08 13:09:33.871435	2016-08-05 22:49:02.47157	144	Property	0	\N	\N	\N	DOC_NONE	0
2387	13	\N	t	f	2015-04-08 13:09:35.3681	2016-08-05 22:49:02.476264	144	Property	0	\N	\N	\N	DOC_NONE	0
2388	14	\N	t	f	2015-04-08 13:09:36.86621	2016-08-05 22:49:02.481572	144	Property	0	\N	\N	\N	DOC_NONE	0
2390	16	\N	t	f	2015-04-08 13:09:39.891845	2016-08-05 22:49:02.49088	144	Property	0	\N	\N	\N	DOC_NONE	0
2392	2	\N	t	f	2015-04-08 13:09:44.09145	2016-08-05 22:49:02.496804	132	Property	0	\N	\N	\N	DOC_NONE	0
2393	3	\N	t	f	2015-04-08 13:09:45.660145	2016-08-05 22:49:02.501484	132	Property	0	\N	\N	\N	DOC_NONE	0
2394	4	\N	t	f	2015-04-08 13:09:47.246334	2016-08-05 22:49:02.507136	132	Property	0	\N	\N	\N	DOC_NONE	0
2395	5	\N	t	f	2015-04-08 13:09:48.850043	2016-08-05 22:49:02.511146	132	Property	0	\N	\N	\N	DOC_NONE	0
2397	7	\N	t	f	2015-04-08 13:09:51.860639	2016-08-05 22:49:02.51966	132	Property	0	\N	\N	\N	DOC_NONE	0
2398	8	\N	t	f	2015-04-08 13:09:53.359445	2016-08-05 22:49:02.523724	132	Property	0	\N	\N	\N	DOC_NONE	0
2399	9	\N	t	f	2015-04-08 13:09:55.242158	2016-08-05 22:49:02.528025	132	Property	0	\N	\N	\N	DOC_NONE	0
2400	10	\N	t	f	2015-04-08 13:09:56.749171	2016-08-05 22:49:02.535377	132	Property	0	\N	\N	\N	DOC_NONE	0
2402	12	\N	t	f	2015-04-08 13:09:59.773982	2016-08-05 22:49:02.54729	132	Property	0	\N	\N	\N	DOC_NONE	0
2403	13	\N	t	f	2015-04-08 13:10:01.409436	2016-08-05 22:49:02.551902	132	Property	0	\N	\N	\N	DOC_NONE	0
2405	15	\N	t	f	2015-04-08 13:10:04.444134	2016-08-05 22:49:02.565285	132	Property	0	\N	\N	\N	DOC_NONE	0
2406	16	\N	t	f	2015-04-08 13:10:05.983579	2016-08-05 22:49:02.570747	132	Property	0	\N	\N	\N	DOC_NONE	0
2407	17	\N	t	f	2015-04-08 13:10:07.480147	2016-08-05 22:49:02.576452	132	Property	0	\N	\N	\N	DOC_NONE	0
2409	3	\N	t	f	2015-04-08 13:10:11.670371	2016-08-05 22:49:02.58606	133	Property	0	\N	\N	\N	DOC_NONE	0
2410	4	\N	t	f	2015-04-08 13:10:13.170268	2016-08-05 22:49:02.592185	133	Property	0	\N	\N	\N	DOC_NONE	0
2411	5	\N	t	f	2015-04-08 13:10:14.667959	2016-08-05 22:49:02.599017	133	Property	0	\N	\N	\N	DOC_NONE	0
2412	6	\N	t	f	2015-04-08 13:10:16.172331	2016-08-05 22:49:02.604802	133	Property	0	\N	\N	\N	DOC_NONE	0
2413	7	\N	t	f	2015-04-08 13:10:17.671444	2016-08-05 22:49:02.611576	133	Property	0	\N	\N	\N	DOC_NONE	0
2447	4	\N	t	f	2015-04-08 13:11:47.630794	2016-08-05 22:49:02.620944	137	Property	0	\N	\N	\N	DOC_NONE	0
2448	5	\N	t	f	2015-04-08 13:11:49.124889	2016-08-05 22:49:02.625679	137	Property	0	\N	\N	\N	DOC_NONE	0
2449	6	\N	t	f	2015-04-08 13:11:50.627783	2016-08-05 22:49:02.631113	137	Property	0	\N	\N	\N	DOC_NONE	0
2450	7	\N	t	f	2015-04-08 13:11:52.126889	2016-08-05 22:49:02.636916	137	Property	0	\N	\N	\N	DOC_NONE	0
2452	9	\N	t	f	2015-04-08 13:11:55.12929	2016-08-05 22:49:02.648734	137	Property	0	\N	\N	\N	DOC_NONE	0
2453	10	\N	t	f	2015-04-08 13:11:56.994932	2016-08-05 22:49:02.653658	137	Property	0	\N	\N	\N	DOC_NONE	0
2454	11	\N	t	f	2015-04-08 13:11:58.865079	2016-08-05 22:49:02.660091	137	Property	0	\N	\N	\N	DOC_NONE	0
2455	12	\N	t	f	2015-04-08 13:12:00.368981	2016-08-05 22:49:02.665207	137	Property	0	\N	\N	\N	DOC_NONE	0
2458	15	\N	t	f	2015-04-08 13:12:04.887226	2016-08-05 22:49:02.675472	137	Property	0	\N	\N	\N	DOC_NONE	0
2459	16	\N	t	f	2015-04-08 13:12:06.404095	2016-08-05 22:49:02.685935	137	Property	0	\N	\N	\N	DOC_NONE	0
2460	17	\N	t	f	2015-04-08 13:12:08.088438	2016-08-05 22:49:02.691265	137	Property	0	\N	\N	\N	DOC_NONE	0
2461	1	\N	t	f	2015-04-08 13:12:10.007943	2016-08-05 22:49:02.696043	138	Property	0	\N	\N	\N	DOC_NONE	0
2462	2	\N	t	f	2015-04-08 13:12:11.540524	2016-08-05 22:49:02.700523	138	Property	0	\N	\N	\N	DOC_NONE	0
2464	4	\N	t	f	2015-04-08 13:12:14.541994	2016-08-05 22:49:02.710406	138	Property	0	\N	\N	\N	DOC_NONE	0
2465	5	\N	t	f	2015-04-08 13:12:16.041232	2016-08-05 22:49:02.716676	138	Property	0	\N	\N	\N	DOC_NONE	0
2488	11	\N	t	f	2015-04-08 13:12:52.120618	2016-08-05 22:49:02.722334	139	Property	0	\N	\N	\N	DOC_NONE	0
2489	12	\N	t	f	2015-04-08 13:12:53.66307	2016-08-05 22:49:02.728525	139	Property	0	\N	\N	\N	DOC_NONE	0
2491	14	\N	t	f	2015-04-08 13:12:56.656666	2016-08-05 22:49:02.745472	139	Property	0	\N	\N	\N	DOC_NONE	0
2492	15	\N	t	f	2015-04-08 13:12:58.156465	2016-08-05 22:49:02.751081	139	Property	0	\N	\N	\N	DOC_NONE	0
2493	16	\N	t	f	2015-04-08 13:12:59.661288	2016-08-05 22:49:02.757763	139	Property	0	\N	\N	\N	DOC_NONE	0
2494	17	\N	t	f	2015-04-08 13:13:01.231174	2016-08-05 22:49:02.762816	139	Property	0	\N	\N	\N	DOC_NONE	0
2496	4	\N	t	f	2015-04-08 13:13:07.217354	2016-08-05 22:49:02.767239	140	Property	0	\N	\N	\N	DOC_NONE	0
2498	6	\N	t	f	2015-04-08 13:13:10.623424	2016-08-05 22:49:02.775757	140	Property	0	\N	\N	\N	DOC_NONE	0
2499	9	\N	t	f	2015-04-08 13:13:14.123629	2016-08-05 22:49:02.781108	140	Property	0	\N	\N	\N	DOC_NONE	0
2500	10	\N	t	f	2015-04-08 13:13:15.610144	2016-08-05 22:49:02.785997	140	Property	0	\N	\N	\N	DOC_NONE	0
2424	1	\N	t	t	2015-04-08 13:10:34.741271	2016-08-05 22:49:02.795071	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2495	1	\N	t	t	2015-04-08 13:13:03.358029	2016-08-05 22:49:02.804601	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2501	16	\N	t	t	2015-04-08 13:13:22.140687	2016-08-05 22:49:02.808961	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2502	17	\N	t	t	2015-04-08 13:13:23.627679	2016-08-05 22:49:02.813853	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2432	1	\N	t	t	2015-04-08 13:10:56.696652	2016-08-05 22:49:02.818438	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2436	15	\N	t	t	2015-04-08 13:11:16.343913	2016-08-05 22:49:02.830112	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2437	17	\N	t	t	2015-04-08 13:11:19.272798	2016-08-05 22:49:02.835752	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2439	2	\N	t	t	2015-04-08 13:11:22.838271	2016-08-05 22:49:02.84059	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2427	6	\N	t	f	2015-04-08 13:10:41.629801	2016-08-05 22:49:02.844957	134	Property	0	\N	\N	\N	DOC_NONE	0
2505	3	\N	t	f	2015-04-08 13:13:28.281688	2016-08-05 22:49:02.849299	141	Property	0	\N	\N	\N	DOC_NONE	0
2507	5	\N	t	f	2015-04-08 13:13:31.2695	2016-08-05 22:49:02.865109	141	Property	0	\N	\N	\N	DOC_NONE	0
2508	6	\N	t	f	2015-04-08 13:13:33.533418	2016-08-05 22:49:02.870315	141	Property	0	\N	\N	\N	DOC_NONE	0
2509	7	\N	t	f	2015-04-08 13:13:35.086897	2016-08-05 22:49:02.875211	141	Property	0	\N	\N	\N	DOC_NONE	0
2510	8	\N	t	f	2015-04-08 13:13:36.608399	2016-08-05 22:49:02.879773	141	Property	0	\N	\N	\N	DOC_NONE	0
2512	10	\N	t	f	2015-04-08 13:13:39.603327	2016-08-05 22:49:02.889327	141	Property	0	\N	\N	\N	DOC_NONE	0
2513	11	\N	t	f	2015-04-08 13:13:41.098211	2016-08-05 22:49:02.894413	141	Property	0	\N	\N	\N	DOC_NONE	0
2514	12	\N	t	f	2015-04-08 13:13:42.601511	2016-08-05 22:49:02.899317	141	Property	0	\N	\N	\N	DOC_NONE	0
2515	13	\N	t	f	2015-04-08 13:13:44.107259	2016-08-05 22:49:02.904621	141	Property	0	\N	\N	\N	DOC_NONE	0
2516	14	\N	t	f	2015-04-08 13:13:46.000011	2016-08-05 22:49:02.911058	141	Property	0	\N	\N	\N	DOC_NONE	0
2518	16	\N	t	f	2015-04-08 13:13:48.99639	2016-08-05 22:49:02.922461	141	Property	0	\N	\N	\N	DOC_NONE	0
2519	17	\N	t	f	2015-04-08 13:13:50.534976	2016-08-05 22:49:02.928332	141	Property	0	\N	\N	\N	DOC_NONE	0
2521	6	\N	t	t	2015-04-08 13:13:58.104208	2016-08-05 22:49:02.936501	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2543	1	\N	t	t	2015-04-08 13:14:39.800622	2016-08-05 22:49:02.941627	146	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2526	1	\N	t	f	2015-04-08 13:14:13.182873	2016-08-05 22:49:02.95318	143	Property	0	\N	\N	\N	DOC_NONE	0
2527	2	\N	t	f	2015-04-08 13:14:14.685113	2016-08-05 22:49:02.958322	143	Property	0	\N	\N	\N	DOC_NONE	0
2528	3	\N	t	f	2015-04-08 13:14:16.212793	2016-08-05 22:49:02.963528	143	Property	0	\N	\N	\N	DOC_NONE	0
2529	4	\N	t	f	2015-04-08 13:14:17.743166	2016-08-05 22:49:02.968529	143	Property	0	\N	\N	\N	DOC_NONE	0
2531	6	\N	t	f	2015-04-08 13:14:20.849293	2016-08-05 22:49:02.984621	143	Property	0	\N	\N	\N	DOC_NONE	0
2532	7	\N	t	f	2015-04-08 13:14:22.726149	2016-08-05 22:49:03.006532	143	Property	0	\N	\N	\N	DOC_NONE	0
2533	8	\N	t	f	2015-04-08 13:14:24.245533	2016-08-05 22:49:03.016896	143	Property	0	\N	\N	\N	DOC_NONE	0
2534	9	\N	t	f	2015-04-08 13:14:25.735743	2016-08-05 22:49:03.041246	143	Property	0	\N	\N	\N	DOC_NONE	0
2535	10	\N	t	f	2015-04-08 13:14:27.247226	2016-08-05 22:49:03.068668	143	Property	0	\N	\N	\N	DOC_NONE	0
2537	12	\N	t	f	2015-04-08 13:14:30.615402	2016-08-05 22:49:03.091824	143	Property	0	\N	\N	\N	DOC_NONE	0
2538	13	\N	t	f	2015-04-08 13:14:32.111535	2016-08-05 22:49:03.097671	143	Property	0	\N	\N	\N	DOC_NONE	0
2539	14	\N	t	f	2015-04-08 13:14:33.613564	2016-08-05 22:49:03.103626	143	Property	0	\N	\N	\N	DOC_NONE	0
2540	15	\N	t	f	2015-04-08 13:14:35.112626	2016-08-05 22:49:03.111782	143	Property	0	\N	\N	\N	DOC_NONE	0
2542	17	\N	t	f	2015-04-08 13:14:38.112058	2016-08-05 22:49:03.124399	143	Property	0	\N	\N	\N	DOC_NONE	0
2561	2	\N	t	t	2015-04-08 13:15:07.19881	2016-08-05 22:49:03.131631	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2545	3	\N	t	f	2015-04-08 13:14:42.820867	2016-08-05 22:49:03.149381	146	Property	0	\N	\N	\N	DOC_NONE	0
2547	5	\N	t	f	2015-04-08 13:14:45.833175	2016-08-05 22:49:03.157359	146	Property	0	\N	\N	\N	DOC_NONE	0
2548	6	\N	t	f	2015-04-08 13:14:47.338101	2016-08-05 22:49:03.162923	146	Property	0	\N	\N	\N	DOC_NONE	0
2550	8	\N	t	f	2015-04-08 13:14:50.351378	2016-08-05 22:49:03.173023	146	Property	0	\N	\N	\N	DOC_NONE	0
2551	9	\N	t	f	2015-04-08 13:14:51.845707	2016-08-05 22:49:03.177761	146	Property	0	\N	\N	\N	DOC_NONE	0
2552	10	\N	t	f	2015-04-08 13:14:53.37964	2016-08-05 22:49:03.18272	146	Property	0	\N	\N	\N	DOC_NONE	0
2553	11	\N	t	f	2015-04-08 13:14:54.871131	2016-08-05 22:49:03.187823	146	Property	0	\N	\N	\N	DOC_NONE	0
2554	12	\N	t	f	2015-04-08 13:14:56.369406	2016-08-05 22:49:03.192867	146	Property	0	\N	\N	\N	DOC_NONE	0
2556	14	\N	t	f	2015-04-08 13:14:59.3597	2016-08-05 22:49:03.203825	146	Property	0	\N	\N	\N	DOC_NONE	0
2557	15	\N	t	f	2015-04-08 13:15:00.943118	2016-08-05 22:49:03.211564	146	Property	0	\N	\N	\N	DOC_NONE	0
2558	16	\N	t	f	2015-04-08 13:15:02.480652	2016-08-05 22:49:03.217181	146	Property	0	\N	\N	\N	DOC_NONE	0
2559	17	\N	t	f	2015-04-08 13:15:04.028851	2016-08-05 22:49:03.223342	146	Property	0	\N	\N	\N	DOC_NONE	0
2563	4	\N	t	t	2015-04-08 13:15:10.961791	2016-08-05 22:49:03.234766	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2574	15	\N	t	t	2015-04-08 13:15:27.817573	2016-08-05 22:49:03.240182	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2564	5	\N	t	t	2015-04-08 13:15:12.461141	2016-08-05 22:49:03.24549	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2566	7	\N	t	t	2015-04-08 13:15:15.457376	2016-08-05 22:49:03.25113	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2571	12	\N	t	t	2015-04-08 13:15:22.952492	2016-08-05 22:49:03.2621	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2567	8	\N	t	f	2015-04-08 13:15:16.951459	2016-08-05 22:49:03.267586	147	Property	0	\N	\N	\N	DOC_NONE	0
2568	9	\N	t	f	2015-04-08 13:15:18.452196	2016-08-05 22:49:03.273679	147	Property	0	\N	\N	\N	DOC_NONE	0
2570	11	\N	t	f	2015-04-08 13:15:21.452254	2016-08-05 22:49:03.279819	147	Property	0	\N	\N	\N	DOC_NONE	0
2572	13	\N	t	t	2015-04-08 13:15:24.831004	2016-08-05 22:49:03.285853	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2575	16	\N	t	t	2015-04-08 13:15:29.317121	2016-08-05 22:49:03.306396	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2525	17	\N	t	t	2015-04-08 13:14:11.526483	2016-08-05 22:49:03.31243	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2562	3	\N	t	t	2015-04-08 13:15:08.722238	2016-08-05 22:49:03.317998	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2576	17	\N	t	f	2015-04-08 13:15:30.818506	2016-08-05 22:49:03.322856	147	Property	0	\N	\N	\N	DOC_NONE	0
2578	2	\N	t	f	2015-04-08 13:15:33.975649	2016-08-05 22:49:03.340596	148	Property	0	\N	\N	\N	DOC_NONE	0
2579	3	\N	t	f	2015-04-08 13:15:35.477885	2016-08-05 22:49:03.364668	148	Property	0	\N	\N	\N	DOC_NONE	0
2580	4	\N	t	f	2015-04-08 13:15:36.97437	2016-08-05 22:49:03.370694	148	Property	0	\N	\N	\N	DOC_NONE	0
2581	5	\N	t	f	2015-04-08 13:15:38.476863	2016-08-05 22:49:03.375907	148	Property	0	\N	\N	\N	DOC_NONE	0
2582	6	\N	t	f	2015-04-08 13:15:39.981704	2016-08-05 22:49:03.384591	148	Property	0	\N	\N	\N	DOC_NONE	0
2584	8	\N	t	f	2015-04-08 13:15:42.98582	2016-08-05 22:49:03.399844	148	Property	0	\N	\N	\N	DOC_NONE	0
2585	9	\N	t	f	2015-04-08 13:15:44.520358	2016-08-05 22:49:03.413504	148	Property	0	\N	\N	\N	DOC_NONE	0
2586	10	\N	t	f	2015-04-08 13:15:46.007764	2016-08-05 22:49:03.428517	148	Property	0	\N	\N	\N	DOC_NONE	0
2587	11	\N	t	f	2015-04-08 13:15:47.534461	2016-08-05 22:49:03.437156	148	Property	0	\N	\N	\N	DOC_NONE	0
2589	13	\N	t	f	2015-04-08 13:15:50.537284	2016-08-05 22:49:03.454269	148	Property	0	\N	\N	\N	DOC_NONE	0
2590	14	\N	t	f	2015-04-08 13:15:52.040062	2016-08-05 22:49:03.45974	148	Property	0	\N	\N	\N	DOC_NONE	0
2591	15	\N	t	f	2015-04-08 13:15:53.535646	2016-08-05 22:49:03.465321	148	Property	0	\N	\N	\N	DOC_NONE	0
2594	1	\N	t	f	2015-04-08 13:15:58.181737	2016-08-05 22:49:03.471753	149	Property	0	\N	\N	\N	DOC_NONE	0
2596	6	\N	t	f	2015-04-08 13:16:04.27059	2016-08-05 22:49:03.484646	149	Property	0	\N	\N	\N	DOC_NONE	0
2597	7	\N	t	f	2015-04-08 13:16:05.759254	2016-08-05 22:49:03.490753	149	Property	0	\N	\N	\N	DOC_NONE	0
2598	8	\N	t	f	2015-04-08 13:16:07.264484	2016-08-05 22:49:03.496647	149	Property	0	\N	\N	\N	DOC_NONE	0
2599	9	\N	t	f	2015-04-08 13:16:08.765359	2016-08-05 22:49:03.504531	149	Property	0	\N	\N	\N	DOC_NONE	0
2600	10	\N	t	f	2015-04-08 13:16:10.265597	2016-08-05 22:49:03.516175	149	Property	0	\N	\N	\N	DOC_NONE	0
2602	17	\N	t	f	2015-04-08 13:16:18.626758	2016-08-05 22:49:03.528667	149	Property	0	\N	\N	\N	DOC_NONE	0
2603	1	\N	t	f	2015-04-08 13:16:20.286709	2016-08-05 22:49:03.534375	150	Property	0	\N	\N	\N	DOC_NONE	0
2605	8	\N	t	f	2015-04-08 13:16:28.653259	2016-08-05 22:49:03.540448	150	Property	0	\N	\N	\N	DOC_NONE	0
2606	9	\N	t	f	2015-04-08 13:16:30.152495	2016-08-05 22:49:03.545611	150	Property	0	\N	\N	\N	DOC_NONE	0
2608	11	\N	t	f	2015-04-08 13:16:33.151356	2016-08-05 22:49:03.558329	150	Property	0	\N	\N	\N	DOC_NONE	0
2609	17	\N	t	f	2015-04-08 13:16:39.644662	2016-08-05 22:49:03.562976	150	Property	0	\N	\N	\N	DOC_NONE	0
2610	1	\N	t	f	2015-04-08 13:16:41.308247	2016-08-05 22:49:03.568145	151	Property	0	\N	\N	\N	DOC_NONE	0
2613	4	\N	t	f	2015-04-08 13:16:46.237837	2016-08-05 22:49:03.572664	151	Property	0	\N	\N	\N	DOC_NONE	0
2614	5	\N	t	f	2015-04-08 13:16:48.112193	2016-08-05 22:49:03.577509	151	Property	0	\N	\N	\N	DOC_NONE	0
2616	7	\N	t	f	2015-04-08 13:16:51.107331	2016-08-05 22:49:03.587515	151	Property	0	\N	\N	\N	DOC_NONE	0
2617	8	\N	t	f	2015-04-08 13:16:52.615798	2016-08-05 22:49:03.592367	151	Property	0	\N	\N	\N	DOC_NONE	0
2618	9	\N	t	f	2015-04-08 13:16:54.114137	2016-08-05 22:49:03.596757	151	Property	0	\N	\N	\N	DOC_NONE	0
2619	10	\N	t	f	2015-04-08 13:16:55.682533	2016-08-05 22:49:03.601784	151	Property	0	\N	\N	\N	DOC_NONE	0
2621	12	\N	t	f	2015-04-08 13:16:59.040643	2016-08-05 22:49:03.615511	151	Property	0	\N	\N	\N	DOC_NONE	0
2622	13	\N	t	f	2015-04-08 13:17:00.549231	2016-08-05 22:49:03.6219	151	Property	0	\N	\N	\N	DOC_NONE	0
2623	14	\N	t	f	2015-04-08 13:17:03.560295	2016-08-05 22:49:03.62676	151	Property	0	\N	\N	\N	DOC_NONE	0
2624	15	\N	t	f	2015-04-08 13:17:05.096235	2016-08-05 22:49:03.634972	151	Property	0	\N	\N	\N	DOC_NONE	0
2626	17	\N	t	f	2015-04-08 13:17:08.880421	2016-08-05 22:49:03.647029	151	Property	0	\N	\N	\N	DOC_NONE	0
2627	1	\N	t	f	2015-04-08 13:17:10.568681	2016-08-05 22:49:03.654866	152	Property	0	\N	\N	\N	DOC_NONE	0
2628	2	\N	t	f	2015-04-08 13:17:12.090581	2016-08-05 22:49:03.662454	152	Property	0	\N	\N	\N	DOC_NONE	0
2629	3	\N	t	f	2015-04-08 13:17:13.645886	2016-08-05 22:49:03.668228	152	Property	0	\N	\N	\N	DOC_NONE	0
2630	4	\N	t	f	2015-04-08 13:17:15.584278	2016-08-05 22:49:03.673165	152	Property	0	\N	\N	\N	DOC_NONE	0
2632	6	\N	t	f	2015-04-08 13:17:18.986474	2016-08-05 22:49:03.684044	152	Property	0	\N	\N	\N	DOC_NONE	0
2633	7	\N	t	f	2015-04-08 13:17:20.504181	2016-08-05 22:49:03.692591	152	Property	0	\N	\N	\N	DOC_NONE	0
2634	8	\N	t	f	2015-04-08 13:17:22.386771	2016-08-05 22:49:03.698381	152	Property	0	\N	\N	\N	DOC_NONE	0
2636	10	\N	t	f	2015-04-08 13:17:25.79679	2016-08-05 22:49:03.704849	152	Property	0	\N	\N	\N	DOC_NONE	0
2638	12	\N	t	f	2015-04-08 13:17:28.833144	2016-08-05 22:49:03.715024	152	Property	0	\N	\N	\N	DOC_NONE	0
2639	13	\N	t	f	2015-04-08 13:17:30.350208	2016-08-05 22:49:03.720789	152	Property	0	\N	\N	\N	DOC_NONE	0
2641	15	\N	t	f	2015-04-08 13:17:33.752547	2016-08-05 22:49:03.73025	152	Property	0	\N	\N	\N	DOC_NONE	0
2642	16	\N	t	f	2015-04-08 13:17:35.248612	2016-08-05 22:49:03.735364	152	Property	0	\N	\N	\N	DOC_NONE	0
2643	17	\N	t	f	2015-04-08 13:17:36.783621	2016-08-05 22:49:03.740149	152	Property	0	\N	\N	\N	DOC_NONE	0
2652	17	\N	t	t	2015-04-08 13:18:00.994173	2016-08-05 22:49:03.75142	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2647	9	\N	t	t	2015-04-08 13:17:49.988015	2016-08-05 22:49:03.756578	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2651	13	\N	t	t	2015-04-08 13:17:56.02468	2016-08-05 22:49:03.765963	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2648	10	\N	t	f	2015-04-08 13:17:51.505698	2016-08-05 22:49:03.772309	153	Property	0	\N	\N	\N	DOC_NONE	0
2649	11	\N	t	f	2015-04-08 13:17:53.014196	2016-08-05 22:49:03.784968	153	Property	0	\N	\N	\N	DOC_NONE	0
2645	3	\N	t	t	2015-04-08 13:17:42.51486	2016-08-05 22:49:03.802813	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2604	6	\N	t	t	2015-04-08 13:16:26.158479	2016-08-05 22:49:03.808657	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2653	1	\N	t	f	2015-04-08 13:18:02.674367	2016-08-05 22:49:03.817414	154	Property	0	\N	\N	\N	DOC_NONE	0
2654	2	\N	t	f	2015-04-08 13:18:04.170351	2016-08-05 22:49:03.822997	154	Property	0	\N	\N	\N	DOC_NONE	0
2656	4	\N	t	f	2015-04-08 13:18:07.222757	2016-08-05 22:49:03.841397	154	Property	0	\N	\N	\N	DOC_NONE	0
2657	5	\N	t	f	2015-04-08 13:18:08.723855	2016-08-05 22:49:04.049301	154	Property	0	\N	\N	\N	DOC_NONE	0
2659	7	\N	t	f	2015-04-08 13:18:11.783411	2016-08-05 22:49:04.054169	154	Property	0	\N	\N	\N	DOC_NONE	0
2660	8	\N	t	f	2015-04-08 13:18:13.283216	2016-08-05 22:49:04.059073	154	Property	0	\N	\N	\N	DOC_NONE	0
2662	10	\N	t	f	2015-04-08 13:18:16.328191	2016-08-05 22:49:04.067832	154	Property	0	\N	\N	\N	DOC_NONE	0
2663	11	\N	t	f	2015-04-08 13:18:17.870695	2016-08-05 22:49:04.072296	154	Property	0	\N	\N	\N	DOC_NONE	0
2664	12	\N	t	f	2015-04-08 13:18:19.383044	2016-08-05 22:49:04.077505	154	Property	0	\N	\N	\N	DOC_NONE	0
2665	13	\N	t	f	2015-04-08 13:18:20.895765	2016-08-05 22:49:04.082472	154	Property	0	\N	\N	\N	DOC_NONE	0
2666	14	\N	t	f	2015-04-08 13:18:22.402057	2016-08-05 22:49:04.087196	154	Property	0	\N	\N	\N	DOC_NONE	0
2668	16	\N	t	f	2015-04-08 13:18:25.425679	2016-08-05 22:49:04.096424	154	Property	0	\N	\N	\N	DOC_NONE	0
2669	17	\N	t	f	2015-04-08 13:18:26.993946	2016-08-05 22:49:04.100943	154	Property	0	\N	\N	\N	DOC_NONE	0
2670	1	\N	t	f	2015-04-08 13:18:28.686322	2016-08-05 22:49:04.105647	155	Property	0	\N	\N	\N	DOC_NONE	0
2671	2	\N	t	f	2015-04-08 13:18:30.199037	2016-08-05 22:49:04.110485	155	Property	0	\N	\N	\N	DOC_NONE	0
2673	4	\N	t	f	2015-04-08 13:18:33.215429	2016-08-05 22:49:04.121901	155	Property	0	\N	\N	\N	DOC_NONE	0
2674	5	\N	t	f	2015-04-08 13:18:35.091916	2016-08-05 22:49:04.128109	155	Property	0	\N	\N	\N	DOC_NONE	0
2675	6	\N	t	f	2015-04-08 13:18:36.602297	2016-08-05 22:49:04.133106	155	Property	0	\N	\N	\N	DOC_NONE	0
2676	7	\N	t	f	2015-04-08 13:18:38.10182	2016-08-05 22:49:04.138888	155	Property	0	\N	\N	\N	DOC_NONE	0
2677	8	\N	t	f	2015-04-08 13:18:39.607717	2016-08-05 22:49:04.144804	155	Property	0	\N	\N	\N	DOC_NONE	0
2679	10	\N	t	f	2015-04-08 13:18:42.62433	2016-08-05 22:49:04.156208	155	Property	0	\N	\N	\N	DOC_NONE	0
2680	11	\N	t	f	2015-04-08 13:18:44.126085	2016-08-05 22:49:04.162117	155	Property	0	\N	\N	\N	DOC_NONE	0
2683	14	\N	t	f	2015-04-08 13:18:48.623651	2016-08-05 22:49:04.168104	155	Property	0	\N	\N	\N	DOC_NONE	0
2684	15	\N	t	f	2015-04-08 13:18:50.115554	2016-08-05 22:49:04.172689	155	Property	0	\N	\N	\N	DOC_NONE	0
2686	17	\N	t	f	2015-04-08 13:18:53.121998	2016-08-05 22:49:04.183466	155	Property	0	\N	\N	\N	DOC_NONE	0
2687	1	\N	t	f	2015-04-08 13:18:54.786641	2016-08-05 22:49:04.187812	156	Property	0	\N	\N	\N	DOC_NONE	0
2688	2	\N	t	f	2015-04-08 13:18:56.279427	2016-08-05 22:49:04.193563	156	Property	0	\N	\N	\N	DOC_NONE	0
2689	3	\N	t	f	2015-04-08 13:18:57.774589	2016-08-05 22:49:04.203837	156	Property	0	\N	\N	\N	DOC_NONE	0
2691	5	\N	t	f	2015-04-08 13:19:00.782044	2016-08-05 22:49:04.215509	156	Property	0	\N	\N	\N	DOC_NONE	0
2692	6	\N	t	f	2015-04-08 13:19:02.275844	2016-08-05 22:49:04.222892	156	Property	0	\N	\N	\N	DOC_NONE	0
2693	7	\N	t	f	2015-04-08 13:19:03.775487	2016-08-05 22:49:04.227809	156	Property	0	\N	\N	\N	DOC_NONE	0
2694	8	\N	t	f	2015-04-08 13:19:05.280305	2016-08-05 22:49:04.233703	156	Property	0	\N	\N	\N	DOC_NONE	0
2695	9	\N	t	f	2015-04-08 13:19:06.786139	2016-08-05 22:49:04.238921	156	Property	0	\N	\N	\N	DOC_NONE	0
2697	11	\N	t	f	2015-04-08 13:19:09.807864	2016-08-05 22:49:04.24881	156	Property	0	\N	\N	\N	DOC_NONE	0
2698	12	\N	t	f	2015-04-08 13:19:11.328103	2016-08-05 22:49:04.262721	156	Property	0	\N	\N	\N	DOC_NONE	0
2699	13	\N	t	f	2015-04-08 13:19:12.827771	2016-08-05 22:49:04.270649	156	Property	0	\N	\N	\N	DOC_NONE	0
2701	15	\N	t	f	2015-04-08 13:19:15.836232	2016-08-05 22:49:04.276257	156	Property	0	\N	\N	\N	DOC_NONE	0
2718	17	\N	t	t	2015-04-08 13:19:48.098121	2016-08-05 22:49:04.287138	157	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2705	4	\N	t	f	2015-04-08 13:19:25.161408	2016-08-05 22:49:04.292996	157	Property	0	\N	\N	\N	DOC_NONE	0
2706	5	\N	t	f	2015-04-08 13:19:26.661893	2016-08-05 22:49:04.298723	157	Property	0	\N	\N	\N	DOC_NONE	0
2707	6	\N	t	f	2015-04-08 13:19:28.211187	2016-08-05 22:49:04.306476	157	Property	0	\N	\N	\N	DOC_NONE	0
2708	7	\N	t	f	2015-04-08 13:19:29.750081	2016-08-05 22:49:04.311387	157	Property	0	\N	\N	\N	DOC_NONE	0
2710	9	\N	t	f	2015-04-08 13:19:33.15526	2016-08-05 22:49:04.321366	157	Property	0	\N	\N	\N	DOC_NONE	0
2711	10	\N	t	f	2015-04-08 13:19:34.690957	2016-08-05 22:49:04.328327	157	Property	0	\N	\N	\N	DOC_NONE	0
2712	11	\N	t	f	2015-04-08 13:19:36.610853	2016-08-05 22:49:04.332806	157	Property	0	\N	\N	\N	DOC_NONE	0
2713	12	\N	t	f	2015-04-08 13:19:38.532758	2016-08-05 22:49:04.33785	157	Property	0	\N	\N	\N	DOC_NONE	0
2715	14	\N	t	f	2015-04-08 13:19:42.75172	2016-08-05 22:49:04.346818	157	Property	0	\N	\N	\N	DOC_NONE	0
2716	15	\N	t	f	2015-04-08 13:19:44.651468	2016-08-05 22:49:04.351331	157	Property	0	\N	\N	\N	DOC_NONE	0
2717	16	\N	t	f	2015-04-08 13:19:46.560277	2016-08-05 22:49:04.355706	157	Property	0	\N	\N	\N	DOC_NONE	0
2720	2	\N	t	t	2015-04-08 13:19:51.313197	2016-08-05 22:49:04.360005	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2719	1	\N	t	t	2015-04-08 13:19:49.772835	2016-08-05 22:49:04.36889	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2730	15	\N	t	t	2015-04-08 13:20:11.975292	2016-08-05 22:49:04.373056	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2723	5	\N	t	t	2015-04-08 13:19:55.931138	2016-08-05 22:49:04.377559	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2726	8	\N	t	t	2015-04-08 13:20:01.020724	2016-08-05 22:49:04.382108	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2725	7	\N	t	f	2015-04-08 13:19:59.088059	2016-08-05 22:49:04.386126	158	Property	0	\N	\N	\N	DOC_NONE	0
2727	9	\N	t	f	2015-04-08 13:20:02.586072	2016-08-05 22:49:04.394315	158	Property	0	\N	\N	\N	DOC_NONE	0
2728	10	\N	t	f	2015-04-08 13:20:04.182986	2016-08-05 22:49:04.398301	158	Property	0	\N	\N	\N	DOC_NONE	0
2721	3	\N	t	t	2015-04-08 13:19:52.851703	2016-08-05 22:49:04.403602	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2731	17	\N	t	t	2015-04-08 13:20:14.532045	2016-08-05 22:49:04.408342	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2733	2	\N	t	f	2015-04-08 13:20:18.196494	2016-08-05 22:49:04.417297	161	Property	0	\N	\N	\N	DOC_NONE	0
2734	3	\N	t	f	2015-04-08 13:20:19.712946	2016-08-05 22:49:04.421751	161	Property	0	\N	\N	\N	DOC_NONE	0
2736	5	\N	t	f	2015-04-08 13:20:22.772955	2016-08-05 22:49:04.430338	161	Property	0	\N	\N	\N	DOC_NONE	0
2737	6	\N	t	f	2015-04-08 13:20:24.31152	2016-08-05 22:49:04.43913	161	Property	0	\N	\N	\N	DOC_NONE	0
2738	7	\N	t	f	2015-04-08 13:20:26.238795	2016-08-05 22:49:04.444037	161	Property	0	\N	\N	\N	DOC_NONE	0
2740	9	\N	t	f	2015-04-08 13:20:29.290913	2016-08-05 22:49:04.453759	161	Property	0	\N	\N	\N	DOC_NONE	0
2741	10	\N	t	f	2015-04-08 13:20:30.861409	2016-08-05 22:49:04.458511	161	Property	0	\N	\N	\N	DOC_NONE	0
2742	11	\N	t	f	2015-04-08 13:20:32.790676	2016-08-05 22:49:04.463315	161	Property	0	\N	\N	\N	DOC_NONE	0
2743	12	\N	t	f	2015-04-08 13:20:34.308902	2016-08-05 22:49:04.468006	161	Property	0	\N	\N	\N	DOC_NONE	0
2744	13	\N	t	f	2015-04-08 13:20:35.829772	2016-08-05 22:49:04.472344	161	Property	0	\N	\N	\N	DOC_NONE	0
2746	15	\N	t	f	2015-04-08 13:20:39.689193	2016-08-05 22:49:04.488949	161	Property	0	\N	\N	\N	DOC_NONE	0
2748	17	\N	t	f	2015-04-08 13:20:43.515737	2016-08-05 22:49:04.494034	161	Property	0	\N	\N	\N	DOC_NONE	0
2749	1	\N	t	f	2015-04-08 13:20:45.292462	2016-08-05 22:49:04.498831	162	Property	0	\N	\N	\N	DOC_NONE	0
2750	2	\N	t	f	2015-04-08 13:20:46.80388	2016-08-05 22:49:04.503375	162	Property	0	\N	\N	\N	DOC_NONE	0
2752	4	\N	t	f	2015-04-08 13:20:50.210162	2016-08-05 22:49:04.512383	162	Property	0	\N	\N	\N	DOC_NONE	0
2753	5	\N	t	f	2015-04-08 13:20:51.730965	2016-08-05 22:49:04.516667	162	Property	0	\N	\N	\N	DOC_NONE	0
2754	6	\N	t	f	2015-04-08 13:20:53.250999	2016-08-05 22:49:04.520995	162	Property	0	\N	\N	\N	DOC_NONE	0
2755	7	\N	t	f	2015-04-08 13:20:54.856652	2016-08-05 22:49:04.524961	162	Property	0	\N	\N	\N	DOC_NONE	0
2757	9	\N	t	f	2015-04-08 13:20:59.145286	2016-08-05 22:49:04.532641	162	Property	0	\N	\N	\N	DOC_NONE	0
2758	10	\N	t	f	2015-04-08 13:21:00.67995	2016-08-05 22:49:04.536381	162	Property	0	\N	\N	\N	DOC_NONE	0
2759	11	\N	t	f	2015-04-08 13:21:02.187458	2016-08-05 22:49:04.540433	162	Property	0	\N	\N	\N	DOC_NONE	0
2760	12	\N	t	f	2015-04-08 13:21:03.68427	2016-08-05 22:49:04.545798	162	Property	0	\N	\N	\N	DOC_NONE	0
2761	13	\N	t	f	2015-04-08 13:21:05.198812	2016-08-05 22:49:04.550251	162	Property	0	\N	\N	\N	DOC_NONE	0
2763	15	\N	t	f	2015-04-08 13:21:08.303156	2016-08-05 22:49:04.558712	162	Property	0	\N	\N	\N	DOC_NONE	0
2764	16	\N	t	f	2015-04-08 13:21:09.896626	2016-08-05 22:49:04.563423	162	Property	0	\N	\N	\N	DOC_NONE	0
2765	17	\N	t	f	2015-04-08 13:21:11.40706	2016-08-05 22:49:04.568416	162	Property	0	\N	\N	\N	DOC_NONE	0
2766	1	\N	t	f	2015-04-08 13:21:13.075364	2016-08-05 22:49:04.573385	163	Property	0	\N	\N	\N	DOC_NONE	0
2768	3	\N	t	f	2015-04-08 13:21:16.956122	2016-08-05 22:49:04.582985	163	Property	0	\N	\N	\N	DOC_NONE	0
2769	4	\N	t	f	2015-04-08 13:21:18.495301	2016-08-05 22:49:04.587516	163	Property	0	\N	\N	\N	DOC_NONE	0
2772	7	\N	t	f	2015-04-08 13:21:24.934573	2016-08-05 22:49:04.59209	163	Property	0	\N	\N	\N	DOC_NONE	0
2773	8	\N	t	f	2015-04-08 13:21:26.469716	2016-08-05 22:49:04.59656	163	Property	0	\N	\N	\N	DOC_NONE	0
2774	9	\N	t	f	2015-04-08 13:21:27.964501	2016-08-05 22:49:04.601081	163	Property	0	\N	\N	\N	DOC_NONE	0
2776	11	\N	t	f	2015-04-08 13:21:31.747193	2016-08-05 22:49:04.610835	163	Property	0	\N	\N	\N	DOC_NONE	0
2777	12	\N	t	f	2015-04-08 13:21:33.270656	2016-08-05 22:49:04.61474	163	Property	0	\N	\N	\N	DOC_NONE	0
2778	13	\N	t	f	2015-04-08 13:21:34.81939	2016-08-05 22:49:04.618847	163	Property	0	\N	\N	\N	DOC_NONE	0
2779	14	\N	t	f	2015-04-08 13:21:36.322119	2016-08-05 22:49:04.622926	163	Property	0	\N	\N	\N	DOC_NONE	0
2781	16	\N	t	f	2015-04-08 13:21:40.524608	2016-08-05 22:49:04.633055	163	Property	0	\N	\N	\N	DOC_NONE	0
2782	17	\N	t	f	2015-04-08 13:21:42.431128	2016-08-05 22:49:04.637964	163	Property	0	\N	\N	\N	DOC_NONE	0
2783	1	\N	t	f	2015-04-08 13:21:45.241469	2016-08-05 22:49:04.642152	164	Property	0	\N	\N	\N	DOC_NONE	0
2784	2	\N	t	f	2015-04-08 13:21:46.770033	2016-08-05 22:49:04.646703	164	Property	0	\N	\N	\N	DOC_NONE	0
2786	4	\N	t	f	2015-04-08 13:21:49.802492	2016-08-05 22:49:04.655479	164	Property	0	\N	\N	\N	DOC_NONE	0
2787	5	\N	t	f	2015-04-08 13:21:51.322523	2016-08-05 22:49:04.659689	164	Property	0	\N	\N	\N	DOC_NONE	0
2788	6	\N	t	f	2015-04-08 13:21:52.831627	2016-08-05 22:49:04.663905	164	Property	0	\N	\N	\N	DOC_NONE	0
2790	8	\N	t	f	2015-04-08 13:21:55.904312	2016-08-05 22:49:04.668368	164	Property	0	\N	\N	\N	DOC_NONE	0
2791	9	\N	t	f	2015-04-08 13:21:58.19175	2016-08-05 22:49:04.673523	164	Property	0	\N	\N	\N	DOC_NONE	0
2793	11	\N	t	f	2015-04-08 13:22:01.644559	2016-08-05 22:49:04.683753	164	Property	0	\N	\N	\N	DOC_NONE	0
2795	13	\N	t	f	2015-04-08 13:22:04.677392	2016-08-05 22:49:04.68936	164	Property	0	\N	\N	\N	DOC_NONE	0
2796	14	\N	t	f	2015-04-08 13:22:06.567702	2016-08-05 22:49:04.694378	164	Property	0	\N	\N	\N	DOC_NONE	0
2797	15	\N	t	f	2015-04-08 13:22:08.132553	2016-08-05 22:49:04.69886	164	Property	0	\N	\N	\N	DOC_NONE	0
2799	17	\N	t	f	2015-04-08 13:22:11.203488	2016-08-05 22:49:04.707935	164	Property	0	\N	\N	\N	DOC_NONE	0
2804	10	\N	t	t	2015-04-08 13:22:25.148345	2016-08-05 22:49:04.712089	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2801	7	\N	t	f	2015-04-08 13:22:19.809611	2016-08-05 22:49:04.716021	165	Property	0	\N	\N	\N	DOC_NONE	0
2802	8	\N	t	f	2015-04-08 13:22:21.697409	2016-08-05 22:49:04.7202	165	Property	0	\N	\N	\N	DOC_NONE	0
2803	9	\N	t	f	2015-04-08 13:22:23.615613	2016-08-05 22:49:04.725137	165	Property	0	\N	\N	\N	DOC_NONE	0
2805	11	\N	t	f	2015-04-08 13:22:27.098225	2016-08-05 22:49:04.733529	165	Property	0	\N	\N	\N	DOC_NONE	0
2806	14	\N	t	f	2015-04-08 13:22:30.661792	2016-08-05 22:49:04.737586	165	Property	0	\N	\N	\N	DOC_NONE	0
2807	15	\N	t	f	2015-04-08 13:22:32.168397	2016-08-05 22:49:04.741546	165	Property	0	\N	\N	\N	DOC_NONE	0
2808	16	\N	t	f	2015-04-08 13:22:33.695751	2016-08-05 22:49:04.745778	165	Property	0	\N	\N	\N	DOC_NONE	0
2800	1	\N	t	t	2015-04-08 13:22:13.270675	2016-08-05 22:49:04.753868	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2812	4	\N	t	f	2015-04-08 13:22:42.296989	2016-08-05 22:49:04.758174	166	Property	0	\N	\N	\N	DOC_NONE	0
2814	6	\N	t	f	2015-04-08 13:22:46.428527	2016-08-05 22:49:04.762335	166	Property	0	\N	\N	\N	DOC_NONE	0
2815	8	\N	t	f	2015-04-08 13:22:49.006933	2016-08-05 22:49:04.767405	166	Property	0	\N	\N	\N	DOC_NONE	0
2817	12	\N	t	f	2015-04-08 13:22:54.926308	2016-08-05 22:49:04.777902	166	Property	0	\N	\N	\N	DOC_NONE	0
2818	13	\N	t	f	2015-04-08 13:22:56.829223	2016-08-05 22:49:04.782471	166	Property	0	\N	\N	\N	DOC_NONE	0
2819	17	\N	t	f	2015-04-08 13:23:01.41386	2016-08-05 22:49:04.787243	166	Property	0	\N	\N	\N	DOC_NONE	0
2820	1	\N	t	f	2015-04-08 13:23:03.118274	2016-08-05 22:49:04.791744	167	Property	0	\N	\N	\N	DOC_NONE	0
2821	2	\N	t	f	2015-04-08 13:23:04.649266	2016-08-05 22:49:04.795876	167	Property	0	\N	\N	\N	DOC_NONE	0
2823	4	\N	t	f	2015-04-08 13:23:07.703232	2016-08-05 22:49:04.805016	167	Property	0	\N	\N	\N	DOC_NONE	0
2824	5	\N	t	f	2015-04-08 13:23:09.228337	2016-08-05 22:49:04.808929	167	Property	0	\N	\N	\N	DOC_NONE	0
2825	6	\N	t	f	2015-04-08 13:23:10.756178	2016-08-05 22:49:04.812956	167	Property	0	\N	\N	\N	DOC_NONE	0
2826	7	\N	t	f	2015-04-08 13:23:12.636016	2016-08-05 22:49:04.816877	167	Property	0	\N	\N	\N	DOC_NONE	0
2828	9	\N	t	f	2015-04-08 13:23:15.678325	2016-08-05 22:49:04.825127	167	Property	0	\N	\N	\N	DOC_NONE	0
2829	10	\N	t	f	2015-04-08 13:23:17.223315	2016-08-05 22:49:04.829404	167	Property	0	\N	\N	\N	DOC_NONE	0
2831	12	\N	t	f	2015-04-08 13:23:20.275351	2016-08-05 22:49:04.837479	167	Property	0	\N	\N	\N	DOC_NONE	0
2832	13	\N	t	f	2015-04-08 13:23:21.798826	2016-08-05 22:49:04.84155	167	Property	0	\N	\N	\N	DOC_NONE	0
2833	14	\N	t	f	2015-04-08 13:23:23.304036	2016-08-05 22:49:04.845484	167	Property	0	\N	\N	\N	DOC_NONE	0
2835	16	\N	t	f	2015-04-08 13:23:26.713371	2016-08-05 22:49:04.853493	167	Property	0	\N	\N	\N	DOC_NONE	0
2837	1	\N	t	f	2015-04-08 13:23:30.346756	2016-08-05 22:49:04.857708	168	Property	0	\N	\N	\N	DOC_NONE	0
2838	2	\N	t	f	2015-04-08 13:23:31.90951	2016-08-05 22:49:04.861767	168	Property	0	\N	\N	\N	DOC_NONE	0
2839	3	\N	t	f	2015-04-08 13:23:33.850122	2016-08-05 22:49:04.865898	168	Property	0	\N	\N	\N	DOC_NONE	0
2840	4	\N	t	f	2015-04-08 13:23:35.415451	2016-08-05 22:49:04.869816	168	Property	0	\N	\N	\N	DOC_NONE	0
2842	6	\N	t	f	2015-04-08 13:23:38.484054	2016-08-05 22:49:04.877626	168	Property	0	\N	\N	\N	DOC_NONE	0
2843	7	\N	t	f	2015-04-08 13:23:40.015003	2016-08-05 22:49:04.883311	168	Property	0	\N	\N	\N	DOC_NONE	0
2844	8	\N	t	f	2015-04-08 13:23:41.539859	2016-08-05 22:49:04.887619	168	Property	0	\N	\N	\N	DOC_NONE	0
2845	9	\N	t	f	2015-04-08 13:23:43.077135	2016-08-05 22:49:04.892207	168	Property	0	\N	\N	\N	DOC_NONE	0
2847	11	\N	t	f	2015-04-08 13:23:46.512457	2016-08-05 22:49:04.900641	168	Property	0	\N	\N	\N	DOC_NONE	0
2848	12	\N	t	f	2015-04-08 13:23:48.0415	2016-08-05 22:49:04.904617	168	Property	0	\N	\N	\N	DOC_NONE	0
2849	13	\N	t	f	2015-04-08 13:23:51.055319	2016-08-05 22:49:04.908947	168	Property	0	\N	\N	\N	DOC_NONE	0
2850	14	\N	t	f	2015-04-08 13:23:53.699065	2016-08-05 22:49:04.913019	168	Property	0	\N	\N	\N	DOC_NONE	0
2852	16	\N	t	f	2015-04-08 13:23:56.72665	2016-08-05 22:49:04.925788	168	Property	0	\N	\N	\N	DOC_NONE	0
2853	17	\N	t	f	2015-04-08 13:23:58.235862	2016-08-05 22:49:04.930519	168	Property	0	\N	\N	\N	DOC_NONE	0
2854	1	\N	t	f	2015-04-08 13:23:59.903799	2016-08-05 22:49:04.935721	169	Property	0	\N	\N	\N	DOC_NONE	0
2855	6	\N	t	f	2015-04-08 13:24:05.790218	2016-08-05 22:49:04.940963	169	Property	0	\N	\N	\N	DOC_NONE	0
2856	8	\N	t	f	2015-04-08 13:24:08.681187	2016-08-05 22:49:04.945723	169	Property	0	\N	\N	\N	DOC_NONE	0
2858	17	\N	t	f	2015-04-08 13:24:20.35981	2016-08-05 22:49:04.956684	169	Property	0	\N	\N	\N	DOC_NONE	0
2879	15	\N	t	f	2015-04-08 13:25:08.001202	2016-08-05 22:49:04.962022	171	Property	0	\N	\N	\N	DOC_NONE	0
2880	16	\N	t	f	2015-04-08 13:25:09.623918	2016-08-05 22:49:04.966134	171	Property	0	\N	\N	\N	DOC_NONE	0
2881	17	\N	t	f	2015-04-08 13:25:11.541583	2016-08-05 22:49:04.970236	171	Property	0	\N	\N	\N	DOC_NONE	0
2883	3	\N	t	f	2015-04-08 13:25:15.873407	2016-08-05 22:49:04.979497	172	Property	0	\N	\N	\N	DOC_NONE	0
2885	5	\N	t	f	2015-04-08 13:25:19.336444	2016-08-05 22:49:04.984819	172	Property	0	\N	\N	\N	DOC_NONE	0
2886	6	\N	t	f	2015-04-08 13:25:20.887131	2016-08-05 22:49:04.992446	172	Property	0	\N	\N	\N	DOC_NONE	0
2887	7	\N	t	f	2015-04-08 13:25:22.46051	2016-08-05 22:49:05.004648	172	Property	0	\N	\N	\N	DOC_NONE	0
2888	8	\N	t	f	2015-04-08 13:25:24.401318	2016-08-05 22:49:05.055989	172	Property	0	\N	\N	\N	DOC_NONE	0
2890	10	\N	t	f	2015-04-08 13:25:27.868628	2016-08-05 22:49:05.065351	172	Property	0	\N	\N	\N	DOC_NONE	0
2891	11	\N	t	f	2015-04-08 13:25:29.768014	2016-08-05 22:49:05.070387	172	Property	0	\N	\N	\N	DOC_NONE	0
2892	12	\N	t	f	2015-04-08 13:25:31.271855	2016-08-05 22:49:05.075334	172	Property	0	\N	\N	\N	DOC_NONE	0
2893	13	\N	t	f	2015-04-08 13:25:33.171576	2016-08-05 22:49:05.080362	172	Property	0	\N	\N	\N	DOC_NONE	0
2895	15	\N	t	f	2015-04-08 13:25:36.197846	2016-08-05 22:49:05.090209	172	Property	0	\N	\N	\N	DOC_NONE	0
2896	16	\N	t	f	2015-04-08 13:25:38.468344	2016-08-05 22:49:05.094307	172	Property	0	\N	\N	\N	DOC_NONE	0
2897	17	\N	t	f	2015-04-08 13:25:39.966632	2016-08-05 22:49:05.098265	172	Property	0	\N	\N	\N	DOC_NONE	0
2901	5	\N	t	f	2015-04-08 13:25:47.162284	2016-08-05 22:49:05.102475	174	Property	0	\N	\N	\N	DOC_NONE	0
2903	10	\N	t	f	2015-04-08 13:25:53.187607	2016-08-05 22:49:05.110331	174	Property	0	\N	\N	\N	DOC_NONE	0
2905	13	\N	t	f	2015-04-08 13:25:57.289326	2016-08-05 22:49:05.114017	174	Property	0	\N	\N	\N	DOC_NONE	0
2906	17	\N	t	f	2015-04-08 13:26:02.195785	2016-08-05 22:49:05.117694	174	Property	0	\N	\N	\N	DOC_NONE	0
2907	2	\N	t	f	2015-04-08 13:26:04.865628	2016-08-05 22:49:05.121572	175	Property	0	\N	\N	\N	DOC_NONE	0
2908	3	\N	t	f	2015-04-08 13:26:06.36067	2016-08-05 22:49:05.125406	175	Property	0	\N	\N	\N	DOC_NONE	0
2910	5	\N	t	f	2015-04-08 13:26:09.374721	2016-08-05 22:49:05.133058	175	Property	0	\N	\N	\N	DOC_NONE	0
2911	6	\N	t	f	2015-04-08 13:26:10.907014	2016-08-05 22:49:05.137043	175	Property	0	\N	\N	\N	DOC_NONE	0
2912	7	\N	t	f	2015-04-08 13:26:12.432159	2016-08-05 22:49:05.140905	175	Property	0	\N	\N	\N	DOC_NONE	0
2913	8	\N	t	f	2015-04-08 13:26:13.938262	2016-08-05 22:49:05.144767	175	Property	0	\N	\N	\N	DOC_NONE	0
2915	10	\N	t	f	2015-04-08 13:26:16.999119	2016-08-05 22:49:05.152323	175	Property	0	\N	\N	\N	DOC_NONE	0
2916	11	\N	t	f	2015-04-08 13:26:18.515562	2016-08-05 22:49:05.156087	175	Property	0	\N	\N	\N	DOC_NONE	0
2917	12	\N	t	f	2015-04-08 13:26:20.025034	2016-08-05 22:49:05.159748	175	Property	0	\N	\N	\N	DOC_NONE	0
2918	13	\N	t	f	2015-04-08 13:26:21.898521	2016-08-05 22:49:05.163568	175	Property	0	\N	\N	\N	DOC_NONE	0
2919	14	\N	t	f	2015-04-08 13:26:23.805026	2016-08-05 22:49:05.167359	175	Property	0	\N	\N	\N	DOC_NONE	0
2921	16	\N	t	f	2015-04-08 13:26:26.833365	2016-08-05 22:49:05.175131	175	Property	0	\N	\N	\N	DOC_NONE	0
2922	17	\N	t	f	2015-04-08 13:26:28.365782	2016-08-05 22:49:05.17885	175	Property	0	\N	\N	\N	DOC_NONE	0
2923	1	\N	t	f	2015-04-08 13:26:30.036436	2016-08-05 22:49:05.182858	176	Property	0	\N	\N	\N	DOC_NONE	0
2925	4	\N	t	f	2015-04-08 13:26:34.10276	2016-08-05 22:49:05.186873	176	Property	0	\N	\N	\N	DOC_NONE	0
2927	6	\N	t	f	2015-04-08 13:26:37.507591	2016-08-05 22:49:05.194466	176	Property	0	\N	\N	\N	DOC_NONE	0
2928	9	\N	t	f	2015-04-08 13:26:41.084493	2016-08-05 22:49:05.198503	176	Property	0	\N	\N	\N	DOC_NONE	0
2930	17	\N	t	f	2015-04-08 13:26:51.039876	2016-08-05 22:49:05.20235	176	Property	0	\N	\N	\N	DOC_NONE	0
2934	4	\N	t	f	2015-04-08 13:26:57.328214	2016-08-05 22:49:05.206154	177	Property	0	\N	\N	\N	DOC_NONE	0
2936	6	\N	t	f	2015-04-08 13:27:00.344459	2016-08-05 22:49:05.213835	177	Property	0	\N	\N	\N	DOC_NONE	0
2937	7	\N	t	f	2015-04-08 13:27:01.851801	2016-08-05 22:49:05.217939	177	Property	0	\N	\N	\N	DOC_NONE	0
2938	8	\N	t	f	2015-04-08 13:27:03.744117	2016-08-05 22:49:05.222092	177	Property	0	\N	\N	\N	DOC_NONE	0
2939	9	\N	t	f	2015-04-08 13:27:05.244749	2016-08-05 22:49:05.225862	177	Property	0	\N	\N	\N	DOC_NONE	0
2940	10	\N	t	f	2015-04-08 13:27:06.745148	2016-08-05 22:49:05.229504	177	Property	0	\N	\N	\N	DOC_NONE	0
2942	12	\N	t	f	2015-04-08 13:27:09.790201	2016-08-05 22:49:05.237324	177	Property	0	\N	\N	\N	DOC_NONE	0
2943	13	\N	t	f	2015-04-08 13:27:11.295979	2016-08-05 22:49:05.24136	177	Property	0	\N	\N	\N	DOC_NONE	0
2944	14	\N	t	f	2015-04-08 13:27:12.803748	2016-08-05 22:49:05.245381	177	Property	0	\N	\N	\N	DOC_NONE	0
2946	16	\N	t	f	2015-04-08 13:27:15.827151	2016-08-05 22:49:05.249142	177	Property	0	\N	\N	\N	DOC_NONE	0
2868	3	\N	t	f	2015-04-08 13:24:47.865018	2016-08-05 22:49:05.258173	171	Property	0	\N	\N	\N	DOC_NONE	0
2861	6	\N	t	f	2015-04-08 13:24:28.487314	2016-08-05 22:49:05.262551	170	Property	0	\N	\N	\N	DOC_NONE	0
2860	3	\N	t	t	2015-04-08 13:24:24.585849	2016-08-05 22:49:05.271863	170	Property	1	\N	\N	\N	DOC_UPLOADED	0
2864	9	\N	t	f	2015-04-08 13:24:33.424756	2016-08-05 22:49:05.276065	170	Property	0	\N	\N	\N	DOC_NONE	0
2900	4	\N	t	t	2015-04-08 13:25:45.656578	2016-08-05 22:49:05.280462	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2867	1	\N	t	f	2015-04-08 13:24:45.361979	2016-08-05 22:49:05.288129	171	Property	0	\N	\N	\N	DOC_NONE	0
2869	4	\N	t	f	2015-04-08 13:24:49.375412	2016-08-05 22:49:05.291776	171	Property	0	\N	\N	\N	DOC_NONE	0
2870	5	\N	t	f	2015-04-08 13:24:50.908753	2016-08-05 22:49:05.29587	171	Property	0	\N	\N	\N	DOC_NONE	0
2871	6	\N	t	f	2015-04-08 13:24:52.417544	2016-08-05 22:49:05.300375	171	Property	0	\N	\N	\N	DOC_NONE	0
2872	7	\N	t	f	2015-04-08 13:24:53.918941	2016-08-05 22:49:05.304835	171	Property	0	\N	\N	\N	DOC_NONE	0
2874	9	\N	t	f	2015-04-08 13:24:56.937788	2016-08-05 22:49:05.313609	171	Property	0	\N	\N	\N	DOC_NONE	0
2875	10	\N	t	f	2015-04-08 13:24:59.627187	2016-08-05 22:49:05.317895	171	Property	0	\N	\N	\N	DOC_NONE	0
2876	11	\N	t	f	2015-04-08 13:25:01.553859	2016-08-05 22:49:05.321691	171	Property	0	\N	\N	\N	DOC_NONE	0
2898	1	\N	t	t	2015-04-08 13:25:41.641008	2016-08-05 22:49:05.32581	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2947	17	\N	t	t	2015-04-08 13:27:17.334001	2016-08-05 22:49:05.333754	177	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2932	2	\N	t	t	2015-04-08 13:26:54.268232	2016-08-05 22:49:05.339278	177	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2862	7	\N	t	t	2015-04-08 13:24:30.364853	2016-08-05 22:49:05.34364	170	Property	1	\N	\N	\N	DOC_UPLOADED	0
2899	3	\N	t	t	2015-04-08 13:25:44.147019	2016-08-05 22:49:05.347951	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2929	15	\N	t	t	2015-04-08 13:26:47.715893	2016-08-05 22:49:05.356495	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2924	3	\N	t	t	2015-04-08 13:26:32.572849	2016-08-05 22:49:05.360738	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2859	1	\N	t	t	2015-04-08 13:24:22.061933	2016-08-05 22:49:05.364919	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2904	12	\N	t	f	2015-04-08 13:25:55.776655	2016-08-05 22:49:05.369249	174	Property	0	\N	\N	\N	DOC_NONE	0
2949	2	\N	t	f	2015-04-08 13:27:20.504554	2016-08-05 22:49:05.373463	178	Property	0	\N	\N	\N	DOC_NONE	0
2951	4	\N	t	f	2015-04-08 13:27:23.51351	2016-08-05 22:49:05.382041	178	Property	0	\N	\N	\N	DOC_NONE	0
2952	5	\N	t	f	2015-04-08 13:27:25.391004	2016-08-05 22:49:05.38643	178	Property	0	\N	\N	\N	DOC_NONE	0
2953	6	\N	t	f	2015-04-08 13:27:26.897398	2016-08-05 22:49:05.390789	178	Property	0	\N	\N	\N	DOC_NONE	0
2954	7	\N	t	f	2015-04-08 13:27:28.424371	2016-08-05 22:49:05.395028	178	Property	0	\N	\N	\N	DOC_NONE	0
2956	9	\N	t	f	2015-04-08 13:27:31.498776	2016-08-05 22:49:05.403559	178	Property	0	\N	\N	\N	DOC_NONE	0
2957	10	\N	t	f	2015-04-08 13:27:33.04669	2016-08-05 22:49:05.408093	178	Property	0	\N	\N	\N	DOC_NONE	0
2958	11	\N	t	f	2015-04-08 13:27:34.608594	2016-08-05 22:49:05.412332	178	Property	0	\N	\N	\N	DOC_NONE	0
2959	12	\N	t	f	2015-04-08 13:27:36.126177	2016-08-05 22:49:05.416927	178	Property	0	\N	\N	\N	DOC_NONE	0
2960	13	\N	t	f	2015-04-08 13:27:38.02617	2016-08-05 22:49:05.420947	178	Property	0	\N	\N	\N	DOC_NONE	0
2962	15	\N	t	f	2015-04-08 13:27:41.441951	2016-08-05 22:49:05.429443	178	Property	0	\N	\N	\N	DOC_NONE	0
2963	16	\N	t	f	2015-04-08 13:27:42.965964	2016-08-05 22:49:05.433225	178	Property	0	\N	\N	\N	DOC_NONE	0
2964	17	\N	t	f	2015-04-08 13:27:44.470581	2016-08-05 22:49:05.436958	178	Property	0	\N	\N	\N	DOC_NONE	0
2965	1	\N	t	f	2015-04-08 13:27:46.142526	2016-08-05 22:49:05.441341	179	Property	0	\N	\N	\N	DOC_NONE	0
2967	5	\N	t	f	2015-04-08 13:27:51.547848	2016-08-05 22:49:05.450075	179	Property	0	\N	\N	\N	DOC_NONE	0
2968	6	\N	t	f	2015-04-08 13:27:53.068214	2016-08-05 22:49:05.454223	179	Property	0	\N	\N	\N	DOC_NONE	0
2969	10	\N	t	f	2015-04-08 13:27:58.372929	2016-08-05 22:49:05.458902	179	Property	0	\N	\N	\N	DOC_NONE	0
2971	14	\N	t	f	2015-04-08 13:28:03.407314	2016-08-05 22:49:05.462983	179	Property	0	\N	\N	\N	DOC_NONE	0
2976	2	\N	t	f	2015-04-08 13:28:11.480076	2016-08-05 22:49:05.472014	180	Property	0	\N	\N	\N	DOC_NONE	0
2977	3	\N	t	f	2015-04-08 13:28:13.365522	2016-08-05 22:49:05.476072	180	Property	0	\N	\N	\N	DOC_NONE	0
2978	4	\N	t	f	2015-04-08 13:28:14.873599	2016-08-05 22:49:05.480205	180	Property	0	\N	\N	\N	DOC_NONE	0
2979	5	\N	t	f	2015-04-08 13:28:16.365982	2016-08-05 22:49:05.484238	180	Property	0	\N	\N	\N	DOC_NONE	0
2980	6	\N	t	f	2015-04-08 13:28:17.86752	2016-08-05 22:49:05.48869	180	Property	0	\N	\N	\N	DOC_NONE	0
2982	8	\N	t	f	2015-04-08 13:28:21.248902	2016-08-05 22:49:05.499171	180	Property	0	\N	\N	\N	DOC_NONE	0
2983	9	\N	t	f	2015-04-08 13:28:22.752738	2016-08-05 22:49:05.503606	180	Property	0	\N	\N	\N	DOC_NONE	0
2984	10	\N	t	f	2015-04-08 13:28:24.645557	2016-08-05 22:49:05.50855	180	Property	0	\N	\N	\N	DOC_NONE	0
2985	11	\N	t	f	2015-04-08 13:28:26.149885	2016-08-05 22:49:05.514856	180	Property	0	\N	\N	\N	DOC_NONE	0
2988	15	\N	t	f	2015-04-08 13:28:32.0733	2016-08-05 22:49:05.524721	180	Property	0	\N	\N	\N	DOC_NONE	0
2989	16	\N	t	f	2015-04-08 13:28:33.571665	2016-08-05 22:49:05.529917	180	Property	0	\N	\N	\N	DOC_NONE	0
2990	17	\N	t	f	2015-04-08 13:28:35.07157	2016-08-05 22:49:05.534921	180	Property	0	\N	\N	\N	DOC_NONE	0
3001	11	\N	t	f	2015-04-08 13:28:52.297397	2016-08-05 22:49:05.540421	181	Property	0	\N	\N	\N	DOC_NONE	0
3002	12	\N	t	f	2015-04-08 13:28:53.843924	2016-08-05 22:49:05.545406	181	Property	0	\N	\N	\N	DOC_NONE	0
3004	14	\N	t	f	2015-04-08 13:28:56.846335	2016-08-05 22:49:05.554461	181	Property	0	\N	\N	\N	DOC_NONE	0
3005	15	\N	t	f	2015-04-08 13:28:58.369042	2016-08-05 22:49:05.559076	181	Property	0	\N	\N	\N	DOC_NONE	0
3006	16	\N	t	f	2015-04-08 13:28:59.958725	2016-08-05 22:49:05.563384	181	Property	0	\N	\N	\N	DOC_NONE	0
3008	1	\N	t	f	2015-04-08 13:29:03.159881	2016-08-05 22:49:05.568438	182	Property	0	\N	\N	\N	DOC_NONE	0
3010	3	\N	t	f	2015-04-08 13:29:07.044868	2016-08-05 22:49:05.578944	182	Property	0	\N	\N	\N	DOC_NONE	0
3011	4	\N	t	f	2015-04-08 13:29:08.557718	2016-08-05 22:49:05.584762	182	Property	0	\N	\N	\N	DOC_NONE	0
3012	5	\N	t	f	2015-04-08 13:29:10.073317	2016-08-05 22:49:05.589057	182	Property	0	\N	\N	\N	DOC_NONE	0
3013	6	\N	t	f	2015-04-08 13:29:11.950328	2016-08-05 22:49:05.593573	182	Property	0	\N	\N	\N	DOC_NONE	0
3015	8	\N	t	f	2015-04-08 13:29:15.074161	2016-08-05 22:49:05.604009	182	Property	0	\N	\N	\N	DOC_NONE	0
3016	9	\N	t	f	2015-04-08 13:29:19.593552	2016-08-05 22:49:05.608733	182	Property	0	\N	\N	\N	DOC_NONE	0
3017	10	\N	t	f	2015-04-08 13:29:21.49449	2016-08-05 22:49:05.613873	182	Property	0	\N	\N	\N	DOC_NONE	0
3018	11	\N	t	f	2015-04-08 13:29:23.026924	2016-08-05 22:49:05.61871	182	Property	0	\N	\N	\N	DOC_NONE	0
3019	12	\N	t	f	2015-04-08 13:29:24.573551	2016-08-05 22:49:05.623745	182	Property	0	\N	\N	\N	DOC_NONE	0
3021	14	\N	t	f	2015-04-08 13:29:27.676482	2016-08-05 22:49:05.632595	182	Property	0	\N	\N	\N	DOC_NONE	0
3022	15	\N	t	f	2015-04-08 13:29:29.213738	2016-08-05 22:49:05.636976	182	Property	0	\N	\N	\N	DOC_NONE	0
3023	16	\N	t	f	2015-04-08 13:29:30.757798	2016-08-05 22:49:05.640945	182	Property	0	\N	\N	\N	DOC_NONE	0
3024	17	\N	t	f	2015-04-08 13:29:32.319367	2016-08-05 22:49:05.645393	182	Property	0	\N	\N	\N	DOC_NONE	0
3026	2	\N	t	f	2015-04-08 13:29:35.554771	2016-08-05 22:49:05.655009	183	Property	0	\N	\N	\N	DOC_NONE	0
3027	3	\N	t	f	2015-04-08 13:29:37.112895	2016-08-05 22:49:05.660739	183	Property	0	\N	\N	\N	DOC_NONE	0
3029	5	\N	t	f	2015-04-08 13:29:40.168582	2016-08-05 22:49:05.676303	183	Property	0	\N	\N	\N	DOC_NONE	0
3030	6	\N	t	f	2015-04-08 13:29:41.707201	2016-08-05 22:49:05.681163	183	Property	0	\N	\N	\N	DOC_NONE	0
3031	7	\N	t	f	2015-04-08 13:29:43.232978	2016-08-05 22:49:05.686685	183	Property	0	\N	\N	\N	DOC_NONE	0
3033	9	\N	t	f	2015-04-08 13:29:46.282875	2016-08-05 22:49:05.696461	183	Property	0	\N	\N	\N	DOC_NONE	0
3034	10	\N	t	f	2015-04-08 13:29:47.812117	2016-08-05 22:49:05.701533	183	Property	0	\N	\N	\N	DOC_NONE	0
3035	11	\N	t	f	2015-04-08 13:29:49.326741	2016-08-05 22:49:05.7057	183	Property	0	\N	\N	\N	DOC_NONE	0
3036	12	\N	t	f	2015-04-08 13:29:50.86025	2016-08-05 22:49:05.710881	183	Property	0	\N	\N	\N	DOC_NONE	0
2973	16	\N	t	t	2015-04-08 13:28:06.788749	2016-08-05 22:49:05.715102	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2986	12	\N	t	t	2015-04-08 13:28:27.650275	2016-08-05 22:49:05.723107	180	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2992	2	\N	t	t	2015-04-08 13:28:38.279229	2016-08-05 22:49:05.727147	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2991	1	\N	t	t	2015-04-08 13:28:36.764231	2016-08-05 22:49:05.730982	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2994	4	\N	t	t	2015-04-08 13:28:41.310729	2016-08-05 22:49:05.734976	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2996	6	\N	t	t	2015-04-08 13:28:44.352503	2016-08-05 22:49:05.744275	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2997	7	\N	t	t	2015-04-08 13:28:45.877363	2016-08-05 22:49:05.748512	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2998	8	\N	t	t	2015-04-08 13:28:47.37704	2016-08-05 22:49:05.752306	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3000	10	\N	t	t	2015-04-08 13:28:50.797144	2016-08-05 22:49:05.756124	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2993	3	\N	t	t	2015-04-08 13:28:39.791232	2016-08-05 22:49:05.765164	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3007	17	\N	t	t	2015-04-08 13:29:01.476907	2016-08-05 22:49:05.769037	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3038	14	\N	t	f	2015-04-08 13:29:53.920869	2016-08-05 22:49:05.772807	183	Property	0	\N	\N	\N	DOC_NONE	0
3039	15	\N	t	f	2015-04-08 13:29:55.454739	2016-08-05 22:49:05.776544	183	Property	0	\N	\N	\N	DOC_NONE	0
3040	16	\N	t	f	2015-04-08 13:29:56.99332	2016-08-05 22:49:05.780333	183	Property	0	\N	\N	\N	DOC_NONE	0
3042	1	\N	t	f	2015-04-08 13:30:00.163393	2016-08-05 22:49:05.788318	184	Property	0	\N	\N	\N	DOC_NONE	0
3043	2	\N	t	f	2015-04-08 13:30:02.045169	2016-08-05 22:49:05.791994	184	Property	0	\N	\N	\N	DOC_NONE	0
3044	9	\N	t	f	2015-04-08 13:30:10.436548	2016-08-05 22:49:05.795658	184	Property	0	\N	\N	\N	DOC_NONE	0
3045	10	\N	t	f	2015-04-08 13:30:11.945273	2016-08-05 22:49:05.799346	184	Property	0	\N	\N	\N	DOC_NONE	0
3047	13	\N	t	f	2015-04-08 13:30:15.970425	2016-08-05 22:49:05.807034	184	Property	0	\N	\N	\N	DOC_NONE	0
3048	14	\N	t	f	2015-04-08 13:30:17.862503	2016-08-05 22:49:05.810855	184	Property	0	\N	\N	\N	DOC_NONE	0
3049	15	\N	t	f	2015-04-08 13:30:19.747276	2016-08-05 22:49:05.814579	184	Property	0	\N	\N	\N	DOC_NONE	0
3050	16	\N	t	f	2015-04-08 13:30:22.645133	2016-08-05 22:49:05.819133	184	Property	0	\N	\N	\N	DOC_NONE	0
3051	17	\N	t	f	2015-04-08 13:30:24.146655	2016-08-05 22:49:05.823013	184	Property	0	\N	\N	\N	DOC_NONE	0
3054	5	\N	t	f	2015-04-08 13:30:30.89187	2016-08-05 22:49:05.830843	185	Property	0	\N	\N	\N	DOC_NONE	0
3055	6	\N	t	f	2015-04-08 13:30:32.425742	2016-08-05 22:49:05.834933	185	Property	0	\N	\N	\N	DOC_NONE	0
3056	8	\N	t	f	2015-04-08 13:30:36.081192	2016-08-05 22:49:05.838956	185	Property	0	\N	\N	\N	DOC_NONE	0
3057	9	\N	t	f	2015-04-08 13:30:37.572971	2016-08-05 22:49:05.842765	185	Property	0	\N	\N	\N	DOC_NONE	0
3062	17	\N	t	f	2015-04-08 13:30:48.89473	2016-08-05 22:49:05.851284	185	Property	0	\N	\N	\N	DOC_NONE	0
3063	1	\N	t	f	2015-04-08 13:30:50.959654	2016-08-05 22:49:05.855253	188	Property	0	\N	\N	\N	DOC_NONE	0
3064	2	\N	t	f	2015-04-08 13:30:52.464277	2016-08-05 22:49:05.859378	188	Property	0	\N	\N	\N	DOC_NONE	0
3066	4	\N	t	f	2015-04-08 13:30:55.496861	2016-08-05 22:49:05.863307	188	Property	0	\N	\N	\N	DOC_NONE	0
3068	6	\N	t	f	2015-04-08 13:30:58.895907	2016-08-05 22:49:05.871098	188	Property	0	\N	\N	\N	DOC_NONE	0
3069	7	\N	t	f	2015-04-08 13:31:00.474287	2016-08-05 22:49:05.875044	188	Property	0	\N	\N	\N	DOC_NONE	0
3070	8	\N	t	f	2015-04-08 13:31:01.978075	2016-08-05 22:49:05.879338	188	Property	0	\N	\N	\N	DOC_NONE	0
3071	9	\N	t	f	2015-04-08 13:31:03.498731	2016-08-05 22:49:05.883713	188	Property	0	\N	\N	\N	DOC_NONE	0
3072	10	\N	t	f	2015-04-08 13:31:05.022676	2016-08-05 22:49:05.88755	188	Property	0	\N	\N	\N	DOC_NONE	0
3074	12	\N	t	f	2015-04-08 13:31:09.549224	2016-08-05 22:49:05.895642	188	Property	0	\N	\N	\N	DOC_NONE	0
3075	13	\N	t	f	2015-04-08 13:31:11.06672	2016-08-05 22:49:05.899669	188	Property	0	\N	\N	\N	DOC_NONE	0
3076	14	\N	t	f	2015-04-08 13:31:12.938746	2016-08-05 22:49:05.903707	188	Property	0	\N	\N	\N	DOC_NONE	0
3077	15	\N	t	f	2015-04-08 13:31:14.44594	2016-08-05 22:49:05.908106	188	Property	0	\N	\N	\N	DOC_NONE	0
3079	17	\N	t	f	2015-04-08 13:31:18.222981	2016-08-05 22:49:05.916362	188	Property	0	\N	\N	\N	DOC_NONE	0
3080	1	\N	t	f	2015-04-08 13:31:20.272854	2016-08-05 22:49:05.920205	189	Property	0	\N	\N	\N	DOC_NONE	0
3081	2	\N	t	f	2015-04-08 13:31:22.149406	2016-08-05 22:49:05.924169	189	Property	0	\N	\N	\N	DOC_NONE	0
3082	3	\N	t	f	2015-04-08 13:31:23.701986	2016-08-05 22:49:05.928118	189	Property	0	\N	\N	\N	DOC_NONE	0
3083	4	\N	t	f	2015-04-08 13:31:25.592771	2016-08-05 22:49:05.931818	189	Property	0	\N	\N	\N	DOC_NONE	0
3085	6	\N	t	f	2015-04-08 13:31:29.336737	2016-08-05 22:49:05.939733	189	Property	0	\N	\N	\N	DOC_NONE	0
3086	7	\N	t	f	2015-04-08 13:31:30.84575	2016-08-05 22:49:05.944174	189	Property	0	\N	\N	\N	DOC_NONE	0
3087	8	\N	t	f	2015-04-08 13:31:32.34765	2016-08-05 22:49:05.948464	189	Property	0	\N	\N	\N	DOC_NONE	0
3088	9	\N	t	f	2015-04-08 13:31:34.246244	2016-08-05 22:49:05.952677	189	Property	0	\N	\N	\N	DOC_NONE	0
3090	11	\N	t	f	2015-04-08 13:31:37.27028	2016-08-05 22:49:05.960487	189	Property	0	\N	\N	\N	DOC_NONE	0
3091	12	\N	t	f	2015-04-08 13:31:38.771101	2016-08-05 22:49:05.964451	189	Property	0	\N	\N	\N	DOC_NONE	0
3092	13	\N	t	f	2015-04-08 13:31:40.285741	2016-08-05 22:49:05.968287	189	Property	0	\N	\N	\N	DOC_NONE	0
3093	14	\N	t	f	2015-04-08 13:31:41.790373	2016-08-05 22:49:05.97219	189	Property	0	\N	\N	\N	DOC_NONE	0
3095	16	\N	t	f	2015-04-08 13:31:44.789612	2016-08-05 22:49:05.980771	189	Property	0	\N	\N	\N	DOC_NONE	0
3096	17	\N	t	f	2015-04-08 13:31:46.29043	2016-08-05 22:49:05.98531	189	Property	0	\N	\N	\N	DOC_NONE	0
3097	1	\N	t	f	2015-04-08 13:31:47.955635	2016-08-05 22:49:05.990045	190	Property	0	\N	\N	\N	DOC_NONE	0
3098	2	\N	t	f	2015-04-08 13:31:49.456841	2016-08-05 22:49:05.994372	190	Property	0	\N	\N	\N	DOC_NONE	0
3099	3	\N	t	f	2015-04-08 13:31:50.968845	2016-08-05 22:49:05.998306	190	Property	0	\N	\N	\N	DOC_NONE	0
3101	5	\N	t	f	2015-04-08 13:31:53.991941	2016-08-05 22:49:06.006266	190	Property	0	\N	\N	\N	DOC_NONE	0
3102	6	\N	t	f	2015-04-08 13:31:55.508386	2016-08-05 22:49:06.010458	190	Property	0	\N	\N	\N	DOC_NONE	0
3103	7	\N	t	f	2015-04-08 13:31:57.00481	2016-08-05 22:49:06.014725	190	Property	0	\N	\N	\N	DOC_NONE	0
3104	8	\N	t	f	2015-04-08 13:31:58.50489	2016-08-05 22:49:06.018501	190	Property	0	\N	\N	\N	DOC_NONE	0
3106	10	\N	t	f	2015-04-08 13:32:01.539144	2016-08-05 22:49:06.026304	190	Property	0	\N	\N	\N	DOC_NONE	0
3107	11	\N	t	f	2015-04-08 13:32:03.032741	2016-08-05 22:49:06.029974	190	Property	0	\N	\N	\N	DOC_NONE	0
3109	13	\N	t	f	2015-04-08 13:32:06.064735	2016-08-05 22:49:06.038521	190	Property	0	\N	\N	\N	DOC_NONE	0
3110	14	\N	t	f	2015-04-08 13:32:07.578189	2016-08-05 22:49:06.043318	190	Property	0	\N	\N	\N	DOC_NONE	0
3111	15	\N	t	f	2015-04-08 13:32:09.073076	2016-08-05 22:49:06.047177	190	Property	0	\N	\N	\N	DOC_NONE	0
3113	17	\N	t	f	2015-04-08 13:32:12.107255	2016-08-05 22:49:06.056443	190	Property	0	\N	\N	\N	DOC_NONE	0
3114	1	\N	t	f	2015-04-08 13:32:13.76218	2016-08-05 22:49:06.060862	191	Property	0	\N	\N	\N	DOC_NONE	0
3122	9	\N	t	f	2015-04-08 13:32:26.242176	2016-08-05 22:49:06.065744	191	Property	0	\N	\N	\N	DOC_NONE	0
3124	11	\N	t	f	2015-04-08 13:32:29.28128	2016-08-05 22:49:06.069962	191	Property	0	\N	\N	\N	DOC_NONE	0
3118	5	\N	t	f	2015-04-08 13:32:20.200859	2016-08-05 22:49:06.074504	191	Property	0	\N	\N	\N	DOC_NONE	0
3120	7	\N	t	f	2015-04-08 13:32:23.218391	2016-08-05 22:49:06.082447	191	Property	0	\N	\N	\N	DOC_NONE	0
3121	8	\N	t	f	2015-04-08 13:32:24.722487	2016-08-05 22:49:06.0862	191	Property	0	\N	\N	\N	DOC_NONE	0
3123	10	\N	t	f	2015-04-08 13:32:27.761904	2016-08-05 22:49:06.090602	191	Property	0	\N	\N	\N	DOC_NONE	0
3125	12	\N	t	f	2015-04-08 13:32:30.827289	2016-08-05 22:49:06.095416	191	Property	0	\N	\N	\N	DOC_NONE	0
3059	11	\N	t	t	2015-04-08 13:30:40.986189	2016-08-05 22:49:06.105105	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3052	1	\N	t	t	2015-04-08 13:30:25.831761	2016-08-05 22:49:06.109988	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3058	10	\N	t	t	2015-04-08 13:30:39.459669	2016-08-05 22:49:06.114603	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3061	15	\N	t	t	2015-04-08 13:30:46.014477	2016-08-05 22:49:06.118789	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3131	1	\N	t	f	2015-04-08 13:32:42.352775	2016-08-05 22:49:06.127157	192	Property	0	\N	\N	\N	DOC_NONE	0
3132	2	\N	t	f	2015-04-08 13:32:43.881689	2016-08-05 22:49:06.131258	192	Property	0	\N	\N	\N	DOC_NONE	0
3133	3	\N	t	f	2015-04-08 13:32:45.40115	2016-08-05 22:49:06.135201	192	Property	0	\N	\N	\N	DOC_NONE	0
3134	4	\N	t	f	2015-04-08 13:32:47.324578	2016-08-05 22:49:06.13985	192	Property	0	\N	\N	\N	DOC_NONE	0
3135	5	\N	t	f	2015-04-08 13:32:48.853407	2016-08-05 22:49:06.143819	192	Property	0	\N	\N	\N	DOC_NONE	0
3137	7	\N	t	f	2015-04-08 13:32:51.89433	2016-08-05 22:49:06.152653	192	Property	0	\N	\N	\N	DOC_NONE	0
3138	8	\N	t	f	2015-04-08 13:32:53.415003	2016-08-05 22:49:06.15647	192	Property	0	\N	\N	\N	DOC_NONE	0
3139	9	\N	t	f	2015-04-08 13:32:55.7004	2016-08-05 22:49:06.160922	192	Property	0	\N	\N	\N	DOC_NONE	0
3140	10	\N	t	f	2015-04-08 13:32:57.199928	2016-08-05 22:49:06.164722	192	Property	0	\N	\N	\N	DOC_NONE	0
3142	12	\N	t	f	2015-04-08 13:33:00.603356	2016-08-05 22:49:06.172868	192	Property	0	\N	\N	\N	DOC_NONE	0
3143	13	\N	t	f	2015-04-08 13:33:02.106213	2016-08-05 22:49:06.17681	192	Property	0	\N	\N	\N	DOC_NONE	0
3144	14	\N	t	f	2015-04-08 13:33:03.632116	2016-08-05 22:49:06.180525	192	Property	0	\N	\N	\N	DOC_NONE	0
3145	15	\N	t	f	2015-04-08 13:33:05.144881	2016-08-05 22:49:06.184316	192	Property	0	\N	\N	\N	DOC_NONE	0
3146	16	\N	t	f	2015-04-08 13:33:06.654125	2016-08-05 22:49:06.188804	192	Property	0	\N	\N	\N	DOC_NONE	0
3148	1	\N	t	f	2015-04-08 13:33:09.966368	2016-08-05 22:49:06.197276	193	Property	0	\N	\N	\N	DOC_NONE	0
3162	1	\N	t	f	2015-04-08 13:33:36.008769	2016-08-05 22:49:06.201166	194	Property	0	\N	\N	\N	DOC_NONE	0
3163	5	\N	t	f	2015-04-08 13:33:40.886544	2016-08-05 22:49:06.205582	194	Property	0	\N	\N	\N	DOC_NONE	0
3164	6	\N	t	f	2015-04-08 13:33:42.762654	2016-08-05 22:49:06.209966	194	Property	0	\N	\N	\N	DOC_NONE	0
3167	13	\N	t	f	2015-04-08 13:33:51.269698	2016-08-05 22:49:06.220198	194	Property	0	\N	\N	\N	DOC_NONE	0
3168	14	\N	t	f	2015-04-08 13:33:52.783731	2016-08-05 22:49:06.224214	194	Property	0	\N	\N	\N	DOC_NONE	0
3169	15	\N	t	f	2015-04-08 13:33:54.677009	2016-08-05 22:49:06.22801	194	Property	0	\N	\N	\N	DOC_NONE	0
3170	16	\N	t	f	2015-04-08 13:33:56.171167	2016-08-05 22:49:06.232058	194	Property	0	\N	\N	\N	DOC_NONE	0
3173	4	\N	t	f	2015-04-08 13:34:03.708567	2016-08-05 22:49:06.239745	195	Property	0	\N	\N	\N	DOC_NONE	0
3174	5	\N	t	f	2015-04-08 13:34:05.242777	2016-08-05 22:49:06.243612	195	Property	0	\N	\N	\N	DOC_NONE	0
3175	6	\N	t	f	2015-04-08 13:34:06.763632	2016-08-05 22:49:06.247787	195	Property	0	\N	\N	\N	DOC_NONE	0
3177	8	\N	t	f	2015-04-08 13:34:10.904181	2016-08-05 22:49:06.25236	195	Property	0	\N	\N	\N	DOC_NONE	0
3178	9	\N	t	f	2015-04-08 13:34:12.406018	2016-08-05 22:49:06.256228	195	Property	0	\N	\N	\N	DOC_NONE	0
3180	11	\N	t	f	2015-04-08 13:34:15.41306	2016-08-05 22:49:06.264096	195	Property	0	\N	\N	\N	DOC_NONE	0
3181	12	\N	t	f	2015-04-08 13:34:17.303047	2016-08-05 22:49:06.267951	195	Property	0	\N	\N	\N	DOC_NONE	0
3182	13	\N	t	f	2015-04-08 13:34:19.193283	2016-08-05 22:49:06.271857	195	Property	0	\N	\N	\N	DOC_NONE	0
3183	14	\N	t	f	2015-04-08 13:34:21.073651	2016-08-05 22:49:06.275893	195	Property	0	\N	\N	\N	DOC_NONE	0
3185	16	\N	t	f	2015-04-08 13:34:24.47977	2016-08-05 22:49:06.28381	195	Property	0	\N	\N	\N	DOC_NONE	0
3186	17	\N	t	f	2015-04-08 13:34:27.129032	2016-08-05 22:49:06.288652	195	Property	0	\N	\N	\N	DOC_NONE	0
3187	1	\N	t	f	2015-04-08 13:34:28.805705	2016-08-05 22:49:06.293134	196	Property	0	\N	\N	\N	DOC_NONE	0
3188	2	\N	t	f	2015-04-08 13:34:30.692383	2016-08-05 22:49:06.297204	196	Property	0	\N	\N	\N	DOC_NONE	0
3189	3	\N	t	f	2015-04-08 13:34:32.210265	2016-08-05 22:49:06.301406	196	Property	0	\N	\N	\N	DOC_NONE	0
3191	5	\N	t	f	2015-04-08 13:34:35.973078	2016-08-05 22:49:06.309146	196	Property	0	\N	\N	\N	DOC_NONE	0
3192	6	\N	t	f	2015-04-08 13:34:37.877998	2016-08-05 22:49:06.313281	196	Property	0	\N	\N	\N	DOC_NONE	0
3193	7	\N	t	f	2015-04-08 13:34:39.414062	2016-08-05 22:49:06.317499	196	Property	0	\N	\N	\N	DOC_NONE	0
3194	8	\N	t	f	2015-04-08 13:34:40.935002	2016-08-05 22:49:06.321682	196	Property	0	\N	\N	\N	DOC_NONE	0
3196	10	\N	t	f	2015-04-08 13:34:43.949098	2016-08-05 22:49:06.330839	196	Property	0	\N	\N	\N	DOC_NONE	0
3197	11	\N	t	f	2015-04-08 13:34:45.484129	2016-08-05 22:49:06.335283	196	Property	0	\N	\N	\N	DOC_NONE	0
3198	12	\N	t	f	2015-04-08 13:34:47.360987	2016-08-05 22:49:06.33981	196	Property	0	\N	\N	\N	DOC_NONE	0
3199	13	\N	t	f	2015-04-08 13:34:49.24401	2016-08-05 22:49:06.344316	196	Property	0	\N	\N	\N	DOC_NONE	0
3201	15	\N	t	f	2015-04-08 13:34:52.257661	2016-08-05 22:49:06.353452	196	Property	0	\N	\N	\N	DOC_NONE	0
3202	16	\N	t	f	2015-04-08 13:34:53.822321	2016-08-05 22:49:06.357752	196	Property	0	\N	\N	\N	DOC_NONE	0
3203	17	\N	t	f	2015-04-08 13:34:55.323015	2016-08-05 22:49:06.362426	196	Property	0	\N	\N	\N	DOC_NONE	0
3204	1	\N	t	f	2015-04-08 13:34:57.016435	2016-08-05 22:49:06.366838	197	Property	0	\N	\N	\N	DOC_NONE	0
3205	2	\N	t	f	2015-04-08 13:34:58.524956	2016-08-05 22:49:06.371342	197	Property	0	\N	\N	\N	DOC_NONE	0
3207	4	\N	t	f	2015-04-08 13:35:01.564376	2016-08-05 22:49:06.38008	197	Property	0	\N	\N	\N	DOC_NONE	0
3208	5	\N	t	f	2015-04-08 13:35:03.439563	2016-08-05 22:49:06.384136	197	Property	0	\N	\N	\N	DOC_NONE	0
3209	6	\N	t	f	2015-04-08 13:35:05.200053	2016-08-05 22:49:06.388242	197	Property	0	\N	\N	\N	DOC_NONE	0
3210	7	\N	t	f	2015-04-08 13:35:06.694524	2016-08-05 22:49:06.39215	197	Property	0	\N	\N	\N	DOC_NONE	0
3212	9	\N	t	f	2015-04-08 13:35:10.049018	2016-08-05 22:49:06.401132	197	Property	0	\N	\N	\N	DOC_NONE	0
3213	10	\N	t	f	2015-04-08 13:35:11.924314	2016-08-05 22:49:06.405519	197	Property	0	\N	\N	\N	DOC_NONE	0
3129	16	\N	t	f	2015-04-08 13:32:38.378579	2016-08-05 22:49:06.414477	191	Property	0	\N	\N	\N	DOC_NONE	0
3128	15	\N	t	f	2015-04-08 13:32:36.882219	2016-08-05 22:49:06.418833	191	Property	0	\N	\N	\N	DOC_NONE	0
3165	9	\N	t	t	2015-04-08 13:33:46.262005	2016-08-05 22:49:06.422926	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3176	7	\N	t	t	2015-04-08 13:34:08.26883	2016-08-05 22:49:06.435244	195	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3149	2	\N	t	t	2015-04-08 13:33:11.483719	2016-08-05 22:49:06.43986	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3151	4	\N	t	t	2015-04-08 13:33:14.910238	2016-08-05 22:49:06.445234	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3152	5	\N	t	t	2015-04-08 13:33:16.815519	2016-08-05 22:49:06.450508	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3153	6	\N	t	t	2015-04-08 13:33:18.698563	2016-08-05 22:49:06.455845	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3155	8	\N	t	t	2015-04-08 13:33:22.093076	2016-08-05 22:49:06.466116	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3157	11	\N	t	t	2015-04-08 13:33:26.131879	2016-08-05 22:49:06.471318	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3158	14	\N	t	t	2015-04-08 13:33:29.670727	2016-08-05 22:49:06.476504	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3160	16	\N	t	t	2015-04-08 13:33:32.822245	2016-08-05 22:49:06.481579	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3159	15	\N	t	t	2015-04-08 13:33:31.192751	2016-08-05 22:49:06.492275	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3161	17	\N	t	t	2015-04-08 13:33:34.314903	2016-08-05 22:49:06.497359	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3216	13	\N	t	f	2015-04-08 13:35:16.433041	2016-08-05 22:49:06.502637	197	Property	0	\N	\N	\N	DOC_NONE	0
3217	14	\N	t	f	2015-04-08 13:35:19.052212	2016-08-05 22:49:06.507328	197	Property	0	\N	\N	\N	DOC_NONE	0
3219	16	\N	t	f	2015-04-08 13:35:22.037786	2016-08-05 22:49:06.51595	197	Property	0	\N	\N	\N	DOC_NONE	0
3220	17	\N	t	f	2015-04-08 13:35:24.282625	2016-08-05 22:49:06.52028	197	Property	0	\N	\N	\N	DOC_NONE	0
3221	1	\N	t	f	2015-04-08 13:35:25.973589	2016-08-05 22:49:06.524486	198	Property	0	\N	\N	\N	DOC_NONE	0
3222	2	\N	t	f	2015-04-08 13:35:27.857297	2016-08-05 22:49:06.528644	198	Property	0	\N	\N	\N	DOC_NONE	0
3223	3	\N	t	f	2015-04-08 13:35:29.726341	2016-08-05 22:49:06.532482	198	Property	0	\N	\N	\N	DOC_NONE	0
3225	5	\N	t	f	2015-04-08 13:35:33.121954	2016-08-05 22:49:06.540615	198	Property	0	\N	\N	\N	DOC_NONE	0
3226	6	\N	t	f	2015-04-08 13:35:35.360148	2016-08-05 22:49:06.544557	198	Property	0	\N	\N	\N	DOC_NONE	0
3227	7	\N	t	f	2015-04-08 13:35:36.876003	2016-08-05 22:49:06.548934	198	Property	0	\N	\N	\N	DOC_NONE	0
3228	8	\N	t	f	2015-04-08 13:35:38.379763	2016-08-05 22:49:06.554287	198	Property	0	\N	\N	\N	DOC_NONE	0
3230	10	\N	t	f	2015-04-08 13:35:41.778659	2016-08-05 22:49:06.564355	198	Property	0	\N	\N	\N	DOC_NONE	0
3231	11	\N	t	f	2015-04-08 13:35:43.661745	2016-08-05 22:49:06.569621	198	Property	0	\N	\N	\N	DOC_NONE	0
3232	12	\N	t	f	2015-04-08 13:35:45.948882	2016-08-05 22:49:06.574647	198	Property	0	\N	\N	\N	DOC_NONE	0
3233	13	\N	t	f	2015-04-08 13:35:47.47224	2016-08-05 22:49:06.579729	198	Property	0	\N	\N	\N	DOC_NONE	0
3234	14	\N	t	f	2015-04-08 13:35:49.400875	2016-08-05 22:49:06.584959	198	Property	0	\N	\N	\N	DOC_NONE	0
3236	16	\N	t	f	2015-04-08 13:35:53.226601	2016-08-05 22:49:06.595126	198	Property	0	\N	\N	\N	DOC_NONE	0
3237	17	\N	t	f	2015-04-08 13:35:54.768265	2016-08-05 22:49:06.600176	198	Property	0	\N	\N	\N	DOC_NONE	0
3240	4	\N	t	f	2015-04-08 13:36:00.532171	2016-08-05 22:49:06.605102	199	Property	0	\N	\N	\N	DOC_NONE	0
3241	5	\N	t	f	2015-04-08 13:36:02.041897	2016-08-05 22:49:06.610031	199	Property	0	\N	\N	\N	DOC_NONE	0
3243	7	\N	t	f	2015-04-08 13:36:05.123631	2016-08-05 22:49:06.62062	199	Property	0	\N	\N	\N	DOC_NONE	0
3244	8	\N	t	f	2015-04-08 13:36:06.620131	2016-08-05 22:49:06.625191	199	Property	0	\N	\N	\N	DOC_NONE	0
3245	9	\N	t	f	2015-04-08 13:36:08.139498	2016-08-05 22:49:06.630028	199	Property	0	\N	\N	\N	DOC_NONE	0
3247	11	\N	t	f	2015-04-08 13:36:11.1307	2016-08-05 22:49:06.63392	199	Property	0	\N	\N	\N	DOC_NONE	0
3249	13	\N	t	f	2015-04-08 13:36:14.152479	2016-08-05 22:49:06.642062	199	Property	0	\N	\N	\N	DOC_NONE	0
3250	14	\N	t	f	2015-04-08 13:36:15.651658	2016-08-05 22:49:06.646222	199	Property	0	\N	\N	\N	DOC_NONE	0
3251	15	\N	t	f	2015-04-08 13:36:17.155873	2016-08-05 22:49:06.650829	199	Property	0	\N	\N	\N	DOC_NONE	0
3252	16	\N	t	f	2015-04-08 13:36:18.65206	2016-08-05 22:49:06.655796	199	Property	0	\N	\N	\N	DOC_NONE	0
3253	17	\N	t	f	2015-04-08 13:36:20.157943	2016-08-05 22:49:06.660174	199	Property	0	\N	\N	\N	DOC_NONE	0
3256	4	\N	t	f	2015-04-08 13:36:26.182516	2016-08-05 22:49:06.668374	201	Property	0	\N	\N	\N	DOC_NONE	0
3257	5	\N	t	f	2015-04-08 13:36:27.673775	2016-08-05 22:49:06.67247	201	Property	0	\N	\N	\N	DOC_NONE	0
3258	6	\N	t	f	2015-04-08 13:36:29.559792	2016-08-05 22:49:06.676557	201	Property	0	\N	\N	\N	DOC_NONE	0
3259	7	\N	t	f	2015-04-08 13:36:31.441594	2016-08-05 22:49:06.68032	201	Property	0	\N	\N	\N	DOC_NONE	0
3261	9	\N	t	f	2015-04-08 13:36:35.224668	2016-08-05 22:49:06.688476	201	Property	0	\N	\N	\N	DOC_NONE	0
3262	10	\N	t	f	2015-04-08 13:36:37.123411	2016-08-05 22:49:06.69255	201	Property	0	\N	\N	\N	DOC_NONE	0
3263	11	\N	t	f	2015-04-08 13:36:39.120146	2016-08-05 22:49:06.69667	201	Property	0	\N	\N	\N	DOC_NONE	0
3264	12	\N	t	f	2015-04-08 13:36:41.038043	2016-08-05 22:49:06.700891	201	Property	0	\N	\N	\N	DOC_NONE	0
3265	13	\N	t	f	2015-04-08 13:36:42.527447	2016-08-05 22:49:06.705247	201	Property	0	\N	\N	\N	DOC_NONE	0
3267	15	\N	t	f	2015-04-08 13:36:45.911746	2016-08-05 22:49:06.713332	201	Property	0	\N	\N	\N	DOC_NONE	0
3268	16	\N	t	f	2015-04-08 13:36:47.412013	2016-08-05 22:49:06.717812	201	Property	0	\N	\N	\N	DOC_NONE	0
3269	17	\N	t	f	2015-04-08 13:36:49.315925	2016-08-05 22:49:06.721814	201	Property	0	\N	\N	\N	DOC_NONE	0
3270	4	\N	t	f	2015-04-08 13:36:54.752172	2016-08-05 22:49:06.726094	202	Property	0	\N	\N	\N	DOC_NONE	0
3272	6	\N	t	f	2015-04-08 13:36:58.816796	2016-08-05 22:49:06.735336	202	Property	0	\N	\N	\N	DOC_NONE	0
3273	7	\N	t	f	2015-04-08 13:37:00.711599	2016-08-05 22:49:06.739474	202	Property	0	\N	\N	\N	DOC_NONE	0
3274	8	\N	t	f	2015-04-08 13:37:02.257075	2016-08-05 22:49:06.743556	202	Property	0	\N	\N	\N	DOC_NONE	0
3275	9	\N	t	f	2015-04-08 13:37:03.776386	2016-08-05 22:49:06.74771	202	Property	0	\N	\N	\N	DOC_NONE	0
3277	11	\N	t	f	2015-04-08 13:37:07.926156	2016-08-05 22:49:06.75583	202	Property	0	\N	\N	\N	DOC_NONE	0
3278	12	\N	t	f	2015-04-08 13:37:09.815827	2016-08-05 22:49:06.759833	202	Property	0	\N	\N	\N	DOC_NONE	0
3279	13	\N	t	f	2015-04-08 13:37:11.323654	2016-08-05 22:49:06.763754	202	Property	0	\N	\N	\N	DOC_NONE	0
3280	14	\N	t	f	2015-04-08 13:37:12.856882	2016-08-05 22:49:06.768295	202	Property	0	\N	\N	\N	DOC_NONE	0
3281	15	\N	t	f	2015-04-08 13:37:14.470124	2016-08-05 22:49:06.772227	202	Property	0	\N	\N	\N	DOC_NONE	0
3283	17	\N	t	f	2015-04-08 13:37:17.883596	2016-08-05 22:49:06.780579	202	Property	0	\N	\N	\N	DOC_NONE	0
3284	4	\N	t	f	2015-04-08 13:37:24.174195	2016-08-05 22:49:06.784774	203	Property	0	\N	\N	\N	DOC_NONE	0
3285	5	\N	t	f	2015-04-08 13:37:25.674489	2016-08-05 22:49:06.788888	203	Property	0	\N	\N	\N	DOC_NONE	0
3286	6	\N	t	f	2015-04-08 13:37:27.189662	2016-08-05 22:49:06.792894	203	Property	0	\N	\N	\N	DOC_NONE	0
3288	8	\N	t	f	2015-04-08 13:37:30.215569	2016-08-05 22:49:06.802785	203	Property	0	\N	\N	\N	DOC_NONE	0
3289	9	\N	t	f	2015-04-08 13:37:32.111884	2016-08-05 22:49:06.806893	203	Property	0	\N	\N	\N	DOC_NONE	0
3291	11	\N	t	f	2015-04-08 13:37:35.496428	2016-08-05 22:49:06.815382	203	Property	0	\N	\N	\N	DOC_NONE	0
3292	12	\N	t	f	2015-04-08 13:37:37.37929	2016-08-05 22:49:06.819349	203	Property	0	\N	\N	\N	DOC_NONE	0
3293	13	\N	t	f	2015-04-08 13:37:39.265007	2016-08-05 22:49:06.823435	203	Property	0	\N	\N	\N	DOC_NONE	0
3295	15	\N	t	f	2015-04-08 13:37:43.054503	2016-08-05 22:49:06.831971	203	Property	0	\N	\N	\N	DOC_NONE	0
3296	16	\N	t	f	2015-04-08 13:37:44.564782	2016-08-05 22:49:06.836502	203	Property	0	\N	\N	\N	DOC_NONE	0
3297	17	\N	t	f	2015-04-08 13:37:46.457907	2016-08-05 22:49:06.840372	203	Property	0	\N	\N	\N	DOC_NONE	0
3298	4	\N	t	f	2015-04-08 13:37:52.270565	2016-08-05 22:49:06.844697	204	Property	0	\N	\N	\N	DOC_NONE	0
3299	5	\N	t	f	2015-04-08 13:37:54.146807	2016-08-05 22:49:06.848854	204	Property	0	\N	\N	\N	DOC_NONE	0
3301	7	\N	t	f	2015-04-08 13:37:57.955741	2016-08-05 22:49:06.85675	204	Property	0	\N	\N	\N	DOC_NONE	0
3302	8	\N	t	f	2015-04-08 13:37:59.501361	2016-08-05 22:49:06.860423	204	Property	0	\N	\N	\N	DOC_NONE	0
3303	9	\N	t	f	2015-04-08 13:38:01.031397	2016-08-05 22:49:06.86457	204	Property	0	\N	\N	\N	DOC_NONE	0
3239	3	\N	t	t	2015-04-08 13:35:59.029948	2016-08-05 22:49:06.868845	199	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3305	11	\N	t	f	2015-04-08 13:38:04.808818	2016-08-05 22:49:06.877342	204	Property	0	\N	\N	\N	DOC_NONE	0
3306	12	\N	t	f	2015-04-08 13:38:06.703641	2016-08-05 22:49:06.881527	204	Property	0	\N	\N	\N	DOC_NONE	0
3307	13	\N	t	f	2015-04-08 13:38:08.201336	2016-08-05 22:49:06.885466	204	Property	0	\N	\N	\N	DOC_NONE	0
3308	14	\N	t	f	2015-04-08 13:38:09.711244	2016-08-05 22:49:06.889243	204	Property	0	\N	\N	\N	DOC_NONE	0
3310	16	\N	t	f	2015-04-08 13:38:12.735478	2016-08-05 22:49:06.897371	204	Property	0	\N	\N	\N	DOC_NONE	0
3311	17	\N	t	f	2015-04-08 13:38:14.253232	2016-08-05 22:49:06.90135	204	Property	0	\N	\N	\N	DOC_NONE	0
3312	2	\N	t	f	2015-04-08 13:38:16.9299	2016-08-05 22:49:06.905575	205	Property	0	\N	\N	\N	DOC_NONE	0
3313	3	\N	t	f	2015-04-08 13:38:18.444674	2016-08-05 22:49:06.909651	205	Property	0	\N	\N	\N	DOC_NONE	0
3314	4	\N	t	f	2015-04-08 13:38:20.602363	2016-08-05 22:49:06.914128	205	Property	0	\N	\N	\N	DOC_NONE	0
3316	6	\N	t	f	2015-04-08 13:38:24.763616	2016-08-05 22:49:06.922522	205	Property	0	\N	\N	\N	DOC_NONE	0
3317	7	\N	t	f	2015-04-08 13:38:27.43835	2016-08-05 22:49:06.926859	205	Property	0	\N	\N	\N	DOC_NONE	0
3318	8	\N	t	f	2015-04-08 13:38:28.930096	2016-08-05 22:49:06.930942	205	Property	0	\N	\N	\N	DOC_NONE	0
3319	9	\N	t	f	2015-04-08 13:38:30.423656	2016-08-05 22:49:06.934924	205	Property	0	\N	\N	\N	DOC_NONE	0
3321	11	\N	t	f	2015-04-08 13:38:33.850667	2016-08-05 22:49:06.94367	205	Property	0	\N	\N	\N	DOC_NONE	0
3322	12	\N	t	f	2015-04-08 13:38:35.36208	2016-08-05 22:49:06.947905	205	Property	0	\N	\N	\N	DOC_NONE	0
3323	13	\N	t	f	2015-04-08 13:38:36.865894	2016-08-05 22:49:06.951901	205	Property	0	\N	\N	\N	DOC_NONE	0
3324	14	\N	t	f	2015-04-08 13:38:38.771568	2016-08-05 22:49:06.956262	205	Property	0	\N	\N	\N	DOC_NONE	0
3325	15	\N	t	f	2015-04-08 13:38:40.319145	2016-08-05 22:49:06.980063	205	Property	0	\N	\N	\N	DOC_NONE	0
3327	17	\N	t	f	2015-04-08 13:38:44.1109	2016-08-05 22:49:06.990063	205	Property	0	\N	\N	\N	DOC_NONE	0
3328	1	\N	t	f	2015-04-08 13:38:47.4317	2016-08-05 22:49:06.994722	206	Property	0	\N	\N	\N	DOC_NONE	0
3329	2	\N	t	f	2015-04-08 13:38:48.935048	2016-08-05 22:49:06.998898	206	Property	0	\N	\N	\N	DOC_NONE	0
3330	3	\N	t	f	2015-04-08 13:38:51.559197	2016-08-05 22:49:07.002944	206	Property	0	\N	\N	\N	DOC_NONE	0
3332	5	\N	t	f	2015-04-08 13:38:54.978211	2016-08-05 22:49:07.011438	206	Property	0	\N	\N	\N	DOC_NONE	0
3333	6	\N	t	f	2015-04-08 13:38:56.484888	2016-08-05 22:49:07.016059	206	Property	0	\N	\N	\N	DOC_NONE	0
3334	7	\N	t	f	2015-04-08 13:38:57.980937	2016-08-05 22:49:07.020718	206	Property	0	\N	\N	\N	DOC_NONE	0
3335	8	\N	t	f	2015-04-08 13:38:59.498394	2016-08-05 22:49:07.027024	206	Property	0	\N	\N	\N	DOC_NONE	0
3338	11	\N	t	f	2015-04-08 13:39:04.435199	2016-08-05 22:49:07.037096	206	Property	0	\N	\N	\N	DOC_NONE	0
3339	12	\N	t	f	2015-04-08 13:39:05.937702	2016-08-05 22:49:07.041193	206	Property	0	\N	\N	\N	DOC_NONE	0
3340	13	\N	t	f	2015-04-08 13:39:07.831556	2016-08-05 22:49:07.045618	206	Property	0	\N	\N	\N	DOC_NONE	0
3341	14	\N	t	f	2015-04-08 13:39:10.102448	2016-08-05 22:49:07.049528	206	Property	0	\N	\N	\N	DOC_NONE	0
3342	15	\N	t	f	2015-04-08 13:39:11.974166	2016-08-05 22:49:07.053715	206	Property	0	\N	\N	\N	DOC_NONE	0
3344	17	\N	t	f	2015-04-08 13:39:15.777838	2016-08-05 22:49:07.061543	206	Property	0	\N	\N	\N	DOC_NONE	0
3345	1	\N	t	f	2015-04-08 13:39:17.830879	2016-08-05 22:49:07.065588	207	Property	0	\N	\N	\N	DOC_NONE	0
3348	4	\N	t	f	2015-04-08 13:39:22.750609	2016-08-05 22:49:07.069615	207	Property	0	\N	\N	\N	DOC_NONE	0
3349	5	\N	t	f	2015-04-08 13:39:24.273635	2016-08-05 22:49:07.073963	207	Property	0	\N	\N	\N	DOC_NONE	0
3351	7	\N	t	f	2015-04-08 13:39:27.693321	2016-08-05 22:49:07.08302	207	Property	0	\N	\N	\N	DOC_NONE	0
3352	8	\N	t	f	2015-04-08 13:39:29.581121	2016-08-05 22:49:07.087063	207	Property	0	\N	\N	\N	DOC_NONE	0
3353	9	\N	t	f	2015-04-08 13:39:31.503387	2016-08-05 22:49:07.091216	207	Property	0	\N	\N	\N	DOC_NONE	0
3354	10	\N	t	f	2015-04-08 13:39:33.000088	2016-08-05 22:49:07.095554	207	Property	0	\N	\N	\N	DOC_NONE	0
3355	11	\N	t	f	2015-04-08 13:39:35.286195	2016-08-05 22:49:07.10003	207	Property	0	\N	\N	\N	DOC_NONE	0
3357	13	\N	t	f	2015-04-08 13:39:39.055959	2016-08-05 22:49:07.108385	207	Property	0	\N	\N	\N	DOC_NONE	0
3358	14	\N	t	f	2015-04-08 13:39:41.459721	2016-08-05 22:49:07.11278	207	Property	0	\N	\N	\N	DOC_NONE	0
3359	15	\N	t	f	2015-04-08 13:39:43.773366	2016-08-05 22:49:07.117289	207	Property	0	\N	\N	\N	DOC_NONE	0
3360	16	\N	t	f	2015-04-08 13:39:45.276716	2016-08-05 22:49:07.121711	207	Property	0	\N	\N	\N	DOC_NONE	0
3364	3	\N	t	f	2015-04-08 13:39:52.245241	2016-08-05 22:49:07.130473	208	Property	0	\N	\N	\N	DOC_NONE	0
3365	4	\N	t	f	2015-04-08 13:39:54.138375	2016-08-05 22:49:07.13476	208	Property	0	\N	\N	\N	DOC_NONE	0
3366	5	\N	t	f	2015-04-08 13:39:56.026765	2016-08-05 22:49:07.139337	208	Property	0	\N	\N	\N	DOC_NONE	0
3367	6	\N	t	f	2015-04-08 13:39:57.538028	2016-08-05 22:49:07.143822	208	Property	0	\N	\N	\N	DOC_NONE	0
3370	9	\N	t	f	2015-04-08 13:40:02.818219	2016-08-05 22:49:07.152325	208	Property	0	\N	\N	\N	DOC_NONE	0
3371	10	\N	t	f	2015-04-08 13:40:04.333977	2016-08-05 22:49:07.156513	208	Property	0	\N	\N	\N	DOC_NONE	0
3372	11	\N	t	f	2015-04-08 13:40:06.208583	2016-08-05 22:49:07.160713	208	Property	0	\N	\N	\N	DOC_NONE	0
3373	14	\N	t	f	2015-04-08 13:40:10.506401	2016-08-05 22:49:07.164749	208	Property	0	\N	\N	\N	DOC_NONE	0
3374	15	\N	t	f	2015-04-08 13:40:12.008073	2016-08-05 22:49:07.168789	208	Property	0	\N	\N	\N	DOC_NONE	0
3376	17	\N	t	f	2015-04-08 13:40:15.803392	2016-08-05 22:49:07.177052	208	Property	0	\N	\N	\N	DOC_NONE	0
3377	1	\N	t	f	2015-04-08 13:40:17.538673	2016-08-05 22:49:07.181792	209	Property	0	\N	\N	\N	DOC_NONE	0
3379	3	\N	t	f	2015-04-08 13:40:20.942864	2016-08-05 22:49:07.187102	209	Property	0	\N	\N	\N	DOC_NONE	0
3380	4	\N	t	f	2015-04-08 13:40:23.197296	2016-08-05 22:49:07.191288	209	Property	0	\N	\N	\N	DOC_NONE	0
3382	6	\N	t	f	2015-04-08 13:40:26.200551	2016-08-05 22:49:07.199448	209	Property	0	\N	\N	\N	DOC_NONE	0
3383	7	\N	t	f	2015-04-08 13:40:28.491477	2016-08-05 22:49:07.203455	209	Property	0	\N	\N	\N	DOC_NONE	0
3385	9	\N	t	f	2015-04-08 13:40:31.875084	2016-08-05 22:49:07.211936	209	Property	0	\N	\N	\N	DOC_NONE	0
3386	10	\N	t	f	2015-04-08 13:40:33.838949	2016-08-05 22:49:07.216135	209	Property	0	\N	\N	\N	DOC_NONE	0
3387	11	\N	t	f	2015-04-08 13:40:36.55024	2016-08-05 22:49:07.220241	209	Property	0	\N	\N	\N	DOC_NONE	0
3389	13	\N	t	f	2015-04-08 13:40:39.940391	2016-08-05 22:49:07.228651	209	Property	0	\N	\N	\N	DOC_NONE	0
3390	14	\N	t	f	2015-04-08 13:40:41.456841	2016-08-05 22:49:07.233479	209	Property	0	\N	\N	\N	DOC_NONE	0
3391	15	\N	t	f	2015-04-08 13:40:42.968203	2016-08-05 22:49:07.238781	209	Property	0	\N	\N	\N	DOC_NONE	0
3392	16	\N	t	f	2015-04-08 13:40:45.230925	2016-08-05 22:49:07.243246	209	Property	0	\N	\N	\N	DOC_NONE	0
3347	3	\N	t	t	2015-04-08 13:39:21.222888	2016-08-05 22:49:07.248278	207	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3362	1	\N	t	t	2015-04-08 13:39:48.469719	2016-08-05 22:49:07.257826	208	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3368	7	\N	t	t	2015-04-08 13:39:59.426213	2016-08-05 22:49:07.26243	208	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3378	2	\N	t	t	2015-04-08 13:40:19.039457	2016-08-05 22:49:07.267303	209	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3394	1	\N	t	f	2015-04-08 13:40:48.799442	2016-08-05 22:49:07.271369	210	Property	0	\N	\N	\N	DOC_NONE	0
3397	4	\N	t	f	2015-04-08 13:40:54.890973	2016-08-05 22:49:07.279728	210	Property	0	\N	\N	\N	DOC_NONE	0
3398	5	\N	t	f	2015-04-08 13:40:56.396561	2016-08-05 22:49:07.283866	210	Property	0	\N	\N	\N	DOC_NONE	0
3399	6	\N	t	f	2015-04-08 13:40:57.892885	2016-08-05 22:49:07.288003	210	Property	0	\N	\N	\N	DOC_NONE	0
3400	7	\N	t	f	2015-04-08 13:40:59.779044	2016-08-05 22:49:07.292031	210	Property	0	\N	\N	\N	DOC_NONE	0
3402	9	\N	t	f	2015-04-08 13:41:03.582741	2016-08-05 22:49:07.299838	210	Property	0	\N	\N	\N	DOC_NONE	0
3403	10	\N	t	f	2015-04-08 13:41:05.476351	2016-08-05 22:49:07.303721	210	Property	0	\N	\N	\N	DOC_NONE	0
3404	11	\N	t	f	2015-04-08 13:41:06.983536	2016-08-05 22:49:07.307507	210	Property	0	\N	\N	\N	DOC_NONE	0
3405	12	\N	t	f	2015-04-08 13:41:08.497705	2016-08-05 22:49:07.311276	210	Property	0	\N	\N	\N	DOC_NONE	0
3406	13	\N	t	f	2015-04-08 13:41:10.020012	2016-08-05 22:49:07.315174	210	Property	0	\N	\N	\N	DOC_NONE	0
3408	15	\N	t	f	2015-04-08 13:41:13.418945	2016-08-05 22:49:07.3229	210	Property	0	\N	\N	\N	DOC_NONE	0
3409	16	\N	t	f	2015-04-08 13:41:15.293389	2016-08-05 22:49:07.326654	210	Property	0	\N	\N	\N	DOC_NONE	0
3410	17	\N	t	f	2015-04-08 13:41:16.787788	2016-08-05 22:49:07.330607	210	Property	0	\N	\N	\N	DOC_NONE	0
3411	1	\N	t	f	2015-04-08 13:41:18.461797	2016-08-05 22:49:07.334498	211	Property	0	\N	\N	\N	DOC_NONE	0
3413	3	\N	t	f	2015-04-08 13:41:21.474913	2016-08-05 22:49:07.34417	211	Property	0	\N	\N	\N	DOC_NONE	0
3414	4	\N	t	f	2015-04-08 13:41:22.967183	2016-08-05 22:49:07.348452	211	Property	0	\N	\N	\N	DOC_NONE	0
3415	5	\N	t	f	2015-04-08 13:41:24.471432	2016-08-05 22:49:07.352309	211	Property	0	\N	\N	\N	DOC_NONE	0
3416	6	\N	t	f	2015-04-08 13:41:25.973861	2016-08-05 22:49:07.357011	211	Property	0	\N	\N	\N	DOC_NONE	0
3417	7	\N	t	f	2015-04-08 13:41:27.486731	2016-08-05 22:49:07.361235	211	Property	0	\N	\N	\N	DOC_NONE	0
3419	9	\N	t	f	2015-04-08 13:41:30.481582	2016-08-05 22:49:07.370941	211	Property	0	\N	\N	\N	DOC_NONE	0
3420	10	\N	t	f	2015-04-08 13:41:32.069409	2016-08-05 22:49:07.375125	211	Property	0	\N	\N	\N	DOC_NONE	0
3421	11	\N	t	f	2015-04-08 13:41:33.611325	2016-08-05 22:49:07.379608	211	Property	0	\N	\N	\N	DOC_NONE	0
3422	12	\N	t	f	2015-04-08 13:41:35.13146	2016-08-05 22:49:07.383521	211	Property	0	\N	\N	\N	DOC_NONE	0
3424	14	\N	t	f	2015-04-08 13:41:38.126292	2016-08-05 22:49:07.392085	211	Property	0	\N	\N	\N	DOC_NONE	0
3425	15	\N	t	f	2015-04-08 13:41:39.634347	2016-08-05 22:49:07.396699	211	Property	0	\N	\N	\N	DOC_NONE	0
3426	16	\N	t	f	2015-04-08 13:41:41.925452	2016-08-05 22:49:07.400687	211	Property	0	\N	\N	\N	DOC_NONE	0
3427	17	\N	t	f	2015-04-08 13:41:43.457857	2016-08-05 22:49:07.404604	211	Property	0	\N	\N	\N	DOC_NONE	0
3431	4	\N	t	f	2015-04-08 13:41:49.707508	2016-08-05 22:49:07.414684	212	Property	0	\N	\N	\N	DOC_NONE	0
3432	5	\N	t	f	2015-04-08 13:41:51.217725	2016-08-05 22:49:07.419111	212	Property	0	\N	\N	\N	DOC_NONE	0
3433	6	\N	t	f	2015-04-08 13:41:52.710196	2016-08-05 22:49:07.424032	212	Property	0	\N	\N	\N	DOC_NONE	0
3434	7	\N	t	f	2015-04-08 13:41:54.213666	2016-08-05 22:49:07.428834	212	Property	0	\N	\N	\N	DOC_NONE	0
3435	8	\N	t	f	2015-04-08 13:41:56.079588	2016-08-05 22:49:07.433551	212	Property	0	\N	\N	\N	DOC_NONE	0
3437	10	\N	t	f	2015-04-08 13:41:59.499435	2016-08-05 22:49:07.44375	212	Property	0	\N	\N	\N	DOC_NONE	0
3438	11	\N	t	f	2015-04-08 13:42:00.997258	2016-08-05 22:49:07.448231	212	Property	0	\N	\N	\N	DOC_NONE	0
3439	12	\N	t	f	2015-04-08 13:42:02.871357	2016-08-05 22:49:07.452449	212	Property	0	\N	\N	\N	DOC_NONE	0
3440	13	\N	t	f	2015-04-08 13:42:04.762957	2016-08-05 22:49:07.459227	212	Property	0	\N	\N	\N	DOC_NONE	0
3442	15	\N	t	f	2015-04-08 13:42:07.769881	2016-08-05 22:49:07.468619	212	Property	0	\N	\N	\N	DOC_NONE	0
3443	16	\N	t	f	2015-04-08 13:42:09.270044	2016-08-05 22:49:07.473608	212	Property	0	\N	\N	\N	DOC_NONE	0
3444	17	\N	t	f	2015-04-08 13:42:10.776908	2016-08-05 22:49:07.47825	212	Property	0	\N	\N	\N	DOC_NONE	0
3446	4	\N	t	f	2015-04-08 13:42:16.003926	2016-08-05 22:49:07.48437	214	Property	0	\N	\N	\N	DOC_NONE	0
3447	5	\N	t	f	2015-04-08 13:42:17.509684	2016-08-05 22:49:07.489313	214	Property	0	\N	\N	\N	DOC_NONE	0
3449	7	\N	t	f	2015-04-08 13:42:21.581698	2016-08-05 22:49:07.49945	214	Property	0	\N	\N	\N	DOC_NONE	0
3450	8	\N	t	f	2015-04-08 13:42:23.101227	2016-08-05 22:49:07.505234	214	Property	0	\N	\N	\N	DOC_NONE	0
3451	9	\N	t	f	2015-04-08 13:42:25.403709	2016-08-05 22:49:07.510234	214	Property	0	\N	\N	\N	DOC_NONE	0
3452	10	\N	t	f	2015-04-08 13:42:26.969226	2016-08-05 22:49:07.515033	214	Property	0	\N	\N	\N	DOC_NONE	0
3454	14	\N	t	f	2015-04-08 13:42:31.96171	2016-08-05 22:49:07.526394	214	Property	0	\N	\N	\N	DOC_NONE	0
3455	16	\N	t	f	2015-04-08 13:42:34.913028	2016-08-05 22:49:07.531043	214	Property	0	\N	\N	\N	DOC_NONE	0
3456	17	\N	t	f	2015-04-08 13:42:36.419604	2016-08-05 22:49:07.536113	214	Property	0	\N	\N	\N	DOC_NONE	0
3457	1	\N	t	f	2015-04-08 13:42:38.513902	2016-08-05 22:49:07.541083	215	Property	0	\N	\N	\N	DOC_NONE	0
3459	5	\N	t	f	2015-04-08 13:42:43.548858	2016-08-05 22:49:07.552559	215	Property	0	\N	\N	\N	DOC_NONE	0
3460	6	\N	t	f	2015-04-08 13:42:45.073956	2016-08-05 22:49:07.557828	215	Property	0	\N	\N	\N	DOC_NONE	0
3461	7	\N	t	f	2015-04-08 13:42:46.993111	2016-08-05 22:49:07.563669	215	Property	0	\N	\N	\N	DOC_NONE	0
3462	8	\N	t	f	2015-04-08 13:42:48.508228	2016-08-05 22:49:07.568504	215	Property	0	\N	\N	\N	DOC_NONE	0
3463	9	\N	t	f	2015-04-08 13:42:50.028247	2016-08-05 22:49:07.573361	215	Property	0	\N	\N	\N	DOC_NONE	0
3465	11	\N	t	f	2015-04-08 13:42:53.031419	2016-08-05 22:49:07.584616	215	Property	0	\N	\N	\N	DOC_NONE	0
3466	12	\N	t	f	2015-04-08 13:42:54.54435	2016-08-05 22:49:07.589006	215	Property	0	\N	\N	\N	DOC_NONE	0
3467	13	\N	t	f	2015-04-08 13:42:56.061529	2016-08-05 22:49:07.593784	215	Property	0	\N	\N	\N	DOC_NONE	0
3468	14	\N	t	f	2015-04-08 13:42:57.58363	2016-08-05 22:49:07.599073	215	Property	0	\N	\N	\N	DOC_NONE	0
3470	16	\N	t	f	2015-04-08 13:43:00.987469	2016-08-05 22:49:07.612596	215	Property	0	\N	\N	\N	DOC_NONE	0
3471	17	\N	t	f	2015-04-08 13:43:02.493643	2016-08-05 22:49:07.618346	215	Property	0	\N	\N	\N	DOC_NONE	0
3473	4	\N	t	f	2015-04-08 13:43:08.049107	2016-08-05 22:49:07.628676	216	Property	0	\N	\N	\N	DOC_NONE	0
3474	5	\N	t	f	2015-04-08 13:43:09.548677	2016-08-05 22:49:07.633654	216	Property	0	\N	\N	\N	DOC_NONE	0
3475	6	\N	t	f	2015-04-08 13:43:11.421816	2016-08-05 22:49:07.638481	216	Property	0	\N	\N	\N	DOC_NONE	0
3477	8	\N	t	f	2015-04-08 13:43:14.806721	2016-08-05 22:49:07.648847	216	Property	0	\N	\N	\N	DOC_NONE	0
3478	9	\N	t	f	2015-04-08 13:43:16.307789	2016-08-05 22:49:07.653299	216	Property	0	\N	\N	\N	DOC_NONE	0
3479	10	\N	t	f	2015-04-08 13:43:17.810283	2016-08-05 22:49:07.657651	216	Property	0	\N	\N	\N	DOC_NONE	0
3480	11	\N	t	f	2015-04-08 13:43:19.70019	2016-08-05 22:49:07.662822	216	Property	0	\N	\N	\N	DOC_NONE	0
3481	12	\N	t	f	2015-04-08 13:43:21.205683	2016-08-05 22:49:07.66767	216	Property	0	\N	\N	\N	DOC_NONE	0
3429	2	\N	t	t	2015-04-08 13:41:46.629239	2016-08-05 22:49:07.676848	212	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3483	14	\N	t	f	2015-04-08 13:43:24.24091	2016-08-05 22:49:07.681743	216	Property	0	\N	\N	\N	DOC_NONE	0
3484	15	\N	t	f	2015-04-08 13:43:25.756988	2016-08-05 22:49:07.685814	216	Property	0	\N	\N	\N	DOC_NONE	0
3485	16	\N	t	f	2015-04-08 13:43:27.279441	2016-08-05 22:49:07.690197	216	Property	0	\N	\N	\N	DOC_NONE	0
3487	1	\N	t	f	2015-04-08 13:43:31.211078	2016-08-05 22:49:07.698735	217	Property	0	\N	\N	\N	DOC_NONE	0
3488	4	\N	t	f	2015-04-08 13:43:35.507875	2016-08-05 22:49:07.704402	217	Property	0	\N	\N	\N	DOC_NONE	0
3489	5	\N	t	f	2015-04-08 13:43:37.006712	2016-08-05 22:49:07.708989	217	Property	0	\N	\N	\N	DOC_NONE	0
3490	6	\N	t	f	2015-04-08 13:43:38.512925	2016-08-05 22:49:07.713697	217	Property	0	\N	\N	\N	DOC_NONE	0
3492	8	\N	t	f	2015-04-08 13:43:41.940723	2016-08-05 22:49:07.72442	217	Property	0	\N	\N	\N	DOC_NONE	0
3493	9	\N	t	f	2015-04-08 13:43:43.843364	2016-08-05 22:49:07.729798	217	Property	0	\N	\N	\N	DOC_NONE	0
3494	10	\N	t	f	2015-04-08 13:43:45.367768	2016-08-05 22:49:07.734561	217	Property	0	\N	\N	\N	DOC_NONE	0
3495	11	\N	t	f	2015-04-08 13:43:47.268704	2016-08-05 22:49:07.740043	217	Property	0	\N	\N	\N	DOC_NONE	0
3496	12	\N	t	f	2015-04-08 13:43:48.772788	2016-08-05 22:49:07.748725	217	Property	0	\N	\N	\N	DOC_NONE	0
3498	14	\N	t	f	2015-04-08 13:43:52.225067	2016-08-05 22:49:07.759188	217	Property	0	\N	\N	\N	DOC_NONE	0
3499	15	\N	t	f	2015-04-08 13:43:53.745081	2016-08-05 22:49:07.763848	217	Property	0	\N	\N	\N	DOC_NONE	0
3500	16	\N	t	f	2015-04-08 13:43:55.275873	2016-08-05 22:49:07.769134	217	Property	0	\N	\N	\N	DOC_NONE	0
3501	17	\N	t	f	2015-04-08 13:43:56.783602	2016-08-05 22:49:07.773593	217	Property	0	\N	\N	\N	DOC_NONE	0
3503	4	\N	t	f	2015-04-08 13:44:03.583219	2016-08-05 22:49:07.784699	218	Property	0	\N	\N	\N	DOC_NONE	0
3504	5	\N	t	f	2015-04-08 13:44:05.107602	2016-08-05 22:49:07.791052	218	Property	0	\N	\N	\N	DOC_NONE	0
3505	6	\N	t	f	2015-04-08 13:44:06.635335	2016-08-05 22:49:07.796712	218	Property	0	\N	\N	\N	DOC_NONE	0
3506	7	\N	t	f	2015-04-08 13:44:08.149725	2016-08-05 22:49:07.801767	218	Property	0	\N	\N	\N	DOC_NONE	0
3507	8	\N	t	f	2015-04-08 13:44:10.029317	2016-08-05 22:49:07.806839	218	Property	0	\N	\N	\N	DOC_NONE	0
3509	10	\N	t	f	2015-04-08 13:44:13.43592	2016-08-05 22:49:07.817104	218	Property	0	\N	\N	\N	DOC_NONE	0
3510	11	\N	t	f	2015-04-08 13:44:15.315185	2016-08-05 22:49:07.821987	218	Property	0	\N	\N	\N	DOC_NONE	0
3511	12	\N	t	f	2015-04-08 13:44:16.829186	2016-08-05 22:49:07.826466	218	Property	0	\N	\N	\N	DOC_NONE	0
3512	13	\N	t	f	2015-04-08 13:44:18.322191	2016-08-05 22:49:07.831899	218	Property	0	\N	\N	\N	DOC_NONE	0
3514	15	\N	t	f	2015-04-08 13:44:21.724893	2016-08-05 22:49:07.841778	218	Property	0	\N	\N	\N	DOC_NONE	0
3515	16	\N	t	f	2015-04-08 13:44:23.229652	2016-08-05 22:49:07.846947	218	Property	0	\N	\N	\N	DOC_NONE	0
3516	17	\N	t	f	2015-04-08 13:44:24.741509	2016-08-05 22:49:07.852436	218	Property	0	\N	\N	\N	DOC_NONE	0
3517	1	\N	t	f	2015-04-08 13:44:26.791566	2016-08-05 22:49:07.857077	219	Property	0	\N	\N	\N	DOC_NONE	0
3520	6	\N	t	f	2015-04-08 13:44:34.174294	2016-08-05 22:49:07.867025	219	Property	0	\N	\N	\N	DOC_NONE	0
3521	7	\N	t	f	2015-04-08 13:44:36.100741	2016-08-05 22:49:07.871544	219	Property	0	\N	\N	\N	DOC_NONE	0
3522	8	\N	t	f	2015-04-08 13:44:37.596297	2016-08-05 22:49:07.876079	219	Property	0	\N	\N	\N	DOC_NONE	0
3523	9	\N	t	f	2015-04-08 13:44:39.491391	2016-08-05 22:49:07.880335	219	Property	0	\N	\N	\N	DOC_NONE	0
3524	10	\N	t	f	2015-04-08 13:44:41.012942	2016-08-05 22:49:07.885172	219	Property	0	\N	\N	\N	DOC_NONE	0
3526	12	\N	t	f	2015-04-08 13:44:44.44686	2016-08-05 22:49:07.894746	219	Property	0	\N	\N	\N	DOC_NONE	0
3527	13	\N	t	f	2015-04-08 13:44:45.950543	2016-08-05 22:49:07.900415	219	Property	0	\N	\N	\N	DOC_NONE	0
3528	14	\N	t	f	2015-04-08 13:44:47.456783	2016-08-05 22:49:07.904703	219	Property	0	\N	\N	\N	DOC_NONE	0
3529	15	\N	t	f	2015-04-08 13:44:48.972656	2016-08-05 22:49:07.909242	219	Property	0	\N	\N	\N	DOC_NONE	0
3531	17	\N	t	f	2015-04-08 13:44:52.366384	2016-08-05 22:49:07.919448	219	Property	0	\N	\N	\N	DOC_NONE	0
3532	1	\N	t	f	2015-04-08 13:44:54.413819	2016-08-05 22:49:07.924258	220	Property	0	\N	\N	\N	DOC_NONE	0
3533	4	\N	t	f	2015-04-08 13:44:57.961025	2016-08-05 22:49:07.928492	220	Property	0	\N	\N	\N	DOC_NONE	0
3534	5	\N	t	f	2015-04-08 13:44:59.471937	2016-08-05 22:49:07.934539	220	Property	0	\N	\N	\N	DOC_NONE	0
3535	6	\N	t	f	2015-04-08 13:45:01.357008	2016-08-05 22:49:07.939583	220	Property	0	\N	\N	\N	DOC_NONE	0
3537	8	\N	t	f	2015-04-08 13:45:04.732846	2016-08-05 22:49:07.952392	220	Property	0	\N	\N	\N	DOC_NONE	0
3538	9	\N	t	f	2015-04-08 13:45:06.227932	2016-08-05 22:49:07.957433	220	Property	0	\N	\N	\N	DOC_NONE	0
3539	10	\N	t	f	2015-04-08 13:45:07.730784	2016-08-05 22:49:07.962173	220	Property	0	\N	\N	\N	DOC_NONE	0
3540	11	\N	t	f	2015-04-08 13:45:09.986711	2016-08-05 22:49:07.967292	220	Property	0	\N	\N	\N	DOC_NONE	0
3542	13	\N	t	f	2015-04-08 13:45:13.739328	2016-08-05 22:49:07.977122	220	Property	0	\N	\N	\N	DOC_NONE	0
3543	14	\N	t	f	2015-04-08 13:45:15.606723	2016-08-05 22:49:07.981838	220	Property	0	\N	\N	\N	DOC_NONE	0
3544	15	\N	t	f	2015-04-08 13:45:17.120344	2016-08-05 22:49:07.987236	220	Property	0	\N	\N	\N	DOC_NONE	0
3545	16	\N	t	f	2015-04-08 13:45:18.637892	2016-08-05 22:49:07.992538	220	Property	0	\N	\N	\N	DOC_NONE	0
3547	1	\N	t	f	2015-04-08 13:45:21.809113	2016-08-05 22:49:08.003301	221	Property	0	\N	\N	\N	DOC_NONE	0
3548	4	\N	t	f	2015-04-08 13:45:25.318569	2016-08-05 22:49:08.011718	221	Property	0	\N	\N	\N	DOC_NONE	0
3549	5	\N	t	f	2015-04-08 13:45:26.832283	2016-08-05 22:49:08.024301	221	Property	0	\N	\N	\N	DOC_NONE	0
3550	6	\N	t	f	2015-04-08 13:45:28.70809	2016-08-05 22:49:08.036765	221	Property	0	\N	\N	\N	DOC_NONE	0
3551	7	\N	t	f	2015-04-08 13:45:30.235526	2016-08-05 22:49:08.04242	221	Property	0	\N	\N	\N	DOC_NONE	0
3553	9	\N	t	f	2015-04-08 13:45:33.277348	2016-08-05 22:49:08.054358	221	Property	0	\N	\N	\N	DOC_NONE	0
3554	10	\N	t	f	2015-04-08 13:45:34.902128	2016-08-05 22:49:08.060102	221	Property	0	\N	\N	\N	DOC_NONE	0
3555	11	\N	t	f	2015-04-08 13:45:36.409881	2016-08-05 22:49:08.065273	221	Property	0	\N	\N	\N	DOC_NONE	0
3556	12	\N	t	f	2015-04-08 13:45:37.919666	2016-08-05 22:49:08.070962	221	Property	0	\N	\N	\N	DOC_NONE	0
3558	14	\N	t	f	2015-04-08 13:45:40.981407	2016-08-05 22:49:08.081587	221	Property	0	\N	\N	\N	DOC_NONE	0
3559	15	\N	t	f	2015-04-08 13:45:42.481991	2016-08-05 22:49:08.086543	221	Property	0	\N	\N	\N	DOC_NONE	0
3561	17	\N	t	f	2015-04-08 13:45:45.851648	2016-08-05 22:49:08.095456	221	Property	0	\N	\N	\N	DOC_NONE	0
3563	6	\N	t	f	2015-04-08 13:45:53.824159	2016-08-05 22:49:08.100771	222	Property	0	\N	\N	\N	DOC_NONE	0
3564	9	\N	t	f	2015-04-08 13:45:57.327475	2016-08-05 22:49:08.105375	222	Property	0	\N	\N	\N	DOC_NONE	0
3566	11	\N	t	f	2015-04-08 13:46:00.328652	2016-08-05 22:49:08.114935	222	Property	0	\N	\N	\N	DOC_NONE	0
3568	1	\N	t	t	2015-04-08 13:46:08.939713	2016-08-05 22:49:08.119201	223	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3570	3	\N	t	t	2015-04-08 13:46:11.944164	2016-08-05 22:49:08.123819	223	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3562	1	\N	t	t	2015-04-08 13:45:47.526178	2016-08-05 22:49:08.129688	222	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3567	17	\N	t	t	2015-04-08 13:46:07.23825	2016-08-05 22:49:08.134645	222	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3573	6	\N	t	f	2015-04-08 13:46:16.460064	2016-08-05 22:49:08.144475	223	Property	0	\N	\N	\N	DOC_NONE	0
3575	8	\N	t	f	2015-04-08 13:46:19.478111	2016-08-05 22:49:08.154779	223	Property	0	\N	\N	\N	DOC_NONE	0
3576	9	\N	t	f	2015-04-08 13:46:20.987203	2016-08-05 22:49:08.158938	223	Property	0	\N	\N	\N	DOC_NONE	0
3578	11	\N	t	f	2015-04-08 13:46:24.003095	2016-08-05 22:49:08.167732	223	Property	0	\N	\N	\N	DOC_NONE	0
3579	12	\N	t	f	2015-04-08 13:46:25.497065	2016-08-05 22:49:08.172469	223	Property	0	\N	\N	\N	DOC_NONE	0
3580	13	\N	t	f	2015-04-08 13:46:26.997457	2016-08-05 22:49:08.177196	223	Property	0	\N	\N	\N	DOC_NONE	0
3581	14	\N	t	f	2015-04-08 13:46:28.509452	2016-08-05 22:49:08.182018	223	Property	0	\N	\N	\N	DOC_NONE	0
3583	16	\N	t	f	2015-04-08 13:46:31.881976	2016-08-05 22:49:08.191662	223	Property	0	\N	\N	\N	DOC_NONE	0
3585	1	\N	t	f	2015-04-08 13:46:35.064322	2016-08-05 22:49:08.196045	224	Property	0	\N	\N	\N	DOC_NONE	0
3586	2	\N	t	f	2015-04-08 13:46:36.953066	2016-08-05 22:49:08.200994	224	Property	0	\N	\N	\N	DOC_NONE	0
3587	3	\N	t	f	2015-04-08 13:46:38.443669	2016-08-05 22:49:08.205642	224	Property	0	\N	\N	\N	DOC_NONE	0
3588	4	\N	t	f	2015-04-08 13:46:39.952541	2016-08-05 22:49:08.210915	224	Property	0	\N	\N	\N	DOC_NONE	0
3590	6	\N	t	f	2015-04-08 13:46:43.711743	2016-08-05 22:49:08.220966	224	Property	0	\N	\N	\N	DOC_NONE	0
3591	7	\N	t	f	2015-04-08 13:46:45.221137	2016-08-05 22:49:08.225319	224	Property	0	\N	\N	\N	DOC_NONE	0
3592	8	\N	t	f	2015-04-08 13:46:46.722405	2016-08-05 22:49:08.229888	224	Property	0	\N	\N	\N	DOC_NONE	0
3593	9	\N	t	f	2015-04-08 13:46:48.219709	2016-08-05 22:49:08.234667	224	Property	0	\N	\N	\N	DOC_NONE	0
3595	11	\N	t	f	2015-04-08 13:46:51.605084	2016-08-05 22:49:08.243868	224	Property	0	\N	\N	\N	DOC_NONE	0
3596	12	\N	t	f	2015-04-08 13:46:53.122957	2016-08-05 22:49:08.24915	224	Property	0	\N	\N	\N	DOC_NONE	0
3597	13	\N	t	f	2015-04-08 13:46:54.628218	2016-08-05 22:49:08.253227	224	Property	0	\N	\N	\N	DOC_NONE	0
3598	14	\N	t	f	2015-04-08 13:46:56.125984	2016-08-05 22:49:08.257853	224	Property	0	\N	\N	\N	DOC_NONE	0
3599	15	\N	t	f	2015-04-08 13:46:58.402343	2016-08-05 22:49:08.264439	224	Property	0	\N	\N	\N	DOC_NONE	0
3601	17	\N	t	f	2015-04-08 13:47:01.419268	2016-08-05 22:49:08.272498	224	Property	0	\N	\N	\N	DOC_NONE	0
3604	3	\N	t	f	2015-04-08 13:47:06.502234	2016-08-05 22:49:08.276539	225	Property	0	\N	\N	\N	DOC_NONE	0
3606	5	\N	t	f	2015-04-08 13:47:09.863055	2016-08-05 22:49:08.280614	225	Property	0	\N	\N	\N	DOC_NONE	0
3607	6	\N	t	f	2015-04-08 13:47:11.748228	2016-08-05 22:49:08.285001	225	Property	0	\N	\N	\N	DOC_NONE	0
3609	8	\N	t	f	2015-04-08 13:47:14.770921	2016-08-05 22:49:08.29698	225	Property	0	\N	\N	\N	DOC_NONE	0
3611	10	\N	t	f	2015-04-08 13:47:17.789997	2016-08-05 22:49:08.302352	225	Property	0	\N	\N	\N	DOC_NONE	0
3612	11	\N	t	f	2015-04-08 13:47:19.682087	2016-08-05 22:49:08.307781	225	Property	0	\N	\N	\N	DOC_NONE	0
3613	14	\N	t	f	2015-04-08 13:47:23.575915	2016-08-05 22:49:08.313126	225	Property	0	\N	\N	\N	DOC_NONE	0
3615	16	\N	t	f	2015-04-08 13:47:26.970082	2016-08-05 22:49:08.323686	225	Property	0	\N	\N	\N	DOC_NONE	0
3618	2	\N	t	f	2015-04-08 13:47:32.035555	2016-08-05 22:49:08.328997	227	Property	0	\N	\N	\N	DOC_NONE	0
3619	3	\N	t	f	2015-04-08 13:47:33.554485	2016-08-05 22:49:08.336785	227	Property	0	\N	\N	\N	DOC_NONE	0
3621	5	\N	t	f	2015-04-08 13:47:36.573271	2016-08-05 22:49:08.347332	227	Property	0	\N	\N	\N	DOC_NONE	0
3622	6	\N	t	f	2015-04-08 13:47:38.081409	2016-08-05 22:49:08.351534	227	Property	0	\N	\N	\N	DOC_NONE	0
3623	7	\N	t	f	2015-04-08 13:47:39.59729	2016-08-05 22:49:08.356234	227	Property	0	\N	\N	\N	DOC_NONE	0
3624	8	\N	t	f	2015-04-08 13:47:41.483792	2016-08-05 22:49:08.399153	227	Property	0	\N	\N	\N	DOC_NONE	0
3625	9	\N	t	f	2015-04-08 13:47:42.985222	2016-08-05 22:49:08.404276	227	Property	0	\N	\N	\N	DOC_NONE	0
3626	10	\N	t	f	2015-04-08 13:47:44.49185	2016-08-05 22:49:08.409222	227	Property	0	\N	\N	\N	DOC_NONE	0
3628	12	\N	t	f	2015-04-08 13:47:47.879492	2016-08-05 22:49:08.420825	227	Property	0	\N	\N	\N	DOC_NONE	0
3630	14	\N	t	f	2015-04-08 13:47:51.26759	2016-08-05 22:49:08.431626	227	Property	0	\N	\N	\N	DOC_NONE	0
3631	15	\N	t	f	2015-04-08 13:47:53.532936	2016-08-05 22:49:08.441793	227	Property	0	\N	\N	\N	DOC_NONE	0
3632	16	\N	t	f	2015-04-08 13:47:55.441984	2016-08-05 22:49:08.446967	227	Property	0	\N	\N	\N	DOC_NONE	0
3636	3	\N	t	f	2015-04-08 13:48:05.146082	2016-08-05 22:49:08.452164	228	Property	0	\N	\N	\N	DOC_NONE	0
3637	4	\N	t	f	2015-04-08 13:48:06.678298	2016-08-05 22:49:08.457007	228	Property	0	\N	\N	\N	DOC_NONE	0
3638	5	\N	t	f	2015-04-08 13:48:08.185161	2016-08-05 22:49:08.461226	228	Property	0	\N	\N	\N	DOC_NONE	0
3639	6	\N	t	f	2015-04-08 13:48:09.682913	2016-08-05 22:49:08.465887	228	Property	0	\N	\N	\N	DOC_NONE	0
3640	7	\N	t	f	2015-04-08 13:48:11.173572	2016-08-05 22:49:08.470751	228	Property	0	\N	\N	\N	DOC_NONE	0
3642	9	\N	t	f	2015-04-08 13:48:14.182631	2016-08-05 22:49:08.480835	228	Property	0	\N	\N	\N	DOC_NONE	0
3643	10	\N	t	f	2015-04-08 13:48:15.711493	2016-08-05 22:49:08.485113	228	Property	0	\N	\N	\N	DOC_NONE	0
3644	11	\N	t	f	2015-04-08 13:48:17.220011	2016-08-05 22:49:08.490415	228	Property	0	\N	\N	\N	DOC_NONE	0
3645	12	\N	t	f	2015-04-08 13:48:18.726089	2016-08-05 22:49:08.49508	228	Property	0	\N	\N	\N	DOC_NONE	0
3647	14	\N	t	f	2015-04-08 13:48:21.740701	2016-08-05 22:49:08.503165	228	Property	0	\N	\N	\N	DOC_NONE	0
3648	15	\N	t	f	2015-04-08 13:48:23.241909	2016-08-05 22:49:08.50731	228	Property	0	\N	\N	\N	DOC_NONE	0
3649	16	\N	t	f	2015-04-08 13:48:24.761158	2016-08-05 22:49:08.51257	228	Property	0	\N	\N	\N	DOC_NONE	0
3652	2	\N	t	f	2015-04-08 13:48:29.473851	2016-08-05 22:49:08.516986	229	Property	0	\N	\N	\N	DOC_NONE	0
3653	3	\N	t	f	2015-04-08 13:48:30.968799	2016-08-05 22:49:08.521109	229	Property	0	\N	\N	\N	DOC_NONE	0
3655	5	\N	t	f	2015-04-08 13:48:34.370796	2016-08-05 22:49:08.529659	229	Property	0	\N	\N	\N	DOC_NONE	0
3656	6	\N	t	f	2015-04-08 13:48:36.625851	2016-08-05 22:49:08.534558	229	Property	0	\N	\N	\N	DOC_NONE	0
3657	7	\N	t	f	2015-04-08 13:48:38.131335	2016-08-05 22:49:08.538563	229	Property	0	\N	\N	\N	DOC_NONE	0
3658	8	\N	t	f	2015-04-08 13:48:39.639266	2016-08-05 22:49:08.542543	229	Property	0	\N	\N	\N	DOC_NONE	0
3633	17	\N	t	t	2015-04-08 13:47:56.976833	2016-08-05 22:49:08.550571	227	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3634	1	\N	t	t	2015-04-08 13:47:59.029149	2016-08-05 22:49:08.554974	228	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3574	7	\N	t	f	2015-04-08 13:46:17.982038	2016-08-08 02:06:02.925037	223	Property	0	\N	\N	\N	DOC_UNNECESSARY	0
3635	2	\N	t	t	2015-04-08 13:48:03.234273	2016-08-05 22:49:08.563585	228	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3651	1	\N	t	t	2015-04-08 13:48:27.931956	2016-08-05 22:49:08.567538	229	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3603	2	\N	t	t	2015-04-08 13:47:04.984114	2016-08-05 22:49:08.571375	225	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3616	17	\N	t	t	2015-04-08 13:47:28.482302	2016-08-05 22:49:08.579323	225	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3605	4	\N	t	f	2015-04-08 13:47:08.36301	2016-08-05 22:49:08.587225	225	Property	0	\N	\N	\N	DOC_NONE	0
3584	17	\N	t	t	2015-04-08 13:46:33.390167	2016-08-05 22:49:08.591407	223	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3661	11	\N	t	f	2015-04-08 13:48:44.924224	2016-08-05 22:49:08.596152	229	Property	0	\N	\N	\N	DOC_NONE	0
3662	12	\N	t	f	2015-04-08 13:48:46.447208	2016-08-05 22:49:08.600341	229	Property	0	\N	\N	\N	DOC_NONE	0
3664	14	\N	t	f	2015-04-08 13:48:49.457719	2016-08-05 22:49:08.60841	229	Property	0	\N	\N	\N	DOC_NONE	0
3665	15	\N	t	f	2015-04-08 13:48:50.968587	2016-08-05 22:49:08.612079	229	Property	0	\N	\N	\N	DOC_NONE	0
3666	16	\N	t	f	2015-04-08 13:48:53.256766	2016-08-05 22:49:08.615804	229	Property	0	\N	\N	\N	DOC_NONE	0
3668	1	\N	t	f	2015-04-08 13:48:56.414012	2016-08-05 22:49:08.619482	230	Property	0	\N	\N	\N	DOC_NONE	0
3671	4	\N	t	f	2015-04-08 13:49:00.947402	2016-08-05 22:49:08.62693	230	Property	0	\N	\N	\N	DOC_NONE	0
3672	5	\N	t	f	2015-04-08 13:49:02.823035	2016-08-05 22:49:08.630832	230	Property	0	\N	\N	\N	DOC_NONE	0
3673	6	\N	t	f	2015-04-08 13:49:04.332392	2016-08-05 22:49:08.634834	230	Property	0	\N	\N	\N	DOC_NONE	0
3674	7	\N	t	f	2015-04-08 13:49:05.867281	2016-08-05 22:49:08.638578	230	Property	0	\N	\N	\N	DOC_NONE	0
3676	9	\N	t	f	2015-04-08 13:49:08.889434	2016-08-05 22:49:08.646307	230	Property	0	\N	\N	\N	DOC_NONE	0
3677	10	\N	t	f	2015-04-08 13:49:10.407617	2016-08-05 22:49:08.650194	230	Property	0	\N	\N	\N	DOC_NONE	0
3678	11	\N	t	f	2015-04-08 13:49:11.912669	2016-08-05 22:49:08.653935	230	Property	0	\N	\N	\N	DOC_NONE	0
3679	14	\N	t	f	2015-04-08 13:49:15.880453	2016-08-05 22:49:08.657632	230	Property	0	\N	\N	\N	DOC_NONE	0
3680	15	\N	t	f	2015-04-08 13:49:17.380115	2016-08-05 22:49:08.661586	230	Property	0	\N	\N	\N	DOC_NONE	0
3682	17	\N	t	f	2015-04-08 13:49:20.776002	2016-08-05 22:49:08.670775	230	Property	0	\N	\N	\N	DOC_NONE	0
3683	1	\N	t	f	2015-04-08 13:49:23.193567	2016-08-05 22:49:08.674559	231	Property	0	\N	\N	\N	DOC_NONE	0
3684	2	\N	t	f	2015-04-08 13:49:25.066411	2016-08-05 22:49:08.678314	231	Property	0	\N	\N	\N	DOC_NONE	0
3685	3	\N	t	f	2015-04-08 13:49:26.581476	2016-08-05 22:49:08.681915	231	Property	0	\N	\N	\N	DOC_NONE	0
3687	5	\N	t	f	2015-04-08 13:49:29.951349	2016-08-05 22:49:08.690106	231	Property	0	\N	\N	\N	DOC_NONE	0
3688	6	\N	t	f	2015-04-08 13:49:31.445095	2016-08-05 22:49:08.695056	231	Property	0	\N	\N	\N	DOC_NONE	0
3689	7	\N	t	f	2015-04-08 13:49:33.320606	2016-08-05 22:49:08.700637	231	Property	0	\N	\N	\N	DOC_NONE	0
3690	8	\N	t	f	2015-04-08 13:49:35.279428	2016-08-05 22:49:08.705845	231	Property	0	\N	\N	\N	DOC_NONE	0
3691	9	\N	t	f	2015-04-08 13:49:36.785246	2016-08-05 22:49:08.710571	231	Property	0	\N	\N	\N	DOC_NONE	0
3693	11	\N	t	f	2015-04-08 13:49:40.174699	2016-08-05 22:49:08.718359	231	Property	0	\N	\N	\N	DOC_NONE	0
3694	12	\N	t	f	2015-04-08 13:49:42.064053	2016-08-05 22:49:08.722414	231	Property	0	\N	\N	\N	DOC_NONE	0
3695	13	\N	t	f	2015-04-08 13:49:43.566589	2016-08-05 22:49:08.726558	231	Property	0	\N	\N	\N	DOC_NONE	0
3696	14	\N	t	f	2015-04-08 13:49:45.066996	2016-08-05 22:49:08.730854	231	Property	0	\N	\N	\N	DOC_NONE	0
3698	16	\N	t	f	2015-04-08 13:49:48.072534	2016-08-05 22:49:08.738876	231	Property	0	\N	\N	\N	DOC_NONE	0
3699	17	\N	t	f	2015-04-08 13:49:49.579127	2016-08-05 22:49:08.742943	231	Property	0	\N	\N	\N	DOC_NONE	0
3702	3	\N	t	f	2015-04-08 13:49:54.646625	2016-08-05 22:49:08.747084	232	Property	0	\N	\N	\N	DOC_NONE	0
3703	4	\N	t	f	2015-04-08 13:49:56.53047	2016-08-05 22:49:08.751054	232	Property	0	\N	\N	\N	DOC_NONE	0
3705	6	\N	t	f	2015-04-08 13:49:59.912238	2016-08-05 22:49:08.758534	232	Property	0	\N	\N	\N	DOC_NONE	0
3706	7	\N	t	f	2015-04-08 13:50:01.40678	2016-08-05 22:49:08.762284	232	Property	0	\N	\N	\N	DOC_NONE	0
3707	8	\N	t	f	2015-04-08 13:50:02.90844	2016-08-05 22:49:08.766021	232	Property	0	\N	\N	\N	DOC_NONE	0
3708	9	\N	t	f	2015-04-08 13:50:04.40523	2016-08-05 22:49:08.770297	232	Property	0	\N	\N	\N	DOC_NONE	0
3709	10	\N	t	f	2015-04-08 13:50:05.906356	2016-08-05 22:49:08.774937	232	Property	0	\N	\N	\N	DOC_NONE	0
3711	12	\N	t	f	2015-04-08 13:50:08.902813	2016-08-05 22:49:08.786357	232	Property	0	\N	\N	\N	DOC_NONE	0
3712	13	\N	t	f	2015-04-08 13:50:10.409175	2016-08-05 22:49:08.79011	232	Property	0	\N	\N	\N	DOC_NONE	0
3713	14	\N	t	f	2015-04-08 13:50:11.934362	2016-08-05 22:49:08.794551	232	Property	0	\N	\N	\N	DOC_NONE	0
3714	15	\N	t	f	2015-04-08 13:50:13.460686	2016-08-05 22:49:08.799238	232	Property	0	\N	\N	\N	DOC_NONE	0
3716	17	\N	t	f	2015-04-08 13:50:16.480754	2016-08-05 22:49:08.809826	232	Property	0	\N	\N	\N	DOC_NONE	0
3717	1	\N	t	f	2015-04-08 13:50:18.549001	2016-08-05 22:49:08.813805	233	Property	0	\N	\N	\N	DOC_NONE	0
3720	4	\N	t	f	2015-04-08 13:50:23.105962	2016-08-05 22:49:08.818562	233	Property	0	\N	\N	\N	DOC_NONE	0
3721	5	\N	t	f	2015-04-08 13:50:24.63286	2016-08-05 22:49:08.822442	233	Property	0	\N	\N	\N	DOC_NONE	0
3722	6	\N	t	f	2015-04-08 13:50:26.136997	2016-08-05 22:49:08.826367	233	Property	0	\N	\N	\N	DOC_NONE	0
3724	8	\N	t	f	2015-04-08 13:50:29.548935	2016-08-05 22:49:08.834654	233	Property	0	\N	\N	\N	DOC_NONE	0
3725	9	\N	t	f	2015-04-08 13:50:31.06431	2016-08-05 22:49:08.839234	233	Property	0	\N	\N	\N	DOC_NONE	0
3726	10	\N	t	f	2015-04-08 13:50:32.576612	2016-08-05 22:49:08.843538	233	Property	0	\N	\N	\N	DOC_NONE	0
3727	11	\N	t	f	2015-04-08 13:50:34.452695	2016-08-05 22:49:08.847682	233	Property	0	\N	\N	\N	DOC_NONE	0
3729	13	\N	t	f	2015-04-08 13:50:37.476494	2016-08-05 22:49:08.855859	233	Property	0	\N	\N	\N	DOC_NONE	0
3730	14	\N	t	f	2015-04-08 13:50:38.963311	2016-08-05 22:49:08.860386	233	Property	0	\N	\N	\N	DOC_NONE	0
3731	15	\N	t	f	2015-04-08 13:50:40.471705	2016-08-05 22:49:08.865129	233	Property	0	\N	\N	\N	DOC_NONE	0
3732	16	\N	t	f	2015-04-08 13:50:41.990877	2016-08-05 22:49:08.869644	233	Property	0	\N	\N	\N	DOC_NONE	0
3736	3	\N	t	f	2015-04-08 13:50:48.519497	2016-08-05 22:49:08.878874	234	Property	0	\N	\N	\N	DOC_NONE	0
3737	4	\N	t	f	2015-04-08 13:50:50.804037	2016-08-05 22:49:08.883465	234	Property	0	\N	\N	\N	DOC_NONE	0
3738	5	\N	t	f	2015-04-08 13:50:52.327619	2016-08-05 22:49:08.891712	234	Property	0	\N	\N	\N	DOC_NONE	0
3739	6	\N	t	f	2015-04-08 13:50:53.828999	2016-08-05 22:49:08.896781	234	Property	0	\N	\N	\N	DOC_NONE	0
3740	7	\N	t	f	2015-04-08 13:50:55.334901	2016-08-05 22:49:08.900576	234	Property	0	\N	\N	\N	DOC_NONE	0
3742	9	\N	t	f	2015-04-08 13:50:58.73369	2016-08-05 22:49:08.909339	234	Property	0	\N	\N	\N	DOC_NONE	0
3743	10	\N	t	f	2015-04-08 13:51:00.615798	2016-08-05 22:49:08.913434	234	Property	0	\N	\N	\N	DOC_NONE	0
3744	11	\N	t	f	2015-04-08 13:51:02.122205	2016-08-05 22:49:08.91765	234	Property	0	\N	\N	\N	DOC_NONE	0
3745	12	\N	t	f	2015-04-08 13:51:03.640344	2016-08-05 22:49:08.921611	234	Property	0	\N	\N	\N	DOC_NONE	0
3747	14	\N	t	f	2015-04-08 13:51:07.020744	2016-08-05 22:49:08.929002	234	Property	0	\N	\N	\N	DOC_NONE	0
3748	15	\N	t	f	2015-04-08 13:51:09.38965	2016-08-05 22:49:08.932621	234	Property	0	\N	\N	\N	DOC_NONE	0
3700	1	\N	t	t	2015-04-08 13:49:51.2432	2016-08-05 22:49:08.940492	232	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3669	2	\N	t	t	2015-04-08 13:48:57.935784	2016-08-05 22:49:08.94452	230	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3718	2	\N	t	t	2015-04-08 13:50:20.058054	2016-08-05 22:49:08.948377	233	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3733	17	\N	t	t	2015-04-08 13:50:43.493172	2016-08-05 22:49:08.956311	233	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3750	17	\N	t	f	2015-04-08 13:51:12.414134	2016-08-05 22:49:08.961096	234	Property	0	\N	\N	\N	DOC_NONE	0
3751	1	\N	t	f	2015-04-08 13:51:14.095681	2016-08-05 22:49:08.965675	235	Property	0	\N	\N	\N	DOC_NONE	0
3752	2	\N	t	f	2015-04-08 13:51:15.622893	2016-08-05 22:49:08.970146	235	Property	0	\N	\N	\N	DOC_NONE	0
3753	3	\N	t	f	2015-04-08 13:51:17.132802	2016-08-05 22:49:08.974713	235	Property	0	\N	\N	\N	DOC_NONE	0
3755	5	\N	t	f	2015-04-08 13:51:20.14307	2016-08-05 22:49:08.983533	235	Property	0	\N	\N	\N	DOC_NONE	0
3756	6	\N	t	f	2015-04-08 13:51:21.649199	2016-08-05 22:49:08.987633	235	Property	0	\N	\N	\N	DOC_NONE	0
3757	7	\N	t	f	2015-04-08 13:51:23.957404	2016-08-05 22:49:08.992431	235	Property	0	\N	\N	\N	DOC_NONE	0
3758	8	\N	t	f	2015-04-08 13:51:25.491956	2016-08-05 22:49:08.997241	235	Property	0	\N	\N	\N	DOC_NONE	0
3760	10	\N	t	f	2015-04-08 13:51:28.508843	2016-08-05 22:49:09.006166	235	Property	0	\N	\N	\N	DOC_NONE	0
3761	11	\N	t	f	2015-04-08 13:51:30.394662	2016-08-05 22:49:09.010512	235	Property	0	\N	\N	\N	DOC_NONE	0
3762	12	\N	t	f	2015-04-08 13:51:32.282273	2016-08-05 22:49:09.014719	235	Property	0	\N	\N	\N	DOC_NONE	0
3763	13	\N	t	f	2015-04-08 13:51:33.800969	2016-08-05 22:49:09.019045	235	Property	0	\N	\N	\N	DOC_NONE	0
3765	15	\N	t	f	2015-04-08 13:51:37.571347	2016-08-05 22:49:09.02866	235	Property	0	\N	\N	\N	DOC_NONE	0
3766	16	\N	t	f	2015-04-08 13:51:39.496923	2016-08-05 22:49:09.033926	235	Property	0	\N	\N	\N	DOC_NONE	0
3767	17	\N	t	f	2015-04-08 13:51:40.996396	2016-08-05 22:49:09.038168	235	Property	0	\N	\N	\N	DOC_NONE	0
3768	2	\N	t	f	2015-04-08 13:51:43.672906	2016-08-05 22:49:09.04229	236	Property	0	\N	\N	\N	DOC_NONE	0
3769	3	\N	t	f	2015-04-08 13:51:45.199665	2016-08-05 22:49:09.046896	236	Property	0	\N	\N	\N	DOC_NONE	0
3771	5	\N	t	f	2015-04-08 13:51:48.608935	2016-08-05 22:49:09.056112	236	Property	0	\N	\N	\N	DOC_NONE	0
3772	6	\N	t	f	2015-04-08 13:51:50.117097	2016-08-05 22:49:09.060892	236	Property	0	\N	\N	\N	DOC_NONE	0
3773	7	\N	t	f	2015-04-08 13:51:52.044334	2016-08-05 22:49:09.065321	236	Property	0	\N	\N	\N	DOC_NONE	0
3774	8	\N	t	f	2015-04-08 13:51:53.588421	2016-08-05 22:49:09.070268	236	Property	0	\N	\N	\N	DOC_NONE	0
3776	10	\N	t	f	2015-04-08 13:51:57.377964	2016-08-05 22:49:09.080313	236	Property	0	\N	\N	\N	DOC_NONE	0
3777	11	\N	t	f	2015-04-08 13:52:00.001834	2016-08-05 22:49:09.085155	236	Property	0	\N	\N	\N	DOC_NONE	0
3778	12	\N	t	f	2015-04-08 13:52:01.889339	2016-08-05 22:49:09.089673	236	Property	0	\N	\N	\N	DOC_NONE	0
3779	13	\N	t	f	2015-04-08 13:52:03.404915	2016-08-05 22:49:09.094211	236	Property	0	\N	\N	\N	DOC_NONE	0
3780	14	\N	t	f	2015-04-08 13:52:05.330651	2016-08-05 22:49:09.098568	236	Property	0	\N	\N	\N	DOC_NONE	0
3782	16	\N	t	f	2015-04-08 13:52:08.953264	2016-08-05 22:49:09.108114	236	Property	0	\N	\N	\N	DOC_NONE	0
3783	17	\N	t	f	2015-04-08 13:52:10.452151	2016-08-05 22:49:09.112775	236	Property	0	\N	\N	\N	DOC_NONE	0
3784	4	\N	t	f	2015-04-08 13:52:15.160291	2016-08-05 22:49:09.120026	237	Property	0	\N	\N	\N	DOC_NONE	0
3786	6	\N	t	f	2015-04-08 13:52:18.929015	2016-08-05 22:49:09.129215	237	Property	0	\N	\N	\N	DOC_NONE	0
3787	7	\N	t	f	2015-04-08 13:52:21.58184	2016-08-05 22:49:09.133247	237	Property	0	\N	\N	\N	DOC_NONE	0
3788	8	\N	t	f	2015-04-08 13:52:23.075924	2016-08-05 22:49:09.136934	237	Property	0	\N	\N	\N	DOC_NONE	0
3789	9	\N	t	f	2015-04-08 13:52:25.724442	2016-08-05 22:49:09.140622	237	Property	0	\N	\N	\N	DOC_NONE	0
3790	10	\N	t	f	2015-04-08 13:52:27.610861	2016-08-05 22:49:09.144824	237	Property	0	\N	\N	\N	DOC_NONE	0
3793	13	\N	t	f	2015-04-08 13:52:33.624968	2016-08-05 22:49:09.153059	237	Property	0	\N	\N	\N	DOC_NONE	0
3794	14	\N	t	f	2015-04-08 13:52:35.510787	2016-08-05 22:49:09.157157	237	Property	0	\N	\N	\N	DOC_NONE	0
3795	15	\N	t	f	2015-04-08 13:52:37.009931	2016-08-05 22:49:09.161923	237	Property	0	\N	\N	\N	DOC_NONE	0
3796	16	\N	t	f	2015-04-08 13:52:38.522435	2016-08-05 22:49:09.167045	237	Property	0	\N	\N	\N	DOC_NONE	0
3797	17	\N	t	f	2015-04-08 13:52:40.431535	2016-08-05 22:49:09.172852	237	Property	0	\N	\N	\N	DOC_NONE	0
3799	2	\N	t	f	2015-04-08 13:52:45.513615	2016-08-05 22:49:09.182691	240	Property	0	\N	\N	\N	DOC_NONE	0
3800	3	\N	t	f	2015-04-08 13:52:47.047776	2016-08-05 22:49:09.187632	240	Property	0	\N	\N	\N	DOC_NONE	0
3801	4	\N	t	f	2015-04-08 13:52:48.580426	2016-08-05 22:49:09.192229	240	Property	0	\N	\N	\N	DOC_NONE	0
3802	5	\N	t	f	2015-04-08 13:52:50.111059	2016-08-05 22:49:09.196606	240	Property	0	\N	\N	\N	DOC_NONE	0
3804	7	\N	t	f	2015-04-08 13:52:54.623916	2016-08-05 22:49:09.206698	240	Property	0	\N	\N	\N	DOC_NONE	0
3805	8	\N	t	f	2015-04-08 13:52:56.155311	2016-08-05 22:49:09.210701	240	Property	0	\N	\N	\N	DOC_NONE	0
3806	9	\N	t	f	2015-04-08 13:52:57.654029	2016-08-05 22:49:09.215488	240	Property	0	\N	\N	\N	DOC_NONE	0
3807	10	\N	t	f	2015-04-08 13:52:59.16984	2016-08-05 22:49:09.220866	240	Property	0	\N	\N	\N	DOC_NONE	0
3808	11	\N	t	f	2015-04-08 13:53:01.060797	2016-08-05 22:49:09.225679	240	Property	0	\N	\N	\N	DOC_NONE	0
3810	13	\N	t	f	2015-04-08 13:53:04.092229	2016-08-05 22:49:09.238207	240	Property	0	\N	\N	\N	DOC_NONE	0
3811	14	\N	t	f	2015-04-08 13:53:05.596808	2016-08-05 22:49:09.242993	240	Property	0	\N	\N	\N	DOC_NONE	0
3812	15	\N	t	f	2015-04-08 13:53:07.5064	2016-08-05 22:49:09.247581	240	Property	0	\N	\N	\N	DOC_NONE	0
3813	16	\N	t	f	2015-04-08 13:53:09.397748	2016-08-05 22:49:09.252005	240	Property	0	\N	\N	\N	DOC_NONE	0
3815	2	\N	t	f	2015-04-08 13:53:13.628603	2016-08-05 22:49:09.261726	241	Property	0	\N	\N	\N	DOC_NONE	0
3816	3	\N	t	f	2015-04-08 13:53:15.121138	2016-08-05 22:49:09.267453	241	Property	0	\N	\N	\N	DOC_NONE	0
3817	4	\N	t	f	2015-04-08 13:53:16.997347	2016-08-05 22:49:09.272607	241	Property	0	\N	\N	\N	DOC_NONE	0
3818	5	\N	t	f	2015-04-08 13:53:19.252682	2016-08-05 22:49:09.277738	241	Property	0	\N	\N	\N	DOC_NONE	0
3820	7	\N	t	f	2015-04-08 13:53:22.633584	2016-08-05 22:49:09.289966	241	Property	0	\N	\N	\N	DOC_NONE	0
3821	8	\N	t	f	2015-04-08 13:53:24.145076	2016-08-05 22:49:09.295089	241	Property	0	\N	\N	\N	DOC_NONE	0
3822	9	\N	t	f	2015-04-08 13:53:26.039022	2016-08-05 22:49:09.300012	241	Property	0	\N	\N	\N	DOC_NONE	0
3823	10	\N	t	f	2015-04-08 13:53:27.913059	2016-08-05 22:49:09.305333	241	Property	0	\N	\N	\N	DOC_NONE	0
3824	11	\N	t	f	2015-04-08 13:53:29.453824	2016-08-05 22:49:09.309811	241	Property	0	\N	\N	\N	DOC_NONE	0
3826	13	\N	t	f	2015-04-08 13:53:32.827212	2016-08-05 22:49:09.317879	241	Property	0	\N	\N	\N	DOC_NONE	0
3827	14	\N	t	f	2015-04-08 13:53:34.340554	2016-08-05 22:49:09.322277	241	Property	0	\N	\N	\N	DOC_NONE	0
3828	15	\N	t	f	2015-04-08 13:53:35.843794	2016-08-05 22:49:09.327059	241	Property	0	\N	\N	\N	DOC_NONE	0
3829	16	\N	t	f	2015-04-08 13:53:37.346211	2016-08-05 22:49:09.33141	241	Property	0	\N	\N	\N	DOC_NONE	0
3833	4	\N	t	f	2015-04-08 13:53:45.020136	2016-08-05 22:49:09.341414	243	Property	0	\N	\N	\N	DOC_NONE	0
3834	5	\N	t	f	2015-04-08 13:53:46.537948	2016-08-05 22:49:09.34722	243	Property	0	\N	\N	\N	DOC_NONE	0
3836	7	\N	t	f	2015-04-08 13:53:50.343817	2016-08-05 22:49:09.35836	243	Property	0	\N	\N	\N	DOC_NONE	0
3837	8	\N	t	f	2015-04-08 13:53:51.854473	2016-08-05 22:49:09.363357	243	Property	0	\N	\N	\N	DOC_NONE	0
3832	3	\N	t	t	2015-04-08 13:53:43.502951	2016-08-05 22:49:09.368125	243	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3840	11	\N	t	f	2015-04-08 13:53:57.170291	2016-08-05 22:49:09.376499	243	Property	0	\N	\N	\N	DOC_NONE	0
3841	12	\N	t	f	2015-04-08 13:53:58.669511	2016-08-05 22:49:09.381089	243	Property	0	\N	\N	\N	DOC_NONE	0
3842	13	\N	t	f	2015-04-08 13:54:00.17937	2016-08-05 22:49:09.384969	243	Property	0	\N	\N	\N	DOC_NONE	0
3843	14	\N	t	f	2015-04-08 13:54:02.059333	2016-08-05 22:49:09.388768	243	Property	0	\N	\N	\N	DOC_NONE	0
3844	15	\N	t	f	2015-04-08 13:54:03.943712	2016-08-05 22:49:09.393356	243	Property	0	\N	\N	\N	DOC_NONE	0
3846	17	\N	t	f	2015-04-08 13:54:07.704859	2016-08-05 22:49:09.404859	243	Property	0	\N	\N	\N	DOC_NONE	0
3850	5	\N	t	f	2015-04-08 13:54:15.376143	2016-08-05 22:49:09.409741	244	Property	0	\N	\N	\N	DOC_NONE	0
3851	6	\N	t	f	2015-04-08 13:54:16.89912	2016-08-05 22:49:09.415094	244	Property	0	\N	\N	\N	DOC_NONE	0
3852	7	\N	t	f	2015-04-08 13:54:18.446168	2016-08-05 22:49:09.419595	244	Property	0	\N	\N	\N	DOC_NONE	0
3854	9	\N	t	f	2015-04-08 13:54:21.451593	2016-08-05 22:49:09.428253	244	Property	0	\N	\N	\N	DOC_NONE	0
3855	10	\N	t	f	2015-04-08 13:54:22.971998	2016-08-05 22:49:09.432327	244	Property	0	\N	\N	\N	DOC_NONE	0
3856	11	\N	t	f	2015-04-08 13:54:24.492543	2016-08-05 22:49:09.437118	244	Property	0	\N	\N	\N	DOC_NONE	0
3857	12	\N	t	f	2015-04-08 13:54:26.389588	2016-08-05 22:49:09.441729	244	Property	0	\N	\N	\N	DOC_NONE	0
3859	14	\N	t	f	2015-04-08 13:54:29.762065	2016-08-05 22:49:09.449967	244	Property	0	\N	\N	\N	DOC_NONE	0
3860	15	\N	t	f	2015-04-08 13:54:31.273057	2016-08-05 22:49:09.45392	244	Property	0	\N	\N	\N	DOC_NONE	0
3861	16	\N	t	f	2015-04-08 13:54:33.151772	2016-08-05 22:49:09.457985	244	Property	0	\N	\N	\N	DOC_NONE	0
3862	17	\N	t	f	2015-04-08 13:54:34.650259	2016-08-05 22:49:09.461796	244	Property	0	\N	\N	\N	DOC_NONE	0
3863	1	\N	t	f	2015-04-08 13:54:36.325312	2016-08-05 22:49:09.466181	245	Property	0	\N	\N	\N	DOC_NONE	0
3865	3	\N	t	f	2015-04-08 13:54:39.356249	2016-08-05 22:49:09.475657	245	Property	0	\N	\N	\N	DOC_NONE	0
3866	4	\N	t	f	2015-04-08 13:54:40.872083	2016-08-05 22:49:09.479582	245	Property	0	\N	\N	\N	DOC_NONE	0
3867	5	\N	t	f	2015-04-08 13:54:42.372799	2016-08-05 22:49:09.484	245	Property	0	\N	\N	\N	DOC_NONE	0
3868	6	\N	t	f	2015-04-08 13:54:43.885313	2016-08-05 22:49:09.488562	245	Property	0	\N	\N	\N	DOC_NONE	0
3870	8	\N	t	f	2015-04-08 13:54:48.980072	2016-08-05 22:49:09.496923	245	Property	0	\N	\N	\N	DOC_NONE	0
3871	9	\N	t	f	2015-04-08 13:54:50.499671	2016-08-05 22:49:09.501696	245	Property	0	\N	\N	\N	DOC_NONE	0
3872	10	\N	t	f	2015-04-08 13:54:52.016118	2016-08-05 22:49:09.507204	245	Property	0	\N	\N	\N	DOC_NONE	0
3873	11	\N	t	f	2015-04-08 13:54:53.515493	2016-08-05 22:49:09.512023	245	Property	0	\N	\N	\N	DOC_NONE	0
3874	12	\N	t	f	2015-04-08 13:54:55.422347	2016-08-05 22:49:09.516191	245	Property	0	\N	\N	\N	DOC_NONE	0
3876	14	\N	t	f	2015-04-08 13:54:59.234474	2016-08-05 22:49:09.524918	245	Property	0	\N	\N	\N	DOC_NONE	0
3877	15	\N	t	f	2015-04-08 13:55:00.756442	2016-08-05 22:49:09.530003	245	Property	0	\N	\N	\N	DOC_NONE	0
3878	16	\N	t	f	2015-04-08 13:55:03.388434	2016-08-05 22:49:09.535414	245	Property	0	\N	\N	\N	DOC_NONE	0
3879	17	\N	t	f	2015-04-08 13:55:05.263161	2016-08-05 22:49:09.539731	245	Property	0	\N	\N	\N	DOC_NONE	0
3881	2	\N	t	f	2015-04-08 13:55:09.675812	2016-08-05 22:49:09.548464	246	Property	0	\N	\N	\N	DOC_NONE	0
3883	4	\N	t	f	2015-04-08 13:55:13.076056	2016-08-05 22:49:09.552876	246	Property	0	\N	\N	\N	DOC_NONE	0
3884	5	\N	t	f	2015-04-08 13:55:14.61855	2016-08-05 22:49:09.557211	246	Property	0	\N	\N	\N	DOC_NONE	0
3885	6	\N	t	f	2015-04-08 13:55:16.115888	2016-08-05 22:49:09.561661	246	Property	0	\N	\N	\N	DOC_NONE	0
3887	8	\N	t	f	2015-04-08 13:55:19.119578	2016-08-05 22:49:09.569705	246	Property	0	\N	\N	\N	DOC_NONE	0
3888	9	\N	t	f	2015-04-08 13:55:20.626047	2016-08-05 22:49:09.573514	246	Property	0	\N	\N	\N	DOC_NONE	0
3889	10	\N	t	f	2015-04-08 13:55:22.525161	2016-08-05 22:49:09.577456	246	Property	0	\N	\N	\N	DOC_NONE	0
3890	11	\N	t	f	2015-04-08 13:55:24.421678	2016-08-05 22:49:09.581808	246	Property	0	\N	\N	\N	DOC_NONE	0
3891	12	\N	t	f	2015-04-08 13:55:25.941811	2016-08-05 22:49:09.586996	246	Property	0	\N	\N	\N	DOC_NONE	0
3893	14	\N	t	f	2015-04-08 13:55:28.947355	2016-08-05 22:49:09.597142	246	Property	0	\N	\N	\N	DOC_NONE	0
3894	15	\N	t	f	2015-04-08 13:55:31.244911	2016-08-05 22:49:09.602302	246	Property	0	\N	\N	\N	DOC_NONE	0
3895	16	\N	t	f	2015-04-08 13:55:32.766866	2016-08-05 22:49:09.607042	246	Property	0	\N	\N	\N	DOC_NONE	0
3896	17	\N	t	f	2015-04-08 13:55:34.642482	2016-08-05 22:49:09.611012	246	Property	0	\N	\N	\N	DOC_NONE	0
3901	5	\N	t	f	2015-04-08 13:55:42.784598	2016-08-05 22:49:09.620039	247	Property	0	\N	\N	\N	DOC_NONE	0
3902	6	\N	t	f	2015-04-08 13:55:44.302247	2016-08-05 22:49:09.624056	247	Property	0	\N	\N	\N	DOC_NONE	0
3905	9	\N	t	f	2015-04-08 13:55:48.874621	2016-08-05 22:49:09.628327	247	Property	0	\N	\N	\N	DOC_NONE	0
3906	10	\N	t	f	2015-04-08 13:55:50.401101	2016-08-05 22:49:09.633177	247	Property	0	\N	\N	\N	DOC_NONE	0
3907	11	\N	t	f	2015-04-08 13:55:51.897303	2016-08-05 22:49:09.638026	247	Property	0	\N	\N	\N	DOC_NONE	0
3911	15	\N	t	f	2015-04-08 13:55:57.927339	2016-08-05 22:49:09.648091	247	Property	0	\N	\N	\N	DOC_NONE	0
3912	16	\N	t	f	2015-04-08 13:56:00.179792	2016-08-05 22:49:09.65239	247	Property	0	\N	\N	\N	DOC_NONE	0
3913	17	\N	t	f	2015-04-08 13:56:01.689745	2016-08-05 22:49:09.656694	247	Property	0	\N	\N	\N	DOC_NONE	0
3915	2	\N	t	f	2015-04-08 13:56:05.255695	2016-08-05 22:49:09.661102	248	Property	0	\N	\N	\N	DOC_NONE	0
3917	4	\N	t	f	2015-04-08 13:56:08.641181	2016-08-05 22:49:09.669647	248	Property	0	\N	\N	\N	DOC_NONE	0
3918	5	\N	t	f	2015-04-08 13:56:10.158133	2016-08-05 22:49:09.67536	248	Property	0	\N	\N	\N	DOC_NONE	0
3919	6	\N	t	f	2015-04-08 13:56:11.657138	2016-08-05 22:49:09.679623	248	Property	0	\N	\N	\N	DOC_NONE	0
3920	7	\N	t	f	2015-04-08 13:56:13.529821	2016-08-05 22:49:09.683803	248	Property	0	\N	\N	\N	DOC_NONE	0
3922	9	\N	t	f	2015-04-08 13:56:17.311182	2016-08-05 22:49:09.692734	248	Property	0	\N	\N	\N	DOC_NONE	0
3923	10	\N	t	f	2015-04-08 13:56:19.810158	2016-08-05 22:49:09.696975	248	Property	0	\N	\N	\N	DOC_NONE	0
3924	11	\N	t	f	2015-04-08 13:56:21.707132	2016-08-05 22:49:09.701184	248	Property	0	\N	\N	\N	DOC_NONE	0
3925	12	\N	t	f	2015-04-08 13:56:23.581936	2016-08-05 22:49:09.705839	248	Property	0	\N	\N	\N	DOC_NONE	0
3926	13	\N	t	f	2015-04-08 13:56:25.114583	2016-08-05 22:49:09.710115	248	Property	0	\N	\N	\N	DOC_NONE	0
3899	3	\N	t	t	2015-04-08 13:55:39.744624	2016-08-05 22:49:09.719334	247	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3898	2	\N	t	t	2015-04-08 13:55:38.209493	2016-08-05 22:49:09.723404	247	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3903	7	\N	t	t	2015-04-08 13:55:45.850647	2016-08-05 22:49:09.72814	247	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3904	8	\N	t	t	2015-04-08 13:55:47.358325	2016-08-05 22:49:09.7319	247	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3914	1	\N	t	t	2015-04-08 13:56:03.370731	2016-08-05 22:49:09.739991	248	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3847	2	\N	t	t	2015-04-08 13:54:10.401763	2016-08-05 22:49:09.745077	244	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3848	3	\N	t	t	2015-04-08 13:54:12.338949	2016-08-05 22:49:09.754219	244	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3928	15	\N	t	f	2015-04-08 13:56:28.171963	2016-08-05 22:49:09.758305	248	Property	0	\N	\N	\N	DOC_NONE	0
3929	16	\N	t	f	2015-04-08 13:56:30.037993	2016-08-05 22:49:09.76239	248	Property	0	\N	\N	\N	DOC_NONE	0
3933	3	\N	t	f	2015-04-08 13:56:36.737244	2016-08-05 22:49:09.770735	249	Property	0	\N	\N	\N	DOC_NONE	0
3934	4	\N	t	f	2015-04-08 13:56:38.269746	2016-08-05 22:49:09.774584	249	Property	0	\N	\N	\N	DOC_NONE	0
3935	5	\N	t	f	2015-04-08 13:56:40.517828	2016-08-05 22:49:09.778283	249	Property	0	\N	\N	\N	DOC_NONE	0
3936	6	\N	t	f	2015-04-08 13:56:43.156612	2016-08-05 22:49:09.782541	249	Property	0	\N	\N	\N	DOC_NONE	0
3937	7	\N	t	f	2015-04-08 13:56:46.210675	2016-08-05 22:49:09.786745	249	Property	0	\N	\N	\N	DOC_NONE	0
3939	9	\N	t	f	2015-04-08 13:56:49.222127	2016-08-05 22:49:09.796689	249	Property	0	\N	\N	\N	DOC_NONE	0
3940	10	\N	t	f	2015-04-08 13:56:51.112186	2016-08-05 22:49:09.804327	249	Property	0	\N	\N	\N	DOC_NONE	0
3941	11	\N	t	f	2015-04-08 13:56:52.641167	2016-08-05 22:49:09.809749	249	Property	0	\N	\N	\N	DOC_NONE	0
3942	12	\N	t	f	2015-04-08 13:56:54.162059	2016-08-05 22:49:09.814723	249	Property	0	\N	\N	\N	DOC_NONE	0
3944	14	\N	t	f	2015-04-08 13:56:57.186137	2016-08-05 22:49:09.824826	249	Property	0	\N	\N	\N	DOC_NONE	0
3945	15	\N	t	f	2015-04-08 13:56:58.717516	2016-08-05 22:49:09.829888	249	Property	0	\N	\N	\N	DOC_NONE	0
3946	16	\N	t	f	2015-04-08 13:57:00.247085	2016-08-05 22:49:09.835051	249	Property	0	\N	\N	\N	DOC_NONE	0
3949	2	\N	t	f	2015-04-08 13:57:05.4093	2016-08-05 22:49:09.839944	250	Property	0	\N	\N	\N	DOC_NONE	0
3951	4	\N	t	f	2015-04-08 13:57:09.616853	2016-08-05 22:49:09.849857	250	Property	0	\N	\N	\N	DOC_NONE	0
3952	5	\N	t	f	2015-04-08 13:57:12.432918	2016-08-05 22:49:09.854768	250	Property	0	\N	\N	\N	DOC_NONE	0
3953	6	\N	t	f	2015-04-08 13:57:14.79464	2016-08-05 22:49:09.859608	250	Property	0	\N	\N	\N	DOC_NONE	0
3954	7	\N	t	f	2015-04-08 13:57:16.302195	2016-08-05 22:49:09.864529	250	Property	0	\N	\N	\N	DOC_NONE	0
3955	8	\N	t	f	2015-04-08 13:57:18.189067	2016-08-05 22:49:09.869477	250	Property	0	\N	\N	\N	DOC_NONE	0
3957	10	\N	t	f	2015-04-08 13:57:22.396215	2016-08-05 22:49:09.879281	250	Property	0	\N	\N	\N	DOC_NONE	0
3958	11	\N	t	f	2015-04-08 13:57:23.927536	2016-08-05 22:49:09.887463	250	Property	0	\N	\N	\N	DOC_NONE	0
3959	12	\N	t	f	2015-04-08 13:57:26.19869	2016-08-05 22:49:09.895459	250	Property	0	\N	\N	\N	DOC_NONE	0
3960	13	\N	t	f	2015-04-08 13:57:27.729967	2016-08-05 22:49:09.900667	250	Property	0	\N	\N	\N	DOC_NONE	0
3962	15	\N	t	f	2015-04-08 13:57:31.482239	2016-08-05 22:49:09.911173	250	Property	0	\N	\N	\N	DOC_NONE	0
3963	16	\N	t	f	2015-04-08 13:57:33.382401	2016-08-05 22:49:09.915214	250	Property	0	\N	\N	\N	DOC_NONE	0
3965	1	\N	t	f	2015-04-08 13:57:36.608767	2016-08-05 22:49:09.919447	251	Property	0	\N	\N	\N	DOC_NONE	0
3966	4	\N	t	f	2015-04-08 13:57:41.312221	2016-08-05 22:49:09.923539	251	Property	0	\N	\N	\N	DOC_NONE	0
3967	5	\N	t	f	2015-04-08 13:57:44.611166	2016-08-05 22:49:09.927666	251	Property	0	\N	\N	\N	DOC_NONE	0
3969	7	\N	t	f	2015-04-08 13:57:47.690607	2016-08-05 22:49:09.936182	251	Property	0	\N	\N	\N	DOC_NONE	0
3970	8	\N	t	f	2015-04-08 13:57:50.065286	2016-08-05 22:49:09.940902	251	Property	0	\N	\N	\N	DOC_NONE	0
3971	9	\N	t	f	2015-04-08 13:57:51.60365	2016-08-05 22:49:09.945659	251	Property	0	\N	\N	\N	DOC_NONE	0
3972	10	\N	t	f	2015-04-08 13:57:53.852031	2016-08-05 22:49:09.949719	251	Property	0	\N	\N	\N	DOC_NONE	0
3975	14	\N	t	f	2015-04-08 13:58:00.229052	2016-08-05 22:49:09.957873	251	Property	0	\N	\N	\N	DOC_NONE	0
3976	15	\N	t	f	2015-04-08 13:58:02.102365	2016-08-05 22:49:09.961596	251	Property	0	\N	\N	\N	DOC_NONE	0
3977	16	\N	t	f	2015-04-08 13:58:03.624085	2016-08-05 22:49:09.965417	251	Property	0	\N	\N	\N	DOC_NONE	0
3978	17	\N	t	f	2015-04-08 13:58:05.505019	2016-08-05 22:49:09.969133	251	Property	0	\N	\N	\N	DOC_NONE	0
3980	4	\N	t	f	2015-04-08 13:58:11.449249	2016-08-05 22:49:09.978324	1	Property	0	\N	\N	\N	DOC_NONE	0
3981	5	\N	t	f	2015-04-08 13:58:12.966153	2016-08-05 22:49:09.983141	1	Property	0	\N	\N	\N	DOC_NONE	0
3982	6	\N	t	f	2015-04-08 13:58:15.624588	2016-08-05 22:49:09.989424	1	Property	0	\N	\N	\N	DOC_NONE	0
3983	7	\N	t	f	2015-04-08 13:58:17.156565	2016-08-05 22:49:09.9944	1	Property	0	\N	\N	\N	DOC_NONE	0
3984	8	\N	t	f	2015-04-08 13:58:19.047543	2016-08-05 22:49:09.999334	1	Property	0	\N	\N	\N	DOC_NONE	0
3986	10	\N	t	f	2015-04-08 13:58:22.086196	2016-08-05 22:49:10.007907	1	Property	0	\N	\N	\N	DOC_NONE	0
3987	11	\N	t	f	2015-04-08 13:58:23.95915	2016-08-05 22:49:10.01306	1	Property	0	\N	\N	\N	DOC_NONE	0
3988	12	\N	t	f	2015-04-08 13:58:25.899994	2016-08-05 22:49:10.024382	1	Property	0	\N	\N	\N	DOC_NONE	0
3989	13	\N	t	f	2015-04-08 13:58:27.789302	2016-08-05 22:49:10.029108	1	Property	0	\N	\N	\N	DOC_NONE	0
3991	15	\N	t	f	2015-04-08 13:58:30.815105	2016-08-05 22:49:10.044612	1	Property	0	\N	\N	\N	DOC_NONE	0
3992	16	\N	t	f	2015-04-08 13:58:32.317198	2016-08-05 22:49:10.049114	1	Property	0	\N	\N	\N	DOC_NONE	0
3993	17	\N	t	f	2015-04-08 13:58:33.821361	2016-08-05 22:49:10.055143	1	Property	0	\N	\N	\N	DOC_NONE	0
3994	1	\N	t	f	2015-04-08 13:58:35.500697	2016-08-05 22:49:10.072676	14	Property	0	\N	\N	\N	DOC_NONE	0
3995	2	\N	t	f	2015-04-08 13:58:37.37484	2016-08-05 22:49:10.080655	14	Property	0	\N	\N	\N	DOC_NONE	0
3997	4	\N	t	f	2015-04-08 13:58:40.418911	2016-08-05 22:49:10.105169	14	Property	0	\N	\N	\N	DOC_NONE	0
3998	5	\N	t	f	2015-04-08 13:58:41.951991	2016-08-05 22:49:10.111085	14	Property	0	\N	\N	\N	DOC_NONE	0
3999	6	\N	t	f	2015-04-08 13:58:43.83615	2016-08-05 22:49:10.115614	14	Property	0	\N	\N	\N	DOC_NONE	0
4000	7	\N	t	f	2015-04-08 13:58:45.353614	2016-08-05 22:49:10.120588	14	Property	0	\N	\N	\N	DOC_NONE	0
4002	9	\N	t	f	2015-04-08 13:58:48.360409	2016-08-05 22:49:10.130249	14	Property	0	\N	\N	\N	DOC_NONE	0
4003	10	\N	t	f	2015-04-08 13:58:50.227617	2016-08-05 22:49:10.134468	14	Property	0	\N	\N	\N	DOC_NONE	0
4004	11	\N	t	f	2015-04-08 13:58:51.739021	2016-08-05 22:49:10.138558	14	Property	0	\N	\N	\N	DOC_NONE	0
4005	12	\N	t	f	2015-04-08 13:58:53.230142	2016-08-05 22:49:10.145032	14	Property	0	\N	\N	\N	DOC_NONE	0
4007	14	\N	t	f	2015-04-08 13:58:56.226399	2016-08-05 22:49:10.15603	14	Property	0	\N	\N	\N	DOC_NONE	0
4008	15	\N	t	f	2015-04-08 13:58:57.717796	2016-08-05 22:49:10.161487	14	Property	0	\N	\N	\N	DOC_NONE	0
4009	16	\N	t	f	2015-04-08 13:58:59.209104	2016-08-05 22:49:10.167729	14	Property	0	\N	\N	\N	DOC_NONE	0
4010	17	\N	t	f	2015-04-08 13:59:01.067844	2016-08-05 22:49:10.172967	14	Property	0	\N	\N	\N	DOC_NONE	0
4011	1	\N	t	f	2015-04-08 13:59:02.734722	2016-08-05 22:49:10.184545	26	Property	0	\N	\N	\N	DOC_NONE	0
4013	5	\N	t	f	2015-04-08 13:59:07.748662	2016-08-05 22:49:10.197433	26	Property	0	\N	\N	\N	DOC_NONE	0
4014	6	\N	t	f	2015-04-08 13:59:09.257076	2016-08-05 22:49:10.203489	26	Property	0	\N	\N	\N	DOC_NONE	0
4015	7	\N	t	f	2015-04-08 13:59:10.755425	2016-08-05 22:49:10.209539	26	Property	0	\N	\N	\N	DOC_NONE	0
3947	17	\N	t	t	2015-04-08 13:57:01.806643	2016-08-05 22:49:10.214661	249	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3948	1	\N	t	t	2015-04-08 13:57:03.504833	2016-08-05 22:49:10.228131	250	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3964	17	\N	t	t	2015-04-08 13:57:34.900918	2016-08-05 22:49:10.236988	250	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4018	10	\N	t	f	2015-04-08 13:59:15.228965	2016-08-05 22:49:10.246721	26	Property	0	\N	\N	\N	DOC_NONE	0
4019	11	\N	t	f	2015-04-08 13:59:16.761519	2016-08-05 22:49:10.251353	26	Property	0	\N	\N	\N	DOC_NONE	0
4020	12	\N	t	f	2015-04-08 13:59:18.249436	2016-08-05 22:49:10.260742	26	Property	0	\N	\N	\N	DOC_NONE	0
4022	14	\N	t	f	2015-04-08 13:59:21.233099	2016-08-05 22:49:10.275859	26	Property	0	\N	\N	\N	DOC_NONE	0
4023	15	\N	t	f	2015-04-08 13:59:22.719522	2016-08-05 22:49:10.281163	26	Property	0	\N	\N	\N	DOC_NONE	0
4024	16	\N	t	f	2015-04-08 13:59:24.209481	2016-08-05 22:49:10.288643	26	Property	0	\N	\N	\N	DOC_NONE	0
4025	17	\N	t	f	2015-04-08 13:59:25.695387	2016-08-05 22:49:10.294064	26	Property	0	\N	\N	\N	DOC_NONE	0
4026	1	\N	t	f	2015-04-08 13:59:27.345691	2016-08-05 22:49:10.299152	39	Property	0	\N	\N	\N	DOC_NONE	0
4028	5	\N	t	f	2015-04-08 13:59:32.298809	2016-08-05 22:49:10.309037	39	Property	0	\N	\N	\N	DOC_NONE	0
4029	6	\N	t	f	2015-04-08 13:59:33.786924	2016-08-05 22:49:10.314789	39	Property	0	\N	\N	\N	DOC_NONE	0
4030	7	\N	t	f	2015-04-08 13:59:35.278137	2016-08-05 22:49:10.320751	39	Property	0	\N	\N	\N	DOC_NONE	0
4031	8	\N	t	f	2015-04-08 13:59:36.781427	2016-08-05 22:49:10.330816	39	Property	0	\N	\N	\N	DOC_NONE	0
4033	10	\N	t	f	2015-04-08 13:59:39.756766	2016-08-05 22:49:10.348875	39	Property	0	\N	\N	\N	DOC_NONE	0
4034	11	\N	t	f	2015-04-08 13:59:41.246385	2016-08-05 22:49:10.354546	39	Property	0	\N	\N	\N	DOC_NONE	0
4035	12	\N	t	f	2015-04-08 13:59:42.735346	2016-08-05 22:49:10.360486	39	Property	0	\N	\N	\N	DOC_NONE	0
4036	13	\N	t	f	2015-04-08 13:59:44.222015	2016-08-05 22:49:10.366402	39	Property	0	\N	\N	\N	DOC_NONE	0
4038	15	\N	t	f	2015-04-08 13:59:47.196683	2016-08-05 22:49:10.376896	39	Property	0	\N	\N	\N	DOC_NONE	0
4039	16	\N	t	f	2015-04-08 13:59:48.684483	2016-08-05 22:49:10.382528	39	Property	0	\N	\N	\N	DOC_NONE	0
4040	17	\N	t	f	2015-04-08 13:59:50.172951	2016-08-05 22:49:10.396916	39	Property	0	\N	\N	\N	DOC_NONE	0
4055	15	\N	t	f	2015-04-08 14:00:13.432927	2016-08-05 22:49:10.69195	52	Property	0	\N	\N	\N	DOC_NONE	0
4049	9	\N	t	f	2015-04-08 14:00:04.120233	2016-08-05 22:49:10.408753	52	Property	0	\N	\N	\N	DOC_NONE	0
4052	12	\N	t	f	2015-04-08 14:00:08.948856	2016-08-05 22:49:10.4193	52	Property	0	\N	\N	\N	DOC_NONE	0
4056	16	\N	t	f	2015-04-08 14:00:14.920321	2016-08-05 22:49:10.427403	52	Property	0	\N	\N	\N	DOC_NONE	0
4057	17	\N	t	f	2015-04-08 14:00:16.405299	2016-08-10 03:38:23.095213	52	Property	0	\N	\N	\N	DOC_NONE	0
4065	12	\N	t	f	2015-04-08 14:00:32.475047	2016-08-05 22:49:10.439163	65	Property	0	\N	\N	\N	DOC_NONE	0
4068	17	\N	t	f	2015-04-08 14:00:39.294578	2016-08-05 22:49:10.455779	65	Property	0	\N	\N	\N	DOC_NONE	0
4069	1	\N	t	f	2015-04-08 14:00:40.960689	2016-08-05 22:49:10.464545	78	Property	0	\N	\N	\N	DOC_NONE	0
4071	6	\N	t	f	2015-04-08 14:00:46.926561	2016-08-05 22:49:10.470237	78	Property	0	\N	\N	\N	DOC_NONE	0
4072	9	\N	t	f	2015-04-08 14:00:50.400563	2016-08-05 22:49:10.476655	78	Property	0	\N	\N	\N	DOC_NONE	0
4073	10	\N	t	f	2015-04-08 14:00:51.894481	2016-08-05 22:49:10.482779	78	Property	0	\N	\N	\N	DOC_NONE	0
4075	17	\N	t	f	2015-04-08 14:00:59.826842	2016-08-05 22:49:10.499601	78	Property	0	\N	\N	\N	DOC_NONE	0
4076	1	\N	t	f	2015-04-08 14:01:01.498369	2016-08-05 22:49:10.505366	91	Property	0	\N	\N	\N	DOC_NONE	0
4077	5	\N	t	f	2015-04-08 14:01:05.970784	2016-08-05 22:49:10.510917	91	Property	0	\N	\N	\N	DOC_NONE	0
4078	6	\N	t	f	2015-04-08 14:01:07.466866	2016-08-05 22:49:10.52041	91	Property	0	\N	\N	\N	DOC_NONE	0
4080	10	\N	t	f	2015-04-08 14:01:12.431567	2016-08-05 22:49:10.529566	91	Property	0	\N	\N	\N	DOC_NONE	0
4081	11	\N	t	f	2015-04-08 14:01:13.92211	2016-08-05 22:49:10.533892	91	Property	0	\N	\N	\N	DOC_NONE	0
4084	16	\N	t	f	2015-04-08 14:01:20.74441	2016-08-05 22:49:10.538272	91	Property	0	\N	\N	\N	DOC_NONE	0
4085	17	\N	t	f	2015-04-08 14:01:22.234469	2016-08-05 22:49:10.542614	91	Property	0	\N	\N	\N	DOC_NONE	0
4087	2	\N	t	f	2015-04-08 14:01:25.388998	2016-08-05 22:49:10.551562	253	Property	0	\N	\N	\N	DOC_NONE	0
4088	3	\N	t	f	2015-04-08 14:01:26.884873	2016-08-05 22:49:10.55588	253	Property	0	\N	\N	\N	DOC_NONE	0
4089	4	\N	t	f	2015-04-08 14:01:28.382351	2016-08-05 22:49:10.561283	253	Property	0	\N	\N	\N	DOC_NONE	0
4090	5	\N	t	f	2015-04-08 14:01:29.873406	2016-08-05 22:49:10.565721	253	Property	0	\N	\N	\N	DOC_NONE	0
4091	6	\N	t	f	2015-04-08 14:01:31.364776	2016-08-05 22:49:10.570296	253	Property	0	\N	\N	\N	DOC_NONE	0
4093	8	\N	t	f	2015-04-08 14:01:34.355078	2016-08-05 22:49:10.579007	253	Property	0	\N	\N	\N	DOC_NONE	0
4094	9	\N	t	f	2015-04-08 14:01:35.841735	2016-08-05 22:49:10.583482	253	Property	0	\N	\N	\N	DOC_NONE	0
4095	10	\N	t	f	2015-04-08 14:01:37.331793	2016-08-05 22:49:10.587898	253	Property	0	\N	\N	\N	DOC_NONE	0
4096	11	\N	t	f	2015-04-08 14:01:38.818119	2016-08-05 22:49:10.593782	253	Property	0	\N	\N	\N	DOC_NONE	0
4098	13	\N	t	f	2015-04-08 14:01:41.787414	2016-08-05 22:49:10.608992	253	Property	0	\N	\N	\N	DOC_NONE	0
4099	14	\N	t	f	2015-04-08 14:01:43.275236	2016-08-05 22:49:10.612914	253	Property	0	\N	\N	\N	DOC_NONE	0
4100	15	\N	t	f	2015-04-08 14:01:45.135639	2016-08-05 22:49:10.61884	253	Property	0	\N	\N	\N	DOC_NONE	0
4101	16	\N	t	f	2015-04-08 14:01:46.715926	2016-08-05 22:49:10.623227	253	Property	0	\N	\N	\N	DOC_NONE	0
4102	17	\N	t	f	2015-04-08 14:01:48.205696	2016-08-05 22:49:10.627758	253	Property	0	\N	\N	\N	DOC_NONE	0
4104	2	\N	t	f	2015-04-08 14:01:51.368891	2016-08-05 22:49:10.637443	254	Property	0	\N	\N	\N	DOC_NONE	0
4058	1	\N	t	t	2015-04-08 14:00:18.05921	2016-08-05 22:49:10.641873	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4067	16	\N	t	t	2015-04-08 14:00:37.796333	2016-08-05 22:49:10.64619	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4059	3	\N	t	t	2015-04-08 14:00:20.551519	2016-08-05 22:49:10.650466	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4042	2	\N	t	f	2015-04-08 13:59:53.321349	2016-08-16 00:35:44.464887	52	Property	0	\N	\N	\N	DOC_UPLOADED	0
4046	6	\N	t	f	2015-04-08 13:59:59.289918	2016-08-16 00:24:26.768431	52	Property	0	\N	\N	\N	DOC_NONE	0
4070	3	\N	t	t	2015-04-08 14:00:43.442954	2016-08-05 22:49:10.678091	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4051	11	\N	t	f	2015-04-08 14:00:07.460781	2016-08-16 01:57:28.618041	52	Property	0	\N	\N	\N	DOC_NONE	0
4048	8	\N	t	f	2015-04-08 14:00:02.634186	2016-08-16 01:00:27.065127	52	Property	0	\N	\N	\N	DOC_NONE	0
4054	14	\N	t	f	2015-04-08 14:00:11.945621	2016-08-16 00:49:05.446665	52	Property	0	\N	\N	\N	DOC_UPLOADED	0
4053	13	\N	t	f	2015-04-08 14:00:10.455322	2016-08-05 22:49:10.696562	52	Property	0	\N	\N	\N	DOC_NONE	0
4044	4	\N	t	f	2015-04-08 13:59:56.314092	2016-08-16 00:35:48.30509	52	Property	0	\N	\N	\N	DOC_UPLOADED	0
4083	13	\N	t	t	2015-04-08 14:01:16.898224	2016-08-05 22:49:10.721741	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4082	12	\N	t	t	2015-04-08 14:01:15.407097	2016-08-05 22:49:10.726466	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4063	9	\N	t	t	2015-04-08 14:00:28.500875	2016-08-05 22:49:10.732524	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4043	3	\N	t	f	2015-04-08 13:59:54.824013	2016-08-16 00:23:46.612693	52	Property	0	\N	\N	\N	DOC_UPLOADED	0
4107	5	\N	t	f	2015-04-08 14:01:55.829388	2016-08-05 22:49:10.748373	254	Property	0	\N	\N	\N	DOC_NONE	0
4108	6	\N	t	f	2015-04-08 14:01:57.316913	2016-08-05 22:49:10.753728	254	Property	0	\N	\N	\N	DOC_NONE	0
4047	7	\N	t	f	2015-04-08 14:00:00.778836	2016-08-16 00:59:58.852758	52	Property	0	\N	\N	\N	DOC_NONE	0
4110	8	\N	t	f	2015-04-08 14:02:00.293758	2016-08-05 22:49:10.768711	254	Property	0	\N	\N	\N	DOC_NONE	0
4111	9	\N	t	f	2015-04-08 14:02:01.789793	2016-08-05 22:49:10.773809	254	Property	0	\N	\N	\N	DOC_NONE	0
4112	10	\N	t	f	2015-04-08 14:02:03.277024	2016-08-05 22:49:10.779171	254	Property	0	\N	\N	\N	DOC_NONE	0
4114	12	\N	t	f	2015-04-08 14:02:06.252161	2016-08-05 22:49:10.788298	254	Property	0	\N	\N	\N	DOC_NONE	0
4115	13	\N	t	f	2015-04-08 14:02:07.755235	2016-08-05 22:49:10.793237	254	Property	0	\N	\N	\N	DOC_NONE	0
4116	14	\N	t	f	2015-04-08 14:02:09.241329	2016-08-05 22:49:10.800515	254	Property	0	\N	\N	\N	DOC_NONE	0
4117	15	\N	t	f	2015-04-08 14:02:10.72472	2016-08-05 22:49:10.805906	254	Property	0	\N	\N	\N	DOC_NONE	0
4118	16	\N	t	f	2015-04-08 14:02:12.218576	2016-08-05 22:49:10.810771	254	Property	0	\N	\N	\N	DOC_NONE	0
4120	1	\N	t	f	2015-04-08 14:02:15.369807	2016-08-05 22:49:10.819335	255	Property	0	\N	\N	\N	DOC_NONE	0
4123	4	\N	t	f	2015-04-08 14:02:19.837221	2016-08-05 22:49:10.830007	255	Property	0	\N	\N	\N	DOC_NONE	0
4124	5	\N	t	f	2015-04-08 14:02:21.325722	2016-08-05 22:49:10.835313	255	Property	0	\N	\N	\N	DOC_NONE	0
4125	6	\N	t	f	2015-04-08 14:02:23.140368	2016-08-05 22:49:10.840861	255	Property	0	\N	\N	\N	DOC_NONE	0
4127	8	\N	t	f	2015-04-08 14:02:26.115992	2016-08-05 22:49:10.851308	255	Property	0	\N	\N	\N	DOC_NONE	0
4128	9	\N	t	f	2015-04-08 14:02:27.602228	2016-08-05 22:49:10.856732	255	Property	0	\N	\N	\N	DOC_NONE	0
4129	10	\N	t	f	2015-04-08 14:02:29.093764	2016-08-05 22:49:10.862	255	Property	0	\N	\N	\N	DOC_NONE	0
4130	11	\N	t	f	2015-04-08 14:02:30.586466	2016-08-05 22:49:10.867201	255	Property	0	\N	\N	\N	DOC_NONE	0
4132	13	\N	t	f	2015-04-08 14:02:33.559736	2016-08-05 22:49:10.883266	255	Property	0	\N	\N	\N	DOC_NONE	0
4133	14	\N	t	f	2015-04-08 14:02:35.047252	2016-08-05 22:49:10.888857	255	Property	0	\N	\N	\N	DOC_NONE	0
4134	15	\N	t	f	2015-04-08 14:02:36.52965	2016-08-05 22:49:10.894138	255	Property	0	\N	\N	\N	DOC_NONE	0
4135	16	\N	t	f	2015-04-08 14:02:38.389832	2016-08-05 22:49:10.900773	255	Property	0	\N	\N	\N	DOC_NONE	0
4136	17	\N	t	f	2015-04-08 14:02:39.877123	2016-08-05 22:49:10.912006	255	Property	0	\N	\N	\N	DOC_NONE	0
4139	3	\N	t	f	2015-04-08 14:02:44.502271	2016-08-05 22:49:10.924801	256	Property	0	\N	\N	\N	DOC_NONE	0
4140	4	\N	t	f	2015-04-08 14:02:46.002194	2016-08-05 22:49:10.930147	256	Property	0	\N	\N	\N	DOC_NONE	0
4141	5	\N	t	f	2015-04-08 14:02:47.495136	2016-08-05 22:49:10.936567	256	Property	0	\N	\N	\N	DOC_NONE	0
4142	6	\N	t	f	2015-04-08 14:02:48.987632	2016-08-05 22:49:10.941846	256	Property	0	\N	\N	\N	DOC_NONE	0
4144	8	\N	t	f	2015-04-08 14:02:51.96871	2016-08-05 22:49:10.957655	256	Property	0	\N	\N	\N	DOC_NONE	0
4145	9	\N	t	f	2015-04-08 14:02:53.471069	2016-08-05 22:49:10.963442	256	Property	0	\N	\N	\N	DOC_NONE	0
4146	10	\N	t	f	2015-04-08 14:02:54.963447	2016-08-05 22:49:10.970117	256	Property	0	\N	\N	\N	DOC_NONE	0
4147	11	\N	t	f	2015-04-08 14:02:56.455272	2016-08-05 22:49:10.975314	256	Property	0	\N	\N	\N	DOC_NONE	0
4148	12	\N	t	f	2015-04-08 14:02:57.942359	2016-08-05 22:49:10.980276	256	Property	0	\N	\N	\N	DOC_NONE	0
4150	14	\N	t	f	2015-04-08 14:03:00.914932	2016-08-05 22:49:10.991159	256	Property	0	\N	\N	\N	DOC_NONE	0
4151	15	\N	t	f	2015-04-08 14:03:02.401405	2016-08-05 22:49:10.995456	256	Property	0	\N	\N	\N	DOC_NONE	0
4152	16	\N	t	f	2015-04-08 14:03:03.88703	2016-08-05 22:49:10.999973	256	Property	0	\N	\N	\N	DOC_NONE	0
4153	17	\N	t	f	2015-04-08 14:03:05.376759	2016-08-05 22:49:11.007429	256	Property	0	\N	\N	\N	DOC_NONE	0
4156	5	\N	t	f	2015-04-08 14:03:11.992315	2016-08-05 22:49:11.028629	94	Property	0	\N	\N	\N	DOC_NONE	0
4157	6	\N	t	f	2015-04-08 14:03:13.484314	2016-08-05 22:49:11.035391	94	Property	0	\N	\N	\N	DOC_NONE	0
4160	10	\N	t	f	2015-04-08 14:03:18.967368	2016-08-05 22:49:11.040666	94	Property	0	\N	\N	\N	DOC_NONE	0
4161	11	\N	t	f	2015-04-08 14:03:20.454	2016-08-05 22:49:11.04605	94	Property	0	\N	\N	\N	DOC_NONE	0
4164	14	\N	t	f	2015-04-08 14:03:24.916401	2016-08-05 22:49:11.055493	94	Property	0	\N	\N	\N	DOC_NONE	0
4165	15	\N	t	f	2015-04-08 14:03:26.413478	2016-08-05 22:49:11.061862	94	Property	0	\N	\N	\N	DOC_NONE	0
4166	16	\N	t	f	2015-04-08 14:03:27.901284	2016-08-05 22:49:11.069816	94	Property	0	\N	\N	\N	DOC_NONE	0
4167	17	\N	t	f	2015-04-08 14:03:29.40578	2016-08-05 22:49:11.074831	94	Property	0	\N	\N	\N	DOC_NONE	0
4170	6	\N	t	f	2015-04-08 14:03:36.997842	2016-08-05 22:49:11.080046	104	Property	0	\N	\N	\N	DOC_NONE	0
4172	10	\N	t	f	2015-04-08 14:03:41.945552	2016-08-05 22:49:11.090835	104	Property	0	\N	\N	\N	DOC_NONE	0
4173	12	\N	t	f	2015-04-08 14:03:44.432806	2016-08-05 22:49:11.096055	104	Property	0	\N	\N	\N	DOC_NONE	0
4174	13	\N	t	f	2015-04-08 14:03:45.920466	2016-08-05 22:49:11.103544	104	Property	0	\N	\N	\N	DOC_NONE	0
4175	17	\N	t	f	2015-04-08 14:03:50.385459	2016-08-05 22:49:11.111622	104	Property	0	\N	\N	\N	DOC_NONE	0
4181	6	\N	t	f	2015-04-08 14:03:59.727436	2016-08-05 22:49:11.122755	105	Property	0	\N	\N	\N	DOC_NONE	0
4183	8	\N	t	f	2015-04-08 14:04:03.454757	2016-08-05 22:49:11.128561	105	Property	0	\N	\N	\N	DOC_NONE	0
4185	10	\N	t	f	2015-04-08 14:04:07.178	2016-08-05 22:49:11.134769	105	Property	0	\N	\N	\N	DOC_NONE	0
4189	1	\N	t	f	2015-04-08 14:04:17.269024	2016-08-05 22:49:11.143175	118	Property	0	\N	\N	\N	DOC_NONE	0
4190	5	\N	t	f	2015-04-08 14:04:21.747686	2016-08-05 22:49:11.148816	118	Property	0	\N	\N	\N	DOC_NONE	0
4192	8	\N	t	f	2015-04-08 14:04:25.713013	2016-08-05 22:49:11.162991	118	Property	0	\N	\N	\N	DOC_NONE	0
4193	9	\N	t	f	2015-04-08 14:04:27.19983	2016-08-05 22:49:11.170028	118	Property	0	\N	\N	\N	DOC_NONE	0
4169	3	\N	t	t	2015-04-08 14:03:33.535855	2016-08-05 22:49:11.181006	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4137	1	\N	t	t	2015-04-08 14:02:41.530901	2016-08-05 22:49:11.188791	256	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4122	3	\N	t	t	2015-04-08 14:02:18.348935	2016-08-05 22:49:11.212761	255	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4177	2	\N	t	t	2015-04-08 14:03:53.549774	2016-08-05 22:49:11.220388	105	Property	1	\N	\N	\N	DOC_UPLOADED	0
4176	1	\N	t	t	2015-04-08 14:03:52.043742	2016-08-05 22:49:11.225225	105	Property	1	\N	\N	\N	DOC_UPLOADED	0
4179	4	\N	t	t	2015-04-08 14:03:56.61888	2016-08-05 22:49:11.229812	105	Property	1	\N	\N	\N	DOC_UPLOADED	0
4186	14	\N	t	t	2015-04-08 14:04:11.640127	2016-08-05 22:49:11.244376	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4178	3	\N	t	t	2015-04-08 14:03:55.123177	2016-08-05 22:49:11.25348	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4182	7	\N	t	t	2015-04-08 14:04:01.968706	2016-08-05 22:49:11.25921	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4159	8	\N	t	f	2015-04-08 14:03:16.465055	2016-08-05 22:49:11.265908	94	Property	0	\N	\N	\N	DOC_NONE	0
4162	12	\N	t	f	2015-04-08 14:03:21.948404	2016-08-05 22:49:11.271052	94	Property	0	\N	\N	\N	DOC_NONE	0
4158	7	\N	t	f	2015-04-08 14:03:14.973647	2016-08-05 22:49:11.281494	94	Property	0	\N	\N	\N	DOC_NONE	0
4188	17	\N	t	t	2015-04-08 14:04:15.610225	2016-08-05 22:49:11.2868	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4195	12	\N	t	f	2015-04-08 14:04:31.17727	2016-08-05 22:49:11.292475	118	Property	0	\N	\N	\N	DOC_NONE	0
4199	17	\N	t	f	2015-04-08 14:04:38.130312	2016-08-05 22:49:11.297781	118	Property	0	\N	\N	\N	DOC_NONE	0
4203	9	\N	t	f	2015-04-08 14:04:49.229134	2016-08-05 22:49:11.308349	120	Property	0	\N	\N	\N	DOC_NONE	0
4204	11	\N	t	f	2015-04-08 14:04:51.715572	2016-08-05 22:49:11.314367	120	Property	0	\N	\N	\N	DOC_NONE	0
4206	1	\N	t	f	2015-04-08 14:04:59.822865	2016-08-05 22:49:11.327309	127	Property	0	\N	\N	\N	DOC_NONE	0
4207	4	\N	t	f	2015-04-08 14:05:03.296895	2016-08-05 22:49:11.333011	127	Property	0	\N	\N	\N	DOC_NONE	0
4208	5	\N	t	f	2015-04-08 14:05:05.164184	2016-08-05 22:49:11.337981	127	Property	0	\N	\N	\N	DOC_NONE	0
4210	7	\N	t	f	2015-04-08 14:05:08.154203	2016-08-05 22:49:11.348463	127	Property	0	\N	\N	\N	DOC_NONE	0
4211	8	\N	t	f	2015-04-08 14:05:09.644247	2016-08-05 22:49:11.353238	127	Property	0	\N	\N	\N	DOC_NONE	0
4212	9	\N	t	f	2015-04-08 14:05:11.130764	2016-08-05 22:49:11.358351	127	Property	0	\N	\N	\N	DOC_NONE	0
4213	10	\N	t	f	2015-04-08 14:05:12.62791	2016-08-05 22:49:11.365925	127	Property	0	\N	\N	\N	DOC_NONE	0
4214	11	\N	t	f	2015-04-08 14:05:14.117867	2016-08-05 22:49:11.370284	127	Property	0	\N	\N	\N	DOC_NONE	0
4216	13	\N	t	f	2015-04-08 14:05:17.474596	2016-08-05 22:49:11.382788	127	Property	0	\N	\N	\N	DOC_NONE	0
4217	14	\N	t	f	2015-04-08 14:05:18.975546	2016-08-05 22:49:11.388475	127	Property	0	\N	\N	\N	DOC_NONE	0
4218	15	\N	t	f	2015-04-08 14:05:20.470598	2016-08-05 22:49:11.397975	127	Property	0	\N	\N	\N	DOC_NONE	0
4219	16	\N	t	f	2015-04-08 14:05:21.959452	2016-08-05 22:49:11.40536	127	Property	0	\N	\N	\N	DOC_NONE	0
4221	2	\N	t	f	2015-04-08 14:05:26.106873	2016-08-05 22:49:11.4162	131	Property	0	\N	\N	\N	DOC_NONE	0
4222	3	\N	t	f	2015-04-08 14:05:27.597294	2016-08-05 22:49:11.422878	131	Property	0	\N	\N	\N	DOC_NONE	0
4223	4	\N	t	f	2015-04-08 14:05:29.092399	2016-08-05 22:49:11.427718	131	Property	0	\N	\N	\N	DOC_NONE	0
4224	5	\N	t	f	2015-04-08 14:05:30.577911	2016-08-05 22:49:11.434077	131	Property	0	\N	\N	\N	DOC_NONE	0
4226	7	\N	t	f	2015-04-08 14:05:34.034126	2016-08-05 22:49:11.448535	131	Property	0	\N	\N	\N	DOC_NONE	0
4227	8	\N	t	f	2015-04-08 14:05:35.525389	2016-08-05 22:49:11.454205	131	Property	0	\N	\N	\N	DOC_NONE	0
4228	9	\N	t	f	2015-04-08 14:05:37.012698	2016-08-05 22:49:11.459849	131	Property	0	\N	\N	\N	DOC_NONE	0
4229	10	\N	t	f	2015-04-08 14:05:38.51613	2016-08-05 22:49:11.464944	131	Property	0	\N	\N	\N	DOC_NONE	0
4230	11	\N	t	f	2015-04-08 14:05:40.000629	2016-08-05 22:49:11.470211	131	Property	0	\N	\N	\N	DOC_NONE	0
4232	13	\N	t	f	2015-04-08 14:05:42.975278	2016-08-05 22:49:11.481892	131	Property	0	\N	\N	\N	DOC_NONE	0
4233	14	\N	t	f	2015-04-08 14:05:44.457632	2016-08-05 22:49:11.486932	131	Property	0	\N	\N	\N	DOC_NONE	0
4234	15	\N	t	f	2015-04-08 14:05:46.319875	2016-08-05 22:49:11.492041	131	Property	0	\N	\N	\N	DOC_NONE	0
4235	16	\N	t	f	2015-04-08 14:05:47.806635	2016-08-05 22:49:11.498	131	Property	0	\N	\N	\N	DOC_NONE	0
4237	1	\N	t	f	2015-04-08 14:05:51.343077	2016-08-05 22:49:11.508972	145	Property	0	\N	\N	\N	DOC_NONE	0
4238	2	\N	t	f	2015-04-08 14:05:52.836539	2016-08-05 22:49:11.515541	145	Property	0	\N	\N	\N	DOC_NONE	0
4239	3	\N	t	f	2015-04-08 14:05:54.322445	2016-08-05 22:49:11.520592	145	Property	0	\N	\N	\N	DOC_NONE	0
4240	4	\N	t	f	2015-04-08 14:05:56.576919	2016-08-05 22:49:11.532686	145	Property	0	\N	\N	\N	DOC_NONE	0
4241	5	\N	t	f	2015-04-08 14:05:58.083514	2016-08-05 22:49:11.540393	145	Property	0	\N	\N	\N	DOC_NONE	0
4243	7	\N	t	f	2015-04-08 14:06:01.053949	2016-08-05 22:49:11.556383	145	Property	0	\N	\N	\N	DOC_NONE	0
4245	9	\N	t	f	2015-04-08 14:06:04.076817	2016-08-05 22:49:11.560687	145	Property	0	\N	\N	\N	DOC_NONE	0
4246	10	\N	t	f	2015-04-08 14:06:05.565638	2016-08-05 22:49:11.56765	145	Property	0	\N	\N	\N	DOC_NONE	0
4247	11	\N	t	f	2015-04-08 14:06:07.050433	2016-08-05 22:49:11.574774	145	Property	0	\N	\N	\N	DOC_NONE	0
4249	13	\N	t	f	2015-04-08 14:06:10.020296	2016-08-05 22:49:11.589976	145	Property	0	\N	\N	\N	DOC_NONE	0
4250	14	\N	t	f	2015-04-08 14:06:11.506385	2016-08-05 22:49:11.594888	145	Property	0	\N	\N	\N	DOC_NONE	0
4251	15	\N	t	f	2015-04-08 14:06:12.991653	2016-08-05 22:49:11.601189	145	Property	0	\N	\N	\N	DOC_NONE	0
4252	16	\N	t	f	2015-04-08 14:06:14.482819	2016-08-05 22:49:11.611895	145	Property	0	\N	\N	\N	DOC_NONE	0
4256	8	\N	t	f	2015-04-08 14:06:25.561814	2016-08-05 22:49:11.626162	159	Property	0	\N	\N	\N	DOC_NONE	0
4257	9	\N	t	f	2015-04-08 14:06:27.050567	2016-08-05 22:49:11.635229	159	Property	0	\N	\N	\N	DOC_NONE	0
4258	10	\N	t	f	2015-04-08 14:06:28.543059	2016-08-05 22:49:11.640825	159	Property	0	\N	\N	\N	DOC_NONE	0
4259	17	\N	t	f	2015-04-08 14:06:35.977235	2016-08-05 22:49:11.646374	159	Property	0	\N	\N	\N	DOC_NONE	0
4263	5	\N	t	f	2015-04-08 14:06:43.100731	2016-08-05 22:49:11.653932	160	Property	0	\N	\N	\N	DOC_NONE	0
4265	11	\N	t	f	2015-04-08 14:06:50.092016	2016-08-05 22:49:11.670157	160	Property	0	\N	\N	\N	DOC_NONE	0
4267	14	\N	t	f	2015-04-08 14:06:54.052588	2016-08-05 22:49:11.675334	160	Property	0	\N	\N	\N	DOC_NONE	0
4271	1	\N	t	f	2015-04-08 14:07:00.187656	2016-08-05 22:49:11.681787	173	Property	0	\N	\N	\N	DOC_NONE	0
4273	4	\N	t	f	2015-04-08 14:07:04.524456	2016-08-05 22:49:11.692209	173	Property	0	\N	\N	\N	DOC_NONE	0
4275	6	\N	t	f	2015-04-08 14:07:07.503952	2016-08-05 22:49:11.708117	173	Property	0	\N	\N	\N	DOC_NONE	0
4276	8	\N	t	f	2015-04-08 14:07:09.994803	2016-08-05 22:49:11.714416	173	Property	0	\N	\N	\N	DOC_NONE	0
4277	9	\N	t	f	2015-04-08 14:07:11.500905	2016-08-05 22:49:11.724107	173	Property	0	\N	\N	\N	DOC_NONE	0
4278	10	\N	t	f	2015-04-08 14:07:12.987746	2016-08-05 22:49:11.737528	173	Property	0	\N	\N	\N	DOC_NONE	0
4279	12	\N	t	f	2015-04-08 14:07:15.473561	2016-08-05 22:49:11.744594	173	Property	0	\N	\N	\N	DOC_NONE	0
4281	17	\N	t	f	2015-04-08 14:07:21.419708	2016-08-05 22:49:11.76365	173	Property	0	\N	\N	\N	DOC_NONE	0
4282	1	\N	t	f	2015-04-08 14:07:23.074061	2016-08-05 22:49:11.769232	187	Property	0	\N	\N	\N	DOC_NONE	0
4266	12	\N	t	t	2015-04-08 14:06:51.57338	2016-08-05 22:49:11.774919	160	Property	1	\N	\N	\N	DOC_UPLOADED	0
4270	17	\N	t	t	2015-04-08 14:06:58.53524	2016-08-05 22:49:11.779851	160	Property	1	\N	\N	\N	DOC_UPLOADED	0
4202	6	\N	t	t	2015-04-08 14:04:45.748565	2016-08-05 22:49:11.793741	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4201	3	\N	t	t	2015-04-08 14:04:42.270206	2016-08-05 22:49:11.798485	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4260	1	\N	t	t	2015-04-08 14:06:37.632885	2016-08-05 22:49:11.803472	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4269	16	\N	t	t	2015-04-08 14:06:57.053182	2016-08-05 22:49:11.81102	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4196	13	\N	t	t	2015-04-08 14:04:32.664184	2016-08-05 22:49:11.820917	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4197	14	\N	t	t	2015-04-08 14:04:34.153562	2016-08-05 22:49:11.825942	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4254	1	\N	t	t	2015-04-08 14:06:17.628122	2016-08-05 22:49:11.831052	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4255	6	\N	t	t	2015-04-08 14:06:23.085143	2016-08-05 22:49:11.836508	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4268	15	\N	t	t	2015-04-08 14:06:55.564478	2016-08-05 22:49:11.841821	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4284	3	\N	t	f	2015-04-08 14:07:26.053565	2016-08-05 22:49:11.85238	187	Property	0	\N	\N	\N	DOC_NONE	0
4285	4	\N	t	f	2015-04-08 14:07:27.54334	2016-08-05 22:49:11.857738	187	Property	0	\N	\N	\N	DOC_NONE	0
4286	5	\N	t	f	2015-04-08 14:07:29.034629	2016-08-05 22:49:11.86325	187	Property	0	\N	\N	\N	DOC_NONE	0
4287	6	\N	t	f	2015-04-08 14:07:30.52257	2016-08-05 22:49:11.868268	187	Property	0	\N	\N	\N	DOC_NONE	0
4289	8	\N	t	f	2015-04-08 14:07:33.511136	2016-08-05 22:49:11.876451	187	Property	0	\N	\N	\N	DOC_NONE	0
4290	9	\N	t	f	2015-04-08 14:07:34.997231	2016-08-05 22:49:11.880457	187	Property	0	\N	\N	\N	DOC_NONE	0
4292	11	\N	t	f	2015-04-08 14:07:37.964841	2016-08-05 22:49:11.890703	187	Property	0	\N	\N	\N	DOC_NONE	0
4293	12	\N	t	f	2015-04-08 14:07:39.451498	2016-08-05 22:49:11.895069	187	Property	0	\N	\N	\N	DOC_NONE	0
4294	13	\N	t	f	2015-04-08 14:07:40.942305	2016-08-05 22:49:11.903637	187	Property	0	\N	\N	\N	DOC_NONE	0
4296	15	\N	t	f	2015-04-08 14:07:43.915494	2016-08-05 22:49:11.913561	187	Property	0	\N	\N	\N	DOC_NONE	0
4297	16	\N	t	f	2015-04-08 14:07:45.399044	2016-08-05 22:49:11.917692	187	Property	0	\N	\N	\N	DOC_NONE	0
4298	17	\N	t	f	2015-04-08 14:07:46.885665	2016-08-05 22:49:11.922403	187	Property	0	\N	\N	\N	DOC_NONE	0
4299	1	\N	t	f	2015-04-08 14:07:48.532282	2016-08-05 22:49:11.927177	200	Property	0	\N	\N	\N	DOC_NONE	0
4302	6	\N	t	f	2015-04-08 14:07:54.988547	2016-08-05 22:49:11.931434	200	Property	0	\N	\N	\N	DOC_NONE	0
4304	10	\N	t	f	2015-04-08 14:07:59.982051	2016-08-05 22:49:11.939885	200	Property	0	\N	\N	\N	DOC_NONE	0
4305	14	\N	t	f	2015-04-08 14:08:04.462701	2016-08-05 22:49:11.944581	200	Property	0	\N	\N	\N	DOC_NONE	0
4306	15	\N	t	f	2015-04-08 14:08:05.951806	2016-08-05 22:49:11.949626	200	Property	0	\N	\N	\N	DOC_NONE	0
4307	16	\N	t	f	2015-04-08 14:08:07.464904	2016-08-05 22:49:11.956512	200	Property	0	\N	\N	\N	DOC_NONE	0
4309	1	\N	t	f	2015-04-08 14:08:10.624489	2016-08-05 22:49:11.965551	213	Property	0	\N	\N	\N	DOC_NONE	0
4310	6	\N	t	f	2015-04-08 14:08:16.095073	2016-08-05 22:49:11.969557	213	Property	0	\N	\N	\N	DOC_NONE	0
4312	10	\N	t	f	2015-04-08 14:08:21.066657	2016-08-05 22:49:11.973577	213	Property	0	\N	\N	\N	DOC_NONE	0
4313	14	\N	t	f	2015-04-08 14:08:25.546299	2016-08-05 22:49:11.977854	213	Property	0	\N	\N	\N	DOC_NONE	0
4315	16	\N	t	f	2015-04-08 14:08:28.543858	2016-08-05 22:49:11.987014	213	Property	0	\N	\N	\N	DOC_NONE	0
4316	17	\N	t	f	2015-04-08 14:08:30.042534	2016-08-05 22:49:11.991968	213	Property	0	\N	\N	\N	DOC_NONE	0
4317	1	\N	t	f	2015-04-08 14:08:31.700416	2016-08-05 22:49:11.99678	226	Property	0	\N	\N	\N	DOC_NONE	0
4320	4	\N	t	f	2015-04-08 14:08:36.213533	2016-08-05 22:49:12.001857	226	Property	0	\N	\N	\N	DOC_NONE	0
4321	5	\N	t	f	2015-04-08 14:08:37.711466	2016-08-05 22:49:12.006677	226	Property	0	\N	\N	\N	DOC_NONE	0
4323	7	\N	t	f	2015-04-08 14:08:40.679285	2016-08-05 22:49:12.015893	226	Property	0	\N	\N	\N	DOC_NONE	0
4324	8	\N	t	f	2015-04-08 14:08:42.169109	2016-08-05 22:49:12.02167	226	Property	0	\N	\N	\N	DOC_NONE	0
4325	9	\N	t	f	2015-04-08 14:08:43.664338	2016-08-05 22:49:12.026814	226	Property	0	\N	\N	\N	DOC_NONE	0
4326	10	\N	t	f	2015-04-08 14:08:45.154093	2016-08-05 22:49:12.031381	226	Property	0	\N	\N	\N	DOC_NONE	0
4328	12	\N	t	f	2015-04-08 14:08:48.132099	2016-08-05 22:49:12.042124	226	Property	0	\N	\N	\N	DOC_NONE	0
4329	13	\N	t	f	2015-04-08 14:08:49.616327	2016-08-05 22:49:12.069212	226	Property	0	\N	\N	\N	DOC_NONE	0
4330	14	\N	t	f	2015-04-08 14:08:51.102994	2016-08-05 22:49:12.074061	226	Property	0	\N	\N	\N	DOC_NONE	0
4331	15	\N	t	f	2015-04-08 14:08:52.593063	2016-08-05 22:49:12.078653	226	Property	0	\N	\N	\N	DOC_NONE	0
4347	16	\N	t	f	2015-04-08 14:09:18.597741	2016-08-05 22:49:12.083372	238	Property	0	\N	\N	\N	DOC_NONE	0
4350	3	\N	t	f	2015-04-08 14:09:24.322988	2016-08-05 22:49:12.093808	239	Property	0	\N	\N	\N	DOC_NONE	0
4351	4	\N	t	f	2015-04-08 14:09:26.188858	2016-08-05 22:49:12.098963	239	Property	0	\N	\N	\N	DOC_NONE	0
4352	5	\N	t	f	2015-04-08 14:09:27.677034	2016-08-05 22:49:12.104219	239	Property	0	\N	\N	\N	DOC_NONE	0
4353	6	\N	t	f	2015-04-08 14:09:29.171128	2016-08-05 22:49:12.109767	239	Property	0	\N	\N	\N	DOC_NONE	0
4355	8	\N	t	f	2015-04-08 14:09:32.147372	2016-08-05 22:49:12.120477	239	Property	0	\N	\N	\N	DOC_NONE	0
4356	9	\N	t	f	2015-04-08 14:09:33.635512	2016-08-05 22:49:12.125565	239	Property	0	\N	\N	\N	DOC_NONE	0
4357	10	\N	t	f	2015-04-08 14:09:35.126526	2016-08-05 22:49:12.1306	239	Property	0	\N	\N	\N	DOC_NONE	0
4358	11	\N	t	f	2015-04-08 14:09:36.66525	2016-08-05 22:49:12.135832	239	Property	0	\N	\N	\N	DOC_NONE	0
4360	15	\N	t	f	2015-04-08 14:09:41.644254	2016-08-05 22:49:12.146749	239	Property	0	\N	\N	\N	DOC_NONE	0
4361	16	\N	t	f	2015-04-08 14:09:43.134292	2016-08-05 22:49:12.151844	239	Property	0	\N	\N	\N	DOC_NONE	0
4362	17	\N	t	f	2015-04-08 14:09:44.620592	2016-08-05 22:49:12.157026	239	Property	0	\N	\N	\N	DOC_NONE	0
4365	4	\N	t	f	2015-04-08 14:09:50.268296	2016-08-05 22:49:12.161951	242	Property	0	\N	\N	\N	DOC_NONE	0
4366	5	\N	t	f	2015-04-08 14:09:51.767201	2016-08-05 22:49:12.16698	242	Property	0	\N	\N	\N	DOC_NONE	0
4368	7	\N	t	f	2015-04-08 14:09:54.75656	2016-08-05 22:49:12.181495	242	Property	0	\N	\N	\N	DOC_NONE	0
4369	8	\N	t	f	2015-04-08 14:09:56.25596	2016-08-05 22:49:12.187332	242	Property	0	\N	\N	\N	DOC_NONE	0
4370	9	\N	t	f	2015-04-08 14:09:57.743013	2016-08-05 22:49:12.192129	242	Property	0	\N	\N	\N	DOC_NONE	0
4371	10	\N	t	f	2015-04-08 14:09:59.231951	2016-08-05 22:49:12.200482	242	Property	0	\N	\N	\N	DOC_NONE	0
4373	12	\N	t	f	2015-04-08 14:10:02.210926	2016-08-05 22:49:12.212592	242	Property	0	\N	\N	\N	DOC_NONE	0
4374	13	\N	t	f	2015-04-08 14:10:03.696853	2016-08-05 22:49:12.217722	242	Property	0	\N	\N	\N	DOC_NONE	0
4375	14	\N	t	f	2015-04-08 14:10:05.18929	2016-08-05 22:49:12.222635	242	Property	0	\N	\N	\N	DOC_NONE	0
4376	15	\N	t	f	2015-04-08 14:10:06.67788	2016-08-05 22:49:12.227566	242	Property	0	\N	\N	\N	DOC_NONE	0
4377	16	\N	t	f	2015-04-08 14:10:08.164302	2016-08-05 22:49:12.232466	242	Property	0	\N	\N	\N	DOC_NONE	0
4379	1	\N	t	f	2015-04-08 14:10:11.308288	2016-08-05 22:49:12.242316	252	Property	0	\N	\N	\N	DOC_NONE	0
4381	4	\N	t	f	2015-04-08 14:10:15.286728	2016-08-05 22:49:12.247468	252	Property	0	\N	\N	\N	DOC_NONE	0
4382	5	\N	t	f	2015-04-08 14:10:16.773939	2016-08-05 22:49:12.251502	252	Property	0	\N	\N	\N	DOC_NONE	0
4383	6	\N	t	f	2015-04-08 14:10:18.281657	2016-08-05 22:49:12.255543	252	Property	0	\N	\N	\N	DOC_NONE	0
4385	8	\N	t	f	2015-04-08 14:10:21.25939	2016-08-05 22:49:12.265095	252	Property	0	\N	\N	\N	DOC_NONE	0
4363	1	\N	t	t	2015-04-08 14:09:46.283185	2016-08-05 22:49:12.270148	242	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4380	3	\N	t	t	2015-04-08 14:10:13.799606	2016-08-05 22:49:12.275172	252	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4318	2	\N	t	t	2015-04-08 14:08:33.192994	2016-08-05 22:49:12.280627	226	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4311	9	\N	t	t	2015-04-08 14:08:19.573671	2016-08-05 22:49:12.292612	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4364	3	\N	t	t	2015-04-08 14:09:48.783206	2016-08-05 22:49:12.297319	242	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4300	4	\N	t	t	2015-04-08 14:07:52.011435	2016-08-05 22:49:12.302104	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4301	5	\N	t	t	2015-04-08 14:07:53.501734	2016-08-05 22:49:12.307105	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4388	11	\N	t	f	2015-04-08 14:10:26.107054	2016-08-05 22:49:12.312297	252	Property	0	\N	\N	\N	DOC_NONE	0
4390	13	\N	t	f	2015-04-08 14:10:29.104713	2016-08-05 22:49:12.322661	252	Property	0	\N	\N	\N	DOC_NONE	0
4391	14	\N	t	f	2015-04-08 14:10:30.632623	2016-08-05 22:49:12.326867	252	Property	0	\N	\N	\N	DOC_NONE	0
4392	15	\N	t	f	2015-04-08 14:10:32.135517	2016-08-05 22:49:12.331185	252	Property	0	\N	\N	\N	DOC_NONE	0
4393	16	\N	t	f	2015-04-08 14:10:33.629807	2016-08-05 22:49:12.336102	252	Property	0	\N	\N	\N	DOC_NONE	0
107	2	\N	t	t	2015-03-28 10:36:45.889617	2016-08-05 22:49:12.344476	33	Property	0	\N	\N	\N	DOC_AVAILABLE	0
122	3	\N	t	t	2015-03-28 10:37:00.713865	2016-08-05 22:49:12.348491	215	Property	0	\N	\N	\N	DOC_AVAILABLE	0
166	15	\N	t	t	2015-03-28 10:37:36.681287	2016-08-05 22:49:12.356981	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
165	14	\N	t	t	2015-03-28 10:37:36.028184	2016-08-05 22:49:12.362458	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
168	2	\N	t	t	2015-03-28 10:37:38.656962	2016-08-05 22:49:12.373985	166	Property	0	\N	\N	\N	DOC_AVAILABLE	0
205	5	\N	t	t	2015-03-28 10:38:06.52299	2016-08-05 22:49:12.382487	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
204	4	\N	t	t	2015-03-28 10:38:05.855348	2016-08-05 22:49:12.387297	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
203	2	\N	t	t	2015-03-28 10:38:05.188751	2016-08-05 22:49:12.39195	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
227	8	\N	t	t	2015-03-28 10:38:22.248645	2016-08-05 22:49:12.396388	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
252	5	\N	t	t	2015-03-28 10:38:40.789899	2016-08-05 22:49:12.406352	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
264	10	\N	t	t	2015-03-28 10:38:49.424738	2016-08-05 22:49:12.411227	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
262	7	\N	t	t	2015-03-28 10:38:48.054692	2016-08-05 22:49:12.416348	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
261	5	\N	t	t	2015-03-28 10:38:47.414811	2016-08-05 22:49:12.421537	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
9	11	\N	t	t	2015-03-28 10:34:46.932177	2016-08-05 22:49:12.432394	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
20	14	\N	t	t	2015-03-28 10:35:00.339222	2016-08-05 22:49:12.437424	22	Property	0	\N	\N	\N	DOC_AVAILABLE	0
19	7	\N	t	t	2015-03-28 10:34:59.582731	2016-08-05 22:49:12.442354	22	Property	0	\N	\N	\N	DOC_AVAILABLE	0
81	2	\N	t	t	2015-03-28 10:36:18.748221	2016-08-05 22:49:12.447344	73	Property	0	\N	\N	\N	DOC_AVAILABLE	0
89	2	\N	t	t	2015-03-28 10:36:27.386125	2016-08-05 22:49:12.452312	50	Property	0	\N	\N	\N	DOC_AVAILABLE	0
209	12	\N	t	t	2015-03-28 10:38:09.158103	2016-08-05 22:49:12.462801	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
265	11	\N	t	t	2015-03-28 10:38:50.080872	2016-08-05 22:49:12.467816	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
281	13	\N	t	t	2015-03-28 10:39:02.034637	2016-08-05 22:49:12.47283	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
287	4	\N	t	t	2015-03-28 10:39:06.721271	2016-08-05 22:49:12.477851	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
285	2	\N	t	t	2015-03-28 10:39:05.374657	2016-08-05 22:49:12.491148	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
298	2	\N	t	t	2015-03-28 10:39:14.502849	2016-08-05 22:49:12.496718	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
331	7	\N	t	t	2015-03-28 10:39:38.179596	2016-08-05 22:49:12.501959	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
361	14	\N	t	t	2015-03-28 10:40:00.066718	2016-08-05 22:49:12.507109	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
359	10	\N	t	t	2015-03-28 10:39:58.766107	2016-08-05 22:49:12.516996	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
358	8	\N	t	t	2015-03-28 10:39:58.112737	2016-08-05 22:49:12.522064	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
366	5	\N	t	t	2015-03-28 10:40:04.138261	2016-08-05 22:49:12.527002	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
369	11	\N	t	t	2015-03-28 10:40:06.077669	2016-08-05 22:49:12.532236	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
367	7	\N	t	t	2015-03-28 10:40:04.77826	2016-08-05 22:49:12.537689	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
364	3	\N	t	t	2015-03-28 10:40:02.852628	2016-08-05 22:49:12.546785	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
423	2	\N	t	t	2015-03-28 10:40:46.233444	2016-08-05 22:49:12.552607	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
438	7	\N	t	t	2015-03-28 10:40:56.770477	2016-08-05 22:49:12.557755	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
454	13	\N	t	t	2015-03-28 10:41:08.494627	2016-08-05 22:49:12.562877	61	Property	0	\N	\N	\N	DOC_AVAILABLE	0
461	7	\N	t	t	2015-03-28 10:41:13.758591	2016-08-05 22:49:12.572526	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
459	4	\N	t	t	2015-03-28 10:41:12.453177	2016-08-05 22:49:12.577484	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
458	2	\N	t	t	2015-03-28 10:41:11.794634	2016-08-05 22:49:12.583405	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
473	8	\N	t	t	2015-03-28 10:41:22.336959	2016-08-05 22:49:12.588749	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
467	2	\N	t	t	2015-03-28 10:41:18.368433	2016-08-05 22:49:12.59374	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
469	4	\N	t	t	2015-03-28 10:41:19.667739	2016-08-05 22:49:12.604557	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
468	3	\N	t	t	2015-03-28 10:41:19.021694	2016-08-05 22:49:12.612476	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
522	16	\N	t	t	2015-03-28 10:41:58.305826	2016-08-05 22:49:12.617944	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
516	7	\N	t	t	2015-03-28 10:41:54.373999	2016-08-05 22:49:12.623438	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
195	2	\N	t	t	2015-03-28 10:37:59.16346	2016-08-05 22:49:12.635864	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
15	2	\N	t	t	2015-03-28 10:34:56.281567	2016-08-05 22:49:12.641036	21	Property	0	\N	\N	\N	DOC_AVAILABLE	0
556	4	\N	t	f	2015-03-28 10:42:24.771621	2016-08-05 22:49:12.64713	222	Property	0	\N	\N	\N	DOC_NONE	0
560	12	\N	t	f	2015-03-28 10:42:27.414913	2016-08-05 22:49:12.652397	222	Property	0	\N	\N	\N	DOC_NONE	0
562	14	\N	t	f	2015-03-28 10:42:28.71122	2016-08-05 22:49:12.663178	222	Property	0	\N	\N	\N	DOC_NONE	0
164	11	\N	t	f	2015-03-28 10:37:35.378563	2016-08-05 22:49:12.668464	174	Property	0	\N	\N	\N	DOC_NONE	0
554	2	\N	t	t	2015-03-28 10:42:23.325994	2016-08-05 22:49:12.674544	222	Property	0	\N	\N	\N	DOC_AVAILABLE	0
152	7	\N	t	t	2015-03-28 10:37:26.808782	2016-08-05 22:49:12.680603	130	Property	1	\N	\N	\N	DOC_UPLOADED	0
742	8	\N	t	t	2015-03-28 10:44:44.131696	2016-08-05 22:49:12.685838	213	Property	0	\N	\N	\N	DOC_AVAILABLE	0
368	10	\N	t	f	2015-03-28 10:40:05.426056	2016-08-05 22:49:12.699683	169	Property	0	\N	\N	\N	DOC_NONE	0
460	6	\N	t	f	2015-03-28 10:41:13.103648	2016-08-05 22:49:12.704931	49	Property	0	\N	\N	\N	DOC_NONE	0
50	1	\N	t	f	2015-03-28 10:35:35.121687	2016-08-05 22:49:12.710225	66	Property	0	\N	\N	\N	DOC_NONE	0
4394	17	\N	t	f	2015-04-08 14:10:35.116541	2016-08-05 22:49:12.715354	252	Property	0	\N	\N	0	DOC_NONE	0
455	14	\N	t	t	2015-03-28 10:41:09.160468	2016-08-05 22:49:12.721174	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
552	15	\N	t	t	2015-03-28 10:42:20.716855	2016-08-05 22:49:12.733568	29	Property	1	\N	\N	\N	DOC_UPLOADED	0
386	8	\N	t	t	2015-03-28 10:40:18.833576	2016-08-05 22:49:12.738943	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
591	12	\N	t	t	2015-03-28 10:42:49.771751	2016-08-05 22:49:12.755039	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
656	15	\N	t	t	2015-03-28 10:43:37.992088	2016-08-05 22:49:12.767599	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
654	13	\N	t	t	2015-03-28 10:43:36.666165	2016-08-05 22:49:12.773611	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
653	12	\N	t	t	2015-03-28 10:43:36.018807	2016-08-05 22:49:12.779873	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
652	7	\N	t	t	2015-03-28 10:43:35.331318	2016-08-05 22:49:12.785583	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
650	4	\N	t	t	2015-03-28 10:43:34.011096	2016-08-05 22:49:12.797542	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
663	7	\N	t	t	2015-03-28 10:43:43.952501	2016-08-05 22:49:12.803104	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
660	2	\N	t	t	2015-03-28 10:43:41.993983	2016-08-05 22:49:12.808291	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
681	2	\N	t	t	2015-03-28 10:43:57.889101	2016-08-05 22:49:12.814707	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
700	3	\N	t	t	2015-03-28 10:44:12.463512	2016-08-05 22:49:12.819955	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
722	2	\N	t	t	2015-03-28 10:44:29.036934	2016-08-05 22:49:12.831581	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
749	7	\N	t	t	2015-03-28 10:44:49.373174	2016-08-05 22:49:12.83918	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
470	5	\N	t	f	2015-03-28 10:41:20.337456	2016-08-08 02:31:23.815487	10	Property	0	\N	\N	1	DOC_AVAILABLE	0
746	2	\N	t	t	2015-03-28 10:44:47.39644	2016-08-05 22:49:12.850554	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
758	2	\N	t	t	2015-03-28 10:44:56.651767	2016-08-05 22:49:12.856469	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
774	1	\N	t	t	2015-03-28 10:45:09.910072	2016-08-05 22:49:12.861958	236	Property	0	\N	\N	\N	DOC_AVAILABLE	0
179	8	\N	t	t	2015-03-28 10:37:46.618941	2016-08-05 22:49:12.872143	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
224	5	\N	t	t	2015-03-28 10:38:20.286568	2016-08-05 22:49:12.880515	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
276	16	\N	t	t	2015-03-28 10:38:58.052082	2016-08-05 22:49:12.892308	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
301	8	\N	t	t	2015-03-28 10:39:16.462411	2016-08-05 22:49:12.897821	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
308	2	\N	t	t	2015-03-28 10:39:21.766202	2016-08-05 22:49:12.90275	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
444	16	\N	t	t	2015-03-28 10:41:00.685673	2016-08-05 22:49:12.913478	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
502	3	\N	t	t	2015-03-28 10:41:44.542502	2016-08-05 22:49:12.918552	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
530	14	\N	t	t	2015-03-28 10:42:04.283922	2016-08-05 22:49:12.92328	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
578	11	\N	t	t	2015-03-28 10:42:40.574096	2016-08-05 22:49:12.929151	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
633	7	\N	t	t	2015-03-28 10:43:21.366498	2016-08-05 22:49:12.940581	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
679	14	\N	t	t	2015-03-28 10:43:55.924619	2016-08-05 22:49:12.945498	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
677	12	\N	t	t	2015-03-28 10:43:54.612181	2016-08-05 22:49:12.949783	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
714	3	\N	t	t	2015-03-28 10:44:23.081101	2016-08-05 22:49:12.955111	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1051	16	\N	t	t	2015-04-08 12:30:38.946016	2016-08-05 22:49:12.965223	19	Property	1	\N	\N	\N	DOC_UPLOADED	0
175	2	\N	t	t	2015-03-28 10:37:43.994905	2016-08-05 22:49:12.969622	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3734	1	\N	t	t	2015-04-08 13:50:45.160346	2016-08-05 22:49:12.973877	234	Property	0	\N	\N	\N	DOC_AVAILABLE	0
12	2	\N	t	t	2015-03-28 10:34:51.899722	2016-08-05 22:49:12.978542	18	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4262	4	\N	t	t	2015-04-08 14:06:41.593454	2016-08-05 22:49:12.983135	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
176	3	\N	t	t	2015-03-28 10:37:44.647078	2016-08-05 22:49:12.992694	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
445	2	\N	t	t	2015-03-28 10:41:01.998995	2016-08-05 22:49:12.997826	57	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2297	17	\N	t	f	2015-04-08 13:06:50.81227	2016-08-05 22:49:13.004528	123	Property	0	\N	\N	\N	DOC_NONE	0
58	2	\N	t	t	2015-03-28 10:35:43.685602	2016-08-05 22:49:13.013141	125	Property	0	\N	\N	\N	DOC_AVAILABLE	0
724	4	\N	t	t	2015-03-28 10:44:30.396469	2016-08-05 22:49:13.036879	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
936	9	\N	t	f	2015-04-08 12:27:37.040001	2016-08-05 22:49:13.042664	10	Property	0	\N	\N	\N	DOC_NONE	0
248	15	\N	t	t	2015-03-28 10:38:37.452714	2016-08-05 22:49:13.050142	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
480	16	\N	t	t	2015-03-28 10:41:26.942191	2016-08-05 22:49:13.065563	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1038	3	\N	t	t	2015-04-08 12:30:20.608946	2016-08-05 22:49:13.074583	19	Property	1	\N	\N	\N	DOC_UPLOADED	0
2884	4	\N	t	f	2015-04-08 13:25:17.401547	2016-08-05 22:49:13.093613	172	Property	0	\N	\N	\N	DOC_NONE	0
2103	1	\N	t	f	2015-04-08 13:00:31.835047	2016-08-05 22:49:13.099103	106	Property	0	\N	\N	\N	DOC_NONE	0
1459	12	\N	t	t	2015-04-08 12:41:54.094524	2016-08-05 22:49:13.105236	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
316	14	\N	t	t	2015-03-28 10:39:27.027254	2016-08-05 22:49:13.111411	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
853	11	\N	t	f	2015-04-08 12:25:16.424581	2016-08-05 22:49:13.121875	3	Property	0	\N	\N	\N	DOC_NONE	0
877	2	\N	t	f	2015-04-08 12:26:03.942589	2016-08-05 22:49:13.127368	6	Property	0	\N	\N	\N	DOC_NONE	0
891	16	\N	t	f	2015-04-08 12:26:22.59779	2016-08-05 22:49:13.134247	6	Property	0	\N	\N	\N	DOC_NONE	0
915	15	\N	t	f	2015-04-08 12:27:02.687282	2016-08-05 22:49:13.144483	8	Property	0	\N	\N	\N	DOC_NONE	0
1453	6	\N	t	f	2015-04-08 12:41:42.991588	2016-08-05 22:49:13.156366	54	Property	0	\N	\N	\N	DOC_NONE	0
940	5	\N	t	f	2015-04-08 12:27:50.361258	2016-08-05 22:49:13.162061	11	Property	0	\N	\N	\N	DOC_NONE	0
963	11	\N	t	f	2015-04-08 12:28:22.585973	2016-08-05 22:49:13.167038	12	Property	0	\N	\N	\N	DOC_NONE	0
1001	11	\N	t	f	2015-04-08 12:29:24.833814	2016-08-05 22:49:13.171806	16	Property	0	\N	\N	\N	DOC_NONE	0
1025	6	\N	t	f	2015-04-08 12:30:01.620963	2016-08-05 22:49:13.18	18	Property	0	\N	\N	\N	DOC_NONE	0
1076	9	\N	t	f	2015-04-08 12:31:14.462046	2016-08-05 22:49:13.209572	21	Property	0	\N	\N	\N	DOC_NONE	0
692	7	\N	t	t	2015-03-28 10:44:05.844508	2016-08-05 22:49:13.218341	160	Property	1	\N	\N	\N	DOC_UPLOADED	0
135	2	\N	t	t	2015-03-28 10:37:13.915979	2016-08-05 22:49:13.23262	16	Property	1	\N	\N	\N	DOC_UPLOADED	0
546	2	\N	t	t	2015-03-28 10:42:16.770436	2016-08-05 22:49:13.246631	29	Property	1	\N	\N	\N	DOC_UPLOADED	0
223	4	\N	t	t	2015-03-28 10:38:19.643587	2016-08-05 22:49:13.28072	123	Property	1	\N	\N	\N	DOC_UPLOADED	0
1023	4	\N	t	t	2015-04-08 12:29:58.911404	2016-08-05 22:49:13.293669	18	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4041	1	\N	t	f	2015-04-08 13:59:51.833934	2016-08-16 00:41:06.937681	52	Property	0	\N	\N	\N	DOC_UPLOADED	0
748	4	\N	t	f	2015-03-28 10:44:48.68543	2016-08-05 22:49:13.324703	194	Property	0	\N	\N	\N	DOC_NONE	0
3701	2	\N	t	t	2015-04-08 13:49:52.751552	2016-08-05 22:49:13.336655	232	Property	0	\N	\N	\N	DOC_AVAILABLE	0
154	10	\N	t	f	2015-03-28 10:37:28.141036	2016-08-05 22:49:13.347108	130	Property	0	\N	\N	\N	DOC_NONE	0
1169	1	\N	t	f	2015-04-08 12:33:38.140931	2016-08-05 22:49:13.35289	29	Property	0	\N	\N	\N	DOC_NONE	0
507	9	\N	t	t	2015-03-28 10:41:47.803446	2016-08-05 22:49:13.358078	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
417	11	\N	t	t	2015-03-28 10:40:41.647748	2016-08-05 22:49:13.363333	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
1113	4	\N	t	f	2015-04-08 12:32:11.937911	2016-08-05 22:49:13.373765	24	Property	0	\N	\N	\N	DOC_NONE	0
1136	12	\N	t	f	2015-04-08 12:32:45.048742	2016-08-05 22:49:13.378856	25	Property	0	\N	\N	\N	DOC_NONE	0
1146	7	\N	t	f	2015-04-08 12:33:00.934161	2016-08-05 22:49:13.384037	27	Property	0	\N	\N	\N	DOC_NONE	0
1147	9	\N	t	f	2015-04-08 12:33:03.09398	2016-08-05 22:49:13.389389	27	Property	0	\N	\N	\N	DOC_NONE	0
1149	11	\N	t	f	2015-04-08 12:33:05.734016	2016-08-05 22:49:13.400737	27	Property	0	\N	\N	\N	DOC_NONE	0
1150	12	\N	t	f	2015-04-08 12:33:07.054034	2016-08-05 22:49:13.405825	27	Property	0	\N	\N	\N	DOC_NONE	0
1151	13	\N	t	f	2015-04-08 12:33:08.371296	2016-08-05 22:49:13.410985	27	Property	0	\N	\N	\N	DOC_NONE	0
1152	14	\N	t	f	2015-04-08 12:33:10.063224	2016-08-05 22:49:13.416239	27	Property	0	\N	\N	\N	DOC_NONE	0
1153	15	\N	t	f	2015-04-08 12:33:11.386249	2016-08-05 22:49:13.422163	27	Property	0	\N	\N	\N	DOC_NONE	0
1155	17	\N	t	f	2015-04-08 12:33:14.398825	2016-08-05 22:49:13.433163	27	Property	0	\N	\N	\N	DOC_NONE	0
1156	1	\N	t	f	2015-04-08 12:33:15.888907	2016-08-05 22:49:13.438013	28	Property	0	\N	\N	\N	DOC_NONE	0
1157	4	\N	t	f	2015-04-08 12:33:19.247447	2016-08-05 22:49:13.44428	28	Property	0	\N	\N	\N	DOC_NONE	0
1158	5	\N	t	f	2015-04-08 12:33:20.572862	2016-08-05 22:49:13.45018	28	Property	0	\N	\N	\N	DOC_NONE	0
1161	8	\N	t	f	2015-04-08 12:33:24.536045	2016-08-05 22:49:13.463446	28	Property	0	\N	\N	\N	DOC_NONE	0
1162	10	\N	t	f	2015-04-08 12:33:27.099309	2016-08-05 22:49:13.473214	28	Property	0	\N	\N	\N	DOC_NONE	0
1164	12	\N	t	f	2015-04-08 12:33:29.752935	2016-08-05 22:49:13.492777	28	Property	0	\N	\N	\N	DOC_NONE	0
1165	13	\N	t	f	2015-04-08 12:33:31.09244	2016-08-05 22:49:13.500636	28	Property	0	\N	\N	\N	DOC_NONE	0
1166	15	\N	t	f	2015-04-08 12:33:33.620536	2016-08-05 22:49:13.51108	28	Property	0	\N	\N	\N	DOC_NONE	0
1168	17	\N	t	f	2015-04-08 12:33:36.641824	2016-08-05 22:49:13.52581	28	Property	0	\N	\N	\N	DOC_NONE	0
1170	4	\N	t	f	2015-04-08 12:33:41.118858	2016-08-05 22:49:13.534329	29	Property	0	\N	\N	\N	DOC_NONE	0
1171	5	\N	t	f	2015-04-08 12:33:42.444256	2016-08-05 22:49:13.540199	29	Property	0	\N	\N	\N	DOC_NONE	0
1172	6	\N	t	f	2015-04-08 12:33:43.790129	2016-08-05 22:49:13.549144	29	Property	0	\N	\N	\N	DOC_NONE	0
1173	8	\N	t	f	2015-04-08 12:33:45.947685	2016-08-05 22:49:13.560447	29	Property	0	\N	\N	\N	DOC_NONE	0
1175	10	\N	t	f	2015-04-08 12:33:48.595794	2016-08-05 22:49:13.579169	29	Property	0	\N	\N	\N	DOC_NONE	0
1176	11	\N	t	f	2015-04-08 12:33:49.920229	2016-08-05 22:49:13.584854	29	Property	0	\N	\N	\N	DOC_NONE	0
1178	1	\N	t	f	2015-04-08 12:33:57.667732	2016-08-05 22:49:13.596332	30	Property	0	\N	\N	\N	DOC_NONE	0
1180	8	\N	t	f	2015-04-08 12:34:04.533871	2016-08-05 22:49:13.603503	30	Property	0	\N	\N	\N	DOC_NONE	0
1183	11	\N	t	f	2015-04-08 12:34:08.49151	2016-08-05 22:49:13.619528	30	Property	0	\N	\N	\N	DOC_NONE	0
1184	17	\N	t	f	2015-04-08 12:34:13.940626	2016-08-05 22:49:13.625101	30	Property	0	\N	\N	\N	DOC_NONE	0
1185	1	\N	t	f	2015-04-08 12:34:15.426309	2016-08-05 22:49:13.639905	31	Property	0	\N	\N	\N	DOC_NONE	0
1186	4	\N	t	f	2015-04-08 12:34:18.432661	2016-08-05 22:49:13.646106	31	Property	0	\N	\N	\N	DOC_NONE	0
1188	6	\N	t	f	2015-04-08 12:34:21.101228	2016-08-05 22:49:13.672845	31	Property	0	\N	\N	\N	DOC_NONE	0
1189	10	\N	t	f	2015-04-08 12:34:24.917669	2016-08-05 22:49:13.681549	31	Property	0	\N	\N	\N	DOC_NONE	0
1191	17	\N	t	f	2015-04-08 12:34:32.171711	2016-08-05 22:49:13.689169	31	Property	0	\N	\N	\N	DOC_NONE	0
1193	4	\N	t	f	2015-04-08 12:34:36.710402	2016-08-05 22:49:13.693846	32	Property	0	\N	\N	\N	DOC_NONE	0
1195	6	\N	t	f	2015-04-08 12:34:39.353145	2016-08-05 22:49:13.704974	32	Property	0	\N	\N	\N	DOC_NONE	0
1197	8	\N	t	f	2015-04-08 12:34:42.002907	2016-08-05 22:49:13.729446	32	Property	0	\N	\N	\N	DOC_NONE	0
1198	9	\N	t	f	2015-04-08 12:34:43.361195	2016-08-05 22:49:13.737744	32	Property	0	\N	\N	\N	DOC_NONE	0
1199	10	\N	t	f	2015-04-08 12:34:44.677939	2016-08-05 22:49:13.745878	32	Property	0	\N	\N	\N	DOC_NONE	0
1200	11	\N	t	f	2015-04-08 12:34:46.398345	2016-08-05 22:49:13.751873	32	Property	0	\N	\N	\N	DOC_NONE	0
1202	13	\N	t	f	2015-04-08 12:34:49.088043	2016-08-05 22:49:13.766028	32	Property	0	\N	\N	\N	DOC_NONE	0
1203	14	\N	t	f	2015-04-08 12:34:50.43416	2016-08-05 22:49:13.772537	32	Property	0	\N	\N	\N	DOC_NONE	0
1204	15	\N	t	f	2015-04-08 12:34:51.774968	2016-08-05 22:49:13.792778	32	Property	0	\N	\N	\N	DOC_NONE	0
1205	16	\N	t	f	2015-04-08 12:34:53.11537	2016-08-05 22:49:13.803874	32	Property	0	\N	\N	\N	DOC_NONE	0
1208	4	\N	t	f	2015-04-08 12:34:59.291431	2016-08-05 22:49:13.812633	33	Property	0	\N	\N	\N	DOC_NONE	0
1265	6	\N	t	f	2015-04-08 12:36:28.470203	2016-08-05 22:49:13.824596	37	Property	0	\N	\N	\N	DOC_NONE	0
1273	3	\N	t	f	2015-04-08 12:36:44.185307	2016-08-05 22:49:13.83159	38	Property	0	\N	\N	\N	DOC_NONE	0
1319	9	\N	t	f	2015-04-08 12:37:56.019551	2016-08-05 22:49:13.835901	42	Property	0	\N	\N	\N	DOC_NONE	0
1338	10	\N	t	f	2015-04-08 12:38:35.828705	2016-08-05 22:49:13.840393	44	Property	0	\N	\N	\N	DOC_NONE	0
1384	16	\N	t	f	2015-04-08 12:39:48.372698	2016-08-05 22:49:13.8491	47	Property	0	\N	\N	\N	DOC_NONE	0
77	1	\N	t	t	2015-03-28 10:36:14.130658	2016-08-05 22:49:13.852822	172	Property	0	\N	\N	\N	DOC_AVAILABLE	0
99	2	\N	t	t	2015-03-28 10:36:38.006085	2016-08-05 22:49:13.856933	251	Property	0	\N	\N	\N	DOC_AVAILABLE	0
130	3	\N	t	t	2015-03-28 10:37:08.701317	2016-08-05 22:49:13.86211	219	Property	0	\N	\N	\N	DOC_AVAILABLE	0
283	15	\N	t	t	2015-03-28 10:39:03.413392	2016-08-05 22:49:13.878954	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
341	11	\N	t	t	2015-03-28 10:39:45.552013	2016-08-05 22:49:13.883048	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
397	11	\N	t	t	2015-03-28 10:40:26.701977	2016-08-05 22:49:13.89149	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
437	5	\N	t	t	2015-03-28 10:40:56.120193	2016-08-05 22:49:13.896804	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1177	17	\N	t	t	2015-04-08 12:33:56.1731	2016-08-05 22:49:13.9163	29	Property	0	\N	\N	\N	DOC_AVAILABLE	0
446	3	\N	t	t	2015-03-28 10:41:02.651752	2016-08-05 22:49:13.922564	57	Property	1	\N	\N	\N	DOC_UPLOADED	0
1179	6	\N	t	t	2015-04-08 12:34:02.385371	2016-08-05 22:49:13.927088	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1182	10	\N	t	t	2015-04-08 12:34:07.172525	2016-08-05 22:49:13.935421	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1206	17	\N	t	t	2015-04-08 12:34:54.449213	2016-08-05 22:49:13.948477	32	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1207	1	\N	t	t	2015-04-08 12:34:55.935658	2016-08-05 22:49:13.953571	33	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1296	16	\N	t	t	2015-04-08 12:37:20.873243	2016-08-05 22:49:13.963117	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1190	16	\N	t	t	2015-04-08 12:34:30.826467	2016-08-05 22:49:13.971033	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
76	13	\N	t	f	2015-03-28 10:36:12.79262	2016-08-05 22:49:13.976257	171	Property	0	\N	\N	\N	DOC_NONE	0
178	7	\N	t	f	2015-03-28 10:37:45.953161	2016-08-05 22:49:13.98888	91	Property	0	\N	\N	\N	DOC_NONE	0
1512	17	\N	t	t	2015-04-08 12:43:13.132975	2016-08-05 22:49:13.998928	57	Property	1	\N	\N	\N	DOC_UPLOADED	0
627	8	\N	t	t	2015-03-28 10:43:16.681957	2016-08-05 22:49:14.003413	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
697	12	\N	t	t	2015-03-28 10:44:09.820448	2016-08-05 22:49:14.013912	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1550	9	\N	t	f	2015-04-08 12:44:16.020735	2016-08-05 22:49:14.018761	60	Property	0	\N	\N	\N	DOC_NONE	0
727	12	\N	t	t	2015-03-28 10:44:32.359343	2016-08-05 22:49:14.022836	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
753	2	\N	t	t	2015-03-28 10:44:52.599047	2016-08-05 22:49:14.026934	13	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1613	7	\N	t	f	2015-04-08 12:46:03.154934	2016-08-05 22:49:14.036769	66	Property	0	\N	\N	\N	DOC_NONE	0
1625	3	\N	t	f	2015-04-08 12:46:22.274262	2016-08-05 22:49:14.041624	67	Property	0	\N	\N	\N	DOC_NONE	0
1651	6	\N	t	f	2015-04-08 12:47:12.958082	2016-08-05 22:49:14.047248	69	Property	0	\N	\N	\N	DOC_NONE	0
1652	8	\N	t	f	2015-04-08 12:47:15.433922	2016-08-05 22:49:14.052047	69	Property	0	\N	\N	\N	DOC_NONE	0
1702	12	\N	t	f	2015-04-08 12:48:54.490651	2016-08-05 22:49:14.056891	73	Property	0	\N	\N	\N	DOC_NONE	0
1745	14	\N	t	f	2015-04-08 12:50:09.235781	2016-08-05 22:49:14.068309	76	Property	0	\N	\N	\N	DOC_NONE	0
1768	13	\N	t	f	2015-04-08 12:50:54.545919	2016-08-05 22:49:14.073769	79	Property	0	\N	\N	\N	DOC_NONE	0
1811	12	\N	t	f	2015-04-08 12:52:23.645934	2016-08-05 22:49:14.079045	83	Property	0	\N	\N	\N	DOC_NONE	0
1857	16	\N	t	f	2015-04-08 12:53:44.346463	2016-08-05 22:49:14.084174	86	Property	0	\N	\N	\N	DOC_NONE	0
1898	6	\N	t	f	2015-04-08 12:54:47.507753	2016-08-05 22:49:14.093607	89	Property	0	\N	\N	\N	DOC_NONE	0
1899	7	\N	t	f	2015-04-08 12:54:49.370317	2016-08-05 22:49:14.098317	89	Property	0	\N	\N	\N	DOC_NONE	0
1901	9	\N	t	f	2015-04-08 12:54:52.342992	2016-08-05 22:49:14.109549	89	Property	0	\N	\N	\N	DOC_NONE	0
1902	10	\N	t	f	2015-04-08 12:54:53.835392	2016-08-05 22:49:14.114972	89	Property	0	\N	\N	\N	DOC_NONE	0
1903	11	\N	t	f	2015-04-08 12:54:55.338898	2016-08-05 22:49:14.119527	89	Property	0	\N	\N	\N	DOC_NONE	0
1905	13	\N	t	f	2015-04-08 12:54:58.691332	2016-08-05 22:49:14.128389	89	Property	0	\N	\N	\N	DOC_NONE	0
1906	14	\N	t	f	2015-04-08 12:55:00.17807	2016-08-05 22:49:14.132142	89	Property	0	\N	\N	\N	DOC_NONE	0
1907	15	\N	t	f	2015-04-08 12:55:01.677046	2016-08-05 22:49:14.136409	89	Property	0	\N	\N	\N	DOC_NONE	0
1908	16	\N	t	f	2015-04-08 12:55:03.163788	2016-08-05 22:49:14.141372	89	Property	0	\N	\N	\N	DOC_NONE	0
1909	17	\N	t	f	2015-04-08 12:55:04.648813	2016-08-05 22:49:14.145449	89	Property	0	\N	\N	\N	DOC_NONE	0
1911	4	\N	t	f	2015-04-08 12:55:09.875776	2016-08-05 22:49:14.155095	90	Property	0	\N	\N	\N	DOC_NONE	0
1912	5	\N	t	f	2015-04-08 12:55:11.758224	2016-08-05 22:49:14.159829	90	Property	0	\N	\N	\N	DOC_NONE	0
1913	6	\N	t	f	2015-04-08 12:55:13.238483	2016-08-05 22:49:14.16374	90	Property	0	\N	\N	\N	DOC_NONE	0
1914	9	\N	t	f	2015-04-08 12:55:16.703249	2016-08-05 22:49:14.167845	90	Property	0	\N	\N	\N	DOC_NONE	0
1917	16	\N	t	f	2015-04-08 12:55:25.3563	2016-08-05 22:49:14.177117	90	Property	0	\N	\N	\N	DOC_NONE	0
1918	17	\N	t	f	2015-04-08 12:55:26.839216	2016-08-05 22:49:14.181181	90	Property	0	\N	\N	\N	DOC_NONE	0
1919	1	\N	t	f	2015-04-08 12:55:28.50544	2016-08-05 22:49:14.185019	92	Property	0	\N	\N	\N	DOC_NONE	0
1920	5	\N	t	f	2015-04-08 12:55:33.035913	2016-08-05 22:49:14.188769	92	Property	0	\N	\N	\N	DOC_NONE	0
1922	7	\N	t	f	2015-04-08 12:55:36.047373	2016-08-05 22:49:14.197459	92	Property	0	\N	\N	\N	DOC_NONE	0
1923	8	\N	t	f	2015-04-08 12:55:37.568785	2016-08-05 22:49:14.201149	92	Property	0	\N	\N	\N	DOC_NONE	0
1924	9	\N	t	f	2015-04-08 12:55:39.062082	2016-08-05 22:49:14.204924	92	Property	0	\N	\N	\N	DOC_NONE	0
1925	10	\N	t	f	2015-04-08 12:55:40.551868	2016-08-05 22:49:14.208517	92	Property	0	\N	\N	\N	DOC_NONE	0
1926	11	\N	t	f	2015-04-08 12:55:42.033925	2016-08-05 22:49:14.212192	92	Property	0	\N	\N	\N	DOC_NONE	0
1928	13	\N	t	f	2015-04-08 12:55:45.013954	2016-08-05 22:49:14.219877	92	Property	0	\N	\N	\N	DOC_NONE	0
1929	14	\N	t	f	2015-04-08 12:55:46.500412	2016-08-05 22:49:14.223625	92	Property	0	\N	\N	\N	DOC_NONE	0
1930	15	\N	t	f	2015-04-08 12:55:47.990834	2016-08-05 22:49:14.227362	92	Property	0	\N	\N	\N	DOC_NONE	0
1931	16	\N	t	f	2015-04-08 12:55:49.482068	2016-08-05 22:49:14.231096	92	Property	0	\N	\N	\N	DOC_NONE	0
1933	1	\N	t	f	2015-04-08 12:55:52.63593	2016-08-05 22:49:14.238791	93	Property	0	\N	\N	\N	DOC_NONE	0
1934	2	\N	t	f	2015-04-08 12:55:54.133128	2016-08-05 22:49:14.24244	93	Property	0	\N	\N	\N	DOC_NONE	0
1935	3	\N	t	f	2015-04-08 12:55:55.621871	2016-08-05 22:49:14.24617	93	Property	0	\N	\N	\N	DOC_NONE	0
1936	4	\N	t	f	2015-04-08 12:55:57.103333	2016-08-05 22:49:14.249774	93	Property	0	\N	\N	\N	DOC_NONE	0
1937	5	\N	t	f	2015-04-08 12:55:58.638298	2016-08-05 22:49:14.253499	93	Property	0	\N	\N	\N	DOC_NONE	0
1939	7	\N	t	f	2015-04-08 12:56:02.261627	2016-08-05 22:49:14.261029	93	Property	0	\N	\N	\N	DOC_NONE	0
1940	8	\N	t	f	2015-04-08 12:56:03.745075	2016-08-05 22:49:14.264705	93	Property	0	\N	\N	\N	DOC_NONE	0
1941	9	\N	t	f	2015-04-08 12:56:05.656907	2016-08-05 22:49:14.268533	93	Property	0	\N	\N	\N	DOC_NONE	0
1942	10	\N	t	f	2015-04-08 12:56:07.161001	2016-08-05 22:49:14.272189	93	Property	0	\N	\N	\N	DOC_NONE	0
1944	12	\N	t	f	2015-04-08 12:56:10.204779	2016-08-05 22:49:14.280368	93	Property	0	\N	\N	\N	DOC_NONE	0
1945	13	\N	t	f	2015-04-08 12:56:11.742673	2016-08-05 22:49:14.284163	93	Property	0	\N	\N	\N	DOC_NONE	0
1946	14	\N	t	f	2015-04-08 12:56:13.232269	2016-08-05 22:49:14.287983	93	Property	0	\N	\N	\N	DOC_NONE	0
1947	15	\N	t	f	2015-04-08 12:56:14.732204	2016-08-05 22:49:14.291616	93	Property	0	\N	\N	\N	DOC_NONE	0
1949	17	\N	t	f	2015-04-08 12:56:17.734498	2016-08-05 22:49:14.300032	93	Property	0	\N	\N	\N	DOC_NONE	0
1950	1	\N	t	f	2015-04-08 12:56:19.394655	2016-08-05 22:49:14.303658	95	Property	0	\N	\N	\N	DOC_NONE	0
347	8	\N	t	f	2015-03-28 10:39:50.239733	2016-08-24 01:00:01.631877	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
1951	4	\N	t	f	2015-04-08 12:56:22.870613	2016-08-05 22:49:14.307472	95	Property	0	\N	\N	\N	DOC_NONE	0
1952	5	\N	t	f	2015-04-08 12:56:24.356933	2016-08-05 22:49:14.311446	95	Property	0	\N	\N	\N	DOC_NONE	0
1953	6	\N	t	f	2015-04-08 12:56:25.840126	2016-08-05 22:49:14.315055	95	Property	0	\N	\N	\N	DOC_NONE	0
1955	9	\N	t	f	2015-04-08 12:56:29.804683	2016-08-05 22:49:14.322495	95	Property	0	\N	\N	\N	DOC_NONE	0
1956	10	\N	t	f	2015-04-08 12:56:31.290275	2016-08-05 22:49:14.326266	95	Property	0	\N	\N	\N	DOC_NONE	0
1957	11	\N	t	f	2015-04-08 12:56:32.769354	2016-08-05 22:49:14.32999	95	Property	0	\N	\N	\N	DOC_NONE	0
1958	12	\N	t	f	2015-04-08 12:56:34.251711	2016-08-05 22:49:14.333639	95	Property	0	\N	\N	\N	DOC_NONE	0
1960	14	\N	t	f	2015-04-08 12:56:37.227453	2016-08-05 22:49:14.34109	95	Property	0	\N	\N	\N	DOC_NONE	0
1961	15	\N	t	f	2015-04-08 12:56:38.70993	2016-08-05 22:49:14.344759	95	Property	0	\N	\N	\N	DOC_NONE	0
1962	16	\N	t	f	2015-04-08 12:56:40.19442	2016-08-05 22:49:14.35001	95	Property	0	\N	\N	\N	DOC_NONE	0
1915	10	\N	t	t	2015-04-08 12:55:18.187035	2016-08-05 22:49:14.354287	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1791	3	\N	t	t	2015-04-08 12:51:30.617372	2016-08-05 22:49:14.358455	81	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1567	2	\N	t	t	2015-04-08 12:44:48.510196	2016-08-05 22:49:14.366795	62	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1964	2	\N	t	f	2015-04-08 12:56:44.372428	2016-08-05 22:49:14.371418	96	Property	0	\N	\N	\N	DOC_NONE	0
1965	3	\N	t	f	2015-04-08 12:56:45.856527	2016-08-05 22:49:14.375422	96	Property	0	\N	\N	\N	DOC_NONE	0
1966	4	\N	t	f	2015-04-08 12:56:47.34297	2016-08-05 22:49:14.379992	96	Property	0	\N	\N	\N	DOC_NONE	0
1968	6	\N	t	f	2015-04-08 12:56:50.319333	2016-08-05 22:49:14.388977	96	Property	0	\N	\N	\N	DOC_NONE	0
1969	7	\N	t	f	2015-04-08 12:56:51.851241	2016-08-05 22:49:14.393622	96	Property	0	\N	\N	\N	DOC_NONE	0
1970	8	\N	t	f	2015-04-08 12:56:53.716339	2016-08-05 22:49:14.397425	96	Property	0	\N	\N	\N	DOC_NONE	0
1971	9	\N	t	f	2015-04-08 12:56:55.571819	2016-08-05 22:49:14.401336	96	Property	0	\N	\N	\N	DOC_NONE	0
1973	11	\N	t	f	2015-04-08 12:56:58.553499	2016-08-05 22:49:14.409544	96	Property	0	\N	\N	\N	DOC_NONE	0
1974	12	\N	t	f	2015-04-08 12:57:00.038997	2016-08-05 22:49:14.414235	96	Property	0	\N	\N	\N	DOC_NONE	0
1975	13	\N	t	f	2015-04-08 12:57:01.900587	2016-08-05 22:49:14.418204	96	Property	0	\N	\N	\N	DOC_NONE	0
1976	14	\N	t	f	2015-04-08 12:57:03.772019	2016-08-05 22:49:14.42196	96	Property	0	\N	\N	\N	DOC_NONE	0
1977	15	\N	t	f	2015-04-08 12:57:05.259649	2016-08-05 22:49:14.425658	96	Property	0	\N	\N	\N	DOC_NONE	0
2077	3	\N	t	f	2015-04-08 12:59:44.632276	2016-08-05 22:49:14.433304	103	Property	0	\N	\N	\N	DOC_NONE	0
2100	15	\N	t	f	2015-04-08 13:00:27.163669	2016-08-05 22:49:14.437294	186	Property	0	\N	\N	\N	DOC_NONE	0
2124	8	\N	t	f	2015-04-08 13:01:24.698097	2016-08-05 22:49:14.441571	108	Property	0	\N	\N	\N	DOC_NONE	0
2147	8	\N	t	f	2015-04-08 13:02:11.344964	2016-08-05 22:49:14.446545	110	Property	0	\N	\N	\N	DOC_NONE	0
2190	6	\N	t	f	2015-04-08 13:03:39.947771	2016-08-05 22:49:14.455317	114	Property	0	\N	\N	\N	DOC_NONE	0
2213	12	\N	t	f	2015-04-08 13:04:15.82642	2016-08-05 22:49:14.45923	115	Property	0	\N	\N	\N	DOC_NONE	0
2232	14	\N	t	f	2015-04-08 13:04:45.756956	2016-08-05 22:49:14.467537	116	Property	0	\N	\N	\N	DOC_NONE	0
2233	15	\N	t	f	2015-04-08 13:04:47.273047	2016-08-05 22:49:14.471446	116	Property	0	\N	\N	\N	DOC_NONE	0
2249	14	\N	t	f	2015-04-08 13:05:12.293442	2016-08-05 22:49:14.475265	117	Property	0	\N	\N	\N	DOC_NONE	0
2252	17	\N	t	f	2015-04-08 13:05:17.651711	2016-08-05 22:49:14.482802	117	Property	0	\N	\N	\N	DOC_NONE	0
2253	1	\N	t	f	2015-04-08 13:05:19.307403	2016-08-05 22:49:14.486869	119	Property	0	\N	\N	\N	DOC_NONE	0
2255	4	\N	t	f	2015-04-08 13:05:23.324654	2016-08-05 22:49:14.491018	119	Property	0	\N	\N	\N	DOC_NONE	0
2256	5	\N	t	f	2015-04-08 13:05:24.823617	2016-08-05 22:49:14.494865	119	Property	0	\N	\N	\N	DOC_NONE	0
2257	6	\N	t	f	2015-04-08 13:05:26.330173	2016-08-05 22:49:14.499497	119	Property	0	\N	\N	\N	DOC_NONE	0
2259	9	\N	t	f	2015-04-08 13:05:30.687981	2016-08-05 22:49:14.507826	119	Property	0	\N	\N	\N	DOC_NONE	0
2260	10	\N	t	f	2015-04-08 13:05:32.180677	2016-08-05 22:49:14.512721	119	Property	0	\N	\N	\N	DOC_NONE	0
2261	11	\N	t	f	2015-04-08 13:05:33.676977	2016-08-05 22:49:14.516883	119	Property	0	\N	\N	\N	DOC_NONE	0
2262	12	\N	t	f	2015-04-08 13:05:35.173768	2016-08-05 22:49:14.520814	119	Property	0	\N	\N	\N	DOC_NONE	0
2265	15	\N	t	f	2015-04-08 13:05:39.675644	2016-08-05 22:49:14.528988	119	Property	0	\N	\N	\N	DOC_NONE	0
2266	16	\N	t	f	2015-04-08 13:05:41.184614	2016-08-05 22:49:14.532747	119	Property	0	\N	\N	\N	DOC_NONE	0
2267	17	\N	t	f	2015-04-08 13:05:42.681136	2016-08-05 22:49:14.536386	119	Property	0	\N	\N	\N	DOC_NONE	0
2268	2	\N	t	f	2015-04-08 13:05:45.707606	2016-08-05 22:49:14.540367	121	Property	0	\N	\N	\N	DOC_NONE	0
2271	5	\N	t	f	2015-04-08 13:05:50.205229	2016-08-05 22:49:14.54781	121	Property	0	\N	\N	\N	DOC_NONE	0
2272	6	\N	t	f	2015-04-08 13:05:51.710844	2016-08-05 22:49:14.552145	121	Property	0	\N	\N	\N	DOC_NONE	0
2273	7	\N	t	f	2015-04-08 13:05:53.194399	2016-08-05 22:49:14.55741	121	Property	0	\N	\N	\N	DOC_NONE	0
2274	8	\N	t	f	2015-04-08 13:05:54.704232	2016-08-05 22:49:14.561842	121	Property	0	\N	\N	\N	DOC_NONE	0
2275	9	\N	t	f	2015-04-08 13:05:56.205089	2016-08-05 22:49:14.566321	121	Property	0	\N	\N	\N	DOC_NONE	0
2277	11	\N	t	f	2015-04-08 13:05:59.198197	2016-08-05 22:49:14.577265	121	Property	0	\N	\N	\N	DOC_NONE	0
2278	12	\N	t	f	2015-04-08 13:06:00.810721	2016-08-05 22:49:14.582406	121	Property	0	\N	\N	\N	DOC_NONE	0
2279	13	\N	t	f	2015-04-08 13:06:02.301396	2016-08-05 22:49:14.587474	121	Property	0	\N	\N	\N	DOC_NONE	0
2280	14	\N	t	f	2015-04-08 13:06:03.790863	2016-08-05 22:49:14.593042	121	Property	0	\N	\N	\N	DOC_NONE	0
2282	16	\N	t	f	2015-04-08 13:06:07.163257	2016-08-05 22:49:14.601789	121	Property	0	\N	\N	\N	DOC_NONE	0
2283	17	\N	t	f	2015-04-08 13:06:08.662527	2016-08-05 22:49:14.606491	121	Property	0	\N	\N	\N	DOC_NONE	0
2284	1	\N	t	f	2015-04-08 13:06:10.333876	2016-08-05 22:49:14.61091	122	Property	0	\N	\N	\N	DOC_NONE	0
2285	4	\N	t	f	2015-04-08 13:06:13.827052	2016-08-05 22:49:14.615838	122	Property	0	\N	\N	\N	DOC_NONE	0
2286	5	\N	t	f	2015-04-08 13:06:15.322259	2016-08-05 22:49:14.62143	122	Property	0	\N	\N	\N	DOC_NONE	0
2288	9	\N	t	f	2015-04-08 13:06:20.719966	2016-08-05 22:49:14.632661	122	Property	0	\N	\N	\N	DOC_NONE	0
2290	11	\N	t	f	2015-04-08 13:06:23.722062	2016-08-05 22:49:14.638092	122	Property	0	\N	\N	\N	DOC_NONE	0
2291	17	\N	t	f	2015-04-08 13:06:30.591376	2016-08-05 22:49:14.642758	122	Property	0	\N	\N	\N	DOC_NONE	0
2325	14	\N	t	f	2015-04-08 13:07:36.645734	2016-08-05 22:49:14.647603	125	Property	0	\N	\N	\N	DOC_NONE	0
2368	17	\N	t	f	2015-04-08 13:08:54.31414	2016-08-05 22:49:14.655701	129	Property	0	\N	\N	\N	DOC_NONE	0
2391	17	\N	t	f	2015-04-08 13:09:41.406355	2016-08-05 22:49:14.659356	144	Property	0	\N	\N	\N	DOC_NONE	0
2414	8	\N	t	f	2015-04-08 13:10:19.190635	2016-08-05 22:49:14.663042	133	Property	0	\N	\N	\N	DOC_NONE	0
2434	9	\N	t	f	2015-04-08 13:11:08.166155	2016-08-05 22:49:14.667149	135	Property	0	\N	\N	\N	DOC_NONE	0
2466	6	\N	t	f	2015-04-08 13:12:17.92296	2016-08-05 22:49:14.674764	138	Property	0	\N	\N	\N	DOC_NONE	0
2467	7	\N	t	f	2015-04-08 13:12:19.811971	2016-08-05 22:49:14.678992	138	Property	0	\N	\N	\N	DOC_NONE	0
2468	8	\N	t	f	2015-04-08 13:12:21.394746	2016-08-05 22:49:14.683095	138	Property	0	\N	\N	\N	DOC_NONE	0
2469	9	\N	t	f	2015-04-08 13:12:22.904403	2016-08-05 22:49:14.686987	138	Property	0	\N	\N	\N	DOC_NONE	0
2470	10	\N	t	f	2015-04-08 13:12:24.413478	2016-08-05 22:49:14.690676	138	Property	0	\N	\N	\N	DOC_NONE	0
2472	12	\N	t	f	2015-04-08 13:12:27.812731	2016-08-05 22:49:14.69955	138	Property	0	\N	\N	\N	DOC_NONE	0
2473	13	\N	t	f	2015-04-08 13:12:29.311343	2016-08-05 22:49:14.703342	138	Property	0	\N	\N	\N	DOC_NONE	0
2474	14	\N	t	f	2015-04-08 13:12:30.839204	2016-08-05 22:49:14.707022	138	Property	0	\N	\N	\N	DOC_NONE	0
2475	15	\N	t	f	2015-04-08 13:12:32.337551	2016-08-05 22:49:14.710895	138	Property	0	\N	\N	\N	DOC_NONE	0
2477	17	\N	t	f	2015-04-08 13:12:35.342926	2016-08-05 22:49:14.718985	138	Property	0	\N	\N	\N	DOC_NONE	0
2478	1	\N	t	f	2015-04-08 13:12:37.00428	2016-08-05 22:49:14.724526	139	Property	0	\N	\N	\N	DOC_NONE	0
2289	10	\N	t	t	2015-04-08 13:06:22.221548	2016-08-05 22:49:14.72844	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2264	14	\N	t	t	2015-04-08 13:05:38.180971	2016-08-05 22:49:14.733344	119	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2254	3	\N	t	t	2015-04-08 13:05:21.819583	2016-08-05 22:49:14.738965	119	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2481	4	\N	t	f	2015-04-08 13:12:41.559659	2016-08-05 22:49:14.750858	139	Property	0	\N	\N	\N	DOC_NONE	0
2482	5	\N	t	f	2015-04-08 13:12:43.097467	2016-08-05 22:49:14.755033	139	Property	0	\N	\N	\N	DOC_NONE	0
2483	6	\N	t	f	2015-04-08 13:12:44.587052	2016-08-05 22:49:14.759692	139	Property	0	\N	\N	\N	DOC_NONE	0
2484	7	\N	t	f	2015-04-08 13:12:46.077914	2016-08-05 22:49:14.766192	139	Property	0	\N	\N	\N	DOC_NONE	0
2486	9	\N	t	f	2015-04-08 13:12:49.095623	2016-08-05 22:49:14.778154	139	Property	0	\N	\N	\N	DOC_NONE	0
2487	10	\N	t	f	2015-04-08 13:12:50.600368	2016-08-05 22:49:14.78246	139	Property	0	\N	\N	\N	DOC_NONE	0
2503	1	\N	t	f	2015-04-08 13:13:25.29059	2016-08-05 22:49:14.787251	141	Property	0	\N	\N	\N	DOC_NONE	0
2546	4	\N	t	f	2015-04-08 13:14:44.337931	2016-08-05 22:49:14.791779	146	Property	0	\N	\N	\N	DOC_NONE	0
2592	16	\N	t	f	2015-04-08 13:15:55.022764	2016-08-05 22:49:14.801048	148	Property	0	\N	\N	\N	DOC_NONE	0
2611	2	\N	t	f	2015-04-08 13:16:42.817604	2016-08-05 22:49:14.805809	151	Property	0	\N	\N	\N	DOC_NONE	0
2635	9	\N	t	f	2015-04-08 13:17:24.278521	2016-08-05 22:49:14.810108	152	Property	0	\N	\N	\N	DOC_NONE	0
2658	6	\N	t	f	2015-04-08 13:18:10.261816	2016-08-05 22:49:14.814435	154	Property	0	\N	\N	\N	DOC_NONE	0
2681	12	\N	t	f	2015-04-08 13:18:45.62507	2016-08-05 22:49:14.819202	155	Property	0	\N	\N	\N	DOC_NONE	0
2724	6	\N	t	f	2015-04-08 13:19:57.498392	2016-08-05 22:49:14.82921	158	Property	0	\N	\N	\N	DOC_NONE	0
2747	16	\N	t	f	2015-04-08 13:20:41.248248	2016-08-05 22:49:14.835243	161	Property	0	\N	\N	\N	DOC_NONE	0
2770	5	\N	t	f	2015-04-08 13:21:20.389131	2016-08-05 22:49:14.840756	163	Property	0	\N	\N	\N	DOC_NONE	0
2789	7	\N	t	f	2015-04-08 13:21:54.380885	2016-08-05 22:49:14.847604	164	Property	0	\N	\N	\N	DOC_NONE	0
2836	17	\N	t	f	2015-04-08 13:23:28.24544	2016-08-05 22:49:14.857852	167	Property	0	\N	\N	\N	DOC_NONE	0
2877	12	\N	t	f	2015-04-08 13:25:03.845081	2016-08-05 22:49:14.862438	171	Property	0	\N	\N	\N	DOC_NONE	0
1069	1	\N	f	f	2015-04-08 12:31:04.361877	2016-08-05 22:34:38.950877	21	Property	0	\N	\N	\N	DOC_NONE	0
1	1	2014-12-23 20:28:44.320798	t	t	2015-03-02 20:19:45.125393	2016-08-05 22:34:40.595676	1	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1455	8	\N	t	t	2015-04-08 12:41:48.342973	2016-08-05 22:34:45.1693	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1081	14	\N	t	f	2015-04-08 12:31:21.058495	2016-08-05 22:34:47.05581	21	Property	0	\N	\N	\N	DOC_NONE	0
1085	3	\N	t	f	2015-04-08 12:31:28.180527	2016-08-05 22:34:51.62248	22	Property	0	\N	\N	\N	DOC_NONE	0
1210	6	\N	t	f	2015-04-08 12:35:02.099456	2016-08-05 22:34:54.618828	33	Property	0	\N	\N	\N	DOC_NONE	0
1215	11	\N	t	f	2015-04-08 12:35:08.782393	2016-08-05 22:34:57.088642	33	Property	0	\N	\N	\N	DOC_NONE	0
1221	17	\N	t	f	2015-04-08 12:35:16.755384	2016-08-05 22:35:00.465675	33	Property	0	\N	\N	\N	DOC_NONE	0
1226	5	\N	t	f	2015-04-08 12:35:23.532534	2016-08-05 22:35:03.816846	34	Property	0	\N	\N	\N	DOC_NONE	0
1231	10	\N	t	f	2015-04-08 12:35:30.538879	2016-08-05 22:35:07.879137	34	Property	0	\N	\N	\N	DOC_NONE	0
1238	17	\N	t	f	2015-04-08 12:35:40.170971	2016-08-05 22:35:10.929413	34	Property	0	\N	\N	\N	DOC_NONE	0
1243	5	\N	t	f	2015-04-08 12:35:47.762684	2016-08-05 22:35:13.535438	35	Property	0	\N	\N	\N	DOC_NONE	0
1248	10	\N	t	f	2015-04-08 12:35:54.452094	2016-08-05 22:35:16.90179	35	Property	0	\N	\N	\N	DOC_NONE	0
1269	16	\N	t	t	2015-04-08 12:36:38.729001	2016-08-05 22:35:17.410194	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1320	17	\N	t	f	2015-04-08 12:38:03.558005	2016-08-05 22:35:17.894183	42	Property	0	\N	\N	\N	DOC_NONE	0
1321	1	\N	t	f	2015-04-08 12:38:05.046284	2016-08-05 22:35:18.378593	43	Property	0	\N	\N	\N	DOC_NONE	0
1895	3	\N	t	f	2015-04-08 12:54:43.036516	2016-08-05 22:35:27.983005	89	Property	0	\N	\N	\N	DOC_NONE	0
1881	6	\N	t	t	2015-04-08 12:54:20.866425	2016-08-05 22:35:29.765878	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1891	16	\N	t	t	2015-04-08 12:54:36.912736	2016-08-05 22:35:32.138859	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1985	6	\N	t	f	2015-04-08 12:57:17.802465	2016-08-05 22:35:35.435701	97	Property	0	\N	\N	\N	DOC_NONE	0
2312	15	\N	t	f	2015-04-08 13:07:13.891657	2016-08-05 22:35:38.335551	124	Property	0	\N	\N	\N	DOC_NONE	0
2239	4	\N	t	f	2015-04-08 13:04:56.438967	2016-08-05 22:35:41.809791	117	Property	0	\N	\N	\N	DOC_NONE	0
2242	7	\N	t	f	2015-04-08 13:05:01.792166	2016-08-05 22:35:47.351632	117	Property	0	\N	\N	\N	DOC_NONE	0
2243	8	\N	t	f	2015-04-08 13:05:03.300336	2016-08-05 22:35:47.858448	117	Property	0	\N	\N	\N	DOC_NONE	0
2244	9	\N	t	f	2015-04-08 13:05:04.800783	2016-08-05 22:35:48.387335	117	Property	0	\N	\N	\N	DOC_NONE	0
2307	10	\N	t	f	2015-04-08 13:07:06.395838	2016-08-05 22:35:58.846666	124	Property	0	\N	\N	\N	DOC_NONE	0
2314	17	\N	t	f	2015-04-08 13:07:16.894902	2016-08-05 22:36:05.332088	124	Property	0	\N	\N	\N	DOC_NONE	0
2320	9	\N	t	f	2015-04-08 13:07:29.126111	2016-08-05 22:36:08.811811	125	Property	0	\N	\N	\N	DOC_NONE	0
2419	13	\N	t	f	2015-04-08 13:10:26.702205	2016-08-05 22:36:12.225123	133	Property	0	\N	\N	\N	DOC_NONE	0
2428	9	\N	t	f	2015-04-08 13:10:45.140547	2016-08-05 22:36:17.131681	134	Property	0	\N	\N	\N	DOC_NONE	0
2429	12	\N	t	f	2015-04-08 13:10:48.638384	2016-08-05 22:36:17.614458	134	Property	0	\N	\N	\N	DOC_NONE	0
2430	13	\N	t	f	2015-04-08 13:10:50.143789	2016-08-05 22:36:18.097404	134	Property	0	\N	\N	\N	DOC_NONE	0
2878	14	\N	t	f	2015-04-08 13:25:06.45632	2016-08-05 22:36:25.789681	171	Property	0	\N	\N	\N	DOC_NONE	0
3304	10	\N	t	f	2015-04-08 13:38:02.935768	2016-08-05 22:36:30.037297	204	Property	0	\N	\N	\N	DOC_NONE	0
3571	4	\N	t	f	2015-04-08 13:46:13.45298	2016-08-05 22:36:31.847283	223	Property	0	\N	\N	\N	DOC_NONE	0
3927	14	\N	t	f	2015-04-08 13:56:26.641047	2016-08-05 22:36:33.8587	248	Property	0	\N	\N	\N	DOC_NONE	0
4386	9	\N	t	f	2015-04-08 14:10:22.755677	2016-08-05 22:36:36.391934	252	Property	0	\N	\N	\N	DOC_NONE	0
226	7	\N	t	t	2015-03-28 10:38:21.598612	2016-08-05 22:36:39.33957	123	Property	1	\N	\N	\N	DOC_UPLOADED	0
6	6	\N	t	t	2015-03-28 10:34:44.930713	2016-08-05 22:36:41.785586	184	Property	0	\N	\N	\N	DOC_AVAILABLE	0
11	1	\N	t	t	2015-03-28 10:34:50.334552	2016-08-05 22:36:44.282405	201	Property	0	\N	\N	\N	DOC_AVAILABLE	0
39	1	\N	t	t	2015-03-28 10:35:24.536262	2016-08-05 22:36:47.094164	175	Property	0	\N	\N	\N	DOC_AVAILABLE	0
13	2	\N	t	t	2015-03-28 10:34:53.292602	2016-08-05 22:49:14.873172	19	Property	1	\N	\N	\N	DOC_UPLOADED	0
2704	1	\N	t	t	2015-04-08 13:19:21.283161	2016-08-05 22:49:14.877275	157	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1624	2	\N	t	t	2015-04-08 12:46:20.770047	2016-08-05 22:49:14.888392	67	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1608	2	\N	t	t	2015-04-08 12:45:55.612411	2016-08-05 22:49:14.893151	66	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2104	3	\N	t	t	2015-04-08 13:00:34.338972	2016-08-05 22:49:14.901141	106	Property	0	\N	\N	\N	DOC_AVAILABLE	0
625	5	\N	t	f	2015-03-28 10:43:15.384124	2016-08-05 22:49:14.908831	64	Property	0	\N	\N	\N	DOC_NONE	0
629	12	\N	t	f	2015-03-28 10:43:18.040734	2016-08-05 22:49:14.913778	64	Property	0	\N	\N	\N	DOC_NONE	0
2970	13	\N	t	t	2015-04-08 13:28:01.886146	2016-08-05 22:49:14.923979	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2646	6	\N	t	t	2015-04-08 13:17:46.434738	2016-08-05 22:49:14.928088	153	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1483	2	\N	t	t	2015-04-08 12:42:30.671887	2016-08-05 22:49:14.934748	56	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2341	7	\N	t	t	2015-04-08 13:08:12.427341	2016-08-05 22:49:14.939953	128	Property	0	\N	\N	\N	DOC_AVAILABLE	0
878	3	\N	t	t	2015-04-08 12:26:05.270944	2016-08-05 22:49:14.949886	6	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4168	1	\N	t	t	2015-04-08 14:03:31.054556	2016-08-05 22:49:14.953974	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3346	2	\N	t	t	2015-04-08 13:39:19.340973	2016-08-05 22:49:14.958817	207	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3254	2	\N	t	t	2015-04-08 13:36:23.178064	2016-08-05 22:49:14.962936	201	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3445	1	\N	t	t	2015-04-08 13:42:12.481343	2016-08-05 22:49:14.970882	214	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3897	1	\N	t	f	2015-04-08 13:55:36.698398	2016-08-05 22:49:14.975036	247	Property	0	\N	\N	\N	DOC_NONE	0
3617	1	\N	t	t	2015-04-08 13:47:30.150004	2016-08-05 22:49:14.979394	227	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3930	17	\N	t	t	2015-04-08 13:56:31.562217	2016-08-05 22:49:14.983853	248	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4333	17	\N	t	t	2015-04-08 14:08:55.580418	2016-08-05 22:49:14.987828	226	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2520	1	\N	t	t	2015-04-08 13:13:52.201682	2016-08-05 22:49:14.996237	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3115	2	\N	t	f	2015-04-08 13:32:15.278523	2016-08-05 22:49:15.001026	191	Property	0	\N	\N	\N	DOC_NONE	0
3126	13	\N	t	f	2015-04-08 13:32:32.719004	2016-08-05 22:49:15.004906	191	Property	0	\N	\N	\N	DOC_NONE	0
3127	14	\N	t	f	2015-04-08 13:32:35.371206	2016-08-05 22:49:15.008975	191	Property	0	\N	\N	\N	DOC_NONE	0
2373	12	\N	t	f	2015-04-08 13:09:09.433706	2016-08-05 22:49:15.018143	130	Property	0	\N	\N	\N	DOC_NONE	0
1840	15	\N	t	f	2015-04-08 12:53:15.943116	2016-08-05 22:49:15.023098	85	Property	0	\N	\N	\N	DOC_NONE	0
3831	1	\N	t	f	2015-04-08 13:53:40.984262	2016-08-05 22:49:15.026897	243	Property	0	\N	\N	\N	DOC_NONE	0
2523	11	\N	t	t	2015-04-08 13:14:04.130704	2016-08-05 22:49:15.030654	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
544	13	\N	t	t	2015-03-28 10:42:14.814595	2016-08-05 22:49:15.034728	105	Property	1	\N	\N	\N	DOC_UPLOADED	0
828	2	\N	t	t	2015-04-08 12:24:41.632457	2016-08-05 22:49:15.044329	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
388	12	\N	t	t	2015-03-28 10:40:20.146274	2016-08-05 22:49:15.048875	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
390	14	\N	t	t	2015-03-28 10:40:21.460655	2016-08-05 22:49:15.053774	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
51	1	\N	t	t	2015-03-28 10:35:36.456243	2016-08-05 22:36:48.12758	67	Property	0	\N	\N	\N	DOC_AVAILABLE	0
557	5	\N	t	f	2015-03-28 10:42:25.415492	2016-08-05 22:36:49.005874	222	Property	0	\N	\N	\N	DOC_NONE	0
183	4	\N	t	t	2015-03-28 10:37:49.912392	2016-08-05 22:36:55.805051	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
225	6	\N	t	t	2015-03-28 10:38:20.949068	2016-08-05 22:37:00.02475	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
303	11	\N	t	t	2015-03-28 10:39:17.754963	2016-08-05 22:37:03.304849	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
328	2	\N	t	t	2015-03-28 10:39:36.249741	2016-08-05 22:37:05.789357	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
395	5	\N	t	t	2015-03-28 10:40:25.370762	2016-08-05 22:37:08.767229	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
509	13	\N	t	t	2015-03-28 10:41:49.10282	2016-08-05 22:37:11.163347	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
514	4	\N	t	t	2015-03-28 10:41:53.01128	2016-08-05 22:37:13.627736	159	Property	0	\N	\N	\N	DOC_AVAILABLE	0
558	7	\N	t	f	2015-03-28 10:42:26.090405	2016-08-05 22:37:16.922129	222	Property	0	\N	\N	\N	DOC_NONE	0
569	11	\N	t	t	2015-03-28 10:42:34.008189	2016-08-05 22:37:17.404173	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
567	7	\N	t	t	2015-03-28 10:42:32.692246	2016-08-05 22:37:18.3568	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
566	4	\N	t	t	2015-03-28 10:42:32.036594	2016-08-05 22:37:18.840622	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
600	12	\N	t	t	2015-03-28 10:42:56.301972	2016-08-05 22:37:19.332464	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
708	8	\N	t	t	2015-03-28 10:44:18.450623	2016-08-05 22:37:26.118705	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
723	3	\N	t	t	2015-03-28 10:44:29.706456	2016-08-05 22:37:28.68572	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
860	1	\N	t	f	2015-04-08 12:25:25.882327	2016-08-05 22:37:31.77816	4	Property	0	\N	\N	\N	DOC_NONE	0
1393	8	\N	t	f	2015-04-08 12:40:00.579911	2016-08-05 22:37:35.134439	48	Property	0	\N	\N	\N	DOC_NONE	0
113	16	\N	t	t	2015-03-28 10:36:51.336149	2016-08-05 22:37:38.159761	101	Property	0	\N	\N	\N	DOC_AVAILABLE	0
144	7	\N	t	t	2015-03-28 10:37:20.743684	2016-08-05 22:37:40.617145	173	Property	1	\N	\N	\N	DOC_UPLOADED	0
1108	15	\N	t	f	2015-04-08 12:32:04.341061	2016-08-05 22:37:43.065726	23	Property	0	\N	\N	\N	DOC_NONE	0
158	15	\N	t	t	2015-03-28 10:37:30.777767	2016-08-05 22:37:46.520225	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
172	14	\N	t	t	2015-03-28 10:37:41.327386	2016-08-05 22:37:47.884784	166	Property	0	\N	\N	\N	DOC_AVAILABLE	0
937	17	\N	t	t	2015-04-08 12:27:44.554522	2016-08-05 22:37:48.368968	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
173	15	\N	t	t	2015-03-28 10:37:41.979073	2016-08-05 22:37:48.846451	166	Property	0	\N	\N	\N	DOC_AVAILABLE	0
181	15	\N	t	t	2015-03-28 10:37:47.947182	2016-08-05 22:37:49.323052	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
304	12	\N	t	t	2015-03-28 10:39:18.407509	2016-08-05 22:38:00.123066	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
410	14	\N	t	t	2015-03-28 10:40:36.377932	2016-08-05 22:38:02.98608	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
180	14	\N	t	t	2015-03-28 10:37:47.310337	2016-08-05 22:38:04.410631	91	Property	0	\N	\N	\N	DOC_AVAILABLE	0
511	15	\N	t	t	2015-03-28 10:41:50.404609	2016-08-05 22:38:06.324717	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
573	15	\N	t	t	2015-03-28 10:42:36.627912	2016-08-05 22:38:09.213845	69	Property	0	\N	\N	\N	DOC_AVAILABLE	0
642	3	\N	t	t	2015-03-28 10:43:28.045593	2016-08-05 22:38:11.659825	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
710	13	\N	t	t	2015-03-28 10:44:19.751685	2016-08-05 22:38:14.066578	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1710	5	\N	t	f	2015-04-08 12:49:08.602684	2016-08-05 22:38:17.359325	74	Property	0	\N	\N	\N	DOC_NONE	0
2161	10	\N	t	f	2015-04-08 13:02:37.471563	2016-08-05 22:38:19.775254	111	Property	0	\N	\N	\N	DOC_NONE	0
2703	17	\N	t	f	2015-04-08 13:19:19.235046	2016-08-05 22:38:22.689884	156	Property	0	\N	\N	\N	DOC_NONE	0
3246	10	\N	t	f	2015-04-08 13:36:09.636501	2016-08-05 22:38:25.115989	199	Property	0	\N	\N	\N	DOC_NONE	0
24	2	\N	t	t	2015-03-28 10:35:06.340522	2016-08-05 22:38:27.590838	24	Property	0	\N	\N	\N	DOC_AVAILABLE	0
254	8	\N	t	t	2015-03-28 10:38:42.105408	2016-08-05 22:38:30.489222	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
313	11	\N	t	t	2015-03-28 10:39:25.066404	2016-08-05 22:38:33.436501	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
327	16	\N	t	t	2015-03-28 10:39:34.931419	2016-08-05 22:38:36.33093	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
430	12	\N	t	t	2015-03-28 10:40:50.83052	2016-08-05 22:38:38.80754	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
481	3	\N	t	t	2015-03-28 10:41:28.24784	2016-08-05 22:38:41.260314	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
487	14	\N	t	t	2015-03-28 10:41:33.325642	2016-08-05 22:38:44.191516	136	Property	0	\N	\N	\N	DOC_AVAILABLE	0
592	13	\N	t	t	2015-03-28 10:42:50.413817	2016-08-05 22:38:47.036418	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
619	12	\N	t	t	2015-03-28 10:43:10.798829	2016-08-05 22:38:48.497041	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
620	13	\N	t	t	2015-03-28 10:43:11.464113	2016-08-05 22:38:48.976897	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3791	11	\N	t	f	2015-04-08 13:52:29.108734	2016-08-05 22:38:53.311614	237	Property	0	\N	\N	\N	DOC_NONE	0
4244	8	\N	t	f	2015-04-08 14:06:02.543957	2016-08-05 22:38:55.804514	145	Property	0	\N	\N	\N	DOC_NONE	0
4336	5	\N	t	f	2015-04-08 14:09:02.205419	2016-08-05 22:38:58.326091	238	Property	0	\N	\N	\N	DOC_NONE	0
4342	11	\N	t	f	2015-04-08 14:09:11.142981	2016-08-05 22:39:01.563364	238	Property	0	\N	\N	\N	DOC_NONE	0
834	8	\N	t	t	2015-04-08 12:24:49.938473	2016-08-05 22:39:04.00201	2	Property	1	\N	\N	\N	DOC_UPLOADED	0
837	11	\N	t	f	2015-04-08 12:24:53.949504	2016-08-05 22:39:07.042891	2	Property	0	\N	\N	\N	DOC_NONE	0
842	16	\N	t	f	2015-04-08 12:25:00.879696	2016-08-05 22:39:09.836337	2	Property	0	\N	\N	\N	DOC_NONE	0
847	5	\N	t	f	2015-04-08 12:25:08.49224	2016-08-05 22:39:12.255829	3	Property	0	\N	\N	\N	DOC_NONE	0
854	12	\N	t	f	2015-04-08 12:25:17.747354	2016-08-05 22:39:15.14579	3	Property	0	\N	\N	\N	DOC_NONE	0
859	17	\N	t	f	2015-04-08 12:25:24.383414	2016-08-05 22:39:17.937231	3	Property	0	\N	\N	\N	DOC_NONE	0
861	4	\N	t	f	2015-04-08 12:25:28.864814	2016-08-05 22:39:18.423663	4	Property	0	\N	\N	\N	DOC_NONE	0
862	5	\N	t	f	2015-04-08 12:25:30.189771	2016-08-05 22:39:18.911511	4	Property	0	\N	\N	\N	DOC_NONE	0
876	17	\N	t	f	2015-04-08 12:26:01.600592	2016-08-05 22:39:25.632615	5	Property	0	\N	\N	\N	DOC_NONE	0
884	9	\N	t	f	2015-04-08 12:26:13.271575	2016-08-05 22:39:28.516388	6	Property	0	\N	\N	\N	DOC_NONE	0
761	5	\N	t	t	2015-03-28 10:44:58.628762	2016-08-05 22:39:31.314109	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
887	12	\N	t	f	2015-04-08 12:26:17.282042	2016-08-05 22:39:32.751456	6	Property	0	\N	\N	\N	DOC_NONE	0
892	17	\N	t	f	2015-04-08 12:26:23.92236	2016-08-05 22:39:34.672737	6	Property	0	\N	\N	\N	DOC_NONE	0
898	10	\N	t	f	2015-04-08 12:26:35.7341	2016-08-05 22:39:37.561879	7	Property	0	\N	\N	\N	DOC_NONE	0
903	3	\N	t	f	2015-04-08 12:26:46.716662	2016-08-05 22:39:39.958995	8	Property	0	\N	\N	\N	DOC_NONE	0
908	8	\N	t	f	2015-04-08 12:26:53.317802	2016-08-05 22:39:42.362302	8	Property	0	\N	\N	\N	DOC_NONE	0
916	16	\N	t	f	2015-04-08 12:27:04.013236	2016-08-05 22:39:45.273863	8	Property	0	\N	\N	\N	DOC_NONE	0
919	2	\N	t	f	2015-04-08 12:27:08.153989	2016-08-05 22:39:47.811758	9	Property	0	\N	\N	\N	DOC_NONE	0
920	3	\N	t	f	2015-04-08 12:27:09.475148	2016-08-05 22:39:49.170073	9	Property	0	\N	\N	\N	DOC_NONE	0
921	4	\N	t	f	2015-04-08 12:27:10.799926	2016-08-05 22:39:49.697897	9	Property	0	\N	\N	\N	DOC_NONE	0
922	5	\N	t	f	2015-04-08 12:27:12.121083	2016-08-05 22:39:50.188987	9	Property	0	\N	\N	\N	DOC_NONE	0
1437	7	\N	t	f	2015-04-08 12:41:20.872666	2016-08-05 22:40:00.36293	53	Property	0	\N	\N	\N	DOC_NONE	0
1442	12	\N	t	f	2015-04-08 12:41:27.658671	2016-08-05 22:40:02.981405	53	Property	0	\N	\N	\N	DOC_NONE	0
1463	16	\N	t	t	2015-04-08 12:42:00.685846	2016-08-05 22:40:10.734611	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1475	11	\N	t	f	2015-04-08 12:42:18.177584	2016-08-05 22:40:13.627756	55	Property	0	\N	\N	\N	DOC_NONE	0
1471	7	\N	t	f	2015-04-08 12:42:12.309873	2016-08-05 22:40:16.490584	55	Property	0	\N	\N	\N	DOC_NONE	0
1474	10	\N	t	f	2015-04-08 12:42:16.754223	2016-08-05 22:40:18.449377	55	Property	0	\N	\N	\N	DOC_NONE	0
1476	12	\N	t	f	2015-04-08 12:42:20.679242	2016-08-05 22:40:19.46283	55	Property	0	\N	\N	\N	DOC_NONE	0
1485	4	\N	t	f	2015-04-08 12:42:33.332964	2016-08-05 22:40:23.37304	56	Property	0	\N	\N	\N	DOC_NONE	0
1490	9	\N	t	f	2015-04-08 12:42:39.9706	2016-08-05 22:40:25.868905	56	Property	0	\N	\N	\N	DOC_NONE	0
942	7	\N	t	f	2015-04-08 12:27:53.392833	2016-08-05 22:40:28.349258	11	Property	0	\N	\N	\N	DOC_NONE	0
948	13	\N	t	f	2015-04-08 12:28:01.34523	2016-08-05 22:40:31.760358	11	Property	0	\N	\N	\N	DOC_NONE	0
953	1	\N	t	f	2015-04-08 12:28:08.132098	2016-08-05 22:40:34.27428	12	Property	0	\N	\N	\N	DOC_NONE	0
959	7	\N	t	f	2015-04-08 12:28:17.24082	2016-08-05 22:40:37.239012	12	Property	0	\N	\N	\N	DOC_NONE	0
965	13	\N	t	f	2015-04-08 12:28:25.231185	2016-08-05 22:40:39.662098	12	Property	0	\N	\N	\N	DOC_NONE	0
970	1	\N	t	f	2015-04-08 12:28:32.420451	2016-08-05 22:40:42.113602	13	Property	0	\N	\N	\N	DOC_NONE	0
976	12	\N	t	f	2015-04-08 12:28:44.480895	2016-08-05 22:40:45.329472	13	Property	0	\N	\N	\N	DOC_NONE	0
979	15	\N	t	f	2015-04-08 12:28:48.455469	2016-08-05 22:40:48.398925	13	Property	0	\N	\N	\N	DOC_NONE	0
980	16	\N	t	f	2015-04-08 12:28:49.77915	2016-08-05 22:40:48.890917	13	Property	0	\N	\N	\N	DOC_NONE	0
983	4	\N	t	t	2015-04-08 12:28:55.592243	2016-08-05 22:40:49.386042	15	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1003	17	\N	t	f	2015-04-08 12:29:31.238314	2016-08-05 22:41:00.175173	16	Property	0	\N	\N	\N	DOC_NONE	0
1008	5	\N	t	f	2015-04-08 12:29:38.00313	2016-08-05 22:41:03.020748	17	Property	0	\N	\N	\N	DOC_NONE	0
1011	8	\N	t	f	2015-04-08 12:29:41.959427	2016-08-05 22:41:04.482396	17	Property	0	\N	\N	\N	DOC_NONE	0
1015	12	\N	t	f	2015-04-08 12:29:47.247841	2016-08-05 22:41:06.395431	17	Property	0	\N	\N	\N	DOC_NONE	0
1021	1	\N	t	f	2015-04-08 12:29:55.415774	2016-08-05 22:41:09.287511	18	Property	0	\N	\N	\N	DOC_NONE	0
1028	9	\N	t	f	2015-04-08 12:30:05.597758	2016-08-05 22:41:11.671124	18	Property	0	\N	\N	\N	DOC_NONE	0
1033	14	\N	t	f	2015-04-08 12:30:12.58836	2016-08-05 22:41:14.061338	18	Property	0	\N	\N	\N	DOC_NONE	0
1042	7	\N	t	f	2015-04-08 12:30:25.905969	2016-08-05 22:41:17.463063	19	Property	0	\N	\N	\N	DOC_NONE	0
1047	12	\N	t	f	2015-04-08 12:30:33.262455	2016-08-05 22:41:19.936657	19	Property	0	\N	\N	\N	DOC_NONE	0
1055	4	\N	t	f	2015-04-08 12:30:45.229747	2016-08-05 22:41:22.908161	20	Property	0	\N	\N	\N	DOC_NONE	0
1060	9	\N	t	f	2015-04-08 12:30:51.843254	2016-08-05 22:41:25.351945	20	Property	0	\N	\N	\N	DOC_NONE	0
1066	15	\N	t	f	2015-04-08 12:31:00.194897	2016-08-05 22:41:27.777641	20	Property	0	\N	\N	\N	DOC_NONE	0
1073	6	\N	t	f	2015-04-08 12:31:10.483387	2016-08-05 22:41:30.657934	21	Property	0	\N	\N	\N	DOC_NONE	0
1093	13	\N	t	f	2015-04-08 12:31:40.858652	2016-08-05 22:41:33.39952	22	Property	0	\N	\N	\N	DOC_NONE	0
1100	7	\N	t	f	2015-04-08 12:31:53.628332	2016-08-05 22:41:36.337637	23	Property	0	\N	\N	\N	DOC_NONE	0
1105	12	\N	t	f	2015-04-08 12:32:00.364847	2016-08-05 22:41:38.791747	23	Property	0	\N	\N	\N	DOC_NONE	0
1495	14	\N	t	f	2015-04-08 12:42:46.809417	2016-08-05 22:41:41.770666	56	Property	0	\N	\N	\N	DOC_NONE	0
1112	3	\N	t	f	2015-04-08 12:32:10.61534	2016-08-05 22:41:44.770904	24	Property	0	\N	\N	\N	DOC_NONE	0
1118	9	\N	t	f	2015-04-08 12:32:18.56172	2016-08-05 22:41:47.7613	24	Property	0	\N	\N	\N	DOC_NONE	0
1121	12	\N	t	f	2015-04-08 12:32:22.520693	2016-08-05 22:41:50.334722	24	Property	0	\N	\N	\N	DOC_NONE	0
1125	16	\N	t	f	2015-04-08 12:32:27.812047	2016-08-05 22:41:53.195761	24	Property	0	\N	\N	\N	DOC_NONE	0
1131	7	\N	t	f	2015-04-08 12:32:37.682276	2016-08-05 22:41:57.487415	25	Property	0	\N	\N	\N	DOC_NONE	0
1137	13	\N	t	f	2015-04-08 12:32:46.372793	2016-08-05 22:42:03.53445	25	Property	0	\N	\N	\N	DOC_NONE	0
1142	1	\N	t	f	2015-04-08 12:32:53.890022	2016-08-05 22:42:08.019211	27	Property	0	\N	\N	\N	DOC_NONE	0
1502	7	\N	t	f	2015-04-08 12:42:58.900132	2016-08-05 22:42:11.140963	57	Property	0	\N	\N	\N	DOC_NONE	0
1253	15	\N	t	f	2015-04-08 12:36:01.15442	2016-08-05 22:42:14.798041	35	Property	0	\N	\N	\N	DOC_NONE	0
1259	10	\N	t	f	2015-04-08 12:36:14.209188	2016-08-05 22:42:20.682047	36	Property	0	\N	\N	\N	DOC_NONE	0
1264	5	\N	t	f	2015-04-08 12:36:27.144895	2016-08-05 22:42:23.182247	37	Property	0	\N	\N	\N	DOC_NONE	0
1505	10	\N	t	f	2015-04-08 12:43:02.9826	2016-08-05 22:42:25.640011	57	Property	0	\N	\N	\N	DOC_NONE	0
1511	16	\N	t	f	2015-04-08 12:43:11.792599	2016-08-05 22:42:28.629986	57	Property	0	\N	\N	\N	DOC_NONE	0
1517	7	\N	t	f	2015-04-08 12:43:23.264092	2016-08-05 22:42:31.392142	58	Property	0	\N	\N	\N	DOC_NONE	0
1274	4	\N	t	f	2015-04-08 12:36:45.504773	2016-08-05 22:42:34.487202	38	Property	0	\N	\N	\N	DOC_NONE	0
1279	9	\N	t	f	2015-04-08 12:36:52.112911	2016-08-05 22:42:37.039829	38	Property	0	\N	\N	\N	DOC_NONE	0
1284	14	\N	t	f	2015-04-08 12:36:58.712745	2016-08-05 22:42:39.58864	38	Property	0	\N	\N	\N	DOC_NONE	0
1290	5	\N	t	f	2015-04-08 12:37:08.462773	2016-08-05 22:42:43.078558	40	Property	0	\N	\N	\N	DOC_NONE	0
1295	11	\N	t	f	2015-04-08 12:37:16.258327	2016-08-05 22:42:45.547191	40	Property	0	\N	\N	\N	DOC_NONE	0
1299	2	\N	t	f	2015-04-08 12:37:25.395366	2016-08-05 22:42:47.351303	41	Property	0	\N	\N	\N	DOC_NONE	0
1303	6	\N	t	f	2015-04-08 12:37:30.713059	2016-08-05 22:42:49.349687	41	Property	0	\N	\N	\N	DOC_NONE	0
1309	12	\N	t	f	2015-04-08 12:37:39.01083	2016-08-05 22:42:52.586314	41	Property	0	\N	\N	\N	DOC_NONE	0
1314	17	\N	t	f	2015-04-08 12:37:45.967889	2016-08-05 22:42:55.029972	41	Property	0	\N	\N	\N	DOC_NONE	0
73	1	\N	t	f	2015-03-28 10:36:09.472063	2016-08-05 22:42:57.494238	84	Property	0	\N	\N	\N	DOC_NONE	0
1322	3	\N	t	t	2015-04-08 12:38:07.194829	2016-08-05 22:43:00.348639	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1333	5	\N	t	f	2015-04-08 12:38:29.153635	2016-08-05 22:43:03.17762	44	Property	0	\N	\N	\N	DOC_NONE	0
1340	12	\N	t	f	2015-04-08 12:38:38.511826	2016-08-05 22:43:06.079736	44	Property	0	\N	\N	\N	DOC_NONE	0
1345	17	\N	t	f	2015-04-08 12:38:45.526668	2016-08-05 22:43:08.857693	44	Property	0	\N	\N	\N	DOC_NONE	0
1351	10	\N	t	f	2015-04-08 12:38:57.066175	2016-08-05 22:43:12.043166	45	Property	0	\N	\N	\N	DOC_NONE	0
1357	6	\N	t	f	2015-04-08 12:39:11.097429	2016-08-05 22:43:15.451412	46	Property	0	\N	\N	\N	DOC_NONE	0
1363	12	\N	t	f	2015-04-08 12:39:19.646755	2016-08-05 22:43:18.261461	46	Property	0	\N	\N	\N	DOC_NONE	0
1364	13	\N	t	f	2015-04-08 12:39:20.972019	2016-08-05 22:43:18.755517	46	Property	0	\N	\N	\N	DOC_NONE	0
1365	14	\N	t	f	2015-04-08 12:39:22.294276	2016-08-05 22:43:19.272548	46	Property	0	\N	\N	\N	DOC_NONE	0
1366	15	\N	t	f	2015-04-08 12:39:23.606716	2016-08-05 22:43:19.819686	46	Property	0	\N	\N	\N	DOC_NONE	0
1386	1	\N	t	f	2015-04-08 12:39:51.2187	2016-08-05 22:43:32.693776	48	Property	0	\N	\N	\N	DOC_NONE	0
1392	7	\N	t	f	2015-04-08 12:39:59.177337	2016-08-05 22:43:35.138658	48	Property	0	\N	\N	\N	DOC_NONE	0
53	2	\N	t	t	2015-03-28 10:35:39.080352	2016-08-05 22:43:36.636018	108	Property	0	\N	\N	\N	DOC_AVAILABLE	0
65	2	\N	t	t	2015-03-28 10:35:51.109267	2016-08-05 22:43:38.612516	242	Property	0	\N	\N	\N	DOC_AVAILABLE	0
74	1	\N	t	t	2015-03-28 10:36:10.78629	2016-08-05 22:43:41.500304	8	Property	0	\N	\N	\N	DOC_AVAILABLE	0
86	3	\N	t	t	2015-03-28 10:36:23.403888	2016-08-05 22:43:43.938337	59	Property	1	\N	\N	\N	DOC_UPLOADED	0
23	3	\N	t	t	2015-03-28 10:35:02.937884	2016-08-05 22:43:46.723666	23	Property	0	\N	\N	\N	DOC_AVAILABLE	0
33	3	\N	t	t	2015-03-28 10:35:17.985151	2016-08-05 22:43:49.598893	28	Property	0	\N	\N	\N	DOC_AVAILABLE	0
36	1	\N	t	t	2015-03-28 10:35:20.578298	2016-08-05 22:43:50.07281	131	Property	0	\N	\N	\N	DOC_AVAILABLE	0
59	3	\N	t	t	2015-03-28 10:35:44.354872	2016-08-05 22:43:54.889583	125	Property	0	\N	\N	\N	DOC_AVAILABLE	0
92	2	\N	t	t	2015-03-28 10:36:29.977307	2016-08-05 22:43:57.298594	11	Property	0	\N	\N	\N	DOC_AVAILABLE	0
97	1	\N	t	t	2015-03-28 10:36:35.36244	2016-08-05 22:43:59.701622	3	Property	0	\N	\N	\N	DOC_AVAILABLE	0
105	3	\N	t	t	2015-03-28 10:36:43.285339	2016-08-05 22:44:03.183731	157	Property	0	\N	\N	\N	DOC_AVAILABLE	0
114	2	\N	t	t	2015-03-28 10:36:52.641231	2016-08-05 22:44:05.725995	102	Property	0	\N	\N	\N	DOC_AVAILABLE	0
121	2	\N	t	t	2015-03-28 10:37:00.060985	2016-08-05 22:44:08.710555	215	Property	0	\N	\N	\N	DOC_AVAILABLE	0
127	2	\N	t	t	2015-03-28 10:37:06.039123	2016-08-05 22:44:11.157619	218	Property	0	\N	\N	\N	DOC_AVAILABLE	0
133	2	\N	t	t	2015-03-28 10:37:11.925047	2016-08-05 22:44:13.643246	221	Property	0	\N	\N	\N	DOC_AVAILABLE	0
82	3	\N	t	t	2015-03-28 10:36:19.417232	2016-08-05 22:44:18.356416	73	Property	0	\N	\N	\N	DOC_AVAILABLE	0
162	7	\N	t	t	2015-03-28 10:37:34.041591	2016-08-05 22:44:19.039043	174	Property	0	\N	\N	\N	DOC_AVAILABLE	0
42	4	\N	t	f	2015-03-28 10:35:27.255965	2016-08-05 22:44:19.689864	92	Property	0	\N	\N	\N	DOC_NONE	0
206	7	\N	t	t	2015-03-28 10:38:07.210951	2016-08-05 22:44:22.971759	107	Property	0	\N	\N	\N	DOC_AVAILABLE	0
244	11	\N	t	t	2015-03-28 10:38:34.715398	2016-08-05 22:44:25.040164	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
197	6	\N	t	f	2015-03-28 10:38:00.500708	2016-08-05 22:44:28.031188	43	Property	0	\N	\N	\N	DOC_NONE	0
200	11	\N	t	t	2015-03-28 10:38:02.571347	2016-08-05 22:44:30.445605	43	Property	0	\N	\N	\N	DOC_AVAILABLE	0
215	4	\N	t	t	2015-03-28 10:38:13.711133	2016-08-05 22:44:33.245555	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
272	3	\N	t	f	2015-03-28 10:38:55.419031	2016-08-05 22:44:36.24243	118	Property	0	\N	\N	\N	DOC_NONE	0
240	14	\N	t	t	2015-03-28 10:38:31.468707	2016-08-05 22:44:38.685223	85	Property	0	\N	\N	\N	DOC_AVAILABLE	0
275	10	\N	t	t	2015-03-28 10:38:57.397723	2016-08-05 22:44:41.591816	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
284	16	\N	t	t	2015-03-28 10:39:04.069359	2016-08-05 22:44:44.041295	149	Property	0	\N	\N	\N	DOC_AVAILABLE	0
288	5	\N	t	t	2015-03-28 10:39:07.387201	2016-08-05 22:44:46.883568	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
306	14	\N	t	t	2015-03-28 10:39:19.717073	2016-08-05 22:44:48.319095	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
305	13	\N	t	t	2015-03-28 10:39:19.060769	2016-08-05 22:44:48.797559	31	Property	0	\N	\N	\N	DOC_AVAILABLE	0
342	12	\N	t	t	2015-03-28 10:39:46.214863	2016-08-05 22:48:58.064161	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
356	6	\N	t	t	2015-03-28 10:39:56.813755	2016-08-05 22:48:58.114502	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
362	16	\N	t	t	2015-03-28 10:40:00.710979	2016-08-05 22:48:58.140394	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
292	11	\N	t	f	2015-03-28 10:39:09.969067	2016-08-05 22:48:58.161847	113	Property	0	\N	\N	\N	DOC_NONE	0
379	12	\N	t	t	2015-03-28 10:40:13.524562	2016-08-05 22:48:58.260334	7	Property	0	\N	\N	\N	DOC_AVAILABLE	0
384	5	\N	t	t	2015-03-28 10:40:17.498318	2016-08-05 22:48:58.276888	77	Property	0	\N	\N	\N	DOC_AVAILABLE	0
408	12	\N	t	t	2015-03-28 10:40:34.902105	2016-08-05 22:48:58.305414	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
403	4	\N	t	t	2015-03-28 10:40:31.376443	2016-08-05 22:48:58.326064	126	Property	0	\N	\N	\N	DOC_AVAILABLE	0
419	13	\N	t	t	2015-03-28 10:40:42.934389	2016-08-05 22:48:58.345047	45	Property	1	\N	\N	\N	DOC_UPLOADED	0
427	7	\N	t	t	2015-03-28 10:40:48.839303	2016-08-05 22:48:58.370471	71	Property	0	\N	\N	\N	DOC_AVAILABLE	0
442	14	\N	t	t	2015-03-28 10:40:59.381893	2016-08-05 22:48:58.390064	78	Property	0	\N	\N	\N	DOC_AVAILABLE	0
447	4	\N	t	t	2015-03-28 10:41:03.298226	2016-08-05 22:48:58.4166	57	Property	1	\N	\N	\N	DOC_UPLOADED	0
449	4	\N	t	t	2015-03-28 10:41:05.246497	2016-08-05 22:48:58.438581	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
472	7	\N	t	t	2015-03-28 10:41:21.678313	2016-08-05 22:48:58.460984	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
491	3	\N	t	t	2015-03-28 10:41:36.600352	2016-08-05 22:48:58.484263	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
545	16	\N	t	t	2015-03-28 10:42:15.461887	2016-08-05 22:48:58.509626	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
528	12	\N	t	t	2015-03-28 10:42:02.959088	2016-08-05 22:48:58.536371	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
523	2	\N	t	t	2015-03-28 10:41:59.633949	2016-08-05 22:48:58.557991	176	Property	0	\N	\N	\N	DOC_AVAILABLE	0
536	7	\N	t	t	2015-03-28 10:42:08.882067	2016-08-05 22:48:58.58093	36	Property	0	\N	\N	\N	DOC_AVAILABLE	0
549	12	\N	t	t	2015-03-28 10:42:18.746772	2016-08-05 22:48:58.608149	29	Property	0	\N	\N	\N	DOC_AVAILABLE	0
583	16	\N	t	t	2015-03-28 10:42:43.845093	2016-08-05 22:48:58.634408	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
577	7	\N	t	t	2015-03-28 10:42:39.917901	2016-08-05 22:48:58.650881	4	Property	0	\N	\N	\N	DOC_AVAILABLE	0
586	5	\N	t	t	2015-03-28 10:42:46.488095	2016-08-05 22:48:58.668728	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
598	8	\N	t	t	2015-03-28 10:42:54.983834	2016-08-05 22:48:58.696909	74	Property	0	\N	\N	\N	DOC_AVAILABLE	0
564	16	\N	t	f	2015-03-28 10:42:30.049385	2016-08-05 22:48:58.719676	222	Property	0	\N	\N	\N	DOC_NONE	0
613	15	\N	t	t	2015-03-28 10:43:05.37435	2016-08-05 22:48:58.742231	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
623	3	\N	t	t	2015-03-28 10:43:14.079884	2016-08-05 22:48:58.770307	64	Property	0	\N	\N	\N	DOC_AVAILABLE	0
632	5	\N	t	t	2015-03-28 10:43:20.680988	2016-08-05 22:48:58.793189	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
637	13	\N	t	t	2015-03-28 10:43:24.066686	2016-08-05 22:48:58.820726	120	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1396	11	\N	t	f	2015-04-08 12:40:04.557444	2016-08-05 22:48:58.845003	48	Property	0	\N	\N	\N	DOC_NONE	0
1401	16	\N	t	f	2015-04-08 12:40:11.17325	2016-08-05 22:48:58.867591	48	Property	0	\N	\N	\N	DOC_NONE	0
1411	1	\N	t	f	2015-04-08 12:40:32.275481	2016-08-05 22:48:58.895183	50	Property	0	\N	\N	\N	DOC_NONE	0
1412	4	\N	t	f	2015-04-08 12:40:35.262375	2016-08-05 22:48:58.917417	50	Property	0	\N	\N	\N	DOC_NONE	0
1418	10	\N	t	f	2015-04-08 12:40:43.233896	2016-08-05 22:48:58.944037	50	Property	0	\N	\N	\N	DOC_NONE	0
1423	16	\N	t	f	2015-04-08 12:40:51.058064	2016-08-05 22:48:58.966675	50	Property	0	\N	\N	\N	DOC_NONE	0
1519	9	\N	t	f	2015-04-08 12:43:26.330751	2016-08-05 22:48:58.990731	58	Property	0	\N	\N	\N	DOC_NONE	0
1525	15	\N	t	f	2015-04-08 12:43:36.349506	2016-08-05 22:48:59.022629	58	Property	0	\N	\N	\N	DOC_NONE	0
1531	6	\N	t	f	2015-04-08 12:43:48.326882	2016-08-05 22:48:59.049705	59	Property	0	\N	\N	\N	DOC_NONE	0
465	14	\N	t	t	2015-03-28 10:41:16.382105	2016-08-05 22:48:59.063315	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
672	13	\N	t	t	2015-03-28 10:43:50.633965	2016-08-05 22:48:59.082067	103	Property	0	\N	\N	\N	DOC_AVAILABLE	0
676	7	\N	t	t	2015-03-28 10:43:53.933751	2016-08-05 22:48:59.109212	40	Property	0	\N	\N	\N	DOC_AVAILABLE	0
686	13	\N	t	t	2015-03-28 10:44:01.207657	2016-08-05 22:48:59.13092	122	Property	0	\N	\N	\N	DOC_AVAILABLE	0
691	6	\N	t	t	2015-03-28 10:44:05.19142	2016-08-05 22:48:59.156614	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
711	14	\N	t	t	2015-03-28 10:44:20.408514	2016-08-05 22:48:59.183599	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1536	11	\N	t	f	2015-04-08 12:43:55.45861	2016-08-05 22:48:59.204655	59	Property	0	\N	\N	\N	DOC_NONE	0
1542	17	\N	t	f	2015-04-08 12:44:04.03982	2016-08-05 22:48:59.230214	59	Property	0	\N	\N	\N	DOC_NONE	0
1547	6	\N	t	f	2015-04-08 12:44:11.901852	2016-08-05 22:48:59.251786	60	Property	0	\N	\N	\N	DOC_NONE	0
1553	12	\N	t	f	2015-04-08 12:44:20.388023	2016-08-05 22:48:59.272863	60	Property	0	\N	\N	\N	DOC_NONE	0
1559	1	\N	t	f	2015-04-08 12:44:28.91055	2016-08-05 22:48:59.297069	61	Property	0	\N	\N	\N	DOC_NONE	0
709	12	\N	t	t	2015-03-28 10:44:19.100505	2016-08-05 22:48:59.319459	90	Property	0	\N	\N	\N	DOC_AVAILABLE	0
729	14	\N	t	t	2015-03-28 10:44:33.671197	2016-08-05 22:48:59.343563	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
736	13	\N	t	t	2015-03-28 10:44:39.523535	2016-08-05 22:48:59.364353	208	Property	0	\N	\N	\N	DOC_AVAILABLE	0
743	11	\N	t	f	2015-03-28 10:44:44.782246	2016-08-05 22:48:59.386078	213	Property	0	\N	\N	\N	DOC_NONE	0
756	8	\N	t	t	2015-03-28 10:44:54.707993	2016-08-05 22:48:59.415141	13	Property	0	\N	\N	\N	DOC_AVAILABLE	0
768	13	\N	t	t	2015-03-28 10:45:04.011628	2016-08-05 22:48:59.436716	214	Property	0	\N	\N	\N	DOC_AVAILABLE	0
765	2	\N	t	t	2015-03-28 10:45:02.020973	2016-08-05 22:48:59.450305	214	Property	0	\N	\N	\N	DOC_AVAILABLE	0
773	13	\N	t	t	2015-03-28 10:45:08.616784	2016-08-05 22:48:59.468476	225	Property	0	\N	\N	\N	DOC_AVAILABLE	0
779	1	\N	t	f	2015-03-28 10:45:17.32465	2016-08-05 22:48:59.496852	203	Property	0	\N	\N	\N	DOC_NONE	0
1581	17	\N	t	t	2015-04-08 12:45:08.61846	2016-08-05 22:48:59.519401	62	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1571	7	\N	t	f	2015-04-08 12:44:54.6992	2016-08-05 22:48:59.541185	62	Property	0	\N	\N	\N	DOC_NONE	0
1577	13	\N	t	f	2015-04-08 12:45:03.242372	2016-08-05 22:48:59.567222	62	Property	0	\N	\N	\N	DOC_NONE	0
1583	2	\N	t	f	2015-04-08 12:45:11.485405	2016-08-05 22:48:59.589805	63	Property	0	\N	\N	\N	DOC_NONE	0
1589	8	\N	t	f	2015-04-08 12:45:19.534783	2016-08-05 22:48:59.616946	63	Property	0	\N	\N	\N	DOC_NONE	0
1595	14	\N	t	f	2015-04-08 12:45:28.407676	2016-08-05 22:48:59.638642	63	Property	0	\N	\N	\N	DOC_NONE	0
1593	12	\N	t	t	2015-04-08 12:45:25.280648	2016-08-05 22:48:59.661411	63	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1606	16	\N	t	f	2015-04-08 12:45:51.479773	2016-08-05 22:48:59.688167	64	Property	0	\N	\N	\N	DOC_NONE	0
1611	5	\N	t	f	2015-04-08 12:46:00.165747	2016-08-05 22:48:59.710713	66	Property	0	\N	\N	\N	DOC_NONE	0
1620	14	\N	t	f	2015-04-08 12:46:13.58178	2016-08-05 22:48:59.737707	66	Property	0	\N	\N	\N	DOC_NONE	0
1626	4	\N	t	f	2015-04-08 12:46:23.759696	2016-08-05 22:48:59.759214	67	Property	0	\N	\N	\N	DOC_NONE	0
1631	9	\N	t	f	2015-04-08 12:46:31.218939	2016-08-05 22:48:59.781428	67	Property	0	\N	\N	\N	DOC_NONE	0
1637	15	\N	t	f	2015-04-08 12:46:40.17237	2016-08-05 22:48:59.809239	67	Property	0	\N	\N	\N	DOC_NONE	0
1642	5	\N	t	f	2015-04-08 12:46:49.83105	2016-08-05 22:48:59.83088	68	Property	0	\N	\N	\N	DOC_NONE	0
1645	13	\N	t	f	2015-04-08 12:46:59.626919	2016-08-05 22:48:59.843736	68	Property	0	\N	\N	\N	DOC_NONE	0
1650	5	\N	t	f	2015-04-08 12:47:11.459487	2016-08-05 22:48:59.862431	69	Property	0	\N	\N	\N	DOC_NONE	0
1658	5	\N	t	f	2015-04-08 12:47:33.978913	2016-08-05 22:48:59.888689	70	Property	0	\N	\N	\N	DOC_NONE	0
1663	10	\N	t	f	2015-04-08 12:47:41.856373	2016-08-05 22:48:59.911335	70	Property	0	\N	\N	\N	DOC_NONE	0
1668	15	\N	t	f	2015-04-08 12:47:49.310195	2016-08-05 22:48:59.934587	70	Property	0	\N	\N	\N	DOC_NONE	0
1674	9	\N	t	f	2015-04-08 12:48:03.351503	2016-08-05 22:48:59.96195	71	Property	0	\N	\N	\N	DOC_NONE	0
1679	4	\N	t	f	2015-04-08 12:48:17.934423	2016-08-05 22:48:59.984812	72	Property	0	\N	\N	\N	DOC_NONE	0
1685	10	\N	t	f	2015-04-08 12:48:26.89941	2016-08-05 22:49:00.016645	72	Property	0	\N	\N	\N	DOC_NONE	0
1690	15	\N	t	f	2015-04-08 12:48:34.371968	2016-08-05 22:49:00.069649	72	Property	0	\N	\N	\N	DOC_NONE	0
1695	5	\N	t	f	2015-04-08 12:48:43.983371	2016-08-05 22:49:00.093617	73	Property	0	\N	\N	\N	DOC_NONE	0
1701	11	\N	t	f	2015-04-08 12:48:52.998024	2016-08-05 22:49:00.123008	73	Property	0	\N	\N	\N	DOC_NONE	0
1708	1	\N	t	f	2015-04-08 12:49:03.621942	2016-08-05 22:49:00.14548	74	Property	0	\N	\N	\N	DOC_NONE	0
1715	1	\N	t	f	2015-04-08 12:49:24.170543	2016-08-05 22:49:00.172771	75	Property	0	\N	\N	\N	DOC_NONE	0
1720	6	\N	t	f	2015-04-08 12:49:31.621905	2016-08-05 22:49:00.195977	75	Property	0	\N	\N	\N	DOC_NONE	0
1726	12	\N	t	f	2015-04-08 12:49:40.56429	2016-08-05 22:49:00.220412	75	Property	0	\N	\N	\N	DOC_NONE	0
1732	1	\N	t	f	2015-04-08 12:49:49.678271	2016-08-05 22:49:00.246539	76	Property	0	\N	\N	\N	DOC_NONE	0
1737	6	\N	t	f	2015-04-08 12:49:57.131883	2016-08-05 22:49:00.26816	76	Property	0	\N	\N	\N	DOC_NONE	0
1740	9	\N	t	f	2015-04-08 12:50:01.68988	2016-08-05 22:49:00.283727	76	Property	0	\N	\N	\N	DOC_NONE	0
1744	13	\N	t	f	2015-04-08 12:50:07.736831	2016-08-05 22:49:00.299902	76	Property	0	\N	\N	\N	DOC_NONE	0
1752	6	\N	t	f	2015-04-08 12:50:22.586885	2016-08-05 22:49:00.324811	77	Property	0	\N	\N	\N	DOC_NONE	0
1757	2	\N	t	f	2015-04-08 12:50:38.155782	2016-08-05 22:49:00.34882	79	Property	0	\N	\N	\N	DOC_NONE	0
1762	7	\N	t	f	2015-04-08 12:50:45.616385	2016-08-05 22:49:00.369451	79	Property	0	\N	\N	\N	DOC_NONE	0
1769	14	\N	t	f	2015-04-08 12:50:56.047078	2016-08-05 22:49:00.393761	79	Property	0	\N	\N	\N	DOC_NONE	0
1774	2	\N	t	f	2015-04-08 12:51:03.662275	2016-08-05 22:49:00.417228	80	Property	0	\N	\N	\N	DOC_NONE	0
1780	8	\N	t	f	2015-04-08 12:51:12.633614	2016-08-05 22:49:00.444414	80	Property	0	\N	\N	\N	DOC_NONE	0
1785	13	\N	t	f	2015-04-08 12:51:20.103738	2016-08-05 22:49:00.470124	80	Property	0	\N	\N	\N	DOC_NONE	0
1790	1	\N	t	f	2015-04-08 12:51:28.130413	2016-08-05 22:49:00.492755	81	Property	0	\N	\N	\N	DOC_NONE	0
1817	2	\N	t	t	2015-04-08 12:52:34.118519	2016-08-05 22:49:00.548956	84	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1810	11	\N	t	f	2015-04-08 12:52:22.155845	2016-08-05 22:49:00.617983	83	Property	0	\N	\N	\N	DOC_NONE	0
1816	17	\N	t	f	2015-04-08 12:52:31.470008	2016-08-05 22:49:00.641576	83	Property	0	\N	\N	\N	DOC_NONE	0
1822	7	\N	t	f	2015-04-08 12:52:41.562519	2016-08-05 22:49:00.663812	84	Property	0	\N	\N	\N	DOC_NONE	0
1828	13	\N	t	f	2015-04-08 12:52:50.506045	2016-08-05 22:49:00.690067	84	Property	0	\N	\N	\N	DOC_NONE	0
1833	1	\N	t	f	2015-04-08 12:52:58.141501	2016-08-05 22:49:00.713757	85	Property	0	\N	\N	\N	DOC_NONE	0
1837	8	\N	t	f	2015-04-08 12:53:07.472213	2016-08-05 22:49:00.727623	85	Property	0	\N	\N	\N	DOC_NONE	0
1841	17	\N	t	f	2015-04-08 12:53:18.442614	2016-08-05 22:49:00.747326	85	Property	0	\N	\N	\N	DOC_NONE	0
1847	6	\N	t	f	2015-04-08 12:53:28.308865	2016-08-05 22:49:00.779035	86	Property	0	\N	\N	\N	DOC_NONE	0
1852	11	\N	t	f	2015-04-08 12:53:36.887589	2016-08-05 22:49:00.803107	86	Property	0	\N	\N	\N	DOC_NONE	0
1858	17	\N	t	f	2015-04-08 12:53:45.837538	2016-08-05 22:49:00.827514	86	Property	0	\N	\N	\N	DOC_NONE	0
1864	6	\N	t	f	2015-04-08 12:53:55.401263	2016-08-05 22:49:00.85409	87	Property	0	\N	\N	\N	DOC_NONE	0
1869	11	\N	t	f	2015-04-08 12:54:02.842842	2016-08-05 22:49:00.879926	87	Property	0	\N	\N	\N	DOC_NONE	0
1875	17	\N	t	f	2015-04-08 12:54:11.780527	2016-08-05 22:49:00.909615	87	Property	0	\N	\N	\N	DOC_NONE	0
1986	7	\N	t	f	2015-04-08 12:57:19.289925	2016-08-05 22:49:00.93178	97	Property	0	\N	\N	\N	DOC_NONE	0
1991	12	\N	t	f	2015-04-08 12:57:26.72803	2016-08-05 22:49:00.956029	97	Property	0	\N	\N	\N	DOC_NONE	0
2002	6	\N	t	t	2015-04-08 12:57:43.369543	2016-08-05 22:49:00.983623	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2000	4	\N	t	t	2015-04-08 12:57:40.388101	2016-08-05 22:49:01.008818	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2009	13	\N	t	t	2015-04-08 12:57:53.777591	2016-08-05 22:49:01.035464	98	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2014	1	\N	t	f	2015-04-08 12:58:01.431087	2016-08-05 22:49:01.059866	99	Property	0	\N	\N	\N	DOC_NONE	0
2019	6	\N	t	f	2015-04-08 12:58:08.885919	2016-08-05 22:49:01.083477	99	Property	0	\N	\N	\N	DOC_NONE	0
2025	12	\N	t	f	2015-04-08 12:58:18.196543	2016-08-05 22:49:01.115185	99	Property	0	\N	\N	\N	DOC_NONE	0
2030	17	\N	t	f	2015-04-08 12:58:25.666065	2016-08-05 22:49:01.142707	99	Property	0	\N	\N	\N	DOC_NONE	0
2033	3	\N	t	f	2015-04-08 12:58:30.276148	2016-08-05 22:49:01.160471	100	Property	0	\N	\N	\N	DOC_NONE	0
2037	7	\N	t	f	2015-04-08 12:58:36.215094	2016-08-05 22:49:01.185696	100	Property	0	\N	\N	\N	DOC_NONE	0
2043	13	\N	t	f	2015-04-08 12:58:45.244726	2016-08-05 22:49:01.223166	100	Property	0	\N	\N	\N	DOC_NONE	0
2048	1	\N	t	f	2015-04-08 12:58:52.922483	2016-08-05 22:49:01.256094	101	Property	0	\N	\N	\N	DOC_NONE	0
2053	9	\N	t	f	2015-04-08 12:59:04.22024	2016-08-05 22:49:01.283258	101	Property	0	\N	\N	\N	DOC_NONE	0
2059	17	\N	t	f	2015-04-08 12:59:15.099444	2016-08-05 22:49:01.323737	101	Property	0	\N	\N	\N	DOC_NONE	0
2064	7	\N	t	f	2015-04-08 12:59:24.731362	2016-08-05 22:49:01.348349	102	Property	0	\N	\N	\N	DOC_NONE	0
2070	13	\N	t	f	2015-04-08 12:59:33.662913	2016-08-05 22:49:01.380939	102	Property	0	\N	\N	\N	DOC_NONE	0
2076	2	\N	t	f	2015-04-08 12:59:43.140405	2016-08-05 22:49:01.410295	103	Property	0	\N	\N	\N	DOC_NONE	0
2082	11	\N	t	f	2015-04-08 12:59:55.86785	2016-08-05 22:49:01.445295	103	Property	0	\N	\N	\N	DOC_NONE	0
2088	3	\N	t	f	2015-04-08 13:00:09.198876	2016-08-05 22:49:01.480008	186	Property	0	\N	\N	\N	DOC_NONE	0
2093	8	\N	t	f	2015-04-08 13:00:16.697355	2016-08-05 22:49:01.502256	186	Property	0	\N	\N	\N	DOC_NONE	0
2099	14	\N	t	f	2015-04-08 13:00:25.664147	2016-08-05 22:49:01.528833	186	Property	0	\N	\N	\N	DOC_NONE	0
2106	7	\N	t	f	2015-04-08 13:00:39.70168	2016-08-05 22:49:01.548487	106	Property	0	\N	\N	\N	DOC_NONE	0
2111	13	\N	t	f	2015-04-08 13:00:48.254103	2016-08-05 22:49:01.572555	106	Property	0	\N	\N	\N	DOC_NONE	0
2117	10	\N	t	f	2015-04-08 13:01:05.694119	2016-08-05 22:49:01.601392	107	Property	0	\N	\N	\N	DOC_NONE	0
2122	6	\N	t	f	2015-04-08 13:01:21.701486	2016-08-05 22:49:01.627071	108	Property	0	\N	\N	\N	DOC_NONE	0
2126	10	\N	t	f	2015-04-08 13:01:27.800638	2016-08-05 22:49:01.642965	108	Property	0	\N	\N	\N	DOC_NONE	0
2130	14	\N	t	f	2015-04-08 13:01:33.798101	2016-08-05 22:49:01.666021	108	Property	0	\N	\N	\N	DOC_NONE	0
2136	6	\N	t	f	2015-04-08 13:01:45.967788	2016-08-05 22:49:01.696415	109	Property	0	\N	\N	\N	DOC_NONE	0
2141	17	\N	t	f	2015-04-08 13:01:59.828918	2016-08-05 22:49:01.723398	109	Property	0	\N	\N	\N	DOC_NONE	0
2151	12	\N	t	f	2015-04-08 13:02:17.352638	2016-08-05 22:49:01.750241	110	Property	0	\N	\N	\N	DOC_NONE	0
2158	3	\N	t	t	2015-04-08 13:02:29.005472	2016-08-05 22:49:01.782239	111	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2163	13	\N	t	f	2015-04-08 13:02:41.468364	2016-08-05 22:49:01.807407	111	Property	0	\N	\N	\N	DOC_NONE	0
2170	7	\N	t	f	2015-04-08 13:02:56.125666	2016-08-05 22:49:01.838957	112	Property	0	\N	\N	\N	DOC_NONE	0
2175	12	\N	t	f	2015-04-08 13:03:03.689887	2016-08-05 22:49:01.864899	112	Property	0	\N	\N	\N	DOC_NONE	0
2180	17	\N	t	f	2015-04-08 13:03:11.170244	2016-08-05 22:49:01.887878	112	Property	0	\N	\N	\N	DOC_NONE	0
2187	3	\N	t	f	2015-04-08 13:03:35.442364	2016-08-05 22:49:01.916293	114	Property	0	\N	\N	\N	DOC_NONE	0
2193	9	\N	t	f	2015-04-08 13:03:44.498155	2016-08-05 22:49:01.940662	114	Property	0	\N	\N	\N	DOC_NONE	0
2199	15	\N	t	f	2015-04-08 13:03:54.010251	2016-08-05 22:49:01.976466	114	Property	0	\N	\N	\N	DOC_NONE	0
2204	3	\N	t	f	2015-04-08 13:04:01.838286	2016-08-05 22:49:02.001374	115	Property	0	\N	\N	\N	DOC_NONE	0
2209	8	\N	t	f	2015-04-08 13:04:09.458984	2016-08-05 22:49:02.0277	115	Property	0	\N	\N	\N	DOC_NONE	0
2216	15	\N	t	f	2015-04-08 13:04:20.451104	2016-08-05 22:49:02.05842	115	Property	0	\N	\N	\N	DOC_NONE	0
2221	3	\N	t	f	2015-04-08 13:04:28.118687	2016-08-05 22:49:02.084386	116	Property	0	\N	\N	\N	DOC_NONE	0
2224	6	\N	t	f	2015-04-08 13:04:32.606984	2016-08-05 22:49:02.100283	116	Property	0	\N	\N	\N	DOC_NONE	0
2228	10	\N	t	f	2015-04-08 13:04:38.610723	2016-08-05 22:49:02.122985	116	Property	0	\N	\N	\N	DOC_NONE	0
2321	10	\N	t	f	2015-04-08 13:07:30.643096	2016-08-05 22:49:02.156033	125	Property	0	\N	\N	\N	DOC_NONE	0
2294	3	\N	t	t	2015-04-08 13:06:35.248423	2016-08-05 22:49:02.181344	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2332	9	\N	t	f	2015-04-08 13:07:52.708592	2016-08-05 22:49:02.20657	126	Property	0	\N	\N	\N	DOC_NONE	0
2338	4	\N	t	f	2015-04-08 13:08:07.936214	2016-08-05 22:49:02.239333	128	Property	0	\N	\N	\N	DOC_NONE	0
2344	10	\N	t	f	2015-04-08 13:08:16.932276	2016-08-05 22:49:02.273575	128	Property	0	\N	\N	\N	DOC_NONE	0
2351	17	\N	t	f	2015-04-08 13:08:27.485892	2016-08-05 22:49:02.303061	128	Property	0	\N	\N	\N	DOC_NONE	0
2356	5	\N	t	f	2015-04-08 13:08:35.520764	2016-08-05 22:49:02.324894	129	Property	0	\N	\N	\N	DOC_NONE	0
2361	10	\N	t	f	2015-04-08 13:08:43.385066	2016-08-05 22:49:02.35005	129	Property	0	\N	\N	\N	DOC_NONE	0
2367	16	\N	t	f	2015-04-08 13:08:52.826044	2016-08-05 22:49:02.381206	129	Property	0	\N	\N	\N	DOC_NONE	0
2370	3	\N	t	t	2015-04-08 13:08:58.46257	2016-08-05 22:49:02.406848	130	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2379	5	\N	t	f	2015-04-08 13:09:23.018614	2016-08-05 22:49:02.43821	144	Property	0	\N	\N	\N	DOC_NONE	0
2384	10	\N	t	f	2015-04-08 13:09:30.532373	2016-08-05 22:49:02.461931	144	Property	0	\N	\N	\N	DOC_NONE	0
2389	15	\N	t	f	2015-04-08 13:09:38.386309	2016-08-05 22:49:02.486302	144	Property	0	\N	\N	\N	DOC_NONE	0
2396	6	\N	t	f	2015-04-08 13:09:50.352481	2016-08-05 22:49:02.515673	132	Property	0	\N	\N	\N	DOC_NONE	0
2401	11	\N	t	f	2015-04-08 13:09:58.252316	2016-08-05 22:49:02.540596	132	Property	0	\N	\N	\N	DOC_NONE	0
2404	14	\N	t	f	2015-04-08 13:10:02.923564	2016-08-05 22:49:02.557113	132	Property	0	\N	\N	\N	DOC_NONE	0
2408	2	\N	t	f	2015-04-08 13:10:10.158588	2016-08-05 22:49:02.580952	133	Property	0	\N	\N	\N	DOC_NONE	0
2446	1	\N	t	f	2015-04-08 13:11:43.735347	2016-08-05 22:49:02.616559	137	Property	0	\N	\N	\N	DOC_NONE	0
2451	8	\N	t	f	2015-04-08 13:11:53.621058	2016-08-05 22:49:02.643665	137	Property	0	\N	\N	\N	DOC_NONE	0
2456	13	\N	t	f	2015-04-08 13:12:01.876959	2016-08-05 22:49:02.66981	137	Property	0	\N	\N	\N	DOC_NONE	0
2463	3	\N	t	f	2015-04-08 13:12:13.035666	2016-08-05 22:49:02.704983	138	Property	0	\N	\N	\N	DOC_NONE	0
2490	13	\N	t	f	2015-04-08 13:12:55.160336	2016-08-05 22:49:02.739582	139	Property	0	\N	\N	\N	DOC_NONE	0
2497	5	\N	t	f	2015-04-08 13:13:09.097822	2016-08-05 22:49:02.771602	140	Property	0	\N	\N	\N	DOC_NONE	0
2425	3	\N	t	t	2015-04-08 13:10:37.262925	2016-08-05 22:49:02.800265	134	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2433	3	\N	t	t	2015-04-08 13:10:59.207513	2016-08-05 22:49:02.824075	135	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2506	4	\N	t	f	2015-04-08 13:13:29.768606	2016-08-05 22:49:02.856162	141	Property	0	\N	\N	\N	DOC_NONE	0
2511	9	\N	t	f	2015-04-08 13:13:38.100782	2016-08-05 22:49:02.884635	141	Property	0	\N	\N	\N	DOC_NONE	0
2517	15	\N	t	f	2015-04-08 13:13:47.501771	2016-08-05 22:49:02.91662	141	Property	0	\N	\N	\N	DOC_NONE	0
2524	16	\N	t	f	2015-04-08 13:14:10.01526	2016-08-05 22:49:02.947531	142	Property	0	\N	\N	\N	DOC_NONE	0
2530	5	\N	t	f	2015-04-08 13:14:19.336994	2016-08-05 22:49:02.974912	143	Property	0	\N	\N	\N	DOC_NONE	0
2536	11	\N	t	f	2015-04-08 13:14:28.739653	2016-08-05 22:49:03.080942	143	Property	0	\N	\N	\N	DOC_NONE	0
2541	16	\N	t	f	2015-04-08 13:14:36.60676	2016-08-05 22:49:03.117131	143	Property	0	\N	\N	\N	DOC_NONE	0
2544	2	\N	t	f	2015-04-08 13:14:41.305004	2016-08-05 22:49:03.139409	146	Property	0	\N	\N	\N	DOC_NONE	0
2549	7	\N	t	f	2015-04-08 13:14:48.840779	2016-08-05 22:49:03.167563	146	Property	0	\N	\N	\N	DOC_NONE	0
2555	13	\N	t	f	2015-04-08 13:14:57.865689	2016-08-05 22:49:03.198025	146	Property	0	\N	\N	\N	DOC_NONE	0
2560	1	\N	t	f	2015-04-08 13:15:05.692152	2016-08-05 22:49:03.229008	147	Property	0	\N	\N	\N	DOC_NONE	0
2565	6	\N	t	f	2015-04-08 13:15:13.962241	2016-08-05 22:49:03.256877	147	Property	0	\N	\N	\N	DOC_NONE	0
2573	14	\N	t	t	2015-04-08 13:15:26.325625	2016-08-05 22:49:03.300729	147	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2577	1	\N	t	f	2015-04-08 13:15:32.481758	2016-08-05 22:49:03.329288	148	Property	0	\N	\N	\N	DOC_NONE	0
2583	7	\N	t	f	2015-04-08 13:15:41.475546	2016-08-05 22:49:03.389937	148	Property	0	\N	\N	\N	DOC_NONE	0
2588	12	\N	t	f	2015-04-08 13:15:49.034795	2016-08-05 22:49:03.444156	148	Property	0	\N	\N	\N	DOC_NONE	0
2595	4	\N	t	f	2015-04-08 13:16:01.768386	2016-08-05 22:49:03.479675	149	Property	0	\N	\N	\N	DOC_NONE	0
2601	11	\N	t	f	2015-04-08 13:16:11.759363	2016-08-05 22:49:03.523035	149	Property	0	\N	\N	\N	DOC_NONE	0
2607	10	\N	t	f	2015-04-08 13:16:31.653704	2016-08-05 22:49:03.552826	150	Property	0	\N	\N	\N	DOC_NONE	0
2615	6	\N	t	f	2015-04-08 13:16:49.619805	2016-08-05 22:49:03.582866	151	Property	0	\N	\N	\N	DOC_NONE	0
2620	11	\N	t	f	2015-04-08 13:16:57.550274	2016-08-05 22:49:03.609753	151	Property	0	\N	\N	\N	DOC_NONE	0
2625	16	\N	t	f	2015-04-08 13:17:06.979849	2016-08-05 22:49:03.641631	151	Property	0	\N	\N	\N	DOC_NONE	0
2631	5	\N	t	f	2015-04-08 13:17:17.475358	2016-08-05 22:49:03.678632	152	Property	0	\N	\N	\N	DOC_NONE	0
2637	11	\N	t	f	2015-04-08 13:17:27.310982	2016-08-05 22:49:03.710453	152	Property	0	\N	\N	\N	DOC_NONE	0
2640	14	\N	t	f	2015-04-08 13:17:32.236628	2016-08-05 22:49:03.725465	152	Property	0	\N	\N	\N	DOC_NONE	0
2644	1	\N	t	f	2015-04-08 13:17:38.843879	2016-08-05 22:49:03.745587	153	Property	0	\N	\N	\N	DOC_NONE	0
2650	12	\N	t	f	2015-04-08 13:17:54.515496	2016-08-05 22:49:03.792068	153	Property	0	\N	\N	\N	DOC_NONE	0
2655	3	\N	t	f	2015-04-08 13:18:05.672922	2016-08-05 22:49:03.836244	154	Property	0	\N	\N	\N	DOC_NONE	0
2661	9	\N	t	f	2015-04-08 13:18:14.803659	2016-08-05 22:49:04.063363	154	Property	0	\N	\N	\N	DOC_NONE	0
2667	15	\N	t	f	2015-04-08 13:18:23.917029	2016-08-05 22:49:04.09199	154	Property	0	\N	\N	\N	DOC_NONE	0
2672	3	\N	t	f	2015-04-08 13:18:31.701879	2016-08-05 22:49:04.115818	155	Property	0	\N	\N	\N	DOC_NONE	0
2678	9	\N	t	f	2015-04-08 13:18:41.119684	2016-08-05 22:49:04.150326	155	Property	0	\N	\N	\N	DOC_NONE	0
2685	16	\N	t	f	2015-04-08 13:18:51.620536	2016-08-05 22:49:04.178365	155	Property	0	\N	\N	\N	DOC_NONE	0
2690	4	\N	t	f	2015-04-08 13:18:59.276837	2016-08-05 22:49:04.209924	156	Property	0	\N	\N	\N	DOC_NONE	0
2696	10	\N	t	f	2015-04-08 13:19:08.290375	2016-08-05 22:49:04.243194	156	Property	0	\N	\N	\N	DOC_NONE	0
2702	16	\N	t	f	2015-04-08 13:19:17.727093	2016-08-05 22:49:04.28092	156	Property	0	\N	\N	\N	DOC_NONE	0
2709	8	\N	t	f	2015-04-08 13:19:31.642916	2016-08-05 22:49:04.31642	157	Property	0	\N	\N	\N	DOC_NONE	0
2714	13	\N	t	f	2015-04-08 13:19:40.465675	2016-08-05 22:49:04.342116	157	Property	0	\N	\N	\N	DOC_NONE	0
2722	4	\N	t	t	2015-04-08 13:19:54.381835	2016-08-05 22:49:04.364466	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2729	14	\N	t	t	2015-04-08 13:20:10.042132	2016-08-05 22:49:04.390151	158	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2732	1	\N	t	f	2015-04-08 13:20:16.263021	2016-08-05 22:49:04.412393	161	Property	0	\N	\N	\N	DOC_NONE	0
2735	4	\N	t	f	2015-04-08 13:20:21.253034	2016-08-05 22:49:04.425557	161	Property	0	\N	\N	\N	DOC_NONE	0
2739	8	\N	t	f	2015-04-08 13:20:27.756612	2016-08-05 22:49:04.449133	161	Property	0	\N	\N	\N	DOC_NONE	0
2745	14	\N	t	f	2015-04-08 13:20:37.393887	2016-08-05 22:49:04.479509	161	Property	0	\N	\N	\N	DOC_NONE	0
2751	3	\N	t	f	2015-04-08 13:20:48.333936	2016-08-05 22:49:04.507956	162	Property	0	\N	\N	\N	DOC_NONE	0
2756	8	\N	t	f	2015-04-08 13:20:56.375804	2016-08-05 22:49:04.528846	162	Property	0	\N	\N	\N	DOC_NONE	0
2762	14	\N	t	f	2015-04-08 13:21:06.738186	2016-08-05 22:49:04.554413	162	Property	0	\N	\N	\N	DOC_NONE	0
2767	2	\N	t	f	2015-04-08 13:21:15.077591	2016-08-05 22:49:04.578809	163	Property	0	\N	\N	\N	DOC_NONE	0
2775	10	\N	t	f	2015-04-08 13:21:29.474813	2016-08-05 22:49:04.606087	163	Property	0	\N	\N	\N	DOC_NONE	0
2780	15	\N	t	f	2015-04-08 13:21:38.603449	2016-08-05 22:49:04.627289	163	Property	0	\N	\N	\N	DOC_NONE	0
2785	3	\N	t	f	2015-04-08 13:21:48.285109	2016-08-05 22:49:04.651274	164	Property	0	\N	\N	\N	DOC_NONE	0
2792	10	\N	t	f	2015-04-08 13:22:00.126332	2016-08-05 22:49:04.678588	164	Property	0	\N	\N	\N	DOC_NONE	0
2798	16	\N	t	f	2015-04-08 13:22:09.683685	2016-08-05 22:49:04.703665	164	Property	0	\N	\N	\N	DOC_NONE	0
2809	17	\N	t	t	2015-04-08 13:22:35.605778	2016-08-05 22:49:04.729237	165	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2810	1	\N	t	f	2015-04-08 13:22:37.423746	2016-08-05 22:49:04.74987	166	Property	0	\N	\N	\N	DOC_NONE	0
2816	9	\N	t	f	2015-04-08 13:22:50.882724	2016-08-05 22:49:04.773164	166	Property	0	\N	\N	\N	DOC_NONE	0
2822	3	\N	t	f	2015-04-08 13:23:06.190068	2016-08-05 22:49:04.800376	167	Property	0	\N	\N	\N	DOC_NONE	0
2827	8	\N	t	f	2015-04-08 13:23:14.156027	2016-08-05 22:49:04.820783	167	Property	0	\N	\N	\N	DOC_NONE	0
2830	11	\N	t	f	2015-04-08 13:23:18.745515	2016-08-05 22:49:04.833276	167	Property	0	\N	\N	\N	DOC_NONE	0
2834	15	\N	t	f	2015-04-08 13:23:25.197464	2016-08-05 22:49:04.849474	167	Property	0	\N	\N	\N	DOC_NONE	0
2841	5	\N	t	f	2015-04-08 13:23:36.950174	2016-08-05 22:49:04.873763	168	Property	0	\N	\N	\N	DOC_NONE	0
2846	10	\N	t	f	2015-04-08 13:23:44.966359	2016-08-05 22:49:04.896487	168	Property	0	\N	\N	\N	DOC_NONE	0
2851	15	\N	t	f	2015-04-08 13:23:55.213549	2016-08-05 22:49:04.920683	168	Property	0	\N	\N	\N	DOC_NONE	0
2857	9	\N	t	f	2015-04-08 13:24:10.203069	2016-08-05 22:49:04.950115	169	Property	0	\N	\N	\N	DOC_NONE	0
2882	2	\N	t	f	2015-04-08 13:25:14.33415	2016-08-05 22:49:04.975171	172	Property	0	\N	\N	\N	DOC_NONE	0
2889	9	\N	t	f	2015-04-08 13:25:25.938076	2016-08-05 22:49:05.060277	172	Property	0	\N	\N	\N	DOC_NONE	0
2894	14	\N	t	f	2015-04-08 13:25:34.668211	2016-08-05 22:49:05.085409	172	Property	0	\N	\N	\N	DOC_NONE	0
2902	9	\N	t	f	2015-04-08 13:25:51.690471	2016-08-05 22:49:05.106455	174	Property	0	\N	\N	\N	DOC_NONE	0
2909	4	\N	t	f	2015-04-08 13:26:07.877355	2016-08-05 22:49:05.129063	175	Property	0	\N	\N	\N	DOC_NONE	0
2914	9	\N	t	f	2015-04-08 13:26:15.480179	2016-08-05 22:49:05.148525	175	Property	0	\N	\N	\N	DOC_NONE	0
2920	15	\N	t	f	2015-04-08 13:26:25.322826	2016-08-05 22:49:05.17119	175	Property	0	\N	\N	\N	DOC_NONE	0
2926	5	\N	t	f	2015-04-08 13:26:35.999151	2016-08-05 22:49:05.19056	176	Property	0	\N	\N	\N	DOC_NONE	0
2935	5	\N	t	f	2015-04-08 13:26:58.83682	2016-08-05 22:49:05.210053	177	Property	0	\N	\N	\N	DOC_NONE	0
2941	11	\N	t	f	2015-04-08 13:27:08.253415	2016-08-05 22:49:05.233288	177	Property	0	\N	\N	\N	DOC_NONE	0
2863	8	\N	t	t	2015-04-08 13:24:31.903087	2016-08-05 22:49:05.253243	170	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2865	14	\N	t	f	2015-04-08 13:24:39.343113	2016-08-05 22:49:05.266809	170	Property	0	\N	\N	\N	DOC_NONE	0
2866	17	\N	t	f	2015-04-08 13:24:43.656132	2016-08-05 22:49:05.284416	170	Property	0	\N	\N	\N	DOC_NONE	0
2873	8	\N	t	f	2015-04-08 13:24:55.4364	2016-08-05 22:49:05.309202	171	Property	0	\N	\N	\N	DOC_NONE	0
2933	3	\N	t	t	2015-04-08 13:26:55.80108	2016-08-05 22:49:05.329928	177	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2945	15	\N	t	t	2015-04-08 13:27:14.310827	2016-08-05 22:49:05.352292	177	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2950	3	\N	t	f	2015-04-08 13:27:22.00601	2016-08-05 22:49:05.377619	178	Property	0	\N	\N	\N	DOC_NONE	0
2955	8	\N	t	f	2015-04-08 13:27:29.952172	2016-08-05 22:49:05.399306	178	Property	0	\N	\N	\N	DOC_NONE	0
2961	14	\N	t	f	2015-04-08 13:27:39.932537	2016-08-05 22:49:05.425696	178	Property	0	\N	\N	\N	DOC_NONE	0
2966	4	\N	t	f	2015-04-08 13:27:50.036156	2016-08-05 22:49:05.445793	179	Property	0	\N	\N	\N	DOC_NONE	0
2972	15	\N	t	f	2015-04-08 13:28:05.287697	2016-08-05 22:49:05.467935	179	Property	0	\N	\N	\N	DOC_NONE	0
2981	7	\N	t	f	2015-04-08 13:28:19.368526	2016-08-05 22:49:05.493912	180	Property	0	\N	\N	\N	DOC_NONE	0
2987	14	\N	t	f	2015-04-08 13:28:30.195256	2016-08-05 22:49:05.520061	180	Property	0	\N	\N	\N	DOC_NONE	0
3003	13	\N	t	f	2015-04-08 13:28:55.34791	2016-08-05 22:49:05.550271	181	Property	0	\N	\N	\N	DOC_NONE	0
3009	2	\N	t	f	2015-04-08 13:29:05.518092	2016-08-05 22:49:05.573482	182	Property	0	\N	\N	\N	DOC_NONE	0
3014	7	\N	t	f	2015-04-08 13:29:13.500058	2016-08-05 22:49:05.598902	182	Property	0	\N	\N	\N	DOC_NONE	0
3020	13	\N	t	f	2015-04-08 13:29:26.13194	2016-08-05 22:49:05.628421	182	Property	0	\N	\N	\N	DOC_NONE	0
3025	1	\N	t	f	2015-04-08 13:29:34.019205	2016-08-05 22:49:05.650218	183	Property	0	\N	\N	\N	DOC_NONE	0
3028	4	\N	t	f	2015-04-08 13:29:38.639964	2016-08-05 22:49:05.667039	183	Property	0	\N	\N	\N	DOC_NONE	0
3032	8	\N	t	f	2015-04-08 13:29:44.752808	2016-08-05 22:49:05.691343	183	Property	0	\N	\N	\N	DOC_NONE	0
2975	1	\N	t	t	2015-04-08 13:28:09.9712	2016-08-05 22:49:05.719089	180	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2995	5	\N	t	t	2015-04-08 13:28:42.825054	2016-08-05 22:49:05.739598	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2999	9	\N	t	t	2015-04-08 13:28:48.896584	2016-08-05 22:49:05.760775	181	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3041	17	\N	t	f	2015-04-08 13:29:58.485185	2016-08-05 22:49:05.784534	183	Property	0	\N	\N	\N	DOC_NONE	0
3046	12	\N	t	f	2015-04-08 13:30:14.480586	2016-08-05 22:49:05.803175	184	Property	0	\N	\N	\N	DOC_NONE	0
3053	4	\N	t	f	2015-04-08 13:30:29.366176	2016-08-05 22:49:05.826752	185	Property	0	\N	\N	\N	DOC_NONE	0
3060	14	\N	t	f	2015-04-08 13:30:44.495572	2016-08-05 22:49:05.847392	185	Property	0	\N	\N	\N	DOC_NONE	0
3067	5	\N	t	f	2015-04-08 13:30:57.381003	2016-08-05 22:49:05.86722	188	Property	0	\N	\N	\N	DOC_NONE	0
3073	11	\N	t	f	2015-04-08 13:31:06.902656	2016-08-05 22:49:05.891738	188	Property	0	\N	\N	\N	DOC_NONE	0
3078	16	\N	t	f	2015-04-08 13:31:16.333446	2016-08-05 22:49:05.912254	188	Property	0	\N	\N	\N	DOC_NONE	0
3084	5	\N	t	f	2015-04-08 13:31:27.839363	2016-08-05 22:49:05.935591	189	Property	0	\N	\N	\N	DOC_NONE	0
3089	10	\N	t	f	2015-04-08 13:31:35.750246	2016-08-05 22:49:05.956513	189	Property	0	\N	\N	\N	DOC_NONE	0
3094	15	\N	t	f	2015-04-08 13:31:43.294654	2016-08-05 22:49:05.976324	189	Property	0	\N	\N	\N	DOC_NONE	0
3100	4	\N	t	f	2015-04-08 13:31:52.474535	2016-08-05 22:49:06.002295	190	Property	0	\N	\N	\N	DOC_NONE	0
3105	9	\N	t	f	2015-04-08 13:32:00.011646	2016-08-05 22:49:06.022442	190	Property	0	\N	\N	\N	DOC_NONE	0
3108	12	\N	t	f	2015-04-08 13:32:04.547221	2016-08-05 22:49:06.034174	190	Property	0	\N	\N	\N	DOC_NONE	0
3112	16	\N	t	f	2015-04-08 13:32:10.588995	2016-08-05 22:49:06.052538	190	Property	0	\N	\N	\N	DOC_NONE	0
3119	6	\N	t	f	2015-04-08 13:32:21.72485	2016-08-05 22:49:06.078526	191	Property	0	\N	\N	\N	DOC_NONE	0
3116	3	\N	t	f	2015-04-08 13:32:16.821994	2016-08-05 22:49:06.100156	191	Property	0	\N	\N	\N	DOC_NONE	0
3117	4	\N	t	f	2015-04-08 13:32:18.323573	2016-08-05 22:49:06.123068	191	Property	0	\N	\N	\N	DOC_NONE	0
3136	6	\N	t	f	2015-04-08 13:32:50.383627	2016-08-05 22:49:06.14838	192	Property	0	\N	\N	\N	DOC_NONE	0
3141	11	\N	t	f	2015-04-08 13:32:58.723306	2016-08-05 22:49:06.16886	192	Property	0	\N	\N	\N	DOC_NONE	0
3147	17	\N	t	f	2015-04-08 13:33:08.244246	2016-08-05 22:49:06.192988	192	Property	0	\N	\N	\N	DOC_NONE	0
3166	10	\N	t	f	2015-04-08 13:33:47.771226	2016-08-05 22:49:06.214956	194	Property	0	\N	\N	\N	DOC_NONE	0
3172	1	\N	t	f	2015-04-08 13:33:59.347838	2016-08-05 22:49:06.235883	195	Property	0	\N	\N	\N	DOC_NONE	0
3179	10	\N	t	f	2015-04-08 13:34:13.908164	2016-08-05 22:49:06.26006	195	Property	0	\N	\N	\N	DOC_NONE	0
3184	15	\N	t	f	2015-04-08 13:34:22.973977	2016-08-05 22:49:06.279851	195	Property	0	\N	\N	\N	DOC_NONE	0
3190	4	\N	t	f	2015-04-08 13:34:34.48422	2016-08-05 22:49:06.305195	196	Property	0	\N	\N	\N	DOC_NONE	0
3195	9	\N	t	f	2015-04-08 13:34:42.447817	2016-08-05 22:49:06.325785	196	Property	0	\N	\N	\N	DOC_NONE	0
3200	14	\N	t	f	2015-04-08 13:34:50.749998	2016-08-05 22:49:06.34894	196	Property	0	\N	\N	\N	DOC_NONE	0
3206	3	\N	t	f	2015-04-08 13:35:00.040592	2016-08-05 22:49:06.375477	197	Property	0	\N	\N	\N	DOC_NONE	0
3211	8	\N	t	f	2015-04-08 13:35:08.203294	2016-08-05 22:49:06.396247	197	Property	0	\N	\N	\N	DOC_NONE	0
3214	11	\N	t	f	2015-04-08 13:35:13.433127	2016-08-05 22:49:06.409675	197	Property	0	\N	\N	\N	DOC_NONE	0
3171	17	\N	t	t	2015-04-08 13:33:57.685339	2016-08-05 22:49:06.431048	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3154	7	\N	t	t	2015-04-08 13:33:20.208576	2016-08-05 22:49:06.460992	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3150	3	\N	t	t	2015-04-08 13:33:13.033685	2016-08-05 22:49:06.486812	193	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3218	15	\N	t	f	2015-04-08 13:35:20.543818	2016-08-05 22:49:06.511293	197	Property	0	\N	\N	\N	DOC_NONE	0
3224	4	\N	t	f	2015-04-08 13:35:31.615086	2016-08-05 22:49:06.536521	198	Property	0	\N	\N	\N	DOC_NONE	0
3229	9	\N	t	f	2015-04-08 13:35:39.880021	2016-08-05 22:49:06.559428	198	Property	0	\N	\N	\N	DOC_NONE	0
3235	15	\N	t	f	2015-04-08 13:35:51.685882	2016-08-05 22:49:06.590144	198	Property	0	\N	\N	\N	DOC_NONE	0
3242	6	\N	t	f	2015-04-08 13:36:03.583664	2016-08-05 22:49:06.615117	199	Property	0	\N	\N	\N	DOC_NONE	0
3248	12	\N	t	f	2015-04-08 13:36:12.639062	2016-08-05 22:49:06.638049	199	Property	0	\N	\N	\N	DOC_NONE	0
3255	3	\N	t	f	2015-04-08 13:36:24.685339	2016-08-05 22:49:06.664053	201	Property	0	\N	\N	\N	DOC_NONE	0
3260	8	\N	t	f	2015-04-08 13:36:32.954252	2016-08-05 22:49:06.684346	201	Property	0	\N	\N	\N	DOC_NONE	0
3266	14	\N	t	f	2015-04-08 13:36:44.036118	2016-08-05 22:49:06.709449	201	Property	0	\N	\N	\N	DOC_NONE	0
3271	5	\N	t	f	2015-04-08 13:36:56.896752	2016-08-05 22:49:06.730971	202	Property	0	\N	\N	\N	DOC_NONE	0
3276	10	\N	t	f	2015-04-08 13:37:05.29524	2016-08-05 22:49:06.751865	202	Property	0	\N	\N	\N	DOC_NONE	0
3282	16	\N	t	f	2015-04-08 13:37:16.374808	2016-08-05 22:49:06.77624	202	Property	0	\N	\N	\N	DOC_NONE	0
3287	7	\N	t	f	2015-04-08 13:37:28.700846	2016-08-05 22:49:06.798333	203	Property	0	\N	\N	\N	DOC_NONE	0
3290	10	\N	t	f	2015-04-08 13:37:33.989621	2016-08-05 22:49:06.811095	203	Property	0	\N	\N	\N	DOC_NONE	0
3294	14	\N	t	f	2015-04-08 13:37:41.150486	2016-08-05 22:49:06.827548	203	Property	0	\N	\N	\N	DOC_NONE	0
3300	6	\N	t	f	2015-04-08 13:37:56.430898	2016-08-05 22:49:06.852862	204	Property	0	\N	\N	\N	DOC_NONE	0
3238	1	\N	t	t	2015-04-08 13:35:56.505186	2016-08-05 22:49:06.87295	199	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3309	15	\N	t	f	2015-04-08 13:38:11.210834	2016-08-05 22:49:06.893475	204	Property	0	\N	\N	\N	DOC_NONE	0
3315	5	\N	t	f	2015-04-08 13:38:22.874917	2016-08-05 22:49:06.918218	205	Property	0	\N	\N	\N	DOC_NONE	0
3320	10	\N	t	f	2015-04-08 13:38:32.340019	2016-08-05 22:49:06.93933	205	Property	0	\N	\N	\N	DOC_NONE	0
3326	16	\N	t	f	2015-04-08 13:38:42.229414	2016-08-05 22:49:06.985968	205	Property	0	\N	\N	\N	DOC_NONE	0
3331	4	\N	t	f	2015-04-08 13:38:53.080705	2016-08-05 22:49:07.007221	206	Property	0	\N	\N	\N	DOC_NONE	0
3336	9	\N	t	f	2015-04-08 13:39:01.055	2016-08-05 22:49:07.031456	206	Property	0	\N	\N	\N	DOC_NONE	0
3343	16	\N	t	f	2015-04-08 13:39:13.508879	2016-08-05 22:49:07.057689	206	Property	0	\N	\N	\N	DOC_NONE	0
3350	6	\N	t	f	2015-04-08 13:39:25.772522	2016-08-05 22:49:07.079006	207	Property	0	\N	\N	\N	DOC_NONE	0
3356	12	\N	t	f	2015-04-08 13:39:37.170685	2016-08-05 22:49:07.104032	207	Property	0	\N	\N	\N	DOC_NONE	0
3363	2	\N	t	f	2015-04-08 13:39:50.367367	2016-08-05 22:49:07.126004	208	Property	0	\N	\N	\N	DOC_NONE	0
3369	8	\N	t	f	2015-04-08 13:40:00.934102	2016-08-05 22:49:07.148012	208	Property	0	\N	\N	\N	DOC_NONE	0
3375	16	\N	t	f	2015-04-08 13:40:13.549895	2016-08-05 22:49:07.172905	208	Property	0	\N	\N	\N	DOC_NONE	0
3381	5	\N	t	f	2015-04-08 13:40:24.698284	2016-08-05 22:49:07.195448	209	Property	0	\N	\N	\N	DOC_NONE	0
3384	8	\N	t	f	2015-04-08 13:40:30.000361	2016-08-05 22:49:07.207588	209	Property	0	\N	\N	\N	DOC_NONE	0
3388	12	\N	t	f	2015-04-08 13:40:38.033928	2016-08-05 22:49:07.224536	209	Property	0	\N	\N	\N	DOC_NONE	0
3361	17	\N	t	t	2015-04-08 13:39:46.772762	2016-08-05 22:49:07.253411	207	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3396	3	\N	t	f	2015-04-08 13:40:53.345677	2016-08-05 22:49:07.275544	210	Property	0	\N	\N	\N	DOC_NONE	0
3401	8	\N	t	f	2015-04-08 13:41:02.05584	2016-08-05 22:49:07.29597	210	Property	0	\N	\N	\N	DOC_NONE	0
3407	14	\N	t	f	2015-04-08 13:41:11.903333	2016-08-05 22:49:07.319093	210	Property	0	\N	\N	\N	DOC_NONE	0
3412	2	\N	t	f	2015-04-08 13:41:19.969194	2016-08-05 22:49:07.338993	211	Property	0	\N	\N	\N	DOC_NONE	0
3418	8	\N	t	f	2015-04-08 13:41:28.989443	2016-08-05 22:49:07.366083	211	Property	0	\N	\N	\N	DOC_NONE	0
3423	13	\N	t	f	2015-04-08 13:41:36.636537	2016-08-05 22:49:07.387575	211	Property	0	\N	\N	\N	DOC_NONE	0
3430	3	\N	t	f	2015-04-08 13:41:48.13729	2016-08-05 22:49:07.409368	212	Property	0	\N	\N	\N	DOC_NONE	0
3436	9	\N	t	f	2015-04-08 13:41:57.57124	2016-08-05 22:49:07.438439	212	Property	0	\N	\N	\N	DOC_NONE	0
3441	14	\N	t	f	2015-04-08 13:42:06.271398	2016-08-05 22:49:07.463834	212	Property	0	\N	\N	\N	DOC_NONE	0
3448	6	\N	t	f	2015-04-08 13:42:20.078919	2016-08-05 22:49:07.494111	214	Property	0	\N	\N	\N	DOC_NONE	0
3453	11	\N	t	f	2015-04-08 13:42:28.460322	2016-08-05 22:49:07.520619	214	Property	0	\N	\N	\N	DOC_NONE	0
3458	4	\N	t	f	2015-04-08 13:42:42.038174	2016-08-05 22:49:07.547126	215	Property	0	\N	\N	\N	DOC_NONE	0
3464	10	\N	t	f	2015-04-08 13:42:51.538196	2016-08-05 22:49:07.578944	215	Property	0	\N	\N	\N	DOC_NONE	0
3469	15	\N	t	f	2015-04-08 13:42:59.099164	2016-08-05 22:49:07.605267	215	Property	0	\N	\N	\N	DOC_NONE	0
3472	1	\N	t	f	2015-04-08 13:43:04.178224	2016-08-05 22:49:07.623174	216	Property	0	\N	\N	\N	DOC_NONE	0
3476	7	\N	t	f	2015-04-08 13:43:12.929708	2016-08-05 22:49:07.644419	216	Property	0	\N	\N	\N	DOC_NONE	0
3395	2	\N	t	t	2015-04-08 13:40:50.673589	2016-08-05 22:49:07.672572	210	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3486	17	\N	t	f	2015-04-08 13:43:29.167472	2016-08-05 22:49:07.694645	216	Property	0	\N	\N	\N	DOC_NONE	0
3491	7	\N	t	f	2015-04-08 13:43:40.036904	2016-08-05 22:49:07.719212	217	Property	0	\N	\N	\N	DOC_NONE	0
3497	13	\N	t	f	2015-04-08 13:43:50.310255	2016-08-05 22:49:07.753937	217	Property	0	\N	\N	\N	DOC_NONE	0
3502	1	\N	t	f	2015-04-08 13:43:58.460829	2016-08-05 22:49:07.779104	218	Property	0	\N	\N	\N	DOC_NONE	0
3508	9	\N	t	f	2015-04-08 13:44:11.557738	2016-08-05 22:49:07.812101	218	Property	0	\N	\N	\N	DOC_NONE	0
3513	14	\N	t	f	2015-04-08 13:44:20.199395	2016-08-05 22:49:07.836414	218	Property	0	\N	\N	\N	DOC_NONE	0
3518	4	\N	t	f	2015-04-08 13:44:30.723016	2016-08-05 22:49:07.861989	219	Property	0	\N	\N	\N	DOC_NONE	0
3525	11	\N	t	f	2015-04-08 13:44:42.529921	2016-08-05 22:49:07.8896	219	Property	0	\N	\N	\N	DOC_NONE	0
3530	16	\N	t	f	2015-04-08 13:44:50.481685	2016-08-05 22:49:07.913862	219	Property	0	\N	\N	\N	DOC_NONE	0
3536	7	\N	t	f	2015-04-08 13:45:02.855372	2016-08-05 22:49:07.947165	220	Property	0	\N	\N	\N	DOC_NONE	0
3541	12	\N	t	f	2015-04-08 13:45:12.235276	2016-08-05 22:49:07.972273	220	Property	0	\N	\N	\N	DOC_NONE	0
3546	17	\N	t	f	2015-04-08 13:45:20.147203	2016-08-05 22:49:07.997861	220	Property	0	\N	\N	\N	DOC_NONE	0
3552	8	\N	t	f	2015-04-08 13:45:31.754395	2016-08-05 22:49:08.048452	221	Property	0	\N	\N	\N	DOC_NONE	0
3557	13	\N	t	f	2015-04-08 13:45:39.460673	2016-08-05 22:49:08.075408	221	Property	0	\N	\N	\N	DOC_NONE	0
3560	16	\N	t	f	2015-04-08 13:45:43.974582	2016-08-05 22:49:08.091122	221	Property	0	\N	\N	\N	DOC_NONE	0
3565	10	\N	t	f	2015-04-08 13:45:58.825444	2016-08-05 22:49:08.109856	222	Property	0	\N	\N	\N	DOC_NONE	0
3572	5	\N	t	f	2015-04-08 13:46:14.949116	2016-08-05 22:49:08.13905	223	Property	0	\N	\N	\N	DOC_NONE	0
3577	10	\N	t	f	2015-04-08 13:46:22.487048	2016-08-05 22:49:08.16351	223	Property	0	\N	\N	\N	DOC_NONE	0
3582	15	\N	t	f	2015-04-08 13:46:30.008484	2016-08-05 22:49:08.186109	223	Property	0	\N	\N	\N	DOC_NONE	0
3589	5	\N	t	f	2015-04-08 13:46:41.84112	2016-08-05 22:49:08.216028	224	Property	0	\N	\N	\N	DOC_NONE	0
3594	10	\N	t	f	2015-04-08 13:46:49.728413	2016-08-05 22:49:08.239409	224	Property	0	\N	\N	\N	DOC_NONE	0
3600	16	\N	t	f	2015-04-08 13:46:59.920344	2016-08-05 22:49:08.268484	224	Property	0	\N	\N	\N	DOC_NONE	0
3608	7	\N	t	f	2015-04-08 13:47:13.262688	2016-08-05 22:49:08.291629	225	Property	0	\N	\N	\N	DOC_NONE	0
3614	15	\N	t	f	2015-04-08 13:47:25.466296	2016-08-05 22:49:08.318331	225	Property	0	\N	\N	\N	DOC_NONE	0
3620	4	\N	t	f	2015-04-08 13:47:35.050874	2016-08-05 22:49:08.342455	227	Property	0	\N	\N	\N	DOC_NONE	0
3627	11	\N	t	f	2015-04-08 13:47:46.371749	2016-08-05 22:49:08.414923	227	Property	0	\N	\N	\N	DOC_NONE	0
3629	13	\N	t	f	2015-04-08 13:47:49.768571	2016-08-05 22:49:08.42644	227	Property	0	\N	\N	\N	DOC_NONE	0
3641	8	\N	t	f	2015-04-08 13:48:12.677125	2016-08-05 22:49:08.475704	228	Property	0	\N	\N	\N	DOC_NONE	0
3646	13	\N	t	f	2015-04-08 13:48:20.249072	2016-08-05 22:49:08.499066	228	Property	0	\N	\N	\N	DOC_NONE	0
3654	4	\N	t	f	2015-04-08 13:48:32.85965	2016-08-05 22:49:08.52537	229	Property	0	\N	\N	\N	DOC_NONE	0
3659	9	\N	t	f	2015-04-08 13:48:41.515202	2016-08-05 22:49:08.54639	229	Property	0	\N	\N	\N	DOC_NONE	0
3650	17	\N	t	t	2015-04-08 13:48:26.267358	2016-08-05 22:49:08.55897	228	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3602	1	\N	t	t	2015-04-08 13:47:03.471986	2016-08-05 22:49:08.575333	225	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3663	13	\N	t	f	2015-04-08 13:48:47.95123	2016-08-05 22:49:08.604233	229	Property	0	\N	\N	\N	DOC_NONE	0
3670	3	\N	t	f	2015-04-08 13:48:59.441366	2016-08-05 22:49:08.623064	230	Property	0	\N	\N	\N	DOC_NONE	0
3675	8	\N	t	f	2015-04-08 13:49:07.394386	2016-08-05 22:49:08.642352	230	Property	0	\N	\N	\N	DOC_NONE	0
3681	16	\N	t	f	2015-04-08 13:49:18.897428	2016-08-05 22:49:08.666775	230	Property	0	\N	\N	\N	DOC_NONE	0
3686	4	\N	t	f	2015-04-08 13:49:28.078031	2016-08-05 22:49:08.686081	231	Property	0	\N	\N	\N	DOC_NONE	0
3692	10	\N	t	f	2015-04-08 13:49:38.288934	2016-08-05 22:49:08.714434	231	Property	0	\N	\N	\N	DOC_NONE	0
3697	15	\N	t	f	2015-04-08 13:49:46.564173	2016-08-05 22:49:08.735036	231	Property	0	\N	\N	\N	DOC_NONE	0
3704	5	\N	t	f	2015-04-08 13:49:58.027888	2016-08-05 22:49:08.754832	232	Property	0	\N	\N	\N	DOC_NONE	0
3710	11	\N	t	f	2015-04-08 13:50:07.403188	2016-08-05 22:49:08.782603	232	Property	0	\N	\N	\N	DOC_NONE	0
3715	16	\N	t	f	2015-04-08 13:50:14.970568	2016-08-05 22:49:08.804291	232	Property	0	\N	\N	\N	DOC_NONE	0
3723	7	\N	t	f	2015-04-08 13:50:28.026965	2016-08-05 22:49:08.830201	233	Property	0	\N	\N	\N	DOC_NONE	0
3728	12	\N	t	f	2015-04-08 13:50:35.96148	2016-08-05 22:49:08.851882	233	Property	0	\N	\N	\N	DOC_NONE	0
3735	2	\N	t	f	2015-04-08 13:50:47.027461	2016-08-05 22:49:08.874041	234	Property	0	\N	\N	\N	DOC_NONE	0
3741	8	\N	t	f	2015-04-08 13:50:56.835163	2016-08-05 22:49:08.904643	234	Property	0	\N	\N	\N	DOC_NONE	0
3746	13	\N	t	f	2015-04-08 13:51:05.14936	2016-08-05 22:49:08.925331	234	Property	0	\N	\N	\N	DOC_NONE	0
3667	17	\N	t	t	2015-04-08 13:48:54.738025	2016-08-05 22:49:08.936496	229	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3719	3	\N	t	t	2015-04-08 13:50:21.57653	2016-08-05 22:49:08.952357	233	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3754	4	\N	t	f	2015-04-08 13:51:18.630183	2016-08-05 22:49:08.979059	235	Property	0	\N	\N	\N	DOC_NONE	0
3759	9	\N	t	f	2015-04-08 13:51:27.014755	2016-08-05 22:49:09.001947	235	Property	0	\N	\N	\N	DOC_NONE	0
3764	14	\N	t	f	2015-04-08 13:51:35.664554	2016-08-05 22:49:09.023072	235	Property	0	\N	\N	\N	DOC_NONE	0
3770	4	\N	t	f	2015-04-08 13:51:46.731622	2016-08-05 22:49:09.051112	236	Property	0	\N	\N	\N	DOC_NONE	0
3775	9	\N	t	f	2015-04-08 13:51:55.473502	2016-08-05 22:49:09.075353	236	Property	0	\N	\N	\N	DOC_NONE	0
3781	15	\N	t	f	2015-04-08 13:52:07.375214	2016-08-05 22:49:09.103593	236	Property	0	\N	\N	\N	DOC_NONE	0
3785	5	\N	t	f	2015-04-08 13:52:16.656146	2016-08-05 22:49:09.124842	237	Property	0	\N	\N	\N	DOC_NONE	0
3792	12	\N	t	f	2015-04-08 13:52:30.603856	2016-08-05 22:49:09.148785	237	Property	0	\N	\N	\N	DOC_NONE	0
3798	1	\N	t	f	2015-04-08 13:52:42.510309	2016-08-05 22:49:09.177774	240	Property	0	\N	\N	\N	DOC_NONE	0
3803	6	\N	t	f	2015-04-08 13:52:52.73261	2016-08-05 22:49:09.202601	240	Property	0	\N	\N	\N	DOC_NONE	0
3809	12	\N	t	f	2015-04-08 13:53:02.579328	2016-08-05 22:49:09.231143	240	Property	0	\N	\N	\N	DOC_NONE	0
3814	17	\N	t	f	2015-04-08 13:53:10.926263	2016-08-05 22:49:09.256916	240	Property	0	\N	\N	\N	DOC_NONE	0
3819	6	\N	t	f	2015-04-08 13:53:21.120151	2016-08-05 22:49:09.284067	241	Property	0	\N	\N	\N	DOC_NONE	0
3825	12	\N	t	f	2015-04-08 13:53:31.323954	2016-08-05 22:49:09.313788	241	Property	0	\N	\N	\N	DOC_NONE	0
3830	17	\N	t	f	2015-04-08 13:53:38.857152	2016-08-05 22:49:09.335626	241	Property	0	\N	\N	\N	DOC_NONE	0
3835	6	\N	t	f	2015-04-08 13:53:48.072159	2016-08-05 22:49:09.353656	243	Property	0	\N	\N	\N	DOC_NONE	0
3839	10	\N	t	f	2015-04-08 13:53:55.24115	2016-08-05 22:49:09.372458	243	Property	0	\N	\N	\N	DOC_NONE	0
3845	16	\N	t	f	2015-04-08 13:54:05.831128	2016-08-05 22:49:09.398427	243	Property	0	\N	\N	\N	DOC_NONE	0
3853	8	\N	t	f	2015-04-08 13:54:19.940219	2016-08-05 22:49:09.423681	244	Property	0	\N	\N	\N	DOC_NONE	0
3858	13	\N	t	f	2015-04-08 13:54:27.879452	2016-08-05 22:49:09.445915	244	Property	0	\N	\N	\N	DOC_NONE	0
3864	2	\N	t	f	2015-04-08 13:54:37.838919	2016-08-05 22:49:09.471059	245	Property	0	\N	\N	\N	DOC_NONE	0
3869	7	\N	t	f	2015-04-08 13:54:46.153805	2016-08-05 22:49:09.492828	245	Property	0	\N	\N	\N	DOC_NONE	0
3875	13	\N	t	f	2015-04-08 13:54:56.932405	2016-08-05 22:49:09.520278	245	Property	0	\N	\N	\N	DOC_NONE	0
3880	1	\N	t	f	2015-04-08 13:55:08.102293	2016-08-05 22:49:09.543836	246	Property	0	\N	\N	\N	DOC_NONE	0
3886	7	\N	t	f	2015-04-08 13:55:17.617263	2016-08-05 22:49:09.565842	246	Property	0	\N	\N	\N	DOC_NONE	0
3892	13	\N	t	f	2015-04-08 13:55:27.447247	2016-08-05 22:49:09.592068	246	Property	0	\N	\N	\N	DOC_NONE	0
3900	4	\N	t	f	2015-04-08 13:55:41.239173	2016-08-05 22:49:09.615277	247	Property	0	\N	\N	\N	DOC_NONE	0
3910	14	\N	t	f	2015-04-08 13:55:56.419625	2016-08-05 22:49:09.643004	247	Property	0	\N	\N	\N	DOC_NONE	0
3916	3	\N	t	f	2015-04-08 13:56:07.156656	2016-08-05 22:49:09.665294	248	Property	0	\N	\N	\N	DOC_NONE	0
3921	8	\N	t	f	2015-04-08 13:56:15.036135	2016-08-05 22:49:09.688068	248	Property	0	\N	\N	\N	DOC_NONE	0
3909	13	\N	t	f	2015-04-08 13:55:54.902339	2016-08-05 22:49:09.714672	247	Property	0	\N	\N	\N	DOC_NONE	0
3908	12	\N	t	f	2015-04-08 13:55:53.39102	2016-08-05 22:49:09.73569	247	Property	0	\N	\N	\N	DOC_NONE	0
3849	4	\N	t	t	2015-04-08 13:54:13.833604	2016-08-05 22:49:09.749885	244	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3932	2	\N	t	f	2015-04-08 13:56:34.854937	2016-08-05 22:49:09.766288	249	Property	0	\N	\N	\N	DOC_NONE	0
3938	8	\N	t	f	2015-04-08 13:56:47.712629	2016-08-05 22:49:09.791773	249	Property	0	\N	\N	\N	DOC_NONE	0
3943	13	\N	t	f	2015-04-08 13:56:55.669588	2016-08-05 22:49:09.819666	249	Property	0	\N	\N	\N	DOC_NONE	0
3950	3	\N	t	f	2015-04-08 13:57:06.955801	2016-08-05 22:49:09.844859	250	Property	0	\N	\N	\N	DOC_NONE	0
3956	9	\N	t	f	2015-04-08 13:57:19.730674	2016-08-05 22:49:09.874393	250	Property	0	\N	\N	\N	DOC_NONE	0
3961	14	\N	t	f	2015-04-08 13:57:29.613495	2016-08-05 22:49:09.906149	250	Property	0	\N	\N	\N	DOC_NONE	0
3968	6	\N	t	f	2015-04-08 13:57:46.144715	2016-08-05 22:49:09.93174	251	Property	0	\N	\N	\N	DOC_NONE	0
3974	12	\N	t	f	2015-04-08 13:57:57.723657	2016-08-05 22:49:09.953774	251	Property	0	\N	\N	\N	DOC_NONE	0
3979	3	\N	t	f	2015-04-08 13:58:09.572456	2016-08-05 22:49:09.973369	1	Property	0	\N	\N	\N	DOC_NONE	0
3985	9	\N	t	f	2015-04-08 13:58:20.578102	2016-08-05 22:49:10.003867	1	Property	0	\N	\N	\N	DOC_NONE	0
3990	14	\N	t	f	2015-04-08 13:58:29.320916	2016-08-05 22:49:10.038704	1	Property	0	\N	\N	\N	DOC_NONE	0
3996	3	\N	t	f	2015-04-08 13:58:38.904768	2016-08-05 22:49:10.100204	14	Property	0	\N	\N	\N	DOC_NONE	0
4001	8	\N	t	f	2015-04-08 13:58:46.860999	2016-08-05 22:49:10.12558	14	Property	0	\N	\N	\N	DOC_NONE	0
4006	13	\N	t	f	2015-04-08 13:58:54.73012	2016-08-05 22:49:10.150466	14	Property	0	\N	\N	\N	DOC_NONE	0
4012	4	\N	t	f	2015-04-08 13:59:06.248196	2016-08-05 22:49:10.192805	26	Property	0	\N	\N	\N	DOC_NONE	0
3931	1	\N	t	t	2015-04-08 13:56:33.316359	2016-08-05 22:49:10.219576	249	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4017	9	\N	t	f	2015-04-08 13:59:13.736731	2016-08-05 22:49:10.242041	26	Property	0	\N	\N	\N	DOC_NONE	0
4021	13	\N	t	f	2015-04-08 13:59:19.738124	2016-08-05 22:49:10.267531	26	Property	0	\N	\N	\N	DOC_NONE	0
4027	4	\N	t	f	2015-04-08 13:59:30.807792	2016-08-05 22:49:10.304187	39	Property	0	\N	\N	\N	DOC_NONE	0
4032	9	\N	t	f	2015-04-08 13:59:38.26874	2016-08-05 22:49:10.33652	39	Property	0	\N	\N	\N	DOC_NONE	0
4037	14	\N	t	f	2015-04-08 13:59:45.709125	2016-08-05 22:49:10.371954	39	Property	0	\N	\N	\N	DOC_NONE	0
4050	10	\N	t	f	2015-04-08 14:00:05.978957	2016-08-05 22:49:10.413695	52	Property	0	\N	\N	\N	DOC_NONE	0
4066	13	\N	t	f	2015-04-08 14:00:34.328244	2016-08-05 22:49:10.448711	65	Property	0	\N	\N	\N	DOC_NONE	0
4074	11	\N	t	f	2015-04-08 14:00:53.377267	2016-08-05 22:49:10.489525	78	Property	0	\N	\N	\N	DOC_NONE	0
4079	9	\N	t	f	2015-04-08 14:01:10.941822	2016-08-05 22:49:10.525161	91	Property	0	\N	\N	\N	DOC_NONE	0
4086	1	\N	t	f	2015-04-08 14:01:23.888923	2016-08-05 22:49:10.546867	253	Property	0	\N	\N	\N	DOC_NONE	0
4092	7	\N	t	f	2015-04-08 14:01:32.863266	2016-08-05 22:49:10.574695	253	Property	0	\N	\N	\N	DOC_NONE	0
4097	12	\N	t	f	2015-04-08 14:01:40.303204	2016-08-05 22:49:10.602091	253	Property	0	\N	\N	\N	DOC_NONE	0
4103	1	\N	t	f	2015-04-08 14:01:49.88211	2016-08-05 22:49:10.633112	254	Property	0	\N	\N	\N	DOC_NONE	0
4060	5	\N	t	t	2015-04-08 14:00:23.028977	2016-08-05 22:49:10.655619	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4061	6	\N	t	t	2015-04-08 14:00:24.535534	2016-08-05 22:49:10.717454	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4106	4	\N	t	f	2015-04-08 14:01:54.344484	2016-08-05 22:49:10.742838	254	Property	0	\N	\N	\N	DOC_NONE	0
4109	7	\N	t	f	2015-04-08 14:01:58.808289	2016-08-05 22:49:10.760228	254	Property	0	\N	\N	\N	DOC_NONE	0
4113	11	\N	t	f	2015-04-08 14:02:04.764735	2016-08-05 22:49:10.784238	254	Property	0	\N	\N	\N	DOC_NONE	0
4119	17	\N	t	f	2015-04-08 14:02:13.709744	2016-08-05 22:49:10.814948	254	Property	0	\N	\N	\N	DOC_NONE	0
4126	7	\N	t	f	2015-04-08 14:02:24.631196	2016-08-05 22:49:10.846001	255	Property	0	\N	\N	\N	DOC_NONE	0
4131	12	\N	t	f	2015-04-08 14:02:32.073831	2016-08-05 22:49:10.876335	255	Property	0	\N	\N	\N	DOC_NONE	0
4138	2	\N	t	f	2015-04-08 14:02:43.016141	2016-08-05 22:49:10.919037	256	Property	0	\N	\N	\N	DOC_NONE	0
4143	7	\N	t	f	2015-04-08 14:02:50.477024	2016-08-05 22:49:10.946981	256	Property	0	\N	\N	\N	DOC_NONE	0
4149	13	\N	t	f	2015-04-08 14:02:59.427478	2016-08-05 22:49:10.986285	256	Property	0	\N	\N	\N	DOC_NONE	0
4154	1	\N	t	f	2015-04-08 14:03:07.029389	2016-08-05 22:49:11.022197	94	Property	0	\N	\N	\N	DOC_NONE	0
4163	13	\N	t	f	2015-04-08 14:03:23.429225	2016-08-05 22:49:11.050866	94	Property	0	\N	\N	\N	DOC_NONE	0
4171	9	\N	t	f	2015-04-08 14:03:40.461006	2016-08-05 22:49:11.085126	104	Property	0	\N	\N	\N	DOC_NONE	0
4180	5	\N	t	f	2015-04-08 14:03:58.190583	2016-08-05 22:49:11.117381	105	Property	0	\N	\N	\N	DOC_NONE	0
4191	6	\N	t	f	2015-04-08 14:04:23.235769	2016-08-05 22:49:11.156359	118	Property	0	\N	\N	\N	DOC_NONE	0
4121	2	\N	t	t	2015-04-08 14:02:16.856619	2016-08-05 22:49:11.197038	255	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4184	9	\N	t	t	2015-04-08 14:04:05.691472	2016-08-05 22:49:11.234255	105	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4187	15	\N	t	t	2015-04-08 14:04:13.125206	2016-08-05 22:49:11.276117	105	Property	1	\N	\N	\N	DOC_UPLOADED	0
4200	1	\N	t	f	2015-04-08 14:04:39.785344	2016-08-05 22:49:11.303376	120	Property	0	\N	\N	\N	DOC_NONE	0
4205	17	\N	t	f	2015-04-08 14:04:58.165284	2016-08-05 22:49:11.319614	120	Property	0	\N	\N	\N	DOC_NONE	0
4209	6	\N	t	f	2015-04-08 14:05:06.664777	2016-08-05 22:49:11.342724	127	Property	0	\N	\N	\N	DOC_NONE	0
4215	12	\N	t	f	2015-04-08 14:05:15.609074	2016-08-05 22:49:11.377537	127	Property	0	\N	\N	\N	DOC_NONE	0
4220	17	\N	t	f	2015-04-08 14:05:23.453509	2016-08-05 22:49:11.410919	127	Property	0	\N	\N	\N	DOC_NONE	0
4225	6	\N	t	f	2015-04-08 14:05:32.447181	2016-08-05 22:49:11.439315	131	Property	0	\N	\N	\N	DOC_NONE	0
4231	12	\N	t	f	2015-04-08 14:05:41.484398	2016-08-05 22:49:11.475992	131	Property	0	\N	\N	\N	DOC_NONE	0
4236	17	\N	t	f	2015-04-08 14:05:49.681691	2016-08-05 22:49:11.503874	131	Property	0	\N	\N	\N	DOC_NONE	0
4242	6	\N	t	f	2015-04-08 14:05:59.567893	2016-08-05 22:49:11.548532	145	Property	0	\N	\N	\N	DOC_NONE	0
4248	12	\N	t	f	2015-04-08 14:06:08.53537	2016-08-05 22:49:11.585414	145	Property	0	\N	\N	\N	DOC_NONE	0
4253	17	\N	t	f	2015-04-08 14:06:15.968899	2016-08-05 22:49:11.619551	145	Property	0	\N	\N	\N	DOC_NONE	0
4264	10	\N	t	f	2015-04-08 14:06:48.59124	2016-08-05 22:49:11.662033	160	Property	0	\N	\N	\N	DOC_NONE	0
4274	5	\N	t	f	2015-04-08 14:07:06.013378	2016-08-05 22:49:11.70169	173	Property	0	\N	\N	\N	DOC_NONE	0
4280	13	\N	t	f	2015-04-08 14:07:16.962501	2016-08-05 22:49:11.756602	173	Property	0	\N	\N	\N	DOC_NONE	0
4272	3	\N	t	t	2015-04-08 14:07:03.038974	2016-08-05 22:49:11.785536	173	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4261	3	\N	t	t	2015-04-08 14:06:40.106189	2016-08-05 22:49:11.816174	160	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4198	15	\N	t	t	2015-04-08 14:04:35.642291	2016-08-05 22:49:11.847083	118	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4288	7	\N	t	f	2015-04-08 14:07:32.017384	2016-08-05 22:49:11.872243	187	Property	0	\N	\N	\N	DOC_NONE	0
4291	10	\N	t	f	2015-04-08 14:07:36.483725	2016-08-05 22:49:11.885142	187	Property	0	\N	\N	\N	DOC_NONE	0
4295	14	\N	t	f	2015-04-08 14:07:42.428728	2016-08-05 22:49:11.90885	187	Property	0	\N	\N	\N	DOC_NONE	0
4303	9	\N	t	f	2015-04-08 14:07:58.490465	2016-08-05 22:49:11.935719	200	Property	0	\N	\N	\N	DOC_NONE	0
4308	17	\N	t	f	2015-04-08 14:08:08.972455	2016-08-05 22:49:11.961426	200	Property	0	\N	\N	\N	DOC_NONE	0
4314	15	\N	t	f	2015-04-08 14:08:27.056486	2016-08-05 22:49:11.982943	213	Property	0	\N	\N	\N	DOC_NONE	0
4322	6	\N	t	f	2015-04-08 14:08:39.19521	2016-08-05 22:49:12.010539	226	Property	0	\N	\N	\N	DOC_NONE	0
4327	11	\N	t	f	2015-04-08 14:08:46.645171	2016-08-05 22:49:12.036472	226	Property	0	\N	\N	\N	DOC_NONE	0
4348	17	\N	t	f	2015-04-08 14:09:20.168188	2016-08-05 22:49:12.088807	238	Property	0	\N	\N	\N	DOC_NONE	0
4354	7	\N	t	f	2015-04-08 14:09:30.656695	2016-08-05 22:49:12.115319	239	Property	0	\N	\N	\N	DOC_NONE	0
4359	14	\N	t	f	2015-04-08 14:09:40.147168	2016-08-05 22:49:12.141063	239	Property	0	\N	\N	\N	DOC_NONE	0
4367	6	\N	t	f	2015-04-08 14:09:53.261644	2016-08-05 22:49:12.171935	242	Property	0	\N	\N	\N	DOC_NONE	0
4372	11	\N	t	f	2015-04-08 14:10:00.723592	2016-08-05 22:49:12.207471	242	Property	0	\N	\N	\N	DOC_NONE	0
4378	17	\N	t	f	2015-04-08 14:10:09.65326	2016-08-05 22:49:12.237233	242	Property	0	\N	\N	\N	DOC_NONE	0
4384	7	\N	t	f	2015-04-08 14:10:19.771395	2016-08-05 22:49:12.25982	252	Property	0	\N	\N	\N	DOC_NONE	0
4319	3	\N	t	t	2015-04-08 14:08:34.683847	2016-08-05 22:49:12.287004	226	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4389	12	\N	t	f	2015-04-08 14:10:27.603368	2016-08-05 22:49:12.317924	252	Property	0	\N	\N	\N	DOC_NONE	0
46	2	\N	t	t	2015-03-28 10:35:31.154393	2016-08-05 22:49:12.340471	95	Property	0	\N	\N	\N	DOC_AVAILABLE	0
136	4	\N	t	t	2015-03-28 10:37:14.571856	2016-08-05 22:49:12.352411	16	Property	0	\N	\N	\N	DOC_AVAILABLE	0
169	7	\N	t	t	2015-03-28 10:37:39.327787	2016-08-05 22:49:12.368975	166	Property	0	\N	\N	\N	DOC_AVAILABLE	0
242	2	\N	t	t	2015-03-28 10:38:33.413327	2016-08-05 22:49:12.401142	5	Property	0	\N	\N	\N	DOC_AVAILABLE	0
337	2	\N	t	t	2015-03-28 10:39:42.941895	2016-08-05 22:49:12.426986	200	Property	0	\N	\N	\N	DOC_AVAILABLE	0
174	16	\N	t	t	2015-03-28 10:37:42.651588	2016-08-05 22:49:12.457472	166	Property	0	\N	\N	\N	DOC_AVAILABLE	0
286	3	\N	t	t	2015-03-28 10:39:06.030006	2016-08-05 22:49:12.482684	113	Property	0	\N	\N	\N	DOC_AVAILABLE	0
360	11	\N	t	t	2015-03-28 10:39:59.411687	2016-08-05 22:49:12.512103	68	Property	0	\N	\N	\N	DOC_AVAILABLE	0
365	4	\N	t	t	2015-03-28 10:40:03.496318	2016-08-05 22:49:12.542021	169	Property	0	\N	\N	\N	DOC_AVAILABLE	0
462	8	\N	t	t	2015-03-28 10:41:14.418969	2016-08-05 22:49:12.568176	49	Property	0	\N	\N	\N	DOC_AVAILABLE	0
471	6	\N	t	t	2015-03-28 10:41:21.021972	2016-08-05 22:49:12.599065	10	Property	0	\N	\N	\N	DOC_AVAILABLE	0
555	3	\N	t	t	2015-03-28 10:42:23.972575	2016-08-05 22:49:12.629011	222	Property	0	\N	\N	\N	DOC_AVAILABLE	0
561	13	\N	t	f	2015-03-28 10:42:28.061259	2016-08-05 22:49:12.657553	222	Property	0	\N	\N	\N	DOC_NONE	0
45	9	\N	t	f	2015-03-28 10:35:29.864946	2016-08-05 22:49:12.691286	94	Property	0	\N	\N	\N	DOC_NONE	0
456	15	\N	t	t	2015-03-28 10:41:09.810512	2016-08-05 22:49:12.727651	61	Property	1	\N	\N	\N	DOC_UPLOADED	0
649	3	\N	t	t	2015-03-28 10:43:33.350606	2016-08-05 22:49:12.760295	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
651	5	\N	t	t	2015-03-28 10:43:34.679885	2016-08-05 22:49:12.791147	30	Property	0	\N	\N	\N	DOC_AVAILABLE	0
720	14	\N	t	t	2015-03-28 10:44:27.082551	2016-08-05 22:49:12.826366	140	Property	0	\N	\N	\N	DOC_AVAILABLE	0
747	3	\N	t	t	2015-03-28 10:44:48.032321	2016-08-05 22:49:12.844624	194	Property	0	\N	\N	\N	DOC_AVAILABLE	0
120	3	\N	t	t	2015-03-28 10:36:58.778925	2016-08-05 22:49:12.867088	195	Property	0	\N	\N	\N	DOC_AVAILABLE	0
336	16	\N	t	t	2015-03-28 10:39:41.597571	2016-08-05 22:49:12.907404	109	Property	0	\N	\N	\N	DOC_AVAILABLE	0
610	12	\N	t	t	2015-03-28 10:43:03.447362	2016-08-05 22:49:12.933967	37	Property	0	\N	\N	\N	DOC_AVAILABLE	0
731	16	\N	t	t	2015-03-28 10:44:34.963832	2016-08-05 22:49:12.9602	150	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1882	7	\N	t	t	2015-04-08 12:54:22.365205	2016-08-05 22:49:12.987156	88	Property	0	\N	\N	\N	DOC_AVAILABLE	0
257	15	\N	t	t	2015-03-28 10:38:44.101665	2016-08-05 22:49:13.025401	104	Property	0	\N	\N	\N	DOC_AVAILABLE	0
703	13	\N	t	t	2015-03-28 10:44:14.43474	2016-08-05 22:49:13.085008	185	Property	0	\N	\N	\N	DOC_AVAILABLE	0
498	14	\N	t	t	2015-03-28 10:41:41.252079	2016-08-05 22:49:13.116897	42	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1430	17	\N	t	f	2015-04-08 12:41:11.323174	2016-08-05 22:49:13.151361	51	Property	0	\N	\N	\N	DOC_NONE	0
1052	17	\N	t	f	2015-04-08 12:30:40.264739	2016-08-05 22:49:13.188538	19	Property	0	\N	\N	\N	DOC_NONE	0
1499	1	\N	t	t	2015-04-08 12:42:52.327441	2016-08-05 22:49:13.264354	57	Property	1	\N	\N	\N	DOC_UPLOADED	0
2931	1	\N	t	t	2015-04-08 13:26:52.748991	2016-08-05 22:49:13.341974	177	Property	0	\N	\N	\N	DOC_AVAILABLE	0
830	4	\N	t	t	2015-04-08 12:24:44.281166	2016-08-05 22:49:13.368589	2	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1148	10	\N	t	f	2015-04-08 12:33:04.414333	2016-08-05 22:49:13.394899	27	Property	0	\N	\N	\N	DOC_NONE	0
1154	16	\N	t	f	2015-04-08 12:33:12.706265	2016-08-05 22:49:13.428274	27	Property	0	\N	\N	\N	DOC_NONE	0
1160	7	\N	t	f	2015-04-08 12:33:23.210165	2016-08-05 22:49:13.455284	28	Property	0	\N	\N	\N	DOC_NONE	0
1163	11	\N	t	f	2015-04-08 12:33:28.417333	2016-08-05 22:49:13.480057	28	Property	0	\N	\N	\N	DOC_NONE	0
1167	16	\N	t	f	2015-04-08 12:33:34.947226	2016-08-05 22:49:13.518671	28	Property	0	\N	\N	\N	DOC_NONE	0
1174	9	\N	t	f	2015-04-08 12:33:47.279124	2016-08-05 22:49:13.56823	29	Property	0	\N	\N	\N	DOC_NONE	0
1181	9	\N	t	f	2015-04-08 12:34:05.8568	2016-08-05 22:49:13.610297	30	Property	0	\N	\N	\N	DOC_NONE	0
1187	5	\N	t	f	2015-04-08 12:34:19.772823	2016-08-05 22:49:13.656606	31	Property	0	\N	\N	\N	DOC_NONE	0
1196	7	\N	t	f	2015-04-08 12:34:40.681496	2016-08-05 22:49:13.72057	32	Property	0	\N	\N	\N	DOC_NONE	0
1201	12	\N	t	f	2015-04-08 12:34:47.756758	2016-08-05 22:49:13.756906	32	Property	0	\N	\N	\N	DOC_NONE	0
1209	5	\N	t	f	2015-04-08 12:35:00.771823	2016-08-05 22:49:13.818022	33	Property	0	\N	\N	\N	DOC_NONE	0
1361	10	\N	t	f	2015-04-08 12:39:16.594431	2016-08-05 22:49:13.845005	46	Property	0	\N	\N	\N	DOC_NONE	0
232	15	\N	t	t	2015-03-28 10:38:25.531879	2016-08-05 22:49:13.871328	123	Property	0	\N	\N	\N	DOC_AVAILABLE	0
503	4	\N	t	t	2015-03-28 10:41:45.200705	2016-08-05 22:49:13.903551	142	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1192	1	\N	t	t	2015-04-08 12:34:33.685473	2016-08-05 22:49:13.943357	32	Property	0	\N	\N	\N	DOC_AVAILABLE	0
79	3	\N	t	f	2015-03-28 10:36:16.127454	2016-08-05 22:49:13.981363	127	Property	0	\N	\N	\N	DOC_NONE	0
647	12	\N	t	t	2015-03-28 10:43:31.363262	2016-08-05 22:49:14.007615	179	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1590	9	\N	t	f	2015-04-08 12:45:20.871951	2016-08-05 22:49:14.031538	63	Property	0	\N	\N	\N	DOC_NONE	0
1722	8	\N	t	f	2015-04-08 12:49:34.60947	2016-08-05 22:49:14.061616	75	Property	0	\N	\N	\N	DOC_NONE	0
1897	5	\N	t	f	2015-04-08 12:54:46.013033	2016-08-05 22:49:14.089094	89	Property	0	\N	\N	\N	DOC_NONE	0
1900	8	\N	t	f	2015-04-08 12:54:50.853947	2016-08-05 22:49:14.104366	89	Property	0	\N	\N	\N	DOC_NONE	0
1904	12	\N	t	f	2015-04-08 12:54:56.827652	2016-08-05 22:49:14.124214	89	Property	0	\N	\N	\N	DOC_NONE	0
1910	1	\N	t	f	2015-04-08 12:55:06.306419	2016-08-05 22:49:14.149628	90	Property	0	\N	\N	\N	DOC_NONE	0
1916	11	\N	t	f	2015-04-08 12:55:19.692889	2016-08-05 22:49:14.172394	90	Property	0	\N	\N	\N	DOC_NONE	0
1921	6	\N	t	f	2015-04-08 12:55:34.529481	2016-08-05 22:49:14.193289	92	Property	0	\N	\N	\N	DOC_NONE	0
1927	12	\N	t	f	2015-04-08 12:55:43.529753	2016-08-05 22:49:14.215844	92	Property	0	\N	\N	\N	DOC_NONE	0
1932	17	\N	t	f	2015-04-08 12:55:50.982143	2016-08-05 22:49:14.235071	92	Property	0	\N	\N	\N	DOC_NONE	0
1938	6	\N	t	f	2015-04-08 12:56:00.144545	2016-08-05 22:49:14.257331	93	Property	0	\N	\N	\N	DOC_NONE	0
1943	11	\N	t	f	2015-04-08 12:56:08.667078	2016-08-05 22:49:14.276647	93	Property	0	\N	\N	\N	DOC_NONE	0
1948	16	\N	t	f	2015-04-08 12:56:16.258217	2016-08-05 22:49:14.295996	93	Property	0	\N	\N	\N	DOC_NONE	0
1954	7	\N	t	f	2015-04-08 12:56:27.325805	2016-08-05 22:49:14.318714	95	Property	0	\N	\N	\N	DOC_NONE	0
1959	13	\N	t	f	2015-04-08 12:56:35.744734	2016-08-05 22:49:14.337483	95	Property	0	\N	\N	\N	DOC_NONE	0
1834	4	\N	t	f	2015-04-08 12:53:01.612429	2016-08-05 22:49:14.362228	85	Property	0	\N	\N	\N	DOC_NONE	0
1967	5	\N	t	f	2015-04-08 12:56:48.834748	2016-08-05 22:49:14.384209	96	Property	0	\N	\N	\N	DOC_NONE	0
1972	10	\N	t	f	2015-04-08 12:56:57.066508	2016-08-05 22:49:14.405305	96	Property	0	\N	\N	\N	DOC_NONE	0
1978	16	\N	t	f	2015-04-08 12:57:06.749286	2016-08-05 22:49:14.429415	96	Property	0	\N	\N	\N	DOC_NONE	0
2167	4	\N	t	f	2015-04-08 13:02:51.628318	2016-08-05 22:49:14.451157	112	Property	0	\N	\N	\N	DOC_NONE	0
2231	13	\N	t	f	2015-04-08 13:04:43.885818	2016-08-05 22:49:14.46313	116	Property	0	\N	\N	\N	DOC_NONE	0
2250	15	\N	t	f	2015-04-08 13:05:14.162608	2016-08-05 22:49:14.478985	117	Property	0	\N	\N	\N	DOC_NONE	0
2258	8	\N	t	f	2015-04-08 13:05:29.195378	2016-08-05 22:49:14.503597	119	Property	0	\N	\N	\N	DOC_NONE	0
2263	13	\N	t	f	2015-04-08 13:05:36.678587	2016-08-05 22:49:14.524691	119	Property	0	\N	\N	\N	DOC_NONE	0
2270	4	\N	t	f	2015-04-08 13:05:48.716504	2016-08-05 22:49:14.544135	121	Property	0	\N	\N	\N	DOC_NONE	0
2276	10	\N	t	f	2015-04-08 13:05:57.702114	2016-08-05 22:49:14.572061	121	Property	0	\N	\N	\N	DOC_NONE	0
2281	15	\N	t	f	2015-04-08 13:06:05.675845	2016-08-05 22:49:14.597404	121	Property	0	\N	\N	\N	DOC_NONE	0
2287	6	\N	t	f	2015-04-08 13:06:16.829795	2016-08-05 22:49:14.626921	122	Property	0	\N	\N	\N	DOC_NONE	0
2345	11	\N	t	f	2015-04-08 13:08:18.440873	2016-08-05 22:49:14.651743	128	Property	0	\N	\N	\N	DOC_NONE	0
2457	14	\N	t	f	2015-04-08 13:12:03.371074	2016-08-05 22:49:14.670914	137	Property	0	\N	\N	\N	DOC_NONE	0
2471	11	\N	t	f	2015-04-08 13:12:25.907974	2016-08-05 22:49:14.695084	138	Property	0	\N	\N	\N	DOC_NONE	0
2476	16	\N	t	f	2015-04-08 13:12:33.843627	2016-08-05 22:49:14.714527	138	Property	0	\N	\N	\N	DOC_NONE	0
2480	3	\N	t	f	2015-04-08 13:12:40.003931	2016-08-05 22:49:14.745911	139	Property	0	\N	\N	\N	DOC_NONE	0
2485	8	\N	t	f	2015-04-08 13:12:47.60332	2016-08-05 22:49:14.771611	139	Property	0	\N	\N	\N	DOC_NONE	0
2569	10	\N	t	f	2015-04-08 13:15:19.953002	2016-08-05 22:49:14.796703	147	Property	0	\N	\N	\N	DOC_NONE	0
2700	14	\N	t	f	2015-04-08 13:19:14.329675	2016-08-05 22:49:14.824379	156	Property	0	\N	\N	\N	DOC_NONE	0
2813	5	\N	t	f	2015-04-08 13:22:43.793472	2016-08-05 22:49:14.853488	166	Property	0	\N	\N	\N	DOC_NONE	0
1750	3	\N	t	t	2015-04-08 12:50:18.604599	2016-08-05 22:49:14.867544	77	Property	1	\N	\N	\N	DOC_UPLOADED	0
2811	3	\N	t	t	2015-04-08 13:22:40.759649	2016-08-05 22:49:14.881575	166	Property	0	\N	\N	\N	DOC_AVAILABLE	0
2269	3	\N	t	t	2015-04-08 13:05:47.211518	2016-08-05 22:49:14.918634	121	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4349	1	\N	t	t	2015-04-08 14:09:21.824717	2016-08-05 22:49:14.945252	239	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1427	4	\N	t	t	2015-04-08 12:40:58.523212	2016-08-05 22:49:14.967085	51	Property	0	\N	\N	\N	DOC_AVAILABLE	0
3569	2	\N	t	t	2015-04-08 13:46:10.440494	2016-08-05 22:49:14.991638	223	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4062	8	\N	t	t	2015-04-08 14:00:27.013987	2016-08-05 22:49:15.013288	65	Property	0	\N	\N	\N	DOC_AVAILABLE	0
547	3	\N	t	t	2015-03-28 10:42:17.42273	2016-08-05 22:49:15.039365	29	Property	1	\N	\N	\N	DOC_UPLOADED	0
1451	4	\N	t	f	2015-04-08 12:41:40.226484	2016-08-08 23:05:00.967833	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
1460	13	\N	t	f	2015-04-08 12:41:55.427597	2016-08-08 23:05:22.329708	54	Property	0	\N	\N	\N	DOC_AVAILABLE	0
4045	5	\N	t	f	2015-04-08 13:59:57.8028	2016-08-16 01:03:13.548827	52	Property	0	\N	\N	\N	DOC_NONE	0
995	1	\N	t	f	2015-04-08 12:29:13.479036	2016-08-22 22:08:47.912687	16	Property	0	\N	\N	\N	DOC_NONE	0
1796	4	\N	t	f	2015-04-08 12:51:51.190365	2016-08-24 00:02:24.100878	82	Property	0	\N	\N	\N	DOC_UNNECESSARY	1
1798	6	\N	t	f	2015-04-08 12:51:54.16927	2016-08-24 00:47:27.130127	82	Property	0	\N	\N	\N	DOC_UNNECESSARY	1
1799	9	\N	t	f	2015-04-08 12:51:57.647245	2016-08-24 00:49:44.213108	82	Property	0	\N	\N	\N	DOC_UNNECESSARY	1
348	10	\N	t	f	2015-03-28 10:39:50.889983	2016-08-24 00:50:46.115485	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
352	15	2012-08-17 03:00:00	t	f	2015-03-28 10:39:53.524014	2016-08-24 01:19:46.929761	82	Property	0	\N	\N	\N	DOC_EXPIRED	1
346	7	\N	t	f	2015-03-28 10:39:49.494937	2016-08-24 01:21:47.582292	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
344	2	\N	t	f	2015-03-28 10:39:48.184884	2016-08-24 01:26:12.637498	82	Property	0	\N	\N	\N	DOC_AVAILABLE	1
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('documents_id_seq', 4394, false);


--
-- Name: file_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('file_packages_id_seq', 8, false);


--
-- Name: good_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('good_statuses_id_seq', 11, false);


--
-- Name: good_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('good_types_id_seq', 1191, false);


--
-- Data for Name: good_types_materials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY good_types_materials (good_type_id, material_id) FROM stdin;
\.


--
-- Name: goods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('goods_id_seq', 1, false);


--
-- Name: goods_invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('goods_invoices_id_seq', 2871, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, name, created_at, updated_at, is_readonly, group_id, lft, rgt, depth) FROM stdin;
1	Região de Campinas	2014-07-23 02:07:30+00	2014-07-23 02:07:30+00	f	\N	1	4	0
11	Campinas	2014-07-23 02:07:39+00	2014-07-23 02:07:39+00	f	1	2	3	1
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 11, false);


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups_users (id, group_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: groups_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_users_id_seq', 1, false);


--
-- Name: import_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('import_errors_id_seq', 1, false);


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY imports (id, good_id, church_id, invoice_id, epc_rfid, codigo_interno, objeto, quantidade, marca, modelo, num_serie, altura, largura, comprimento, material, potencia, tensao, localizacao, ano_contabil, conta_contabil, mes_arquivo, pacote_arquivo, num_nf, data_nf, fornecedor, valor_bem, observacao, conta_contabil_correta) FROM stdin;
221	\N	16	\N	AA0001	\N	Amplificador som	1	0	LN-400T-Q	0	0	0	0	METAL	0	110	SALAO DE ORAÇAO	2012	1101	9	S1	948	41145	LUIZ SCHIAVINATO - ME 	1100	\N	\N
231	\N	16	\N	\N	\N	Armário	1	0	0	0	2,8	0	1,32	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
241	\N	16	\N	\N	\N	Armário	1	0	0	0	1,9	0	0,42	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
251	\N	16	\N	\N	\N	Armário bíblia e hinário	1	0	0	0	1,1	0	4,25	MADEIRA	0	0	ÁTRIO FRONTAL	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
261	\N	16	\N	\N	\N	Arquivo	1	0	0	0	1,34	0	0,47	METAL	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
271	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
281	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
291	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
301	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
311	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
321	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
331	\N	16	\N	\N	\N	Banco para Músico	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	243,6	Incluso 5 estantes da nota 943	\N
341	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
351	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
361	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
371	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
381	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
391	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
401	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
411	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
421	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
431	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
441	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
451	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
461	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
471	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
481	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	2001	1101	1	MANUT	759	36908	Ind. Móveis Zanovello	183,6	\N	\N
491	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
501	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
511	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
521	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
531	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
541	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
551	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
561	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
571	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
581	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
591	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
601	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
611	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
621	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
631	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
641	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
651	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
661	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
671	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
681	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
691	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
701	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
711	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
721	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
731	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
741	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
751	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2,7	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
761	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
771	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
781	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
791	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	2	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
801	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	1,35	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
811	\N	16	\N	\N	\N	Banco	1	0	0	0	0	0,75	1	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
821	\N	16	\N	\N	\N	Bateria	1	MOURA	0	B050411A0356	0	0	0	PLASTICO	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
831	\N	16	\N	\N	\N	Bateria	1	MOURA	0	B050411A0356	0	0	0	PLASTICO	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
841	\N	16	\N	\N	\N	Bebedouro	1	0	0	0	0	0	0	METAL	0	0	CORREDOR IRMÃOS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
851	\N	16	\N	\N	\N	Bebedouro	1	0	0	0	0	0	0	METAL	0	0	CORREDOR IRMÃS	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
861	\N	16	\N	\N	\N	Cadeira comum	1	0	0	0	0	0	0	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
871	\N	16	\N	\N	\N	Cadeira comum	1	0	0	0	0	0	0	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
881	\N	16	\N	\N	\N	Cadeira comum	1	0	0	0	0	0	0	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
891	\N	16	\N	\N	\N	Cadeira comum	1	0	0	0	0	0	0	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
901	\N	16	\N	\N	\N	Cadeira comum	1	0	0	0	0	0	0	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
911	\N	16	\N	\N	\N	Cadeira de púlpito	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	2000	1101	12	MANUT	943	36868	Osvaldo Zanovelo ME	140	\N	\N
921	\N	16	\N	\N	\N	Cadeira de púlpito	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	2000	1101	12	MANUT	943	36868	Osvaldo Zanovelo ME	140	\N	\N
931	\N	16	\N	\N	\N	Cadeira de rodas	1	0	0	0	0	0	0	METAL	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
941	\N	16	\N	\N	\N	Caixa de coleta	1	0	0	0	0,45	0	0,4	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
951	\N	16	\N	\N	\N	Caixa de coleta	1	0	0	0	0,45	0	0,4	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
961	\N	16	\N	\N	\N	Caixa de som	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
971	\N	16	\N	\N	\N	Caixa de som	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
981	\N	16	\N	\N	\N	Caixa de som	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
991	\N	16	\N	\N	\N	Caixa de som	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1001	\N	16	\N	\N	\N	Central de alarme	1	PPA	0	0	0	0	0	METAL	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1011	\N	16	\N	\N	\N	Cofre	1	0	0	0	1,1	0	0,45	METAL	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1021	\N	16	\N	\N	\N	Escrivaninha	1	0	0	0	0	0,6	1,28	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1031	\N	16	\N	\N	\N	Gradil do órgão	1	0	0	0	0	1,35	1,48	MADEIRA	0	0	SALAO DE ORAÇAO	2000	1101	12	MANUT	943	36868	Osvaldo Zanovelo ME	400	\N	\N
1041	\N	16	\N	\N	\N	Maca	1	0	0	0	0	0	0	METAL	0	0	0	2008	1101	3	MANUT	1840	39515	M.R. FALCO ME 	169	\N	\N
1051	\N	16	\N	\N	\N	Maq. lavar roupas	1	0	0	0	0	0	0	METAL	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1061	\N	16	\N	\N	\N	Maq. lavar roupas	1	0	0	0	0	0	0	METAL	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1071	\N	16	\N	\N	\N	Mesa	1	0	0	0	0	0,87	1,39	MADEIRA	0	0	SECRETARIA	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1081	\N	16	\N	\N	\N	Mesa p/ Santa Ceia	1	0	0	0	0	0,62	1,16	MADEIRA	0	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1091	\N	16	\N	\N	\N	Microfone	1	LESON	SM58P4	0	0	0	0	METAL	0	0	SALAO DE ORAÇAO	2001	710	4	ADM	710	37005	N. DA SILVA - ME	115	\N	\N
1101	\N	16	\N	\N	\N	Microfone	1	LESON	SM58P4	0	0	0	0	METAL	0	0	SALAO DE ORAÇAO	2001	710	4	ADM	710	37005	N. DA SILVA - ME	115	\N	\N
1111	\N	16	\N	\N	\N	Microfone	1	LESON	SM58P4	0	0	0	0	METAL	0	0	SALAO DE ORAÇAO	2001	710	4	ADM	710	37005	N. DA SILVA - ME	115	\N	\N
1121	\N	16	\N	\N	\N	Microfone	1	LESON	SM58P4	0	0	0	0	METAL	0	0	SALAO DE ORAÇAO	2001	710	4	ADM	710	37005	N. DA SILVA - ME	115	\N	\N
1131	\N	16	\N	\N	\N	Órgão	1	0	0	0	0	0	0	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1141	\N	16	\N	\N	\N	Relógio de parede	1	0	0	0	0	0	0	PLASTICO	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1151	\N	16	\N	\N	\N	Relógio de parede	1	0	0	0	0	0	0	PLASTICO	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1161	\N	16	\N	\N	\N	Tapume p/ bancos madeira (genuflexório)	1	0	0	0	0,51	0	2	MADEIRA	0	0	SALAO DE ORAÇAO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1171	\N	16	\N	\N	\N	Tribuna	1	0	0	0	1,15	0,46	1	MADEIRA	0	0	SALAO DE ORAÇAO	2000	1101	12	MANUT	943	36868	Osvaldo Zanovelo ME	680	\N	\N
1181	\N	16	\N	\N	\N	Ventilador parede	1	0	0	0	0	0	0	PLASTICO/METAL	0	0	SALAO DE ORAÇAO	2007	3016	2	MANUT	3710	39115	CASSEB & ORSI	185	\N	\N
1191	\N	16	\N	\N	\N	Ventilador parede	1	0	0	0	0	0	0	PLASTICO/METAL	0	0	SALAO DE ORAÇAO	2007	3016	2	MANUT	3710	39115	CASSEB & ORSI	185	\N	\N
\.


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('imports_id_seq', 1191, false);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('invoices_id_seq', 181, false);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materials_id_seq', 8, false);


--
-- Data for Name: mouths; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mouths (id, nome) FROM stdin;
1	1 - JAN
2	2 - FEV
3	3 - MAR
4	4 - ABR
5	5 -  MAI
6	6 - JUN
7	7 - JUL
8	8 - AGO
9	9 - SET
10	10 - OUT
11	11 - NOV
12	12 - DEZ
\.


--
-- Name: mouths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mouths_id_seq', 12, false);


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('places_id_seq', 111, false);


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profiles (id, name, is_admin, created_at, updated_at, level) FROM stdin;
1	Super Admin	t	2014-07-22 01:42:45+00	2014-07-22 01:42:45+00	0
11	Administrador	f	2014-07-22 01:42:45+00	2014-07-22 01:42:45+00	1
21	Operador	f	2014-07-22 01:42:45+00	2014-07-22 01:42:45+00	2
31	Leitor	f	2014-07-22 01:42:45+00	2014-07-22 01:42:45+00	3
\.


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profiles_id_seq', 31, false);


--
-- Data for Name: profiles_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profiles_skills (id, profile_id, skill_id, created_at, updated_at) FROM stdin;
525	11	644	2015-06-10 21:08:54.892501+00	2015-06-10 21:08:54.892501+00
527	31	645	\N	\N
528	31	646	\N	\N
529	31	647	\N	\N
530	31	648	\N	\N
531	21	644	2015-06-23 11:44:49.146926+00	2015-06-23 11:44:49.146926+00
532	21	645	2015-06-23 11:47:17.435175+00	2015-06-23 11:47:17.435175+00
512	1	1	2015-05-29 22:19:40.086161+00	2015-05-29 22:19:40.086161+00
513	1	642	2015-05-29 22:19:40.428497+00	2015-05-29 22:19:40.428497+00
514	1	643	2015-05-29 22:19:40.605568+00	2015-05-29 22:19:40.605568+00
515	1	644	2015-05-29 22:19:40.803314+00	2015-05-29 22:19:40.803314+00
516	1	121	2015-05-29 22:19:40.965492+00	2015-05-29 22:19:40.965492+00
517	11	642	2015-05-29 22:21:34.674737+00	2015-05-29 22:21:34.674737+00
518	11	643	2015-05-29 22:21:34.835091+00	2015-05-29 22:21:34.835091+00
519	21	642	2015-05-29 22:21:41.216821+00	2015-05-29 22:21:41.216821+00
520	21	643	2015-05-29 22:21:41.394424+00	2015-05-29 22:21:41.394424+00
\.


--
-- Name: profiles_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profiles_skills_id_seq', 532, false);


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY properties (id, code, church_id, group_code, accountant_code, cartographic_code, created_at, updated_at, is_active, has_church, market_price, object, title, category, status, situation, address, zipcode, zone, income, quarter, court, lot, terrain_area, width_area, main_area, trash_area, secondary_area, excess_area, default_type, default_category, rate, comment, object_terrain, latitude, longitude, full_address, tax_code) FROM stdin;
205	0940.04	89	4	3783	3362.63.47.0245.01001	2015-02-05 02:19:30.720735	2015-06-12 02:18:32.222003	t	f	\N	{"CódContábil":"0940.04","Bairro":"Jd. Ouro Verde","Distrito":null,"CódBrás":"22-37-83","CódIPTU":"042.092.257","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3783","CódCartograf":"3362.63.47.0245.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Ouro Verde_ JAPI_Estacionamento.jpg","CódBrás_correto":"BR-22-3783"}	223783.04	Estacionamento	Em Funcionamento	CEDIDO	Rua Japi, 50	13056-313	\N	2	04243	87	10	360.00	12.00	83.75	156.00	\N	\N	RH 2.0 Resid. Horiz.	PREDIAL	0.00	\N	{"CódContábil":"0940.04","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"Rua Japi, 50","CepImóvel":"13056-313","Zoneamento":null,"Receita":"2","Quarteirão":"04243","Quadra":"87","Lote":"10","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"83,75","ÁreaDependência":"0","TipoPadrão":"RH 2.0 Resid. Horiz.","CategoriaImóvel":"PREDIAL","Alícota":"0,4%","ÁreaTerreno":"360,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9744038999999987	-47.1331835000000012	Rua Japi, 50, Campinas, SP - 13056-313	042.092.257
212	0980.03	93	4	3850	3364.24.08.0121.00000	2015-02-05 02:19:31.891913	2015-06-12 02:18:40.812421	f	f	\N	{"CódContábil":"0980.03","Bairro":"Jd. São Pedro de Viracopos","Distrito":null,"CódBrás":"22-38-50","CódIPTU":"044.896.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000039533","CódGrupo":"4","CódContador":"3850","CódCartograf":"3364.24.08.0121.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\4- NOVA S.PEDRO VIRAC.mini.JPG","CódBrás_correto":"BR-22-3850"}	223850.03	Estacionamento	Desativado	PROPRIO	Av. Mário Trevenzoli, S/N	13056-190	\N	3	04996	13	003	380.90	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(antiga Av. Um) PEDIR UNIFICAÇÃO CARNE - VERIFICAR\r\nABERTURA EM 06/03/2011______DOUGLAS A. 16/3/11	{"CódContábil":"0980.03","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"Av. Mário Trevenzoli, S/N","CepImóvel":"13056-190","Zoneamento":null,"Receita":"3","Quarteirão":"04996","Quadra":"13","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"380,90","ÁreaExcedente":"0,00","Observações":"(antiga Av. Um) PEDIR UNIFICAÇÃO CARNE - VERIFICAR\\r\\nABERTURA EM 06/03/2011______DOUGLAS A. 16/3/11","FotoPrincipal":null}	\N	\N	Av. Mário Trevenzoli, S/N, Campinas, SP - 13056-190	044.896.600
9	0130.02	29	3	0309	3214.14.84.0042.01001	2015-02-05 02:18:56.713651	2015-06-12 02:10:37.024434	t	f	\N	{"CódContábil":"0130.02","Bairro":"Ch. Marujo - Barão Geraldo ( Ch. Da Piedade)","Distrito":null,"CódBrás":"220309","CódIPTU":"055.007.653","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000028262","CódGrupo":"3","CódContador":"0309","CódCartograf":"3214.14.84.0042.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\CHACARA_MARUJO_CH.PIEDADE.jpg","CódBrás_correto":"BR-22-0309"}	220309.02	Outros Fins	Aguarda Constr	PROPRIO	R. ARGIA AQUELINA BARBOSA, S/N	13083-000	\N	2	00614	C	003	1145.00	18.00	104.23	\N	\N	\N	RH-1.0	PREDIAL	0.00	- ESTE TERRENO SOFRE COM ALAGAMENTOS, POIS ESTA NA ENCOSTA DO RIO ANHUMAS (É NECESSARIO VISTORIAS DE IRMÃOS ENG. DE SEGURANÇA E MEIO AMBIENTE)_____DOUGLAS A 30/07/2012\r\n- CHACARA DOADA À CCB EM 28/7/2012, PARA A FINALIDADE DE GARANTIR O USUFRUTO DE DOIS IRMÃOS CARENTES QUE MORAM NA PROPRIEDADE. A FINALIDADE, APÓS A MORTE DELES, SERÁ PARA A OBRA DA PIEDADE DEFINIR (CONFIRMAR ESTA INFORMAÇAO)_____DOUGLAS A 30/07/2012	{"CódContábil":"0130.02","Tipo":"Outros Fins","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. ARGIA AQUELINA BARBOSA, S/N","CepImóvel":"13083-000","Zoneamento":null,"Receita":"2","Quarteirão":"00614","Quadra":"C","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"000","TestadaTerreno":"18,00","ÁreaPrincipal":"104,23","ÁreaDependência":"0","TipoPadrão":"RH-1.0","CategoriaImóvel":"PREDIAL","Alícota":"0,40%","ÁreaTerreno":"1.145,00","ÁreaExcedente":"0","Observações":"- ESTE TERRENO SOFRE COM ALAGAMENTOS, POIS ESTA NA ENCOSTA DO RIO ANHUMAS (É NECESSARIO VISTORIAS DE IRMÃOS ENG. DE SEGURANÇA E MEIO AMBIENTE)_____DOUGLAS A 30/07/2012\\r\\n- CHACARA DOADA À CCB EM 28/7/2012, PARA A FINALIDADE DE GARANTIR O USUFRUTO DE DOIS IRMÃOS CARENTES QUE MORAM NA PROPRIEDADE. A FINALIDADE, APÓS A MORTE DELES, SERÁ PARA A OBRA DA PIEDADE DEFINIR (CONFIRMAR ESTA INFORMAÇAO)_____DOUGLAS A 30/07/2012","FotoPrincipal":null}	\N	\N	R. ARGIA AQUELINA BARBOSA, S/N, Campinas, SP - 13083-000	055.007.653
11	0140.01	39	3	1969	3233.62.02.0296.01001	2015-02-05 02:18:57.042622	2015-06-12 02:10:39.513164	t	f	\N	{"CódContábil":"0140.01","Bairro":"Real Parque","Distrito":"Barão Geraldo","CódBrás":"22-19-69","CódIPTU":"072.434.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000541712","CódGrupo":"3","CódContador":"1969","CódCartograf":"3233.62.02.0296.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Real Parque_Estac_mini.JPG","CódBrás_correto":"BR-22-1969"}	221969.01	Estacionamento	Em Funcionamento	PROPRIO	R. Aguinaldo dos Santos Filho, 26	13082-791	\N	3	89	E	020	300.00	10.00	138.72	301.00	\N	\N	RH - 3.0 RES. HORIZ	PREDIAL	0.00	\N	{"CódContábil":"0140.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Aguinaldo dos Santos Filho, 26","CepImóvel":"13082-791","Zoneamento":null,"Receita":"3","Quarteirão":"89","Quadra":"E","Lote":"020","CódLogradouro":"168","ÁreaGeoFreqLixo":"301 d/a","TestadaTerreno":"10","ÁreaPrincipal":"138,72","ÁreaDependência":"0","TipoPadrão":"RH - 3.0 RES. HORIZ","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"300,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8273295999999988	-47.0985001999999966	R. Aguinaldo dos Santos Filho, 26, Campinas, SP - 13082-791	072.434.500
216	0990.02	94	3	4125	3162.24.44.0264.00000	2015-02-05 02:19:32.605482	2015-06-12 02:18:45.219158	t	f	\N	{"CódContábil":"0990.02","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001192682","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0264.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.02	Estacionamento	Em Funcionamento	PROPRIO	R. ALTINO JORGE PEREIRA, S/N	00000-000	\N	\N	10477	J	003	140.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R: Cinco)	{"CódContábil":"0990.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. ALTINO JORGE PEREIRA, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"140,00","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	\N	\N	R. ALTINO JORGE PEREIRA, S/N, Campinas, SP - 00000-000	000.000.000
16	0170.00	9	2	0281	3412.54.12.0385.01001	2015-02-05 02:18:58.249629	2015-06-12 02:10:46.292644	t	t	\N	{"CódContábil":"0170.00","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"037.520.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000181922","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0385.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\BONFIM.JPG","CódBrás_correto":"BR-22-0281"}	220281.00	Igreja	Em Funcionamento	PROPRIO	R. Germânia, 661	13070-770	09	2	00265	\N	20 unif	1906.80	33.00	3085.73	301.00	\N	\N	NRV-1.0 N RES, VERT.	PREDIAL	0.02	CENTRAL DE CAMPINAS	{"CódContábil":"0170.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Germânia, 661","CepImóvel":"13070-770","Zoneamento":"09","Receita":"2","Quarteirão":"00265","Quadra":null,"Lote":"20 unif","CódLogradouro":"3730","ÁreaGeoFreqLixo":"301","TestadaTerreno":"33,00","ÁreaPrincipal":"3.085,73","ÁreaDependência":"0","TipoPadrão":"NRV-1.0 N RES, VERT.","CategoriaImóvel":"PREDIAL","Alícota":"2,90%","ÁreaTerreno":"1.906,80","ÁreaExcedente":"0","Observações":"CENTRAL DE CAMPINAS","FotoPrincipal":null}	-22.8982117000000009	-47.0786336999999975	R. Germânia, 661, Campinas, SP - 13070-770	037.520.000
18	0174.02	9	2	0281	3412.54.31.0055.00000	2015-02-05 02:18:58.596548	2015-06-12 02:10:48.779753	t	f	\N	{"CódContábil":"0174.02","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"094.000.213","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000879332","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.31.0055.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim, Germania 668 frente_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.02	Estacionamento	Em Funcionamento	USUCAPIAO	Rua Germânia, 000	13070-070	9	3	00264	O	010	484.00	11.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	USUCAPIAO*\r\nESTACIONAMENTO DA FRENTE - CENTRAL	{"CódContábil":"0174.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"Rua Germânia, 000","CepImóvel":"13070-070","Zoneamento":"9","Receita":"3","Quarteirão":"00264","Quadra":"O","Lote":"010","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"11,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno   Sem Construção","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"484,00","ÁreaExcedente":"0","Observações":"USUCAPIAO*\\r\\nESTACIONAMENTO DA FRENTE - CENTRAL","FotoPrincipal":null}	-22.8969355000000014	-47.0779746999999986	Rua Germânia, 000, Campinas, SP - 13070-070	094.000.213
20	0174.04	9	2	0281	3412.54.12.0142.00000	2015-02-05 02:18:58.918222	2015-06-12 02:10:51.367366	t	f	\N	{"CódContábil":"0174.04","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"034.410.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000222632","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0142.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim - Teodoro Langard 672 - 678 - 682_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.04	Estacionamento	Em Funcionamento	PROPRIO	R. Dr. Theodoro Langaard, 672	13070-760	\N	3	00265	9	01-SUB	252.65	11.80	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	ESTACIONAMENTO DOS FUNDOS - CENTRAL\r\nALICOTA 2007 ERA 0%	{"CódContábil":"0174.04","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Dr. Theodoro Langaard, 672","CepImóvel":"13070-760","Zoneamento":null,"Receita":"3","Quarteirão":"00265","Quadra":"9","Lote":"01-SUB","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"11,80","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"252,65","ÁreaExcedente":"0","Observações":"ESTACIONAMENTO DOS FUNDOS - CENTRAL\\r\\nALICOTA 2007 ERA 0%","FotoPrincipal":null}	-22.8947247999999988	-47.0779394999999994	R. Dr. Theodoro Langaard, 672, Campinas, SP - 13070-760	034.410.000
218	0990.04	94	3	4125	3162.24.44.0203.00000	2015-02-05 02:19:32.970556	2015-06-12 02:18:47.573558	t	f	\N	{"CódContábil":"0990.04","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001193062","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0203.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.04	Estacionamento	Em Funcionamento	PROPRIO	R. AMANCIO JOSÉ JORGE, S/N	00000-000	\N	\N	10477	J	041	140.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R: Cinco)	{"CódContábil":"0990.04","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. AMANCIO JOSÉ JORGE, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"041","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"140,00","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	-22.8414256000000009	-47.1387558999999996	R. AMANCIO JOSÉ JORGE, S/N, Campinas, SP - 00000-000	000.000.000
24	0174.08	9	2	0281	3412.54.12.0035.01001	2015-02-05 02:18:59.571124	2015-06-12 02:10:56.874035	t	f	\N	{"CódContábil":"0174.08","Bairro":"Bonfim","Distrito":null,"CódBrás":"220281","CódIPTU":"002.831.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000841482","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0035.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim Espanha 550_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.08	Estacionamento	Aguarda Constr	PROPRIO	R. Espanha, 550	13070-260	\N	2	00265	\N	029	198.00	9.00	1004.00	301.00	\N	\N	RH-2.0 RES, HORIZ	PREDIAL	0.00	TERRENO ADQUIRIDO EM 23/06/09, PARA SER ANEXADO A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL, NESTE LOCAL HÁ UMA PEQUENA CASA QUE SERA DEMOLIDA___ DOUGLAS A. 06/07/09\r\nAparentemente o imovel ainda não foi registrado e não me foi entregue a Matricula, conferir_____DOUGLAS A. 06/07/09	{"CódContábil":"0174.08","Tipo":"Estacionamento","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Espanha, 550","CepImóvel":"13070-260","Zoneamento":null,"Receita":"2","Quarteirão":"00265","Quadra":null,"Lote":"029","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"9,00","ÁreaPrincipal":"100.4","ÁreaDependência":null,"TipoPadrão":"RH-2.0 RES, HORIZ","CategoriaImóvel":"PREDIAL","Alícota":"0,4","ÁreaTerreno":"198,00","ÁreaExcedente":"0","Observações":"TERRENO ADQUIRIDO EM 23/06/09, PARA SER ANEXADO A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL, NESTE LOCAL HÁ UMA PEQUENA CASA QUE SERA DEMOLIDA___ DOUGLAS A. 06/07/09\\r\\nAparentemente o imovel ainda não foi registrado e não me foi entregue a Matricula, conferir_____DOUGLAS A. 06/07/09","FotoPrincipal":null}	-22.8972906000000016	-47.0738237999999996	R. Espanha, 550, Campinas, SP - 13070-260	002.831.900
171	0800.01	2	4	0313	3362.62.84.0048.00000	2015-02-05 02:19:24.85527	2015-06-12 02:17:50.004836	t	f	\N	{"CódContábil":"0800.01","Bairro":"Jd. Aeroporto (R. Cairí)","Distrito":null,"CódBrás":"22-03-13","CódIPTU":"041.990.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000003163","CódGrupo":"4","CódContador":"0313","CódCartograf":"3362.62.84.0048.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\jd. aeroporto_cairiestac..jpg","CódBrás_correto":"BR-22-0313"}	220313.01	Estacionamento	Em Funcionamento	PROPRIO	R. Cairi	13054-113	\N	3	04202	46	18	348.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0800.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Cairi","CepImóvel":"13054-113","Zoneamento":null,"Receita":"3","Quarteirão":"04202","Quadra":"46","Lote":"18","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"'","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"348,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9726409999999994	-47.1267137000000034	R. Cairi, Campinas, SP - 13054-113	041.990.000
225	1030.00	95	1	4389	3344.23.68.0025.00000	2015-02-05 02:19:34.222136	2015-06-12 02:18:56.769611	t	t	\N	{"CódContábil":"1030.00","Bairro":"Cidade Satelite Iris - Dunlop","Distrito":null,"CódBrás":"224389","CódIPTU":"042.676.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000003","CódGrupo":"1","CódContador":"4389","CódCartograf":"3344.23.68.0025.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1030.00_JOHN_BOYD_DUNLOP\\\\pat_1030.00_4389_fotos.fachada.2012_qd51_lt17.jpg","CódBrás_correto":"BR-22-4389"}	224389.00	Igreja	Em Funcionamento	USUCAPIAO	R. Pastor Samuel de Campos Chiminazzo, S/N	13059-688	\N	3	04476	51	017	680.00	20.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(nº121) ESTAREI FAZENDO UM PROCESSO DE REGULARIZAÇÃO INSTITUCIONAL, LOGO APÓS A SUA FINALIZAÇÃO (CONDIÇÃO P/ O PROCESSO),  TENDO POREM A PLANTA DE BOMBEIROS JÁ APROVADA, E VISTORIA Á SER REALIZADA; *ALLEX, 09/08/11\r\n23/3/11- Assinado um pacto de re-ratificaçao de venda/compra, onde a CCB pagou mais R$15.000,00 a vendedora.___Douglas A. 18/6/11\r\nTrata- se de um terreno adquirido por instrumento particular para se erguer um Templo, que não possui matricula, mas as transcriçoes do 3ºCartorio nº 12345 - 23470 - 23471.\r\n Na compra assumimos o Debito de I.P.T.U e demais taxas. A custa de Inventario correrá por conta da VENDEDORA.(DOUGLAS A. 01/02/10)\r\nTerreno adquirido para se edificar uma Sala de Oraçao.	{"CódContábil":"1030.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"R. Pastor Samuel de Campos Chiminazzo, S/N","CepImóvel":"13059-688","Zoneamento":null,"Receita":"3","Quarteirão":"04476","Quadra":"51","Lote":"017","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%.","ÁreaTerreno":"680,00","ÁreaExcedente":"0,00","Observações":"(nº121) ESTAREI FAZENDO UM PROCESSO DE REGULARIZAÇÃO INSTITUCIONAL, LOGO APÓS A SUA FINALIZAÇÃO (CONDIÇÃO P/ O PROCESSO),  TENDO POREM A PLANTA DE BOMBEIROS JÁ APROVADA, E VISTORIA Á SER REALIZADA; *ALLEX, 09/08/11\\r\\n23/3/11- Assinado um pacto de re-ratificaçao de venda/compra, onde a CCB pagou mais R$15.000,00 a vendedora.___Douglas A. 18/6/11\\r\\nTrata- se de um terreno adquirido por instrumento particular para se erguer um Templo, que não possui matricula, mas as transcriçoes do 3ºCartorio nº 12345 - 23470 - 23471.\\r\\n Na compra assumimos o Debito de I.P.T.U e demais taxas. A custa de Inventario correrá por conta da VENDEDORA.(DOUGLAS A. 01/02/10)\\r\\nTerreno adquirido para se edificar uma Sala de Oraçao.","FotoPrincipal":null}	-22.9453488000000014	-47.143614300000003	R. Pastor Samuel de Campos Chiminazzo, S/N, Campinas, SP - 13059-688	042.676.600
227	1050.00	96	4	4346	5213.14.98.0242.00000	2015-02-05 02:19:34.552126	2015-06-12 02:18:59.3905	t	t	\N	{"CódContábil":"1050.00","Bairro":"Jd. Campo Belo I","Distrito":null,"CódBrás":"224346","CódIPTU":"046.548.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000123453","CódGrupo":"4","CódContador":"4346","CódCartograf":"5213.14.98.0242.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1050.00_JARDIM_CAMPO_BELO_I\\\\Fotos da Salinha\\\\Fachada_1.JPG","CódBrás_correto":"BR-22-4346"}	224346.00	Igreja	Em Funcionamento	ALUGADO	R. Dr. Mathias Jose de Barros Ponikwar 140	13053-123	.	3	05247	L	20	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	SALA DE ORAÇAO EM TERRENO LOCADO COM CULTOS OFICIAIS - DADOS DA PROPRIETARIA ( SRA. HELENA KAZUE TAKESHITA ) RG: 13.582.652-4 CPF 274.627.598- 88 - F. 9313.6432 (FILHO FERNANDO)	{"CódContábil":"1050.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. Dr. Mathias Jose de Barros Ponikwar 140","CepImóvel":"13053-123","Zoneamento":".","Receita":"3","Quarteirão":"05247","Quadra":"L","Lote":"20","CódLogradouro":".","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3","ÁreaTerreno":"300,00","ÁreaExcedente":null,"Observações":"SALA DE ORAÇAO EM TERRENO LOCADO COM CULTOS OFICIAIS - DADOS DA PROPRIETARIA ( SRA. HELENA KAZUE TAKESHITA ) RG: 13.582.652-4 CPF 274.627.598- 88 - F. 9313.6432 (FILHO FERNANDO)","FotoPrincipal":null}	-23.0272950999999999	-47.1146521000000007	R. Dr. Mathias Jose de Barros Ponikwar 140, Campinas, SP - 13053-123	046.548.200
29	0180.00	40	3	2376	4131.11.91.0634.01001	2015-02-05 02:19:00.395322	2015-06-12 02:11:03.125064	t	t	\N	{"CódContábil":"0180.00","Bairro":"Ch. Recanto dos Dourados","Distrito":null,"CódBrás":"22-23-76","CódIPTU":"055.071.981","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000988681","CódGrupo":"3","CódContador":"2376","CódCartograf":"4131.11.91.0634.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\RECANTO_DOS_DOURADOS.jpg","CódBrás_correto":"BR-22-2376"}	222376.00	Igreja	Em Funcionamento	PROPRIO	R. Elza Nascimento Liza, 590	13098-786	\N	3	08870	HH	15	1032.62	26.14	140.35	156.00	\N	\N	NRH-4.0 N RES. HORIZ.	PREDIAL	0.01	Imunidade concedida Douglas A. 27/08/07	{"CódContábil":"0180.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Elza Nascimento Liza, 590","CepImóvel":"13098-786","Zoneamento":null,"Receita":"3","Quarteirão":"08870","Quadra":"HH","Lote":"15","CódLogradouro":"3","ÁreaGeoFreqLixo":"156","TestadaTerreno":"26,14","ÁreaPrincipal":"140,35","ÁreaDependência":"0","TipoPadrão":"NRH-4.0 N RES. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"1.032,62","ÁreaExcedente":"0","Observações":"Imunidade concedida Douglas A. 27/08/07","FotoPrincipal":null}	-22.7961826000000016	-46.9946521000000033	R. Elza Nascimento Liza, 590, Campinas, SP - 13098-786	055.071.981
31	0200.00	55	2	0301	3164.61.03.0310.01001	2015-02-05 02:19:00.71844	2015-06-12 02:11:06.265467	t	t	\N	{"CódContábil":"0200.00","Bairro":"Ch. Três Marias","Distrito":null,"CódBrás":"22-03-01","CódIPTU":"052.094.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000050852","CódGrupo":"2","CódContador":"0301","CódCartograf":"3164.61.03.0310.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\CHACARA_TRES_MARIAS.JPG","CódBrás_correto":"BR-22-0301"}	220301.00	Igreja	Em Funcionamento	PROPRIO	R. Cacilda  Navarro Sampaio, 15 (R. Seis)	13067-709	15	2	15142	\N	15	1000.00	20.00	403.53	156.00	\N	\N	NRH-5.0	PREDIAL	0.01	1- Novo Templo inaugurado em 2010___DOUGLAS A.B.L 27/08/10	{"CódContábil":"0200.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Cacilda  Navarro Sampaio, 15 (R. Seis)","CepImóvel":"13067-709","Zoneamento":"15","Receita":"2","Quarteirão":"15142","Quadra":null,"Lote":"15","CódLogradouro":"6022","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"403,53","ÁreaDependência":"0","TipoPadrão":"NRH-5.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1.000,00","ÁreaExcedente":"0","Observações":"1- Novo Templo inaugurado em 2010___DOUGLAS A.B.L 27/08/10","FotoPrincipal":null}	-22.8719655000000017	-47.1353969999999975	R. Cacilda  Navarro Sampaio, 15 (R. Seis), Campinas, SP - 13067-709	052.094.000
229	1050.02	96	4	4346	5213.14.98.0068.00000	2015-02-05 02:19:34.897582	2015-06-12 02:19:03.588662	t	f	\N	{"CódContábil":"1050.02","Bairro":"Jd. Campo Belo I","Distrito":null,"CódBrás":"224346","CódIPTU":"046.546.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000097483","CódGrupo":"4","CódContador":"4346","CódCartograf":"5213.14.98.0068.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1050.01_JARDIM_CAMPO_BELO_I\\\\CAMPO BELO_ MINI.JPG","CódBrás_correto":"BR-22-4346"}	224346.02	Terreno	Aguarda Constr	PROPRIO	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N	13053-122	\N	\N	05247	L	002	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12	{"CódContábil":"1050.02","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N","CepImóvel":"13053-122","Zoneamento":null,"Receita":null,"Quarteirão":"05247","Quadra":"L","Lote":"002","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":"TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12","FotoPrincipal":null}	-23.0311684999999997	-47.1178109000000021	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N, Campinas, SP - 13053-122	046.546.600
36	0220.02	69	1	2338	3341.61.16.0106.01001	2015-02-05 02:19:01.715887	2015-06-12 02:11:12.315565	t	t	\N	{"CódContábil":"0220.02","Bairro":"Cidade Satelite Iris IV - (Jd. Rossin)","Distrito":null,"CódBrás":"22-23-38","CódIPTU":"042.472.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001216233","CódGrupo":"1","CódContador":"2338","CódCartograf":"3341.61.16.0106.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_ROSSIN.jpg","CódBrás_correto":"BR-22-2338"}	222338.02	Igreja	Em Funcionamento	PROPRIO	R. Elpídio Nivoloni 662 (antiga 26)	13059-233	\N	3	04678	257	17 Unif	1526.00	25.00	413.11	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	DOUGLAS A 24/08/09 - NESTE TERRENO ESTA A CASA DE ORAÇAO, COM O ESTACIONAMENTO EM FORMA DE ''L'' INTEGRADO. SÃO  + OU - 50 VAGAS \r\nNÃO TEM ASFALTO.\r\nImunidade ok  Douglas A. 01/09/08\r\n** INICIO DA OBRA EM 27/8/2002 -	{"CódContábil":"0220.02","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Elpídio Nivoloni 662 (antiga 26)","CepImóvel":"13059-233","Zoneamento":null,"Receita":"3","Quarteirão":"04678","Quadra":"257","Lote":"17 Unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"25","ÁreaPrincipal":"413,11","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1.526,00","ÁreaExcedente":"0","Observações":"DOUGLAS A 24/08/09 - NESTE TERRENO ESTA A CASA DE ORAÇAO, COM O ESTACIONAMENTO EM FORMA DE ''L'' INTEGRADO. SÃO  + OU - 50 VAGAS \\r\\nNÃO TEM ASFALTO.\\r\\nImunidade ok  Douglas A. 01/09/08\\r\\n** INICIO DA OBRA EM 27/8/2002 -","FotoPrincipal":null}	-22.9303188999999996	-47.1641230999999976	R. Elpídio Nivoloni 662 (antiga 26), Campinas, SP - 13059-233	042.472.100
168	0790.01	3	4	0308	3451.51.79.0699.00000	2015-02-05 02:19:24.365496	2015-06-12 02:17:46.202141	f	f	\N	{"CódContábil":"0790.01","Bairro":"Vl. Aeroporto (Maria Rosa)","Distrito":null,"CódBrás":"22-03-08","CódIPTU":"042.120.300","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000054043","CódGrupo":"4","CódContador":"0308","CódCartograf":"3451.51.79.0699.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-0308"}	220308.01	Estacionamento	Desativado	PROPRIO	AV. NOVE [VL AEROPORTO 2ª E 3ª GLEBAS] - SEM DENOMINAÇÃO	13054-107	\N	3	04139	K	010	540.00	15.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	2- Solicitar a Unificaçao dos IPTUs___DOUGLAS A 15/02/10	{"CódContábil":"0790.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"AV. NOVE [VL AEROPORTO 2ª E 3ª GLEBAS] - SEM DENOMINAÇÃO","CepImóvel":"13054-107","Zoneamento":null,"Receita":"3","Quarteirão":"04139","Quadra":"K","Lote":"010","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"15,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"540,00","ÁreaExcedente":"0","Observações":"2- Solicitar a Unificaçao dos IPTUs___DOUGLAS A 15/02/10","FotoPrincipal":null}	-22.9711548000000008	-47.1248894000000007	AV. NOVE [VL AEROPORTO 2ª E 3ª GLEBAS] - SEM DENOMINAÇÃO, Campinas, SP - 13054-107	042.120.300
37	0230.00	50	4	2846	3344.32.00.0186.01001	2015-02-05 02:19:01.881835	2015-06-12 02:15:06.712057	t	t	\N	{"CódContábil":"0230.00","Bairro":"Cidade Satelite Iris I","Distrito":null,"CódBrás":"22-28-46","CódIPTU":"042.610.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000413713","CódGrupo":"4","CódContador":"2846","CódCartograf":"3344.32.00.0186.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\CIDADE_SATELITE_IRIS_I.JPG","CódBrás_correto":"BR-22-2846"}	222846.00	Igreja	Em Funcionamento	PROPRIO	R. Padre Jean François Jobard (PADRE CHIQUINHO), 322	13059-665	03	3	04490	65	015-UNI	600.00	20.00	355.95	156.00	\N	\N	NRH-7.0	PREDIAL	0.01	Próximo ao Pq das flores - Esta casa de oraçao possui 02 estacionamentos (0230.03 e 0230.04) um de esquina e outro em frente, ambos estao abertos, ou seja, sem nenhum tipo de muro ou alambrado e qq identificação\r\nLevar em reuniao de comissão de Construçao, para que seja cercado, seja por muro ou por alambrado e identificar propriedade particular.\r\nEstá sem Numero e com a letra G da fachada caida.	{"CódContábil":"0230.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Padre Jean François Jobard (PADRE CHIQUINHO), 322","CepImóvel":"13059-665","Zoneamento":"03","Receita":"3","Quarteirão":"04490","Quadra":"65","Lote":"015-UNI","CódLogradouro":"0.046.375","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"355,95","ÁreaDependência":"0","TipoPadrão":"NRH-7.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"600,00","ÁreaExcedente":"0","Observações":"Próximo ao Pq das flores - Esta casa de oraçao possui 02 estacionamentos (0230.03 e 0230.04) um de esquina e outro em frente, ambos estao abertos, ou seja, sem nenhum tipo de muro ou alambrado e qq identificação\\r\\nLevar em reuniao de comissão de Construçao, para que seja cercado, seja por muro ou por alambrado e identificar propriedade particular.\\r\\nEstá sem Numero e com a letra G da fachada caida.","FotoPrincipal":null}	-22.9411033000000018	-47.1318282000000011	R. Padre Jean François Jobard (PADRE CHIQUINHO), 322, Campinas, SP - 13059-665	042.610.500
251	0230.03	50	4	2846	3344.32.14.0020.00000	2015-02-05 02:19:38.576787	2015-06-12 02:19:30.506594	t	f	\N	{"CódContábil":"0230.03","Bairro":"Cidade Satelite Iris I","Distrito":null,"CódBrás":"22-28-46","CódIPTU":"055.074.097","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001191803","CódGrupo":"4","CódContador":"2846","CódCartograf":"3344.32.14.0020.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\SAT. IRIS I - TERRENO FRENTE____MINI.JPG","CódBrás_correto":"BR-22-2846"}	222846.03	Estacionamento	Em Funcionamento	PROPRIO	R. Padre Jean François Jobard (Pe.Chiquinho), S/N	13059-665	\N	3	04485	60	10-A	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(ANT. Nº 65) ESTE SE LOCALIZA EM FRENTE A CASA DE ORAÇÃO,____DOUGLAS A 24/08/09	{"CódContábil":"0230.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Padre Jean François Jobard (Pe.Chiquinho), S/N","CepImóvel":"13059-665","Zoneamento":null,"Receita":"3","Quarteirão":"04485","Quadra":"60","Lote":"10-A","CódLogradouro":"4304","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3","ÁreaTerreno":"300,00","ÁreaExcedente":"0","Observações":"(ANT. Nº 65) ESTE SE LOCALIZA EM FRENTE A CASA DE ORAÇÃO,____DOUGLAS A 24/08/09","FotoPrincipal":null}	-22.9411033000000018	-47.1318282000000011	R. Padre Jean François Jobard (Pe.Chiquinho), S/N, Campinas, SP - 13059-665	055.074.097
42	0250.00	1	4	2134	3364.42.29.0152.01001	2015-02-05 02:19:02.717257	2015-06-12 02:11:19.982459	t	t	\N	{"CódContábil":"0250.00","Bairro":"Jd. Adhemar de Barros","Distrito":null,"CódBrás":"22-21-34","CódIPTU":"048.451.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000960703","CódGrupo":"4","CódContador":"2134","CódCartograf":"3364.42.29.0152.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_ADHEMAR_DE_BARROS.JPG","CódBrás_correto":"BR-22-2134"}	222134.00	Igreja	Em Funcionamento	PROPRIO	R. Paulo Machado de Carvalho, 542	13056-220	3	2	04915	X4	11	574.75	16.00	402.10	156.00	\N	\N	NRH-4.0 N RES. HORIZ.	PREDIAL	0.01	\N	{"CódContábil":"0250.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Paulo Machado de Carvalho, 542","CepImóvel":"13056-220","Zoneamento":"3","Receita":"2","Quarteirão":"04915","Quadra":"X4","Lote":"11","CódLogradouro":"0.051.235","ÁreaGeoFreqLixo":"156","TestadaTerreno":"16","ÁreaPrincipal":"402,10","ÁreaDependência":"0","TipoPadrão":"NRH-4.0 N RES. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"574,75","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9897583999999995	-47.1496230999999995	R. Paulo Machado de Carvalho, 542, Campinas, SP - 13056-220	048.451.200
45	0270.00	11	3	0315	3251.14.00.0340.01001	2015-02-05 02:19:03.225496	2015-06-12 02:11:23.316942	t	t	\N	{"CódContábil":"0270.00","Bairro":"Jd. Campineiro","Distrito":null,"CódBrás":"22-03-15","CódIPTU":"042.732.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001313482","CódGrupo":"3","CódContador":"0315","CódCartograf":"3251.14.00.0340.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\JARDIM_CAMPINEIRO.jpg","CódBrás_correto":"BR-22-0315"}	220315.00	Igreja	Em Funcionamento	PROPRIO	Av. Aguinaldo Acciari, 103	13080-380	03	2	05946	22	06 unif	600.00	24.00	398.05	156.00	\N	\N	NRH-5.0 N RESID. HORIZ.	PREDIAL	0.01	VIELA CEDIDA (AUMENTO DE AREA 700!) QUE FAZER?___DOUGLAS A 04/03/11\r\nTIRAR NOVA CND E CCO ? (AUMENTO DE AREA!)\r\n2003- área principal mudou de 353,40m2 p/ 393,54m2	{"CódContábil":"0270.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Aguinaldo Acciari, 103","CepImóvel":"13080-380","Zoneamento":"03","Receita":"2","Quarteirão":"05946","Quadra":"22","Lote":"06 unif","CódLogradouro":"149","ÁreaGeoFreqLixo":"156","TestadaTerreno":"24,00","ÁreaPrincipal":"398,05","ÁreaDependência":"0","TipoPadrão":"NRH-5.0 N RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"600,00","ÁreaExcedente":"0","Observações":"VIELA CEDIDA (AUMENTO DE AREA 700!) QUE FAZER?___DOUGLAS A 04/03/11\\r\\nTIRAR NOVA CND E CCO ? (AUMENTO DE AREA!)\\r\\n2003- área principal mudou de 353,40m2 p/ 393,54m2","FotoPrincipal":null}	-22.8552199999999992	-47.0633934999999965	Av. Aguinaldo Acciari, 103, Campinas, SP - 13080-380	042.732.800
34	0220.00	43	1	98-0008	3341.61.36.0203.00000	2015-02-05 02:19:01.244469	2015-07-04 14:54:19.922369	t	f	\N	{"CódContábil":"0220.00","Bairro":"Jd. Rossin","Distrito":null,"CódBrás":"98-00-08","CódIPTU":"055.057.855","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000634943","CódGrupo":"1","CódContador":"98-0008","CódCartograf":"3341.61.36.0203.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Rossin_Barracao_mini.JPG","CódBrás_correto":"BR-22-2338"}	980008.00	Barracão	Em Funcionamento	USUCAPIAO	R. Edwiges Fontana Coelho, 000	13059-232	3	3	10114	B	015	250.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	1- USUCAP-  PROPRIETARIO PROPR. SO LOTES EMPREEND. IMOBILIARIOS ► ESTE TERRENO ESTAVA, EM MEADOS DOS ANOS 90, DESOCUPADO.\r\n NESTA ÉPOCA A CCB ADQUIRIU UM TERRENO NO Nº 131 (0220.01) PARA EDIFICAR UMA SALA DE ORAÇÃO.\r\n OCORRE QUE, APROVADO O PROJETO DE CONSTRUÇÃO, INICIOU- SE NESTE TERRENO A CONSTRUÇÃO (QUE NÃO ERA NOSSO, MAS ESTAVA ABANDONADO), CONCLUIU- SE A SALINHA E SÓ ENTÃO NOTOU- SE QUE HAVIAM EDIFICADO EM LOCAL ERRADO.\r\nPASSOU- SE MAIS DE 20 ANOS E NÃO HÁ QQ INDICIO DO PROPRIETARIO.  ANALISAR A VIABILIDADE JURIDICA PARA AÇÃO DE USUCAPIÃO.\r\nATUALMENTE EH UM BARRACAO P/ ARMAZENAMENTO DE BANCADAS E MÓVEIS E CONSERTO DE MÁQUINAS DE COSTURA.\r\nO TERRENO PRECISA SER LIMPO, A FACHADA DEMOLIDA E NÃO TEM NUMERAÇÃO LEVAR EM REUN.COMISS.CONSTR. A REFORMA DOS COMODOS E OFERTAR PARA VENDA.\r\n REF: PROC.JUDIC.-576797/2005.(QUITADO)CERT.DÉBITO-063360/2007 CONFORME D.O.M DE 01/12/2007 FOI CONCEDIDO CRÉDITO TRIBUTÁRIO DE IPTU/TAXAS A PARTIR 2008 - DOUGLAS A. 24/08/09	{"CódContábil":"0220.00","Tipo":"Barracão","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"R. Edwiges Fontana Coelho, 000","CepImóvel":"13059-232","Zoneamento":"3","Receita":"3","Quarteirão":"10114","Quadra":"B","Lote":"015","CódLogradouro":"3146","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3","ÁreaTerreno":"250,00","ÁreaExcedente":"0","Observações":"1- USUCAP-  PROPRIETARIO PROPR. SO LOTES EMPREEND. IMOBILIARIOS ► ESTE TERRENO ESTAVA, EM MEADOS DOS ANOS 90, DESOCUPADO.\\r\\n NESTA ÉPOCA A CCB ADQUIRIU UM TERRENO NO Nº 131 (0220.01) PARA EDIFICAR UMA SALA DE ORAÇÃO.\\r\\n OCORRE QUE, APROVADO O PROJETO DE CONSTRUÇÃO, INICIOU- SE NESTE TERRENO A CONSTRUÇÃO (QUE NÃO ERA NOSSO, MAS ESTAVA ABANDONADO), CONCLUIU- SE A SALINHA E SÓ ENTÃO NOTOU- SE QUE HAVIAM EDIFICADO EM LOCAL ERRADO.\\r\\nPASSOU- SE MAIS DE 20 ANOS E NÃO HÁ QQ INDICIO DO PROPRIETARIO.  ANALISAR A VIABILIDADE JURIDICA PARA AÇÃO DE USUCAPIÃO.\\r\\nATUALMENTE EH UM BARRACAO P/ ARMAZENAMENTO DE BANCADAS E MÓVEIS E CONSERTO DE MÁQUINAS DE COSTURA.\\r\\nO TERRENO PRECISA SER LIMPO, A FACHADA DEMOLIDA E NÃO TEM NUMERAÇÃO LEVAR EM REUN.COMISS.CONSTR. A REFORMA DOS COMODOS E OFERTAR PARA VENDA.\\r\\n REF: PROC.JUDIC.-576797/2005.(QUITADO)CERT.DÉBITO-063360/2007 CONFORME D.O.M DE 01/12/2007 FOI CONCEDIDO CRÉDITO TRIBUTÁRIO DE IPTU/TAXAS A PARTIR 2008 - DOUGLAS A. 24/08/09","FotoPrincipal":null}	-22.9302792999999987	-47.1647127000000026	R. Edwiges Fontana Coelho, 000, Campinas, SP - 13059-232	055.057.855
52	0300.01	16	7	00001	3411.52.50.0125.01001	2015-02-05 02:19:04.416844	2015-08-10 23:51:49.520368	t	f	\N	{"CódContábil":"0300.01","Bairro":"Jd. Eulina (Barracão da Piedade)","Distrito":null,"CódBrás":"98-00-01","CódIPTU":"045.876.400","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000106342","CódGrupo":"7","CódContador":"00001","CódCartograf":"3411.52.50.0125.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Jd Eulina - Deposito\\\\Jd Eulina - Dep _mini.JPG","CódBrás_correto":"BR-00-0001"}	2200001.01	Barracão	Em Funcionamento	USUCAPIAO	Av. JOAO XXIII, 336	13063-600	\N	2	6035	52	8	271.40	11.80	52.48	301.00	\N	\N	RH- 2.0 RES. HORIZ.	PREDIAL	0.00	ACOMPANHAR E CADASTRAR O PROCESSO DE USUCAPIAO (VER COM O JURIDICO) -____DOUGLAS A. 23/02/11\r\nTERRENO DOADO A CCB A MAIS DE 15 ANOS E DE USO DA PIEDADE, POREM SEM DOCUMENTAÇAO ALGUMA. SERA FEITO UM PROCESSO DE USUCAPIAO____DOUGLAS A.  23/02/11\r\nTERRENO DOADO A CCB A MAIS DE 15 ANOS E DE USO DA PIEDADE, POREM SEM DOCUMENTAÇAO ALGUMA. SERA FEITO UM PROCESSO DE USUCAPIAO____DOUGLAS A.  23/02/11	{"CódContábil":"0300.01","Tipo":"Barracão","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"Av. JOAO XXIII, 336","CepImóvel":"13063-600","Zoneamento":null,"Receita":"2","Quarteirão":"6035","Quadra":"52","Lote":"8","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"11,80","ÁreaPrincipal":"52,48","ÁreaDependência":null,"TipoPadrão":"RH- 2.0 RES. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"0,400%","ÁreaTerreno":"271,40","ÁreaExcedente":null,"Observações":"ACOMPANHAR E CADASTRAR O PROCESSO DE USUCAPIAO (VER COM O JURIDICO) -____DOUGLAS A. 23/02/11\\r\\nTERRENO DOADO A CCB A MAIS DE 15 ANOS E DE USO DA PIEDADE, POREM SEM DOCUMENTAÇAO ALGUMA. SERA FEITO UM PROCESSO DE USUCAPIAO____DOUGLAS A.  23/02/11\\r\\nTERRENO DOADO A CCB A MAIS DE 15 ANOS E DE USO DA PIEDADE, POREM SEM DOCUMENTAÇAO ALGUMA. SERA FEITO UM PROCESSO DE USUCAPIAO____DOUGLAS A.  23/02/11","FotoPrincipal":null}	-22.8897845999999987	-47.1070719000000011	Av. JOAO XXIII, 336, Campinas, SP - 13063-600	045.876.400
53	0310.00	18	4	2454	5142.32.06.0141.01001	2015-02-05 02:19:04.755221	2015-06-12 02:15:20.003138	f	f	\N	{"CódContábil":"0310.00","Bairro":"Jd. Fernanda (Vendido)","Distrito":null,"CódBrás":"22-24-54","CódIPTU":"055.043.804","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001060653","CódGrupo":"4","CódContador":"2454","CódCartograf":"5142.32.06.0141.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-2454"}	222454.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	Av. Cid Guimarães Leme, 255	13053-639	\N	2	07756	J	27	250.00	10.00	127.91	2.00	\N	\N	C 1.0 Serviço/Comércio	\N	0.01	PAGO EM 25/05/11 - R$6.872,77, ref. A impostos de 98,99,2000,2002 e Sinistro 2002 e Tx lixo 98,99,2000,2002 - CHQ 9024(BCO ITAU) \r\nTERRENO FRUTO DE PERMUTA COM O 0530.01 em 31/7/2007_______DOUGLAS 31/5/11\r\nCONFORME D.O.M DE 01/12/2007 FOI CONCEDIDO CRÉDITO TRIBUTÁRIO DE IPTU/TAXAS A PARTIR 2008\r\nTerreno trocado pelo estacionamento São Domingos em 31/7/2007	{"CódContábil":"0310.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"Av. Cid Guimarães Leme, 255","CepImóvel":"13053-639","Zoneamento":null,"Receita":"2","Quarteirão":"07756","Quadra":"J","Lote":"27","CódLogradouro":"98,616","ÁreaGeoFreqLixo":"2 = 156 d/a","TestadaTerreno":"10,00","ÁreaPrincipal":"127,91","ÁreaDependência":"0","TipoPadrão":"C 1.0 Serviço/Comércio","CategoriaImóvel":null,"Alícota":"1,73%","ÁreaTerreno":"250,00","ÁreaExcedente":"0","Observações":"PAGO EM 25/05/11 - R$6.872,77, ref. A impostos de 98,99,2000,2002 e Sinistro 2002 e Tx lixo 98,99,2000,2002 - CHQ 9024(BCO ITAU) \\r\\nTERRENO FRUTO DE PERMUTA COM O 0530.01 em 31/7/2007_______DOUGLAS 31/5/11\\r\\nCONFORME D.O.M DE 01/12/2007 FOI CONCEDIDO CRÉDITO TRIBUTÁRIO DE IPTU/TAXAS A PARTIR 2008\\r\\nTerreno trocado pelo estacionamento São Domingos em 31/7/2007","FotoPrincipal":null}	\N	\N	Av. Cid Guimarães Leme, 255, Campinas, SP - 13053-639	055.043.804
50	0290.01	13	5	1812	3442.14.60.0140.00000	2015-02-05 02:19:04.051823	2015-06-12 02:11:30.228382	t	f	\N	{"CódContábil":"0290.01","Bairro":"Jd. Carlos Lourenço","Distrito":null,"CódBrás":"22-18-12","CódIPTU":"055.027.303","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000416181","CódGrupo":"5","CódContador":"1812","CódCartograf":"3442.14.60.0140.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-1812"}	221812.01	Estacionamento	Em Funcionamento	PROPRIO	R. Durval Faria Sobrinho, 000	13101-127	\N	3	06981	AA	37	280.10	10.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0290.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Durval Faria Sobrinho, 000","CepImóvel":"13101-127","Zoneamento":null,"Receita":"3","Quarteirão":"06981","Quadra":"AA","Lote":"37","CódLogradouro":"3069","ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno Sem Construção","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"280,10","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9259078999999986	-47.027495799999997	R. Durval Faria Sobrinho, 000, Campinas, SP - 13101-127	055.027.303
51	0300.00	16	2	0302	3411.51.76.0107.01001	2015-02-05 02:19:04.256048	2015-06-12 02:11:31.512895	t	t	\N	{"CódContábil":"0300.00","Bairro":"Jd. Eulina","Distrito":null,"CódBrás":"22-03-02","CódIPTU":"012.600.150","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000765742","CódGrupo":"2","CódContador":"0302","CódCartograf":"3411.51.76.0107.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\JARDIM_EULINA.JPG","CódBrás_correto":"BR-22-0302"}	220302.00	Igreja	Em Funcionamento	PROPRIO	Av. Dr Hermann da Cunha Canto, 160	13063-150	03	2	06030	47	22 unif	629.60	20.00	414.92	301.00	\N	\N	NRH 4.0 N RES. HORIZ.	PREDIAL	0.01	\N	{"CódContábil":"0300.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Dr Hermann da Cunha Canto, 160","CepImóvel":"13063-150","Zoneamento":"03","Receita":"2","Quarteirão":"06030","Quadra":"47","Lote":"22 unif","CódLogradouro":"3957","ÁreaGeoFreqLixo":"301","TestadaTerreno":"20,00","ÁreaPrincipal":"414,92","ÁreaDependência":"0","TipoPadrão":"NRH 4.0 N RES. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,30%","ÁreaTerreno":"629,60","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8873998999999984	-47.1114239999999995	Av. Dr Hermann da Cunha Canto, 160, Campinas, SP - 13063-150	012.600.150
170	0800.00	2	4	0313	3362.62.55.0252.01001	2015-02-05 02:19:24.69148	2015-06-12 02:17:48.732053	t	t	\N	{"CódContábil":"0800.00","Bairro":"Jd. Aeroporto (R. Cairí)","Distrito":null,"CódBrás":"22-03-13","CódIPTU":"041.993.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001184973","CódGrupo":"4","CódContador":"0313","CódCartograf":"3362.62.55.0252.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_AEROPORTO.JPG","CódBrás_correto":"BR-22-0313"}	220313.00	Igreja	Em Funcionamento	PROPRIO	R. Cairí, 341	13054-113	03	2	04212	56	01 unif	720.00	24.00	430.16	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	\N	{"CódContábil":"0800.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Cairí, 341","CepImóvel":"13054-113","Zoneamento":"03","Receita":"2","Quarteirão":"04212","Quadra":"56","Lote":"01 unif","CódLogradouro":"1448","ÁreaGeoFreqLixo":"156","TestadaTerreno":"24,00","ÁreaPrincipal":"430,16","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"720,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9716036999999993	-47.1266644000000028	R. Cairí, 341, Campinas, SP - 13054-113	041.993.900
19	0174.03	9	2	0281	3412.54.12.0154.00000	2015-02-05 02:18:58.759841	2015-06-12 02:14:51.670323	t	f	\N	{"CódContábil":"0174.03","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"024.685.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000455212","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0154.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim - Teodoro Langard 672 - 678 - 682_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.03	Estacionamento	Em Funcionamento	PROPRIO	R. Dr. Theodoro Langaard, 678	13077-760	9	3	00265	\N	003.A	265.50	2.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	ESTACIONAMENTO DOS FUNDOS - CENTRAL	{"CódContábil":"0174.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Dr. Theodoro Langaard, 678","CepImóvel":"13077-760","Zoneamento":"9","Receita":"3","Quarteirão":"00265","Quadra":null,"Lote":"003.A","CódLogradouro":"0.023.416","ÁreaGeoFreqLixo":"301","TestadaTerreno":"2","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"265,50","ÁreaExcedente":"0","Observações":"ESTACIONAMENTO DOS FUNDOS - CENTRAL","FotoPrincipal":null}	-22.8946760000000005	-47.0779120999999989	R. Dr. Theodoro Langaard, 678, Campinas, SP - 13077-760	024.685.000
48	0280.01	100	3	0305	3421.63.30.0191.00000	2015-02-05 02:19:03.709169	2015-06-12 02:11:27.612847	f	f	\N	{"CódContábil":"0280.01","Bairro":"Jd. Carlos Gomes","Distrito":null,"CódBrás":"22-03-05","CódIPTU":"019.278.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000093011","CódGrupo":"3","CódContador":"0305","CódCartograf":"3421.63.30.0191.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-0305"}	220305.01	Outros Fins	Desativado	PROPRIO	R. Piquete, 000	13092-496	3	3	759	F	12	384.00	12.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	ALICOTA 2007 ERA 0%	{"CódContábil":"0280.01","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Piquete, 000","CepImóvel":"13092-496","Zoneamento":"3","Receita":"3","Quarteirão":"759","Quadra":"F","Lote":"12","CódLogradouro":"7051","ÁreaGeoFreqLixo":"301","TestadaTerreno":"12","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"384","ÁreaExcedente":"0","Observações":"ALICOTA 2007 ERA 0%","FotoPrincipal":null}	-22.904394400000001	-47.034823099999997	R. Piquete, 000, Campinas, SP - 13092-496	019.278.000
54	0310.01	18	4	2454	5124.64.41.0231.01001	2015-02-05 02:19:04.918102	2015-06-12 02:15:21.261263	t	t	\N	{"CódContábil":"0310.01","Bairro":"Jd. Fernanda","Distrito":null,"CódBrás":"22-24-54","CódIPTU":"055.075.180","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001521903","CódGrupo":"4","CódContador":"2454","CódCartograf":"5124.64.41.0231.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_FERNANDA.jpg","CódBrás_correto":"BR-22-2454"}	222454.01	Igreja	Em Funcionamento	PROPRIO	R. Vitor Baranauskas Filho,454 (Ant.R.04)	13053-623	03	3	09243	F	24unif	1317.22	28.85	379.59	156.00	\N	\N	MISTO - VER ITEM 06 NS FL 03	PREDIAL	0.01	Matricula lote 24 QD "F" 3º Cartório de Registro nº124871\r\nMatricula lote 25 QD "F" 3º Cartório de Registro nº124872\r\nMatricula lote 26 QD "F" 3º Cartório de Registro nº124873\r\nMatricula lote 27 QD "F" 3º Cartório de Registro nº124874\r\nMatricula lote 28 QD "F" 3º Cartório de Registro nº124875	{"CódContábil":"0310.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Vitor Baranauskas Filho,454 (Ant.R.04)","CepImóvel":"13053-623","Zoneamento":"03","Receita":"3","Quarteirão":"09243","Quadra":"F","Lote":"24unif","CódLogradouro":"7378","ÁreaGeoFreqLixo":"156","TestadaTerreno":"28,85","ÁreaPrincipal":"379,59","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NS FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3","ÁreaTerreno":"1.317,22","ÁreaExcedente":"0","Observações":"Matricula lote 24 QD \\"F\\" 3º Cartório de Registro nº124871\\r\\nMatricula lote 25 QD \\"F\\" 3º Cartório de Registro nº124872\\r\\nMatricula lote 26 QD \\"F\\" 3º Cartório de Registro nº124873\\r\\nMatricula lote 27 QD \\"F\\" 3º Cartório de Registro nº124874\\r\\nMatricula lote 28 QD \\"F\\" 3º Cartório de Registro nº124875","FotoPrincipal":null}	-23.0422803999999992	-47.1301830000000024	R. Vitor Baranauskas Filho,454 (Ant.R.04), Campinas, SP - 13053-623	055.075.180
57	0330.00	19	1	0318	3343.31.50.0268.00000	2015-02-05 02:19:05.428065	2015-06-12 02:15:25.140783	t	t	\N	{"CódContábil":"0330.00","Bairro":"Jd. Florence","Distrito":null,"CódBrás":"22-03-18","CódIPTU":"055.062.958","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"002036033","CódGrupo":"1","CódContador":"0318","CódCartograf":"3343.31.50.0268.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JD. FLORENCE.jpg","CódBrás_correto":"BR-22-0318"}	220318.00	Igreja	Em Funcionamento	PROPRIO	R. Frederico Milanese, 45	13059-024	03	3	08327	SS	04	250.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	26/08/09 DOUGLAS A. - Este Templo esta localizado no Bairro Jd. Florence II, porém está denominado no Relatório como Jd. Florence, sendo que este não se localiza no Florence.\r\nNa realidade, no Bairro Florence não existe Templo da CCB. Sugerir a correção.	{"CódContábil":"0330.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Frederico Milanese, 45","CepImóvel":"13059-024","Zoneamento":"03","Receita":"3","Quarteirão":"08327","Quadra":"SS","Lote":"04","CódLogradouro":"3643","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"250,00","ÁreaExcedente":"0","Observações":"26/08/09 DOUGLAS A. - Este Templo esta localizado no Bairro Jd. Florence II, porém está denominado no Relatório como Jd. Florence, sendo que este não se localiza no Florence.\\r\\nNa realidade, no Bairro Florence não existe Templo da CCB. Sugerir a correção.","FotoPrincipal":null}	-22.942941900000001	-47.1630289000000005	R. Frederico Milanese, 45, Campinas, SP - 13059-024	055.062.958
127	0620.01	17	2	0314	3322.43.73.0102.00000	2015-02-05 02:19:17.405416	2015-06-12 02:16:55.239735	t	f	\N	{"CódContábil":"0620.01","Bairro":"Pq. Fazendinha","Distrito":null,"CódBrás":"22-03-14","CódIPTU":"055.045.997","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000605233","CódGrupo":"2","CódContador":"0314","CódCartograf":"3322.43.73.0102.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\Pq Fazendinha - Estacionamento_mini.JPG","CódBrás_correto":"BR-22-0314"}	220314.01	Estacionamento	Em Funcionamento	PROPRIO	R. Paulo Angi	13064-712	\N	3	07887	B	11	250.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0620.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Paulo Angi","CepImóvel":"13064-712","Zoneamento":null,"Receita":"3","Quarteirão":"07887","Quadra":"B","Lote":"11","CódLogradouro":"6846","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"250","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9005901999999999	-47.0882835000000028	R. Paulo Angi, Campinas, SP - 13064-712	055.045.997
129	0630.01	75	3	3637	4114.22.74.0316.00000	2015-02-05 02:19:17.751113	2015-06-12 02:16:57.732053	t	f	\N	{"CódContábil":"0630.01","Bairro":"Ch. Gargantilha","Distrito":null,"CódBrás":"223637","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001129942","CódGrupo":"3","CódContador":"3637","CódCartograf":"4114.22.74.0316.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3637"}	223637.01	Terreno	Em Funcionamento	PROPRIO	Rua Nicolino Pescume, 0	13098-811	\N	0	10345	BB	006	1032.06	61.27	\N	156.00	\N	\N	TERRENO	territorial	0.02	TERRENO ADQUIRIDO EM 29/07/2008 - ATUALMENTE SEM USO, CERCAMENTO E IDENTIFICAÇÃO.____DOUGLAS A 14/4/11	{"CódContábil":"0630.01","Tipo":"Terreno","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Rua Nicolino Pescume, 0","CepImóvel":"13098-811","Zoneamento":null,"Receita":"0","Quarteirão":"10345","Quadra":"BB","Lote":"006","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"61,27","ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":"Terreno","CategoriaImóvel":"territorial","Alícota":"2,3","ÁreaTerreno":"1032,06","ÁreaExcedente":null,"Observações":"TERRENO ADQUIRIDO EM 29/07/2008 - ATUALMENTE SEM USO, CERCAMENTO E IDENTIFICAÇÃO.____DOUGLAS A 14/4/11","FotoPrincipal":null}	\N	\N	Rua Nicolino Pescume, 0, Campinas, SP - 13098-811	000.000.000
114	0560.01	102	5	0300	3444.42.88.0339.00000	2015-02-05 02:19:15.190858	2015-06-12 02:16:36.483989	f	f	\N	{"CódContábil":"0560.01","Bairro":"Vl Formosa (vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"043.819.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000246043","CódGrupo":"5","CódContador":"0300","CódCartograf":"3444.42.88.0339.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220300.01	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. Dna. Benedita de Moraes Teixeira	13045-390	\N	3	03885	I	011	349.80	11.00	\N	156.00	\N	\N	TERRENO	\N	0.03	IMOVEL VENDIDO (13/05/2004, CONF. CONSTA EM INSTR. PARTIC. DE PROMESSA DE COMPROM. DE COMPRA E VENDA) - NÃO FOI ENCONTRADO A ESCRITURA PUBLICA E A MATRICULA ATUALIZADA______DOUGLAS A. 11/03/11	{"CódContábil":"0560.01","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Dna. Benedita de Moraes Teixeira","CepImóvel":"13045-390","Zoneamento":null,"Receita":"3","Quarteirão":"03885","Quadra":"I","Lote":"011","CódLogradouro":"1263","ÁreaGeoFreqLixo":"156 d/a","TestadaTerreno":"11","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno sem construção","CategoriaImóvel":null,"Alícota":"3","ÁreaTerreno":"349,80","ÁreaExcedente":"0","Observações":"IMOVEL VENDIDO (13/05/2004, CONF. CONSTA EM INSTR. PARTIC. DE PROMESSA DE COMPROM. DE COMPRA E VENDA) - NÃO FOI ENCONTRADO A ESCRITURA PUBLICA E A MATRICULA ATUALIZADA______DOUGLAS A. 11/03/11","FotoPrincipal":null}	\N	\N	R. Dna. Benedita de Moraes Teixeira, Campinas, SP - 13045-390	043.819.800
59	0330.02	19	1	0318	3343.31.50.0278.00000	2015-02-05 02:19:05.753712	2015-06-12 02:15:27.720841	t	f	\N	{"CódContábil":"0330.02","Bairro":"Jd. Florence","Distrito":null,"CódBrás":"22-03-18","CódIPTU":"055.062.957","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"002036023","CódGrupo":"1","CódContador":"0318","CódCartograf":"3343.31.50.0278.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Jd Florence\\\\IMG_3535 Jd Florence_mini.JPG","CódBrás_correto":"BR-22-0318"}	220318.02	Estacionamento	Em Funcionamento	PROPRIO	R. Frederico Milanesi, S/N	13059-024	\N	3	08327	SS	003	250.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	REGULARIZADO EM 2013\r\n7/7/2011- Protocolo 09/10/43009 de IMUNIDADE INDEFERIDO (D.O.M 30/04/11- e 10/05/11), pois trata- se de um loteamento irregular e não pode ser passado no nome da CCB. Iremos pagar até haver a regularização do loteamento\r\n26/08/09 DOUGLAS A-  Terreno para estacionamento, localizado do lado esquerdo do Templo.\r\nComprado em março de 2004	{"CódContábil":"0330.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Frederico Milanesi, S/N","CepImóvel":"13059-024","Zoneamento":null,"Receita":"3","Quarteirão":"08327","Quadra":"SS","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"250,00","ÁreaExcedente":"0","Observações":"REGULARIZADO EM 2013\\r\\n7/7/2011- Protocolo 09/10/43009 de IMUNIDADE INDEFERIDO (D.O.M 30/04/11- e 10/05/11), pois trata- se de um loteamento irregular e não pode ser passado no nome da CCB. Iremos pagar até haver a regularização do loteamento\\r\\n26/08/09 DOUGLAS A-  Terreno para estacionamento, localizado do lado esquerdo do Templo.\\r\\nComprado em março de 2004","FotoPrincipal":null}	-22.9423913000000006	-47.1641040000000018	R. Frederico Milanesi, S/N, Campinas, SP - 13059-024	055.062.957
61	0340.00	21	1	1712	3431.41.16.0049.01001	2015-02-05 02:19:06.080523	2015-06-12 02:15:30.302017	t	t	\N	{"CódContábil":"0340.00","Bairro":"Jd. Ipaussurama","Distrito":null,"CódBrás":"22-17-12","CódIPTU":"048.215.300","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001126033","CódGrupo":"1","CódContador":"1712","CódCartograf":"3431.41.16.0049.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_IPAUSSURAMA.jpg","CódBrás_correto":"BR-22-1712"}	221712.00	Igreja	Em Funcionamento	PROPRIO	R. Lourenço Zen, 72	13060-831	11	2	04059	24	13 uni	645.90	20.00	310.35	156.00	\N	\N	NRH-6.0	PREDIAL	0.01	2003- excluida 49,5m2 area dependencia	{"CódContábil":"0340.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Lourenço Zen, 72","CepImóvel":"13060-831","Zoneamento":"11","Receita":"2","Quarteirão":"04059","Quadra":"24","Lote":"13 uni","CódLogradouro":"5257","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20","ÁreaPrincipal":"310,35","ÁreaDependência":"0","TipoPadrão":"NRH-6.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"645,90","ÁreaExcedente":"0","Observações":"2003- excluida 49,5m2 area dependencia","FotoPrincipal":null}	-22.9293684999999989	-47.1251874000000015	R. Lourenço Zen, 72, Campinas, SP - 13060-831	048.215.300
62	0340.01	21	1	1712	3342.62.97.0311.00000	2015-02-05 02:19:06.240111	2015-06-12 02:15:31.698996	t	f	\N	{"CódContábil":"0340.01","Bairro":"Jd. Ipaussurama","Distrito":null,"CódBrás":"221712","CódIPTU":"048.211.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"1","CódContador":"1712","CódCartograf":"3342.62.97.0311.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Ipaussurama - Estacionamento_mini.JPG","CódBrás_correto":"BR-22-1712"}	221712.01	Estacionamento	Em Funcionamento	PROPRIO	R. Lourenço Zen,	13060-831	\N	3	04047	12	025	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Pegar dados de IPTU e colher demais dados	{"CódContábil":"0340.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Lourenço Zen,","CepImóvel":"13060-831","Zoneamento":null,"Receita":"3","Quarteirão":"04047","Quadra":"12","Lote":"025","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"300,00","ÁreaExcedente":"0","Observações":"Pegar dados de IPTU e colher demais dados","FotoPrincipal":null}	-22.9276552000000002	-47.1238365999999971	R. Lourenço Zen,, Campinas, SP - 13060-831	048.211.200
72	0390.01	102	1	0316	0	2015-02-05 02:19:07.911007	2015-06-12 02:15:44.437355	f	f	\N	{"CódContábil":"0390.01","Bairro":"Jd. Metonópolis (Dado em troca)","Distrito":null,"CódBrás":null,"CódIPTU":"047.437.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001188923","CódGrupo":"1","CódContador":"0316","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220316.01	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. Daniel Moacyr Novaes Lippe	13058-357	\N	3	05704	H	19	360.00	12.00	\N	2.00	\N	\N	TERRENO	\N	0.03	2003 - IMOVEL TROCADO PELO LOTE 23	{"CódContábil":"0390.01","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Daniel Moacyr Novaes Lippe","CepImóvel":"13058-357","Zoneamento":null,"Receita":"3","Quarteirão":"05704","Quadra":"H","Lote":"19","CódLogradouro":null,"ÁreaGeoFreqLixo":"2 = 156 d/a","TestadaTerreno":"12","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"Terreno   Sem Construção","CategoriaImóvel":null,"Alícota":"3","ÁreaTerreno":"360,00","ÁreaExcedente":"0","Observações":"2003 - IMOVEL TROCADO PELO LOTE 23","FotoPrincipal":null}	-22.9526548999999989	-47.1883363999999972	R. Daniel Moacyr Novaes Lippe, Campinas, SP - 13058-357	047.437.700
65	0360.00	26	2	0287	3431.22.27.0120.01001	2015-02-05 02:19:06.730528	2015-06-12 02:15:35.517995	t	t	\N	{"CódContábil":"0360.00","Bairro":"Jd. Londres","Distrito":null,"CódBrás":"22-02-87","CódIPTU":"012.600.250","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001189023","CódGrupo":"2","CódContador":"0287","CódCartograf":"3431.22.27.0120.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\JARDIM_LONDRES.JPG","CódBrás_correto":"BR-22-0287"}	220287.00	Igreja	Em Funcionamento	PROPRIO	Av. Ibirapuera, 808	13060-240	11	2	03838	DD	025	698.00	20.00	386.68	301.00	\N	\N	NRH.-6.0	PREDIAL	0.01	\r\nHouve um débito de ISSQN notificado pelo nº 11-950003372 processo: 573418 da 1º Vara q foi pago e informado à PMCpelo protocolo 2007/10/53058\r\n2003- excluida 55,40m2 area dependencia	{"CódContábil":"0360.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Ibirapuera, 808","CepImóvel":"13060-240","Zoneamento":"11","Receita":"2","Quarteirão":"03838","Quadra":"DD","Lote":"025","CódLogradouro":"4038","ÁreaGeoFreqLixo":"301","TestadaTerreno":"20,00","ÁreaPrincipal":"386,68","ÁreaDependência":"0","TipoPadrão":"NRH.-6.0","CategoriaImóvel":"PREDIAL","Alícota":"1,30%","ÁreaTerreno":"698,00","ÁreaExcedente":"0","Observações":"\\r\\nHouve um débito de ISSQN notificado pelo nº 11-950003372 processo: 573418 da 1º Vara q foi pago e informado à PMCpelo protocolo 2007/10/53058\\r\\n2003- excluida 55,40m2 area dependencia","FotoPrincipal":null}	-22.9179770000000005	-47.1090476999999979	Av. Ibirapuera, 808, Campinas, SP - 13060-240	012.600.250
66	0360.01	26	2	0287	3431.22.27.0110.00000	2015-02-05 02:19:06.892697	2015-06-12 02:15:36.802054	t	f	\N	{"CódContábil":"0360.01","Bairro":"Jd. Londres","Distrito":null,"CódBrás":"22-02-87","CódIPTU":"042.079.669","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000017823","CódGrupo":"2","CódContador":"0287","CódCartograf":"3431.22.27.0110.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Jd Londres\\\\Jd Londres_mini.JPG","CódBrás_correto":"BR-22-0287"}	220287.01	Estacionamento	Em Funcionamento	PROPRIO	Av.  Ibirapuera, 790	13060-240	11	3	03838	DD	027	303.00	10.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0360.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av.  Ibirapuera, 790","CepImóvel":"13060-240","Zoneamento":"11","Receita":"3","Quarteirão":"03838","Quadra":"DD","Lote":"027","CódLogradouro":"4038","ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"303,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9178078999999997	-47.1094610999999972	Av.  Ibirapuera, 790, Campinas, SP - 13060-240	042.079.669
67	0360.02	26	2	0287	3431.22.27.0078.00000	2015-02-05 02:19:07.075397	2015-06-12 02:15:38.054757	t	f	\N	{"CódContábil":"0360.02","Bairro":"Jd. Londres","Distrito":null,"CódBrás":"22-02-87","CódIPTU":"008.069.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000869823","CódGrupo":"2","CódContador":"0287","CódCartograf":"3431.22.27.0078.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Jd Londres\\\\Jd Londres_mini.JPG","CódBrás_correto":"BR-22-0287"}	220287.02	Estacionamento	Em Funcionamento	PROPRIO	AV. IBIRAPUERA	13060-240	\N	3	03838	DD	028	546.00	22.16	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Nº 760/770)	{"CódContábil":"0360.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"AV. IBIRAPUERA","CepImóvel":"13060-240","Zoneamento":null,"Receita":"3","Quarteirão":"03838","Quadra":"DD","Lote":"028","CódLogradouro":"4038","ÁreaGeoFreqLixo":"301","TestadaTerreno":"22,16","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,8%","ÁreaTerreno":"546,00","ÁreaExcedente":"0","Observações":"(Nº 760/770)","FotoPrincipal":null}	-22.9169990000000006	-47.1122556999999986	AV. IBIRAPUERA, Campinas, SP - 13060-240	008.069.000
68	0370.00	27	5	0307	3442.54.14.0022.01001	2015-02-05 02:19:07.257938	2015-06-12 02:15:39.363996	t	t	\N	{"CódContábil":"0370.00","Bairro":"Jd. Maisa","Distrito":null,"CódBrás":"22-03-07","CódIPTU":"045.386.040","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001129533","CódGrupo":"5","CódContador":"0307","CódCartograf":"3442.54.14.0022.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_MAISA.JPG","CódBrás_correto":"BR-22-0307"}	220307.00	Igreja	Em Funcionamento	PROPRIO	R. Amabílio Betim, 379	13046-260	01	2	03914	G	015	527.35	20.00	270.00	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	2003 - excluido 13m2 area dependencia	{"CódContábil":"0370.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Amabílio Betim, 379","CepImóvel":"13046-260","Zoneamento":"01","Receita":"2","Quarteirão":"03914","Quadra":"G","Lote":"015","CódLogradouro":"417","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"270,00","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"527,35","ÁreaExcedente":"0","Observações":"2003 - excluido 13m2 area dependencia","FotoPrincipal":null}	-22.9398845999999992	-47.015332100000002	R. Amabílio Betim, 379, Campinas, SP - 13046-260	045.386.040
99	0490.02	73	1	3346	3431.44.51.0500.00000	2015-02-05 02:19:12.673068	2015-06-12 02:16:17.564451	f	f	\N	{"CódContábil":"0490.02","Bairro":"Jd. Santa Lúcia (Devolvido)","Distrito":null,"CódBrás":"22-33-46","CódIPTU":"047.279.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.44.51.0500.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3346"}	223346.02	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Cabo Verde, 368	13060-562	\N	3	03993	45	002	493.00	10.00	\N	2.00	\N	\N	TERRENO	\N	0.03	segundo contrato de aluguel, ccb paga este IPTU	{"CódContábil":"0490.02","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Cabo Verde, 368","CepImóvel":"13060-562","Zoneamento":null,"Receita":"3","Quarteirão":"03993","Quadra":"45","Lote":"002","CódLogradouro":"1428","ÁreaGeoFreqLixo":"2=156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno   Sem Construção","CategoriaImóvel":null,"Alícota":"3","ÁreaTerreno":"493,00","ÁreaExcedente":"0","Observações":"segundo contrato de aluguel, ccb paga este IPTU","FotoPrincipal":null}	-22.9364880999999983	-47.1192643999999987	R. Cabo Verde, 368, Campinas, SP - 13060-562	047.279.600
22	0174.06	9	2	0281	3412.54.12.0418.00000	2015-02-05 02:18:59.245893	2015-06-12 02:10:53.926056	t	f	\N	{"CódContábil":"0174.06","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"040.432.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000481932","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0418.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim, Germania 635 - 641  lateral_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.06	Estacionamento	Em Funcionamento	PROPRIO	R. Germania, 000	13070-770	\N	2	00265	\N	023	484.00	11.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	antigo 641 - CENTRAL  -- 16/12/2009 EXPEDIDO O ALVARÁ DE INSTALAÇÃO DE TAPUME Nº 33/2009 - VENCE EM 16 DEZ 2011.	{"CódContábil":"0174.06","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Germania, 000","CepImóvel":"13070-770","Zoneamento":null,"Receita":"2","Quarteirão":"00265","Quadra":null,"Lote":"023","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"11","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO S/CONSTR.","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"484,00","ÁreaExcedente":"0","Observações":"antigo 641 - CENTRAL  -- 16/12/2009 EXPEDIDO O ALVARÁ DE INSTALAÇÃO DE TAPUME Nº 33/2009 - VENCE EM 16 DEZ 2011.","FotoPrincipal":null}	-22.8934685999999985	-47.0751021000000023	R. Germania, 000, Campinas, SP - 13070-770	040.432.000
75	0410.00	33	4	0312	3452.42.51.0192.01001	2015-02-05 02:19:08.400423	2015-06-12 02:15:48.394169	f	f	\N	{"CódContábil":"0410.00","Bairro":"Jd. N.S. Lourdes","Distrito":null,"CódBrás":"22-03-12","CódIPTU":"042.098.510","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000458763","CódGrupo":"4","CódContador":"0312","CódCartograf":"3452.42.51.0192.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_NOSSA_SENHORA_DE_LOURDES.JPG","CódBrás_correto":"BR-22-0312"}	220312.00	Estacionamento	Desativado	PROPRIO	R. José Ifanger, 95	13051-552	11	2	05804	I	005	390.00	13.00	293.25	156.00	\N	\N	RH-5.0	PREDIAL	0.00	Matricula encerrada, lote anexado ao LT 06.	{"CódContábil":"0410.00","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. José Ifanger, 95","CepImóvel":"13051-552","Zoneamento":"11","Receita":"2","Quarteirão":"05804","Quadra":"I","Lote":"005","CódLogradouro":"4832","ÁreaGeoFreqLixo":"156","TestadaTerreno":"13,00","ÁreaPrincipal":"293,25","ÁreaDependência":"0","TipoPadrão":"RH-5.0","CategoriaImóvel":"PREDIAL","Alícota":"0,7%","ÁreaTerreno":"390,00","ÁreaExcedente":"0","Observações":"Matricula encerrada, lote anexado ao LT 06.","FotoPrincipal":null}	-22.9733631000000003	-47.0859205000000003	R. José Ifanger, 95, Campinas, SP - 13051-552	042.098.510
78	0420.00	34	4	0317	3453.54.10.0156.01001	2015-02-05 02:19:08.912339	2015-06-12 02:15:52.189789	t	t	\N	{"CódContábil":"0420.00","Bairro":"Jd. Nova América","Distrito":null,"CódBrás":"220317","CódIPTU":"045.035.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001451033","CódGrupo":"4","CódContador":"0317","CódCartograf":"3453.54.10.0156.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_NOVA_AMERICA.JPG","CódBrás_correto":"BR-22-0317"}	220317.00	Igreja	Em Funcionamento	PROPRIO	R. Maria Benedicta Tranferetti, 90	13053-021	03	3	05101	44	001-UNI	1103.30	31.20	339.28	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0420.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Maria Benedicta Tranferetti, 90","CepImóvel":"13053-021","Zoneamento":"03","Receita":"3","Quarteirão":"05101","Quadra":"44","Lote":"001-UNI","CódLogradouro":"5622","ÁreaGeoFreqLixo":"156","TestadaTerreno":"31,20","ÁreaPrincipal":"339,28","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1.103,30","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-23.0028141999999995	-47.1084992999999983	R. Maria Benedicta Tranferetti, 90, Campinas, SP - 13053-021	045.035.500
82	0440.00	37	1	0306	3431.51.72.0219.01001	2015-02-05 02:19:09.584183	2015-06-12 02:15:56.810873	t	t	\N	{"CódContábil":"0440.00","Bairro":"Jd. Novo Campos Elíseos","Distrito":null,"CódBrás":"22-03-06","CódIPTU":"042.028.392","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000300553","CódGrupo":"1","CódContador":"0306","CódCartograf":"3431.51.72.0219.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_NOVO_CAMPOS_ELISEOS.jpg","CódBrás_correto":"BR-22-0306"}	220306.00	Igreja	Em Funcionamento	PROPRIO	R. Isnard Otranto, 20	13060-412	11	2	03611	4	019	490.00	14.00	283.70	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	2003 - excluida 36,50m2 area dependencia	{"CódContábil":"0440.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Isnard Otranto, 20","CepImóvel":"13060-412","Zoneamento":"11","Receita":"2","Quarteirão":"03611","Quadra":"4","Lote":"019","CódLogradouro":"4148","ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"283,70","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"490,00","ÁreaExcedente":"0","Observações":"2003 - excluida 36,50m2 area dependencia","FotoPrincipal":null}	-22.9315025000000006	-47.1104959999999977	R. Isnard Otranto, 20, Campinas, SP - 13060-412	042.028.392
8	0130.01	29	3	0309	\N	2015-02-05 02:18:56.553248	2015-06-09 20:15:37.890556	t	f	\N	{"CódContábil":"0130.01","Bairro":"Ch. Marujo - Barão Geraldo ( Estacionamento)","Distrito":null,"CódBrás":"220309","CódIPTU":null,"CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"3","CódContador":"0309","CódCartograf":null,"CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Ch Marujo_Estac_mini.JPG","CódBrás_correto":"BR-22-0309"}	220309.01	Estacionamento	Em Funcionamento	ALUGADO	R. Joviniano Barbosa	13083-000	\N	\N	GLEBA 08	A	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Esta locação é administrada pela congregação local....de maneira que não temos qualquer outra informação além do que consta em contrato.___IR. MAX.	{"CódContábil":"0130.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. Joviniano Barbosa","CepImóvel":"13083-000","Zoneamento":null,"Receita":null,"Quarteirão":"GLEBA 08","Quadra":"A","Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Esta locação é administrada pela congregação local....de maneira que não temos qualquer outra informação além do que consta em contrato.___IR. MAX.","FotoPrincipal":null}	-22.7800572000000017	-47.0858082999999965	R. Joviniano Barbosa, Campinas, SP - 13083-000	\N
224	1020.00	102	1	0281	INCRA 624047.025054-5	2015-02-05 02:19:34.022494	2015-06-12 02:18:55.451962	f	f	\N	{"CódContábil":"1020.00","Bairro":"Sitio Santa Cruz - John Boyd Dunlop (Vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001331363","CódGrupo":"1","CódContador":"0281","CódCartograf":"INCRA 624047.025054-5","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\cclinux-server\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220281.00	Terreno	Desativado	DEVOLVIDO/VENDIDO	Av: John Boyd Dunlop (ver + detalhes)	13059-688	\N	\N	Gleba 07	\N	\N	2980.00	29.80	\N	\N	\N	\N	IGREJA	\N	\N	5- (VENDIDO) Em 09/08/10 foi firmado um Instrumento particular de substituição de objeto de promessa de doaçao, sendo este imovel VENDIDO pela quantia de R$320.000,00 a A.D. PARTICIPAÇOES INCORPORAÇOES LTDA.  ___DOUGLAS A.B.L 27/08/10\r\n4- Conforme Escritura, pedem que nós providenciemos a documentação da Doação e registremos em Cartório, em seis meses. Prazo este já estourado e estao ameaçando cobrar juridicamente.___(DOUGLAS A. 01/02/10)\r\n3- A.D. Participaçoes Incorporaçoes Ltda (Covabra), transferiu todos os seus direitos para JR TERRA, uma outra empresa do Grupo Covabra.\r\n2- Sendo assim o novo proprietario A.D. Participaçoes Incorporaçoes Ltda (Covabra) se compromete a outorgar a C.C.B a escritura publica de doaçao da referida área c/ 29,8 mt de frente e de fundo, por 100 mt nas laterais,  margeando a Gleba 06.\r\n1- A antiga proprietaria, nossa irma Alice de Abreu Moraes vendeu este terreno à  A.D. Participaçoes Incorporaçoes Ltda (Covabra) com a seguinte condiçao: Que fosse outorgada à CCB de Cps, uma área de terras por doaçao.	{"CódContábil":"1020.00","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"Av: John Boyd Dunlop (ver + detalhes)","CepImóvel":"13059-688","Zoneamento":null,"Receita":null,"Quarteirão":"Gleba 07","Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"29,8","ÁreaPrincipal":"VENDIDO","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"2980,00","ÁreaExcedente":null,"Observações":"5- (VENDIDO) Em 09/08/10 foi firmado um Instrumento particular de substituição de objeto de promessa de doaçao, sendo este imovel VENDIDO pela quantia de R$320.000,00 a A.D. PARTICIPAÇOES INCORPORAÇOES LTDA.  ___DOUGLAS A.B.L 27/08/10\\r\\n4- Conforme Escritura, pedem que nós providenciemos a documentação da Doação e registremos em Cartório, em seis meses. Prazo este já estourado e estao ameaçando cobrar juridicamente.___(DOUGLAS A. 01/02/10)\\r\\n3- A.D. Participaçoes Incorporaçoes Ltda (Covabra), transferiu todos os seus direitos para JR TERRA, uma outra empresa do Grupo Covabra.\\r\\n2- Sendo assim o novo proprietario A.D. Participaçoes Incorporaçoes Ltda (Covabra) se compromete a outorgar a C.C.B a escritura publica de doaçao da referida área c/ 29,8 mt de frente e de fundo, por 100 mt nas laterais,  margeando a Gleba 06.\\r\\n1- A antiga proprietaria, nossa irma Alice de Abreu Moraes vendeu este terreno à  A.D. Participaçoes Incorporaçoes Ltda (Covabra) com a seguinte condiçao: Que fosse outorgada à CCB de Cps, uma área de terras por doaçao.","FotoPrincipal":null}	-22.9453488000000014	-47.143614300000003	Av: John Boyd Dunlop (ver + detalhes), Campinas, SP - 13059-688	000.000.000
85	0450.00	12	1	0293	3431.64.11.0001.01001	2015-02-05 02:19:10.074518	2015-06-12 02:16:00.609806	t	t	\N	{"CódContábil":"0450.00","Bairro":"Campos Elíseos","Distrito":null,"CódBrás":"22-02-93","CódIPTU":"042.013.789","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000252143","CódGrupo":"1","CódContador":"0293","CódCartograf":"3431.64.11.0001.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\CAMPOS ELISEOS.jpg","CódBrás_correto":"BR-22-0293"}	220293.00	Igreja	Em Funcionamento	PROPRIO	R. Sumaré, 156	13050-550	\N	2	03514	76	017	460.00	26.00	263.01	156.00	\N	\N	NRH-7.0	PREDIAL	0.01	\N	{"CódContábil":"0450.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Sumaré, 156","CepImóvel":"13050-550","Zoneamento":null,"Receita":"2","Quarteirão":"03514","Quadra":"76","Lote":"017","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"26,00","ÁreaPrincipal":"263,01","ÁreaDependência":"0","TipoPadrão":"NRH-7.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"460,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9381638999999993	-47.0985709999999997	R. Sumaré, 156, Campinas, SP - 13050-550	042.013.789
87	0460.01	59	7	0007	3431.54.93.0364.01001	2015-02-05 02:19:10.43201	2015-06-12 02:16:03.156442	f	f	\N	{"CódContábil":"0460.01","Bairro":"Jd. Novo Campos Eliseos (Recanto dos Velhos)","Distrito":null,"CódBrás":"980007","CódIPTU":"046.401.400","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000238013","CódGrupo":"7","CódContador":"0007","CódCartograf":"3431.54.93.0364.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\IMG_3591 Lar dos Velhinhos_mini.JPG","CódBrás_correto":"BR-"}	220007.01	Outros Fins	Desativado	PROPRIO	R Arlindo Gomes, 317	13060-151	\N	2	03581	60	019	400.15	14.00	157.20	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	foi anexado c/ o lote 20 (prot. 30245/02 de 03/12/2003)	{"CódContábil":"0460.01","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R Arlindo Gomes, 317","CepImóvel":"13060-151","Zoneamento":null,"Receita":"2","Quarteirão":"03581","Quadra":"60","Lote":"019","CódLogradouro":"986","ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"157,20","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"400,15","ÁreaExcedente":"0","Observações":"foi anexado c/ o lote 20 (prot. 30245/02 de 03/12/2003)","FotoPrincipal":null}	-22.9360071999999988	-47.1039367999999996	R Arlindo Gomes, 317, Campinas, SP - 13060-151	046.401.400
91	0480.00	38	5	0286	3441.52.56.0142.01001	2015-02-05 02:19:11.104195	2015-06-12 02:16:08.10189	t	t	\N	{"CódContábil":"0480.00","Bairro":"Jd. dos Oliveiras","Distrito":null,"CódBrás":"22-02-86","CódIPTU":"012.597.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000562083","CódGrupo":"5","CódContador":"0286","CódCartograf":"3441.52.56.0142.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_DOS_OLIVEIRAS.JPG","CódBrás_correto":"BR-22-0286"}	220286.00	Igreja	Em Funcionamento	PROPRIO	Av. Engenheiro Antonio Francisco de Paula Souza, 953	13043-540	11	2	01819	H	004	530.52	14.00	269.60	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	PEDIR UNIF. DO CARNE - PROJETO APROVADO 2007\r\n2003- excluida 60,70m2 area dependencia       ***ALVARÁ VENCIDO**	{"CódContábil":"0480.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Engenheiro Antonio Francisco de Paula Souza, 953","CepImóvel":"13043-540","Zoneamento":"11","Receita":"2","Quarteirão":"01819","Quadra":"H","Lote":"004","CódLogradouro":"731","ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"269,60","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"530,52","ÁreaExcedente":"0","Observações":"PEDIR UNIF. DO CARNE - PROJETO APROVADO 2007\\r\\n2003- excluida 60,70m2 area dependencia       ***ALVARÁ VENCIDO**","FotoPrincipal":null}	-22.9289936999999995	-47.0445909999999969	Av. Engenheiro Antonio Francisco de Paula Souza, 953, Campinas, SP - 13043-540	012.597.000
32	0210.00	68	1	3225	0	2015-02-05 02:19:00.899505	2015-06-12 02:11:07.53862	t	t	\N	{"CódContábil":"0210.00","Bairro":"Cidade Satelite Iris II (Florence II)","Distrito":null,"CódBrás":"22-32-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"002036063","CódGrupo":"1","CódContador":"3225","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\CIDADE_SATELITE_IRIS_II_FLORENCE_II.jpg","CódBrás_correto":"BR-22-3225"}	223225.00	Igreja	Em Funcionamento	PROPRIO	R. Dr.Luiz Henrique Giovanetti, 2345	13061-615	\N	\N	4530	106	4	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	26/08/09 DOUGLAS A. - Este Templo esta localizado no Bairro Cid. Satélite Iris II, porém está denominado no Relatório Bairro Cid. Satélite Iris II (Florence II), sendo que este não se localiza no Florence II.\r\nNa realidade, no Bairro Florence II está erguido o Templo da igreja do Florence (como esta no Relatório) que, por sua vez esta com a nomenclatura do Bairro errada.\r\nEste não possui terreno para estacionamento e não há lotes vazios ao redor.\r\nLoteamento em regularização- Não tem IPTU	{"CódContábil":"0210.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Dr.Luiz Henrique Giovanetti, 2345","CepImóvel":"13061-615","Zoneamento":null,"Receita":null,"Quarteirão":"4530","Quadra":"106","Lote":"4","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"26/08/09 DOUGLAS A. - Este Templo esta localizado no Bairro Cid. Satélite Iris II, porém está denominado no Relatório Bairro Cid. Satélite Iris II (Florence II), sendo que este não se localiza no Florence II.\\r\\nNa realidade, no Bairro Florence II está erguido o Templo da igreja do Florence (como esta no Relatório) que, por sua vez esta com a nomenclatura do Bairro errada.\\r\\nEste não possui terreno para estacionamento e não há lotes vazios ao redor.\\r\\nLoteamento em regularização- Não tem IPTU","FotoPrincipal":null}	\N	\N	R. Dr.Luiz Henrique Giovanetti, 2345, Campinas, SP - 13061-615	000.000.000
94	0480.03	38	5	0286	3441.52.56.0265.01001	2015-02-05 02:19:11.793532	2015-06-12 02:16:11.679805	t	f	\N	{"CódContábil":"0480.03","Bairro":"Jd. dos Oliveiras","Distrito":null,"CódBrás":"220286","CódIPTU":"042.023.848","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000056843","CódGrupo":"5","CódContador":"0286","CódCartograf":"3441.52.56.0265.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\5- Jd_Oliveiras_terreno_mini.JPG","CódBrás_correto":"BR-22-0286"}	220286.03	Estacionamento	Em Funcionamento	PROPRIO	R. Mirassol, 64	13043-300	\N	2	01819	H	029	358.10	12.00	217.36	156.00	\N	\N	RH-3.0	PREDIAL	0.00	AGUARDA DEMOLIÇÃO PARA ESTACIONAMENTO - DOUGLAS A 30/03/2009	{"CódContábil":"0480.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Mirassol, 64","CepImóvel":"13043-300","Zoneamento":null,"Receita":"2","Quarteirão":"01819","Quadra":"H","Lote":"029","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"217,36","ÁreaDependência":null,"TipoPadrão":"RH-3.0","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"358,10","ÁreaExcedente":"0","Observações":"AGUARDA DEMOLIÇÃO PARA ESTACIONAMENTO - DOUGLAS A 30/03/2009","FotoPrincipal":null}	-22.9284518999999989	-47.0445429999999973	R. Mirassol, 64, Campinas, SP - 13043-300	042.023.848
104	0500.00	45	2	0295	3251.54.60.0277.01001	2015-02-05 02:19:13.488343	2015-06-12 02:16:23.737845	t	t	\N	{"CódContábil":"0500.00","Bairro":"Jd. Santa Mônica","Distrito":null,"CódBrás":"22-02-95","CódIPTU":"047.547.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000819602","CódGrupo":"2","CódContador":"0295","CódCartograf":"3251.54.60.0277.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\JARDIM_SANTA_MONICA.JPG","CódBrás_correto":"BR-22-0295"}	220295.00	Igreja	Em Funcionamento	PROPRIO	R. Dário Freire Meirelles, 522	13082-045	\N	2	05975	18	007-UNI	720.00	24.00	435.00	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	2003 - excluida 145m2 area dependencia	{"CódContábil":"0500.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Dário Freire Meirelles, 522","CepImóvel":"13082-045","Zoneamento":null,"Receita":"2","Quarteirão":"05975","Quadra":"18","Lote":"007-UNI","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"24,00","ÁreaPrincipal":"435,00","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"720,00","ÁreaExcedente":"0","Observações":"2003 - excluida 145m2 area dependencia","FotoPrincipal":null}	-22.8546703999999998	-47.1059656999999987	R. Dário Freire Meirelles, 522, Campinas, SP - 13082-045	047.547.000
232	1080.00	99	5	4348	0000	2015-02-05 02:19:35.382796	2015-06-12 02:19:08.15234	t	t	\N	{"CódContábil":"1080.00","Bairro":"Jd. das Andorinhas","Distrito":null,"CódBrás":"224348","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000001","CódGrupo":"5","CódContador":"4348","CódCartograf":"0000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1080.00_JD_ANDORINHAS\\\\panoramica2.jpg","CódBrás_correto":"BR-22-4348"}	224348.00	Igreja	Em Funcionamento	CEDIDO	R. IGAPÓS, 1162	13101-461	\N	\N	.	.	.	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	FEITO O CONTRATO DE CESSAO EM 11/01/2011______DOUGLAS A. 11/03/11\r\nOBRA OFICIALIZADA EM JANEIRO DE 2011, CULTOS EM UMA SALA CEDIDA.____DOUGLAS A. 17/01/11	{"CódContábil":"1080.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. IGAPÓS, 1162","CepImóvel":"13101-461","Zoneamento":null,"Receita":null,"Quarteirão":".","Quadra":".","Lote":".","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":".","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"FEITO O CONTRATO DE CESSAO EM 11/01/2011______DOUGLAS A. 11/03/11\\r\\nOBRA OFICIALIZADA EM JANEIRO DE 2011, CULTOS EM UMA SALA CEDIDA.____DOUGLAS A. 17/01/11","FotoPrincipal":null}	-22.9160678000000004	-47.0128529999999998	R. IGAPÓS, 1162, Campinas, SP - 13101-461	000.000.000
44	0260.01	5	2	0289	3413.34.43.0321.00000	2015-02-05 02:19:03.063631	2015-06-12 02:11:22.083186	t	f	\N	{"CódContábil":"0260.01","Bairro":"Jd. Aurélia","Distrito":null,"CódBrás":"220289","CódIPTU":"031.545.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"2","CódContador":"0289","CódCartograf":"3413.34.43.0321.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Jd Aurelia\\\\Jd Aurelia - Estacionamento_mini.JPG","CódBrás_correto":"BR-22-0289"}	220289.01	Estacionamento	Em Funcionamento	ALUGADO	Rua Pompilio Morandi, Nº.0	\N	03	\N	2320	27	01	312.25	13.50	\N	\N	\N	\N	IGREJA	\N	\N	\N	{"CódContábil":"0260.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"Rua Pompilio Morandi, Nº.0","CepImóvel":null,"Zoneamento":"03","Receita":null,"Quarteirão":"2320","Quadra":"27","Lote":"01","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"13,50","ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"312,25","ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	\N	\N	\N	031.545.000
106	0520.00	47	3	0288	3261.63.42.0236.01001	2015-02-05 02:19:13.814192	2015-06-12 02:16:26.285668	t	t	\N	{"CódContábil":"0520.00","Bairro":"Jd. Santana","Distrito":null,"CódBrás":"22-02-88","CódIPTU":"042.026.593","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000728961","CódGrupo":"3","CódContador":"0288","CódCartograf":"3261.63.42.0236.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\JARDIM_SANTANA.jpg","CódBrás_correto":"BR-22-0288"}	220288.00	Igreja	Em Funcionamento	PROPRIO	R. Lupércio Bueno Camargo, 278	13088-671	03	2	02698	26	001-UNI	892.77	24.00	284.05	301.00	\N	\N	NRH-4.0	PREDIAL	0.01	2003 - excluida 17,80m2 area dependencia	{"CódContábil":"0520.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Lupércio Bueno Camargo, 278","CepImóvel":"13088-671","Zoneamento":"03","Receita":"2","Quarteirão":"02698","Quadra":"26","Lote":"001-UNI","CódLogradouro":"5404","ÁreaGeoFreqLixo":"301","TestadaTerreno":"24,00","ÁreaPrincipal":"284,05","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"892,77","ÁreaExcedente":"0","Observações":"2003 - excluida 17,80m2 area dependencia","FotoPrincipal":null}	-22.8586312000000014	-47.0416558000000009	R. Lupércio Bueno Camargo, 278, Campinas, SP - 13088-671	042.026.593
109	0540.00	48	5	0304	3423.64.73.0296.01001	2015-02-05 02:19:14.358919	2015-06-12 02:16:30.120633	t	t	\N	{"CódContábil":"0540.00","Bairro":"Jd. São Fernando","Distrito":null,"CódBrás":"22-03-04","CódIPTU":"042.034.086","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000728211","CódGrupo":"5","CódContador":"0304","CódCartograf":"3423.64.73.0296.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_SAO_FERNADO.jpg","CódBrás_correto":"BR-22-0304"}	220304.00	Igreja	Em Funcionamento	PROPRIO	R. Serra das Betânias, 34	13100-263	03	2	01915	FF	005-UNI	600.00	20.00	315.00	301.00	\N	\N	NRH-7.0	PREDIAL	0.01	\N	{"CódContábil":"0540.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Serra das Betânias, 34","CepImóvel":"13100-263","Zoneamento":"03","Receita":"2","Quarteirão":"01915","Quadra":"FF","Lote":"005-UNI","CódLogradouro":"8303","ÁreaGeoFreqLixo":"301","TestadaTerreno":"20,00","ÁreaPrincipal":"315,00","ÁreaDependência":"0","TipoPadrão":"NRH-7.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"600,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9155444999999993	-47.0328214000000031	R. Serra das Betânias, 34, Campinas, SP - 13100-263	042.034.086
112	0550.01	49	4	0303	3451.32.76.0030.00000	2015-02-05 02:19:14.867429	2015-06-12 02:16:33.916541	t	f	\N	{"CódContábil":"0550.01","Bairro":"Jd. São José","Distrito":null,"CódBrás":"22-03-03","CódIPTU":"047.692.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000713413","CódGrupo":"4","CódContador":"0303","CódCartograf":"3451.32.76.0030.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0550.01_JARDIM_SAO_JOSE\\\\pat_0550.00_0303_foto frente_ qdA_lt013.jpg","CódBrás_correto":"BR-22-0303"}	220303.01	Estacionamento	Em Funcionamento	PROPRIO	R. Guilhermino F. Santos Filho, 86	13051-161	14	3	04001	A	13	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0550.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Guilhermino F. Santos Filho, 86","CepImóvel":"13051-161","Zoneamento":"14","Receita":"3","Quarteirão":"04001","Quadra":"A","Lote":"13","CódLogradouro":"3863","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"300","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.960461200000001	-47.0951436000000001	R. Guilhermino F. Santos Filho, 86, Campinas, SP - 13051-161	047.692.900
253	0490.05	73	1	3346	0000.00.00.0000.000	2015-02-05 02:19:38.903546	2015-06-12 02:19:32.564311	f	f	\N	{"CódContábil":"0490.05","Bairro":"Jd. Santa Lúcia","Distrito":null,"CódBrás":"223346","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000178483","CódGrupo":"1","CódContador":"3346","CódCartograf":"0000.00.00.0000.000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3346"}	223346.05	Estacionamento	Desativado	PROPRIO	R. Cabo Verde, 302	\N	\N	\N	\N	45	7 unif c/ 8	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Terreno anexado ao Lote do Templo. 490.01, portanto este ficou extinto chamando-se Lt 08 UNIF (DOUGLAS A. 15/04/08)	{"CódContábil":"0490.05","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Cabo Verde, 302","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"45","Lote":"7 unif c/ 8","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Terreno anexado ao Lote do Templo. 490.01, portanto este ficou extinto chamando-se Lt 08 UNIF (DOUGLAS A. 15/04/08)","FotoPrincipal":null}	\N	\N	\N	000.000.000
60	0330.03	19	1	0318	3343.31.80.0001.00000	2015-02-05 02:19:05.917626	2015-06-12 02:15:29.055643	t	f	\N	{"CódContábil":"0330.03","Bairro":"Jd. Florence","Distrito":null,"CódBrás":"220318","CódIPTU":"055.062.093","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"1","CódContador":"0318","CódCartograf":"3343.31.80.0001.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Jd Florence\\\\IMG_3548 Jd Florence - Cedido_mini.JPG","CódBrás_correto":"BR-22-0318"}	220318.03	Estacionamento	Em Funcionamento	CEDIDO	R. FREDERICO MILANESI	13059-024	\N	\N	08335	Y	05	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	7/7/11- TERRENO CEDIDO PARA ESTACIONAMENTO, CONTRATO DE COMODATO DE 30/03/2011, COM PRAZO INDETERMINADO___DOUGLAS A.	{"CódContábil":"0330.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. FREDERICO MILANESI","CepImóvel":"13059-024","Zoneamento":null,"Receita":null,"Quarteirão":"08335","Quadra":"Y","Lote":"05","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"7/7/11- TERRENO CEDIDO PARA ESTACIONAMENTO, CONTRATO DE COMODATO DE 30/03/2011, COM PRAZO INDETERMINADO___DOUGLAS A.","FotoPrincipal":null}	-22.9423913000000006	-47.1641040000000018	R. FREDERICO MILANESI, Campinas, SP - 13059-024	055.062.093
118	0580.00	10	3	0297	3422.11.40.0156.01001	2015-02-05 02:19:15.902497	2015-06-12 02:16:41.731942	t	t	\N	{"CódContábil":"0580.00","Bairro":"Pq. Brasília","Distrito":null,"CódBrás":"22-02-97","CódIPTU":"042.008.459","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000264061","CódGrupo":"3","CódContador":"0297","CódCartograf":"3422.11.40.0156.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\PARQUE_BRASILIA.jpg","CódBrás_correto":"BR-22-0297"}	220297.00	Igreja	Em Funcionamento	PROPRIO	R. Benedito José dos Santos, 90	13091-430	03	2	03061	G	20 unif	614.62	24.00	309.69	301.00	\N	\N	NRH 7.0	PREDIAL	0.01	\N	{"CódContábil":"0580.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Benedito José dos Santos, 90","CepImóvel":"13091-430","Zoneamento":"03","Receita":"2","Quarteirão":"03061","Quadra":"G","Lote":"20 unif","CódLogradouro":"1292","ÁreaGeoFreqLixo":"301","TestadaTerreno":"24,00","ÁreaPrincipal":"309,69","ÁreaDependência":"0","TipoPadrão":"NRH 7.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"614,62","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8803203999999987	-47.0295405999999971	R. Benedito José dos Santos, 90, Campinas, SP - 13091-430	042.008.459
121	0590.01	60	4	3112	3454.11.24.0132.00000	2015-02-05 02:19:16.390584	2015-06-12 02:16:47.601123	t	f	\N	{"CódContábil":"0590.01","Bairro":"Pq. Das Camélias","Distrito":null,"CódBrás":"22-31-12","CódIPTU":"055.074.790","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001044973","CódGrupo":"4","CódContador":"3112","CódCartograf":"3454.11.24.0132.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3112"}	223112.01	Estacionamento	Em Funcionamento	PROPRIO	Rua David Augusto Ferreira	13052-530	\N	3	09258	B	14	251.68	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0590.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Rua David Augusto Ferreira","CepImóvel":"13052-530","Zoneamento":null,"Receita":"3","Quarteirão":"09258","Quadra":"B","Lote":"14","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"251,68","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	\N	\N	Rua David Augusto Ferreira, Campinas, SP - 13052-530	055.074.790
122	0600.00	74	4	3352	3454.32.10.0072.01001	2015-02-05 02:19:16.55642	2015-06-12 02:16:48.914112	t	t	\N	{"CódContábil":"0600.00","Bairro":"Pq. Centenário (Saltinho)","Distrito":null,"CódBrás":"223352","CódIPTU":"042.192.400","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000136463","CódGrupo":"4","CódContador":"3352","CódCartograf":"3454.32.10.0072.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_CENTENARIO.JPG","CódBrás_correto":"BR-22-3352"}	223352.00	Igreja	Em Funcionamento	PROPRIO	Av. Cléber Saturnino Ferreira, 1828	13051-478	00	2	06019	C	03	250.00	10.00	117.75	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	\N	{"CódContábil":"0600.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Cléber Saturnino Ferreira, 1828","CepImóvel":"13051-478","Zoneamento":"00","Receita":"2","Quarteirão":"06019","Quadra":"C","Lote":"03","CódLogradouro":"0.051.359","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"117,75","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"250","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	\N	\N	Av. Cléber Saturnino Ferreira, 1828, Campinas, SP - 13051-478	042.192.400
63	0350.00	25	4	2967	0	2015-02-05 02:19:06.403505	2015-06-12 02:15:33.013785	f	f	\N	{"CódContábil":"0350.00","Bairro":"Jd. do Lago II","Distrito":null,"CódBrás":"22-29-67","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"2967","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_DO_LAGO_II.JPG","CódBrás_correto":"BR-22-2967"}	222967.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	R. Marcelina Rodrigues Pascoal, 332	13051-080	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	EM 11/12/2011 FOI DESATIVADO A SALINHA, POIS HOUVE A ABERTURA DO TEMPLO.___DOUGLAS A.\r\nEM 23/03/11 RECEBEMOS UMA INTIMAÇAO (20195 PROT. 2010/11/9301 ou 8301) PARA APRESENTAR DOCUMENTAÇOES___IR. ALLEX ESTA CIENTE____DOUGLAS A 28/03/11\r\nProprietário paga IPTU	{"CódContábil":"0350.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Marcelina Rodrigues Pascoal, 332","CepImóvel":"13051-080","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"EM 11/12/2011 FOI DESATIVADO A SALINHA, POIS HOUVE A ABERTURA DO TEMPLO.___DOUGLAS A.\\r\\nEM 23/03/11 RECEBEMOS UMA INTIMAÇAO (20195 PROT. 2010/11/9301 ou 8301) PARA APRESENTAR DOCUMENTAÇOES___IR. ALLEX ESTA CIENTE____DOUGLAS A 28/03/11\\r\\nProprietário paga IPTU","FotoPrincipal":null}	-22.9465295000000005	-47.0858951000000019	R. Marcelina Rodrigues Pascoal, 332, Campinas, SP - 13051-080	000.000.000
151	0720.03	77	4	3641	0000.00.00.0000.00000	2015-02-05 02:19:21.414385	2015-06-12 02:17:24.840618	f	f	\N	{"CódContábil":"0720.03","Bairro":"Pq. Universitário de Viracopos","Distrito":null,"CódBrás":"223641","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3641","CódCartograf":"0000.00.00.0000.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3641"}	223641.03	Estacionamento	Desativado	PROPRIO	--------	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	\N	{"CódContábil":"0720.03","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"--------","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	\N	\N	\N	000.000.000
125	0610.02	15	4	0292	3362.51.01.0187.01001	2015-02-05 02:19:17.059557	2015-06-12 02:16:52.665556	t	f	\N	{"CódContábil":"0610.02","Bairro":"Pq. Dom Pedro II","Distrito":null,"CódBrás":"220292","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001782883","CódGrupo":"4","CódContador":"0292","CódCartograf":"3362.51.01.0187.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Pq D. PEDRO II_ ESTACIONAMENTO.jpg","CódBrás_correto":"BR-22-0292"}	220292.02	Estacionamento	Em Funcionamento	PROPRIO	R. ANAJÉ, 317	13056-410	\N	0	04393	29	020-SUB	607.00	10.00	237.65	156.00	\N	\N	RH- 3.0	PREDIAL	\N	2015- ÁREA CORRETA É 62,05m2 - SE VIER MAIOR IMPUGNAR - DOM 28.08.2013\r\nIPTU 2012 VEIO COM 907,00M2 - DEFERIDO O PROTOC DESMEMBRAMENTO (AREA VIRA COMO 607,00M2)	{"CódContábil":"0610.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. ANAJÉ, 317","CepImóvel":"13056-410","Zoneamento":null,"Receita":"0","Quarteirão":"04393","Quadra":"29","Lote":"020-SUB","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"237,65","ÁreaDependência":"0,00","TipoPadrão":"RH- 3.0","CategoriaImóvel":"PREDIAL","Alícota":null,"ÁreaTerreno":"607,00","ÁreaExcedente":"0,00","Observações":"2015- ÁREA CORRETA É 62,05m2 - SE VIER MAIOR IMPUGNAR - DOM 28.08.2013\\r\\nIPTU 2012 VEIO COM 907,00M2 - DEFERIDO O PROTOC DESMEMBRAMENTO (AREA VIRA COMO 607,00M2)","FotoPrincipal":null}	-22.9725667000000016	-47.1462111000000021	R. ANAJÉ, 317, Campinas, SP - 13056-410	000.000.000
126	0620.00	17	2	0314	3322.43.62.0321.01001	2015-02-05 02:19:17.222534	2015-06-12 02:16:53.922149	t	t	\N	{"CódContábil":"0620.00","Bairro":"Pq. Fazendinha","Distrito":null,"CódBrás":"22-03-14","CódIPTU":"055.046.052","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001206233","CódGrupo":"2","CódContador":"0314","CódCartograf":"3322.43.62.0321.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\PARQUE_FAZENDINHA.JPG","CódBrás_correto":"BR-22-0314"}	220314.00	Igreja	Em Funcionamento	PROPRIO	R. Paulo Angi, 120	13064-712	03	2	07888	C	28 unif	500.00	20.00	349.30	156.00	\N	\N	NRH 5.0	PREDIAL	0.01	\N	{"CódContábil":"0620.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Paulo Angi, 120","CepImóvel":"13064-712","Zoneamento":"03","Receita":"2","Quarteirão":"07888","Quadra":"C","Lote":"28 unif","CódLogradouro":"6846","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"349,3","ÁreaDependência":"0","TipoPadrão":"NRH 5.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"500,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8944894999999988	-47.1527244999999979	R. Paulo Angi, 120, Campinas, SP - 13064-712	055.046.052
128	0630.00	75	3	3637	4114.22.76.0248.00000	2015-02-05 02:19:17.58848	2015-06-12 02:16:56.469162	t	t	\N	{"CódContábil":"0630.00","Bairro":"Ch. Gargantilha","Distrito":null,"CódBrás":"22-36-37","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"3","CódContador":"3637","CódCartograf":"4114.22.76.0248.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\3- Ch. Gargantilhas_mini.JPG","CódBrás_correto":"BR-22-3637"}	223637.00	Igreja	Em Funcionamento	CEDIDO	R. NICOLINO PESCUME, S/N	13098-811	\N	0	10334	AA	001	981.67	18.89	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Nº 175) CONTRATO DE COMODATO TERMINA EM 2021.	{"CódContábil":"0630.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. NICOLINO PESCUME, S/N","CepImóvel":"13098-811","Zoneamento":null,"Receita":"0","Quarteirão":"10334","Quadra":"AA","Lote":"001","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"18,89","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3","ÁreaTerreno":"981,67","ÁreaExcedente":"0,00","Observações":"(Nº 175) CONTRATO DE COMODATO TERMINA EM 2021.","FotoPrincipal":null}	\N	\N	R. NICOLINO PESCUME, S/N, Campinas, SP - 13098-811	000.000.000
180	0860.00	81	4	3340	0	2015-02-05 02:19:26.326868	2015-06-12 02:18:00.258734	t	t	\N	{"CódContábil":"0860.00","Bairro":"Campituba","Distrito":null,"CódBrás":"22-33-40","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3340","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\CAMPITUBA.jpg","CódBrás_correto":"BR-22-3340"}	223340.00	Igreja	Em Funcionamento	PROPRIO	(Av. Principal s/n)	13053-000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	LOTEAMENTO CLANDESTINO, E EXISTE SOMENTE\r\nUM TERMO INFORMAL DE CESSÃO DE DIREITOS E UMA PLANTA DE BOMBEIROS APROVADA	{"CódContábil":"0860.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"(Av. Principal s/n)","CepImóvel":"13053-000","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"LOTEAMENTO CLANDESTINO, E EXISTE SOMENTE\\r\\nUM TERMO INFORMAL DE CESSÃO DE DIREITOS E UMA PLANTA DE BOMBEIROS APROVADA","FotoPrincipal":null}	-22.9121032999999983	-47.0310619999999986	(Av. Principal s/n), Campinas, SP - 13053-000	000.000.000
186	0890.00	84	4	3639	0	2015-02-05 02:19:27.308165	2015-06-12 02:18:07.884539	t	t	\N	{"CódContábil":"0890.00","Bairro":"Jd. Uruguai","Distrito":null,"CódBrás":"223639","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3639","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_URUGUAI.JPG","CódBrás_correto":"BR-22-3639"}	223639.00	Igreja	Em Funcionamento	CEDIDO	R. Écio Poggette,33 antiga rua 19	13059-859	\N	\N	\N	N	19	\N	6.00	\N	\N	\N	\N	IGREJA	\N	\N	1- 26/08/09 DOUGLAS A.- Trata- se de uma Sala de oração, com fachada padrão, grade\r\nNão tem numeração, não tem estacionamento, não tem asfalto.\r\n2- Proprietário Paga IPTU	{"CódContábil":"0890.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Écio Poggette,33 antiga rua 19","CepImóvel":"13059-859","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"N","Lote":"19","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"6,00","ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"+/- 90,00","ÁreaExcedente":null,"Observações":"1- 26/08/09 DOUGLAS A.- Trata- se de uma Sala de oração, com fachada padrão, grade\\r\\nNão tem numeração, não tem estacionamento, não tem asfalto.\\r\\n2- Proprietário Paga IPTU","FotoPrincipal":null}	\N	\N	R. Écio Poggette,33 antiga rua 19, Campinas, SP - 13059-859	000.000.000
130	0640.00	20	1	0283	3432.14.85.0213.01001	2015-02-05 02:19:17.914465	2015-06-12 02:16:59.06433	t	t	\N	{"CódContábil":"0640.00","Bairro":"Pq. Industrial","Distrito":null,"CódBrás":"22-02-83","CódIPTU":"029.480.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001332973","CódGrupo":"1","CódContador":"0283","CódCartograf":"3432.14.85.0213.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\PARQUE_INDUSTRIAL.jpg","CódBrás_correto":"BR-22-0283"}	220283.00	Igreja	Em Funcionamento	PROPRIO	R. Jacinta Rosa de São José, 212	13031-670	11	2	01445	29	19 unif	733.10	22.00	600.35	301.00	\N	\N	NRH 6.0	PREDIAL	0.01	  Imunidade concedida Douglas A. 27/08/07	{"CódContábil":"0640.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Jacinta Rosa de São José, 212","CepImóvel":"13031-670","Zoneamento":"11","Receita":"2","Quarteirão":"01445","Quadra":"29","Lote":"19 unif","CódLogradouro":"0.023.556","ÁreaGeoFreqLixo":"301","TestadaTerreno":"22,00","ÁreaPrincipal":"600,35","ÁreaDependência":"0","TipoPadrão":"NRH 6.0","CategoriaImóvel":"PREDIAL","Alícota":"1,50%","ÁreaTerreno":"733,10","ÁreaExcedente":"0","Observações":"  Imunidade concedida Douglas A. 27/08/07","FotoPrincipal":null}	-22.9246340999999987	-47.0836966000000032	R. Jacinta Rosa de São José, 212, Campinas, SP - 13031-670	029.480.000
133	0640.03	20	1	0283	3432.23.17.0020.00000	2015-02-05 02:19:18.43879	2015-06-12 02:17:02.398177	t	f	\N	{"CódContábil":"0640.03","Bairro":"Pq. Industrial","Distrito":null,"CódBrás":"22-02-83","CódIPTU":"013.708.470","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"0283","CódCartograf":"3432.23.17.0020.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Parque Industrial\\\\PANORAMA MINI.JPG","CódBrás_correto":"BR-22-0283"}	220283.03	Estacionamento	Em Funcionamento	ALUGADO	R. João Batista Pupo de Morais	13031-690	\N	3	01505	27	28	347.00	10.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0640.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. João Batista Pupo de Morais","CepImóvel":"13031-690","Zoneamento":null,"Receita":"3","Quarteirão":"01505","Quadra":"27","Lote":"28","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"347,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9227741999999992	-47.085557399999999	R. João Batista Pupo de Morais, Campinas, SP - 13031-690	013.708.470
143	0690.02	41	1	2135	3334.43.53.0246.00000	2015-02-05 02:19:20.113732	2015-06-12 02:17:15.091191	f	f	\N	{"CódContábil":"0690.02","Bairro":"Pq. Res. Campina Grande","Distrito":null,"CódBrás":"22-21-35","CódIPTU":"055.052.855","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000990063","CódGrupo":"1","CódContador":"2135","CódCartograf":"3334.43.53.0246.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-2135"}	222135.02	Estacionamento	Desativado	PROPRIO	R. TREZE, S/N	13058-193	\N	3	10101	B	002	312.20	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R. Dezesseis, nº14)	{"CódContábil":"0690.02","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. TREZE, S/N","CepImóvel":"13058-193","Zoneamento":null,"Receita":"3","Quarteirão":"10101","Quadra":"B","Lote":"002","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"312,20","ÁreaExcedente":"0","Observações":"(R. Dezesseis, nº14)","FotoPrincipal":null}	-22.9490000999999992	-47.1878394000000014	R. TREZE, S/N, Campinas, SP - 13058-193	055.052.855
145	0690.04	41	1	2135	0000.00.00.0000.000	2015-02-05 02:19:20.435859	2015-06-12 02:17:17.508803	f	f	\N	{"CódContábil":"0690.04","Bairro":"Pq. Res. Campina Grande","Distrito":null,"CódBrás":"222135","CódIPTU":"055.052.857","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000990073","CódGrupo":"1","CódContador":"2135","CódCartograf":"0000.00.00.0000.000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-2135"}	222135.04	Terreno	Desativado	PROPRIO	R. Dezesseis, nº14 - Esquina c/ R. 13 nº 70	13058-193	\N	\N	10101	B	04	318.70	16.03	\N	\N	\N	\N	IGREJA	\N	\N	UNIFICADO AO 0690.01	{"CódContábil":"0690.04","Tipo":"Terreno","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Dezesseis, nº14 - Esquina c/ R. 13 nº 70","CepImóvel":"13058-193","Zoneamento":null,"Receita":null,"Quarteirão":"10101","Quadra":"B","Lote":"04","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"16,03","ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"318,70","ÁreaExcedente":null,"Observações":"UNIFICADO AO 0690.01","FotoPrincipal":null}	\N	\N	R. Dezesseis, nº14 - Esquina c/ R. 13 nº 70, Campinas, SP - 13058-193	055.052.857
146	0700.00	44	3	0311	0	2015-02-05 02:19:20.599057	2015-06-12 02:17:18.8211	t	t	\N	{"CódContábil":"0700.00","Bairro":"Pq. Santa Cândida","Distrito":null,"CódBrás":"22-03-11","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"3","CódContador":"0311","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\PARQUE_SANTA_CANDIDA.jpg","CódBrás_correto":"BR-22-0311"}	220311.00	Igreja	Em Funcionamento	CEDIDO	R. Anthero Chrystino, 315	13087-556	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	ESTE LOCAL É CEDIDO, E POSSUIMOS APENAS UM TERMO DE CESSÃO ASSINADO \r\nProprietário Paga IPTU.___DOUGLAS A 15/02/10	{"CódContábil":"0700.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Anthero Chrystino, 315","CepImóvel":"13087-556","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"ESTE LOCAL É CEDIDO, E POSSUIMOS APENAS UM TERMO DE CESSÃO ASSINADO \\r\\nProprietário Paga IPTU.___DOUGLAS A 15/02/10","FotoPrincipal":null}	-22.8382378000000017	-47.0392454999999998	R. Anthero Chrystino, 315, Campinas, SP - 13087-556	000.000.000
148	0710.01	54	3	0298	3254.62.60.0311.00000	2015-02-05 02:19:20.923851	2015-06-12 02:17:21.426472	f	f	\N	{"CódContábil":"0710.01","Bairro":"Pq. Taquaral","Distrito":null,"CódBrás":"22-02-98","CódIPTU":"010.364.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000797392","CódGrupo":"3","CódContador":"0298","CódCartograf":"3254.62.60.0311.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-0298"}	220298.01	Estacionamento	Desativado	PROPRIO	R. Doutor Quintino de Paula Maudonnet, S/N	13087-610	\N	3	00975	11-A	025	359.00	10.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Nº 98) ORIUNDO DA UNIFICAÇAO C/ LOTE 23 E 24 EM 22/07/10 Terreno anexado ao Lote do Templo. 710.00, portanto este ficou extinto chamando-se Lt 23 UNIF. (DOUGLAS A. 15/04/08)	{"CódContábil":"0710.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Doutor Quintino de Paula Maudonnet, S/N","CepImóvel":"13087-610","Zoneamento":null,"Receita":"3","Quarteirão":"00975","Quadra":"11-A","Lote":"025","CódLogradouro":"12.245","ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6","ÁreaTerreno":"359,00","ÁreaExcedente":"0","Observações":"(Nº 98) ORIUNDO DA UNIFICAÇAO C/ LOTE 23 E 24 EM 22/07/10 Terreno anexado ao Lote do Templo. 710.00, portanto este ficou extinto chamando-se Lt 23 UNIF. (DOUGLAS A. 15/04/08)","FotoPrincipal":null}	-22.8637072000000003	-47.0664477999999988	R. Doutor Quintino de Paula Maudonnet, S/N, Campinas, SP - 13087-610	010.364.000
244	0750.01	42	4	2136	3361.52.33.0335.00000	2015-02-05 02:19:37.436523	2015-06-12 02:19:22.101764	t	f	\N	{"CódContábil":"0750.01","Bairro":"Res. Mauro Marcondes","Distrito":null,"CódBrás":"22-21-36","CódIPTU":"055.047.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001030533","CódGrupo":"4","CódContador":"2136","CódCartograf":"3361.52.33.0335.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0750.01_RESIDENCIAL_MAURO_MARCONDES\\\\pat_0750.01_2136_foto.frente_qdB_lt11.jpg","CódBrás_correto":"BR-22-2136"}	222136.01	Estacionamento	Em Funcionamento	PROPRIO	R. Hilário Baldo, 00	13057-421	3	3	07926	B	11	398.40	10.20	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0750.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Hilário Baldo, 00","CepImóvel":"13057-421","Zoneamento":"3","Receita":"3","Quarteirão":"07926","Quadra":"B","Lote":"11","CódLogradouro":"3984","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,20","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3","ÁreaTerreno":"398,40","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9722952000000014	-47.170919099999999	R. Hilário Baldo, 00, Campinas, SP - 13057-421	055.047.000
156	0740.02	58	4	2940	0000.00.00.0000.000	2015-02-05 02:19:22.249325	2015-06-12 02:17:30.772032	f	f	\N	{"CódContábil":"0740.02","Bairro":"Pq. Vista Alegre","Distrito":null,"CódBrás":"222940","CódIPTU":"0..","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000138273","CódGrupo":"4","CódContador":"2940","CódCartograf":"0000.00.00.0000.000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_VISTA_ALEGRE.JPG","CódBrás_correto":"BR-22-2940"}	222940.02	Estacionamento	Desativado	PROPRIO	R. Anita Malfati, 338	\N	03	\N	\N	H	12	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	MATRICULA ENCERRADA - UNIFICADO AO LOTE 11	{"CódContábil":"0740.02","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Anita Malfati, 338","CepImóvel":null,"Zoneamento":"03","Receita":null,"Quarteirão":null,"Quadra":"H","Lote":"12","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"MATRICULA ENCERRADA - UNIFICADO AO LOTE 11","FotoPrincipal":null}	\N	\N	\N	0..
160	0760.00	61	5	3356	4311.24.14.0401.01001	2015-02-05 02:19:22.902879	2015-06-12 02:17:35.964775	t	t	\N	{"CódContábil":"0760.00","Bairro":"Jd. Conceição (Sousas)","Distrito":"Sousas","CódBrás":"223356","CódIPTU":"091.674.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000044852","CódGrupo":"5","CódContador":"3356","CódCartograf":"4311.24.14.0401.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_CONCEICAO_SOUSAS.JPG","CódBrás_correto":"BR-22-3356"}	223356.00	Igreja	Em Funcionamento	PROPRIO	R. Jorge Miguel Keiralla, 127 esq. 507	13105-096	03	3	00063	1	03	1188.00	22.00	133.39	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	 Imunidade ok Douglas A. 27/08/07	{"CódContábil":"0760.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Jorge Miguel Keiralla, 127 esq. 507","CepImóvel":"13105-096","Zoneamento":"03","Receita":"3","Quarteirão":"00063","Quadra":"1","Lote":"03","CódLogradouro":"0.036.103","ÁreaGeoFreqLixo":"156","TestadaTerreno":"22,00","ÁreaPrincipal":"133,39","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"1.188,00","ÁreaExcedente":"0","Observações":" Imunidade ok Douglas A. 27/08/07","FotoPrincipal":null}	-22.8829908000000017	-46.9827628000000033	R. Jorge Miguel Keiralla, 127 esq. 507, Campinas, SP - 13105-096	091.674.000
256	0970.00	92	4	3849	0	2015-02-05 02:19:39.392705	2015-06-12 02:19:35.895237	t	t	\N	{"CódContábil":"0970.00","Bairro":"Jd. Santo Antonio","Distrito":null,"CódBrás":"223849","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3849","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0970.00_JARDIM_SANTO_ANTONIO\\\\JD SANTO ANTONIO (2) - Cópia.jpg","CódBrás_correto":"BR-22-3849"}	223849.00	Igreja	Em Funcionamento	ALUGADO	Rua 33, nº 19	\N	\N	\N	\N	X	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	ESTE LOCAL É ALUGADO, E POSSUIMOS APENAS UM TERMO DE CESSÃO ASSINADO,\r\n1- VERIFICAR SE É O PRORIETARIO QUE PAGA OU SE AINDA NÃO HÁ LANÇAMENTO DE IPTU____DOUGLAS A. 15/02/10	{"CódContábil":"0970.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"Rua 33, nº 19","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"X","Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":".","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"ESTE LOCAL É ALUGADO, E POSSUIMOS APENAS UM TERMO DE CESSÃO ASSINADO,\\r\\n1- VERIFICAR SE É O PRORIETARIO QUE PAGA OU SE AINDA NÃO HÁ LANÇAMENTO DE IPTU____DOUGLAS A. 15/02/10","FotoPrincipal":null}	\N	\N	\N	000.000.000
163	0770.01	79	4	4074	3434.53.68.0238.00000	2015-02-05 02:19:23.389427	2015-06-12 02:17:39.811537	f	t	\N	{"CódContábil":"0770.01","Bairro":"Jd. Icarai ( Lago III)","Distrito":null,"CódBrás":"224074","CódIPTU":"055.002.829","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001012693","CódGrupo":"4","CódContador":"4074","CódCartograf":"3434.53.68.0238.00000","CasaOração":"1","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_ICARAI_2.jpg","CódBrás_correto":"BR-22-4074"}	224074.01	Igreja	Desativado	PROPRIO	Av. José Christóvão Gonçalves, S/N	13051-407	\N	3	06532	25	011	488.54	15.06	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	EMITIDO EM 05/14 O CARNE UNIFICADO____ SERA PAGO SOMENTE O LIXO.\r\nIgreja comprou 50% (era de divorciado da proprietaria do lote 12)	{"CódContábil":"0770.01","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"Av. José Christóvão Gonçalves, S/N","CepImóvel":"13051-407","Zoneamento":null,"Receita":"3","Quarteirão":"06532","Quadra":"25","Lote":"011","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"15,06","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3","ÁreaTerreno":"488,54","ÁreaExcedente":"0","Observações":"EMITIDO EM 05/14 O CARNE UNIFICADO____ SERA PAGO SOMENTE O LIXO.\\r\\nIgreja comprou 50% (era de divorciado da proprietaria do lote 12)","FotoPrincipal":null}	-22.9514573999999989	-47.0757461000000035	Av. José Christóvão Gonçalves, S/N, Campinas, SP - 13051-407	055.002.829
164	0770.02	79	4	4074	3434.53.68.0281.00000	2015-02-05 02:19:23.709222	2015-06-12 02:17:41.092532	f	f	\N	{"CódContábil":"0770.02","Bairro":"Jd. Icarai ( Lago III)","Distrito":null,"CódBrás":"224074","CódIPTU":"055.002.830","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001012063","CódGrupo":"4","CódContador":"4074","CódCartograf":"3434.53.68.0281.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_ICARAI_2.jpg","CódBrás_correto":"BR-22-4074"}	224074.02	Igreja	Desativado	PROPRIO	Av. José Christóvão Gonçalves,0	13051-407	\N	3	06532	25	012	457.50	16.50	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	EMITIDO EM 05/14 O CARNE UNIFICADO____ SERA PAGO SOMENTE O LIXO.\r\n1- IMOVEL ANEXADO AO 0770.01 EM 17/05/2010___DOUGLAS A. 08/09/10	{"CódContábil":"0770.02","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"Av. José Christóvão Gonçalves,0","CepImóvel":"13051-407","Zoneamento":null,"Receita":"3","Quarteirão":"06532","Quadra":"25","Lote":"012","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"16,50","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"457,50","ÁreaExcedente":"0,00","Observações":"EMITIDO EM 05/14 O CARNE UNIFICADO____ SERA PAGO SOMENTE O LIXO.\\r\\n1- IMOVEL ANEXADO AO 0770.01 EM 17/05/2010___DOUGLAS A. 08/09/10","FotoPrincipal":null}	-22.9494806000000011	-47.0731390999999988	Av. José Christóvão Gonçalves,0, Campinas, SP - 13051-407	055.002.830
166	0780.00	52	5	0285	4311.32.83.0291.01001	2015-02-05 02:19:24.039823	2015-06-12 02:17:43.768019	t	t	\N	{"CódContábil":"0780.00","Bairro":"Sousas (Vl. Iório)","Distrito":"Sousas","CódBrás":"220285","CódIPTU":"042.033.627","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000825272","CódGrupo":"5","CódContador":"0285","CódCartograf":"4311.32.83.0291.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\SOUSAS_VILA_IORIO.jpg","CódBrás_correto":"BR-22-0285"}	220285.00	Igreja	Em Funcionamento	PROPRIO	R. Antônio Iório, 145	13105-226	03	2	00020	A	27	737.00	10.00	188.45	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	2003 - excluida 16,70m2 area dependencia	{"CódContábil":"0780.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Antônio Iório, 145","CepImóvel":"13105-226","Zoneamento":"03","Receita":"2","Quarteirão":"00020","Quadra":"A","Lote":"27","CódLogradouro":"771","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"188,45","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"737,00","ÁreaExcedente":"0","Observações":"2003 - excluida 16,70m2 area dependencia","FotoPrincipal":null}	-22.8782223999999985	-46.9701692000000008	R. Antônio Iório, 145, Campinas, SP - 13105-226	042.033.627
167	0790.00	3	4	0308	3451.51.79.0714.01001	2015-02-05 02:19:24.20227	2015-06-12 02:17:45.069193	f	f	\N	{"CódContábil":"0790.00","Bairro":"Vl. Aeroporto (Maria Rosa)","Distrito":null,"CódBrás":"22-03-08","CódIPTU":"042.120.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000074213","CódGrupo":"4","CódContador":"0308","CódCartograf":"3451.51.79.0714.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-0308"}	220308.00	Igreja	Desativado	PROPRIO	AV. NOVE [VL AEROPORTO 2ª E 3ª GLEBAS] - SEM DENOMINAÇÃO	13054-107	01	2	04139	K	009	540.00	15.00	239.78	156.00	\N	\N	NRH-7.0	PREDIAL	0.01	A UNIFICAÇÃO DOS LOTES FOI EFETUADA ATRAVÉS DO PROTOCOLO 07/11/10208. - SE NÃO VIER UNIFICADO, IMPUGNAR.	{"CódContábil":"0790.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"AV. NOVE [VL AEROPORTO 2ª E 3ª GLEBAS] - SEM DENOMINAÇÃO","CepImóvel":"13054-107","Zoneamento":"01","Receita":"2","Quarteirão":"04139","Quadra":"K","Lote":"009","CódLogradouro":"6275","ÁreaGeoFreqLixo":"156","TestadaTerreno":"15,00","ÁreaPrincipal":"239,78","ÁreaDependência":"0","TipoPadrão":"NRH-7.0","CategoriaImóvel":"PREDIAL","Alícota":"1,73%","ÁreaTerreno":"540,00","ÁreaExcedente":"0","Observações":"A UNIFICAÇÃO DOS LOTES FOI EFETUADA ATRAVÉS DO PROTOCOLO 07/11/10208. - SE NÃO VIER UNIFICADO, IMPUGNAR.","FotoPrincipal":null}	-22.9711548000000008	-47.1248894000000007	AV. NOVE [VL AEROPORTO 2ª E 3ª GLEBAS] - SEM DENOMINAÇÃO, Campinas, SP - 13054-107	042.120.200
2	0100.01	67	2	2377	3322.23.02.0153.01001	2015-02-05 02:18:55.066067	2015-06-12 02:10:28.196913	t	t	\N	{"CódContábil":"0100.01","Bairro":"Vl. Lunardi","Distrito":null,"CódBrás":"22-23-77","CódIPTU":"047.616.663","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001119802","CódGrupo":"2","CódContador":"2377","CódCartograf":"3322.23.02.0153.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\VILA_LUNARDI.JPG","CódBrás_correto":"BR-22-2377"}	222377.01	Igreja	Em Funcionamento	PROPRIO	R. João Cirino, 55	13067-180	15	0	15234	C	045 UNIF	900.00	30.00	395.32	156.00	\N	\N	NRH-6.0 N. RESID.HORIZ	PREDIAL	0.01	\N	{"CódContábil":"0100.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. João Cirino, 55","CepImóvel":"13067-180","Zoneamento":"15","Receita":"0","Quarteirão":"15234","Quadra":"C","Lote":"045 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"30","ÁreaPrincipal":"395,32","ÁreaDependência":"0","TipoPadrão":"NRH-6.0 N. RESID.HORIZ","CategoriaImóvel":"PREDIAL","Alícota":"1,3","ÁreaTerreno":"900,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8842816999999989	-47.1454724999999968	R. João Cirino, 55, Campinas, SP - 13067-180	047.616.663
3	0100.02	67	2	2377	3322.23.01.0001.00000	2015-02-05 02:18:55.408815	2015-06-12 02:10:29.461602	t	f	\N	{"CódContábil":"0100.02","Bairro":"Vl. Lunardi","Distrito":null,"CódBrás":"22-23-77","CódIPTU":"044.092.750","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"2","CódContador":"2377","CódCartograf":"3322.23.01.0001.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Vl Lunard - Estacionamento  mini.JPG","CódBrás_correto":"BR-22-2377"}	222377.02	Estacionamento	Em Funcionamento	CEDIDO	R. João Cirino	13067-180	\N	3	15234	A	21	530.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	C R. João Cirino, 21	{"CódContábil":"0100.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. João Cirino","CepImóvel":"13067-180","Zoneamento":null,"Receita":"3","Quarteirão":"15234","Quadra":"A","Lote":"21","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"530,00","ÁreaExcedente":"0","Observações":"C R. João Cirino, 21","FotoPrincipal":null}	-22.8838198999999989	-47.1448942999999971	R. João Cirino, Campinas, SP - 13067-180	044.092.750
5	0120.00	6	3	0294	3234.42.99.0329.01001	2015-02-05 02:18:55.91487	2015-06-12 02:10:31.92621	t	t	\N	{"CódContábil":"0120.00","Bairro":"Barão Geraldo","Distrito":"Barão Geraldo","CódBrás":"22-02-94","CódIPTU":"042.008.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000770982","CódGrupo":"3","CódContador":"0294","CódCartograf":"3234.42.99.0329.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\BARAO_GERALDO_CENTRAL.JPG","CódBrás_correto":"BR-22-0294"}	220294.00	Igreja	Em Funcionamento	PROPRIO	R. Jerônimo Pattaro, 469	13084-110	03 BG	2	00031	B	22	887.50	18.00	424.19	301.00	\N	\N	NRH-4.0 N. RESID. HORIZ.	PREDIAL	0.01	\N	{"CódContábil":"0120.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Jerônimo Pattaro, 469","CepImóvel":"13084-110","Zoneamento":"03 BG","Receita":"2","Quarteirão":"00031","Quadra":"B","Lote":"22","CódLogradouro":"0.023.515","ÁreaGeoFreqLixo":"301","TestadaTerreno":"18","ÁreaPrincipal":"424,19","ÁreaDependência":null,"TipoPadrão":"NRH-4.0 N. RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"887,50","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.822531399999999	-47.0840444000000033	R. Jerônimo Pattaro, 469, Campinas, SP - 13084-110	042.008.500
245	1070.03	98	5	4295	0000.00.00.0000.00000	2015-02-05 02:19:37.597677	2015-06-12 02:19:23.382508	f	f	\N	{"CódContábil":"1070.03","Bairro":"Pq. São Martinho","Distrito":null,"CódBrás":"224295","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"002052473","CódGrupo":"5","CódContador":"4295","CódCartograf":"0000.00.00.0000.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1070.03_PARQUE_SAO_MARTINHO\\\\Foto_frontal_1070.03. MINI.png","CódBrás_correto":"BR-22-4295"}	224295.03	Terreno	Desativado	PROPRIO	R. Tenente Antonio Silva Pires	13040-708	\N	\N	09387	Q	10UNIF	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	IMOVEL RESULTANTE DA ANEXAÇAO DO 1070.01 e 1070.02\r\nSE PEDIRÁ A UNIFICAÇÃO DO CARNE DE IPTU	{"CódContábil":"1070.03","Tipo":"Terreno","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Tenente Antonio Silva Pires","CepImóvel":"13040-708","Zoneamento":null,"Receita":null,"Quarteirão":"09387","Quadra":"Q","Lote":"10UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"?","TestadaTerreno":"?","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"?","ÁreaExcedente":"0","Observações":"IMOVEL RESULTANTE DA ANEXAÇAO DO 1070.01 e 1070.02\\r\\nSE PEDIRÁ A UNIFICAÇÃO DO CARNE DE IPTU","FotoPrincipal":null}	-22.9521730999999996	-47.0573583999999983	R. Tenente Antonio Silva Pires, Campinas, SP - 13040-708	000.000.000
7	0130.00	29	3	0309	3214.14.62.0206.01001	2015-02-05 02:18:56.391668	2015-06-12 02:10:34.429964	t	t	\N	{"CódContábil":"0130.00","Bairro":"Ch. Marujo - Barão Geraldo","Distrito":"Barão Geraldo","CódBrás":"22-03-09","CódIPTU":"055.044.558","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000387752","CódGrupo":"3","CódContador":"0309","CódCartograf":"3214.14.62.0206.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\CHACARA_MARUJO.JPG","CódBrás_correto":"BR-22-0309"}	220309.00	Igreja	Em Funcionamento	PROPRIO	R. Joviniano Barbosa,  164	13085-385	03	2	0613	B	06 B	314.40	12.00	111.38	301.00	\N	\N	NRH-3.0 Ñ RESID.	PREDIAL	0.01	\N	{"CódContábil":"0130.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Joviniano Barbosa,  164","CepImóvel":"13085-385","Zoneamento":"03","Receita":"2","Quarteirão":"0613","Quadra":"B","Lote":"06 B","CódLogradouro":"5015","ÁreaGeoFreqLixo":"301","TestadaTerreno":"12,00","ÁreaPrincipal":"111,38","ÁreaDependência":"0","TipoPadrão":"NRH-3.0 Ñ RESID.","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"314,40","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.7800572000000017	-47.0858082999999965	R. Joviniano Barbosa,  164, Campinas, SP - 13085-385	055.044.558
10	0140.00	39	3	1969	3233.62.10.0179.01001	2015-02-05 02:18:56.881167	2015-06-12 02:10:38.283723	t	t	\N	{"CódContábil":"0140.00","Bairro":"Real Parque","Distrito":"Barão Geraldo","CódBrás":"22-19-69","CódIPTU":"072.472.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000884952","CódGrupo":"3","CódContador":"1969","CódCartograf":"3233.62.10.0179.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\REAL_PARQUE.jpg","CódBrás_correto":"BR-22-1969"}	221969.00	Igreja	Em Funcionamento	PROPRIO	R. Aguinaldo dos Santos Filho, 21	13082-791	3	2	00088	D	18 / Unif	620.00	20.00	326.82	1.00	\N	\N	NRH-7.0 N RES. HORIZ	PREDIAL	0.01	\N	{"CódContábil":"0140.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Aguinaldo dos Santos Filho, 21","CepImóvel":"13082-791","Zoneamento":"3","Receita":"2","Quarteirão":"00088","Quadra":"D","Lote":"18 / Unif","CódLogradouro":"0.048.827","ÁreaGeoFreqLixo":"1=301 d/a","TestadaTerreno":"20","ÁreaPrincipal":"326,82","ÁreaDependência":"0","TipoPadrão":"NRH-7.0 N RES. HORIZ","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"620","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8273364000000001	-47.0983432000000022	R. Aguinaldo dos Santos Filho, 21, Campinas, SP - 13082-791	072.472.000
12	0150.00	\N	3	3972	3223.63.56.0413.01001	2015-02-05 02:18:57.206222	2015-06-12 02:10:40.806358	f	f	\N	{"CódContábil":"0150.00","Bairro":"Bosque Das Palmeiras","Distrito":"Barão Geraldo","CódBrás":"223972","CódIPTU":"055.069.794","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"3","CódContador":"3972","CódCartograf":"3223.63.56.0413.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\BOSQUE_DAS_PALMEIRAS.jpg","CódBrás_correto":"BR-22-3972"}	223972.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	Av. Maria Antonia Conceição Ribeiro Santos, 826	13086-746	\N	3	08490	Y	08	490.00	14.00	156.80	156.00	\N	\N	RH - 3.0	PREDIAL	0.00	DEVOLVIDO EM 28/01/2012-	{"CódContábil":"0150.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"Av. Maria Antonia Conceição Ribeiro Santos, 826","CepImóvel":"13086-746","Zoneamento":null,"Receita":"3","Quarteirão":"08490","Quadra":"Y","Lote":"08","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"156,80","ÁreaDependência":null,"TipoPadrão":"RH - 3.0","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"490,00","ÁreaExcedente":"0","Observações":"DEVOLVIDO EM 28/01/2012-","FotoPrincipal":null}	\N	\N	Av. Maria Antonia Conceição Ribeiro Santos, 826, Campinas, SP - 13086-746	055.069.794
13	0150.01	\N	3	3972	3223.64.05.0438.00000	2015-02-05 02:18:57.552094	2015-06-12 02:10:42.119073	t	t	\N	{"CódContábil":"0150.01","Bairro":"Bosque Das Palmeiras","Distrito":null,"CódBrás":"223972","CódIPTU":"055.069.852","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000544772","CódGrupo":"3","CódContador":"3972","CódCartograf":"3223.64.05.0438.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Bosque das Palmeiras_mini.JPG","CódBrás_correto":"BR-22-3972"}	223972.01	Igreja	Aguarda Constr	PROPRIO	Av. Maria A. da Conceição R. Santos (ant. R.Quatro)	13086-746	\N	3	8492	W	02	479.22	16.12	\N	156.00	\N	\N	IGREJA	Terreno	0.02	Será construido um Templo neste local._______DOUGLAS 23/02/11\r\nEste terreno é objeto de uma doação em 14/05/10 c/ registro da escritura em 17/06/10 e na Matricula em 17/06/10.	{"CódContábil":"0150.01","Tipo":"Igreja","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"Av. Maria A. da Conceição R. Santos (ant. R.Quatro)","CepImóvel":"13086-746","Zoneamento":null,"Receita":"3","Quarteirão":"8492","Quadra":"W","Lote":"02","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"16,12","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":"Terreno","Alícota":"2,6%","ÁreaTerreno":"479,22","ÁreaExcedente":null,"Observações":"Será construido um Templo neste local._______DOUGLAS 23/02/11\\r\\nEste terreno é objeto de uma doação em 14/05/10 c/ registro da escritura em 17/06/10 e na Matricula em 17/06/10.","FotoPrincipal":null}	\N	\N	Av. Maria A. da Conceição R. Santos (ant. R.Quatro), Campinas, SP - 13086-746	055.069.852
15	0160.01	57	3	2852	3221.12.30.0439.01001	2015-02-05 02:18:58.084183	2015-06-12 02:10:44.684516	t	t	\N	{"CódContábil":"0160.01","Bairro":"Village Campinas","Distrito":"Barão Geraldo","CódBrás":"22-28-52","CódIPTU":"055.022.870","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000405892","CódGrupo":"3","CódContador":"2852","CódCartograf":"3221.12.30.0439.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\3- VILLAGE CMAPINAS.OBRA_mini.JPG","CódBrás_correto":"BR-22-2852"}	222852.01	Igreja	Em Funcionamento	PROPRIO	Av. Francisco Candido Xavier, 444	13100-000	\N	3	15182	A	06 unif	1343.00	25.55	26558.00	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	REALIZADO A ABERTURA EM DEZ/2012	{"CódContábil":"0160.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Francisco Candido Xavier, 444","CepImóvel":"13100-000","Zoneamento":null,"Receita":"3","Quarteirão":"15182","Quadra":"A","Lote":"06 unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,55","ÁreaPrincipal":"265.58","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1","ÁreaTerreno":"1.343,00","ÁreaExcedente":"0","Observações":"REALIZADO A ABERTURA EM DEZ/2012","FotoPrincipal":null}	\N	\N	Av. Francisco Candido Xavier, 444, Campinas, SP - 13100-000	055.022.870
17	0174.01	9	2	0281	3412.54.35.0087.01011	2015-02-05 02:18:58.412813	2015-06-12 02:10:47.571738	f	f	\N	{"CódContábil":"0174.01","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"042.005.199","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000673002","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.35.0087.01011","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim Apartamento - Teodoro Langard 824_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.01	Apartamento	Desativado	DEVOLVIDO/VENDIDO	R. Dr. Theodoro Langard, 824	13070-060	9	2	299	10	40	41.17	1.00	87.15	301.00	\N	\N	RV-1.0 RES VERTICAL	PREDIAL Apto Residencial	0.00	18/6/11 -VENDIDO PELA CCB.\r\nFORAM ENTREGUE AS CHAVES DO APARTAMENTO (05/03/2010), APÓS O FALECIMENTO DA ANTIGA PROPRIETARIA QUE O DOOU A C.C.B ____DOUGLAS A 22/03/10	{"CódContábil":"0174.01","Tipo":"Apartamento","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Dr. Theodoro Langard, 824","CepImóvel":"13070-060","Zoneamento":"9","Receita":"2","Quarteirão":"299","Quadra":"10","Lote":"40","CódLogradouro":"8378","ÁreaGeoFreqLixo":"301","TestadaTerreno":"1","ÁreaPrincipal":"87,15","ÁreaDependência":"0","TipoPadrão":"RV-1.0 RES VERTICAL","CategoriaImóvel":"PREDIAL Apto Residencial","Alícota":"0,4%","ÁreaTerreno":"41,17","ÁreaExcedente":"0","Observações":"18/6/11 -VENDIDO PELA CCB.\\r\\nFORAM ENTREGUE AS CHAVES DO APARTAMENTO (05/03/2010), APÓS O FALECIMENTO DA ANTIGA PROPRIETARIA QUE O DOOU A C.C.B ____DOUGLAS A 22/03/10","FotoPrincipal":null}	-22.8934782000000006	-47.0772854000000009	R. Dr. Theodoro Langard, 824, Campinas, SP - 13070-060	042.005.199
23	0174.07	9	2	0281	3412.54.12.0429.00000	2015-02-05 02:18:59.408201	2015-06-12 02:10:55.174144	t	f	\N	{"CódContábil":"0174.07","Bairro":"Bonfim","Distrito":null,"CódBrás":"220281","CódIPTU":"003.851.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0429.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim, Germania 635 - 641  lateral_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.07	Estacionamento	Aguarda Constr	PROPRIO	Rua Germânia, 635	13070-770	\N	2	265	\N	024	487.00	11.20	156.00	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	antiga constr.foi demolida.- CENTRAL	{"CódContábil":"0174.07","Tipo":"Estacionamento","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"Rua Germânia, 635","CepImóvel":"13070-770","Zoneamento":null,"Receita":"2","Quarteirão":"265","Quadra":null,"Lote":"024","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"11,20","ÁreaPrincipal":"156,00","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,60","ÁreaTerreno":"487","ÁreaExcedente":"0","Observações":"antiga constr.foi demolida.- CENTRAL","FotoPrincipal":null}	-22.8979922000000009	-47.0785180999999966	Rua Germânia, 635, Campinas, SP - 13070-770	003.851.000
21	0174.05	9	2	0281	3412.54.12.0156.00000	2015-02-05 02:18:59.081794	2015-06-12 02:10:52.647933	t	f	\N	{"CódContábil":"0174.05","Bairro":"Bonfim","Distrito":null,"CódBrás":"22-02-81","CódIPTU":"003.964.300","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000573082","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0156.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim - Teodoro Langard 672 - 678 - 682_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.05	Estacionamento	Em Funcionamento	PROPRIO	R. Dr. Theodoro Langaard, 682	13070-760	9	3	00265	\N	03	160.00	8.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	ESTACIONAMENTO DOS FUNDOS - CENTRAL	{"CódContábil":"0174.05","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Dr. Theodoro Langaard, 682","CepImóvel":"13070-760","Zoneamento":"9","Receita":"3","Quarteirão":"00265","Quadra":null,"Lote":"03","CódLogradouro":"0.023.416","ÁreaGeoFreqLixo":"301","TestadaTerreno":"8","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno sem construção","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"160","ÁreaExcedente":"0","Observações":"ESTACIONAMENTO DOS FUNDOS - CENTRAL","FotoPrincipal":null}	-22.8946433999999996	-47.0778938999999994	R. Dr. Theodoro Langaard, 682, Campinas, SP - 13070-760	003.964.300
241	0430.01	36	5	0296	0000000000000000	2015-02-05 02:19:36.944729	2015-06-12 02:19:18.235497	t	f	\N	{"CódContábil":"0430.01","Bairro":"Jd. Nova Europa","Distrito":null,"CódBrás":"220296","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"5","CódContador":"0296","CódCartograf":"0000000000000000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":null}	220296.01	Estacionamento	Em Funcionamento	ALUGADO	Rua Dominicana, 630	13040-107	\N	\N	2088	88	13	\N	\N	390.00	\N	\N	\N	IGREJA	\N	\N	\N	{"CódContábil":"0430.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"Rua Dominicana, 630","CepImóvel":"13040-107","Zoneamento":null,"Receita":null,"Quarteirão":"2088","Quadra":"88","Lote":"13","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":"390","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	-22.9356738	-47.0633728000000033	Rua Dominicana, 630, Campinas, SP - 13040-107	000.000.000
230	1060.00	97	4	4349	00000000000	2015-02-05 02:19:35.060113	2015-06-12 02:19:05.574909	t	t	\N	{"CódContábil":"1060.00","Bairro":"Chacaras Nova Itaguaçu (Prox. Campituba)","Distrito":null,"CódBrás":"224349","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000123453","CódGrupo":"4","CódContador":"4349","CódCartograf":"00000000000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\4- Ch, Nova Itaguaçu_mini.JPG","CódBrás_correto":"BR-22-4349"}	224349.00	Igreja	Em Funcionamento	IRREGULAR	R. Dois nº 36/37?	13053-144	00	0	0	0	0	1125.00	\N	\N	\N	\N	\N	IGREJA	\N	\N	POR ESTAR EM LOTEAMENTO CLANDESTINO, NÃO É POSSIVEL REGULARIZAR A SITUAÇÃO EDILICA, TENDO POREM A PLANTA DE BOMBEIROS JÁ APROVADA, E VISTORIA REALIZADA; (09/08/11)\r\nIMOVEL ADQUIRIDO ATRAVES DE CONTRATO DE CESSAO DE DIREITOS POSSESSORIOS_____DOUGLAS A 7/7/11	{"CódContábil":"1060.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"IRREGULAR","EndereçoImóvel":"R. Dois nº 36/37?","CepImóvel":"13053-144","Zoneamento":"00","Receita":"0","Quarteirão":"0","Quadra":"0","Lote":"0","CódLogradouro":"0","ÁreaGeoFreqLixo":"0","TestadaTerreno":"0","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"1.125,00","ÁreaExcedente":"0","Observações":"POR ESTAR EM LOTEAMENTO CLANDESTINO, NÃO É POSSIVEL REGULARIZAR A SITUAÇÃO EDILICA, TENDO POREM A PLANTA DE BOMBEIROS JÁ APROVADA, E VISTORIA REALIZADA; (09/08/11)\\r\\nIMOVEL ADQUIRIDO ATRAVES DE CONTRATO DE CESSAO DE DIREITOS POSSESSORIOS_____DOUGLAS A 7/7/11","FotoPrincipal":null}	-23.0261448000000009	-47.1228004999999968	R. Dois nº 36/37?, Campinas, SP - 13053-144	000.000.000
25	0174.09	9	2	0281	3412.54.12.0017.00000	2015-02-05 02:18:59.73071	2015-06-12 02:10:58.104654	t	f	\N	{"CódContábil":"0174.09","Bairro":"Bonfim","Distrito":null,"CódBrás":"220281","CódIPTU":"021.327.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000566442","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0017.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim, espanha 536_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.09	Estacionamento	Aguarda Constr	PROPRIO	R. Espanha, 0	13070-260	\N	2	00265	***	27	198.00	9.00	\N	301.00	\N	\N	TERRITORIAL	TERRENO	0.02	antigo 536 - TERRENO ADQUIRIDO EM 23/10/09, PARA SER ANEXADO A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL. NESTE LOCAL HÁ UMA CASA QUE SERA DEMOLIDA___ DOUGLAS A. 28/10/09\r\nConsta apenas a COPIA DA ESCRITURA PARA COLETA DE DADOS_____ DOUGLAS A. 28/10/09	{"CódContábil":"0174.09","Tipo":"Estacionamento","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Espanha, 0","CepImóvel":"13070-260","Zoneamento":null,"Receita":"2","Quarteirão":"00265","Quadra":"***","Lote":"27","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"9,00","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRITORIAL","CategoriaImóvel":"TERRENO","Alícota":"2,6%","ÁreaTerreno":"198,00","ÁreaExcedente":"0","Observações":"antigo 536 - TERRENO ADQUIRIDO EM 23/10/09, PARA SER ANEXADO A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL. NESTE LOCAL HÁ UMA CASA QUE SERA DEMOLIDA___ DOUGLAS A. 28/10/09\\r\\nConsta apenas a COPIA DA ESCRITURA PARA COLETA DE DADOS_____ DOUGLAS A. 28/10/09","FotoPrincipal":null}	-22.8948649999999994	-47.079054499999998	R. Espanha, 0, Campinas, SP - 13070-260	021.327.000
26	0174.10	9	2	0281	3412.54.12.0046.00000	2015-02-05 02:18:59.894271	2015-06-12 02:10:59.248966	t	f	\N	{"CódContábil":"0174.10","Bairro":"Bonfim","Distrito":null,"CódBrás":"220281","CódIPTU":"022.068.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000259302","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0046.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\2- Bonfim\\\\Bonfim Espanha 560_mini.JPG","CódBrás_correto":"BR-22-0281"}	220281.10	Estacionamento	Aguarda Constr	PROPRIO	R. Espanha, 0	13070-260	\N	2	00265	***	30	33250.00	9.50	\N	301.00	\N	\N	TERRITORIAL	TERRENO	0.02	antigo560  - TERRENO DA QUADRA N-09 ADQUIRIDO EM 12/11/09, PARA SER ANEXADO A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL. NESTE LOCAL HÁ UMA CASA (233,06M2) QUE FOI DEMOLIDA___ DOUGLAS A. 16/05/14	{"CódContábil":"0174.10","Tipo":"Estacionamento","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Espanha, 0","CepImóvel":"13070-260","Zoneamento":null,"Receita":"2","Quarteirão":"00265","Quadra":"***","Lote":"30","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"9,50","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRITORIAL","CategoriaImóvel":"TERRENO","Alícota":"2,6%","ÁreaTerreno":"332.50","ÁreaExcedente":"0","Observações":"antigo560  - TERRENO DA QUADRA N-09 ADQUIRIDO EM 12/11/09, PARA SER ANEXADO A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL. NESTE LOCAL HÁ UMA CASA (233,06M2) QUE FOI DEMOLIDA___ DOUGLAS A. 16/05/14","FotoPrincipal":null}	-22.8948649999999994	-47.079054499999998	R. Espanha, 0, Campinas, SP - 13070-260	022.068.000
27	0174.11	9	2	0281	3412.54.12.0026.00000	2015-02-05 02:19:00.057145	2015-06-12 02:11:00.607179	t	f	\N	{"CódContábil":"0174.11","Bairro":"Bonfim","Distrito":null,"CódBrás":"220281","CódIPTU":"007.077.750","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000781072","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0026.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Bonfim, espanha 546.jpg","CódBrás_correto":"BR-22-0281"}	220281.11	Estacionamento	Aguarda Constr	PROPRIO	R. Espanha	13070-260	\N	2	265	\N	04	198.00	9.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	R. Espanha, 546 IMOVEL ADQUIRIDO EM 13/01/11 PARA ANEXAR A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL___DOUGLAS 23/02/11\r\nHÁ UM SOBRADO QUE SERÁ DEMOLIDO	{"CódContábil":"0174.11","Tipo":"Estacionamento","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Espanha","CepImóvel":"13070-260","Zoneamento":null,"Receita":"2","Quarteirão":"265","Quadra":null,"Lote":"04","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"9,00","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"198,00","ÁreaExcedente":null,"Observações":"R. Espanha, 546 IMOVEL ADQUIRIDO EM 13/01/11 PARA ANEXAR A AREA DA CONSTRUÇÃO DO NOVO REFEITORIO REGIONAL___DOUGLAS 23/02/11\\r\\nHÁ UM SOBRADO QUE SERÁ DEMOLIDO","FotoPrincipal":null}	-22.8962894000000006	-47.0759656000000035	R. Espanha, Campinas, SP - 13070-260	007.077.750
161	0760.01	102	5	3356	0000.0...	2015-02-05 02:19:23.06529	2015-06-12 02:17:37.280409	f	f	\N	{"CódContábil":"0760.01","Bairro":"Jd. Conceição (Santana) Vendido","Distrito":"Sousas","CódBrás":null,"CódIPTU":"055.071.335","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000999992","CódGrupo":"5","CódContador":"3356","CódCartograf":"0000.0...","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	223356.01	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. Jorge Miguel Keiralla, 127	13030-380	\N	\N	00063	1	03	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	\N	{"CódContábil":"0760.01","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Jorge Miguel Keiralla, 127","CepImóvel":"13030-380","Zoneamento":null,"Receita":null,"Quarteirão":"00063","Quadra":"1","Lote":"03","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	\N	\N	R. Jorge Miguel Keiralla, 127, Campinas, SP - 13030-380	055.071.335
93	0480.02	38	5	0286	\N	2015-02-05 02:19:11.43401	2015-06-12 02:16:10.328145	f	f	\N	{"CódContábil":"0480.02","Bairro":"Jd. dos Oliveiras (Devolvido)","Distrito":null,"CódBrás":"220286","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"5","CódContador":"0286","CódCartograf":null,"CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220286.02	Estacionamento	Desativado	DEVOLVIDO/VENDIDO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	\N	{"CódContábil":"0480.02","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":null,"CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	\N	\N	\N	000.000.000
30	0190.00	62	2	3169	3323.61.09.0401.01001	2015-02-05 02:19:00.556046	2015-06-12 02:11:04.378645	t	t	\N	{"CódContábil":"0190.00","Bairro":"Ch. Recreio Santa Fé","Distrito":null,"CódBrás":"22-31-69","CódIPTU":"055.082.847","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001331923","CódGrupo":"2","CódContador":"3169","CódCartograf":"3323.61.09.0401.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\CHACARA_SANTA_FE.JPG","CódBrás_correto":"BR-22-3169"}	223169.00	Igreja	Em Funcionamento	PROPRIO	R. Virgínio Manfron, 250	13064-871	3	3	15319	B	07.D	696.19	19.40	196.80	156.00	\N	\N	NRH-4.0 N RES. HORIZON.	PREDIAL	0.01	\N	{"CódContábil":"0190.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Virgínio Manfron, 250","CepImóvel":"13064-871","Zoneamento":"3","Receita":"3","Quarteirão":"15319","Quadra":"B","Lote":"07.D","CódLogradouro":"2745","ÁreaGeoFreqLixo":"156","TestadaTerreno":"19,40","ÁreaPrincipal":"196,80","ÁreaDependência":"0","TipoPadrão":"NRH-4.0 N RES. HORIZON.","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"696,19","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9068748999999983	-47.1653420000000025	R. Virgínio Manfron, 250, Campinas, SP - 13064-871	055.082.847
40	0240.00	70	1	3348	3342.41.74.0120.01001	2015-02-05 02:19:02.370814	2015-06-12 02:11:17.867076	t	t	\N	{"CódContábil":"0240.00","Bairro":"Cidade Satelite Iris III (Pirelli)","Distrito":null,"CódBrás":"223348","CódIPTU":"042.416.300","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000815543","CódGrupo":"1","CódContador":"3348","CódCartograf":"3342.41.74.0120.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\CIDADE_SATELITE_IRIS_III.jpg","CódBrás_correto":"BR-22-3348"}	223348.00	Igreja	Em Funcionamento	PROPRIO	R. GENERAL CARLOS COARI IRACEMA GOMES, 189	13059-602	0	3	04659	239	22	1150.00	25.00	415.71	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	DOUGLAS A 24/08/09 - NESTE TERRENO ESTÁ A CASA DE ORAÇAO, COM O ESTACIONAMENTO EM FORMA DE ''L'' INTEGRADO. SÃO  + OU - 45 VAGAS \r\nHÁ UM TERRENO VAZIO DO LADO ESQUERDO S/ MURO.\r\n RUA ASFALTADA.	{"CódContábil":"0240.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. GENERAL CARLOS COARI IRACEMA GOMES, 189","CepImóvel":"13059-602","Zoneamento":"0","Receita":"3","Quarteirão":"04659","Quadra":"239","Lote":"22","CódLogradouro":"0","ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,00","ÁreaPrincipal":"415,71","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1.150,00","ÁreaExcedente":"0","Observações":"DOUGLAS A 24/08/09 - NESTE TERRENO ESTÁ A CASA DE ORAÇAO, COM O ESTACIONAMENTO EM FORMA DE ''L'' INTEGRADO. SÃO  + OU - 45 VAGAS \\r\\nHÁ UM TERRENO VAZIO DO LADO ESQUERDO S/ MURO.\\r\\n RUA ASFALTADA.","FotoPrincipal":null}	-22.9293316999999988	-47.1481045000000023	R. GENERAL CARLOS COARI IRACEMA GOMES, 189, Campinas, SP - 13059-602	042.416.300
46	0270.01	11	3	0315	3251.14.11.0026.00000	2015-02-05 02:19:03.388601	2015-06-12 02:11:24.610413	t	f	\N	{"CódContábil":"0270.01","Bairro":"Jd. Campineiro","Distrito":null,"CódBrás":"220315","CódIPTU":"042.733.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000589842","CódGrupo":"3","CódContador":"0315","CódCartograf":"3251.14.11.0026.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Campineiro_Estac_mini.JPG","CódBrás_correto":"BR-22-0315"}	220315.01	Estacionamento	Em Funcionamento	ALUGADO	Av. Aguinaldo Acciari 102	13082-385	\N	3	5947	23	4	269.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0270.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"Av. Aguinaldo Acciari 102","CepImóvel":"13082-385","Zoneamento":null,"Receita":"3","Quarteirão":"5947","Quadra":"23","Lote":"4","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"269,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8415144999999988	-47.1204541000000035	Av. Aguinaldo Acciari 102, Campinas, SP - 13082-385	042.733.800
206	0950.00	102	4	3752	\N	2015-02-05 02:19:30.88089	2015-06-12 02:18:33.478527	f	f	\N	{"CódContábil":"0950.00","Bairro":"Ch. Pouso Alegre (Devolvido)","Distrito":null,"CódBrás":null,"CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3752","CódCartograf":null,"CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	223752.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. das Andorinhas, 16	13101-400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	CHACARA ALVORADA	{"CódContábil":"0950.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. das Andorinhas, 16","CepImóvel":"13101-400","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"CHACARA ALVORADA","FotoPrincipal":null}	-22.9166497999999983	-47.0178399999999996	R. das Andorinhas, 16, Campinas, SP - 13101-400	000.000.000
33	0210.01	68	1	3225	0	2015-02-05 02:19:01.080649	2015-06-12 02:11:08.349791	t	f	\N	{"CódContábil":"0210.01","Bairro":"Cidade Satelite Iris II (FlorenceII)","Distrito":null,"CódBrás":"223225","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"002036053","CódGrupo":"1","CódContador":"3225","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\CIDADE_SATELITE_IRIS_II_FLORENCE_II.jpg","CódBrás_correto":"BR-22-3225"}	223225.01	Estacionamento	Em Funcionamento	PROPRIO	R. Dr. Luiz Herique Giovanetti 2345	\N	\N	\N	\N	106	05	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	26/08/09 DOUGLAS A-  Imóvel unificado ao Cod 0210.00 - Onde esta erguido o Templo.\r\nVerificar se não eh o caso de se extinguir este código (0210.01) do P.B.D.	{"CódContábil":"0210.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Dr. Luiz Herique Giovanetti 2345","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"106","Lote":"05","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"26/08/09 DOUGLAS A-  Imóvel unificado ao Cod 0210.00 - Onde esta erguido o Templo.\\r\\nVerificar se não eh o caso de se extinguir este código (0210.01) do P.B.D.","FotoPrincipal":null}	\N	\N	\N	000.000.000
47	0280.00	100	3	0305	3421.63.30.0179.01001	2015-02-05 02:19:03.54793	2015-06-12 02:11:26.341524	f	f	\N	{"CódContábil":"0280.00","Bairro":"Jd. Carlos Gomes","Distrito":null,"CódBrás":"22-03-05","CódIPTU":"042.029.415","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000849011","CódGrupo":"3","CódContador":"0305","CódCartograf":"3421.63.30.0179.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\3- NOVA CAMPINAS.jpg","CódBrás_correto":"BR-22-0305"}	220305.00	Outros Fins	Desativado	PROPRIO	R. Piquete, 1079	13092-496	03	2	00759	F	011	384.00	12.00	136.78	301.00	\N	\N	NRH-4.0	PREDIAL	0.01	\N	{"CódContábil":"0280.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Piquete, 1079","CepImóvel":"13092-496","Zoneamento":"03","Receita":"2","Quarteirão":"00759","Quadra":"F","Lote":"011","CódLogradouro":"7051","ÁreaGeoFreqLixo":"301","TestadaTerreno":"12,00","ÁreaPrincipal":"136,78","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"384,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8954896999999988	-47.0398753999999997	R. Piquete, 1079, Campinas, SP - 13092-496	042.029.415
6	0120.01	6	3	0294	\N	2015-02-05 02:18:56.075628	2015-06-12 02:14:40.531363	t	f	\N	{"CódContábil":"0120.01","Bairro":"Barão Geraldo","Distrito":null,"CódBrás":"220294","CódIPTU":null,"CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"3","CódContador":"0294","CódCartograf":null,"CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Barao Geraldo - Agostinho Pattaro_Estac_mini.JPG","CódBrás_correto":"BR-22-0294"}	220294.01	Estacionamento	Em Funcionamento	ALUGADO	R. Jerônimo Pattaro, 433	13085-290	\N	\N	00031	B	20	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Verificado nesta data 03/04/08 que eh necessario fazer o aditamento para atualizar o valor da locação e registrar a resp. de IPTU, AGUA E LUZ	{"CódContábil":"0120.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. Jerônimo Pattaro, 433","CepImóvel":"13085-290","Zoneamento":null,"Receita":null,"Quarteirão":"00031","Quadra":"B","Lote":"20","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Verificado nesta data 03/04/08 que eh necessario fazer o aditamento para atualizar o valor da locação e registrar a resp. de IPTU, AGUA E LUZ","FotoPrincipal":null}	-22.8224221000000007	-47.0838442000000015	R. Jerônimo Pattaro, 433, Campinas, SP - 13085-290	\N
14	0160.00	57	3	2852	0	2015-02-05 02:18:57.902755	2015-06-12 02:14:47.29146	f	f	\N	{"CódContábil":"0160.00","Bairro":"Village Campinas","Distrito":"Barão Geraldo","CódBrás":"22-28-52","CódIPTU":"055.014.064","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"3","CódContador":"2852","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\VILLAGE_CAMPINAS.jpg","CódBrás_correto":"BR-22-2852"}	222852.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	R. Amandio Augusto Malheiro Lopes, 28 ou 38 ou 36	13085-704	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Proprietário paga IPTU	{"CódContábil":"0160.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Amandio Augusto Malheiro Lopes, 28 ou 38 ou 36","CepImóvel":"13085-704","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Proprietário paga IPTU","FotoPrincipal":null}	-22.7488686999999992	-47.0554483000000019	R. Amandio Augusto Malheiro Lopes, 28 ou 38 ou 36, Campinas, SP - 13085-704	055.014.064
28	0174.12	9	2	0281	3412.54.12.0128.00000	2015-02-05 02:19:00.216393	2015-06-12 02:14:59.312194	t	f	\N	{"CódContábil":"0174.12","Bairro":"Bonfim","Distrito":null,"CódBrás":"220281","CódIPTU":"034.591.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001355052","CódGrupo":"2","CódContador":"0281","CódCartograf":"3412.54.12.0128.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\bonfim - R. Dr. THEODORO LANGAARD, 658.jpg","CódBrás_correto":"BR-22-0281"}	220281.12	Estacionamento	Em Construção	PROPRIO	R. DOUTOR THEODORO LANGARD, 0	13070-760	\N	2	00265	9	001-A-SUB	256.15	14.40	\N	301.00	\N	\N	TERRITORIAL	TERRENO	0.00	IMOVEL ADQUIRIDO EM 17/11/2011 PARA SER ANEXADO AO NOVO REFEITORIO REGIONAL____DOUGLAS A 26/01/12	{"CódContábil":"0174.12","Tipo":"Estacionamento","Andamento":"Em Construção","Situação":"PROPRIO","EndereçoImóvel":"R. DOUTOR THEODORO LANGARD, 0","CepImóvel":"13070-760","Zoneamento":null,"Receita":"2","Quarteirão":"00265","Quadra":"9","Lote":"001-A-SUB","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"14,40","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRITORIAL","CategoriaImóvel":"TERRENO","Alícota":"0,40","ÁreaTerreno":"256,15","ÁreaExcedente":null,"Observações":"IMOVEL ADQUIRIDO EM 17/11/2011 PARA SER ANEXADO AO NOVO REFEITORIO REGIONAL____DOUGLAS A 26/01/12","FotoPrincipal":null}	-22.9002091000000014	-47.0808563000000007	R. DOUTOR THEODORO LANGARD, 0, Campinas, SP - 13070-760	034.591.000
55	0320.00	71	1	3636	3343.43.83.0126.01001	2015-02-05 02:19:05.102671	2015-06-12 02:15:22.504269	t	t	\N	{"CódContábil":"0320.00","Bairro":"Jd. Lisa","Distrito":null,"CódBrás":"22-36-36","CódIPTU":"055.051.317","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3636","CódCartograf":"3343.43.83.0126.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_LISA.JPG","CódBrás_correto":"BR-22-3636"}	223636.00	Igreja	Em Funcionamento	CEDIDO	R. Prof. Luiz Gonzaga Tavares Baeta Neves,190 ( Ant. 25)	13058-374	\N	2	10004	P	020	254.32	11.01	143.50	156.00	\N	\N	RH-3.0 RESID. HORIZ.	PREDIAL	0.00	SALA DE ORAÇAO. AGUARDA CONSTRUÇÃO 19/10/09 - DOUGLAS A.	{"CódContábil":"0320.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Prof. Luiz Gonzaga Tavares Baeta Neves,190 ( Ant. 25)","CepImóvel":"13058-374","Zoneamento":null,"Receita":"2","Quarteirão":"10004","Quadra":"P","Lote":"020","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"11,01","ÁreaPrincipal":"143,50","ÁreaDependência":"0","TipoPadrão":"RH-3.0 RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"254,32","ÁreaExcedente":"0","Observações":"SALA DE ORAÇAO. AGUARDA CONSTRUÇÃO 19/10/09 - DOUGLAS A.","FotoPrincipal":null}	-22.9566261999999988	-47.1824926999999974	R. Prof. Luiz Gonzaga Tavares Baeta Neves,190 ( Ant. 25), Campinas, SP - 13058-374	055.051.317
1	0100.00	102	2	2377	0	2015-02-05 02:18:54.571927	2015-06-12 02:14:36.189771	f	f	\N	{"CódContábil":"0100.00","Bairro":"Bairro Boa Vista (Gevisa)- Vendido","Distrito":null,"CódBrás":null,"CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"2","CódContador":"2377","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	222377.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Olinto Lunardi, 30 (estrada da Beloit)	13067-200	\N	\N	\N	A	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Tivemos a posse (área verde) do imóvel anterior a 1993 e foi vendido no ano de 2006, por recibo de venda.	{"CódContábil":"0100.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Olinto Lunardi, 30 (estrada da Beloit)","CepImóvel":"13067-200","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"A","Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":".","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":".","ÁreaExcedente":null,"Observações":"Tivemos a posse (área verde) do imóvel anterior a 1993 e foi vendido no ano de 2006, por recibo de venda.","FotoPrincipal":null}	-22.8765628999999997	-47.1530635000000018	R. Olinto Lunardi, 30 (estrada da Beloit), Campinas, SP - 13067-200	000.000.000
58	0330.01	19	1	0318	3343.31.50.0258.00000	2015-02-05 02:19:05.590701	2015-06-12 02:15:26.359263	t	f	\N	{"CódContábil":"0330.01","Bairro":"Jd. Florence","Distrito":null,"CódBrás":"22-03-18","CódIPTU":"055.062.959","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"002036043","CódGrupo":"1","CódContador":"0318","CódCartograf":"3343.31.50.0258.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Jd Florence\\\\IMG_3535 Jd Florence_mini.JPG","CódBrás_correto":"BR-22-0318"}	220318.01	Estacionamento	Em Funcionamento	PROPRIO	R. Frederico Milanesi	13059-024	03	3	08327	SS	005	250.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0330.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Frederico Milanesi","CepImóvel":"13059-024","Zoneamento":"03","Receita":"3","Quarteirão":"08327","Quadra":"SS","Lote":"005","CódLogradouro":"3643","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"250","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9423913000000006	-47.1641040000000018	R. Frederico Milanesi, Campinas, SP - 13059-024	055.062.959
64	0350.02	25	4	2967	3434.43.88.0221.00000	2015-02-05 02:19:06.567135	2015-06-12 02:15:34.241654	t	t	\N	{"CódContábil":"0350.02","Bairro":"Jd. do Lago II","Distrito":null,"CódBrás":"22-29-67","CódIPTU":"055.002.570","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000828173","CódGrupo":"4","CódContador":"2967","CódCartograf":"3434.43.88.0221.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\LAGO II\\\\lago_II_fachada_mini.JPG","CódBrás_correto":"BR-22-2967"}	222967.02	Igreja	Em Funcionamento	PROPRIO	João Tonóli, 335	13050-005	1	3	03329	3	10 unif	1166.60	28.06	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	ABERTURA EM 11/12/2011_______DOUGLAS A.	{"CódContábil":"0350.02","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"João Tonóli, 335","CepImóvel":"13050-005","Zoneamento":"1","Receita":"3","Quarteirão":"03329","Quadra":"3","Lote":"10 unif","CódLogradouro":"6206","ÁreaGeoFreqLixo":"156","TestadaTerreno":"28,06","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"1.166,60","ÁreaExcedente":"0","Observações":"ABERTURA EM 11/12/2011_______DOUGLAS A.","FotoPrincipal":null}	-22.9536380000000015	-47.0892164999999991	João Tonóli, 335, Campinas, SP - 13050-005	055.002.570
69	0380.00	30	4	2547	3364.22.98.0001.01001	2015-02-05 02:19:07.420653	2015-06-12 02:15:40.682138	t	t	\N	{"CódContábil":"0380.00","Bairro":"Jd. Melina","Distrito":null,"CódBrás":"22-25-47","CódIPTU":"055.048.814","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001186803","CódGrupo":"4","CódContador":"2547","CódCartograf":"3364.22.98.0001.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_MELINA.JPG","CódBrás_correto":"BR-22-2547"}	222547.00	Igreja	Em Funcionamento	PROPRIO	R. Odilla Silveira Pinto de Moura, 20	13056-144	03	2	05027	J	17-UNI	530.95	31.78	480.62	301.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	esq. c/ Antonio X. dos Anjos, 20	{"CódContábil":"0380.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Odilla Silveira Pinto de Moura, 20","CepImóvel":"13056-144","Zoneamento":"03","Receita":"2","Quarteirão":"05027","Quadra":"J","Lote":"17-UNI","CódLogradouro":"6334","ÁreaGeoFreqLixo":"301","TestadaTerreno":"31,78","ÁreaPrincipal":"480,62","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"530,95","ÁreaExcedente":"0","Observações":"esq. c/ Antonio X. dos Anjos, 20","FotoPrincipal":null}	-22.983595600000001	-47.1355483000000035	R. Odilla Silveira Pinto de Moura, 20, Campinas, SP - 13056-144	055.048.814
70	0380.01	30	4	2547	3364.31.03.0068.00000	2015-02-05 02:19:07.584079	2015-06-12 02:15:41.943466	t	f	\N	{"CódContábil":"0380.01","Bairro":"Jd. Melina","Distrito":null,"CódBrás":"22-25-47","CódIPTU":"055.048.829","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000831923","CódGrupo":"4","CódContador":"2547","CódCartograf":"3364.31.03.0068.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\jd. Melina.jpg","CódBrás_correto":"BR-22-2547"}	222547.01	Estacionamento	Em Funcionamento	PROPRIO	R. Napoleão Victório (Piazon)	13056-133	\N	3	07741	K	003	421.83	18.79	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	com contrato da compra e venda - 50% parte ideal (50% pertence a herdeiros) falta ata ministerial deste acordo no patrimonio	{"CódContábil":"0380.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Napoleão Victório (Piazon)","CepImóvel":"13056-133","Zoneamento":null,"Receita":"3","Quarteirão":"07741","Quadra":"K","Lote":"003","CódLogradouro":"6082","ÁreaGeoFreqLixo":"156","TestadaTerreno":"18,79","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"421,83","ÁreaExcedente":"0","Observações":"com contrato da compra e venda - 50% parte ideal (50% pertence a herdeiros) falta ata ministerial deste acordo no patrimonio","FotoPrincipal":null}	-22.9818363000000012	-47.1371923000000024	R. Napoleão Victório (Piazon), Campinas, SP - 13056-133	055.048.829
74	0400.00	32	3	2615	3244.11.57.0001.01001	2015-02-05 02:19:08.233788	2015-06-12 02:15:47.148297	t	t	\N	{"CódContábil":"0400.00","Bairro":"Jd. Myriam","Distrito":null,"CódBrás":"22-26-15","CódIPTU":"055.054.105","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000633591","CódGrupo":"3","CódContador":"2615","CódCartograf":"3244.11.57.0001.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\JARDIM_MYRIAM.jpg","CódBrás_correto":"BR-22-2615"}	222615.00	Igreja	Em Funcionamento	PROPRIO	R. Ângelo Sellin, 357	13098-422	03	2	10188	X	010	406.50	21.65	158.00	156.00	\N	\N	NRH 4.0 N.RES HORIZONTAL	PREDIAL	0.01	\r\npago ISS const.civil em 21/09/07 (0262 016680539 101007) R$59,72 Douglas A.	{"CódContábil":"0400.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Ângelo Sellin, 357","CepImóvel":"13098-422","Zoneamento":"03","Receita":"2","Quarteirão":"10188","Quadra":"X","Lote":"010","CódLogradouro":"0.102.871","ÁreaGeoFreqLixo":"156","TestadaTerreno":"21,65","ÁreaPrincipal":"158,00","ÁreaDependência":"0","TipoPadrão":"NRH 4.0 N.RES HORIZONTAL","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"406,50","ÁreaExcedente":"0","Observações":"\\r\\npago ISS const.civil em 21/09/07 (0262 016680539 101007) R$59,72 Douglas A.","FotoPrincipal":null}	-22.8145455999999989	-47.0293093000000013	R. Ângelo Sellin, 357, Campinas, SP - 13098-422	055.054.105
76	0410.01	33	4	0312	3452.42.51.0205.00000	2015-02-05 02:19:08.585653	2015-06-12 02:15:49.665417	f	f	\N	{"CódContábil":"0410.01","Bairro":"Jd. N.S. Lourdes","Distrito":null,"CódBrás":"22-03-12","CódIPTU":"042.746.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000268203","CódGrupo":"4","CódContador":"0312","CódCartograf":"3452.42.51.0205.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_NOSSA_SENHORA_DE_LOURDES.JPG","CódBrás_correto":"BR-22-0312"}	220312.01	Estacionamento	Desativado	PROPRIO	R. JOSÉ IFANGER	13051-552	\N	3	05804	I	006	315.00	14.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Matricula encerrada, lote anexado ao LT 05.	{"CódContábil":"0410.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. JOSÉ IFANGER","CepImóvel":"13051-552","Zoneamento":null,"Receita":"3","Quarteirão":"05804","Quadra":"I","Lote":"006","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"315,00","ÁreaExcedente":"0","Observações":"Matricula encerrada, lote anexado ao LT 05.","FotoPrincipal":null}	-22.9730787999999997	-47.0872468999999967	R. JOSÉ IFANGER, Campinas, SP - 13051-552	042.746.600
77	0410.02	33	4	0312	3452.42.51.0193.01001	2015-02-05 02:19:08.748746	2015-06-12 02:15:50.908903	t	t	\N	{"CódContábil":"0410.02","Bairro":"Jd. N.S. Lourdes","Distrito":null,"CódBrás":"220312","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001699913","CódGrupo":"4","CódContador":"0312","CódCartograf":"3452.42.51.0193.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_NOSSA_SENHORA_DE_LOURDES.JPG","CódBrás_correto":"BR-22-0312"}	220312.02	Igreja	Em Funcionamento	PROPRIO	RUA JOSE IFANGER, 95	13051-552	\N	0	5804	I	05 UNIF	705.00	34.06	293.25	156.00	\N	\N	MISTO	PREDIAL	0.01	IMOVEL ORIUNDO DA ANEXAÇAO LT. 5 e 6	{"CódContábil":"0410.02","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"RUA JOSE IFANGER, 95","CepImóvel":"13051-552","Zoneamento":null,"Receita":"0","Quarteirão":"5804","Quadra":"I","Lote":"05 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"34,06","ÁreaPrincipal":"293,25","ÁreaDependência":"0","TipoPadrão":"MISTO","CategoriaImóvel":"PREDIAL","Alícota":"1,10%","ÁreaTerreno":"705,00","ÁreaExcedente":null,"Observações":"IMOVEL ORIUNDO DA ANEXAÇAO LT. 5 e 6","FotoPrincipal":null}	-22.9733631000000003	-47.0859205000000003	RUA JOSE IFANGER, 95, Campinas, SP - 13051-552	000.000.000
84	0440.02	37	1	0306	3431.52.00.0327.00000	2015-02-05 02:19:09.908566	2015-06-12 02:15:59.341277	t	f	\N	{"CódContábil":"0440.02","Bairro":"Jd. Novo Campos Elíseos","Distrito":null,"CódBrás":"220306","CódIPTU":"055.021.752","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"1","CódContador":"0306","CódCartograf":"3431.52.00.0327.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Jd Novo Campos Eliseos\\\\N Cpos Eliseos - Estacion_mini.JPG","CódBrás_correto":"BR-22-0306"}	220306.02	Estacionamento	Concluído	PROPRIO	R. Isnard Otranto	13060-412	\N	3	03613	13	007-A-SUB	281.00	21.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0440.02","Tipo":"Estacionamento","Andamento":"Concluído","Situação":"PROPRIO","EndereçoImóvel":"R. Isnard Otranto","CepImóvel":"13060-412","Zoneamento":null,"Receita":"3","Quarteirão":"03613","Quadra":"13","Lote":"007-A-SUB","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"21,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"281,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9328411999999986	-47.1091783999999976	R. Isnard Otranto, Campinas, SP - 13060-412	055.021.752
86	0460.00	59	7	0007	3431.54.93.0378.01001	2015-02-05 02:19:10.23393	2015-06-12 02:16:01.872998	f	f	\N	{"CódContábil":"0460.00","Bairro":"Jd. Novo Campos Eliseos (Recanto dos Velhos)","Distrito":null,"CódBrás":"980007","CódIPTU":"042.947.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001188623","CódGrupo":"7","CódContador":"0007","CódCartograf":"3431.54.93.0378.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\IMG_3591 Lar dos Velhinhos_mini.JPG","CódBrás_correto":"BR-"}	220007.00	Outros Fins	Desativado	PROPRIO	R. Arlindo Gomes, 285	13060-151	01	2	03581	60	020-UNI	1313.00	39.00	1072.43	156.00	\N	\N	NRH-9.0	PREDIAL	0.01	Foi anexado c/ o lote 19 (prot. 30245/02 de 03/12/2003)	{"CódContábil":"0460.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Arlindo Gomes, 285","CepImóvel":"13060-151","Zoneamento":"01","Receita":"2","Quarteirão":"03581","Quadra":"60","Lote":"020-UNI","CódLogradouro":"986","ÁreaGeoFreqLixo":"156","TestadaTerreno":"39,00","ÁreaPrincipal":"1.072,43","ÁreaDependência":"0","TipoPadrão":"NRH-9.0","CategoriaImóvel":"PREDIAL","Alícota":"1,8%","ÁreaTerreno":"1.313,00","ÁreaExcedente":"0","Observações":"Foi anexado c/ o lote 19 (prot. 30245/02 de 03/12/2003)","FotoPrincipal":null}	-22.936074399999999	-47.1040431999999996	R. Arlindo Gomes, 285, Campinas, SP - 13060-151	042.947.700
88	0460.02	59	7	0007	3431.54.93.0365.01001	2015-02-05 02:19:10.61471	2015-06-12 02:16:04.27001	t	f	\N	{"CódContábil":"0460.02","Bairro":"Jd. Novo Campos Eliseos (Recanto dos Velhos)","Distrito":null,"CódBrás":"980007","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001816083","CódGrupo":"7","CódContador":"0007","CódCartograf":"3431.54.93.0365.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\IMG_3591 Lar dos Velhinhos_mini.JPG","CódBrás_correto":"BR-"}	220007.02	Outros Fins	Em Funcionamento	PROPRIO	R Arlindo Gomes, 317	13060-151	01	\N	3581	60	19 UNIF	1713.15	53.00	1247.30	156.00	\N	\N	NRH-7.0	PREDIAL	\N	O imovel atual é a unificação de 02 imoveis que já eram subdivisão e unificação anterior; 19 subdividido. (subdividido em 18 e 19) + 20 unif. (antigos 20 + 21 + 22) - Area total: 1713,15 m2 (Daniel)\r\nIMOVEL ORIUNDO DA UNIFICAÇAO DO LOTE 20 (QUE JÁ ERA UNIFICADO COM OS 20,21 e 22) em 04/01/2011_____DOUGLAS A 16/03/11	{"CódContábil":"0460.02","Tipo":"Outros Fins","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R Arlindo Gomes, 317","CepImóvel":"13060-151","Zoneamento":"01","Receita":null,"Quarteirão":"3581","Quadra":"60","Lote":"19 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"53,00","ÁreaPrincipal":"1247,30","ÁreaDependência":"0","TipoPadrão":"NRH-7.0","CategoriaImóvel":"PREDIAL","Alícota":null,"ÁreaTerreno":"1713,15","ÁreaExcedente":"0","Observações":"O imovel atual é a unificação de 02 imoveis que já eram subdivisão e unificação anterior; 19 subdividido. (subdividido em 18 e 19) + 20 unif. (antigos 20 + 21 + 22) - Area total: 1713,15 m2 (Daniel)\\r\\nIMOVEL ORIUNDO DA UNIFICAÇAO DO LOTE 20 (QUE JÁ ERA UNIFICADO COM OS 20,21 e 22) em 04/01/2011_____DOUGLAS A 16/03/11","FotoPrincipal":null}	-22.9360071999999988	-47.1039367999999996	R Arlindo Gomes, 317, Campinas, SP - 13060-151	000.000.000
92	0480.01	38	5	0286	3441.52.56.0156.00000	2015-02-05 02:19:11.268952	2015-06-12 02:16:09.544552	t	f	\N	{"CódContábil":"0480.01","Bairro":"Jd. dos Oliveiras","Distrito":null,"CódBrás":"22-02-86","CódIPTU":"007.304.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000627653","CódGrupo":"5","CódContador":"0286","CódCartograf":"3441.52.56.0156.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd dos Oliveiras.jpg","CódBrás_correto":"BR-22-0286"}	220286.01	Estacionamento	Em Funcionamento	PROPRIO	Av. Engenheiro Antonio Francisco de Paula Souza	13043-540	11	3	01819	H	003	276.08	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0480.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Engenheiro Antonio Francisco de Paula Souza","CepImóvel":"13043-540","Zoneamento":"11","Receita":"3","Quarteirão":"01819","Quadra":"H","Lote":"003","CódLogradouro":"731","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"276,08","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9354951000000007	-47.0374483000000012	Av. Engenheiro Antonio Francisco de Paula Souza, Campinas, SP - 13043-540	007.304.000
101	0490.04	73	1	3346	3431.44.51.0252.00000	2015-02-05 02:19:12.997776	2015-06-12 02:16:20.064974	t	f	\N	{"CódContábil":"0490.04","Bairro":"Jd. Santa Lúcia","Distrito":null,"CódBrás":"22-33-46","CódIPTU":"047.291.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000178103","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.44.51.0252.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_SANTA_LUCIA.jpg","CódBrás_correto":"BR-22-3346"}	223346.04	Estacionamento	Em Funcionamento	USUCAPIAO	R Maximiliano Weinlich, S/N	13060-491	01	3	03993	45	021	274.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Nº 85) 2- DESATIVADO-  Este terreno foi anexado ao lote 07 e 08 (somente na P.M.C, pois o lote 21 teve problemas de legalização do documento de propriedade), gerando o imóvel 0490.07_____DOUGLAS A. 15/03/10	{"CódContábil":"0490.04","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"R Maximiliano Weinlich, S/N","CepImóvel":"13060-491","Zoneamento":"01","Receita":"3","Quarteirão":"03993","Quadra":"45","Lote":"021","CódLogradouro":"5873","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"274,00","ÁreaExcedente":"0","Observações":"(Nº 85) 2- DESATIVADO-  Este terreno foi anexado ao lote 07 e 08 (somente na P.M.C, pois o lote 21 teve problemas de legalização do documento de propriedade), gerando o imóvel 0490.07_____DOUGLAS A. 15/03/10","FotoPrincipal":null}	-22.9381729000000014	-47.1164048999999991	R Maximiliano Weinlich, S/N, Campinas, SP - 13060-491	047.291.200
102	0490.06	73	1	3346	3431.44.62.0502.01001	2015-02-05 02:19:13.162103	2015-06-12 02:16:21.325848	t	f	\N	{"CódContábil":"0490.06","Bairro":"Jd. Santa Lúcia","Distrito":null,"CódBrás":"223346","CódIPTU":"047.478.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000112333","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.44.62.0502.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\CCB Santa Lucia - Estacionamento_mini.JPG","CódBrás_correto":"BR-22-3346"}	223346.06	Estacionamento	Em Funcionamento	PROPRIO	R. Maximiliano Weinlich, 424	13060-491	\N	2	03994	46	013	250.00	10.00	92.56	156.00	\N	\N	RH-2.0	PREDIAL	0.00	\N	{"CódContábil":"0490.06","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Maximiliano Weinlich, 424","CepImóvel":"13060-491","Zoneamento":null,"Receita":"2","Quarteirão":"03994","Quadra":"46","Lote":"013","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"92,56","ÁreaDependência":null,"TipoPadrão":"RH-2.0","CategoriaImóvel":"PREDIAL","Alícota":"0,4%","ÁreaTerreno":"250,00","ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	-22.9372733000000011	-47.1166502000000023	R. Maximiliano Weinlich, 424, Campinas, SP - 13060-491	047.478.900
105	0510.00	46	1	2339	3341.41.75.0298.01001	2015-02-05 02:19:13.652337	2015-06-12 02:16:24.994271	t	t	\N	{"CódContábil":"0510.00","Bairro":"Jd. Santa Rosa","Distrito":null,"CódBrás":"22-23-39","CódIPTU":"043.476.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000271773","CódGrupo":"1","CódContador":"2339","CódCartograf":"3341.41.75.0298.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_SANTA_ROSA.jpg","CódBrás_correto":"BR-22-2339"}	222339.00	Igreja	Em Funcionamento	PROPRIO	R. Geraldo Pereira de Amorim, 90	13058-715	03	2	05746	XL	005	360.00	12.00	104.85	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	CCB PROPRIETARIA - USUCAPIAO EM 10/12/2009 \r\nTEMOS CONTRATO DE CESSAO E TRANSF. DE CONTRATO - COMPROM. COMPRA E VENDA_______DOUGLAS A 16/3/11	{"CódContábil":"0510.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Geraldo Pereira de Amorim, 90","CepImóvel":"13058-715","Zoneamento":"03","Receita":"2","Quarteirão":"05746","Quadra":"XL","Lote":"005","CódLogradouro":"3721","ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"104,85","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"360,00","ÁreaExcedente":"0","Observações":"CCB PROPRIETARIA - USUCAPIAO EM 10/12/2009 \\r\\nTEMOS CONTRATO DE CESSAO E TRANSF. DE CONTRATO - COMPROM. COMPRA E VENDA_______DOUGLAS A 16/3/11","FotoPrincipal":null}	-22.9302904000000005	-47.1840660000000014	R. Geraldo Pereira de Amorim, 90, Campinas, SP - 13058-715	043.476.500
107	0530.00	14	4	0290	5213.52.62.0393.01001	2015-02-05 02:19:13.994056	2015-06-12 02:16:27.563286	t	t	\N	{"CódContábil":"0530.00","Bairro":"Descampado (Jd. São Domingos)","Distrito":null,"CódBrás":"22-02-90","CódIPTU":"043.313.300","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000632963","CódGrupo":"4","CódContador":"0290","CódCartograf":"5213.52.62.0393.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\DESCAMPADO_JARDIM_SAO_DOMINGOS.JPG","CódBrás_correto":"BR-22-0290"}	220290.00	Igreja	Em Funcionamento	PROPRIO	R. MARGINAL [SP073, JD SÃO DOMINGOS] SEM DENOM, 860	13053-000	18	2	05507	P	031-UNI	840.00	24.00	494.66	156.00	\N	\N	NRH-6.0	PREDIAL	0.01	A averbaçao da anexaçao dos lotes não pode ser feita, pois a aquisiçao do lote 30 foi feita por contrato e não por escritura.  Enquanto o juridico não solucionar não há como providenciar a unificaçao das matriculas____ao juridico em 31/5/11 ___Douglas A.	{"CódContábil":"0530.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. MARGINAL [SP073, JD SÃO DOMINGOS] SEM DENOM, 860","CepImóvel":"13053-000","Zoneamento":"18","Receita":"2","Quarteirão":"05507","Quadra":"P","Lote":"031-UNI","CódLogradouro":"1522","ÁreaGeoFreqLixo":"156","TestadaTerreno":"24,00","ÁreaPrincipal":"494,66","ÁreaDependência":"0","TipoPadrão":"NRH-6.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"840,00","ÁreaExcedente":"0","Observações":"A averbaçao da anexaçao dos lotes não pode ser feita, pois a aquisiçao do lote 30 foi feita por contrato e não por escritura.  Enquanto o juridico não solucionar não há como providenciar a unificaçao das matriculas____ao juridico em 31/5/11 ___Douglas A.","FotoPrincipal":null}	\N	\N	R. MARGINAL [SP073, JD SÃO DOMINGOS] SEM DENOM, 860, Campinas, SP - 13053-000	043.313.300
138	0680.00	76	3	3640	0	2015-02-05 02:19:19.277271	2015-06-12 02:17:08.241653	f	f	\N	{"CódContábil":"0680.00","Bairro":"Pq. dos Pomares (Devolvido)","Distrito":null,"CódBrás":"223640","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"3","CódContador":"3640","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3640"}	223640.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Sidnei Alvas Russo, 98	\N	\N	\N	\N	\N	\N	507.63	\N	\N	\N	\N	\N	IGREJA	\N	\N	IMOVEL DEVOLVIDO	{"CódContábil":"0680.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Sidnei Alvas Russo, 98","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"507,63","ÁreaExcedente":null,"Observações":"IMOVEL DEVOLVIDO","FotoPrincipal":null}	\N	\N	\N	000.000.000
110	0540.01	48	5	0304	3423.64.52.0623.01001	2015-02-05 02:19:14.541152	2015-06-12 02:16:31.351089	t	f	\N	{"CódContábil":"0540.01","Bairro":"Jd. São Fernando","Distrito":null,"CódBrás":"220304","CódIPTU":"044.209.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000232911","CódGrupo":"5","CódContador":"0304","CódCartograf":"3423.64.52.0623.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\SAOFERNANDO_terreno_mini.JPG","CódBrás_correto":"BR-22-0304"}	220304.01	Estacionamento	Em Funcionamento	PROPRIO	R. SERRA DE LAVRAS, 168	13100-331	\N	2	01913	Z	011	355.00	11.50	30.00	301.00	\N	\N	RH-1.0 Residencial Horizontal	PREDIAL	0.00	COMPRADO EM 14/05/2012	{"CódContábil":"0540.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. SERRA DE LAVRAS, 168","CepImóvel":"13100-331","Zoneamento":null,"Receita":"2","Quarteirão":"01913","Quadra":"Z","Lote":"011","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"11,50","ÁreaPrincipal":"30,00","ÁreaDependência":"0","TipoPadrão":"RH-1.0 Residencial Horizontal","CategoriaImóvel":"PREDIAL","Alícota":"0,40%","ÁreaTerreno":"355,00","ÁreaExcedente":"0","Observações":"COMPRADO EM 14/05/2012","FotoPrincipal":null}	-22.9160821000000006	-47.0328124999999986	R. SERRA DE LAVRAS, 168, Campinas, SP - 13100-331	044.209.500
113	0560.00	51	5	0300	3444.13.81.0465.01001	2015-02-05 02:19:15.026999	2015-06-12 02:16:35.220758	t	t	\N	{"CódContábil":"0560.00","Bairro":"Jd. São Vicente","Distrito":null,"CódBrás":"22-03-00","CódIPTU":"042.024.077","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001141433","CódGrupo":"5","CódContador":"0300","CódCartograf":"3444.13.81.0465.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_SAO_VICENTE.JPG","CódBrás_correto":"BR-22-0300"}	220300.00	Igreja	Em Funcionamento	PROPRIO	R. Francisco João Carlos Eberl, 454/456	13045-160	11	2	02532	J	14 unif	600.00	20.00	447.32	156.00	\N	\N	NRH 55.0	PREDIAL	0.01	 Está sendo aprovada nova planta (cadastrar)\r\n 2003 - excluida 28 m2 area dependencia	{"CódContábil":"0560.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Francisco João Carlos Eberl, 454/456","CepImóvel":"13045-160","Zoneamento":"11","Receita":"2","Quarteirão":"02532","Quadra":"J","Lote":"14 unif","CódLogradouro":"0.015.990","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"447,32","ÁreaDependência":"0","TipoPadrão":"NRH 55.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"600,00","ÁreaExcedente":"0","Observações":" Está sendo aprovada nova planta (cadastrar)\\r\\n 2003 - excluida 28 m2 area dependencia","FotoPrincipal":null}	-22.9470948999999997	-47.0269498999999982	R. Francisco João Carlos Eberl, 454/456, Campinas, SP - 13045-160	042.024.077
120	0590.00	60	4	3112	3454.11.24.0098.01001	2015-02-05 02:19:16.227799	2015-06-12 02:16:46.345935	t	t	\N	{"CódContábil":"0590.00","Bairro":"Pq. Das Camélias","Distrito":null,"CódBrás":"22-31-12","CódIPTU":"055.074.787","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001407113","CódGrupo":"4","CódContador":"3112","CódCartograf":"3454.11.24.0098.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_DAS_CAMELIAS.JPG","CódBrás_correto":"BR-22-3112"}	223112.00	Igreja	Em Funcionamento	PROPRIO	R. David Augusto Ferreira (Antiga rua Hum), 186	13052-530	02	2	09258	B	11 Unif	500.00	20.00	144.00	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	\N	{"CódContábil":"0590.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. David Augusto Ferreira (Antiga rua Hum), 186","CepImóvel":"13052-530","Zoneamento":"02","Receita":"2","Quarteirão":"09258","Quadra":"B","Lote":"11 Unif","CódLogradouro":"0.115.246","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"144","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"500,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	\N	\N	R. David Augusto Ferreira (Antiga rua Hum), 186, Campinas, SP - 13052-530	055.074.787
117	0570.00	24	5	2944	0	2015-02-05 02:19:15.703008	2015-06-12 02:16:40.094328	t	t	\N	{"CódContábil":"0570.00","Bairro":"Joaquim Egídio","Distrito":null,"CódBrás":"22-29-44","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"5","CódContador":"2944","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JOAQUIM_EGIDIO.JPG","CódBrás_correto":"BR-22-2944"}	222944.00	Igreja	Em Funcionamento	CEDIDO	R. Manoel Herculano da Silva Coelho, 50	13120-090	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	ESTE LOCAL É CEDIDO, E POSSUIMOS APENAS UM TERMO DE CESSÃO ASSINADO.	{"CódContábil":"0570.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Manoel Herculano da Silva Coelho, 50","CepImóvel":"13120-090","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"ESTE LOCAL É CEDIDO, E POSSUIMOS APENAS UM TERMO DE CESSÃO ASSINADO.","FotoPrincipal":null}	\N	\N	R. Manoel Herculano da Silva Coelho, 50, Campinas, SP - 13120-090	000.000.000
123	0610.00	15	4	0292	3362.51.01.0316.01001	2015-02-05 02:19:16.730068	2015-06-12 02:16:50.178178	t	t	\N	{"CódContábil":"0610.00","Bairro":"Pq. Dom Pedro II","Distrito":null,"CódBrás":"22-02-92","CódIPTU":"048.191.816","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000255053","CódGrupo":"4","CódContador":"0292","CódCartograf":"3362.51.01.0316.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_DOM_PEDRO_II.JPG","CódBrás_correto":"BR-22-0292"}	220292.00	Igreja	Em Funcionamento	PROPRIO	Av. Arymana, 632	13056-464	03	2	04393	29	17	720.00	24.00	335.00	156.00	20.00	\N	NRH 6.0	PREDIAL	0.01	2003 - excluida 20m2 area dependencia	{"CódContábil":"0610.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Arymana, 632","CepImóvel":"13056-464","Zoneamento":"03","Receita":"2","Quarteirão":"04393","Quadra":"29","Lote":"17","CódLogradouro":"0.051.714","ÁreaGeoFreqLixo":"156","TestadaTerreno":"24,00","ÁreaPrincipal":"335,00","ÁreaDependência":"20,00","TipoPadrão":"NRH 6.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"720,00","ÁreaExcedente":"0","Observações":"2003 - excluida 20m2 area dependencia","FotoPrincipal":null}	-22.9722153999999996	-47.1452480000000023	Av. Arymana, 632, Campinas, SP - 13056-464	048.191.816
131	0640.01	20	1	0283	3432.23.17.0001.01001	2015-02-05 02:19:18.077394	2015-06-12 02:16:59.855432	t	f	\N	{"CódContábil":"0640.01","Bairro":"Pq. Industrial","Distrito":null,"CódBrás":"22-02-83","CódIPTU":"013.708.450","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"0283","CódCartograf":"3432.23.17.0001.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Parque Industrial\\\\PANORAMA MINI.JPG","CódBrás_correto":"BR-22-0283"}	220283.01	Estacionamento	Em Funcionamento	ALUGADO	R. João Batista Pupo de Morais, 122	\N	\N	\N	01505	27	26	409.90	10.00	29.00	301.00	\N	\N	NRH-1.0 Ñ RESID. HORIZ.	PREDIAL	0.01	\N	{"CódContábil":"0640.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. João Batista Pupo de Morais, 122","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":"01505","Quadra":"27","Lote":"26","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"29,00","ÁreaDependência":null,"TipoPadrão":"NRH-1.0 Ñ RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"409,90","ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	\N	\N	\N	013.708.450
134	0650.00	23	1	0291	3433.52.19.0094.01001	2015-02-05 02:19:18.60848	2015-06-12 02:17:03.668351	t	t	\N	{"CódContábil":"0650.00","Bairro":"Pq. Ipiranga","Distrito":null,"CódBrás":"22-02-91","CódIPTU":"042.027.596","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000394643","CódGrupo":"1","CódContador":"0291","CódCartograf":"3433.52.19.0094.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\PARQUE_IPIRANGA.jpg","CódBrás_correto":"BR-22-0291"}	220291.00	Igreja	Em Funcionamento	PROPRIO	R. Agnaldo Saturnino Rocha, 45	13050-750	11	2	03372	A	12 unif	502.80	20.00	261.12	156.00	42.72	\N	NRH 4.0 Ñ RESID. HORIZ.	PREDIAL	0.01	2003 - excluida 42,72m2 area dependencia	{"CódContábil":"0650.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Agnaldo Saturnino Rocha, 45","CepImóvel":"13050-750","Zoneamento":"11","Receita":"2","Quarteirão":"03372","Quadra":"A","Lote":"12 unif","CódLogradouro":"0.041.103","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"261,12","ÁreaDependência":"42,72","TipoPadrão":"NRH 4.0 Ñ RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,10%","ÁreaTerreno":"502,80","ÁreaExcedente":"0","Observações":"2003 - excluida 42,72m2 area dependencia","FotoPrincipal":null}	-22.9484771000000016	-47.1090505000000022	R. Agnaldo Saturnino Rocha, 45, Campinas, SP - 13050-750	042.027.596
144	0690.03	41	1	2135	3334.43.53.0258.00000	2015-02-05 02:19:20.275797	2015-06-12 02:17:16.269715	f	f	\N	{"CódContábil":"0690.03","Bairro":"Pq. Res. Campina Grande","Distrito":null,"CódBrás":"22-21-35","CódIPTU":"055.052.856","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000930053","CódGrupo":"1","CódContador":"2135","CódCartograf":"3334.43.53.0258.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-2135"}	222135.03	Estacionamento	Desativado	PROPRIO	R. TREZE, S/N	13058-193	\N	3	10101	B	003	312.20	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R. Dezesseis, nº14)	{"CódContábil":"0690.03","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. TREZE, S/N","CepImóvel":"13058-193","Zoneamento":null,"Receita":"3","Quarteirão":"10101","Quadra":"B","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"312,20","ÁreaExcedente":"0","Observações":"(R. Dezesseis, nº14)","FotoPrincipal":null}	-22.9490000999999992	-47.1878394000000014	R. TREZE, S/N, Campinas, SP - 13058-193	055.052.856
147	0710.00	54	3	0298	3254.62.60.0321.01001	2015-02-05 02:19:20.761853	2015-06-12 02:17:20.162344	f	f	\N	{"CódContábil":"0710.00","Bairro":"Pq. Taquaral","Distrito":null,"CódBrás":"22-02-98","CódIPTU":"042.005.074","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001297182","CódGrupo":"3","CódContador":"0298","CódCartograf":"3254.62.60.0321.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Pq Taquaral_Igreja_mini.JPG","CódBrás_correto":"BR-22-0298"}	220298.00	Igreja	Desativado	PROPRIO	Dr. Quintino de Paula Maudonnet, 98	13087-610	03	2	00975	11-A	23 unif	701.85	30.00	286.07	301.00	\N	\N	RH-3.0 RESIDENCIAL HORIZONTAL	PREDIAL	0.00	UNIFICADO AOS LOTES 23, 24 e 25 em 22/07/2010____DOUGLAS A. 04/3/11\r\nEm 19/02/01 unificou c/ o estac. lote 25 (mas a PMC lançou IPTU em 2002) também aguarda matrícula.\r\n2003 - Excluído 29,55 m2 dependencia	{"CódContábil":"0710.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"Dr. Quintino de Paula Maudonnet, 98","CepImóvel":"13087-610","Zoneamento":"03","Receita":"2","Quarteirão":"00975","Quadra":"11-A","Lote":"23 unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"30,00","ÁreaPrincipal":"286,07","ÁreaDependência":"0","TipoPadrão":"RH-3.0 RESIDENCIAL HORIZONTAL","CategoriaImóvel":"PREDIAL","Alícota":"0,600%","ÁreaTerreno":"701,85","ÁreaExcedente":"0","Observações":"UNIFICADO AOS LOTES 23, 24 e 25 em 22/07/2010____DOUGLAS A. 04/3/11\\r\\nEm 19/02/01 unificou c/ o estac. lote 25 (mas a PMC lançou IPTU em 2002) também aguarda matrícula.\\r\\n2003 - Excluído 29,55 m2 dependencia","FotoPrincipal":null}	-22.8700550000000007	-47.0647434999999987	Dr. Quintino de Paula Maudonnet, 98, Campinas, SP - 13087-610	042.005.074
155	0740.01	58	4	2940	3453.14.27.0114.01001	2015-02-05 02:19:22.092874	2015-06-12 02:17:29.975579	f	f	\N	{"CódContábil":"0740.01","Bairro":"Pq. Vista Alegre","Distrito":null,"CódBrás":"222940","CódIPTU":"048.276.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000138273","CódGrupo":"4","CódContador":"2940","CódCartograf":"3453.14.27.0114.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_VISTA_ALEGRE.JPG","CódBrás_correto":"BR-22-2940"}	222940.01	Estacionamento	Desativado	PROPRIO	R. Anita Malfati, 323	13054-402	03	3	04758	H	011-UNI	578.00	24.00	627.85	301.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0740.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Anita Malfati, 323","CepImóvel":"13054-402","Zoneamento":"03","Receita":"3","Quarteirão":"04758","Quadra":"H","Lote":"011-UNI","CódLogradouro":"8547","ÁreaGeoFreqLixo":"301","TestadaTerreno":"24,00","ÁreaPrincipal":"627,85","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,5%","ÁreaTerreno":"578,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9855695000000004	-47.1187326000000013	R. Anita Malfati, 323, Campinas, SP - 13054-402	048.276.500
157	0740.03	58	4	2940	3453.14.27.0089.00000	2015-02-05 02:19:22.407125	2015-06-12 02:17:32.045445	t	f	\N	{"CódContábil":"0740.03","Bairro":"Pq. Vista Alegre","Distrito":null,"CódBrás":"222940","CódIPTU":"048.276.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000138273","CódGrupo":"4","CódContador":"2940","CódCartograf":"3453.14.27.0089.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-2940"}	222940.03	Estacionamento	Em Funcionamento	USUCAPIAO	R. ANITA MAFALTTI, S/N	13054-402	03	\N	04758	H	013	285.50	12.00	\N	301.00	\N	\N	TERRENO	PREDIAL	\N	(ANTIGA R. 13) 1- USUCAPIAO - EM NOME DE SOC. IMOB. PREVIDENCIA LTDA\r\nESTE IMOVEL POSSUI APENAS UM CONTRATO DE COMPR. COMPRA E VENDA DE 12/09/06______DOUGLAS A. 26/5/11\r\n(R. 07) Unificou só na PMC e não no cartório, pois o antigo dono faleceu antes do registro.	{"CódContábil":"0740.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"R. ANITA MAFALTTI, S/N","CepImóvel":"13054-402","Zoneamento":"03","Receita":null,"Quarteirão":"04758","Quadra":"H","Lote":"013","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"12,00","ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"PREDIAL","Alícota":null,"ÁreaTerreno":"285,50","ÁreaExcedente":null,"Observações":"(ANTIGA R. 13) 1- USUCAPIAO - EM NOME DE SOC. IMOB. PREVIDENCIA LTDA\\r\\nESTE IMOVEL POSSUI APENAS UM CONTRATO DE COMPR. COMPRA E VENDA DE 12/09/06______DOUGLAS A. 26/5/11\\r\\n(R. 07) Unificou só na PMC e não no cartório, pois o antigo dono faleceu antes do registro.","FotoPrincipal":null}	-22.9854477999999993	-47.1181726000000012	R. ANITA MAFALTTI, S/N, Campinas, SP - 13054-402	048.276.700
159	0750.00	42	4	2136	3361.52.22.0141.01001	2015-02-05 02:19:22.732963	2015-06-12 02:17:34.5642	t	t	\N	{"CódContábil":"0750.00","Bairro":"Res. Mauro Marcondes","Distrito":null,"CódBrás":"22-21-36","CódIPTU":"055.046.979","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001182423","CódGrupo":"4","CódContador":"2136","CódCartograf":"3361.52.22.0141.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\RESIDENCIAL_MAURO_MARCONDES.JPG","CódBrás_correto":"BR-22-2136"}	222136.00	Igreja	Em Funcionamento	PROPRIO	R. Hilário Baldo, 70	13057-421	03	2	07925	A	03 Unif	509.50	21.18	341.48	156.00	\N	\N	NRH 6.0	PREDIAL	0.01	TX de pavimentação paga (R$1.083,80) em 21/12/00 CHQ:006314 BRADESCO	{"CódContábil":"0750.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Hilário Baldo, 70","CepImóvel":"13057-421","Zoneamento":"03","Receita":"2","Quarteirão":"07925","Quadra":"A","Lote":"03 Unif","CódLogradouro":"3984","ÁreaGeoFreqLixo":"156","TestadaTerreno":"21,18","ÁreaPrincipal":"341,48","ÁreaDependência":"0","TipoPadrão":"NRH 6.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"509,50","ÁreaExcedente":"0","Observações":"TX de pavimentação paga (R$1.083,80) em 21/12/00 CHQ:006314 BRADESCO","FotoPrincipal":null}	-22.9728822000000008	-47.1705673000000019	R. Hilário Baldo, 70, Campinas, SP - 13057-421	055.046.979
173	0810.00	53	3	0282	3421.22.22.0174.01001	2015-02-05 02:19:25.180591	2015-06-12 02:17:52.546394	t	t	\N	{"CódContábil":"0810.00","Bairro":"Taquaral","Distrito":null,"CódBrás":"22-02-82","CódIPTU":"012.599.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000301631","CódGrupo":"3","CódContador":"0282","CódCartograf":"3421.22.22.0174.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\TAQUARAL.jpg","CódBrás_correto":"BR-22-0282"}	220282.00	Igreja	Em Funcionamento	PROPRIO	R. Leonardo Da Vinci, 136	13076-410	9	2	01600	K	14 e 15	682.50	21.50	300.10	301.00	\N	\N	RV 1.0	PREDIAL	0.00	TIRAR CERTIDAO ATUALIZADA?____DOUGLAS A 04/03/11	{"CódContábil":"0810.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Leonardo Da Vinci, 136","CepImóvel":"13076-410","Zoneamento":"9","Receita":"2","Quarteirão":"01600","Quadra":"K","Lote":"14 e 15","CódLogradouro":"5181","ÁreaGeoFreqLixo":"301","TestadaTerreno":"21,5","ÁreaPrincipal":"300,10","ÁreaDependência":"0","TipoPadrão":"RV 1.0","CategoriaImóvel":"PREDIAL","Alícota":"0,7%","ÁreaTerreno":"682,50","ÁreaExcedente":"0","Observações":"TIRAR CERTIDAO ATUALIZADA?____DOUGLAS A 04/03/11","FotoPrincipal":null}	-22.8789039999999986	-47.0460355000000021	R. Leonardo Da Vinci, 136, Campinas, SP - 13076-410	012.599.000
176	0830.00	22	5	2223	3443.22.60.0061.01001	2015-02-05 02:19:25.667153	2015-06-12 02:17:55.684247	t	t	\N	{"CódContábil":"0830.00","Bairro":"Vl. Ipê","Distrito":null,"CódBrás":"22-22-23","CódIPTU":"026.680.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000969893","CódGrupo":"5","CódContador":"2223","CódCartograf":"3443.22.60.0061.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\VILA_IPE.jpg","CódBrás_correto":"BR-22-2223"}	222223.00	Igreja	Em Funcionamento	PROPRIO	R. Campos de Piratininga, 105	13044-320	03	2	02928	F	30	380.00	10.50	157.98	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	Pagamento ISSQN doc: 55112615 -- CHQ: 0192  016680536  05/09/07 R$ 548,29	{"CódContábil":"0830.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Campos de Piratininga, 105","CepImóvel":"13044-320","Zoneamento":"03","Receita":"2","Quarteirão":"02928","Quadra":"F","Lote":"30","CódLogradouro":"1536","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,50","ÁreaPrincipal":"157,98","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"380,00","ÁreaExcedente":"0","Observações":"Pagamento ISSQN doc: 55112615 -- CHQ: 0192  016680536  05/09/07 R$ 548,29","FotoPrincipal":null}	-22.9430614000000013	-47.0434872000000013	R. Campos de Piratininga, 105, Campinas, SP - 13044-320	026.680.000
182	0870.01	82	1	3344	3352.22.86.0022.01001	2015-02-05 02:19:26.656753	2015-06-12 02:18:02.882065	f	f	\N	{"CódContábil":"0870.01","Bairro":"Pq. Res. São Bento","Distrito":null,"CódBrás":"22-33-44","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001389833","CódGrupo":"1","CódContador":"3344","CódCartograf":"3352.22.86.0022.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\IMG_3522 Est Sao Bento_mini.JPG","CódBrás_correto":"BR-22-3344"}	223344.01	Estacionamento	Desativado	PROPRIO	R. Ovídio Coluccini, 379	13058-148	\N	0	09812	M	002	406.76	23.00	151.10	156.00	\N	\N	MISTO - VER ITEM 6 NA FL 03	TERRITORIAL	0.01	\N	{"CódContábil":"0870.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Ovídio Coluccini, 379","CepImóvel":"13058-148","Zoneamento":null,"Receita":"0","Quarteirão":"09812","Quadra":"M","Lote":"002","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"23,00","ÁreaPrincipal":"151,10","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 6 NA FL 03","CategoriaImóvel":"TERRITORIAL","Alícota":"1,1%","ÁreaTerreno":"406,76","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9573992999999987	-47.1994405000000015	R. Ovídio Coluccini, 379, Campinas, SP - 13058-148	000.000.000
191	0900.01	85	5	3513	3442.24.22.0107.01001	2015-02-05 02:19:28.355786	2015-06-12 02:18:14.212673	f	f	\N	{"CódContábil":"0900.01","Bairro":"Jd. Tamoio","Distrito":null,"CódBrás":"22-35-13","CódIPTU":"055.058.794","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000571401","CódGrupo":"5","CódContador":"3513","CódCartograf":"3442.24.22.0107.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_TAMOIO.jpg","CódBrás_correto":"BR-22-3513"}	223513.01	Estacionamento	Em Funcionamento	PROPRIO	R. Professor Flavio Wustemberg, 225	13101-280	\N	3	10145	O	007	279.32	10.00	47.97	301.00	\N	\N	NRH-4.0	TERRITORIAL	0.01	1- UNIFICADOS LOTES 07,08	{"CódContábil":"0900.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Professor Flavio Wustemberg, 225","CepImóvel":"13101-280","Zoneamento":null,"Receita":"3","Quarteirão":"10145","Quadra":"O","Lote":"007","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"47,97","ÁreaDependência":"0,00","TipoPadrão":"NRH-4.0","CategoriaImóvel":"TERRITORIAL","Alícota":"1,1%","ÁreaTerreno":"279,32","ÁreaExcedente":"0,00","Observações":"1- UNIFICADOS LOTES 07,08","FotoPrincipal":null}	-22.9263830000000013	-47.0152002999999965	R. Professor Flavio Wustemberg, 225, Campinas, SP - 13101-280	055.058.794
192	0900.02	85	5	3513	3442.24.22.0117.01001	2015-02-05 02:19:28.519298	2015-06-12 02:18:15.462003	f	f	\N	{"CódContábil":"0900.02","Bairro":"Jd. Tamoio","Distrito":null,"CódBrás":"22-35-13","CódIPTU":"055.058.795","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000730431","CódGrupo":"5","CódContador":"3513","CódCartograf":"3442.24.22.0117.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_TAMOIO.jpg","CódBrás_correto":"BR-22-3513"}	223513.02	Estacionamento	Em Funcionamento	PROPRIO	R. Professor Flávio Wustemberg, 225	13101-280	\N	3	10145	O	008	34924.00	10.00	71.50	301.00	\N	\N	NRH-4.0	PREDIAL	0.01	UNIFICADOS LOTES 07,08	{"CódContábil":"0900.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Professor Flávio Wustemberg, 225","CepImóvel":"13101-280","Zoneamento":null,"Receita":"3","Quarteirão":"10145","Quadra":"O","Lote":"008","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"71,50","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1","ÁreaTerreno":"349.24","ÁreaExcedente":"0","Observações":"UNIFICADOS LOTES 07,08","FotoPrincipal":null}	-22.9263830000000013	-47.0152002999999965	R. Professor Flávio Wustemberg, 225, Campinas, SP - 13101-280	055.058.795
195	0910.02	86	2	3920	3322.51.12.0089.01001	2015-02-05 02:19:29.031193	2015-06-12 02:18:19.094179	t	f	\N	{"CódContábil":"0910.02","Bairro":"Pq. Santa Bárbara","Distrito":null,"CódBrás":"22-39-20","CódIPTU":"055.044.780","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001394683","CódGrupo":"2","CódContador":"3920","CódCartograf":"3322.51.12.0089.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\Pq Santa Barbara - Construçao_mini.JPG","CódBrás_correto":"BR-22-3920"}	223920.02	Estacionamento	Em Funcionamento	PROPRIO	Av. José Pereira Júnior, 96	13064410	\N	3	07826	K	002	300.00	10.00	309.64	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.02	(Nº 92)	{"CódContábil":"0910.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. José Pereira Júnior, 96","CepImóvel":"13064410","Zoneamento":null,"Receita":"3","Quarteirão":"07826","Quadra":"K","Lote":"002","CódLogradouro":"99.333","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"309,64","ÁreaDependência":"0,00","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"2,6%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":"(Nº 92)","FotoPrincipal":null}	-22.8899685999999996	-47.1456596000000019	Av. José Pereira Júnior, 96, Campinas, SP - 13064410	055.044.780
196	0910.03	86	2	3920	3322.51.12.0059.00000	2015-02-05 02:19:29.197322	2015-06-12 02:18:20.340814	f	f	\N	{"CódContábil":"0910.03","Bairro":"Pq. Santa Bárbara (Devolvido)","Distrito":null,"CódBrás":"223920","CódIPTU":"055.044.783","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"2","CódContador":"3920","CódCartograf":"3322.51.12.0059.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\PARQUE_SANTA_BARBARA.JPG","CódBrás_correto":"BR-22-3920"}	223920.03	Casa Residencial	Desativado	DEVOLVIDO/VENDIDO	Av. Jose Pereira Júnior, 66	13064-410	\N	3	7826	K	005	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Imovel devolvido em 15/04/2011_________Douglas A.	{"CódContábil":"0910.03","Tipo":"Casa Residencial","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"Av. Jose Pereira Júnior, 66","CepImóvel":"13064-410","Zoneamento":null,"Receita":"3","Quarteirão":"7826","Quadra":"K","Lote":"005","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"300","ÁreaExcedente":"0","Observações":"Imovel devolvido em 15/04/2011_________Douglas A.","FotoPrincipal":null}	-22.8901307000000003	-47.1454470999999984	Av. Jose Pereira Júnior, 66, Campinas, SP - 13064-410	055.044.783
199	0920.02	100	3	0305	3424.11.62.0100.00000	2015-02-05 02:19:29.723718	2015-06-12 02:18:24.917336	t	f	\N	{"CódContábil":"0920.02","Bairro":"Vl. Brandina","Distrito":null,"CódBrás":"22-03-05","CódIPTU":"046.814.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000193661","CódGrupo":"3","CódContador":"0305","CódCartograf":"3424.11.62.0100.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Vl Brandina_TERRENOS.jpg","CódBrás_correto":"BR-00-0305"}	220305.02	Estacionamento	Em Funcionamento	PROPRIO	R. ÉRICO VERÍSSIMO, S/N	00000-000	\N	\N	03363	H	019	403.60	14.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	\N	IMOVEL ADQUIRIDO POR CONTRATO PARTICULAR, POIS NÃO HAVIA O INVENTÁRIO E UM DOS HERDEIROS JÁ HAVIA FALECIDO, SENDO OS HERDEIROS DESTE MENORES. A LEGALIZAÇÃO PODERÁ SER INICIADA SOMENTE APÓS A MAIORIDADE OU ..... JÁ FOI PAGO EM JUIZO O VALOR TOTAL___ DEVE-SE ANALISAR CUIDADOSAMENTE ESTE CASO_____19/03/2014.	{"CódContábil":"0920.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. ÉRICO VERÍSSIMO, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"03363","Quadra":"H","Lote":"019","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":null,"ÁreaTerreno":"403,60","ÁreaExcedente":"0,00","Observações":"IMOVEL ADQUIRIDO POR CONTRATO PARTICULAR, POIS NÃO HAVIA O INVENTÁRIO E UM DOS HERDEIROS JÁ HAVIA FALECIDO, SENDO OS HERDEIROS DESTE MENORES. A LEGALIZAÇÃO PODERÁ SER INICIADA SOMENTE APÓS A MAIORIDADE OU ..... JÁ FOI PAGO EM JUIZO O VALOR TOTAL___ DEVE-SE ANALISAR CUIDADOSAMENTE ESTE CASO_____19/03/2014.","FotoPrincipal":null}	-22.9832909000000001	-47.1138692999999975	R. ÉRICO VERÍSSIMO, S/N, Campinas, SP - 00000-000	046.814.800
41	0240.01	102	1	3348	0	2015-02-05 02:19:02.556293	2015-06-12 02:11:18.695384	f	f	\N	{"CódContábil":"0240.01","Bairro":"Cidade Satelite Iris III  (Pirelli) -devolvido","Distrito":null,"CódBrás":null,"CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3348","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	223348.01	Casa Residencial	Desativado	DEVOLVIDO/VENDIDO	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	\N	{"CódContábil":"0240.01","Tipo":"Casa Residencial","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":null,"CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":null,"FotoPrincipal":null}	\N	\N	\N	000.000.000
152	0730.00	78	1	3229	0	2015-02-05 02:19:21.582178	2015-06-12 02:17:26.124319	f	f	\N	{"CódContábil":"0730.00","Bairro":"Pq. Valença II (Devolvido)","Distrito":null,"CódBrás":"22-32-29","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3229","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3229"}	223229.00	Casa Residencial	Desativado	DEVOLVIDO/VENDIDO	R. Luiz Rocatto, 634	13058-576	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Imóvel devolvido	{"CódContábil":"0730.00","Tipo":"Casa Residencial","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Luiz Rocatto, 634","CepImóvel":"13058-576","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Imóvel devolvido","FotoPrincipal":null}	-22.9936101999999991	-47.1386123999999995	R. Luiz Rocatto, 634, Campinas, SP - 13058-576	000.000.000
242	0560.04	51	5	0300	3444.14.03.0015.00000	2015-02-05 02:19:37.107624	2015-06-12 02:19:19.611702	t	f	\N	{"CódContábil":"0560.04","Bairro":"Jd. São Vicente","Distrito":null,"CódBrás":"22-03-00","CódIPTU":"024.233.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001139393","CódGrupo":"5","CódContador":"0300","CódCartograf":"3444.14.03.0015.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0560.04_JARDIM_SAO_VICENTE\\\\pat_560.04_0300_foto.esquina_qdM_lt34.jpg","CódBrás_correto":"BR-22-0300"}	220300.04	Estacionamento	Em Funcionamento	PROPRIO	Rua Francisco João Carlos Eberl (Antiga rua 07)	13045-160	\N	3	02535	M	034	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0560.04","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Rua Francisco João Carlos Eberl (Antiga rua 07)","CepImóvel":"13045-160","Zoneamento":null,"Receita":"3","Quarteirão":"02535","Quadra":"M","Lote":"034","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"300,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9473352000000013	-47.0267217000000031	Rua Francisco João Carlos Eberl (Antiga rua 07), Campinas, SP - 13045-160	024.233.000
252	0230.01	50	4	2846	3344.23.76.0556.00000	2015-02-05 02:19:38.740905	2015-06-12 02:19:31.786526	t	f	\N	{"CódContábil":"0230.01","Bairro":"Cidade Satelite Iris I","Distrito":null,"CódBrás":"22-28-46","CódIPTU":"042.664.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000787463","CódGrupo":"4","CódContador":"2846","CódCartograf":"3344.23.76.0556.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Cid Sat Iris I - Carlos Macia\\\\IMG_3557 Cid Sat Iris I - CM_mini.JPG","CódBrás_correto":"BR-22-2846"}	222846.01	Outros Fins	Desativado	PROPRIO	R. Dr. Carlos Macia, 23	13059-682	3	3	04475	50	47	695.00	20.00	\N	2.00	\N	\N	TERRENO	Sem Construção	0.00	TERRENO DOADO.Este terreno esta localizado em cima de uma área de aterro sanitario e a PMC (a muitos anos atras) iniciou um processo de desapropriação, porem ainda continua sendo de propriedade da CCB- Campinas, pois não fomos notificados e não houve pagamento. 23/03/2009____DOUGLAS A.\r\n!! AVERIGUAR NO PROCESSO JUNTO A PMC, QUAL A REAL SITUAÇAO DESTE IMOVEL , SE FOI OU NÃO DESAPROPRIADO____DOUGLAS A 15/02/10 !!	{"CódContábil":"0230.01","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Dr. Carlos Macia, 23","CepImóvel":"13059-682","Zoneamento":"3","Receita":"3","Quarteirão":"04475","Quadra":"50","Lote":"47","CódLogradouro":"1623","ÁreaGeoFreqLixo":"2=156 d/a","TestadaTerreno":"20","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno  Sem Construção","CategoriaImóvel":"Sem Construção","Alícota":"0","ÁreaTerreno":"695","ÁreaExcedente":"0","Observações":"TERRENO DOADO.Este terreno esta localizado em cima de uma área de aterro sanitario e a PMC (a muitos anos atras) iniciou um processo de desapropriação, porem ainda continua sendo de propriedade da CCB- Campinas, pois não fomos notificados e não houve pagamento. 23/03/2009____DOUGLAS A.\\r\\n!! AVERIGUAR NO PROCESSO JUNTO A PMC, QUAL A REAL SITUAÇAO DESTE IMOVEL , SE FOI OU NÃO DESAPROPRIADO____DOUGLAS A 15/02/10 !!","FotoPrincipal":null}	-22.9416329999999995	-47.1423660999999967	R. Dr. Carlos Macia, 23, Campinas, SP - 13059-682	042.664.800
204	0940.03	89	4	3783	3362.63.27.0061.00000	2015-02-05 02:19:30.554619	2015-06-12 02:18:30.884842	t	f	\N	{"CódContábil":"0940.03","Bairro":"Jd. Ouro Verde","Distrito":null,"CódBrás":"223783","CódIPTU":"042.010.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001480333","CódGrupo":"4","CódContador":"3783","CódCartograf":"3362.63.27.0061.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Ouro Verde_ Jurupana.jpg","CódBrás_correto":"BR-22-7383"}	223783.03	Terreno	Aguarda Constr	PROPRIO	R. JURUPANÃ, S/N	13056-311	\N	3	04246	90	008	675.00	50.60	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0940.03","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. JURUPANÃ, S/N","CepImóvel":"13056-311","Zoneamento":null,"Receita":"3","Quarteirão":"04246","Quadra":"90","Lote":"008","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"50,60","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"675,00","ÁreaExcedente":"0,00","Observações":null,"FotoPrincipal":null}	-22.9758497000000013	-47.1346463	R. JURUPANÃ, S/N, Campinas, SP - 13056-311	042.010.800
175	0820.01	8	2	0284	\N	2015-02-05 02:19:25.504756	2015-06-09 20:16:50.147349	t	f	\N	{"CódContábil":"0820.01","Bairro":"Vl. Boa Vista","Distrito":null,"CódBrás":"220284","CódIPTU":null,"CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"2","CódContador":"0284","CódCartograf":null,"CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\Boa Vista - Estacionamento_mini.JPG","CódBrás_correto":"BR-22-0284"}	220284.01	Estacionamento	Em Funcionamento	IRREGULAR	R. Jequitibás, 908	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	PRAÇA DA PMC (USO IRREGULAR)___DOUGLAS A. 15/02/10	{"CódContábil":"0820.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"IRREGULAR","EndereçoImóvel":"R. Jequitibás, 908","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"PRAÇA DA PMC (USO IRREGULAR)___DOUGLAS A. 15/02/10","FotoPrincipal":null}	\N	\N	\N	\N
174	0820.00	8	2	0284	3411.13.02.0212.01001	2015-02-05 02:19:25.344914	2015-06-12 02:17:53.857848	t	t	\N	{"CódContábil":"0820.00","Bairro":"Vl. Boa Vista","Distrito":null,"CódBrás":"22-02-84","CódIPTU":"042.035.623","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000112752","CódGrupo":"2","CódContador":"0284","CódCartograf":"3411.13.02.0212.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\VILA_BOA_VISTA.JPG","CódBrás_correto":"BR-22-0284"}	220284.00	Igreja	Em Funcionamento	PROPRIO	R. das Sucupiras, 476	13064-743	03	2	06191	10	087	652.50	25.50	274.00	156.00	\N	\N	NRH 4.0	PREDIAL	0.01	2003 - excluida 15m2 area dependencia	{"CódContábil":"0820.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. das Sucupiras, 476","CepImóvel":"13064-743","Zoneamento":"03","Receita":"2","Quarteirão":"06191","Quadra":"10","Lote":"087","CódLogradouro":"8684","ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,50","ÁreaPrincipal":"274,00","ÁreaDependência":"0","TipoPadrão":"NRH 4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"652,50","ÁreaExcedente":"0","Observações":"2003 - excluida 15m2 area dependencia","FotoPrincipal":null}	-22.8841442000000015	-47.1247297999999972	R. das Sucupiras, 476, Campinas, SP - 13064-743	042.035.623
179	0850.01	80	1	3120	3433.42.19.0100.01001	2015-02-05 02:19:26.16383	2015-06-12 02:17:59.004038	t	t	\N	{"CódContábil":"0850.01","Bairro":"Vl. Palácios","Distrito":null,"CódBrás":"22-31-20","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001459563","CódGrupo":"1","CódContador":"3120","CódCartograf":"3433.42.19.0100.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0850.01_VILA_PALACIOS\\\\PALACIOS_MINI.jpg","CódBrás_correto":"BR-22-3120"}	223120.01	Igreja	Em Funcionamento	PROPRIO	R. João Moreno, 55    gleba 121	\N	0	\N	30028	\N	121D-GL	1500.00	39.82	728.00	\N	\N	\N	PREDIAL	NRH- 5.0	0.01	\N	{"CódContábil":"0850.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. João Moreno, 55    gleba 121","CepImóvel":null,"Zoneamento":"0","Receita":null,"Quarteirão":"30028","Quadra":null,"Lote":"121D-GL","CódLogradouro":null,"ÁreaGeoFreqLixo":"0","TestadaTerreno":"39,82","ÁreaPrincipal":"728,00","ÁreaDependência":"0","TipoPadrão":"PREDIAL","CategoriaImóvel":"NRH- 5.0","Alícota":"1,5%","ÁreaTerreno":"1.500,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	\N	\N	\N	000.000.000
181	0870.00	82	1	3344	3352.22.86.0001.00000	2015-02-05 02:19:26.491406	2015-06-12 02:18:01.51685	f	f	\N	{"CódContábil":"0870.00","Bairro":"Pq. Res. São Bento","Distrito":null,"CódBrás":"22-33-44","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001389823","CódGrupo":"1","CódContador":"3344","CódCartograf":"3352.22.86.0001.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\PARQUE_RESIDENCIAL_SAO_BENTO.jpg","CódBrás_correto":"BR-22-3344"}	223344.00	Igreja	Desativado	PROPRIO	R. Ovídio Coluccini, S/N	13058-148	\N	0	09812	M	001	400.84	22.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Nº 2)	{"CódContábil":"0870.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Ovídio Coluccini, S/N","CepImóvel":"13058-148","Zoneamento":null,"Receita":"0","Quarteirão":"09812","Quadra":"M","Lote":"001","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"22,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"400,84","ÁreaExcedente":"0,00","Observações":"(Nº 2)","FotoPrincipal":null}	-22.9603123999999994	-47.1986431999999994	R. Ovídio Coluccini, S/N, Campinas, SP - 13058-148	000.000.000
183	0870.02	82	1	3344	3352.22.86.0045.00000	2015-02-05 02:19:26.820389	2015-06-12 02:18:04.255252	f	f	\N	{"CódContábil":"0870.02","Bairro":"Pq. Res. São Bento","Distrito":null,"CódBrás":"22-33-44","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001389843","CódGrupo":"1","CódContador":"3344","CódCartograf":"3352.22.86.0045.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\IMG_3522 Est Sao Bento_mini.JPG","CódBrás_correto":"BR-22-3344"}	223344.02	Estacionamento	Desativado	PROPRIO	R. DEZESSEIS, S/N	13058-127	\N	0	09812	M	003	452.27	14.96	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R. Ovídio Coluccini / Rua Dezesseis)	{"CódContábil":"0870.02","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. DEZESSEIS, S/N","CepImóvel":"13058-127","Zoneamento":null,"Receita":"0","Quarteirão":"09812","Quadra":"M","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,96","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"452,27","ÁreaExcedente":"0,00","Observações":"(R. Ovídio Coluccini / Rua Dezesseis)","FotoPrincipal":null}	-23.0404124999999986	-47.1788279000000017	R. DEZESSEIS, S/N, Campinas, SP - 13058-127	000.000.000
184	0870.03	82	1	3344	3352.22.86.0002.01001	2015-02-05 02:19:26.983508	2015-06-12 02:18:05.380299	t	t	\N	{"CódContábil":"0870.03","Bairro":"Pq. Res. São Bento","Distrito":null,"CódBrás":"223344","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001615753","CódGrupo":"1","CódContador":"3344","CódCartograf":"3352.22.86.0002.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\PARQUE_RESIDENCIAL_SAO_BENTO.jpg","CódBrás_correto":"BR-22-3344"}	223344.03	Igreja	Em Funcionamento	PROPRIO	R. Ovídio Coluccini, 379	13058-148	\N	\N	09812	M	01 UNIF	1259.87	14.95	151.10	156.00	\N	\N	PREDIAL	MISTO	0.01	18/6/11- Imovel oriundo da UNIFICAÇAO dos lotes 01,02 e 03 (0870.00, 01 e 02).	{"CódContábil":"0870.03","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Ovídio Coluccini, 379","CepImóvel":"13058-148","Zoneamento":null,"Receita":null,"Quarteirão":"09812","Quadra":"M","Lote":"01 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,95","ÁreaPrincipal":"151,10","ÁreaDependência":null,"TipoPadrão":"PREDIAL","CategoriaImóvel":"MISTO","Alícota":"1,1%","ÁreaTerreno":"1259,87","ÁreaExcedente":null,"Observações":"18/6/11- Imovel oriundo da UNIFICAÇAO dos lotes 01,02 e 03 (0870.00, 01 e 02).","FotoPrincipal":null}	-22.9573992999999987	-47.1994405000000015	R. Ovídio Coluccini, 379, Campinas, SP - 13058-148	000.000.000
187	0890.01	84	4	3639	3344.54.96.0248.00000	2015-02-05 02:19:27.542305	2015-06-12 02:18:09.125346	f	f	\N	{"CódContábil":"0890.01","Bairro":"Jd. Sao Judas Tadeu","Distrito":null,"CódBrás":"22-36-39","CódIPTU":"045.816.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001303213","CódGrupo":"4","CódContador":"3639","CódCartograf":"3344.54.96.0248.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\IMG_3568 Jd Sao Judas Tadeu_mini.JPG","CódBrás_correto":"BR-22-3639"}	223639.01	Terreno	Desativado	PROPRIO	R. Herinque Thoni Filho, S/N	13059-780	\N	3	04323	40	005	750.00	15.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Ant. R. Oito) Imovel  unificado ao LT 06, da QD.40, extinguindo a Matricula 130321 _DOUGLAS A. 06/07/09	{"CódContábil":"0890.01","Tipo":"Terreno","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Herinque Thoni Filho, S/N","CepImóvel":"13059-780","Zoneamento":null,"Receita":"3","Quarteirão":"04323","Quadra":"40","Lote":"005","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"15,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"750,00","ÁreaExcedente":"0,00","Observações":"(Ant. R. Oito) Imovel  unificado ao LT 06, da QD.40, extinguindo a Matricula 130321 _DOUGLAS A. 06/07/09","FotoPrincipal":null}	\N	\N	R. Herinque Thoni Filho, S/N, Campinas, SP - 13059-780	045.816.100
188	0890.02	84	4	3639	3344.54.96.0263.00000	2015-02-05 02:19:27.827914	2015-06-12 02:18:10.382323	f	f	\N	{"CódContábil":"0890.02","Bairro":"Jd. Sao Judas Tadeu","Distrito":null,"CódBrás":"22-36-39","CódIPTU":"045.816.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001303223","CódGrupo":"4","CódContador":"3639","CódCartograf":"3344.54.96.0263.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\IMG_3568 Jd Sao Judas Tadeu_mini.JPG","CódBrás_correto":"BR-22-3639"}	223639.02	Terreno	Desativado	PROPRIO	R. Henrique Thoni Filho, S/N	13059-780	\N	3	04323	40	006	500.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Imovel  unificado ao LT 05, da QD.40, extinguindo a Matricula 130322 _DOUGLAS A. 06/07/09	{"CódContábil":"0890.02","Tipo":"Terreno","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Henrique Thoni Filho, S/N","CepImóvel":"13059-780","Zoneamento":null,"Receita":"3","Quarteirão":"04323","Quadra":"40","Lote":"006","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"500,00","ÁreaExcedente":"0,00","Observações":"Imovel  unificado ao LT 05, da QD.40, extinguindo a Matricula 130322 _DOUGLAS A. 06/07/09","FotoPrincipal":null}	\N	\N	R. Henrique Thoni Filho, S/N, Campinas, SP - 13059-780	045.816.200
189	0890.03	84	4	3639	3344.54.96.0249.00000	2015-02-05 02:19:27.991379	2015-06-12 02:18:11.702797	t	f	\N	{"CódContábil":"0890.03","Bairro":"Jd. Sao Judas Tadeu","Distrito":null,"CódBrás":"223639","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001720963","CódGrupo":"4","CódContador":"3639","CódCartograf":"3344.54.96.0249.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\IMG_3568 Jd Sao Judas Tadeu_mini.JPG","CódBrás_correto":"BR-22-3639"}	223639.03	Terreno	Aguarda Constr	PROPRIO	R. Herinque Thoni Filho (Ant. Oito) UNIF. LT 05 e 06, da QD.40	13059-780	\N	\N	4323	40	05 UNIF	1250.00	25.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	1- 26/08/09 DOUGLAS A. - Imovel oriundo da unificação dos LT 05 e 06, da QD.40, extinguindo os das Matriculas 130322 e 130321 (0890.01 e 0890.02) \r\n2- O terreno esta aguardando construção, foi murado dos lados, porém na frente foi batido um pontaletes de Eucalipto e puxado 03 arames. Está um fechamento precário e não há identificação do Proprietário e nem numeração.\r\n3- Levar em Reun.Comiss.Constr. A ideia de se fazer um fechamento com alambrado.\r\n4- PEDIR A UNIFICAÇÃO DOS IPTUs___DOUGLAS 15/02/10	{"CódContábil":"0890.03","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Herinque Thoni Filho (Ant. Oito) UNIF. LT 05 e 06, da QD.40","CepImóvel":"13059-780","Zoneamento":null,"Receita":null,"Quarteirão":"4323","Quadra":"40","Lote":"05 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,60%","ÁreaTerreno":"1250,00","ÁreaExcedente":"0","Observações":"1- 26/08/09 DOUGLAS A. - Imovel oriundo da unificação dos LT 05 e 06, da QD.40, extinguindo os das Matriculas 130322 e 130321 (0890.01 e 0890.02) \\r\\n2- O terreno esta aguardando construção, foi murado dos lados, porém na frente foi batido um pontaletes de Eucalipto e puxado 03 arames. Está um fechamento precário e não há identificação do Proprietário e nem numeração.\\r\\n3- Levar em Reun.Comiss.Constr. A ideia de se fazer um fechamento com alambrado.\\r\\n4- PEDIR A UNIFICAÇÃO DOS IPTUs___DOUGLAS 15/02/10","FotoPrincipal":null}	\N	\N	R. Herinque Thoni Filho (Ant. Oito) UNIF. LT 05 e 06, da QD.40, Campinas, SP - 13059-780	000.000.000
203	0940.02	89	4	3783	3362.63.27.0049.00000	2015-02-05 02:19:30.372381	2015-06-12 02:18:29.719253	t	f	\N	{"CódContábil":"0940.02","Bairro":"Jd. Ouro Verde","Distrito":null,"CódBrás":"22-37-83","CódIPTU":"042.010.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001480343","CódGrupo":"4","CódContador":"3783","CódCartograf":"3362.63.27.0049.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Ouro Verde_ Jurupana.jpg","CódBrás_correto":"BR-22-3783"}	223783.02	Terreno	Aguarda Constr	PROPRIO	R. JURUPANÃ, S/N	13056-311	\N	3	04246	90	009	360.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0940.02","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. JURUPANÃ, S/N","CepImóvel":"13056-311","Zoneamento":null,"Receita":"3","Quarteirão":"04246","Quadra":"90","Lote":"009","CódLogradouro":"1539","ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"360,00","ÁreaExcedente":"0,00","Observações":null,"FotoPrincipal":null}	-22.9758497000000013	-47.1346463	R. JURUPANÃ, S/N, Campinas, SP - 13056-311	042.010.900
197	0920.00	100	3	0305	3424.11.62.0409.00000	2015-02-05 02:19:29.360587	2015-06-12 02:18:21.557959	f	f	\N	{"CódContábil":"0920.00","Bairro":"Vl. Brandina","Distrito":null,"CódBrás":"220305","CódIPTU":"046.809.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000989491","CódGrupo":"3","CódContador":"0305","CódCartograf":"3424.11.62.0409.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Vl Brandina.jpg","CódBrás_correto":"BR-22-0305"}	220305.00	Igreja	Desativado	PROPRIO	R. Francisco Mesquita, S/N	13092-511	\N	3	03363	H	009	385.00	14.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0920.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Francisco Mesquita, S/N","CepImóvel":"13092-511","Zoneamento":null,"Receita":"3","Quarteirão":"03363","Quadra":"H","Lote":"009","CódLogradouro":"3598","ÁreaGeoFreqLixo":"301","TestadaTerreno":"14,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"385,00","ÁreaExcedente":"0,00","Observações":null,"FotoPrincipal":null}	-22.8986260000000001	-47.0258147999999991	R. Francisco Mesquita, S/N, Campinas, SP - 13092-511	046.809.100
198	0920.01	100	3	0305	3424.11.62.0422.00000	2015-02-05 02:19:29.523636	2015-06-12 02:18:22.643081	f	f	\N	{"CódContábil":"0920.01","Bairro":"Vl. Brandina","Distrito":null,"CódBrás":"22-03-05","CódIPTU":"046.809.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000030451","CódGrupo":"3","CódContador":"0305","CódCartograf":"3424.11.62.0422.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Vl Brandina.jpg","CódBrás_correto":"BR-00-0305"}	220305.01	Igreja	Desativado	PROPRIO	R. Francisco Mesquita, S/N	13092-511	\N	3	03363	H	010	385.00	14.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0920.01","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. Francisco Mesquita, S/N","CepImóvel":"13092-511","Zoneamento":null,"Receita":"3","Quarteirão":"03363","Quadra":"H","Lote":"010","CódLogradouro":"3598","ÁreaGeoFreqLixo":"301","TestadaTerreno":"14,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"385,00","ÁreaExcedente":"0,00","Observações":null,"FotoPrincipal":null}	-22.8986260000000001	-47.0258147999999991	R. Francisco Mesquita, S/N, Campinas, SP - 13092-511	046.809.200
201	0940.00	89	4	3783	3362.63.47.0233.01001	2015-02-05 02:19:30.049331	2015-06-12 02:18:27.375284	t	t	\N	{"CódContábil":"0940.00","Bairro":"Jd. Ouro Verde","Distrito":null,"CódBrás":"22-37-83","CódIPTU":"055.066.319","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3783","CódCartograf":"3362.63.47.0233.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_OURO_VERDE.JPG","CódBrás_correto":"BR-22-3783"}	223783.00	Igreja	Em Funcionamento	CEDIDO	R. Japi, 233	13056-313	\N	2	04243	87	011	410.00	12.00	136.00	156.00	\N	\N	RH 3.0 RESID. HORIZ.	PREDIAL	0.00	O numero no muro é 109.	{"CódContábil":"0940.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Japi, 233","CepImóvel":"13056-313","Zoneamento":null,"Receita":"2","Quarteirão":"04243","Quadra":"87","Lote":"011","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"136,00","ÁreaDependência":"0","TipoPadrão":"RH 3.0 RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"410,00","ÁreaExcedente":"0","Observações":"O numero no muro é 109.","FotoPrincipal":null}	-22.9759573999999986	-47.1331362999999968	R. Japi, 233, Campinas, SP - 13056-313	055.066.319
202	0940.01	89	4	3783	3362.63.27.0037.00000	2015-02-05 02:19:30.209692	2015-06-12 02:18:28.60963	t	f	\N	{"CódContábil":"0940.01","Bairro":"Jd. Ouro Verde","Distrito":null,"CódBrás":"22-37-83","CódIPTU":"042.011.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001480353","CódGrupo":"4","CódContador":"3783","CódCartograf":"3362.63.27.0037.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Ouro Verde_ Jurupana.jpg","CódBrás_correto":"BR-22-3783"}	223783.01	Terreno	Aguarda Constr	PROPRIO	R. JURUPANÃ, S/N	13056-311	\N	3	04246	90	010	360.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0940.01","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. JURUPANÃ, S/N","CepImóvel":"13056-311","Zoneamento":null,"Receita":"3","Quarteirão":"04246","Quadra":"90","Lote":"010","CódLogradouro":"1539","ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"360,00","ÁreaExcedente":"0,00","Observações":null,"FotoPrincipal":null}	-22.9758497000000013	-47.1346463	R. JURUPANÃ, S/N, Campinas, SP - 13056-311	042.011.000
209	0980.00	93	4	3850	3364.24.08.0133.00000	2015-02-05 02:19:31.406764	2015-06-12 02:18:37.351495	f	f	\N	{"CódContábil":"0980.00","Bairro":"Jd. São Pedro de Viracopos","Distrito":null,"CódBrás":"22-38-50","CódIPTU":"044.896.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000039543","CódGrupo":"4","CódContador":"3850","CódCartograf":"3364.24.08.0133.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\4- NOVA S.PEDRO VIRAC.mini.JPG","CódBrás_correto":"BR-22-3850"}	223850.00	Igreja	Desativado	PROPRIO	Av. Mário Trevenzoli, S/N	13056-190	\N	3	04996	13	004	395.85	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(antiga Av. Um)\r\nABERTURA EM 06/03/2011\r\nABERTURA EM 06/03/2011______DOUGLAS A. 16/3/11	{"CódContábil":"0980.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"Av. Mário Trevenzoli, S/N","CepImóvel":"13056-190","Zoneamento":null,"Receita":"3","Quarteirão":"04996","Quadra":"13","Lote":"004","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"395,85","ÁreaExcedente":"0,00","Observações":"(antiga Av. Um)\\r\\nABERTURA EM 06/03/2011\\r\\nABERTURA EM 06/03/2011______DOUGLAS A. 16/3/11","FotoPrincipal":null}	\N	\N	Av. Mário Trevenzoli, S/N, Campinas, SP - 13056-190	044.896.700
210	0980.01	93	4	3850	3364.24.08.0145.00000	2015-02-05 02:19:31.568926	2015-06-12 02:18:38.427464	f	f	\N	{"CódContábil":"0980.01","Bairro":"Jd. São Pedro de Viracopos","Distrito":null,"CódBrás":"22-38-50","CódIPTU":"044.896.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000039553","CódGrupo":"4","CódContador":"3850","CódCartograf":"3364.24.08.0145.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\4- NOVA S.PEDRO VIRAC.mini.JPG","CódBrás_correto":"BR-22-3850"}	223850.01	Estacionamento	Desativado	PROPRIO	Av. Mário Trevenzoli, S/N	13056-190	\N	3	04996	13	005	430.15	14.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(antiga Av. Um) PEDIR UNIFICAÇÃO CARNE - VERIFICAR\r\nABERTURA EM 06/03/2011______DOUGLAS A. 16/3/11	{"CódContábil":"0980.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"Av. Mário Trevenzoli, S/N","CepImóvel":"13056-190","Zoneamento":null,"Receita":"3","Quarteirão":"04996","Quadra":"13","Lote":"005","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"14,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"430,15","ÁreaExcedente":"0,00","Observações":"(antiga Av. Um) PEDIR UNIFICAÇÃO CARNE - VERIFICAR\\r\\nABERTURA EM 06/03/2011______DOUGLAS A. 16/3/11","FotoPrincipal":null}	\N	\N	Av. Mário Trevenzoli, S/N, Campinas, SP - 13056-190	044.896.900
208	0960.00	91	4	3781	0	2015-02-05 02:19:31.223681	2015-06-12 02:18:36.101093	t	t	\N	{"CódContábil":"0960.00","Bairro":"Jd. Monte Cristo","Distrito":null,"CódBrás":"22-37-81","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3781","CódCartograf":"0","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_MONTE_CRISTO.JPG","CódBrás_correto":"BR-22-3781"}	223781.00	Igreja	Em Funcionamento	PROPRIO	Av: Carlos Estela Neto, 164	13105-203	\N	\N	\N	 C	38	288.00	16.00	\N	\N	\N	\N	IGREJA	\N	\N	ESTE IMOVEL ESTA EM PROCESSO DE REGULARIZAÇÃO PELA COHAB, E ESTA SENDO PAGO EM 20 ANOS__________ACOMPANHAR.     DOUGLAS A. 18/6/2013	{"CódContábil":"0960.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av: Carlos Estela Neto, 164","CepImóvel":"13105-203","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":" C","Lote":"38","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"16","ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"288,00","ÁreaExcedente":null,"Observações":"ESTE IMOVEL ESTA EM PROCESSO DE REGULARIZAÇÃO PELA COHAB, E ESTA SENDO PAGO EM 20 ANOS__________ACOMPANHAR.     DOUGLAS A. 18/6/2013","FotoPrincipal":null}	-22.9378290000000007	-47.0778280999999978	Av: Carlos Estela Neto, 164, Campinas, SP - 13105-203	000.000.000
214	0990.00	94	3	4125	3162.24.44.0250.00000	2015-02-05 02:19:32.263403	2015-06-12 02:18:42.958481	t	t	\N	{"CódContábil":"0990.00","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001192662","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0250.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Igreja_mini.JPG","CódBrás_correto":"BR-22-4125"}	224125.00	Igreja	Em Funcionamento	PROPRIO	R. ALTINO JORGE PEREIRA, S/N	00000-000	03	\N	10477	J	001	197.85	9.02	\N	156.00	\N	\N	TERRENO	TERRITORIAL	\N	(R. Pedro Manoel de Oliveira, Nº 141 - CEP 13069-482) - MODIFICADO O NOME DA RUA A PEDIDO DO IR. ALLEX, DE: R: Altino Jorge Pereira, 141 (Ant. Rua 5 - CEP 13069-484) P/: R. Pedro Manoel de Oliveira,  Nº ?	{"CódContábil":"0990.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. ALTINO JORGE PEREIRA, S/N","CepImóvel":"00000-000","Zoneamento":"03","Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"001","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"9,02","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":null,"ÁreaTerreno":"197,85","ÁreaExcedente":"0,00","Observações":"(R. Pedro Manoel de Oliveira, Nº 141 - CEP 13069-482) - MODIFICADO O NOME DA RUA A PEDIDO DO IR. ALLEX, DE: R: Altino Jorge Pereira, 141 (Ant. Rua 5 - CEP 13069-484) P/: R. Pedro Manoel de Oliveira,  Nº ?","FotoPrincipal":null}	\N	\N	R. ALTINO JORGE PEREIRA, S/N, Campinas, SP - 00000-000	000.000.000
215	0990.01	94	3	4125	3162.24.44.0257.00000	2015-02-05 02:19:32.442788	2015-06-12 02:18:44.101222	t	f	\N	{"CódContábil":"0990.01","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001192672","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0257.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.01	Estacionamento	Em Funcionamento	PROPRIO	R. ALTINO JORGE PEREIRA, S/N	00000-000	\N	\N	10477	J	002	140.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R: Cinco)	{"CódContábil":"0990.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. ALTINO JORGE PEREIRA, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"002","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"140,00","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	\N	\N	R. ALTINO JORGE PEREIRA, S/N, Campinas, SP - 00000-000	000.000.000
217	0990.03	94	3	4125	3162.24.44.0271.00000	2015-02-05 02:19:32.807206	2015-06-12 02:18:46.356872	t	f	\N	{"CódContábil":"0990.03","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001192692","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0271.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.03	Estacionamento	Em Funcionamento	PROPRIO	R. ALTINO JORGE PEREIRA, S/N	00000-000	\N	\N	10477	J	004	140.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	\N	(R: Cinco)	{"CódContábil":"0990.03","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. ALTINO JORGE PEREIRA, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"004","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":null,"ÁreaTerreno":"140,00","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	\N	\N	R. ALTINO JORGE PEREIRA, S/N, Campinas, SP - 00000-000	000.000.000
219	0990.05	94	3	4125	3162.24.44.0210.00000	2015-02-05 02:19:33.133228	2015-06-12 02:18:48.706595	t	f	\N	{"CódContábil":"0990.05","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001193072","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0210.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.05	Estacionamento	Em Funcionamento	PROPRIO	R. AMANCIO JOSÉ JORGE, S/N	00000-000	\N	\N	10477	J	042	140.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R: Cinco)	{"CódContábil":"0990.05","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. AMANCIO JOSÉ JORGE, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"042","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"140,00","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	-22.8414256000000009	-47.1387558999999996	R. AMANCIO JOSÉ JORGE, S/N, Campinas, SP - 00000-000	000.000.000
220	0990.06	94	3	4125	3162.24.44.0217.00000	2015-02-05 02:19:33.335214	2015-06-12 02:18:49.837465	t	f	\N	{"CódContábil":"0990.06","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001193082","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0217.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.06	Estacionamento	Em Funcionamento	PROPRIO	R. AMANCIO JOSÉ JORGE, S/N	00000-000	\N	\N	10477	J	043	140.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(R: Cinco)	{"CódContábil":"0990.06","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. AMANCIO JOSÉ JORGE, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"043","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"140,00","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	-22.8414256000000009	-47.1387558999999996	R. AMANCIO JOSÉ JORGE, S/N, Campinas, SP - 00000-000	000.000.000
221	0990.07	94	3	4125	3162.24.44.0224.00000	2015-02-05 02:19:33.497586	2015-06-12 02:18:50.951218	t	f	\N	{"CódContábil":"0990.07","Bairro":"Jd. Mirassol","Distrito":null,"CódBrás":"22-41-25","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001193092","CódGrupo":"3","CódContador":"4125","CódCartograf":"3162.24.44.0224.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd Mirassol_Estac_mini.JPG","CódBrás_correto":"BR-00-0000"}	224125.07	Estacionamento	Em Funcionamento	PROPRIO	R. AMANCIO JOSÉ JORGE, S/N	00000-000	\N	\N	10477	J	044	189.91	8.24	\N	156.00	\N	\N	TERRENO	TERRITORIAL	\N	(R: Cinco)	{"CódContábil":"0990.07","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. AMANCIO JOSÉ JORGE, S/N","CepImóvel":"00000-000","Zoneamento":null,"Receita":null,"Quarteirão":"10477","Quadra":"J","Lote":"044","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"8,24","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":null,"ÁreaTerreno":"189,91","ÁreaExcedente":"0,00","Observações":"(R: Cinco)","FotoPrincipal":null}	-22.8414256000000009	-47.1387558999999996	R. AMANCIO JOSÉ JORGE, S/N, Campinas, SP - 00000-000	000.000.000
222	1001.00	102	4	2454	5124.61.58.0281.00000	2015-02-05 02:19:33.661185	2015-06-12 02:18:52.901306	t	f	\N	{"CódContábil":"1001.00","Bairro":"Jd. Novo Itaguaçu (processo desapropriação)","Distrito":null,"CódBrás":null,"CódIPTU":"045.753.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000265723","CódGrupo":"4","CódContador":"2454","CódCartograf":"5124.61.58.0281.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1001.00_JARDIM_NOVO_ITAGUAÇU_PROCESSO_DESAPROPRIAÇAO\\\\IMG_0669 - Mini.JPG","CódBrás_correto":"BR-00-0000"}	222454.00	Terreno	Desativado	PROPRIO	R. vinte e sete	13100-000	3	3	05548	28	008	250.00	10.00	\N	\N	\N	\N	TERRENO	TERRITORIAL	0.02	O terreno está em uso, porém não tem nada construido em cimao, uma pessoa estava apenas com alguns animais, não deu pra descer do carro porque o lugar é meio perigoso, fiz as fotos de dentro do carro\r\nmais nao tem nada de construção no terreno__ir. Jonas 15/7/13\r\nEm processo de desapropriação	{"CódContábil":"1001.00","Tipo":"Terreno","Andamento":"Desativado","Situação":"PROPRIO","EndereçoImóvel":"R. vinte e sete","CepImóvel":"13100-000","Zoneamento":"3","Receita":"3","Quarteirão":"05548","Quadra":"28","Lote":"008","CódLogradouro":"0.054.940","ÁreaGeoFreqLixo":"0","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"250","ÁreaExcedente":"0","Observações":"O terreno está em uso, porém não tem nada construido em cimao, uma pessoa estava apenas com alguns animais, não deu pra descer do carro porque o lugar é meio perigoso, fiz as fotos de dentro do carro\\r\\nmais nao tem nada de construção no terreno__ir. Jonas 15/7/13\\r\\nEm processo de desapropriação","FotoPrincipal":null}	-22.9125702999999987	-47.2325431000000009	R. vinte e sete, Campinas, SP - 13100-000	045.753.800
226	1040.00	\N	7	0009	3342.42.38.0747.00000	2015-02-05 02:19:34.385187	2015-06-12 02:18:58.082102	t	f	\N	{"CódContábil":"1040.00","Bairro":"Cidade Satelite Iris III (Barracao)","Distrito":null,"CódBrás":"980009","CódIPTU":"042.420.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000815063","CódGrupo":"7","CódContador":"0009","CódCartograf":"3342.42.38.0747.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1 - Barracao Sat. Iris_mini.JPG","CódBrás_correto":"BR-00-0003"}	220009.00	Barracão	Aguarda Constr	PROPRIO	R. Antonio Zancanella, S/N	13059-604	\N	3	04658	238	008	1250.00	25.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	1- SERA CONSTRUIDO UM BARRACAO PARA A SERRALHERIA E ABRIGO DAS MAQUINAS, ANDAIMES E EQUIPAMENTOS - DOUGLAS A. 11/08/10	{"CódContábil":"1040.00","Tipo":"Barracão","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Antonio Zancanella, S/N","CepImóvel":"13059-604","Zoneamento":null,"Receita":"3","Quarteirão":"04658","Quadra":"238","Lote":"008","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"1250,00","ÁreaExcedente":"0,00","Observações":"1- SERA CONSTRUIDO UM BARRACAO PARA A SERRALHERIA E ABRIGO DAS MAQUINAS, ANDAIMES E EQUIPAMENTOS - DOUGLAS A. 11/08/10","FotoPrincipal":null}	-22.9312640999999999	-47.154547100000002	R. Antonio Zancanella, S/N, Campinas, SP - 13059-604	042.420.900
228	1050.01	96	4	4346	5213.14.98.0058.00000	2015-02-05 02:19:34.733627	2015-06-12 02:19:00.718075	t	f	\N	{"CódContábil":"1050.01","Bairro":"Jd. Campo Belo I","Distrito":null,"CódBrás":"224346","CódIPTU":"046.546.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000097473","CódGrupo":"4","CódContador":"4346","CódCartograf":"5213.14.98.0058.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1050.01_JARDIM_CAMPO_BELO_I\\\\CAMPO BELO_ MINI.JPG","CódBrás_correto":"BR-22-4346"}	224346.01	Terreno	Aguarda Constr	PROPRIO	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N	13053-122	\N	\N	05247	L	001	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12	{"CódContábil":"1050.01","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N","CepImóvel":"13053-122","Zoneamento":null,"Receita":null,"Quarteirão":"05247","Quadra":"L","Lote":"001","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":"TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12","FotoPrincipal":null}	-23.0311684999999997	-47.1178109000000021	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N, Campinas, SP - 13053-122	046.546.500
255	1030.01	95	1	4389	3344.23.68.0050.00000	2015-02-05 02:19:39.229619	2015-06-12 02:19:35.098133	t	f	\N	{"CódContábil":"1030.01","Bairro":"Cidade Satelite Iris - Dunlop","Distrito":null,"CódBrás":"224389","CódIPTU":"042.676.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000003","CódGrupo":"1","CódContador":"4389","CódCartograf":"3344.23.68.0050.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1030.00_JOHN_BOYD_DUNLOP\\\\pat_1030.00_4389_fotos.fachada.2012_qd51_lt17.jpg","CódBrás_correto":"BR-22-4389"}	224389.01	Igreja	Em Funcionamento	USUCAPIAO	R. Pastor Samuel de Campos Chiminazzo, S/N	13059-688	\N	\N	04476	51	018	649.00	20.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	(Ant.R. 88) 1- Trata- se de um terreno adquirido por instrumento particular que será anexado ao LOTE 17 (1030.00) para se erguer um Templo, que não possui matricula, mas as transcriçoes do 3ºCartorio nº 12345 - 23470 - 23471.\r\n2- Na compra assumimos o Debito de I.P.T.U e demais taxas. A custa de Inventario correrá por conta da VENDEDORA.__(DOUGLAS A. 01/02/10)	{"CódContábil":"1030.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"R. Pastor Samuel de Campos Chiminazzo, S/N","CepImóvel":"13059-688","Zoneamento":null,"Receita":null,"Quarteirão":"04476","Quadra":"51","Lote":"018","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"649,00","ÁreaExcedente":"0,00","Observações":"(Ant.R. 88) 1- Trata- se de um terreno adquirido por instrumento particular que será anexado ao LOTE 17 (1030.00) para se erguer um Templo, que não possui matricula, mas as transcriçoes do 3ºCartorio nº 12345 - 23470 - 23471.\\r\\n2- Na compra assumimos o Debito de I.P.T.U e demais taxas. A custa de Inventario correrá por conta da VENDEDORA.__(DOUGLAS A. 01/02/10)","FotoPrincipal":null}	-22.9453488000000014	-47.143614300000003	R. Pastor Samuel de Campos Chiminazzo, S/N, Campinas, SP - 13059-688	042.676.700
248	1050.03	96	4	4346	5213.14.98.0078.00000	2015-02-05 02:19:38.087202	2015-06-12 02:19:26.939085	t	f	\N	{"CódContábil":"1050.03","Bairro":"Jd. Campo Belo I","Distrito":null,"CódBrás":"224346","CódIPTU":"046.546.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000097493","CódGrupo":"4","CódContador":"4346","CódCartograf":"5213.14.98.0078.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1050.01_JARDIM_CAMPO_BELO_I\\\\CAMPO BELO_ MINI.JPG","CódBrás_correto":"BR-22-4346"}	224346.03	Terreno	Aguarda Constr	PROPRIO	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N	13053-122	\N	\N	05247	L	003	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	2.03	TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12	{"CódContábil":"1050.03","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N","CepImóvel":"13053-122","Zoneamento":null,"Receita":null,"Quarteirão":"05247","Quadra":"L","Lote":"003","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"203%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":"TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12","FotoPrincipal":null}	-23.0311684999999997	-47.1178109000000021	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N, Campinas, SP - 13053-122	046.546.700
249	1050.04	96	4	4346	5213.14.98.0088.00000	2015-02-05 02:19:38.250289	2015-06-12 02:19:28.085118	t	f	\N	{"CódContábil":"1050.04","Bairro":"Jd. Campo Belo I","Distrito":null,"CódBrás":"224346","CódIPTU":"046.546.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000097503","CódGrupo":"4","CódContador":"4346","CódCartograf":"5213.14.98.0088.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1050.01_JARDIM_CAMPO_BELO_I\\\\CAMPO BELO_ MINI.JPG","CódBrás_correto":"BR-22-4346"}	224346.04	Terreno	Aguarda Constr	PROPRIO	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N	13053-122	\N	\N	05247	L	004	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12	{"CódContábil":"1050.04","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N","CepImóvel":"13053-122","Zoneamento":null,"Receita":null,"Quarteirão":"05247","Quadra":"L","Lote":"004","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":"TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12","FotoPrincipal":null}	-23.0311684999999997	-47.1178109000000021	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N, Campinas, SP - 13053-122	046.546.800
250	1050.05	96	4	4346	5213.14.98.0021.00000	2015-02-05 02:19:38.413666	2015-06-12 02:19:29.232372	t	f	\N	{"CódContábil":"1050.05","Bairro":"Jd. Campo Belo I","Distrito":null,"CódBrás":"224346","CódIPTU":"046.547.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000097513","CódGrupo":"4","CódContador":"4346","CódCartograf":"5213.14.98.0021.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1050.01_JARDIM_CAMPO_BELO_I\\\\CAMPO BELO_ MINI.JPG","CódBrás_correto":"BR-22-4346"}	224346.05	Terreno	Aguarda Constr	PROPRIO	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N	13053-122	\N	\N	05247	L	024	300.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12	{"CódContábil":"1050.05","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N","CepImóvel":"13053-122","Zoneamento":null,"Receita":null,"Quarteirão":"05247","Quadra":"L","Lote":"024","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":"TERRENO ADQUIRIDO EM 2608/2011 PARA A FUTURA CASA DE ORAÇAO__DOUGLAS A 30/01/12","FotoPrincipal":null}	-23.0311684999999997	-47.1178109000000021	R. DOUTOR MÁRIO JANUÁRIO MATALLO, S/N, Campinas, SP - 13053-122	046.547.000
231	1070.00	98	5	4295	00000000	2015-02-05 02:19:35.223214	2015-06-12 02:19:06.866264	f	f	\N	{"CódContábil":"1070.00","Bairro":"Pq. São Martinho","Distrito":null,"CódBrás":"224295","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000001","CódGrupo":"5","CódContador":"4295","CódCartograf":"00000000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\5 - Sala_Oracao_Sao_Martinho_mini.JPG","CódBrás_correto":"BR-22-4295"}	224295.00	Igreja	Em Funcionamento	CEDIDO	R. Roberto Frauendorf Galvão Miranda, nº 364	13040-720	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	5- Comprado o Lote 09 da Quadra Q (vide 1070.01)__DOUGLAS A. 05/01/11\r\n4- Até o momento está aprovada a compra de um lote para construção de um Templo, conforme Certidao da ATA de 16/08/2009 (Reun.Min.Regional)___DOUGLAS A 06/09/10\r\n3- A Cessão é por tempo indeterminado__DOUGLAS A 06/09/10\r\n2- O I.P.T.U é pago pelo proprietário (não há menção no Constrato de Cessão!)__DOUGLAS A 06/09/10\r\n1- Neste local cedido, os cultos se realizam no abrigo lateral da residencia e foi oficializado em 2009 __DOUGLAS A 06/09/10	{"CódContábil":"1070.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Roberto Frauendorf Galvão Miranda, nº 364","CepImóvel":"13040-720","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"0","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"0","ÁreaExcedente":null,"Observações":"5- Comprado o Lote 09 da Quadra Q (vide 1070.01)__DOUGLAS A. 05/01/11\\r\\n4- Até o momento está aprovada a compra de um lote para construção de um Templo, conforme Certidao da ATA de 16/08/2009 (Reun.Min.Regional)___DOUGLAS A 06/09/10\\r\\n3- A Cessão é por tempo indeterminado__DOUGLAS A 06/09/10\\r\\n2- O I.P.T.U é pago pelo proprietário (não há menção no Constrato de Cessão!)__DOUGLAS A 06/09/10\\r\\n1- Neste local cedido, os cultos se realizam no abrigo lateral da residencia e foi oficializado em 2009 __DOUGLAS A 06/09/10","FotoPrincipal":null}	-22.952201500000001	-47.0550471999999971	R. Roberto Frauendorf Galvão Miranda, nº 364, Campinas, SP - 13040-720	000.000.000
233	1080.01	99	5	4348	3442.12.96.0209.00000	2015-02-05 02:19:35.566554	2015-06-12 02:19:09.421018	t	f	\N	{"CódContábil":"1080.01","Bairro":"Jd. das Andorinhas","Distrito":null,"CódBrás":"224348","CódIPTU":"043.292.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000183601","CódGrupo":"5","CódContador":"4348","CódCartograf":"3442.12.96.0209.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-4348"}	224348.01	Terreno	Aguarda Constr	PROPRIO	Rua PAMPAS, 0	13101-410	\N	\N	03424	8	18	310.00	10.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	PARA CONSTRUÇAO DE SALA DE ORAÇAO	{"CódContábil":"1080.01","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"Rua PAMPAS, 0","CepImóvel":"13101-410","Zoneamento":null,"Receita":null,"Quarteirão":"03424","Quadra":"8","Lote":"18","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"310,00","ÁreaExcedente":null,"Observações":"PARA CONSTRUÇAO DE SALA DE ORAÇAO","FotoPrincipal":null}	-22.9189895999999997	-47.0210410999999979	Rua PAMPAS, 0, Campinas, SP - 13101-410	043.292.200
236	0870.04	82	1	3344	3352.31.07.0299.01001	2015-02-05 02:19:36.097152	2015-06-12 02:19:12.834757	t	f	\N	{"CódContábil":"0870.04","Bairro":"Pq. Res. São Bento (locado)","Distrito":null,"CódBrás":"223344","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001389763","CódGrupo":"1","CódContador":"3344","CódCartograf":"3352.31.07.0299.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\SAO BENTO_LOCADO.jpg","CódBrás_correto":null}	223344.04	Casa Residencial	Em Funcionamento	ALUGADO	R. JULIO ROALD MARTIN JONSSON, 82	13058-146	\N	0	9811	L	32	151.80	6.60	39.59	\N	\N	\N	PREDIAL	RH 1.0	0.00	DEPOSITO DE MATERIAIS E REFEITÓRIO DA COZINHA DURANTE O PERÍODO DE CONSTRUÇÃO DO TEMPLO.	{"CódContábil":"0870.04","Tipo":"Casa Residencial","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. JULIO ROALD MARTIN JONSSON, 82","CepImóvel":"13058-146","Zoneamento":null,"Receita":"0","Quarteirão":"9811","Quadra":"L","Lote":"32","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"6,60","ÁreaPrincipal":"39,59","ÁreaDependência":"0","TipoPadrão":"PREDIAL","CategoriaImóvel":"RH 1.0","Alícota":"0,40","ÁreaTerreno":"151,80","ÁreaExcedente":"0","Observações":"DEPOSITO DE MATERIAIS E REFEITÓRIO DA COZINHA DURANTE O PERÍODO DE CONSTRUÇÃO DO TEMPLO.","FotoPrincipal":null}	-22.9607509000000007	-47.198539199999999	R. JULIO ROALD MARTIN JONSSON, 82, Campinas, SP - 13058-146	000.000.000
235	1100.00	\N	3	0010	000000	2015-02-05 02:19:35.933643	2015-06-12 02:19:11.533373	t	f	\N	{"CódContábil":"1100.00","Bairro":"Jd. Florida (Barao Geraldo)","Distrito":null,"CódBrás":"990010","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"3","CódContador":"0010","CódCartograf":"000000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1100.00_JD_FLORIDA\\\\1100.00_JD.FLORIDA_fotos.sala (3) - MINI.jpg","CódBrás_correto":"BR-99-0010"}	220010.00	Igreja	Em Funcionamento	CEDIDO	R. Fonte das Flores, 77	13084-970	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Trata-se de uma sala de oração p/ cultos de evangelizaçao no interior de uma clínica de recuperação de dependentes químicos (Superação 22 comunidade Terapêutica) - Cultos iniciados em 20/03/2012	{"CódContábil":"1100.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Fonte das Flores, 77","CepImóvel":"13084-970","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Trata-se de uma sala de oração p/ cultos de evangelizaçao no interior de uma clínica de recuperação de dependentes químicos (Superação 22 comunidade Terapêutica) - Cultos iniciados em 20/03/2012","FotoPrincipal":null}	-22.7690577999999988	-47.0840472000000005	R. Fonte das Flores, 77, Campinas, SP - 13084-970	000.000.000
238	0720.01	77	4	3641	3362.13.95.0320.00000	2015-02-05 02:19:36.439636	2015-06-12 02:19:14.884754	t	f	\N	{"CódContábil":"0720.01","Bairro":"Pq. Universitário de Viracopos","Distrito":null,"CódBrás":"22-36-41","CódIPTU":"041.923.250","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000592873","CódGrupo":"4","CódContador":"3641","CódCartograf":"3362.13.95.0320.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0720.01_PARQUE_UNIVERSITARIO_DE_VIRACOPOS\\\\pat_0720.01_3641_foto.frente_qd6_lt3.jpg","CódBrás_correto":"BR-22-3641"}	223641.01	Estacionamento	Em Funcionamento	PROPRIO	R. Anaturi	13056-517	\N	3	04375	6	3	290.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	COMPRADO EM 08/2013	{"CódContábil":"0720.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Anaturi","CepImóvel":"13056-517","Zoneamento":null,"Receita":"3","Quarteirão":"04375","Quadra":"6","Lote":"3","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"290,00","ÁreaExcedente":"0","Observações":"COMPRADO EM 08/2013","FotoPrincipal":null}	-22.9648223000000016	-47.1527372999999983	R. Anaturi, Campinas, SP - 13056-517	041.923.250
137	0670.01	28	2	1992	3164.42.37.0316.00000	2015-02-05 02:19:19.094872	2015-06-12 02:17:07.459494	t	f	\N	{"CódContábil":"0670.01","Bairro":"Pq. Maria Helena","Distrito":null,"CódBrás":"22-19-92","CódIPTU":"055.005.896","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000824462","CódGrupo":"2","CódContador":"1992","CódCartograf":"3164.42.37.0316.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\Pq Maria Helena - Estacionamnto_mini.JPG","CódBrás_correto":"BR-22-1992"}	221992.01	Estacionamento	Em Funcionamento	PROPRIO	R. Mirella Cristina de Barros (R.  Dois)	13067-842	11	3	15067	3	12	1000.00	28.00	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	NÃO EXISTE CONSTRUÇAO!	{"CódContábil":"0670.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Mirella Cristina de Barros (R.  Dois)","CepImóvel":"13067-842","Zoneamento":"11","Receita":"3","Quarteirão":"15067","Quadra":"3","Lote":"12","CódLogradouro":"2871","ÁreaGeoFreqLixo":"301","TestadaTerreno":"28","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,60%","ÁreaTerreno":"1000,00","ÁreaExcedente":"0","Observações":"NÃO EXISTE CONSTRUÇAO!","FotoPrincipal":null}	-22.8645764000000007	-47.1495847999999995	R. Mirella Cristina de Barros (R.  Dois), Campinas, SP - 13067-842	055.005.896
169	0790.02	3	4	0308	3451.51.79.0700.01001	2015-02-05 02:19:24.52837	2015-06-12 02:17:47.460197	t	t	\N	{"CódContábil":"0790.02","Bairro":"Vl. Aeroporto (Maria Rosa)","Distrito":null,"CódBrás":"220308","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001726133","CódGrupo":"4","CódContador":"0308","CódCartograf":"3451.51.79.0700.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\VILA_AEROPORTO_MARIA_ROSA.JPG","CódBrás_correto":"BR-22-0308"}	220308.02	Igreja	Em Funcionamento	PROPRIO	Av. Jacauna, 54 (antiga Av Nove - Vl Aeroporto 2a e 3a Glebas - s/ denominação)	13054-107	\N	0	4139	K	09 Unif	1080.00	30.00	239.78	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	em 2013- A UNIFICAÇÃO DOS LOTES FOI EFETUADA ATRAVÉS DO PROTOCOLO 07/11/10208. - SE NÃO VIER UNIFICADO, IMPUGNAR.\r\nImovel oriundo da unificação dos LT 09 e 10, da QD. K, extinguindo os das Matriculas 5404 e 7421 (0790.00 e 0790.01) _DOUGLAS A. 06/07/09	{"CódContábil":"0790.02","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Jacauna, 54 (antiga Av Nove - Vl Aeroporto 2a e 3a Glebas - s/ denominação)","CepImóvel":"13054-107","Zoneamento":null,"Receita":"0","Quarteirão":"4139","Quadra":"K","Lote":"09 Unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"30","ÁreaPrincipal":"239,78","ÁreaDependência":null,"TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1080,00","ÁreaExcedente":null,"Observações":"em 2013- A UNIFICAÇÃO DOS LOTES FOI EFETUADA ATRAVÉS DO PROTOCOLO 07/11/10208. - SE NÃO VIER UNIFICADO, IMPUGNAR.\\r\\nImovel oriundo da unificação dos LT 09 e 10, da QD. K, extinguindo os das Matriculas 5404 e 7421 (0790.00 e 0790.01) _DOUGLAS A. 06/07/09","FotoPrincipal":null}	-22.9711548000000008	-47.1248894000000007	Av. Jacauna, 54 (antiga Av Nove - Vl Aeroporto 2a e 3a Glebas - s/ denominação), Campinas, SP - 13054-107	000.000.000
240	1070.04	98	5	4295	000000000000	2015-02-05 02:19:36.765676	2015-06-12 02:19:16.943155	t	t	\N	{"CódContábil":"1070.04","Bairro":"Pq. São Martinho - Salão","Distrito":null,"CódBrás":"224295","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"5","CódContador":"4295","CódCartograf":"000000000000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":null}	224295.04	Igreja	Em Funcionamento	CEDIDO	R. TENENTE PEDRO BUENO, Nº 125	13040-707	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	SALÃO CEDIDO ATÉ O TERMINO DA CONSTRUÇÃO____DOUGLAS A. 30/04/2014	{"CódContábil":"1070.04","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. TENENTE PEDRO BUENO, Nº 125","CepImóvel":"13040-707","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"SALÃO CEDIDO ATÉ O TERMINO DA CONSTRUÇÃO____DOUGLAS A. 30/04/2014","FotoPrincipal":null}	-22.9540252000000002	-47.0580521999999988	R. TENENTE PEDRO BUENO, Nº 125, Campinas, SP - 13040-707	000.000.000
247	1070.01	98	5	4295	3443.41.83.0095.00000	2015-02-05 02:19:37.923088	2015-06-12 02:19:25.796535	t	f	\N	{"CódContábil":"1070.01","Bairro":"Pq. São Martinho","Distrito":null,"CódBrás":"224295","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001665423","CódGrupo":"5","CódContador":"4295","CódCartograf":"3443.41.83.0095.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1070.03_PARQUE_SAO_MARTINHO\\\\Foto_frontal_1070.03. MINI.png","CódBrás_correto":"BR-22-4295"}	224295.01	Terreno	Aguarda Constr	PROPRIO	R. Tenente Antonio Silva Pires, 154	13040-708	\N	0	9387	Q	09	365.43	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	EXTINTO - ANEXADO\r\nRegistrado a compra deste terreno em 03/12/2010 para a futura instalação da Sala de Oraçao do Pq. São Martinho___Douglas A. 05/01/11	{"CódContábil":"1070.01","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Tenente Antonio Silva Pires, 154","CepImóvel":"13040-708","Zoneamento":null,"Receita":"0","Quarteirão":"9387","Quadra":"Q","Lote":"09","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,30%","ÁreaTerreno":"365,43","ÁreaExcedente":null,"Observações":"EXTINTO - ANEXADO\\r\\nRegistrado a compra deste terreno em 03/12/2010 para a futura instalação da Sala de Oraçao do Pq. São Martinho___Douglas A. 05/01/11","FotoPrincipal":null}	-22.9518322999999995	-47.0574887000000004	R. Tenente Antonio Silva Pires, 154, Campinas, SP - 13040-708	000.000.000
83	0440.01	37	1	0306	3431.52.00.0001.01001	2015-02-05 02:19:09.743955	2015-06-12 02:15:58.046983	t	f	\N	{"CódContábil":"0440.01","Bairro":"Jd. Novo Campos Elíseos","Distrito":null,"CódBrás":"22-03-06","CódIPTU":"046.715.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001522513","CódGrupo":"1","CódContador":"0306","CódCartograf":"3431.52.00.0001.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0440.01_JARDIM_NOVO_CAMPOS_ELISEOS\\\\pat_0440.01_0306_foto.frente_qd13_lt07sub.jpg","CódBrás_correto":"BR-22-0306"}	220306.01	Estacionamento	Em Funcionamento	PROPRIO	R. Michael Robert Kaam, 97	13060-410	\N	2	03613	13	007-SUB	353.04	18.80	93.50	156.00	\N	\N	RH-2.0	PREDIAL	0.00	END.CORRETO R. Michael Robert Kaam, 411___DOUGLAS 16/11/13	{"CódContábil":"0440.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Michael Robert Kaam, 97","CepImóvel":"13060-410","Zoneamento":null,"Receita":"2","Quarteirão":"03613","Quadra":"13","Lote":"007-SUB","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"18,80","ÁreaPrincipal":"93,50","ÁreaDependência":null,"TipoPadrão":"RH-2.0","CategoriaImóvel":"PREDIAL","Alícota":"0,4%","ÁreaTerreno":"353,04","ÁreaExcedente":"0","Observações":"END.CORRETO R. Michael Robert Kaam, 411___DOUGLAS 16/11/13","FotoPrincipal":null}	-22.9316345999999989	-47.1070108999999988	R. Michael Robert Kaam, 97, Campinas, SP - 13060-410	046.715.900
95	0480.04	38	5	0286	3441.52.56.0277.01001	2015-02-05 02:19:11.955827	2015-06-12 02:16:12.974366	t	f	\N	{"CódContábil":"0480.04","Bairro":"Jd. dos Oliveiras","Distrito":null,"CódBrás":"220286","CódIPTU":"025.638.800","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001153253","CódGrupo":"5","CódContador":"0286","CódCartograf":"3441.52.56.0277.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0480.04_JARDIM_DOS_OLIVEIRAS\\\\FOTO FRENTE.jpg","CódBrás_correto":null}	220286.04	Estacionamento	Em Reforma	PROPRIO	AV. MIRASSOL, 74	13043-300	\N	2	1819	H	28-A	240.00	10.00	169.64	156.00	\N	\N	PREDIAL	RH-2.0	0.00	COMPRADO EM 2013	{"CódContábil":"0480.04","Tipo":"Estacionamento","Andamento":"Em Reforma","Situação":"PROPRIO","EndereçoImóvel":"AV. MIRASSOL, 74","CepImóvel":"13043-300","Zoneamento":null,"Receita":"2","Quarteirão":"1819","Quadra":"H","Lote":"28-A","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"169,64","ÁreaDependência":"0","TipoPadrão":"PREDIAL","CategoriaImóvel":"RH-2.0","Alícota":"0,60%","ÁreaTerreno":"240,00","ÁreaExcedente":"0","Observações":"COMPRADO EM 2013","FotoPrincipal":null}	-22.9284342999999993	-47.0444390999999982	AV. MIRASSOL, 74, Campinas, SP - 13043-300	025.638.800
165	0770.03	79	4	4074	3434.53.68.0239.00000	2015-02-05 02:19:23.872933	2015-06-12 02:17:42.439059	t	t	\N	{"CódContábil":"0770.03","Bairro":"Jd. Icarai ( Lago III)","Distrito":null,"CódBrás":"224074","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001779953","CódGrupo":"4","CódContador":"4074","CódCartograf":"3434.53.68.0239.00000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_ICARAI_2.jpg","CódBrás_correto":"BR-22-4074"}	224074.03	Igreja	Em Funcionamento	PROPRIO	Av. Jose Christovão Gonçalves	13051-407	\N	\N	6532	25	11 UNIF	946.04	24.50	119.11	\N	\N	\N	IGREJA	\N	\N	1- TERRENO UNIFICADO AO IMOVEL 0770.01 e 0770.02 EM 17/05/2010	{"CódContábil":"0770.03","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Jose Christovão Gonçalves","CepImóvel":"13051-407","Zoneamento":null,"Receita":null,"Quarteirão":"6532","Quadra":"25","Lote":"11 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"24,50","ÁreaPrincipal":"119,11","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"946,04","ÁreaExcedente":null,"Observações":"1- TERRENO UNIFICADO AO IMOVEL 0770.01 e 0770.02 EM 17/05/2010","FotoPrincipal":null}	-22.9523761999999998	-47.0769272000000001	Av. Jose Christovão Gonçalves, Campinas, SP - 13051-407	000.000.000
237	0650.01	23	1	0291	3433.52.27.0060.01001	2015-02-05 02:19:36.260111	2015-06-12 02:19:13.622947	t	f	\N	{"CódContábil":"0650.01","Bairro":"Pq. Ipiranga","Distrito":null,"CódBrás":"220291","CódIPTU":"046.203.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"1","CódContador":"0291","CódCartograf":"3433.52.27.0060.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO_N\\\\Bens IMOVEIS\\\\220291_FOTO ESTACIONAMENTO PQ IPIRANGA_12-2014.jpg","CódBrás_correto":null}	220291.01	Estacionamento	Em Reforma	PROPRIO	R. Valdemir Ferrarezi, 5/7	\N	\N	\N	3390	H	07	479.00	10.96	130.00	\N	\N	\N	IGREJA	\N	\N	ESTA A SER DEMOLIDO AS CASAS...ALVARA 1900/2014\r\n* FEITO CONTRATO DE COMPROMISSO DE VENDA E COMPRA EM 02/12/2013 E A ESCRITURA SE DARÁ APÓS A DESOCUPAÇÃO DOS INQUILINOS EM 01/03/2014.	{"CódContábil":"0650.01","Tipo":"Estacionamento","Andamento":"Em Reforma","Situação":"PROPRIO","EndereçoImóvel":"R. Valdemir Ferrarezi, 5/7","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":"3390","Quadra":"H","Lote":"07","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"10,96","ÁreaPrincipal":"130,00","ÁreaDependência":"0","TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"479,00","ÁreaExcedente":"0","Observações":"ESTA A SER DEMOLIDO AS CASAS...ALVARA 1900/2014\\r\\n* FEITO CONTRATO DE COMPROMISSO DE VENDA E COMPRA EM 02/12/2013 E A ESCRITURA SE DARÁ APÓS A DESOCUPAÇÃO DOS INQUILINOS EM 01/03/2014.","FotoPrincipal":null}	\N	\N	\N	046.203.100
98	0490.01	73	1	3346	3431.44.51.0450.01001	2015-02-05 02:19:12.509506	2015-06-12 02:16:16.29166	f	f	\N	{"CódContábil":"0490.01","Bairro":"Jd. Santa Lúcia","Distrito":null,"CódBrás":"22-33-46","CódIPTU":"047.280.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000173823","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.44.51.0450.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3346"}	223346.01	Estacionamento	Em Funcionamento	PROPRIO	R. Cabo Verde, 302	13060-492	01	3	03993	45	008-UNI	623.20	20.00	439.91	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	TERRITORIAL	0.01	1- DESATIVADO- Este terreno foi anexado ao lote 21 (somente na P.M.C, pois o lote 21 teve problemas de legalização do documento de propriedade), gerando o imóvel 0490.07_____DOUGLAS A. 15/03/10	{"CódContábil":"0490.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Cabo Verde, 302","CepImóvel":"13060-492","Zoneamento":"01","Receita":"3","Quarteirão":"03993","Quadra":"45","Lote":"008-UNI","CódLogradouro":"1428","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"439,91","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"TERRITORIAL","Alícota":"1,3%","ÁreaTerreno":"623,20","ÁreaExcedente":"0","Observações":"1- DESATIVADO- Este terreno foi anexado ao lote 21 (somente na P.M.C, pois o lote 21 teve problemas de legalização do documento de propriedade), gerando o imóvel 0490.07_____DOUGLAS A. 15/03/10","FotoPrincipal":null}	-22.9364880999999983	-47.1192643999999987	R. Cabo Verde, 302, Campinas, SP - 13060-492	047.280.100
185	0880.00	83	4	3527	3364.54.28.0024.01001	2015-02-05 02:19:27.146435	2015-06-12 02:18:06.617445	t	t	\N	{"CódContábil":"0880.00","Bairro":"Jd. Planalto de Viracopos","Distrito":null,"CódBrás":"223527","CódIPTU":"047.775.400","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001186423","CódGrupo":"4","CódContador":"3527","CódCartograf":"3364.54.28.0024.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_PLANALTO_DE_VIRACOPOS.JPG","CódBrás_correto":"BR-22-3527"}	223527.00	Igreja	Em Funcionamento	PROPRIO	Av. Amador Bicudo Teixeira, 112	13056-010	\N	3	5117	13	24	450.00	12.10	224.66	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	Providênciando  Imunidade	{"CódContábil":"0880.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Amador Bicudo Teixeira, 112","CepImóvel":"13056-010","Zoneamento":null,"Receita":"3","Quarteirão":"5117","Quadra":"13","Lote":"24","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,10","ÁreaPrincipal":"224,66","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"450,00","ÁreaExcedente":"0","Observações":"Providênciando  Imunidade","FotoPrincipal":null}	-22.9955877999999991	-47.1403502000000003	Av. Amador Bicudo Teixeira, 112, Campinas, SP - 13056-010	047.775.400
96	0480.05	38	5	0286	000000000000000	2015-02-05 02:19:12.120701	2015-06-12 02:16:13.778334	t	f	\N	{"CódContábil":"0480.05","Bairro":"Jd. dos Oliveiras","Distrito":null,"CódBrás":"220286","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000003","CódGrupo":"5","CódContador":"0286","CódCartograf":"000000000000000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0480.05_JARDIM_DOS_OLIVEIRAS\\\\FOTO FRENTE.jpg","CódBrás_correto":null}	220286.05	Estacionamento	Em Funcionamento	ALUGADO	AV FRANCISCO DE PAULA SOUZA, 965	\N	\N	\N	1819	H	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	LOCAÇAO - ADM E PGTO EFETUADO PELA CASA DE ORAÇÃO DO JD DAS OLIVEIRAS; OS RECIBOS DOS PAGAMENTOS ESTÃO NA TESOURARIA, JUNTO DA COLETA MENSAL.	{"CódContábil":"0480.05","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"AV FRANCISCO DE PAULA SOUZA, 965","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":"1819","Quadra":"H","Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"LOCAÇAO - ADM E PGTO EFETUADO PELA CASA DE ORAÇÃO DO JD DAS OLIVEIRAS; OS RECIBOS DOS PAGAMENTOS ESTÃO NA TESOURARIA, JUNTO DA COLETA MENSAL.","FotoPrincipal":null}	\N	\N	\N	000.000.000
149	0710.02	54	3	0298	3254.62.60.0313.01001	2015-02-05 02:19:21.088988	2015-06-12 02:17:22.701814	t	t	\N	{"CódContábil":"0710.02","Bairro":"Pq. Taquaral","Distrito":null,"CódBrás":"220298","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000819592","CódGrupo":"3","CódContador":"0298","CódCartograf":"3254.62.60.0313.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Pq Taquaral_Igreja_mini.JPG","CódBrás_correto":"BR-22-0298"}	220298.02	Igreja	Em Funcionamento	PROPRIO	R. Quintino de Paula Maudonet, 98	13087-610	\N	\N	00975	11A	23 UNIF	1060.35	30.00	286.07	301.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	TERRENO ORIUNDO DA UNIFICAÇAO DOS LOTES 23, 24 E 25._____DOUGLAS A 20/05/2013	{"CódContábil":"0710.02","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Quintino de Paula Maudonet, 98","CepImóvel":"13087-610","Zoneamento":null,"Receita":null,"Quarteirão":"00975","Quadra":"11A","Lote":"23 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"30","ÁreaPrincipal":"286,07","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1060,35","ÁreaExcedente":"0","Observações":"TERRENO ORIUNDO DA UNIFICAÇAO DOS LOTES 23, 24 E 25._____DOUGLAS A 20/05/2013","FotoPrincipal":null}	-22.8700550000000007	-47.0647434999999987	R. Quintino de Paula Maudonet, 98, Campinas, SP - 13087-610	000.000.000
153	0730.01	78	1	3229	3334.31.95.0223.01001	2015-02-05 02:19:21.763058	2015-06-12 02:17:27.425572	t	t	\N	{"CódContábil":"0730.01","Bairro":"Pq. Valença II","Distrito":null,"CódBrás":"22-32-29","CódIPTU":"055.067.815","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001515023","CódGrupo":"1","CódContador":"3229","CódCartograf":"3334.31.95.0223.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\PARQUE_VALENCA.jpg","CódBrás_correto":"BR-22-3229"}	223229.01	Igreja	Em Funcionamento	PROPRIO	R. Daniela Perez, 226	13058-578	\N	3	08219	P	20 unif	782.63	30.00	343.97	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0730.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Daniela Perez, 226","CepImóvel":"13058-578","Zoneamento":null,"Receita":"3","Quarteirão":"08219","Quadra":"P","Lote":"20 unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"30,00","ÁreaPrincipal":"343,97","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"782,63","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9407102000000016	-47.1943945000000014	R. Daniela Perez, 226, Campinas, SP - 13058-578	055.067.815
172	0800.02	2	4	0313	3362.62.84.0036.00000	2015-02-05 02:19:25.014793	2015-06-12 02:17:51.286776	t	f	\N	{"CódContábil":"0800.02","Bairro":"Jd. Aeroporto (R. Cairí)","Distrito":null,"CódBrás":"220313","CódIPTU":"041.989.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"4","CódContador":"0313","CódCartograf":"3362.62.84.0036.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\jd. aeroporto_cairiestac..jpg","CódBrás_correto":"BR-22-0313"}	220313.02	Estacionamento	Em Funcionamento	CEDIDO	R. Cairi, 0	13054-113	03	3	4202	46	17	348.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	TERRENO EM COMODATO, NA ESQUINA DA FRENTE DO TEMPLO, AO LADO DO ESTACIONAMENTO DA CCB\r\nCCB RESPONSAVEL PELO CARNE DE I.P.T.U, AGUA E LUZ.	{"CódContábil":"0800.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"CEDIDO","EndereçoImóvel":"R. Cairi, 0","CepImóvel":"13054-113","Zoneamento":"03","Receita":"3","Quarteirão":"4202","Quadra":"46","Lote":"17","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12,00","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"348,00","ÁreaExcedente":null,"Observações":"TERRENO EM COMODATO, NA ESQUINA DA FRENTE DO TEMPLO, AO LADO DO ESTACIONAMENTO DA CCB\\r\\nCCB RESPONSAVEL PELO CARNE DE I.P.T.U, AGUA E LUZ.","FotoPrincipal":null}	-22.975924599999999	-47.1265604999999965	R. Cairi, 0, Campinas, SP - 13054-113	041.989.900
246	1070.02	98	5	4295	3443.41.83.0105.00000	2015-02-05 02:19:37.761582	2015-06-12 02:19:24.684073	t	f	\N	{"CódContábil":"1070.02","Bairro":"Pq. São Martinho","Distrito":null,"CódBrás":"224295","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001874843","CódGrupo":"5","CódContador":"4295","CódCartograf":"3443.41.83.0105.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\1070.03_PARQUE_SAO_MARTINHO\\\\Foto_frontal_1070.03. MINI.png","CódBrás_correto":"BR-22-4295"}	224295.02	Terreno	Aguarda Constr	PROPRIO	R. Tenente Antonio Silva Pires, 154	13040-708	\N	\N	09387	Q	10	329.29	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	EXTINTO - ANEXADO\r\nRegistrado a compra deste terreno em 27/12/2011 para a futura instalação da Sala de Oraçao do Pq. São Martinho___Douglas A. 15/02/2012	{"CódContábil":"1070.02","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Tenente Antonio Silva Pires, 154","CepImóvel":"13040-708","Zoneamento":null,"Receita":null,"Quarteirão":"09387","Quadra":"Q","Lote":"10","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,30%","ÁreaTerreno":"329,29","ÁreaExcedente":"0","Observações":"EXTINTO - ANEXADO\\r\\nRegistrado a compra deste terreno em 27/12/2011 para a futura instalação da Sala de Oraçao do Pq. São Martinho___Douglas A. 15/02/2012","FotoPrincipal":null}	-22.9518322999999995	-47.0574887000000004	R. Tenente Antonio Silva Pires, 154, Campinas, SP - 13040-708	000.000.000
139	0680.01	102	3	3640	3244.22.73.0044.00000	2015-02-05 02:19:19.440331	2015-06-12 02:17:09.499302	f	f	\N	{"CódContábil":"0680.01","Bairro":"Pq. dos Pomares (vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"055.056.998","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000569781","CódGrupo":"3","CódContador":"3640","CódCartograf":"3244.22.73.0044.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	223640.01	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. Joaquim da Silva Alheio	13098-003	\N	3	07987	G	003	484.11	14.67	\N	156.00	\N	\N	TERRENO	\N	0.03	Vendido	{"CódContábil":"0680.01","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Joaquim da Silva Alheio","CepImóvel":"13098-003","Zoneamento":null,"Receita":"3","Quarteirão":"07987","Quadra":"G","Lote":"003","CódLogradouro":"103.986","ÁreaGeoFreqLixo":"156 d/a","TestadaTerreno":"14,67","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno sem construção","CategoriaImóvel":null,"Alícota":"3","ÁreaTerreno":"484,11","ÁreaExcedente":"0","Observações":"Vendido","FotoPrincipal":null}	-22.8152870000000014	-47.0123975999999999	R. Joaquim da Silva Alheio, Campinas, SP - 13098-003	055.056.998
194	0910.01	86	2	3920	3322.51.12.0099.01001	2015-02-05 02:19:28.868407	2015-06-12 02:18:17.948112	t	t	\N	{"CódContábil":"0910.01","Bairro":"Pq. Santa Bárbara","Distrito":null,"CódBrás":"22-39-20","CódIPTU":"055.044.779","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001394673","CódGrupo":"2","CódContador":"3920","CódCartograf":"3322.51.12.0099.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\Pq Santa Barbara - Construçao_mini.JPG","CódBrás_correto":"BR-22-3920"}	223920.01	Igreja	Em Funcionamento	PROPRIO	Av. José Pereira Júnior, 96	13064410	\N	3	07826	K	001	300.00	10.00	309.65	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0910.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. José Pereira Júnior, 96","CepImóvel":"13064410","Zoneamento":null,"Receita":"3","Quarteirão":"07826","Quadra":"K","Lote":"001","CódLogradouro":"99,333","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"309,65","ÁreaDependência":"0,00","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"300,00","ÁreaExcedente":"0,00","Observações":null,"FotoPrincipal":null}	-22.8899685999999996	-47.1456596000000019	Av. José Pereira Júnior, 96, Campinas, SP - 13064410	055.044.779
207	0950.01	90	4	3752	5123.34.73.0327.00000	2015-02-05 02:19:31.043652	2015-06-12 02:18:34.82211	f	f	\N	{"CódContábil":"0950.01","Bairro":"Ch. Pouso Alegre","Distrito":null,"CódBrás":"22-37-52","CódIPTU":"055.007.774","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000837213","CódGrupo":"4","CódContador":"3752","CódCartograf":"5123.34.73.0327.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\CHACARA_POUSO_ALEGRE.JPG","CódBrás_correto":"BR-22-3752"}	223752.01	Igreja	Desativado	DEVOLVIDO/VENDIDO	Via Servidão Dois (Chac. Pouso Alegre PRC5123-3)	13054-990	\N	3	15131	G	10	1196.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.26	CHACARA ALVORADA	{"CódContábil":"0950.01","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"Via Servidão Dois (Chac. Pouso Alegre PRC5123-3)","CepImóvel":"13054-990","Zoneamento":null,"Receita":"3","Quarteirão":"15131","Quadra":"G","Lote":"10","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2.6%","ÁreaTerreno":"1196,00","ÁreaExcedente":"0","Observações":"CHACARA ALVORADA","FotoPrincipal":null}	\N	\N	Via Servidão Dois (Chac. Pouso Alegre PRC5123-3), Campinas, SP - 13054-990	055.007.774
200	0920.03	100	3	0305	3424.11.62.0410.01001	2015-02-05 02:19:29.885796	2015-06-12 02:18:26.145922	t	t	\N	{"CódContábil":"0920.03","Bairro":"Vl. Brandina","Distrito":null,"CódBrás":"220305","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001083261","CódGrupo":"3","CódContador":"0305","CódCartograf":"3424.11.62.0410.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0920.03_VILA_BRANDINA\\\\FACHADA_OUT.2013 - Cópia.jpg","CódBrás_correto":null}	220305.03	Igreja	Em Funcionamento	PROPRIO	R. Francisco Mesquita, 115	13092-511	0	0	03363	H	009Unif	770.00	28.00	355.94	301.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	ORIUNDO DA UNIFICAÇAO DOS LOTES 9 e 10.	{"CódContábil":"0920.03","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Francisco Mesquita, 115","CepImóvel":"13092-511","Zoneamento":"0","Receita":"0","Quarteirão":"03363","Quadra":"H","Lote":"009Unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"28,00","ÁreaPrincipal":"355,94","ÁreaDependência":null,"TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,30%","ÁreaTerreno":"770,00","ÁreaExcedente":null,"Observações":"ORIUNDO DA UNIFICAÇAO DOS LOTES 9 e 10.","FotoPrincipal":null}	-22.8981284999999986	-47.0238379999999978	R. Francisco Mesquita, 115, Campinas, SP - 13092-511	000.000.000
254	0930.00	88	4	3697	3361.34.03.0261.00000	2015-02-05 02:19:39.06706	2015-06-12 02:19:33.966514	f	f	\N	{"CódContábil":"0930.00","Bairro":"Res. São José","Distrito":null,"CódBrás":"223697","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"3697","CódCartograf":"3361.34.03.0261.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\RESIDENCIAL_SAO_JOSE.JPG","CódBrás_correto":"BR-22-3697"}	223697.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	R Jose Sebastiao Napole 82- Estr mun Camp-Friburgo	13057-166	\N	0	10911	O	26	126.00	7.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	DEVOLVIDO EM 11/2014	{"CódContábil":"0930.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R Jose Sebastiao Napole 82- Estr mun Camp-Friburgo","CepImóvel":"13057-166","Zoneamento":null,"Receita":"0","Quarteirão":"10911","Quadra":"O","Lote":"26","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"7,00","ÁreaPrincipal":"00,00","ÁreaDependência":"00,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,30","ÁreaTerreno":"126,00","ÁreaExcedente":"00,00","Observações":"DEVOLVIDO EM 11/2014","FotoPrincipal":null}	-22.9667965999999986	-47.1636128999999968	R Jose Sebastiao Napole 82- Estr mun Camp-Friburgo, Campinas, SP - 13057-166	000.000.000
239	0930.01	88	4	3697	000000000000	2015-02-05 02:19:36.602504	2015-06-12 02:19:15.669876	t	t	\N	{"CódContábil":"0930.01","Bairro":"Res. Campina Verde (ant. Res. São José)","Distrito":null,"CódBrás":"223697","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001970573","CódGrupo":"4","CódContador":"3697","CódCartograf":"000000000000","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO_N\\\\Bens IMOVEIS\\\\223697_FOTO DA CASA ANTIGA ESQUINA.jpg","CódBrás_correto":null}	223697.01	Igreja	Em Funcionamento	PROPRIO	AV. HUM	\N	\N	\N	\N	O	37 UNIF	735.74	28.00	\N	\N	\N	\N	IGREJA	\N	\N	ABERTURA EM 12/10/2014\r\n- RUA RENE DESCARTES, 230\r\n02/04/14-  Refere-se a compra de 5 lotes para o futuro templo do Resid. São José - Neste dia temos somente o instr. Partic. De Cessao de direitos no valor de R$450.000,00.	{"CódContábil":"0930.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"AV. HUM","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"O","Lote":"37 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"28,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"735,74","ÁreaExcedente":null,"Observações":"ABERTURA EM 12/10/2014\\r\\n- RUA RENE DESCARTES, 230\\r\\n02/04/14-  Refere-se a compra de 5 lotes para o futuro templo do Resid. São José - Neste dia temos somente o instr. Partic. De Cessao de direitos no valor de R$450.000,00.","FotoPrincipal":null}	\N	\N	\N	000.000.000
135	0660.00	63	5	2581	3461.21.42.0186.01001	2015-02-05 02:19:18.771876	2015-06-12 02:17:04.906341	t	t	\N	{"CódContábil":"0660.00","Bairro":"Pq. Jambeiro","Distrito":null,"CódBrás":"222581","CódIPTU":"055.041.338","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001572523","CódGrupo":"5","CódContador":"2581","CódCartograf":"3461.21.42.0186.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\PARQUE_JAMBEIRO.jpg","CódBrás_correto":"BR-22-2581"}	222581.00	Igreja	Em Funcionamento	PROPRIO	R. Lázaro Ferreira Filho, 279	13042-560	01	3	07681	KK	18 unif	750.00	30.00	331.04	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0660.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Lázaro Ferreira Filho, 279","CepImóvel":"13042-560","Zoneamento":"01","Receita":"3","Quarteirão":"07681","Quadra":"KK","Lote":"18 unif","CódLogradouro":"0.097.188","ÁreaGeoFreqLixo":"156","TestadaTerreno":"30,00","ÁreaPrincipal":"331,04","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"750,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9620138000000011	-47.0498201999999992	R. Lázaro Ferreira Filho, 279, Campinas, SP - 13042-560	055.041.338
136	0670.00	28	2	1992	3164.42.46.0198.01001	2015-02-05 02:19:18.934391	2015-06-12 02:17:06.148338	t	t	\N	{"CódContábil":"0670.00","Bairro":"Pq. Maria Helena","Distrito":null,"CódBrás":"22-19-92","CódIPTU":"055.005.860","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001154632","CódGrupo":"2","CódContador":"1992","CódCartograf":"3164.42.46.0198.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\PARQUE_MARIA_HELENA.JPG","CódBrás_correto":"BR-22-1992"}	221992.00	Igreja	Em Funcionamento	PROPRIO	R. Mirella Cristina de Barros, 229	13067-842	11	2	15066	2	11	1023.52	23.00	474.63	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	30/5/2011 (Douglas A.) Também temos direito a ma area equivalente de 165,00m2 ao lado direito, e descontando a diretriz viaria, 156,75m2, terreno triangular que temos junto ao lote 10 (a direita).\r\n30/5/2011 (Douglas A.) Assim, invadimos uma area de ~132,00m2, descontando- se a diretriz viária de 2,5m, resulta na area de 124,50m2 de invasao sobre o lote nº12.\r\n30/5/2011 (Douglas A.) - Invadimos ~6,0m na frente, ao lado esquerdo, (de quem olha pela rua), nos fundos o ponto de divisa esta correto, tanto a esquerda, como direita.	{"CódContábil":"0670.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Mirella Cristina de Barros, 229","CepImóvel":"13067-842","Zoneamento":"11","Receita":"2","Quarteirão":"15066","Quadra":"2","Lote":"11","CódLogradouro":"0.069.567","ÁreaGeoFreqLixo":"156","TestadaTerreno":"23,00","ÁreaPrincipal":"474,63","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1.023,52","ÁreaExcedente":"0","Observações":"30/5/2011 (Douglas A.) Também temos direito a ma area equivalente de 165,00m2 ao lado direito, e descontando a diretriz viaria, 156,75m2, terreno triangular que temos junto ao lote 10 (a direita).\\r\\n30/5/2011 (Douglas A.) Assim, invadimos uma area de ~132,00m2, descontando- se a diretriz viária de 2,5m, resulta na area de 124,50m2 de invasao sobre o lote nº12.\\r\\n30/5/2011 (Douglas A.) - Invadimos ~6,0m na frente, ao lado esquerdo, (de quem olha pela rua), nos fundos o ponto de divisa esta correto, tanto a esquerda, como direita.","FotoPrincipal":null}	-22.8665157000000008	-47.1495219999999975	R. Mirella Cristina de Barros, 229, Campinas, SP - 13067-842	055.005.860
142	0690.01	41	1	2135	3334.43.53.0247.01001	2015-02-05 02:19:19.949925	2015-06-12 02:17:13.846564	t	t	\N	{"CódContábil":"0690.01","Bairro":"Pq. Res. Campina Grande","Distrito":null,"CódBrás":"22-21-35","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001426733","CódGrupo":"1","CódContador":"2135","CódCartograf":"3334.43.53.0247.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\1- PARQUE_RESIDENCIAL_CAMPINA_GRANDE_mini.JPG","CódBrás_correto":"BR-22-2135"}	222135.01	Igreja	Em Funcionamento	PROPRIO	R. TREZE, 70	13058-193	\N	3	10101	B	04Unif	943.10	23.64	385.67	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	(R. Dezesseis, nº14 - Esquina c/ R. 13 nº 70) Neste imóvel já foram unificados em 2002 os lotes 2 e 3 c/ matricula 142.673/3º	{"CódContábil":"0690.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. TREZE, 70","CepImóvel":"13058-193","Zoneamento":null,"Receita":"3","Quarteirão":"10101","Quadra":"B","Lote":"04Unif","CódLogradouro":"9126","ÁreaGeoFreqLixo":"156","TestadaTerreno":"23,64","ÁreaPrincipal":"385,67","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"943,10","ÁreaExcedente":"0","Observações":"(R. Dezesseis, nº14 - Esquina c/ R. 13 nº 70) Neste imóvel já foram unificados em 2002 os lotes 2 e 3 c/ matricula 142.673/3º","FotoPrincipal":null}	-23.0327230000000007	-47.1248679999999993	R. TREZE, 70, Campinas, SP - 13058-193	000.000.000
150	0720.00	77	4	3641	3362.13.95.0243.01001	2015-02-05 02:19:21.252804	2015-06-12 02:17:23.99999	t	t	\N	{"CódContábil":"0720.00","Bairro":"Pq. Universitário de Viracopos","Distrito":null,"CódBrás":"22-36-41","CódIPTU":"044.564.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000044893","CódGrupo":"4","CódContador":"3641","CódCartograf":"3362.13.95.0243.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_UNIVERSITARIO_DE_VIRACOPOS.JPG","CódBrás_correto":"BR-22-3641"}	223641.00	Igreja	Em Funcionamento	PROPRIO	R. Camaça, 552	13056-468	11	3	04375	6	58 unif	900.00	30.00	475.48	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	3 LOTES, ESTA ANEXADO NA MATRICULA?	{"CódContábil":"0720.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Camaça, 552","CepImóvel":"13056-468","Zoneamento":"11","Receita":"3","Quarteirão":"04375","Quadra":"6","Lote":"58 unif","CódLogradouro":"0.033.522","ÁreaGeoFreqLixo":"156","TestadaTerreno":"30","ÁreaPrincipal":"475,48","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"900,00","ÁreaExcedente":"0","Observações":"3 LOTES, ESTA ANEXADO NA MATRICULA?","FotoPrincipal":null}	-22.9653415999999986	-47.1518350999999996	R. Camaça, 552, Campinas, SP - 13056-468	044.564.200
4	0110.00	4	3	2558	3214.62.92.0034.01001	2015-02-05 02:18:55.75022	2015-06-12 02:14:38.778243	t	t	\N	{"CódContábil":"0110.00","Bairro":"Alto Cidade Universitária","Distrito":"Barão Geraldo","CódBrás":"22-25-58","CódIPTU":"055.064.279","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000737252","CódGrupo":"3","CódContador":"2558","CódCartograf":"3214.62.92.0034.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\ALTO_CIDADE UNIVERSITARA.jpg","CódBrás_correto":"BR-22-2558"}	222558.00	Igreja	Em Funcionamento	PROPRIO	R. Mário Honório dos Santos, 87	13085-535	11 BG	3	00629	B	03	399.27	17.97	444.75	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	GUARÁ	{"CódContábil":"0110.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Mário Honório dos Santos, 87","CepImóvel":"13085-535","Zoneamento":"11 BG","Receita":"3","Quarteirão":"00629","Quadra":"B","Lote":"03","CódLogradouro":"5775","ÁreaGeoFreqLixo":"156","TestadaTerreno":"17,97","ÁreaPrincipal":"444,75","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"399,27","ÁreaExcedente":"0","Observações":"GUARÁ","FotoPrincipal":null}	-22.7853823999999996	-47.0629626999999999	R. Mário Honório dos Santos, 87, Campinas, SP - 13085-535	055.064.279
56	0320.01	71	1	3636	3343.43.81.0147.00000	2015-02-05 02:19:05.26418	2015-06-12 02:15:23.822537	t	f	\N	{"CódContábil":"0320.01","Bairro":"Jd. Lisa","Distrito":null,"CódBrás":"22-36-36","CódIPTU":"055.052.187","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000919723","CódGrupo":"1","CódContador":"3636","CódCartograf":"3343.43.81.0147.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Jd Lisa\\\\IMG_3518 Terr Jd Lisa_mini.JPG","CódBrás_correto":"BR-22-3636"}	223636.01	Terreno	Aguarda Constr	PROPRIO	R. Alfredo de Almeida (Fredô), 0	13058-351	\N	3	10038	AD	001	1253.79	25.52	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0320.01","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. Alfredo de Almeida (Fredô), 0","CepImóvel":"13058-351","Zoneamento":null,"Receita":"3","Quarteirão":"10038","Quadra":"AD","Lote":"001","CódLogradouro":"332","ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,52","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"1253,79","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9577777000000012	-47.182193599999998	R. Alfredo de Almeida (Fredô), 0, Campinas, SP - 13058-351	055.052.187
115	0560.02	102	5	0300	3444.42.88.0292.00000	2015-02-05 02:19:15.353909	2015-06-12 02:16:37.589535	f	f	\N	{"CódContábil":"0560.02","Bairro":"Vl Formosa (vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"043.819.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000246053","CódGrupo":"5","CódContador":"0300","CódCartograf":"3444.42.88.0292.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220300.02	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. Dna. Benedita de Moraes Teixeira	13045-390	\N	3	3885	I	12	460.00	18.74	\N	156.00	\N	\N	TERRENO	\N	0.03	IMOVEL VENDIDO (13/05/2004, CONF. CONSTA EM INSTR. PARTIC. DE PROMESSA DE COMPROM. DE COMPRA E VENDA) - NÃO FOI ENCONTRADO A ESCRITURA PUBLICA E A MATRICULA ATUALIZADA______DOUGLAS A. 11/03/11	{"CódContábil":"0560.02","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Dna. Benedita de Moraes Teixeira","CepImóvel":"13045-390","Zoneamento":null,"Receita":"3","Quarteirão":"3885","Quadra":"I","Lote":"12","CódLogradouro":"1263","ÁreaGeoFreqLixo":"156","TestadaTerreno":"18,74","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno sem construção","CategoriaImóvel":null,"Alícota":"3","ÁreaTerreno":"460","ÁreaExcedente":"0","Observações":"IMOVEL VENDIDO (13/05/2004, CONF. CONSTA EM INSTR. PARTIC. DE PROMESSA DE COMPROM. DE COMPRA E VENDA) - NÃO FOI ENCONTRADO A ESCRITURA PUBLICA E A MATRICULA ATUALIZADA______DOUGLAS A. 11/03/11","FotoPrincipal":null}	\N	\N	R. Dna. Benedita de Moraes Teixeira, Campinas, SP - 13045-390	043.819.900
213	0980.04	93	4	3850	3364.24.08.0122.01001	2015-02-05 02:19:32.054914	2015-06-09 20:17:56.795949	t	t	\N	{"CódContábil":"0980.04","Bairro":"Jd. São Pedro de Viracopos","Distrito":null,"CódBrás":"223850","CódIPTU":null,"CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001608643","CódGrupo":"4","CódContador":"3850","CódCartograf":"3364.24.08.0122.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\4- NOVA S.PEDRO VIRAC.mini.JPG","CódBrás_correto":"BR-22-3850"}	223850.04	Igreja	Em Funcionamento	PROPRIO	Av. Mário Trevenzoli, 633 - (antiga Av. Um)	13056-190	\N	\N	4996	13	03 UNIF	1206.90	32.40	398.12	156.00	\N	\N	MISTO	PREDIAL	0.01	TERRENO ORIUNDO DA UNIFICAÇAO DOS LOTES 3, 4 e 5_____DOUGLAS A 15/08/11	{"CódContábil":"0980.04","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Av. Mário Trevenzoli, 633 - (antiga Av. Um)","CepImóvel":"13056-190","Zoneamento":null,"Receita":null,"Quarteirão":"4996","Quadra":"13","Lote":"03 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"32,40","ÁreaPrincipal":"398,12","ÁreaDependência":null,"TipoPadrão":"MISTO","CategoriaImóvel":"PREDIAL","Alícota":"1,30%","ÁreaTerreno":"1206,90","ÁreaExcedente":null,"Observações":"TERRENO ORIUNDO DA UNIFICAÇAO DOS LOTES 3, 4 e 5_____DOUGLAS A 15/08/11","FotoPrincipal":null}	\N	\N	Av. Mário Trevenzoli, 633 - (antiga Av. Um), Campinas, SP - 13056-190	\N
90	0470.01	72	1	3638	3343.23.58.0559.01001	2015-02-05 02:19:10.94104	2015-06-12 02:16:06.803999	t	t	\N	{"CódContábil":"0470.01","Bairro":"Jd. Nova Esperança","Distrito":null,"CódBrás":"22-36-38","CódIPTU":"055.046.772","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000926793","CódGrupo":"1","CódContador":"3638","CódCartograf":"3343.23.58.0559.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JD. NOVA ESPERANÇA_NOVA.jpg","CódBrás_correto":"BR-22-3638"}	223638.01	Igreja	Em Funcionamento	PROPRIO	R. Che Guevara, 548	13058-488	\N	3	07970	G	50	458.38	25.50	156.87	156.00	\N	\N	NRH-4.0	PREDIAL	0.01	1- Templo inaugurado em 2010______DOUGLAS A.B.L 27/08/10	{"CódContábil":"0470.01","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Che Guevara, 548","CepImóvel":"13058-488","Zoneamento":null,"Receita":"3","Quarteirão":"07970","Quadra":"G","Lote":"50","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,50","ÁreaPrincipal":"156,87","ÁreaDependência":"0","TipoPadrão":"NRH-4.0","CategoriaImóvel":"PREDIAL","Alícota":"1,10%","ÁreaTerreno":"458,38","ÁreaExcedente":"0","Observações":"1- Templo inaugurado em 2010______DOUGLAS A.B.L 27/08/10","FotoPrincipal":null}	-22.9440021999999999	-47.1731768000000002	R. Che Guevara, 548, Campinas, SP - 13058-488	055.046.772
223	1010.00	\N	2	0009	3413.42.16.0020.00000	2015-02-05 02:19:33.860625	2015-06-12 02:18:54.170981	t	f	\N	{"CódContábil":"1010.00","Bairro":"Conj. Hab. Pe Manoel da Nóbrega","Distrito":null,"CódBrás":"990009","CódIPTU":"055.021.145","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001685513","CódGrupo":"2","CódContador":"0009","CódCartograf":"3413.42.16.0020.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\Pe Manoel da Nobrega - Terreno_mini.JPG","CódBrás_correto":"BR-"}	220009.00	Terreno	Aguarda Constr	PROPRIO	R. DO CISNE, S/N	13061-382	03	\N	06825	G	001-MOD	1245.14	62.20	\N	301.00	\N	\N	TERRENO	TERRITORIAL	0.02	1- TERRENO ADQUIRIDO NO ANO DE 2009 - PARA FUTURA CASA DE ORAÇÃO NO LOCAL, PROXIMO AO JD. LONDRES_____DOUGLAS A. 00/00/2009	{"CódContábil":"1010.00","Tipo":"Terreno","Andamento":"Aguarda Constr","Situação":"PROPRIO","EndereçoImóvel":"R. DO CISNE, S/N","CepImóvel":"13061-382","Zoneamento":"03","Receita":null,"Quarteirão":"06825","Quadra":"G","Lote":"001-MOD","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"62,20","ÁreaPrincipal":"0,00","ÁreaDependência":"0,00","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,8%","ÁreaTerreno":"1.245,14","ÁreaExcedente":"0,00","Observações":"1- TERRENO ADQUIRIDO NO ANO DE 2009 - PARA FUTURA CASA DE ORAÇÃO NO LOCAL, PROXIMO AO JD. LONDRES_____DOUGLAS A. 00/00/2009","FotoPrincipal":null}	-22.9096288000000001	-47.1195796000000016	R. DO CISNE, S/N, Campinas, SP - 13061-382	055.021.145
177	0840.00	101	7	0006	3234.14.45.0001.01001	2015-02-05 02:19:25.831231	2015-07-04 14:54:40.782565	t	f	\N	{"CódContábil":"0840.00","Bairro":"Vl. Santa Isabel- Anexo Piedade","Distrito":null,"CódBrás":"980006","CódIPTU":"070.354.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001100462","CódGrupo":"7","CódContador":"0006","CódCartograf":"3234.14.45.0001.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\FOTOS DOS SETORES - FACHADAS\\\\3 - Anexo Piedade_mini.JPG","CódBrás_correto":"BR-22-0281"}	980006.00	Outros Fins	Em Funcionamento	PROPRIO	R. Carlos Diniz Leitão, 191	13084-225	03 BG	2	35-BG	\N	S-3A-GL	5273.20	44.30	604.45	301.00	\N	\N	RH-3.0	PREDIAL	0.00	PROTOCOLO 2000/00/00756\r\nRecorrentes: ADELELMO FERNANDES FIALHO e DIRETOR DO DEPARTAMENTO DE RECEITAS IMOBILIÁRIAS\r\nRecurso Voluntário: Protocolo 2005/10/31142\r\nRecurso de Ofício\r\nRelator:  João Batista Borges\r\nAssunto: Revisão de IPTU - Recurso Voluntário - Recurso de Ofício - Negado Provimento a ambos - Votação Unânime.\r\nDECISÃO: Após leitura do relatório e voto do Relator, os integrantes da 3ª Câmara, \r\npor unanimidade dos votos dos presentes, acompanhando o voto do Relator, decidiram \r\nconhecer e NEGAR PROVIMENTO aos recursos de ofício interposto pelo Diretor \r\ndo DRI e voluntário impetrado pelo sujeito passivo, para manter na integralidade a decisão recorrida, proferida em 11/06/2005, em que foi deferido parcialmente o pedido \r\nde revisão do lançamento do IPTU correspondente aos exercícios de 2001, retroativo a \r\n1999, 2002, 2003, 2004 e 2005, em relação ao imóvel codificado sob o nº055.056.947-03, alterando a partir de 2001 a área construída para 604,25 m2, o tipo/padrão/subpadrão para A-2.5 e o ano base de depreciação 1983, conforme vistoria realizada no \r\nlocal em 03/09/2002, mantendo-se os demais dados de áreas e fatores inalterados, nos \r\ntermos da lei nº9.927/98 e alterações posteriores.\r\n\r\nIMOVEL ADQUIRIDO PARA FINS DE APOIO AO ATENDIMENTO DE ENFERMOS EM TRATAMENTO (ADMINISTRADO PELA PIEDADE) Douglas A. 01/09/08\r\nExiste um Laudo Técnico a respeito de uma poda de uma árvore paineira, ART Num. 9222120110070769. Verificar ou providenciar a poda. Anexo tem fotos da árvore. Michel Sugimoto, 22/02/2011.	{"CódContábil":"0840.00","Tipo":"Outros Fins","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Carlos Diniz Leitão, 191","CepImóvel":"13084-225","Zoneamento":"03 BG","Receita":"2","Quarteirão":"35-BG","Quadra":null,"Lote":"S-3A-GL","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"44,30","ÁreaPrincipal":"604,45","ÁreaDependência":null,"TipoPadrão":"RH-3.0","CategoriaImóvel":"PREDIAL","Alícota":"0,7%","ÁreaTerreno":"5.273,20","ÁreaExcedente":null,"Observações":"PROTOCOLO 2000/00/00756\\r\\nRecorrentes: ADELELMO FERNANDES FIALHO e DIRETOR DO DEPARTAMENTO DE RECEITAS IMOBILIÁRIAS\\r\\nRecurso Voluntário: Protocolo 2005/10/31142\\r\\nRecurso de Ofício\\r\\nRelator:  João Batista Borges\\r\\nAssunto: Revisão de IPTU - Recurso Voluntário - Recurso de Ofício - Negado Provimento a ambos - Votação Unânime.\\r\\nDECISÃO: Após leitura do relatório e voto do Relator, os integrantes da 3ª Câmara, \\r\\npor unanimidade dos votos dos presentes, acompanhando o voto do Relator, decidiram \\r\\nconhecer e NEGAR PROVIMENTO aos recursos de ofício interposto pelo Diretor \\r\\ndo DRI e voluntário impetrado pelo sujeito passivo, para manter na integralidade a decisão recorrida, proferida em 11/06/2005, em que foi deferido parcialmente o pedido \\r\\nde revisão do lançamento do IPTU correspondente aos exercícios de 2001, retroativo a \\r\\n1999, 2002, 2003, 2004 e 2005, em relação ao imóvel codificado sob o nº055.056.947-03, alterando a partir de 2001 a área construída para 604,25 m2, o tipo/padrão/subpadrão para A-2.5 e o ano base de depreciação 1983, conforme vistoria realizada no \\r\\nlocal em 03/09/2002, mantendo-se os demais dados de áreas e fatores inalterados, nos \\r\\ntermos da lei nº9.927/98 e alterações posteriores.\\r\\n\\r\\nIMOVEL ADQUIRIDO PARA FINS DE APOIO AO ATENDIMENTO DE ENFERMOS EM TRATAMENTO (ADMINISTRADO PELA PIEDADE) Douglas A. 01/09/08\\r\\nExiste um Laudo Técnico a respeito de uma poda de uma árvore paineira, ART Num. 9222120110070769. Verificar ou providenciar a poda. Anexo tem fotos da árvore. Michel Sugimoto, 22/02/2011.","FotoPrincipal":null}	-22.8209008000000004	-47.0871808999999999	R. Carlos Diniz Leitão, 191, Campinas, SP - 13084-225	070.354.000
73	0390.02	31	1	0316	3343.41.14.0456.00000	2015-02-05 02:19:08.069536	2015-06-12 02:15:45.681514	t	f	\N	{"CódContábil":"0390.02","Bairro":"Jd. Metonópolis","Distrito":null,"CódBrás":"22-03-16","CódIPTU":"046.835.400","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000350763","CódGrupo":"1","CódContador":"0316","CódCartograf":"3343.41.14.0456.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_02\\\\CCB Metonopolis - Estacionamento_mini.JPG","CódBrás_correto":"BR-22-0316"}	220316.02	Estacionamento	Em Funcionamento	PROPRIO	R. Daniel Moacyr Novaes Lipp, 401	13058-321	01	3	05704	H	23	558.00	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	\N	{"CódContábil":"0390.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Daniel Moacyr Novaes Lipp, 401","CepImóvel":"13058-321","Zoneamento":"01","Receita":"3","Quarteirão":"05704","Quadra":"H","Lote":"23","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"558,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9516321000000012	-47.1870089000000021	R. Daniel Moacyr Novaes Lipp, 401, Campinas, SP - 13058-321	046.835.400
43	0260.00	5	2	0289	3413.34.43.0251.01001	2015-02-05 02:19:02.899275	2015-06-12 02:11:21.301564	t	t	\N	{"CódContábil":"0260.00","Bairro":"Jd. Aurélia","Distrito":null,"CódBrás":"22-02-89","CódIPTU":"012.600.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001159233","CódGrupo":"2","CódContador":"0289","CódCartograf":"3413.34.43.0251.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0260.00_JARDIM_AURELIA\\\\pat_260.00_ _foto fachada.jpg","CódBrás_correto":"BR-22-0289"}	220289.00	Igreja	Em Funcionamento	PROPRIO	R. Mário Sampaio Ferraz, 863	13033-130	03	2	02320	27	023	600.00	20.00	362.32	301.00	\N	\N	RH-2.0-Residencial Horizontal	PREDIAL	0.00	\N	{"CódContábil":"0260.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Mário Sampaio Ferraz, 863","CepImóvel":"13033-130","Zoneamento":"03","Receita":"2","Quarteirão":"02320","Quadra":"27","Lote":"023","CódLogradouro":"5800","ÁreaGeoFreqLixo":"301","TestadaTerreno":"20,00","ÁreaPrincipal":"362,32","ÁreaDependência":"0","TipoPadrão":"RH-2.0-Residencial Horizontal","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"600","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9060072000000012	-47.0970253999999997	R. Mário Sampaio Ferraz, 863, Campinas, SP - 13033-130	012.600.200
108	0530.01	14	4	0290	5213.52.62.0417.00000	2015-02-05 02:19:14.175809	2015-06-12 02:16:28.813511	t	f	\N	{"CódContábil":"0530.01","Bairro":"Descampado (Jd. São Domingos)","Distrito":null,"CódBrás":"220290","CódIPTU":"041.090.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000711723","CódGrupo":"4","CódContador":"0290","CódCartograf":"5213.52.62.0417.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Jd. Sao Domingos.jpg","CódBrás_correto":"BR-22-0290"}	220290.01	Estacionamento	Em Funcionamento	PROPRIO	MARGINAL (SP073, JD. SÃO DOMINGOS)	13053-000	18	3	05507	P	032	420.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Providenciar Matricula atualizada\r\nTemos a Escritura da PERMUTA, Terreno trocado pela antiga salinha do Jardim Fernanda_____DOUGLAS A. 30/5/11\r\nPEDIR IMUNIDADE___DOUGLAS 15/02/10	{"CódContábil":"0530.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"MARGINAL (SP073, JD. SÃO DOMINGOS)","CepImóvel":"13053-000","Zoneamento":"18","Receita":"3","Quarteirão":"05507","Quadra":"P","Lote":"032","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"12","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"420","ÁreaExcedente":"0","Observações":"Providenciar Matricula atualizada\\r\\nTemos a Escritura da PERMUTA, Terreno trocado pela antiga salinha do Jardim Fernanda_____DOUGLAS A. 30/5/11\\r\\nPEDIR IMUNIDADE___DOUGLAS 15/02/10","FotoPrincipal":null}	-23.0414378999999983	-47.110422100000001	MARGINAL (SP073, JD. SÃO DOMINGOS), Campinas, SP - 13053-000	041.090.700
49	0290.00	13	5	1812	3442.42.45.0498.01001	2015-02-05 02:19:03.888232	2015-06-12 02:15:16.060839	t	t	\N	{"CódContábil":"0290.00","Bairro":"Jd. Carlos Lourenço","Distrito":null,"CódBrás":"22-18-12","CódIPTU":"055.027.372","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000789071","CódGrupo":"5","CódContador":"1812","CódCartograf":"3442.42.45.0498.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_CARLOS_LOURENCO.JPG","CódBrás_correto":"BR-22-1812"}	221812.00	Igreja	Em Funcionamento	PROPRIO	R. Manoel Marotti Cabral, 371	13101-018	03	2	03868	CC	37 Unif	578.80	22.28	391.15	301.00	51.15	\N	NRH 5.0 N RES. HORIZ.	PREDIAL	0.01	\N	{"CódContábil":"0290.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Manoel Marotti Cabral, 371","CepImóvel":"13101-018","Zoneamento":"03","Receita":"2","Quarteirão":"03868","Quadra":"CC","Lote":"37 Unif","CódLogradouro":"0.088.856","ÁreaGeoFreqLixo":"301","TestadaTerreno":"22,28","ÁreaPrincipal":"391,15","ÁreaDependência":"51,15","TipoPadrão":"NRH 5.0 N RES. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"578,80","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9312214999999995	-47.0183108000000018	R. Manoel Marotti Cabral, 371, Campinas, SP - 13101-018	055.027.372
35	0220.01	69	1	0281	3341.61.36.0233.00000	2015-02-05 02:19:01.406678	2015-06-12 02:11:11.026597	f	f	\N	{"CódContábil":"0220.01","Bairro":"Jd. Rossin","Distrito":null,"CódBrás":"22-23-38","CódIPTU":"055.057.852","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001448033","CódGrupo":"1","CódContador":"0281","CódCartograf":"3341.61.36.0233.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Rossin_Terreno_mini.JPG","CódBrás_correto":"BR-22-2338"}	220281.01	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Edwiges Fontana Coelho, 131	13059-132	3	2	10114	B	12	250.00	10.00	85.40	156.00	\N	\N	TERRENO	PREDIAL	0.02	VENDIDO EM 12/12/2011\r\n24/08/09 DOUGLAS A. - TERRENO COMPRADO PARA QUE FOSSE CONSTRUIDA A SALA DE ORAÇAO, COM TODA DOCUMENTAÇÃO E PROJETO APROVADOS, SE INICIOU A CONSTRUÇÃO, POREM EM TERRENO ERRADO!! ESTE TERRENO FOI VENDIDO (ALEX \r\nFOI CONSTRUIDO ERRONEAMENTE NO LOTE 15 (Nº 161) DA MESMA RUA, O QUAL NÃO SE TEM O PARADEIRO DO PROPRIETARIO.\r\nO TERRENO ESTA VAZIO, COM O MATO ALTO, MURADO E SEM NUMERO.\r\nDEVE- SE FAZER UMA LIMPEZA E COLOCAR UMA PLACA DE PROPR.PARTIC.\r\nLEVAR EM REUNIAO A POSSIBILIDADE DE SE VENDER, POIS ESTA INUTILIZADO. TERRENO VENDIDO - 24-2-2012 // ALTERAR ENDEREÇO DE ENTREGA - ALEX	{"CódContábil":"0220.01","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Edwiges Fontana Coelho, 131","CepImóvel":"13059-132","Zoneamento":"3","Receita":"2","Quarteirão":"10114","Quadra":"B","Lote":"12","CódLogradouro":"3146","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"85,40","ÁreaDependência":"0","TipoPadrão":"Terreno","CategoriaImóvel":"PREDIAL","Alícota":"2,3%","ÁreaTerreno":"250","ÁreaExcedente":"0","Observações":"VENDIDO EM 12/12/2011\\r\\n24/08/09 DOUGLAS A. - TERRENO COMPRADO PARA QUE FOSSE CONSTRUIDA A SALA DE ORAÇAO, COM TODA DOCUMENTAÇÃO E PROJETO APROVADOS, SE INICIOU A CONSTRUÇÃO, POREM EM TERRENO ERRADO!! ESTE TERRENO FOI VENDIDO (ALEX \\r\\nFOI CONSTRUIDO ERRONEAMENTE NO LOTE 15 (Nº 161) DA MESMA RUA, O QUAL NÃO SE TEM O PARADEIRO DO PROPRIETARIO.\\r\\nO TERRENO ESTA VAZIO, COM O MATO ALTO, MURADO E SEM NUMERO.\\r\\nDEVE- SE FAZER UMA LIMPEZA E COLOCAR UMA PLACA DE PROPR.PARTIC.\\r\\nLEVAR EM REUNIAO A POSSIBILIDADE DE SE VENDER, POIS ESTA INUTILIZADO. TERRENO VENDIDO - 24-2-2012 // ALTERAR ENDEREÇO DE ENTREGA - ALEX","FotoPrincipal":null}	-22.9291611000000017	-47.1647419999999968	R. Edwiges Fontana Coelho, 131, Campinas, SP - 13059-132	055.057.852
38	0230.02	102	4	2846	3344.33.67.0248.00000	2015-02-05 02:19:02.044329	2015-06-12 02:11:14.92928	f	f	\N	{"CódContábil":"0230.02","Bairro":"Cidade Satelite Iris I (vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"042.613.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000414593","CódGrupo":"4","CódContador":"2846","CódCartograf":"3344.33.67.0248.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	222846.02	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. Irineu Ferreira de Almeida	13059-666	3	3	04497	72	17	860.00	20.00	\N	2.00	\N	\N	TERRENO	Sem Construção	0.03	TERRENO VENDIDO P/ IRMAOS, FICAVA NA QDRA DE CIMA DA CASA DE ORAÇAO DESTE BAIRRO (FONTE IRMAO BARBOSA (DIACONO) ) _DOUGLAS 24/08/09	{"CódContábil":"0230.02","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Irineu Ferreira de Almeida","CepImóvel":"13059-666","Zoneamento":"3","Receita":"3","Quarteirão":"04497","Quadra":"72","Lote":"17","CódLogradouro":"4130","ÁreaGeoFreqLixo":"2=156 d/a","TestadaTerreno":"20","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno   Sem Construção","CategoriaImóvel":"Sem Construção","Alícota":"3","ÁreaTerreno":"860","ÁreaExcedente":"0","Observações":"TERRENO VENDIDO P/ IRMAOS, FICAVA NA QDRA DE CIMA DA CASA DE ORAÇAO DESTE BAIRRO (FONTE IRMAO BARBOSA (DIACONO) ) _DOUGLAS 24/08/09","FotoPrincipal":null}	-22.9427404999999993	-47.1320047999999971	R. Irineu Ferreira de Almeida, Campinas, SP - 13059-666	042.613.600
132	0640.02	20	1	0283	3432.23.17.0010.01001	2015-02-05 02:19:18.259991	2015-06-12 02:17:01.091803	t	f	\N	{"CódContábil":"0640.02","Bairro":"Pq. Industrial","Distrito":null,"CódBrás":"22-02-83","CódIPTU":"013.708.460","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"0283","CódCartograf":"3432.23.17.0010.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\1- Parque Industrial\\\\PANORAMA MINI.JPG","CódBrás_correto":"BR-22-0283"}	220283.02	Estacionamento	Em Funcionamento	ALUGADO	R. João Batista Pupo de Morais,132	13031-690	\N	2	01505	27	27	347.00	10.00	27.00	301.00	\N	\N	NHR 1.0 Ñ RESID. HORIZ.	PREDIAL	0.01	VERIFICAR SE HÁ AREA CONSTRUIDA, POIS ESTA SENDO COBRADO NO IPTU____DOUGLAS A.	{"CódContábil":"0640.02","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"ALUGADO","EndereçoImóvel":"R. João Batista Pupo de Morais,132","CepImóvel":"13031-690","Zoneamento":null,"Receita":"2","Quarteirão":"01505","Quadra":"27","Lote":"27","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10,00","ÁreaPrincipal":"27,00","ÁreaDependência":"0","TipoPadrão":"NHR 1.0 Ñ RESID. HORIZ.","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"347,00","ÁreaExcedente":"0","Observações":"VERIFICAR SE HÁ AREA CONSTRUIDA, POIS ESTA SENDO COBRADO NO IPTU____DOUGLAS A.","FotoPrincipal":null}	-22.9244124000000014	-47.0835991000000007	R. João Batista Pupo de Morais,132, Campinas, SP - 13031-690	013.708.460
141	0690.00	102	1	2135	3334.43.20.0193.00000	2015-02-05 02:19:19.786043	2015-06-12 02:17:12.029989	f	f	\N	{"CódContábil":"0690.00","Bairro":"Pq. Res. Campina Grande (vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"055.052.995","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001463423","CódGrupo":"1","CódContador":"2135","CódCartograf":"3334.43.20.0193.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	222135.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Moacir Barbosa (Goleiro barbosa)	13058-648	3	3	10104	G	43	257.20	10.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.00	IMOVEL ADQUIRIDO EM 1980 e VENDIDO EM 19/09/2007____DOUGLAS A. 9/3/11	{"CódContábil":"0690.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Moacir Barbosa (Goleiro barbosa)","CepImóvel":"13058-648","Zoneamento":"3","Receita":"3","Quarteirão":"10104","Quadra":"G","Lote":"43","CódLogradouro":"9533","ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"0%","ÁreaTerreno":"257,20","ÁreaExcedente":"0","Observações":"IMOVEL ADQUIRIDO EM 1980 e VENDIDO EM 19/09/2007____DOUGLAS A. 9/3/11","FotoPrincipal":null}	-22.9574515000000012	-47.1901940999999994	R. Moacir Barbosa (Goleiro barbosa), Campinas, SP - 13058-648	055.052.995
100	0490.03	102	1	3346	3431.12.34.0139.00000	2015-02-05 02:19:12.83507	2015-06-12 02:16:18.794744	f	f	\N	{"CódContábil":"0490.03","Bairro":"Jd. Santa Lúcia (vendido) Vl.união","Distrito":null,"CódBrás":null,"CódIPTU":"055.077.651","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001221823","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.12.34.0139.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	223346.03	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Poços de Caldas, 114	13060-493	02	3	03992	E1	0 01	532.91	8.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Vendido em 7/11/2007	{"CódContábil":"0490.03","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Poços de Caldas, 114","CepImóvel":"13060-493","Zoneamento":"02","Receita":"3","Quarteirão":"03992","Quadra":"E1","Lote":"0 01","CódLogradouro":"7087","ÁreaGeoFreqLixo":"156","TestadaTerreno":"8","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno  Sem Construção","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"532,91","ÁreaExcedente":"0","Observações":"Vendido em 7/11/2007","FotoPrincipal":null}	-22.9380021999999997	-47.1183868000000032	R. Poços de Caldas, 114, Campinas, SP - 13060-493	055.077.651
234	1090.00	102	7	0000	00000000	2015-02-05 02:19:35.754616	2015-06-12 02:19:10.300883	f	f	\N	{"CódContábil":"1090.00","Bairro":"Nova Paulinia","Distrito":null,"CódBrás":null,"CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000231874","CódGrupo":"7","CódContador":"0000","CódCartograf":"00000000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\JD. Nova Paulinia - PAULINIA.jpg","CódBrás_correto":"BR-00-0000"}	220000.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	R. Nove e cinco	\N	\N	\N	\N	11	24	266.00	\N	\N	\N	\N	\N	IGREJA	\N	\N	Templo, até então de propriedade da CCB CAMPINAS, esta localizado na cidade de Paulínia, sendo formalmente doado para a CCB PAULINIA em 1/06/2012._____DOUGLAS A.	{"CódContábil":"1090.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Nove e cinco","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":"11","Lote":"24","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"266,00","ÁreaExcedente":null,"Observações":"Templo, até então de propriedade da CCB CAMPINAS, esta localizado na cidade de Paulínia, sendo formalmente doado para a CCB PAULINIA em 1/06/2012._____DOUGLAS A.","FotoPrincipal":null}	\N	\N	\N	000.000.000
80	0420.02	102	4	0317	0	2015-02-05 02:19:09.239182	2015-06-12 02:15:54.232227	f	f	\N	{"CódContábil":"0420.02","Bairro":"Jd. Nova América (Vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"045.026.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000107913","CódGrupo":"4","CódContador":"0317","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220317.02	Terreno	Desativado	DEVOLVIDO/VENDIDO	R. TRINTA E DOIS	\N	\N	\N	05098	41	23	300.00	10.00	\N	\N	\N	\N	IGREJA	\N	\N	VENDIDO	{"CódContábil":"0420.02","Tipo":"Terreno","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. TRINTA E DOIS","CepImóvel":null,"Zoneamento":null,"Receita":null,"Quarteirão":"05098","Quadra":"41","Lote":"23","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"10,00","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":"300,00","ÁreaExcedente":"0","Observações":"VENDIDO","FotoPrincipal":null}	\N	\N	\N	045.026.900
124	0610.01	15	4	0292	3362.51.01.0376.00000	2015-02-05 02:19:16.89645	2015-06-12 02:16:51.420321	f	f	\N	{"CódContábil":"0610.01","Bairro":"Pq. Dom Pedro II (VENDIDO)","Distrito":null,"CódBrás":"22-02-92","CódIPTU":"041.606.900","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000217273","CódGrupo":"4","CódContador":"0292","CódCartograf":"3362.51.01.0376.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\CCB TERRENOS\\\\Pq D. PEDRO II_ ESTACIONAMENTO_610.01.jpg","CódBrás_correto":"BR-22-0292"}	220292.01	Estacionamento	Desativado	DEVOLVIDO/VENDIDO	R. Arymana, 670	13056-464	\N	3	04393	29	13	360.00	12.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	VENDIDO EM 17/02/11________DOUGLAS A. 22/02/11\r\nComprado em 05/2003	{"CódContábil":"0610.01","Tipo":"Estacionamento","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Arymana, 670","CepImóvel":"13056-464","Zoneamento":null,"Receita":"3","Quarteirão":"04393","Quadra":"29","Lote":"13","CódLogradouro":"1078","ÁreaGeoFreqLixo":"156","TestadaTerreno":"12","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"terreno","CategoriaImóvel":"TERRITORIAL","Alícota":"2,6%","ÁreaTerreno":"360,00","ÁreaExcedente":"0","Observações":"VENDIDO EM 17/02/11________DOUGLAS A. 22/02/11\\r\\nComprado em 05/2003","FotoPrincipal":null}	-22.9725910000000013	-47.1454566999999969	R. Arymana, 670, Campinas, SP - 13056-464	041.606.900
79	0420.01	102	4	0317	5211.22.48.0349.01001	2015-02-05 02:19:09.07658	2015-06-12 02:15:53.417134	f	f	\N	{"CódContábil":"0420.01","Bairro":"Jd. Nova América (Vendido)","Distrito":null,"CódBrás":null,"CódIPTU":"047.881.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000234033","CódGrupo":"4","CódContador":"0317","CódCartograf":"5211.22.48.0349.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	220317.01	Barracão	Desativado	DEVOLVIDO/VENDIDO	R. José Belani, 351	13053-028	03	2	05098	41	06	300.00	10.00	103.00	2.00	\N	\N	C 10	com. horiz.	0.03	Igreja desativada - vendido o Imóvel em 05/2003	{"CódContábil":"0420.01","Tipo":"Barracão","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. José Belani, 351","CepImóvel":"13053-028","Zoneamento":"03","Receita":"2","Quarteirão":"05098","Quadra":"41","Lote":"06","CódLogradouro":"4691","ÁreaGeoFreqLixo":"2= 156","TestadaTerreno":"10,00","ÁreaPrincipal":"103,00","ÁreaDependência":"0","TipoPadrão":"C 10","CategoriaImóvel":"com. horiz.","Alícota":"3","ÁreaTerreno":"300,00","ÁreaExcedente":"0","Observações":"Igreja desativada - vendido o Imóvel em 05/2003","FotoPrincipal":null}	-23.0018776000000003	-47.1070787999999965	R. José Belani, 351, Campinas, SP - 13053-028	047.881.100
89	0470.00	72	1	3638	0	2015-02-05 02:19:10.778535	2015-06-12 02:16:05.514538	f	f	\N	{"CódContábil":"0470.00","Bairro":"Jd. Nova Esperança (Devolvido)","Distrito":null,"CódBrás":"223638","CódIPTU":"055.046.830","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000926793","CódGrupo":"1","CódContador":"3638","CódCartograf":"0","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_NOVA_ESPERANCA.jpg","CódBrás_correto":"BR-22-3638"}	223638.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	R. Che Guevara, 531	13058-488	\N	2	07972	i	03	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	1- Antiga Salinha do bairro, extinta pois houve a inauguraçao do Templo em 2010. (0470.01)____DOUGLAS A.B.L 27/08/10	{"CódContábil":"0470.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Che Guevara, 531","CepImóvel":"13058-488","Zoneamento":null,"Receita":"2","Quarteirão":"07972","Quadra":"i","Lote":"03","CódLogradouro":"99697","ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"1- Antiga Salinha do bairro, extinta pois houve a inauguraçao do Templo em 2010. (0470.01)____DOUGLAS A.B.L 27/08/10","FotoPrincipal":null}	-22.9445462000000013	-47.1756077000000005	R. Che Guevara, 531, Campinas, SP - 13058-488	055.046.830
111	0550.00	49	4	0303	3451.32.88.0001.01001	2015-02-05 02:19:14.70446	2015-06-12 02:16:32.641718	t	t	\N	{"CódContábil":"0550.00","Bairro":"Jd. São José","Distrito":null,"CódBrás":"22-03-03","CódIPTU":"041.693.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001127353","CódGrupo":"4","CódContador":"0303","CódCartograf":"3451.32.88.0001.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_SAO_JOSE.JPG","CódBrás_correto":"BR-22-0303"}	220303.00	Igreja	Em Funcionamento	PROPRIO	R. Guilhermino F. Santos Filho, 111	13051-161	\N	2	04014	P	018-UNI	582.60	25.13	298.00	156.00	36.30	298.00	NRH-4.0  Residencial Horizontal	PREDIAL	0.01	2003 - excluida 36,30m2 area dependencia	{"CódContábil":"0550.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Guilhermino F. Santos Filho, 111","CepImóvel":"13051-161","Zoneamento":null,"Receita":"2","Quarteirão":"04014","Quadra":"P","Lote":"018-UNI","CódLogradouro":"99.499","ÁreaGeoFreqLixo":"156","TestadaTerreno":"25,13","ÁreaPrincipal":"298,00","ÁreaDependência":"36,30","TipoPadrão":"NRH-4.0  Residencial Horizontal","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"582,60","ÁreaExcedente":"298","Observações":"2003 - excluida 36,30m2 area dependencia","FotoPrincipal":null}	-22.9603134000000004	-47.0951713999999981	R. Guilhermino F. Santos Filho, 111, Campinas, SP - 13051-161	041.693.500
119	0580.01	10	3	0297	3422.11.40.0318.01001	2015-02-05 02:19:16.064844	2015-06-12 02:16:43.177479	t	f	\N	{"CódContábil":"0580.01","Bairro":"Pq. Brasília","Distrito":null,"CódBrás":"22-02-97","CódIPTU":"019.629.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000033561","CódGrupo":"3","CódContador":"0297","CódCartograf":"3422.11.40.0318.01001","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-0297"}	220297.01	Estacionamento	Em Funcionamento	USUCAPIAO	R. José Rodrigues, 54	13090-670	\N	2	03061	G	5	446.25	10.00	64.14	301.00	\N	\N	RH 2.0 Residencial Horizontal	PREDIAL	0.00	USUCAPIAO!	{"CódContábil":"0580.01","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"USUCAPIAO","EndereçoImóvel":"R. José Rodrigues, 54","CepImóvel":"13090-670","Zoneamento":null,"Receita":"2","Quarteirão":"03061","Quadra":"G","Lote":"5","CódLogradouro":null,"ÁreaGeoFreqLixo":"301","TestadaTerreno":"10","ÁreaPrincipal":"64,14","ÁreaDependência":"0","TipoPadrão":"RH 2.0 Residencial Horizontal","CategoriaImóvel":"PREDIAL","Alícota":"0,6%","ÁreaTerreno":"446,25","ÁreaExcedente":"0","Observações":"USUCAPIAO!","FotoPrincipal":null}	-22.8800255999999997	-47.0289499000000006	R. José Rodrigues, 54, Campinas, SP - 13090-670	019.629.000
158	0740.04	58	4	2940	3453.14.27.0114.01001	2015-02-05 02:19:22.56915	2015-06-12 02:17:33.311744	t	t	\N	{"CódContábil":"0740.04","Bairro":"Pq. Vista Alegre","Distrito":null,"CódBrás":"222940","CódIPTU":"048.276.500","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001826293","CódGrupo":"4","CódContador":"2940","CódCartograf":"3453.14.27.0114.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\PARQUE_VISTA_ALEGRE.JPG","CódBrás_correto":"BR-22-2940"}	222940.04	Igreja	Em Funcionamento	PROPRIO	R. Anita Malfati, 323  - (R. 07)	13054-402	03	\N	4758	H	11UNIF	578.00	24.00	627.85	1.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	\N	IMOVEL ORIUNDO DA UNIFICAÇAO DOS LOTES 11 E 12 (CONF. MATR. DE 15/02/11)___DOUGLAS 11/03/11\r\nHá um processo de usucapiao para os lotes 11 e 12, acionado em 26/02/2007.	{"CódContábil":"0740.04","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Anita Malfati, 323  - (R. 07)","CepImóvel":"13054-402","Zoneamento":"03","Receita":null,"Quarteirão":"4758","Quadra":"H","Lote":"11UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"1=301 d/a","TestadaTerreno":"24,00","ÁreaPrincipal":"627,85","ÁreaDependência":null,"TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":null,"ÁreaTerreno":"578,00","ÁreaExcedente":null,"Observações":"IMOVEL ORIUNDO DA UNIFICAÇAO DOS LOTES 11 E 12 (CONF. MATR. DE 15/02/11)___DOUGLAS 11/03/11\\r\\nHá um processo de usucapiao para os lotes 11 e 12, acionado em 26/02/2007.","FotoPrincipal":null}	-22.9855695000000004	-47.1187326000000013	R. Anita Malfati, 323  - (R. 07), Campinas, SP - 13054-402	048.276.500
193	0900.03	85	5	3513	3442.24.22.0108.01001	2015-02-05 02:19:28.70239	2015-06-12 02:18:16.715823	t	t	\N	{"CódContábil":"0900.03","Bairro":"Jd. Tamoio","Distrito":null,"CódBrás":"223513","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001192861","CódGrupo":"5","CódContador":"3513","CódCartograf":"3442.24.22.0108.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_TAMOIO.jpg","CódBrás_correto":"BR-22-3513"}	223513.03	Igreja	Em Funcionamento	PROPRIO	R. Prof. Flavio Wustemberg, 225	13101-280	\N	\N	10145	O	07UNIF	628.56	20.00	99.78	\N	\N	\N	NRH 4.0 N RESIDENCIAL	PREDIAL	\N	IMOVEL ORIUNDO DA UNIF. DOS LOTES 07 E 08 (EM 02/02/11)_____DOUGLAS A.	{"CódContábil":"0900.03","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Prof. Flavio Wustemberg, 225","CepImóvel":"13101-280","Zoneamento":null,"Receita":null,"Quarteirão":"10145","Quadra":"O","Lote":"07UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":"20","ÁreaPrincipal":"99,78","ÁreaDependência":"0","TipoPadrão":"NRH 4.0 N RESIDENCIAL","CategoriaImóvel":"PREDIAL","Alícota":null,"ÁreaTerreno":"628,56","ÁreaExcedente":"0","Observações":"IMOVEL ORIUNDO DA UNIF. DOS LOTES 07 E 08 (EM 02/02/11)_____DOUGLAS A.","FotoPrincipal":null}	-22.9263830000000013	-47.0152002999999965	R. Prof. Flavio Wustemberg, 225, Campinas, SP - 13101-280	000.000.000
211	0980.02	93	4	3850	3364.21.74.0193.01001	2015-02-05 02:19:31.7288	2015-06-12 02:18:39.68794	f	f	\N	{"CódContábil":"0980.02","Bairro":"Jd. São Pedro de Viracopos (DEVOLVIDO)","Distrito":null,"CódBrás":"223850","CódIPTU":"044.923.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000039533","CódGrupo":"4","CódContador":"3850","CódCartograf":"3364.21.74.0193.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_04\\\\JARDIM_SAO_PEDRO_DE_VIRACOPOS.jpg","CódBrás_correto":"BR-22-3850"}	223850.02	Casa Residencial	Desativado	DEVOLVIDO/VENDIDO	R. Nacer Duek, 52 (R. catorze)	13056-164	\N	3	05016	33	08	282.50	10.00	92.00	156.00	\N	\N	RH-2.0 RESIDENCIAL HORIZONTAL	PREDIAL	0.00	FALTA TERMO DE ENTREGA DE CHAVES__DOUGLAS A 16/3/11\r\nDEVOLVIDO - SALA CEDIDA	{"CódContábil":"0980.02","Tipo":"Casa Residencial","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Nacer Duek, 52 (R. catorze)","CepImóvel":"13056-164","Zoneamento":null,"Receita":"3","Quarteirão":"05016","Quadra":"33","Lote":"08","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"10","ÁreaPrincipal":"92,00","ÁreaDependência":"0","TipoPadrão":"RH-2.0 RESIDENCIAL HORIZONTAL","CategoriaImóvel":"PREDIAL","Alícota":"0,4%","ÁreaTerreno":"282,50","ÁreaExcedente":"0","Observações":"FALTA TERMO DE ENTREGA DE CHAVES__DOUGLAS A 16/3/11\\r\\nDEVOLVIDO - SALA CEDIDA","FotoPrincipal":null}	\N	\N	R. Nacer Duek, 52 (R. catorze), Campinas, SP - 13056-164	044.923.600
154	0740.00	102	4	2940	\N	2015-02-05 02:19:21.929474	2015-06-12 02:17:28.683961	f	f	\N	{"CódContábil":"0740.00","Bairro":"Pq. Vista Alegre  (Devolvido)","Distrito":null,"CódBrás":null,"CódIPTU":"048.276.600","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"4","CódContador":"2940","CódCartograf":null,"CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-"}	222940.00	Casa Residencial	Desativado	DEVOLVIDO/VENDIDO	R. Anita Malfati, 338	13054-402	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IGREJA	\N	\N	Imovel devolvido	{"CódContábil":"0740.00","Tipo":"Casa Residencial","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Anita Malfati, 338","CepImóvel":"13054-402","Zoneamento":null,"Receita":null,"Quarteirão":null,"Quadra":null,"Lote":null,"CódLogradouro":null,"ÁreaGeoFreqLixo":null,"TestadaTerreno":null,"ÁreaPrincipal":null,"ÁreaDependência":null,"TipoPadrão":null,"CategoriaImóvel":null,"Alícota":null,"ÁreaTerreno":null,"ÁreaExcedente":null,"Observações":"Imovel devolvido","FotoPrincipal":null}	-22.9856324000000001	-47.1192121999999998	R. Anita Malfati, 338, Campinas, SP - 13054-402	048.276.600
103	0490.07	73	1	3346	3431.44.51.0450.01001	2015-02-05 02:19:13.325515	2015-06-12 02:16:22.482779	t	t	\N	{"CódContábil":"0490.07","Bairro":"Jd. Santa Lúcia","Distrito":null,"CódBrás":"223346","CódIPTU":"047.280.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.44.51.0450.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_SANTA_LUCIA.jpg","CódBrás_correto":"BR-22-3346"}	223346.07	Igreja	Em Funcionamento	PROPRIO	R. Cabo Verde, 302	13060-492	\N	\N	3993	45	08 UNIF	623.20	20.00	439.91	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	\N	1- Deverá ser legalizada a documentaçao de propriedade do lote 21, para posterior averbação da anexações e da construção.\r\n2- Providenciar os itens da observaçoes (GUIA I.P.T.U)____DOUGLAS A. 15/03/10	{"CódContábil":"0490.07","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Cabo Verde, 302","CepImóvel":"13060-492","Zoneamento":null,"Receita":null,"Quarteirão":"3993","Quadra":"45","Lote":"08 UNIF","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"439,91","ÁreaDependência":null,"TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":null,"ÁreaTerreno":"623,20","ÁreaExcedente":null,"Observações":"1- Deverá ser legalizada a documentaçao de propriedade do lote 21, para posterior averbação da anexações e da construção.\\r\\n2- Providenciar os itens da observaçoes (GUIA I.P.T.U)____DOUGLAS A. 15/03/10","FotoPrincipal":null}	-22.9364880999999983	-47.1192643999999987	R. Cabo Verde, 302, Campinas, SP - 13060-492	047.280.100
162	0770.00	79	4	4074	3434.54.37.0320.00000	2015-02-05 02:19:23.225001	2015-06-12 02:17:38.51304	f	f	\N	{"CódContábil":"0770.00","Bairro":"Jd. Icaraí (Devolvido)","Distrito":null,"CódBrás":"224074","CódIPTU":"047.888.200","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":null,"CódGrupo":"4","CódContador":"4074","CódCartograf":"3434.54.37.0320.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-4074"}	224074.00	Casa Residencial	Desativado	DEVOLVIDO/VENDIDO	Av. Rafael de Paula Oliveira , nº 197	13051-415	\N	3	04129	f	029	315.00	13.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Imovel devolvido ( já aberta a casa de oração propria em 2009) Não pagar IPTU!	{"CódContábil":"0770.00","Tipo":"Casa Residencial","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"Av. Rafael de Paula Oliveira , nº 197","CepImóvel":"13051-415","Zoneamento":null,"Receita":"3","Quarteirão":"04129","Quadra":"f","Lote":"029","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"13","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"315","ÁreaExcedente":null,"Observações":"Imovel devolvido ( já aberta a casa de oração propria em 2009) Não pagar IPTU!","FotoPrincipal":null}	-22.9538051000000003	-47.0760006000000004	Av. Rafael de Paula Oliveira , nº 197, Campinas, SP - 13051-415	047.888.200
190	0900.00	85	5	3513	3442.52.28.0245.00000	2015-02-05 02:19:28.153909	2015-06-12 02:18:12.981165	f	f	\N	{"CódContábil":"0900.00","Bairro":"Jd. Tamoio (Devolvido)","Distrito":null,"CódBrás":"223513","CódIPTU":"055.058.941","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"5","CódContador":"3513","CódCartograf":"3442.52.28.0245.00000","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3513"}	223513.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Gabriel Mascaro, 06	13097-290	\N	3	10149	S	044	256.12	20.07	\N	1.00	\N	\N	TERRENO	\N	0.00	CCB paga IPTU	{"CódContábil":"0900.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Gabriel Mascaro, 06","CepImóvel":"13097-290","Zoneamento":null,"Receita":"3","Quarteirão":"10149","Quadra":"S","Lote":"044","CódLogradouro":"3657","ÁreaGeoFreqLixo":"1 = 301 d/a","TestadaTerreno":"20,07","ÁreaPrincipal":"0","ÁreaDependência":"0","TipoPadrão":"Terreno sem construção","CategoriaImóvel":null,"Alícota":"0","ÁreaTerreno":"256,12","ÁreaExcedente":"0","Observações":"CCB paga IPTU","FotoPrincipal":null}	-22.9271467000000015	-47.0149496000000013	R. Gabriel Mascaro, 06, Campinas, SP - 13097-290	055.058.941
97	0490.00	73	1	3346	3431.44.51.0490.01001	2015-02-05 02:19:12.346418	2015-06-12 02:16:15.04029	f	f	\N	{"CódContábil":"0490.00","Bairro":"Jd. Santa Lúcia (Devolvido)","Distrito":null,"CódBrás":"223346","CódIPTU":"047.279.700","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3346","CódCartograf":"3431.44.51.0490.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-3346"}	223346.00	Outros Fins	Desativado	DEVOLVIDO/VENDIDO	R. Cabo Verde, 356	13060-562	01	2	03993	45	03	448.80	10.00	96.74	2.00	\N	\N	C 14	com. Horiz.	0.03	IMOVEL DEVOLVIDO\r\nSegundo contrato de aluguel, CCB não Paga IPTU (com a revisão 2002-agora paga)	{"CódContábil":"0490.00","Tipo":"Outros Fins","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Cabo Verde, 356","CepImóvel":"13060-562","Zoneamento":"01","Receita":"2","Quarteirão":"03993","Quadra":"45","Lote":"03","CódLogradouro":"1428","ÁreaGeoFreqLixo":"2=156 d/a","TestadaTerreno":"10","ÁreaPrincipal":"96,74","ÁreaDependência":"0","TipoPadrão":"C 14","CategoriaImóvel":"com. Horiz.","Alícota":"3","ÁreaTerreno":"448,8","ÁreaExcedente":"0","Observações":"IMOVEL DEVOLVIDO\\r\\nSegundo contrato de aluguel, CCB não Paga IPTU (com a revisão 2002-agora paga)","FotoPrincipal":null}	-22.9364880999999983	-47.1192643999999987	R. Cabo Verde, 356, Campinas, SP - 13060-562	047.279.700
178	0850.00	80	1	3120	3433.42.47.0056.01001	2015-02-05 02:19:25.99726	2015-06-12 02:17:58.203446	f	f	\N	{"CódContábil":"0850.00","Bairro":"Vl. Palácios","Distrito":null,"CódBrás":"223120","CódIPTU":"000.000.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"1","CódContador":"3120","CódCartograf":"3433.42.47.0056.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\VILA_PALACIOS.jpg","CódBrás_correto":"BR-22-3120"}	223120.00	Igreja	Desativado	DEVOLVIDO/VENDIDO	R. Paulo de Castro Ferraz, 64	13060-664	\N	2	04093	J	16/ MOD	582.62	13.07	356.00	156.00	\N	\N	NRH 7.0	PREDIAL	0.01	Entregue as chaves em 03/10/2013 - DEVOLVIDO O IMOVEL EM 30/09/2013	{"CódContábil":"0850.00","Tipo":"Igreja","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Paulo de Castro Ferraz, 64","CepImóvel":"13060-664","Zoneamento":null,"Receita":"2","Quarteirão":"04093","Quadra":"J","Lote":"16/ MOD","CódLogradouro":"63,149","ÁreaGeoFreqLixo":"156","TestadaTerreno":"13,07","ÁreaPrincipal":"356,00","ÁreaDependência":"0","TipoPadrão":"NRH 7.0","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"582,62","ÁreaExcedente":"0","Observações":"Entregue as chaves em 03/10/2013 - DEVOLVIDO O IMOVEL EM 30/09/2013","FotoPrincipal":null}	-22.9495247999999989	-47.1193464999999989	R. Paulo de Castro Ferraz, 64, Campinas, SP - 13060-664	000.000.000
243	0560.05	51	5	0300	3444.14.03.0001.00000	2015-02-05 02:19:37.27472	2015-06-12 02:19:20.789216	t	f	\N	{"CódContábil":"0560.05","Bairro":"Jd. São Vicente","Distrito":null,"CódBrás":"220300","CódIPTU":"039.683.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000679173","CódGrupo":"5","CódContador":"0300","CódCartograf":"3444.14.03.0001.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\CCLINUX-SERVER\\\\ccb-campinas\\\\PATRIMONIO\\\\4- GESTAO DE DOCUMENTOS\\\\2- IMOVEIS DIGITAIS\\\\0560.05_JARDIM_SAO_VICENTE\\\\pat_560.04_0300_foto.frente_qdM_lt32-SUB.jpg","CódBrás_correto":"BR-22-0300"}	220300.05	Estacionamento	Em Funcionamento	PROPRIO	Rua Francisco João Carlos Eberl (Antiga rua 07)	13045-160	\N	3	2535	M	32. SUBD	226.00	17.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	Are terreno 2007 225m²	{"CódContábil":"0560.05","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"Rua Francisco João Carlos Eberl (Antiga rua 07)","CepImóvel":"13045-160","Zoneamento":null,"Receita":"3","Quarteirão":"2535","Quadra":"M","Lote":"32. SUBD","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"17","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,3%","ÁreaTerreno":"226,00","ÁreaExcedente":"0","Observações":"Are terreno 2007 225m²","FotoPrincipal":null}	-22.9473352000000013	-47.0267217000000031	Rua Francisco João Carlos Eberl (Antiga rua 07), Campinas, SP - 13045-160	039.683.000
81	0430.00	36	5	0296	3432.64.84.0376.01001	2015-02-05 02:19:09.402412	2015-06-12 02:15:55.510741	t	t	\N	{"CódContábil":"0430.00","Bairro":"Jd. Nova Europa","Distrito":null,"CódBrás":"22-02-96","CódIPTU":"012.600.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001512753","CódGrupo":"5","CódContador":"0296","CódCartograf":"3432.64.84.0376.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_05\\\\JARDIM_NOVA_EUROPA.JPG","CódBrás_correto":"BR-22-0296"}	220296.00	Igreja	Em Funcionamento	PROPRIO	R. República Dominicana, 687	13040-107	03	2	02089	87	028	700.00	20.00	337.53	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0430.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. República Dominicana, 687","CepImóvel":"13040-107","Zoneamento":"03","Receita":"2","Quarteirão":"02089","Quadra":"87","Lote":"028","CódLogradouro":"7685","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"337,53","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"700,00","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.9353011000000002	-47.0633201999999997	R. República Dominicana, 687, Campinas, SP - 13040-107	012.600.100
116	0560.03	51	5	0300	3444.13.81.0485.01001	2015-02-05 02:19:15.536484	2015-06-12 02:16:38.815301	f	f	\N	{"CódContábil":"0560.03","Bairro":"Jd. São Vicente (Devolvido)","Distrito":null,"CódBrás":"22-03-00","CódIPTU":"042.137.703","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000000000","CódGrupo":"5","CódContador":"0300","CódCartograf":"3444.13.81.0485.01001","CasaOração":"0","Oficialização":null,"Ativo":"0","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\foto.ico","CódBrás_correto":"BR-22-0300"}	220300.03	Barracão	Desativado	DEVOLVIDO/VENDIDO	R. Francisco João Carlos Eberl, 476	13045-160	\N	2	02532	J	28 unif	450.00	15.00	178.00	156.00	\N	\N	NRH-1.0	PREDIAL	0.01	2- DEVOLVIDO (2008)\r\n1- Barracão será entregue em novembro de 2007( Verificar entrega)	{"CódContábil":"0560.03","Tipo":"Barracão","Andamento":"Desativado","Situação":"DEVOLVIDO/VENDIDO","EndereçoImóvel":"R. Francisco João Carlos Eberl, 476","CepImóvel":"13045-160","Zoneamento":null,"Receita":"2","Quarteirão":"02532","Quadra":"J","Lote":"28 unif","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"15","ÁreaPrincipal":"178,00","ÁreaDependência":"0","TipoPadrão":"NRH-1.0","CategoriaImóvel":"PREDIAL","Alícota":"1,1%","ÁreaTerreno":"450,00","ÁreaExcedente":"0","Observações":"2- DEVOLVIDO (2008)\\r\\n1- Barracão será entregue em novembro de 2007( Verificar entrega)","FotoPrincipal":null}	-22.9472476000000007	-47.0269338000000019	R. Francisco João Carlos Eberl, 476, Campinas, SP - 13045-160	042.137.703
39	0230.04	50	4	2846	3344.32.14.0001.00000	2015-02-05 02:19:02.207784	2015-06-12 02:15:08.491404	t	f	\N	{"CódContábil":"0230.04","Bairro":"Cidade Satelite Iris I","Distrito":null,"CódBrás":"222846","CódIPTU":"042.609.100","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000412953","CódGrupo":"4","CódContador":"2846","CódCartograf":"3344.32.14.0001.00000","CasaOração":"0","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\1- COLABORADORES  PATRIMONIO\\\\DOUGLAS ABBRUZZESE BISPO\\\\FOTOS.IGREJAS.E.TERRENOS\\\\CCB TERRENOS\\\\SAT. IRIS I - TERRENO FRENTE CANTO____MINI.JPG","CódBrás_correto":"BR-22-2846"}	222846.04	Estacionamento	Em Funcionamento	PROPRIO	R. Pe. Jean François Jobard (Pe.Chiquinho) ant.65, 000	13059-665	\N	3	4485	60	09	600.00	20.00	\N	156.00	\N	\N	TERRENO	TERRITORIAL	0.02	ESTE SE LOCALIZA NA ESQUINA DA FRENTE DA CASA DE ORAÇÃO	{"CódContábil":"0230.04","Tipo":"Estacionamento","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Pe. Jean François Jobard (Pe.Chiquinho) ant.65, 000","CepImóvel":"13059-665","Zoneamento":null,"Receita":"3","Quarteirão":"4485","Quadra":"60","Lote":"09","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"20,00","ÁreaPrincipal":"0","ÁreaDependência":null,"TipoPadrão":"TERRENO","CategoriaImóvel":"TERRITORIAL","Alícota":"2,30%","ÁreaTerreno":"600,00","ÁreaExcedente":null,"Observações":"ESTE SE LOCALIZA NA ESQUINA DA FRENTE DA CASA DE ORAÇÃO","FotoPrincipal":null}	-22.9411033000000018	-47.1318282000000011	R. Pe. Jean François Jobard (Pe.Chiquinho) ant.65, 000, Campinas, SP - 13059-665	042.609.100
140	0680.02	76	3	3640	3244.22.53.0468.01001	2015-02-05 02:19:19.603544	2015-06-12 02:17:10.774928	t	t	\N	{"CódContábil":"0680.02","Bairro":"Pq. dos Pomares","Distrito":null,"CódBrás":"22-36-40","CódIPTU":"055.056.995","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"000519612","CódGrupo":"3","CódContador":"3640","CódCartograf":"3244.22.53.0468.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_03\\\\PARQUE_DOS_POMARES.jpg","CódBrás_correto":"BR-22-3640"}	223640.02	Igreja	Em Funcionamento	PROPRIO	R. Jarbas de Carvalho Asbahr, 29	13098-000	03	3	7986	F	25	507.63	15.50	592.57	156.00	\N	\N	MISTO - VER ITEM 06 NA FL 03	PREDIAL	0.01	\N	{"CódContábil":"0680.02","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Jarbas de Carvalho Asbahr, 29","CepImóvel":"13098-000","Zoneamento":"03","Receita":"3","Quarteirão":"7986","Quadra":"F","Lote":"25","CódLogradouro":null,"ÁreaGeoFreqLixo":"156","TestadaTerreno":"15,50","ÁreaPrincipal":"592,57","ÁreaDependência":"0","TipoPadrão":"MISTO - VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"507,63","ÁreaExcedente":"0","Observações":null,"FotoPrincipal":null}	-22.8157427999999989	-47.0116699000000011	R. Jarbas de Carvalho Asbahr, 29, Campinas, SP - 13098-000	055.056.995
71	0390.00	31	1	0316	3343.41.14.0436.01001	2015-02-05 02:19:07.747427	2015-06-12 02:15:43.159838	t	t	\N	{"CódContábil":"0390.00","Bairro":"Jd. Metonópolis","Distrito":null,"CódBrás":"22-03-16","CódIPTU":"047.438.000","CódForçaLuz":null,"CódSaneamento":null,"CódMatrículaRegistro":"001206243","CódGrupo":"1","CódContador":"0316","CódCartograf":"3343.41.14.0436.01001","CasaOração":"1","Oficialização":null,"Ativo":"1","LinkFoto":"\\\\\\\\192.168.1.3\\\\ccb-campinas\\\\PATRIMONIO\\\\BANCO_DADOS\\\\IGREJAS\\\\SETOR_01\\\\JARDIM_METONOPOLIS.JPG","CódBrás_correto":"BR-22-0316"}	220316.00	Igreja	Em Funcionamento	PROPRIO	R. Daniel Moacyr Novaes Lipp, 415	13058-321	01	2	05704	H	022-UNI	1370.00	20.00	654.43	156.00	\N	\N	MISTO VER ITEM 06 NA FL 03	PREDIAL	0.01	2003 - excluido 126,90m2 area dependencia	{"CódContábil":"0390.00","Tipo":"Igreja","Andamento":"Em Funcionamento","Situação":"PROPRIO","EndereçoImóvel":"R. Daniel Moacyr Novaes Lipp, 415","CepImóvel":"13058-321","Zoneamento":"01","Receita":"2","Quarteirão":"05704","Quadra":"H","Lote":"022-UNI","CódLogradouro":"2352","ÁreaGeoFreqLixo":"156","TestadaTerreno":"20","ÁreaPrincipal":"654,43","ÁreaDependência":"0","TipoPadrão":"MISTO VER ITEM 06 NA FL 03","CategoriaImóvel":"PREDIAL","Alícota":"1,3%","ÁreaTerreno":"1.370,00","ÁreaExcedente":"0","Observações":"2003 - excluido 126,90m2 area dependencia","FotoPrincipal":null}	-22.9515184999999988	-47.1869445000000027	R. Daniel Moacyr Novaes Lipp, 415, Campinas, SP - 13058-321	047.438.000
\.


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('properties_id_seq', 257, false);


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY requests (id, requested_at, returned_at, return_in, is_active, user_id, requestable_type, requestable_id, requester, requester_phone_number, created_at, updated_at, requester_church, comment, meta) FROM stdin;
1	2016-05-17 22:03:43.057	2016-08-02 19:44:25	\N	f	1	Document	4394	Mauro Janine	\N	2016-06-23 04:15:57.530211	2016-08-02 19:44:26.11062	\N	\N	{"document":{"id":4394,"document_type_id":17,"expires_at":null,"is_possible":true,"is_active":false,"created_at":"2015-04-08T11:10:35.116-03:00","updated_at":"2015-04-08T11:10:35.612-03:00","documentable_id":252,"documentable_type":"Property","attachments_count":0,"number":null,"issue_date":null,"active_requests_count":null},"document_type":{"id":17,"title":"10 Cópia do IPTU","order":18,"is_mandatory":true,"is_active":true,"created_at":"2015-03-02T13:52:54.469-03:00","updated_at":"2015-03-27T20:37:00.797-03:00","code":"10","short_name":"Atualização IPTU","is_expirable":true},"church":{"id":50,"name":"Cidade Satelite Iris I","bras_code":"22-28-46","heritage_code":"0230.00","2000_code":"51","created_at":null,"updated_at":"2015-06-03T23:03:02.329-03:00","group_id":11,"picture":{"url":"http://res.cloudinary.com/hmj5guwuy/image/upload/v1433383385/tkgdcrm2kwchccsql2dg.jpg"}},"property":{"id":252,"code":"0230.01","church_id":50,"group_code":"4","accountant_code":"2846","cartographic_code":"3344.23.76.0556.00000","created_at":"2015-02-05T00:19:38.740-02:00","updated_at":"2015-06-11T23:19:31.786-03:00","is_active":true,"has_church":false,"market_price":null,"title":"222846.01","category":"Outros Fins","status":"Desativado","situation":"PROPRIO","address":"R. Dr. Carlos Macia, 23","zipcode":"13059-682","zone":"3","income":3,"quarter":"04475","court":"50","lot":"47","terrain_area":"695.0","width_area":"20.0","main_area":null,"trash_area":"2.0","secondary_area":null,"excess_area":null,"default_type":"TERRENO","default_category":"Sem Construção","rate":"0.0","latitude":-22.941633,"longitude":-47.1423661,"full_address":"R. Dr. Carlos Macia, 23, Campinas, SP - 13059-682","tax_code":"042.664.800"}}
2	2016-08-01 03:00:00	\N	2016-08-30 03:00:00	t	1	Document	470	Jessé Pinheiro	(19) 992.460.411	2016-08-02 20:44:13.343442	2016-08-08 02:31:23.975157	Parque Brasília	\N	{"document":{"id":470,"document_type_id":5,"expires_at":null,"is_possible":true,"is_active":false,"created_at":"2015-03-28T07:41:20.337-03:00","updated_at":"2016-08-07T23:31:23.815-03:00","documentable_id":10,"documentable_type":"Property","attachments_count":0,"number":null,"issue_date":null,"active_requests_count":1,"status_id":"DOC_AVAILABLE","comments_count":0},"document_type":{"id":5,"title":"03.1 Certidão de anexação","order":3,"is_mandatory":true,"is_active":true,"created_at":"2015-03-02T13:52:48.513-03:00","updated_at":"2015-03-27T20:36:56.942-03:00","code":"03.1","short_name":"Certidão de anexação","is_expirable":false},"church":{"id":39,"name":"Real Parque","bras_code":"22-19-69","heritage_code":"0140.00","2000_code":"40","created_at":null,"updated_at":"2015-06-03T23:02:27.668-03:00","group_id":11,"picture":{"url":"http://res.cloudinary.com/hmj5guwuy/image/upload/v1433383352/mnbvjwok3gd3kl5agqd2.jpg"}},"property":{"id":10,"code":"0140.00","church_id":39,"group_code":"3","accountant_code":"1969","cartographic_code":"3233.62.10.0179.01001","created_at":"2015-02-05T00:18:56.881-02:00","updated_at":"2015-06-11T23:10:38.283-03:00","is_active":true,"has_church":true,"market_price":null,"title":"221969.00","category":"Igreja","status":"Em Funcionamento","situation":"PROPRIO","address":"R. Aguinaldo dos Santos Filho, 21","zipcode":"13082-791","zone":"3","income":2,"quarter":"00088","court":"D","lot":"18 / Unif","terrain_area":"620.0","width_area":"20.0","main_area":"326.82","trash_area":"1.0","secondary_area":null,"excess_area":null,"default_type":"NRH-7.0 N RES. HORIZ","default_category":"PREDIAL","rate":"0.01","latitude":-22.8273364,"longitude":-47.0983432,"full_address":"R. Aguinaldo dos Santos Filho, 21, Campinas, SP - 13082-791","tax_code":"072.472.000"}}
3	2016-08-04 03:00:00	2016-08-04 22:57:18	2016-08-26 03:00:00	f	1039	Document	575	ismael	32681634	2016-08-04 22:43:26.825627	2016-08-04 22:57:17.917829	Jd Londres	Para fins de registro.	{"document":{"id":575,"document_type_id":2,"expires_at":null,"is_possible":true,"is_active":true,"created_at":"2015-03-28T07:42:38.608-03:00","updated_at":"2016-08-04T19:43:26.835-03:00","documentable_id":4,"documentable_type":"Property","attachments_count":0,"number":null,"issue_date":null,"active_requests_count":1,"status_id":4},"document_type":{"id":2,"title":"01 Escritura da Compra","order":0,"is_mandatory":true,"is_active":true,"created_at":"2015-03-02T13:52:47.029-03:00","updated_at":"2015-03-27T20:36:55.880-03:00","code":"01","short_name":"Escritura de Compra","is_expirable":false},"church":{"id":4,"name":"Alto Cidade Universitária","bras_code":"22-25-58","heritage_code":"0110.00","2000_code":"04","created_at":null,"updated_at":"2015-04-28T20:45:24.001-03:00","group_id":11,"picture":{"url":"http://res.cloudinary.com/hmj5guwuy/image/upload/v1430264732/zrntrgmdq6tsk3aw7enk.jpg"}},"property":{"id":4,"code":"0110.00","church_id":4,"group_code":"3","accountant_code":"2558","cartographic_code":"3214.62.92.0034.01001","created_at":"2015-02-05T00:18:55.750-02:00","updated_at":"2015-06-11T23:14:38.778-03:00","is_active":true,"has_church":true,"market_price":null,"title":"222558.00","category":"Igreja","status":"Em Funcionamento","situation":"PROPRIO","address":"R. Mário Honório dos Santos, 87","zipcode":"13085-535","zone":"11 BG","income":3,"quarter":"00629","court":"B","lot":"03","terrain_area":"399.27","width_area":"17.97","main_area":"444.75","trash_area":"156.0","secondary_area":null,"excess_area":null,"default_type":"MISTO - VER ITEM 06 NA FL 03","default_category":"PREDIAL","rate":"0.01","latitude":-22.7853824,"longitude":-47.0629627,"full_address":"R. Mário Honório dos Santos, 87, Campinas, SP - 13085-535","tax_code":"055.064.279"}}
\.


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('requests_id_seq', 3, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20140708011829
20140708014418
20140708185606
20140709134245
20140715005707
20140715012302
20140715014308
20140715232817
20140716004857
20140716005205
20140716225022
20140716231024
20140719180004
20140721185539
20140721191431
20140721194817
20140721195802
20140721210347
20140721234533
20140722001715
20140723002737
20140725021452
20140729002338
20140729005618
20140730233921
20140805001613
20140805001702
20140814003455
20140818234839
20140825234816
20140828020633
20150122233158
20150124205512
20150124163249
20150129203132
20150130194119
20150131160225
20150226205126
20150302150333
20150302173621
20150302181702
20150302182234
20150302192023
20150302201025
20150327233243
20150331175808
20150412164929
20150414234717
20150506184948
20150506191505
20150607215130
20150609135416
20150609140724
20150612013202
20150817235906
20160504003102
20160504003800
20160728144249
20160729211740
20160730012556
20160802130421
20160803183045
20160803185430
20160804213919
20160805142655
20160805152934
20160805203901
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY skills (id, name, model, name_pt_br, model_pt_br, created_at, updated_at) FROM stdin;
1	manage	Church	Gerenciar	Igrejas	2014-07-24 02:07:55+00	2014-07-24 02:07:55+00
642	manage	Document	Gerenciar	Documentos	2015-05-26 14:05:39.713549+00	2015-05-26 14:05:39.713549+00
643	manage	Attachment	Gerenciar	Anexos	2015-05-26 14:05:40.510031+00	2015-05-26 14:05:40.510031+00
644	manage	Property	Gerenciar	Imóveis	2015-05-26 14:05:42.718406+00	2015-05-26 14:05:42.718406+00
645	show	Church	Ler	Igrejas	2015-05-31 21:57:48.068846+00	2015-05-31 21:57:58.195727+00
646	show	Document	Ler	Documentos	\N	\N
647	show	Church	Ler	Igrejas	\N	\N
121	manage	User	Gerenciar	Usuários	2014-07-24 02:08:10+00	2014-07-24 02:08:10+00
648	show	Property	Ler	Imóveis	\N	\N
\.


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('skills_id_seq', 648, false);


--
-- Data for Name: skills_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY skills_users (id, user_id, skill_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: skills_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('skills_users_id_seq', 1, false);


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY statuses (uid, statusable_type, title, color, is_active, description, "order", meta, created_at, updated_at) FROM stdin;
DOC_NONE	Document	Não informado	#ecf0f1	f	\N	1	{}	2016-08-05 22:48:55.643525	2016-08-05 22:48:55.643525
DOC_MISSING	Document	Ausente (primordial)	#c0392b	f	\N	2	{}	2016-08-05 22:48:55.657409	2016-08-05 22:48:55.657409
DOC_EXPIRED	Document	Vencido	#e67e22	t	\N	3	{"auto":true}	2016-08-05 22:48:55.662491	2016-08-05 22:48:55.662491
DOC_AVAILABLE	Document	Presente	#f1c40f	f	\N	5	{}	2016-08-05 22:48:55.667122	2016-08-05 22:48:55.667122
DOC_UPLOADED	Document	Presente e digitalizado	#27ae60	f	\N	6	{"auto":true}	2016-08-05 22:48:55.671766	2016-08-05 22:48:55.671766
DOC_UNNECESSARY	Document	Não é necessário	#34495e	f	\N	7	{}	2016-08-05 22:48:55.676426	2016-08-05 22:48:55.676426
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tokens (id, token, user_id, expire_at, created_at, updated_at) FROM stdin;
3086	7d9dc79f429a575a3c4573c8c750df53	1	2016-08-26 17:48:13.435466	2016-08-26 17:17:24.793863	2016-08-26 17:18:13.435776
3083	9255e96d743431236cddffc459489b3e	1	2016-08-25 22:19:54.640317	2016-08-25 21:36:33.506898	2016-08-25 21:49:54.640662
3084	92d4a7720bcc9a209866ec7d260a677e	1	2016-08-26 03:08:50.072053	2016-08-26 01:59:51.166225	2016-08-26 02:38:50.072439
3085	ddb315483f7e6e2b0badb1bc76ef1022	1	2016-08-26 12:52:19.542664	2016-08-26 12:22:16.574077	2016-08-26 12:22:19.543073
\.


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tokens_id_seq', 3087, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, group_id, is_admin, church_id, profile_id, first_name, last_name) FROM stdin;
98	bolivar.teodoro@congregacao.org.br	03a2a375f478511d16b83ee7616fb5998e39c37f	\N	\N	\N	0	\N	\N	\N	\N	1	f	20	21	Bolivar	Teodoro
93	mizraimclima@yahoo.com.br	298a9339422643c3d3aee81bbad5e50b7b4b6310	\N	\N	\N	0	\N	\N	\N	\N	1	t	8	1	Mizraim	Lima
92	usuario@congregacao.org.br	7c4a8d09ca3762af61e59520943dc26494f8941b	\N	\N	\N	0	\N	\N	\N	\N	1	\N	1	31	Usuário	Padrão
1	jessebpinheiro@hotmail.com	7110eda4d09e062aa5e4a390b0a572ac0d2c0220	\N	\N	\N	56	2014-12-16 15:40:48.368129+00	2014-12-16 13:31:15.7346+00	191.17.164.122	191.17.164.122	1	t	10	1	Jessé	Pinheiro
96	wesleyfabosa@yahoo.com.br	dc47cba7a6eaa64b4073485680de9bda6cff6270	\N	\N	\N	0	\N	\N	\N	\N	1	f	5	11	Wesley	Fabosa
95	douglas.bispo@congregacao.org.br	298a9339422643c3d3aee81bbad5e50b7b4b6310	\N	\N	\N	0	\N	\N	\N	\N	1	f	30	21	Douglas	Bispo
97	biabellaitalia@hotmail.com	4e1e0fd450a9097908e41b39ab3cd2a68980e99b	\N	\N	\N	0	\N	\N	\N	\N	1	f	1	21	Beatriz	Pinheiro
1237	engdecicco@yahoo.com.br	3cb22e24c945ae4f1263726265ea602758e2bf56	\N	\N	\N	0	\N	\N	\N	\N	1	f	26	11	Allex	Rolli de Cicco
1039	zauleismael5c@gmail.com	0794a5c7e497910d682bf2c54c66cc30760c0221	\N	\N	\N	0	\N	\N	\N	\N	1	f	26	11	Ismael	Macedo
345	abner.fellipe@congregacao.org.br	298a9339422643c3d3aee81bbad5e50b7b4b6310	\N	\N	\N	0	\N	\N	\N	\N	1	f	17	21	Abner	Fellipe
346	lyppe2004@hotmail.com	298a9339422643c3d3aee81bbad5e50b7b4b6310	\N	\N	\N	0	\N	\N	\N	\N	1	f	17	21	Abraão	Fellipe
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1473, false);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY versions (id, item_type, item_id, event, whodunnit, object, created_at) FROM stdin;
1	User	1	update	\N	---\nemail: jessebpinheiro@hotmail.com\nencrypted_password: "$2a$10$TYvh8aIK.D44zP7tyyNmkeXxx1Cs8eop7tOq5oTpfbXkYxp9M2Hpy"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: 2014-08-24 15:10:51.000000000 Z\nsign_in_count: 52\ncurrent_sign_in_at: 2014-12-01 11:26:21.000000000 Z\nlast_sign_in_at: 2014-09-10 00:15:18.000000000 Z\ncurrent_sign_in_ip: 189.111.30.108\nlast_sign_in_ip: 179.159.175.114\ngroup_id: 1\nis_admin: true\nchurch_id: 10\nprofile_id: 1\nfirst_name: Jessé\nlast_name: Pinheiro\nid: 1\n	2014-12-15 23:40:58.738772+00
2	User	1	update	1	---\nemail: jessebpinheiro@hotmail.com\nencrypted_password: "$2a$10$TYvh8aIK.D44zP7tyyNmkeXxx1Cs8eop7tOq5oTpfbXkYxp9M2Hpy"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: 2014-08-24 15:10:51.000000000 Z\nsign_in_count: 53\ncurrent_sign_in_at: 2014-12-15 23:40:55.940701000 Z\nlast_sign_in_at: 2014-12-01 11:26:21.000000000 Z\ncurrent_sign_in_ip: 127.0.0.1\nlast_sign_in_ip: 189.111.30.108\ngroup_id: 1\nis_admin: true\nchurch_id: 10\nprofile_id: 1\nfirst_name: Jessé\nlast_name: Pinheiro\nid: 1\n	2014-12-16 00:20:36.844695+00
3	User	1	update	\N	---\nemail: jessebpinheiro@hotmail.com\nencrypted_password: "$2a$10$TYvh8aIK.D44zP7tyyNmkeXxx1Cs8eop7tOq5oTpfbXkYxp9M2Hpy"\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 53\ncurrent_sign_in_at: 2014-12-15 23:40:55.940701000 Z\nlast_sign_in_at: 2014-12-01 11:26:21.000000000 Z\ncurrent_sign_in_ip: 127.0.0.1\nlast_sign_in_ip: 189.111.30.108\ngroup_id: 1\nis_admin: true\nchurch_id: 10\nprofile_id: 1\nfirst_name: Jessé\nlast_name: Pinheiro\nid: 1\n	2014-12-16 00:40:12.664095+00
4	User	1	update	\N	---\nemail: jessebpinheiro@hotmail.com\nencrypted_password: $2a$10$TYvh8aIK.D44zP7tyyNmkeXxx1Cs8eop7tOq5oTpfbXkYxp9M2Hpy\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 54\ncurrent_sign_in_at: 2014-12-16 00:40:10.385727000 Z\nlast_sign_in_at: 2014-12-15 23:40:55.940701000 Z\ncurrent_sign_in_ip: 127.0.0.1\nlast_sign_in_ip: 127.0.0.1\ngroup_id: 1\nis_admin: true\nchurch_id: 10\nprofile_id: 1\nfirst_name: Jessé\nlast_name: Pinheiro\nid: 1\n	2014-12-16 13:31:15.852026+00
5	User	1	update	\N	---\nemail: jessebpinheiro@hotmail.com\nencrypted_password: $2a$10$TYvh8aIK.D44zP7tyyNmkeXxx1Cs8eop7tOq5oTpfbXkYxp9M2Hpy\nreset_password_token: \nreset_password_sent_at: \nremember_created_at: \nsign_in_count: 55\ncurrent_sign_in_at: 2014-12-16 13:31:15.734600000 Z\nlast_sign_in_at: 2014-12-16 00:40:10.385727000 Z\ncurrent_sign_in_ip: 191.17.164.122\nlast_sign_in_ip: 127.0.0.1\ngroup_id: 1\nis_admin: true\nchurch_id: 10\nprofile_id: 1\nfirst_name: Jessé\nlast_name: Pinheiro\nid: 1\n	2014-12-16 15:40:48.439347+00
6	Church	102	create	\N	\N	2015-01-26 22:01:02.727166+00
8	Church	1	update	\N	---\nid: 1\nname: Jd. Adhemar de Barros\nbras_code: 22-21-34\nheritage_code: '0250.00'\n2000_code: '01'\ncreated_at: \nupdated_at: 2014-07-22 14:02:09.000000000 Z\ngroup_id: 11\npicture: !ruby/object:PictureUploader\n  model: !ruby/object:Church\n    attributes:\n      id: 1\n      name: Jd. Adhemar de Barros\n      bras_code: 22-21-34\n      heritage_code: '0250.00'\n      2000_code: '01'\n      created_at: \n      updated_at: 2015-02-26 21:17:33.378044000 Z\n      group_id: 11\n      picture: vpqkgp33vytit10fxoun.jpg\n  mounted_as: :picture\n	2015-02-26 21:17:34.783682+00
9	Church	103	create	\N	\N	2015-02-26 21:42:48.540018+00
10	Church	103	update	\N	---\nid: 103\nname: Teste\nbras_code: 22-00-00\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 21:42:47.506948000 Z\ngroup_id: 1\npicture: \n	2015-02-26 21:49:14.752174+00
11	Church	103	update	\N	---\nid: 103\nname: Igreja teste\nbras_code: 22-00-00\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 21:49:13.906411000 Z\ngroup_id: 1\npicture: \n	2015-02-26 21:49:50.210042+00
12	Church	103	update	\N	---\nid: 103\nname: Igreja teste 1\nbras_code: 22-00-00\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 21:49:49.879723000 Z\ngroup_id: 1\npicture: \n	2015-02-26 22:07:08.52663+00
13	Church	103	update	\N	---\nid: 103\nname: Outra igreja\nbras_code: 22-00-00\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 22:07:08.194488000 Z\ngroup_id: 1\npicture: \n	2015-02-26 22:07:21.258743+00
14	Church	103	update	\N	---\nid: 103\nname: Outra igreja\nbras_code: 22-00-00-00\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 22:07:20.930096000 Z\ngroup_id: 1\npicture: \n	2015-02-26 22:07:26.569169+00
15	Church	103	update	\N	---\nid: 103\nname: Outra igreja\nbras_code: 22-00-00-XX\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 22:07:26.403700000 Z\ngroup_id: 1\npicture: !ruby/object:PictureUploader\n  model: !ruby/object:Church\n    attributes:\n      id: 103\n      name: Outra igreja\n      bras_code: 22-00-00-XX\n      heritage_code: '123'\n      2000_code: '123'\n      created_at: 2015-02-26 21:42:47.506948000 Z\n      updated_at: 2015-02-26 22:08:15.686710000 Z\n      group_id: 1\n      picture: mpjiuj1lxfjmuqdb2tpm.jpg\n  mounted_as: :picture\n	2015-02-26 22:08:16.180128+00
16	Church	103	update	\N	---\nid: 103\nname: Outra igreja\nbras_code: 22-00-00-XX\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 22:08:15.686710000 Z\ngroup_id: 1\npicture: !ruby/object:PictureUploader\n  model: !ruby/object:Church\n    attributes:\n      id: 103\n      name: Outra igreja\n      bras_code: 22-00-00-XX\n      heritage_code: '123'\n      2000_code: '123'\n      created_at: 2015-02-26 21:42:47.506948000 Z\n      updated_at: 2015-02-26 22:09:09.666771000 Z\n      group_id: 1\n      picture: v1424988498/mpjiuj1lxfjmuqdb2tpm.jpg\n  mounted_as: :picture\n  original_filename: mpjiuj1lxfjmuqdb2tpm.jpg\n  file: !ruby/object:Cloudinary::CarrierWave::CloudinaryFile\n    uploader: &1 !ruby/object:PictureUploader\n      model: !ruby/object:Church\n        attributes:\n          id: 103\n          name: Outra igreja\n          bras_code: 22-00-00-XX\n          heritage_code: '123'\n          2000_code: '123'\n          created_at: 2015-02-26 21:42:47.506948000 Z\n          updated_at: 2015-02-26 22:09:09.666771000 Z\n          group_id: 1\n          picture: v1424988498/mpjiuj1lxfjmuqdb2tpm.jpg\n      mounted_as: :picture\n      storage: !ruby/object:Cloudinary::CarrierWave::Storage\n        uploader: *1\n      cache_id: 1424988549-4209-3354\n      filename: jardim-londres.jpg\n      original_filename: jardim-londres.jpg\n      file: !ruby/object:CarrierWave::SanitizedFile\n        file: /Users/jesse/Dropbox/Sites/ccbonline/public/uploads/tmp/1424988549-4209-3354/jardim-londres.jpg\n        original_filename: \n        content_type: image/jpeg\n      versions: {}\n      public_id: mpjiuj1lxfjmuqdb2tpm\n      transformation: {}\n      stored_public_id: mpjiuj1lxfjmuqdb2tpm\n      stored_version: '1424988498'\n    identifier: v1424988498/mpjiuj1lxfjmuqdb2tpm.jpg\n    version: '1424988498'\n    filename: mpjiuj1lxfjmuqdb2tpm.jpg\n    storage_type: \n    resource_type: image\n    public_id: mpjiuj1lxfjmuqdb2tpm\n    format: jpg\n  public_id: mpjiuj1lxfjmuqdb2tpm\n  stored_public_id: mpjiuj1lxfjmuqdb2tpm\n  stored_version: '1424988498'\n	2015-02-26 22:09:09.998864+00
17	Church	103	destroy	\N	---\nid: 103\nname: Outra igreja\nbras_code: 22-00-00-XX\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 21:42:47.506948000 Z\nupdated_at: 2015-02-26 22:09:09.666771000 Z\ngroup_id: 1\npicture: v1424988498/mpjiuj1lxfjmuqdb2tpm.jpg\n	2015-02-26 22:10:46.117286+00
18	Church	104	create	\N	\N	2015-02-26 22:19:53.357184+00
19	Church	104	update	\N	---\nid: 104\nname: Teste\nbras_code: 22-00-00\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 22:19:53.186516000 Z\nupdated_at: 2015-02-26 22:19:53.186516000 Z\ngroup_id: 1\npicture: !ruby/object:PictureUploader\n  model: !ruby/object:Church\n    attributes:\n      id: 104\n      name: Outra igreja\n      bras_code: 22-00-00-XX\n      heritage_code: '123'\n      2000_code: '123'\n      created_at: 2015-02-26 22:19:53.186516000 Z\n      updated_at: 2015-02-26 22:20:01.849492000 Z\n      group_id: 1\n      picture: zcqmqj4rqwrmffwbie6e.jpg\n  mounted_as: :picture\n	2015-02-26 22:20:02.519385+00
20	Church	104	update	\N	---\nid: 104\nname: Outra igreja\nbras_code: 22-00-00-XX\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 22:19:53.186516000 Z\nupdated_at: 2015-02-26 22:20:01.849492000 Z\ngroup_id: 1\npicture: v1424989204/zcqmqj4rqwrmffwbie6e.jpg\n	2015-02-26 23:54:28.327987+00
21	Church	104	update	\N	---\nid: 104\nname: Church\nbras_code: Bras\nheritage_code: '123'\n2000_code: '123'\ncreated_at: 2015-02-26 22:19:53.186516000 Z\nupdated_at: 2015-02-26 23:54:27.440325000 Z\ngroup_id: 1\npicture: v1424989204/zcqmqj4rqwrmffwbie6e.jpg\n	2015-02-26 23:57:24.052289+00
22	Church	104	update	\N	---\nid: 104\nname: Church\nbras_code: Bras\nheritage_code: 08890890\n2000_code: '123'\ncreated_at: 2015-02-26 22:19:53.186516000 Z\nupdated_at: 2015-02-26 23:57:23.721293000 Z\ngroup_id: 1\npicture: v1424989204/zcqmqj4rqwrmffwbie6e.jpg\n	2015-02-26 23:57:32.27008+00
23	Church	2	update	\N	---\nid: 2\nname: Jd. Aeroporto (R. Cairí)\nbras_code: 22-03-13\nheritage_code: '0800.00'\n2000_code: '02'\ncreated_at: \nupdated_at: 2014-07-22 14:02:10.000000000 Z\ngroup_id: 11\npicture: !ruby/object:PictureUploader\n  model: !ruby/object:Church\n    attributes:\n      id: 2\n      name: Jd. Aeroporto (R. Cairí)\n      bras_code: 22-03-13\n      heritage_code: '0800.00'\n      2000_code: '02'\n      created_at: \n      updated_at: 2015-02-27 01:45:10.126564000 Z\n      group_id: 11\n      picture: nsxh48vszudktdldtqd4.jpg\n  mounted_as: :picture\n	2015-02-27 01:45:11.133578+00
24	Church	3	update	\N	---\nid: 3\nname: Vl. Aeroporto (Maria Rosa)\nbras_code: 22-03-08\nheritage_code: '0790.02'\n2000_code: '03'\ncreated_at: \nupdated_at: 2014-07-22 14:02:10.000000000 Z\ngroup_id: 11\npicture: !ruby/object:PictureUploader\n  model: !ruby/object:Church\n    attributes:\n      id: 3\n      name: Vl. Aeroporto (Maria Rosa)\n      bras_code: 22-03-08\n      heritage_code: '0790.02'\n      2000_code: '03'\n      created_at: \n      updated_at: 2015-02-27 01:46:14.929377000 Z\n      group_id: 11\n      picture: tvulfllsmschgg2lkgt6.jpg\n  mounted_as: :picture\n	2015-02-27 01:46:15.434566+00
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('versions_id_seq', 24, false);


--
-- Data for Name: voltages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY voltages (id, name, created_at, updated_at) FROM stdin;
1	110	\N	\N
2	220	\N	\N
3	Trifásico	\N	\N
21	Bivolt	\N	\N
\.


--
-- Name: voltages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('voltages_id_seq', 21, false);


--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: churches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY churches
    ADD CONSTRAINT churches_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_types
    ADD CONSTRAINT document_types_pkey PRIMARY KEY (id);


--
-- Name: documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: groups_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_users
    ADD CONSTRAINT groups_users_pkey PRIMARY KEY (id);


--
-- Name: imports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles_skills
    ADD CONSTRAINT profiles_skills_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: skills_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY skills_users
    ADD CONSTRAINT skills_users_pkey PRIMARY KEY (id);


--
-- Name: statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (uid);


--
-- Name: tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: voltages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY voltages
    ADD CONSTRAINT voltages_pkey PRIMARY KEY (id);


--
-- Name: index_attachments_on_attachable_id_and_attachable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_attachable_id_and_attachable_type ON attachments USING btree (attachable_id, attachable_type);


--
-- Name: index_documents_on_document_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_document_type_id ON documents USING btree (document_type_id);


--
-- Name: index_documents_on_documentable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_documentable_id ON documents USING btree (documentable_id);


--
-- Name: index_properties_on_church_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_properties_on_church_id ON properties USING btree (church_id);


--
-- Name: index_tokens_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tokens_on_token ON tokens USING btree (token);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tokens_on_user_id ON tokens USING btree (user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

