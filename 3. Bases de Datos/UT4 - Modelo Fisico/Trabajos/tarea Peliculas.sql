---------------------------------------
-- 1. PELICULAS
--------------------------------------
-- Crea una base de datos llamada "videoclub"
drop database if exists videoclub;
create database videoclub;

use videoclub;

/*Crea una tabla denominada "peliculas" con la siguiente estructura:
 - codigo (numero entero positivo, clave primaria)
 - titulo (cadena de 30, obligatorio)
 - duracion (numero entero positivo)
 - valoracion (numero decimal, de 0.0 a 10.0)
 - tipo (lista de valores: Infantil, Público general, Adultos)
 - año de estreno (obligatorio)
 - El conjunto de los campos titulo y año de estreno no se puede repetir
*/ 
create table peliculas(
codigo int(10),
titulo varchar(30) not null,
duracion int(3),
valoracion decimal(11,1),
tipo varchar(10),
anioEstreno date not null,
constraint pe_co_PK primary key (codigo),
constraint pe_co_CK check (codigo > 0),
constraint pe_du_CK check (duracion > 0),
constraint pe_va_CK check (valoracion >= 0 && valoracion < 10),
constraint pe_tp_CK check (tipo in ('Infantil', 'Público general', 'Adultos')),
constraint pe_ti_UQ unique (titulo),
constraint pe_an_UQ unique (anioEstreno)
);

-- Visualiza la estructura de la tabla películas.
SELECT * FROM peliculas;

-- Cambia el nombre de la tabla "peliculas" para que se denomine "alquileres"
rename table peliculas to alquileres;

-- Cambia el nombre de la columna "tipo" por "edad_recomedada"
alter table alquileres rename column tipo to edad_recomedada;

-- Añade una nueva columna denominada "ultima_fecha_alquiler" que almacene la fecha y la hora de alquiler.
alter table alquileres add column ultima_fecha_alquiler datetime;

-- ////////// Modifica la columna "ultima_fecha_alquiler" para que su valor por defecto sea la fecha y hora actual.
alter table alquileres change ultima_fecha_alquiler  ultima_fecha_alquiler datetime default (current_timestamp());

-- Elimina la clave primaria
alter table alquileres drop primary key;

-- Elimina la clave alternativa (unique)
alter table alquileres drop index pe_ti_UQ;
alter table alquileres drop index pe_an_UQ;

-- Añade una clave primaria compuesta de los campos titulo y año de estreno
alter table alquileres add constraint pe_tian_PK primary key (titulo, anioEstreno);


-- Visualiza el código que genera la tabla alquileres
SHOW CREATE TABLE alquileres;

-------------------------------------
-- B) PIZZERIA 
-------------------------------------

/*Un comercio que envía pizzas y empanadas a domicilio registra los siguientes datos de sus pedidos:
 - numero de pedido: entero positivo. Clave primaria.
 - nombre: texto de máximo 50 caracteres. Obligatorio.
 - tipo: pizza o empanada, por defecto "empanada"
 - precio: precio total del pedido, valor con decimales. Obligatorio.
 - cantidad: cantidad de articulos, entero positivo, por defecto "1". Obligatorio.
 - domicilio del cliente.
 - recoger: si / no
 - fecha y hora del pedido: fecha y hora. Por defecto, fecha y hora actual. Obligatorio.
 - fecha y hora de entrega: fecha y hora.
 
*/

-- Crea la base de datos "pizzeria"
drop database if exists pizzeria;
create database pizzeria;

use pizzeria;

-- Crea la tabla "pedidos" eligiendo el tipo de dato adecuado para cada campo.
create table pedidos(
numPedido int(10),
nombre varchar(50) not null,
tipo varchar(10) default 'empanada',
precio decimal(4,2) not null,
cantidad int(3) not null default '1',
domCliente varchar(30),
recoger varchar(2),
f_h_pedido datetime not null,
f_h_entrega datetime,
constraint pe_np_PK primary key (numPedido),
constraint pe_ti_CK check (tipo in ('pizza', 'empanada')),
constraint pe_ca_CK check (cantidad > 0),
constraint pe_re_CK check (recoger in ('si','no'))
);


-- Visualiza la estructura de la tabla creada.
SELECT * FROM pedidos;

-- Cambia el nombre de la columna "recoger" por "a_domicilio" y haz que tenga un valor defecto de "no"
alter table pedidos rename column recoger to a_domicilio;

-- Añade una nueva columna denominada "telefono" que almacene un telefono de contacto de forma obligatoria.
alter table pedidos add column telefono varchar(9) not null;

-- Modifica la columna "fecha y hora de recogida" para que almacene únicamente la hora de entrega.
alter table pedidos change f_h_entrega f_h_entrega time;


-- Cambia el nombre de la columna "fecha y hora de recogida" por "hora de recogida"
alter table pedidos rename column f_h_entrega to hora_de_recogida;


-- Elimina la columna "cantidad"
alter table pedidos drop column cantidad;

-- Elimina la tabla "pedidos". Vuelve a crear la tabla incluyendo todos los cambios realizados en los pasos anteriores en su definición.
 drop table if exists pedidos;