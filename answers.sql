-- Tehtava 1
-- Search all movie titles.

SELECT nimi
FROM Elokuvat

-- Tehtava 2
-- Search all movie titles and release years.

SELECT nimi, vuosi
FROM Elokuvat

-- Tehtava 3
-- Search for the names of all movies released in 1940.

SELECT nimi
FROM Elokuvat
WHERE vuosi = 1940;

-- Tehtava 4
-- Search for the names of films released before 1950.

SELECT nimi
FROM Elokuvat
WHERE vuosi < 1950;

-- Tehtava 5
-- Search for the names of films released between 1940 and 1950.

SELECT nimi
FROM Elokuvat
WHERE vuosi BETWEEN 1940 AND 1950;

-- Tehtava 6
-- Search for the names of films released before 1950 or after 1980.

SELECT nimi
FROM Elokuvat
WHERE vuosi NOT BETWEEN 1950 AND 1980;

-- Tehtava 7
-- Search for the names of all films not released in 1940.

SELECT nimi
FROM Elokuvat
WHERE vuosi != 1940;

-- Tehtava 8
-- Search for all movie titles in alphabetical order.

SELECT nimi
FROM Elokuvat
ORDER BY nimi ASC;

-- Tehtava 9
-- Search all movie titles in reverse alphabetical order.

SELECT nimi
FROM Elokuvat
ORDER BY nimi DESC;

-- Tehtava 10
-- Search for movie names and release years primarily in reverse order by release year, secondarily in alphabetical order.

SELECT nimi, vuosi
FROM Elokuvat
ORDER BY vuosi DESC, nimi ASC;

-- Tehtava 11
-- Search all different first names.

SELECT DISTINCT etunimi
FROM Nimet;

-- Tehtava 12
-- Search all different names.

SELECT DISTINCT etunimi, sukunimi
FROM Nimet;

--Tehtava 13
--Get the number of employees.

SELECT COUNT(*)
FROM Tyontekijat;

-- Tehtava 14
-- Get the number of employees whose salary is more than 2000.

SELECT COUNT(*)
FROM Tyontekijat
WHERE palkka > 2000;

-- Tehtava 15
-- search for the joint salary of the employees.

SELECT SUM(palkka)
FROM Tyontekijat;

-- Tehtava 16
-- search for the highest employee salary.

SELECT MAX(palkka) AS korkein
FROM Tyontekijat;

-- Tehtava 17
-- Search for the number of different companies.

SELECT COUNT(DISTINCT yritys)
FROM Tyontekijat;

-- Tehtava 18
-- Get the number of employees for each company.

SELECT yritys, COUNT(*)
FROM Tyontekijat
GROUP BY yritys;

-- Tehtava 19
-- Search for the highest employee salary in each company.

SELECT yritys, MAX(palkka)
FROM Tyontekijat
GROUP BY yritys;

-- Tehtava 20
-- Show the highest employee salary from companies where it is at least 5000.

SELECT yritys, MAX(palkka) AS suurin_palkka
FROM Tyontekijat
WHERE palkka >= 5000
GROUP BY yritys;

-- Tehtava 21
-- Create a results list showing all the results.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM Pelaajat
    JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
ORDER BY Pelaajat.nimi, Tulokset.tulos;

-- Tehtava 22
-- Create a list of results showing Uolevi's results.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM pelaajat
    JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
WHERE Pelaajat.nimi = "Uolevi"
ORDER BY Tulokset.tulos;

-- Tehtava 23
-- Create a results list showing results better than 250.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM Pelaajat
    JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
WHERE Tulokset.tulos > 250
ORDER BY Tulokset.tulos;

-- Tehtava 24
-- Create a list of results that shows all the results arranged primarily in reverse order by score and secondarily by name.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM Pelaajat
    JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
ORDER BY Tulokset.tulos DESC, Pelaajat.nimi ASC;

-- Tehtava 25
-- For each player, report their best score. You can assume that each player has at least one outcome.

SELECT Pelaajat.nimi, MAX(Tulokset.tulos) AS paras_tulos
FROM Pelaajat
    JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
GROUP BY Pelaajat.nimi;

-- Tehtava 26
-- For each player, state how many results they have. You can assume that each player has at least one outcome.

SELECT Pelaajat.nimi, COUNT(pelaaja_id) AS tulosten_maara
FROM Pelaajat
    JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
GROUP BY Pelaajat.nimi;

-- Tehtava 27
-- Search for the student's name, course name and grade from all the performances.

SELECT Opiskelijat.nimi, Kurssit.nimi, Suoritukset.arvosana
FROM Suoritukset
    JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
    JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id;

-- Tehtava 28
-- Search for the name and grade of the course from all Uolevi performances.

SELECT Kurssit.nimi, Suoritukset.arvosana
FROM Suoritukset
    JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
    JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id
WHERE Opiskelijat.nimi = "Uolevi";

-- Tehtava 29
-- Search for the student's name and grade from all Ohpen performances.

SELECT Opiskelijat.nimi, Suoritukset.arvosana
FROM Suoritukset
    JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
    JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id
WHERE Kurssit.nimi = 'Ohpe';

-- Tehtava 30
-- Search for all performances with a grade of 4 or 5.

