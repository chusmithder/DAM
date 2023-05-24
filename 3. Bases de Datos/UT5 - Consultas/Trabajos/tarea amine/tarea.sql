

drop database if exists barcos2;
create database barcos2;
use barcos2;

CREATE TABLE Clases (
		IdClase varchar (30) not null,
		Tipo varchar (40) not null,
		Pais varchar (15) not null,
		Numerodecañones int not null,
		Calibre int not null,
		Peso int not null,
	CONSTRAINT PK_claseRestriccion PRIMARY KEY (IdClase));


CREATE TABLE Barcos 
		(IdBarco varchar (30) not null,
		Clase varchar (30) not null,
		Fechalanzamiento int not null,
	CONSTRAINT PK_barcoRestriccion PRIMARY KEY (IdBarco,Clase),
	CONSTRAINT FK_BarcoClaseRestriccion FOREIGN KEY (Clase) REFERENCES Clases (IdClase));


CREATE TABLE Batallas 
		(IdBatalla varchar (40) not null,
		Fecha date not null,
	CONSTRAINT PK_batallaRestriccion PRIMARY KEY (IdBatalla));


CREATE TABLE Resultados 
		(Barco varchar (30) not null,
		Batalla varchar (40) not null,
		Resultado varchar (15) not null,
	CONSTRAINT PK_resultadoRestriccion PRIMARY KEY (Barco,Batalla),
	CONSTRAINT FK_ResulBatallaRestriccion FOREIGN KEY (Batalla) REFERENCES Batallas(IdBatalla));
    
/* insercciones*/
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Bismarck','Guerra','Alemania',8,15,42000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Iowa','Guerra','USA',9,16,26000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Kongo','Crucero','Japón',8,14,32000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('North Carolina','Guerra','USA',9,16,37000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Renown','Crucero','Reino Unido',6,15,32000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Revenge','Guerra','Reino Unido',8,15,29000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Tennessee','Guerra','USA',12,14,32000);
INSERT INTO Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso) VALUES ('Yamato','Guerra','Japón',9,18,65000);

INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('California','Tennessee','1920');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Haruna','Kongo','1915');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Hiei','Kongo','1914');	
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Iowa','Iowa','1943');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Kirishima','Kongo','1915');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES	('Kongo','Kongo','1913');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Missouri','Iowa','1944');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Musashi','Yamato','1942');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('New Jersey','Iowa','1943');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('North Carolina','North Carolina','1941');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Ramillies','Revenge','1917');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Renown','Renown','1916');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Repulse','Renown','1916');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Resolution','Revenge','1916');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES	('Revenge','Revenge','1916');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES	('Royal Oak','Revenge','1916');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Royal Sovereign','Revenge','1916');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES	('Tennessee','Tennessee','1920');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Washington','North Carolina','1941');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Wisconsin','Iowa','1944');
INSERT INTO Barcos (IdBarco, Clase, Fechalanzamiento)VALUES ('Yamato','Yamato','1941'); 

INSERT INTO Batallas (IdBatalla, Fecha)VALUES ('Atlantico Norte','1941-05-24');
INSERT INTO Batallas (IdBatalla, Fecha)VALUES ('Cabo Norte','1943-12-26');
INSERT INTO Batallas (IdBatalla, Fecha)VALUES ('Estrecho de Surigao','1944-10-25');
INSERT INTO Batallas (IdBatalla, Fecha)VALUES ('Guadalcanal','1942-11-15');

INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES ('California','Atlantico Norte','daños');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('California','Guadalcanal','hundido');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Haruna','Estrecho de Surigao','hundido');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Haruna','Guadalcanal','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Hiei','Cabo Norte','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Kongo','Guadalcanal','hundido');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Missouri','Cabo Norte','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Missouri','Estrecho de Surigao','hundido');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Ramillies','Cabo Norte','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Repulse','Estrecho de Surigao','daños');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Revenge','Atlantico Norte','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Revenge','Cabo Norte','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Royal Sovereign','Estrecho de Surigao','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Royal Sovereign','Guadalcanal','daños');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Tennessee','Estrecho de Surigao','hundido');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Tennessee','Guadalcanal','éxito');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Washington','Cabo Norte','hundido');
INSERT INTO Resultados (Barco, Batalla, Resultado)VALUES('Yamato','Estrecho de Surigao','daños');



