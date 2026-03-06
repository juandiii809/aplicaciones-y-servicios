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

insert into enfoque values(1, 'no se', ' no se ')
select * from car_innovacion