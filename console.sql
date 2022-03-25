SHOW DATABASES; # confirm that database is empty

CREATE DATABASE IF NOT EXISTS bookshop; # create database if name is taken
USE bookshop;

SHOW DATABASES; # confirm that database is created

CREATE TABLE author
(
    author_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL
);

CREATE TABLE genre
(
    genre_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50)
);

CREATE TABLE book
(
    book_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    authorId INT NOT NULL,
    FOREIGN KEY (authorId) REFERENCES author (author_id),
    description VARCHAR(1000),
    year INT,
    price INT NOT NULL,
    genreId INT,
    FOREIGN KEY (genreId) REFERENCES genre (genre_id)
);

SHOW TABLES; # confirm tables are created

SELECT * FROM author;
SELECT * FROM genre;
SELECT * FROM book;

INSERT INTO genre(genre_name)
VALUES ('French Drama'),
       ('Japanese Manga'),
       ('Crime & Mystery'),
       ('For Children'),
       ('Fiction');

SELECT * FROM genre; # confirm genre is added

INSERT INTO author(author_name)
VALUES ('Anna Gavalda'),
       ('Muriel Barbery'),
       ('Konami Kanata'),
       ('Kiyohiko Azuma'),
       ('Arthur Conan Doyle'),
       ('Edgar Allan Poe'),
       ('Neil Gaiman'),
       ('Astrid Lindgren'),
       ('Tove Jansson'),
       ('Torgny Lindgren');

SELECT * FROM author; # confirm author is added

INSERT INTO book(title, authorId, description, year, price, genreId)
VALUES ('Je l''amais', 1, 'A haunted man shares a secret during a week-end with his daughter-in-law and grand-children', 2002, 99, 1),
       ('L''élégance du hérisson', 2, 'The life of concierge, Renée Michel, whose deliberately concealed intelligence is uncovered by an unstable but smart precocious girl called Paloma Josse', 2006, 129, 1),
       ('Chi''s sweet home', 3, 'A lost kitten found by a small boy encounters different everyday adventures', 2004, 89, 2),
       ('Yotsuba', 4, 'Five-year-old Yotsuba is a quirky and unusual girl who after moving from the countryside with her dad takes on new daily discoveries', 2005, 129, 2),
       ('A study in scarlet', 5, 'The first Sherlock Holmes story ever written, a young army doctor is shot and returns home to London to recover when he meets the brilliant detective who becomes his roommate', 1887, 99, 3),
       ('The tell-tale heart', 6, 'Related by an unnamed narrator who endeavors to convince the reader of the narrator''s sanity while simultaneously describing a murder the narrator committed', 1843, 119, 3),
       ('Coraline', 7, 'The fourteenth door in her new home is locked, and on the other side is only a brick wall, until the day Coraline unlocks to the door to find a passage to another flat in another house just like her own.
Only it''s different. There''s another mother, and another father, and they want Coraline to stay with them and be their little girl. They want to change her and never let her go.', 2002, 149, 3),
       ('Mio min Mio', 8, 'A boy travels from Sweden to a land beyond and meets his father the king and gets a mission to defeat an evil knight', 1954, 199, 4),
       ('Lyssnerskan', 9, 'Short stories that depicts humans in bizarre situations and reflects over the meaning of everyday mysticism', 1971, 269, 5),
       ('Dorés bibel', 10, 'An old man describes the story of the family''s bible and relates to it', 2005, 199, 5);

SELECT * FROM book; # confirm book is added

# CRUD operations and SQL questions

SELECT book.title, genre.genre_name
FROM book
INNER JOIN genre on book.genreId = genre.genre_id;

SELECT * FROM book, genre, author
WHERE book.authorId = author.author_id AND
      book.genreId = genre.genre_id;

SELECT title, author_name, genre_name
FROM book, author, genre
WHERE book.authorId = author.author_id AND
      book.genreId = genre.genre_id;

SELECT book.title, genre.genre_name
FROM book
LEFT JOIN genre on book.genreId = genre.genre_id
WHERE genre_id = 2;

SELECT * FROM genre
LEFT JOIN book on book.genreId = genre.genre_id;

SELECT book.title, genre.genre_name # show books and its connected category
FROM book
LEFT JOIN genre on book.genreId = genre.genre_id;

INSERT INTO author(author_name)
VALUES ('Susanna Tuvestad');

SELECT * FROM author;

INSERT INTO book(title, authorId, description, year, price)
VALUES ('Manic panic', 11, 'A guide to completely mess up your life', 2022, 10);

SELECT book.title, genre.genre_name
FROM book
LEFT JOIN genre on book.genreId = genre.genre_id;

DELETE FROM book
WHERE book_id = 1;

SELECT * FROM book;

DELETE FROM genre
WHERE genre_id = 1;

SELECT * FROM genre;

UPDATE author SET author_name='Suzume Minihon'
WHERE author_id = 2;

SELECT author.author_name
FROM author
WHERE author_id = 2;

# DROP DATABASE bookshop;
