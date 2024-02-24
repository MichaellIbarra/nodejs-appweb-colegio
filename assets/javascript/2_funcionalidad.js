//funcinalidad que cambie d texto cada 4 segundos en el inicio que es el titulo
const textos = [
    "Colegio Nacional de Imperial",
    "Bienvenidos al colegio CNI",
    "Colegio a nivel secundaria",
];
const titulo = document.getElementById("titulo");
let principal = 0;

function cambiarTexto() {
    titulo.textContent = textos[principal];
    principal = (principal + 1) % textos.length;
}
setInterval(cambiarTexto, 3500);

// Wrap every letter in a span
var textWrapper = document.querySelector('.ml2');
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline({ loop: true })
    .add({
        targets: '.ml2 .letter',
        scale: [4, 1],
        opacity: [0, 1],
        translateZ: 0,
        easing: "easeOutExpo",
        duration: 950,
        delay: (el, i) => 70 * i
    }).add({
        targets: '.ml2',
        opacity: 0,
        duration: 1000,
        easing: "easeOutExpo",
        delay: 1000
    });

var textWrapper = document.querySelector('.ml16');
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline({ loop: true })
    .add({
        targets: '.ml16 .letter',
        translateY: [-100, 0],
        easing: "easeOutExpo",
        duration: 1400,
        delay: (el, i) => 30 * i
    }).add({
        targets: '.ml16',
        opacity: 0,
        duration: 1000,
        easing: "easeOutExpo",
        delay: 1000
    });