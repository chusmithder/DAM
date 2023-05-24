create database if not exists bdBasicas;
use bdBasicas;

/*BD Básicas*/
drop table if exists empleados;
create table empleados(
	dni varchar(9) primary key,
    nombre varchar(30) not null,
    apellidos varchar(60) not null,
    email varchar(60),
    telefono integer not null,
    sueldo decimal (10,2) not null,
    puesto varchar(30) not null
);

drop table if exists libros;
create table libros(
	isbn integer primary key,
    titulo varchar(60) not null,
    tipo varchar (30) not null,
    autor varchar(90),
    precio decimal(8,2) not null
);

drop table if exists facturas;
create table facturas(
	codigo integer primary key,
    destinatario varchar(90) not null,
    cuenta integer not null,
    importe decimal(10,2) not null,
    fecha_hora datetime not null unique
);