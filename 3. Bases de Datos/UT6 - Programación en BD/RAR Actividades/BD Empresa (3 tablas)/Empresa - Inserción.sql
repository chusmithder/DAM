use bdEmpresa;

set foreign_key_checks = 0;
-- Inserción de valores en la tabla CENTROS:
insert into CENTROS values (10,  'SEDE CENTRAL', 'C. ALCALA 820, MADRID');
insert into CENTROS values (20,  'RELACION CON CLIENTES', 'C. ATOCHA 405, MADRID');

-- Inserción de valores en la tabla DEPARTAMENTOS:
insert into DEPARTAMENTOS values (100, 10, 260, 'P', 12000, null, 'DIRECCION GENERAL');
insert into DEPARTAMENTOS values (110, 20, 180, 'P', 15000, 100, 'DIRECC. COMERCIAL');
insert into DEPARTAMENTOS values (111, 20, 180, 'F', 11000, 110, 'SECTOR INDUSTRIAL');
insert into DEPARTAMENTOS values (112, 20, 270, 'P', 9000, 100, 'SECTOR SERVICIOS');
insert into DEPARTAMENTOS values (120, 10, 150, 'F', 30000, 100, 'ORGANIZACION');
insert into DEPARTAMENTOS values (121, 10, 150, 'P', 20000, 120, 'PERSONAL');
insert into DEPARTAMENTOS values (122, 10, 350, 'P', 60000, 120, 'PROCESO DE DATOS');
insert into DEPARTAMENTOS values (130, 10, 310, 'P', 20000, 100, 'FINANZAS');

