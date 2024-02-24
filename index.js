// Importando modulos 
const express = require("express");
const auth = require("./routes/auth");
const renderizado = require("./routes/renderizado");
const votar = require("./routes/votar");
const comentario = require('./routes/comentario');
const notas = require("./routes/notas")
const contactar = require("./routes/contactar")
const axios = require('axios');
// Importa la configuración de la base de datos desde la carpeta config
const conex = require("./config/database");

//inicio de server
const app = express();

//settings
app.set('port', 3000);
app.set('view engine', 'ejs');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static("assets"));
// Utilizar los import 
app.use(auth);
app.use(renderizado);
app.use(votar);
app.use(comentario);
app.use(contactar);

app.use(notas);

// Función para obtener fechas cívicas y renderizar la vista
function obtenerFechasCivicasYRenderizarVista(res, vista, otrasVariables) {
    const obtenerFechasCivicas = "SELECT * FROM fecha_civicas ";
    conex.query(obtenerFechasCivicas, function (error, resultados) {
        if (error) {
            throw error;
        } else {
            const fechasCivicasDelDia = resultados;
            res.render(vista, { fechasCivicas: fechasCivicasDelDia, ...otrasVariables });
        }
    });
}

// Ruta principal
app.get('/', (req, res) => {
    const data_profesor = 'SELECT COUNT(*) as TotalProfesores FROM Profesores';
    const data_estudiante = 'SELECT COUNT(*) as TotalEstudiantes FROM Estudiantes';
    const data_cursos = 'SELECT COUNT(*) as TotalCursos FROM Cursos';

    conex.query(data_profesor, (error1, results1) => {
        if (error1) throw error1;
        conex.query(data_estudiante, (error2, results2) => {
            if (error2) throw error2;
            conex.query(data_cursos, (error3, results3) => {
                if (error3) throw error3;

                // Extrae los resultados de las consultas
                const totalProfesores = results1[0].TotalProfesores;
                const totalEstudiantes = results2[0].TotalEstudiantes;
                const totalCursos = results3[0].TotalCursos;

                // Usa la función para obtener fechas cívicas y renderizar la vista
                obtenerFechasCivicasYRenderizarVista(res, 'index', { totalProfesores, totalEstudiantes, totalCursos });
            });
        });
    });
});


app.get('/talleres', (req, res) => {
    const query = 'SELECT nombre_completo, comentario, NSecretaria, SResponde, fecha_hora FROM Comentarios';
    conex.query(query, (error, results, fields) => {
        if (error) throw error;
        // Usa la función para obtener fechas cívicas y renderizar la vista
        obtenerFechasCivicasYRenderizarVista(res, 'talleres', { comentarios: results });
    });
});

app.get('/horario', function (req, res) {
    // Obtener fechas cívicas del día actual
    const obtenerFechasCivicas = "SELECT * FROM fecha_civicas ";
    conex.query(obtenerFechasCivicas, function (error, resultados) {
        if (error) {
            throw error;
        } else {
            const fechasCivicasDelDia = resultados;
            // Renderizar la vista 'horario' y pasar las fechas cívicas
            res.render('horario', { fechasCivicas: fechasCivicasDelDia });
        }
    });
});


app.get('/login', (req, res) => {
    res.render('loginA')
});
app.get('/dashboard', (req, res) => {
    const queryFechasCivicas = 'SELECT * FROM fecha_civicas';
    const queryMensajes = `
        SELECT 
            p.id_persona,
            p.nombre_completo,
            p.correo_electronico,
            p.numero_celular,
            m.asunto,
            m.contenido_mensaje,
            m.fecha_envio
        FROM PERSONA p
        INNER JOIN MENSAJE m ON p.mensaje_id = m.id_mensaje;
    `;
    const queryComentarios = 'SELECT id, nombre_completo, correo, comentario, NSecretaria, SResponde FROM Comentarios';

    // Realizar las tres consultas en paralelo
    conex.query(queryFechasCivicas, (errorFechasCivicas, resultsFechasCivicas) => {
        if (errorFechasCivicas) {
            console.error('Error al obtener datos de fecha_civicas:', errorFechasCivicas);
            res.status(500).send('Error interno del servidor');
            return;
        }

        conex.query(queryMensajes, (errorMensajes, resultsMensajes) => {
            if (errorMensajes) {
                console.error('Error al obtener datos de mensajes:', errorMensajes);
                res.status(500).send('Error interno del servidor');
                return;
            }

            conex.query(queryComentarios, (errorComentarios, resultsComentarios) => {
                if (errorComentarios) {
                    console.error('Error al obtener datos de comentarios:', errorComentarios);
                    res.status(500).send('Error interno del servidor');
                    return;
                }

                const fechasCivicas = resultsFechasCivicas;
                const mensajes = resultsMensajes;
                const comentarios = resultsComentarios;

                // Renderizar la vista con los resultados combinados
                res.render('dashboard', { fechasCivicas, mensajes, comentarios });
            });
        });
    });
});


