/*************************************
***   SIN BD - ITERATIVAS-- *********
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL II*/

-- Crear un procedimiento llamado “numerosFactoriales” que, dado un parámetro ‘limite’, muestre el resultado de todos factoriales hasta el límite dado por el parámetro.
-- Ejecución: CALL numerosFactoriales (5);
-- Respuesta por pantalla: 
-- 1! = 1
-- 2! = 2
-- 3! = 6
-- 4! = 24
-- 5! = 120

DROP PROCEDURE IF EXISTS numerosFactoriales;
DELIMITER $$
CREATE PROCEDURE numerosFactoriales (numLimite int) 
BEGIN
	 DECLARE factorialActual int DEFAULT 1;
     DECLARE contInterno int;
     DECLARE factorial int DEFAULT 1;
     DECLARE msg varchar(500) DEFAULT '';
	 
	-- El contador externo irá recorriendo el intervalo de números (desde 1 hasta numLimite) de los que queremos obtener el factorial
     while (factorialActual <= numLimite) DO
		-- El contador interno irá rfecorriendo los números desde 2 (multiplicar por 1 no tiene sentido) 
        -- hasta el número del que queremos obtener el factorial (contExterno)
		SET contInterno = 2;
		-- Usamos todo el código del factorial
		-- -----------------------------------------------------------------------------------------------------------------
		WHILE (contInterno<=factorialActual) DO
			-- Vamos acumulando los resultados parciales en factorial
			SET factorial = factorial*contInterno;
            -- Vamos incrementando el recorrido del intervalo a multiplicar
			SET contInterno=contInterno+1;
		END WHILE;
	-- -----------------------------------------------------------------------------------------------------------------
		-- Una vez obtenido el factorial n (contexterno) mostramos su resultado y la nueva linea
		set msg = CONCAT(msg,factorialActual,'!=',factorial,'\n');
        -- Incrementamos el contExterno para ir a calcular el siguiente número del intervalo
		SET factorialActual=factorialActual+1;
        -- Reiniciamos el acumulador del resultado para volver a empezar a calcular el factorial de un nuevo número
        SET factorial = 1;
    end while;
    -- Mostramos el mensaje
	SELECT msg AS Mensaje;
END $$
DELIMITER ;
CALL numerosFactoriales(7);

-- Crear un procedimiento llamado “numerosPrimos” que, dado un parámetro ‘cantidad’, muestre n-primeros números primos.
-- Ejecución: CALL numerosPrimos (10); 
-- Respuesta por pantalla: Los 20 primeros números primos son: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67 y 71. 

-- OJO: por cuestiones didácticas para esta solución se ha usado la versión fácil pero ineficiente del cálculo de si es primo un número.
drop procedure if exists numerosPrimos;
DELIMITER $$
Create procedure numerosPrimos(in maxNumPrimos integer)
begin
	-- Este contador almacenará el número de primos hallados hasta el momento
	declare numPrimos integer default 0;
    -- Esta variable alberga el número que se está comrpobando actualmente (a partir del 3)
    declare numActual integer default 2; 
    -- Contador usado para recorrer el intervalo desde 2 hasta numActual -1 viendo la divisibilidad
    declare contadorInterno integer default 2;
    -- Mensaje a mostrar iniciado
    declare msg varchar (500) default CONCAT ('Los ',maxNumPrimos,' primeros números primos son: ') ;
    -- Cada nuevo número se asume que es primo
    declare esPrimo boolean default true;
    -- Miestras no se hallan encontrado un número de primos (maxNumPrimos)
    while numPrimos <= maxNumPrimos DO
		-- Mientras no hallamos recorrido todos los números entre 2 y n-1 
		-- y el parámetroo se presuponga primo seguiremos comprobando números
		while contadorInterno < numActual AND esPrimo = true do
			-- Comprobamos si el parámetro es divisible el número que estamos analizando (contador)
			if (numActual % contadorInterno = 0) then
				-- Si no lo es lo marcaremos en la variable correspondiente y el bucle dejará de iterar por no cumplirse la condición
				set esPrimo = false;
			end if;
            -- Incrementamos el contador, si hubiéramos terminado todo el intervalo entre 2 y parámetro - 1 no habrá más iteraciones y el número será primo
			set contadorInterno = contadorInterno + 1;
		end while;
        -- Después del análisis del intervalo comprobaremos si el número es primo o no y lo mostraremos añadiremos al mensaje e incrementaremos el recuento de primos
		if esPrimo = true then
			set numPrimos = numPrimos + 1;
			set msg =  concat(msg, numActual,' ');
		end if;
        -- Comprobaremos el siguiente número en la siguiente iteración
        set numActual = numActual + 1;
        -- Reiniciamos esPrimo y el contadorInterno para la siguiente comprobación 
        set esPrimo = true;
        set contadorInterno = 2;
	end while;
    -- Finalmente, cuando tengamos todos los primos nevesarios, mostraremos el mensaje construido
    select msg AS Mensaje;
