 //funcionalidad #1 "ver más" mostar u Ocultar la información
 function mostrarOcultarElemento() {
    const elemento = document.getElementById("elementoOculto");
    if (elemento.style.display === "none") {
        elemento.style.display = "block";
    } else {
        elemento.style.display = "none";
    }
}