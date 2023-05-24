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


-- Consultas sobre mas de una tabla...
-- cuando queremos obtener informacion de mas de una tabla hay que incluir dichas tablas en la clausula from
-- las relacionaremos por un campo en comun (normalmente clave principal - clave ajena)
-- utilizando where o inner join

/*
-- error (producto cartesiano)
select nomcur, nomp
	from cursillos, profesores;

-- con where:
select codcur, nomcur, profesores.codp, nomp
	from cursillos, profesores
	where cursillos.codp = profesores.codp;

-- con inner join:
select codcur, nomcur, cursillos.codp, nomp
	from cursillos
    inner join profesores on cursillos.codp = profesores.codp;

-- nosotros usaremos esta ultima sintaxis (join) para hacer las combinaciones de tablas
-- en el caso que alguno de los campos de la combinacion este indexado es mas eficiente INNER JOIN
-- cuando dos campos de diferentes tablas se llaman igual hay que indicar a cual nos referimos poniendo
	-- el nombre de la tabla antes del nombre del campo separados por un punto
-- podemos usar alias para los nombres de las tablas en el FROM

select c.codcur, c.nomcur, c.codp, p.nomp
	from cursillos c
    inner join profesores p;


-- Eemplos con WHERE y con INNER JOIN
-- (1)

-- con where
select nomal, nomcur, nota
	from alumnos, cursillos, alumnoscursillos
    where (alumnos.codal = alumnoscursillos.codal) and (cursillos.codcur = alumnoscursillos.codcur);

-- con inner join
select a.nomal, c.nomcur, ac.nota
	from alumnos a
    inner join alumnoscursillos ac on a.codal = ac.codal
    inner join cursillos c on c.codcur = ac.codcur;

-- (2)
-- where
select a.nomal, c.nomcur, p.nomp, ac.nota
	from alumnoscursillos ac, alumnos a, cursillos c, profesores p
    where (ac.codal = a.codal) and (ac.codcur = c.codcur) and (c.codp = p.codp);

-- inner join
select a.nomal, c.nomcur, p.nomp, ac.nota
	from alumnos a
    inner join alumnoscursillos ac on a.codal = ac.codal
    inner join cursillos c on ac.codcur = c.codcur
    inner join profesores p on c.codp = p.codp;

-- (3)


select a.nomal, c.nomcur, p.nomp, ac.nota
	from alumnos a
    inner join alumnoscursillos ac on a.codal = ac.codal
    inner join cursillos c on ac.codcur = c.codcur
    inner join profesores p on c.codp = p.codp
    where month(c.fecha) = 3;

-- CONSULTAS DE AGRUPACION MULTITABLA
	-- la clausula group by en la sentencia select permite agrupar filas producto del from
	-- (o del from con where) por algun campo/s de la tabla, y hacer calculos sobre otro/s campos.

-- CLAUSULA GROUP BY EN CONSULTAS MULTITABLA
	-- (4)

select a.codal, avg(ac.nota)
	from alumnoscursillos ac
    inner join alumnos a on ac.codal = a.codal
	where a.diral like "%La Ermita%"
    group by ac.codal;


-- (5) Visualizar cada nombre de cursillo de aquellos que comiencen por H con el número de 
-- alumnos apuntados.
select c.nomcur, count(*) as "cuantos"
	from alumnoscursillos ac
    inner join cursillos c on ac.codcur = c.codcur
    where c.nomcur like "H%"
    group by c.nomcur;

-- (6) Ejercicio: Visualizar cada nombre de cursillo con el número de alumnos apuntados.
select c.nomcur, count(*)
	from alumnoscursillos ac
    inner join cursillos c on ac.codcur = c.codcur
	group by c.nomcur;

-- clausula having en consultas multitabla
-- asi como el where permite retener las filas de from que cumplen una determinada condicion, la clausula 
	-- having permite, si la condicion asociada es cierta, retener las filas del group by previamente realizado.

-- (7) Visualizar el código de aquellos alumnos cuya dirección contiene ‘C/’ con su nota media 
-- siempre que esa nota media sea mayor o igual a 8. 

(select codal, avg(nota)
	from alumnoscursillos
	where codal in 
				(select codal
					from alumnos
                    where diral like "%C/%")
	group by codal
    having avg(nota) >= 8);


-- con join
select ac.codal, avg(ac.nota)
	from alumnoscursillos ac
    inner join alumnos a on ac.codal = a.codal
    where a.diral like "%C/%"
    group by ac.codal
    having avg(ac.nota) >= 8;

-- (8) Visualizar el código de aquellos alumnos cuya dirección contiene ‘C/’ con su nota media 
-- siempre que esa nota media sea mayor o igual a LA NOTA MEDIA DE TODOS LOS ALUMNOS.
-- solo con subconsultas ...
(select codal, avg(nota)
	from alumnoscursillos
    where codal in 
				(select codal
					from alumnos
                    where diral like "%C/%")
	group by codal
    having avg(nota) >= 
					(select avg(nota)
						from alumnoscursillos));

-- con join
select ac.codal, avg(nota)
	from alumnoscursillos ac
    inner join alumnos a on ac.codal = a.codal
	where a.diral like "%C/%"
    group by ac.codal
	having avg(nota) >= 
				(select avg(nota)
					from alumnoscursillos);
*/
select * from alumnoscursillos;
select * from alumnos;
select * from cursillos;
select * from profesores;
-- Visualizar cada nombre de cursillo de aquellos que comiencen por H y que tengan más de 
-- un alumno apuntado. 
-- con joins...
select c.nomcur, count(*)
	from alumnoscursillos ac
    inner join cursillos c on ac.codcur = c.codcur
    where c.nomcur like "H%"
    group by c.nomcur
    having count(*) > 1;

-- LEFT JOIN y RIGTH JOIN...
-- cuando trabajamos con mas de una tabla
-- a veces es interesante visualizar todas las filas de una tabña y de aquellas filas que tengan su 
-- correspondiente campo en comun con la otra tabla, que se visualicen las filas correspondientes
-- de esa segunda tabla. Eso se hace con las clausulas LEFT JOIN o RIGTH JOIN

-- ejemplo: queremos visualilzar la informacion de todos los alumnos, pero de aquellos alumnos que
-- esten apuntados a cursillos, que tambien se visualice el codigo de los cursillos y la nota
select a.*, ac.codcur, ac.nota
	from alumnos a
    left join alumnoscursillos ac on ac.codal = a.codal;

select a.*, count(ac.codcur) as "numero de cursos"
	from alumnos a
    left join alumnoscursillos ac on ac.codal = a.codal
    group by a.codal;



