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



