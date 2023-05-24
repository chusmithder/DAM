
/*BD Personas*/
create database if not exists bdPersonas;
use bdPersonas;

drop table if exists personas;
create table PERSONAS(
	NIF varchar(9) PRIMARY KEY,
	NSS VARCHAR (9) UNIQUE NOT NULL,
	NOMBRE varchar(25),
	APELLIDO VARCHAR(50),
	AñO_NACIMIENTO INT,
	FECHA_ALTA date,
	SALARIO INT,
	PUESTO ENUM('JEFE','OPERARIO','JUBILADO', 'LIMPIEZA'),
	FECHA_BAJA DATE DEFAULT NULL,
	SEDE_TRABAJA VARCHAR(2)
);

/*BD Personas*/
-- delete from personas where 1;

INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('74724714Z','25856985S','ALONSO','FERNANDEZ ROBLES', 1970, '2000-02-25',3520, 'JEFE', 'AB');
INSERT INTO PERSONAS VALUES('74725894Z','25858985S','LUIS','MARTINEZ ROBLES', 1981, '2000-10-20',1120, 'OPERARIO', '2020-11-06', 'AB');
INSERT INTO PERSONAS VALUES('74725898P','88888885S','LAURA','MARTIN ACEBEDO', 1982, '1999-10-05',1000, 'LIMPIEZA', '2009-12-06', 'AB');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('52563932O','32569885S','LARA','MARTOS GARCIA', 1998, '2010-05-02',1120, 'OPERARIO', 'AB');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('74895951A','89568956E','ANA','RUIZ GARCIA', 1980, '2010-02-05',1000, 'LIMPIEZA', 'AB');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
VALUES('89898989D','96969696R','AMAYA','MARIN AVILA', 1971, '1998-05-02',1420, 'OPERARIO', 'AB');
INSERT INTO PERSONAS VALUES('12121212O','56565656Y','CESAR','SAMAPYO PEREZ', 1978, '2009-05-02',900, 'JUBILADO', '2020-10-06', 'AB');
INSERT INTO PERSONAS VALUES('58585858Z','28484844S','PILAR','AGUERO TOLOSA', 1960, '2000-05-02',850, 'JUBILADO', '2020-11-02', 'AB');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('74663363D','20000010S','VANESA','MARTIN SANZA', 1985, '2000-05-12',1150, 'OPERARIO','AB');

INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('7472471PZ','25856944S','ALONSO','FERNANDEZ ROBLES', 1970, '2000-02-25',3520, 'JEFE', 'AC');
INSERT INTO PERSONAS VALUES('74725894L','25858985P','LEO','MARTIN PEREZ', 1981, '2000-10-20',1120, 'OPERARIO', '2020-11-06', 'AC');
INSERT INTO PERSONAS VALUES('74725898T','8888888K','LALI','MARTINEZ ACENA', 1982, '1999-10-05',1000, 'LIMPIEZA', '2009-12-06', 'AC');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('52563932N','32569885M','JOSE','MARIN GIO', 1998, '2010-05-02',1120, 'OPERARIO', 'AC');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('74895951T','89568956Y','LIO','RUTA GOLA', 1980, '2010-02-05',1000, 'LIMPIEZA', 'AC');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
VALUES('89898989J','96969696A','AMADA','GARAYOA SOLDADO', 1971, '1998-05-02',1420, 'OPERARIO', 'AC');
INSERT INTO PERSONAS VALUES('12121212Q','56565656T','CAMILO','SAMUEL PAZO', 1978, '2009-05-02',900, 'JUBILADO', '2020-10-06', 'AC');
INSERT INTO PERSONAS VALUES('5858585J','28484844G','PEDRO','AGUILAS REDONDEO', 1960, '2000-05-02',850, 'JUBILADO', '2020-11-02', 'AC');
INSERT INTO PERSONAS (NIF,NSS,NOMBRE, APELLIDO, AñO_NACIMIENTO,FECHA_ALTA, SALARIO, PUESTO, SEDE_TRABAJA) 
	VALUES('74663363Z','20000010D','VALERIA','ALBORAN LOPEZ', 1985, '2000-05-12',1150, 'OPERARIO','AC');

