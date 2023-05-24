/*
	Autor: Carlos
    Fecha: 05/05/2022
    Descripción: Pruebas CLASE UT7
*/

-- Crear base de datos vacía
drop database if exists agencia;
create database agencia;

-- Elegir la BBDD>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
use agencia;

CREATE TABLE events( 
  id int auto_increment primary key, 
  event_name varchar(255), 
  visitor varchar(255), 
  properties json, 
  browser json
);

INSERT INTO events(event_name, visitor, properties, browser) 
VALUES (
  'pageview',
   '1',
   '{ "page": "/" }',
   '{ "name": "Safari", "os": "Mac", "resolution": { "x": 1920, "y": 1080 } }'
),
('pageview', 
  '2',
  '{ "page": "/contact" }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 2560, "y": 1600 } }'
),
(
  'pageview', 
  '1',
  '{ "page": "/products" }',
  '{ "name": "Safari", "os": "Mac", "resolution": { "x": 1920, "y": 1080 } }'
),
(
  'purchase', 
   '3',
  '{ "amount": 200 }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1600, "y": 900 } }'
),
(
  'purchase', 
   '4',
  '{ "amount": 150 }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1280, "y": 800 } }'
),
(
  'purchase', 
  '4',
  '{ "amount": 500 }',
  '{ "name": "Chrome", "os": "Windows", "resolution": { "x": 1680, "y": 1050 } }'
);

select * from events;

/*SELECT id, browser->'$.name' as "browser"
FROM events;

SELECT id, browser->>'$.name' as "browser"
FROM events;

SELECT browser->>'$.name' as "browser", 
      count(browser)
FROM events
GROUP BY browser->>'$.name';

SELECT visitor, SUM(properties->>'$.amount') as "revenue"
FROM events
WHERE properties->>'$.amount' > 0
GROUP BY visitor;

SELECT browser->'$.resolution.x' as "Resolucion X",count(*) as "Cuantos"
FROM events
where browser->'$.resolution.x' > 1900
group by browser->'$.resolution.x';*/

set sql_safe_updates = 0;
-- Ejercicio: Buscar y probar las instrucciones necesarias para esto:
-- 1) Borrar un campo de un JSON, solo un campo, no todo
update events
	set browser = JSON_REMOVE(browser,'$.resolution.x')
	where ID = 1;
select * from events;

-- 2) Modificar un campo de un JSON, solo un campo, no todo
update events
	set browser = JSON_REPLACE(browser,'$.resolution.y','5000')
	where ID = 2;
select * from events;

-- 3) Borrar todo un registro
delete from events
	where ID = 3;
select * from events;

-- 4) Modificar todo un registro
update events
	set event_name = "nuevo",visitor ="nuevo",properties = JSON_REPLACE(properties,'$.amount','1111'),
	browser = JSON_REPLACE(browser,'$.os','MAC','$.name','Nuevo','$.resolution.x','11'
    ,'$.resolution.y','11')
	where ID = 4;
select * from events;

set sql_safe_updates = 1;

/* 
https://dev.mysql.com/doc/refman/8.0/en/json.html
https://www.mysqltutorial.org/mysql-json/
*/

/*
- dni pk
- json1: datospersonales: nombres apellidos, fchanac
- json2: datosbiblioteca: fechaalta, saldo, sedebase, tipoSocio 


1- procedimiento -> meter nuevos. parametrs de entrada(dni y los 2 json())
2- procedimiento para borrar un socio (parametro de entrada un dni)
3- procedimiento para vaciar(borrar) tipo de socio parametro de entrada(dni)
4- procedimiento para modificar todo de un socio menos dni parametro de entrada(dni Y LOS CAMPOS NUEVOS)
5- modificar saldo (dni, saldonuevo)
6- procedimiento para mostrar() sin parametros que nos muestre todo

------------------------------------------------------------
- isbn pk
- titulo, autor, editorial, fechapub: json datos de libros
- fechaadquisi, ejemplares: json datos disponibilidad

1- procedimiento -> meter nuevos. parametrs de entrada(isbn y los 2 json())
2- procedimiento para borrar un socio (parametro de entrada un dni)
3- procedimiento para vaciar(borrar) editorial parametro de entrada(isbn)
4- procedimiento para modificar todo de un socio menos isbn parametro de entrada(isbn Y LOS CAMPOS NUEVOS)
5- modificar ejemplares (isbn, ejemplares nuevos)
6- procedimiento para mostrar() sin parametros que nos muestre todo

------------------------------------------------------------
- ningun cambio
1- proc mostrar alquileres() sin parametros. que nos pongan: dni, nombre, apellido1, 
	apellido2, isbn, titulo, autor, falquiler, fdevolucion
*/