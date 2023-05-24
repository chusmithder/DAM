-- Escribe una función llamada fn_hipotenusa que devuelva el valor de la hipotenusa de un triángulo 
-- a partir de los valores de sus lados recibidos como parámetros.
-- POWER(X,Y) retorna el valor de X a la potencia de Y.
-- SQRT(X) Retorna la raíz cuadrada de un número no negativo X.
drop function if exists fn_hipotenusa;
delimiter $$
create function fn_hipotenusa(catetoA int, catetoB int) returns float
begin
-- Fórmula del area de un círculo 
	return SQRT(POWER(catetoA,2)+POWER(catetoB,2)); 
end
$$
delimiter ;
drop procedure if exists sp_hipotenusa;
delimiter $$
-- Procedimiento para poder mostrar el area
create procedure sp_hipotenusa (cateto1 int, cateto2 int)
begin
	select fn_hipotenusa(cateto1, cateto2) as Mensaje;
end
$$
delimiter ;
-- Para llamar al procedimiento 
call sp_hipotenusa(3,2);

-- Escribe una función llamada fn_areaCirculo que devuelva el valor del área de un círculo 
-- a partir del valor del radio que se recibirá como parámetro de entrada.
-- Para comprobar que la función es correcta, ejecuta un procedimiento que muestre por pantalla el valor de retorno de la función.
drop function if exists fn_areaCirculo;
delimiter $$
-- Funcion que calcula el area del circulo dado un radio
create function fn_areaCirculo( radio int) returns float
begin
-- Fórmula del area de un círculo 
	return radio*radio*3.1416;
end
$$
delimiter ;
drop procedure if exists sp_areaCirculo;
delimiter $$
-- Procedimiento para poder mostrar el area
create procedure sp_areaCirculo (radio int)
begin
	select fn_areacirculo(radio) as Mensaje;
end
$$
delimiter ;
-- Para llamar al procedimiento 
call sp_areaCirculo(3);

-- Escribe una función llamada fn_diaSemana que reciba como parámetro de entrada un valor numérico 
-- que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del 
-- día de la semana correspondiente. 
-- Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
-- Si devuelve un número que no se halla entre 1 y 7 devolverá la cadena “error”.

drop function if exists fn_diaSemana;
delimiter $$
-- Funcion que recibe por parámtro un entero que corresponde a un dia de la semeana
create function fn_diaSemana(dia int) returns varchar(12)
begin
	-- Hacemos comprobaciones para ver que dia y dependiendo del dia devolvemos una cadena de caracteres u otra
		case dia
			when 1 then
				return 'Lunes';
			when 2 then
				return 'Martes';
			when 3 then
				return 'Miercoles';
			when 4 then
				return 'Jueves';
			when 5 then
				return 'Viernes';
			when 6 then
				return 'Sabado';
			when 7 then
				return 'Domingo';
			else return 'error';
		end case;
end
$$
delimiter ;
drop procedure if exists sp_diaSemana;
delimiter $$
create procedure sp_diaSemana(dia int)
begin
	select fn_diaSemana(dia) as Mensaje;
end
$$
delimiter ;
call sp_diaSemana(5);


-- Escribe una función llamada fn_dameMayor que reciba tres números reales como parámetros de entrada 
-- y devuelva el mayor de los tres.
drop function if exists fn_dameMayor;
delimiter $$
-- Creamos la funncion que como parámtro recibe el 3 enteros
create function fn_dameMayor( a int, b int, c int) returns int
BEGIN	
	-- Según el caso devolveremos uno de los tres números
	if a>b and a>c then
		return a;
	elseif b>a and b>c then
		return b;
	else 
		return c;
	end if;
end
$$
delimiter ;
drop procedure if exists sp_dameMayor;
delimiter $$
create procedure sp_dameMayor( a int, b int, c int)
begin
	declare resul int;
    -- Almeceno el resultado de la función en una variable para después mostrarlo 
    select fn_dameMayor (a,b,c) into resul;
    select concat('El número mayor de ',a,', ',b,' y ',c, ' es: ',resul) as Mensaje;
end
$$
delimiter ;
call sp_dameMayor(2,5,4);

-- Escribe una función llamada fn_anyosTrancurridos que devuelva como salida el número de años que han transcurrido 
-- entre dos fechas que se reciben como parámetros de entrada. Por ejemplo, si pasamos como parámetros de entrada 
-- las fechas 2008-06-17 y 2018-05-20 la función tiene que devolver que han pasado 9 años.
-- Para realizar esta función puede hacer uso de las siguientes funciones que nos proporciona MySQL: TIMESTAMPDIFF.
drop function if exists fn_anyosTranscurridos;
delimiter $$
-- Creamos la funcion con dos fechas para que nos muestre los años entre ambas
create function fn_anyosTranscurridos(fecha1 date, fecha2 date)
returns int
begin
	-- Tan solo devuelvo el resultado de la correcta llamada a timestampdiff
	return timestampdiff(year,fecha1,fecha2);
