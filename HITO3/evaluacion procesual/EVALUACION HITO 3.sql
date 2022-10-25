CREATE DATABASE unifransitos;

USE unifransitos;

CREATE TABLE campeonato(
id_campeonato varchar(25) not null primary key,
nombre_campeonato varchar(25) not null,
serie varchar (25) not null
);

insert into campeonato(id_campeonato, nombre_campeonato, serie) 
values ('camp-111','campeonato unifranz','El Alto');
insert into campeonato(id_campeonato, nombre_campeonato, serie)
values ('camp-222','campeonato unifranz','<Cochabamba');

CREATE TABLE equipo(
id_equipo varchar (20) not null primary key,
nombre_equipo varchar (20) not null,
categoria varchar(10) not null,
id_campeonato varchar(25) not null
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
 
 select * from campeonato;
 select * from jugador;
 select * from equipo;

 --Mostrar que jugadores son del equipo equ-222
 
 select ju.nombres, ju.apellidos 
 from jugador as ju
 inner join equipo as eq on eq.id_equipo = ju.id_equipo
 where eq.id_equipo = 'equ-222';

 -- Mostrar que jugadores(nombres, apellidos) que juegan en la sede de El Alto.

  select ju.nombres, ju.apellidos 
 from jugador as ju
 inner join equipo as eq on eq.id_equipo = ju.id_equipo
 inner join campeonato as ca on ca.id_campeonato = eq.id_campeonato
 where ca.serie = 'El Alto';

 --Mostrar aquellos jugadores mayores o igual a 21 años que sean de la categoría VARONES.

 select ju.nombres, ju.apellidos 
 from jugador as ju
 inner join equipo as eq on eq.id_equipo = ju.id_equipo
 where eq.categoria = 'varones'
 and ju.edad >= 21;

 -- Mostrar a todos los estudiantes en donde su apellido empiece con la letra S.

SELECT jug.nombres, jug.apellidos
FROM jugador AS jug
WHERE jug.apellidos like'S%';

--Mostrar que equipos forman parte del campeonato camp-111 y además sean de la categoría MUJERES.

 select ju.nombres, ju.apellidos 
 from jugador as ju
 inner join equipo as eq on eq.id_equipo = ju.id_equipo
 where eq.id_campeonato = 'camp-111'
 and eq.categoria = 'mejeres';

 -- Mostrar el nombre del equipo del jugador con id_jugador igual a jug-333

 select eq.nombre_equipo
 from equipo as eq
 inner join jugador as ju on ju.id_equipo = ju.id_equipo
 where ju.id_jugador = 'jug-333';

 -- Mostrar el nombre del campeonato del jugador con id_jugador igual a jug-333

 select ca.nombre_campeonato
 from campeonato as ca
 inner join equipo as eq on eq.id_campeonato = ca.id_campeonato
  inner join jugador as ju on ju.id_equipo = eq.id_equipo
 where ju.id_jugador = 'jug-333';

 --¿Qué estrategia utilizaría para determinar cuántos equipos inscritos hay?

 select count(nombre_equipo) as[equipos inscritos]
 from equipo;

 --¿Qué estrategia utilizaría para determinar cuántos jugadores pertenecen a la categoría VARONES o Categoria
-- MUJERES.

 select count(categoria) as[numero de jugadores]
 from equipo
 where categoria = 'varones';


 --Crear una consulta SQL que maneje las 3 tablas de la base de datos.

  select ca.nombre_campeonato, ju.nombres, eq.id_equipo
 from campeonato as ca
 inner join equipo as eq on eq.id_campeonato = ca.id_campeonato
  inner join jugador as ju on ju.id_equipo = eq.id_equipo
 where ju.id_jugador = 'jug-333';
