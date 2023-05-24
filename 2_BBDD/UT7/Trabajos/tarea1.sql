/*
	Autor: Christhoper Pinday
    Curso: DAM1A
    Descripción: Tarea 1
*/

drop database if exists tarea;
create database tarea;
use tarea;

-- Tabla Socios
create table Socios(
	dni varchar(9) primary key,
    datosPersonales json,
    datosBiblioteca json
);


insert into Socios (DNI, datosPersonales, datosBiblioteca) values 
	('11111111A',
    '{ "nombre": "Carlos", "apellidos": { "apellido1": "Martínez", "apellido2": "Etxeberria" }, "fNacimiento": "1980-01-01" }',
    '{ "fAlta": "2000-01-01", "saldo": 85.21, "sedeBase": 1, "tipoSocio": "Fijo" }'),
    ('22222222B',
    '{ "nombre": "Carlos", "apellidos": { "apellido1": "Martínez", "apellido2": "Latasa" }, "fNacimiento": "1990-02-02" }',
    '{ "fAlta": "2000-01-01", "saldo": 25.31, "sedeBase": 1, "tipoSocio": "Fijo" }'),
    ('33333333C',
    '{ "nombre": "Asier", "apellidos": { "apellido1": "Munarriz", "apellido2": "Pueio" }, "fNacimiento": "1990-03-03" }',
    '{ "fAlta": "2002-02-02", "saldo": 54.22, "sedeBase": 2, "tipoSocio": "Temporal" }'),
    ('44444444D',
    '{ "nombre": "Montse", "apellidos": { "apellido1": "Oskariz", "apellido2" : "Gomez"}, "fNacimiento": "1995-04-04" }',
    '{ "fAlta": "2002-03-03", "saldo": 99.00, "sedeBase": 3, "tipoSocio": "Fijo" }'),
    ('55555555E',
    '{ "nombre": "Mikel", "apellidos": { "apellido1": "Martinez", "apellido2": "Gomez" }, "fNacimiento": "1998-05-05" }',
    '{ "fAlta": "2002-04-03", "saldo": 85.21, "sedeBase": 2, "tipoSocio": "Fijo" }'),
    ('66666666F',
    '{ "nombre": "Mikel", "apellidos": { "apellido1": "Beroiz", "apellido2": "Altuna" }, "fNacimiento": "1998-05-05" }',
    '{ "fAlta": "2005-09-09", "saldo": 22.85, "sedeBase": 1, "tipoSocio": "Temporal" }'),
    ('77777777G',
    '{ "nombre": "Pedro", "apellidos": { "apellido1": "Blazquez", "apellido2": "Etxeb" }, "fNacimiento": "2000-05-05" }',
    '{ "fAlta": "2005-09-09", "saldo": 22.85, "sedeBase": 2, "tipoSocio": "Fijo" }'),
    ('88888888H',
    '{ "nombre": "Maite", "apellidos": { "apellido1": "Etxebarria", "apellido2": "Etxebarria" }, "fNacimiento": "1995-08-22" }',
    '{ "fAlta": "2000-09-09", "saldo": 15.23, "sedeBase": 1, "tipoSocio": "Fijo" }'),
    ('99999999I',
    '{ "nombre": "Lourdes", "apellidos": { "apellido1": "Lapuerta", "apellido2": "Castello" }, "fNacimiento": "1990-12-20" }',
    '{ "fAlta": "2005-09-09", "saldo": 99.99, "sedeBase": 1}');
  
  select * from Socios;

-- Tabla Socios
create table Libros(
	isbn varchar(10) primary key,
    datosLibro json,
    datosDisponibilidad json
);

insert into Libros (isbn, datosLibro, datosDisponibilidad) values 
('1111111111',
    '{ "titulo": "La comunidad del anillo", "autor": "Tolkien", "editorial": "Amaia", "fPublicacion": "1960-01-01" }',
    '{ "fAdquisicion": "2010-02-01", "ejemplares": 10 }'),
('2222222222',
    '{ "titulo": "Las dos torres", "autor": "Tolkien", "editorial": "Amaia", "fPublicacion": "1970-01-01" }',
    '{ "fAdquisicion": "2010-02-01", "ejemplares": 5 }'),
('3333333333',
    '{ "titulo": "El retorno del rey", "autor": "Tolkien", "editorial": "Amaia", "fPublicacion": "1973-05-21" }',
    '{ "fAdquisicion": "2010-02-01", "ejemplares": 8 }'),
('4444444444',
    '{ "titulo": "Dracula", "autor": "Stoker", "editorial": "Paraninfo", "fPublicacion": "1890-09-22" }',
    '{ "fAdquisicion": "2010-10-25", "ejemplares": 4 }'),
('5555555555',
    '{ "titulo": "Frankestein", "autor": "Mary Shelly", "editorial": "Marcombo", "fPublicacion": "1876-12-25" }',
    '{ "fAdquisicion": "2015-12-01", "ejemplares": 5 }');



