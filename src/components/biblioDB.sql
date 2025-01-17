PGDMP     6    -                 {            Biblio    15.1    15.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16603    Biblio    DATABASE     |   CREATE DATABASE "Biblio" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Biblio";
                postgres    false            �            1259    16605    manga    TABLE     s  CREATE TABLE public.manga (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    age_rating integer NOT NULL,
    category character varying(255) NOT NULL,
    language character varying(255) NOT NULL,
    release_year integer NOT NULL,
    subscription_status boolean,
    img_url character varying(255)
);
    DROP TABLE public.manga;
       public         heap    postgres    false            �            1259    16604    manga_id_seq    SEQUENCE     �   CREATE SEQUENCE public.manga_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.manga_id_seq;
       public          postgres    false    215                       0    0    manga_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.manga_id_seq OWNED BY public.manga.id;
          public          postgres    false    214            �            1259    16614    reader    TABLE       CREATE TABLE public.reader (
    usid integer NOT NULL,
    phone_number character varying(255),
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    sub_status boolean,
    manga_id integer,
    email character varying(100) NOT NULL
);
    DROP TABLE public.reader;
       public         heap    postgres    false            �            1259    16613    reader_usid_seq    SEQUENCE     �   CREATE SEQUENCE public.reader_usid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.reader_usid_seq;
       public          postgres    false    217                       0    0    reader_usid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.reader_usid_seq OWNED BY public.reader.usid;
          public          postgres    false    216            �            1259    16628    tokens    TABLE     x   CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer,
    token character varying(255) NOT NULL
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            �            1259    16627    tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    219                       0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    218            o           2604    16608    manga id    DEFAULT     d   ALTER TABLE ONLY public.manga ALTER COLUMN id SET DEFAULT nextval('public.manga_id_seq'::regclass);
 7   ALTER TABLE public.manga ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            p           2604    16617    reader usid    DEFAULT     j   ALTER TABLE ONLY public.reader ALTER COLUMN usid SET DEFAULT nextval('public.reader_usid_seq'::regclass);
 :   ALTER TABLE public.reader ALTER COLUMN usid DROP DEFAULT;
       public          postgres    false    217    216    217            q           2604    16631 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            	          0    16605    manga 
   TABLE DATA           ~   COPY public.manga (id, title, author, age_rating, category, language, release_year, subscription_status, img_url) FROM stdin;
    public          postgres    false    215   d                 0    16614    reader 
   TABLE DATA           b   COPY public.reader (usid, phone_number, login, password, sub_status, manga_id, email) FROM stdin;
    public          postgres    false    217   �#                 0    16628    tokens 
   TABLE DATA           4   COPY public.tokens (id, user_id, token) FROM stdin;
    public          postgres    false    219   �%                  0    0    manga_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.manga_id_seq', 21, true);
          public          postgres    false    214                       0    0    reader_usid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.reader_usid_seq', 19, true);
          public          postgres    false    216                       0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 103, true);
          public          postgres    false    218            s           2606    16612    manga manga_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.manga
    ADD CONSTRAINT manga_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.manga DROP CONSTRAINT manga_pkey;
       public            postgres    false    215            u           2606    16621    reader reader_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_pkey PRIMARY KEY (usid);
 <   ALTER TABLE ONLY public.reader DROP CONSTRAINT reader_pkey;
       public            postgres    false    217            w           2606    16633    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    219            x           2606    16622    reader reader_manga_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.reader
    ADD CONSTRAINT reader_manga_id_fkey FOREIGN KEY (manga_id) REFERENCES public.manga(id);
 E   ALTER TABLE ONLY public.reader DROP CONSTRAINT reader_manga_id_fkey;
       public          postgres    false    215    217    3187            y           2606    16634    tokens tokens_user_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.reader(usid);
 D   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_user_id_fkey;
       public          postgres    false    3189    217    219            	   8  x��V�nܸ|��BO�&Qu�N�ĉc;���`�Zdk����bg���%M�����@�mu�����w�4:�j�_z��>�w�F��:�8�ǋ��F��n����������pV�f�ݶ띞�8�jj��Z Ȳ�nw{���zƨ��ο��q��G����w�&쌥�r-�E���U���y�CV`%� �2K0��(c]TA�,�\8h�� ��z�4,Є�a��7�w?L��5�m]�V���Ǚ��FB�yׇa���kE«�a��S{��m�Y�X��Ȳ�H�JJLr�e�h�U�e�jPr��x��j�;�ߛ�w	��w�]0�S �p*�]��>O-�M8)�yVj��L���y�gi���R�%��{��H�kSOu�3F��u�~F=��Z:7.W6u�=�AA�ەN_�����ʜ���$�x�H�e���ns��ʼ{�?8��;��]���������D�M�`��8��� ?�V ��@Q���(.s��RA��4����Zu�������7O���Ɣ=�p�؀m&�'� ��A�-Z�����Åd�R���P��8B�7����wI�l'���=<��C�<?)�cY��HhcS��q��zg����J��[�:U=�E.yZp�q$���T�2x[���6�!��F/��t}��S,��PO�5�a�� �_]A^0�����0��v75�|�(�Ș+ �lT�Q�5�na�G�/��k�D��tH�B�E&sLe\E��L%��E��Uc�o���h��+W����f�Q�䔀F��'�7Z��}�G!�������gGY"!{p��▇�ݱ�@e(BF�?T���dQ	����u[A�ce>��3�޽w�K���o��U��S������b�z*g#Q�EM���l�{Ğ��˙���
�8!��JJA�UE%0F�a�*]R���8�7#�w�e$���[ 
o�Z���#�?���Xh�S�&���PVyB�S@�@5>���Rp�
�z�6s�o��=C��ioڟ�!Y/=�њ%g�� �4-X7��Q��c_�c1�3.r:��E�$�3,�h�yo�1�ܥ�H���S?,ܼr$�?gЯ� U,S,�t�T�eYV:Z`���Ǻ��Y��r� �-@?��r�F3��OCS7c�@��h^nh�ڽ�G��@j�o +���3_�H7���bGZ�(�Y$X$�-��
Q���7���;Se��Zq�a�>�'�ߍ�?���Gk�G�P3��o{�L{�����&���9�&�"W��e�ħ1�$_?���y?-�k�0��*NE�+�"�"͔��<���)�$�eg�z�`���~�/�8���ȯ o��~6����u#����d\���u,�>�{�1�}ݖ�è�=�C��Σ��q�����r��|W��,wm��K(z��sW�3�P|N�_Q �j��HE��������
uB{���.@�wE�ɷTL9���մ��o�A���م�5��� ��B@����=����9k3�%-�J
�Ĭ�D-hHA{b��
�{pZP��c���X�������          %  x�]�Kw�@����Ț7J�*"*j�=�4�y(������3�aҧW���nU��(Ɋ:iP �<�N91V��ԕ@DpA���gq"��a����Ӂ�6��,�w{�h�twT�O v4I��Q��?�Y���u�K��*Yd�������0+d�"�/����p��f�k�̉!=�6����gc���M���I���xg��u�ԧ����oM�=V�Vp�%��u��6w��)=��<���:Ie,�����=znQ�M_��].�����E0W�+���N�nN���y�M��S������áף�t��^kL�懯�r�X}��mj���4�l�YҘ�r�5݄�Hyk�g�T�j1�~�0}�7���P�r�d!B���b�6̈| �H�W'N��*���hu�7���������?D���1�����~����v}�0�wX���䎅e9�҄��I���=3بE$��G�����D����tQgrU���ni<㵆��+�Zۘ�Q���ED�I�/<��e�3������On0�Cj
�         <  x�ݙ�v�@���]��MߗD1C"���^hE�ԧ�d��,����Gu�K�'��V�QUJ�Q����^E�2�gSwd������c����;�;��!v쎎y{/�lN����;�%ؾ��,����yV����xk_����ߵsy�-�R�56�UM��5�nX8	�hR�u���e�g��_\/?�J��9=�Y^{�[��o��ٸO��hDJ�1�F��ld�"%��D���4w��<�ի�.�k�m��Ǯ�v�����]eUU{"��]d>��9�����3m�H�>�x�wb�l�{{xSӭ�f�rXZwy��z��4}IOe�G�KL5:��������{�1,.�x4�PX<�c�P���l�D,$p�� �J	�R�}��-�6H�i>����H14"g#J�B%p~�8��#��c`R	��%X_$�t�i�����*8��p^��4{�׍�i@����-���.*H8��I0�����	0�3p*��}8\���4ng#	$�^���³ެ�H��G.zk������Fp	�a\>2pS�_�N��	�;�     