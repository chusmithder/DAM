/*************************************
***   SIN BD - ITERATIVAS-- *********
*************************************/

/*PROGRAMACIÓN DE BBDD EN MYSQL II*/

-- --------------Entructuras de control iterativas no anidadas---------------------------
-- Crea un procedimiento llamado “secuenciaNumeros” que, dado un número como parámetro, muestre todo el intervalo de números desde el 1 hasta el número de la siguiente manera:
-- Ejecución: CALL secuenciaNumeros (7);
-- Respuesta por pantalla: ‘Los números del intervalo desde 1 hasta 11 son 1 2 3 4 5 6 7 8 9 10 11.’


-- Crea un procedimiento llamado “secuenciaNumeros2” que, dado dos números como parámetro, muestre todo el intervalo de números desde el primer parámetro hasta el segundo parámetro de la siguiente manera:
-- Ejecución: CALL secuenciaNumeros (3,9);
-- Respuesta por pantalla: ‘Los números del intervalo desde 3 hasta 12 son 3 4 5 6 7 8 9 10 11 12.’;


-- Crea un procedimiento llamado “secuenciaNumeros3” que amplíe la funcionalidad del anterior ejercicio usando comas entre los números:
-- Ejecución: CALL secuenciaNumeros (3,9)
-- Respuesta por pantalla: ‘Los números del intervalo desde 3 hasta 9 son 3, 4, 5, 6, 7, 8, 9.’
-- ¡Ojo que tras el último número no hay coma!
drop procedure if exists secuenciaNumeros3;
DELIMITER $$

Create procedure secuenciaNumeros3(in primero integer, in segundo integer)
begin
	-- Este contador recorrerá todo el intervalo y lo iniciamos al comienzo del intervalo
	declare contador integer default primero;
    -- Dejamos preparado el comienzo del mensaje
    declare mensaje varchar(255) default concat('Los números del intervalo desde ',primero,' hasta ',segundo,' son ',primero, ", ");
	-- Hacemos la comprobación de que el primer parámetro es menosr que el segundo
	if (primero < segundo) then
		-- Mientras el contador (que empieza en "primero") no alcance al extremo del intervalo ("segundo")
		while segundo > contador do
			-- Incrementamos el contador
			set contador = contador + 1;
            -- Mientras no sea el último número del intervalo ponemos una coma
			if contador != segundo then
				set mensaje = concat(mensaje, contador, ", ");
			else
				set mensaje = concat(mensaje, contador);
			end if;
		end while;
        -- Muestro el mensaje
        select mensaje as Mensaje;
	else
		-- En caso de no ser el primero menos que el segundo se lanzará un error
		select "Error, el primer número debe ser más pequeño que el segundo." as Mensaje;
    end if;

end
$$
DELIMITER ;

call secuenciaNumeros3(4, 7);


-- Crea un procedimiento llamado “tablaMultiplicar” que recibirá un número entero entre 1 y 9 para que haga lo siguiente:
-- 1.Borre si existe y después cree una tabla llamada TablaMul con 3 columnas: las 2 primeras numéricas y la tercera de 30 caracteres.
-- 			create table TEMP(
-- 				numero int,
-- 				multiplicador int,
-- 				resultado int);
-- 2.Inserte la tabla de multiplicar del número proporcionado en la tabla creada y después la muestre por pantalla.

drop procedure if exists tablaMultiplicar;
DELIMITER $$

Create procedure tablaMultiplicar(in entero integer)
begin
	declare contador integer default 1;
    declare solucion integer default 0;
    -- Creamos la tabla
	drop table if exists TablaMul;
    create table TablaMul(
		numero int,
        multiplicador int,
        resultado int
    );
    -- Usamos el contador iniciado a uno para hacer 10 iteraciones
    while contador <= 10 do
		-- Cada iteración calculamos una línea de la tabla de multiplicar usando el contador
		set solucion = entero * contador; 
        -- Inserto el parámetro, el contador y el parámetro
		insert into TablaMul (numero, multiplicador, resultado) values (entero, contador, solucion);
        -- Incremento el contador para hacer la siguiente iteración
        set contador = contador + 1;
    end while;
    -- Muestro la tabla recién creada
	select * from TablaMul;
end
$$
DELIMITER ;

call tablaMultiplicar(3);

