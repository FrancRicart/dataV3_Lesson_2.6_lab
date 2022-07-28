/*
Instructions
1. In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, 
you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
These three actors have the same last name. So we do not want to include this last name in our output. 
Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
2. Which last names appear more than once? We would use the same logic as in the previous question 
but this time we want to include the last names of the actors where the last name was present more than once
3. Using the rental table, find out how many rentals were processed by each employee.
4. Using the film table, find out how many films were released each year.
5. Using the film table, find out for each rating how many films were there.
6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
7. Which kind of movies (rating) have a mean duration of more than two hours?
8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
*/

USE sakila;

-- 1.In the table actor, which are the actors whose last names are not repeated?

SELECT last_name AS 'Unique Last Name' FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) < 2;

-- 2. Which last names appear more than once? We would use the same logic as in the previous question 
SELECT last_name AS 'Unique Last Name' FROM sakila.actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id as Employee, SUM(rental_id) AS Rentals FROM rental
GROUP BY staff_id;

-- 4. Using the film table, find out how many films were released each year.

SELECT film_id as films, release_year as year 
FROM sakila.film;
-- There are only films from 2006.. 

SELECT release_year, count(film_id) from sakila.film
GROUP BY release_year;
-- This is what I would do to get results

-- 5. Using the film table, find out for each rating how many films were there.
SELECT count(film_id) AS films, rating
FROM film
GROUP BY rating
ORDER BY rating DESC;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating, count(film_id) as 'Number of Films', round(AVG(length),2) as mean_length
FROM film
GROUP BY rating
ORDER BY mean_length;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating AS kind_of_film, ROUND(AVG(length),2) AS avg_duration
FROM film
WHERE avg_duration > 120
GROUP BY kind_of_film;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title, length, rating
FROM film
WHERE (length > 0) OR (NOT null)
ORDER BY length DESC;

