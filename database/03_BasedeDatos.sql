-- Crear y seleccionar la base de datos
-- drop database pruebanota;
CREATE DATABASE pruebanota;
USE pruebanota;

-- Tabla Secciones
CREATE TABLE Secciones (
  IDSeccion INT AUTO_INCREMENT PRIMARY KEY,
  NombreSeccion VARCHAR(50)
);

INSERT INTO Secciones (NombreSeccion) VALUES
('A1'),
('A2');

-- Tabla Grados
CREATE TABLE Grados (
  IDGrado INT AUTO_INCREMENT PRIMARY KEY,
  NombreGrado VARCHAR(50)
);

INSERT INTO Grados (NombreGrado) VALUES
('1er año'),
('2do año');

-- Tabla Estudiantes
CREATE TABLE Estudiantes (
  IDEstudiante INT AUTO_INCREMENT PRIMARY KEY,
  DNI INT UNIQUE,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  Telefono VARCHAR(20),
  Email VARCHAR(50),
  Genero VARCHAR(10),
  IDSeccion INT,
  IDGrado INT,
  FOREIGN KEY (IDSeccion) REFERENCES Secciones(IDSeccion),
  FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado)
);

INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado)
VALUES
(12345678, 'Juan', 'Pérez', '1990-01-01', 'Calle 123, Ciudad', '123456789', 'juan.perez@ejemplo.com', 'M', 1, 1),
(23456789, 'María', 'López', '1991-02-02', 'Calle 456, Ciudad', '234567890', 'maria.lopez@ejemplo.com', 'F', 2, 2),
(34567890, 'Carlos', 'Gómez', '1992-03-20', 'Calle 555, Ciudad', '789012345', 'carlos.gomez@ejemplo.com', 'M', 1, 1),
(45678901, 'Sofía', 'Martínez', '1993-06-15', 'Calle 666, Ciudad', '890123456', 'sofia.martinez@ejemplo.com', 'F', 2, 2);

-- Tabla Cursos
CREATE TABLE Cursos (
  IDCurso INT AUTO_INCREMENT PRIMARY KEY,
  NombreCurso VARCHAR(50)
);

INSERT INTO Cursos (NombreCurso) VALUES
('test 1');

-- Tabla Profesores
CREATE TABLE Profesores (
  IDProfesor INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  Telefono VARCHAR(20),
  Email VARCHAR(50),
  Genero VARCHAR(10)
);

-- Tabla CursosProfesores
CREATE TABLE CursosProfesores (
  IDCursoProfesor INT AUTO_INCREMENT PRIMARY KEY,
  IDCurso INT,
  IDProfesor INT,
  FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
  FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor)
);

-- Tabla AnioEscolar
CREATE TABLE AnioEscolar (
  IDAnioEscolar INT AUTO_INCREMENT PRIMARY KEY,
  AnioInicio INT,
  AnioFin INT
);

-- Tabla Inscripciones
CREATE TABLE Inscripciones (
  IDInscripcion INT AUTO_INCREMENT PRIMARY KEY,
  IDEstudiante INT,
  IDCurso INT,
  IDAnioEscolar INT,
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
  FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
  FOREIGN KEY (IDAnioEscolar) REFERENCES AnioEscolar(IDAnioEscolar)
);

-- Tabla NotasPorParcial
CREATE TABLE NotasPorParcial (
  IDNotaParcial INT AUTO_INCREMENT PRIMARY KEY,
  IDEstudiante INT,
  IDMateria INT,
  Parcial INT,
  Nota FLOAT,
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
  FOREIGN KEY (IDMateria) REFERENCES Cursos(IDCurso)
);

select * from NotasPorParcial;
-- Consulta para obtener estudiantes del grado 2do año y sección A1
SELECT
    Estudiantes.IDEstudiante,
    Estudiantes.DNI,
    Estudiantes.Nombre,
    Estudiantes.Apellido,
    Estudiantes.FechaNacimiento,
    Estudiantes.Direccion,
    Estudiantes.Telefono,
    Estudiantes.Email,
    Estudiantes.Genero,
    Grados.NombreGrado,
    Secciones.NombreSeccion
