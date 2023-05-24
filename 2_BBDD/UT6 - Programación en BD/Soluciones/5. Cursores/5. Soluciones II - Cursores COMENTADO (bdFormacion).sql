/******************************
***  FORMACIÓN - CURSORES   ***
*******************************/

-- Crear un procedimiento llamado ‘datosProfesores’ que muestre para cada profesor su código, 
-- nombre completo, salario y la cantidad de cursillos impartidos de la manera que se muestra en el ejemplo.
-- OJO, si un profesor no imparte ningún curso, debe aparecer con 0 cursos.

USE `bdformacion`;

DELIMITER $$
DROP procedure IF EXISTS `datosProfesores` $$
CREATE PROCEDURE `datosProfesores` ()
BEGIN
	-- Variables donde iremos almacenando el código y nombre de cada profesor que estemos analizando
    DECLARE varcodProfe, varNomProfe varchar(20);
    -- Variable donde iremos almacenando el salario de cada profesor que estemos analizando
	DECLARE varSalario float;
    -- Variable donde iremos almacenando el número de cursos que imparte cada profesor que estemos analizando
    DECLARE numCursos int;
    -- Variable que nos indica cuando no quedan más profesores
    DECLARE fin boolean DEFAULT false;
    DECLARE msg varchar (1000) DEFAULT '';
    -- Declaro el cursor con toda la información requerida
    DECLARE cursorProfes CURSOR FOR SELECT P.CODP, P.NOMP, P.SALARIO, COUNT(C.CODCUR)  
										FROM profesores P LEFT JOIN cursillos C on P.CODP=C.CODP
										GROUP BY P.CODP;
	-- Cuando no queden más filas para leer del cursor, el manejador declarado pondrá la variable fin a true
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = TRUE;
    -- Abro el cursor para su lectura
	OPEN cursorProfes;
    -- Intento cargar la primera fila del cursor (el primer profesor)
    FETCH cursorProfes INTO varcodProfe, varNomProfe,varSalario, numCursos;
    -- Mientras la última carga de una fila se haya realizado con éxito, es decir, queden profesores
    WHILE NOT fin DO
		-- Añado el mensaje correspondiente al último profesor extraido del cursor
		SET msg = CONCAT(msg, 'El profesor ',varcodProfe,' con nombre ',varNomProfe,' y salario ',varSalario,' ha impartido ',numCursos,' curso(s)\n');
        -- Intento cargar otro profesor
		FETCH cursorProfes INTO varcodProfe, varNomProfe,varSalario, numCursos;
	END WHILE;
    -- Cierro el cursor
	CLOSE cursorProfes;
    -- Muestro el mensaje
    SELECT msg AS Mensaje;
END$$
DELIMITER ;

CALL datosProfesores();


-- Ampliar el ejercicio anterior y nombrarlo como ‘datosProfesores2’ para que para que debajo de cada línea de profesor, 
-- en un segundo nivel tabulado (con espacios), aparezca el código,  nombre del curso y las horas del curso o cursos que imparte.
USE `bdformacion`;

