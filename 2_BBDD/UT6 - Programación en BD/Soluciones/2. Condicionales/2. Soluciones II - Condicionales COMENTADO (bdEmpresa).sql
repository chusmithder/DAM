/*************************************
***  bdEmpresa - CONDICIONALES *****
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL II*/

-- Crea un procedimiento llamado`insertaEmpleados´ para insertar empleados solo con el nombre, apellidos, oficio y departamento.
-- Según el oficio asignale un salario fijo: EMPLEADO (1200€), VENDEDOR (1250€), ANALISTA (1300€), JEFESECTOR (1400€) 
-- Asignales una comision fija de 0€.
-- Una vez creado, úsalo para insertar varios empleados con diferentes oficios. 
-- Para evitar errores por violación de clave ajena, debes comprobar si existe el departamento y, en ese caso, mostrar un mensaje. En caso de que se realice correctamente la inserción, informa de ello por pantalla.
-- Usa la construcción IF EXISTS (SELECT * FROM ….) THEN para comprobar si existe el departamento.
-- Pista: Para escoger el valor de la clave primaria a insertar puedes consultar el valor máximo de todos los valores de la clave primaria de la tabla para luego insertar ese valor incrementado en una unidad.
USE `bdEmpresa`;

-- Cambiar el delimitador
DELIMITER $$
-- Eliminar el procedimiento si existe
DROP procedure IF EXISTS `insertarEmpleado`$$
-- Crear el procedimiento insertarEmpleado
-- recibe como primer parametro de entrada el nombre como una cadena de 100 caracteres
-- recibe como segundo parametro de entrada los apellidos como una cadena de 100 caracteres
-- recibe como tercer parametro de entrada el oficio como una cadena de 10 caracteres
-- recibe como cuarto parametro de entrada el numero de departamente como un numero entero
CREATE PROCEDURE `insertarEmpleado` (pNombre varchar(100), pApellidos varchar(100), pOficio varchar(10), pDepto integer)
BEGIN
	-- Declaracion de variables
	DECLARE varSalario integer;
    DECLARE ultimoCodigoEmpleado integer;
    
    -- Comprueba si existe en la tabla el departamento pasado como parametro
    IF EXISTS (SELECT * FROM departamentos where `num_departamento`=pDepto) THEN
		-- Rellenamos la variable varSalario con el valor que corresponde según el tipo de oficio
		-- Si el oficio no es ninguno de los predefinidos, el valor del salario será NULL
		IF pOficio = 'EMPLEADO' THEN -- si el oficio pasado como parametro es "EMPLEADO" el salario es 1200
			SET varSalario = 1200;
		ELSEIF pOficio = 'VENDEDOR' THEN -- si el oficio pasado como parametro es "VENDEDOR" el salario es 1250
			SET varSalario = 1250;
		ELSEIF pOficio = 'ANALISTA' THEN -- si esl oficio pasado como parametro es "ANALISTA" el salario es 1300
			SET varSalario = 1300;
		ELSEIF pOficio = 'JEFESECTOR' THEN -- si el oficio pasado como parametro es "JEFESECTOR" el salario es 1400
			SET varSalario = 1400;
		ELSE -- si el oficio pasado como parametro no coincide con ninguno de los anteriores el salario es 0
			SET varSalario = 0;
		END IF;
		
		-- Guardamos el codigo de empleado mas alto
		SELECT max(cod_empleado) INTO ultimoCodigoEmpleado FROM empleados;
		
		-- Creamos un nuevo codigo de empleado que no exista sumandole 1 
		SET ultimoCodigoEmpleado = ultimoCodigoEmpleado + 1;

		-- Insertamos un empleado nuevo utilizando el codigo creado y los parametros recibidos (nombre, apellidos, oficio y deparamento)
		-- el salario que hemos calculado según su oficio y un valor fijo (0) para la comision
		INSERT INTO empleados (cod_empleado, num_departamento, salario, comision, apellidos, nombre, oficio)
			VALUES (ultimoCodigoEmpleado, pDepto, varSalario, 0, pApellidos, pNombre, pOficio);
		SELECT CONCAT('El empleado ', pNombre,' ', pApellidos,' se ha insertado con éxito con un salario de ',varSalario,'.') AS Mensaje;
	ELSE 
		SELECT CONCAT('El departamento ',pDepto,' que ha introducido no existe.\nNo se ha insertado el empleado') AS Mensaje;
    END IF;
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
CALL insertarEmpleado('Pepe', 'Sanz', 'VENDEDOR', 140);
CALL insertarEmpleado('Ana', 'Fernández', 'VENDEDOR', 130);
CALL insertarEmpleado('Laura', 'Roldán', 'JEFESECTOR', 130);

-- Crea un procedimiento llamado “modificaSalario” que reciba un código de empleado y modifique su salario. 
-- Si el empleado tiene oficio "PRESIDENTE", baja un 50% su salario. 
-- Si el empleado tiene oficio "JEFESECTOR", baja un 10% su salario. 
-- Si tiene oficio "VENDEDOR” sube un 10% su salario.
-- Si el empleado tiene oficio "EMPLEADO" aumenta un 20% su salario. 
-- Si el código de empleado no existe muestra un error y sino muestra el nuevo salario.
-- Cualquier otro dejará el sueldo igual.
-- Use la construcción CASE.
-- Usa la construcción IF paramCodEmp NOT IN (SELECT ...) THEN para comprobar si existe el departamento.
USE `bdEmpresa`;

-- Eliminar el procedimiento si existe
DROP procedure IF EXISTS `modificaSalario`;
-- Cambiar el delimitador
DELIMITER $$
-- Crear el procimiento modificaSalario
-- recibe como parametro de entrada el codigo de empleado como un numero entero
CREATE PROCEDURE `modificaSalario`(pCodEmpleado integer)
BEGIN
	-- Declaracion de variables
	DECLARE varOFicio varchar(15);
    DECLARE varNuevosalario int;
    
    -- Comprueba si el codigo de empleado pasado como parametro se encuentra en la tabla
    IF pCodEmpleado NOT IN (select cod_empleado from empleados) THEN
		SELECT 'El codigo de empleado introducido no es válido' AS Mensaje;
    ELSE
		-- Buscamos el oficio del empleado y lo guardamos en una variable
		SELECT oficio INTO varOficio FROM empleados WHERE cod_empleado = pCodEmpleado;
		
		-- Según el valor que hemos guardado en la variable varOficio hacemos una u otra cosa
        CASE varOficio
			WHEN 'JEFESECTOR' THEN -- Si el oficio del empleado es "JEFESECTOR" entonces su sueldo se recude al 90%
				UPDATE empleados
				SET salario = salario*0.9
				WHERE cod_empleado = pCodEmpleado;
			WHEN 'VENDEDOR' THEN -- Si el oficio del empleado es "VENDEDOR" entonces su sueldo se aumenta al 110%
				UPDATE empleados
				SET salario = salario*1.1
				WHERE cod_empleado = pCodEmpleado;
			WHEN 'EMPLEADO' THEN -- Si el oficio del empleado es "EMPLEADO" entonces su sueldo se aumenta al 120%
				UPDATE empleados
				SET salario = salario*1.2
				WHERE cod_empleado = pCodEmpleado;
            ELSE -- Si el oficio del empleado no coincide con ninguno de los anteriores se reduce el salario al 50%
				UPDATE empleados
				SET salario = salario*0.5
				WHERE cod_empleado = pCodEmpleado;
		END CASE;
		-- Muestra el nuevo salario del empleado pasado como parametro
        SELECT salario INTO varNuevoSalario FROM empleados WHERE cod_empleado = pCodEmpleado;
		SELECT CONCAT('El nuevo salario del empleado con codigo ',pCodEmpleado,' es ',varNuevoSalario,'€') AS Mensaje;
	END IF;
END$$
-- Devuelve el delimitador a su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
CALL modificaSalario(110);

-- Crea un procedimiento llamado “modificaSalario2” para modificar el salario de un empleado especificado en función del Nº de empleados que tiene a su cargo:
-- Si no tiene ningún empleado > la subida será 50€
-- Si tiene un empleado > la subida será 80€
-- Si tiene 2 empleados > la subida será de 100€
-- Si tiene 3 o más > la subida será 110€
-- Además, si es PRESIDENTE se incrementará otros 30€ más.
-- Usa la construcción CASE.
-- Usa la construcción IF paramCodEmp ¡= ALL (SELECT ...) THEN para comprobar si existe el departamento.
use bdempresa;

-- Eliminar el procedimiento si existe
DROP procedure IF EXISTS `modificaSalario2`;
-- Modificar el delimitador
delimiter $$
-- Crea el procedimiento modificaSalario2
-- recibe como parametro de entrada el codigo de empleado como un numero entero
create procedure modificaSalario2(cod integer)
begin
	-- Declaracion de variables
	declare num_emp integer;
    DECLARE varNuevosalario int;
    declare tipo varchar(1) default '0';
    -- Comprueba si el codigo de empleado pasado como parametro es de un director
    if not exists (select * from departamentos where cod_director=cod) then
		select  CONCAT ('El codigo ',cod,' no es de un director.') AS Mensaje;
	else
		-- Almacena el numero de empleados que tiene un director
		select count(*) INTO num_emp from empleados 
		where num_departamento in (select num_departamento 
								from departamentos 
                                where departamentos.cod_director=cod);
        case -- Comprueba el numero de empleados
			when num_emp = 0 then -- Si no tiene empleados se le aumenta el salario al director en 50
				update empleados set salario = salario + 50 where cod_empleado=cod;
			when num_emp = 1 then -- Si tiene 1 empleado se le aumenta el salario al director en 80
				update empleados set salario = salario + 80 where cod_empleado=cod;
			when num_emp = 2 then -- Si tiene 2 empleados se le aumenta el salario al director en 100
				update empleados set salario = salario + 100 where cod_empleado=cod;
             when num_emp > 2 then -- Si tiene más de 2 empleados
				update empleados set salario = salario + 110 where cod_empleado=cod;   
        end case;
        -- Muestra el nuevo salario del empleado pasado como parametro
        SELECT salario INTO varNuevoSalario FROM empleados WHERE cod_empleado = cod;
		SELECT CONCAT('El nuevo salario del empleado con código ',cod,' es ',varNuevoSalario,'€') AS Mensaje;
	end if;
end;
$$
-- Devuelve al delimitador su valor por defecto
delimiter ;

-- Llamadas al procedimiento
CALL modificaSalario2(180);