-- 1.5.3.16
select NOMBRE, timestampdiff(year,FECHA_BAJA, "2020-06-01")
	from PERSONAS; 

-- 1.5.3.17
select date_format(FECHA_BAJA,"%d-%m-%Y") -- y minus (XX) / Y mayus (XXXX)
	from PERSONAS; 

-- 1.6.1.1
select NOMBRE, APELLIDO
	from PERSONAS
    where SALARIO = 900
    order by AñO_NACIMIENTO;
    
select NIE, NOMBRE
	from PERSONAS
    where AñO_NACIMIENTO >= 1978 AND SALARIO > 950
    ORDER BY APELLIDO desc;
    
-- 1.7.1.1
select * 
	from PERSONAS
	order by SALARIO asc
    limit 3; -- No se puede 

-- 1.7.1.2
select * 
	from PERSONAS
	where apellido like "A%"
    order by fecha_alta
    limit 2;
/*
-- 1.8.1.1
select * 
	from PERSONAS
	where sede_trabaja ="AC"
    order by fecha_alta
    limit 2;
*/
select AVG(SALARIO) AS "mEDIA Salario" 
	from PERSONAS
	where sede_trabaja ="AC" and puesto = "operario";
    
select count(puesto) AS "mEDIA Salario" 
	from PERSONAS
	where puesto = "jubilado";
    
select AñO_NACIMIENTO AS "jubilado mas mayor" 
	from PERSONAS
	where puesto = "jubilado" and sede_trabaja = "AC"
    order by AñO_NACIMIENTO
    limit 1;
    
select min(AñO_NACIMIENTO) AS "jubilado mas mayor" 
	from PERSONAS
	where puesto = "jubilado" and sede_trabaja = "AC";
    
-- 1.9 GROUP BY
-- 1
select sede_trabaja, count(*) as "Num empleados"
	from personas
	group by sede_trabaja;
-- 2
select sede_trabaja, count(distinct puesto) as "puestos diferentes"
	from personas
	group by sede_trabaja;
    
select puesto, sum(salario) as "salario de cada puesto"
	from personas
	group by puesto;
    
select puesto, sede_trabaja, sum(salario) as "salario de cada puesto"
	from personas
	group by puesto, sede_trabaja;
    
select puesto, sede_trabaja, count(*) as "salario de cada puesto"
	from personas
	group by puesto, sede_trabaja;
    
select año_nacimiento, count(*) as "salario de cada puesto"
	from personas
	group by año_nacimiento;
/*
select avg(AñO_NACIMIENTO)
	from personas
    group by SEDE_TRABAJA
    order by avg(AñO_NACIMIENTO)
    limit 1;
*/
-- 
select year(fecha_alta), count(*) as "Personas en el año"
	from personas
    group by year(fecha_alta)
    order by year(fecha_alta);

-- 
select year(año_nacimiento), count(*) as "Personas en el año"
	from personas
    where año_nacimiento > 1960
    group by year(fecha_alta)
    order by year(fecha_alta);
    
-- HAVING
select SALARIO, sum(salario) as "Suma salarios por cada puesto"
	from personas
    group by puesto
    having sum(salario) > 5000;
    
select puesto, sum(salario) as "Suma salarios por cada puesto"
	from personas
    where PUESTO = "JUBILADO"
	group by PUESTO;
    
select PUESTO, sum(SALARIO) as "Suma salarios por cada puesto"
	from personas
    group by puesto
    having sum(SALARIO) > 5000;   
    
-- 
select PUESTO, avg(SALARIO) as "Suma salarios por cada puesto"
	from personas
    group by PUESTO
    having AVG(SALARIO) > 800 AND AVG(SALARIO) < 1200;

select YEAR(fecha_alta), count(*)
	from personas
    where AñO_NACIMIENTO >1980
    group by year(fecha_alta)
    having count(*) > 2;