end;
$$
delimiter ;
drop procedure if exists sp_anyosTranscurridos;
delimiter $$
-- Procedimiento que muestra el resultado
create procedure sp_anyosTranscurridos(fecha1 date, fecha2 date)
begin
	declare  anyos int ;
    -- Almeceno el resultado de la función en una variable para después mostrarlo 
	select fn_anyosTranscurridos(fecha1,fecha2) into anyos;
    select concat('Los años transcurridos entre ',fecha1,' y ',fecha2,' es: ',anyos) as Mensaje;
end
$$
delimiter ;
call  sp_anyosTranscurridos('2002-03-15','2004-03-01');

-- Escribe una función llamada fn_edad que dada una fecha de nacimiento calcule la edad.
-- Para comprobar que la función es correcta, ejecuta un procedimiento que muestre por pantalla el valor de retorno de la función.

drop function if exists fn_edad ;
delimiter $$
create function fn_edad (fecha_nacimiento date)
returns int
begin
 declare edad int;
 -- Calculamos los años transcurridos entre la fecha de nacimiento y la fecha actual y lo almacenamos en una variable
 set edad= TIMESTAMPDIFF(YEAR, fecha_nacimiento,CURTIME());
 -- Devolvemos la variable
 return edad;
end
$$ 
delimiter ;
drop procedure if exists sp_edad;
delimiter $$
create procedure sp_edad(fecha date)
begin
	declare vedad int;
    -- Almeceno el resultado de la función en una variable para después mostrarlo 
    select fn_edad (fecha) into vedad;
    select concat('La edad del usuario dado su fecha de nacimiento ',fecha,' es: ',vedad, ' años') as Mensaje;
end
$$
delimiter ;
call sp_edad('1998-05-23');

-- Implementar una función fn_esDivisor que reciba como parámetro dos números enteros (a y b) 
-- que compruebe si a es divisor que b y devuelva un entero que indique el resultado (1 si el número a es divisor de b y 0 en caso contrario).  
-- La función no debe mostrar nada, solo devolver un entero.
-- Si a es mayor que b entonces devolverá -1 (error).
drop function if exists fn_esDivisor;
delimiter $$
create function fn_esDivisor( a int, b int)
returns int
begin
	declare resto int;
    -- Si a es mayor que b devuelve un error
	if (a > b) then
		return (-1);
	else
    -- Si el resto da cero significa que es divisible un numero entre otro
		if b % a = 0 then
			return 0;
		else 
			return 1;
		end if;
	end if;
end;
$$
delimiter ;
drop procedure if exists sp_esDivisor;
delimiter $$
create procedure sp_esDivisor(a int, b int)
begin
	declare resultado int;
    -- Almeceno el resultado de la función en una variable 
    select fn_esDivisor(a,b) into resultado;
    -- Según cuál haya sido el resultado de la variable muestro un mensaje u otro
    if resultado = 0 then
		select concat ('El número ',b, ' es divisible entre ',a) as devolucion;
	elseif resultado = 1 then
		select concat ('El número ',b, ' NO es divisible entre ',a) as devolucion;
	else
		select concat('El número ',a, ' es mayor que ',b)as devolucion;
	end if;
end
$$
delimiter ;
call sp_esDivisor(3,4);

-- Crear un procedimiento llamado “factorialesConFuncion” que, dado un parámetro ‘limite’, 
-- muestre el resultado de todos factoriales hasta el límite dado por el parámetro. 
-- Es este caso usarás una función "fn_factorial" que dado un número te devuelva su factorial.
-- Ejecución: CALL factorialesConFuncion (4);
-- Respuesta por pantalla: 
-- 1! = 1
-- 2! = 2
-- 3! = 6
-- 4! = 24
drop function if exists fn_factorial;
delimiter $$
create function fn_factorial(num int) returns int
begin
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
    return factorial;
