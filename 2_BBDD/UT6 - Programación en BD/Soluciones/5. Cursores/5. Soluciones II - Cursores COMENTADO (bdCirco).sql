/****************************
***  CIRCO - CURSORES   ***
*****************************/

-- Crea un procedimiento de nombre atracciones_checkGanancias en el que queremos comprobar 
-- si las ganancias totales de cada atracción coinciden con la suma de las ganancias 
-- de los días en los que se celebró. 
-- Para las atracciones que no cumplen que la suma de las ganacias de cada día sea 
-- igual a las ganacias totales. El procedimiento debe devolver una cadena con el formato: 
-- Nombre de la atracción 1: nombre. Ganancia total: XX Ganancia sumada: XX
-- Nombre de la atracción 2: nombre. Ganancia total: XX Ganancia sumada: XX
-- . . .
USE bdCirco;
DROP PROCEDURE IF EXISTS atracciones_checkGanancias;

DELIMITER $$
CREATE PROCEDURE atracciones_checkGanancias()
COMMENT 'Devuelve las atracciones cuya suma total de ganancias no coincide con la suma de las ganancias diarias.'
BEGIN
    -- Declaración de variables
    DECLARE v_final boolean DEFAULT false;
    DECLARE v_num INTEGER DEFAULT 1;
    DECLARE v_atraccion varchar(50);
    DECLARE v_ganTotales int;
    DECLARE v_ganTotalesPorDia int;
    DECLARE v_cadenaSalida varchar(1000) default '';	-- Cuidado con el valor (null) por defecto para concatenar.
    
    -- Declaración del cursor asociándole la consulta de todas las atracciones y sus ganancias totales
    DECLARE c_checkGanancias CURSOR FOR SELECT nombre, ganancias FROM ATRACCIONES;

	-- Manejador para cursor vacío
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_final = TRUE;
    -- Abrimos el cursor (se ejecuta la consulta y se almacena el resultado)
    OPEN c_checkGanancias;
    -- Intentamos cargar la primera fila
	FETCH c_checkGanancias INTO v_atraccion,v_ganTotales;
    -- Mientras la última carga haya tenido éxito
    while (not v_final) DO
		-- Obtengo todas las ganancias de esa atracción en todos los días que ha funcionado
        SELECT SUM(ganancias) INTO v_ganTotalesPorDia
        FROM ATRACCION_DIA
        WHERE nombre_atraccion = v_atraccion;
		
        -- Si no coinciden las ganancias la añado al mensaje
        IF (v_ganTotalesPorDia<>v_ganTotales) THEN
            SET v_cadenaSalida = CONCAT(v_cadenaSalida,'\nNombre de la atracción ',v_num,': ',v_atraccion,' - Ganancia total: ',v_ganTotales,' - Ganancia sumada: ',v_ganTotalesPorDia);
            set v_num = v_num+1;
        END IF;
        -- Intento cargar otra atracción
		FETCH c_checkGanancias INTO v_atraccion,v_ganTotales;
    END while;
    CLOSE c_checkGanancias;   
    SELECT v_cadenaSalida as Mensaje;
END$$
DELIMITER ;

call atracciones_checkGanancias();

