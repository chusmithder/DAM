SET FOREIGN_KEY_CHECKS=0;
DROP DATABASE IF EXISTS bdTiendas;
CREATE DATABASE bdTiendas;
USE bdTiendas;

CREATE TABLE ARTICULOS(
	ID INT,
	NOMBRE		VARCHAR(20),
	ID_FABRICANTE 	INT(3),
	PESO           	INT(3),
	CATEGORIA      	VARCHAR(10),
	PRECIO_VENTA   	INT (4),
	PRECIO_COSTO   	INT (4),
	EXISTENCIAS    	INT (5),
PRIMARY KEY (ID)
)ENGINE=Innodb;

INSERT INTO ARTICULOS VALUES 
(1,'Macarrones',20, 1, 'Primera',100,98,120),
(2,'Tallarines',20, 2, 'Primera',120,100,100),
(3,'Tallarines',20, 1, 'Segunda',99,50,100),
(4,'Macarrones',20, 1, 'Tercera',80,50,100),
(5,'Atún',10, 3, 'Primera',200,150,220),
(6,'Atún',10, 3, 'Segunda',150,100,220),
(7,'Atún',10, 3, 'Tercera',100,50,220),
(8,'Sardinillas',10, 1,'Primera',250,200,200),
(9,'Sardinillas',10, 1,'Segunda',200,160,200),
(10,'Sardinillas',10, 1,'Tercera',100,150,220),
(11,'Mejillones',10, 1,'Tercera',90,50,200),
(12,'Mejillones',10, 1,'Primera',200,150,300),
(13,'Macarrones',25, 1, 'Primera',90,68,150),
(14,'Tallarines',25, 1, 'Primera',100,90,100),
(15,'Fideos',25, 1, 'Segunda',75,50,100),
(16,'Fideos',25, 1, 'Primera',100,80,100),
(17,'Galletas Cuadradas',15, 1, 'Primera',100,80,100),
(18,'Galletas Cuadradas',15, 1, 'Segunda',70,50,100),
(19,'Galletas Cuadradas',15, 1, 'Tercera',50,40,100),
(20,'Barquillos',15, 1, 'Primera',100,80,100),
(21,'Barquillos',15, 1, 'Segunda',100,80,100),
(22,'Canutillos',15, 2, 'Primera',170,150,110),
(23,'Canutillos',15, 2, 'Segunda',120,150,110),
(24,'Leche entera',30, 1,'Primera',110,100,300),
(25,'Leche desnat.',30, 1,'Primera',120,100,300),
(26,'Leche semi.',30, 1,'Primera',130,110,300),
(27,'Leche entera',30, 2,'Primera',210,200,300),
(28,'Leche desnat.',30, 2,'Primera',220,200,300),
(29,'Leche semi.',30, 2,'Primera',230,210,300),
(30,'Mantequilla',30, 1,'Primera',510,400,200),
(31,'Mantequilla',30, 1,'Segunda',450,340,200);


CREATE TABLE FABRICANTES(
	ID	INT(3),
	NOMBRE         	VARCHAR(15), 
	PAIS           	VARCHAR(15),
PRIMARY KEY(ID)
)ENGINE=Innodb;

INSERT INTO FABRICANTES VALUES
(10,'CALVO', 'ESPAÑA'),
(15,'LU', 'BELGICA'),
(20,'BARILLA', 'ITALIA'),
(25,'GALLO', 'ESPAÑA'),
(30,'PRESIDENT', 'FRANCIA');

CREATE TABLE TIENDAS(
	NIF       VARCHAR(10),
	NOMBRE    VARCHAR(20),
	DIRECCIÓN VARCHAR(20),
	POBLACIÓN VARCHAR(20),
	PROVINCIA VARCHAR(20),
	CODPOSTAL INT(5),
PRIMARY KEY (NIF)
)ENGINE=Innodb;