-- ----------------------------------------------------------------------    
-- 4
	-- Visualiza el peso medio para la tabla clases agrupados por el tipo de barco.
	select avg(Peso), Tipo
		from Clases
        group by Tipo;
        
	-- 	Selecciona el id de las clases y el peso de las mismas multiplicado por 0.25. 
	select IdClase, (Peso * 0.25) as  "peso * 0.25"
		from Clases;
	
    -- Selecciona el país de aquellos barcos que tienen un numero de cañones mayor o igual a 9.
	select b.IdBarco, c.Numerodecañones
		from Barcos b
        inner join Clases c
			on b.Clase = c.IdClase
		where c.Numerodecañones >= 9;
    
    -- Selecciona las 2 batallas más antiguas
    select 	IdBatalla, Fecha
		from Batallas
        order by Fecha
        limit 2;
    
    -- Visualiza los barcos que participaron en la batalla cuyo nombre es 
    -- una cadena de caracteres más los caracteres ‘al’ más otra cadena de caracteres
    select Barco
		from Resultados
        where Batalla like "%al%";
        
	-- Visualiza el país de aquellas clases de barcos que tengas un calibre 
    -- mayor o igual a 15 y un peso mayor o igual a 40000.
    select Pais
		from Clases
        where Calibre >= 15 and Peso >= 40000;
    
    -- Visualiza el número de batallas que fueron un éxito.
    select count(*) as "total"
		from Resultados
        where Resultado = "éxito";
    
    -- Visualiza la fecha de lanzamiento de aquellos barcos que fueron hundidos.
	select Fechalanzamiento
		from Barcos
        where IdBarco in 
			(select Barco 
				from Resultados
                where Resultado = "hundido");
	
    -- Visualiza el número de cañones y el nombre del barco de aquellos 
    -- barcos que lucharon en la batalla de Estrecho de Surigao y su resultado haya sido un éxito. 
    -- consulta
    select c.Numerodecañones, b.IdBarco
		from Barcos b
		join Clases c on c.IdClase = b.Clase
		where b.IdBarco in 
			(Select Barco
				from Resultados
                where Batalla = "Estrecho de Surigao"
					and Resultado = "éxito");
                    
    -- Visualiza las parejas de barcos con la misma fecha de lanzamiento.  
    -- El resultado debe aparecer ordenado en orden decreciente de fecha de lanzamiento.
    select Barcos.*, b.*
		from Barcos
        join Barcos b 
			on Barcos.Fechalanzamiento = b.Fechalanzamiento
		order by Barcos.Fechalanzamiento DESC;
        
	select b1.*, b2.*
		from Barcos b1
        join Barcos b2 on b1.Fechalanzamiento = b2.Fechalanzamiento
        group by b1.Fechalanzamiento
        ORDER BY b1.Fechalanzamiento desc;
    
    -- Visualizar los barcos japoneses con un peso mayor a 30000 que han resultado dañados en alguna batalla
    select b.*, c.*, r.*
		from Barcos b
        join Resultados r on b.IdBarco = r.Barco
        join Clases c on b.Clase = c.IdClase
        where c.Pais = "Japón" and c.Peso > 3000 and r.Resultado = "daños";
        
	-- Visualizar cuántos barcos que no sean de guerra tienen una fecha de lanzamiento entre 916 y 1940. 
    -- El resultado debe de aparecer una columna con el título ‘Barcos cruceros entre 1916 y 1940’. 
		select count(*) as "Barcos cruceros entre 1916 y 1940"
			from Clases
            where Tipo != "Guerra" 
				and IdClase in (select Clase
									from Barcos
									where Fechalanzamiento >= 916 and Fechalanzamiento <= 1940);
    
    -- Visualiza el peso medio correspondiente a cada calibre
    select Calibre, avg(Peso)
		from Clases
        group by Calibre;
        
	-- Calcular, para cada batalla, el número de barcos que fueron hundidos en ella.
    select  Batalla, count(*)
		from Resultados
        where Resultado = "hundido"
        group by Batalla;
        
	-- Visualizar el nombre de las batallas en las que participaron más de 5 barcos. 
    select Batalla, count(Barco) as "Numero de Barcos de la Batalla"
		from Resultados
        group by Batalla
        having count(Barco) > 5;
    
    -- Visualizar el nombre de batallas en las que se hundieron más de 2 barcos
    select Batalla, count(Barco) as "Numero de Barcos Hundidos"
		from Resultados
        where Resultado = "hundido"
        group by Batalla
        having count(Barco) > 2;
    
    -- Visualizar batallas en las que participaron barcos de tres países diferentes
    /* select Batalla, count(*) as "Numero de Paises"
		from Resultados
        where Barco in (select IdBarco
							from Barco
                            where Clase in (select IdClase
												from Clases
                                                where )); -- Me falta dedicarle mas horas
                                                */
                                                
	-- Visualiza los barcos y la batalla en los que los primeros tuvieron un 
    -- resultado de éxito con el formato. “El barco(nombre barco) ganó la batalla de(nombre batalla)”
		select concat("El Barco ", b.IdBarco, " ganó la batalla de ", r.Batalla)
			from Barcos b
            join Resultados r on b.IdBarco = r.Barco
            where r.Resultado = "éxito";
            
	-- Visualiza los años que pasaron desde que un barco fue lanzado hasta que fue hundido en una batalla
    select b.IdBarco, (year(bt.Fecha) - b.Fechalanzamiento) as "fecha"
		from Barcos b
        join Resultados r on r.Barco = b.IdBarco
        
        join Batallas bt on bt.IdBatalla = r.Batalla
        where r.Resultado = "hundido"
        order by b.IdBarco;
-- ----------------------------------------------------------------------
-- Clases (IdClase, Tipo, Pais, Numerodecañones, Calibre, Peso)
-- Barcos (IdBarco, Clase, Fechalanzamiento)
-- Batallas (IdBatalla, Fecha)
-- Resultados (Barco, Batalla, Resultado)
/* select * 
	from Clases;
select * 
	from Barcos;
select * 
	from Batallas;
select * 
	from Resultados; */
-- ----------------------------------------------------------------------

