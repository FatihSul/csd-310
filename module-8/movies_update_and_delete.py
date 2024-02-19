import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="fsuljovic",
    password="password",
    database="movies_update_and_delete"
    )

crsr = db.cursor()

crsr.execute("""USE movies_update_and_delete;

DROP TABLE IF EXISTS film;

CREATE TABLE film (
    film_name VARCHAR(75) NOT NULL,
    director VARCHAR(75) NOT NULL,
    genre_name_ID VARCHAR(75) NOT NULL,
	studio_name VARCHAR(75) NOT NULL
);

INSERT INTO film(film_name, director, genre_name_ID, studio_name)
    VALUES('Gladiator', 'Ridley Scott', 'Drama', 'Universal Pictures'),
    ('Alien', 'Ridley Scott', 'SciFi', '20th Century Fox'),
    ('Get Out', 'Jordan Peele', 'Horror', 'Blemhouse Productions');

SELECT * FROM film;

INSERT INTO film(film_name, director, genre_name_ID, studio_name)
    VALUES('Star Wars', 'George Lucas', 'SciFi', '20th Century Fox');
    
SELECT * FROM film;

UPDATE film SET genre_name_ID='Horror' WHERE film_name='Alien';


SELECT * FROM film;

DELETE FROM film WHERE film_name='Gladiator';


SELECT * FROM film;""")