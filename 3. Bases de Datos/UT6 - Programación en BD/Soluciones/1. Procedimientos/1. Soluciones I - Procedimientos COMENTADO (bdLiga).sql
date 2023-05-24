 /*************************************
***   LIGA - PROCEDIMIENTOS  *********
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL I*/

-- PROCEDIMIENTOS CON TABLAS y SIN PARÁMETROS - SELECT
-- Escribe un procedimiento denominado "listaEquipos" que muestre la lista de equipos
--  y el número de jugadores que hay en cada uno.
 USE bdLiga;
 
 -- Elimina el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS listaEquipos;
 -- Cambia el delimitador
 DELIMITER $$
 -- Crea el procedimiento listaEquipos
 -- no recibe parametros de entrada
 CREATE PROCEDURE listaEquipos()
 BEGIN
	-- muestra cuantos jugadores hay en cada equipo, agrupado por equipo
	SELECT equipo, COUNT(*) AS 'Nº de Jugadores' FROM jugadores GROUP BY equipo;  
 END $$
 -- Devuelve al delimitador el valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL listaEquipos();
 
-- PROCEDIMIENTOS CON TABLAS y CON PARÁMETROS - SELECT
-- Escribe un procedimiento denominado "cuantosJugadores" que, dado un nombre de equipo,
-- muestre el número de jugadores de ese equipo.
 USE bdLiga;

-- Elimina el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS cuantosJugadores;
 -- Cambia el delimitador
 DELIMITER $$
 -- Crea el procedimiento cuantosJugadores
 -- recibe como parametro de entrada el nombre del equipo como una cadena de 25 caracteres
 CREATE PROCEDURE cuantosJugadores(paramEquipo varchar(25))
 BEGIN
	-- muestra por pantalla la concatenación de los campos solicitados cuando el nombre del equipo es igual que el valor pasado por parametro
	SELECT CONCAT('El nº de Jugadores en el equipo ', paramEquipo, ' es ',COUNT(*)) AS Mensaje 
    FROM jugadores where equipo=paramEquipo;  
 END $$
 -- Devuelve al delimitador su valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL cuantosJugadores('Caja Laboral');
 
 -- PROCEDIMIENTOS CON TABLAS y CON PARÁMETROS - DELETE
-- Escribe un procedimiento denominado "borrarJugador" que, dado un nombre y un apellido, borre dicho jugador.
 USE bdLiga;

-- Elimina el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS borrarJugador;
 -- Cambia el delimitador
 DELIMITER $$
 -- Crea el procedimiento borrarJugador
 -- recibe como primer parametro de entrada el nombre del jugador como una cadena de 25 caracteres
 -- recibe como segundo parametro de entrada el apellido del jugador como una cadena de 25 caracteress
 CREATE PROCEDURE borrarJugador(paramNombre varchar(25), paramApellido varchar(25))
 BEGIN
	-- Elimina el jugador cuyo nombre y apellido sean iguales a los parametros
	DELETE FROM jugadores WHERE nombre=paramNombre AND apellido=paramApellido;
    -- Muestra por pantalla el jugador que se ha eliminado
	SELECT CONCAT('Si existe, se ha borrado a ', paramNombre, ' ',paramApellido) AS Mensaje; 
 END $$
 -- Devuelve el delimitador a su valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL borrarJugador('Juan Carlos','Navarro');

-- PROCEDIMIENTOS CON TABLAS y CON PARÁMETROS - INSERT
-- Escribe un procedimiento denominado "insertarJugador" que permita crear un nuevo jugador.
 USE bdLiga;
 
 -- Elimina el procedimiento si ya existe
drop procedure if exists insertarJugador;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento insertarJugador
-- recibe como primer parametro de entrada el nombre del jugador a insertar como una cadena de 25 caracteres
-- recibe como segundo parametro de entrada el apellido del jugador a insertar como una cadena de 25 caracteres
-- recibe como tercer parametro de entrada el identificador del jugador a insertar como un numero entero
CREATE PROCEDURE insertarJugador( pNombre varchar(25), pApellido varchar(25), pID int)
BEGIN
	-- Inserta un nuevo jugador con los valores que se han pasado por parametro
	insert into jugadores (ID, nombre, apellido) values (pID, pNombre, pApellido);
    -- Muestra por pantalla un mensaje con los datos del jugador que se acaba de insertar
	SELECT
		CONCAT('El nuevo jugador se llama ', pNombre,' ',pApellido,
				' y su ID es ', pID) as 'Mensaje';
END
$$
-- Devuelve el delimitador a su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
CALL insertarJugador('Pepe', 'Diaz Diaz', 26);


-- PROCEDIMIENTOS CON TABLAS y CON PARÁMETROS - UPDATE
-- Escribe un procedimiento denominado "actualizarSueldo" que, dado un id de jugador y un numero (positivo o negativo)
-- actualice el sueldo de dicho jugador e informe del resultado por pantalla.
 USE bdLiga;
 
 -- Elimina el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS actualizarSalario;
 -- Cambia el delimitador
 DELIMITER $$
 -- Crea el procedimiento actualizarSalario
 -- recibe como primer parametro de entrada el identificador del jugador como un numero entero
 -- recibe como segundo parametro de entrada el nuevo salario del jugador como un numero decimal
 -- con 6 digitos en la parte entera y 2 en la parte decimal
 CREATE PROCEDURE actualizarSalario(IDJugador int, nuevoSalario decimal (8,2))
 BEGIN
	-- Actualiza el salario del jugador pasado como parametro con el salario que se ha pasado por parametro
	UPDATE jugadores SET salario=salario+nuevoSalario WHERE ID=IDJugador; 
    -- Muestra un mensaje por pantalla en el que se muestra el sueldo original del jugador y el nuevo
	SELECT CONCAT('El anterior sueldo de ', nombre, ' era ',salario-nuevoSalario,' y el nuevo es ',salario) AS Mensaje 
    FROM jugadores where ID=IDJugador;
	
 END $$
 -- Devuelve al delimitador su valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL actualizarSalario(1,-320.5);
 
 
-- Reescribe el procedimiento “cuantosJugadores” usando dos variables locales: 
-- en una almacenarás el número de jugadores solicitado (con SET) y en la otra almacenarás el mensaje de salida (con SET). 
-- Después mostrarás el valor de la variable “mensaje”. 
  USE bdLiga;
  
  -- Elimina el procedimiento si ya existe
 DROP PROCEDURE IF EXISTS cuantosJugadores;
 -- Cambia el delimitador
 DELIMITER $$
 -- Crea el procedimiento cuantosJugadores
 -- recibe como parametro de entrada el nombre del equipo como una cadena de 25 caracteres
 CREATE PROCEDURE cuantosJugadores(paramEquipo varchar(25))
 BEGIN
	-- Declaracion de variables
	declare varEquipo varchar(25); -- default paramEquipo;
    declare numJugadores int;
    declare textoSalida varchar(100);
    -- Asignacion de valores a las variables
    SET varEquipo = paramEquipo; 
	SET numJugadores = (SELECT COUNT(*) 
						FROM jugadores 
                        where equipo=varEquipo);
	SET textoSalida = CONCAT('El nº de Jugadores en el equipo ', 
						varEquipo, ' es ',numJugadores);
	-- Muestra por pantalla el valor de la variable textoSalida
    SELECT textoSalida AS Mensaje ;
 END $$
 -- Devuelve al delimitador su valor por defecto
 DELIMITER ;
 -- Llamadas al procedimiento
 CALL cuantosJugadores('Caja Laboral');




