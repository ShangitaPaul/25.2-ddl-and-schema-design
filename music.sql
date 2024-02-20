-- from the terminal run:
-- psql < music.sql

-- Modifications:
-- * Replaced 'TEXT' with 'VARCHAR' for some fields where the length of the string is known.
-- * Used dedicated data types for storing artist and producer information by creating separate data tables, with foreign key relationships to the songs table.
-- * Modified the 'artists' and 'producers' columns to store arrays of artist and producer names, respectively, to allow for multiple artists and producers to be associated with a single song.
-- * Modified date structure to'YYYY-MM-DD' for better compatibility to ensure a standardized date format across the 'release_date' column.

-- FUTURE CONSIDERATIONS:
-- * Add a 'featured_artists' column to the songs table to store an array of featured artists for songs that have multiple artists.

-- 

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE genres
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL,
  genre_id INTEGER NOT NULL,
  artist_id INTEGER NOT NULL,
  producer_id INTEGER NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres (id),
  FOREIGN KEY (artist_id) REFERENCES artists (id),
  FOREIGN KEY (producer_id) REFERENCES producers (id)
);

-- OR

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   -- artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   -- producers TEXT[] NOT NULL
-- );

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists (id)
);  

CREATE TABLE song_producers (
  song_id INTEGER NOT NULL,
  producer_id INTEGER NOT NULL,
  FOREIGN KEY (song_id) REFERENCES songs (id),
  FOREIGN KEY (producer_id) REFERENCES producers (id)
);


INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
