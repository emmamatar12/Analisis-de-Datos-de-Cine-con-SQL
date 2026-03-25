USE dvdrental;
SELECT TOP 5 * FROM actor;





-- Consulta 1: Seleccionar el nombre y apellido de los actores
SELECT first_name, last_name
FROM actor;


-- Conclusiones:
-- 1. La tabla "actor" contiene la lista completa de actores del sistema de alquiler.
-- 2. Cada actor se identifica mediante su nombre y apellido.
-- 3. Los datos se muestran correctamente estructurados, sin valores nulos.




-- Consulta 2: Mostrar el nombre completo del actor en una sola columna
SELECT first_name + ' ' + last_name AS Nombre_Completo
FROM actor;



-- Conclusiones:
-- 1. Los nombres y apellidos se concatenan correctamente en una sola columna llamada "Nombre_Completo".
-- 2. No se observan valores nulos ni errores en la concatenación.
-- 3. Esta presentación facilita la lectura y mejora la visualización de los datos en reportes o listados.





-- Consulta 3: Seleccionar los actores cuyo nombre empieza con "D"
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'D%';



-- Conclusiones:
-- 1. Se identificaron los actores cuyos nombres comienzan con la letra "D".
-- 2. El filtro con la cláusula LIKE 'D%' funciona correctamente para este tipo de búsqueda.
-- 3. El resultado muestra que existen varios actores con nombres iniciados en "D", como Dan, Dustin, Daryl y Debbie.





-- Consulta 4: Verificar si existen actores con el mismo nombre
SELECT first_name, COUNT(*) AS cantidad
FROM actor
GROUP BY first_name
HAVING COUNT(*) > 1;


-- Conclusiones:
-- 1. Se identificaron varios nombres repetidos entre los actores, como Adam, Angela, Ben y Chris.
-- 2. El uso de GROUP BY junto con HAVING COUNT(*) > 1 permite detectar duplicados fácilmente.
-- 3. Los resultados indican que, aunque los nombres se repiten, pueden pertenecer a diferentes actores (diferentes apellidos).





-- Consulta 5: Obtener el costo máximo de renta de una película
SELECT MAX(rental_rate) AS Costo_Maximo_Renta
FROM film;



-- Conclusiones:
-- 1. El costo máximo de renta de una película en la base de datos es de 4.99 unidades monetarias.
-- 2. Este valor representa el límite superior del rango de precios del catálogo.
-- 3. Este dato puede utilizarse para comparar o clasificar películas según su costo de renta.



-- Consulta 6: Mostrar las películas que fueron rentadas con el costo máximo de renta
SELECT title, rental_rate
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film);




-- Conclusiones:
-- 1. Existen múltiples películas con el costo máximo de renta de 4.99.
-- 2. Este grupo representa las películas más caras del catálogo.
-- 3. La subconsulta utilizada permitió comparar cada registro con el valor máximo global de la columna rental_rate.






-- Consulta 7: Contar cuántas películas hay por tipo de audiencia (rating)
SELECT rating, COUNT(*) AS Cantidad_Peliculas
FROM film
GROUP BY rating;



-- Conclusiones:
-- 1. La clasificación con mayor número de películas es "PG-13" con 223 títulos.
-- 2. Las categorías "NC-17" y "R" también presentan una cantidad significativa de películas.
-- 3. Este conteo permite identificar la distribución del catálogo según el tipo de audiencia.





-- Consulta 8: Seleccionar las películas que no tienen un rating "R" o "NC-17"
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'NC-17');




-- Conclusiones:
-- 1. Las películas con clasificación "G", "PG" y "PG-13" fueron seleccionadas correctamente.
-- 2. Se excluyeron con éxito las categorías restringidas ("R" y "NC-17").
-- 3. Este filtro permite enfocar el catálogo en contenidos adecuados para audiencias más amplias o familiares.






