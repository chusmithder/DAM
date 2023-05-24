/*
	Autor: Carlos
    Fecha: 21/02/2022
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
values ('77777777G','Pedro','Blazquez','Etxeberria','2005-09-09','2000-05-05',22.85,2,'Fijo');
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

/*
drop procedure if exists P01;
DELIMITER $$
create procedure P01(numero integer)
begin
	declare texto varchar(50);
    declare contador int default 0;
    while contador <= numero do
		set texto = concat("Vamos por el ",contador," llegaremos hasta ",numero);
        select texto as "Salida";
        set contador = contador + 1;
	end while;
end
$$
DELIMITER ;

call P01(5);
*/
/*
drop procedure if exists P02;
DELIMITER $$
create procedure P02(numero integer)
begin
	declare texto varchar(50);
    declare contador int default 0;
	-- set contador = 1;
    while contador <= numero do
		if contador % 2 = 0 then
			set texto = concat("Vamos por el ",contador," llegaremos hasta ",numero);
			select texto as "Salida";
		end if;
        set contador = contador + 1;
	end while;
end
$$
DELIMITER ;

call P02(5);
*/
-- ----------------------------------------------
/*
drop procedure if exists ej1;
DELIMITER $$
create procedure ej1(numero integer, limite int)
begin
	declare texto varchar(500);
    declare contador int default 0;
    while i <= limite do
		set texto  = concat(texto, numero, " X ", i ," = " , numero * i, "\n" );
        set i = i + 1;
	end while;
	select texto;
end
$$
DELIMITER ;

call ej1(10, 20);
*/
-- ----------------------------------------------
/*
drop procedure if exists ej2;
DELIMITER $$
create procedure ej2(in filas int, columnas int)
begin
	declare texto varchar(500) default " ";
    declare i int default 0;
	declare j int;
    set j = 0;
    while i < filas do
		while j < columnas do
			set texto = concat(salida, "*");
            set j = j + 1;
		end while;
        set texto  = concat(salida, "\n");
		set i = i + 1;
    end while;
    select texto;
end
$$
DELIMITER ;

call ej2(5,10);
*/

-- ----------------------------------------------
/*
drop procedure if exists ej3;
DELIMITER $$
create procedure ej3(in alto int)
begin
	declare texto varchar(500) default " ";
    declare i int default 0;
	declare j int;
    while i < alto do
		set j = 0;
		while j < columnas do
			set texto = concat(salida, "*");
            set j = j + 1;
		end while;
        set texto  = concat(salida, "\n");
		set i = i + 1;
    end while;
    select texto;
end
$$
DELIMITER ;

call ej3(5,10);
*/
-- ----------------------------------------------
/*
drop procedure if exists ej4;
DELIMITER $$
create procedure ej4(in alto int)
begin
	declare Salida varchar(50) default " ";
    declare j int;
    set j = 0;
		while j < alto do
			if (i + j) % 2 = 0 then
				set Salida = concat(salida, "0");
			else
				set Salida = concat(Salida, "1");
			end if;
			set j = j + 1;
		end while;
		set Salida = concat(Salida, "\n");
		set i = i +1;
	
    select Salida;
end
$$
DELIMITER ;

call ej4(5,10);
*/
-- ------------------------------------------------------------------
/*
drop procedure if exists ej5;
DELIMITER $$
create procedure ej5(numero integer)
begin
	declare texto varchar(50);
    declare contador int default 0;
    while contador <= numero do
		if contador % 2 = 0 then
			set texto = concat("Vamos por el ",contador," llegaremos hasta ",numero);
			select texto as "Salida";
		end if;
        set contador = contador + 1;
	end while;
end
$$
DELIMITER ;

call ej5(5);
*/
-- -------------------------------18 / 3 / 22-----------------------------------

drop procedure if exists Ejercicio;
DELIMITER $$
create procedure Ejercicio(in alto int, ancho int)
begin
	declare i int;
    declare j int;
    declare salida varchar(1000) default " ";
    set i = 0;
    while i < alto do
		set j = 0;
		while j < ancho do
			set salida = concat(salida,"T X T ");
			set j = j + 1;
		end while;
		set salida = concat(salida,"\n");
		
		set j = 0;
		while j < ancho do
			set salida = concat(salida,"X R X ");
			set j = j + 1;
		end while;
		set salida = concat(salida,"\n");
		
		set j = 0;
		while j < ancho do
			set salida = concat(salida,"T X T ");
			set j = j + 1;
		end while;
		set salida = concat(salida,"\n");
        set i = i + 1;
	end while;
    
    select salida;
end
$$
DELIMITER ;

call Ejercicio(2,3);
