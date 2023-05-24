drop database if exists empleados;
create database empleados;
use empleados;
Create table EMPLEADOS (
	cod_empleado integer primary key,
    dni varchar(9) unique not null,
    nombre varchar(100),
    apellidos varchar(100),
    cargo ENUM('PRESIDENTE', 'JEFESECTOR', 'VENDEDOR', 'ANALISTA', 'EMPLEADO') not null,
	ext_telefono integer,
	fecha_nacimiento date,
	fecha_ingreso date,
	salario double,
	hijos integer
);

INSERT INTO `empleados` VALUES (110,'16032051Q','CESAR','PONS','PRESIDENTE',315,'1939-10-10','1950-02-10',1310,3),(120,'16754994E','MARIO','LASA','JEFESECTOR',840,'1935-06-09','1968-10-01',1350,1),(130,'16635291Y','LUCIANO','TEROL','JEFESECTOR',810,'1945-11-09','1969-02-01',1290,2),(150,'16626844J','JULIO','PEREZ','JEFESECTOR',NULL,'1930-08-10','1948-01-15',1440,0),(160,'16016652O','AUREO','AGUIRRE','JEFESECTOR',740,'1989-07-09','1968-11-11',1310,2),(180,'16654893Y','MARCOS','PEREZ','JEFESECTOR',508,'1978-10-18','1956-03-18',1480,NULL),(190,'16009406T','JULIANA','VEIGA','VENDEDOR',350,'1932-05-12','1962-02-11',1300,4),(210,'16417959D','PILAR','GALVEZ','VENDEDOR',200,'1940-09-28','1959-01-22',1380,2),(240,'16021320F','LAVINIA','SANZ','VENDEDOR',760,'1980-02-26','1966-02-24',1280,3),(250,'16127423O','ADRIANA','ALBA','VENDEDOR',250,'1946-10-27','1967-03-01',1450,6),(260,'16064191G','ANTONIO','LOPEZ','VENDEDOR',220,'1943-12-03','1968-07-12',1720,6),(270,'16886647J','OCTAVIO','GARCIA','VENDEDOR',NULL,'1945-05-21','1966-09-10',1380,3),(280,'16486249H','DOROTEA','FLOR','VENDEDOR',410,'1948-01-11','1971-10-08',1290,5),(285,'16358621Q','OTILIA','POLO','VENDEDOR',620,'1949-10-25','1968-02-15',1380,0),(290,'16060153H','GLORIA','GIL','VENDEDOR',910,'1947-10-30','1968-02-14',1270,3),(310,'16729466Q','AUGUSTO','GARCIA','VENDEDOR',480,'1946-10-21','1971-01-15',1420,0),(320,'16796481J','CORNELIO','SANZ','ANALISTA',620,'1957-12-25','1978-02-05',1405,2),(330,'16685608R','AMELIA','DIEZ','ANALISTA',850,'1948-08-19','1972-03-01',1280,0),(350,'16069429C','AURELIO','CAMPS','ANALISTA',610,'1949-04-13','1984-09-10',1450,1),(360,'16435067B','DORINDA','LARA','ANALISTA',750,'1958-10-29','1968-10-10',1250,2),(370,'16945616B','FABIOLA','RUIZ','EMPLEADO',360,'1967-06-22','1987-01-20',1190,1),(380,'16942616G','MICAELA','MARTIN','EMPLEADO',880,'1968-03-30','1988-01-01',1180,0),(390,'16945616A','CARMEN','MORAN','EMPLEADO',500,'1966-02-19','1986-10-08',1215,1),(400,'16945616C','LUCRECIA','LARA','EMPLEADO',780,'1969-08-18','1987-11-01',1185,0);