end $$
delimiter ;
drop procedure if exists factorialesConFuncion;
delimiter $$
create procedure factorialesConFuncion(numLimite int)
begin
	 DECLARE factorialActual int DEFAULT 1;
     DECLARE resultadoActual int;
     DECLARE msg varchar(500) DEFAULT '';
	 
	-- El contador irá recorriendo el intervalo de números (desde 1 hasta numLimite) de los que queremos obtener el factorial
     while (factorialActual <= numLimite) DO
		-- La función calculará el resultado del factorial y lo almacenaremos
        set resultadoActual = fn_factorial(factorialActual);
		-- Una vez obtenido el factorial del número actual lo concatenamos al mensaje
        set msg = CONCAT(msg,factorialActual,'!=',resultadoActual,'\n');
        -- OJO, lo podríamos haber hecho así más discreto y elegante:
        -- set msg = CONCAT(msg,factorialActual,'!=',fn_factorial(factorialActual),'\n');
        -- Incrementamos el contExterno para ir a calcular el siguiente número del intervalo
		SET factorialActual=factorialActual+1;
    end while;
    -- Mostramos el mensaje
	SELECT msg AS Mensaje;
end $$
delimiter ;
call factorialesConFuncion (5);
-- Crear un procedimiento llamado “primosConfuncion” que, dado un parámetro ‘cantidad’, 
-- muestre n-primeros números primos. Es este caso usarás una función “fn_esPrimo” que 
-- dado un número te devuelva un valor booleano que indique si es primo o no.
-- Ejecución: CALL numerosPrimos (20); Mostrará los 20 primeros números primos.
-- Respuesta por pantalla: 
-- Los 20 primeros números primos son: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67 y 71. 
drop function if exists fn_esPrimo;
delimiter $$
create function fn_esPrimo(num int) returns boolean
begin
	-- OJO: ALGORITMO DE COMPROBACIÓN DE PRIMO EN VERSIÓN EFICIENTE
	-- Para empezar comprobamos que no sea par y que sea mayor que dos
	declare esPrimo boolean default (num % 2 != 0) and (num > 2);
    -- Solo recorreremos la mitad inferior de los números entre 2 y num-1
    -- La otra mitad de los números se descartan porque un número n nunca es divisible entre num/2 - 1;
    declare mitad integer default num / 2;
    -- Comezamos en 3 ya que el dos está descartado al asumir que no es par
    declare contador integer default 3;
    -- Mientras no se detecte que el número NO es primo y que no hemos recorrido todo el intervalo
    while (esPrimo and contador < mitad) do
		if num % contador = 0 then
			-- Si es divisible por algún número del intervalo 
			set esPrimo = false;
		end if;
        -- Solo recorreremos números impares
        set contador = contador + 2;
	end while;
    -- Después del análisis del intervalo lo devolveremos si el número es primo o no 
	return esPrimo;
end $$
delimiter ;
drop procedure if exists primosConFuncion;
delimiter $$
create procedure primosConFuncion(maxNumPrimos int)
begin
	-- Este contador almacenará el número de primos hallados hasta el momento
	declare numPrimos integer default 0;
    -- Esta variable alberga el número que se está comrpobando actualmente (a partir del 2)
    declare numActual integer default 2; 
    -- Aquí almacenaremos si el número actual es primo o no
    declare esPrimo boolean;
    -- Mensaje a mostrar iniciado
    declare msg varchar (500) default CONCAT ('Los ',maxNumPrimos,' primeros números primos son: ') ;
    -- Mientras no se hallan encontrado el número de primos solicitado(maxNumPrimos)
    while numPrimos <= maxNumPrimos DO
		-- Comprobaremos si el número actual es primo
        set esPrimo = fn_esPrimo(numActual);
        -- Si el número es primo o no y lo añadiremos al mensaje e incrementaremos el recuento de primos
		if esPrimo = true then
			set numPrimos = numPrimos + 1;
			set msg =  concat(msg, numActual,' ');
		end if;
        -- Comprobaremos el siguiente número en la siguiente iteración
        set numActual = numActual + 1;
	end while;
    -- Finalmente, cuando tengamos todos los primos necesarios, mostraremos el mensaje construido
    select msg AS Mensaje;
end $$
delimiter ;
call primosConFuncion (20);

