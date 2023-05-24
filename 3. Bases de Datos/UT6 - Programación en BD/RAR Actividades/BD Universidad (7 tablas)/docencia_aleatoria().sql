use bdUniversidad;
drop procedure if EXISTS docencia_aleatoria;
DELIMITER $$
CREATE PROCEDURE docencia_aleatoria()

BEGIN

  -- Declaración de variables
  DECLARE finCursor BOOLEAN DEFAULT FALSE;
  DECLARE idAsignatura INT;
  DECLARE cAsignaturas CURSOR FOR SELECT id FROM asignatura;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finCursor = TRUE;

  OPEN cAsignaturas;

  WHILE (not finCursor) DO

    FETCH cAsignaturas INTO idAsignatura;

    IF  not finCursor THEN
		UPDATE Asignatura SET id_profesor = FLOOR(RAND()*12+1) WHERE id=idAsignatura;
    END IF;
  -- Terminamos el bucle
  END WHILE;

  -- Cerramos el cursor
  CLOSE cAsignaturas;

END $$
DELIMITER ;
call docencia_aleatoria();