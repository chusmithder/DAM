-- Presentacion 4 - Subconsultas

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


-- Dump completed on 2021-01-24 18:12:10

/*
select * from alumnos;
select * from cursillos;
select * from alumnoscursillos;
select * from departamentos;
select * from profesores;
*/

-- SUBCONSULTAS BASICAS DE COMPARACION
-- 1
/*
select codal, codcur, nota
	from alumnoscursillos
    where nota > (select avg(nota)
					from alumnoscursillos);


-- SUBCONSULTAS BASICAS DE PERTENENCIA (IN / NOT IN)
-- (1)
select * from alumnos;

-- visualizar los alumnos que no estan apuntados a ningun cursillo
-- ref: visualizar alumnos cuyo codigo no esta en la tabla alumnoscursillos

select alumnos.nomal
	from alumnos
    where alumnos.codal not in
						(select alumnoscursillos.codal
							from alumnoscursillos);

-- se comprueba que un valor (codal - codigo de cada alumno) no esta entre varios valores
	-- (todos los codigos de los alumnos matriculados a algun curso)

-- (2)
select * from profesores;
select * from cursillos;

-- visualizar nombre y nivel de aquellos profesores que imparten cursos con h
-- ref: nombre y nivel de profesores cuyo codigo ESTA DENTRO De la columna codp
-- de los cursillos que empiezan por h

select nomp, nivel
	from profesores
    where codp in 
			(select codp
				from cursillos
                where nomcur like "H%");

-- se comprueba que un valor (codigo del profesor) esta entre varios valores (todos los codigos
	-- de los profesores que imparten cursos que empiezan con h)
    
-- SUBCONSULTAS BASICAS DE PERTENENCIA (ALL y ANY)
-- -----------------------------------------------
select * from alumnos;
select * from alumnoscursillos;

-- visualizar los alumnos que no estan matriculados a ningun curso
-- ref: visualizar alumnos cuyo codigo ES DIFERENTE A TODOS los codigos de alumnoscursilos
select nomal
	from alumnos
    where codal !=  
					(select codal
						from alumnoscursillos);

-- se comprueba que un valor (el codigo del alumno) es diferente a varios valores (todos
	-- los codigos de los alumnos matriculados a algun curso)

-- (3)
-- visualizar nombre y nivel de aquellos profesores que imparten cursos que empiecen por h
-- ref: nombre y nivel de profesores cuyo codigo es igual A ALGUN VALOR de la columna codp de los cursillos
	-- que empiezan por h
(select nomp, nivel
	from profesores
    where codp = any 
				(select codp
					from cursillos
                    where nomcur like "H%"));
-- se comprueba que un valor (cod cada profesor) es igual a alguno de vario valores (todos los codigos
	-- de los profesores que imparten cursos que empiezan por h) 


-- SUBCONSULTAS CORRELACIONADAS
-- ----------------------------
select * from profesores;
select * from departamentos;

-- seleccionar nombre, salario y codep de los profesores que tienen un salario superior o igual
	-- a la media del sueldo de su departamento

-- ref: datos de los profesores cuyo salario es mayor o igual a la media de los salarios de los 
	-- profesores que tienen el mismo coddep que el

select nomp, salario, coddep
	from profesores p1
	where p1.salario >= 
					(select avg(p2.salario)
						from profesores p2
						where p2.coddep = p1.coddep);
-- nos aseguramos que el sueldo de cada profesor es comparado con la media de salarios de profesores
	-- que pertenecen al mismo departamento

-- SUBCONSULTAS CON PREDICADO EXISTS
	-- exists devuelve true si la subconsulta devuelve alguna fila de resultados, falso si no devuelve ninguna.
	-- not exits devuelve true si la subconsulta no devuelve ninguna fila de resultados
	-- implica una consulta correlacionada

-- visualizar nombres de alumnos no matriculados a ningun cursillo.
-- ref: mostrar alumnos para los cuales no existan matriculas en alumnoscursillos con su codigo de alumno

select a.nomal
	from alumnos a
    where NOT EXISTS (select *
						from alumnoscursillos ac
                        where ac.codal = a.codal);
*/




