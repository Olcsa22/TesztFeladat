PGDMP     	                     z           tesztdb    14.5    14.5     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    tesztdb    DATABASE     g   CREATE DATABASE tesztdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Hungarian_Hungary.1250';
    DROP DATABASE tesztdb;
                postgres    false            �            1259    16404    session    TABLE       CREATE TABLE public.session (
    "PRIMARY_ID" bit varying NOT NULL,
    "SESSION_ID" bit varying,
    "CREATION_TIME" bigint,
    "LAST_ACCESS_TIME" bigint,
    "MAX_INACTIVE_INTERVAL" bigint,
    "EXPIRIT_TIME" bigint,
    "PRINCIPAL_NAME" character varying
);
    DROP TABLE public.session;
       public         heap    postgres    false            �            1259    16396    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16395    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    210            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    209            `           2604    16411    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �          0    16404    session 
   TABLE DATA                 public          postgres    false    211   \       �          0    16396    user 
   TABLE DATA                 public          postgres    false    210   v       �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    209            d           2606    16410    session session_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY ("PRIMARY_ID");
 >   ALTER TABLE ONLY public.session DROP CONSTRAINT session_pkey;
       public            postgres    false    211            b           2606    16403    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    210            �   
   x���          �   
   x���         