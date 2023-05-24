/*
Actividad evaluable UT6 (Bucles)	Módulo:GEBD/BADA 	Ciclo: ASIR1/DAM1

Nombre del alumno/a: Christhoper Pinday Delgado
*/

DROP DATABASE IF EXISTS liga;
CREATE DATABASE liga;

USE liga;

CREATE TABLE jugadores (
	ID INTEGER UNSIGNED, -- No hace falta añadir la restricción NOT NULL porque tiene la restricción PRIMARY KEY
    nombre VARCHAR(25) NOT NULL, 
    apellido VARCHAR(25) NOT NULL,
    posicion ENUM('escolta', 'base', 'pivot', 'alero'),
    fecha_alta DATE DEFAULT (NOW()),
    salario DECIMAL (8,2),
    altura DECIMAL(3,2),
    equipo VARCHAR(25),
    PRIMARY KEY (ID) -- Después de la definición de todos los campos, añadimos la restriccion de PRIMARY KEY    
);
INSERT INTO jugadores VALUES (1, 'Juan Carlos', 'Navarro', 'escolta', '2010-01-10', 130000, null, 'Regal Barcelona');


/*Ejercicio 1*/
drop procedure if exists tablasMultiplicar;
DELIMITER $$
create procedure tablasMultiplicar()
begin
	declare texto varchar(5000) default "";
    declare num int;
	declare i int;
	set num = 1;
    set i = 1;
    
    while num <= 9 do		
		while i <= 10 do
			set texto = concat(texto, num, " * ", i, " = ", num * i, "\n");
			set i = i + 1;
		end while;
		set i = 1;
		set num = num + 1;
    end while;
    select texto;
end
$$
DELIMITER ;
call tablasMultiplicar();


/*Ejercicio 2*/
drop procedure if exists creaBaraja;
DELIMITER $$
create procedure creaBaraja()
begin
	declare orden int default 1;
	declare valor int default 1;
	set sql_safe_updates = 0;
		drop table if exists BARAJA;
        CREATE TABLE BARAJA (
		 orden int PRIMARY KEY CHECK (orden BETWEEN 1 AND 48),
		 valor int CHECK (valor BETWEEN 1 AND 12),
		 palo ENUM ('bastos', 'espadas', 'copas', 'oros'));
        
        while (orden <= 48) do
			while (valor <= 12) do
				if (orden <= 12) then
					INSERT INTO BARAJA VALUES (orden, valor, 'bastos');
                else 
					if (orden <=24) then
						INSERT INTO BARAJA VALUES (orden, valor, 'espadas');
                    else
						if (orden <=36) then
							INSERT INTO BARAJA VALUES (orden, valor, 'copas');
						else 
							if (orden <=48) then
								INSERT INTO BARAJA VALUES (orden, valor, 'oros');
                            end if;
                        end if;
                    end if;
                end if;
				
				set valor = valor + 1;
				if (valor = 13) then
					set valor = 1;
				end if;
				set orden = orden + 1;
			end while;
        end while;
    set sql_safe_updates = 1;
    select * from BARAJA;
end
$$
DELIMITER ;
call creaBaraja();