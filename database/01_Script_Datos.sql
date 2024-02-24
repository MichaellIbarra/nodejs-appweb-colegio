
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

-- Insertar datos de muestra en la tabla Grados
INSERT INTO Grados (NombreGrado) VALUES
('Primero'),
('Segundo'),
('Tercero'),
('Cuarto');

-- Insertar datos de muestra en la tabla Secciones
INSERT INTO Secciones (NombreSeccion, IDGrado) VALUES
('A', 1),
('B', 1),
('A', 2),
('B', 2);

-- Insertar datos de muestra en la tabla Estudiantes
INSERT INTO Estudiantes (DNI, Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero, IDSeccion, IDGrado) VALUES
(12345678, 'Juan', 'Perez', '2000-01-15', 'Calle 123', '123456789', 'juan@example.com', 'Masculino', 1, 1),
(23456789, 'Maria', 'Lopez', '2001-05-20', 'Calle 456', '987654321', 'maria@example.com', 'Femenino', 2, 1),
(34567890, 'Carlos', 'Gomez', '1999-11-10', 'Calle 789', '456789012', 'carlos@example.com', 'Masculino', 3, 2);

-- Insertar datos de muestra en la tabla Cursos
INSERT INTO Cursos (NombreCurso, IDGrado) VALUES
('Matemáticas', 1),
('Ciencias', 1),
('Lenguaje', 2),
('Historia', 2);

-- Insertar datos de muestra en la tabla Profesores
INSERT INTO Profesores (Nombre, Apellido, FechaNacimiento, Direccion, Telefono, Email, Genero) VALUES
('Laura', 'García', '1980-03-25', 'Calle 987', '654321098', 'laura@example.com', 'Femenino'),
('Roberto', 'Martínez', '1975-08-12', 'Calle 654', '321098765', 'roberto@example.com', 'Masculino');

-- Insertar datos de muestra en la tabla CursosProfesores
INSERT INTO CursosProfesores (IDCurso, IDProfesor, IDSeccion, IDGrado) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 1, 1, 2),
(4, 2, 2, 2);

-- Insertar datos de muestra en la tabla Inscripciones
INSERT INTO Inscripciones (IDEstudiante, IDCurso) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insertar datos de muestra en la tabla NotasPorParcial
INSERT INTO NotasPorParcial (IDEstudiante, IDMateria, Parcial, Nota) VALUES
(1, 1, 1, 90),
(1, 2, 1, 85),
(2, 3, 1, 88),
(2, 4, 1, 92),
(3, 1, 1, 78),
(3, 2, 1, 80);
