 /*************************************
***   JARDINERÍA - PROCEDIMIENTOS  *********
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL I*/

-- Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y 
-- realice una consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país 
-- y los muestre por pantalla.
 USE bdJardineria;
 
 -- Eliminar el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS clientesPais;
 -- Cambiar el delimitador
 DELIMITER $$
 -- Crear el procedimiento clientesPais
 -- recibe como parametro de entrada el nombre del pais como una cadena de 50 caracteres
 CREATE PROCEDURE clientesPais(paramPais varchar (50))
 BEGIN
	-- muestra los datos por pantalla donde el nombre del pais sea igual al parametro pasado al procedimiento
	SELECT NombreCliente, Ciudad, Pais FROM clientes where pais=paramPais;  
 END $$
 -- Devuelve el delimitador a su valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL clientesPais('Australia');


-- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, 
-- que será una cadena de caracteres (Ejemplo: PayPal, Transferencia, etc). 
-- Y que muestre por pantalla el pago de máximo valor realizado para esa forma de pago. 
 USE bdJardineria;
 
 -- Elimina el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS pagoMaximo;
 -- Cambia el delimitador
 DELIMITER $$
 -- Crea el procedimiento pagoMaximo
 -- recibe como parametro de entrada la forma de pago como una cadena de 40 caracteres
 CREATE PROCEDURE pagoMaximo(paramFormaPago varchar (40))
 BEGIN
	-- Muestra por pantalla la concatenacion de la cadena solicitada cuya forma de pago sea igual que la pasada por parametro
	SELECT CONCAT ('El pago máximo que se ha hecho con ',paramFormaPago,' es ',MAX(Cantidad)) as 'Mensaje'  FROM pagos where FormaPago=paramFormaPago;  
 END $$
 -- Devuelve al delimitador el valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL pagoMaximo('PayPal');

-- Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena de caracteres 
-- (Ejemplo: PayPal, Transferencia, etc). y que muestre por pantalla los siguientes valores teniendo en cuenta ç
-- la forma de pago seleccionada como parámetro de entrada: 
-- el pago de máximo valor.
-- el pago de mínimo valor.
-- el valor medio de los pagos realizados.
-- la suma de todos los pagos, el número de pagos realizados para esa forma de pago.
USE bdJardineria;

-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS infoPagos;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento infoPagos
-- recibe como parametro de entrada la forma de pago como una cadena de 40 caracteres
CREATE PROCEDURE infoPagos(paramFormaPago varchar (40))
BEGIN
	-- muestra por pantalla las columnas solicitadas con sus respectivos alias cuya forma de pago sea igual a la pasada por parametro
    SELECT MAX(Cantidad) AS 'Pago máximo', MIN(cantidad) as 'Pago Mínimo', AVG(cantidad) as 'Pago medio', SUM(cantidad) as 'Pagos totales' 
    from pagos where FormaPago=paramFormaPago;
END $$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL infoPagos('PayPal');

