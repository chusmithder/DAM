/**********************************
** UNIVERSIDAD - CONTROL ERRORES **
***********************************/

/* */
use bdUniversidad;

-- Elimina el procedimiento si ya existe
drop procedure if exists borra_tabla;
-- Cambia el delimitador por defecto
DELIMITER $$
-- Crea el procedimiento borra tabla
-- no recibe parametros de entrada
create procedure borra_tabla()
begin
	-- Declaracion del manejador de errores para el codigo 1051
    -- SQLSTATE '42S02'
    -- Tabla desconocida
    -- El manejador debe provocar la salida del procedimiento cuando sea llamado y haya terminado su ejecucion
	declare exit handler for 1051
    begin
		select "Has intentado eliminar una tabla que no existe y yo NOMBRE_ALUMNO APELLIDO_ALUMNO he evitado que lo hicieras." as Mensaje_error;
    end;
	drop table pruebaUniversidad;
    select "Tabla eliminada con exito" as Mensaje;
end;
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
call borra_tabla;


/* Realizar un procedimiento llamado inserta_profesor que debe permitir añadir un nuevo profesor en la tabla profesor, para ello hay que incluir su
identificador de profesor y su identificador de departamento. Si el profesor que se intentara insertar en la tabla ya estuviera en dicha tabla debe generar un
error 1062 o SQLSTATE 'S1009' o '23000' que debemos tratar saliendo del procedimiento y mostrando el siguiente mensaje:
"Has intentado insertar un profesor cuyo número ya existe"
Si el número de departamento pasado como parametro no existiera debería generar un error 1452 o SQLSTATE '23000' que debemos tratar saliento del procedimiento
y mostrando el siguiente mensaje:
	"La clave ajena que has probado no existe en la tabla correspondiente"
Si la inserción es correcta debe realizarla y, después, mostrar el siguiente mensaje:
	"Inserción realizada con éxito" */
use bdUniversidad;

-- Elimina el procedimiento si ya existe
drop procedure if exists inserta_profesor;
-- Cambia el delimitador por defecto
DELIMITER $$
-- Crea el procedimiento inserta_profesor
-- recibe como primer parametro de entrada el numero del profesor como un numero entero
-- recibe como segundo parametro de entrada el numero de departamento como un numero entero
create procedure inserta_profesor(in numpro int, numdpto int)
begin
	-- Declaracion del manejador de errores para el codigo de error 1062
    -- SQLSTATE 'S1009' o '23000'
    -- Clave primaria duplicada durante la insercion
    -- El manejador debe provocar la salida del procedimiento cuando sea llamado y haya terminado su ejecucion
	declare exit handler for 1062
    begin
		select "Estás intentando insertar un profesor cuyo número ya existe" as Mensaje_error;
    end;
    -- Declaracion del manejador de errores para el codigo de error 1452
    -- SQLSTATE '23000'
    -- Clave ajena no encontrada en la tabla origen durante la insercion
    -- El manejador debe provocar la salida del procedimiento cuando sea llamado y haya terminado su ejecucion
    declare exit handler for 1452
    begin
		select "La clave ajena que has probado no existe en la tabla departamentos" as Mensaje_error2;
	end;
	insert into profesor values (numpro, numdpto);
    select "Inserción realizada con éxito" as Mensaje;
end;
$$
DELIMITER ;

-- Llamadas al procedimiento
call inserta_profesor(14, 1);
call inserta_profesor(13, 12);
call inserta_profesor(9, 2);

/* Realizar un procedimiento llamado actualiza_asignatura que actualice todos los valores de una asignatura. Para ello se pasarán todos los valores de los
campos de la tabla (identificador, nombre, creditos, tipo, curso, cuatrimestre, idProfesor e idGrado). Si el tipo de la asignatura que se intenta actualizar 
no corresponde con los que están en el campo enumerado debe generar un error 1265 o SQLSTATE '01000' que debemos tratar saliendo del programa y mostrando el
siguiente mensaje:
	'Has intentado actualizar con un tipo de asignatura que no existe, solo se permite "básica", "obligatoria" u "optativa"'
Si el identificador de profesor o el de grado pasado como parametro no existiera debería generar un error 1452 o SQLSTATE '23000' que debemos tratar saliento 
del procedimiento y mostrando el siguiente mensaje:
	"La clave ajena que has probado no existe en la tabla correspondiente"
Finalmente, si la actualización se realiza con éxito debe mostrar actualizar y mostrar el siguiente mensaje:
	"La actualización se ha realizado correctamente" */
use bdUniversidad;

-- Elimina el procedimiento si ya existe
drop procedure if exists actualiza_asignatura;

-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento actualiza_asignatura
-- recibe como primer parametro de entrada el identificador de la asignatura como un numero entero
-- su segundo parametro de entrada es el nombre de la asignatura como una cadena de 100 caracteres
-- su tercer parametro de entrada es el numero de creditos de la asignatura como un numero decimal
-- su cuarto parametro es el tipo de asignatura como una cadena de 20 caracteres
	-- los unicos valores permitidos en este campo son: "básica", "obligatoria" y "optativa"
-- su quinto parametro de entrada es el curso como un numero entero pequeño
-- su sexto parametro de entrada es el cuatrimestre como un numero entero pequeño
-- su septimo parametro de entrada es el identificador del profesor como un numero entero
	-- este campo es la clave ajena de la tabla y hace referencia a la tabla "profesor" dentro de la base de datos actual
-- su octavo parametro de entrada es el identificador de grado como un numero entero
	-- este campo es la clave ajena de la tabla y hace referencia a la tabla "grado" dentro de la base de datos actual
create procedure actualiza_asignatura(in idAsig int, in nombreAsig varchar(100), in creditosAsig float, in tipoAsig varchar(20), in cursoAsig tinyint,
									in cuatrimestreAsig tinyint, in idProfeAsig int, in idGradoAsig int)
begin
	-- Declaracion del manejador de errores para el codigo de error 1265
    -- SQLSTATE '01000'
    -- Dato truncado o no correcto
    -- El manejador debe provocar la salida del procedimiento cuando sea llamado y haya terminado su ejecucion
	declare exit handler for 1265
    begin
		select 'Has intentado actualizar con un tipo de asignatura que no existe, solo se permite "básica", "obligatoria" u "optativa"' as Mensaje_error;
    end;
    -- Declaracion del manejador de errores para el codigo de error 1452
    -- SQLSTATE '23000'
    -- Clave ajena no encontrada en la tabla origen durante la insercion
    -- El manejador debe provocar la salida del procedimiento cuando sea llamado y haya terminado su ejecucion
    declare exit handler for 1452
    begin
		select "La clave ajena que has probado no existe en la tabla grado o profesor" as Mensaje_error;
	end;
	update asignatura set nombre=nombreAsig, creditos=creditosAsig, tipo=tipoAsig, curso=cursoAsig, cuatrimestre=cuatrimestreAsig, id_profesor=idProfeAsig,
						id_grado=idGradoAsig where id=idAsig;
	select "La actualización se ha realizado correctamente" as mensaje;
end;
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
call actualiza_asignatura(2, 'Cálculo', 6, 'básica', 1, 1, 9, 4);
call actualiza_asignatura(2, 'Cálculo', 6, 'básica', 1, 1, 93, 4);
call actualiza_asignatura(2, 'Cálculo', 6, 'básica', 1, 1, 9, 400);
call actualiza_asignatura(2, 'Cálculo', 6, 'elemental', 1, 1, 9, 4);