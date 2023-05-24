drop database if exists tarea;
create database tarea;
use tarea;


-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------
UNLOCK TABLES;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema bdEmpleadosOficinas
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `bdEmpleadosOficinas` ;
CREATE SCHEMA IF NOT EXISTS `bdEmpleadosOficinas` ;

-- ----------------------------------------------------------------------------
-- Table bdEmpleadosOficinas.Productos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdEmpleadosOficinas`.`Productos` (
  `Idfab` VARCHAR(3) CHARACTER SET 'utf8mb4' NOT NULL,
  `Idproducto` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Descripcion` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Precio` INT NOT NULL,
  `Existencias` INT NULL,
  PRIMARY KEY (`Idfab`, `Idproducto`));

-- ----------------------------------------------------------------------------
-- Table bdEmpleadosOficinas.Oficinas
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdEmpleadosOficinas`.`Oficinas` (
  `Oficina` INT NOT NULL,
  `Ciudad` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Region` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Dir` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `Objetivo` INT NULL,
  `Ventas` INT NULL,
  PRIMARY KEY (`Oficina`),
  CONSTRAINT `FK_Oficinas_Empleados`
    FOREIGN KEY (`Dir`)
    REFERENCES `bdEmpleadosOficinas`.`Empleados` (`Numemp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table bdEmpleadosOficinas.Pedidos
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdEmpleadosOficinas`.`Pedidos` (
  `Codigo` INT NOT NULL,
  `Numpedido` LONGTEXT CHARACTER SET 'utf8mb4' NOT NULL,
  `Fechapedido` DATE NOT NULL,
  `Clie` INT NOT NULL,
  `Rep` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Fab` VARCHAR(3) CHARACTER SET 'utf8mb4' NOT NULL,
  `Producto` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Cant` INT NOT NULL,
  `Importe` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`Codigo`),
  CONSTRAINT `FK_Pedidos_Clientes`
    FOREIGN KEY (`Clie`)
    REFERENCES `bdEmpleadosOficinas`.`Clientes` (`Numclie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pedidos_Productos`
    FOREIGN KEY (`Fab` , `Producto`)
    REFERENCES `bdEmpleadosOficinas`.`Productos` (`Idfab` , `Idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pedidos_Empleados`
    FOREIGN KEY (`Rep`)
    REFERENCES `bdEmpleadosOficinas`.`Empleados` (`Numemp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table bdEmpleadosOficinas.Empleados
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdEmpleadosOficinas`.`Empleados` (
  `Numemp` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Nombre` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Edad` INT NOT NULL,
  `Oficina` INT NULL,
  `Titulo` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Contrato` DATE NOT NULL,
  `Jefe` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `Cuota` INT NOT NULL,
  `Ventas` INT NOT NULL,
  PRIMARY KEY (`Numemp`),
  INDEX `IX_Empleados` (`Oficina` ASC) VISIBLE,
  CONSTRAINT `FK_Empleados_Empleados`
    FOREIGN KEY (`Jefe`)
    REFERENCES `bdEmpleadosOficinas`.`Empleados` (`Numemp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Empleados_Oficinas`
    FOREIGN KEY (`Oficina`)
    REFERENCES `bdEmpleadosOficinas`.`Oficinas` (`Oficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table bdEmpleadosOficinas.Clientes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdEmpleadosOficinas`.`Clientes` (
  `Numclie` INT NOT NULL,
  `Nombre` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Repclie` VARCHAR(50) CHARACTER SET 'utf8mb4' NOT NULL,
  `Limitecredito` INT NOT NULL,
  PRIMARY KEY (`Numclie`),
  CONSTRAINT `FK_Clientes_Empleados1`
    FOREIGN KEY (`Repclie`)
    REFERENCES `bdEmpleadosOficinas`.`Empleados` (`Numemp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
SET FOREIGN_KEY_CHECKS = 1;




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
-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------






-- ---------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------


set foreign_key_checks = 0;
-- Inserción de valores en la tabla CENTROS:
insert into CENTROS values (10,  'SEDE CENTRAL', 'C. ALCALA 820, MADRID');
insert into CENTROS values (20,  'RELACION CON CLIENTES', 'C. ATOCHA 405, MADRID');

-- Inserción de valores en la tabla DEPARTAMENTOS:
insert into DEPARTAMENTOS values (100, 10, 260, 'P', 12000, null, 'DIRECCION GENERAL');
insert into DEPARTAMENTOS values (110, 20, 180, 'P', 15000, 100, 'DIRECC. COMERCIAL');
insert into DEPARTAMENTOS values (111, 20, 180, 'F', 11000, 110, 'SECTOR INDUSTRIAL');
insert into DEPARTAMENTOS values (112, 20, 270, 'P', 9000, 100, 'SECTOR SERVICIOS');
insert into DEPARTAMENTOS values (120, 10, 150, 'F', 30000, 100, 'ORGANIZACION');
insert into DEPARTAMENTOS values (121, 10, 150, 'P', 20000, 120, 'PERSONAL');
insert into DEPARTAMENTOS values (122, 10, 350, 'P', 60000, 120, 'PROCESO DE DATOS');
insert into DEPARTAMENTOS values (130, 10, 310, 'P', 20000, 100, 'FINANZAS');

-- Inserción de valores en la tabla EMPLEADOS:
insert into EMPLEADOS values (110, 121, 350, '1939-10-10', '1950-2-10', 1310, 0, 3, 'PONS', 'CESAR', 'PRESIDENTE', null);
insert into EMPLEADOS values (120, 112, 840, '1935-6-9', '1968-10-1', 1350, 110, 1, 'LASA', 'MARIO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (130, 112, 810, '1945-11-9', '1969-2-1', 1290, 110, 2, 'TEROL', 'LUCIANO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (150, 121, 340, '1930-8-10', '1948-1-15', 1440, 0, 0, 'PEREZ', 'JULIO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (160, 111, 740, '1939-7-9', '1968-11-11', 1310, 110, 2, 'AGUIRRE', 'AUREO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (180, 110, 508, '1934-10-18', '1956-3-18', 1480, 50,  2, 'PEREZ', 'MARCOS', 'JEFESECTOR', 110);
insert into EMPLEADOS values (190, 121, 350, '1932-5-12', '1962-2-11', 1300, 0, 4, 'VEIGA', 'JULIANA', 'VENDEDOR', 130);
insert into EMPLEADOS values (210, 100, 200, '1940-9-28', '1959-1-22', 1380, 0, 2, 'GALVEZ', 'PILAR', 'VENDEDOR', 130);
insert into EMPLEADOS values (240, 111, 760, '1942-2-26', '1966-2-24', 1280, 100, 3, 'SANZ', 'LAVINIA', 'VENDEDOR', 120);
insert into EMPLEADOS values (250, 100, 250, '1946-10-27', '1967-3-1', 1450, 0, 0, 'ALBA', 'ADRIANA', 'VENDEDOR', 120);
insert into EMPLEADOS values (260, 100, 220, '1943-12-3', '1968-7-12', 1720, 0, 6, 'LOPEZ', 'ANTONIO', 'VENDEDOR', 150);
insert into EMPLEADOS values (270, 112, 800, '1945-5-21', '1966-9-10', 1380, 80, 3, 'GARCIA', 'OCTAVIO', 'VENDEDOR', 150);
insert into EMPLEADOS values (280, 130, 410, '1948-1-11', '1971-10-8', 1290, 0, 5, 'FLOR', 'DOROTEA', 'VENDEDOR', 150);
insert into EMPLEADOS values (285, 122, 620, '1949-10-25', '1968-2-15', 1380, 0, 0, 'POLO', 'OTILIA', 'VENDEDOR', 160);
insert into EMPLEADOS values (290, 120, 910, '1947-10-30', '1968-2-14', 1270, 0, 3, 'GIL', 'GLORIA', 'VENDEDOR', 180);
insert into EMPLEADOS values (310, 130, 480, '1946-10-21', '1971-1-15', 1420, 0, 0, 'GARCIA', 'AUGUSTO', 'VENDEDOR', 180);
insert into EMPLEADOS values (320, 122, 620, '1957-12-25', '1978-2-5', 1405, 0, 2, 'SANZ', 'CORNELIO', 'ANALISTA', 180);
insert into EMPLEADOS values (330, 112, 850, '1948-8-19', '1972-3-1', 1280, 90, 0, 'DIEZ', 'AMELIA', 'ANALISTA', 180);
insert into EMPLEADOS values (350, 122, 610, '1949-4-13', '1984-9-10', 1450, 0, 1, 'CAMPS', 'AURELIO', 'ANALISTA', 180);
insert into EMPLEADOS values (360, 111, 750, '1958-10-29', '1968-10-10', 1250, 100, 2, 'LARA', 'DORINDA', 'ANALISTA', 160);
insert into EMPLEADOS values (370, 121, 360, '1967-6-22', '1987-1-20', 1190, 0, 1, 'RUIZ', 'FABIOLA', 'EMPLEADO', 320);
insert into EMPLEADOS values (380, 112, 880, '1968-3-30', '1988-1-1', 1180, 0, 0, 'MARTIN', 'MICAELA', 'EMPLEADO', 320);
insert into EMPLEADOS values (390, 110, 500, '1966-2-19', '1986-10-8', 1215, 0, 1, 'MORAN', 'CARMEN', 'EMPLEADO', 320);
insert into EMPLEADOS values (400, 111, 780, '1969-8-18', '1987-11-1', 1185, 0, 0, 'LARA', 'LUCRECIA', 'EMPLEADO', 320);
insert into EMPLEADOS values (410, 122, 660, '1968-7-14', '1988-10-13', 1175, 0, 0, 'MUÑOZ', 'AZUCENA', 'EMPLEADO', 320);
insert into EMPLEADOS values (420, 130, 450, '1966-10-22', '1988-10-19', 1400, 0, 0, 'FIERRO', 'CLAUDIA', 'EMPLEADO', 330);
insert into EMPLEADOS values (430, 122, 650, '1967-10-26', '1988-11-19', 1210, 0, 1, 'MORA', 'VALERIANA', 'EMPLEADO', 330);
insert into EMPLEADOS values (440, 111, 760, '1966-9-27', '1986-2-28', 1210, 100, 0, 'DURAN', 'LIVIA', 'EMPLEADO', 350);
insert into EMPLEADOS values (450, 112, 880, '1966-10-21', '1986-2-28', 1210, 100, 0, 'PEREZ', 'SABINA', 'EMPLEADO', 350);
insert into EMPLEADOS values (480, 111, 760, '1965-4-4', '1986-2-28', 1210, 100, 1, 'PINO', 'DIANA', 'EMPLEADO', 350);
insert into EMPLEADOS values (490, 112, 880, '1964-6-6', '1988-1-1', 1180, 100, 0, 'TORRES', 'HORACIO', 'EMPLEADO', 360);
insert into EMPLEADOS values (500, 111, 750, '1965-10-8', '1987-1-1', 1200, 100, 0, 'VAZQUEZ', 'HONORIA', 'EMPLEADO', 360);
insert into EMPLEADOS values (510, 110, 550, '1966-5-4', '1986-11-1', 1200, 0, 1, 'CAMPOS', 'ROMULO', 'EMPLEADO', 360);
insert into EMPLEADOS values (550, 111, 780, '1970-1-10', '1988-1-21', 1100, 120, 0, 'SANTOS', 'SANCHO', 'EMPLEADO', 360);

set foreign_key_checks = 1;

