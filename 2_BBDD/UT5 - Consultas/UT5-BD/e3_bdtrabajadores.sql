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

select *
	from trabajadores;
    
/*
select  oficio, dept_no, count(emp_no) as "n trab"
	from trabajadores
    group by oficio, dept_no
    order by dept_no, oficio;

select dept_no, count(emp_no) as "cuantos"
	from trabajadores
    group by dept_no
    order by count(emp_no) desc
    limit 1;
*/
select dept_no, count(*)
	from trabajadores
    where oficio = "EMPLEADO"
    group by dept_no
    order by count(*) desc
    limit 1;
    

set sql_safe_updates = 0;

update trabajadores
set dir = dir + 5000; 

set sql_safe_updates = 1;