DELIMITER $$
DROP procedure IF EXISTS `datosProfesores2` $$
CREATE PROCEDURE `datosProfesores2` ()
BEGIN
	-- VARIABLES DE PROFESOR
	-- Variables donde iremos almacenando el código y nombre de cada profesor que estemos analizando
    DECLARE varcodProfe, varNomProfe varchar(20);
    -- Variable donde iremos almacenando el salario de cada profesor que estemos analizando
	DECLARE varSalario float;
    -- Variable donde iremos almacenando el número de cursos que imparte cada profesor que estemos analizando
    DECLARE numCursos int;
    -- VARIABLES DE CURSO
    -- Variables donde iremos almacenando el nombre de cada curso que estemos analizando
    DECLARE varNomCurso varchar(20);
    -- Variable donde iremos almacenando el número de horas del curso que estemos analizando
	DECLARE varHoras int;
    
    -- Variable que nos indica cuando no quedan más filas en alguno de los cursores
    DECLARE finAlgunCursor boolean DEFAULT false;
    
    DECLARE msg varchar (1000) DEFAULT '';
    -- Declaro el cursor con toda la información requerida de cada profesor
    DECLARE cProfes CURSOR FOR SELECT P.CODP, P.NOMP, P.SALARIO, COUNT(C.CODCUR)  
										FROM profesores P LEFT JOIN cursillos C on P.CODP=C.CODP
										GROUP BY P.CODP;
	-- Declaro el cursor con toda la información requerida de cada curso (OJO AL WHERE)
	DECLARE cCursos CURSOR FOR SELECT C.NOMCUR, C.NUMHORAS FROM cursillos C where varcodProfe=C.CODP;
	
    -- Cuando no queden más filas para leer en cualquiera de los cursores, el manejador declarado pondrá la variable fin a true
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finAlgunCursor = TRUE;
    -- Abro el cursor para su lectura
	OPEN cProfes;
    -- Intento cargar la primera fila del cursor (el primer profesor)
    FETCH cProfes INTO varcodProfe, varNomProfe,varSalario, numCursos;
    -- Mientras la última carga de una fila se haya realizado con éxito, es decir, queden PROFESORES
    WHILE NOT finalgunCursor DO
		-- Añado el mensaje correspondiente al último profesor extraido del cursor
		SET msg = CONCAT(msg, 'El profesor ',varcodProfe,' con nombre ',varNomProfe,' y salario ',varSalario,' ha impartido ',numCursos,' curso(s)\n');
		-- Abro el cursor (Ejecuto la consulta asociada y almaceno el resultado en el cursor)
        OPEN cCursos;
        -- Intento cargar la primera fila
        FETCH cCursos INTO varNomCurso, varHoras;
        -- Mientras la última carga de una fila se haya realizado con éxito, es decir, queden CURSOS
        while NOT finAlgunCursor DO
			SET msg = CONCAT(msg,'    Curso: ',varNomCurso,' Horas: ',varHoras,'\n');
            FETCH cCursos INTO varNomCurso, varHoras;
		END WHILE;
        -- Hemos acabado con los cursos de este profesor, cierro el cursor.
		CLOSE cCursos;
        -- IMPORTANTE, VOLVER A COLOCAR LA BANDERA A FALSE
		SET finalgunCursor = false;
        -- Intento cargar otro profesor
		FETCH cProfes INTO varcodProfe, varNomProfe,varSalario, numCursos;
	END WHILE;
    -- Cierro el cursor
	CLOSE cProfes;
    -- Muestro el mensaje
    SELECT msg AS Mensaje;
END$$
DELIMITER ;

CALL datosProfesores2();

-- Ampliar el ejercicio anterior y nombrarlo como ‘datosProfesores3’ para que para que debajo de cada línea de cursillo, 
-- en un tercer nivel tabulado (con espacios), aparezca el código,  nombre de los alumnos que lo cursan 
-- así como la calificación que han obtenido.

USE `bdformacion`;

