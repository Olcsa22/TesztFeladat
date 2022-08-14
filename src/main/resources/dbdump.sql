PGDMP     %                    z           tesztdb    14.5    14.5 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    tesztdb    DATABASE     g   CREATE DATABASE tesztdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Hungarian_Hungary.1250';
    DROP DATABASE tesztdb;
                postgres    false            �            1259    16413    role    TABLE     R   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    16412    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public          postgres    false    213                       0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public          postgres    false    212            �            1259    16425    roles    TABLE     `   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16424    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    216                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    215            �            1259    16404    spring_session    TABLE       CREATE TABLE public.spring_session (
    session_id character varying,
    creation_time bigint,
    last_access_time bigint,
    max_inactive_interval bigint,
    expiry_time bigint,
    principal_name character varying,
    primary_id character varying NOT NULL
);
 "   DROP TABLE public.spring_session;
       public         heap    postgres    false            �            1259    16460    spring_session_attributes    TABLE     �   CREATE TABLE public.spring_session_attributes (
    attribute_name character varying,
    attribute_bytes bytea,
    id integer NOT NULL,
    session_primary_id character varying
);
 -   DROP TABLE public.spring_session_attributes;
       public         heap    postgres    false            �            1259    16469     spring_session_attributes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.spring_session_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.spring_session_attributes_id_seq;
       public          postgres    false    217                        0    0     spring_session_attributes_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.spring_session_attributes_id_seq OWNED BY public.spring_session_attributes.id;
          public          postgres    false    218            �            1259    16396    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    last_logged_in timestamp without time zone
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
       public          postgres    false    210            !           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    209            �            1259    16421    user_x_roles    TABLE     M   CREATE TABLE public.user_x_roles (
    user_id bigint,
    role_id bigint
);
     DROP TABLE public.user_x_roles;
       public         heap    postgres    false            t           2604    16416    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            u           2604    16428    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            v           2604    16470    spring_session_attributes id    DEFAULT     �   ALTER TABLE ONLY public.spring_session_attributes ALTER COLUMN id SET DEFAULT nextval('public.spring_session_attributes_id_seq'::regclass);
 K   ALTER TABLE public.spring_session_attributes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            s           2604    16411    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210                      0    16413    role 
   TABLE DATA                 public          postgres    false    213   g(                 0    16425    roles 
   TABLE DATA                 public          postgres    false    216   �(                 0    16404    spring_session 
   TABLE DATA                 public          postgres    false    211   )                 0    16460    spring_session_attributes 
   TABLE DATA                 public          postgres    false    217   +)                 0    16396    user 
   TABLE DATA                 public          postgres    false    210   :i                 0    16421    user_x_roles 
   TABLE DATA                 public          postgres    false    214   �j       "           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public          postgres    false    212            #           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    215            $           0    0     spring_session_attributes_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.spring_session_attributes_id_seq', 164, true);
          public          postgres    false    218            %           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 4, true);
          public          postgres    false    209            |           2606    16420    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    213            ~           2606    16430    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            �           2606    16472 8   spring_session_attributes spring_session_attributes_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.spring_session_attributes DROP CONSTRAINT spring_session_attributes_pkey;
       public            postgres    false    217            z           2606    16506 "   spring_session spring_session_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pkey PRIMARY KEY (primary_id);
 L   ALTER TABLE ONLY public.spring_session DROP CONSTRAINT spring_session_pkey;
       public            postgres    false    211            x           2606    16403    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    210            �           2606    16455 (   user_x_roles FKkg8jt051ux6f4wwb2cgdmolr0    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_x_roles
    ADD CONSTRAINT "FKkg8jt051ux6f4wwb2cgdmolr0" FOREIGN KEY (role_id) REFERENCES public.role(id);
 T   ALTER TABLE ONLY public.user_x_roles DROP CONSTRAINT "FKkg8jt051ux6f4wwb2cgdmolr0";
       public          postgres    false    214    213    3196            �           2606    16436 (   user_x_roles FKo22fnnu1hefe30imulerc5vrj    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_x_roles
    ADD CONSTRAINT "FKo22fnnu1hefe30imulerc5vrj" FOREIGN KEY (user_id) REFERENCES public."user"(id);
 T   ALTER TABLE ONLY public.user_x_roles DROP CONSTRAINT "FKo22fnnu1hefe30imulerc5vrj";
       public          postgres    false    210    214    3192               �   x���v
Q���W((M��L�+��IU��L�Q�K�M�Ts�	uV�0�QP��q�wt���S״��$^�Ls�cP����op�k��kpT�?�&�Lrr�r�q��v�r	�ws��p��2�� X&>P         
   x���             
   x���                x��}[��Ƒ�����M3�8`ޓ�'aFX0<3�m��jز!������X׮�T7��|RwW��d2�q�d�w��������w���|��ߛ?����_���~��_�_~��_����ן�������/��|���/��_vߛ���_��}�e������?����/��7���/��������~���������������㷿������_�����n��,ː\�e�8$���ħ*�1E�&v1���9Ct)H��Se���\?�>y����>��{�}�Tƶ\���.ў�x9�G��}̨G��p�����vj��Dˇ��K��>�Ak�QN~x��.��
