
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


