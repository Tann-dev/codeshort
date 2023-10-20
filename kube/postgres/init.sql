DROP TABLE IF EXISTS "_user";
CREATE TABLE "public"."_user" (
    "id" integer NOT NULL,
    "email" character varying(255),
    "github_uri" character varying(255),
    "password" character varying(255),
    "picture_uri" character varying(255),
    "role" character varying(255),
    "username" character varying(255),
    CONSTRAINT "_user_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

TRUNCATE "_user";

DROP TABLE IF EXISTS "_user_topics";
CREATE TABLE "public"."_user_topics" (
    "user_id" integer NOT NULL,
    "topics_name" character varying(255) NOT NULL,
    CONSTRAINT "fk8y3w9shl7thcbstb7g6hwdll1" FOREIGN KEY (user_id) REFERENCES _user(id) NOT DEFERRABLE,
    CONSTRAINT "fka8tv25787u5birmfcn2smho9h" FOREIGN KEY (topics_name) REFERENCES topic(name) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "_user_topics";

DROP TABLE IF EXISTS "anecdote";
CREATE TABLE "public"."anecdote" (
    "id" integer NOT NULL,
    "content" character varying(255),
    "downvotes" integer,
    "upvotes" integer,
    "author_id" integer NOT NULL,
    CONSTRAINT "anecdote_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fkdea11u2r8sleulw09kqy9kveq" FOREIGN KEY (author_id) REFERENCES _user(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "anecdote";

DROP TABLE IF EXISTS "anecdote_report";
CREATE TABLE "public"."anecdote_report" (
    "id" integer NOT NULL,
    "content" character varying(255),
    "anecdote_id" integer,
    CONSTRAINT "anecdote_report_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fk7ul2t6u8o00kbfyyd48ydaqqq" FOREIGN KEY (anecdote_id) REFERENCES anecdote(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "anecdote_report";

DROP TABLE IF EXISTS "comment";
CREATE TABLE "public"."comment" (
    "id" integer NOT NULL,
    "comment" character varying(255),
    "downvotes" integer,
    "upvotes" integer,
    "anecdote_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    CONSTRAINT "comment_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "fkoo5phijy22unidgkw0sipcs74" FOREIGN KEY (user_id) REFERENCES _user(id) NOT DEFERRABLE,
    CONSTRAINT "fkrvjxgr8lkw03i8u41mm4gge6l" FOREIGN KEY (anecdote_id) REFERENCES anecdote(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "comment";

DROP TABLE IF EXISTS "follow";
CREATE TABLE "public"."follow" (
    "follower_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    CONSTRAINT "follow_pkey" PRIMARY KEY ("follower_id", "user_id"),
    CONSTRAINT "fkhed931b0rtusaqlgsj0yti9gr" FOREIGN KEY (user_id) REFERENCES _user(id) NOT DEFERRABLE,
    CONSTRAINT "fkl472tn2jd8jyav3gtcqdie5u0" FOREIGN KEY (follower_id) REFERENCES _user(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "follow";

DROP TABLE IF EXISTS "rating";
CREATE TABLE "public"."rating" (
    "anecdote_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "starred" boolean NOT NULL,
    "vote" smallint,
    CONSTRAINT "rating_pkey" PRIMARY KEY ("anecdote_id", "user_id"),
    CONSTRAINT "fk740eouanmwdsi22ljt2tnwri8" FOREIGN KEY (user_id) REFERENCES _user(id) NOT DEFERRABLE,
    CONSTRAINT "fkbhv08l2pcjovx1005odufqnso" FOREIGN KEY (anecdote_id) REFERENCES anecdote(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "rating";

DROP TABLE IF EXISTS "rating_comment";
CREATE TABLE "public"."rating_comment" (
    "comment_id" integer NOT NULL,
    "user_id" integer NOT NULL,
    "vote" smallint,
    CONSTRAINT "rating_comment_pkey" PRIMARY KEY ("comment_id", "user_id"),
    CONSTRAINT "fkc668afb7h9n5x8qvr25k5in62" FOREIGN KEY (comment_id) REFERENCES comment(id) NOT DEFERRABLE,
    CONSTRAINT "fkj5vpvy142cc8m651dk2r0o2ny" FOREIGN KEY (user_id) REFERENCES _user(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "rating_comment";

DROP TABLE IF EXISTS "topic";
CREATE TABLE "public"."topic" (
    "name" character varying(255) NOT NULL,
    CONSTRAINT "topic_pkey" PRIMARY KEY ("name")
) WITH (oids = false);

TRUNCATE "topic";
INSERT INTO "topic" ("name") VALUES
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

DROP TABLE IF EXISTS "topic_anecdote";
CREATE TABLE "public"."topic_anecdote" (
    "anecdote_id" integer NOT NULL,
    "topic_name" character varying(255) NOT NULL,
    CONSTRAINT "fke7dibmsn5nawtflms0jgao9p7" FOREIGN KEY (topic_name) REFERENCES topic(name) NOT DEFERRABLE,
    CONSTRAINT "fklkp94ndw2dr876slnc6479gd8" FOREIGN KEY (anecdote_id) REFERENCES anecdote(id) NOT DEFERRABLE
) WITH (oids = false);

TRUNCATE "topic_anecdote";