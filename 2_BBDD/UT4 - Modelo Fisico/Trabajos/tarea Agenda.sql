---------------------------------------------------------------------
-- A) Queremos almacenar los datos de nuestros amigos en una agenda.
---------------------------------------------------------------------

-- Creamos una base de datos "agenda"
-- ///////// create database agenda;


-- Mostramos la lista de bases de datos. ¿Ves alguna BD que no hayas creado tú? ¿Para qué sirven?
show databases;
-- ///////// Permiten que el usuaario pueda manipular de manera optima  distintas funciones en el programa

-- Volvemos a crear la misma base de datos. ¿Qué ocurre? ¿Cómo lo solucionamos? 
 drop database if exists agenda;
 create database agenda;
 
-- Pon un ejemplo que solo cree "agenda" si no existe y otro ejemplo que borre "agenda y luego la vuelva a crear.
-- /////////1- create database if not exists agenda;
-- /////////2- drop database if exists agenda;
-- /////////	 create database agenda;

-- ¿Podemos tener dos bases de datos con el mismo nombre? ¿Por qué?
-- ///////// No, cada bd debe tener un nombre único. ya que representa un conjunto de tablas específicas.

-- Seleccionamos "sys" y mostramos las tablas que tiene.
SHOW TABLES FROM sys;

use agenda;

-- Creamos la tabla "amigos" en nuestra base de datos "agenda" para almacenar:
-- DNI (PK)
-- nombre (NN)
-- apellidos (NN)
-- email
-- telefono
-- fecha de cumpleaños
-- tipo de amigo (estudios, vecino, trabajo, otros)
-- Nota: La tabla tendrá una clave alternativa llamada "cl_al_amigos" compuesta por "nombre" y "apellidos".

create table if not exists amigos(
DNI varchar(10), 
nombre varchar(20) not null,
apellidos varchar(20) not null,
email varchar(20),
telefono varchar(9),
fCumple date,
tipoAmigo varchar(10),
constraint am_dni_PK primary key (DNI),
constraint am_ta_CK check (tipoAmigo in ('estudios', 'vecino', 'trabajo', 'otros'))
-- constraint cl_al_amigos foreign key (nombre, apellidos) references dfsdfsdf(nombre, apellidos)
);

-- Mostramos la lista de tablas.
SHOW TABLES FROM agenda;

-- Volvemos a crear la misma tabla. ¿Qué ocurre? ¿Cómo lo solucionamos para que no la cree si ya existe??
-- ///////// create table if not exists agenda;

-- ¿Podemos tener dos tablas con el mismo nombre? ¿Por qué?
-- ///////// No porque cada una representa una entidad distinta dentro de la base de datos

-- Mostramos la definición de la tabla "amigos". 
SHOW CREATE TABLE amigos;

-- Borramos la tabla "amigos" y mostramos la lista de tablas para comprobar que ya no está.
drop table if exists amigos;
SHOW TABLES FROM agenda;

-- Volvemos a borrar la tabla "amigos". ¿Qué ocurre? ¿Cómo lo solucionamos?
-- ///////// lo solucianamos añadiendo "IF EXISTS" en drop table amigos

-- Borramos la base de datos "agenda" y mostramos la lista de bases de datos para comprobar que ya no está.
drop database if exists agenda;
show databases;

-- Volvemos a borrar la base de datos "agenda". ¿Qué ocurre? ¿Cómo lo solucionamos?
-- ///////// Nos da error, lo solucionamos escribiendo DROP DATABASE IF EXISTS *** en vez de DROP DATABASE ***


