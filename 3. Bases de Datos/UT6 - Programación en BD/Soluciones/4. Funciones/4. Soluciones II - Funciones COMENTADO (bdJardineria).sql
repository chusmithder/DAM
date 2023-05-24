------------------------------------------------------
------ Empresa - PROGRAMACION - Funciones-------------
------------------------------------------------------

/* Escribe una función llamada “fn_numPedidosPorEstado” que reciba como parámetro un estado de pedido
 y devuelva cuántos pedidos de ese estado se tiene.*/
use bdjardineria;

-- Elimina la funcion si ya existe
drop function if exists fn_numPedidosPorEstado;
-- Cambia el delimitador
DELIMITER $$
-- Crea la funcion fn_numPedidosPorEstado
-- recibe como parametro de entrada el estado de un pedido como una cadena de 15 caracters
create function fn_numPedidosPorEstado(est varchar(15))
-- devuelve un numero entero, cuantos pedidos hay que tengan dicho estado
RETURNS int
BEGIN
	-- Declaracion de variables
	declare cantidad int;
    -- Asignacion de valor a la variable
    set cantidad = (select count(*) from pedidos where Estado = est);
    -- Retorno de la variable
	RETURN cantidad;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas a la función
select estado, fn_numPedidosPorEstado(estado) from pedidos group by estado;

/* 2.5.3.2 */
/* Escribe una función llamada “fn_numClientesGama” que reciba como parámetro la gama de un producto y
 devuelva el Nº clientes que han pedido productos de esa gama. */
use bdjardineria;

-- Elimina la funcion si ya existe
drop function if exists fn_numClientesGama;
-- Cambia el delimitador
DELIMITER $$
-- Crea la funcion fn_numClientesGama
-- recibe como parametro de entrada la gama de un producto como una cadena de 50 caracters
create function fn_numClientesGama(gam varchar(50))
-- devuelve un numero entero, cuantos clientes han pedido productos de dicha gama
RETURNS int
BEGIN
	-- Declaracion de variables
	declare cantidad int;
    -- Asignacion de valor a la variable
    set cantidad = (select count(CodigoCliente) 
					from productos prod 
						inner join detallepedidos d on d.CodigoProducto = prod.CodigoProducto 
						inner join pedidos ped on ped.CodigoPedido = d.CodigoPedido
					where prod.Gama = gam);
    -- Retorno de la variable
	RETURN cantidad;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas a la función
select gama, fn_numClientesGama(gama) from productos group by gama;

/* Escribe una función llamada “fn_numClientesOficinaPais” que reciba como parámetro un país 
y devuelva el Nº de clientes cuya oficina (la de su representante) esté localizada en ese país. */
use bdjardineria;

-- Elimina la funcion si ya existe
drop function if exists fn_numClientesOficinaPais;
-- Cambia el delimitador
DELIMITER $$
-- Crea la funcion fn_numClientesSinOficina
-- recibe como parametro de entrada un pais como una cadena de 50 caracters
create function fn_numClientesOficinaPais(ppais varchar(50))
-- devuelve un numero entero, cuantos clientes residen en dicho país y que no tengan oficinas
RETURNS int
BEGIN
	-- Declaracion de variables
	declare cantidad int;
    -- Asignacion de valor a la variable
    set cantidad = (select count(CodigoCliente) 
					from clientes cli 
						inner join empleados emp on cli.CodigoEmpleadoRepVentas = emp.CodigoEmpleado 
                        inner join oficinas ofi on emp.CodigoOficina = ofi.CodigoOficina
					where ofi.Pais = ppais);
    -- Retorno de la variable
	RETURN cantidad;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas a la función
select pais, fn_numClientesOficinaPais(pais) from oficinas group by pais;

/* 2.5.3.4 */
/* Escribe una función llamada “fn_OficinaConMasEmpleados” que no reciba parámetros y devuelva el código de oficina
 que más empleados tiene. Si fueran varias, devolver la primera de la lista. */
use bdjardineria;

-- Elimina la funcion si ya existe
drop function if exists fn_OficinaConMasEmpleados;
-- Cambia el delimitador
DELIMITER $$
-- Crea la funcion fn_OficinaConMasEmpleados
-- no recibe parametros de entrada
create function fn_OficinaConMasEmpleados()
-- devuelve una cadena de 10 caracteres, el codigo de la oficina con mas empleados.
-- En caso de empate debe mostrar la primera de la lista.
RETURNS varchar(10)
BEGIN
	-- Declaracion de variables
	declare codigo varchar(10);
    -- Asignacion de valor a la variable
    set codigo = (select CodigoOficina from empleados 
					group by CodigoOficina 
					HAVING count(*) >= ALL (SELECT COUNT(*) 
											from empleados 
                                            group by CodigoOficina));
    -- Retorno de la variable
	RETURN codigo;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas a la función
select CONCAT('La oficina con más empleados es: ',fn_OficinaConMasEmpleados()) as Mensaje;

/* 2.5.3.5 */
/* Escribe una función llamada “fn_ProductoMaxPedido” que no reciba parámetros y devuelva el nombre del
 producto del que más unidades se hayan vendido en un mismo pedido. Si fueran varios, devolver el primero de la lista. */
use bdjardineria;

-- Elimina la funcion si ya existe
drop function if exists fn_ProductoMaxPedido;
-- Cambia el delimitador
DELIMITER $$
-- Crea la funcion fn_ProductoMaxPedido
-- no recibe parametros de entrada
create function fn_ProductoMaxPedido()
-- devuelve una cadena de 70 caracteres, el nombre del producto del que mas unidades se hayan vendido.
-- En caso de empate debe mostrar el primero de la lista.
RETURNS varchar(70)
BEGIN
	-- Declaracion de variables
	declare nombre varchar(70);
    -- Asignacion de valor a la variable
    set nombre = (select p.nombre from productos p 
									inner join detallepedidos d on d.codigoproducto = p.codigoproducto 
					where d.cantidad = (SELECT max(d2.cantidad) 
										from detallepedidos d2));
    -- Retorno de la variable
	RETURN nombre;
END
$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;
-- Llamadas a la función
select fn_ProductoMaxPedido();