DELIMITER $$
DROP procedure IF EXISTS `datosProfesores3` $$
CREATE PROCEDURE `datosProfesores3` ()
BEGIN
	-- VARIABLES DE PROFESOR
	-- Variables donde iremos almacenando el código y nombre de cada profesor que estemos analizando
    DECLARE varCodProfe, varNomProfe varchar(50);
    -- Variable donde iremos almacenando el salario de cada profesor que estemos analizando
	DECLARE varSalario float;
    -- Variable donde iremos almacenando el número de cursos que imparte cada profesor que estemos analizando
    DECLARE numCursos int;
    -- VARIABLES DE CURSO
    -- Variables donde iremos almacenando el nombre de cada curso que estemos analizando
    DECLARE varCodCurso, varNomCurso varchar(20);
    -- Variable donde iremos almacenando el número de horas del curso que estemos analizando
	DECLARE varHoras int;
    -- Variable que nos indica cuando no quedan más filas en alguno de los cursores
    -- VARIABLES DE ALUMNO
    -- Variables donde iremos almacenando el nombre de cada alumno que estemos analizando
    DECLARE varNomAlumno varchar(50);
    -- Variable donde iremos almacenando la nota obtenida por cada alumno en el curso actual
	DECLARE varNota decimal(3,1);
    
    -- Variable que nos indica cuando no quedan más filas en alguno de los cursores
    DECLARE finAlgunCursor boolean DEFAULT false;
    
    DECLARE msg varchar (1000) DEFAULT '';
    -- Declaro el cursor con toda la información requerida de cada profesor
    DECLARE cProfes CURSOR FOR SELECT P.CODP, P.NOMP, P.SALARIO, COUNT(C.CODCUR)  
										FROM profesores P LEFT JOIN cursillos C on P.CODP=C.CODP
										GROUP BY P.CODP;
	
    -- Declaro el cursor con toda la información requerida de cada curso (OJO AL WHERE)
	DECLARE cCursos CURSOR FOR SELECT C.CODCUR, C.NOMCUR, C.NUMHORAS FROM cursillos C where varCodProfe=C.CODP;
    
        -- Declaro el cursor con toda la información requerida de cada alumno (OJO AL WHERE)
	DECLARE cAlumnos CURSOR FOR SELECT A.NOMAL, AC.NOTA FROM alumnos A JOIN alumnoscursillos AC on A.CODAL=AC.CODAL where AC.CODCUR=varCodCurso;
	
    -- Cuando no queden más filas para leer en cualquiera de los cursores, el manejador declarado pondrá la variable fin a true
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finAlgunCursor = TRUE;
    -- Abro el cursor para su lectura
	OPEN cProfes;
    -- Intento cargar la primera fila del cursor (el primer profesor)
    FETCH cProfes INTO varCodProfe, varNomProfe,varSalario, numCursos;
    -- Mientras la última carga de una fila se haya realizado con éxito, es decir, queden PROFESORES
    WHILE NOT finalgunCursor DO
		-- Añado el mensaje correspondiente al último profesor extraido del cursor
		SET msg = CONCAT(msg, 'El profesor ',varcodProfe,' con nombre ',varNomProfe,' y salario ',varSalario,' ha impartido ',numCursos,' curso(s)\n');
		-- Abro el cursor (Ejecuto la consulta asociada y almaceno el resultado en el cursor)
        OPEN cCursos;
        -- Intento cargar la primera fila
        FETCH cCursos INTO varCodCurso,varNomCurso, varHoras;
        -- Mientras la última carga de una fila se haya realizado con éxito, es decir, queden CURSOS
        while NOT finAlgunCursor DO
			SET msg = CONCAT(msg,'    Curso: ',varNomCurso,' Horas: ',varHoras,'\n');
            -- Abro el cursor (Ejecuto la consulta asociada y almaceno el resultado en el cursor)
			OPEN cAlumnos;
			-- Intento cargar la primera fila
			FETCH cAlumnos INTO varNomAlumno, varNota;
			-- Mientras la última carga de una fila se haya realizado con éxito, es decir, queden ALUMNOS
			while NOT finAlgunCursor DO
				SET msg = CONCAT(msg,'         Alumno: ',varNomAlumno,' Nota: ',varNota,'\n');
				FETCH cAlumnos INTO varNomAlumno, varNota;
			END WHILE;
			-- Hemos acabado con los alumnos de este curso, cierro el cursor.
			CLOSE cAlumnos;
			-- IMPORTANTE, VOLVER A COLOCAR LA BANDERA A FALSE
			SET finalgunCursor = false;
            FETCH cCursos INTO varCodCurso,varNomCurso, varHoras;
		END WHILE;
        -- Hemos acabado con los cursos de este profesor, cierro el cursor.
		CLOSE cCursos;
        -- IMPORTANTE, VOLVER A COLOCAR LA BANDERA A FALSE
		SET finalgunCursor = false;
        -- Intento cargar otro profesor
		FETCH cProfes INTO varcodProfe, varNomProfe,varSalario, numCursos;
	END WHILE;
    -- Cierro el cursor
	CLOSE cProfes;
    -- Muestro el mensaje
    SELECT msg AS Mensaje;
END$$
DELIMITER ;

CALL datosProfesores3();