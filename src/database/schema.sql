CREATE DATABASE disco_db;

\c disco_db;

CREATE singers (
    id SERIAL PRIMARY KEY,
    photo TEXT,
    name VARCHAR(100) UNIQUE,
    musical_genre VARCHAR(100),
    about TEXT,
    popular_song VARCHAR(150)
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    singer_id INTEGER REFERENCES singers(id) ON DELETE CASCADE,
    release_year INTEGER,
    duration INT,
    num_of_tracks INT,
    photo_cover TEXT,
    photo_disk TEXT
);

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    singer_id INTEGER REFERENCES singers(id) ON DELETE CASCADE,
    album_id INTEGER REFERENCES albums(id) ON DELETE CASCADE,
    duration INT,
    lyrics TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password TEXT NOT NULL,
    photo TEXT
);

CREATE TABLE favorites (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    singer_id INTEGER REFERENCES singers(id),
    album_id INTEGER REFERENCES albums(id),
    song_id INTEGER REFERENCES songs(id)
);

CREATE TABLE playlists (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(250) NOT NULL,
    photo TEXT,
    description TEXT
);

CREATE TABLE playlist_songs (
    id SERIAL PRIMARY KEY,
    playlist_id INTEGER REFERENCES playlists(id) ON DELETE CASCADE,
    song_id INTEGER REFERENCES songs(id) ON DELETE CASCADE
);

INSERT INTO songs (title, description, singer_id, album_id, duration, lyrics)
VALUES (
    'emails i can''t send',
    'emails i can''t send aborda o trauma causado pela traição do pai e como esse acontecimento abalou profundamente a confiança de Sabrina Carpenter. A música é confessional e direta, expressando raiva, mágoa e a dificuldade de perdoar. O impacto do episódio aparece também em seus relacionamentos amorosos, já que a desconfiança aprendida se repete com novos parceiros. A canção mistura tristeza, frustração e ironia, mostrando como esse trauma familiar continua influenciando sua vida emocional e sua forma de amar.',
    1,
    1,
    104,
    'It''s times like these, wish I had a time machine So I could see what you did October 13th At 10:15, were you really asleep? Were you lying to me and the family? There''s no us in us when I''m lacking trust You wanna discuss, ugh, you disgust me Don''t make me cuss you out, why''d you let me down? Don''t say sorry now And thanks to you, I, I can''t love right I get nice guys and villainize them Read their texts like they''re having sex right now Scared I''ll find out that it''s true And if I do, then I blame you For every worst that I assume When I''m 45, someone calls me their wife And he fucks our lives in one selfish night Don''t think I''ll find forgiveness as fast as mom did And, God, I love you, but you''re such a dipshit Please, fucking fix this ''Cause you were all I looked up to Now I can''t even look at you (I mean, as they say in Chicago) (He had it coming)');


INSERT INTO songs (title, description, singer_id, album_id, duration, lyrics)
VALUES (
    'Pray You Catch Me',
 'Em Pray You Catch Me, Beyoncé cria uma atmosfera de desconfiança e vulnerabilidade, explorando o impacto emocional da traição. A música combina tensão, introspecção e metáforas sutis para mostrar o desejo de descobrir a verdade mesmo diante da dor, tornando o ouvinte cúmplice da vigilância e da frustração da artista.',
 1,
 4,
 196, 'You can taste the dishonesty It''s all over your breath as you pass it off so cavalier But even that''s a test Constantly aware of it all My lonely ear pressed against the walls of your world Pray to catch you whispering I pray you catch me listening I''m prayin'' to catch you whispering I pray you catch me I''m prayin'' to catch you whispering I pray you catch me listening I pray you catch me Nothing else ever seems to hurt like the smile on your face When it''s only in my memory, it don''t hit me quite the same Maybe it''s a cause for concern, but I''m not at ease Keeping my head to the curb Pray to catch you whispering I pray you catch me listening I pray to catch you whispering (whisper, whisper) I pray you catch me (whisper, whisper) I pray you catch me I pray you catch me (pray you) I''m praying you catch me')
