--Sakila answers 1-3

SELECT * 
FROM sakila.actor

SELECT * 
FROM sakila.actor 
	WHERE first_name='John'

SELECT * FROM sakila.actor
	WHERE last_name='Neeson'

--Sakila answers 4-
SELECT *,actor_id % 10 FROM sakila.actor
	WHERE actor_id % 10 = 0

SELECT description FROM sakila.film
	WHERE film_id=100

SELECT film_id, title FROM sakila.film
	WHERE rating='R'

SELECT film_id, title FROM sakila.film
	WHERE rating!='R'

SELECT film_id, title FROM sakila.film
	WHERE special_features LIKE '%Deleted Scenes%'

SELECT DISTINCT last_name FROM sakila.actor

SELECT		last_name, COUNT(*) 
FROM		sakila.actor 
GROUP BY	last_name
HAVING		COUNT(*)>1


SELECT TOP 1 
	a.actor_id, 
	b.first_name, 
	b.last_name,
	COUNT(a.film_id) 
FROM sakila.film_actor AS a
	INNER JOIN sakila.actor AS b ON (a.actor_id=b.actor_id)
GROUP BY	a.actor_id, 
			b.first_name, 
			b.last_name
ORDER BY COUNT(*) DESC


SELECT * 
FROM sakila.inventory AS i
	INNER JOIN sakila.film AS f ON(i.film_id=f.film_id)
WHERE store_id=1 
	AND title='Academy Dinosaur'

SELECT AVG(length) 
FROM sakila.film

SELECT	c.category_id,
		cc.name,
		AVG(f.length) AS AVG_LEN
FROM sakila.film AS f
	INNER JOIN sakila.film_category AS c ON(f.film_id=c.film_id)
	INNER JOIN sakila.category AS cc ON(c.category_id=cc.category_id)
GROUP BY c.category_id,cc.name

SELECT COUNT(*) 
FROM sakila.film
WHERE UPPER(description) LIKE '%ROBOT%'

SELECT title
FROM sakila.film
WHERE length = (
	SELECT 
		MAX(length)
	FROM sakila.film)

SELECT COUNT(*) AS released_films
FROM sakila.film
WHERE release_year=2010 


SELECT CONCAT (first_name,' ',last_name) AS full_name
FROM sakila.staff
WHERE staff_id = 1

SELECT title
FROM sakila.film AS f
	INNER JOIN sakila.film_actor AS fa ON(f.film_id=fa.film_id)
	INNER JOIN sakila.actor AS a ON(a.actor_id=fa.actor_id)
WHERE first_name='Fred' 
	AND last_name='Costner'

SELECT store_id, COUNT(inventory_id)
FROM sakila.inventory AS i
	INNER JOIN sakila.film AS f ON(i.film_id=f.film_id)
WHERE title='Bucket Brotherhood'
GROUP BY store_id

SELECT COUNT(DISTINCT country) AS countries
FROM sakila.country


SELECT name
FROM sakila.language
ORDER BY name ASC

SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM sakila.actor
WHERE last_name LIKE('%son%')
ORDER BY first_name ASC


	