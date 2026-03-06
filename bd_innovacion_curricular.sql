/*
    agregar aqui todas las tablas que se creen para que todos tengamos lo mismo
    
*/
create database innovacion_curricular
go 
use innovacion_curricular
go
CREATE TABLE car_innovacion (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(MAX) NOT NULL,
  tipo NVARCHAR(45) NOT NULL
);

CREATE TABLE enfoque (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL
);

CREATE TABLE aspecto_normativo (
  id INT NOT NULL PRIMARY KEY,
  tipo NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL,
  fuente NVARCHAR(45) NOT NULL
);

CREATE TABLE universidad (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  tipo NVARCHAR(45) NOT NULL,
  ciudad NVARCHAR(45) NOT NULL
);

CREATE TABLE practica_estrategia (
  id INT NOT NULL PRIMARY KEY,
  tipo NVARCHAR(45) NOT NULL,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL
);

CREATE TABLE aliado (
  nit INT NOT NULL PRIMARY KEY,
  razon_social VARCHAR(60) NOT NULL,
  correo VARCHAR(70) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  ciudad VARCHAR(45)
);

insert into enfoque values(1, 'no se', ' no se ')
DELETE FROM enfoque
WHERE id = 1;

INSERT INTO enfoque (id, nombre, descripcion)
VALUES
(1, 'Gestión del conocimiento', 'Organización del conocimiento institucional'),
(2, 'Investigación académica', 'Generación de proyectos de investigación'),
(3, 'Innovación educativa', 'Aplicación nuevas metodologías de enseñanza'),
(4, 'Transformación digital', 'Uso de tecnología para mejorar procesos');

INSERT INTO car_innovacion (id, nombre, descripcion, tipo)
VALUES
(1, 'Innovación tecnológica', 'Uso de herramientas digitales en procesos', 'Tecnológica'),
(2, 'Innovación pedagógica', 'Nuevas metodologías de enseñanza', 'Académica'),
(3, 'Innovación organizacional', 'Mejoras en la gestión institucional', 'Organizacional'),
(4, 'Innovación social', 'Proyectos con impacto en la comunidad', 'Social');

select * from car_innovacion

INSERT INTO aspecto_normativo (id, tipo, descripcion, fuente)
VALUES 
(1, 'Ley', 'Protección de datos personales', 'Ley 1581 de 2012'),
(2, 'Decreto', 'Regulación de comercio electrónico', 'Decreto 1074 de 2015'),
(3, 'Resolución', 'Gestión integral de residuos sólidos', 'Resolución 2184 de 2019'),
(4, 'Norma', 'Sistema de gestión ambiental', 'ISO 14001');

INSERT INTO practica_estrategia (id, tipo, nombre, descripcion)
VALUES
(1, 'Académica', 'Aprendizaje colaborativo', 'Trabajo en equipo para resolver problemas'),
(2, 'Investigación', 'Semilleros de investigacion', 'Espacios para formacion investigativa'),
(3, 'Tecnológica', 'Uso de plataformas virtuales', 'Aprendizaje con herramientas digitales'),
(4, 'Gestión', 'Gestión del conocimiento', 'Compartir y documentar experiencias'),
(5, 'Innovación', 'Laboratorios de innovación', 'Desarrollo de nuevas soluciones academicas');

select * from practica_estrategia

INSERT INTO universidad (id, nombre, tipo, ciudad)
VALUES
(1, 'Universidad Nacional de Colombia', 'Pública', 'Bogotá'),
(2, 'Universidad de Antioquia', 'Pública', 'Medellín'),
(3, 'Universidad EAFIT', 'Privada', 'Medellín'),
(4, 'Pontificia Universidad Javeriana', 'Privada', 'Bogotá'),
(5, 'Universidad del Valle', 'Pública', 'Cali');