DROP DATABASE IF EXISTS bdUniversidad;
CREATE DATABASE bdUniversidad;
USE bdUniversidad;


-- 2.3.1.1
drop procedure if exists secuenciaNumeros;
DELIMITER $$
create procedure secuenciaNumeros(in cuantos int)
begin
	declare i int;
    declare salida text default " ";
	if cuantos < 0 then
		select "Numero negativos";
	else
		set i = 1;
        while i <= cuantos do
			set salida = concat(salida, i, "\n");
			set i = i + 1;
        end while;
        select salida;
	end if;
end
$$
DELIMITER ;

call secuenciaNumeros(11);

-- 2.3.1.2




-- 2.3.1.3




-- 2.3.1.4




-- 2.3.1.5




-- 2.3.1.6