-- 11.Problem
CREATE SCHEMA Movies;

CREATE TABLE directors (
id INT PRIMARY KEY AUTO_INCREMENT,
director_name VARCHAR(45) NOT NULL,
notes LONGTEXT
);

CREATE TABLE genres(
id INT PRIMARY KEY AUTO_INCREMENT,
genre_name VARCHAR(45) NOT NULL,
notes LONGTEXT
);

CREATE TABLE categories(
id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(55) NOT NULL,
notes LONGTEXT
) ;

CREATE TABLE movies(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(45) NOT NULL,
director_id INT NOT NULL,
copyright_year INT NOT NULL,
length INT NOT NULL,
genre_id INT NOT NULL,
category_id INT NOT NULL,
rating DECIMAL(2),
notes LONGTEXT
); 

INSERT INTO directors (director_name) VALUES ('Pesho');
INSERT INTO directors (director_name) VALUES ('Pesho');
INSERT INTO directors (director_name) VALUES ('Pesho');
INSERT INTO directors (director_name) VALUES ('Pesho');
INSERT INTO directors (director_name) VALUES ('Pesho');

INSERT INTO genres (genre_name) VALUES ('comedy');
INSERT INTO genres (genre_name) VALUES ('comedy');
INSERT INTO genres (genre_name) VALUES ('comedy');
INSERT INTO genres (genre_name) VALUES ('comedy');
INSERT INTO genres (genre_name) VALUES ('comedy');

INSERT INTO categories (category_name) VALUES ('Category');
INSERT INTO categories (category_name) VALUES ('Category');
INSERT INTO categories (category_name) VALUES ('Category');
INSERT INTO categories (category_name) VALUES ('Category');
INSERT INTO categories (category_name) VALUES ('Category');

INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id) values ('Title', 1, '2019', 4, 1, 1);
INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id) values ('Title', 1, '2019', 4, 1, 1);
INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id) values ('Title', 1, '2019', 4, 1, 1);
INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id) values ('Title', 1, '2019', 4, 1, 1);
INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id) values ('Title', 1, '2019', 4, 1, 1);
