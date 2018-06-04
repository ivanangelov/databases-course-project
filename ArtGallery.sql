--USE master
--GO
--if exists (select * from sysdatabases where name='ships')
--	DROP DATABASE gallery
--GO

CREATE DATABASE gallery
GO
USE gallery
GO

----- Tables -----
CREATE TABLE ARTISTS (
 NAME VARCHAR(40) PRIMARY KEY ,
 BIRTHDATE DATE DEFAULT 'unkown',
 BIRTHPLACE VARCHAR(35) DEFAULT 'unknown',
 MOVEMENT VARCHAR(25) NOT NULL,
);

CREATE TABLE ARTWORKS(
 TITLE VARCHAR(30) PRIMARY KEY,
 YEAR DATE DEFAULT 'unkown',
 TYPE VARCHAR(25) NOT NULL,
 PERIOD VARCHAR(20) NOT NULL,
 PRICE DECIMAL(10, 2) NOT NULL,
 AUTHORNAME VARCHAR(40) NOT NULL REFERENCES ARTISTS(NAME),
 CHECK(TYPE IN ('Painting', 'Drawing', 'Print', 'Photogrpahy', 'Craft', 'Design', 'Sculpture'))
);

CREATE TABLE CUSTOMERS(
 SSN CHAR(10) PRIMARY KEY,
 NAME VARCHAR(30) NOT NULL,
 ADDRESS VARCHAR(50) NOT NULL,
 MONEYSPENT DECIMAL(10, 2) NOT NULL,
 LIKINGS VARCHAR(100) DEFAULT 'unkown'
);

CREATE TABLE PURCHASEDBY(
 ID INT  IDENTITY(1, 1) PRIMARY KEY, 
 DATE DATE NOT NULL,
 TITLE VARCHAR(30) NOT NULL REFERENCES ARTWORKS(TITLE),
 CUSTOMERSSN CHAR(10) NOT NULL REFERENCES CUSTOMERS(SSN)
);

--Artists
INSERT INTO ARTISTS(NAME, BIRTHDATE, BIRTHPLACE, MOVEMENT)
VALUES ('Pablo Picasso', '1881-10-25', 'Malaga, Spain', 'Cubist movement');
INSERT INTO ARTISTS
VALUES ('Vincent van Gogh', '1853-3-30', 'Zundert, Netherlands', 'Post-Impressionism');
INSERT INTO ARTISTS
VALUES ('Rembrandt', '1606-7-12', 'Caprese Michelangelo, Italy', 'High Renaissance');
INSERT INTO ARTISTS
VALUES ('Jackson Pollock', '1912-1-28', 'Wyoming, USA', 'Abstract expressionism');
INSERT INTO ARTISTS(NAME, BIRTHDATE, BIRTHPLACE, MOVEMENT)
VALUES ('Frida Khalo', '1907-7-6', 'Mexico City, Mexico', 'Surrealism');
INSERT INTO ARTISTS
VALUES ('Caravaggio', '1571-9-28', 'Milan, Italy', 'Baroque');
INSERT INTO ARTISTS
VALUES ('Salvador Dali', '1904-5-11', 'Figueres, Spain', 'Cubism');
INSERT INTO ARTISTS
VALUES ('Peter Paul Rubens', '1640-5-30', 'Antwerp, Belgium', 'Baroque');

--Clients
INSERT INTO CUSTOMERS
VALUES ('9512121286', 'Dimitar Ivanov Petrov', 'Sofia, g.k. Mladost', 0, 'Baroque');
INSERT INTO CUSTOMERS
VALUES ('8605195498', 'Petko Marinov Dimitrov', 'Sofia, g.k. Strelbishte', 0, 'Cubism');
INSERT INTO CUSTOMERS
VALUES ('5901111292', 'Nikolai Petrov Marinov', 'Burgas, g.k. Izgrev ', 0, 'Surrealism');
INSERT INTO CUSTOMERS
VALUES ('7807129112', 'Natalia Petrova Ivanova', 'Sofia, g.k. Borovo', 0, 'High Renaissance');
INSERT INTO CUSTOMERS
VALUES ('6805149811', 'Petya Marinova Dimitrova', 'Sofia, g.k. Drujba', 0, 'Baroque');

--Artworks
INSERT INTO ARTWORKS
VALUES ('Cardsharps', '1594', 'Painting', 'Baroque', 10000, 'Caravaggio');
INSERT INTO ARTWORKS
VALUES ('The Two Fridas', '1939', 'Painting','Impressionism', 25000, 'Frida Khalo');
INSERT INTO ARTWORKS
VALUES ('Mural', '1943', 'Painting', 'Expressionism', 125000, 'Jackson Pollock');
INSERT INTO ARTWORKS
VALUES ('Guernica', '1937', 'Sculpture', 'Cubism', 185000, 'Pablo Picasso');
INSERT INTO ARTWORKS
VALUES ('The old guitarist', '1904', 'Painting', 'Expressionism', 187000, 'Pablo Picasso');
INSERT INTO ARTWORKS
VALUES ('Girl before a Mirror', '1937', 'Painting', 'Cubism', 194250, 'Pablo Picasso');
INSERT INTO ARTWORKS
VALUES ('The Descent from the Cross', '1613', 'Painting', 'Baroque',  1000000, 'Peter Paul Rubens');
INSERT INTO ARTWORKS
VALUES ('The Night Watch', '1642', 'Painting', 'Baroque',  1300000, 'Rembrandt');
INSERT INTO ARTWORKS
VALUES ('Irises', '1889', 'Painting', 'Post-Impressionism',  1200000, 'Vincent van Gogh');

--PurchasedBy
INSERT INTO PURCHASEDBY
VALUES ('2018-05-29', 'Cardsharps', '9512121286');
UPDATE CUSTOMERS
SET MONEYSPENT = 10000
WHERE SSN = '9512121286';

INSERT INTO PURCHASEDBY
VALUES ('2017-04-18', 'The Night Watch', '8605195498');
UPDATE CUSTOMERS
SET MONEYSPENT = 1300000
WHERE SSN = '8605195498';

INSERT INTO PURCHASEDBY
VALUES ('2015-11-16', 'Irises', '7807129112');
UPDATE CUSTOMERS
SET MONEYSPENT = 1200000
WHERE SSN = '7807129112';

INSERT INTO PURCHASEDBY
VALUES ('2014-9-11', 'Mural', '6805149811');
UPDATE CUSTOMERS
SET MONEYSPENT = 125000
WHERE SSN = '6805149811';