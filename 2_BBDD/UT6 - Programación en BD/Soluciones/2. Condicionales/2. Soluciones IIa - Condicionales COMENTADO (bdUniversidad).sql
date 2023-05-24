------------------------------------------------------
--------- BD UNIVERSIDAD - CONDICIONALES  -----------
------------------------------------------------------
/*PROGRAMACIÓN DE BBDD EN MYSQL II*/
-- Crea un procedimiento que actualice la nota de un estudiante en una asignatura en el curso actual. 
	-- El proedimiento debe recibir como parametro un dni, un nombre de asignatura y una nota
	-- Si el estudiante no existe, mostrará el texto 'DNI inválido'
	-- Si la asignatura no existe, mostrará el texto 'Asignatura inválida'
	-- Si el estudiante no está matriculado en dicha asignatura en el curso actual, mostrará el texto 'No existe la matrícula'
	-- En cualquier otro caso, se actualizará la nota del estudiante indicado en la asignatura indicada en el curso actual 
-- Una vez creado el procedimiento, utilízalo 4 veces, uno con cada resultado definido.
USE `bdUniversidad`;

-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `actualizaNota`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento actualizaNota
-- recibe como primer parametro de entrada el DNI como una cadena de 9 caracteres
-- recibe como segundo parametro de entrada el nombre de una asignatura como una cadena de 100 caracteres
-- recibie como tercer parametro de entrada una nota como un numero entero
CREATE PROCEDURE `actualizaNota` (pDni varchar(9), pNombre varchar(100), pNota integer)
BEGIN
	-- Declaracion de variables
	DECLARE existeDNI, existeAsignatura, existeMatricula integer;
    DECLARE varCursoActualInicio year;
    
    -- Compara el mes actual con los meses 1 a 8 (enero a agosto) para saber el anno de inicio del curso
    IF month(current_date) between 1 and 8 THEN
		-- Como el curso se inicio el anno anterior, por estar el mes actual entre enero y agosto, se le quita 1 al anno de la fecha actual
		SET varCursoActualInicio = year(current_date) - 1;
	-- En caso de que el mes vaya de 9 a 12 (septiembre a diciembre) se sabe que el curso ha comenzado en el anno actual
	ELSE
		SET varCursoActualInicio = year(current_date);
	END IF;

	-- Se almacena en la variable si el DNI pasado como parametro existe (T=1 o F=0)
	SET existeDNI = EXISTS (SELECT * from persona where tipo = 'alumno' and dni = pDni);
    -- Se almacena en la variable si la asignatura pasada como parametro existe (T=1 o F=0)
    SET existeAsignatura = EXISTS (SELECT * from asignatura where nombre = pNombre);
    -- Se almacena en la variable si el alumno cuyo DNI se paso como parametro esta matriculado en la asignatura pasada como parametro (T=1 o F=0)
    SET existeMatricula = EXISTS (SELECT * from persona p
									join alumno_se_matricula_asignatura asa on p.id = asa.id_alumno
									join asignatura a on asa.id_asignatura = a.id
									join curso_escolar c on c.id = asa.id_curso_escolar
									where p.dni = pDni and a.nombre = pNombre 
											and c.anyo_inicio = varCursoActualInicio);

	-- Se comprueba si las variables creadas anteriormente son verdaderas o falsas
    CASE 
		-- Si el DNI pasado como parametro no esta en la base de datos se muestra el siguiente mensaje
		WHEN not existeDNI THEN
			SELECT 'DNI inválido' AS MENSAJE;
		-- si el nombre de la asignatura pasado como parametro no esta en la base de datos se muestra el siguiente mensaje
		WHEN not existeAsignatura THEN
			SELECT 'Asignatura inválida' AS MENSAJE;
		-- Si el DNI pasado como parametro no se corresponde con un alumno matriculado en la asignatura pasada como parametro se muestra el siguiente mensaje
		WHEN not existeMatricula THEN
			SELECT 'No existe la matrícula' AS MENSAJE;
		-- En caso contrario (El DNI pasado como parametor si se corresponde a un alumno matriculado en la asignatura pasada como parametro)
        -- se actualiza la nota de dicho alumno con la nota pasada como parametro
		ELSE
			UPDATE alumno_se_matricula_asignatura
			SET nota = pNota
			WHERE id_alumno = (select id from persona where dni = pDni) AND 
					id_asignatura = (select id from asignatura where nombre LIKE pNombre) AND
					id_curso_escolar = (select id from curso_escolar where anyo_inicio = varCursoActualInicio);
			SELECT 'Se ha actualizado correctamente la calificación' AS MENSAJE;
	END CASE;
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
-- DNI Inválido
CALL actualizaNota('11111111B', 'Matemáticas', 8);
-- Asignatura inválida
CALL actualizaNota('26902806M', 'Matemáticas', 8);
-- No existe la matrícula
CALL actualizaNota('26902806M', 'Introducción a la programación', 8);
-- Actualización correcta
CALL actualizaNota('26902806M', 'Sistemas Inteligentes', 8);

-- Comprueba si se ha modificado la nota de dicho alumno
select *
from persona p
join alumno_se_matricula_asignatura asa on p.id = asa.id_alumno
and p.dni = '26902806M';