-- Crea un procedimiento de nombre “artistas_getJefes” que muestre a cada artista (NIF) con su jefe (apellidos,nombre). 
-- En caso de que no tenga jefe deberá mostrar la cadena SIN JEFE. Recuerda hacer uso del a función IFNULL. 
-- Este procedimiento se podría realizar sin hacer uso de cursores, pero para practicar, vas a crear un curso que 
-- recorra todos los artistas y por cada artista que busque su jefe.
use bdCirco;
drop procedure if exists artistas_getJefes;
delimiter $$
create procedure artistas_getJefes ()
begin
	-- Declaración de variables
	DECLARE v_final boolean DEFAULT false;
	DECLARE vNIF, vNifJefe varchar(9);
	DECLARE vNombre varchar(45);
	DECLARE vApe varchar(100);
	DECLARE v_cadenaSalida varchar(1000) default '';	-- Cuidado con el valor (null) por defecto para concatenar.
     -- Declaración del cursor con la consulta del DNI de los artistas y sus jefes
	DECLARE cArtistas CURSOR FOR SELECT NIF, NIF_jefe FROM artistas;
	-- Manejador para cursor vacío
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_Final = TRUE;
	-- Abrimos el cursor (se ejecuta la consulta y se almacena el resultado)
    OPEN cArtistas;
    -- Intentamos cargar la primera fila
    FETCH cArtistas INTO vNIF, vNifJefe;
    -- Mientras la última carga haya tenido éxito
    while not v_final do
		set v_cadenaSalida = CONCAT(v_cadenaSalida, '\nNIF del artista: ', vNIF,' Nombre del jefe: ');
		if (vNifJefe is not null) then
			SELECT nombre, apellidos INTO vNombre, vApe FROM artistas where nif=vNifJefe;
            set v_cadenaSalida = CONCAT(v_cadenaSalida, vNombre,' ',vApe);
		else 
			set v_cadenaSalida = CONCAT(v_cadenaSalida, 'SIN JEFE');
		end if;
        -- Intentamos cargar otra fila
		FETCH cArtistas INTO vNIF, vNifJefe;
    end while;
     -- Cerramos el cursor
    CLOSE cArtistas; 
    -- Mostramos el mensaje por pantalla
    select v_cadenaSalida as Mensaje;
end $$
delimiter ;
call artistas_getJefes ();

-- Crea un procedimiento de nombre artistas_addSuplementoPorCuidados, que compruebe a cuantos animales cuida 
-- cada uno de los artistas. Aquellos artistas que cuidan más de un número de animales indicados por el 
-- parámetro se les aplicará un plus a su nómina igual al número de animales que cuida multiplicado por 100 euros. 
-- Muestra el nombre y complemento de cada artista, así como la suma de todos los complementos.

USE bdCirco;
DROP PROCEDURE IF EXISTS artistas_addSuplementoPorCuidados;

DELIMITER $$
CREATE PROCEDURE artistas_addSuplementoPorCuidados(p_numAnimales tinyint)
BEGIN
    -- Declaración de variables
    DECLARE v_final boolean DEFAULT false;
    DECLARE v_nif CHAR(9);
    DECLARE v_numAnimales TINYINT default 0;
    DECLARE v_complementoTotal INT DEFAULT 0;
    DECLARE v_apellidos VARCHAR(100);
    DECLARE v_nombre VARCHAR(45);
    DECLARE v_cadenaSalida varchar(1000) default '';	-- Cuidado con el valor (null) por defecto para concatenar.

    -- Declaración del cursor con la consulta del nº de animales por DNI de artista
    -- para aquellos artistas que cuidan más de p_numAnimales
    DECLARE c_complemento CURSOR FOR 
        SELECT nif_artista, apellidos, nombre, COUNT(*)
        FROM ANIMALES_ARTISTAS AA JOIN ARTISTAS AR ON AA.nif_artista=AR.nif
        GROUP BY nif_artista
        HAVING COUNT(*) > p_numAnimales;
	
    -- Manejador para cursor vacío
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_Final = TRUE;
	-- Abrimos el cursor (se ejecuta la consulta y se almacena el resultado)
    OPEN c_complemento;
	-- Intentamos cargar la primera fila
    FETCH c_complemento INTO v_nif, v_apellidos, v_nombre, v_numAnimales;
    -- Mientras la última carga haya tenido éxito
    while (not v_final) DO

		set v_cadenaSalida = CONCAT(v_cadenaSalida,'\nA ',v_nombre,' ',v_apellidos,' le corresponde un plus de ',v_numAnimales*100,' euros');
		SET v_complementoTotal = v_complementoTotal + v_numAnimales*100;
               
		FETCH c_complemento INTO v_nif, v_apellidos, v_nombre, v_numAnimales;
    END WHILE;
    -- Cerramos el cursor
    CLOSE c_complemento;   
    -- Incluimos el total
    set v_cadenaSalida = CONCAT(v_cadenaSalida,'\n Suplemento total: ',v_complementoTotal) ;
    -- Mostramos el mensaje por pantalla
    select v_cadenaSalida as Mensaje;
END$$
DELIMITER ;

call artistas_addSuplementoPorCuidados(2);

















