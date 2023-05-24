/*************************************
***   SIN BD - CONDICIONALES *********
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL II*/

-- ------------------Estructuras de control condicionales IF . . . ELSE ---------------
-- Escribe un procedimiento “dameNota” que reciba un número real de entrada, que representa el valor de la nota de un alumno, 
-- y muestre un mensaje indicando si ha superado o no el módulo:
-- [0,5) = No superado
-- [5,10] = Superado

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS dameNota;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento dameNota
-- recibe como parametro de entrada la nota del alumno como un numero entero
CREATE PROCEDURE dameNota (NOTA_ALUMNO INTEGER)
BEGIN
-- Declaracion de variables
DECLARE TEXTO VARCHAR(50);
-- Si la nota pasada como parametro es menor que 5 se inserta el siguiente mensaje en la variable texto
IF NOTA_ALUMNO<5 THEN
	SET TEXTO='El módulo no ha sido superado';
-- Si la nota pasada como parametro es 5 o superior, se inserta el siguiente mensaje en la variable texto
ELSE
	SET TEXTO='El módulo ha sido superado';
END IF;
-- Se muestra el contenido de la variable texto
SELECT TEXTO AS Mensaje;
END
$$
-- Se devuelve el valor por defecto al delimitador
DELIMITER ;
-- Llamadas al procedimiento
CALL dameNota(6);

-- ------------------Estructuras de control condicionales IF . . . ELSEIF . . . ELSE ---------------

-- Escribe un procedimiento llamado “esPositivo” que reciba un número real de entrada y 
-- muestre un mensaje indicando si el número es positivo, negativo o cero.
use bdPedidos;

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS esPositivo;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento esPositivo
-- recibe como argumento de entrada un numero como un numero entero
CREATE PROCEDURE esPositivo (num INTEGER)
BEGIN
-- Declaracion de variables
DECLARE TEXTO VARCHAR(50);
-- Compara si el numero pasado como parametro es mayor que 0 y asigna un valor a la variable
IF num>0 THEN
	SET TEXTO = CONCAT('El número ',num,' es positivo');
-- Compara si el numero pasado como parametro es menor que 0 y asigna un valor a la variable
ELSEIF  num<0 THEN
	SET TEXTO = CONCAT('El número ',num,' es negativo');
-- Si el numero pasado como parametro no es ni mayor que 0 ni menor que 0, entonces es que es 0
ELSE
	SET TEXTO = CONCAT('El número ',num,' es, eso, un cero');
END IF;
-- Muestra el contenido de la variable
SELECT TEXTO AS Mensaje;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL esPositivo(0);


-- Escribe un procedimiento “dameNota2” que reciba un número real de entrada, que representa 
-- el valor de la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
-- [0,5) = Insuficiente
-- [5,6) = Aprobado
-- [6, 7) = Bien
-- [7, 9) = Notable
-- [9, 10] = Sobresaliente
-- En cualquier otro caso la nota no será válida.

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS dameNota2;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento dameNota2
-- recibe como parametro la nota de un alumno como un numero entero
CREATE PROCEDURE dameNota2 (NOTA_ALUMNO INTEGER)
BEGIN
-- Declaracion de variables
DECLARE TEXTO VARCHAR(50);
-- Compara si la nota pasada como parametro de un alumno esta entre 0 y 5
IF NOTA_ALUMNO>=0 AND NOTA_ALUMNO<5 THEN
	SET TEXTO='INSUFICIENTE';
-- Compara si la nota pasada como parametro de un alumno esta entre 5 y 6
ELSEIF  NOTA_ALUMNO>=5 AND NOTA_ALUMNO<6 THEN
	SET TEXTO='APROBADO';
-- Compara si la nota pasada como parametro de un alumno esta entre 6 y 7
ELSEIF  NOTA_ALUMNO>=6 AND NOTA_ALUMNO<7 THEN
	SET TEXTO='BIEN';
-- Compara si la nota pasada como parametro de un alumno esta entre 7 y 9
ELSEIF  NOTA_ALUMNO>=7 AND NOTA_ALUMNO<9 THEN
	SET TEXTO='NOTABLE';