-- Inserción de valores en la tabla EMPLEADOS:
insert into EMPLEADOS values (110, 121, 350, '1939-10-10', '1950-2-10', 1310, 0, 3, 'PONS', 'CESAR', 'PRESIDENTE', null);
insert into EMPLEADOS values (120, 112, 840, '1935-6-9', '1968-10-1', 1350, 110, 1, 'LASA', 'MARIO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (130, 112, 810, '1945-11-9', '1969-2-1', 1290, 110, 2, 'TEROL', 'LUCIANO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (150, 121, 340, '1930-8-10', '1948-1-15', 1440, 0, 0, 'PEREZ', 'JULIO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (160, 111, 740, '1939-7-9', '1968-11-11', 1310, 110, 2, 'AGUIRRE', 'AUREO', 'JEFESECTOR', 110);
insert into EMPLEADOS values (180, 110, 508, '1934-10-18', '1956-3-18', 1480, 50,  2, 'PEREZ', 'MARCOS', 'JEFESECTOR', 110);
insert into EMPLEADOS values (190, 121, 350, '1932-5-12', '1962-2-11', 1300, 0, 4, 'VEIGA', 'JULIANA', 'VENDEDOR', 130);
insert into EMPLEADOS values (210, 100, 200, '1940-9-28', '1959-1-22', 1380, 0, 2, 'GALVEZ', 'PILAR', 'VENDEDOR', 130);
insert into EMPLEADOS values (240, 111, 760, '1942-2-26', '1966-2-24', 1280, 100, 3, 'SANZ', 'LAVINIA', 'VENDEDOR', 120);
insert into EMPLEADOS values (250, 100, 250, '1946-10-27', '1967-3-1', 1450, 0, 0, 'ALBA', 'ADRIANA', 'VENDEDOR', 120);
insert into EMPLEADOS values (260, 100, 220, '1943-12-3', '1968-7-12', 1720, 0, 6, 'LOPEZ', 'ANTONIO', 'VENDEDOR', 150);
insert into EMPLEADOS values (270, 112, 800, '1945-5-21', '1966-9-10', 1380, 80, 3, 'GARCIA', 'OCTAVIO', 'VENDEDOR', 150);
insert into EMPLEADOS values (280, 130, 410, '1948-1-11', '1971-10-8', 1290, 0, 5, 'FLOR', 'DOROTEA', 'VENDEDOR', 150);
insert into EMPLEADOS values (285, 122, 620, '1949-10-25', '1968-2-15', 1380, 0, 0, 'POLO', 'OTILIA', 'VENDEDOR', 160);
insert into EMPLEADOS values (290, 120, 910, '1947-10-30', '1968-2-14', 1270, 0, 3, 'GIL', 'GLORIA', 'VENDEDOR', 180);
insert into EMPLEADOS values (310, 130, 480, '1946-10-21', '1971-1-15', 1420, 0, 0, 'GARCIA', 'AUGUSTO', 'VENDEDOR', 180);
insert into EMPLEADOS values (320, 122, 620, '1957-12-25', '1978-2-5', 1405, 0, 2, 'SANZ', 'CORNELIO', 'ANALISTA', 180);
insert into EMPLEADOS values (330, 112, 850, '1948-8-19', '1972-3-1', 1280, 90, 0, 'DIEZ', 'AMELIA', 'ANALISTA', 180);
insert into EMPLEADOS values (350, 122, 610, '1949-4-13', '1984-9-10', 1450, 0, 1, 'CAMPS', 'AURELIO', 'ANALISTA', 180);
insert into EMPLEADOS values (360, 111, 750, '1958-10-29', '1968-10-10', 1250, 100, 2, 'LARA', 'DORINDA', 'ANALISTA', 160);
insert into EMPLEADOS values (370, 121, 360, '1967-6-22', '1987-1-20', 1190, 0, 1, 'RUIZ', 'FABIOLA', 'EMPLEADO', 320);
insert into EMPLEADOS values (380, 112, 880, '1968-3-30', '1988-1-1', 1180, 0, 0, 'MARTIN', 'MICAELA', 'EMPLEADO', 320);
insert into EMPLEADOS values (390, 110, 500, '1966-2-19', '1986-10-8', 1215, 0, 1, 'MORAN', 'CARMEN', 'EMPLEADO', 320);
insert into EMPLEADOS values (400, 111, 780, '1969-8-18', '1987-11-1', 1185, 0, 0, 'LARA', 'LUCRECIA', 'EMPLEADO', 320);
insert into EMPLEADOS values (410, 122, 660, '1968-7-14', '1988-10-13', 1175, 0, 0, 'MUÑOZ', 'AZUCENA', 'EMPLEADO', 320);
insert into EMPLEADOS values (420, 130, 450, '1966-10-22', '1988-10-19', 1400, 0, 0, 'FIERRO', 'CLAUDIA', 'EMPLEADO', 330);
insert into EMPLEADOS values (430, 122, 650, '1967-10-26', '1988-11-19', 1210, 0, 1, 'MORA', 'VALERIANA', 'EMPLEADO', 330);
insert into EMPLEADOS values (440, 111, 760, '1966-9-27', '1986-2-28', 1210, 100, 0, 'DURAN', 'LIVIA', 'EMPLEADO', 350);
insert into EMPLEADOS values (450, 112, 880, '1966-10-21', '1986-2-28', 1210, 100, 0, 'PEREZ', 'SABINA', 'EMPLEADO', 350);
insert into EMPLEADOS values (480, 111, 760, '1965-4-4', '1986-2-28', 1210, 100, 1, 'PINO', 'DIANA', 'EMPLEADO', 350);
insert into EMPLEADOS values (490, 112, 880, '1964-6-6', '1988-1-1', 1180, 100, 0, 'TORRES', 'HORACIO', 'EMPLEADO', 360);
insert into EMPLEADOS values (500, 111, 750, '1965-10-8', '1987-1-1', 1200, 100, 0, 'VAZQUEZ', 'HONORIA', 'EMPLEADO', 360);
insert into EMPLEADOS values (510, 110, 550, '1966-5-4', '1986-11-1', 1200, 0, 1, 'CAMPOS', 'ROMULO', 'EMPLEADO', 360);
insert into EMPLEADOS values (550, 111, 780, '1970-1-10', '1988-1-21', 1100, 120, 0, 'SANTOS', 'SANCHO', 'EMPLEADO', 360);

set foreign_key_checks = 1;