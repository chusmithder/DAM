------------------------------------------------------
------ Empresa - PROGRAMACION - Funciones-------------
------------------------------------------------------
-- set global log_bin_trust_function_creators = 1;

-- Crea una función que reciba una código de empleado y que calcule la 
-- diferencia de salario de un empleado con el salario medio de toda la empresa
-- Una vez creada, úsala para mostrar la lista de nombres y apellidos de empleados junto a su salario
-- y la diferencia con el salario medio.
USE bdEmpresa;

DELIMITER $$
DROP function IF EXISTS `fn_diferenciaSalario` $$
CREATE FUNCTION `fn_diferenciaSalario` (pCodEmpleado integer) 
											RETURNS decimal(5,2)
BEGIN
	DECLARE varMediaSalario float;
    DECLARE varSalario integer;
    -- Alamceno la media del salario todos los empleados
    SELECT AVG(salario) INTO varMediaSalario FROM empleados;
    -- Almaceno el salario del empleado pasado por parámetro
    SELECT salario INTO varSalario FROM empleados 
		WHERE cod_empleado = pCodEmpleado;
    -- Devuelvo la diferencia entre el salario y la media redondeado a dos decimales
    RETURN ROUND(varSalario - VarMediaSalario, 2);
END$$
DELIMITER ;

SELECT nombre, apellidos, salario, fn_diferenciaSalario(cod_empleado) 
FROM empleados
ORDER BY fn_diferenciaSalario(cod_empleado) DESC;

-- Crea una función 'tipoDirector' que reciba el codigo de un empleado y el numero de un departamento, y devuelva:
-- * El texto 'No es director' si no es director de ese departamento
-- * El texto 'Director en propiedad' si es director en propiedad (P) de ese departamento
-- * El texto 'Director en funciones' si es director en funciones (F) de ese departamento.
-- Una vez creada, úsala para mostrar el nombre, apellidos, oficio, departamento que dirigen (si no dirigen nunguno, mostrar valor nulo)
-- y el tipo de director que es (utiliza la funcion tipoDirector).

USE `bdEmpresa`;
DELIMITER $$
DROP function IF EXISTS `fn_tipoDirector` $$
CREATE FUNCTION `fn_tipoDirector`(pCodEmpleado integer, pDepto integer) RETURNS varchar(25)
BEGIN

	DECLARE varTipo varchar(1);
    DECLARE texto varchar(25) DEFAULT '';
    
    -- Buscamos el tipo de director que es el empleado introducido en el departamento introducido
    SELECT tipo_director INTO varTipo FROM departamentos 
    WHERE cod_director = pCodEmpleado AND num_departamento = pDepto;
    
    -- Si el empleado no es director del departamento, el valor de la variable varTipo estará vacío
    IF varTipo is null THEN
		SET texto = 'No es director';
	ELSEIF varTipo = 'P' THEN
		SET texto = 'Director en propiedad';
	ELSEIF varTipo = 'F' THEN
		SET texto = 'Director en funciones';
	END IF;

RETURN texto;
END$$

DELIMITER ;

SELECT e.nombre, e.apellidos, e.oficio, e.num_departamento, fn_tipoDirector(e.cod_empleado, e.num_departamento)
FROM empleados e;

-- Crea una función que calcule el presupuesto por empleado de un departamento.
-- presupuesto del departamento / numero de empleados 
-- Una vez creada, úsala para mostrar la lista de nombres de departamento junto a su presupuesto y
-- su presupuesto por empleado.

USE `bdEmpresa`;
DELIMITER $$
DROP function IF EXISTS `fn_presupuestoPorEmpleado`$$
CREATE FUNCTION `fn_presupuestoPorEmpleado` (pDepto integer)
RETURNS float
BEGIN
	DECLARE varPresupuesto integer;
    DECLARE varEmpleados integer;
    -- Obtengo el presupuesto del departamento
    SELECT presupuesto INTO varPresupuesto 
		FROM departamentos 
		WHERE num_departamento = pDepto;
    -- Obtengo el nº de empleados
    SELECT COUNT(*) INTO varEmpleados 
		FROM empleados 
			WHERE num_departamento = pDepto;
    
    -- OJO: Compruebo si tiene empleados para evitar el error de división por 0.
    IF varEmpleados > 0 THEN
        RETURN ROUND(varPresupuesto / varEmpleados, 2);
	ELSE
		RETURN 0;
	END IF;

END$$

DELIMITER ;

SELECT nombre, presupuesto, fn_presupuestoPorEmpleado(num_departamento) FROM departamentos;




