const moment = require("moment-timezone");

const express = require('express');
const router = express.Router();
const conex = require('../config/database')
// Ruta para manejar el envío del formulario
router.post('/guardar-comentario', function (req, res) {
    const { correo, nombre_completo, comentario } = req.body;

    // Obtener la fecha actual en Lima, Perú
    const fechaActualLima = moment().tz("America/Lima").format("YYYY-MM-DD HH:mm:ss");

    // Insertar el comentario en la base de datos con la fecha actual de Lima
    const query = 'INSERT INTO Comentarios (correo, nombre_completo, comentario, fecha_hora) VALUES (?, ?, ?, ?)';
    conex.query(query, [correo, nombre_completo, comentario, fechaActualLima], (error) => {
        if (error) throw error;
        res.redirect('back');
    });
});

module.exports = router;