-- Escribe una función llamada fn_quitaTildes que reciba una cadena de entrada y devuelva la misma cadena, pero sin acentos. 
-- La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal, pero sin tilde. 
-- Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.
-- Pista: Para obtener el carácter número 5 de la cadena str tienes que ejecutar SUBSTRING ( str , 5 , 1). 
-- Equivale a “dame un carácter en la posición 5 de la cadena str.
drop function if exists fn_quitaTildes;
delimiter $$
-- Necesitamos pasar por parámetro el nombre
create function fn_quitaTildes(nombre varchar(50)) returns varchar(50)
begin 
	declare resultado varchar(50) default "";
    -- Inicializamos el contador para recorrer la cadena a 1
    declare i int DEFAULT 1;
	-- Inicializamos la cadena a la longitud del nombre que pasan por parámetro
    declare longitud int DEFAULT length(nombre);
    declare caracter char;
    -- Hacemos un bucle para que recorra de uno a uno los caracteres de la cadena
    while i<=longitud do
        -- Cogemos uno a uno los caracteres de la cadena
        set caracter=substring(nombre,i,1);
        case caracter
        -- Comprobamos que no sean caracteres con tilde en cuyo caso los ponemos sin tilde
			when 'á' then
				 set caracter='a';
			when 'Á' then
				set caracter= 'A';
			when 'É' then
				set  caracter='E';
			when 'é'then
				set caracter= 'e';
			when 'í'then
				set caracter= 'i';
			when 'Í'then
				set caracter= 'I';
			when 'ó'then
				set caracter= 'o';
			when 'Ó'then
				set caracter= 'O';
			when 'Ú'then
				set caracter= 'U';
			when 'ú' then
				set caracter='u';
			else
				-- CASE nos obliga a tener un else, así que usamos una instrucción "estúpida"
				set caracter=caracter;
		end case;
        -- El caracter comprobado y, en su caso, sustituido, es añadido a la cadena reconstruyéndola
		set resultado=concat(resultado,caracter);
        -- Incrementamos el contador para ir a por el próximo caracter
		set i=i+1;
	end while;
	-- Devolvemos el resultado
    return resultado;
end;
$$
delimiter ;
drop procedure if exists sp_quitaTildes;
delimiter $$
-- Procedimiento para mostrar el mensaje
create procedure sp_quitaTildes( nombre varchar(50))
begin
	declare var varchar(50);
    -- Introduzco el resultado de la función en una variable
    select fn_quitaTildes(nombre) into var;
    -- Muestro el mensaje usando la variable con el resultado de la función
    select concat('La cadena de caracteres "',nombre,'" sin tildes es: ',var) AS Mensaje;
end
$$
delimiter ;
call sp_quitaTildes('María');

-- Escribe una función llamada fn_encripta que se encargue de encriptar un mensaje que recibe como parámetro, 
-- para ello se sumará 2 al código ASCII del carácter (función de sistema ASCII(cadenaCaracteres)).

drop function if exists fn_encripta;
delimiter $$
-- vamos a crear la funcion para encriptar una cadena de caracteres
create function fn_encripta (cadena varchar(200))
returns varchar(200)
begin 
	declare longitud int default length(cadena);
    -- En aux almacenaremos la cadena resultante
    declare aux varchar(200) default '';
    -- Esta varible nos hará de intermediaria para poder almacenar el caracter que tenemos que ir modificando
    declare caracter char;
    declare entero int;
    declare i int default 1;
    while (i<=longitud) do
		set caracter=substring(cadena, i,1);
        -- Primero obtenemos el codigo ascii del caracter y le sumamos 2
        set entero=ASCII(caracter)+2;
        -- Pasamos el nuevo codigo ascii a un caracter
        set caracter=char(entero);
        -- Vamos concatenando variables
        set aux=concat(aux,caracter);
		set i=i+1;
    end while;
	return aux;
end;
$$ 
delimiter ;
drop procedure if exists sp_encripta;
delimiter $$
create procedure sp_encripta(cadena varchar(200))
begin
	declare resultado varchar(200);
    -- Introduzco el resultado de la función en una variable
    select fn_encripta(cadena) into resultado;
    -- Muestro el mensaje usando la variable con el resultado de la función
    select concat('La cadena de caracteres ', cadena, ' da como resultado de cifrado lo siguiente: ', resultado) AS Mensaje;
end
$$
delimiter ;
call sp_encripta('Hola');

-- Escribe también la función “fn_desencripta” que desencripte el mensaje anterior. 
drop function if exists fn_desencripta;
delimiter $$
-- vamos a crear la funcion para encriptar una cadena de caracteres
create function fn_desencripta (cadena varchar(200))
returns varchar(200)
begin 
	declare longitud int default length(cadena);
    -- En aux almacenaremos la cadena resultante
    declare aux varchar(200) default '';
    -- Esta varible nos hará de intermediaria para poder almacenar el caracter que tenemos que ir modificando
    declare caracter char;
    declare entero int;
    declare i int default 1;
    while (i<=longitud) do
		set caracter=substring(cadena, i,1);
        -- Primero obtenemos el codigo ascii del caracter y le sumamos 2
        set entero=ASCII(caracter)-2;
        -- Pasamos el nuevo codigo ascii a un caracter
        set caracter=char(entero);
        -- Vamos concatenando variables
        set aux=concat(aux,caracter);
		set i=i+1;
    end while;
	return aux;
