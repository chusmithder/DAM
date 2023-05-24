------------------------------------------------------
--------- BD PEDIDOS - CONDICIONALES  -----------
------------------------------------------------------
/*PROGRAMACIÓN DE BBDD EN MYSQL II*/

-- Escribe un procedimiento denominado ‘actualizarPrecio’ que reciba una fábrica
-- y un producto como parámetro de entrada. Si el producto se ha vendido más de 3 veces,
-- aumentarle el precio un 5%. Si no, rebajarle el precio un 10%.
USE `bdPedidos`;

-- Elimina el procedimiento si existe
drop procedure if exists actualizarPrecio;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento actualizaPrecio
-- recibe como primer parametro de entrada el identificador de la fabrica como una cadena de 3 caracteres
-- recibe como segundo parametro de entrada el identificador de produrcto como una cadena de 50 caracteres
CREATE PROCEDURE `actualizarPrecio` (idFabrica varchar(3), idProducto varchar(50))
BEGIN
	-- Declaracion de variables
	DECLARE numPedidos integer;
    DECLARE descripcion varchar (100);
    declare texto varchar(100);
    -- Almacena en las variables cuantos pedidos se han hecho y la descripcion de los productos dependiendo de los parametros de entrada
    SELECT count(*), PR.descripcion INTO numPedidos, descripcion 
    FROM pedidos PE JOIN productos PR 
					on PE.fabrica=PR.id_fabrica AND PE.producto=PR.id_producto 
					where PE.fabrica = idFabrica and PE.producto = idProducto;
    
    -- Si hay mas de tres pedidos se actualiza el precio de los productos al 105% de su precio original
    IF numPedidos > 3 THEN
		update productos
        set precio = precio*1.05 where id_fabrica = idFabrica and id_producto = idProducto;
        set texto = CONCAT('Se ha aplicado al producto ',descripcion,' con ',numPedidos,' pedidos un incremento del 5%.');
	-- En caso contrario (se han realizado 3 o menos pedidos) se actualiza el precio de los productos al 90% de su precio original
	ELSE
		update productos
        set precio = precio*0.9 where id_fabrica = idFabrica and id_producto = idProducto;
        set texto = CONCAT('Se ha aplicado al producto ',descripcion,' con ',numPedidos,' pedidos un descuento del 10%.');
	END IF;
    -- Se muestra el texto
    select texto as Mensaje;

END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
CALL actualizarPrecio('imm', '773c');
CALL actualizarPrecio('qsa', 'xk47');