USE twitter;

-- SELECT * FROM users, tweets ; /* union de ambas tablas
-- se mostrará todas las variables y se repetiran los usuarios por cada tweets*/

SELECT * FROM users, tweets WHERE users.id = tweets.user_id;
--  reduzco la tabla con una condición
-- la tabla es ambigua por que tienes dos veces la var id

-- Para saber el origin de la va repetida en este caso id, anteponer el nombre a la var id (tw resume tweets)
SELECT tw.id, tweet, handle, tw.created_at 
FROM users, tweets tw  /* acá se indica que tw corresponde a tweets*/
WHERE 
     users.id = tw.user_id
     AND tw.created_at<'2005-02-01 00:00:00';
     
     
/*SELECT count (*)
FROM users, tweets tw
WHERE users.id=tw.users_id
       AND tw.created_at<'2005-02-01 00:00:00*/
       
SELECT 
tw.id, tweet, handle, tw.created_at 
AS fecha_tweet
FROM 
   users JOIN tweets tw ON users.id = tw.user_id
WHERE 
    tw.created_at<'2005-02-01 00:00:00';


SELECT 
tw.id, tweet, handle, tw.created_at 
AS fecha  -- lo que mostraré (se crea esta col)
FROM 
   users JOIN tweets tw ON users.id = tw.user_id
WHERE 
    tw.created_at<'2005-02-01 00:00:00';  -- condición se refleja en la variable creada
    
    
SELECT uA.id, uA.first_name, f.follower_id,
	   uB.id, uB.first_name
FROM 
      users uA
      JOIN follows f ON f.followed_id = uA.id
      JOIN users uB ON  f.follower_id=uB.id  -- esto sería como otra tabla
;


SELECT uA.id, concat(uA.first_name, ' ', uA.last_name) AS followed,
	   uB.id, concat(uB.first_name, ' ', uB.last_name) AS follower
FROM 
      users uA
      JOIN follows f ON f.followed_id = uA.id
      JOIN users uB ON  f.follower_id=uB.id  -- esto sería como otra tabla
;
-- count
SELECT uA.id, concat(uA.first_name, ' ', uA.last_name) AS person,
	   count(uB.id) AS s
FROM 
      users uA
      JOIN follows f ON f.followed_id = uA.id
      JOIN users uB ON  f.follower_id=uB.id  
GROUP BY
     uA.id
;

-- Dar preferencia al lado izquierdo
SELECT *
FROM
    users
    LEFT JOIN tweets ON tweets.user_id =users.id;
    
SELECT *
FROM
    users
    LEFT JOIN tweets ON tweets.user_id =users.id;

SELECT count(id) FROM tweets;  -- Contar id de tabla tweets

SELECT AVG(user_id) FROM tweets;  -- Promedio de user_id de tabla tweets

SELECT SUM(user_id) FROM tweets;  -- Suma de user_id de tabla tweets