end;
$$ 
delimiter ;
drop procedure if exists sp_desencripta;
delimiter $$
create procedure sp_desencripta(cadena varchar(200))
begin
	declare resultado varchar(200);
    -- Introduzco el resultado de la función en una variable
    select fn_desencripta(cadena) into resultado;
    -- Muestro el mensaje usando la variable con el resultado de la función
    select concat('La cadena de caracteres ', cadena, ' da como resultado de DEScifrado lo siguiente: ', resultado) AS Mensaje;
end
$$
delimiter ;
call sp_desencripta('Jqnc');

-- Función llamada “fn_esBisiesto” que a partir de un año retorne true si es bisiesto, false si no lo es. 
-- Nota: Los años bisiestos son los múltiplos de 4 que no son múltiplos de 100, pero los múltiplos de 400 sí son bisiestos. 
-- Ejemplo: 1900 no fue bisiesto, 2000 si lo fue y 2100 no lo será.
-- Para comprobar que la función es correcta, ejecuta un procedimiento que muestre por pantalla el valor de retorno de la función.

drop function if exists fn_esBisiesto;
delimiter $$
create function fn_esBisiesto(anyo int) returns boolean
begin
	-- Para que un año sea bisiesto tiene que ser divisible por 4 y no por 100 o bien divisible por 400
    -- Según el caso devolvemos verdadero o falso
	if ( anyo % 400= 0 or (anyo % 100 !=0 and anyo % 4 =0)) then
		return true;
	else 
		return false;
	end if;
end
$$
delimiter ;
drop procedure if exists sp_esBisiesto;
delimiter $$
create procedure sp_esBisiesto(anyo int)
begin
	-- Según si la función nos indica la condición de bisiesto del año mostramos un mensaje u otro
	if fn_esBisiesto(anyo) then
		select concat('El año ',anyo,' es bisiesto') AS Mensaje;
    else
		select concat('El año ',anyo,' no es bisiesto') AS Mensaje;
    end if;
end
$$ 
delimiter ;
call sp_esBisiesto(2100);

-- Escribe una función llamada “fn_esCapicua” que recibiendo un número retorne true si el nº es capicúa y false si no lo es. 
-- Primero debes construir, con operaciones matemáticas, un número con las posiciones de sus cifras invertidas. 
-- Después compararlo con el número pasado por parámetro.
-- Para comprobar que la función es correcta, ejecuta un procedimiento que muestre por pantalla el valor de retorno de la función.
drop function if exists fn_esCapicua;
delimiter $$
create function fn_esCapicua(num int) returns boolean
begin
	-- Usaremos esta variable para almacenar el número que resulte sucesivamente al irle quitando cifras
	declare numAux int DEFAULT num;
    -- Calcularemos el resto de la división entera, aquí almacenaremos cuál es la cifra más a la derecha
    declare resto int;
    -- Aquí almacenaremos el número invertido añadiendo las cifras por la izquierda que le vamos 
    -- quitando al parámetro por la derecha
    declare numInvertido int default 0;
	 
     -- Si el número fuera más pequeño que diez significaría que solo tiene una cifra y, obviamente, va a ser capicúa
    if (num < 10) then 
		return true;
	-- Si el número tiene algún 0 por la derecha es imposible que sea capicúa porque no puede haber 0s a la izquierda
	elseif (num % 10 = 0) then
		return false;
	else -- En el resto de los casos...
		-- Si al número auxiliar iniciado como el parámetro al que se le van quitando cifras sigue teniendo cifras 
        -- seguiremos de construyendo el invertido. 
		while(numAux > 0) do
			-- Obtenemos la cifra más a la derecha del número auxiliar
			set resto = numAux % 10;
            -- Para añadir esa cifra por la derecha, 
            set numInvertido = numInvertido * 10 + resto; 
            -- Eliminamos la cifra de más a la derecha del número auxiliar y continuamos
            set numAux = TRUNCATE(numAux / 10,0);
		END WHILE;
	end if;
    -- Si el número invertido y el parámetro con iguales es capicúa (true) y sino no lo es (false)
    if (numInvertido = num) then
		return true;
	else 
		return false;
	end if;
end
$$
delimiter ;
drop procedure if exists sp_esCapicua;
delimiter $$
create procedure sp_esCapicua(numero int)
begin
	-- Según si la función nos indica la condición de capicúa del número mostramos un mensaje u otro
    if  fn_esCapicua(numero) then
		select 'El numero es capicúa.' AS Mensaje;
	else 
		select 'El numero no es capicúa.' As Mensaje;
	end if;
end
$$
delimiter ;
call sp_esCapicua(2312);


