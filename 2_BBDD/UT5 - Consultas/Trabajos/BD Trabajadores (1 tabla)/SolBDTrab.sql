create database if not exists bdTrabajadores;
use bdTrabajadores;

/*BD Trabajadores*/
create database if not exists bdTrabajadores;
use bdTrabajadores;

drop table if exists trabajadores;
CREATE TABLE trabajadores (
 emp_no    int PRIMARY KEY,
 apellido  VARCHAR(10),
 oficio    VARCHAR(10),
 dir       int,
 fecha_alt DATE,
 salario   decimal(10,2),
 comision  decimal(10,2),
 dept_no   int NOT NULL
);

INSERT INTO trabajadores VALUES (7369,'SÁNCHEZ','EMPLEADO',7902,'1990/12/17',
                        1040,NULL,20);				
INSERT INTO trabajadores VALUES (7499,'ARROYO','VENDEDOR',7698,'1990/02/20',
                        1500,390,30);
INSERT INTO trabajadores VALUES (7521,'SALA','VENDEDOR',7698,'1991/02/22',
                        1625,650,30);
INSERT INTO trabajadores VALUES (7566,'JIMÉNEZ','DIRECTOR',7839,'1991/04/02',
                        2900,NULL,20);
INSERT INTO trabajadores VALUES (7654,'MARTÍN','VENDEDOR',7698,'1991/09/29',
                        1600,1020,30);
INSERT INTO trabajadores VALUES (7698,'NEGRO','DIRECTOR',7839,'1991/05/01',
                        3005,NULL,30);
INSERT INTO trabajadores VALUES (7782,'CEREZO','DIRECTOR',7839,'1991/06/09',
                        2885,NULL,10);
INSERT INTO trabajadores VALUES (7788,'GIL','ANALISTA',7566,'1991/11/09',
                        3000,NULL,20);
INSERT INTO trabajadores VALUES (7839,'REY','PRESIDENTE',NULL,'1991/11/17',
                        4100,NULL,10);
INSERT INTO trabajadores VALUES (7844,'TOVAR','VENDEDOR',7698,'1991/09/08',
                        1350,0,30);
INSERT INTO trabajadores VALUES (7876,'ALONSO','EMPLEADO',7788,'1991/09/23',
                        1430,NULL,20);
INSERT INTO trabajadores VALUES (7900,'JIMENO','EMPLEADO',7698,'1991/12/03',
                        1335,NULL,30);
INSERT INTO trabajadores VALUES (7902,'FERNÁNDEZ','ANALISTA',7566,'1991/12/03',
                        3000,NULL,20);
INSERT INTO trabajadores VALUES (7934,'MUÑOZ','EMPLEADO',7782,'1992/01/23',
                        1690,NULL,10);
                     
                     
select oficio, min(salario) as "minimo", avg(salario) as "medio"
	from trabajadores
    group by oficio;
    
select dpto_no, oficio,  count(*)
	from trabajadores
    group by dept_no, ofico
    order by dept_no, ofico;
    
select dept_no,  count(*) as "cuantos"
	from trabajadores
    group by dept_no
    order by count(*) desc
    limit 1;
    
select oficio,  count(*) as "cuantos"
	from trabajadores
    group by oficio
    order by count(*) desc
    limit 1;
    
select year(fecha_alt), count(*)  as "num trabajadores"
	from trabajadores
    group by year(fecha_alt) desc
    order by fecha_alt desc;
    
select dept_no, count(*) as "num trabajadores"
	from trabajadores
    where oficio = "EMPLEADO"
    group by  dept_no 
    ORDER BY count(*) desc
    limit 1;
    












