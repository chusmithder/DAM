DROP DATABASE IF EXISTS bdUniversidad;
CREATE DATABASE bdUniversidad CHARACTER SET utf8mb4;
USE bdUniversidad;
 
CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
	ciudad VARCHAR(25) NOT NULL,
    login VARCHAR(50),
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    tipo ENUM('profesor', 'alumno') NOT NULL
);
 
CREATE TABLE profesor (
    id_profesor INT UNSIGNED PRIMARY KEY,
    id_departamento INT UNSIGNED,
    FOREIGN KEY (id_profesor) REFERENCES persona(id) on delete cascade on update cascade,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)  on delete set null on update cascade
);
 
 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor)  on delete set null on update cascade,
    FOREIGN KEY(id_grado) REFERENCES grado(id)  on delete cascade on update cascade
);
 
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR NOT NULL,
    anyo_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    nota decimal (4,2),
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id)  on delete cascade on update cascade,
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id)  on delete cascade on update cascade,
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)  on delete cascade on update cascade
);
 
 /* Departamento */
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');
 
 /* Persona */
 INSERT INTO persona VALUES (1, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Pamplona',NULL, 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor');
 INSERT INTO persona VALUES (2, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Pamplona', NULL, 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor');
 INSERT INTO persona VALUES (3, '38223286T', 'David', 'Schmidt', 'Fisher', 'Pamplona', NULL, 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor');
 INSERT INTO persona VALUES (4, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Pamplona', NULL, 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor');
 INSERT INTO persona VALUES (5, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Pamplona', NULL, 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor');
 INSERT INTO persona VALUES (6, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Pamplona', NULL, 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO persona VALUES (7, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Pamplona', NULL, 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor');
INSERT INTO persona VALUES (8, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Pamplona', NULL, 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor');
INSERT INTO persona VALUES (9, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Pamplona', NULL, 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
INSERT INTO persona VALUES (10, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Pamplona', NULL, 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona VALUES (11, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Pamplona', NULL, 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'profesor');
INSERT INTO persona VALUES (12, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Pamplona',NULL, 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor');
INSERT INTO persona VALUES (13, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Pamplona', NULL, 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno');
INSERT INTO persona VALUES (14, '89542419S', 'Juan', 'Saez', 'Vega', 'Pamplona', NULL, 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno');
INSERT INTO persona VALUES (15, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Pamplona', NULL, 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno');
INSERT INTO persona VALUES (16, '04233869Y', 'José', 'Koss', 'Bayer', 'Pamplona', NULL, 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno');
INSERT INTO persona VALUES (17, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Pamplona', NULL, 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno');
INSERT INTO persona VALUES (18, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Pamplona', NULL, 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO persona VALUES (19, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Pamplona', NULL, 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO persona VALUES (20, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Pamplona',NULL, 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO persona VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Pamplona',NULL, 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Pamplona',NULL, 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO persona VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Pamplona',NULL, 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Pamplona',NULL, 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
/* Profesor */
INSERT INTO profesor VALUES (1, 1);
INSERT INTO profesor VALUES (2, 2);
INSERT INTO profesor VALUES (3, 3);
INSERT INTO profesor VALUES (4, 4);
INSERT INTO profesor VALUES (5, 4);
INSERT INTO profesor VALUES (6, 6);
INSERT INTO profesor VALUES (7, 1);
INSERT INTO profesor VALUES (8, 2);
INSERT INTO profesor VALUES (9, 3);
INSERT INTO profesor VALUES (10, 4);
INSERT INTO profesor VALUES (11, 5);
INSERT INTO profesor VALUES (12, 6);
 
 /* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');
 
/* Asignatura */
INSERT INTO `asignatura` VALUES (1,'Álgegra lineal y matemática discreta',6,'básica',1,1,7,4);
INSERT INTO `asignatura` VALUES (2,'Cálculo',6,'básica',1,1,5,9);
INSERT INTO `asignatura` VALUES (3,'Física para informática',6,'básica',1,1,8,4);
INSERT INTO `asignatura` VALUES (4,'Introducción a la programación',6,'básica',1,1,9,4);
INSERT INTO `asignatura` VALUES (5,'Organización y gestión de empresas',6,'básica',1,1,6,4);
INSERT INTO `asignatura` VALUES (6,'Estadística',6,'básica',1,2,5,4);
INSERT INTO `asignatura` VALUES (7,'Estructura y tecnología de computadores',6,'básica',1,2,5,4);
INSERT INTO `asignatura` VALUES (8,'Fundamentos de electrónica',6,'básica',1,2,2,3);
INSERT INTO `asignatura` VALUES (9,'Lógica y algorítmica',6,'básica',1,2,9,4);
INSERT INTO `asignatura` VALUES (10,'Metodología de la programación',6,'básica',1,2,6,4);
INSERT INTO `asignatura` VALUES (11,'Arquitectura de Computadores',6,'básica',2,1,3,4);
INSERT INTO `asignatura` VALUES (12,'Estructura de Datos y Algoritmos I',6,'obligatoria',2,1,6,4);
INSERT INTO `asignatura` VALUES (13,'Ingeniería del Software',6,'obligatoria',2,1,11,4);
INSERT INTO `asignatura` VALUES (14,'Sistemas Inteligentes',6,'obligatoria',2,1,9,2);
INSERT INTO `asignatura` VALUES (15,'Sistemas Operativos',6,'obligatoria',2,1,12,4);
INSERT INTO `asignatura` VALUES (16,'Bases de Datos',6,'básica',2,2,1,4);
INSERT INTO `asignatura` VALUES (17,'Estructura de Datos y Algoritmos II',6,'obligatoria',2,2,4,4);
INSERT INTO `asignatura` VALUES (18,'Fundamentos de Redes de Computadores',6,'obligatoria',2,2,8,4);
INSERT INTO `asignatura` VALUES (19,'Planificación y Gestión de Proyectos Informáticos',6,'obligatoria',2,2,12,4);
INSERT INTO `asignatura` VALUES (20,'Programación de Servicios Software',6,'obligatoria',2,2,1,4);
INSERT INTO `asignatura` VALUES (21,'Desarrollo de interfaces de usuario',6,'obligatoria',3,1,4,4);
INSERT INTO `asignatura` VALUES (22,'Ingeniería de Requisitos',6,'optativa',3,1,11,1);
INSERT INTO `asignatura` VALUES (23,'Integración de las Tecnologías de la Información en las Organizaciones',6,'optativa',3,1,4,4);
INSERT INTO `asignatura` VALUES (24,'Modelado y Diseño del Software 1',6,'optativa',3,1,9,4);
INSERT INTO `asignatura` VALUES (25,'Multiprocesadores',6,'optativa',3,1,3,4);
INSERT INTO `asignatura` VALUES (26,'Seguridad y cumplimiento normativo',6,'optativa',3,1,8,4);
INSERT INTO `asignatura` VALUES (27,'Sistema de Información para las Organizaciones',6,'optativa',3,1,8,3);
INSERT INTO `asignatura` VALUES (28,'Tecnologías web',6,'optativa',3,1,11,4);
INSERT INTO `asignatura` VALUES (29,'Teoría de códigos y criptografía',6,'optativa',3,1,2,9);
INSERT INTO `asignatura` VALUES (30,'Administración de bases de datos',6,'optativa',3,2,7,4);
INSERT INTO `asignatura` VALUES (31,'Herramientas y Métodos de Ingeniería del Software',6,'optativa',3,2,3,4);
INSERT INTO `asignatura` VALUES (32,'Informática industrial y robótica',6,'optativa',3,2,9,3);
INSERT INTO `asignatura` VALUES (33,'Ingeniería de Sistemas de Información',6,'optativa',3,2,2,4);
INSERT INTO `asignatura` VALUES (34,'Modelado y Diseño del Software 2',6,'optativa',3,2,1,4);
INSERT INTO `asignatura` VALUES (35,'Negocio Electrónico',6,'optativa',3,2,12,4);
INSERT INTO `asignatura` VALUES (36,'Periféricos e interfaces',6,'optativa',3,2,7,4);
INSERT INTO `asignatura` VALUES (37,'Sistemas de tiempo real',6,'optativa',3,2,12,4);
INSERT INTO `asignatura` VALUES (38,'Tecnologías de acceso a red',6,'optativa',3,2,3,4);
INSERT INTO `asignatura` VALUES (39,'Tratamiento digital de imágenes',6,'optativa',3,2,2,4);
INSERT INTO `asignatura` VALUES (40,'Administración de redes y sistemas operativos',6,'optativa',4,1,2,4);
INSERT INTO `asignatura` VALUES (41,'Almacenes de Datos',6,'optativa',4,1,4,4);
INSERT INTO `asignatura` VALUES (42,'Fiabilidad y Gestión de Riesgos',6,'optativa',4,1,1,4);
INSERT INTO `asignatura` VALUES (43,'Líneas de Productos Software',6,'optativa',4,1,2,4);
INSERT INTO `asignatura` VALUES (44,'Procesos de Ingeniería del Software 1',6,'optativa',4,1,8,4);
INSERT INTO `asignatura` VALUES (45,'Tecnologías multimedia',6,'optativa',4,1,7,4);
INSERT INTO `asignatura` VALUES (46,'Análisis y planificación de las TI',6,'optativa',4,2,2,4);
INSERT INTO `asignatura` VALUES (47,'Desarrollo Rápido de Aplicaciones',6,'optativa',4,2,9,4);
INSERT INTO `asignatura` VALUES (48,'Gestión de la Calidad y de la Innovación Tecnológica',6,'optativa',4,2,6,4);
INSERT INTO `asignatura` VALUES (49,'Inteligencia del Negocio',6,'optativa',4,2,12,4);
INSERT INTO `asignatura` VALUES (50,'Procesos de Ingeniería del Software 2',6,'optativa',4,2,6,4);
INSERT INTO `asignatura` VALUES (51,'Seguridad Informática',6,'optativa',4,2,5,4);
INSERT INTO `asignatura` VALUES (52,'Biologia celular',6,'básica',1,1,2,7);
INSERT INTO `asignatura` VALUES (53,'Física',6,'básica',1,1,6,7);
INSERT INTO `asignatura` VALUES (54,'Matemáticas I',6,'básica',1,1,12,7);
INSERT INTO `asignatura` VALUES (55,'Química general',6,'básica',1,1,4,7);
INSERT INTO `asignatura` VALUES (56,'Química orgánica',6,'básica',1,1,9,7);
INSERT INTO `asignatura` VALUES (57,'Biología vegetal y animal',6,'básica',1,2,8,7);
INSERT INTO `asignatura` VALUES (58,'Bioquímica',6,'básica',1,2,1,7);
INSERT INTO `asignatura` VALUES (59,'Genética',6,'básica',1,2,3,7);
INSERT INTO `asignatura` VALUES (60,'Matemáticas II',6,'básica',1,2,7,5);
INSERT INTO `asignatura` VALUES (61,'Microbiología',6,'básica',1,2,9,10);
INSERT INTO `asignatura` VALUES (62,'Botánica agrícola',6,'obligatoria',2,1,5,1);
INSERT INTO `asignatura` VALUES (63,'Fisiología vegetal',6,'obligatoria',2,1,1,7);
INSERT INTO `asignatura` VALUES (64,'Genética molecular',6,'obligatoria',2,1,5,7);
INSERT INTO `asignatura` VALUES (65,'Ingeniería bioquímica',6,'obligatoria',2,1,8,6);
INSERT INTO `asignatura` VALUES (66,'Termodinámica y cinética química aplicada',6,'obligatoria',2,1,5,6);
INSERT INTO `asignatura` VALUES (67,'Biorreactores',6,'obligatoria',2,2,1,10);
INSERT INTO `asignatura` VALUES (68,'Biotecnología microbiana',6,'obligatoria',2,2,11,7);
INSERT INTO `asignatura` VALUES (69,'Ingeniería genética',6,'obligatoria',2,2,2,10);
INSERT INTO `asignatura` VALUES (70,'Inmunología',6,'obligatoria',2,2,4,7);
INSERT INTO `asignatura` VALUES (71,'Virología',6,'obligatoria',2,2,11,7);
INSERT INTO `asignatura` VALUES (72,'Bases moleculares del desarrollo vegetal',4.5,'obligatoria',3,1,5,1);
INSERT INTO `asignatura` VALUES (73,'Fisiología animal',4.5,'obligatoria',3,1,3,8);
INSERT INTO `asignatura` VALUES (74,'Metabolismo y biosíntesis de biomoléculas',6,'obligatoria',3,1,8,7);
INSERT INTO `asignatura` VALUES (75,'Operaciones de separación',6,'obligatoria',3,1,4,7);
INSERT INTO `asignatura` VALUES (76,'Patología molecular de plantas',4.5,'obligatoria',3,1,7,8);
INSERT INTO `asignatura` VALUES (77,'Técnicas instrumentales básicas',4.5,'obligatoria',3,1,3,6);
INSERT INTO `asignatura` VALUES (78,'Bioinformática',4.5,'obligatoria',3,2,9,6);
INSERT INTO `asignatura` VALUES (79,'Biotecnología de los productos hortofrutículas',4.5,'obligatoria',3,2,3,1);
INSERT INTO `asignatura` VALUES (80,'Biotecnología vegetal',6,'obligatoria',3,2,8,7);
INSERT INTO `asignatura` VALUES (81,'Genómica y proteómica',4.5,'obligatoria',3,2,2,7);
INSERT INTO `asignatura` VALUES (82,'Procesos biotecnológicos',6,'obligatoria',3,2,11,7);
INSERT INTO `asignatura` VALUES (83,'Técnicas instrumentales avanzadas',4.5,'obligatoria',3,2,3,8);
/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2016, 2017);
INSERT INTO curso_escolar VALUES (2, 2017, 2018);
INSERT INTO curso_escolar VALUES (3, 2018, 2019);
INSERT INTO curso_escolar VALUES (4, 2019, 2020);
INSERT INTO curso_escolar VALUES (5, 2020, 2021);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (13,12,3,7.99);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,14,5,5.90);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,21,2,3.88);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,31,4,3.29);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,53,5,0.90);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,57,3,9.61);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,60,2,6.21);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,60,3,5.83);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,64,4,9.76);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,77,2,0.94);
INSERT INTO alumno_se_matricula_asignatura VALUES (13,82,4,8.85);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,16,3,2.86);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,28,2,1.43);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,32,3,8.95);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,33,4,3.39);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,36,4,5.65);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,38,5,9.52);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,41,1,9.61);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,48,3,8.42);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,62,3,9.12);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,69,4,8.56);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,71,4,4.15);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,76,2,3.97);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,78,2,9.01);
INSERT INTO alumno_se_matricula_asignatura VALUES (14,81,3,4.20);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,3,3,6.26);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,5,4,3.10);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,11,1,2.81);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,15,1,0.89);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,16,1,3.80);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,21,4,2.64);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,30,2,0.35);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,33,2,6.51);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,42,4,4.95);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,44,1,6.71);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,45,1,5.36);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,54,3,5.35);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,63,5,7.03);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,68,3,0.42);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,70,4,6.31);
INSERT INTO alumno_se_matricula_asignatura VALUES (15,82,3,1.22);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,6,2,7.53);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,10,4,6.43);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,12,4,4.32);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,15,1,8.15);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,16,5,3.14);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,17,2,5.77);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,25,4,2.17);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,26,4,1.93);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,35,2,3.19);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,40,4,6.07);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,49,1,9.36);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,50,1,1.46);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,50,2,2.74);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,55,3,1.88);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,57,3,7.15);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,69,2,9.71);
INSERT INTO alumno_se_matricula_asignatura VALUES (16,78,5,3.46);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,8,2,4.40);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,15,4,9.56);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,19,1,6.64);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,22,1,5.64);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,23,1,1.36);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,39,2,6.73);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,40,2,2.06);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,48,5,3.94);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,52,5,5.55);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,53,1,4.14);
INSERT INTO alumno_se_matricula_asignatura VALUES (17,66,5,3.99);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,6,5,3.35);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,10,1,2.57);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,11,1,4.48);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,15,3,5.16);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,37,4,4.54);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,41,1,9.39);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,42,1,9.73);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,49,3,3.62);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,55,4,0.18);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,64,2,4.03);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,68,3,4.47);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,75,2,5.28);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,80,2,8.59);
INSERT INTO alumno_se_matricula_asignatura VALUES (18,81,3,2.95);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,2,3,1.48);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,13,1,8.94);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,15,2,3.57);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,17,2,0.99);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,27,5,4.22);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,31,2,5.08);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,33,3,9.34);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,36,4,8.09);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,53,3,7.46);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,55,3,9.13);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,57,4,6.22);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,60,1,8.81);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,62,1,6.93);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,63,1,2.53);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,65,2,4.21);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,66,3,8.86);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,72,3,2.37);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,73,5,4.64);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,76,5,5.93);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,78,5,0.34);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,79,1,5.59);
INSERT INTO alumno_se_matricula_asignatura VALUES (19,82,2,1.75);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,2,2,5.76);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,8,4,1.02);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,12,5,9.20);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,16,5,2.80);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,18,1,1.19);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,23,2,1.99);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,26,3,9.31);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,30,5,6.82);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,33,1,6.58);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,52,1,0.58);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,56,3,7.98);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,57,4,2.50);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,59,3,5.05);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,67,1,7.15);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,68,2,0.64);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,77,4,9.58);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,81,1,5.00);
INSERT INTO alumno_se_matricula_asignatura VALUES (20,82,5,8.38);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,23,2,3.25);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,31,4,9.56);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,34,5,4.96);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,44,3,5.53);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,50,4,1.31);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,50,5,7.33);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,52,1,6.90);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,53,5,0.73);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,64,4,0.40);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,70,1,5.41);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,73,2,1.07);
INSERT INTO alumno_se_matricula_asignatura VALUES (21,79,4,7.63);
INSERT INTO alumno_se_matricula_asignatura VALUES (22,18,3,2.56);
INSERT INTO alumno_se_matricula_asignatura VALUES (22,32,3,4.71);
INSERT INTO alumno_se_matricula_asignatura VALUES (22,42,2,7.24);
INSERT INTO alumno_se_matricula_asignatura VALUES (22,43,2,5.96);
INSERT INTO alumno_se_matricula_asignatura VALUES (22,69,5,9.32);
INSERT INTO alumno_se_matricula_asignatura VALUES (22,81,3,4.32);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,3,4,0.22);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,12,1,9.69);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,17,2,2.09);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,26,4,9.97);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,42,5,2.03);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,59,5,9.02);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,66,2,8.59);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,72,4,9.30);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,78,5,0.33);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,81,2,2.50);
INSERT INTO alumno_se_matricula_asignatura VALUES (23,82,2,7.23);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,3,1,8.02);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,17,1,9.76);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,19,1,0.57);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,22,3,3.76);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,39,3,3.67);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,44,5,8.28);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,47,5,0.91);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,58,4,4.85);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,64,5,6.29);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,65,1,8.31);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,66,5,3.11);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,71,3,9.34);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,72,3,6.90);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,78,4,9.27);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,80,5,9.10);
INSERT INTO alumno_se_matricula_asignatura VALUES (24,82,1,4.50);
