DROP DATABASE IF EXISTS bdPedidos;
CREATE DATABASE  bdPedidos;
USE bdPedidos;

set foreign_key_checks=0;

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS oficinas;

CREATE TABLE oficinas (
  num_oficina integer,
  ciudad varchar(50),
  division varchar(50),
  director integer,
  objetivo integer,
  ventas integer,
  PRIMARY KEY (num_oficina),
  constraint oficinas_fk1 foreign key (director) references empleados(num_empleado)
);

CREATE TABLE empleados (
  num_empleado integer,
  nombre varchar(50),
  edad integer,
  oficina integer,
  cargo varchar(50),
  fecha_contrato date,
  jefe integer,
  objetivo integer,
  ventas integer,
  PRIMARY KEY (num_empleado),
  constraint empleados_fk1 foreign key (oficina) references oficinas(num_oficina),
  constraint empleados_fk2 foreign key (jefe) references empleados(num_empleado)
);


CREATE TABLE clientes (
  num_cliente integer,
  nombre varchar(50),
  representante integer,
  limite_credito integer,
  PRIMARY KEY (num_cliente),
  constraint clientes_fk1 foreign key (representante) references empleados(num_empleado)
);

CREATE TABLE productos (
  id_fabrica varchar(3),
  id_producto varchar(50),
  descripcion varchar(50),
  precio integer,
  existencias integer,
  PRIMARY KEY (id_fabrica,id_producto)
);

CREATE TABLE pedidos (
  num_pedido integer,
  fecha_pedido date,
  cliente integer,
  vendedor integer,
  fabrica varchar(3),
  producto varchar(50),
  cantidad integer,
  importe integer,
  PRIMARY KEY (num_pedido),
  constraint pedidos_fk1 foreign key(cliente) 
	references clientes(num_cliente),
  constraint pedidos_fk2 foreign key(fabrica, producto) 
	references productos(id_fabrica, id_producto),
  constraint pedidos_fk3 foreign key(vendedor) 
	references empleados(num_empleado)
);

--
-- Dumping data for table `clientes`
--

INSERT INTO clientes VALUES (2101,'Luis Garcia Anton',106,65000),(2102,'Alvaro Rodriguez',101,65000),(2103,'Jaime Llorens',105,50000),(2105,'Antonio Canales',101,45000),(2106,'Juan Suarez',102,65000),(2107,'Julian Lopez',110,35000),(2108,'Julia Antequera',109,55000),(2109,'Alberto Juanes',103,25000),(2111,'Cristobal Garcia',103,50000),(2112,'Maria Silva',108,50000),(2113,'Luis Maron',104,20000),(2114,'Cristini Bulini',102,20000),(2115,'Vicente Martinez',101,20000),(2117,'Carlos Tena',106,35000),(2118,'Junipero Alvarez',108,60000),(2119,'Salomon Bueno',109,25000),(2120,'Juan Malo',102,50000),(2121,'Vicente Rios',103,45000),(2122,'Jose Marchante',105,30000),(2123,'Jose Libros',102,40000),(2124,'Juan Bolto',107,40000);
--
-- Dumping data for table `empleados`
--

INSERT INTO empleados VALUES (101,'Antonio Viger',45,12,'Representante','1986-10-20',104,300000,305000),(102,'Alvaro Jaumes',48,21,'Representante','1986-12-10',108,350000,474000),(103,'Juan Rovira',29,12,'Representante','1987-03-01',104,275000,286000),(104,'Jose Gonzalez',33,12,'Dir Ventas','1987-05-19',106,200000,143000),(105,'Vicente Pantalla',37,13,'Representante','1988-02-12',104,350000,368000),(106,'Luis Antonio',52,11,'Dir General','1988-06-14',NULL,275000,299000),(107,'Jorge Gutierrez',49,22,'Representante','1988-11-14',108,300000,186000),(108,'Juana Bustamante',62,21,'Dir Ventas','1989-10-12',106,350000,361000),(109,'Maria Suta',31,11,'Representante','1999-10-12',106,300000,392000),(110,'Juan Victor',41,24,'Representante','1990-01-13',104,0,76000);

