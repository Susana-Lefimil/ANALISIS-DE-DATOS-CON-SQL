-- Qué consulta ejecutarías para obtener todos los tweets del ID de usuario 1?

SELECT *
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;

-- Tu puedes obtener los tweets por:

SELECT tweets.tweet
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;

-- O cambie el nombre de la columna de salida que desea como kobe_tweets modificando la declaración para que se vea así:
SELECT tweets.tweet as kobe_tweets
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 1;

-- . Qué consulta devolvería todos los tweets que el usuario con id 2 ha etiquetado como favoritos?
SELECT first_name, tweet
FROM users
LEFT JOIN faves
ON users.id = faves.user_id
LEFT JOIN tweets
ON faves.tweet_id = tweets.id
WHERE users.id = 2;

-- Qué consulta ejecutaría para obtener todos los tweets que el usuario con id 2 o el usuario con id 1 ha etiquetado como favoritos?
SELECT first_name, tweet
FROM users
LEFT JOIN faves
ON users.id = faves.user_id
LEFT JOIN tweets
ON faves.tweet_id = tweets.id
WHERE users.id = 1 OR users.id = 2;

-- Qué consulta ejecutarías para obtener todos los usuarios que siguen al usuario con el ID 1?
SELECT users.first_name as followed, users2.first_name as follower
FROM users
LEFT JOIN follows
ON users.id = follows.followed_id
LEFT JOIN users as users2
ON users2.id = follows.follower_id
WHERE users.id = 1;

 -- Qué consulta ejecutaría para obtener todos los usuarios que no siguen al usuario con un ID de 2?
SELECT *
FROM users
WHERE users.id NOT IN (
SELECT follower_id
FROM follows
WHERE followed_id = 2
) AND users.id != 2;

-- Podemos ejecutar funciones en columnas específicas y, a menudo, se combina con la instrucción GROUP BY. Tendremos mucha práctica con funciones en la siguiente pestaña.
SELECT users.first_name as user, COUNT(users2.first_name) as follower_count
FROM users
LEFT JOIN follows
ON users.id = follows.followed_id
LEFT JOIN users as users2
ON users2.id = follows.follower_id
GROUP BY users.id;

/*Left Join vs. Join*/

SELECT first_name, tweet
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id;

SELECT first_name, tweet
FROM users
JOIN tweets
ON users.id = tweets.user_id;

