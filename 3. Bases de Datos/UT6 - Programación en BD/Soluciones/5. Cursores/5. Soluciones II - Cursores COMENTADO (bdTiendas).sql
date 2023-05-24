 /************************************
***    TIENDAS - CURSORES          ***
*************************************/

-- Crear un procedimiento llamado ‘incrementaPrecio’ que aumente precio de venta en un 5% de los artículos 
-- cuyo id de fabricante introduce el usuario por parámetro.
use bdtiendas;
drop procedure if exists incrementaPrecio;
delimiter $$
create procedure incrementaPrecio( idf int)
begin
	DECLARE fin BOOLEAN DEFAULT FALSE;
    DECLARE idp int;
    declare precio2 int;
    -- Declaramos el cursor con los id de los articulos fabricados por dicho fabricantes
    DECLARE cur1 CURSOR FOR SELECT ARTICULOS.ID FROM ARTICULOS WHERE articulos.id_fabricante=idf;
    
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=TRUE;
    -- sino existe ese codigo de fabricante se le indica al usuario
 	if not exists(select * from fabricantes where id=idf) then
		select 'Ese identificativo de fabricante no existe.';
	else
    -- abrimos cursos
		open cur1;
        while not fin do
        -- Obtenemos uno a uno los id de los productos
				fetch cur1 into idp;
                -- seleccionamos los precios de los productos que tenemos en el cursor
                select precio_venta into precio2 from articulos where id=idp;
                -- calculamos el nuevo precio de venta de los articulos
                set precio2=precio2 + precio2 *0.05;
                -- Actualizaoms la tabla articulos
				update articulos set precio_venta=precio2 where id=idp;
        end while;
        close cur1;
    end if;
end
$$
delimiter ;
select * from articulos;
call incrementaPrecio(30);

select * from tiendas;


-- Crea un procedimiento que dado un fabricante abastezca con 5 unidades de todos los productos de ese fabricante a todas las tiendas.
-- Hay que insertar 5 unidades de cada producto del fabricante a todas las tiendas
use bdtiendas;
DELIMITER $$
CREATE PROCEDURE suministrarTiendas (fab int)
begin
	DECLARE fin BOOLEAN DEFAULT FALSE;
    DECLARE ID_AUX INT;
    DECLARE AUX_NIF VARCHAR(10);
    -- Vamos a utilizar dos cursores uno para recorrer los articulos
    -- Otro para recorrer las tiendas
    DECLARE cur1 CURSOR FOR SELECT ID FROM ARTICULOS WHERE ID_FABRICANTE=fab;
    
    -- Otro cursor que nos guarda el nif de las tiendas para poder insertar
    DECLARE cur2 CURSOR FOR SELECT NIF FROM TIENDAS;
    
    -- Declaramos le manejador de errores 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=TRUE;
    
    -- Si el fabricante no existe en nuestra BD mostrarmos un error
    if not exists (select * from fabricantes where id=fab) then
		select 'El fabricante no se encuentra en nuestra BD';
        
	-- En caso que exista el fabricante hacemos las operaciones con los cursores
    else
	-- Abrimos el cursor uno que nos recorre los articulos que fabrica el fabricante
		OPEN cur1;
   
		while not fin do
		-- Vamos obteniendo los datos de los productos de los fabricantes
			fetch cur1 into ID_AUX;
    
			OPEN cur2;
			while not fin do
				-- Obtenemos las tiendas
				fetch cur2 into AUX_NIF;
                -- Insertamos
				INSERT INTO PEDIDOS(NIF_TIENDA, ID_ARTICULO, FECHA_PEDIDO,UNIDADES_PEDIDAS) VALUES(AUX_NIF,ID_AUX,curdate(),5);
			END while;
			close cur2;
            set fin= true;
		END while;
		close cur1;
        end if;
end
$$
delimiter ;
DROP PROCEDURE suministrarTiendas;
select * from articulos;
SELECT * FROM PEDIDOS;
select * from fabricantes;
select * from articulos where ID_FABRICANTE=10;

CALL suministrarTiendas(10);

-- Inserta un pedido por cada una de las tiendas con codigo postal que instroduzca el usuario un pedido con cada uno de los artículos del
-- fabricante que introduzca el usuario por entrada 
use bdtiendas;
drop procedure if exists insertaPedido;
delimiter $$
create procedure insertaPedido(idf int, codp int)
begin
	DECLARE fin BOOLEAN DEFAULT FALSE;
    -- declaramos el nif auxiliar
    declare nif_aux varchar(10);
    declare id_pf int;
    
	-- el primer cursor será para almacenar el NIF de las tiendas que tienen el codigo postal que indica el parámetro
	declare cur1 cursor for select NIF from tiendas where codp=CODPOSTAL;
    declare cur2 cursor for select id from articulos where id_fabricante=idf;
      -- Declaramos le manejador de errores 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=TRUE;
    
    -- si el fabricante no existe o el cp en nuestra BD mostramos un error
    if not exists (select * from fabricantes where id=idf) or not exists(select * from tiendas where codp=CODPOSTAL) THEN
		SELECT 'Los datos introducidos no se encuentran en nuestra BD';
	else
		open cur1;
		while not fin do
			fetch cur1 into nif_aux;
			OPEN cur2;
			while not fin do
				-- Obtenemos las tiendas
				fetch cur2 into id_pf;
                -- Insertamos
				INSERT INTO PEDIDOS(NIF_TIENDA, ID_ARTICULO, FECHA_PEDIDO,UNIDADES_PEDIDAS) VALUES(nif_aux,id_pf,curdate(),1);
			END while;
			close cur2;
            set fin= true;
    end while;
	end if;
end
$$
delimiter ;
select * from pedidos where nif_TIENDA='5555-B';
CALL insertaPedido(30,19209);