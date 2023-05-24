-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: empleadosoficinas
-- ------------------------------------------------------
-- Server version	8.0.22
use bdEmpleadosOficinas;
--
-- Dumping data for table `clientes`
--
SET FOREIGN_KEY_CHECKS = 0;
LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2101,'Luis Garcia Anton','106',65000),(2102,'Alvaro Rodriguez','101',65000),(2105,'Antonio Canales','101',45000),(2106,'Juan Suarez','102',65000),(2107,'Julian Lopez','110',35000),(2108,'Julia Antequera','109',55000),(2109,'Alberto Juanes','103',25000),(2111,'Cristobal Garcia','103',50000),(2112,'Maria Silva','108',50000),(2113,'Luis Maron','104',20000),(2114,'Cristini Bulini','102',20000),(2115,'Vicente Martinez','101',20000),(2117,'Carlos Tena','106',35000),(2118,'Junipero Alvarez','108',60000),(2119,'Salomon Bueno','109',25000),(2120,'Juan Malo','102',50000),(2121,'Vicente Rios','103',45000),(2123,'Jose Libros','102',40000),(2124,'Juan Bolto','107',40000);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('101','Antonio Viger',45,12,'Representante','1986-10-20','104',300000,305000),('102','Alvaro Jaumes',48,21,'Representante','1986-12-10','108',350000,474000),('103','Juan Rovira',29,12,'Representante','1987-03-01','104',275000,286000),('105','Vicente Pantal',37,13,'Representante','1998-02-12','104',350000,368000),('106','Luis Antonio',52,11,'Dir General','1988-06-14','104',275000,299000),('107','Jorge Gutierrez',49,22,'Representante','1988-11-14','108',300000,186000),('108','Ana Bustamante',62,21,'Dir Ventas','1989-10-12','106',350000,362100),('109','Maria Suta',31,11,'Representante','1999-10-12','106',300000,392000),('110','Juan Victor',41,NULL,'Repesentante','1990-01-13','104',0,76000);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `oficinas`
--

LOCK TABLES `oficinas` WRITE;
/*!40000 ALTER TABLE `oficinas` DISABLE KEYS */;
INSERT INTO `oficinas` VALUES (11,'Valencia','Este','106',575000,693000),(12,'Alicante','Este','104',800000,735000),(13,'Castellon','Este','105',350000,368000),(21,'Badajoz','Oeste','108',725000,836000),(22,'A Coruña','Oeste','108',300000,186000),(23,'Madrid','Centro','108',NULL,NULL),(24,'Madrid','Centro','108',250000,150000),(26,'Pamplona','Norte',NULL,NULL,NULL),(28,'Valencia','Este',NULL,900000,NULL),(30,'Madrid','centro',NULL,100000,NULL),(40,'Madrid','centro',NULL,100000,0);
/*!40000 ALTER TABLE `oficinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'110036','1997-01-02',2107,'110','aci','4100z',9,2250.0000),(2,'110036','1997-01-02',2117,'106','rei','2a44l',7,31500.0000),(4,'112968','1990-01-11',2102,'101','aci','41004',34,3978.0000),(5,'112975','1997-02-11',2111,'103','rei','2a44g',6,2100.0000),(6,'112979','1989-10-12',2114,'108','aci','4100z',6,15000.0000),(9,'112989','1997-12-10',2101,'106','fea','114',6,1458.0000),(10,'112992','1990-04-15',2118,'108','aci','41002',10,760.0000),(11,'112993','1997-03-10',2106,'102','rei','2a45c',24,1896.0000),(12,'112997','1997-07-04',2124,'107','bic','41003',1,652.0000),(13,'113003','1997-02-05',2108,'109','imm','779c',3,5625.0000),(14,'113007','1997-01-01',2112,'108','imm','773c',3,2925.0000),(15,'113012','1997-05-05',2111,'105','aci','41003',35,3745.0000),(16,'113013','1997-08-06',2118,'108','bic','41003',1,652.0000),(17,'113024','1997-07-04',2114,'108','qsa','xk47',20,7100.0000),(19,'113034','1997-11-05',2107,'110','rei','2a45c',8,632.0000),(20,'113042','1997-01-01',2113,'101','rei','2a44r',5,22500.0000),(21,'113045','1997-07-02',2112,'108','rei','2a44r',10,45000.0000),(22,'113048','1997-02-02',2120,'102','imm','779c',2,3750.0000),(23,'113049','1997-04-04',2118,'108','qsa','xk47',2,776.0000),(24,'113051','1997-07-06',2118,'108','qsa','xk47',4,1420.0000),(25,'113055','2009-04-01',2108,'101','aci','4100x',6,150.0000),(26,'113057','1997-11-01',2111,'103','aci','4100x',24,600.0000),(27,'113058','1989-07-04',2108,'109','fea','112',10,1480.0000),(28,'113062','1997-07-04',2124,'107','bic','41003',10,2430.0000),(29,'113065','1997-06-03',2106,'102','qsa','xk47',6,2130.0000),(30,'113069','1997-08-01',2109,'107','imm','773c',22,31350.0000),(31,'114070','2009-03-15',2124,'107','ACI','41001',50,12340.0000);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('aci','41001','Arandela',58,277),('aci','41002','Bisagra',80,167),('aci','41003','Art t3',112,207),('aci','41004','Art t4',123,139),('aci','4100x','Junta',26,37),('aci','4100y','Extractor',2888,25),('aci','4100z','Mont',2625,28),('bic','41003','Manivela',652,3),('bic','41009','Rodamiento',225,78),('bic','41672','Plato',180,NULL),('fea','112','Cubo',148,115),('fea','114','Cubo',243,15),('imm','773c','Reostato',975,28),('imm','775c','Reostato2',1425,5),('imm','779c','Reostato3',1875,NULL),('imm','887h','Caja Cablos',54,223),('imm','887p','Perno',25,24),('imm','887x','Manivela',475,32),('qsa','xk47','Red',355,38),('qsa','xk48','Red',134,203),('qsa','xk48a','Red',117,37),('rei','2a44g','Pas',350,14),('rei','2a44l','Bomba l',4500,12),('rei','2a44r','Bomba r',4500,12),('rei','2a45c','Junta',79,210);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS = 1;
-- Dump completed on 2021-01-18 14:04:04