INSERT INTO TIENDAS VALUES
('1111-A','Almacenes Pérez', 'C/Toledo, 20','Siguenza','GUADALAJARA',19104),
('5555-B','La gacela', 'C/Santander Rios, 45','Azuqueca','GUADALAJARA', 19209),
('2222-A','Comestibles Rodolfo','C/ del Val s/n', 'Alcalá de Henares','MADRID',28804),
('4444-A','La Pasta Gansa', 'C/Alcalá, 2','Ajalvir','MADRID', 28765),
('3333-N','Ultramarinos Montse','Avda. Pio 10', 'Toledo','TOLEDO',45100),
('4141-B','Todo Toledo','C/Avila 24', 'Talavera','TOLEDO',45199);


CREATE TABLE PEDIDOS(
	NIF_TIENDA			VARCHAR(10),
	ID_ARTICULO        	INT,
	FECHA_PEDIDO      	DATE NOT NULL,
	UNIDADES_PEDIDAS  	INT(4),
PRIMARY KEY (NIF_TIENDA,ID_ARTICULO,FECHA_PEDIDO)
)ENGINE=Innodb;

INSERT INTO PEDIDOS VALUES 
('5555-B',1,STR_TO_DATE('18/02/1999','%d/%m/%Y'), 30),
('5555-B',2,STR_TO_DATE('21/02/1999','%d/%m/%Y'), 10),
('5555-B',2,STR_TO_DATE('11/03/1999','%d/%m/%Y'), 4),
('5555-B',3, STR_TO_DATE('11/03/1999','%d/%m/%Y'), 10),
('5555-B',3,STR_TO_DATE('14/04/1999','%d/%m/%Y'), 12),
('5555-B',4, STR_TO_DATE('18/05/1999','%d/%m/%Y'), 24),
('5555-B',4, STR_TO_DATE('19/05/1999','%d/%m/%Y'), 20),
('5555-B',4,STR_TO_DATE('20/06/1999','%d/%m/%Y'), 15),
('1111-A',4,STR_TO_DATE('20/02/1999','%d/%m/%Y'), 10),
('1111-A',4,STR_TO_DATE('10/04/1999','%d/%m/%Y'), 12),
('1111-A',10,STR_TO_DATE('24/06/1999','%d/%m/%Y'), 5),
('1111-A',10,STR_TO_DATE('04/07/1999','%d/%m/%Y'), 11),
('1111-A',10, STR_TO_DATE('10/07/1999','%d/%m/%Y'), 10),
('4141-B',10,STR_TO_DATE('16/04/1999','%d/%m/%Y'), 30),
('4141-B',10,STR_TO_DATE('21/06/1999','%d/%m/%Y'), 10),
('4141-B',11,STR_TO_DATE('12/08/1999','%d/%m/%Y'), 9),
('2222-A',12, STR_TO_DATE('12/08/1999','%d/%m/%Y'),20),
('2222-A',13, STR_TO_DATE('12/08/1999','%d/%m/%Y'),22),
('2222-A',20,STR_TO_DATE('11/08/1999','%d/%m/%Y'),1000),
('3333-A',20,STR_TO_DATE('10/11/1999','%d/%m/%Y'),8),
('3333-A',25, STR_TO_DATE('12/11/1999','%d/%m/%Y'),9),
('3333-A',25, STR_TO_DATE('15/11/1999','%d/%m/%Y'),11),
('3333-A',26, STR_TO_DATE('20/11/1999','%d/%m/%Y'),6),
('3333-A',27, STR_TO_DATE('20/11/1999','%d/%m/%Y'),40),
('3333-A',28, STR_TO_DATE('20/11/1999','%d/%m/%Y'),10);

ALTER TABLE ARTICULOS
ADD CONSTRAINT FK_ARTICULOS_FABRICANTES
	FOREIGN KEY (ID_FABRICANTE) REFERENCES FABRICANTES (ID);

ALTER TABLE PEDIDOS
	ADD CONSTRAINT FK_PEDIDOS_TIENDA 
	FOREIGN KEY (NIF_TIENDA) 
	REFERENCES TIENDAS(NIF);
ALTER TABLE PEDIDOS
	ADD CONSTRAINT FK_PEDIDOS_ARTICULO 
    FOREIGN KEY (ID_ARTICULO) 
    REFERENCES ARTICULOS(ID);

commit;
SET FOREIGN_KEY_CHECKS=1;