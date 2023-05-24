/****************************
** CIRCO - CONTROL ERRORES **
*****************************/

/*Crea un procedimiento de nombre “animales_add” que recibe por parámetro los datos de un animal para añadirlo a la tabla ANIMALES. Habrá que tener en cuenta las siguientes condiciones:
	En caso de intentar dar de alta un animal con el mismo nombre (valor de clave primaria duplicada), captura la excepción y haz que muestre por pantalla el mensaje correspondiente. En este caso no realizará el INSERT.
	En el caso de que el nombre de la pista o de la atracción no exista, captura la excepción y haz que muestre por pantalla el mensaje correspondiente. En este caso no realizará el INSERT.
	En caso de que el alta sea correcta realizará en INSERT y mostrará el mensaje de éxito.
•	Para saber el número de excepción que tienes que capturar, provoca el fallo y anota el número.
•	Si provocamos los errores podemos comprobar que:
o	Error 1062: Clave primaria duplicada
o	Error 1452: Error de clave foránea.
	Ampliación: Crea las siguientes excepciones: ex_claveDuplicada, ex_pista_atracc_no_existe y úsalas en vez de los errores 1062 y 1452.
*/

USE bdCIRCO;
DROP PROCEDURE IF EXISTS animales_add;
DELIMITER $$
CREATE PROCEDURE animales_add(p_nombreAnimal VARCHAR(50),p_tipo varchar(9),p_anos tinyint, p_peso float, p_estatura float, p_atraccion varchar(50),p_pista varchar(50))
BEGIN
	-- Declaro los manejadores para los errores de MySQL 1062 y 1452.
    -- En caso de error 1062 y 1452 detienen la ejecución (EXIT) y muestran un mensaje de error
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
        SELECT CONCAT('El valor de clave primaria ',p_nombreAnimal,' ya existe en la tabla') AS Mensaje;
    END;
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SELECT CONCAT('Violación de clave ajena: la pista o la atracción proporcionadas no existen') AS Mensaje;
    END;
    
    -- Intento la inserción y lanzará excepción si hay error
    INSERT INTO ANIMALES (nombre,tipo,anhos,peso,estatura,nombre_atraccion,nombre_pista)
    VALUES (p_nombreAnimal,p_tipo,p_anos,p_peso,p_estatura,p_atraccion,p_pista);
	-- Si no ha habido un error (capturado por los manejadores) se informá del éxito
    SELECT CONCAT('La inserción de ',p_nombreAnimal,' se ha realizado con éxito') AS Mensaje;
END$$
DELIMITER ;

call animales_add('Leo','León',3,230,1.34,null,null);   -- Clave duplicada
call animales_add('Leo2','León',3,230,1.34,'NO EXISTE',null);   -- Atraccion que no existe
call animales_add('Leo2','León',3,230,1.34,'El gran felino','SUPER');   -- Todo correcto

-- Crea las siguientes excepciones: ex_claveDuplicada, ex_pista_atracc_no_existe y úsalas en vez de los errores 1062 y 1452.

USE bdCIRCO;
DROP PROCEDURE IF EXISTS animales_add;

DELIMITER $$
CREATE PROCEDURE animales_add(p_nombreAnimal VARCHAR(50),p_tipo varchar(9),p_anos tinyint, p_peso float, p_estatura float, p_atraccion varchar(50),p_pista varchar(50))
BEGIN
	-- Declaro nombres personalizados para errores 1062 y 1452 
	DECLARE ex_claveDuplicada CONDITION FOR 1062;
    DECLARE ex_pista_atracc_no_existe CONDITION FOR 1452;

	-- Declaro manejadores para cada uno de los errores que detendrán la ejecución (EXIT)
    -- y mostrarán mensaje por pantalla
    DECLARE EXIT HANDLER FOR ex_claveDuplicada
    BEGIN
        SELECT CONCAT('El valor de clave primaria ',p_nombreAnimal,' ya existe en la tabla') AS Mensaje;
    END;
    DECLARE EXIT HANDLER FOR ex_pista_atracc_no_existe
    BEGIN
        SELECT CONCAT('Violación de clave ajena: la pista o la atracción proporcionadas (',p_atraccion,', ',p_pista,') no existen') AS Mensaje;
    END;
     -- Intento la inserción y lanzará excepción si hay error
    INSERT INTO ANIMALES (nombre,tipo,anhos,peso,estatura,nombre_atraccion,nombre_pista)
    VALUES (p_nombreAnimal,p_tipo,p_anos,p_peso,p_estatura,p_atraccion,p_pista);
	-- Si no ha habido un error (capturado por los manejadores) se informá del éxito
    SELECT CONCAT('La inserción de ',p_nombreAnimal,' se ha realizado con éxito') AS Mensaje;