-- Crea un procedimiento llamado “tiraDado” que reciba como parámetro un número entero y genere ese número de tiradas de un dado. 
-- Para simular la tirada de un dado usaremos unas funciones que nos permiten obtener un valor aleatorio entre 1 y 6. 
-- FLOOR(RAND()*6+1) devuelve, para cada ejecución, un número entero aleatorio entre 1 y 6.
-- También hará la comprobación de que se recibe un número positivo.

drop procedure if exists tiraDado;
DELIMITER $$
Create procedure tiraDado(in numTiradas integer)
begin
	-- El contador controlará el nº de tiradas
	declare contador integer default 1;
    -- En esta variable iremos construyendo el mensaje de salida
    declare mensaje varchar (500) default '';
    
	if (numtiradas <= 0) then -- Comprobamos que el parámetro no es negativo ni 0
		set mensaje = concat('El número de tiradas debe ser un entero positivo');
	else 
		-- Si el parámetro cumple las especificaciones recorremos el bucle tantas veces como nº de tiradas hayamos recibido por parámetro 
		while contador <= numtiradas do
			-- FLOOR(RAND()*6+1) devuelve, para cada ejecución, un número entero aleatorio entre 1 y 6.
			-- Para cada tirada concatenamos el mensaje (línea) anterior a la nueva línea (\n) correspondiente a la nueva tirada
			set mensaje = CONCAT(mensaje,'La tirada nº ',contador,' obtiene un :',FLOOR(RAND()*6+1),'\n');
            -- Incremento el contador para hacer la siguiente iteración
            set contador=contador+1;
           end while;
	end if;
    -- Muestro el mensaje construido con todas sus líneas
    select mensaje;
end
$$
DELIMITER ;
call tiraDado(-5);

-- Crear un procedimiento llamado “factorial” que reciba como parámetro un número entero (numero) 
-- y te calcule el desarrollo del factorial (numero!).
-- El factorial de un número n (n!) es n! = 1 * 2 * 3 * … * n-1 * n. 
-- Ejemplo: El factorial de 5 es 5! = 5 * 4 * 3 * 2 * 1 = 120.
DROP PROCEDURE IF EXISTS factorial;
DELIMITER $$
CREATE PROCEDURE factorial (num int) 
BEGIN
	-- Esta variable actuará como acumulador ya que iremos multiplicando su valor por otros valores y almacenando en la mismna su resultado
    -- OJO: Debe inicializarse a 1 ya que si la inicializamos a 0 cada vez que multipliquemos su valor por cualquier número el resultado dará 0
	DECLARE factorial int DEFAULT 1;
    -- En este caso inicializaremos el contador al valor del parámetro. Así iremos recorriendo desde el parámetro hasta 1
    DECLARE cont int DEFAULT num;
    -- Iremos recorriendo los valores del intervalo existente entre el parámetro y 2 (iremos decrementando el contador) 
    WHILE (cont>1) DO
		-- Multiplicaremos el valor del acumulador por el valor del contador para ir almacenando resultados parciales
		SET factorial = factorial*cont;
        -- Decrementamos el contador
        SET cont=cont-1;
	END WHILE;
    -- Mostramos el resultado
    SELECT CONCAT('El factorial de ',num,' es ',factorial) AS Mensaje;
END $$
DELIMITER ;

CALL factorial (5);

-- Crea un procedimiento llamado “productoConSumas” que calcule el producto de dos números enteros usando sumas. Los valores de los dos enteros se proporcionarán como parámetros.
-- Ejemplo: Tienes que calcular 3 x 4 como 3+3+3+3.
-- No puedes usar el operador de multiplicación (*).
-- Muestra el resultado por pantalla de la siguiente manera:
-- Mensaje: El resultado de 3 x 4 es 3+3+3+3=12.

