
-- ###################################
-- ### Dia #2 - Comandos generales ###
-- ###################################

-- comando generar para revisar las bases de datos creadas
show databases;

-- Crear base de datos
create database dia2;

-- Utilizar base de datos dia 2 
use dia2;

-- crear tabla departamento
create table departamento (
id int auto_increment primary key,
nombre varchar(50) not null
);

-- Crear tabla de persona
create table persona (
id int auto_increment primary key,
nif varchar(9),
nombre varchar(25) not null,
apellido1 varchar (50) not null,
apellido2 varchar(50),
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9),
fecha_nacimiento date not null,
sexo enum('H','M') not null,
tipo enum('Profesor','Alumno')
);


-- Crear tabla de profesor
create table profesor (
id_profesor int auto_increment primary key,
id_departamento int not null,
foreign key(id_profesor) references persona(id),
foreign key (id_departamento) references departamento(id)
);

-- crear tabla de grado
create table grado(
id_grado int auto_increment primary key,
nombre varchar(10) not null
);
-- crear tabla de asignaturas
create table asignatura (
id_asignatura int auto_increment primary key,
nombre varchar(100)not null,
creditos float not null,
tipo enum('Basica','Obligatoria','Optativa')not null,
curso tinyint(3) not null,
cuatrimestre tinyint(3) not null,
id_profesor int,
foreign key (id_profesor) references profesor(id_profesor),
id_grado int not null,
foreign key (id_grado) references grado(id_grado)
);

-- crear tabla de curso_escolar
create table curso_escolar(
id int auto_increment primary key,
anyo_inicio year(4) not null,
anyo_fin year(4)
);
-- crear tabla de alumno_se_matricula_asignatura
create table alumno_se_matricula_asignatura(
id_alumno int not null,
id_asignatura int not null,
id_curso_escolar int not null,
foreign key (id_alumno) references persona(id),
foreign key (id_asignatura) references asignatura(id_asignatura),
foreign key (id_curso_escolar) references curso_escolar(id)
);
show tables;
drop table asignatura;
drop table grado;
drop table persona;
drop table profesor;


-- Desarrollado por Eduar Chanaga / ID. 1095581647departamento