-- Otra solución
use bduniversidad;
-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `actualizaNota`;
-- Modifica el delimitador
delimiter $$
-- Crea el procedimiento actualizaNota
-- recibe como primer parametro de entrada el DNI como una cadena de 9 caracteres
-- recibe como segundo parametro de entrada el nombre de una asignatura como una cadena de 100 caracteres
-- recibie como tercer parametro de entrada una nota como un numero decimal cuya parte entera tiene 2 digitos y cuya parte decimal tiene 2 digitos
create procedure actualizaNota(dni_entrada varchar(9),nom varchar(100),not1 decimal(4,2))
begin
 -- Declaracion de variables
 declare idasig int; -- Identificador de la asignatura
 declare idal int;   -- Identificador del alumno

-- Se compara si el DNI pasado como parametro NO se corresponde con el de un alumno
if dni_entrada not in (select dni from persona join alumno_se_matricula_asignatura on id_alumno= id ) then
	select ('El dni introducido es inválido' );
-- Se compara si el nombre pasado como parametro NO se corresponde con el de una asignatura
elseif nom not in (select nombre from asignatura) then
	select 'La asignatura no existe' ;
-- En caso de que existan tanto el alumno como la asignatura
else
	-- Asignacion de valor a las variables
	select id into idasig from asignatura where nombre=nom;
    select id into idal from persona where dni=dni_entrada;
    -- Se comprueba si el alumno cuyo DNI se ha pasado como parametro NO esta matriculado en la asignatura pasada como parametro
	if not exists (select * from alumno_se_matricula_asignatura where id_alumno=idal and id_asignatura=idasig) then
		select 'El alumno no esta matriculado en la asignatura';
	-- En caso contrario (El alumno SI esta matriculado en la asignatura) se actualiza su nota con el valor pasado por parametro
	else 
		update alumno_se_matricula_asignatura set nota=not1 where id_alumno=idal and id_asignatura=idasig;

	end if;
end if;
end;
$$
-- Devuelve al delimitador su valor por defecto
delimiter ;
-- Llamadas al procedimiento
call actualizaNota('26902806M','Cálculo',1.25);
-- Comprueba si se ha modificado la nota de dicho alumno
select * from alumno_se_matricula_asignatura where id_alumno=1;

-- Crea un procedimiento que reciba como parametro un año y actualice el campo login de todos los estudiantes matriculados en dicho año según las siguientes reglas:
	-- Si el año no se corresponde con ningún año de inicio, mostrará el texto 'Año inválido'
    -- El login estará compuesto de la primera letra del nombre, seguido de un guión bajo '_', seguido de las tres primeras letras del primer apellido,
    -- seguido de otro guión bajo, seguido de los 2 ultimos digitos del DNI, seguido de otro guión bajo, seguido de los dos ultimos digitos del año de inicio y los dos ultimos digitos del año de fin.
    -- Ejemplo: el estudiante 'Juan Saez Vega' en el curso 2019/2020 tendrá como login 'j_sae_19_1920'
 -- Una vez creado el procedimiento, utilizalo para actualizar el login de todos los estudiantes matriculados en el curso 2019/2020  
USE `bdUniversidad`;

-- Elimina el procedimiento si ya existe
DROP procedure IF EXISTS `actualizarLoginAlumnos`;
-- Cambia el delimitador
DELIMITER $$
-- Crea el procedimiento actualizarLoginAlumnos
-- recibe como parametro de entrada el anno como una fecha de tipo anno
CREATE PROCEDURE `actualizarLoginAlumnos` (pAnyo year)
BEGIN
	-- Declaracion de variables
	DECLARE varAnyoInicio, varAnyoFin year;
    DECLARE varIdCurso INTEGER;
    -- Asignacion de valor a las variables
    SELECT id, anyo_inicio, anyo_fin INTO varIdCurso, varAnyoInicio, varAnyoFin 
									FROM curso_escolar WHERE anyo_inicio = pAnyo;
	-- Comprueba si el identificador del curso NO existe para el anno pasado como parametro
    -- en cuyo caso muestra el siguiente mensaje
	IF varIdCurso IS NULL THEN
		SELECT CONCAT('No se encuentra ningún curso con año de inicio ',  pAnyo) AS Mensaje;
	-- Comprueba si NO hay alumnos matriculados para el anno pasado como parametro
    -- en cuyo caso muestra el siguiente mensaje
	ELSEIF NOT EXISTS(SELECT * FROM alumno_se_matricula_asignatura 
						WHERE id_curso_escolar=varIdCurso) THEN
		SELECT CONCAT('No se encuentran estudiantes matriculados en el curso ',varAnyoInicio,'/',varAnyoFin) AS Mensaje;
	-- En caso contrario (el curso existe y tiene alumnos matriculados)
    ELSE
		-- Se actualiza dicho alumno segun lo indicado en el enunciado
		UPDATE persona 
        SET login = concat(left(nombre, 1), '_', left(apellido1, 3), '_', right(varAnyoInicio,2), '_', right(varAnyoFin,2))
        WHERE tipo = 'alumno' and id in (SELECT id_alumno 
										FROM alumno_se_matricula_asignatura 
										WHERE id_curso_escolar = varIdCurso);
		-- Se muestra el siguiente mensaje sobre el curso escolar concreto
		SELECT CONCAT('Se ha establecido el login de los estudiantes del curso ',varAnyoInicio,'/',varAnyoFin) AS Mensaje;
    END IF;
END$$
-- Devuelve al delimitador su valor por defecto
DELIMITER ;

-- Llamadas al procedimiento
CALL actualizarLoginAlumnos(2012);
CALL actualizarLoginAlumnos(2019);
CALL actualizarLoginAlumnos(2020);

select distinct p.* 
from persona p
join alumno_se_matricula_asignatura asa on p.id = asa.id_alumno
join curso_escolar c on c.id = asa.id_curso_escolar 
where c.anyo_inicio = 2020;