-- Tabla Alquileres
create table Alquileres(
	DNI varchar(9),
	ISBN varchar(10),
    FechaAlquiler date,
    FechaDevolucionReal date,
    constraint al_dni_isbn_PK primary key (DNI,ISBN),
    constraint al_dni_FK foreign key (DNI) references Socios(DNI),
    constraint al_isbn_FK foreign key (ISBN) references Libros(ISBN)
);

insert into Alquileres (DNI,ISBN,FechaAlquiler,FechaDevolucionReal) values
	('11111111A','1111111111','2020-01-10','2020-01-15'), 
    ('11111111A','2222222222','2020-01-15','2020-01-20'),
	('11111111A','3333333333','2020-01-20','2020-01-25'),
    ('22222222B','1111111111','2021-01-10','2021-01-15'),
    ('22222222B','2222222222','2021-01-15','2021-01-20'),
	('33333333C','3333333333','2021-05-15','2021-06-04'),
    ('44444444D','1111111111','2021-05-20','2021-05-25'),
	('44444444D','5555555555','2021-10-02','2021-11-25'),
	('55555555E','5555555555','2021-10-02','2021-11-05');


set sql_safe_updates = 0;
-- ----------------------------------------------------------------------------------------
-- PROCEDIMIENTOS PARA SOCIOS 
-- ----------------------------------------------------------------------------------------
/*
-- 1) Añadir socios
drop procedure if exists addSocio;
DELIMITER $$
create procedure addSocio(in pDni varchar(9), pDatosPersonales json, pDatosBiblioteca json)
begin
	insert into Socios values (pDni, pDatosPersonales, pDatosBiblioteca);
end
$$
DELIMITER ;


-- 2) Borrar socios
drop procedure if exists borrarSocio;
DELIMITER $$
create procedure borrarSocio(in pDni varchar(9))
begin
	delete from Socios
		where dni = pDni;
end
$$
DELIMITER ;
call borrarSocio('11111111A');
select * from socios;


-- 3) Borrar tipo de socio del dni especificado
drop procedure if exists borrarTipoSocio;
DELIMITER $$
create procedure borrarTipoSocio(in pDni varchar(9))
begin
	update Socios
		set datosBiblioteca = JSON_REMOVE(datosBiblioteca, '$.tipoSocio')
        where dni = pDni;
end
$$
DELIMITER ;
call borrarTipoSocio('22222222B');
select * from socios;


-- 4) Modificar todo de un socio menos el dni
drop procedure if exists modificarSocio;
DELIMITER $$
create procedure modificarSocio(in pDni varchar(9), pNombre varchar(20), pApellido1 varchar(20), 
	pApellido2 varchar(20), pFNacimiento date, pFAlta date, pSaldo decimal(5,2), pSedeBase int(1), pTipoSocio varchar(10))
begin
	update Socios
		set datosPersonales = JSON_REPLACE(datosPersonales, '$.nombre', pNombre, '$.apellidos.apellido1', pApellido1,
			'$.apellidos.apellido2', pApellido2, '$.fNacimiento', pFNacimiento),
            datosBiblioteca = JSON_REPLACE(datosBiblioteca, '$.fAlta', pFAlta, '$.saldo', pSaldo,
            '$.sedeBase', pSedeBase, '$.tipoSocio', pTipoSocio)
        where dni = pDni;
end
$$
DELIMITER ;
call modificarSocio('33333333C', 'NUEVO', 'NUEVO', 'NUEVO', '2000-01-01', '2000-01-01', 10, 10, 'NUEVO');
select * from socios;


-- 5) Modificar Saldo de socio
drop procedure if exists modificarSaldo;
DELIMITER $$
create procedure modificarSaldo(in pDni varchar(9), pSaldoNuevo decimal(5,2))
begin
	update Socios
		set datosBiblioteca = JSON_REPLACE(datosBiblioteca, '$.saldo', pSaldoNuevo)
        where dni = pDni;
end
$$
DELIMITER ;
call modificarSaldo('44444444D', 1);
select * from Socios;


-- 6) Mostrar todos los datos de los socios
drop procedure if exists mostrarSocios;
DELIMITER $$
create procedure mostrarSocios()
begin
	select dni, datosPersonales->>'$.nombre' as "nombre", datosPersonales->>'$.apellidos.apellido1' as "apellido 1",
			 datosPersonales->>'$.apellidos.apellido2' as "apellido 2", datosPersonales->>'$.fNacimiento' as "fNacimiento", 
             datosBiblioteca->>'$.fAlta' as "fAlta", datosBiblioteca->>'$.saldo' as "Saldo",
             datosBiblioteca->>'$.sedeBase' as "Sede Base", datosBiblioteca->>'$.tipoSocio' as "TipoSocio"
		from Socios;
end
$$
DELIMITER ;
call mostrarSocios();
*/


