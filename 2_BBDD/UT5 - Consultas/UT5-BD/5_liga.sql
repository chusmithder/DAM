/* BASE DE DATOS DE JUGADORES DE LA LIGA DE BALONCESTO */

-- Borramos la base de datos si ya existe
-- Esto es necesario porque, ¿qué pasaria si ya existiera una base de datos llamada "liga" 
-- pero no contuviera las tablas que dseamos?
DROP DATABASE IF EXISTS liga;

-- Creamos la base de datos
-- Nos hemos asegurado de borrarla en el paso anterior, así que la creación no puede dar ningún problema
CREATE DATABASE liga;

-- Antes de comenzar a crear las tablas, debemos seleccionar la base de datos que acabamos de crear
USE liga;

-- Ahora ya podemos crear la tabla de jugadores
-- Debemos asegurarnos de que los nombres de los campos, su tipo y sus restricciones
-- se corresponden con lo definido en el diseño conceptual y lógico
CREATE TABLE jugadores (
	ID INTEGER UNSIGNED, -- No hace falta añadir la restricción NOT NULL porque tiene la restricción PRIMARY KEY
    nombre VARCHAR(25) NOT NULL, 
    apellido VARCHAR(25) NOT NULL,
    posicion ENUM('escolta', 'base', 'pivot', 'alero'),
    fecha_alta DATE DEFAULT (NOW()),
    salario DECIMAL (8,2),
    altura DECIMAL(3,2),
    equipo VARCHAR(25),
    PRIMARY KEY (ID) -- Después de la definición de todos los campos, añadimos la restriccion de PRIMARY KEY    
);

INSERT INTO jugadores VALUES (1, 'Juan Carlos', 'Navarro', 'escolta', '2010-01-10', 130000, null, 'Regal Barcelona');
INSERT INTO jugadores VALUES (2, 'Felipe', 'Reyes', 'Pivot', '2009-02-20', 120000, 2.04, 'Real Madrid');
INSERT INTO jugadores VALUES (3, 'Fernando', 'San Emeterio', 'Alero', '2008-09-22', 60000, 1.99, 'Caja Laboral');
INSERT INTO jugadores VALUES (4, 'Mirza', 'Teletovic', 'Pivot', '2010-05-13', 70000, 2.06, 'Caja Laboral');
INSERT INTO jugadores VALUES (5, 'Sergio', 'LLul', 'escolta', '2011-10-29', 100000, 1.90, 'Real Madrid');
INSERT INTO jugadores VALUES (6, 'Victor', 'Sarda', 'Base', '2012-01-01', 80000, 1.92, 'Regal Barcelona');
INSERT INTO jugadores VALUES (7, 'Carlos', 'Suarez', 'Alero', '2011-02-19', 60000, 2.03, 'Real Madrid');
INSERT INTO jugadores VALUES (8, 'Carlos', 'Cabezas', 'Base', '2012-01-21', 105000, 1.86, 'CAI Zaragoza');
INSERT INTO jugadores VALUES (9, 'Pablo', 'Aguilar', 'Alero', '2011-06-14', 47000, 2.03, 'CAI Zaragoza');
INSERT INTO jugadores VALUES (10, 'Rafa', 'Hetrsheimeir', 'Pivot', '2008-04-15', 53000, 2.08, 'CAI Zaragoza');
INSERT INTO jugadores VALUES (11, 'Víctor', 'Claver', 'Alero','2009-03-08', 90000, 2.08, 'Valencia Basket');
INSERT INTO jugadores VALUES (12, 'Rafa', 'Martínez', null, '2010-03-18', null, 1.91, 'Valencia Basket');
INSERT INTO jugadores (ID, nombre, apellido, fecha_alta) VALUES (13, 'Xavi', 'Rey', '2008-10-12');
INSERT INTO jugadores VALUES (14, 'Sitapha', 'Savane', 'Pivot', '2008-07-27', 60000, 2.01,'Gran Canaria'),
	(15, 'Alberto', 'Albalde', 'Alero', '2012-03-04', 75000, 2.02, 'Valencia Basket');
INSERT INTO jugadores (ID, nombre, apellido, posicion, salario, altura, equipo)
	VALUES (16, 'Victor', 'Claver', 'Alero', 90000, 2.08, 'Valencia Basket');
INSERT INTO jugadores VALUES (17, 'Nicola', 'Mirotic', 'Alero', null, 93000, 2.08, 'Regal Barcelona');



select * from jugadores;

/*
set sql_safe_updates = 0;
update jugadores
	set salario = salario - 112340
    where id = 1;
set sql_safe_updates = 1;

set sql_safe_updates = 0;
delete from jugadores
	where year(fecha_alta) < 2010;
set sql_safe_updates = 1;
*/