--
-- Dumping data for table `oficinas`
--

INSERT INTO oficinas VALUES (11,'Valencia','Este',106,575000,693000),(12,'Alicante','Este',104,800000,735000),(13,'Castellon','Este',105,350000,368000),(21,'Badajoz','Oeste',108,725000,836000),(22,'A Coruña','Oeste',108,300000,186000),(24,'Madrid','Centro',110,250000,150000),(26,'Pamplona','Norte',NULL,NULL,NULL),(28,'Valencia','Este',NULL,900000,NULL);

--
-- Dumping data for table `pedidos`
--

INSERT INTO pedidos VALUES (110035,'1997-01-02',2107,110,'aci','4100z',9,22500),(110036,'1997-01-02',2117,106,'rei','2a44l',7,31500),(112963,'1997-05-10',2103,105,'aci','41004',28,3276),(112968,'1990-01-11',2102,101,'aci','41004',34,3978),(112975,'1997-02-11',2111,103,'rei','2a44g',6,2100),(112979,'1989-10-12',2114,108,'aci','4100z',6,15000),(112983,'1997-05-10',2103,105,'aci','41004',6,702),(112987,'1997-01-01',2103,105,'aci','4100y',11,27500),(112989,'1997-12-10',2101,106,'fea','114',6,1458),(112992,'1990-04-15',2118,108,'aci','41002',10,760),(112993,'1997-03-10',2106,102,'rei','2a45c',24,1896),(112997,'1997-07-04',2124,107,'bic','41003',1,652),(113003,'1997-02-05',2108,109,'imm','779c',3,5625),(113007,'1997-01-01',2112,108,'imm','773c',3,2925),(113012,'1997-05-05',2111,105,'aci','41003',35,3745),(113013,'1997-08-06',2118,108,'bic','41003',1,652),(113024,'1997-07-04',2114,108,'qsa','xk47',20,7100),(113027,'1997-02-05',2103,105,'aci','41002',54,4104),(113034,'1997-11-05',2107,110,'rei','2a45c',8,632),(113042,'1997-01-01',2113,101,'rei','2a44r',5,22500),(113045,'1997-07-02',2112,108,'rei','2a44r',10,45000),(113048,'1997-02-02',2120,102,'imm','779c',2,3750),(113049,'1997-04-04',2118,108,'qsa','xk47',2,776),(113051,'1997-07-06',2118,108,'qsa','xk47',4,1420),(113055,'2009-04-01',2108,101,'aci','4100x',6,150),(113057,'1997-11-01',2111,103,'aci','4100x',24,600),(113058,'1989-07-04',2108,109,'fea','112',10,1480),(113062,'1997-07-04',2124,107,'bic','41003',10,2430),(113065,'1997-06-03',2106,102,'qsa','xk47',6,2130),(113069,'1997-08-01',2109,107,'imm','773c',22,31350);

--
-- Dumping data for table `productos`
--

INSERT INTO productos VALUES ('aci','41001','Arandela',58,277),('aci','41002','Bisagra',80,167),('aci','41003','Art t3',112,207),('aci','41004','Art t4',123,139),('aci','4100x','Junta',26,37),('aci','4100y','Extractor',2888,25),('aci','4100z','Bisagra',2625,28),('bic','41003','Manivela',652,3),('bic','41009','Rodamiento',225,78),('bic','41672','Plato',180,NULL),('fea','112','Cubo',148,115),('fea','114','Cubo',243,15),('imm','773c','Reostato',975,28),('imm','775c','Reostato2',1425,5),('imm','779c','Reostato3',1875,NULL),('imm','887h','Caja Cablos',54,223),('imm','887p','Perno',25,24),('imm','887x','Manivela',475,32),('qsa','xk47','Red',355,38),('qsa','xk48','Red',134,203),('qsa','xk48a','Red',117,37),('rei','2a44g','Pas',350,14),('rei','2a44l','Bomba l',4500,12),('rei','2a44r','Bomba r',4500,12),('rei','2a45c','Junta',79,210);


set foreign_key_checks=1;

