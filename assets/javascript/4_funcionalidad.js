//Encabezado al Hacer Scroll #5
var header = document.querySelector('.cni-header');

window.addEventListener('scroll', function () {
    var scroll = window.scrollY || document.documentElement.scrollTop;
    if (scroll < 100) {
        header.classList.remove('cni-sticky');
    } else {
        header.classList.add('cni-sticky');
    }
});