app.get('/modificar-fecha/:id', (req, res) => {
    const fechaId = req.params.id;

    // Asumiendo que tienes una función para obtener detalles de la fecha cívica por ID en tu base de datos
    obtenerDetallesFechaCivicaPorId(fechaId)
        .then((detalleFecha) => {
            // Verifica si se encontró la fecha cívica
            if (!detalleFecha) {
                return res.status(404).send('Fecha cívica no encontrada');
            }

            // Pasa los detalles de la fecha cívica al formulario de modificación
            res.render('modificar-fecha', {
                fechaId: detalleFecha.id_fecha,
                imagen: detalleFecha.imagen,
                nombreDeLaFecha: detalleFecha.nombre,
                descripcionDeLaFecha: detalleFecha.descripcion,
                fechaDeLaFecha: detalleFecha.fecha.toISOString().split('T')[0], // Formato de fecha: YYYY-MM-DD
            });
            console.log(detalleFecha);

        })
        .catch((error) => {
            console.error('Error al obtener detalles de la fecha cívica:', error);
            res.status(500).send('Error interno del servidor');
        });
});
// Función de ejemplo para obtener detalles del comentario por ID
function obtenerDetallesComentarioPorId(comentarioId) {
    const obtenerComentarioPorId = `
        SELECT 
            id, 
            nombre_completo, 
            correo, 
            comentario, 
            NSecretaria, 
            SResponde
        FROM Comentarios 
        WHERE id = ?;
    `;

    return new Promise((resolve, reject) => {
        conex.query(obtenerComentarioPorId, [comentarioId], (error, resultados) => {
            if (error) {
                reject(error);
            } else {
                // Devuelve el primer resultado (debería haber solo uno)
                resolve(resultados[0]);
            }
        });
    });
}


app.get('/responder-comentario/:id', (req, res) => {
    const comentarioId = req.params.id;

    // Asumiendo que tienes una función para obtener detalles del comentario por ID en tu base de datos
    obtenerDetallesComentarioPorId(comentarioId)
        .then((detalleComentario) => {
            // Verifica si se encontró el comentario
            if (!detalleComentario) {
                return res.status(404).send('Comentario no encontrado');
            }

            // Pasa los detalles del comentario al formulario de modificación
            res.render('responder', {
                comentarioId: detalleComentario.id,
                NSecretaria: detalleComentario.NSecretaria,
                SResponde: detalleComentario.SResponde,
            });
        })
        .catch((error) => {
            console.error('Error al obtener detalles del comentario:', error);
            res.status(500).send('Error interno del servidor');
        });
});
// Agrega una ruta para procesar la modificación de comentarios
app.post('/responder-comentario/:id', (req, res) => {
    const comentarioId = req.params.id;
    const NSecretaria = req.body.NSecretaria;
    const SResponde = req.body.SResponde;

    // Lógica para actualizar el comentario en la base de datos
    const actualizarComentarioQuery = 'UPDATE Comentarios SET NSecretaria = ?, SResponde = ? WHERE id = ?';

    conex.query(actualizarComentarioQuery, [NSecretaria, SResponde, comentarioId], (error, resultados) => {
        if (error) {
            console.error('Error al actualizar el comentario:', error.message);
            // Manejo de error: redirigir a una página de error o mostrar un mensaje al usuario
            res.redirect('/dashboard');
        } else {
            console.log('Comentario actualizado correctamente.');
            // Redirigir a la página principal o a la página de detalles del comentario modificado
            res.redirect('/dashboard');
        }
    });
});

// Agrega una ruta para procesar la modificación de la fecha cívica
app.post('/guardar-modificacion/:id', (req, res) => {
    const fechaId = req.params.id;
    const imagen = req.body.imagen;
    const nombre = req.body.nombre;
    const descripcion = req.body.descripcion;
    const fecha = req.body.fecha;

    // Lógica para actualizar la fecha cívica en la base de datos
    const actualizarFechaQuery = 'UPDATE fecha_civicas SET imagen= ?, nombre = ?, descripcion = ?, fecha = ? WHERE id_fecha = ?';

    conex.query(actualizarFechaQuery, [imagen, nombre, descripcion, fecha, fechaId], (error, resultados) => {
        if (error) {
            console.error('Error al actualizar la fecha cívica:', error.message);
            // Manejo de error: redirigir a una página de error o mostrar un mensaje al usuario
            res.redirect('/dashboard');
        } else {
            console.log('Fecha cívica actualizada correctamente.');
            // Redirigir a la página principal o a la página de detalles de la fecha modificada
            res.redirect('/dashboard');
        }
    });
});

