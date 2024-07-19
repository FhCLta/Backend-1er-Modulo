/* Seleccionar todos los registros del cliente cuyo primer nombre es 'John' */
SELECT *
FROM CUSTOMER
WHERE first_name = 'John';

/* Seleccionar todos los registros del cliente con ID entre 4 y 100 (inclusive) */
SELECT *
FROM CUSTOMER
WHERE customer_id >= 4 AND customer_id <= 100;

/* Seleccionar todos los registros de la película con los IDs especificados */
SELECT * 
FROM film
WHERE film_id IN (9,12,99,22,44);

/* Seleccionar todos los registros de la dirección donde address2 está vacío */
SELECT * 
FROM address
WHERE address2 = '';

/* Seleccionar los últimos 10 registros de la película ordenados por film_id en orden descendente */
SELECT * 
FROM film
ORDER BY film_id DESC
LIMIT 10;

/* Obtener el valor mínimo del atributo 'amount' en la tabla 'payment' */
SELECT MIN(amount)
FROM payment;

/* Obtener el valor máximo del atributo 'amount' en la tabla 'payment' */
SELECT MAX(amount)
FROM payment;

/* Contar todos los registros en la tabla 'customer' */
SELECT COUNT (*)
FROM customer;

/* Contar los valores únicos del código postal en la tabla 'address' */
SELECT COUNT(DISTINCT postal_code)
FROM address;

/* Contar el número de películas para cada clasificación (rating) específica */
SELECT rating, COUNT(rating)
FROM film
WHERE rating = 'PG' OR rating = 'PG-13' OR rating='NC-17'
GROUP BY rating;

/* Obtener el promedio del atributo 'amount' para cada 'customer_id' */
SELECT customer_id, AVG(amount)
FROM payment
GROUP BY customer_id

/* Obtener el top 10 de clientes basado en el promedio del 'amount', ordenado de mayor a menor */
SELECT customer_id, AVG(amount)
FROM payment
GROUP BY customer_id
ORDER BY AVG(amount) DESC
LIMIT 10;

/* Seleccionar todos los registros del cliente y su dirección correspondiente */
SELECT *
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id;

/* Seleccionar todos los registros del cliente y su dirección donde el código postal es '52137' */
SELECT *
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE postal_code = '52137';

/* Contar el número de clientes por código postal, ordenando de mayor a menor */
SELECT postal_code, count(*)
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
GROUP BY postal_code
ORDER BY count(*) DESC;

/* Seleccionar el título de la película y el nombre del actor asociado mediante una doble unión interna */
SELECT title, first_name, last_name 
FROM film AS F 
INNER JOIN film_actor AS FA 
on F.film_id = FA.film_id
INNER JOIN actor AS AC 
on AC.actor_id = FA.actor_id;

/* Seleccionar los IDs de la película, título, ID de inventario y ID de tienda, usando una unión izquierda y ordenando por ID de inventario en orden descendente */
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
ORDER BY inventory_id DESC;

/* Seleccionar los IDs de la película, título, ID de inventario y ID de tienda para registros donde no hay coincidencias en el inventario */
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS NULL;

/* Seleccionar todos los registros del cliente cuyo ID de dirección coincide con un código postal específico */
SELECT *
FROM customer
WHERE address_id
IN (SELECT address_id 
	FROM address
   WHERE postal_code = '52137');

   /* Seleccionar todos los registros del cliente y su dirección correspondiente de dos tablas*/
SELECT *
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id;

/* Descripción: Esta consulta realiza una unión interna (INNER JOIN) entre las tablas customer y address. 
Selecciona los campos first_name y last_name de la tabla customer, y los campos address y district de la tabla address.
 La unión se realiza cuando el address_id en la tabla customer coincide con el address_id en la tabla address, lo que permite
combinar información de los clientes con su correspondiente dirección y distrito en el resultado de la consulta.  */

/* Seleccionar todos los registros de los clientes y su dirección correspondiente donde el código postal es '52137' */
SELECT *
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE postal_code = '52137';

/* Contar el número de clientes por código postal, ordenando de mayor a menor */
SELECT postal_code, COUNT(*)
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
GROUP BY postal_code
ORDER BY COUNT(*) DESC;

/* Seleccionar el título de la película y los nombres de los actores asociados mediante una doble unión interna */
SELECT title, first_name, last_name
FROM film AS f
INNER JOIN film_actor AS fa
ON f.film_id = fa.film_id
INNER JOIN actor AS ac
ON ac.actor_id = fa.actor_id;

/* Seleccionar los IDs de la película, título, ID de inventario y ID de tienda, usando una unión izquierda y ordenando por ID de inventario en orden descendente */
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
ORDER BY inventory_id DESC;