FROM
    Estudiantes
JOIN
    Grados ON Estudiantes.IDGrado = Grados.IDGrado
JOIN
    Secciones ON Estudiantes.IDSeccion = Secciones.IDSeccion
WHERE
    Grados.NombreGrado = '2do año';

-- Modificar la tabla Secciones para incluir la columna IDGrado
ALTER TABLE Secciones
ADD COLUMN IDGrado INT,
ADD CONSTRAINT fk_secciones_grados FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado);

-- Insertar 5 registros en la tabla Secciones
INSERT INTO Secciones (NombreSeccion, IDGrado) VALUES
('Sección 1', 1),
('Sección 2', 1),
('Sección 3', 2),
('Sección 4', 2),
('Sección 5', 2);

-- Insertar 5 registros en la tabla Estudiantes
INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado)
VALUES
(66666666, 'Estudiante6', 'Apellido6', '2000-01-01', 'Dirección6', '111111111', 'estudiante6@email.com', 'F', 2, 2),
(77777777, 'Estudiante7', 'Apellido7', '2001-02-02', 'Dirección7', '222222222', 'estudiante7@email.com', 'M', 2, 2),
(88888888, 'Estudiante8', 'Apellido8', '2002-03-03', 'Dirección8', '333333333', 'estudiante8@email.com', 'F', 1, 1),
(99999999, 'Estudiante9', 'Apellido9', '2003-04-04', 'Dirección9', '444444444', 'estudiante9@email.com', 'M', 1, 1),
(10101010, 'Estudiante10', 'Apellido10', '2004-05-05', 'Dirección10', '555555555', 'estudiante10@email.com', 'F', 1, 1);

-- Ahora puedes usar la columna IDGrado en tu consulta SQL
SELECT * FROM Estudiantes;

-- Insertar una nueva materia con ID específico (ID = 10) en la tabla Cursos
INSERT INTO Cursos (IDCurso, NombreCurso) VALUES (10, 'Matemáticas 1');

-- Modificar la tabla NotasPorParcial para incluir la columna Parcial
ALTER TABLE NotasPorParcial
ADD COLUMN Parcial INT;

-- Actualizar las notas existentes con un valor de parcial (por ejemplo, 1)
UPDATE NotasPorParcial SET Parcial = 1;

-- Eliminar la columna Parcial de la tabla NotasPorParcial
ALTER TABLE NotasPorParcial
DROP COLUMN Parcial;

-- Eliminar la tabla NotasPorParcial
DROP TABLE NotasPorParcial;

select * from Profesores;
-- Insertar un nuevo profesor con ID específico (ID = 10)
INSERT INTO Profesores ( Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero)
VALUES ('Michaell', 'Ibarra', '1985-01-01', 'Calle Principal 123', '987654321', 'nuevo.profesor@example.com', 'M');

-- Insertar un nuevo curso con ID específico (ID = 10)
INSERT INTO Cursos (IDCurso, NombreCurso)
VALUES (1, 'Nuevo Curso');

select * from Cursos;
-- Asignar el nuevo curso al nuevo profesor con ID específico (ID = 10)
INSERT INTO CursosProfesores (IDCurso, IDProfesor)
VALUES ( 2, 1);
select * from cursos;
select * from CursosProfesores;

-- Obtener el nombre del curso que enseña un profesor específico (IDProfesor = 10)
SELECT
    Profesores.Nombre AS NombreProfesor,
    Cursos.NombreCurso AS CursoEnseñado
FROM
    CursosProfesores
JOIN
    Profesores ON CursosProfesores.IDProfesor = Profesores.IDProfesor
JOIN
    Cursos ON CursosProfesores.IDCurso = Cursos.IDCurso;

select * from cursos;
