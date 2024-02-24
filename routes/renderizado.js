const express = require('express');
const router = express.Router();
const conex = require('../config/database')

function obtenerFechasCivicasYRenderizarVista(res, vista) {
    const obtenerFechasCivicas = "SELECT * FROM fecha_civicas ";
    conex.query(obtenerFechasCivicas, function (error, resultados) {
        if (error) {
            throw error;
        } else {
            const fechasCivicasDelDia = resultados;
            res.render(vista, { fechasCivicas: fechasCivicasDelDia });
        }
    });
} 


router.get('/', (req, res) => obtenerFechasCivicasYRenderizarVista(res, 'index') )
router.get('/contacto', (req, res) => obtenerFechasCivicasYRenderizarVista(res, 'contacto'))
router.get('/docentes', (req, res) => obtenerFechasCivicasYRenderizarVista(res, 'docentes'))
router.get('/noticias', (req, res) => obtenerFechasCivicasYRenderizarVista(res, 'noticias'))
router.get('/gestion', (req, res) => obtenerFechasCivicasYRenderizarVista(res, 'gestion'))
router.get('/quienes-somos', (req, res) => obtenerFechasCivicasYRenderizarVista(res, 'quienes-somos'))




module.exports = router;

