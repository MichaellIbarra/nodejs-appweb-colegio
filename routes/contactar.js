const moment = require("moment-timezone");
const express = require('express');
const router = express.Router();
const conex = require('../config/database')


router.post("/contactar", (req, res) => {
    const { asunto, contenido_mensaje, nombre_completo, correo_electronico, numero_celular } = req.body;
    const fecha_envio = moment().tz("America/Lima").format("YYYY-MM-DD HH:mm:ss");
    const InfoMensaje = { asunto, contenido_mensaje, fecha_envio }
    const insertarMensaje = "INSERT INTO MENSAJE set ?";
    conex.query(insertarMensaje, [InfoMensaje], (err, data) => {
        if (err) throw err;
        const InfoPersona = { nombre_completo, correo_electronico, numero_celular, mensaje_id: data.insertId, fecha_envio }
        const insertarPersona = "INSERT INTO PERSONA set ?";
        conex.query(insertarPersona, [InfoPersona], (err) => {
            if (err) throw err;
            console.log(req.body, 'Datos guardados');
            res.redirect('back');
        });
    });

});

module.exports = router;