drop procedure if exists productoConSumas;
DELIMITER $$
Create procedure productoConSumas(in primero integer, in segundo integer)
begin
	-- El contador nos ayudará a ir sumando 'primero' tantas veces como indique 'segundo'.
	declare contador integer default 0;
    -- Aquí iremos almacenando el resultado de cada nueva suma en cada iteración
    declare acumulador integer default 0;
    -- Preparamos la primera parte del mensaje para después concatenar el resto de la información
    declare mensaje varchar(255) default concat("El resultado de ", primero, " x ", segundo, " es ");
	-- Este bucle se repetirá el nº de veces que indique el nº 'segundo'.
    while segundo > contador do
		-- Acumulamos sobre el acumulador el 'primero'
		set acumulador = acumulador + primero;
        -- Concatenamos el nº 'primero
        set mensaje = concat(mensaje, primero);
        -- Incrementamos el contador
        set contador = contador + 1;
        -- Si NO se trata de la última suma entonces concatenamos el símbolo '+'. Si fuera la última no lo haríamos
        if contador != segundo then
			set mensaje = concat(mensaje, " + ");
		end if;
    end while;
    -- Concatenamos al mensaje el símbolo '=' y el resultado total
    set mensaje = concat(mensaje, " = ", acumulador);
    -- Mostramos el mensaje
    select mensaje;
end
$$
DELIMITER ;

call productoConSumas(9,7);

-- Crea un procedimiento llamado “esPrimo” que evalúe si un número positivo es o no primo. El valor del número a evaluar se proporcionará como parámetro. Recordad que un número primo es aquel que solo es divisible entre 1 y sí mismo.
-- El operador % calcula el resto de una división entera.
-- Muestra el resultado por pantalla.

drop procedure if exists esPrimo;
DELIMITER $$
Create procedure esPrimo(in numero integer)
begin
	-- Este contador irá de 2 hasta parámetro - 1 
	declare contador integer default 2;
    -- Tomamos como premisa como que el parámetro sí es primo (el parámetro será primo hasta que se demuestre lo contrario).
	-- Si en algún momento nos damos cuenta que no lo es (es divisible entre algún número del intervalo entre número-1 y 2) 
    -- lo pondrmeos a false
    declare esPrimo boolean default true;
	-- Mientras no hallamos recorrido todos los números entre 2 y n-1 
    -- y el parámetroo se presuponga primo seguiremos comprobando números
    while numero > contador AND esPrimo = true do
		-- Comprobamos si el parámetro es divisible el número que estamos analizando (contador)
        if (numero % contador = 0) then
			-- Si no lo es lo marcaremos en la variable correspondiente y el bucñle dejará de iterar por no cumplirse la condición
			set esPrimo = false;
		end if;
        -- Incrementamos el contador, si hubiéramos terminado todo el intervalo entre 2 y parámetro - 1 no habrá más iteraciones y el número será primo
        set contador = contador + 1;
    end while;
    -- Después del análisis del intervalo comprobaremos si el número es primo o no y lo mostraremos por pantalla
	if esPrimo = true then
		select concat("El numero ", numero, " es un numero primo") as respuesta;
	else 
		select concat("El numero ", numero, " no es un numero primo") as respuesta;
	end if;
end
$$
DELIMITER ;
call esPrimo(11);

/*La solución anterior no es muy eficiente, por cortesía de Asier Sánchez 
aquí tenemos una solución más eficiente*/
drop procedure if exists esPrimo;
delimiter $$
create procedure esPrimo(in n integer)
begin
	-- Para empezar comprobamos que no sea par y que sea mayor que dos
	declare esPrimo boolean default (n % 2 != 0) and (n > 2);
    -- Solo recorreremos la mitad inferior de los números entre 2 y n-1
    -- La otra mitad de los números se descartan porque un número n nunca es divisible entre n/2 - 1;
    declare mitad integer default n / 2;
    -- Comezamos en 3 ya que el dos está descartado al asubir que no es par
    declare i integer default 3;
    -- Mientras no se detecte que el número NO es primo y que no hemos recorrido todo el intervalo
    while (esPrimo and i < mitad) do
		if n % i = 0 then
			-- Si es divisible por algún número del intervalo 
			set esPrimo = false;
		end if;
        -- Solo recorreremos números impares
        set i = i + 2;
	end while;
    if esPrimo then
		select concat('El número ', n, ' es primo.') AS Mensaje;
	else
		select concat('El número ', n, ' no es primo.') AS Mensaje;
	end if;
end
$$
delimiter ;
call esPrimo(17);

-- Crear un procedimiento llamado “factorial2” que reciba como parámetro un número entero (numero) 
-- y te calcule el desarrollo del factorial (numero!) mostrando el resultado con el siguiente formato:

use bdPedidos;
DROP PROCEDURE IF EXISTS factorial2;
DELIMITER $$
CREATE PROCEDURE factorial2 (num int) 
BEGIN
	-- Esta variable actuará como acumulador ya que iremos multiplicando su valor por otros valores y almacenando en la mismna su resultado
    -- OJO: Debe inicializarse a 1 ya que si la inicializamos a 0 cada vez que multipliquemos su valor por cualquier número el resultado dará 0
	DECLARE factorial int DEFAULT 1;
     -- En este caso inicializaremos el contador al valor del parámetro. Así iremos recorriendo desde el parámetro hasta 1
    DECLARE cont int DEFAULT num;
    -- Esta variable almacenará el desarrollo del factorial.
    DECLARE texto varchar(100) DEFAULT '';
	-- Iremos recorriendo los valores del intervalo existente entre el parámetro y 2 (iremos decrementando el contador) 
    WHILE (cont>1) DO
		-- Multiplicaremos el valor del acumulador por el valor del contador para ir almacenando resultados parciales
		SET factorial = factorial*cont;
        -- Al desarrollo ya existente le concatenamos el contador y el símbolo de multiplicación. Si era "4*3*" ahora sería "4*3*2*"
        SET texto = CONCAT(texto,cont,'*');
        -- Decrementamos el contador
        SET cont=cont-1;
	END WHILE;
    -- Cuando hemos hecho la última iteración (contador en 2) ya podemos añadir el final del desarrollo. Si era "4*3*2*" ahora sería "4*3*2*1=24"
    SET texto = CONCAT(texto,'1 = ',factorial);
    -- Mostramos el resultado
    SELECT CONCAT('El factorial de ',num,' es ', texto) AS Mensaje;
END $$
DELIMITER ;

CALL factorial2 (6);

-- Crear un procedimiento llamado “invertirCadena” que, dado un parámetro de cadena de caracteres, 
-- almacene en una variable esa cadena “al revés”, es decir, con el orden de sus caracteres invertido. 
-- Después, muestra el valor de la variable (la cadena invertida). 
-- Ojo: Solo puedes usar las siguientes funciones: CONCAT(), SUBSTRING(cadena, posición, numCaracteres) y CHAR_LENGTH().
-- Pista: Para obtener el carácter número 5 de la cadena str tienes que ejecutar SUBSTRING ( str , 5 , 1). 
-- Equivale a “dame un carácter en la posición 5 de la cadena str.

DROP PROCEDURE IF EXISTS invertirCadena;
DELIMITER $$
CREATE PROCEDURE invertirCadena (cadena varchar(20)) -- asumiremos que el parámetro tiene como valor 'luis'
BEGIN
	-- En esta variable almacenaré la cadena invertida (acabará siendo 'siul')
	DECLARE cadenaInv varchar (20) DEFAULT '';
    -- Este contador recorrerá cada posición de la cadena desde 1 hasta la longitud de la cadena.
    DECLARE cont int DEFAULT 1;
    -- Almacenamos la longitud de la cadena
    DECLARE longCadena int DEFAULT char_length(cadena);
    -- Recorremos cada posición de la cadena desde 1 hasta la longitud de la cadena
    WHILE (cont<=longCadena) DO
		-- Obtenemos un nuevo caracter de la cadena y lo concatenamos A LA IZQUIERDA de la cadena invertida.
        -- Ejemplo: Si contador=3 y la cadena invertida = 'ul'. Sacaremos del parámetro 'i' y la cadena invertida quedará 'iul'.
		SET cadenaInv = CONCAT(SUBSTRING(cadena,cont,1),cadenaInv);
        -- Incrementamos el contador para ir a por la próxima posición
        SET cont=cont+1;
	END WHILE;
	-- Mostramos el resultado
    SELECT CONCAT('La cadena invertida de ',cadena,' es ',cadenaInv) AS Mensaje;
END $$
DELIMITER ;

CALL invertirCadena ('luis dorado');

-- Crear un procedimiento llamado “creaVacaciones” que reciba como parámetro un año (tipo YEAR) y que inserte en una tabla todas las fechas de los fines de semana y del mes de agosto.
-- 1. El procedimiento borra la tabla si es que existe y crea la siguiente tabla: 
-- 		CREATE TABLE Vacaciones (Dia_Vac DATE UNIQUE NOT NULL);
-- 2. Vamos recorriendo todas las fechas del año proporcionado para incluir todas las que pertenezcan a fin de semana o a agosto.
-- 3. Para terminar: El procedimiento mostrará todas las fechas de la tabla incluyendo una columna con el nombre del día de la semana.
-- Pista 1: Las fechas también se pueden construir como cadenas y se les puede aplicar CONCAT().
-- Pista 2: La función DATE_ADD (fecha, INTERVAL numDias DAY) incrementa una fecha un número determinado de días y luego devuelve la fecha.