-- Consulta 9: Contar cuántos clientes hay en cada tienda
SELECT store_id, COUNT(*) AS Cantidad_Clientes
FROM customer
GROUP BY store_id;


-- Conclusiones:
-- 1. La tienda 1 cuenta con 326 clientes, mientras que la tienda 2 tiene 273.
-- 2. La diferencia muestra que la tienda 1 posee una mayor base de clientes activos.
-- 3. Este resultado puede servir para analizar el desempeño comercial o la distribución de clientes entre tiendas.



-- Consulta 10: Identificar la película que más veces se ha rentado
SELECT f.title, COUNT(r.rental_id) AS Veces_Rentada
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY Veces_Rentada DESC;


-- Conclusiones:
-- 1. La película más rentada es "Bucket Brotherhood" con 34 alquileres registrados.
-- 2. Le siguen "Rocketeer Mother" y "Ridge Mont Submarine" con cifras cercanas.
-- 3. Este análisis permite identificar las películas más populares entre los clientes.






-- Consulta 11: Mostrar las películas que no se han rentado
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;



-- Conclusiones:
-- 1. Se identificaron varias películas que no registran ninguna renta, como "Frankenstein Stranger" y "Dazed Punk".
-- 2. El uso de LEFT JOIN con la condición r.rental_id IS NULL permite detectar registros sin actividad de alquiler.
-- 3. Este resultado puede servir para analizar títulos con baja demanda o inexistente rotación en el inventario.






-- Consulta 12: Mostrar los clientes que no han rentado ninguna película
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;


-- Conclusiones:
-- 1. No se encontraron clientes sin registros de renta, lo que indica que todos han realizado al menos una transacción.
-- 2. Esto demuestra una cobertura completa de participación de los clientes en el sistema de alquiler.
-- 3. El resultado vacío confirma que la relación entre las tablas "customer" y "rental" está completamente vinculada.





-- Consulta 13: Mostrar los actores que han actuado en más de 30 películas
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS Peliculas_Actuadas
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 30
ORDER BY Peliculas_Actuadas DESC;



-- Conclusiones:
-- 1. Se identificaron varios actores con más de 30 participaciones, destacando Gina Degeneres con 42 y Walter Tom con 41.
-- 2. La consulta demuestra la relación muchos a muchos entre actores y películas mediante la tabla "film_actor".
-- 3. Este resultado permite reconocer a los actores más activos dentro del catálogo cinematográfico.






-- Consulta 14: Mostrar las ventas totales por tienda
SELECT s.store_id, SUM(CAST(p.amount AS DECIMAL(10,2))) AS Ventas_Totales
FROM store s
INNER JOIN staff st ON s.store_id = st.store_id
INNER JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;



-- Conclusiones:
-- 1. La tienda 1 generó un total de 30,252.12 en ventas, mientras que la tienda 2 obtuvo 31,059.92.
-- 2. Se observa un desempeño ligeramente superior en la tienda 2.
-- 3. La conversión de datos fue necesaria para realizar la suma correctamente, asegurando resultados numéricos válidos.




-- Consulta 15: Mostrar los clientes que rentaron una película más de una vez
WITH RentasCliente AS (
    SELECT customer_id, inventory_id, COUNT(*) AS Veces_Rentada
    FROM rental
    GROUP BY customer_id, inventory_id
    HAVING COUNT(*) > 1
)
SELECT c.customer_id, c.first_name, c.last_name, r.Veces_Rentada
FROM RentasCliente r
INNER JOIN customer c ON r.customer_id = c.customer_id
ORDER BY r.Veces_Rentada DESC;

-- Conclusiones:
-- 1. No se encontraron clientes que hayan rentado la misma película más de una vez.
-- 2. Esto sugiere que el sistema de alquiler no permite rentas repetidas del mismo título por el mismo cliente simultáneamente.
-- 3. El uso de una CTE (Common Table Expression) permitió estructurar la consulta de forma clara para detectar posibles duplicidades.
