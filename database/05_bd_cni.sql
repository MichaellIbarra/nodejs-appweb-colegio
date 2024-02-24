-- SCRIPT DE ESTRCUTURA =================================================
create database cni_crud;
use cni_crud;

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

SELECT 
    p.id_persona,
    p.nombre_completo,
    p.correo_electronico,
    p.numero_celular,
    m.id_mensaje,
    m.asunto,
    m.contenido_mensaje,
    m.fecha_envio
FROM PERSONA p
INNER JOIN MENSAJE m ON p.mensaje_id = m.id_mensaje;

-- !==== TABLA DE FECHA CIVICAS ====

CREATE TABLE fecha_civicas (
  id_fecha INT NOT NULL AUTO_INCREMENT,
  imagen TEXT NOT NULL,
  nombre VARCHAR(60) NOT NULL,
  descripcion VARCHAR(90),
  fecha DATE NOT NULL,
  PRIMARY KEY (id_fecha)
);
 
-- !==== REGISTRO DE FECHA CIVICAS ====
INSERT INTO fecha_civicas (imagen, nombre, fecha, descripcion) VALUES
('', '', '2023-12-25', '');


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

-- SCRIPT DE DATOS =================================================


-- Insertar 10 registros en la tabla MENSAJE
INSERT INTO MENSAJE (asunto, contenido_mensaje) VALUES
('Reunión de Padres', 'Queremos recordarles sobre la reunión de padres que tendrá lugar el próximo martes.'),
('Información Importante', 'Les informamos sobre los cambios en el horario de clases a partir de la próxima semana.'),
('Evento Escolar', 'Invitamos a todos los estudiantes y sus familias al evento escolar que se llevará a cabo este viernes.'),
('Recordatorio de Pago', 'Recordamos a los padres que el pago de la mensualidad debe realizarse antes del final de la semana.'),
('Encuesta de Satisfacción', 'Les pedimos que completen la encuesta de satisfacción para mejorar nuestros servicios.'),
('Actualización de Contacto', 'Solicitamos a los padres que actualicen la información de contacto en la oficina escolar.'),
('Felices Fiestas', 'Les deseamos a todos unas felices fiestas y un próspero año nuevo.'),
('Evento Deportivo', 'Animamos a los estudiantes a participar en el torneo deportivo el próximo mes.'),
('Convocatoria a Reunión', 'Convocamos a una reunión de la asociación de padres y maestros para discutir temas importantes.'),
('Mensaje de Bienvenida', 'Damos la bienvenida a todos los nuevos estudiantes y sus familias al inicio del nuevo año escolar.');

-- Insertar 10 registros en la tabla PERSONA
INSERT INTO PERSONA (nombre_completo, correo_electronico, numero_celular, mensaje_id) VALUES
('Juan Pérez', 'juan@example.com', '123456789', 1),
('María López', 'maria@example.com', '987654321', 2),
('Carlos Gómez', 'carlos@example.com', '456789012', 3),
('Laura García', 'laura@example.com', '654321098', 4),
('Roberto Martínez', 'roberto@example.com', '321098765', 5),
('Ana Rodríguez', 'ana@example.com', '789012345', 6),
('Pedro Sánchez', 'pedro@example.com', '567890123', 7),
('Sofía Ramírez', 'sofia@example.com', '890123456', 8),
('Javier Torres', 'javier@example.com', '234567890', 9),
('Luisa García', 'luisa@example.com', '432109876', 10);

-- Insertar 10 registros en la tabla fecha_civicas
INSERT INTO fecha_civicas (imagen, nombre, descripcion, fecha) VALUES
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día de la Independencia', 'Celebración nacional del día de la independencia.', '2023-07-04'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día del Maestro', 'Homenaje a los maestros por su labor educativa.', '2023-09-15'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día del Estudiante', 'Celebración para reconocer a los estudiantes.', '2023-11-17'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día de la Madre', 'Homenaje a las madres en su día especial.', '2023-05-14'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día del Padre', 'Reconocimiento a los padres en su día especial.', '2023-06-18'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Aniversario del Colegio', 'Celebración del aniversario de fundación del colegio.', '2023-02-28'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día de la Tierra', 'Concientización sobre la importancia del medio ambiente.', '2023-04-22'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día Internacional de la Mujer', 'Reconocimiento a las mujeres en su día.', '2023-03-08'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día del Libro', 'Celebración del Día Mundial del Libro.', '2023-04-23'),
('https://th.bing.com/th/id/OIP.b00ta5OWwLBvuGt7ZloNtAHaHa?rs=1&pid=ImgDetMain', 'Día de Acción de Gracias', 'Celebración tradicional para dar gracias.', '2023-11-23');

-- Insertar 10 registros en la tabla Comentarios

INSERT INTO Comentarios (correo, nombre_completo, comentario, NSecretaria, SResponde)
VALUES
    ('estudiante1@example.com', 'Estudiante Uno', 'Excelente colegio', 'Secretaría Uno', 'Gracias por tus comentarios'),
    ('padre2@example.com', 'Padre Dos', 'Me gustaría más información sobre las actividades extracurriculares', 'Secretaría Dos', 'Claro, te proporcionaremos la información solicitada'),
    ('profesor3@example.com', 'Profesor Tres', 'Felicidades a todos los estudiantes por sus logros académicos', 'Secretaría Tres', 'Gracias por tu apoyo'),
    ('otro4@example.com', 'Otro Cuatro', '¿Cuál es el procedimiento para la inscripción?', 'Secretaría Cuatro', 'Puedes obtener la información en nuestro sitio web o visitando la secretaría'),
    ('estudiante5@example.com', 'Estudiante Cinco', '¡El colegio CNI es el mejor!', 'Secretaría Cinco', 'Nos alegra que lo disfrutes'),
    ('padre6@example.com', 'Padre Seis', '¿Habrá eventos próximamente?', 'Secretaría Seis', 'Sí, estamos planeando varios eventos. Mantente atento a nuestras comunicaciones'),
    ('profesor7@example.com', 'Profesor Siete', '¡Enseñar en el CNI es un placer!', 'Secretaría Siete', 'Agradecemos tu dedicación'),
    ('otro8@example.com', 'Otro Ocho', 'Me gustaría hacer una sugerencia para mejorar la infraestructura', 'Secretaría Ocho', 'Apreciamos tu sugerencia y la tomaremos en cuenta'),
    ('estudiante9@example.com', 'Estudiante Nueve', '¿Cómo puedo participar en los clubes escolares?', 'Secretaría Nueve', 'Puedes unirte a los clubes durante el período de inscripciones'),
    ('padre10@example.com', 'Padre Diez', 'Gracias por la organización de la excursión', 'Secretaría Diez', 'Nos alegra que hayas disfrutado la excursión');


