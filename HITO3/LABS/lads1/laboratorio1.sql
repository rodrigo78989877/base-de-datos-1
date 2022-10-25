CREATE DATABASE defensa_hito3_unifranzitos;

USE defensa_hito3_unifranzitos;

CREATE TABLE campeonato(
	id_campeonato varchar(25) primary key not null,
	nombre_campeonato varchar(25) not null,
	serie varchar(25) not null
);
insert into campeonato(id_campeonato, nombre_campeonato, serie)
values ('camp-111','campeonato unifranz','El Alto');
insert into campeonato(id_campeonato, nombre_campeonato, serie)
values ('camp-222','campeonato unifranz','<Cochabamba');

CREATE TABLE equipo(
	id_equipo varchar(10) primary key not null,
	nombre_equipo varchar(20) not null,
	categoria varchar(10) not null,
	id_campeonato varchar(10) not null
);
insert into equipo(id_equipo, nombre_equipo, categoria, id_campeonato)
values('equ-111','google','varones','camp-111');
insert into equipo(id_equipo, nombre_equipo, categoria, id_campeonato)
values('equ-222','484 not null','varones','camp-111');
insert into equipo(id_equipo, nombre_equipo, categoria, id_campeonato)
values('equ-333','girls unifranz','mejeres','camp-111');

CREATE TABLE jugador(
	id_jugador varchar(10) primary key not null,
	nombres varchar(10) not null,
	apellidos varchar(10) not null,
	ci varchar(15)not null,
	edad int not null,
	id_equipo varchar(10)not null
);
insert into jugador(id_jugador, nombres, apellidos, ci, edad, id_equipo)
values ('jug-111','Carlos','Villa','8997811LP',19,'equ-222');
insert into jugador(id_jugador, nombres, apellidos, ci, edad, id_equipo)
values ('jug-222','Pedro','Salas','8997822LP',20,'equ-222');
insert into jugador(id_jugador, nombres, apellidos, ci, edad, id_equipo)
values ('jug-333','Saul','Araj','8997833LP',21,'equ-222');
insert into jugador(id_jugador, nombres, apellidos, ci, edad, id_equipo)
values ('jug-444','Sandra','Solis','8997844LP',20,'equ-333');
insert into jugador(id_jugador, nombres, apellidos, ci, edad, id_equipo)
values ('jug-555','Ana','Mica','8997855LP',23,'equ-333');

SELECT * FROM campeonato;
SELECT * FROM equipo;
SELECT * FROM jugador;

CREATE TABLE premios(
lugar varchar (30) not null,
premio varchar (10) not null,
id_equipo varchar(10) not null,
);

drop table premios;

INSERT INTO premios(lugar, premio, id_equipo) 
VALUES ('primero','trofeo','equ-222');
INSERT INTO premios(lugar, premio, id_equipo) 
VALUES ('segundo','camisetas','equ-333');



--mostrar todos los jagadores que sus nombres empiesen son s y sus apellidos termines con la letra s--
--ejersicio 1

SELECT jug.nombres, jug.apellidos
FROM jugador AS jug
WHERE jug.nombres like'S%'
AND jug.apellidos like'%s'

-- mostrar todos los jugadores apellidos nombre 

--ejersicio 2

SELECT jug.nombres, jug.apellidos, jug.edad
FROM jugador AS jug
	INNER JOIN equipo AS eq ON eq.id_equipo = jug.id_equipo --estamo relacionanado dos parametros de dos tablas ya relacionados
WHERE eq.nombre_equipo = '484 not null'
and jug.edad <= 20;


--ejersicio 3

SELECT jug.nombres, jug.apellidos, jug.edad, eq.id_equipo, eq.nombre_equipo
FROM jugador AS jug
	INNER JOIN equipo AS eq ON eq.id_equipo = jug.id_equipo
	INNER JOIN campeonato AS cam on cam.id_campeonato = eq.id_campeonato --estamo relacionanado dos parametros de dos tablas ya relacionados
WHERE jug.edad > 20
AND eq.id_equipo = 'equ-333'
AND cam.serie = 'El Alto';

--determinar cuantos jugadores forman parte del equipo eq-222

SELECT jug.nombres, jug.apellidos, eq.id_equipo
FROM jugador AS jug
	INNER JOIN equipo AS eq ON eq.id_equipo = jug.id_equipo
WHERE eq.id_equipo = 'equ-222';



--mostrar los jugadores nombres y apellidos que ganaron el primer lugar en la categoria varones

SELECT jug.nombres, jug.apellidos, pre.lugar
FROM jugador AS jug
	INNER JOIN equipo AS eq ON eq.id_equipo = jug.id_equipo
	INNER JOIN premios AS pre ON pre.id_equipo = eq.id_equipo
WHERE eq.categoria = 'varones';


select ju.nombres, ju.apellidos 
 from jugador as ju
 inner join equipo as eq on eq.id_equipo = ju.id_equipo
 inner join campeonato as ca on ca.id_campeonato = eq.id_campeonato
 where ca.serie = 'El Alto';

