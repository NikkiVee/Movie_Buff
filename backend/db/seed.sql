DROP DATABASE IF EXISTS movie_buff;
CREATE DATABASE movie_buff;

\c movie_buff;

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    genre_id INT REFERENCES genres(id) NOT NULL,
    img_url VARCHAR
);

CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    stars INT,
    movie_id INT REFERENCES movies(id) NOT NULL
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    body TEXT NOT NULL,
    movie_id INT REFERENCES movies(id) NOT NULL
);

INSERT INTO genres (name)
VALUES ('action'), ('comedy'), ('documentary'), ('drama'), ('horror'), ('romance'), ('sci-fi'), ('cult');

INSERT INTO movies (title, genre_id, img_url)
VALUES ('Hitchhikers Guide to the Galaxy', 7, 'https://m.media-amazon.com/images/I/81fpbxyyabL._AC_UL872_FMwebp_QL65_.jpg'),
('Clerks', 2, 'https://m.media-amazon.com/images/I/71DkapnnkrL._AC_UL872_FMwebp_QL65_.jpg'),
('Hedwig and the Angry Inch', 8, 'https://m.media-amazon.com/images/I/910UTzY7WBL._AC_UL872_FMwebp_QL65_.jpg'),
('The Rocky Horror Picture Show', 7,'https://m.media-amazon.com/images/I/91ugR4aY5LL._AC_UL872_FMwebp_QL65_.jpg'),
('This Is Spinal Tap', 2, 'https://m.media-amazon.com/images/I/61EVS-SHCTL._AC_UL872_FMwebp_QL65_.jpg'),
('Evil Dead', 5, 'https://m.media-amazon.com/images/I/71yuta8HLYL._AC_UL872_FMwebp_QL65_.jpg'),
('Pee-wees Big Adventure', 2, 'https://m.media-amazon.com/images/I/81LxyqDdFtL._AC_UL872_FMwebp_QL65_.jpg'),
('Jumanji', 1, 'https://m.media-amazon.com/images/I/A1Lf4I9eddL._AC_UL872_FMwebp_QL65_.jpg'),
('Leaving Neverland', 3, 'https://m.media-amazon.com/images/I/711hfnbQ6QL._AC_UL872_FMwebp_QL65_.jpg'),
('Rocky', 4, 'https://m.media-amazon.com/images/I/91Wz30TIWvL._AC_UL872_FMwebp_QL65_.jpg'),
('Rosemarys Baby', 5, 'https://m.media-amazon.com/images/I/A1xvbPw6SNL._AC_UL872_FMwebp_QL65_.jpg'),
('Dirty Dancing', 6, 'https://m.media-amazon.com/images/I/81SxL1N6y6L._AC_UL872_FMwebp_QL65_.jpg');


INSERT INTO ratings (stars, movie_id)
VALUES (5, 1), (4, 2), (5, 3), (5, 4), (3, 5), (5, 6), (4, 7), (4, 8), (1, 9), (5, 10), (5, 11), (3, 12);


INSERT INTO comments (body, movie_id)
VALUES ('Quirky and funny sci-fi flick. Definitely unique and worth watching.', 1),
('Theres no denying the raw and energetic feel Smith created with a memorable script, great characters and a genuine sense of Gen X angst.', 2),
('Flamboyant, irreverent, naughty and oddly, profoundly moving.', 3),
('That celebration of being unique and surreal, whether Gay, straight, or just an oddball, all around.', 4),
('The material is consistently clever and funny, though ultimately the attitudes are too narrow to nourish a feature-length film.', 5),
('A great, genuinely unnerving horror movie.', 6),
('Its a true original -- a comedy maverick that looks and feels like no other movie I know.', 7),
('This smart, scary film, is still a favorite to dust off and take from the "vhs" bin', 8),
('Witnessing yet another character assassination of someone who is no longer here to fight for himself. Its sad and disappointing either way you look at it. I remain conflicted and confused by it all.', 9),
('Sylvester Stallone is as likable as a basset hound.', 10),
('One of the best-shot, best-scored, and best-acted supernatural thrillers ever made.', 11),
('I like it much better than any of the Molly Ringwald coming of age comedies from the 80s.', 12);
