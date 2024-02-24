-- Crear y seleccionar la base de datos
drop database pruebanota;
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
SELECT * FROM Cursos;
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


INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado)
VALUES
(66556656, 'GSSSS', 'Pérez', '1990-01-01', 'Calle 123, Ciudad', '123456789', 'juan.perez@ejemplo.com', 'M', 2, 1),
(53454464, 'MMNNNN', 'López', '1991-02-02', 'Calle 456, Ciudad', '234567890', 'maria.lopez@ejemplo.com', 'F', 2, 1);
-- Tabla Materias
CREATE TABLE Materias (
  IDMateria INT AUTO_INCREMENT PRIMARY KEY,
  NombreMateria VARCHAR(50)
);
select * from Materias;
INSERT INTO Materias (NombreMateria) VALUES
('Comunicación'),
('Programación');

-- Tabla Cursos
CREATE TABLE Cursos (
  IDCurso INT AUTO_INCREMENT PRIMARY KEY,
  NombreCurso VARCHAR(50),
  IDMateria INT,
  FOREIGN KEY (IDMateria) REFERENCES Materias(IDMateria)
);
select * from Cursos;
INSERT INTO Cursos (NombreCurso, IDMateria) VALUES
('test 1', 1),
('Lenguaje 1', 2);
drop table Cursos;

update Cursos
set NombreCurso = 'Programación 1',
	IDMateria = 3
    where IDCurso = 3;
	
select * from CursosProfesores;
update CursosProfesores
set IDCurso = 3,
	IDProfesor = 3
    where IDCursoProfesor = 3;
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

INSERT INTO Profesores (Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero)
VALUES
('Pedro', 'García', '1980-03-03', 'Calle 789, Ciudad', '345678901', 'pedro.garcia@ejemplo.com', 'M'),
('Ana', 'González', '1981-04-04', 'Calle 1011, Ciudad', '456789012', 'ana.gonzalez@ejemplo.com', 'F');

-- Tabla CursosProfesores
CREATE TABLE CursosProfesores (
  IDCursoProfesor INT AUTO_INCREMENT PRIMARY KEY,
  IDCurso INT,
  IDProfesor INT,
  FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
  FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor)
);
select * from CursosProfesores;
INSERT INTO CursosProfesores (IDCurso, IDProfesor) VALUES
(1, 1),
(2, 2);
select * from estudiantes;
-- Tabla AnioEscolar
CREATE TABLE AnioEscolar (
  IDAnioEscolar INT AUTO_INCREMENT PRIMARY KEY,
  AnioInicio INT,
  AnioFin INT
);

INSERT INTO AnioEscolar (AnioInicio, AnioFin) VALUES
(2023, 2024);

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
-- Insertar estudiantes en el grado 1er año y sección A1
INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado)
VALUES
(11111111, 'Estudiante1', 'Apellido1', '1995-05-05', 'Dirección1', '123456789', 'estudiante1@email.com', 'M', 1, 1),
(22222222, 'Estudiante2', 'Apellido2', '1996-06-06', 'Dirección2', '234567890', 'estudiante2@email.com', 'F', 1, 1),
(33333333, 'Estudiante3', 'Apellido3', '1997-07-07', 'Dirección3', '345678901', 'estudiante3@email.com', 'M', 1, 1),
(44444444, 'Estudiante4', 'Apellido4', '1998-08-08', 'Dirección4', '456789012', 'estudiante4@email.com', 'F', 1, 1),
(55555555, 'Estudiante5', 'Apellido5', '1999-09-09', 'Dirección5', '567890123', 'estudiante5@email.com', 'M', 1, 1);

INSERT INTO Inscripciones (IDEstudiante, IDCurso, IDAnioEscolar) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 1),
(4, 2, 1);

select * from Estudiantes;

-- Para la materia de Matemáticas, parcial 2
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota)
VALUES
(2, 1, 2, 10);

-- Para la materia de Lenguaje, parcial 2
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota)
VALUES
(2, 2, 2, 5);

-- Tabla NotasPorParcial
CREATE TABLE NotasPorParcial (
  IDNotaParcial INT AUTO_INCREMENT PRIMARY KEY,
  IDEstudiante INT,
  IDMateria INT,
  Parcial INT,
  Nota FLOAT,
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
  FOREIGN KEY (IDMateria) REFERENCES Materias(IDMateria)
);
select * from NotasPorParcial;
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota) VALUES
(1, 1, 1, 7),
(1, 2, 1, 8),
(2, 1, 1, 9),
(2, 2, 1, 8),
(3, 1, 1, 6),
(3, 2, 1, 7),
(4, 1, 1, 8),
(4, 2, 1, 9);


SELECT 
    Estudiantes.IDEstudiante,
    Estudiantes.Nombre AS NombreEstudiante,
    Estudiantes.Apellido AS ApellidoEstudiante,
    Cursos.IDCurso,
    Cursos.NombreCurso,
    AnioEscolar.AnioInicio,
    AnioEscolar.AnioFin
