/****************************
** Sin BD - CONTROL ERRORES **
*****************************/

/*Crea una base de datos llamada test que contenga una tabla llamada alumno. La tabla debe tener cuatro columnas:
	id: entero sin signo (clave primaria).
	nombre: cadena de 50 caracteres.
	apellido1: cadena de 50 caracteres.
	apellido2: cadena de 50 caracteres.

Una vez creada la base de datos y la tabla deberá crear una función llamada fn_insertar_alumno con las siguientes características: 
	El procedimiento recibe cuatro parámetros (id, nombre, apellido1, apellido2) y los insertará en la tabla alumno. 
	La función devolverá 0 si la operación se ha podido realizar con éxito y un valor igual a -1 si hay una infracción de clave primaria y un valor igual a -2 si la tabla no existe.
	Habrá dos manejadores, uno para cada error: 1062 infracción de clave primaria y 1146 tabla no existente.
*/

-- Creamos la base de datos
create database if not exists test;
use test;

-- Creamos la tabla alumno con los campos que nos indica en el enunciado
drop table if exists alumno;
create table alumno(
	id int primary key,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50)
);

drop function if exists fn_insertar_alumno;
delimiter $$
create function fn_insertar_alumno(idv int, nombrev varchar(50),apellido1v varchar(50), apellido2v varchar(50))
returns int
begin
--  Declaramos el handler para manejar el error de clave primaria repetida
	declare exit handler for 1062
    begin 
     return -1;
    end;
    
    -- Declaramos el handler para manejar el error de tabla inexistente
	declare exit handler for 1146
    begin 
     return -2;
    end;
    
    -- Intentamos insertar
    insert into alumno values(idv,nombrev,apellido1v,apellido2v);
    -- Si se ha ejecutado con éxito la ejecución llegará hasta aquí
    return 0;
end$$

-- Ejecución sin existir la tabla
select fn_insertar_alumno(2,'Carlos', 'Herrera','Lopez');
-- Primera vez que ejecutamos esta llamada existiendo la tabla
select fn_insertar_alumno(3,'Vanesa', 'Dorado','Lopez');
-- Segunda vez que ejecutamos esta llamada existiendo la tabla
select fn_insertar_alumno(3,'Vanesa', 'Dorado','Lopez');



    
