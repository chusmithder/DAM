/* BASE DE DATOS DE UNA FERRETERIA */

-- Borramos la base de datos si ya existe
DROP DATABASE IF EXISTS bdFerreteria;

-- Creamos la base de datos
-- Nos hemos asegurado de borrarla en el paso anterior, así que la creación no puede dar ningún problema
CREATE DATABASE bdFerreteria;

-- Antes de comenzar a crear las tablas, debemos seleccionar la base de datos que acabamos de crear
USE bdFerreteria;

-- Ahora ya podemos crear la tabla de productos
-- Debemos asegurarnos de que los nombres de los campos, su tipo y sus restricciones
-- se corresponden con lo definido en el diseño conceptual y lógico
CREATE TABLE productos (
	fabrica VARCHAR(3), -- No hace falta añadir la restricción NOT NULL porque tiene la restricción PRIMARY KEY
    id_producto VARCHAR(5), -- No hace falta añadir la restricción NOT NULL porque tiene la restricción PRIMARY KEY
    descripcion VARCHAR(25),
    precio DECIMAL (6,2),
    existencias INTEGER UNSIGNED DEFAULT 0,
    PRIMARY KEY (fabrica, id_producto) -- En este caso tenemos una clave primaria compuesta de dos atributos
);

/* BASE DE DATOS DE UNA FERRETERIA */

-- Insertamos los datos en la tabla de productos
INSERT INTO productos VALUES ('aci', '41001', 'Arandela', 58, 277);
INSERT INTO productos VALUES ('aci', '41002', 'Bisagra', 80, 167);
INSERT INTO productos VALUES ('aci', '41003', 'Tornillo', 112, 207);
INSERT INTO productos VALUES ('aci', '41004', 'Cubo', 123, 139);
INSERT INTO productos VALUES ('aci', '4100x', 'Junta', 26, 37);
INSERT INTO productos VALUES ('aci', '4100y', 'Extractor', 2888, 25);
INSERT INTO productos VALUES ('bic', '41001', 'Manivela', 652, 3);
INSERT INTO productos VALUES ('bic', '41002', 'Rodamiento', 225, 78);
INSERT INTO productos VALUES ('bic', '4100x', 'Arandela', 180, 0);
INSERT INTO productos VALUES ('fea', '4100y', 'Cubo', 148, 115);
INSERT INTO productos VALUES ('fea', '41003', 'Junta', 243, 15);