drop procedure if exists creaVacaciones;
DELIMITER $$
Create procedure creaVacaciones(in anyo year)
begin
	-- Será nuestro contador para recorrer todas las fecha del año proporcionado por parámetro
	declare fecha date;
    -- Será el último día del año a recorrer
    declare fechaFin date;
    -- Creamos la tabla vacaciones donde almacenaremos todas las fecha de vacaciones
    drop table if exists Vacaciones;
    CREATE TABLE Vacaciones (Dia_Vac DATE UNIQUE NOT NULL);
    -- La "fecha contador" comenzará el 1 de enero del año proporcionado por parámetro
	SET fecha = CONCAT(anyo,'-01-01');
    -- La "fecha límite" comenzará el 31 de diciembre del año proporcionado por parámetro
    SET fechaFin = CONCAT(anyo,'-12-31');
    -- Miestas no lleguemos al año siguiente iremos recorriendo todas las fechas
    while fecha < fechaFin do
		-- Si es una fecha de agosto o sábado o domingo la insertamos en la tabla
		if month(fecha) = 8 or dayofweek(fecha) = 7 or dayofweek(fecha) = 1 then
			insert into Vacaciones (Dia_Vac) values (fecha);
		end if;
        -- Incrementamos la fecha al día siguiente
        SET fecha = DATE_ADD(fecha, INTERVAL 1 DAY);
    end while;
    -- Mostramos un campo de la tabla y otro campo calculado
	select Dia_vac AS 'Fecha', dayname(Dia_vac) AS 'Día semana' from Vacaciones;
end
$$
DELIMITER ;

call creaVacaciones(1990);

-- Crear un procedimiento llamado “cuentaPalabras” que, dado un parámetro de cadena de caracteres, 
-- cuente el número de palabras que contiene.
-- Una palabra está delimitada por un espacio, un inicio de cadena o un fin de cadena.

use bdPedidos;
DROP PROCEDURE IF EXISTS cuentaPalabras;
DELIMITER $$
CREATE PROCEDURE cuentaPalabras (cadena varchar(20)) 
BEGIN
	 -- El contador nos permitirá ir recorriendo las posiciones de la cadena proporcionada por parámetro hasta la longitud total
    DECLARE cont int DEFAULT 1;
    -- Almacenamos la longitud de la cadena que marcará el límite del recorrido (máximo nº de posiciones)
    DECLARE longCadena int DEFAULT char_length(cadena);
	-- En esta variable almacenaremos uno a uno los caracteres de la cadena 
	declare caracter varchar (1);
    -- Esta "bandera" nos dirá si durante el recorrido se ha iniciado una palabra
	DECLARE inicioPalabra boolean DEFAULT false;
    -- Aquí almacenamos el número de palabras de la cadena
    DECLARE numPalabras int DEFAULT 0;
    -- Mientras no hallamos llevado al límite de posiciones de la cadena (longitud)
    WHILE (cont <= longCadena) DO
		-- Obtenemos un caracter de la posición dada por el contador
		set caracter = SUBSTRING(cadena,cont,1);
        -- Si el caracter no es un espacio y no hemos iniciado ninguna palabra
		if caracter != ' ' and inicioPalabra is false then
			-- Comenzamos palabra
			set inicioPalabra=true;
            -- Incrementamos el nº de palabras detectadas
            set numPalabras=numPalabras+1;
		-- Sino, si es un espacio y ya habíamos iniciado una palabra significva que la hemos terminado
		elseif caracter = ' ' and inicioPalabra is true then
			-- Finalizamos palabra
			set inicioPalabra=false;
        end if; -- Si encontramos un espacio y no habíamos empezado palabra, o bien si encontramos una letra pero ya habíamos empezado palabra no haremos nada (salvo incrementar el contador
        -- Incrementamos el contador
        SET cont=cont+1;
	END WHILE;
    -- Mostramos el resultado
    SELECT CONCAT('La cadena "',cadena,'" tiene ',numPalabras,' palabras') AS Mensaje;
END $$
DELIMITER ;

CALL cuentaPalabras ('luis dorado ');