-- Compara si la nota pasada como parametro de un alumno esta entre 9 y 10
ELSEIF  NOTA_ALUMNO>=9 AND NOTA_ALUMNO<=10 THEN
	SET TEXTO='SOBRESALIENTE';
-- Si la nota pasada como parametro no esta en cualquiera de los casos anteriores, se considera que no es valida
ELSE
	SET TEXTO='NOTA NO VALIDA';
END IF;
-- Muestra el siguiente mensaje
SELECT CONCAT('LA CALIFICACIÓN CORRESPONDIENTE A LA NOTA ', NOTA_ALUMNO, ' ES ',TEXTO) AS Mensaje;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL dameNota2(6);

-- Escribe un procedimiento “esPar” que te muestre por pantalla si un número es par, impar o 0. 
-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS esPar;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento esPar
-- recibe como parametro de entrada un numero entero
CREATE PROCEDURE esPar(numero integer)
BEGIN
	-- Declaracion de variables
    DECLARE texto varchar(100); 
    -- El operador % me devuelve el resto de la división entera
    -- Compara el numero pasado como parametro con el 0 y almacena un mensaje en la variable
    IF numero = 0 THEN 
        SET texto = 'eso, un cero';
	-- Comprueba si el numero es divisible por 2, es decir, si al dividirlo por 2 el resto es igual a 0
    -- y almacena un mensaje en la variable
    ELSEIF numero % 2 = 0 THEN 
        SET texto = 'par';
	-- Si no es ninguna de las opciones anteriores almacena el siguiente mensaje en la variable
    ELSE
		SET texto = 'impar';
    END IF;

	-- Muestra el siguiente mensaje por pantalla
    SELECT CONCAT('El número ',numero,' es ',texto) AS Información;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL esPar(0);
CALL esPar(3);


-- ------------------Estructuras de control condicionales CASE ---------------

-- 	Modifica el procedimiento “esPositivoCase” haciendo uso de la estructura de control CASE. 
-- Llámalo “esPositivoCase”.

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS esPositivoCase;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento esPositivoCase
-- recibe como parametro de entrada un numero entero
CREATE PROCEDURE esPositivoCase (num INTEGER)
BEGIN
-- Declaracion de variables
DECLARE TEXTO VARCHAR(50);
-- Compara el valor del parametro de entrada con el numero 0 y almacena un mensaje en la variable
CASE
	WHEN num>0 THEN
		SET TEXTO = CONCAT('El número ',num,' es positivo');
	WHEN  num<0 THEN
		SET TEXTO = CONCAT('El número ',num,' es negativo');
	ELSE
		SET TEXTO = CONCAT('El número ',num,' es, eso, un cero');
END CASE;
-- Muestra el valor de la variable
SELECT TEXTO AS Mensaje;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL esPositivoCase(-5);

-- Modifica el procedimiento “dameNota” haciendo uso de la estructura de control CASE. Llámalo “dameNotaCase”.
-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS dameNotaCase;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento dameNotaCase
-- Recibe como parametro de entrada la nota de un alumno como un numero entero
CREATE PROCEDURE dameNotaCase (NOTA_ALUMNO INTEGER)
BEGIN
-- Declaracion de variables
DECLARE TEXTO VARCHAR(50);
-- Compara el valor de la nota pasada como parametro para ver si esta en una serie de valores
-- y guarda un valor en la variable
CASE
	WHEN NOTA_ALUMNO>=0 AND NOTA_ALUMNO<5 THEN SET TEXTO='INSUFICIENTE';
	WHEN NOTA_ALUMNO>=5 AND NOTA_ALUMNO<6 THEN SET TEXTO='APROBADO';
	WHEN NOTA_ALUMNO>=6 AND NOTA_ALUMNO<7 THEN SET TEXTO='BIEN';
	WHEN NOTA_ALUMNO>=7 AND NOTA_ALUMNO<9 THEN SET TEXTO='NOTABLE';
	WHEN NOTA_ALUMNO>=9 AND NOTA_ALUMNO<=10 THEN SET TEXTO='SOBRESALIENTE';
	ELSE SET TEXTO='NOTA NO VALIDA';
END CASE;
-- Muestra el siguiente mensaje
SELECT CONCAT('LA CALIFICACIÓN CORRESPONDIENTE A LA NOTA ', NOTA_ALUMNO, ' ES ',TEXTO) AS Mensaje;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL dameNotaCase(11);

