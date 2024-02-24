 // Hacer que se agrande y se haga pequeño cada dos segundo el texto  #6
 document.addEventListener('DOMContentLoaded', function () {
    const textosAnimados = document.querySelectorAll('.animacion-texto');
    textosAnimados.forEach(function (textoAnimado) {
        let creciendo = false;
        textoAnimado.style.transition = 'transform 1s ease-in-out';
        function alternarAnimacion() {
            if (creciendo) {
                textoAnimado.style.transform = 'scale(0.7)';
            } else {
                textoAnimado.style.transform = 'scale(1)';
            }
            creciendo = !creciendo;
        }
        // Iniciar la animación automáticamente en un intervalo de tiempo
        setInterval(alternarAnimacion, 2000); // Cambia cada 2 segundos (2000 milisegundos)
    });
});