rJ�cM��Y������ߍ�9)K��l�<k�K&��R4"���h �gz�(���<�w��R-O��\��a�2ɝ=�$2J���7�J��&��N&��k�S{�̗��ą��3���&��燱�(&�ŵ̴T[�L�x��Tjs�ڒ�ǌ�D-k��±�ٸ��/���jM���L�(Ǣ�S+�жJ�9��`�3M���ㆻ���TF��<�4SҺ�MZw���<��e������ʻ�ewcѸ�m1�J�����/g�Y�UU�����i͕J^zq��h5&��/��Qo�D;�%99iAH%i}����J_Г2"D���h��ѶO:M����=�eAz�;_�gg�w���e�s!�'5���4�������:�t2��
h�Ƀ�����I����t�
%���W��쏑2�;�ߕ1�
��˶Cowθ`;��7#����(A9�<>�(�A�ڦ��B�I�͠#5��`��ӥqD߮	�2��<�yw�˾�9���}��6]o���5]�O)�JZ5�j��U�uA�2�g=����'^ս<kB����ɨ=}�Q�K�=��Vs_+�AF����`>>�Ga�n�1�����e.��`�?�y*�@��[Z��Z�tڲm�`]7��Z[uv��D_�'k���SE^�n�`���
(s���+ݸӑb{���ҧ=�8����Zz9d}#�ʔ0��@[�t���{��u&d�B��o%!�-S�qaq�&�ګ�n���Hz�b�A[T��$��L������d�2��Rj�v�\1j��-��'LEU�۪2�[�	��m�f�]�-:�rN�����\75�䵽��9����X�I{F��^�zO�粒Ǎ�����Q��F��|�֓ؒ��T��^G���Q���ze�����l}�uM�:y>���¾VV��5��c�K�L#ˮ�l�i�yv�[$��]s�ވ6�`f��d�����:�}�JL��w�q���RֺqDӿqD��ܛ��S�:�{[��kw�j���I[*�΋ً����[�b�egԎ�>j�{�JJ�{�]�q�)��Z�n���$���f�}����陝/��W}�\׎�������	�X�ݣ3�dGi�iF��M��'NH|����S�.k�lrry�@Ցv�����G������r�������M��$u�U�4J�ow�|MurS{�C�����A��Ѓ&$�������hv���������W�Ա�L_�9wtg_�CoLޘ�`�����_��?}G�1b8�p���y4'�	�����4�)63b8x�Q>a$���'q���3jY��1b8�p���!�C�΍1�������M�+Ѝ��7}ST���ٮG�9751b8�p���!�C�Q1i5�Y'^��ƕ�������8��]P�(��W�������!�C�1b8�p����I��t]�b�*��������kpJ�ֺ��p~��?��/� �7�@oc�������{��4 ����ȵɅ�|��MB�H��o������o��Oc�(�v{dR'AU�Fe� cCI��jvL��^�=�kvt��yT:@a(��4C{`��I���v'�Bj e|�3P���ԡn����y<N4�u2�8����q]���Wy5��Y����������h��z1x�A�$��Wr9��ޛ��i�2�A|2���|�����fn�\FA��m/��Qj�jti�D��{Ñ�;~�cO�������`|�ɜ���-�F���f#��=F�g��������>z[����{��p/�	U�`߄����ǣ�ĸ���e���i0�w�GԎ��-��^�òoa�'g�����|�����vP��qy
W�O1��mk0�{���>N=I{�(�y�N��S`�A�=@�>5��ǳ��"FЙ��[u��"o��з]hS�P���w���kx�TsX y+O�/'��� ����jX)H��aZ_�੟,��q���UV�H_MQ9U1�G^*�ʖ*���v����<�X���u��� �I�^!���R��mǹ���i9u�nӻNal�5w+G���}�Z��؋۸������Zc��!�q�5̩O�����v�;�g�KWw]�-��|=]�j���L5&��Uf��@@4�N��p�.vp�t�i���� �]�yt`�{���ܥиX���\Ys?��4��K5O�躚p:!���A�ڥ�����[78��˹6����|��p_L�:�{m���v�s|z�`7̀Ǥ��^Q�J�^-s�h�*8��]��A�)=#��m�1��RP�p�-�PF^��,�l���^S����*u;�ɪ*���7�@2B[�q�w�K��U���q�ڜ�*���A�ڊ�o�Y���X�Ҍ���wKY����p����J\������˪u�P����Q�(�Q�?�������N`cڼ㘘g��;��GZ��M�6dyd��eg&�pϊ[�Wc���`>�c2S���>ͳ��ֽ�ݳFka��8�q�z�m�����-�|�~���=��z�f�������}��O��r�U���մ��Zt`ة#�^=R5"B����:*�k�{�-��F��\��D�/n�q$�y.��F���#Uvr�bU~/�SP�Ir ���Aed��D���qL�C0��ЛpQ\mH��iI�8�)x���"JK�+��X���a��.bU�cgǲ�bY��X�����2�Or� ��V������X�;�Yk��e�i��:�;��c�����wp���|�NrD_��Y��z�j�?���z��ih�����a�Ͳ>x<�|�C�V�_q6�Ɉ4�Q6WJ�Y>�˧꠽���ٕl�wUhfa�!&�a#��k��ɺ&뚬k��ɺ~�S��r��3Z=���d� ��,e;%�����z�d���3��.?%�~��Ȍ�dZ�iM�5�+2�ɴ�Gt�L��bZW_�
]�7m_��\x�LE�b,���~��l��q�6�m6���nc�yE������#�	�t� FBF�}1��EY�&�j|Y������-k��x߂+�-�8Zd�u�C�:�E%ѢkѢp-�;_��$h�cq�ΣE�mѢh[q\�h����+��}Ѣ��e���n����-O������w�퐸e���H��A�Mkc���qST��E=�e툆���W�"\E�j�piF��D���.G�nu$EF����j�u�~������	-I�FN�$�H��"�rD�A$R�H9"���)GFvY��6�im!3Q�MS5�\�3�y��!�C� A�8q���s~�f W),�{lH�y՘�#�G�?^vWU��i
-�|]b?�y�T~n��!pC����7nn��֪�`���u+�/<枢�{P�cl*�!�L����7n���7�溭U}tN�+���EZ���U-\�NK�ǲ,]�q��3�{��q��!�C� A�8qn��ު-�B[ǪȮ���Y4�5���XUu�453��!�C� A�8�	⸤�J�Fy]B%{ZV�sG�٘�le�ǂ;"?��#��C&A�8q��!�C� ��AI�,�x0℺*�PES������S)�A�8q��!�C�1A����ܡն�$��[�����7n�s�lÅ�pV%��2t2�8q��!�C� A�87q�$3.[׺ԇ�6C_�چ"������ڠYq��!�C� A��qзey���Q9΋�̴�J�Y)�#p� ;N    �F�K���.��H� A�8q��!�C�� �$3Nm���"zq����-JoL�r��9q��!�C� A�qpݪ<��(�#���j��T^�Ɋ#�t�*?ngg��B,�A�8q��!�C� A��8��8�uU�*�2��om.�u��2���0b���!�C� A�8�	�(�~jp�0��f���S�Ȃ�1��c��ݨtqԑ�<�
���!�C� A�8q��đ�Ʊ�a��P�R�8mS�뻢�U�k7T�Vq��!�C� A��q�M�Å36I�q9�˲��2q��c����Txv]^U�f?A�8q��!�C� A�[�8�ظ컮jM_���޵MQ[���	q��!�Cg� �]�8��A�fq����w���ǭo������w��+���
��1�:�_q6Ꙍ{H��x�E���"t'ۙd�]��T
�y���Tɚ`Y�)k��(��/9?����Sp�,Y��l�a�!@��>�w�Y\!4�
��~�q&6~d��1��FV҄�IPQITT���@NI�m�EᢒpѵpQ�ٝ���ȭ�+���pь���$\�.�E�
8z_�h�s�z��[���,�gq�ӻe$�r��8sk�ʮ�p}W����|��')�1��C���P�<�FKW��:X�9���C��p�*�U����9"�腜#q�ŕ��N[���9G�(��B�q�.'β.+���b�Dz#w	|�6Cks�uG�:�Dj�>2���$F~���/��Ӟ�c���k�q��1׉��)�RI�$��*	I]I�' �ra|H�0��3��Ev� ){��O�;CR�;2���&'	�C[��š�0��@Bu#���)?j����O��_��O�@g���]/G�*��U;��䨅c3Gq��YNMhm,�]M)X�͒i)��aT�� t}�����~����I�o��^�̊�,��̨���eb��>�8Ҫ�0�{�N�=��:�
a��ev���=�M�%ѥW����+4+$�A��𥎬�O����;��u2+8���ʏ=���Wy5���U����������h��zљ�<����/��J.Gw�{SA��eڃ2�d#�g����;�����ڹ�b��^J�v����}w
��n9�vcǯz�ɑ���� ��4٣quߠe�(�=;r�l������Q�|���L?��Gok� v�u�=���8#*��k�(B5���-��xΖ�J'�������e8_������s^ĩ�d�)��8Xj�1�/�!��`��J�v�&��՛��g�P�	����5�f�Jw�p&a
)�� ��
�B��:�[]��C�$'[�mTKo;b�ǩ7�h��A&��)�����Q��b�:�J�+%���g��ϑx�_.��m(���;o{5�4<X�M��L~��b߬�O��lm���=�����UF~҈WԈw��+�w�-�8뵓g+G�m��m�X�$��g��-�gS��g��:��UV��y�a�:���#ij��#z���h�r�5�'Qdp����V�g�'kC?81���W�j��r�^׽�X��ųuW��~eL׹�e�?S�IG�j�Y�|�l�*���^?\��t6�v�8�Vx�Qm�=!���Uϥs��u2>/�:yFW�*hŀk4�ܥz']s]��b<�%�HŞ4�R?.���j�g/O�K�f�+�+'��E#�ư��ψ�U��}2/'�Ζ҇���RB{���K��-e�d+��E#5S��9I������;��F�z���\ƽ��h��Ajs�d*�A��m�e4ʖ������(q����� �|B~%?͂�I�nmQ�C�^.�֕Cշ:F�{r���Iχ���w���J5�<w�ȱL>��'��e$�[�Lݞݵ���Y����0�Y`ul�i%OW-��*9�j�Q��[f�����}�����L=�r^\��(�l��f�����S��A������i�n`�ԣ'�����󹵗~�]�Uǵ�����CuG i<���Ci<�������5���q%��iî8�	Rn�Ya�Z0����QZvh��|���H��\4�Q�ە6%�K�&w�ͥ	�bX����{5���Ӯ�?��h`6��	!���$ �mUA���ec��[R�H9"�襔�D�)G@9
V���ý/�G���P�d��T6�������E�JS`vŜ�������+�W��_�"|���E5J��VA+#����8���Svi�d�
gR^ڨ���ʈ����W}�j���AdJ����+�W��_�=|%��a��kmQ�,��XT����M�Mդ�G�W��_�"|E����C�W��TIQa�q�6�H%-��W7�� NR+|� ��\�+$wpL�D���Ն��:e��:�W��J�W��_�z �J���k�/m=�&�P4v��T�U������	_�"|E��������Q� %���V�(0�J�,9[��A��ľ���J���E���᫭�W.���m�aB&|E����+�W�����;7mg}�Eھ�i��Z������Z]���	����	����	�o��[��
�F��֘�j88x�����1�/�"�ߘ�WʡoaL���T��,�WLZ�iy&��M���c�n&�~Q��w�S����	���^��{��L��Tݻ������{3U��Ru{��oJEj�^-�ESY_x8�7���pş�_~��_�������j[pT�m%�Q�%���mX�d5��DVYMd5��DV��YM��o�^������O��d����ty��k$����*��@VYMd5m��'���&���j"�����g5y�W��_�"|E����g���uh��y㬫t)�p��SJ`�8���t,H�ti��PW���~��_m�jp[�JN�.4�p)_�"|E����{��B�����:ĺ2]ѧ&P���5�pZ�M0��f��o����?|������������Uy�fȃnZ�O"(�p^�0��%l�#��M�b��r��Η��%�Ǵ��Tz�y(M���sz�Ms�h�q�U�*���Ϯ{5�������:3��Ԯ1m럮#�U�i��-몔��6:*�4�9}�n������I�uk��wӌ8�����CS�J=���dm�m�Cs���+���1��o7�V��[�K�d=aVנ<;�p5y��my?�����`E�SO��s�Z����|�+���5��;DSVm�jI��uy�~��Z}Wa��Lس<�S�>�O�&/p�GM�uA��9���}_�J=.�{R��p�qQ�ɬ�Q��x����8Z��Z�\g/l�AgN?Y��h�_�f��-��Z��(�J�u���=��h�3�y�z��]���cYbj߶�Y�㠥b[��OK��ˬ�m��N<G��<1˺l�/]Ts��1�&��N�V��Рv��^��K��c��$�	�>w>�h�Ci6oY��̲�l�Gr�v}v8���9��E����u�T��*�i$f��d:�A�����T]G#�ĳaB�g{�5]/�#���Є�N���1��^�Day�v�I6?�~�;�$\�G���~��2s��|i����=�Q������u���d����8��"�%�l�Ѷ=e� _<�-��w���Y>{���������r$����W����1��s�³��X���z8���+�ゅ��|Jo+i�Z,��qN�� ˉ����XEQ�#��eK��m^[��[p���7�ݽ��o��Z���U��*�>T����i�忐��ݟ'u�7Ϲb;�Ԧso���)��=���YƩW=�Xv���J�����<i��V��9�m�ח?�e|ő�tP˱�b�eN�E��6u�6cteE4��RO[��Q�sDF��8f<8�MX��s�8�D�x0��'��z�[>��d1�=^k���<�#���7���/H�o!�Ѝ��^9�FO���Hc���O��gY���>G�g��]?�Jm�]	���</�=�q��k��w5���Ov�5�����|��LN�բ3z�z� #��}�5�<��0�v�    =�M�E�U��+s���1���T�_Y�`Ə���eު����?W��'���v�p�f�'[}��w�='ѩ%��.wU�ˬ����@�S�Yǧ�]��Ў��-M�v8��Z�B����Q[�S��k��|@��iPݨq������^�b3�Ž^�q?#�0��!U+&�Ѩ쬃���:"-�\�	y>hm�ء�g[��g7_J^1A�v���9˥�\�X�������-<��S��1�O2z�_q$۽�G-W��ڃ|~˥?�<H;�ո�9R�>�kۥo�'k:�z:j{�}�b��i�L�}y�>RƠ���:�$#�0�dV8~�
��NHzb��v_��(&��1�6���em��ƽ�#_W���.�n���>fr]���,\�sX}�,��Ε�1�+��隒m�ƶO�dsҟ�c|ݝ�o��Q�L��k�:���n?����ɻm֭�k�M-᱇*a�6�p�ڣQy����'��<�il����?f���T��ׇ={E��ב�P�$U�Y87̼���������,���ݷYGbD�i����W�%��7���s�{Y ��%��x�������Ѓ�г�`k$a=�T9�M��r��^�I�;�H�e!4��>�Z+�e�M��vj�{o�d��\��K<������[����U=p��C���y�6���ζy�<m���/�P�O�,�yhBHo�L�1�ʫ����d*�[&S�K�2'�c2��H�rA�H�x�lŽ ي�>�ʘ��|��2��"L�rg�Vܹd+cB�l���";��N&�x�K�b�Ku߲>�|Ť�K�bfT� wp޲�y�[��k9W�3��28x�������}p��7��~c���7��~{��[�*�V=��ׅ߮kOw��sᷖ�/��Ímc�`]ᚘ��uQ�eU�*c㻶f��᷒�ׂc�jd��b�~c���7��~c���߂ݲ�y������mX��"�[�r�Tn��-R�E*�H����)бnP F۹q�S���-p&�*��N"\�R ��M�"�����}�maEn�JV?�H%��J<�-R	r��)����H�w_�=N�8��L-E���SKIJ)/�u�"*�pn:M��cF�紜��٭o%�'��([Ij)��Թ��B�����?0���&�ve���w���ӣ���O�2�ɨ'���͠�ϨgB�OèׄV��h�:�R.��5ŀW&_�� �~3�-2��6􅇑�m��f苌��~C_d�34FF=�/f��-۞�ʨ?X�'rN�3�dԓQOF=�dԓQ{F=�킃+윐�Ь��Q�����7��2�s�x����-2�?�HF����װ"�w+�QOؐ�z�GF��Wy���]m}-�X��mNMhm,pwW@��,D��,�#H�5[ �>���>����>������� ��훗����'��r7��?�Y�??JfQ�8�6>]]�p�C�7n���\�b�q���/���`�O�r��`9��,#��4r���)?�-۞w��?\�'r��39�����O>9�����{~r���2ʅQ���J���)
n��o�u���I��A%a哃��`Gr����'������+X�|���?r��
w_�5N�8Y��jO��ͳ�Ù��ح亂a
��d����Ւ��L�]�˭f�V2aC>�+�
���G��/L���JN;9��iϬ��0Vɣ���<z��ɣ�����?�^���@�uMѷM(�L�d[eݖU��p�?d�=��K��+�_BfVkkȣ'���^��3 F=y�/�ѧ-۞�ʣ?X�'r��3y��ѓGO=y��ѓGs� Qx��_м��i�L���^y�����ʨ��YD�B���{w�<�O;�G7F?a�5�H�]����6$�^��G/�U�a�����k�?�~�~FB{G�T�}�A��\v�j�����pl��(�$�]�^dY�-+Sxkۢ�sU`�L_�S��<.+�.+�.+����S�P��P����W
������Q�r���U^&�:�WG<~p}lО�V7�BY粂�e�˖�r�>2c�϶V��4�f׈#�˥��ɲ8@��D"��DNU��G��/Kʖ*�v\�^"p�"ʰ[�y5����΢��,Z�[-e�:O���-o��!+j!�8���4����zs�~�e�ë�G�
��9������z}�.l�o�$.�x�'�\�q���,Tد5�-�z�b����S��r�����9�̆�����5q�mY���-|�"�uS�!������\�t.�ai~@��d���������d��i���3}���Zv�k:Wڰ4	P�&@}{����~@}��Ⱦƫs�w�c�%Z�b�i�P+�SO�O-y,�Q�'k9��䯸�R>��$8�v�:���O��F	���'0J`���K��S;�n�t���!�X���CEEw���%�Kt��.�]����R�wI���؄�q�H޴�/���[�]���U9���Ng�aq�]p:��&}q�������/N_��8}q������/�%�D�b��WT�a]��E.۪h|�e�n�	]~�/�7,����݆�I_��8}�����d�L&G�L�l�؄
ݬr���K�K�?���������Dϓ��`#�NH�A�X��k�K�7'�G�N6c$Y}�7�Ʉ��S���3��\S�"�Eԋ�Q�O��$l8=�	&nLp��V�����q,�uH�	�+�{?��0��|��M�Ŵ]�i�P��H�qIh� ����.�@N?b:�t����Y�6B�	E�վ���DUt�WO�����i��?Hܰ4�=5�����ܞ��Ss{jnO����e�h�>F9��We�@}��n�-��sF���-�u+C٦�r��굉t<��lY� *n�-��%5���Ɩ�uʂsX[��-��%5����ܒ�t�[R�ז�9o�z<���*����G�0�>��h:H���䲫��"zZmX��C��%J<�x(���ࡃ+]}�g�F+EB����*A?���Q�MV��x������ +� q�Qb��F��%6Jl��(�Qb�7�F+�a���QIr-��� �C�A��+ZLrF�d58b�W`��ݰ4��%6Jl��(�Qb���F���5*@Hp���hQ��D�*oTv67���oqע�w�Sb��F��%6Jl��(�Qb��Fo����W����ﮁGԘP��ttd]TmWI��&��ɷ�F��FÆ�����c�}��7����uD����mGG�5�
��QI�3��ʾ�2��tT��Qy^P�ؑq/pd������wd�|��ܡ#��92c��v�L�ٝ�w���;6fIV�W󮎍I����N86i˶g�˯���ϓ��F-�C(T�7,g�� ����� ����YV	�G�2�f�ҵaNv+���sp�7kbKȺ0X�N2g�j�����i`G�6k�V$��a`E���������#���qc=n������'�v�ۮq۵%�m�N>�]�k�v�ۮ�Ͷk�3�V�]C��v��	b��sN�&W�q�D�`B��>_ܔv��;¸)͆�I�xI��c�v\ߊ�c�/!�v�������1N��K�`���R��#*h�aA�3N�89�䌓3N�89�7��4��g���
w�r�U�3Ϻ�!$�k�
{1��	G�9���t�#9�۵�	,�3�(�"9����+~6�_}	Brm�&��Z[�|�]hHm��r�ْq	"nX�$A��EH��__E�����2�W!	�}� �ːA��Iy��罒 �Pt�aA�AI$A�AI�'AWF������y�LO�I��y�@�C|/=��l%y��$�'	���$Al��'�Hģ �$A8$	B��!��)7�_�_��H�?tmۘ�]R�<�V}����i�'�I��lUBh]���޺���M0M݁)�g���{���������r�r����F�$O]?rJ���#���!9%䔼�Sbܖ��{���*h�aA�SBN	9%䔐SBN	9%��)��*C8#��I4P��)��u��P�NI �  ���[vfTvJ�ANɧ�)ٮ�O`���G�)!pHN��#�D�a��#HiäF�Oό�߯q�}��G�D�i\3j��5��4��g���Q��e��^����
�ڰ��gԞQ{F��gԞQ�w�C"���A���/$0���0*��)K�	�Y"��,Q{�����Q�O<2j�]���"���,2jO��Q{�Ǩ��W��0~�Q{+���Z�r,��ff͌��T[Vn�#S\������$���I���whe]��v7��B���*$AЗ!	�$�� �۲�y�$�8T�7,h� H� 	�$� H� 	��$x�y��D���Cx%;%A8���s�� �[�ʐ4N�� 	���$Al��'�Hģ �$A8$	B����U�0~����������r �5a����u5�d�鵨Ƞ{9��5N?�E��E�N�9\*�!Nx-e�Ȁ��cu���U���].jLޅ�|��>��O���(�j��$6Jl��(�Qb��F�������hu[`����$u�
օa6xp�t�ʺ��,hHEl��(�Qb��F��%6Jl��議Qg�_�"~E���Ճ�Wv�_��ǯp��
�k��������o|b�����+����
��1�:�_q6Ꙍ{H��x"e��2I�4�]YP3�9afM�$���W��1a��-��S���W᱈�)�DH�M'�'�q����+��C���Y�QUȰ��{�C0��#7�IJ��Ry�d�IPxI^@O� XIg�m�O=ѧ��ӵ�S|}�;4ᓠOn�>،�>��E��Ydw
}���'�R�E<�F��U�����I�]�,n)�98�W��5�eWO����_�-��-'d�<����V�C�
���_�`r�m�*3�f@�9o ��"L���ZP�^�+1�+�-�}hї2$,0EqmQ��� �0���X9�.k�1����E�6���;�5�9a��@�zN��9a:|��9a�+!��B���|��-ƿc�d�Y5�$[L��ڙj(<:|���w�@��l0���1�����o����}�_8}2܉�����(����h�t��S�o'Y="�p*���Y3�<�LS?�>�YR4����j�P��󬺤�Hxl�
g@Gᔥ�7����e�pԢ�u�1��fa5�F8=��5챚cFۤV[v~C�@ø����E��vPG3�_f��\�������2�A|�/�Zr�~����&�[;�����R�k�j�;���G�n��U�=9r��Z����&[.���Le�g��#��-�����5j��;��`��ۚf������r�D�	���V�W����K)}'�Fd����k�S�Ë_�q�^f�P�[�����0��:|�1YH�Q�FAH��s.\�uԲ�SL6R���v6D8�SOҞ>�v��%�T���^�>eA�ǳ��"sbP���[u�}.o��з]hS�P���w^�׫^��el��i��'ǉ�)fm���Z�4����ѳ��S?Y�!�:����l�X�� �M�TŸty�<*[��Z[��֫Z�d�'�:Z���I�^!#�+k!��j�8Ε��K��3w��u
c���[9�6;�Da�u쏽�Lk��u�J(Ak$��X}y��sꓵ��?�]��٫��J���j���s��ă��Ƥ�@����|�D����t�׆Kw�^>�e��7�Z �[�y���{���ܥŗ�X�d�_Ys?��4��K5O�躚�.:I4�Ap�j��?����o����&��P,���7�զ�}1��ܯ���}���v�3|z�`5;����^Q!�^-3��;8x\�[��A�)=#%Y'.�[*�����X��˷�哭Pr��a��4�^�n!X�ja\��6s��a�j8Ѻ�$V�rA6�Aks����wxmc����aE;cE2�a�7��-e��/���+qm��C��.�֕Cշ:�G��r�|�I�����w�����<hݱL>��',j� �#+M�:3!e{6�ں{��{XSie�X�}��>'@pX��v�6m��Z�����|��ۿ�����:������>m���0M�0�C�xk��je#d�۹%CJ)q����5��m^�̀+�l|��6��U�fÂ�RD.E�RD.E�RD��z���\:����\���`�ϼ܏l���~���~���^��.Ckf�֙���Bk��5������^�g.,�[<<[��r���M�g8�~���N����_"~7,NrN��0���i�o=�Υ�������s�f�]�yQ�{��z�I�Y>�+��~{o��ؕl�w�w�F#5m�H}_H�Ϊ���h����\�\H��٤!t��3��x?����o=����L=�]�����V֝�ڄ(I�+I.,��s�&]x|���19뵬,c����3nI�"|��3sG2��=Ñ�E`��ǆ?>����n8���(�_�a�6�~1^}� d��"�Տi 2^M��jƫ?S��^I鴑���.T2
Y�]��Es�p6w�t�j�h�e��!Z�h�e��!�s!Zٹ�j��r���ψ�1�J�lJ툔����}t(5<J�et뉄�!v>���8���Ч�B(u�Tžm*��C�+O�֫���7N��/<�^ u�T�R�;�R۽��B�Q�{��x�Z-k�� W�ͮ�����EӷU1�ܺ���ԉ1��XڌY�mv<N�%IjL�o<�3�~�^��������ɢ>>��<����ӆ�OƢ�f,��hƢ��l,����1#Č3B���7�Kq@&)\꣣�O,f��F�C��㓔+�~����KRޝ���q&9O�r�n���ch[ra�c�?>p��KT��P��˓��0��D�^r'�����uQ�h�+�����2,�ڶ�2�`(���n=ʅ�\������~>T�3�`��q��=�f��"��FŸH��tW�`�
۞F�B�a��^��TA< ���
3��䓊��]����66�_o��f��nɐ]v��qӡ[�$C2�^ޯװ�X;�>6Y��c�\���E��n��d\�qiƥ�f\��t�H��bF�-��q��`T����Ơ�`����ảϓ�"��2����փ�\����ď"r'�϶��v��;T	�,���].��|JeQ����hVFe`��QF��].�e�!���j�9KԌv�5��&�>6*��\��zO�+�UO��^2��ѫ��)���v�4f�_cv�!`�#}lc��C�o���Ux�ya��8��ԋs fǸ�o��ىv%��]O��j����-�kM�Xոo*�΢�V�4��0C�3�0C�3�0C�3��c�f{��æ?;����9�ӆ����|�SA�î�<ڢ�.|�E�BW��uCU�Nc훱�k��X{�,�C��u8���z��ߕ��X;�
��kg�}��T6�kg���v��kg���v��k�O�s��7��q5y��}4/ ������N���X�.v=�3/`ei�n�y1FOs.=��&�2���]�ǥ���]O�k��0��p�Ic����Ƭ۸1ۖ��eĘK���[<:�ಃz��/kt%�A��rU�i<��S7_�7�8�xQ)��r+S�e��0|!l��K߰)<������Wߕ1�p�������Ǉ�o��d�/f�U����Z��C��(J5E�+����35Uk}�eЗA_}���d�?�*`�v���[���G<�00�����u�A^|����>���Nw����k[�����t��\X�xu�~�`���P3{�:����:6�4�l<o�����������-:eL���џ�(аs��1�{1C�b�QB�?��o\�_���h��#ֻ*�S��C�C��~�^�Ġx��p1�ǰ5c��ƻ2&l�������em�G���N�T�����U���/�M�Ƅ	�u�ub��G|d���m�b�+F�d`�V��$&�Kb`�X�c&wwd`�r`rD|�3�������         m  x���Ko�@ཿbҘX���tE�(�
�˺ixIG�����j�¤]�;997�3&�`�c�Z��G9��ӾJwO��'p�E�I;�����.]V�+�fY�|�|m���;��%^�.�I�&F͝���ri
n��:ΰ��4Cx޷��+kA���C?�Ȟ��Ux�'��.R��LTLU� S�V��a<�L.���ߑCy��vY2yD7��[im���u�"ywp⩞��z?���x��!K*�!b҃��F&wd�[
+ޢ�Z�b2����u���.V����gpB�R�{�o<����C~Q���ٍL����8�n��EpZ���l�LME7mbFL*z� ט_ʉӓ�y=/�K&H�����_���         Y   x���v
Q���W((M��L�+-N-���/��I-V� �2St@| CS!��'�5XA�PG�PӚ˓|�t�(6��2�)v�	�\\ }�h�     