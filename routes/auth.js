const express = require('express');
const router = express.Router();

// router.get('/login', function (req, res) {
//     res.render("login", { error: null });
// });

router.get("/logout", (req, res) => {
    if (req.session) {
        req.session.destroy(err => {
            if (err) {
                console.error("Error al cerrar sesión: " + err.message);
                res.status(500).send("Error interno del servidor");
            } else {
                res.redirect("/login");
            }
        });
    } else {
        res.redirect("/login");
    }
});


router.get("/notas", (req, res, next) => {
    if (!req.session || !req.session.estudiante) {
        // Redirigir a la página de inicio de sesión si no ha iniciado sesión
        return res.redirect("/login");
    }
    res.render("notas", { estudiante: req.session.estudiante, notasPorCurso }); // Pasar la variable estudiante desde la sesión
});

module.exports = router;