// Función de ejemplo para obtener detalles de la fecha cívica por ID
function obtenerDetallesFechaCivicaPorId(fechaId) {
    const obtenerFechaCivicaPorId = 'SELECT * FROM fecha_civicas WHERE id_fecha = ?';
    return new Promise((resolve, reject) => {
        conex.query(obtenerFechaCivicaPorId, [fechaId], (error, resultados) => {
            if (error) {
                reject(error);
            } else {
                // Devuelve el primer resultado (debería haber solo uno)
                resolve(resultados[0]);
            }
        });
    });
}
// Ruta para registrar una nueva fecha cívica
app.post('/registrar-fecha', (req, res) => {
    const { imagen, nombre, descripcion, fecha } = req.body;

    // Lógica para insertar la nueva fecha cívica en la base de datos
    const registrarFechaQuery = 'INSERT INTO fecha_civicas (imagen, nombre, descripcion, fecha) VALUES (?, ?, ?, ?)';

    conex.query(registrarFechaQuery, [imagen, nombre, descripcion, fecha], (error, resultados) => {
        if (error) {
            console.error('Error al registrar la fecha cívica:', error.message);
            // Manejo de error: redirigir a una página de error o mostrar un mensaje al usuario
            res.redirect('/dashboard');
        } else {
            console.log('Fecha cívica registrada correctamente.');
            // Redirigir a la página principal o a la página de listado de fechas
            res.redirect('/dashboard');
        }
    });
});

// Ruta para eliminar una fecha cívica
app.get('/eliminar-fecha/:id', (req, res) => {
    const fechaId = req.params.id;

    // Lógica para eliminar la fecha cívica de la base de datos
    const eliminarFechaQuery = 'DELETE FROM fecha_civicas WHERE id_fecha = ?';

    conex.query(eliminarFechaQuery, [fechaId], (error, resultados) => {
        if (error) {
            console.error('Error al eliminar la fecha cívica:', error.message);
            // Manejo de error: redirigir a una página de error o mostrar un mensaje al usuario
            res.redirect('/dashboard');
        } else {
            console.log('Fecha cívica eliminada correctamente.');
            // Redirigir a la página principal o a la página de listado de fechas
            res.redirect('/dashboard');
        }
    });
});
// Agrega una ruta para procesar la eliminación de comentarios
app.get('/eliminar-comentario/:id', (req, res) => {
    const comentarioId = req.params.id;

    // Lógica para eliminar el comentario de la base de datos
    const eliminarComentarioQuery = 'DELETE FROM Comentarios WHERE id = ?';

    conex.query(eliminarComentarioQuery, [comentarioId], (error, resultados) => {
        if (error) {
            console.error('Error al eliminar el comentario:', error.message);
            // Manejo de error: redirigir a una página de error o mostrar un mensaje al usuario
            res.redirect('/dashboard');
        } else {
            console.log('Comentario eliminado correctamente.');
            // Redirigir a la página principal o a la página de listado de comentarios
            res.redirect('/dashboard');
        }
    });
});


app.post('/admin', (req, res) => {
    const { usuario, contrasena } = req.body;

    // Verificar las credenciales en la base de datos
    const query = 'SELECT * FROM secretaria WHERE usuario = ? AND contrasena = ?';
    conex.query(query, [usuario, contrasena], (error, results) => {
        if (error) {
            console.error('Error al autenticar el administrador:', error);
            res.status(500).send('Error interno del servidor');
        } else {
            if (results.length > 0) {
                // Credenciales válidas, redirigir o realizar otras acciones
                res.redirect('/dashboard');  // Cambia '/dashboard' a la ruta deseada
            } else {
                // Credenciales inválidas, mostrar mensaje de error
                res.render('loginA', { error: 'Credenciales inválidas' });
            }
        }
    });
});
//inicia el servidor
app.listen(app.get('port'), () => {
    console.log(`Conexión con el servidor: http://localhost:` + app.get('port'));
    console.log(`Conexión en el cloud: http://localhost:` + app.get('port'));
})