END$$
DELIMITER ;


/*Crea una función de nombre “fn_artistas_add” que inserta un nuevo artista con todos sus datos como parámetros. Si todo va bien la función insertará el artista y se devolverá un 0. 
Se controlarán los siguientes errores:
•	Si el artista existe y la inserción nos devuelve un error por infracción de clave primaria (error 1062) la capturaremos y la función devolverá -1.
•	Que no exista ningún artista con el NIF correspondiente al campo nif_jefe. En este caso no esperaremos al error de MySQL, sino que comprobaremos si existe el jefe a insertar y, en caso de no existir, lanzaremos una excepción de usuario que capturaremos y la función devolverá -2.
	Cualquier excepción que se produzca debe hacer que finalice la función (con RETURN).
	Para comprobar que la función es correcta, ejecuta un procedimiento que muestre por pantalla el valor de retorno de la función en cada caso.
	Ampliación: Crea las excepciones ex_jefe_no_existe (excepción de usuario) y ex_artista_duplicado (error 1062).
*/
USE bdCIRCO;
DROP FUNCTION IF EXISTS fn_artistas_add;

DELIMITER $$
CREATE FUNCTION fn_artistas_add(p_nif CHAR(9),p_apellidos varchar(100), p_nombre varchar(50),p_nifJefe char(9)) RETURNS int
BEGIN
    DECLARE ex_artista_duplicado CONDITION FOR 1062;
    DECLARE ex_jefe_no_existe  CONDITION FOR SQLSTATE '45000';
    
    -- Declaro los manejadores para los errores de MySQL 1062 y 45000.
    -- En caso de error NO detienen la ejecución pero finalizan la función devolviendo un código de error
    DECLARE CONTINUE HANDLER FOR ex_artista_duplicado
       RETURN -1;
    DECLARE CONTINUE HANDLER FOR ex_jefe_no_existe
       RETURN -2;
    -- Si existe el jefe intento la inserción y devuelvo un 0 (éxito)
    IF exists (select * from ARTISTAS where nif LIKE p_nifJefe) OR p_nifJefe IS NULL then 
		INSERT INTO ARTISTAS (nif, apellidos, nombre, nif_jefe)
			VALUES (p_nif, p_apellidos, p_nombre, p_nifJefe);
		-- Si no ha habido un error (capturado por el manejador de artista_duplicado) se retornará un 0 (éxito)
		RETURN 0;
	else -- si no existe lanzo una excepción de usuario que será capturada por ex_jefe_no_existe.
		SIGNAL SQLSTATE '45000' 
		SET MESSAGE_TEXT='No existe nadie con el NIF proporcionado para el jefe';
	end if;
END$$
DELIMITER ;

SELECT fn_artistas_add('11111111B','Orten Sanlat','Cristina','11111111A') AS "Devolución de función fn_artistas_add()";   
SELECT fn_artistas_add('11111111A','Orten Sanlat','Cristina',null) AS "Devolución de función fn_artistas_add()";
SELECT fn_artistas_add('11111122F','Orten Sanlat','Cristina', '92828822A') AS "Devolución de función fn_artistas_add()";  



/*	Crea un procedimiento de nombre “animales_Delete” que, dado el nombre de un animal, lo borre. 
Antes tendrá que borrar todas las filas relacionadas. En el caso de que el animal tenga menos de 2 años no estará permitido borrarlo y lanzará una excepción de usuario (recordar que el código SQLSTATE para excepciones definidas por el usuario es el 45000) con el texto: “No es posible dar de baja a animales con menos de dos años” y un Error Code 1644. En el caso de que el animal no exista, deberá lanzar una excepción con el texto 'Ese animal no existe' y un Error Code 1643.
Nota: Fijarse que este procedimiento borra los datos de varias tablas, por lo que necesitaríamos hacer uso de una transacción como veremos en el siguiente apartado.*/

USE bdCirco;
DROP PROCEDURE IF EXISTS animales_delete;

