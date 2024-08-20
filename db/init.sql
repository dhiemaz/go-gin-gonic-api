-- SEQUENCE: public.roles_id_seq

-- DROP SEQUENCE IF EXISTS public.roles_id_seq;

CREATE SEQUENCE if NOT EXISTS PUBLIC.roles_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.roles_id_seq
    OWNED BY PUBLIC.roles.id;

ALTER SEQUENCE public.roles_id_seq
    OWNER TO yuji;

-- SEQUENCE: public.users_id_seq

-- DROP SEQUENCE IF EXISTS public.users_id_seq;

CREATE SEQUENCE if NOT EXISTS PUBLIC.users_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.users_id_seq
    OWNED BY PUBLIC.users.id;

ALTER SEQUENCE public.users_id_seq
    OWNER TO yuji;

-- Table: public.roles

-- DROP TABLE IF EXISTS public.roles;

CREATE TABLE if NOT EXISTS PUBLIC.roles
(
    id
    bigint
    NOT
    NULL
    DEFAULT
    nextval
(
    'roles_id_seq'
    :
    :
    regclass
),
    ROLE text COLLATE pg_catalog."default",
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    deleted_at TIMESTAMP WITH TIME ZONE,
                             CONSTRAINT roles_pkey PRIMARY KEY (id)
    )
    TABLESPACE pg_default;

ALTER TABLE if EXISTS PUBLIC.roles
    OWNER TO yuji;

CREATE TABLE if NOT EXISTS PUBLIC.users
(
    id
    bigint
    NOT
    NULL
    DEFAULT
    nextval
(
    'users_id_seq'
    :
    :
    regclass
),
    NAME text COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default",
    password text COLLATE pg_catalog."default",
    status bigint,
    role_id bigint NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    deleted_at TIMESTAMP WITH TIME ZONE,
                             CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT fk_users_role FOREIGN KEY
(
    role_id
)
    REFERENCES PUBLIC.roles
(
    id
) MATCH SIMPLE
                         ON UPDATE NO ACTION
                         ON DELETE NO ACTION
    )
    TABLESPACE pg_default;

ALTER TABLE if EXISTS PUBLIC.users
    OWNER TO yuji;

INSERT INTO roles(id, role, created_at, updated_at, deleted_at)
VALUES (1, admin, CURRENT_TIMESTAMP, NULL, NULL),
       (2, USER, CURRENT_TIMESTAMP, NULL, NULL)
    INSERT
INTO PUBLIC.users(id, NAME, email, password, status, role_id, created_at, updated_at, deleted_at)
VALUES (1, 'ITADORI YUJI', 'yuji@yopmail.com', 'yuji', 'ACTIVE', 1, CURRENT_TIMESTAMP, NULL, NULL);
VALUES (2, 'FUSHIGURO MEGUMI', 'megumi@yopmail.com', 'megumi', 'ACTIVE', 1, CURRENT_TIMESTAMP, NULL, NULL);
VALUES (3, 'SATORU GOJO', 'gojo@yopmail.com', 'gojo', 'ACTIVE', 1, CURRENT_TIMESTAMP, NULL, NULL);
VALUES (4, 'SUGURU GETO', 'geto@yopmail.com', 'geto', 'ACTIVE', 1, CURRENT_TIMESTAMP, NULL, NULL);
VALUES (5, 'RYOUMEN SUKUNA', 'sukuna@yopmail.com', 'sukuna', 'ACTIVE', 1, CURRENT_TIMESTAMP, NULL, NULL);