
-- !==== TABLA DE FORMULARIO DE CONTACTO ====
CREATE TABLE MENSAJE (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    asunto VARCHAR(255) NOT NULL,
    contenido_mensaje VARCHAR(255) NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE PERSONA (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(90) NOT NULL,
    correo_electronico VARCHAR(255) NOT NULL CHECK (correo_electronico REGEXP '^[A-Za-z0-9._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$'),
    numero_celular CHAR(9) CHECK (numero_celular REGEXP '^[0-9]{9}$'),
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensaje_id INT,
    FOREIGN KEY (mensaje_id) REFERENCES MENSAJE(id_mensaje)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ?==== CONSULTA DE FORMULARIO DE CONTACTO ====


-- !==== TABLA DE FECHA CIVICAS ====

CREATE TABLE fecha_civicas (
  id_fecha INT NOT NULL AUTO_INCREMENT,
  imagen TEXT NOT NULL,
  nombre VARCHAR(60) NOT NULL,
  descripcion VARCHAR(90),
  fecha DATE NOT NULL,
  PRIMARY KEY (id_fecha)
);
 



-- !==== TABLA DE COMENTARIOS ====

CREATE TABLE Comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(255) NOT NULL CHECK (correo REGEXP '^[A-Za-z0-9._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$'),
    nombre_completo VARCHAR(90) NOT NULL CHECK (nombre_completo REGEXP '^[A-Za-z ]+$'),
    comentario VARCHAR(255) NOT NULL,
    NSecretaria varchar(50),
    SResponde varchar(255),
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- !==== TABLA DE SISTEMA DE INFORMACIÓN ESCOLAR ====


-- * Tabla de Grados
CREATE TABLE Grados (
  IDGrado INT AUTO_INCREMENT PRIMARY KEY,
  NombreGrado VARCHAR(50)
);

-- * Tabla de Secciones
CREATE TABLE Secciones (
  IDSeccion INT AUTO_INCREMENT PRIMARY KEY,
  NombreSeccion VARCHAR(50),
  IDGrado INT,
  FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado)
);

-- * Tabla Estudiantes
CREATE TABLE Estudiantes (
  IDEstudiante INT AUTO_INCREMENT PRIMARY KEY,
  DNI INT(8) CHECK (LENGTH(DNI) = 8),
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  Telefono VARCHAR(9) CHECK (Telefono REGEXP '^[0-9]{9}$'),
  Email VARCHAR(50) CHECK (Email REGEXP '^[A-Za-z0-9._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$'),
  Genero VARCHAR(10),
  IDSeccion INT,
  IDGrado INT,
  FOREIGN KEY (IDSeccion) REFERENCES Secciones(IDSeccion),
  FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado)
);

-- * Tabla Cursos
CREATE TABLE Cursos (
  IDCurso INT AUTO_INCREMENT PRIMARY KEY,
  NombreCurso VARCHAR(50),
  IDGrado INT,
  FOREIGN KEY (IDGrado) REFERENCES Grados(IDGrado)
);

-- * Tabla Profesores
CREATE TABLE Profesores (
  IDProfesor INT AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(50),
  Apellido VARCHAR(50),
  FechaNacimiento DATE,
  Direccion VARCHAR(100),
  Telefono VARCHAR(9) CHECK (Telefono REGEXP '^[0-9]{9}$'),
  Email VARCHAR(50) CHECK (Email REGEXP '^[A-Za-z0-9._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$'),
  Genero VARCHAR(10)
);

-- * Tabla CursosProfesores
CREATE TABLE CursosProfesores (
  IDCursoProfesor INT AUTO_INCREMENT PRIMARY KEY,
  IDCurso INT,
  IDProfesor INT,
  FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
  FOREIGN KEY (IDProfesor) REFERENCES Profesores(IDProfesor)
);

-- * Tabla Inscripciones
CREATE TABLE Inscripciones (
  IDInscripcion INT AUTO_INCREMENT PRIMARY KEY,
  IDEstudiante INT,
  IDCurso INT,
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
  FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso)
);

-- * Tabla NotasPorParcial
CREATE TABLE NotasPorParcial (
  IDNotaParcial INT AUTO_INCREMENT PRIMARY KEY,
  IDEstudiante INT,
  IDMateria INT,
  Parcial INT,
  Nota FLOAT,
  FOREIGN KEY (IDEstudiante) REFERENCES Estudiantes(IDEstudiante),
  FOREIGN KEY (IDMateria) REFERENCES Cursos(IDCurso)
);
