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

CREATE TABLE facultad (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  tipo NVARCHAR(45) NOT NULL,
  fecha_fun DATE NOT NULL,
  universidad INT NOT NULL,
  CONSTRAINT fk_unidad_sede FOREIGN KEY (universidad)
    REFERENCES universidad (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- Tabla programa
CREATE TABLE programa (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(60) NOT NULL,
  tipo NVARCHAR(45) NOT NULL,
  nivel NVARCHAR(45) NOT NULL,
  fecha_creacion NVARCHAR(45) NOT NULL,
  fecha_cierre NVARCHAR(45) NULL,
  numero_cohortes NVARCHAR(45) NOT NULL,
  cant_graduados NVARCHAR(45) NOT NULL,
  fecha_actualizacion NVARCHAR(45) NOT NULL,
  ciudad NVARCHAR(45) NOT NULL,
  facultad INT NOT NULL,
  CONSTRAINT fk_programa_facultad FOREIGN KEY (facultad)
    REFERENCES facultad (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE pasantia (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  pais NVARCHAR(45) NOT NULL,
  empresa NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_pasantia_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO
CREATE TABLE acreditacion (
  resolucion INT NOT NULL PRIMARY KEY,
  tipo NVARCHAR(45) NOT NULL,
  calificacion NVARCHAR(45) NOT NULL,
  fecha_inicio NVARCHAR(45) NOT NULL,
  fecha_fin NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_acreditacion_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE registro_calificado (
  codigo INT NOT NULL PRIMARY KEY,
  cant_creditos NVARCHAR(45) NOT NULL,
  hora_acom NVARCHAR(45) NOT NULL,
  hora_ind NVARCHAR(45) NOT NULL,
  metodologia NVARCHAR(45) NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  duracion_anios NVARCHAR(45) NOT NULL,
  duracion_semestres NVARCHAR(45) NOT NULL,
  tipo_titulacion NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_registro_calificado_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE premio (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  descripcion NVARCHAR(45) NOT NULL,
  fecha DATE NOT NULL,
  entidad_otorgante NVARCHAR(45) NOT NULL,
  pais NVARCHAR(45) NOT NULL,
  programa INT NOT NULL,
  CONSTRAINT fk_premio_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE programa_ci (
  programa INT NOT NULL,
  car_innovacion INT NOT NULL,
  PRIMARY KEY (programa, car_innovacion),
  CONSTRAINT fk_programa_ci_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_programa_ci_car_innovacion FOREIGN KEY (car_innovacion)
    REFERENCES car_innovacion (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE enfoque_rc(
  enfoque INT NOT NULL,
  registro_calificado INT NOT NULL,
  PRIMARY KEY (enfoque, registro_calificado),
  CONSTRAINT fk_enfoque_rc_enfoque FOREIGN KEY (enfoque)
    REFERENCES enfoque (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_enfoque_rc_registro_calificado FOREIGN KEY (registro_calificado)
    REFERENCES registro_calificado (codigo)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TABLE activ_academica (
  id INT NOT NULL PRIMARY KEY,
  nombre NVARCHAR(45) NOT NULL,
  num_creditos INT NOT NULL,
  tipo NVARCHAR(20) NOT NULL,
  area_formacion NVARCHAR(45) NOT NULL,
  h_acom INT NOT NULL,
  h_indep INT NOT NULL,
  idioma NVARCHAR(45) NOT NULL,
  espejo BIT NOT NULL,
  entidad_espejo NVARCHAR(45) NOT NULL,
  pais_espejo NVARCHAR(45) NOT NULL,
  disenio INT NULL,
  CONSTRAINT fk_activ_academicas_programa FOREIGN KEY (disenio)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO
CREATE TABLE programa_pe (
  programa INT NOT NULL,
  practica_estrategia INT NOT NULL,
  PRIMARY KEY (programa, practica_estrategia),
  CONSTRAINT fk_programa_pe_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_programa_pe_practica_estrategia FOREIGN KEY (practica_estrategia)
    REFERENCES practica_estrategia (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO
CREATE TABLE an_programa (
  aspecto_normativo INT NOT NULL,
  programa INT NOT NULL,
  PRIMARY KEY (aspecto_normativo, programa),
  CONSTRAINT fk_an_programa_aspecto_normativo FOREIGN KEY (aspecto_normativo)
    REFERENCES aspecto_normativo (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_an_programa_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO
CREATE TABLE aa_rc (
  activ_academicas_idcurso INT NOT NULL,
  registro_calificado_codigo INT NOT NULL,
  componente NVARCHAR(45) NOT NULL,
  semestre NVARCHAR(45) NOT NULL,
  PRIMARY KEY (activ_academicas_idcurso, registro_calificado_codigo),
  CONSTRAINT fk_aa_rc_activ_academica FOREIGN KEY (activ_academicas_idcurso)
    REFERENCES activ_academica (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_aa_rc_registro_calificado FOREIGN KEY (registro_calificado_codigo)
    REFERENCES registro_calificado (codigo)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO
CREATE TABLE area_conocimiento (
  id INT NOT NULL PRIMARY KEY,
  gran_area NVARCHAR(60) NOT NULL,
  area NVARCHAR(60) NOT NULL,
  disciplina NVARCHAR(60) NOT NULL
);
GO

CREATE TABLE programa_ac (
  programa INT NOT NULL,
  area_conocimiento INT NOT NULL,
  PRIMARY KEY (programa, area_conocimiento),
  CONSTRAINT fk_programa_ac_programa FOREIGN KEY (programa)
    REFERENCES programa (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_programa_ac_area_conocimiento FOREIGN KEY (area_conocimiento)
    REFERENCES area_conocimiento (id)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

CREATE TRIGGER trg_validar_fechas_registro
ON registro_calificado
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE fecha_fin <= fecha_inicio
    )
    BEGIN
        DECLARE @msg NVARCHAR(200);
        SET @msg = 'Error de integridad: La fecha de fin debe ser posterior a la fecha de inicio.';
        
        -- Lanzamos error 50001 (personalizado)
        THROW 50001, @msg, 1;
    END
END;
GO

CREATE TRIGGER trg_validar_clase_espejo
ON activ_academica
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE espejo = 1 
        AND (entidad_espejo IS NULL OR entidad_espejo = '' OR pais_espejo IS NULL OR pais_espejo = '')
    )
    BEGIN
        THROW 50002, 'Si la actividad es Espejo, debe registrar la entidad y el pa s de origen.', 1;
    END
END;
GO

CREATE TRIGGER trg_validar_consistencia_programa
ON programa
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Validar que la fecha de cierre sea l gica respecto a la creaci n
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE fecha_cierre IS NOT NULL 
        AND CAST(fecha_cierre AS DATE) < CAST(fecha_creacion AS DATE)
    )
    BEGIN
        THROW 50003, 'Error: La fecha de cierre no puede ser anterior a la fecha de creaci n del programa.', 1;
    END

    -- 2. Validar que la cantidad de graduados no sea un valor negativo
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE TRY_CAST(cant_graduados AS INT) < 0
    )
    BEGIN
        THROW 50004, 'Error: La cantidad de graduados no puede ser un n mero negativo.', 1;
    END
END;
GO


insert into enfoque values(1, 'no se', ' no se ')
select * from car_innovacion