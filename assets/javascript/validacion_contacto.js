document.addEventListener('DOMContentLoaded', function () {
    // Selecciona el formulario   
    const formulario = document.getElementById('contact-form');

    // Agrega un evento al formulario para manejar el envío
    formulario.addEventListener('submit', function (event) {
        // Detén el envío del formulario predeterminado
        event.preventDefault();

        // Realiza la validación de los campos
        if (validarCampos()) {
            // Si la validación es exitosa, muestra el SweetAlert
            Swal.fire({
                title: '¡Enviado!',
                text: 'Tu mensaje ha sido enviado correctamente.',
                icon: 'success',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn-success'
                }
            }).then((result) => {
                // Verifica si el usuario hizo clic en "OK"
                if (result.isConfirmed) {
                    // Envía el formulario de manera asíncrona
                    formulario.submit();
                }
            });
        }
    }); 

    // Función para validar los campos del formulario
    function validarCampos() {
        // Obtén los valores de los campos
        const nombre_completo = document.getElementById('nombre_completo').value;
        const correo_electronico = document.getElementById('correo_electronico').value;
        const asunto = document.getElementById('asunto').value;
        const numero_celular = document.getElementById('numero_celular').value;
        const contenido_mensaje = document.getElementById('contenido_mensaje').value;

        // Validación de campos vacíos
        if (nombre_completo.trim() === '' || correo_electronico.trim() === '' || asunto.trim() === '' || contenido_mensaje.trim() === '') {
            Swal.fire({
                title: 'Campos incompletos',
                text: 'Por favor, completa todos los campos.',
                icon: 'warning',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn-warning'
                }
            });
            return false;
        }

        // Validación de formato de correo electrónico
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(correo_electronico)) {
            Swal.fire({
                title: 'Formato de correo inválido',
                text: 'Por favor, ingresa una dirección de correo válida.',
                icon: 'error',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn-danger'
                }
            });
            return false;
        }

        // Validación de número de celular
        const celularRegex = /^\d{9}$/;
        if (!celularRegex.test(numero_celular)) {
            Swal.fire({
                title: 'Número de celular inválido',
                text: 'Por favor, ingresa un número de celular válido (debe ser un número y tener 9 dígitos',
                icon: 'warning',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn-warning'
                } 
            });
            return false;
        }

        // Validación de longitud del mensaje
        if (contenido_mensaje.length > 255) {
            Swal.fire({
                title: 'Mensaje demasiado largo',
                text: 'El mensaje debe tener como máximo 255 caracteres.',
                icon: 'warning',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn-warning'
                }
            });
            return false;
        }

        if (nombre_completo.length > 90) {
            Swal.fire({
                title: 'Nombre demasiado largo',
                text: 'El Nombre debe tener como máximo 90 caracteres.',
                icon: 'warning',
                confirmButtonText: 'OK',
                customClass: {
                    confirmButton: 'btn-warning'
                }
            });
            return false;
        }

        // Validación exitosa
        return true;
    }
});