DELIMITER $$
CREATE PROCEDURE animales_delete(p_nombreAnimal VARCHAR(50))
BEGIN
	-- Variable donde almacenaré los años del animal
	DECLARE v_anos TINYINT default -1;
	
    -- Si no existe el animal lanzo excepción al sistema (no la capturaremos)
    IF NOT exists (SELECT * FROM ANIMALES WHERE nombre = p_nombreAnimal) THEN 
		SIGNAL SQLSTATE '45000' 
				SET MESSAGE_TEXT='Ese animal no existe',
                    MYSQL_ERRNO = 1643;
	END IF;
    -- Consulto la edad del animal a borrar
    SELECT anhos INTO v_anos
    FROM ANIMALES WHERE nombre = p_nombreAnimal;
    -- Si la edad no cumple los requerimientos lanzo señal
	IF v_anos < 2 THEN
			SIGNAL SQLSTATE '45000' 
				SET MESSAGE_TEXT='No se puede dar de baja a animales con menos de dos años',
                 MYSQL_ERRNO = 1644;
    END if;

	-- BORRAMOS LOS ANIMALES Y SU RELACIÓN CON LOS ARTISTAS. Necesitaríamos una transacción. 
    DELETE FROM ANIMALES_ARTISTAS
    WHERE nombre_animal = p_nombreAnimal;
    
    DELETE FROM ANIMALES
    WHERE nombre = p_nombreAnimal;
    select 'Se ha borrado el animal y todas sus relaciones' AS Mensaje;

END$$
DELIMITER ;
call animales_delete('no_existe');   -- Devuelve el código 1643
call animales_delete('Berni');   -- No cumple que la edad sea superior a 2 años.
call animales_delete('Princesa2');   -- Lo da de baja de todas las tablas

/*animales_addArtista*/
USE bdCirco;
DROP PROCEDURE IF EXISTS animales_addArtista;

DELIMITER $$
CREATE PROCEDURE animales_addArtista(p_nombreAnimal VARCHAR(50),p_nif char(9))
BEGIN
	-- Variable dondes almacerá la información del error
	declare num_error int;
    declare estado_sql varchar(6);
    declare msgError varchar(100);
    
    -- Declaro un solo manejador para ambos errores que detendrá la ejecución
    DECLARE EXIT HANDLER FOR 1643, 1062
    BEGIN
       -- Las variables num_error, estado_sql y msgError deberán haber sido declaradas previamente
       -- Obtengo información de error y la muestro por pantalla
		GET DIAGNOSTICS CONDITION 1 num_error=MYSQL_ERRNO, estado_sql = RETURNED_SQLSTATE, msgError = MESSAGE_TEXT;
        select CONCAT ('Nº de Error: ',num_error,' Estado SQL: ',estado_sql,'\nMensaje de error: ',msgError) AS Mensaje;
	END;
		
	-- Compruebo existencia del animal y sino lanzo señal que capturaremos
    IF NOT EXISTS(SELECT * FROM ANIMALES WHERE nombre LIKE p_nombreAnimal) THEN
		SIGNAL SQLSTATE '45000' 
			SET MESSAGE_TEXT='Ese animal no existe',
                MYSQL_ERRNO = 1643;
	-- Compruebo existencia del artista y sino lanzo señal que capturaremos
	ELSEIF NOT EXISTS(SELECT * FROM ARTISTAS WHERE nif LIKE p_nif) THEN
        SIGNAL SQLSTATE '45001' 
			SET MESSAGE_TEXT='Ese artista no existe',
                MYSQL_ERRNO = 1643;
	-- Compruebo existencia de la relación artista-animal y sino lanzo señal que capturaremos
	ELSEIF NOT EXISTS(SELECT * FROM ANIMALES_ARTISTAS WHERE nombre_animal LIKE p_nombreAnimal and nif_artista LIKE p_nif) THEN
        SIGNAL SQLSTATE '45002' 
			SET MESSAGE_TEXT='El animal ya está asignado al artista',
                MYSQL_ERRNO = 1062;
	END IF;
	-- Si no ha habido ningún problema insertaré la relación animal-artista
    INSERT INTO ANIMALES_ARTISTAS (nombre_animal,nif_artista)
    VALUES (p_nombreAnimal,p_nif);
END$$
DELIMITER ;



call animales_addArtista('no_existe','11111111A'); -- Nombre de animal inexistente
call animales_addArtista('Princesa1','no_existe'); -- NIF de artista inexistente
call animales_addArtista('Leo','33333333C'); -- 2º lanzamiento de esta orden Mysql (clave primaria duplicada).

