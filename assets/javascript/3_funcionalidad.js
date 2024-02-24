//funcionalidad #3 
// hacer que tenga un dos botones que diga un anterior y otro siguiente para que se muestren diferentes imagenes
let imagenes = ["/images/CNI_Marchando.webp", "/images/fotos-cni/cancha.jpeg", "/images/fotos-cni/jardín.jpeg"];
let indice = 0;

function mostrarImagen() {
    document.getElementById("imagenMostrada").src = imagenes[indice];
}

function siguienteImagen() {
    if (indice < imagenes.length - 1) {
        indice++;
    } else {
        indice = 0;
    }
    mostrarImagen();
}

function imagenAnterior() {
    if (indice > 0) {
        indice--;
    } else {
        indice = imagenes.length - 1;
    }
    mostrarImagen();
}

mostrarImagen();
document.getElementById("botonSiguiente").addEventListener("click", siguienteImagen);
document.getElementById("botonAnterior").addEventListener("click", imagenAnterior);
