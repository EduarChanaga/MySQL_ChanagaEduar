-- #############################
-- ########## Dia # 4 ##########
-- #############################
-- crear base de datos dia4
create database Dia4;
-- usar base de datos dia4
use Dia4;

-- Orden de creacion de las tablas
-- 1.pais
-- 2. Idioma
-- 3. Ciudad
-- 4. Idioma_pais



-- crear tabla pais
create table pais(
id int primary key auto_increment,
nombre varchar(20),
continente varchar(50),
poblacion int
);

-- crear tabla idioma
create table idioma(
id int primary key auto_increment,
idioma varchar(50)
);

-- crear tabla ciudad
create table ciudad(
id int primary key auto_increment,
nombre varchar(20),
id_pais int,
foreign key(id_pais) references pais(id)
);

-- crear tabla idioma_pais
create table idioma_pais(
id_idioma int not null,
id_pais int not null,
primary key (id_idioma,id_pais),
foreign key(id_idioma) references idioma(id),
foreign key(id_pais) references pais(id),
es_oficial tinyint(1)
);



INSERT INTO pais (id, nombre, continente, poblacion) VALUES 
(1, 'España', 'Europa', 47000000),
(2, 'México', 'América', 126000000),
(3, 'Japón', 'Asia', 126300000);

INSERT INTO ciudad (id, nombre, id_pais) VALUES 
(1, 'Madrid', 1),
(2, 'Barcelona', 1),
(3, 'Ciudad de México', 2),
(4, 'Guadalajara', 2),
(5, 'Tokio', 3),
(6, 'Osaka', 3);


INSERT INTO idioma (id, idioma) VALUES 
(1, 'Español'),
(2, 'Catalán'),
(3, 'Inglés'),
(4, 'Japonés');


INSERT INTO idioma_pais (id_idioma, id_pais, es_oficial) VALUES 
(1, 1, 1), -- Español es oficial en España
(2, 1, 1), -- Catalán es oficial en España
(1, 2, 1), -- Español es oficial en México
(4, 3, 1), -- Japonés es oficial en Japón
(3, 1, 0), -- Inglés no es oficial en España
(3, 2, 0), -- Inglés no es oficial en México
(3, 3, 0); -- Inglés no es oficial en Japón

-- inner join
-- A = pais
-- B = Ciudad
select pais.nombre as NombrePais, 
	   ciudad.nombre as NombreCiudad                 
from pais 
inner join ciudad on pais.id = ciudad.id_pais;



-- left join
-- Listar todos los ciudadanos con el nombre de su pais, si alguna ciudad no tiene un pais asignado aun aparecera en la lista nombrepais como null
select pais.nombre as Pais, ciudad.nombre as Ciudad
from pais
left join ciudad on pais.id=ciudad.id_pais;

-- right
select pais.nombre as Pais, ciudad.nombre as Ciudad
from pais
right join ciudad on ciudad.id_pais = pais.id;
-- Desarrollado por: Eduar Damian Chanaga Gonzalez ID: 1095581647