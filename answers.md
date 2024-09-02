### Tehtava 1

### Search all movie titles.

SELECT nimi
FROM Elokuvat

### Tehtava 2

### Search all movie titles and release years.

SELECT nimi, vuosi
FROM Elokuvat

### Tehtava 3

### Search for the names of all movies released in 1940.

SELECT nimi
FROM Elokuvat
WHERE vuosi = 1940;

### Tehtava 4

### Search for the names of films released before 1950.

SELECT nimi
FROM Elokuvat
WHERE vuosi < 1950;

### Tehtava 5

### Search for the names of films released between 1940 and 1950.

SELECT nimi
FROM Elokuvat
WHERE vuosi BETWEEN 1940 AND 1950;

### Tehtava 6

### Search for the names of films released before 1950 or after 1980.

SELECT nimi
FROM Elokuvat
WHERE vuosi NOT BETWEEN 1950 AND 1980;

### Tehtava 7

### Search for the names of all films not released in 1940.

SELECT nimi
FROM Elokuvat
WHERE vuosi != 1940;

### Tehtava 8

### Search for all movie titles in alphabetical order.

SELECT nimi
FROM Elokuvat
ORDER BY nimi ASC;

### Tehtava 9

### Search all movie titles in reverse alphabetical order.

SELECT nimi
FROM Elokuvat
ORDER BY nimi DESC;

### Tehtava 10

### Search for movie names and release years primarily in reverse order by release year, secondarily in alphabetical order.

SELECT nimi, vuosi
FROM Elokuvat
ORDER BY vuosi DESC, nimi ASC;

### Tehtava 11

### Search all different first names.

SELECT DISTINCT etunimi
FROM Nimet;

### Tehtava 12

### Search all different names.

SELECT DISTINCT etunimi, sukunimi
FROM Nimet;

### Tehtava 13

### Get the number of employees.

SELECT COUNT(\*)
FROM Tyontekijat;

### Tehtava 14

### Get the number of employees whose salary is more than 2000.

SELECT COUNT(\*)
FROM Tyontekijat
WHERE palkka > 2000;

### Tehtava 15

### search for the joint salary of the employees.

SELECT SUM(palkka)
FROM Tyontekijat;

### Tehtava 16

### search for the highest employee salary.

SELECT MAX(palkka) AS korkein
FROM Tyontekijat;

### Tehtava 17

### Search for the number of different companies.

SELECT COUNT(DISTINCT yritys)
FROM Tyontekijat;

### Tehtava 18

### Get the number of employees for each company.

SELECT yritys, COUNT(\*)
FROM Tyontekijat
GROUP BY yritys;

### Tehtava 19

### Search for the highest employee salary in each company.

SELECT yritys, MAX(palkka)
FROM Tyontekijat
GROUP BY yritys;

### Tehtava 20

### Show the highest employee salary from companies where it is at least 5000.

SELECT yritys, MAX(palkka) AS suurin_palkka
FROM Tyontekijat
WHERE palkka >= 5000 GROUP BY yritys;

### Tehtava 21

### Create a results list showing all the results.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM Pelaajat
JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
ORDER BY Pelaajat.nimi, Tulokset.tulos;

### Tehtava 22

### Create a list of results showing Uolevi's results.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM pelaajat
JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
WHERE Pelaajat.nimi = "Uolevi"
ORDER BY Tulokset.tulos;

### Tehtava 23

### Create a results list showing results better than 250.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM Pelaajat
JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
WHERE Tulokset.tulos > 250
ORDER BY Tulokset.tulos;

### Tehtava 24

### Create a list of results that shows all the results arranged primarily in reverse order by score and secondarily by name.

SELECT Pelaajat.nimi, Tulokset.tulos
FROM Pelaajat
JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
ORDER BY Tulokset.tulos DESC, Pelaajat.nimi ASC;

### Tehtava 25

### For each player, report their best score. You can assume that each player has at least one outcome.

SELECT Pelaajat.nimi, MAX(Tulokset.tulos) AS paras_tulos
FROM Pelaajat
JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
GROUP BY Pelaajat.nimi;

### Tehtava 26

### For each player, state how many results they have. You can assume that each player has at least one outcome.

SELECT Pelaajat.nimi, COUNT(pelaaja_id) AS tulosten_maara
FROM Pelaajat
JOIN Tulokset ON Pelaajat.id = Tulokset.pelaaja_id
GROUP BY Pelaajat.nimi;

### Tehtava 27

### Search for the student's name, course name and grade from all the performances.

SELECT Opiskelijat.nimi,Kurssit.nimi,Suoritukset.arvosana
FROM Suoritukset
JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id;

### Tehtava 28

### Search for the name and grade of the course from all Uolevi performances.

SELECT Kurssit.nimi, Suoritukset.arvosana
FROM Suoritukset
JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id
WHERE Opiskelijat.nimi = "Uolevi";

### Tehtava 29

### Search for the student's name and grade from all Ohpen performances.

SELECT Opiskelijat.nimi,Suoritukset.arvosana
FROM Suoritukset
JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id
WHERE Kurssit.nimi = 'Ohpe';

### Tehtava 30

### Search for all performances with a grade of 4 or 5.

SELECT Opiskelijat.nimi,Kurssit.nimi,Suoritukset.arvosana
FROM Suoritukset
JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
JOIN Kurssit ON Suoritukset.kurssi_id = Kurssit.id
WHERE Suoritukset.arvosana IN (4, 5); // IN filters the results to include only those with grades 4 or 5

### Tehtava 31

### Get the number of achievements for each student. You can assume that every student has at least one achievement.

SELECT Opiskelijat.nimi, COUNT(opiskelija_id) AS suoritusten_maara
FROM Suoritukset
JOIN Opiskelijat ON Suoritukset.opiskelija_id = Opiskelijat.id
GROUP BY Opiskelijat.nimi;
