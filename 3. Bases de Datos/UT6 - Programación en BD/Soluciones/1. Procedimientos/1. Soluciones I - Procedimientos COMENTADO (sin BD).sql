/*PROGRAMACIÓN DE BBDD EN MYSQL I*/
/*Procedimientos sin BBDD*/

-- Escribe un procedimiento denominado ‘holaMundo’ que muestre el texto ¡Hola mundo!.
use bdPedidos;
-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `holaMundo`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento holaMundo
-- no recibe ningun parametro de entrada
CREATE PROCEDURE `holaMundo` ()
BEGIN
	-- Muestra un mesaje por pantalla
	select '¡Hola Mundo!' AS 'Mensaje de salida';
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL holaMundo();

-- Escribe un procedimiento denominado ‘muestraFecha’ que muestre la fecha actual con un mensaje de este tipo.
-- Elimiana el procedimiento si ya existe
DROP procedure IF EXISTS `muestrafecha`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento
-- no recibe ningun parametro de entrada
CREATE PROCEDURE `muestrafecha` ()
BEGIN
	-- Muestra un mensaje por pantalla
	select CONCAT('Today is ',DAY(CURDATE()),' of ',MONTHNAME(CURDATE()),' ',YEAR(CURDATE())) AS 'Mensaje';
END $$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL muestrafecha();

-- Escribe un procedimiento denominado ‘holaNombre’ que reciba un nombre (ej. Alba) y le
-- muestre el saludo ¡Hola Alba!.

-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `holaNombre`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento holaNombre
-- recibe como parametro de entrada un nombre como una cadena de 100 caracteres
CREATE PROCEDURE `holaNombre` (nombre varchar(100))
BEGIN
	-- Muestra por pantalla un mensaje dependiendo del parametro pasado
	select concat('¡Hola ',nombre, '!') AS 'Mensaje de saludo';
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL holaNombre('Luis');

-- Escribe un procedimiento denominado ‘muestraFechaDada’ que reciba una fecha (por ejemplo, ‘2020-05-09') 
-- como parámetro y muestre un mensaje de este tipo.
-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `muestrafechaDada`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento muestraFechaDada
-- recibe como parametro de entrada una fecha de tipo date
CREATE PROCEDURE `muestrafechaDada` (fecha date)
BEGIN
	-- Muestra por pantalla un mensaje con el dia, el mes y el año de la fecha pasada por parametro
	select CONCAT('The date is ',DAY(fecha),' of ',MONTHNAME(fecha),' ',YEAR(fecha)) AS 'Mensaje';
END $$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL muestrafechaDada('2020-05-09');

-- Reescribe el procedimiento “holaNombre” usando una variable local donde almacenarás el mensaje de salida 
-- para después mostrar el valor de esta variable. Pista: Usa SET y CONCAT ().
-- Elimina el procedimiento si existe
DROP procedure IF EXISTS `holaNombre`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el prodecimiento holaNombre
-- recibe como parametro de entrada un nombre como una cadena de 100 caracteres
CREATE PROCEDURE `holaNombre` (nombre varchar(100))
BEGIN
	-- Declaracion de variables
	declare texto varchar(150); -- DEFAULT concat('¡Hola ',nombre, '!');
    -- Asignacion de valores a las variables
    SET texto = concat('¡Hola ',nombre, '!');
    -- Muestra por pantalla el valor de la variable
	select texto  AS 'Mensaje de saludo';
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL holaNombre('Luis');

-- Reescribe el procedimiento “muestraFechaDada” usando 4 variables locales: 
-- en 3 almacenarás, respectivamente, el día, mes y año de la fecha proporcionada y 
-- en la otra almacenarás el mensaje de salida. Después mostrarás el valor de la variable “mensaje”. 
-- Pista: Usa SET y CONCAT ( ).
-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `muestrafechaDada`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento muestrafechaDada
-- recibe como parametro de entrada una fecha de tipo date
CREATE PROCEDURE `muestrafechaDada` (fecha date)
BEGIN
	-- Declaracion de variables
	declare diaDelMes int DEFAULT DAY(fecha);
    declare nombreMes varchar (15);
    declare anyo year;
	-- Asignacion de valores a las variables
    SET nombreMes = MONTHNAME(fecha);
    SET anyo = YEAR(fecha);
    -- Muestra por pantalla un mensaje mostrado los valores de las variables
    select CONCAT('The date is ',diaDelMes,' of ',nombreMes,' ',anyo) 
    AS 'Mensaje';
END $$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL muestrafechaDada('2020-05-09');