SELECT Opiskelijat.nimi, Kurssit.nimi, Suoritukset.arvosana
FROM Suoritukset
    JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
    JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id
WHERE Suoritukset.arvosana IN (4, 5);
-- IN filters the results to include only those with grades 4 or 5

-- Tehtava 31
-- Get the number of achievements for each student. You can assume that every student has at least one achievement.

SELECT Opiskelijat.nimi, COUNT(opiskelija_id) AS suoritusten_maara
FROM Suoritukset
    JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
GROUP BY Opiskelijat.nimi;

-- Tehtava 32
-- Get the best performance grade for each student. You can assume that every student has at least one achievement.

SELECT Opiskelijat.nimi, MAX(Suoritukset.arvosana) AS paras_arvosana
FROM Suoritukset
    JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
GROUP BY Opiskelijat.nimi;

-- Tehtava 33
-- Search for information on all flight connections.

SELECT mista.nimi, minne.nimi
FROM Lennot
    JOIN Kaupungit mista ON Lennot.mista_id = mista.id
    JOIN Kaupungit minne ON Lennot.minne_id = minne.id;

-- Tehtava 34
-- Search for destinations on all flights departing from Helsinki.

SELECT Kaupungit.nimi
FROM Lennot
    JOIN Kaupungit ON Lennot.minne_id = Kaupungit.id
WHERE Lennot.mista_id = 1;

-- Tehtava 35
-- For each player, report how many results they have (even if there are no results).

SELECT Pelaajat.nimi, COUNT(Tulokset.id) AS tulos_maara
FROM Pelaajat
    LEFT JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
GROUP BY Pelaajat.id, Pelaajat.nimi;

-- Tehtava 36
-- Get the number of achievements for each student (even if there are no achievements).

SELECT Opiskelijat.nimi, COUNT(Suoritukset.opiskelija_id)
FROM Opiskelijat
    LEFT JOIN Suoritukset ON Opiskelijat.id = Suoritukset.opiskelija_id
GROUP BY Opiskelijat.id, Opiskelijat.nimi;

-- Tehtava 37
-- Get the number of completers for each course (even if there are no completions).

SELECT Kurssit.nimi, COUNT(Suoritukset.opiskelija_id)
FROM Kurssit
    LEFT JOIN Suoritukset ON Kurssit.id = Suoritukset.kurssi_id
GROUP BY Kurssit.id, Kurssit.nimi;

-- Tehtava 38
-- Retrieve the names of all courses that have been completed at least once.

SELECT DISTINCT Kurssit.nimi
FROM Kurssit
    JOIN Suoritukset ON Kurssit.id = Suoritukset.kurssi_id;

-- Tehtava 39
-- Retrieve the names of all courses that have not been completed even once.

SELECT Kurssit.nimi
FROM Kurssit
    LEFT JOIN Suoritukset ON Kurssit.id = Suoritukset.kurssi_id
WHERE Suoritukset.kurssi_id IS NULL;

-- Tehtava 40
-- Search for each city, how many flights depart from there (even if there are no flights).

SELECT Kaupungit.nimi, COUNT(Lennot.id) AS lento_maara
FROM Kaupungit
    LEFT JOIN Lennot ON Kaupungit.id = Lennot.mista_id
GROUP BY Kaupungit.id, Kaupungit.nimi;

-- Tehtava 41
-- Search for double the price of each product.

SELECT nimi, hinta * 2
FROM Tuotteet;

-- Tehtava 42
-- Search for all products with an even price.

SELECT nimi, hinta
FROM Tuotteet
WHERE hinta % 2 = 0;

-- Tehtava 43
-- Get the length of each word in characters.

SELECT sana, LENGTH(sana)
FROM Sanat;

-- Tehtava 44
-- Search for all words less than 6 characters longGet the length of each word in characters.

SELECT sana
FROM Sanat
WHERE LENGTH(sana) < 6;

-- Tehtava 45
-- Search for words arranged primarily by length and secondarily by alphabetical order.

SELECT sana
FROM Sanat
ORDER BY LENGTH(sana), sana;

-- Tehtava 46
-- Search for user's full names in one column.

SELECT etunimi || " " || sukunimi
FROM Kayttajat;

-- Tehtava 47
-- Find the total length of all words.

SELECT SUM(LENGTH(sana))
FROM Sanat;

-- Tehtava 48
-- Calculate the total price of each order.

SELECT tuote, hinta * maara
FROM Tilaukset;

-- Tehtava 49
-- Calculate the sum of the total prices of all orders.

SELECT SUM(hinta * maara)
FROM Tilaukset;

-- Tehtava 50
-- Search for the names of all movies released in a leap year. (A year is a leap year if it is divisible by 4. If a year is divisible by 100, it is a leap year only if it is also divisible by 400.)

SELECT nimi
FROM Elokuvat
WHERE (vuosi % 4 = 0 AND vuosi % 100 != 0) OR (vuosi % 400 = 0);

-- Tehtava 51
-- Search all products with the lowest price.

SELECT nimi
FROM Tuotteet
WHERE hinta = (SELECT MIN(hinta) FROM Tuotteet);

-- Tehtava 52
-- Search all products with a price up to double the lowest price.

SELECT nimi
FROM Tuotteet
WHERE hinta <= 2 * (SELECT MIN(hinta) FROM Tuotteet);