-- Escribe un procedimiento llamado “diaSemana” que reciba como parámetro de entrada un valor numérico que represente un día de la semana 
-- y que escriba por pantalla una cadena de caracteres con el nombre del día de la semana correspondiente. 
-- Por ejemplo, para el valor de entrada 1 debería devolver la cadena ‘El día de la semana es lunes’.

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS diaSemana;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento diaSemana
-- recibe como parametro de entrada un dia de la semana como un numero entero
CREATE PROCEDURE diaSemana (DIA INTEGER)
BEGIN
-- Declaracion de variables
DECLARE TEXTO VARCHAR(50);
-- Compara el valor del parametro para ver si pertenece o no a un dia de la semana
-- (lunes a domingo) y almacena el resultado en la variable
CASE
	WHEN DIA=1 THEN SET TEXTO='LUNES';
	WHEN DIA=2 THEN SET TEXTO='MARTES';
	WHEN DIA=3 THEN SET TEXTO='MIERCOLES';
	WHEN DIA=4 THEN SET TEXTO='JUEVES';
	WHEN DIA=5 THEN SET TEXTO='VIERNES';
	WHEN DIA=6 THEN SET TEXTO='SABADO';
	WHEN DIA=7 THEN SET TEXTO='DOMINGO';
	ELSE SET TEXTO='DIA NO VALIDO';
END CASE;
-- Muestra el siguiente mensaje
SELECT CONCAT('EL DIA ',DIA,' DE LA SEMANA ES ', TEXTO) AS Mensaje;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL diaSemana(10);

-- ------------------Estructuras de control condicionales complejas y/o anidadas ---------------

-- Implementar un script llamado “tarifahotel“ que calcule (y muestre) 
-- el precio de una habitación de un hotel en base a la temporada (ALTA, MEDIA o BAJA), 
-- el número de noches y el tipo de habitación (VISTAS o INTERIOR). 
-- El procedimiento  usará al menos 3 variables (a las que asignaremos valores constantes) 
-- para los 3 datos descritos. 
-- El precio BASE por noche de una habitación con vistas es de 80 € y el de la interior es de 60 €. 
-- En temporada ALTA se aplica un incremento del 20% al precio base y en la BAJA un descuento del 10%.

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS tarifaHotel;
-- Cambia el procedimiento
DELIMITER $$
-- Crea el procedimiento tarifaHotel
-- Recibe como primer parametro de entrada la temporada como una cadena de 6 caracteres
-- Recibe como segundo parametro de entrada el numero de noches como un numero entero
-- Recibe como tercer parametro el tipo de habitacion (exterior o cualquier otro) como una cadena de 9 caracteres
CREATE PROCEDURE tarifaHotel (TEMPORADA VARCHAR(6),NUM_NOCHES INTEGER, HABITACION VARCHAR(9))
BEGIN
	-- Declaracion de variables
	DECLARE PRECIO INTEGER;
    -- Comprueba si el tipo de habitacion es exterior y calcula el precio
    -- como el numero de noches multiplicado por 80
    IF HABITACION='EXTERIOR' THEN
		SET PRECIO=NUM_NOCHES*80;
	-- Si la habitacion no es exterior se calcula el precio
    -- como el numero de noches multiplicado por 60
	ELSE 
		SET PRECIO=NUM_NOCHES*60;
	END IF;
    -- Comprueba si el la temporada el alta y recalcula el precio
    -- como el precio anterior multiplicado por 1,2 (aumento del 20%)
    IF TEMPORADA ='ALTA' THEN
		SET PRECIO=PRECIO*1.2;
	-- Si no es temporada alta, comprueba si la temporada es baja y recalcula el precio
    -- como el precio anterior multiplicado por 0,9 (rebaja del 10%)
	ELSEIF TEMPORADA ='BAJA' THEN 
		SET PRECIO=PRECIO*0.9;
	END IF;
    -- Muestra el siguiente mensaje
    SELECT CONCAT('EL PRECIO DE LA HABITACION ES DE ', PRECIO,' EUROS') AS Mensaje;
END;
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
CALL tarifaHotel('BAJA', 5, 'EXTERIOR');

