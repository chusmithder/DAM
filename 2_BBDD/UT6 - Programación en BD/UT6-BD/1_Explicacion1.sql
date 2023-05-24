/*
	Autor: Carlos
    Fecha: 17/02/2022
    Descripción: Pruebas CLASE UT6
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
values ('77777777G','Pedro','Blazquez','Etxeb','2005-09-09','2000-05-05',22.85,2,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase,TipoSocio) 
values ('88888888H','Maite','Etxebarria','Etxebarria','2000-09-09','1995-08-22',15.23,1,'Fijo');
insert into Socios (DNI,Nombre,Apellido1,Apellido2,FechaAlta,FechaNacimiento,Saldo,SedeBase) 
values ('99999999I','Lourdes','Lapuerta','Castello','2005-09-09','1990-12-20',99.99,1);


-- Tabla Libros
create table Libros(
	ISBN varchar(10),   -- ISBN es un texto de 10 caracteres
    Titulo varchar(50) not null,	-- Titulo es un texto de 50 caracteres, no puede estar vacío
    Autor varchar(20) not null, -- Autor es un texto de 20 caracteres, no puede estar vacío
    Editorial varchar(20) not null, -- Editorial es un texto de 20 caracteres, no puede estar vacío
    FechaPublicacion date, -- FechaPublicacion es una fecha
    FechaAdquisicion date, -- FechaAdquisicion es una fecha
    Ejemplares int(1),	--  Ejemplares es un entero que como máximo puede valer 9, ES REDUNDANTE OJO!!
    constraint li_isbn_PK primary key (ISBN), -- ISBN es la clave primaria
    constraint li_fa_CK check (FechaAdquisicion >= '2010-01-01') -- la FechaAdquisicion ha de ser posterior a 1 de enero de 2010
);

insert into Libros (ISBN,Titulo,Autor,Editorial,FechaPublicacion,FechaAdquisicion,Ejemplares) 
values ('1111111111','La comunidad del anillo','Tolkien','Amaia','1960-01-01','2010-02-01',10);
insert into Libros (ISBN,Titulo,Autor,Editorial,FechaPublicacion,FechaAdquisicion,Ejemplares) 
values ('2222222222','Las dos torres','Tolkien','Amaia','1970-01-01','2010-02-01',5);
insert into Libros (ISBN,Titulo,Autor,Editorial,FechaPublicacion,FechaAdquisicion,Ejemplares) 
values ('3333333333','El retorno del rey','Tolkien','Amaia','1973-05-21','2010-02-01',8);
insert into Libros (ISBN,Titulo,Autor,Editorial,FechaPublicacion,FechaAdquisicion,Ejemplares) 
values ('4444444444','Dracula','Stoker','Paraninfo','1890-09-22','2010-10-25',4);
insert into Libros (ISBN,Titulo,Autor,Editorial,FechaPublicacion,FechaAdquisicion,Ejemplares) 
values ('5555555555','Frankestein','Mary Shelly','Marcombo','1876-12-25','2015-12-01',5);

-- Tabla Ejemplares
create table Ejemplares(
	ISBN varchar(10),   -- ISBN es un texto de 10 caracteres
	NEjemplar varchar(3), -- NEjemplar es un varchar de 3 caracteres
    Libre varchar(2) not null,	-- Libre es un texto de 2 caracteres, no puede estar vacío
    Estado varchar(2) not null, -- Estado es un texto de 2 caracteres, no puede estar vacío
    Tapa varchar(6), -- Tapa es un texto de 6 caracteres
    constraint ej_isbn_ne_PK primary key (ISBN,NEjemplar), -- ISBN,NEjemplar es la clave primaria
    constraint ej_li_CK check (Libre in('Si','No')), -- Libre vale Si o No
    constraint ej_es_CK check (Estado in('Si','No')), -- Estado vale Si o No
    constraint ej_ta_CK check (Tapa in('Dura','Blanda')), -- Tapa vale Dura o Blanda
    constraint ej_isbn_FK foreign key(ISBN) references Libros(ISBN)
);


insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','101','No','Si','Blanda');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','102','Si','Si','Blanda');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','103','Si','Si','Blanda');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','104','Si','No','Blanda');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','105','Si','Si','Dura');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','106','Si','No','Dura');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('1111111111','107','No','Si','Dura');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('2222222222','201','Si','Si','Dura');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('2222222222','202','Si','Si','Blanda');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('3333333333','301','Si','Si','Blanda');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('4444444444','401','No','Si','Dura');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('5555555555','501','Si','Si','Dura');
insert into Ejemplares (ISBN,NEjemplar,Libre,Estado,Tapa) 
values ('5555555555','502','No','Si','Blanda');

-- Tabla Alquileres
create table Alquileres(
	DNI varchar(9),   -- DNI es un texto de 9 caracteres
	ISBN varchar(10),   -- ISBN es un texto de 10 caracteres
    FechaAlquiler date, -- FechaAlquiler es una fecha
    FechaDevolucionReal date, -- FechaDevolucionReal es una fecha
    constraint al_dni_isbn_PK primary key (DNI,ISBN), -- DNI,ISBN es la clave primaria
    constraint al_fafd_CK check (FechaDevolucionReal >= FechaAlquiler), -- la FechaDevolucionReal ha de ser posterior a la FechaAlquiler
    constraint al_dni_FK foreign key (DNI) references Socios(DNI), -- DNI es FK
    constraint al_isbn_FK foreign key (ISBN) references Libros(ISBN) -- ISBN es FK
);

insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('11111111A','1111111111','2020-01-10','2020-01-15');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('11111111A','2222222222','2020-01-15','2020-01-20');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('11111111A','3333333333','2020-01-20','2020-01-25');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('22222222B','1111111111','2021-01-10','2021-01-15');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('22222222B','2222222222','2021-01-15','2021-01-20');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('33333333C','3333333333','2021-05-15','2021-06-04');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('44444444D','1111111111','2021-05-20','2021-05-25');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('44444444D','5555555555','2021-10-02','2021-11-25');
insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) 
values ('55555555E','5555555555','2021-10-02','2021-11-05');

select * from Socios;
select * from Libros;
select * from Ejemplares;
select * from Alquileres;
/*
drop procedure if exists P01;
DELIMITER $$
create procedure P01()
begin
	
end
$$
DELIMITER ;
call P01();
*/

