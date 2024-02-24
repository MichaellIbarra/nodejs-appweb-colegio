create database cni_crud;
use cni_crud;
CREATE TABLE MENSAJE (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    asunto VARCHAR(255) NOT NULL,
    contenido_mensaje VARCHAR(255) NOT NULL,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE PERSONA (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(90) NOT NULL,
    correo_electronico VARCHAR(255) NOT NULL,
    numero_celular CHAR(9),
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mensaje_id INT,
    FOREIGN KEY (mensaje_id) REFERENCES MENSAJE(id_mensaje)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

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


-- tabla de fecha_civicos
CREATE TABLE fecha_civicas (
  id_fecha INT NOT NULL AUTO_INCREMENT,
  imagen VARCHAR(255) NOT NULL,
  nombre VARCHAR(60) NOT NULL,
  descripcion VARCHAR(90),
  fecha DATE NOT NULL,
  PRIMARY KEY (id_fecha)
);

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

