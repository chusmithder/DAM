-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: bdtrabajadoresedificios
-- ------------------------------------------------------
-- Server version	8.0.22

UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema bdTrabajadoresEdificios
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `bdTrabajadoresEdificios` ;
CREATE SCHEMA IF NOT EXISTS `bdTrabajadoresEdificios` ;
USE bdTrabajadoresEdificios;
--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion` (
  `ID_TRABAJADOR` smallint NOT NULL,
  `ID_EDIFICIO` smallint NOT NULL,
  `FECHA_INICIO` date NOT NULL,
  `NUM_DIAS` smallint NOT NULL,
  PRIMARY KEY (`ID_TRABAJADOR`,`ID_EDIFICIO`),
  KEY `fk_ed` (`ID_EDIFICIO`),
  CONSTRAINT `fk_ed` FOREIGN KEY (`ID_EDIFICIO`) REFERENCES `edificio` (`ID_EDIFICIO`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tr` FOREIGN KEY (`ID_TRABAJADOR`) REFERENCES `trabajador` (`ID_TRABAJADOR`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edificio` (
  `ID_EDIFICIO` smallint NOT NULL,
  `DIR_EDIFICIO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TIPO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Oficina',
  `NIVEL_CALIDAD` smallint NOT NULL,
  `CATEGORIA` smallint NOT NULL DEFAULT '1' CHECK (CATEGORIA >= 1 AND CATEGORIA <= 3),
  PRIMARY KEY (`ID_EDIFICIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `ID_TRABAJADOR` smallint NOT NULL,
  `NOM_TRABAJADOR` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TARIFA_HR` decimal(19,4) NOT NULL,
  `OFICIO` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_SUPV` smallint DEFAULT NULL,
  PRIMARY KEY (`ID_TRABAJADOR`),
  UNIQUE KEY `u__nomtrab` (`NOM_TRABAJADOR`),
  KEY `FK_TRABAJADOR_TRABAJADOR` (`ID_SUPV`),
  CONSTRAINT `FK_TRABAJADOR_TRABAJADOR` FOREIGN KEY (`ID_SUPV`) REFERENCES `trabajador` (`ID_TRABAJADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
-- Dump completed on 2021-01-18 14:53:56


UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS = 0;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (1235,312,'0010-00-16',5),(1235,515,'0017-00-16',22),(1311,435,'0008-00-16',12),(1311,460,'0023-00-16',24),(1412,111,'0001-00-16',4),(1412,210,'0015-00-16',12),(1412,312,'0001-00-16',10),(1412,435,'0015-00-16',15),(1412,460,'0008-00-16',18),(1412,515,'0005-00-16',8),(1520,312,'0030-00-16',17),(1520,515,'0009-00-16',14),(2920,210,'0010-00-16',15),(2920,435,'0028-00-16',10),(2920,460,'0005-00-16',18),(3001,111,'0008-00-16',14),(3001,210,'0027-00-16',14),(3231,111,'0010-00-16',8),(3231,312,'0024-00-16',20);
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (111,'1213 Aspen','Oficina',4,1),(210,'1011 Birch','Oficina',3,1),(312,'123 Elm','Oficina',2,2),(435,'456 Maple','Comercio',1,1),(460,'1415 Beech','Almacén',3,3),(515,'789 Oak','Residencia',3,1);
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
INSERT INTO `trabajador` VALUES (1235,'M Faraday',12.5000,'Electricista',1311),(1311,'C Coulomb',15.5000,'Electricista',1311),(1412,'C Nemo',13.7500,'Fontanero',1520),(1478,'L Dorado',8.4560,'Informático',1235),(1520,'H Rickover',11.7500,'Fontanero',1520),(2920,'R Garret',10.0000,'Albañil',2920),(3001,'J Barrister',8.2000,'Carpintero',3231),(3231,'P Mason',17.4000,'Carpintero',3231);
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS = 1;


