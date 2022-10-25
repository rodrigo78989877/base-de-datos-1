create database universidad;
use universidad;

CREATE TABLE escuela(
id_esc INTEGER IDENTITY primary key not null,
nombre varchar(100) not null,
direccion varchar(100),
);
INSERT INTO escuela (nombre, direccion)
VALUES ('San Felipe Asturias II', 'Zona Illampu Av. Prol. San Lorenzo');

CREATE TABLE estudiantes(
id_est_cedula INTEGER IDENTITY primary key not null,
nombres varchar(100) not null,
apellidos varchar(100),
sexo varchar(10),
direccion varchar(200),
telefono int,
email varchar(50),
edad int,
id_esc int,
FOREIGN KEY (id_esc) REFERENCES escuela (id_esc)
);
INSERT INTO estudiantes (id_est_cedula, nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc)
VALUES(6775644, 'Ximena', 'Arias Ballesteros', 'femenino', 'Av. 6 de Agosto', 79617575, 'xime@gmail.com', 25, 1);

INSERT INTO estudiantes (id_est_cedula, nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc)
VALUES(6775655, 'Saul', 'Montes Valenzuela', 'masculino', 'Av. 6 de Agosto', 79617576, 'saul@gmail.com', 24, 1);

INSERT INTO estudiantes (id_est_cedula, nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc)
VALUES(6775666, 'Carla', 'Mavir Uria', 'femenino', 'Av. 6 de Agosto', 79617577, 'carla@gmail.com', 28, 1);

INSERT INTO estudiantes (id_est_cedula, nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc)
VALUES(6775677, 'Joel', 'Castillo Fuentes', 'masculino', 'Av. 6 de Agosto', 79617578, 'joel@gmail.com', 21, 1);

INSERT INTO estudiantes (id_est_cedula, nombres, apellidos, sexo, direccion, telefono, email, edad, id_esc)
VALUES(6775688, 'Augusto', 'Copar Copar', 'femenino', 'Av. 6 de Agosto', 79617579, 'augusto@gmail.com', 20, 1);


CREATE TABLE materias(
id_mat INTEGER IDENTITY primary key not null,
nombre_mat varchar(100) not null,
cod_mat varchar(100)not null
);

INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Introduccion a la Arquitectura','ARQ-101');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Urbanismo y Diseno','ARQ-102');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Dibujo y Pintura Arquitectonico','ARQ-103');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Matematica discreta','ARQ-104');
INSERT INTO materias (nombre_mat, cod_mat) VALUES ('Fisica Basica','ARQ-105');

CREATE TABLE periodo(
id_per INTEGER IDENTITY primary key not null,
ano_gestion int not null,
semestre varchar(50)
);
INSERT INTO periodo (ano_gestion, semestre) VALUES (2016, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2016, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2017, 'Semestre 1');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2017, 'Semestre 2');
INSERT INTO periodo (ano_gestion, semestre) VALUES (2018, 'Semestre 1');

CREATE TABLE kardex(
id_kar INTEGER IDENTITY primary key not null,
nota_num int not null,
nota_alfabe varchar(100)not null,
estado varchar(10)not null,
id_mat int not null,
id_est_cedula int not null,
id_per int not null,
FOREIGN KEY (id_mat) REFERENCES materias (id_mat),
FOREIGN KEY (id_est_cedula) REFERENCES estudiantes (id_est_cedula),
FOREIGN KEY (id_per) REFERENCES periodo (id_per),
);
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
values('51','cincuenta y uno','aprobado',1,1,1);
 
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
values('31','treinta y uno','reprobado',2,2,2);

insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
values('61','sesenta y uno','aprobado',3,3,3);
  
insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
values('41 ','cuarenta y uno','reprobado',4,4,4);

insert into kardex(nota_num,nota_alfabe,estado,id_mat,id_est_cedula,id_per)
values('81 ','ochenta y uno','reprobado',5,4,5);

SELECT * FROM escuela;
SELECT * FROM estudiantes;
SELECT * FROM materias;
SELECT * FROM periodo;
SELECT * FROM kardex;



--Mostrar los nombres y apellidos de todos los estudiantes aprobados.
-- 1ro que tablas debo de visitar
--	estudiantes
--	kardex
-- 2do tengo que verificar si las tablas se relacionan

SELECT est.nombres, est.apellidos, kar.nota_num
FROM estudiantes AS est
	INNER JOIN kardex AS kar ON kar.id_est_cedula = est.id_est_cedula --estamo relacionanado dos parametros de dos tablas ya relacionados
WHERE kar.nota_num = 51;
--INNER JOIN para relacionar dos tablas se usa la clausula
