
--Crear base de datos
CREATE DATABASE desafio2_luis_peña_1207; 

--Crear tabla y poblarla
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente VARCHAR);

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



-- 1. ¿Cuántos registros hay?

SELECT COUNT(*) AS TOTAL_REGISTROS
FROM INSCRITOS;


-- 2. ¿Cuántos inscritos hay en total?

SELECT SUM(cantidad) AS TOTAL_INSCRITOS
FROM INSCRITOS;


-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad? 
		-- HINT: ocupar subconsultas

SELECT *
FROM INSCRITOS
WHERE fecha in (SELECT fecha FROM INSCRITOS ORDER BY fecha limit 1);

		
-- 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

SELECT fecha, SUM(cantidad) as TOTAL_INSCRITOS
FROM INSCRITOS
GROUP BY fecha
ORDER BY fecha;


-- 5. ¿Cuántos inscritos hay por fuente?

SELECT fuente, SUM(cantidad) as total_inscritos
FROM INSCRITOS
GROUP BY fuente


-- 6. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

SELECT fecha, SUM(cantidad) as TOTAL_INSCRITOS
FROM INSCRITOS
GROUP BY fecha
ORDER BY TOTAL_INSCRITOS DESC
LIMIT 1


-- 7. ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
		-- HINT: si hay más de un registro, tomar el primero
	
	
SELECT fecha, SUM(cantidad) as total_inscritos
FROM INSCRITOS
WHERE fuente = 'Blog'
GROUP BY fecha
ORDER BY total_inscritos DESC
LIMIT 1
		
select * from inscritos

-- 8. ¿Cuántas personas en promedio se inscriben en un día?

SELECT SUM(cantidad)/COUNT(distinct fecha) as promedio_un_dia
FROM INSCRITOS

SELECT AVG(inscritos_por_dia) as promedio_un_dia
FROM (SELECT fecha, SUM(cantidad) AS inscritos_por_dia 
	  FROM inscritos 
	  GROUP BY fecha 
	  ORDER BY fecha
	 ) as a

-- 9. ¿Qué días se inscribieron más de 50 personas?

SELECT fecha, SUM(cantidad) as total_inscritos
FROM INSCRITOS
GROUP BY fecha
HAVING SUM(cantidad) > 50
ORDER BY fecha


-- 10. ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
		-- HINT: ingresa manualmente la fecha del tercer día

SELECT AVG(suma_inscritos) as promedio_inscritos
FROM (
	SELECT fecha, SUM(cantidad) suma_inscritos
	FROM INSCRITOS
	WHERE fecha >= '2021-03-01'
	GROUP BY fecha ) as a



