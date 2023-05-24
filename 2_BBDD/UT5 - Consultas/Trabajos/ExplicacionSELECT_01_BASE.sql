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


/*
-- * cuenta nulls
-- COUNT
select count(*) from Socios;
select count(Nombre) from Socios;
select count(TipoSocio) from Socios;
select count(distinct Apellido1) from Socios;
*/
  
/*
-- 2.8 AVG, VER SUM, MAX, MIN en Apuntes
select avg(Saldo) as "Saldo Medio"
	from Socios;
*/

-- GROUP BY
select SedeBase 
	from Socios 
    group by SedeBase;
select SedeBase, Saldo 
	from Socios 
	group by SedeBase; -- No se puede hacer, ya que hay diferentes valores para el saldo en una misma sede
select SedeBase, avg(Saldo) 
	from Socios 
	group by SedeBase; -- AVG calcula las medias por SedeBase

select SedeBase as "Sede", count(*) as "Cuantos"
	from Socios
    where TipoSocio = "Fijo"
    group by "SedeBase";
-- Mostrar TipoSocio y cuantos ganan mas de 50
select TipoSocio, count(Saldo) as "Cuantos mayor a 50"
	from Socios
    where Saldo > 50
    group by TipoSocio;

/*
select SedeBase, avg(Saldo)
	from Socios
    group by SedeBase
    having avg(Saldo) > 50;
*/
/*
select concat(Apellido1, " ", Apellido2, ", ",Nombre) as "Nombre completo", Saldo
	from Socios
    group by "Nombre completo"
    having saldo > avg(Saldo);
*/
/*
select concat(Apellido1, " ", Apellido2, ", ",Nombre) as "Nombre completo", Saldo as "Buen saldo"
	from Socios
    where Saldo > 56 -- Saldo > avg(Saldo)
	order by Saldo desc;
*/
/*
-- Cuantas tienen saldo superior a 70 y son fijos 
select count(*) from Socios
where  Saldo > 70 and TipoSocio = "Fijo"; 
*/
/*
-- Para cada tipo de socio cual es el mayor y cual es el menor
select TipoSocio, min(Saldo), max(Saldo)
	from Socios
    group by TipoSocio;
*/
-- Cuantos apellidos2 iguales hay por tipo de socio sin contar los apellidos2 unicos
select TipoSocio, count(Apellido2) - count(distinct Apellido2) as "Personas con ap iguales"
	from Socios
    group by TipoSocio;
    
-- select basico
select * from Socios;

-- select campos concretoss
select Nombre, Apellido1, Apellido2
	from Socios;
    
-- select distinct
select distinct Nombre
	from Socios;

-- select con cambio de nombre al campo
select Nombre as "names"
	from Socios;
    
-- select con operador aritmetico + - * /, por ejemplo sacamos el doble del saldo
select Saldo * 2 as "saldo doble"
	from Socios;

-- select con operador aritmetico y mensaje compuesto, por ejemplo saldo con iva
select Saldo*1.21 as "Saldo con iva"
	from Socios;
    
-- select con where basico
select *
	from Socios
    where nombre = "Mikel";

-- select con logicos y relacionales, VER OPERADORES en apuntes
select *
	from Socios
    where Saldo > 30 and Saldo < 90;

-- select con NOT IN
select *
	from Socios
    where Apellido1 not in ("Beroiz", "Lapuerta");

-- select con LIKE
select *
	from Socios
    where Apellido1 like "M%z";

-- select con IS NULL
select *
	from Socios
    where TipoSocio is null;
    
-- PRECEDENCIA DE OPERADORES -----------------------------
-- concat
select concat(Nombre, " ", Apellido1, " ", Apellido2) as "Nombre Completo"
	from Socios
    where Saldo > 50;
    
-- lower, upper
select upper(concat(Nombre, " " ,Apellido1)) as "Nom Mayuscula"
	from Socios;
    
-- longitud de texto
select concat(Nombre, " ", Apellido1, " ", Apellido2) as "Nombre Completo", 
	char_length(concat(Nombre, " ", Apellido1, " ", Apellido2)) as "Tamaño nombre completo"
    from Socios;
-- day
select day(FechaNacimiento)
	from Socios;

-- monthname
select monthname(FechaNacimiento)
	from Socios;

-- --------------------------------------------------------
-- ORDER BY
select concat(Apellido1," ", Apellido2, ", ", Nombre) as "Nombre Completo"
	from Socios
    order by Apellido1, Apellido2, Nombre;
    
-- LIMIT
select concat(Apellido1," ", Apellido2, ", ", Nombre) as "Nombre Completo", Saldo
	from Socios
    order by Saldo desc
    limit 3;
    
-- AVG, SUM, MAX, MIN
select  sum(Saldo)  as "Saldo Promedio"
	from Socios;

-- COUNT
select count(*) from Socios; -- num de registros
select count(Nombre) from Socios; -- num de ocurrencias
select count(TipoSocio) from Socios;
select count(distinct Apellido1) from Socios;


-- GROUP BY
select SedeBase 
	from Socios
    group by SedeBase;
    
select SedeBase, Saldo
	from Socios
    group by SedeBase; -- ERROR

select SedeBase, avg(Saldo)
	from Socios
    group by SedeBase;
    
select SedeBase as "Sede", count(*) as "Cuantos"
	from Socios
    where TipoSocio = "Fijo"
    group by SedeBase;
    
select TipoSocio as "Tipo", count(Saldo) as "Saldo"
	from Socios
    where Saldo > 50
    group by TipoSocio;
    
select SedeBase, avg(Saldo)
	from Socios
    group by SedeBase
    having avg(Saldo) > 50;



    
