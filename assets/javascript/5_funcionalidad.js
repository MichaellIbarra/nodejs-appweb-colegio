
//Precargador #4
window.addEventListener('load', function () {
    var preloader = document.getElementById('cni__preloader');

    if (preloader) {
        setTimeout(function () {
            preloader.style.opacity = '0';
            setTimeout(function () {
                preloader.style.display = 'none';
            }, 300);
        }, 500);
    }
});