CREATE USER codeshort WITH PASSWORD 'codeshort' CREATEDB;
CREATE DATABASE codeshort
    WITH 
    OWNER = codeshort
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
CREATE TABLE IF NOT EXISTS public.topic
(
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT topic_pkey PRIMARY KEY (name)
)

INSERT INTO public.topic (name) VALUES
     ('Typescript'),
     ('Javascript'),
     ('Java'),
     ('Rust'),
     ('Python'),
     ('C'),
     ('C#'),
     ('C++'),
     ('Ruby'),
     ('Ada'),
     ('Eiffel'),
     ('ASP.NET'),
     ('BASIC'),
     ('Caml'),
     ('Common Lisp'),
     ('Coq'),
     ('CSS'),
     ('Dart'),
     ('Fortran'),
     ('Go'),
     ('Kotlin'),
     ('Lua'),
     ('Pascal'),
     ('Perl'),
     ('PHP'),
     ('Windows Powershell'),
     ('shell'),
     ('Prolog'),
     ('Scala'),
     ('Smalltalk'),
     ('Swift'),
     ('Powershell'),
     ('Latex'),
     ('Visual Basic .NET');

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.topic
    OWNER to codeshort;