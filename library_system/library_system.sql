CREATE DATABASE IF NOT EXISTS library_system;

CREATE TABLE IF NOT EXISTS books(
	book_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(150) NOT NULL,
	author VARCHAR(100) NOT NULL,
	publication_year YEAR NOT NULL,
	genre VARCHAR(50) DEFAULT 'Unknown',
	available BOOLEAN DEFAULT TRUE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE books
MODIFY publication_year INTEGER NOT NULL;

INSERT INTO books
(title, author, publication_year, genre)
VALUES ("Une histoire birmane","George Orwell","1934","Roman"),
		 ("Voyage au centre de la Terre","Jules Verne","1864","Roman d'aventures scientifiques, science-fiction"),
		 ("Kamasutra","Vātsyāyana","0269","Traité sur l'art de vivre");

UPDATE books
SET available = FALSE
WHERE author = "George Orwell";

DELETE FROM books WHERE publication_year = 1864;

INSERT INTO books
(title, author, publication_year, genre)
VALUES ("Voyage au centre de la Terre","Jules Verne","1905","Roman d'aventures scientifiques, science-fiction");

ALTER TABLE books
ADD price DECIMAL(10,2);

UPDATE books
SET price = (case when author = "George Orwell" then 7.89
                  when author = 'Jules Verne' then 27.59
                  when author = "Vātsyāyana" then 745654.52
             end);

ALTER TABLE books
RENAME COLUMN available TO is_available;

CREATE TABLE IF NOT EXISTS authors(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

ALTER TABLE books
ADD author_id INTEGER NOT NULL;

INSERT INTO authors (name)
VALUES ('George Orwell'), ('Jules Verne'), ('Vātsyāyana');

UPDATE books
SET author_id = (SELECT id FROM authors WHERE name = 'George Orwell')
WHERE author = 'George Orwell';

UPDATE books
SET author_id = (SELECT id FROM authors WHERE name = 'Jules Verne')
WHERE author = 'Jules Verne';

UPDATE books
SET author_id = (SELECT id FROM authors WHERE name = 'Vātsyāyana')
WHERE author = 'Vātsyāyana';

ALTER TABLE books
DROP COLUMN author;

ALTER TABLE books
ADD CONSTRAINT fk_author
FOREIGN KEY (author_id) REFERENCES authors(id);