end
$$
DELIMITER ;
call numerosPrimos(11);

-- Crear un procedimiento “creaRampa” Dado como parámetro un número que debe ser menor que 30 construye la siguiente estructura del ejemplo hasta el límite que marque el parámetro.
-- Por ejemplo, para el parámetro 5 se mostrará por pantalla.
-- 1
-- 22
-- 333
-- 4444
-- 55555
-- Recuerda que para hacer un salto de línea se debe usar el “\n”.

drop procedure if exists creaRampa;

DELIMITER $$
Create procedure creaRampa(in numeroLimite integer)
begin
	-- Esta variable albergará el número actual que se tiene que repetir en la rampa
	declare numActual integer default 1;
    -- Nos permitirá repetir el número
    declare contador integer;
    declare mensaje varchar(1024) default "";
    -- Para que no se introduzcan números muy altos como parámetro
    if numeroLimite <= 30 then
		-- Procesaremos los números desde 1 hasta el parámetro
		while numActual <= numeroLimite  do -- llega hasta "numero + 1" para que se incluya el propio valor pasado como parámetro en el bucle
			-- Comenzamos el contador a 0
			set contador = 0; -- hay que poner este valor a 0 para que vuelva a pasar por todos otra vez y los añada al mensaje
            -- El bucle dibujará el número actual tantas veces como su valor
			while contador < numActual do
				set mensaje = concat(mensaje, numActual, " ");
				set contador = contador + 1;
            end while;
            -- Incluimos una nueva linea en el mensaje
            set mensaje = concat(mensaje, "\n");
            -- Pasamos al siguiente número
            set numActual = numActual + 1;
        end while;
        -- Mostramos el mensaje
        select mensaje As Mensaje;
    else 
		 select 'No se pueden crear rampas con una altura mayor a 30';
    end if;
end
$$
DELIMITER ;

call creaRampa(10);

-- Crear un procedimiento “creaFlecha” Dado como parámetro un número que debe ser menor que 30 construye la siguiente estructura del ejemplo hasta el límite que marque el parámetro.
-- Por ejemplo, para el parámetro 5 se mostrará por pantalla.
-- 1
-- 22
-- 333
-- 4444
-- 55555
-- 4444
-- 333
-- 22
-- 1

-- Recuerda que para hacer un salto de línea se debe usar el “\n”.
drop procedure if exists creaFlecha;

DELIMITER $$
Create procedure creaFlecha(in numero integer)
begin
	declare numActual integer default 1;
    declare interno integer;
    declare mensaje varchar(2048) default "";
    
    if numero < 30 then
		while numActual < (numero + 1) do -- llega hasta "numero + 1" para que se incluya el propio valor pasado como parámetro en el bucle
			set interno = 0; 			 -- hay que poner este valor a 0 para que vuelva a pasar por todos otra vez y los añada al mensaje
			while interno < numActual do
				set mensaje = concat(mensaje, numActual, " ");
				set interno = interno + 1;
            end while;
            set mensaje = concat(mensaje, "\n");
            set numActual = numActual + 1;
        end while;
        set contador = contador - 2; -- Importante quitar 2 para no incluir el último 'cont + 1' y el último valor del mensaje
        while contador > 0 do
			set interno = 0;
			while interno < contador do
				set mensaje = concat(mensaje, contador, " ");
				set interno = interno + 1;
            end while;
            set mensaje = concat(mensaje, "\n");
            set contador = contador - 1;
        end while;
        select mensaje;
    end if;
end
$$
DELIMITER ;

call creaFlecha(6);
