use bdUniversidad;
drop procedure if EXISTS matriculas_aleatorias;
DELIMITER $$
CREATE PROCEDURE matriculas_aleatorias()

BEGIN

  -- Declaración de variables
  DECLARE numMatriculas, contador INT DEFAULT 0;
  set numMatriculas = 200;
      
  WHILE (contador<numMatriculas) DO

    -- ID alumno entre 13 y 24. ID de asignatura entre 1 y 83. ID de curso entre 1 y 5. Nota entre 0 y 9.99.
    INSERT INTO alumno_se_matricula_asignatura VALUEs (FLOOR(RAND()*12+13), FLOOR(RAND()*83+1),FLOOR(RAND()*5+1),RAND()*10);
	set contador=contador+1;
  END WHILE;

END $$
DELIMITER ;
call matriculas_aleatorias();