SELECT *   FROM users; -- Seleccion de todas las columnas de tabla usuarios

SELECT * FROM follows; -- Seleccion de todas las columnas de tabla follows

SELECT * FROM tweets; -- Seleccion de todas las columnas de tabla tweets


SELECT user_id, tweet FROM tweets; -- Seleccion de columnas user_id, tweet de tabla tweets


SELECT user_id, tweet FROM tweets WHERE user_id>=3; -- Seleccion de columnas user_id, tweet de tabla tweets usuarios mayores a 2

SELECT user_id, tweet FROM tweets WHERE user_id>=3 AND id<=6; -- Seleccion de columnas user_id, tweet de tabla tweets usuarios estan entre 3 y 6

SELECT user_id, tweet, created_at FROM tweets WHERE created_at < '2008-02-01 00:00:01'
AND created_at > '2008-12-31 00:00:01'; -- Ahora la condición es entre un rango de datetime de created_at

SELECT * FROM users 
WHERE last_name LIKE '%Br%'; /* sirve para detectar los caracteres BR en la tabla users en last_name*/

SELECT *
FROM users
WHERE first_name LIKE '%e'   /* sirve para detectar los first name que terminan con e*/

ORDER BY birthday DESC;


SELECT * FROM users   /* sirve para detectar los first name que comienza con K*/
WHERE first_name LIKE 'k%'
ORDER BY last_name DESC;

SELECT * FROM twitter.tweets LIMIT 5;  /* muestra solo los primeros 5 registros*/

/*CREATE
READ
UPDATE    CRUD
DELETE */





