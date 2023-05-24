/******************************
***  EMPRESA - CURSORES   ***
*******************************/

-- Crea un procedimiento denominado 'revisarSalarios' que actualice el salario de todos los empleados según su oficio
-- de acuerdo a las siguientes reglas:
-- * JEFESECTOR: incrementar 5% el salario
-- * VENDEDOR: incrementar 2% el salario
-- * ANALISTA: incrementar 7% el salario
-- * EMPLEADO: incrementar 1% el salario
-- Usa un cursor que recorra TODOS los empleados y que vaya actualizando, uno a uno, cada empleado según su oficio.

USE `bdEmpresa`;

DELIMITER $$
DROP procedure IF EXISTS `revisarSalarios` $$
CREATE PROCEDURE `revisarSalarios` ()
BEGIN
-- Declaramos las variables necesarias
	DECLARE varCodEmpleado integer;
	DECLARE varOficio varchar(15);
    DECLARE varPorcentaje float DEFAULT 1; -- Por si acaso no coincide con ningún oficio
    DECLARE fin boolean DEFAULT false;
    
    -- Declaramos el cursor con los campos necesarios de empleados para poder llevar a cabo el ejercicio
    DECLARE cur1 CURSOR FOR SELECT cod_empleado, oficio FROM empleados;
	
    -- Declaracion del manejador de errores 
    -- Si el cursor llega a su fin el valor de la variable pasara a ser true
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
    
	OPEN cur1;
    
    while not fin do
		-- Cogemos una a una las filas del cursor
		FETCH cur1 INTO varCodEmpleado, varOficio;
        
        -- Comparamos que tipo de oficio tiene el empleado y en funcion de ello asignarle un porcentaje
        IF varOficio = 'JEFESECTOR' THEN 
			SET varPorcentaje = 1.05;
		ELSEIF varOficio = 'VENDEDOR' THEN 
			SET varPorcentaje = 1.02;
		ELSEIF varOficio = 'ANALISTA' THEN 
			SET varPorcentaje = 1.07;
		ELSEIF varOficio = 'EMPLEADO' THEN 
			SET varPorcentaje = 1.01;
		END IF;
        -- Actualizamos la tabla empleados
        UPDATE empleados
        SET salario = salario * varPorcentaje
        WHERE cod_empleado=varCodEmpleado;
	END while;
-- Cerramos cursor
	CLOSE cur1;
END$$

DELIMITER ;

CALL revisarSalarios();

-- Crea un procedimiento denominado 'revisarPresupuestosCentro' que actualice el presupuesto de
-- todos los departamentos de un centro según el tipo de trabajadores que tiene siguiendo las siguientes reglas:
-- * 5000€ por cada JEFESECTOR
-- * 2500€ por cada ANALISTA
-- * 3000€ por cada VENDEDOR
-- * 1500€ por cada EMPLEADO

USE `bdEmpresa`;

DELIMITER $$
DROP procedure IF EXISTS `revisarPresupuestosCentro`$$
CREATE PROCEDURE `revisarPresupuestosCentro` (paramCentro integer)
BEGIN
	
    DECLARE varNumDepto integer;
    
    -- Ponemos el valor de las variables a cero para que en el caso de que no haya ningun empleado no le sume nada 
    -- al presupuesto del departamento
    DECLARE varJefesSector integer default 0;
    DECLARE varVendedores integer default 0;
    DECLARE varAnalistas integer default 0;
    DECLARE varEmpleados integer default 0;
    
	DECLARE fin boolean DEFAULT false;
    
    -- Buscamos los departamentos del centro que se recibe como paramentro (paramCentro)
    DECLARE cur1 CURSOR FOR SELECT num_departamento FROM departamentos WHERE num_centro = paramCentro;
	
    -- Declaracion del manejador de errores 
    -- Si el cursor llega a su fin el valor de la variable pasara a ser true
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
    
	OPEN cur1;
    
    while not fin do
		-- Vamos metiends en varnumdepto el valor de cada uno de los departamentos 
		FETCH cur1 INTO varNumDepto;
      
        -- Buscamos cuantos empleados hay de cada tipo del departamento actual (varNumDepto)
        SELECT COUNT(*) INTO varJefesSector FROM empleados WHERE num_departamento = varNumDepto AND oficio = 'JEFESECTOR';
        SELECT COUNT(*) INTO varVendedores FROM empleados WHERE num_departamento = varNumDepto AND oficio = 'VENDEDOR';
        SELECT COUNT(*) INTO varAnalistas FROM empleados WHERE num_departamento = varNumDepto AND oficio = 'ANALISTA';
        SELECT COUNT(*) INTO varEmpleados FROM empleados WHERE num_departamento = varNumDepto AND oficio = 'EMPLEADO';
        
        -- ACtualizamos el departamento actual (varNumDepto)
        UPDATE departamentos
        SET presupuesto = varJefesSector*5000 + varVendedores*3000 + varAnalistas*2500 + varEmpleados*1500
        WHERE num_departamento = varNumDepto;
	END while;

	CLOSE cur1;
    
END$$

DELIMITER ;

CALL revisarPresupuestosCentro (10);
drop  procedure revisarPresupuestosCentro;
select * from empleados where num_departamento=110;
select * from departamentos;

select * from departamentos;


-- Escribir un procedimiento que recorra la tabla empleados mostrando por cada empleado su edad.
-- Nota: Hacer uso para ello de la función ‘fn_edad’ anterior que calcula la edad a partir de una fecha de nacimiento.

SET GLOBAL log_bin_trust_function_creators = 1;

drop function if exists fn_edad ;
delimiter $$
create function fn_edad (fecha_nacimiento date)
returns int
begin
 declare edad int;
 -- Calculamos los años transcurridos entre la fecha de nacimiento y la fecha actual
 set edad= TIMESTAMPDIFF(YEAR, fecha_nacimiento,CURTIME());
 return edad;
end
$$ 
delimiter ;
drop procedure if exists muestraEdades;
delimiter $$
create procedure muestraEdades()
begin
	
    -- Variable para almacenar el mensaje que iremos construyendo
    declare texto varchar(5000) default '                      Nombres y edades de los empleados\n';
    -- Variable para almacenar el nombre de cada empleado
	declare nom varchar(100);
    -- Variable para almacenar el nombre de cada empleado
    declare fecha date;
    -- Variable que indicará que no quedan filas que cargar en el cursor
    declare fin boolean default false;
    -- Cursor que almacena la fecha de nacimiento de cada empleado
    declare cur1 cursor for select fecha_nacimiento, nombre from empleados;
    -- Declaracion del manejador de errores 
    -- Si el cursor llega a su fin el valor de la variable pasara a ser true
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
    -- Abrimos el cursor (ejecutmos la sentencia y la almacenamos el resultado en el cursor) 
    open cur1;
    -- Cargamos la primera fila
    fetch cur1 into fecha,nom;
    while not fin do -- Mientras la última carga haya sido existosa
        set texto = concat(texto,' Nombre: ', nom, '      Edad: ', fn_edad(fecha),' \n');
        -- Cargamos la siguiente fila
        fetch cur1 into fecha,nom;
    end while;
    -- Cerramos el cursor y mostramos el mensaje
    close cur1;
    select texto as Mensaje;
    end;
$$
delimiter ;
call muestraEdades();