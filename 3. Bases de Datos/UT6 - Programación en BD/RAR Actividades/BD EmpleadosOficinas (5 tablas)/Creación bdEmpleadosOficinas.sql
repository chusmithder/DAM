-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: bdEmpleadosOficinas
-- Source Schemata: bdEmpleadosOficinas
-- Created: Mon Jan 18 13:32:54 2021
-- Workbench Version: 8.0.20
-- ----------------------------------------------------------------------------
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
