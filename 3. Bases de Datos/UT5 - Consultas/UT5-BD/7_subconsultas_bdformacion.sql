drop DATABASE  IF EXISTS bdformacion;
create database bdformacion;
USE bdformacion;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bdformacion
-- ------------------------------------------------------
-- Server version	8.0.22


--
-- Table structure for table departamentos
--

DROP TABLE IF EXISTS departamentos;
CREATE TABLE departamentos (
  CODDEP varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  NOMDEP varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PLANTA int NOT NULL,
  PRIMARY KEY (CODDEP),
  UNIQUE KEY UQ__DEPARTAM__E4B97BF0469A5AAB (NOMDEP)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



--
-- Table structure for table profesores
--

DROP TABLE IF EXISTS profesores;
CREATE TABLE profesores (
  CODP varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  NOMP varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  NIVEL varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  FECCONTRATO date NOT NULL,
  SALARIO decimal(10,2) DEFAULT NULL,
  CODDEP varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (CODP),
  UNIQUE KEY UQ__PROFESOR__E2AB1FFB07CAFBA2 (NOMP),
  KEY fk_dep (CODDEP),
  CONSTRAINT fk_dep FOREIGN KEY (CODDEP) REFERENCES departamentos (CODDEP) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table alumnos
--

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
    CODAL VARCHAR(2)CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI NOT NULL,
    NOMAL VARCHAR(25)CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI NOT NULL,
    DIRAL VARCHAR(25)CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI NOT NULL,
    POB VARCHAR(25)CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI NOT NULL,
    PRIMARY KEY (CODAL),
    UNIQUE KEY uq_dir (DIRAL)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;

--
-- Table structure for table cursillos
--

DROP TABLE IF EXISTS cursillos;
CREATE TABLE cursillos (
  CODCUR varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  NOMCUR varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  NUMHORAS int NOT NULL,
  FECHA date NOT NULL,
  CODP varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (CODCUR),
  UNIQUE KEY UQ__CURSILLO__E4F8FFEF214ABFE0 (NOMCUR),
  KEY FK__CURSILLOS__CODP__2B3F6F97 (CODP),
  CONSTRAINT FK__CURSILLOS__CODP__2B3F6F97 FOREIGN KEY (CODP) REFERENCES profesores (CODP) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table alumnoscursillos
--

DROP TABLE IF EXISTS alumnoscursillos;
CREATE TABLE alumnoscursillos (
  CODAL varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  CODCUR varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  NOTA decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (CODAL,CODCUR),
  KEY fk_cur (CODCUR),
  CONSTRAINT fk_al FOREIGN KEY (CODAL) REFERENCES alumnos (CODAL) ON UPDATE CASCADE,
  CONSTRAINT fk_cur FOREIGN KEY (CODCUR) REFERENCES cursillos (CODCUR) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES departamentos WRITE;
/*!40000 ALTER TABLE departamentos DISABLE KEYS */;
INSERT INTO departamentos VALUES ('D1','INFORMÁTICA',1),('D2','ADMNISTRATIVO',2);
/*!40000 ALTER TABLE departamentos ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table profesores
--

LOCK TABLES profesores WRITE;
/*!40000 ALTER TABLE profesores DISABLE KEYS */;
INSERT INTO profesores VALUES ('P1','Patricia Pérez','A','2008-10-05',1500.00,'D1'),('P2','Paula Puerta','B','2010-03-19',1300.00,'D2'),('P3','Peio Pagoaga','A','2011-10-25',1000.00,'D1');
/*!40000 ALTER TABLE profesores ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table alumnos
--

LOCK TABLES alumnos WRITE;
/*!40000 ALTER TABLE alumnos DISABLE KEYS */;
INSERT INTO alumnos VALUES ('A1','Antonio Antúnez','C/La Ermita 3','Pamplona'),('A2','Ane Aranburu','Avda. Central 5','Barañáin'),('A3','Amalia Naya','C/Magdalena s/n','Pamplona'),('A4','Antonio García Pérez','Astilleros 3','Valencia'),('A5','Carlos Pérez Ruiz','Magallanes 21','Utiel'),('A6','José Navarro Lard','Río Segura 14','Valencia'),('A7','Elisa Ébeda Sansón','Valencia 4','Sagunto'),('A8','Eva San Martín','Villafranca 34','Alzira'),('A9','Alfredo Hernández Luis','Salinas 8','Valencia');
/*!40000 ALTER TABLE alumnos ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table cursillos
--

LOCK TABLES cursillos WRITE;
/*!40000 ALTER TABLE cursillos DISABLE KEYS */;
INSERT INTO cursillos VALUES ('C1','SO',300,'2016-04-24','P1'),('C2','HW',150,'2016-03-21','P3'),('C3','HTML',200,'2015-11-12','P1'),('C4','CONTABILIDAD',200,'2015-12-12','P2'),('C5','FOL',200,'2015-12-12','P2'),('C6','ASBD',150,'2016-10-23','P3');
/*!40000 ALTER TABLE cursillos ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table alumnoscursillos
--

LOCK TABLES alumnoscursillos WRITE;
/*!40000 ALTER TABLE alumnoscursillos DISABLE KEYS */;
INSERT INTO alumnoscursillos VALUES ('A1','C1',9.0),('A2','C2',8.0),('A3','C1',9.0),('A3','C2',9.0);
/*!40000 ALTER TABLE alumnoscursillos ENABLE KEYS */;
UNLOCK TABLES;

-- -------------------------------
select * from alumnos;
select * from cursillos;
select * from alumnoscursillos;
select * from profesores;
select * from departamentos;
-- -------------------------------
/*
-- SUBCONSULTAS
-- una subconsulta es una sentencia select que se incluye dentro de otra sentencia select(que llamamos principal),
-- en la condicion del WHERE o HAVING
-- La reformulacion:
	-- cuando trabajamos con subconsultas muchas veces debemos reformular el texto del enunciado para resolver 
		-- de maneras distintas una consulta
	-- ejemplo: "queremos el alumno cuyo nota es igual a la nota maxima" es lo mismo que decir "queremos el alumno
    -- cuya es mayor o igual a todas las notas"
    -- aunque ambas reformulaciones nos muestran el mismo resultado, se resuelven de manera distinta

-- "nombre del alumno cuya nota es igual a la nota maxima"
select distinct a.nomal
	from alumnos a
    inner join alumnoscursillos ac on a.codal = ac.codal
    where ac.nota = 
				(select max(nota)
					from alumnoscursillos);

-- queremos el alumno cuya nota es mayor o igual a todas las notas
select distinct a.nomal
	from alumnos a
    inner join alumnoscursillos ac on a.codal = ac.codal
    where ac.nota >= all 
				(select nota
						from alumnoscursillos);

-- subconsultas basicas

-- Visualizar el código de cada alumno, código de cursillo y nota siempre que dicha nota sea 
-- mayor que la media de notas de todos los alumnos en todos los cursillos. 
-- En este caso hay que comparar cada nota de cada alumno con un valor (nota media) que 
-- desconocemos previamente; utilizaremos una subconsulta para calcular ese valor y luego 
-- se compara cada nota de cada alumno (de la SELECT principal) con dicho valor.
select codal, codcur, nota
	from alumnoscursillos
    where nota > 
			(select avg(nota)
				from alumnoscursillos);

-- Subconsultas ANY / ALL e IN / NOT IN  
-- a veces necesitamos que la subconsulta devuelva un CONJUNTO DE VALORES, en este caso utilizaremos los 
-- operadores ALL / ANY combinados con =, <,... y tambien los operadores IN y NOT IN


-- 2. Visualizar los nombres de los alumnos que no están apuntados a ningún cursillo: 
-- NOT IN - ref: nombres de los alumnos cuyo codigo no esta en la tabla cursillos
select nomal
	from alumnos
    where codal not in 
					(select codal 
						from alumnoscursillos);
-- ALL - ref: nombres de alumnos cuyo codigo es diferente a todos los codigos de alumnoscursillos
select nomal
	from alumnos
	where codal != all
					(select codal
						from alumnoscursillos);
-- joins

select a.nomal
	from alumnos a
    left join alumnoscursillos ac on a.codal = ac.codal
	where ac.codal is null;


-- 3. Visualizar el nombre y nivel de aquellos profesores que imparten cursillos que comiencen con h
-- con joins
select p.nomp, p.nivel
	from profesores p
	inner join cursillos c on p.codp = c.codp
	where c.nomcur like "H%";
-- con IN
-- ref: nombre y nivel de profesores cuyo codp esta en la columna codp de los cursillos que empiezan por h
select nomp, nivel
	from profesores
    where codp in
			(select codp
				from cursillos
                where nomcur like "H%");

-- con any
-- ref: nom y nivel de profesores cuya clave sea igual a algun valor de la columna codp
-- de los cursillos que empiezan por h
select nomp, nivel
	from profesores
    where codp = any 
				(select codp
					from cursillos
                    where nomcur like "H%");

-- 4. Visualizar el código de los alumnos, de los cursillos y la nota siempre que ésta sea mayor 
-- que todas las notas después de restarles 0.5.
-- 1 subconsulta: notas depues de restarles 0.5
select nota - 0.5
	from alumnoscursillos;


select *
	from alumnoscursillos
	where nota > all 
				(select nota - 0.5
					from alumnoscursillos);

-- 5. Visualizar el nombre aquellos alumnos matriculados en un solo cursillo y cuya nota es 
-- menor que alguna de las demás notas.
-- correcto, solo con subconsultas
select codal
	from alumnoscursillos
    group by codal
    having count(*) = 1;

select codal
	from alumnoscursillos
    where nota < any 
			(select nota
				from alumnoscursillos);


(select nomal
	from alumnos
    where codal in
			(select codal
				from alumnoscursillos
                where nota < any 
							(select nota
								from alumnoscursillos))
		and codal in 
			(select codal 
				from alumnoscursillos
                group by codal
                having count(codcur) = 1)  );

-- error: con join
(select a.nomal
	from alumnos a
    inner join alumnoscursillos ac on a.codal = ac.codal
	where ac.nota < any 
					(select nota
						from alumnoscursillos)
	group by nomal
	having count(*) = 1);

-- SUBCONSULTAS CORRELACIONADAS
-- se denomina asi a la subconsulta, cuando es necesario ejecutar la subconsulta enlazando 
-- con algun valor de cada fila de la columna principal

-- cuando para ejecutar una subconsulta se necesita algun valor de cada fila de la consulta principal

-- 6. Visualizar el nombre, sueldo y código de departamento de los profesores con un sueldo 
-- mayor o igual que la media del sueldo de su departamento.

-- ref: datos de los profesores cuyo sueldo sea mayor a la media de sueldos de los profesores
-- que tienen el mismo coddep que el
select nomp, salario, coddep
	from profesores p1
	where salario >= 
				(select avg(salario)
					from profesores p2
                    where p2.coddep = p1.coddep);

-- 7. Visualizar el código, nombre y salario máximo en cada departamento junto con el nombre
-- del profesor que lo cobra.
(select d.coddep, d.nomdep, p.salario, nomp
	from profesores p
    inner join departamentos d on p.coddep = d.coddep);
-- nomp es el problema, ya que hay 2 o mas por cada coddep
(select d.coddep, d.nomdep, max(p.salario), p.nomp
	from profesores p
    inner join departamentos d on p.coddep = d.coddep
    group by d.coddep, d.nomdep);-- , p.nomp;
    
-- refo: quiero el nombre del profesor, salario, codigo y nombre del departamento de los profesores
-- cuyo salario coincide con el maximo salario de los profesores que tienen el mismo coddep que el
select d.coddep, d.nomdep, p.salario, p.nomp
	from profesores p
    inner join departamentos d on p.coddep = d.coddep
    where p.salario = 
				(select max(p2.salario)
					from profesores p2
                    where p2.coddep = p.coddep);
    
-- por cada fila de la select principal se ejecuta la subconsulta eligiendo las filas de la subconsulta
-- que coincidan en valor con algun campo de la fila de la select principal que se esta examinando.
-- Es decir por cada fila-profesor se comprobara que su sueldo coincida con el sueldo maximo de los profesores
-- con un codigo de departamento igual al suyo (del mismo departamento)

-- Predicado EXISTS y consultas correlacionadas
	-- el predicado exists devuelve true si la subconsulta devuelve alguna fila de resultados, 
		-- false en otro caso contrario
	-- not exists devuelve true si la subconsnulta no devuelve ningun resultado
	-- este predicado es interesante cuando no nos interesan los datos concretos devueltos por la
		-- subconsulta sino solo si la subconsulta devuelve filas de datos o no.
	-- este predicado es usado frecuentemente en subconsultas correlacionadas para verificar si un valor
		-- recuperado por la consulta principal existe o no en el conjunto de resultados obtenidos por la
        -- subconsulta
	-- si la subconsulta obtiene al menos una fila, el operador obtiene el valor verdadero si no falso
	-- el predicado not exists verifica si un valor recuperado por la consulta principal no existe en el 
		-- conjunto de resultados obtenidos por la subconsulta

-- 8. Visualizar los nombres de los alumnos que no están apuntados a ningún cursillo (la hemos 
-- realizado antes con NOT IN), la hacemos ahora con EXISTS.
-- con not in: nombres de alumnos cuyo codigo no esta en la tabla alumnoscursillos
select nomal, codal
	from alumnos
    where codal not in 
				(select codal
					from alumnoscursillos);
-- con exists: quiero los alumnos para los cuales NO EXISTA ninguna matricula en alumnoscursillos con
-- su codigo de alumno
select a.nomal
	from alumnos a
    where not exists (select *
						from alumnoscursillos ac
                        where ac.codal = a.codal);
-- si la subconsulta no devuelve datos (en el caso de los 6 alumnos que no cuyo codigo no aparece en alter
-- alumnoscursillos) el predicado not exists se hace cierto y entonces se visualiza su nombre
*/
-- 9. Visualizar toda la información de aquellos departamentos que tengan algún profesor de 
-- nivel ‘A’. (La consulta deberá visualizar el departamento D1 que es el único que tiene 
-- algún profesor de nivel ‘A’)

select distinct d.*
	from profesores p
	inner join departamentos d on p.coddep = d.coddep
    where p.nivel = "A";

select d.*
	from departamentos d
    where d.coddep in (select coddep
						from profesores p
						where p.nivel = "A");
                        
-- con exists (correlacionada)
select d.*
	from departamentos d
    where exists 
			(select *
				from profesores p
                where p.nivel = "A" and p.coddep = d.coddep);