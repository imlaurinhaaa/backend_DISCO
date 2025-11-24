--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-11-24 01:39:07

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 42141)
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    singer_id integer,
    release_year integer,
    duration character varying(10),
    num_of_tracks integer,
    photo_cover text,
    photo_disk text
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 42140)
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.albums_id_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 219
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- TOC entry 224 (class 1259 OID 42212)
-- Name: playlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlists (
    id integer NOT NULL,
    user_id integer,
    title character varying(250) NOT NULL,
    photo text,
    description text
);


ALTER TABLE public.playlists OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 42211)
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.playlists_id_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 223
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlists_id_seq OWNED BY public.playlists.id;


--
-- TOC entry 218 (class 1259 OID 42130)
-- Name: singers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.singers (
    id integer NOT NULL,
    photo text,
    name character varying(100),
    musical_genre character varying(100),
    about text,
    popular_song text
);


ALTER TABLE public.singers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 42129)
-- Name: singers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.singers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.singers_id_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 217
-- Name: singers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.singers_id_seq OWNED BY public.singers.id;


--
-- TOC entry 226 (class 1259 OID 42243)
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    description text,
    singer_id integer,
    album_id integer,
    duration character varying(5),
    lyrics text
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 42242)
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_id_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 225
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- TOC entry 222 (class 1259 OID 42174)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL,
    photo text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 42173)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4716 (class 2604 OID 42144)
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 42215)
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists ALTER COLUMN id SET DEFAULT nextval('public.playlists_id_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 42133)
-- Name: singers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singers ALTER COLUMN id SET DEFAULT nextval('public.singers_id_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 42246)
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- TOC entry 4717 (class 2604 OID 42177)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4886 (class 0 OID 42141)
-- Dependencies: 220
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.albums VALUES (1, 'Emails I Can’t Send', 1, 2022, '39min', 13, '1763953765407-Emails I Cant Send.jpg', '1763953765412-Emails I Cant Send_disk.png');
INSERT INTO public.albums VALUES (2, 'Short n’ Sweet', 1, 2024, '36min', 12, '1763953867184-Short n Sweet.jpg', '1763953867186-Short n Sweet_disk.png');
INSERT INTO public.albums VALUES (3, 'Man’s Best Friend', 1, 2025, '38min', 12, '1763953922764-Mans Best Friend.jpg', '1763953922766-Mans Best Friend_disk.png');
INSERT INTO public.albums VALUES (4, 'Lemonade', 2, 2016, '49min', 12, '1763954065141-Lemonade.jpg', '1763954065144-Lemonade_disk.png');
INSERT INTO public.albums VALUES (5, 'RENAISSANCE', 2, 2022, '1h 2min', 16, '1763954340624-RENAISSANCE.jpg', '1763954340628-RENAISSANCE_disk.png');
INSERT INTO public.albums VALUES (6, 'COWBOY CARTER', 2, 2024, '1h 18min', 27, '1763954388079-COWBOY CARTER.jpg', '1763954388081-COWBOY CARTER_disk.png');
INSERT INTO public.albums VALUES (7, 'Speak Now (TV)', 3, 2023, '1h 44min', 22, '1763954494537-Speak Now TV.jpg', '1763954494541-Speak Now TV_disk.png');
INSERT INTO public.albums VALUES (8, '1989 (TV)', 3, 2023, '1h 17min', 21, '1763954530824-1989 TV.jpg', '1763954530825-1989 TV_disk.png');
INSERT INTO public.albums VALUES (9, 'The Life of a Showgirl', 3, 2025, '41min', 12, '1763954574048-The Life of a Showgirl.jpg', '1763954574051-The Life of a Showgirl_disk.png');
INSERT INTO public.albums VALUES (10, 'Believe (Deluxe Edition)', 4, 2012, '1h 3min', 16, '1763955891342-Believe Deluxe Edition.jpg', '1763955891344-Believe Deluxe Edition_disk.png');
INSERT INTO public.albums VALUES (11, 'Purpose (Deluxe)', 4, 2015, '1h 9min', 18, '1763955953304-Purpose Deluxe.jpg', '1763955953305-Purpose Deluxe_disk.png');
INSERT INTO public.albums VALUES (12, 'Justice', 4, 2021, '45min', 16, '1763956000193-Justice.jpg', '1763956000194-Justice_disk.png');
INSERT INTO public.albums VALUES (13, 'Garrafas e Bocas (A Saideira)', 5, 2021, '43min', 15, '1763956136369-Garrafas e Bocas A Saideira.jpg', '1763956136373-Garrafas e Bocas_disk.png');
INSERT INTO public.albums VALUES (14, 'Diferentão (Ao Vivo)', 5, 2023, '1h 14min', 21, '1763956179881-Diferento Ao Vivo.jpg', '1763956179882-Diferento Ao Vivo_disk.png');
INSERT INTO public.albums VALUES (15, 'Diferentão 2 (Ao Vivo)', 5, 2024, '1h 5min', 20, '1763956226787-Diferento 2 Ao Vivo.jpg', '1763956226791-Diferento 2 Ao Vivo_disk.png');
INSERT INTO public.albums VALUES (16, 'A Hora É Agora (Ao Vivo Em Jurerê)', 6, 2012, '59min', 18, '1763956359534-A Hora  Agora Ao Vivo Em Jurer.jpg', '1763956359534-A Hora  Agora - Ao Vivo em Jurer_disk.png');
INSERT INTO public.albums VALUES (17, 'Os Anjos Cantam', 6, 2015, '53min', 17, '1763956401405-Os Anjos Cantam.jpg', '1763956401411-Os Anjos Cantam_disk.png');
INSERT INTO public.albums VALUES (18, 'Terra Sem Cep (Ao Vivo)', 6, 2018, '39min', 14, '1763956442269-Terra Sem Cep Ao Vivo.jpg', '1763956442274-Terra Sem Cep Ao Vivo_disk.png');
INSERT INTO public.albums VALUES (19, 'SIS (Soft Is Strong)', 7, 2024, '11min', 5, '1763956534096-SIS Soft Is Strong.jpg', '1763956534098-SIS Soft Is Strong_disk.png');
INSERT INTO public.albums VALUES (20, 'Beautiful Chaos', 7, 2025, '14min', 5, '1763956567829-Beautiful Chaos.jpg', '1763956567835-Beautiful Chaos_disk.png');
INSERT INTO public.albums VALUES (21, 'Midnight Memories (Deluxe)', 8, 2013, '59min', 18, '1763956680381-Midnight Memories Deluxe.jpg', '1763956680385-Midnight Memories Deluxe_disk.png');
INSERT INTO public.albums VALUES (22, 'FOUR (Deluxe)', 8, 2014, '57min', 16, '1763956710713-FOUR Deluxe.jpg', '1763956710714-FOUR Deluxe_disk.png');
INSERT INTO public.albums VALUES (23, 'Made In The A.M. (Deluxe Edition)', 8, 2015, '58min', 17, '1763956740796-Made In The A.M. Deluxe Edition.jpg', '1763956740798-Made In The A.M. Deluxe Edition_disk.png');
INSERT INTO public.albums VALUES (24, 'Pop Life', 9, 2007, '54min', 11, '1763956826384-Pop Life.jpg', '1763956826385-Pop Life_disk.png');
INSERT INTO public.albums VALUES (25, 'One Love (Club Version)', 9, 2009, '1h 31min', 14, '1763956868173-One Love Club Version.jpg', '1763956868174-One Love Club Version_disk.png');
INSERT INTO public.albums VALUES (26, 'Listen', 9, 2014, '1h 4min', 14, '1763956900635-Listen.jpg', '1763956900639-Listen_disk.png');
INSERT INTO public.albums VALUES (27, 'Dangerous Woman', 10, 2016, '1h 3min', 15, '1763956990687-Dangerous Woman.jpg', '1763956990689-Dangerous Woman_disk.png');
INSERT INTO public.albums VALUES (28, 'Positions', 10, 2020, '41min', 14, '1763957022308-Positions.jpg', '1763957022309-Positions_disk.png');
INSERT INTO public.albums VALUES (29, 'eternal sunshine', 10, 2024, '35min', 13, '1763957050875-eternal sunshine.jpg', '1763957050877-eternal sunshine_disk.png');


--
-- TOC entry 4890 (class 0 OID 42212)
-- Dependencies: 224
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4884 (class 0 OID 42130)
-- Dependencies: 218
-- Data for Name: singers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.singers VALUES (1, '1763952789214-sabrinaCarpenter.jpg', 'Sabrina Carpenter', 'Pop', 'Sabrina Carpenter nasceu em 11 de maio de 1999, na Pensilvânia (EUA). Ela começou sua carreira como atriz na Disney Channel, onde ficou conhecida por interpretar Maya Hart na série “Girl Meets World” (2014–2017). Paralelamente, Sabrina começou a investir na música, lançando seu primeiro álbum, Eyes Wide Open (2015). Com o tempo, ela amadureceu musicalmente, tornando-se uma das artistas pop mais influentes da nova geração, reconhecida por suas letras irônicas e bem escritas, sua voz poderosa e uma estética sofisticada e divertida.', '“Espresso” (2024) — um sucesso global que dominou as paradas e virou trend nas redes sociais, com o refrão “That’s that me espresso”.');
INSERT INTO public.singers VALUES (2, '1763952847946-beyonce.jpg', 'Beyoncé', 'R&B', 'Beyoncé nasceu em 4 de setembro de 1981, em Houston, Texas (EUA). Ela iniciou sua carreira como vocalista do grupo feminino Destiny’s Child, um dos maiores sucessos do final dos anos 1990 e início dos 2000. Após o término do grupo, lançou sua carreira solo com o álbum Dangerously in Love (2003), que trouxe grandes hits e a consagrou como estrela mundial. Ao longo dos anos, Beyoncé se tornou um ícone da música e da cultura pop, conhecida por suas performances intensas, voz marcante e produções visuais inovadoras. Álbuns como Lemonade (2016) e Renaissance (2022) reforçaram sua influência artística, abordando temas como empoderamento feminino, identidade negra e liberdade criativa.', '“Single Ladies (Put a Ring on It)” (2008) — um dos maiores sucessos da carreira de Beyoncé. A música se tornou um hino de independência feminina e ganhou fama mundial por sua coreografia icônica e refrão marcante, consolidando seu status como uma das artistas mais poderosas da indústria musical.');
INSERT INTO public.singers VALUES (3, '1763952878343-taylorSwift.jpg', 'Taylor Swift', 'Pop', 'Taylor Swift nasceu em 13 de dezembro de 1989, em Reading, Pensilvânia (EUA). Ela começou sua carreira muito jovem na música country, lançando seu álbum de estreia Taylor Swift (2006), que rapidamente chamou atenção por suas letras sinceras e narrativas pessoais. Com o passar dos anos, Taylor transitou do country para o pop, tornando-se uma das artistas mais bem-sucedidas e influentes do mundo. Conhecida por escrever suas próprias músicas, ela é admirada por transformar experiências pessoais em composições intensas e autênticas. Álbuns como 1989 (2014), Folklore (2020) e Midnights (2022) mostram sua versatilidade artística e maturidade criativa. Além disso, sua turnê The Eras Tour (2023–2024) se tornou um marco cultural e econômico na indústria da música.', '“Shake It Off” (2014) — um dos maiores hits da carreira de Taylor Swift. A música marcou sua transição definitiva para o pop, com uma mensagem leve e divertida sobre ignorar críticas e seguir em frente. Tornou-se um sucesso global, alcançando o topo das paradas e se tornando um símbolo de sua nova era musical.');
INSERT INTO public.singers VALUES (4, '1763952909176-justinBieber.jpg', 'Justin Bieber', 'Pop', 'Justin Bieber nasceu em 1º de março de 1994, em London, Ontário (Canadá). Ele foi descoberto ainda adolescente após postar vídeos cantando no YouTube, chamando a atenção do empresário Scooter Braun e, logo depois, de Usher. Seu primeiro single, “One Time” (2009), e o álbum My World 2.0 (2010) o transformaram em um fenômeno global da música pop, especialmente com o sucesso “Baby”. Ao longo dos anos, Justin amadureceu musicalmente, explorando sonoridades mais voltadas ao R&B e à música eletrônica, com letras mais pessoais e reflexivas. Apesar das polêmicas e pausas na carreira, ele continua sendo um dos artistas mais influentes de sua geração, com uma base de fãs enorme e uma trajetória marcada por evolução e resiliência.', '“Sorry” (2015) — um dos maiores sucessos de Justin Bieber, presente no álbum Purpose. A música combina batidas eletrônicas tropicais e uma melodia viciante, tornando-se um hit mundial. Além de dominar as paradas, “Sorry” marcou a fase de amadurecimento do cantor e consolidou seu retorno ao topo das listas após um período afastado dos holofotes.');
INSERT INTO public.singers VALUES (5, '1763952938391-dilsinho.jpg', 'Dilsinho', 'Pagode Romântico', 'Dilsinho nasceu em 26 de junho de 1992, no Rio de Janeiro (RJ). Desde jovem, demonstrou paixão pela música e começou compondo para outros artistas do samba e pagode antes de investir na própria carreira. Seu primeiro álbum solo, Dilsinho (2014), trouxe um estilo moderno e romântico que rapidamente conquistou o público. Com uma voz suave e letras sobre amor e relacionamentos, Dilsinho se tornou um dos principais representantes do pagode romântico contemporâneo. Com o passar dos anos, ele se destacou pela mistura de romantismo com arranjos pop e R&B, tornando seu som acessível a diferentes públicos.', '“Péssimo Negócio” (2018) — uma das canções mais marcantes da carreira de Dilsinho. A música se tornou um dos maiores hits do pagode moderno e ajudou a consolidar Dilsinho como um dos artistas mais populares do gênero.');
INSERT INTO public.singers VALUES (6, '1763952971737-jorgeMateus.jpg', 'Jorge e Mateus', 'Sertanejo Universitário', 'A dupla Jorge & Mateus foi formada em 2005, na cidade de Itumbiara, Goiás. Ambos começaram a cantar em bares e eventos locais até se unirem e conquistarem o público com suas vozes marcantes e letras românticas. Eles foram fundamentais para popularizar o sertanejo universitário, estilo que mistura o sertanejo tradicional com influências pop e melodias mais modernas. Com o passar dos anos, se tornaram uma das duplas mais bem-sucedidas do Brasil, acumulando milhões de fãs e sucessos que marcaram gerações. Conhecidos por suas apresentações ao vivo cheias de emoção, Jorge & Mateus continuam como grandes referências no cenário musical brasileiro.', '“Os Anjos Cantam” (2015) — uma das músicas mais icônicas da dupla. A canção combina romantismo e melodia envolvente, se tornando um hino entre os fãs e uma presença constante nas rádios de todo o país.');
INSERT INTO public.singers VALUES (7, '1763953003266-katseye.jpg', 'KATSEYE', 'Pop global', 'KATSEYE é um grupo feminino internacional formado pela parceria entre HYBE Corporation (empresa do BTS) e Geffen Records, nos Estados Unidos. O grupo nasceu através do reality show The Dream Academy (2023), que selecionou seis integrantes de diferentes países: Daniela, Lara, Manon, Megan, Sophia e Yoonchae. Com uma proposta de unir culturas e estilos musicais, o KATSEYE representa o conceito de um girl group global, combinando produção coreana com sonoridade pop ocidental. O debut oficial aconteceu em 28 de junho de 2024, e desde então o grupo vem conquistando destaque nas paradas internacionais e nas redes sociais.', '“Gnarly” (2024) — uma das faixas mais marcantes do grupo. O grupo conquistou reconhecimento mundial e marcou presença nas principais paradas, consolidando-se como uma das estreias mais promissoras do pop internacional.');
INSERT INTO public.singers VALUES (8, '1763953034345-oneDirection.jpg', 'One Direction', 'Pop', 'O One Direction foi formado em 2010, durante o programa The X Factor UK. Embora os membros — Harry Styles, Liam Payne, Louis Tomlinson, Niall Horan e Zayn Malik — tenham se inscrito originalmente como artistas solo, o jurado Simon Cowell decidiu reuni-los como um grupo. O sucesso veio rapidamente com o single de estreia “What Makes You Beautiful”, que se tornou um fenômeno mundial. Ao longo de cinco álbuns de estúdio, o grupo dominou as paradas e conquistou milhões de fãs em todo o mundo, sendo considerado um dos maiores fenômenos do pop da década de 2010. Em 2015, após a saída de Zayn Malik e uma turnê mundial, o grupo anunciou uma pausa por tempo indeterminado, permitindo que cada integrante seguisse carreira solo.', '“What Makes You Beautiful” (2011) — o primeiro grande sucesso da banda. A música se tornou um hino pop mundial. Com esse single, o One Direction alcançou o topo das paradas e deu início a uma das carreiras mais bem-sucedidas da história do pop adolescente.');
INSERT INTO public.singers VALUES (9, '1763953064632-davidGuetta.jpg', 'David Guetta', 'Eletrônica', 'David Guetta nasceu em 7 de novembro de 1967, em Paris, França. Ele começou sua carreira como DJ nos anos 1980, tocando em clubes parisienses, até se tornar um dos maiores produtores e nomes da música eletrônica mundial. Guetta foi um dos principais responsáveis por popularizar a EDM (Electronic Dance Music) no mainstream, misturando batidas de house com vocais pop e colaborações com grandes artistas como Sia, Rihanna, Nicki Minaj, Usher e Akon. Com sucessos que marcaram festas e rádios ao redor do mundo, ele ajudou a transformar o som eletrônico em um fenômeno global e segue ativo lançando hits e participando dos maiores festivais de música do planeta.', '“Titanium” (feat. Sia) (2011) — um dos maiores sucessos da carreira de David Guetta. A canção combina uma produção eletrônica poderosa com os vocais marcantes de Sia, transmitindo uma mensagem de força e superação. Com “Titanium”, Guetta consolidou seu nome como um dos maiores DJs e produtores do mundo, eternizando um dos hinos mais icônicos da música eletrônica moderna.');
INSERT INTO public.singers VALUES (10, '1763953116302-arianaGrande.jpg', 'Ariana Grande', 'Pop', 'Ariana Grande nasceu em 26 de junho de 1993, em Boca Raton, Flórida (EUA). Ela começou sua carreira como atriz na Nickelodeon, interpretando Cat Valentine nas séries Victorious e Sam & Cat. Pouco depois, iniciou sua trajetória na música, lançando o álbum Yours Truly (2013), que destacou sua impressionante extensão vocal e estilo inspirado nas divas do R&B dos anos 1990. Com o passar dos anos, Ariana se consolidou como uma das maiores estrelas do pop mundial, misturando pop, R&B e elementos eletrônicos com letras sobre amor, autoconhecimento e superação. Além de seu talento vocal excepcional, ela também é reconhecida por sua estética marcante e por álbuns conceituais como Sweetener (2018) e Thank U, Next (2019).', '“Thank U, Next” (2018) — um dos maiores sucessos da carreira de Ariana Grande. A cantora alcançou o topo das paradas mundiais e consolidou seu nome como uma das artistas mais influentes e admiradas da música pop contemporânea.');


--
-- TOC entry 4892 (class 0 OID 42243)
-- Dependencies: 226
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.songs VALUES (1, 'emails i can''t send', 'emails i can''t send aborda o trauma causado pela trai‡Æo do pai e como esse acontecimento abalou profundamente a confian‡a de Sabrina Carpenter. A m£sica ‚ confessional e direta, expressando raiva, m goa e a dificuldade de perdoar. O impacto do epis¢dio aparece tamb‚m em seus relacionamentos amorosos, j  que a desconfian‡a aprendida se repete com novos parceiros. A can‡Æo mistura tristeza, frustra‡Æo e ironia, mostrando como esse trauma familiar continua influenciando sua vida emocional e sua forma de amar.', 1, 1, '1:44', 'It''s times like these, wish I had a time machine So I could see what you did October 13th At 10:15, were you really asleep? Were you lying to me and the family? There''s no us in us when I''m lacking trust You wanna discuss, ugh, you disgust me Don''t make me cuss you out, why''d you let me down? Don''t say sorry now And thanks to you, I, I can''t love right I get nice guys and villainize them Read their texts like they''re having sex right now Scared I''ll find out that it''s true And if I do, then I blame you For every worst that I assume When I''m 45, someone calls me their wife And he fucks our lives in one selfish night Don''t think I''ll find forgiveness as fast as mom did And, God, I love you, but you''re such a dipshit Please, fucking fix this ''Cause you were all I looked up to Now I can''t even look at you (I mean, as they say in Chicago) (He had it coming)');
INSERT INTO public.songs VALUES (2, 'Vicious', 'Em Vicious, Sabrina Carpenter reflete sobre a dor de amar algu‚m que aparentava ser perfeito para os outros, mas era manipulador em privado. A m£sica ‚ um desabafo sobre ter acreditado em promessas vazias e ter sido facilmente trocada. Misturando raiva e vulnerabilidade, ela reconhece o comportamento cruel do ex e transforma essa m goa em clareza e for‡a pessoal.', 1, 1, '2:30', 'One year, ten thousand bad moments But it was dressed up in heated emotion, and I tried to look for the best in the worst But, like, fuck me, that caused a commotion You''re lucky I''m a private person I''ve quietly carried your burden, and Everyone thinks you''re an angel But, shit, I would probably use different wording Oh, you''re so vicious Love me then pretend you didn''t Crush my heart and wreck my image Why you gotta be so vicious? You like a certain type of woman Who''s smart, but neglects intuition When you''re insecure, could be me, could be her You just run to whoever is winning Said that it was me and you for life Now you''re kinda acting like I died Oh, you''re so vicious Love me then pretend you didn''t Crush my heart and wreck my image Why you gotta be so, so, so Oh, you''re so vicious Love me then pretend you didn''t Half of me just can''t resist it Why you gotta be so vicious? Oh, no Why you gotta be so- Oh, oh Why you gotta be so vicious? You don''t feel remorse, you don''t feel the effects ''Cause you don''t think you hurt me if you wish me the best I should have known all along, I was only the next one To take your love songs as a promise Oh, you''re so vicious I loved you, but I wish I didn''t If you''re out there somewhere, listening Why you gotta be so vicious?');
INSERT INTO public.songs VALUES (3, 'Read Your Mind', 'Read Your Mind fala sobre a frustra‡Æo de lidar com algu‚m que envia sinais confusos no relacionamento. Sabrina Carpenter expressa a inseguran‡a de tentar entender um parceiro que pede espa‡o, mas exige aten‡Æo, e cuja comunica‡Æo amb¡gua a faz duvidar de si mesma. O refrÆo refor‡a seu desabafo: ela nÆo consegue "ler a mente" dele e s¢ deseja clareza e reciprocidade.', 1, 1, '3:28', '(Ah, ah, ah, ah, ah) (Ah, ah, ah, ah, ah) Ah, ah Made it clear when you told me (ah, ah) Don''t know why, but you gotta be lonely (ah, ah, ah) Say it''s hard, but you make it look easy (ah, ah) So I''m trying to live in reality (ah, ah, ah, ah) Decompressing, tryna ease the tension But you got me stressing Feeling like I need to call When you sneak up on me Tell me that you miss me in your life I can''t read your mind You say that you need to be alone But night and day, want me at your beck and call You say you know that you might be crossing a line Wasting all our time To think that we could be casual You''re not my friend and baby, you never were Why the fuss if you say you just wanna be mine? I can''t read your mind Tell me, what''s gonna happen When it''s you and me in a room But you know you can''t have it? Oh, I''ll be laughing When you say that you really have changed Finally found your way ''Cause I''m close to your face (ah, ah, ah, ah, ah) Double checking Did I get the message in the way you intended? Got me second guessing When you sneak up on me Tell me that you need me in your life I can''t read your mind You say that you need to be alone But night and day want me at your beck and call You say you know that you might be crossing a line Wasting all our time To think that we could be casual You''re not my friend and baby you never were Why the fuss if you say you just wanna be mine? I can''t read your mind You say that you need to be alone But night and day want me at your beck and call You say you know that you might be crossing a line I can''t read your mind You say that you need to be alone But night and day want me at your beck and call (want me at your beck and call) You say you know that you might be crossing a line Wasting all our time (time) To think that we could be casual (think) You''re not my friend and baby you never were (not my friend) Why the fuss if you say you just wanna be mine? (Why the fuss?) I can''t read your mind Ah, ah, ah, ah, la, mmm, mmm');
INSERT INTO public.songs VALUES (4, 'Tornado Warnings', 'Em Tornado Warnings, Sabrina Carpenter usa o alerta de tornado como met fora para ignorar sinais claros de um relacionamento ruim. A m£sica mostra como ela nega a pr¢pria realidade at‚ para a terapeuta para evitar encarar a dor, dizendo que nem viu a pessoa ou que nada aconteceu. Tamb‚m revela seu desgaste emocional ao admitir que precisa de tempo para pensar em si mesma, j  que est  tÆo obcecada pelo outro que nÆo consegue se ouvir. A can‡Æo combina vulnerabilidade e autocr¡tica ao retratar o caos interno de quem insiste em ignorar o ¢bvio.', 1, 1, '3:24', 'We were never in the park Talkin'' on a see-saw teetering With our feelings in the dark Ignoring tornado warnings He didn''t hold me in his arms We didn''t stumble over the pages Of our relationship arc Ignoring tornado warnings Don''t understand how quickly we get Right back in our rhythm without missing a step And logically the last thing I should have on my mind But I want you there sometimes I guess maybe that''s why I''m lying to my therapist I keep saying things like: I never saw him and we never kissed Now I think somehow in my mind if I could convince him If he doesn''t see it, then maybe it doesn''t exist I think he''s onto me every time I say I''m over that son of a bitch I''m lying to my therapist I deserve an hour in a week To focus on my thoughts Not so obsessed with yours I can''t hear myself speak I deserve my own consideration Sometimes I wish I kept Some of my feelings in the basement So I''d still have some left Don''t understand how quickly we get Right back in our rhythm without missing a step And logically the last thing I should have on my mind But I want you there sometimes I guess maybe that''s why I''m lying to my therapist I keep saying things like: I never saw him and we never kissed Now I think somehow in my mind if I could convince him If he doesn''t see it, then maybe it doesn''t exist I think he''s onto me every time I say I''m over that son of a bitch I''m lying to my therapist I''ll drive you home, you drive me crazy But that''s not gonna stop me I''ll call you out, you call me baby But that''s not gonna stop me From lying to my therapist I keep saying things like: I never saw him and we never kissed Now I think somehow in my mind if I could convince him If he doesn''t see it, then maybe it doesn''t exist I think he''s onto me every time I say I''m over that son of a bitch I''m lying to my therapist');
INSERT INTO public.songs VALUES (5, 'because i liked a boy', 'Em because i liked a boy, Sabrina Carpenter mostra como um romance simples acabou gerando uma onda de ataques e julgamentos desproporcionais. Enquanto para ela a rela‡Æo era leve, as redes sociais transformaram tudo em um caos, levando-a a ser rotulada e at‚ a receber amea‡as. A m£sica expäe sua frustra‡Æo por perder o controle da pr¢pria narrativa e ser definida pelos outros (s¢ porque gostou de um garoto). Com ironia e vulnerabilidade, Sabrina critica o linchamento virtual e o impacto emocional de carregar r¢tulos injustos.', 1, 1, '3:16', 'I said I wanted Thin Mints And you said you knew a guy You showed up with a boombox And stars in your eyes Who knew cuddling on trampolines Could be so reckless? We bonded over Black Eyed Peas And complicated exes Fell so deeply into it It was all so innocent Now I''m a homewrecker, I''m a slut I got death threats filling up semi trucks Tell me who I am Guess I don''t have a choice All because I liked- I''m a hot topic on your tongue I''m a rebound gettin'' round Stealin'' from the young Tell me who I am Guess I don''t have a choice All because I liked a boy (Ooh, ooh) I''m not catastrophizing Everything''s derailing Was only tryna hold you close While your heart was failing It''s not internet illusion Just two kids going through it You said I''m too late to be your first love But I''ll always be your favorite Now I''m a homewrecker, I''m a slut I got death threats filling up semi trucks Tell me who I am Guess I don''t have a choice All because I liked- I''m a hot topic on your tongue I''m a rebound gettin'' round Stealin'' from the young Tell me who I am Guess I don''t have a choice All because I liked a boy (Ah, ah, ah) All because I liked a boy Fell so deeply into it It was all so innocent Dating boys with exes No, I wouldn''t recommend it I''m a homewrecker, I''m a slut I got death threats filling up semi trucks Tell me who I am Guess I don''t have a choice All because I liked a boy And all of this for what? When everything went down We''d already broken up Please, tell me who I am Guess I don''t have a choice All because I liked a boy (Ah, ah) a boy (Ah, ah) a boy (Ah, ah) All because I liked a boy');
INSERT INTO public.songs VALUES (6, 'Already Over', 'Em Already Over, Sabrina Carpenter retrata como o apego emocional mant‚m vivo um relacionamento que j  deveria ter acabado. A m£sica mostra o ciclo de reca¡das, promessas quebradas e encontros repetidos, revelando a dificuldade de se desligar de algu‚m que ainda exerce forte influˆncia. O refrÆo destaca o dilema entre razÆo e sentimento, que expäem a vulnerabilidade e o medo de perder o outro. No fim, a can‡Æo deixa claro que, mesmo ap¢s um t‚rmino, o apego persiste e ‚ isso que torna fechar a porta quase imposs¡vel.', 1, 1, '2:51', 'We been talkin'' for hours ''Bout how we shouldn''t talk for hours on end Kissin'' after a conversation About how we''d probably be better off as friends Same time here next weekend Say we won''t do this again Make me fall where I stand Only like you can Yeah, I say I''m done, but I''m still confused How am I supposed to close the door when I still need the closure? And I change my mind, but it''s still on you How am I supposed to leave you now that you''re already over? How am I supposed to leave you now that you''re already over? Selfishly, don''t wanna give you Time to be on someone else''s lips (ah) But I''ll take three short hours over three long weeks Pretendin'' like we don''t exist, hmm (ah) Same time here next weekend Say we won''t do this again Make me fall where I stand Only like you can Yeah, I say I''m done, but I''m still confused How am I supposed to close the door when I still need the closure? And I change my mind, but it''s still on you How am I supposed to leave you now that you''re already over? How am I supposed to leave you now that you''re already over? After the aftermath, I know you''ll be comin'' back To the back bedroom, and it won''t be the last Of the aftermath, I know you''ll be comin'' back To the back bedroom, and it won''t be the last time I say I''m done, but I''m still confused (ah) How am I supposed to close the door when I still need the closure? (Ooh) And I change my mind, but it''s still on you How am I supposed to leave you now that you''re already over? Yeah, I like my bed, but it likes you too How am I supposed to leave you now that you''re already over?');
INSERT INTO public.songs VALUES (7, 'how many things', 'Em how many things, Sabrina Carpenter mostra como objetos comuns viram gatilhos emocionais ap¢s um relacionamento, como no verso sobre o garfo uma lembran‡a constante de algu‚m que j  nÆo est  presente. A m£sica tamb‚m expäe a inseguran‡a de perceber que deixou de ser prioridade, especialmente em (I wonder how many things you think about before you get to me). Sabrina revela a dor de cair na lista de prioridades do outro enquanto continua inventando desculpas para ele. No fim, a can‡Æo mistura vulnerabilidade e honestidade ao retratar o sentimento de ainda pensar na pessoa em tudo, mesmo sabendo que nÆo recebe o mesmo em troca.', 1, 1, '4:04', 'You used a fork once It turns out forks are fucking everywhere There''s no hiding from the thought of us I got ways to find you anywhere We sat on the roof once Conversation took us everywhere And we talked until the Sun came up I wish we stayed just like we were up there I consider you, I''m not trying to It doesn''t matter whether or not I want to I can''t help it, it''s a habit Your corner in my mind is well established Ah, I, I wonder how many things you think about Before you get to me I wonder how many things you wanna do You think I''m in between I feel myself falling further down your priorities And I still make excuses for you constantly I wonder how many things you think about Before, before you get to me Remember when you left once? That never made too much sense to me Well, it hurt you so bad hurting me You really came to me for sympathy Oh, I consider you, and I''m not trying to It doesn''t matter whether or not I want to I can''t help it, it''s a habit Your corner in my mind is well established I, I wonder how many things you think about Before you get to me I wonder how many things you wanna do You think I''m in between I feel myself falling further down your priorities And I still make excuses for you constantly I wonder how many things you think about Before, before you get to me Am I not even a second thought? I wonder how many things you think about Before you get to me I wonder how many things you wanna do You think I''m in between I feel myself falling further down your priorities And I still make excuses for you constantly I wonder how many things you think about Before, before you get to me Wonder how many things');
INSERT INTO public.songs VALUES (8, 'bet u wanna', 'Em bet u wanna, Sabrina Carpenter usa a ironia para mostrar o arrependimento de quem antes a negligenciou. Com um tom provocativo, ela destaca que o ex agora sente falta e enfrenta a pr¢pria solidÆo, enquanto ela segue confiante. Versos como (Bet you wanna touch me now) revelam o desejo tardio dele, e trechos como (Feel the way it feels when you don''t have control of who I''m holding) expäem o ci£me e a perda de controle. O riso final - Haha - refor‡a que Sabrina superou o passado e se diverte com a situa‡Æo. A mistura de R&B e funk pop amplifica essa atmosfera segura, sensual e autossuficiente.', 1, 1, '3:11', 'Told me, told me I''m your only It''s all unfolding, babe Slowly, slowly Lies you sold me All saw the light of day (day) You''ve been wastin'' time On the other side If you''re satisfied, touch‚ Now you say you hate All the empty space And if you could go back, you''d stay Didn''t think about it when you let me down Hurts to see me out of your reach Bet you wanna touch me now It''s cold out there Let me know what you found (let me know what you found) Bet you wanna love me now Bet you wanna love me now Chase me, chase me That''s right, baby, yeah Feel the way it feels When you don''t have control Of who I''m holding Is it feeding all your fear? You''ve been wastin'' time On the other side If you''re satisfied, touch‚ But the lights are off Your so-called friends are gone Oh, I know what you''re ''bout to say Didn''t think about it when you let me down Hurts to see me out of your reach Bet you wanna touch me now It''s cold out there Let me know what you found (let me know what you found) Bet you wanna love me now Bet you wanna love me now Didn''t think about it when you let me down Hurts to see me out of your reach Bet you wanna touch me now It''s cold out there Let me know what you found (let me know what you found) Bet you wanna love me now Bet you wanna love me now I bet you wanna I bet you wanna (Oh-oh-oh) Bet you miss me Bet you''re reminiscin'' I bet you hate the way that you said goodbye And you still can''t even tell me why I hate the way that you left me dry But I''ll keep that between you and I Haha I bet you didn''t think about it when you let me down Hurts to see me out of your reach Bet you wanna touch me now (oh, touch me now) It''s cold out there Let me know what you found Bet you wanna love me now (uh-huh) Bet you wanna love me now');
INSERT INTO public.songs VALUES (9, 'Nonsense', 'Em Nonsense, Sabrina Carpenter transforma paixÆo em humor e leveza. A m£sica mostra como algu‚m pode deix -la tÆo nervosa que ela fala bobagens, como em (my tongue goes numb, sounds like blee-blah-blee). O tom brincalhÆo aparece em insinua‡äes como (How quickly can you take your clothes off?), revelando sua abordagem descontra¡da da sexualidade. A espontaneidade tamb‚m surge nos finais improvisados que ela cria ao vivo. Com met foras divertidas e situa‡äes t¡picas de quem est  apaixonado, a faixa celebra o lado ca¢tico e leve do amor.', 1, 1, '2:44', 'Oh-oh, oh-oh, oh-oh, oh-oh Oh-oh, oh-oh, oh-oh, oh-oh Oh-oh, oh-oh, oh-oh, oh-oh Oh, oh, oh Yeah Think I only want one number in my phone I might change your contact to Don''t Leave Me Alone You said you like my eyes and you like to make ''em roll Treat me like a queen, now you got me feelin'' thrown, oh But I can''t help myself when you get close to me Baby, my tongue goes numb, sounds like: Blee-blah-blee I don''t want no one else (no, no), baby, I''m in too deep Here''s a little song I wrote (a song I wrote) It''s about you and me (me) I''ll be honest Lookin'' at you got me thinkin'' nonsense Cartwheels in my stomach when you walk in And when you got your arms around me Oh, it feels so good I had to jump the octave I think I got an ex, but I forgot him And I can''t find my chill, I must''ve lost it I don''t even know, I''m talkin'' nonsense I''m talkin'', I''m talkin'' (ah-ah-ah), I''m talkin'' I''m talkin'' all around the clock I''m talkin'' hope nobody knocks I''m talkin'' opposite of soft I''m talkin'' wild, wild thoughts You gotta keep up with me I got some young energy I caught the L-O-V-E How do you do this to me? But I can''t help myself when you get close to me Baby, my tongue goes numb, sounds like: Blee-blah-blee I don''t want no one else (no, no), baby, I''m in too deep (too deep) Here''s a little song I wrote (a song I wrote) It''s about you and me I''ll be honest (honest) Lookin'' at you got me thinkin'' nonsense (nonsense) Cartwheels in my stomach when you walked in (when you walked in) When you got your arms around me Oh, it feels so good I had to hit the octave I think I got an ex, but I forgot him And I can''t find my chill, I must''ve lost it I don''t even know (oh-oh), I''m talkin'' nonsense I''m talkin'', I''m talkin'', I''m talkin'' I''m talkin'', I''m talkin'', na-na-na I''m talkin'' (blah-blah, blah, blah-blah) Ah-ah, ah-ah, ah (ah-ah) I don''t even know it anymore (Oh-oh, oh-oh) This song catchier than chickenpox is I bet your house is where my other sock is Woke up this morning thought I''d write a pop hit (ha, haha) How quickly can you take your clothes off? Pop quiz Hahaha That one''s not gonna make it Ha, haha, haha Most of these aren''t gonna make it');
INSERT INTO public.songs VALUES (10, 'Fast Times', 'Fast Times fala sobre viver tudo r pido demais, sem espa‡o para pensar ou ter paciˆncia. Sabrina mostra como emo‡äes e relacionamentos acontecem no impulso, como em (couple days in, I call you baby) deixando claro que nÆo h  tempo para reconsiderar nada. As imagens de encontros intensos, por‚m passageiros, refor‡am esse ritmo acelerado. O videoclipe, com est‚tica de a‡Æo, complementa a ideia de enfrentar tudo no calor do momento. No fim, a m£sica celebra a intensidade do presente, mesmo que isso traga decisäes impulsivas e sentimentos confusos.', 1, 1, '2:55', 'Sun''s up too soon like daylight savings Mixed emotions are congregating Picturing us in all these places Ahead of myself''s an understatement Sky looks so purple, I can taste it Couple days in, I call you baby Three stories up here contemplating But what the fuck is patience? These are fast times and fast nights, yeah No time for rewrites, we couldn''t help it Outlines on bed sides, yeah Give me a second to forget I ever really meant it Fast times and fast nights, yeah Closed eyes and closed blinds, we couldn''t help it Outlines on bed sides, yeah Give me a second to forget I ever really meant it My feelings used to be serrated But you speak in such a perfect cadence Tiptoeing past so many stages But what the fuck is patience? These are fast times and fast nights, yeah No time for rewrites, we couldn''t help it Outlines on bed sides, yeah Give me a second to forget I ever really meant it Fast times and fast nights, yeah Closed eyes and closed blinds, we couldn''t help it Outlines on bed sides, yeah Give me a second to forget I ever really meant it These, these are These are the fast times These, these are These are the These are fast times and fast nights, yeah No time for rewrites, we couldn''t help it Outlines on bed sides, yeah Give me a second to forget I ever really meant it Fast times and fast nights, yeah Closed eyes and closed blinds, we couldn''t help it Outlines on bed sides, yeah Give me a second to forget I ever really meant it');
INSERT INTO public.songs VALUES (11, 'skinny dipping', 'Em skinny dipping, Sabrina Carpenter usa a met fora de se despir e mergulhar para representar deixar m goas para tr s e aceitar o passado com maturidade. A m£sica mostra encontros cheios de lembran‡as e a tentativa de seguir em frente sem reviver antigas dores. O clipe refor‡a essa ideia com Sabrina soltando cartas ao vento, simbolizando desapego e cura emocional.', 1, 1, '2:58', 'It''ll be a Wednesday And I''ll be going to this coffee shop Hear the barista call an oat milk latte and your name And I look up from my phone And think there''s no chance it''s you, but it is You''ll say: Hi, I''ll say: Hi, how are you? You''ll say: How''s your family? How''s your sister? I''ll say: Shannon''s being Shannon After a minute of nonsensical chatter, you''ll say Well, this was really nice Maybe we should do this on purpose sometime And it''ll have been long enough That we won''t harp on Arguments in your garage All the ways we sabotaged it What it was and what it wasn''t We''ve been swimming on the edge of a cliff I''m resistant, but going down with the ship It''d be so nice, right? Right? If we could take it all off and just exist And skinny dip in water under the bridge You''ll suggest a restaurant we used to go to And I''ll say: Won''t that be too nostalgic? And you''ll say: Maybe, but let''s do it anyway We won''t sit at our same old table, I promise And we won''t bring up the past We''ll keep it bureaucratic And we won''t say it But both of us, we''ll be thinking about how different we are From those scared little kids that had those Arguments in your garage All the ways we sabotaged it What it was and what it wasn''t We''ve been swimming on the edge of a cliff I''m resistant, but going down with the ship It''d be so nice, right? Right? If we could take it all off and just exist And skinny dip in water under the bridge Hah, ah, ah We''ve been swimming on the edge of a cliff I''m resistant, but going down with the ship It''d be so nice, right? Right If we could take it all off and just exist And skinny dip in water under the bridge');
INSERT INTO public.songs VALUES (12, 'Bad for Busines', 'Em Bad for Business, Sabrina Carpenter mostra como o amor pode bagun‡ar a vida profissional: He''s good for my heart, but he''s bad for business. Mesmo com cr¡ticas dos amigos, ela valoriza o parceiro e aceita as consequˆncias, destacando que …s vezes o cora‡Æo vem antes da razÆo.', 1, 1, '3:08', 'He''s good for my heart, but he''s bad for business Tears me apart when he grants my wishes All of my friends think I''ve gone crazy But they don''t know me like my ba-, ba-, ba-, ba- We look good in photographs, I like the way you like to laugh At dirty jokes, I know they''ll always land Used to get to work on time, now you''re taking up my nights Never been so glad to be so tired Ooh, ooh, ooh, I''m mad for you It''s sad but true and I know it Ah, ah, ah, you''re on my mind You stole my life and it''s showing (baby) He''s good for my heart, but he''s bad for business Tears me apart when he grants my wishes All of my friends think I''ve gone crazy But they don''t know me like my baby If I''m just writing happy songs, would anybody sing along? You had to go and break into my head And I would try to fight these feelings I can''t find a single reason I''d make all the same mistakes again (ah) Ooh, ooh, ooh, I''m mad for you It''s sad but true and I know it Ah, ah, ah, you''re on my mind You stole my life and it''s showing (ba-, ba-, ba-) He''s good for my heart, but he''s bad for business Tears me apart when he grants my wishes All of my friends think I''ve gone crazy But they don''t know me like my baby He''s good (good), he''s bad (bad) The best I''ve ever had (the best I''ve ever had) And he''s so nice it''s sad (it''s sad) He ruined all my plans And he just makes me so crazy (makes me crazy) I know where he wants me (wants me) And he''ll be the death of me He''s good for my heart, but he''s bad for business (he''s very bad for business) Tears me apart when he grants my wishes (grants my wishes) All of my friends think I''ve gone crazy But they don''t know me like my baby He''s good for my heart, but he''s bad for business (he''s so bad) Tears me apart when he grants my wishes All of my friends think I''ve gone crazy But they don''t know me like my baby');
INSERT INTO public.songs VALUES (13, 'decode', 'Em decode, Sabrina Carpenter fala sobre o desgaste emocional de tentar entender sinais confusos em um relacionamento. O verso There''s nothing left here to decode mostra a liberta‡Æo ao abandonar a busca por respostas. A m£sica reflete sobre autenticidade e desgaste, encerrando o ciclo de frustra‡Æo e abrindo espa‡o para recome‡ar.', 1, 1, '3:08', 'You''re good at the falling, not the staying there You''re good at the giving too much, then getting scared You''re good at impersonating someone who cares And you had me for a minute there But now I wonder why I let your confusion keep me up at night I''m so tired Re-read every single undertone, and I Overanalyzed it Front, back and beside it Where else can we go? There''s nothing left here to decode Done looking for signs in The gaps and the silence It''s just gettin'' old There''s nothing left here to decode Mm-hmm, mm-hmm, mm-mm There''s a weight off my shoulders now that I don''t chase you Being myself, did that emasculate you? Learnin'' from you that I can walk away, too And you had me for a minute, too But now I wonder why I let your indecision keep me up at night I''m so tired Unpacked every single word you wrote, and I Overanalyzed it Front, back and beside it Where else can we go? There''s nothing left here to decode Done looking for signs in The gaps and the silence It''s just gettin'' old There''s nothing left here to decode Mm-hmm, mm-hmm, mm-mm There''s nothing left here to decode Mm-hmm, mm-hmm, mm-mm Now I wonder why I let your confusion keep me up at night I''m so tired Re-read every single undertone, and I Overanalyzed it Front, back and beside it Where else can we go? There''s nothing left here to decode Done looking for signs in The gaps and the silence It''s just gettin'' old There''s nothing left here to decode There''s nothing Mm-hmm, mm-hmm, mm-mm There''s nothing, there''s nothing There''s nothing left here to decode There''s nothing Oh-oh, oh-oh, mm-mm, mm-mm There''s nothing, there''s nothing There''s nothing left here to decode I''m gon'' make a video to our future selves Haha');
INSERT INTO public.songs VALUES (14, 'Taste', 'Em Taste, Sabrina Carpenter aborda como sua presen‡a continua afetando seu ex, mesmo ap¢s o t‚rmino. O refrÆo sugere que sua marca emocional e sexual permanece, tornando imposs¡vel ignorar sua influˆncia. Com um tom confiante e provocativo, a m£sica trata de autossuficiˆncia e legado emocional.', 1, 2, '2:37', 'Oh, I leave quite an impression Five feet, to be exact You''re wonderin'' why half his clothes went missin'' My body''s where they''re at Now I''m gone, but you''re still layin'' Next to me, one degree of separation I heard you''re back together and if that''s true You''ll just have to taste me when he''s kissin'' you If you want forever, and I bet you do You''ll just have to taste me too Uh-huh He pins you down on the carpet Makes paintings with his tongue (la-la-la-la-la-la-la) He''s funny, now all his jokes hit different Guess who he learned that from? Now I''m gone, but you''re still layin'' Next to me, one degree of separation I heard you''re back together and if that''s true You''ll just have to taste me when he''s kissin'' you If you want forever, and I bet you do (I bet you do) Just know you''ll taste me too (La-la-la-la-la-la-la) Every time you close your eyes And feel his lips, you''re feelin'' mine And every time you breathe his air Just know I was already there You can have him if you like I''ve been there, done that once or twice And singin'' ''bout it don''t mean I care Yeah, I know I''ve been known to share Well, I heard you''re back together and if that''s true You''ll just have to taste me when he''s kissin'' you If you want forever, and I bet you do (I bet you do) Just know you''ll taste me too (taste me too, ow) (La-la-la-la-la-la-la) You''ll just have to taste me when he''s kissin'' you (you, no) (La-la-la-la-la-la-la) yeah, uh-uh You''ll just have to taste me when he''s kissin'' you');
INSERT INTO public.songs VALUES (15, 'Please Please Please', 'Em Please Please Please, Sabrina Carpenter usa humor e ironia para expressar a ansiedade de se envolver com algu‚m problem tico. A letra mostra o desejo de que o parceiro se comporte bem e evite situa‡äes constrangedoras, equilibrando vulnerabilidade e leveza de forma divertida.', 1, 2, '3:06', '(Please, please, please, don''t prove I''m right) I know I have good judgment, I know I have good taste It''s funny and it''s ironic that only I feel that way I promise ''em that you''re different And everyone makes mistakes, but just don''t I heard that you''re an actor, so act like a stand-up guy Whatever devil''s inside you, don''t let him out tonight I tell them it''s just your culture And everyone rolls their eyes, yeah, I know All I''m asking, baby Please, please, please Don''t prove I''m right And please, please, please Don''t bring me to tears when I just did my makeup so nice Heartbreak is one thing My ego''s another I beg you: Don''t embarrass me, motherfucker, ah-oh Please, please, please (ah-ah-ah) Well, I have a fun idea, babe (uh-huh): Maybe just stay inside I know you''re craving some fresh air But the ceiling fan is so nice (it''s so nice, right?) And we could live so happily If no one knows that you''re with me I''m just kidding, but really (kinda), really, really Please, please, please (please, don''t prove I''m right) Don''t prove I''m right And please, please, please Don''t bring me to tears when I just did my makeup so nice Heartbreak is one thing (heartbreak is one thing) My ego''s another (ego''s another) I beg you: Don''t embarrass me, motherfucker, ah-oh Please, please, please (ah-ah-ah) If you wanna go and be stupid Don''t do it in front of me If you don''t wanna cry to my music Don''t make me hate you prolifically Please, please, please (please) Please, please, please (please) Please (please), please (please), please (Ah-ah-ah-ah)');
INSERT INTO public.songs VALUES (16, 'Good Graces', 'Em Good Graces, Sabrina Carpenter mistura do‡ura e ironia para mostrar que gentileza nÆo ‚ ingenuidade. A letra refor‡a limites claros, destacando que ela nÆo tolera desrespeito e est  pronta para seguir em frente se necess rio.', 1, 2, '3:05', '(I won''t give a fuck about you) Oh-mmm (I won''t give a fuck about you) Mmm When I love you I''m sweet like an angel Drawin'' hearts ''round our names and dreamin'' of Writin'' vows, rockin'' cradles Don''t mistake my nice for naive I don''t waste a second, I know lots of guys You do something suspect, this cute ass bye-bye Like, ooh Baby, you say you really like it bein'' mine? So let me give you some advice Boy, it''s not that complicated You should stay in my good graces Or I''ll switch it up like that, so fast ''Cause no one''s more amazin'' At turnin'' lovin'' into hatred Boy, it''s not that complicated You should stay in my good graces Or I''ll switch it up like that (like that), so fast (so fast) ''Cause no one''s more amazin'' At turnin'' lovin'' into hatred I won''t give a fuck about you I won''t give a fuck about you I won''t give a fuck about you That was cool I won''t give a fuck about you (oh-oh) I won''t give a fuck about you I won''t give a fuck about you Yeah I''ll tell the world you finish your chores prematurely Break my heart and I swear I''m movin'' on With your favorite athlete Shoot his shot every night Want you every second, don''t need other guys You do something sus, kiss my cute ass bye-ye-ye Boy, it''s not that complicated You should stay in my good graces Or I''ll switch it up like that, so fast ''Cause no one''s more amazin'' (amazin'') At turnin'' lovin'' into hatred Boy, it''s not that complicated You should stay in my good graces Or I''ll switch it up like that (like that), so fast (so fast) ''Cause no one''s more amazin'' At turnin'' lovin'' into hatred I won''t give a fuck about you I won''t give a fuck about you I won''t give a fuck about you Oh-oh I won''t give a fuck about you (ooh) I won''t give a fuck about you I won''t give a fuck about you Mmm No, I won''t I won''t give a fuck about you, no, I won''t I won''t, I won''t No, I won''t I won''t give a fuck about you, no, I won''t I won''t, I won''t, I won''t');
INSERT INTO public.songs VALUES (17, 'Sharpest Tool', 'Em Sharpest Tool, Sabrina Carpenter usa sarcasmo para mostrar a frustra‡Æo com um parceiro imaturo. A letra evidencia falta de comunica‡Æo e mudan‡as de comportamento, transformando o desabafo em uma cr¡tica bem-humorada sobre relacionamentos.', 1, 2, '3:38', 'I know You''re not The sharpest tool in the shed We had sex, I met your best friends Then a bird flies by and you forget I don''t Hear a word Till your guilt creeps in On a Tuesday, send a soft: Hey As if you really don''t recall the time We were goin'' right, then you took a left Left me with a lot of shit to second-guess Guess I''ll waste another year on wonderin'' if If that was casual, then I''m an idiot I''m lookin'' for an answer in between the lines Lyin'' to yourself if you think we''re fine You''re confused and I''m upset, but We never talk about it We never talk about it We never talk about it All the silence just Makes it worse, really ''Cause it leaves you so Top of mind for me All the silence is Just your strategy ''Cause it leaves you so Top of mind for me We never talk about how you Found God at your ex''s house, always Made sure that the phone was face down Seems like overnight I''m just the bitch you hate now We never talk it through How you guilt-tripped me to open up to you Then you logged out, leave me dumbfounded Mmm, mmm, mmm, mmm We were goin'' right, then you took a left Left me with a lot of shit to second-guess Guess I''ll waste another year on wonderin'' if If that was casual, then I''m an idiot I''m lookin'' for an answer in between the lines Lyin'' to yourself if you think we''re fine You''re confused and I''m upset, but We never talk about it (we don''t talk about it) We never talk about it (we don''t talk about it) We never talk about it (we don''t talk about it) (We don''t t talk about it, we don''t talk about it) (We don''t t talk about it, we don''t talk about it) We never talk about how you Found God at your ex''s house, always Made sure that the phone was face down Seems like overnight I''m just the bitch you hate now We never talk it through How you guilt-tripped me to open up to you Then you logged out, leave me dumbfounded Mmm, mmm, mmm, mmm (We don''t talk about it) (We never talk about it) (We don''t talk about it) (Talk, talk, talk about it) (we never talk about it) (We don''t talk about it) (We don''t talk about it) (we never talk about it) (We don''t talk about it) (We don''t talk about it)');
INSERT INTO public.songs VALUES (18, 'Coincidence', 'Em Coincidence, Sabrina Carpenter usa sarcasmo para mostrar trai‡Æo e deslealdade disfar‡adas de casualidade. A letra ironiza desculpas do parceiro e destaca como certos padräes se repetem, transformando experiˆncias dolorosas em uma cr¡tica espirituosa sobre relacionamentos.', 1, 2, '2:44', '(One, two) (One, two, three, woo) The second I put my head on your chest She knew, she''s got a real sixth sense Now her name comes up once, then it comes up twice And without her even bein'' here, she''s back in your life Now she''s on the same damn city on the same damn night And you''ve lost all your common sense What a coincidence Oh-na-na, na-na-na-na Oh-na-na, na-na-na-na Last week, you didn''t have any doubts This week, you''re holdin'' space for her tongue in your mouth Now she''s sendin'' you some pictures wearin'' less and less Tryna turn the past into the present tense, huh Suckin'' up to all of your mutual friends And you''ve lost all your common sense (you''ve lost all your common sense) The way you told me the truth, minus seven percent (minus seven percent) What a coincidence, uh Oh-na-na, na-na-na-na Oh-na-na, na-na-na-na Na-na-na, na-na-na-na Na-na-na, na-na-na-na What a surprise, your phone just died Your car drove itself from LA to her thighs Palm Springs looks nice, but who''s by your side? Damn it, she looks kinda like the girl you outgrew Least that''s what you said (that''s what you said) What a coincidence Oh, wow, you just broke up again What a coincidence Oh-na-na, na-na-na-na Oh-na-na, na-na-na-na (coincidence) Na-na-na, na-na-na-na (coincidence) Na-na-na, na-na-na-na (coincidence)');
INSERT INTO public.songs VALUES (19, 'Bed Chem', 'Em Bed Chem, Sabrina Carpenter brinca com a ideia de qu¡mica de cama, contrastando conexäes leves e divertidas com experiˆncias menos compat¡veis. A letra mistura humor, desejo e referˆncias pessoais, criando uma faixa pop provocativa e descontra¡da.', 1, 2, '2:51', 'I was in a sheer dress the day that we met We were both in a rush, we talked for a sec Your friend hit me up so we could connect And what are the odds? You sent me a text And now the next thing I know, I''m like Manifest that you''re oversized I digress, got me scrollin'' like Out of breath, got me goin'' like Ooh (ah) Who''s the cute boy with the white jacket and the thick accent? Like Ooh (ah) Maybe it''s all in my head But I bet we''d have really good bed chem How you pick me up, pull me down, turn me ''round, oh, it just makes sense How you talk so sweet when you''re doin'' bad things, that''s bed (bed) chem (chem) How you''re lookin'' at me, yeah, I know what that means and I''m obsessed Are you free next week? I''d bet we''d have really good Come right on me I mean, camaraderie Said you''re not in my timezone, but you wanna be Where art thou? Why not uponeth me? See it in my mind, let''s fulfill the prophecy Ooh (ah) Who''s the cute guy with the wide, blue eyes and the big bad, mmm, like? Ooh (ah) I know it sound a bit redundant But I bet we''d have really good bed chem How you pick me up, pull me down, turn me ''round, oh, it just makes sense (just makes sense) How you talk so sweet when you''re doin'' bad things, that''s bed chem (oh, that''s bed chem) How you''re lookin'' at me, yeah, I know what that means and I''m obsessed (so obsessed) Are you free next week? I''d bet we''d have really good (bed chem) And I bet we''d both arrive at the same time (bed chem) And I bet the thermostat''s set at six-nine (bed che'', chem) And I bet it''s even better than in my head (my, ooh) How you pick me up, pull me down, turn me ''round, oh, it just makes sense (just makes sense) How you talk so sweet when you''re doin'' bad things, that''s bed chem (oh, that''s bed chem) How you''re lookin'' at me, yeah, I know what that means and I''m obsessed (so obsessed) Are you free next week? (Are you free next week?) I''d bet we''d have really good Hah (make me go), hah No, no, no Hah (make me go), hah No, no, no, no, oh, no, oh Hah (make me go), hah (yeah, yeah) No, no, no, oh Hah (make me go), hah Ooh, oh, babe (A little fade out?)');
INSERT INTO public.songs VALUES (20, 'Espresso', 'Em Espresso, Sabrina Carpenter usa o caf‚ como met fora para autoconfian‡a e poder de atra‡Æo. A letra divertida e cheia de trocadilhos celebra sua presen‡a marcante, feminilidade e atitude despreocupada, mostrando algu‚m irresist¡vel e segura de si.', 1, 2, '2:55', 'Now he''s thinkin'' ''bout me every night, oh Is it that sweet? I guess so Say you can''t sleep, baby, I know That''s that me, espresso Move it up, down, left, right, oh Switch it up like Nintendo Say you can''t sleep, baby, I know That''s that me, espresso I can''t relate to desperation My give-a-fucks are on vacation And I got this one boy and he won''t stop calling When they act this way, I know I got ''em Too bad your ex don''t do it for ya Walked in and dream-came-trued it for ya Soft skin and I perfumed it for ya (yes) I know I Mountain Dew it for ya (yes) That morning coffee, brewed it for ya (yes) One touch and I brand-newed it for ya Now he''s thinkin'' ''bout me every night, oh Is it that sweet? I guess so Say you can''t sleep, baby, I know That''s that me, espresso Move it up, down, left, right, oh Switch it up like Nintendo Say you can''t sleep, baby, I know That''s that me, espresso Holy shit Is it that sweet? I guess so I''m working late ''cause I''m a singer Oh, he looks so cute wrapped ''round my finger My twisted humor make him laugh so often My honeybee, come and get this pollen Too bad your ex don''t do it for ya Walked in and dream-came-trued it for ya Soft skin and I perfumed it for ya (yes) I know I Mountain Dew it for ya (yes) That morning coffee, brewed it for ya (yes) One touch and I brand-newed it for ya Now he''s thinkin'' ''bout me every night, oh Is it that sweet? I guess so Say you can''t sleep, baby, I know That''s that me, espresso Move it up, down, left, right, oh Switch it up like Nintendo Say you can''t sleep, baby, I know That''s that me, espresso Thinkin'' ''bout me every night, oh Is it that sweet? I guess so (yes) Say you can''t sleep, baby, I know That''s that me, espresso (yes) Move it up, down, left, right, oh Switch it up like Nintendo (yes) Say you can''t sleep, baby, I know That''s that me, espresso Is it that sweet? I guess so Mm, that''s that me, espresso');
INSERT INTO public.songs VALUES (21, 'Dumb & Poetic', 'Em Dumb & Poetic, Sabrina Carpenter critica quem finge profundidade, mas ‚ superficial e previs¡vel. Com ironia, ela mostra a diferen‡a entre discurso e atitudes, expondo a falta de maturidade emocional de quem se esconde atr s de clichˆs e aparˆncias.', 1, 2, '2:13', 'You''re so dumb and poetic It''s just what I fall for, I like the aesthetic Every self-help book, you''ve already read it Cherry-pick lines like they''re words you invented Gold star for highbrow manipulation And love everyone is your favorite quotation Try to come off like you''re soft and well-spoken Jack off to lyrics by Leonard Cohen Don''t think you understand Just ''cause you talk like one doesn''t make you a man You''re so sad there''s no communication But baby, you put us in this situation You''re running so fast from the hearts that you''re breakin'' Save all your breath for your floor meditation You''re so empathetic, you''d make a great wife And I promise the mushrooms aren''t changing your life Well, you crashed the car and abandoned the wreckage Fuck with my head like it''s some kind of fetish Don''t think you understand Just ''cause you act like one doesn''t make you a man Don''t think you understand Just ''cause you leave like one doesn''t make you a man');
INSERT INTO public.songs VALUES (22, 'Slim Pickins', 'Em Slim Pickins, Sabrina Carpenter aborda, com humor e ironia, a dificuldade de encontrar parceiros interessantes. A m£sica satiriza clichˆs de namoro moderno, mostrando frustra‡Æo e autodeprecia‡Æo diante das poucas op‡äes dispon¡veis.', 1, 2, '2:32', 'Guess I''ll end this life alone I am not dramatic, these are just the thoughts that pass right through me All the douchebags in my phone Play ''em like a slot machine If they''re winnin'', I''m just losin'' A boy who''s jacked and kind Can''t find his ass to save my life Oh, it''s slim pickings If I can''t have the one I love I guess it''s you that I''ll be kissing Just to get my fixings Since the good ones are deceased or taken I''ll just keep on moanin'' and bitchin'' Ah-ah-ah-ah Ah-ah-ah-ah Jesus, what''s a girl to do? This boy doesn''t even know the difference between there, their and they are Yet, he''s naked in my room Missing all the things he''s missing God knows that he isn''t living large A boy who''s nice that breathes I swear he''s nowhere to be seen It''s slim pickings If I can''t have the one I love I guess it''s you that I''ll be kissing Just to get my fixings Since the good ones are deceased or taken I''ll just keep on moanin'' and bitchin'' Moanin'' and bitchin'' Since the good ones call their exes wasted And since the Lord forgot my gay awakening Then I''ll just be here in the kitchen Serving up some moanin'' and bitchin''');
INSERT INTO public.songs VALUES (23, 'Juno', 'Em Juno, Sabrina Carpenter transforma a impaciˆncia e a urgˆncia de um romance intenso em uma narrativa divertida e acelerada. A m£sica explora o desejo de conexÆo imediata, misturando entusiasmo juvenil e curiosidade, enquanto a protagonista se entrega … atra‡Æo sem se preocupar com consequˆncias. O tom leve e pop da faixa refor‡a a sensa‡Æo de euforia e impulso t¡picos de paixäes intensas e passageiras.', 1, 2, '3:43', '(Oh-oh) (Aah) (Oh-oh) Don''t have to tell your hot ass a thing Oh, yeah, you just get it (get it) Whole package, babe, I like the way you fit God bless your dad''s genetics (genetics), mm, uh You make me wanna make you fall in love Oh, late at night, I''m thinkin'' ''bout you (ah, ah, ah) Wanna try on my fuzzy pink handcuffs? Oh, I hear you knockin'', baby Come on up I know you want my touch for life If you love me right, then who knows? I might let you make me Juno You know I just might Let you lock me down tonight One of me is cute, but two, though Give it to me, baby You make me wanna make you fall in love (oh) I showed my friends, then we high-fived (oh-oh) Sorry if you feel objectified (oh) Can''t help myself, hormones are high Give me more than just some butterflies You make me wanna make you fall in love (ooh-ooh) Oh, late at night, I''m thinkin'' ''bout you (ah, ah, ah) Wanna try on some freaky positions? (Ooh-ooh) Have you ever tried this one? I know you want my touch for life If you love me right, then who knows? I might let you make me Juno You know I just might Let you lock me down tonight One of me is cute, but two, though Give it to me, baby You make me wanna make you fall in love Adore me, hold me and explore me Mark your territory Tell me I''m the only, only, only, only one Adore me, hold me and explore me I''m so fuckin'' horny Tell me I''m the only, only, only, only one Oh, I know you want my touch for life If you love me right, then who knows? I might let you make me Juno You know I just might (might) Let you lock me down tonight One of me is cute, but two, though Give it to me, baby You make me wanna make you fall in love, oh');
INSERT INTO public.songs VALUES (24, 'Lie To Girls', 'Em Lie To Girls, Sabrina Carpenter usa ironia para mostrar como, …s vezes, as mulheres preferem acreditar em desculpas nos relacionamentos. (Se elas gostam de vocˆ, elas simplesmente mentem para si mesmas) destaca esse ciclo de autossabotagem. Com humor e sarcasmo, a m£sica aborda como sentimentos intensos podem levar a interpreta‡äes equivocadas, mostrando a tendˆncia de ignorar verdades desconfort veis em busca de conexÆo.', 1, 2, '3:22', 'Don''t swear on your mom That it''s the first drink that you''ve had in, like, a month No, don''t say it was just an isolated incident that happened once There''s no need to pretend I''ve never seen an ugly truth that I can''t bend To something that looks better, I''m stupid, but I''m clever Yeah, I can make a shit show look a whole lot like forever and ever You don''t have to lie to girls If they like you, they''ll just lie to themselves Like you, they''ll just lie to themselves You don''t have to lie to girls If they like you, they''ll just lie to themselves Don''t I know it better than anyone else? All of your best excuses, no, they don''t stand a chance Against all the chances I give you Isn''t ideal, but damn You don''t even have to try Turn you into a good guy You don''t have to lift a finger It''s lucky for you I''m just like My mother (and my sister) All my (all my friends) The girl out (-side the strip club) Getting her tarot cards read We love to read the cold, hard facts And swear they''re incorrect We love to mistake butterflies for cardiac arrest You don''t have to lie to girls If they like you, they''ll just lie to themselves Like you, they''ll just lie to themselves You don''t have to lie to girls (don''t have) If they like you, they''ll just lie to themselves Don''t I know it better than anyone else? Girls will cry, and girls will lie And girls will do it till they die for you They''ll cry, and girls will lie And do it till the day they die (for you) Girls will cry, and girls will lie (ooh, ooh) And girls will lose their goddamn minds for you They''ll cry, and girls will lie And do it till the day they die for you');
INSERT INTO public.songs VALUES (25, 'Don''t Smile', 'Em Don''t Smile, Sabrina Carpenter reverte o ditado (NÆo chore porque acabou, sorria porque aconteceu) para mostrar que o t‚rmino traz dor, nÆo al¡vio. O verso (Don''t smile because it happened, baby, cry because it''s over) evidencia seu desejo de que o ex-parceiro sinta a mesma perda que ela. A m£sica expressa vulnerabilidade e ressentimento, mostrando a dificuldade de superar o fim e a necessidade de reconhecimento da dor compartilhada.', 1, 2, '3:26', 'Don''t smile because it happened, baby, cry because it''s over Oh, you''re supposed to think about me every time you hold her My heart is heavy now, it''s like a hundred pounds It''s fallin'' faster than the way you love to shut me down I think I need a shower, my friends are takin'' shots You think it''s happy hour, for me, it''s not Don''t smile because it happened, baby, cry because it''s over Oh, you''re supposed to think about me every time you hold her Don''t smile because it happened, baby, cry because it''s over (I want you to miss me, I want you to miss me) Oh, you''re supposed to think about me every time you hold her (I want you to miss me, I want you to miss me) Pour my feelings in the microphone I stay in, and when the girls come home I want one of them to take my phone Take my phone and lose your Number, I don''t wanna be tempted Pick up when you wanna fall back in You can fake it, but you know I know, oh, I know Don''t smile because it happened, baby, cry because it''s over (oh, no, mm, no, no) Oh, you''re supposed to think about me every time you hold her (I, mm) Don''t smile because it happened, baby, cry because it''s over (ooh) (I want you to miss me, I want you to miss me) Oh, you''re supposed to think about me every time you hold her (I want you to miss me, I want you to miss me)');
INSERT INTO public.songs VALUES (26, 'Manchild', 'Em Manchild, Sabrina Carpenter usa humor e sarcasmo para criticar a imaturidade masculina. A expressÆo man-child satiriza homens dependentes e despreparados, enquanto versos como (You said your phone was broken, just forgot to charge it) e (If I''m not there, it won''t get done, I choose to blame your mom) mostram situa‡äes frustrantes do dia a dia. A m£sica combina melodia animada e ironia para transformar experiˆncias desgastantes em piadas leves, tornando-se um hino divertido sobre relacionamentos desiguais.', 1, 3, '3:33', 'Oh, boy You said your phone was broken, just forgot to charge it Whole outfit you''re wearing, God, I hope it''s ironic Did you just say you''re finished? Didn''t know we started It''s all just so familiar, baby, what do you call it? Stupid Or is it Slow? Maybe it''s Useless But there''s a cuter word for it I know Man-child Why you always come a-running to me? Fuck my life Won''t you let an innocent woman be? Never heard of self-care Half your brain just ain''t there Man-child Why you always come a-running Taking all my loving from me? Why so sexy if so dumb? And how survive the Earth so long? If I''m not there, it won''t get done I choose to blame your mom Man-child Why you always come a-running to me? Fuck my life Won''t you let an innocent woman be? Never heard of self-care Half your brain just ain''t there Man-child Why you always come a-running Taking all my loving from me? Oh, I like my boys playing hard to get And I like my men all incompetent And I swear they choose me, I''m not choosing them Amen Hey, men Oh, I like my boys playing hard to get (play hard to get) And I like my men all incompetent (incompetent) And I swear they choose me, I''m not choosing them (not choosing them) Amen (amen) Hey, men (hey, men) Man-child Why you always come a-running to me? (Always come a-running to me) Fuck my life Won''t you let an innocent woman be? (Amen) Oh, I like my boys playing hard to get (play hard to get) And I like my men all incompetent (incompetent) And I swear they choose me, I''m not choosing them (not choosing them) Amen (amen) Hey, men (hey, men)');
INSERT INTO public.songs VALUES (27, 'Tears', 'Em Tears, a m£sica usa humor e ironia para transformar gestos simples de responsabilidade em motivos de desejo. A faixa celebra autonomia e critica a baixa expectativa de maturidade nos relacionamentos, misturando provoca‡Æo e leveza de forma divertida.', 1, 3, '2:40', 'Mmm, mmm-hmm (ah-hah) Uh (shikitah) I get wet at the thought of you (uh-huh) Being a responsible guy (shikitah) Treating me like you''re supposed to do (uh-huh) Tears run down my thighs A little initiative can go a very long, long way Baby, just do the dishes, I''ll give you what you (what you), what you want A little communication, yes, that''s my ideal foreplay Assemble a chair from IKEA, I''m like: Uh (ah) I get wet at the thought of you (uh-huh) Being a responsible guy (so responsible) (shikitah) Treating me like you''re supposed to do (uh-huh) Tears run down my thighs A little respect for women can get you very, very far Remembering how to use your phone gets me oh so (oh so), oh so hot Considering I have feelings, I''m like: Why are my clothes still on? Offering to do anything, I''m like: Oh my God (uh) I get wet at the thought of you (uh-huh) Being a responsible guy (so responsible) (shikitah) Treating me like you''re supposed to do (uh-huh) Tears run down my thighs I get wet at the thought of you (I get) Being a responsible guy (so, so, so, so) (responsible guy) Treating me like you''re supposed to do (supposed to do) Tears run down my thighs (dance break) Oh-oh-oh-oh So responsible No, oh-oh I get wet at the thought of you (uh-huh) Being a responsible guy (guy) (so responsible) (shikitah) Treating me like you''re supposed to do (uh-huh) Tears run down my thighs (shikitah)');
INSERT INTO public.songs VALUES (28, 'My Man on Willpower', 'Em My Man on Willpower, a m£sica transforma a frustra‡Æo de ser deixada de lado pelo parceiro em uma com‚dia ir“nica cheia de trocadilhos. O verso (He fell in love with self-restraint and now it''s gettin'' out of hand) mostra como a aten‡Æo do parceiro se voltou … pr¢pria disciplina, deixando a protagonista em segundo plano. O humor aparece em frases exageradas e sarc sticas, retratando o absurdo da situa‡Æo de forma leve e divertida, ironizando a busca por autocontrole em detrimento da conexÆo afetiva.', 1, 3, '3:17', 'He''s clingy, he''s lovin'', he always initiates Callin'' and touchin'', it feels like just yesterday He wanted all four of my personalities Now I don''t recognize this Stranger (stranger), danger (danger) There in my bed at night Wide-eyed (dreamin''), ponderin'' (schemin'') What life without me''d be like Can I return it? Get back the version I like This one''s bullshit, baby My man on his willpower is something I don''t understand He fell in love with self-restraint and now it''s gettin'' out of hand He used to be literally obsessed with me I''m suddenly the least sought-after girl in the land Oh, my man on his willpower is something I don''t under Something I don''t understand He''s busy, he''s workin'', he doesn''t have time for me My slutty pajamas not temptin'' him in the least What in the fucked-up romantic dark comedy is this nightmare lately? Yeah, okay, okay, he''s on his big journey to find A little zest of life and his sense of purpose, but why? I''m right here (right here), I''m wavin'' (hello) The joke can be over now You''re so silly, baby My man on his willpower is something I don''t understand He fell in love with self-restraint and now it''s gettin'' out of hand He used to be literally obsessed with me I''m suddenly the least sought-after girl in the land Oh, my man on his willpower is something I don''t under Something I don''t understand Ooh-ooh-ooh-ooh, woah-woah-oh-oh-ooh My man''s in touch with his emotions My man won''t touch me with a twenty-foot pole My man''s forgotten his devotion Where he''s gone? God only knows (Where he''s gone? God only knows)');
INSERT INTO public.songs VALUES (29, 'Sugar Talking', 'Em Sugar Talking, Sabrina Carpenter critica promessas vazias e gestos superficiais em relacionamentos. O verso (Put your loving where your mouth is) mostra que ela nÆo se impressiona com palavras doces ou presentes sem significado. A m£sica usa sarcasmo e ironia, chamando de epiphanies as desculpas do parceiro e mostrando cansa‡o com promessas repetidas. O refrÆo refor‡a a cobran‡a por atitudes reais, tornando a faixa um manifesto leve e direto sobre autenticidade no amor.', 1, 3, '3:03', 'Ooh-ooh, ooh-ooh-ooh Ooh-ooh-ooh-ooh Put your loving where your mouth is Your sugar talking isn''t working tonight, oh Put your loving where your mouth is Yeah, your paragraphs mean shit to me Get your sorry ass to mine Ooh-ooh, ooh-ooh-ooh Ooh-ooh-ooh-ooh Saying that you miss me Boy, do you win a prize? You''re havin'' these epiphanies Big word for a real small mind And aren''t you tired of saying a whole lot of nothing? You tell me that you want me (want me) But, baby, if you need me (need me) (yeah) Put your loving where your mouth is Your sugar talking isn''t working tonight, oh Say you''re a big changed man, I doubt it Yeah, your paragraphs mean shit to me It''s verbatim what you said last week It''s your seventh last chance, honey Get your sorry ass to mine');
INSERT INTO public.songs VALUES (30, 'We Almost Broke Up Again Last Night', 'Em We Almost Broke Up Again Last Night, Sabrina Carpenter transforma o ciclo de brigas e reconcilia‡äes em humor sarc stico. A repeti‡Æo de situa‡äes como (Bullshit repeats itself) mostra que o caos virou rotina, enquanto versos sobre discussäes seguidas de sexo revelam a superficialidade dessas reconcilia‡äes. A m£sica equilibra vulnerabilidade e autodeboche, celebrando a capacidade de rir de si mesmo mesmo em relacionamentos inst veis.', 1, 3, '3:23', 'Bullshit repeats itself Is that how the saying goes? Been here a thousand times (Selective memory though) I hear it in his eyes He sees it in my tone Is what it is and it''s predictable All the I love you''s and I''m sorry''s were said We had our sex and then we made amends, that''s right Called it a false alarm to all of our friends Then we almost broke up again last night (We almost) (Got so close) When I reach to pull the plug I swear he''s starts working out And on the days I''m a little much That''s when I tell them how sweet he treats me And how no other boys compete I know how it looks, I know how it sounds Least we''ll give ''em something to talk about All the I love you''s and I''m sorry''s were said (sorry''s were said) We had our sex and then we made amends, that''s right Called it a false alarm to all of our friends Then we almost broke up again last night You say we''re drifting apart I said: Yeah, I fucking know Big deal, we''ve been here before And we''ll be here tomorrow Oh-oh All the I love you''s and I''m sorry''s were said We had our sex and then we made amends, that''s right Called it a false alarm to all of our friends Then we almost broke up again, oh We almost broke up, we almost broke up again We almost broke up, we almost broke up again Gave me his whole heart, then I gave him head, and then We almost broke up, we almost broke up Yeah, we almost broke up again Uh');
INSERT INTO public.songs VALUES (31, 'Nobody''s Son', 'Em Nobody''s Son, Sabrina Carpenter usa ironia para abordar a frustra‡Æo com relacionamentos modernos. Ela transforma clichˆs de maturidade emocional em piada e satiriza a repeti‡Æo de decep‡äes amorosas, mostrando como todos os parceiros parecem iguais. O humor  cido aparece em coment rios sobre autocontrole rec‚m-descoberto e culpa dos pais, enquanto expressäes como (He sure fucked me up) revelam a vulnerabilidade por tr s do sarcasmo, equilibrando deboche e desilusÆo.', 1, 3, '3:02', 'Hi, I hope you''re great I think it''s time we took a break So I can grow emotionally That''s what he said to me Here we go again, crying in bed, what a familiar feeling All my friends in love and I''m the one they call for a third-wheeling Probably should''ve guessed he''s like the rest, so fine and so deceiving There''s nobody''s son, not anyone left for me to believe in Me? No, yeah, I''m good Just thought that he Eventually would cave and reach out But no siree, he discovered self-control (He discovered it this week) this week (oh-ah) Here we go again, crying in bed, what a familiar feeling All my friends in love and I''m the one they call for a third-wheeling Probably should''ve guessed he''s like the rest, so fine and so deceiving There''s nobody''s son, not anyone left for me to believe in (Believe in, oh-oh-oh-woah-oh-oh-woah) That boy is corrupt (ah) Could you raise him to love me, maybe? He sure fucked me up (ah-ah) And, yes, I''m talkin'' ''bout your baby That boy is corrupt (ah) Get PTSD on the daily He sure fucked me up (ah-ah) And, yes, I''m talkin'' ''bout your baby Here we go again, crying in bed, what a familiar feeling All my friends in love and I''m the one they call for a third-wheeling Probably should''ve guessed he''s like the rest, so fine and so deceiving There''s nobody''s son, not anyone left for me to believe in');
INSERT INTO public.songs VALUES (32, 'Never Getting Laid', 'Em Never Getting Laid, Sabrina Carpenter usa humor  cido e sarcasmo para transformar o ressentimento p¢s-t‚rmino em cr¡tica aos clichˆs masculinos e … instabilidade emocional do ex. A letra mistura votos positivos com puni‡äes sutis, satirizando estere¢tipos e revelando frustra‡Æo de forma provocativa. A faixa equilibra ironia, deboche e vulnerabilidade, consolidando um tom divertido e cr¡tico sobre relacionamentos frustrantes.', 1, 3, '3:28', 'We were so happy, why not mix it up? I''m so at peace, yeah, I can''t drink enough No way to know just who you''re thinking of I just wish you didn''t have a mind (ah-ah-ah-ah) That could flip like a switch That could wander and drift To a neighboring bitch When just the other night You said you need me, what gives? How did it come to this? Boy, I know where you live Baby, I''m not angry I love you just the same I just hope you get agoraphobia some day And all your days are sunny From your windowpane Wish you a lifetime full of happiness And a forever of never getting laid I think this schedule could be very nice (very nice) Call up the boys and crack a Miller Lite, watch the fight Us girls are fun, but stressful, am I right? (Am I right?) And you''ve got a right hand anyway (and only yesterday) Was when we called it quits (called it quits) I was so confident (confident) Till the thought of it hit That any given night You could be using your lips On a girl with big tits Boy, I know where you live Baby, I''m not angry I love you just the same I just hope you get agoraphobia some day And all your days are sunny (sunny from your windowpane) From your windowpane Wish you a lifetime full of happiness And a forever of never getting laid (forever, mm-mm) A forever of never getting laid (laid, mm-mm) At the end of the rainbow, I hope you find A good whole lot of nothing ''cause you''re still inside And abstinence is just a state of mind');
INSERT INTO public.songs VALUES (33, 'When Did You Get Hot?', 'Em When Did You Get Hot?, Sabrina Carpenter usa humor e ironia para comentar a atra‡Æo por algu‚m do passado que mudou fisicamente. A letra mistura deboche e sinceridade, invertendo pap‚is tradicionais e brincando com estere¢tipos de masculinidade. A faixa celebra o desejo feminino de forma divertida e leve, com sarcasmo e empoderamento.', 1, 3, '2:25', 'So long untouched Bone-dry, not a plant can grow ''Bout time I get Back on the horse to the rodeo Now I''m at the prospect convention My friends walk in your friends'' direction Said: Sabrina, don''t you know Devin? And I was like: Huh When did you get hot? All the sudden I could look you up and down all day (hey) When did you get hot? I think I would remember if you had that face (that face) I did a double take, triple take Take me to naked Twister back at your place Baby, baby, mm, it''s thickening the plot When did you get hot? Uh-huh, uh-huh (yeah) Uh-huh, uh-huh, mm Uh-huh, uh-huh (yeah) Uh-huh, uh-huh, mm Congratulations on your new improvements I bet your light rod''s, like, bigger than Zeus'' (hey, wait) Can you lift my car with your hand? You were an ugly kid, but you''re a sexy man Sorry I did not see the vision (did not see the vision) Thank you, Lord, the fine you has risen (the fine you has risen) Big riff coming, I need a minute Wait, I need a minute, mm-mm Okay, here it comes Oh-oh-oh When did you get hot? All the sudden I could look you up and down all day (all day) When did you get hot? I think I would remember if you had that face (that face) I did a double take, triple take Take me to naked Twister back at your place Baby, baby, mm, it''s thickening the plot When did you get hot? Uh-huh, uh-huh Uh-huh, uh-huh, mm (hot) Uh-huh, uh-huh (what?) Uh-huh, uh-huh When did you get? When did you get? When did you get? When did you get so hot? When did you get? When did you get? When did you get? When did you get so hot? When did you get? When did you get? When did you get? When did you get so hot? When did you get? When did you get? When did you get? When did you get so hot?');
INSERT INTO public.songs VALUES (34, 'Go Go Juice', 'Em Go Go Juice, Sabrina Carpenter usa humor para tratar das reca¡das emocionais ap¢s t‚rminos. A bebida ‚ uma met fora leve para lidar com a dor, e a letra mistura autodeprecia‡Æo e confusÆo t¡pica de quem tenta superar um ex. A faixa transforma o sofrimento em algo divertido e relacion vel, mostrando vulnerabilidade com leveza e ironia.', 1, 3, '3:13', 'Love when happy hour comes at ten AM o''clock on a Tuesday Guess a broken heart doesn''t care that I just woke up Got a soft spot for a bev and a boy that''s fruity Can''t lie, whole week''s been tough No party invitations, not going to the club I''m just drinking to call someone Ain''t nobody safe when I''m a little bit drunk Could be John or Larry, gosh, who''s to say? Or the one that rhymes with villain if I''m feeling that way Oh, I''m just drinking to call someone A girl who knows her liquor is a girl who''s been dumped Sippin'' on my go go juice, I can''t be blamed Some good old-fashioned fun sure numbs the pain Ring, ring, ring, yeah, it''s super important (how many shots in an ounce?) I might have double vision, but that is irrelevant right now (answer me, baby, um, are you in town?) I miss you and I think about you every minute If you''re still disinterested in me, well, fuck Just trying different numbers, didn''t think that you''d pick up I''m just drinking to call someone Ain''t nobody safe when I''m a little bit drunk Could be John or Larry, gosh, who''s to say? Or the one that rhymes with villain if I''m feeling that way Oh, I''m just drinking to call someone A girl who knows her liquor is a girl who''s been dumped (who''s been dumped) Sipping on my go-go juice (oh-oh), I can''t be blamed Some good old-fashioned fun sure numbs the pain Ba-da-da, da-da-da, da-da-da-da Ba-da-da, da-da-da How''s you''s been? What''s up? Ba-da-da, da-da-da, da-da-da-da Bye, it''s me, how''s mm-call, do you me still love? Ba-da-da, da-da-da, da-da-da-da Ba-da-da, da-da-da Shoulda we hooks up? Ba-da-da, da-da-da, da-da-da-da Bye, it''s me, how''s mm-call, do you me still love? I''m just drinking to call someone Ain''t nobody safe when I''m a little bit drunk Could be John or Larry, gosh, who''s to say? Or the one that rhymes with villain if I''m feeling that way Oh, I''m just drinking to call someone A girl who knows her liquor is a girl who''s been dumped (who''s been dumped) Sipping on my go-go juice (oh-oh), I can''t be blamed Some good old-fashioned fun sure numbs the pain');
INSERT INTO public.songs VALUES (35, 'Don''t Worry I''ll Make You Worry', 'Em Don''t Worry I''ll Make You Worry, Sabrina Carpenter usa ironia e sarcasmo para inverter as dinƒmicas de inseguran‡a nos relacionamentos. A letra mistura controle, humor e provoca‡Æo, mostrando como a protagonista assume o poder da situa‡Æo e brinca com a fragilidade do outro. O refrÆo resume bem o tom da m£sica: deixar o parceiro apreensivo enquanto ela mant‚m sua autonomia e autoconfian‡a.', 1, 3, '3:42', 'You think that I''m gonna fuck with your head? Well, you''re absolutely right Your perfect timing couldn''t be worse Actually, it''s impressive how you don''t read signs And I''ll never call you right back But when I do, I''m making you laugh Then I''ll bitch you out when I please (I still think you love me) So don''t worry I''ll make you worry like no other girl can So don''t worry Damn sure I''ll never let you know where you stand Silent treatment and humbling your ass Well, that''s some of my best work (ah-ah) Though sleeping with you might help me decide But it was annoyingly good, so thanks for making it worse But on the forty-minute drive home (ah-ah) You''re internalizing my jokes (mm-mm) And your mother even agrees (ah-ah) That emotional lottery is all you''ll ever get with me So don''t worry I''ll make you worry like no other girl can So don''t worry I''ll leave you feeling like a shell of a man Don''t worry Don''t worry, baby Don''t worry');
INSERT INTO public.songs VALUES (36, 'House Tour', 'Em House Tour, Sabrina Carpenter usa ironia e duplos sentidos para transformar uma visita guiada em uma met fora divertida de desejo e empoderamento sexual. A letra brinca com a intimidade e a autonomia feminina, mantendo tom leve e confiante, mostrando controle, humor e liberdade na expressÆo do prazer.', 1, 3, '3:49', 'Take your shoes off Thank you for dinner, baby, I had a really great time I really loved the conversation and that your car self-drives The pineapple air freshener is my favorite kind Well, this is me, but if you have time Do you want the house tour? I could take you to the first, second, third floor And I promise none of this is a metaphor I just want you to come inside Baby, what''s mine is now yours (Ha-ha) The couch is really comfy, comfy Got some Chips Ahoy if you''re hungry, hungry (oh) You don''t need to love me, love me, love me I''m just so proud of my design (to dim the lights) Do you want the house tour? I could take you to the first, second, third floor (I could take you to the) And I promise none of this is a metaphor (ah) I just want you to come inside (come inside) But never enter through the back door House tour Yeah, I spent a little fortune on the waxed floors We can be a little reckless ''cause it''s insured I''m pleasured to be your hot tour guide Baby, what''s mine is now yours (woo) Oh-oh-oh-oh-oh-oh Co-come on, bae, oh Oh, baby, if you come inside, if you come inside I will let you uh My house is on Pretty Girl Avenue My house was especially built for you Some say it''s a place where your dreams come true My house could be your house too Ooh So, um Are you coming in or what?');
INSERT INTO public.songs VALUES (37, 'Goodbye', 'Em Goodbye, Sabrina Carpenter mistura idiomas e sarcasmo para transformar o fim de um relacionamento em um hino de autossuficiˆncia. A m£sica equilibra leveza sonora e ironia, mostrando controle emocional, humor e rejei‡Æo a ilusäes romƒnticas.', 1, 3, '3:45', 'Broke my heart on Saturday Guess overnight your feelings change And I have cried so much, I almost fainted (aha, aha) To show you just how much it hurts I wish I had a gun or words If somethin'' got lost in communication (aha, aha) Well, sayonara, adi¢s You''re not bilingual, but you should know Goodbye Means that you''re losing me for life Can''t call it love then call it quits Can''t shoot me down then shoot the shit Did you forget that it was you who said goodbye? So you don''t get to be the one who cries Can''t have your cake, can''t eat it too By walking out, that means you choose goodbye The feeling''s so specific Wanna punch you every other minute, oh You used to love my ass, no, baby, you won''t see it anymore (aha, aha) Just give it three weeks, buddy Gonna wake up from your coma, honey, ooh And that''s when you''ll be holding hokey flowers, standing at my door (aha, aha) But I''ll say: Arrivederci, au revoir Forgive my French, but fuck you, ta-ta Goodbye Means that you''re losing me for life Can''t call it love, then call it quits Can''t shoot me down then shoot the shit Did you forget that it was you who said goodbye? (It was you who said goodbye) So you don''t get to be the one who cries Can''t have your cake, can''t eat it too By walking out, that means you choose goodbye Sayonara, adi¢s On the flip side, cheerio Por siempre te amo, wait, no Shit, when did you get here? Go put on some clothes Goodbye Means that you''re losing me for life Can''t call it love then call it quits Can''t shoot me down then shoot the shit Did you forget that it was you who said goodbye? (It was you who said goodbye) So you don''t get to be the one who cries Can''t have your cake, can''t eat it too By walking out, that means you choose goodbye Goodbye Get home safe');


--
-- TOC entry 4888 (class 0 OID 42174)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 219
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 29, true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 223
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlists_id_seq', 1, false);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 217
-- Name: singers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.singers_id_seq', 10, true);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 225
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_id_seq', 37, true);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4725 (class 2606 OID 42148)
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 42219)
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 42139)
-- Name: singers singers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singers
    ADD CONSTRAINT singers_name_key UNIQUE (name);


--
-- TOC entry 4723 (class 2606 OID 42137)
-- Name: singers singers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.singers
    ADD CONSTRAINT singers_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 42250)
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- TOC entry 4727 (class 2606 OID 42183)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4729 (class 2606 OID 42181)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4734 (class 2606 OID 42149)
-- Name: albums albums_singer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers(id) ON DELETE CASCADE;


--
-- TOC entry 4735 (class 2606 OID 42220)
-- Name: playlists playlists_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4736 (class 2606 OID 42256)
-- Name: songs songs_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id) ON DELETE CASCADE;


--
-- TOC entry 4737 (class 2606 OID 42251)
-- Name: songs songs_singer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_singer_id_fkey FOREIGN KEY (singer_id) REFERENCES public.singers(id) ON DELETE CASCADE;


-- Completed on 2025-11-24 01:39:07

--
-- PostgreSQL database dump complete
--

