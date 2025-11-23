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
    duration VARCHAR(10),
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
    duration VARCHAR(5),
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