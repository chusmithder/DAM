/*PROGRAMACIÓN DE BBDD EN MYSQL I*/
/*BDPedidos*/
-- Escribe un procedimiento denominado ‘cambiarNombreCliente’ que actualice 
-- el nombre de un cliente. (Ayuda: recibe dos parámetros, numero de cliente de quien se va actualizar y el nuevo nombre) 
-- Cambia el delimitador
DELIMITER $$
USE `bdPedidos`$$
-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS `cambiarNombreCliente`;
-- Crea el procedimiento cambiarNombreCliente
-- recibe como primer parametro de entrada el numero del cliente como un numero entero
-- recibe como segundo parametro de entrada el nuevo nombre del cliente como una cadena de 50 caracteres
CREATE PROCEDURE `cambiarNombreCliente` (pNumCliente integer, pNombre varchar(50))
BEGIN
	-- Actualiza el nombre del cliente pasado como parametro con el nuevo nombre pasado por parametro
	update clientes
    set nombre = pNombre
    where num_cliente = pNumCliente;
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
start transaction;
CALL cambiarNombreCliente(2101, 'Pepe Sanz');
commit;
CALL cambiarNombreCliente(2102, 'Antonio Perez');

-- Escribe un procedimiento denominado ‘borrarPedido’ Que elimine un pedido. 
-- (Ayuda: recibe un parámetro, numero de pedido que se va eliminar)
-- Cambia el delimitador
DELIMITER $$
USE `bdPedidos`$$
-- Elimina el procedimiento si ya existe
DROP PROCEDURE IF EXISTS `borrarPedido`;
-- Crea el procedimiento borrarPedido
-- recibe como parametro de entrada el numero de pedido coo un numero entero
CREATE PROCEDURE `borrarPedido` (numPedido integer)
BEGIN
	-- Elimina el pedido cuyo numero de pedido sea igual que se ha pasado como parametro
	delete from pedidos
    where num_pedido = numPedido;
END$$
-- Devuleve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas al procedimiento
CALL borrarPedido(110035);
CALL borrarPedido(110036);
