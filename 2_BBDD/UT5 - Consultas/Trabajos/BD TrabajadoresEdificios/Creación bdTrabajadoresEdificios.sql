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
