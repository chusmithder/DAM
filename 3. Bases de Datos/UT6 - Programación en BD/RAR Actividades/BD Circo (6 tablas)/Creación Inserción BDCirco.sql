DROP DATABASE IF EXISTS `bdCirco`;
CREATE DATABASE IF NOT EXISTS `bdCirco`;
USE `bdCirco`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 172.20.0.2    Database: CIRCO
-- ------------------------------------------------------
-- Server version	8.0.18

--
-- Table structure for table `ANIMALES`
--
set foreign_key_checks = 0;
DROP TABLE IF EXISTS `ANIMALES`;
CREATE TABLE `ANIMALES` (
  `nombre` varchar(50)  NOT NULL,
  `tipo` varchar(9)  NOT NULL,
  `anhos` tinyint(3) unsigned DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `estatura` float DEFAULT NULL,
  `nombre_atraccion` varchar(50)  DEFAULT NULL,
  `nombre_pista` varchar(50)  DEFAULT NULL,
  PRIMARY KEY (`nombre`),
  KEY `fk_ANIMALES_ATRACCIONES1_idx` (`nombre_atraccion`),
  KEY `fk_ANIMALES_PISTAS1_idx` (`nombre_pista`),
  CONSTRAINT `fk_ANIMALES_ATRACCIONES1` FOREIGN KEY (`nombre_atraccion`) REFERENCES `ATRACCIONES` (`nombre`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ANIMALES_PISTAS1` FOREIGN KEY (`nombre_pista`) REFERENCES `PISTAS` (`nombre`) ON UPDATE CASCADE,
  CONSTRAINT `ch_tipoAnimal` CHECK ((`tipo` in (_utf8mb4'León',_utf8mb4'Cocodrilo',_utf8mb4'Jirafa',_utf8mb4'Mono')))
) ENGINE=InnoDB ;


--
-- Dumping data for table `ANIMALES`
--
INSERT INTO `ANIMALES` VALUES ('Berni','León',1,94,13.9,'El gran carnívoro','LATERAL2'),('Caiman','Cocodrilo',1,71,14.1,'El gran carnívoro','LATERAL2'),('Frank','Jirafa',3,146,15.14,'Las jirafas','SUPER'),('Jazinto','Mono',13,NULL,NULL,NULL,NULL),('Leo','León',3,121,14.1,'El gran felino','SUPER'),('Lucas','Cocodrilo',2,120.34,NULL,NULL,'LATERAL2'),('Peter','Mono',1,30,10.7,NULL,NULL),('Princesa1','Jirafa',2,100,12.2,'Las jirafas','LATERAL1'),('Princesa2','Jirafa',3,110,12.3,'Las jirafas','LATERAL1');


-- Table structure for table `ANIMALES_ARTISTAS`
--
DROP TABLE IF EXISTS `ANIMALES_ARTISTAS`;
CREATE TABLE `ANIMALES_ARTISTAS` (
  `nombre_animal` varchar(50)  NOT NULL,
  `nif_artista` char(9)  NOT NULL,
  PRIMARY KEY (`nombre_animal`,`nif_artista`),
  KEY `fk_ANIMALES_has_ARTISTAS_ARTISTAS1_idx` (`nif_artista`),
  KEY `fk_ANIMALES_has_ARTISTAS_ANIMALES1_idx` (`nombre_animal`),
  CONSTRAINT `fk_ANIMALES_has_ARTISTAS_ANIMALES1` FOREIGN KEY (`nombre_animal`) REFERENCES `ANIMALES` (`nombre`),
  CONSTRAINT `fk_ANIMALES_has_ARTISTAS_ARTISTAS1` FOREIGN KEY (`nif_artista`) REFERENCES `ARTISTAS` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB ;


--
-- Dumping data for table `ANIMALES_ARTISTAS`
--
INSERT INTO `ANIMALES_ARTISTAS` VALUES ('Caiman','11111111A'),('Jazinto','11111111A'),('Leo','11111111A'),('Princesa1','11111111A'),('Caiman','22222222B'),('Princesa2','22222222B'),('Leo','44444444D'),('Berni','71111111A'),('Frank','71111111A'),('Lucas','71111111A'),('Peter','71111111A');

--
-- Table structure for table `ARTISTAS`
--

DROP TABLE IF EXISTS `ARTISTAS`;
CREATE TABLE `ARTISTAS` (
  `nif` char(9)  NOT NULL,
  `apellidos` varchar(100)  NOT NULL,
  `nombre` varchar(45)  NOT NULL,
  `nif_jefe` char(9)  DEFAULT NULL,
  PRIMARY KEY (`nif`),
  KEY `fk_ARTISTAS_JEFEARTISTAS_idx` (`nif_jefe`),
  CONSTRAINT `fk_ARTISTAS_JEFEARTISTAS` FOREIGN KEY (`nif_jefe`) REFERENCES `ARTISTAS` (`nif`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ck_nifArtistas` CHECK ((char_length(`nif`) = 9))
) ENGINE=InnoDB ;

--
-- Dumping data for table `ARTISTAS`
--
INSERT INTO `ARTISTAS` VALUES ('00000000A','Sanchez','Dragó','11111111A'),('11111111A','Lopez','Juan','88888888F'),('12345678A','San Juan','Pedro',NULL),('22222222B','Sanchez','Luis',NULL),('33333333C','Perez','Carlos','22222222B'),('44444444D','Lopez','Juan','22222222B'),('71111111A','Ruperez Santo','Gabriel',NULL),('85555555E','Sanchez Graz','Luis',NULL),('88888888F','Fernandez Ramirez','Julio',NULL);



--
-- Table structure for table `ATRACCIONES`
--
DROP TABLE IF EXISTS `ATRACCIONES`;
CREATE TABLE `ATRACCIONES` (
  `nombre` varchar(50)  NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `ganancias` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB ;

--
-- Dumping data for table `ATRACCIONES`
--
INSERT INTO `ATRACCIONES` VALUES ('El gran carnívoro','2001-04-01',43012.00),('El gran felino','1999-11-01',63021.00),('El orangután',NULL,0.00),('La espectacular','2018-01-01',0.00),('Las jirafas','2000-04-02',46035.00);


--
-- Table structure for table `ATRACCIONES_ARTISTAS`
--
DROP TABLE IF EXISTS `ATRACCIONES_ARTISTAS`;
CREATE TABLE `ATRACCIONES_ARTISTAS` (
  `nombre_atraccion` varchar(50)  NOT NULL,
  `nif_artista` char(9)  NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`nombre_atraccion`,`nif_artista`,`fecha_inicio`),
  KEY `fk_ATRACCIONES_has_ARTISTAS_ARTISTAS1_idx` (`nif_artista`),
  KEY `fk_ATRACCIONES_has_ARTISTAS_ATRACCIONES1_idx` (`nombre_atraccion`),
  CONSTRAINT `fk_ATRACCIONES_has_ARTISTAS_ARTISTAS1` FOREIGN KEY (`nif_artista`) REFERENCES `ARTISTAS` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ATRACCIONES_has_ARTISTAS_ATRACCIONES1` FOREIGN KEY (`nombre_atraccion`) REFERENCES `ATRACCIONES` (`nombre`) ON UPDATE CASCADE
) ENGINE=InnoDB ;

--
-- Dumping data for table `ATRACCIONES_ARTISTAS`
--
INSERT INTO `ATRACCIONES_ARTISTAS` VALUES ('El gran carnívoro','33333333C','2000-03-04','2000-05-01'),('El gran carnívoro','33333333C','2001-04-01',NULL),('El gran carnívoro','44444444D','2020-03-19',NULL),('El gran carnívoro','71111111A','2020-03-19',NULL),('El gran carnívoro','85555555E','2020-03-19',NULL),('El gran carnívoro','88888888F','2020-03-19',NULL),('El gran felino','11111111A','2000-01-01','2000-03-01'),('El gran felino','22222222B','1999-01-11',NULL),('Las jirafas','11111111A','2000-04-01',NULL),('Las jirafas','22222222B','2000-08-05',NULL),('Las jirafas','33333333C','2000-07-05',NULL);


--
-- Table structure for table `ATRACCION_DIA`
--

DROP TABLE IF EXISTS `ATRACCION_DIA`;
CREATE TABLE `ATRACCION_DIA` (
  `nombre_atraccion` varchar(50)  NOT NULL,
  `fecha` date NOT NULL,
  `num_espectadores` smallint(5) unsigned DEFAULT NULL,
  `ganancias` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`nombre_atraccion`,`fecha`),
  CONSTRAINT `fk_ATRACCIONDIA_ATRACC` FOREIGN KEY (`nombre_atraccion`) REFERENCES `ATRACCIONES` (`nombre`) ON UPDATE CASCADE,
  CONSTRAINT `ck_NumEspect` CHECK ((`num_espectadores` > 50))
) ENGINE=InnoDB ;

--
-- Dumping data for table `ATRACCION_DIA`
--
INSERT INTO `ATRACCION_DIA` VALUES ('El gran carnívoro','2001-04-01',400,43012.00),('El gran felino','1999-11-01',100,11121.00),('El gran felino','2000-01-01',240,21000.00),('El gran felino','2000-04-01',340,31000.00),('Las jirafas','2000-04-01',120,15030.00),('Las jirafas','2000-08-01',333,31000.00);


--
-- Table structure for table `PISTAS`
--

DROP TABLE IF EXISTS `PISTAS`;
CREATE TABLE `PISTAS` (
  `nombre` varchar(50)  NOT NULL,
  `aforo` smallint(6) NOT NULL CHECK (aforo<=1000 AND aforo >=0),
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB ;


--
-- Dumping data for table `PISTAS`
--
INSERT INTO `PISTAS` VALUES ('LATERAL1',300),('La grande',350),('LATERAL2',550),('SUPER',1000);


set foreign_key_checks = 1;


-- Dump completed on 2020-04-05 13:41:43
