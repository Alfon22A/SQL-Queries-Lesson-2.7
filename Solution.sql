/* 1. How many films are there for each of the categories in the category table.
Use appropriate join to write this query.
*/

USE sakila;

SELECT c.name AS "Category", COUNT(DISTINCT f.film_id) AS "Films"
FROM category AS c
INNER JOIN film_category AS f
ON c.category_id = f.category_id
GROUP BY Category
ORDER BY Films DESC;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT s.first_name AS "Name", s.last_name AS "Surname", SUM(p.amount) AS "Amount"
FROM staff AS s
INNER JOIN payment AS p
ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN "2005-08-01 00:00:00" AND "2005-08-31 23:59:59"
GROUP BY s.staff_id
ORDER BY Amount DESC;

-- 3. Which actor has appeared in the most films?

SELECT a.first_name AS "Name", a.last_name AS "Surname", COUNT(f.film_id) AS "Films"
FROM film_actor AS f
INNER JOIN actor AS a
ON f.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY Films DESC;

-- 4. Most active customer (the customer that has rented the most number of films)

SELECT c.first_name AS "Name", c.last_name AS "Surname", COUNT(r.rental_id) AS "Rentals"
FROM customer AS c
INNER JOIN rental AS r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY Rentals DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff AS s
LEFT JOIN address AS a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film.

SELECT fi.title AS "Film", COUNT(DISTINCT fa.actor_id) AS "Actors"
FROM film AS fi
LEFT JOIN film_actor AS fa
ON fi.film_id = fa.film_id
GROUP BY fi.film_id
ORDER BY Actors DESC, Film;

/* 7. Using the tables payment and customer and the JOIN command,
list the total paid by each customer. List the customers alphabetically by last name.
*/
SELECT c.last_name AS "Surname", c.first_name AS "Name", SUM(p.amount) AS "Amount"
FROM customer AS c
LEFT JOIN payment AS p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY Surname, Name;

-- 8. List number of films per category.

SELECT c.name AS "Category", COUNT(DISTINCT f.film_id) AS "Films"
FROM category AS c
INNER JOIN film_category AS f
ON c.category_id = f.category_id
GROUP BY Category
ORDER BY Films DESC;