create database desafio3_Susana_Lefimil_999;

\c desafio3_susana_lefimil_999;

CREATE TABLE usuarios(
id serial,
email VARCHAR,
nombre VARCHAR,
apellido VARCHAR,
rol VARCHAR
);
INSERT INTO usuarios (email, nombre, apellido, rol)
VALUES ('correo1@gmail.com', 'nombre1', 'apellido1','usuario'),
('correo2@gmail.com', 'nombre2', 'apellido2','usuario'),
('correo3@gmail.com', 'nombre3', 'apellido2','usuario'),
('correo4@gmail.com', 'nombre4', 'apellido3','usuario'),
('correo5@gmail.com', 'nombre5', 'apellido4','administrador')
;


CREATE TABLE post(
id serial,
titulo VARCHAR,
contenido TEXT,
fecha_creacion TIMESTAMP,
fecha_actualizacion TIMESTAMP,
destacado BOOLEAN,
usuario_id BIGINT
);
INSERT INTO post (titulo, contenido,fecha_creacion,fecha_actualizacion, destacado, usuario_id)
VALUES ('titulo1', 'content_j','20-07-2023','21-07-2023', TRUE,5),
('titulo2', 'content_a','18-07-2023','21-07-2023', TRUE,5),
('titulo3', 'content_b','07-07-2023','10-07-2023', FALSE,4),
('titulo4', 'content_c','05-07-2023','15-07-2023', TRUE,1),
('titulo5', 'content_d','13-07-2023','25-07-2023', FALSE, NULL)
;

CREATE TABLE comentarios(
id serial,
contenido TEXT,
fecha_creacion TIMESTAMP,
usuario_id BIGINT,
post_id BIGINT
);
INSERT INTO comentarios (contenido,fecha_creacion,usuario_id, post_id)
VALUES ('cont_comentA', '20-07-2023',1,1),
('cont_comentB', '30-07-2023',2,1),
('cont_comentC', '26-07-2023',3,1),
('cont_comentD', '25-07-2023',1,2),
('cont_comentE', '28-07-2023',2,2)
;

SELECT * FROM usuarios;

SELECT * FROM post;

SELECT * FROM comentarios;

--Cruza los datos de la tabla usuarios y posts mostrando las siguientes columnas.
--nombre e email del usuario junto al título y contenido del post. (1 Punto)
SELECT usuarios.nombre, usuarios.email, post.titulo, post.contenido
FROM usuarios
LEFT JOIN post
ON usuarios.id = post.usuario_id
ORDER BY usuarios.id;
-- no se especifica, pero se decide usar LEFT join para cruzar el usuario con titulo y comentario que le corresponda
-- e incluir incluso aquellos que no tienen información en la tabla post


--Muestra el id, título y contenido de los posts de los administradores. El
--administrador puede ser cualquier id.
SELECT post.id, post.titulo, post.contenido
FROM usuarios
INNER JOIN post
ON usuarios.id = post.usuario_id
WHERE usuarios.rol='administrador';

--Cuenta la cantidad de posts de cada usuario. La tabla resultante debe mostrar el id
--e email del usuario junto con la cantidad de posts de cada usuario.
--INNER JOIN
SELECT usuarios.id , usuarios.email, COUNT(post.usuario_id)
FROM usuarios
INNER JOIN post
ON usuarios.id = post.usuario_id
GROUP BY usuarios.id , usuarios.email
ORDER BY usuarios.id;
--LEFT JOIN
SELECT usuarios.id , usuarios.email, COUNT(post.usuario_id)
FROM usuarios
LEFT JOIN post
ON usuarios.id = post.usuario_id
GROUP BY usuarios.id , usuarios.email
ORDER BY usuarios.id;
--RIGHT JOIN
SELECT usuarios.id , usuarios.email, COUNT(post.usuario_id)
FROM usuarios
RIGHT JOIN post
ON usuarios.id = post.usuario_id
GROUP BY usuarios.id , usuarios.email
ORDER BY usuarios.id;
--RESPUESTA: 
---INNER JOIN muestra solo los usuarios que tiene algún post, LEFT JOIN muestra todos los usuarios donde también
--- se pueden ver los que tienen cero post, debido a que toma todas las filas de la primera tabla (usuarios),
--- y finalmente RIGHT JOIN que toma todas las filas de segunda tabla (post) muestra todos los count de la columna
--- user_id. El cruce correcto dependería entonces de si estamos o no interesados en los usuarios que tienen 0 post,
--- Si queremos la información completa con respecto a los número de post de cada usuario, sería correcto usar LEFT JOIN
--- dejando la tabla usuario como primera tabla.



--Muestra el email del usuario que ha creado más posts. Aquí la tabla resultante tiene
--un único registro y muestra solo el email. (1 Punto)

SELECT usuarios.email
FROM usuarios
LEFT JOIN post
ON usuarios.id = post.usuario_id
GROUP BY usuarios.id , usuarios.email
ORDER BY COUNT(post.usuario_id) DESC
LIMIT 1;


--Muestra la fecha del último post de cada usuario.
SELECT usuarios.id, MAX(post.fecha_creacion)
FROM usuarios
LEFT JOIN post
ON usuarios.id = post.usuario_id
GROUP BY usuarios.id 
ORDER BY usuarios.id;


--Muestra el título y contenido del post (artículo) con más comentarios
SELECT post.titulo , post.contenido 
FROM post
LEFT JOIN comentarios
ON post.id = comentarios.post_id
GROUP BY post.titulo , post.contenido
ORDER BY COUNT(comentarios.post_id) DESC
LIMIT 1;


--Muestra en una tabla el título de cada post, el contenido de cada post y el contenido
--de cada comentario asociado a los posts mostrados, junto con el email del usuario
--que lo escribió.
SELECT post.titulo , post.contenido , comentarios.contenido, usuarios.email
FROM post
INNER JOIN comentarios
ON post.id = comentarios.post_id
LEFT JOIN usuarios
ON comentarios.usuario_id =usuarios.id;
--RESPUESTA: se usa un INNER JOIN para dejar solo aquellos post con contenido en la tabla comentarios y
--luego LEFT join para traer el correo de usuarios para todos los casos que cruzaron en la primera tabla.


--Muestra el contenido del último comentario de cada usuario
SELECT usuarios.id, comentarios.contenido, comentarios.fecha_creacion
FROM usuarios
LEFT JOIN comentarios
ON usuarios.id=comentarios.usuario_id
WHERE comentarios.fecha_creacion=(SELECT MAX(comentarios.fecha_creacion) 
								  FROM comentarios
								  WHERE comentarios.usuario_id=usuarios.id);


--Muestra los emails de los usuarios que no han escrito ningún comentario. 
SELECT usuarios.email, COUNT(comentarios.contenido) as Num_Comentarios
FROM usuarios
LEFT JOIN comentarios
ON usuarios.id=comentarios.usuario_id
GROUP BY usuarios.email
HAVING COUNT(comentarios.contenido) =0;

