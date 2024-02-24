const express = require('express');
const router = express.Router();
const conex = require('../config/database')
// Agrega este nuevo endpoint en tu archivo index.js
router.post('/votar', function (req, res) {
    const { idPublicacion, tipoVoto } = req.body;

    // Actualiza la base de datos según el tipo de voto
    const actualizarVotoQuery = `UPDATE Publicaciones SET ${tipoVoto} = ${tipoVoto} + 1 WHERE idPubli = ?`;

    conex.query(actualizarVotoQuery, [idPublicacion], function (error, results) {
        if (error) {
            console.error('Error al actualizar el voto:', error);
            res.status(500).send('Error interno del servidor');
        } else {
            // Después de actualizar, redirige de nuevo a la página de publicaciones
            res.redirect('/publicaciones');
        }
    });
});


module.exports = router;