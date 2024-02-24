-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-21 15:10:03.15

-- tables
-- Table: Contacto
CREATE TABLE Contacto (
    ID_Contacto Integer NOT NULL,
    Nombres varchar(150) NULL,
    Telefono char(9) NULL,
    Email varchar(60) NULL,
    Asunto varchar(255) NULL,
    Mensaje varchar(500) NOT NULL,
    CONSTRAINT Contacto_pk PRIMARY KEY (ID_Contacto)
);

-- Table: Cursos
CREATE TABLE Cursos (
    ID_Curso Integer NOT NULL,
    Nombre_Curso varchar(150) NULL,
    Descripcion_Curso varchar(150) NULL,
    Creditos_Curso Integer NULL,
    Estudiante_DNI_Estudiante char(8) NOT NULL,
    Profesor_DNI_Profesor char(8) NOT NULL,
    CONSTRAINT Cursos_pk PRIMARY KEY (ID_Curso)
);

-- Table: Estudiante
CREATE TABLE Estudiante (
    DNI_Estudiante char(8) NOT NULL,
    Nombres varchar(150) NULL,
    Apellidos varchar(150) NULL,
    Direccion varchar(150) NULL,
    Telefono char(9) NULL,
    Sexo char(1) NULL,
    Fecha_Nacimiento date NULL,
    Correo_Electronico varchar(255) NULL,
    Nivel varchar(15) NULL,
    Grado varchar(3) NULL,
    Seccion varchar(3) NULL,
    CONSTRAINT Estudiante_pk PRIMARY KEY (DNI_Estudiante)
);

-- Table: Fechas_Civicas
CREATE TABLE Fechas_Civicas (
    ID_FechaC Integer NOT NULL,
    Descripcion_FC varchar(150) NULL,
    Fecha_Realizacion date NULL,
    Hora_Inicio date NULL,
    Hora_Culminacion int NULL,
    CONSTRAINT Fechas_Civicas_pk PRIMARY KEY (ID_FechaC)
);

-- Table: Profesor
CREATE TABLE Profesor (
    DNI_Profesor char(8) NOT NULL,
    Nombres varchar(150) NULL,
    Apellidos varchar(150) NULL,
    Direccion varchar(150) NULL,
    Telefono char(9) NULL,
    Sexo char(1) NULL,
    Fecha_Nacimiento date NULL,
    Correo_Electronico varchar(255) NULL,
    CONSTRAINT Profesor_pk PRIMARY KEY (DNI_Profesor)
);

-- Table: Registro_Notas
CREATE TABLE Registro_Notas (
    ID_Notas Integer NOT NULL,
    Nota Boolean NULL,
    Fecha_Nota date NULL,
    Estudiante_DNI_Estudiante char(8) NOT NULL,
    Profesor_DNI_Profesor char(8) NOT NULL,
    CONSTRAINT Registro_Notas_pk PRIMARY KEY (ID_Notas)
);

-- foreign keys
-- Reference: Cursos_Estudiante (table: Cursos)
ALTER TABLE Cursos ADD CONSTRAINT Cursos_Estudiante FOREIGN KEY Cursos_Estudiante (Estudiante_DNI_Estudiante)
    REFERENCES Estudiante (DNI_Estudiante);

-- Reference: Cursos_Profesor (table: Cursos)
ALTER TABLE Cursos ADD CONSTRAINT Cursos_Profesor FOREIGN KEY Cursos_Profesor (Profesor_DNI_Profesor)
    REFERENCES Profesor (DNI_Profesor);

-- Reference: Registro_Notas_Estudiante (table: Registro_Notas)
ALTER TABLE Registro_Notas ADD CONSTRAINT Registro_Notas_Estudiante FOREIGN KEY Registro_Notas_Estudiante (Estudiante_DNI_Estudiante)
    REFERENCES Estudiante (DNI_Estudiante);

-- Reference: Registro_Notas_Profesor (table: Registro_Notas)
ALTER TABLE Registro_Notas ADD CONSTRAINT Registro_Notas_Profesor FOREIGN KEY Registro_Notas_Profesor (Profesor_DNI_Profesor)
    REFERENCES Profesor (DNI_Profesor);

-- End of file.