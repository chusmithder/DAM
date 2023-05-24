/*
	Autor: Carlos
    Fecha: 20/12/2021
    Descripción: Pruebas SELECT
*/

-- Crear base de datos vacía
drop database if exists biblioteca;
create database biblioteca;

-- Elegir la BBDD
use biblioteca;

-- Tabla Socios
create table Socios(
	DNI varchar(9),   -- DNI es un texto de 9 caracteres
    Nombre varchar(20) not null,	-- Nombre es un texto de 20 caracteres, no puede estar vacío
    Apellido1 varchar(20) not null, -- Apellido1 es un texto de 20 caracteres, no puede estar vacío
    Apellido2 varchar(20), -- Apellido1 es un texto de 20 caracteres, si puede estar vacío
    FechaAlta date, -- FechaAlta es una fecha
    FechaNacimiento date, -- FechaNacimiento es una fecha
    Saldo decimal(5,2), -- Saldo tiene 3 cifras enteras y dos decimales
    SedeBase int(1),	--  SedeBase es un entero que como máximo puede valer 9
    TipoSocio varchar(10), -- TipoSocio es un texto de 10 caracteres
    constraint so_dni_PK primary key (DNI), -- DNI es la clave primaria
    constraint so_fa_CK check (FechaAlta >= '2000-01-01'), -- la FechaAlta ha de ser posterior a 1 de enero de 2000
    constraint so_ts_CK check (TipoSocio in ('Fijo','Temporal'))
);

insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('11111111A','Carlos','Martínez','Etxeberria','2000-01-01','1980-01-01',85.21,1,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('22222222B','Itsaso','Martínez','Latasa','2000-01-01','1990-02-02',25.31,1,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('33333333C','Asier','Munarriz','Pueio','2002-02-02','1990-03-03',54.22,2,'Temporal');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('44444444D','Montse','Oskariz','Gomez','2002-03-03','1995-04-04',99.00,3,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('55555555E','Mikel','Martinez','Gomez','2002-04-03','1998-05-05',85.21,2,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('66666666F','Mikel','Beroiz','Altuna','2005-09-09','1998-05-05',22.85,1,'Temporal');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('77777777G','Pedro','Blazquez','Etxeberria','2005-09-09','2000-05-05',22.85,2,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('88888888H','Maite','Etxebarria','Etxebarria','2000-09-09','1995-08-22',15.23,1,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase) 
values ('99999999I','Lourdes','Lapuerta','Castello','2005-09-09','1990-12-20',99.99,1);



select *
	from Socios;

/*
select *
	from Socios
    where Nombre != "Pedro";
    
-- distinct
select distinct Apellido1
	from Socios;

-- select con like
select *
	from Socios
    where ApellidO1 like "M%z";
    
-- select con IN / NOT IN
select *
	from Socios
    where Apellido1  in ("Munaarriz","Martinez", 'Oskariz');


-- select con is null
select *	
	from Socios
    where TipoSocio is null;

-- concat
select concat(Apellido1, " ", Apellido2, ", ", Nombre) as "Nombre Completo"
	from Socios;

-- lower / upper
select lower(concat(Apellido1, " *** "))
	from Socios;

select upper(concat(Apellido1, " ", Nombre))
	from Socios;

-- Longitud texto
select concat(Apellido1, " ", Apellido2, ", ", Nombre) as "Nombre Completo", 
	char_length(concat(Apellido1, " ", Apellido2, ", ", Nombre) )
	from Socios;

-- order by
select concat(Apellido1, " ", Apellido2, ", ", Nombre) as "Nombre Completo"
	from Socios
    order by Apellido1, Apellido2, Nombre;

-- LIMIT
SELECT concat(Apellido1, " ", Apellido2, ", ", Nombre), Saldo
	from Socios
    order by Saldo desc
    limit 3;

-- COUNT, DISTINCT
-- CUENTA LA CANTIDAD DE REGISTROS NO NULOS EN UN CAMPO O EN VARIOS
select count(TipoSocio)
	from Socios;
    
select count(distinct Apellido1)
	from Socios;

-- AVG, SUM, MAX, MIN 
select count(*) * 2 - 4
	from Socios;

select avg(Saldo) 
	from Socios;

select max(Saldo), min(Saldo), max(Saldo) + min(Saldo)
	from Socios;


-- GROUP BY ----------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- en este caso estaria mal, ya que en cada TipoSocio pueden haber varios registros en determinados campos
select *
	from Socios
    group by TipoSocio;

select SedeBase 
	from Socios
    group by SedeBase;

    
select SedeBase, Saldo -- error, pueden haber varios saldos por cada SedeBase
	from Socios
    group by SedeBase;
*/
select SedeBase, avg(Saldo) as "Saldo Medio"
	from Socios
    group by SedeBase
    order by avg(Saldo) desc;

    
select SedeBase, count(*) as "Cuantos"
	from Socios
    where TipoSocio = "Fijo"
    group by SedeBase
    having count(*) >= 2;


-- Mostrar TipoSocio y cuantos ganan mas de 50
select TipoSocio, count(Saldo) as "cuantos mas de 50 de saldo"
	from Socios
    where Saldo > 50 and TipoSocio is not null
    group by TipoSocio;

select SedeBase, avg(Saldo)
	from Socios 
    -- where Saldo > 50
    group by SedeBase
    having avg(Saldo) > 50;

select concat(Apellido1, " ", Apellido2, ", ",Nombre) as "Nombre completo", Saldo
	from Socios
    where Saldo > (select avg(Saldo)
					from Socios);

-- Cuantas tienen saldo superior a 70 y son fijos 
select count(*) as "cantidad que tienen mas de 70 de saldo"
	from Socios
    where Saldo > 70 and TipoSocio = "Fijo";

-- Para cada tipo de socio cual es el mayor y cual es el menor
select TipoSocio, min(Saldo) as "Saldo minimo", max(Saldo) as "Saldo Maximo"
	from Socios
    where TipoSocio is not null
    group by TipoSocio;

-- Cuantos apellidos2 iguales hay por s de socio sin contar los apellidos2 unicos
select count(Apellido2) - count(distinct Apellido2), TipoSocio
	from Socios
    group by TipoSocio;

select SedeBase, count(*)
	from Socios
	where SedeBase = 2
    group by SedeBase
    having count(*) >= 3;