-- ----------------------------------------------------------------------------------------
-- PROCEDIMIENTOS PARA LIBROS 
-- ----------------------------------------------------------------------------------------

-- 1) Añadir Libro
drop procedure if exists addLibro;
DELIMITER $$
create procedure addLibro(in pIsbn varchar(10), pDatosLibro json, pDatosDisponibilidad json)
begin
	insert into Libros values (pIsbn, pDatosLibro, pDatosDisponibilidad);
end
$$
DELIMITER ;


-- 2) Borrar libro
drop procedure if exists borrarLibro;
DELIMITER $$
create procedure borrarLibro(in pISBN varchar(9))
begin
	delete from Libros
		where isbn = pISBN;
end
$$
DELIMITER ;
call borrarLibro('1111111111');
select * from Libros;


-- 3) Borrar editorial del isbn especificado
drop procedure if exists borrarEditorialLibro;
DELIMITER $$
create procedure borrarEditorialLibro(in pISBN varchar(10))
begin
	update Libros
		set datosLibro = JSON_REMOVE(datosLibro, '$.editorial')
        where isbn = pISBN;
end
$$
DELIMITER ;
call borrarEditorialLibro('2222222222');
select * from Libros;


-- 4) Modificar todo de un libro menos el isbn
drop procedure if exists modificarLibro;
DELIMITER $$
create procedure modificarLibro(in p_isbn varchar(10), p_titulo varchar(20), p_autor varchar(20), 
	p_editorial varchar(20), p_fPublicacion date, p_fAdquisicion date, p_ejemplares int)
begin
	update Libros
		set datosLibro = JSON_REPLACE(datosLibro, '$.titulo', p_titulo, '$.autor', p_autor,
				'$.editorial', p_editorial, '$.fPublicacion', p_fPublicacion),
            datosDisponibilidad = JSON_REPLACE(datosDisponibilidad, '$.fAdquisicion', p_fAdquisicion, 
				'$.ejemplares', p_ejemplares)
        where isbn = p_isbn;
end
$$
DELIMITER ;
call modificarLibro('3333333333', 'NUEVO', 'NUEVO', 'NUEVO', '2000-01-01', '2000-01-01', 10);
select * from Libros;


-- 5) Modificar ejemplares de un libro
drop procedure if exists modificarEjemplares;
DELIMITER $$
create procedure modificarEjemplares(in p_isbn varchar(10), p_ejemplares int)
begin
	update Libros
		set datosDisponibilidad = JSON_REPLACE(datosDisponibilidad, '$.ejemplares', p_ejemplares)
        where isbn = p_isbn;
end
$$
DELIMITER ;
call modificarEjemplares('4444444444', 0);
select * from Libros;


-- 6) Mostrar todos los datos de los Libros
drop procedure if exists mostrarLibros;
DELIMITER $$
create procedure mostrarLibros()
begin
	select isbn, datosLibro->>'$.titulo' as "titulo", datosLibro->>'$.autor' as "autor",
			 datosLibro->>'$.editorial' as "editorial", datosLibro->>'$.fPublicacion' as "fPublicacion", 
             datosDisponibilidad->>'$.fAdquisicion' as "'fAdquisicion", 
             datosDisponibilidad->>'$.ejemplares' as "ejemplares"
		from Libros;
end
$$
DELIMITER ;
call mostrarLibros();

-- ----------------------------------------------------------------------------------------
-- PROCEDIMIENTOS PARA ALQUILERES 
-- ----------------------------------------------------------------------------------------
-- 1) Mostrar tabla Alquileres
drop procedure if exists mostrarAlquileres;
DELIMITER $$
create procedure mostrarAlquileres()
begin
	select s.dni, datosPersonales->>'$.nombre' as "nombre", datosPersonales->>'$.apellidos.apellido1' as "apellido 1",
			 datosPersonales->>'$.apellidos.apellido2' as "apellido 2", datosPersonales->>'$.fNacimiento' as "fNacimiento", 
             datosBiblioteca->>'$.fAlta' as "fAlta", datosBiblioteca->>'$.saldo' as "Saldo",
             datosBiblioteca->>'$.sedeBase' as "Sede Base", datosBiblioteca->>'$.tipoSocio' as "TipoSocio",
             
             l.isbn, datosLibro->>'$.titulo' as "titulo", datosLibro->>'$.autor' as "autor",
			 datosLibro->>'$.editorial' as "editorial", datosLibro->>'$.fPublicacion' as "fPublicacion", 
             datosDisponibilidad->>'$.fAdquisicion' as "'fAdquisicion", 
             datosDisponibilidad->>'$.ejemplares' as "ejemplares",
             
             FechaAlquiler, FechaDevolucionReal
             
             
		from Socios s
        inner join Alquileres a on s.dni = a.DNI
        inner join Libros l on a.ISBN = l.isbn;
end
$$
DELIMITER ;
call mostrarAlquileres();




-- ----------------------------------------------------------------------------------------
set sql_safe_updates = 1;