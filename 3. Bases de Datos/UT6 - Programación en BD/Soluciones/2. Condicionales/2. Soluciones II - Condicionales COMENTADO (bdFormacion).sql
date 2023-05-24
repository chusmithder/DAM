/*************************************
***  bdFormacion - CONDICIONALES *****
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL II*/
-- Implementar un script llamado `cursosProfesor´ en la base de datos bdFormacion que, dado un nombre de profesor 
-- (cuyo valor recibiremos como parámetro), muestre su código de profesor y la cantidad de cursos que ha impartido. 
-- Si el profesor no existe o hay varios profesores con el mismo nombre se mostrarán mensajes diferentes. 
-- El nombre del profesor tan solo debe contener el valor parámetro, no tiene porqué ser idéntico. 
-- El mensaje relativo a los cursos impartidos debe ser distinto si no ha impartido ningún curso, 
-- si sólo ha impartido uno o si han sido varios los cursos impartidos.
USE bdformacion;

-- Elimina el procedimiento si existe
drop procedure if exists cursosProfesor;
-- Cambia el delimitador
delimiter $$
-- Crea el procedimiento cursosProfesor
-- recibe como parametro el nombre del profesor como una cadena de 25 caracteres
CREATE PROCEDURE cursosProfesor(NOM VARCHAR(25))
BEGIN
	-- Declaracion de variables
	DECLARE CODPROFESOR VARCHAR(2);
	DECLARE NOMPROFESOR VARCHAR(25);
    DECLARE NUMCUR INTEGER DEFAULT 0;
    DECLARE NUMPROF INTEGER;
    -- Comprueba cuántos profesores hay que contengan el nombre pasado como parametro
    SELECT COUNT(*) INTO NUMPROF FROM PROFESORES WHERE NOMP LIKE CONCAT('%', NOM, '%');
    -- Si no hay profesores con dicho nombre muestra un mensaje por pantalla indicandolo
    IF NUMPROF = 0 THEN
		SELECT 'NO EXISTE ESE PROFESOR/A' AS Mensaje;
	-- Si hay mas de 1 profesor con dicho nombre muestra un mensaje por pantalla indicandolo
	ELSEIF NUMPROF > 1 THEN
		SELECT 'HAY VARIOS PROFESORES/AS CON ESE NOMBRE' as Mensaje;
	-- Si solo hay 1 profesor con dicho nombre
	ELSE
		-- Almacena el codigo de profesor, su nombre completo y en cuantos cursos da clase
		SELECT P.CODP, P.NOMP, COUNT(*) INTO  CODPROFESOR, NOMPROFESOR, NUMCUR 
			FROM PROFESORES P JOIN CURSILLOS C ON P.CODP=C.CODP
			WHERE P.NOMP LIKE CONCAT('%', NOM, '%');
		CASE
			WHEN NUMCUR = 0 THEN -- Si el profesor pasado como parametro no da ningun curso, se muestra un mensaje indicandolo
				SELECT CONCAT('EL PROFESOR/A ', NOMPROFESOR, ' CON CODIGO ',  CODPROFESOR, ' NO ESTA DANDO NINGUN CURSILLO.') as Mensaje;
			WHEN NUMCUR = 1 THEN -- Si el profesor pasado como parametro da solo 1 curso, se muestra un mensaje indicandolo
				SELECT CONCAT('EL PROFESOR/A ', NOMPROFESOR, ' CON CODIGO ',  CODPROFESOR, ' ESTA DANDO UN CURSILLO.') as Mensaje;
			WHEN NUMCUR > 1 THEN -- Si el profesor pasado como parametro da mas de 1 curso, se muestra un mensaje inficandolo
				SELECT CONCAT('EL PROFESOR/A ', NOMPROFESOR, ' CON CODIGO ',  CODPROFESOR, ' ESTA DANDO ', NUMCUR, ' CURSILLOS.') as Mensaje;
		END CASE;
    END IF;
END;
$$
-- Devuelve al delimitador su valor por defecto
delimiter ;

-- Llamadas al procedimiento
CALL cursosProfesor ('Paula');