drop procedure if exists P02;
DELIMITER $$
create procedure P02(in nombreExterno varchar(20), tituloExterno varchar(50))
begin
	select *
		from socios
        where nombre = nombreExterno;
	select *
		from Libros
        where titulo = tituloExterno;
	
end
$$
DELIMITER ;
call P02("Mikel", "Dracula");

/*
drop procedure if exists P03;
DELIMITER $$
create procedure P03(in cantidad int(5))
begin
	set sql_safe_updates = 0;
	update socios
		set saldo = saldo - 300;
	set sql_safe_updates = 0;
    select * from socios;
end
$$
DELIMITER ;
call P03(300);
*/

/*
-- cuantos socios hay que tienen como apellido el parametro
drop procedure if exists P04;
DELIMITER $$
create procedure P04(in pApellido1 varchar(20))
begin
	select count(*)
		from socios
        where apellido1 = pApellido1;
end
$$
DELIMITER ;
call P04("Martínez");
*/
/*
drop procedure if exists P06;
DELIMITER $$
create procedure P06(in pApellido1 varchar(20), in p varchar(20), out pCuantos int)
begin
	select count(*) into pCuantos
		from socios
		where apellido1 = pApellido1 and nombre = p
        ;
end
$$
DELIMITER ;
call P06("Martinez", "Carlos", @pCuantos);
select @pCuantos;
*/

drop procedure if exists P06;
DELIMITER $$
create procedure P06(in pApellido1 varchar(20), in p varchar(20), out pCuantos int)
begin
	select count(*) into pCuantos
		from socios
        where apellido1 = pApellido1 and nombre = p;
end
$$
DELIMITER ;
call P06("Martinez", "Carlos", @pCuantos);
select @pCuantos;

/*

-- Sacar el salario medio de los de una sedeBase en concreto
drop procedure if exists P01;
DELIMITER $$
create procedure P01(in pSede integer(1), out pSalarioMedio decimal(6,2))
begin
	select avg(saldo) into pSalarioMedio
		from socios
        group by sedebase
        having sedebase = pSede;
end
$$
DELIMITER ;
call P01(1, @pSalarioMedio);
select @pSalarioMedio, "asds";
select avg(saldo)
	from socios
	where sedebase = 1;
*/
/*
-- Variables
drop procedure if exists P07;
DELIMITER $$
create procedure P07()
begin
	declare varEntero int;
	declare varDecimal double(5, 2) default 25.25;
    declare varTexto varchar(20) default "catch";
    
    select varEntero;
    select varDecimal;
    select varTexto;
    
    set varEntero = 10;
    set varDecimal = varDecimal * 2;
    set varTexto = concat(varTexto, " this exception");
    
    select varEntero;
    select varDecimal;
    select varTexto;
end
$$
DELIMITER ;
call P07();
*/
/*
-- El dni del socio con mas Saldo
drop procedure if exists P01;
DELIMITER $$
create procedure P01()
begin
	declare vSaldoMaximo decimal(5, 2);
    declare vDNI varchar(9);
    declare vSalida varchar(100);
    
    select max(saldo) into vSaldoMaximo
		from socios;
        
	select dni into vDNI
		from socios
        where saldo = vSaldoMaximo;
	
    set vSalida = concat("El salario mas alto es de\n ", vSaldoMaximo, ", y le pertenece a ", vDNI);
    select vSalida;
end
$$
DELIMITER ;
call P01();
*/
/*
drop procedure if exists P01;
DELIMITER $$
create procedure P01()
begin
	select "linea1\nlinea2\nlinea3" as "mesaje";
end
$$
DELIMITER ;
call P01();
*/