FROM 
    Estudiantes
JOIN 
    Inscripciones ON Estudiantes.IDEstudiante = Inscripciones.IDEstudiante
JOIN 
    Cursos ON Inscripciones.IDCurso = Cursos.IDCurso
JOIN 
    AnioEscolar ON Inscripciones.IDAnioEscolar = AnioEscolar.IDAnioEscolar
WHERE 
    Cursos.IDCurso = 1 AND AnioEscolar.AnioInicio = 2023;

SELECT
    Cursos.IDCurso,
    Cursos.NombreCurso,
    Profesores.IDProfesor,
    Profesores.Nombre AS NombreProfesor,
    Profesores.Apellido AS ApellidoProfesor
FROM
    Cursos
JOIN
    CursosProfesores ON Cursos.IDCurso = CursosProfesores.IDCurso
JOIN
    Profesores ON CursosProfesores.IDProfesor = Profesores.IDProfesor;

SELECT
    Profesores.IDProfesor,
    Profesores.Nombre AS NombreProfesor,
    Profesores.Apellido AS ApellidoProfesor,
    Cursos.IDCurso,
    Cursos.NombreCurso
FROM
    Profesores
JOIN
    CursosProfesores ON Profesores.IDProfesor = CursosProfesores.IDProfesor
JOIN
    Cursos ON CursosProfesores.IDCurso = Cursos.IDCurso;

SELECT
    Estudiantes.IDEstudiante,
    Estudiantes.Nombre AS NombreEstudiante,
    Estudiantes.Apellido AS ApellidoEstudiante,
    Grados.IDGrado,
    Grados.NombreGrado
FROM
    Estudiantes
JOIN
    Grados ON Estudiantes.IDGrado = Grados.IDGrado;

SELECT
    Estudiantes.IDEstudiante,
    Estudiantes.Nombre AS NombreEstudiante,
    Estudiantes.Apellido AS ApellidoEstudiante,
    Secciones.IDSeccion,
    Secciones.NombreSeccion
FROM
    Estudiantes
JOIN
    Secciones ON Estudiantes.IDSeccion = Secciones.IDSeccion;

SELECT
    Estudiantes.IDEstudiante,
    Estudiantes.Nombre AS NombreEstudiante,
    Estudiantes.Apellido AS ApellidoEstudiante,
    Materias.IDMateria,
    Materias.NombreMateria,
    NotasPorParcial.Nota
FROM
    Estudiantes
JOIN
    NotasPorParcial ON Estudiantes.IDEstudiante = NotasPorParcial.IDEstudiante
JOIN
    Materias ON NotasPorParcial.IDMateria = Materias.IDMateria
WHERE
    Estudiantes.DNI = 12345678;  
select * from Estudiantes;


SELECT
    Estudiantes.IDEstudiante,
    Estudiantes.Nombre AS NombreEstudiante,
    Estudiantes.Apellido AS ApellidoEstudiante,
    Materias.NombreMateria,
    NotasPorParcial.Parcial,
    NotasPorParcial.Nota
FROM
    Estudiantes
JOIN
    NotasPorParcial ON Estudiantes.IDEstudiante = NotasPorParcial.IDEstudiante
JOIN
    Materias ON NotasPorParcial.IDMateria = Materias.IDMateria
JOIN
    Inscripciones ON Estudiantes.IDEstudiante = Inscripciones.IDEstudiante
JOIN
    Cursos ON Inscripciones.IDCurso = Cursos.IDCurso
JOIN
    AnioEscolar ON Inscripciones.IDAnioEscolar = AnioEscolar.IDAnioEscolar
WHERE
    Cursos.IDCurso = 2
    AND NotasPorParcial.Parcial = 1;
    
    
    
    
    
    
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
CREATE TABLE Secciones (
  IDSeccion INT AUTO_INCREMENT PRIMARY KEY,
  NombreSeccion VARCHAR(50),
  IDGrado INT,  -- Agregar esta línea para establecer la relación con Grados
  FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado)
);
ALTER TABLE Secciones
ADD COLUMN IDGrado INT,
ADD CONSTRAINT fk_secciones_grados FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado);
SELECT 
    Estudiantes.IDEstudiante,
    Estudiantes.Nombre AS NombreEstudiante,
    Cursos.IDCurso,
    Cursos.NombreCurso,
    AnioEscolar.AnioInicio,
    AnioEscolar.AnioFin
FROM 
    Estudiantes
JOIN 
    Inscripciones ON Estudiantes.IDEstudiante = Inscripciones.IDEstudiante
JOIN 
    Cursos ON Inscripciones.IDCurso = Cursos.IDCurso
JOIN 
    AnioEscolar ON Inscripciones.IDAnioEscolar = AnioEscolar.IDAnioEscolar;

select * from Inscripciones;
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
select * from estudiantes;
INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado)
VALUES
(32333444, 'Mati', 'Apellido6', '2000-01-01', 'Dirección6', '111111111', 'estudiante6@email.com', 'F', 1, 2);

