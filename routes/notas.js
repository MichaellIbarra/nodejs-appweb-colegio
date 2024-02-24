const express = require('express');
const router = express.Router();
const conex = require('../config/database')

router.post("/notas", (req, res) => {
    const nombre = req.body.nombre;
    const dni = req.body.dni;

    const estudianteQuery = `
      SELECT
        Estudiantes.IDEstudiante,
        Estudiantes.Nombre AS NombreEstudiante,
        Estudiantes.Apellido AS ApellidoEstudiante,
        Estudiantes.FechaNacimiento,
        Estudiantes.Telefono,
        Estudiantes.Email,
        Secciones.IDSeccion,
        Secciones.NombreSeccion,
        Grados.IDGrado,
        Grados.NombreGrado
      FROM
        Estudiantes
      LEFT JOIN
        Secciones ON Estudiantes.IDSeccion = Secciones.IDSeccion
      LEFT JOIN
        Grados ON Estudiantes.IDGrado = Grados.IDGrado
      WHERE
        Estudiantes.DNI = ? AND Estudiantes.Email = ?;
    `;

    conex.query(estudianteQuery, [dni, nombre], (errEstudiante, resultadoEstudiante) => {
        if (errEstudiante) {
            console.error("Error al obtener información del estudiante: " + errEstudiante.message);
            return res.render("login", { error: "Error interno del servidor." });
        }

        const estudiante = resultadoEstudiante[0];

        if (!estudiante) {
            return res.render("login", { error: "Nombre o DNI incorrectos. Verifica tus credenciales.s" });
        }

        const notasQuery = `
            SELECT
                Estudiantes.IDEstudiante,
                Estudiantes.Nombre AS NombreEstudiante,
                Estudiantes.Apellido AS ApellidoEstudiante,
                Cursos.IDCurso,
                Cursos.NombreCurso AS NombreCurso,
                Profesores.Nombre AS NombreProfesor,
                NotasPorParcial.Nota,
                NotasPorParcial.Parcial
            FROM
                Estudiantes
            JOIN 
                NotasPorParcial ON Estudiantes.IDEstudiante = NotasPorParcial.IDEstudiante
            JOIN
                Cursos ON NotasPorParcial.IDMateria = Cursos.IDCurso
            JOIN
                CursosProfesores ON Cursos.IDCurso = CursosProfesores.IDCurso
            JOIN
                Profesores ON CursosProfesores.IDProfesor = Profesores.IDProfesor
            WHERE
                Estudiantes.DNI = ?;
        `;

        conex.query(notasQuery, [dni], (errNotas, resultadosNotas) => {
            if (errNotas) {
                console.error("Error al obtener las notas: " + errNotas.message);
                return res.render("login", { error: "Error interno del servidor." });
            }

            const notas = resultadosNotas;

            const notasPorCurso = notas.reduce((acc, nota) => {
                const existingCurso = acc.find(item => item.IDCurso === nota.IDCurso);
                if (existingCurso) {
                    existingCurso.Notas.push({ Nota: nota.Nota, Parcial: nota.Parcial });
                } else {
                    acc.push({
                        IDCurso: nota.IDCurso,
                        NombreCurso: nota.NombreCurso,
                        NombreProfesor: nota.NombreProfesor,
                        Notas: [{ Nota: nota.Nota, Parcial: nota.Parcial }]
                    });
                }
                return acc;
            }, []);

            res.render("notas", { estudiante, notasPorCurso });
        });

    });
});

module.exports = router;