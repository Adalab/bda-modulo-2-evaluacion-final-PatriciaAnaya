-- Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT(title)
FROM film;

-- Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT title, rating
FROM film
WHERE rating = "PG-13";

-- Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
select title, description
FROM film
WHERE description LIKE "%amazing%";

select title, description
FROM film
WHERE description REGEXP "amazing";

-- Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.
SELECT title, length
FROM film
WHERE length > 120;

-- Recupera los nombres de todos los actores.
SELECT CONCAT(first_name, " ",last_name) AS actors
FROM actor
ORDER BY first_name;

SELECT first_name,last_name
FROM actor
ORDER BY first_name;

-- Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%Gibson%";

select first_name, last_name
FROM actor
WHERE last_name REGEXP "Gibson";

-- Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name, last_name, actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20;

-- Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title, rating
FROM film
WHERE rating NOT LIKE "R" AND rating NOT LIKE "PG-13";

-- Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT COUNT(film.film_id) as total_films,category.name 
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY category.name;

-- Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT customer.customer_id, CONCAT(customer.first_name, " ",customer.last_name) as customer_name, COUNT(rental.rental_id) AS total_rentals
FROM customer
INNER JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer_id, customer.first_name, customer.last_name;

-- Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.
SELECT COUNT(rental.rental_id), category.name
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
INNER JOIN film ON film.film_id = inventory.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT AVG(film.length) length_average, category.name
FROM film
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name;

-- Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT actor.first_name, actor.last_name
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film.film_id = film_actor.film_id
WHERE film.title = "Indian Love";

-- Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title
FROM film
WHERE description LIKE "%dog%" OR description LIKE "%cat%";

SELECT title
FROM film
WHERE description REGEXP 'dog|cat';

-- Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year
FROM film
WHERE release_year BETWEEN 2005 and 2010;