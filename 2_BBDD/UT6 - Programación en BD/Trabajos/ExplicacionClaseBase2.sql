/*
	Autor: Carlos
    Fecha: 18/02/2022
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
values ('8888888 8H','Maite','Etxebarria','Etxebarria','2000-09-09','1995-08-22',15.23,1,'Fijo');
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

drop procedure if exists P01;
DELIMITER $$
create procedure P01(numero integer)
begin
	declare texto varchar(50);
    if numero < 0 then
		set texto = concat("El número ",numero," es negativo");
	end if;
    select texto as "Salida";
end
$$
DELIMITER ;

call P01(-8);

-- -------------------------------------
drop procedure if exists ej1;
DELIMITER $$
create procedure ej1(pNombre varchar(20))
begin
	declare texto varchar(50);
    if pNombre = "Carlos" then
		set texto = concat("Bienvenido");
	end if;
    select texto as "Salida";
end
$$
DELIMITER ;

call ej1("Carlos");
-- -------------------------------------

drop procedure if exists P02;
DELIMITER $$
create procedure P02(numero integer)
begin
	declare texto varchar(50);
    if numero < 0 then
		set texto = concat("El número ",numero," es negativo");
	else
		set texto = concat("El número ",numero," es positivo");
	end if;
    select texto as "Salida";
end
$$
DELIMITER ;

call P02(8);

-- -------------------------------------
drop procedure if exists ej2;
DELIMITER $$
create procedure ej1(pNombre varchar(20))
begin
	declare texto varchar(50);
    if pNombre = "Carlos" then
		set texto = concat("Bienvenido");
	else 
		set texto = concat(pNombre, " no tienes permitido el acceso");
    end if;
    select texto as "Salida";
end
$$
DELIMITER ;

call ej1("Carlos");
-- -------------------------------------



drop procedure if exists P03;
DELIMITER $$
create procedure P03(nota integer)
begin
	declare texto varchar(50);
    if nota >= 9 then
		set texto = concat("La nota ",nota," es sobresaliente");
	else
		if nota >= 7 then
			set texto = concat("La nota ",nota," es notable");
		else
			if nota >= 6 then
				set texto = concat("La nota ",nota," es bien");
			else
				if nota >= 5 then
					set texto = concat("La nota ",nota," es aprobado");
				else
					set texto = concat("La nota ",nota," es suspenso");
				end if;
			end if;
		end if;
	end if;
    select texto as "Salida";
end
$$
DELIMITER ;

call P03(9);
call P03(7);
call P03(6);
call P03(5);
call P03(4);

-- -------------------------------------
drop procedure if exists ej3;
DELIMITER $$
create procedure ej3(in usuario varchar(20), contrasena varchar(20), id varchar(20))
begin
	declare texto varchar(50);
    if nombre = "Carlos" then
		if contrasena = "12345" then
			if id = "aaaa" then
				set texto = "Bienvenido";
			else 
				set texto = "id incorrecto";
            end if;
		else 
			set texto = "contraseña incorrecta";
		end if;
	else 
		set texto = "Usuario incorrecto";
	end if;
    select texto as "Salida";
end
$$
DELIMITER ;

call ej3("Carlos", "12345", "aaaa");

 -- ---------------------------------------------------
drop procedure if exists ej4;
DELIMITER $$
create procedure ej4(in nombreExt varchar(20), apellido1Ext varchar(20), apellido2Ext varchar(20))
begin
	select *
		from Socios
        where Nombre = nombreExt and Apellido1 = apellido1Ext and Apellido2 = apellido2Ext;
end
$$
DELIMITER ;

call ej4("Itaso", "Martinez ", "Latasa");

-- -------------------------------------

drop procedure if exists P04;
DELIMITER $$
create procedure P04(DNI_Externo varchar(9))
begin
	declare var_DNI varchar(9);
    set var_DNI = (select DNI 
						from Socios
                        where DNI = DNI_Externo);
	if var_DNI is not null then
		select concat("El socio con DNI: ",DNI_Externo," existe");
	else	
		select concat("El socio con DNI: ",DNI_Externo," no existe");
	end if;
end
$$
DELIMITER ;

call P04("11111111A");
call P04("12345678A");

-- -------------------------------------
drop procedure if exists ej5;
DELIMITER $$
create procedure ej5(pISBN varchar(10))
begin
	declare var_ISBN varchar(10);
    set var_DNI = (select ISBN
						from Libros
                        where ISBN = pISBN);
	if var_ISBN is not null then
		select concat("El libro  con ISBN: ",pISBN ," existe");
	else	
		select concat("El libro  con ISBN: ",pISBN ," no existe");
	end if;
end
$$
DELIMITER ;

call ej5("2222222222");
call ej5("1232138828");

-- -------------------------------------

drop procedure if exists P05;
DELIMITER $$
create procedure P05(DNI_Externo varchar(9))
begin
	if exists (select DNI 
					from Socios
					where DNI = DNI_Externo) then
		select concat("El socio con DNI: ",DNI_Externo," existe");
	else	
		select concat("El socio con DNI: ",DNI_Externo," no existe");
	end if;
end
$$
DELIMITER ;

call P05("11111111A");
call P05("12345678A");

-- -------------------------------------
drop procedure if exists ej6;
DELIMITER $$
create procedure ej6(pISBN varchar(10))
begin
	if exists (select ISBN
					from Libros
					where ISBN = pISBN) then
		select concat("El libro  con ISBN: ",pISBN ," existe");
	else	
		select concat("El libro  con ISBN: ",pISBN ," no existe");
	end if;
end
$$
DELIMITER ;

call ej6("2222222222");
call ej6("12345678A");

-- -------------------------------------
drop procedure if exists P06;
DELIMITER $$
create procedure P06(DNI_Externo varchar(9))
begin
	if DNI_Externo in (select DNI 
					from Socios
					where DNI = DNI_Externo) then
		select concat("El socio con DNI: ",DNI_Externo," existe");
	else	
		select concat("El socio con DNI: ",DNI_Externo," no existe");
	end if;
end
$$
DELIMITER ;

call P06("11111111A");
call P06("12345678A");

-- -------------------------------------
drop procedure if exists ej7;
DELIMITER $$
create procedure ej7(DNI_Externo varchar(9))
begin
	if DNI_Externo in (select DNI 
					from Socios
					where DNI = DNI_Externo) then
		select concat("El socio con DNI: ",DNI_Externo," existe");
	else	
		select concat("El socio con DNI: ",DNI_Externo," no existe");
	end if;
end
$$
DELIMITER ;

call P06("11111111A");
call P06("12345678A");







-- -------------------------------------

drop procedure if exists P07;
DELIMITER $$
create procedure P07(nota integer)
begin
	declare texto varchar(50);
    case nota 
		when 9 then
			set texto = concat("La nota ",nota," es sobresaliente");
		when 7 then
			set texto = concat("La nota ",nota," es notable");
		when 6 then
			set texto = concat("La nota ",nota," es bien");
		when 5 then	
			set texto = concat("La nota ",nota," es aprobado");
		else
			set texto = concat("La nota ",nota," es suspenso");
	end case;
    select texto as "Salida";
end
$$
DELIMITER ;

call P07(9);
call P07(7);
call P07(6);
call P07(5);
call P07(4);
call P07(4);


-- -------------------------------------
drop procedure if exists ej8
DELIMITER $$
create procedure ej8(apellido2Ext varchar(9))
begin
	declare texto varchar(50);
    declare cuantos int;
    case apellido2Ext 
		when "Etxeberria" then
			set cuantos = (select count(*)
								from Socios
                                where Apellido2 = apellido2Ext);
			set texto = concat(apellido2Ext, "esta ", cuantos " veces");
		when "Gomez" then
			set cuantos = (select count(*)
								from Socios
                                where Apellido2 = apellido2Ext);
			set texto = concat(apellido2Ext, "esta ", cuantos " veces");
		else
			set texto = concat(apellido2Ext, " no esta repetido");
	end case;
    select texto as "Resultado";
end
$$
DELIMITER ;

call P06("11111111A");
call P06("12345678A");

-- Los isbn de los libros que los Socios con apellido ... y saldo superior a ... de los libros que los 
	-- Socios han alquilado como minimo ..n.. alquileres.
    -- Si el apellido 1 se cumple pero el saldo no: nombrecompletoSocio no tiene saldo suficiente, si el apellido
	-- no existe: nopmbre incorrecto
    drop procedure if exists Ejercicio;
DELIMITER $$
create procedure Ejercicio(in Apellido1Ext varchar(20),
							  SaldoExt decimal(5,2),
                              NAlquileres int,
						   out Salida varchar(200))
begin
	if Apellido1Ext in
					(select Apellido1
						from Socios
                        where Apellido1 = Apellido1Ext) then
		set Salida = "El usuario Existe";
        if SaldoExt <= (select min(Saldo)
							from Socios
                            where Apellido1 = Apellido1Ext) then
			set Salida = concat(Salida, " y el saldo es suficiente");
            select ISBN,count(*)
				from Alquileres 
                where DNI in (select DNI
								from Socios
								where Apellido1 = Apellido1Ext)
				group by ISBN
                having count(*) >= NAlquileres 
			;  
		else
			set Salida = "El saldo NO es suficiente";
		end if;
	else
		set Salida = "El usuario NO Existe";
	end if;
end
$$
DELIMITER ;

call Ejercicio("Martínez",20.20,2,@Salida);
select @Salida;

-- BUCLES --------------------