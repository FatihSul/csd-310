import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="fsuljovic",
    password="password",
    database="movies_queries"
    )

crsr = db.cursor()


crsr.execute("""USE movies_queries;

DROP TABLE IF EXISTS film;
DROP TABLE IF EXISTS studio;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS director;


CREATE TABLE studio (
    studio_id INT NOT NULL,
    studio_name VARCHAR(75) NOT NULL
    );

INSERT INTO studio(studio_id, studio_name)
    VALUES('1', '20th Century Fox'),
    ('2', 'Blumhouse Productions'),
    ('3', 'Universal Pictures');

CREATE TABLE genre (
    genre_id INT NOT NULL,
    genre_name VARCHAR(75) NOT NULL
);

INSERT INTO genre(genre_id, genre_name)
    VALUES('1', 'Horror'),
    ('2', 'SciFi'),
    ('3', 'Drama');

CREATE TABLE film (
    film_name VARCHAR(75) NOT NULL,
	film_runtime INT NOT NULL
);

INSERT INTO film(film_name, film_runtime)
    VALUES('Alien', '117'),
    ('Get Out', '104');

CREATE TABLE director (
    film_name VARCHAR(75) NOT NULL,
    director_name VARCHAR(75) NOT NULL
);

INSERT INTO director(film_name, director_name)
    VALUES('Get Out', 'Jordan Peele'),
    ('Gladiator', 'Ridley Scott'),
    ('Alien', 'Ridley Scott');


SHOW tables;
SELECT * FROM studio;
SELECT * FROM genre;
SELECT * FROM film;
SELECT * FROM director;""")