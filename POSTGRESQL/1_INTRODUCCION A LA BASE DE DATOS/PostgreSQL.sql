-- Desafio 2
-- Crear y cargar Tabla
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- Ver Tabla
SELECT * FROM inscritos 

-- ¿Cuántos registros hay?
SELECT  COUNT(*) FROM inscritos;

-- ¿Cuántos inscritos hay en total?
SELECT  SUM(cantidad) FROM inscritos;

-- ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT  * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
-- HINT: ocupar subconsultas

-- ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)
SELECT fecha,  SUM(cantidad) FROM inscritos GROUP BY  fecha;

-- ¿Cuántos inscritos hay por fuente?
SELECT fuente,  SUM(cantidad) FROM inscritos GROUP BY fuente;

-- ¿Qué día se inscribió la mayor cantidad de personas? ¿Cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) FROM inscritos
GROUP BY  fecha 
ORDER BY Sum(cantidad) DESC
LIMIT 1;

-- ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog? ¿Cuántas personas fueron?
SELECT  fecha, cantidad, fuente FROM inscritos 
WHERE cantidad = (SELECT MAX(cantidad) FROM inscritos WHERE fuente= 'Blog') AND fuente= 'Blog';
-- HINT: si hay más de un registro, tomar el primero

-- ¿Cuál es el promedio de personas inscritas por día?
SELECT  fecha, AVG(cantidad) FROM inscritos GROUP BY fecha;

-- ¿Qué días se inscribieron más de 50 personas?
SELECT  fecha, SUM(cantidad) FROM inscritos GROUP BY fecha HAVING
SUM(cantidad) > 50;

-- ¿Cuál es el promedio general de personas inscritas a partir del tercer día?
SELECT AVG(cantidad) FROM inscritos 
WHERE fecha>='2021-01-03';

-- HINT: ingresa manualmente la fecha del tercer día