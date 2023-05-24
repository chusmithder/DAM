/*
	Autor: Christhoper Pinday Delgado
    Fecha: 27/05/2022
    Descripción: Examen
*/

-- Crear base de datos vacía
drop database if exists instituto;
create database instituto;

-- Elegir la BBDD
use instituto;

CREATE TABLE alumnos( 
	DNI varchar(9),   -- DNI es un texto de 9 caracteres
    NombreCompleto json, -- Nombre, Apellido1, Apellido2
    FechaNacimiento json, -- Anio, Mes, Día
    constraint al_dni_PK primary key (DNI) -- DNI es la clave primaria
);
-- Rellena la tabla con un alumno con tus datos
insert into alumnos (DNI, NombreCompleto, FechaNacimiento) values
	('11111111A',
    '{ "Nombre": "Christhoper", "Apellido1": "Pinday", "Apellido2": "Delgado" }',
    '{ "Anio": "2002", "Mes": "Diciembre", "Dia": "17"}');
    
-- Muestra solo el nombre
select NombreCompleto->>'$.Nombre' from alumnos;


set sql_safe_updates = 0;
-- Ejercicio: Buscar y probar las instrucciones necesarias para esto:
-- 1) Borrar al año de nacimiento, solo para ese alumno
drop procedure if exists borrarAnioNacimiento;
DELIMITER $$
create procedure borrarAnioNacimiento(in p_dni varchar(9))
begin
	update alumnos
		set FechaNacimiento = JSON_REMOVE(FechaNacimiento, '$.Anio')
        where DNI = p_dni;
end
$$
DELIMITER ;;

call borrarAnioNacimiento('11111111A');
-- Muestra todo
select * from alumnos;


-- 2) Modificar el mes para que sea Enero, solo para ese alumno
drop procedure if exists modificarMes;
DELIMITER $$
create procedure modificarMes(in p_dni varchar(9))
begin
	update alumnos
		set FechaNacimiento = JSON_REPLACE(FechaNacimiento, '$.Mes', "Enero")
        where DNI = p_dni;
end
$$
DELIMITER ;;

call modificarMes('11111111A');

-- Muestra todo
select * from alumnos;

set sql_safe_updates = 1;