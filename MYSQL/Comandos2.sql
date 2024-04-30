SELECT * FROM twitter.users order by id asc; -- Selección en orden ascencente

/*insert into table_name (column_name1, column_name1, column_name3)
values ('column1_value' , 'column2_value','column3_value');*/

-- Insertar información a las columnas de a una tabla (users)
INSERT INTO twitter.users(first_name, last_name, handle, birthday, created_at)
VALUES ('juan','calderon', 'jcalderon', '1983-03-03', '2011-07-01 00:00:01'),
('juan','calderon', 'jcalderon', '1983-03-03', '2011-07-01 00:00:01'),
('juan','calderon', 'jcalderon', '1983-03-03', '2011-07-01 00:00:01'),
('juan','calderon', 'jcalderon', '1983-03-03', '2011-07-01 00:00:01'),
('juan','calderon', 'jcalderon', '1983-03-03', '2011-07-01 00:00:01');

/*('UPDATE table_name SET column_name1 = 'some_value', column_name2='another_value' WHERE condition(s)')*/

-- Subir información a una o varias columnas de acuerdo a una condición
UPDATE  twitter.users SET
first_name='Camilo',
last_name='Romero',
handle='cromero'
WHERE
  id =14;
  
-- Subir información a una o varias columnas con una función (now())
UPDATE  twitter.users SET
updated_at = NOW();  /* siempre agregar el where  si se quiere discriminar entre registros*/

-- Subir información a una o varias columnas con una condición que considere valores null
UPDATE  twitter.users SET
updated_at = NOW()
WHERE updated_at IS null;

-- Subir información a una o varias columnas con una condición que consideré un rango
UPDATE  twitter.users SET
updated_at = NOW()
WHERE id >3 AND id <6;


/*DELETE FROM table_name WHERE condition(s)*/
DELETE FROM twitter.users WHERE updated_at IS null; -- Borrar usuarios cuya columna updated_at sea = null


--                                   Funciones

-- concat
SELECT id, handle, birthday,
     concat(first_name,' ', last_name) AS full_name  -- AS es la columna nueva donde se mostrará lo seleccioando en concat
	FROM users; 
-- 
select id, handle, birthday,
     concat(' ',first_name,' ', last_name) AS full_name
	FROM users; 

-- lenght
SELECT length(first_name) AS len,  -- largo de first_name
upper(concat(first_name, ' yolo' )) AS NAME  -- first_mame + YOLO
FROM users;

-- now() y rand()
SELECT year (now()) AS year , rand () AS num; -- Selecciona el año actual y un número random

-- curdate()
SELECT curdate() , rand () AS num; -- Selecciona fecha actual

SELECT date_format(now(), "%M %d %Y");  -- selecciona la fecha de hoy en formato mes día año

USE twitter; -- Con esto todas las consultas estan en ese contexto