-- Modificar la tabla Secciones para incluir la columna IDGrado
ALTER TABLE Secciones
ADD COLUMN IDGrado INT,
ADD CONSTRAINT fk_secciones_grados FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado);

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
    Secciones ON Estudiantes.IDSeccion = Secciones.IDSeccion;


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
    
-- Para el estudiante con IDEstudiante igual a 1, en la materia Matemáticas, parcial 2
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota)
VALUES (2, 1, 3, 10);

-- Para el estudiante con IDEstudiante igual a 1, en la materia Lenguaje, parcial 2
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota)
VALUES (1, 2, 2, 8);

-- Puedes seguir añadiendo registros para otros estudiantes, materias, parciales y notas según sea necesario.


-- Insertar dos estudiantes más en la tabla Estudiantes para la Materia Matemáticas
INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado)
VALUES
(45244555, 'PRUEBA', 'Apellido3', '1997-07-07', 'Dirección3', '345678901', 'estudiante3@email.com', 'M', 3, 3);

-- Inscribir a los nuevos estudiantes en el Curso de Matemáticas
INSERT INTO Inscripciones (IDEstudiante, IDCurso, IDAnioEscolar)
VALUES
(18, 1, 1);

-- Para el estudiante con IDEstudiante igual a 5 (Estudiante3), en la materia de Matemáticas, parcial 1
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota)
VALUES (18, 1, 1, 8);

select * from Inscripciones;
select materias;
-- Para el estudiante con IDEstudiante igual a 6 (Estudiante4), en la materia de Matemáticas, parcial 1
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota)
VALUES (6, 1, 1, 7);

select * from Materias;

update Grados
	set NombreGrado = '4to año'
    where IDGrado = 4;

SELECT *
FROM Grados;

-- Obtener información del profesor
SELECT
    Profesores.IDProfesor,
    Profesores.Nombre AS NombreProfesor,
    Profesores.Apellido AS ApellidoProfesor,
    Cursos.IDCurso,
    Cursos.NombreCurso,
    Materias.IDMateria,
    Materias.NombreMateria
FROM
    Profesores
JOIN
    CursosProfesores ON Profesores.IDProfesor = CursosProfesores.IDProfesor
JOIN
    Cursos ON CursosProfesores.IDCurso = Cursos.IDCurso
JOIN
    Materias ON Cursos.IDMateria = Materias.IDMateria;
select * from Materias;
SELECT
    Profesores.Nombre AS NombreProfesor,
    Profesores.Apellido AS ApellidoProfesor,
    Materias.NombreMateria
FROM
    Profesores
JOIN
    CursosProfesores ON Profesores.IDProfesor = CursosProfesores.IDProfesor
JOIN
    Cursos ON CursosProfesores.IDCurso = Cursos.IDCurso
JOIN
    Materias ON Cursos.IDMateria = Materias.IDMateria;
    
    select * from Materias;
    select * from Profesores;
    select * from CursosProfesores;
    
    INSERT INTO Profesores (Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero)
VALUES ('Pedro', 'Gómez', '1985-05-15', 'Calle 123, Ciudad', '123456789', 'pedro.gomez@example.com', 'M');


-- Insertar una nueva materia con ID específico (ID = 10)
INSERT INTO Materias (IDMateria, NombreMateria)
VALUES (10, 'Base de Datos');

-- Insertar un nuevo profesor con ID específico (ID = 10)
INSERT INTO Profesores (IDProfesor, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero)
VALUES (10, 'NombreProfesor', 'ApellidoProfesor', '1980-01-01', 'DirecciónProfesor', '123456789', 'profesor@ejemplo.com', 'M');

-- Insertar un nuevo curso de base de datos con ID específico (ID = 10), asignando la nueva materia y el nuevo profesor
INSERT INTO Cursos (IDCurso, NombreCurso, IDMateria)
VALUES (10, 'Curso de Base de Datos', 10);

-- Insertar la relación en la tabla CursosProfesores con ID específico (ID = 10)
INSERT INTO CursosProfesores (IDCursoProfesor, IDCurso, IDProfesor)
VALUES (10, 10, 10);

select * from Cursos;

-- Eliminar la tabla Materias
DROP TABLE Materias;

-- Modificar la tabla Cursos para incluir la columna IDMateria
ALTER TABLE Cursos
ADD COLUMN IDMateria INT,
ADD CONSTRAINT fk_cursos_materias FOREIGN KEY (IDMateria) REFERENCES Materias(IDMateria);

-- Insertar una nueva materia con ID específico (ID = 10) en la tabla Cursos
INSERT INTO Cursos (IDCurso, NombreCurso, IDMateria)
VALUES (10, 'Curso de Base de Datos', 10);

-- Insertar la relación en la tabla CursosProfesores con ID específico (ID = 10)
INSERT INTO CursosProfesores (IDCursoProfesor, IDCurso, IDProfesor)
VALUES (10, 10, 10);

