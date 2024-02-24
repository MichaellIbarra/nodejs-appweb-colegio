var spreadsheetId = '1EhY76U3tBN2u4Ite2wa4loqlOav9_s_rD1QpLyL1Oog', hoja = 'Respuestas de formulario 1';

function extractDriveImageUrl(cellValue) {
    var imageRegex = /https:\/\/drive\.google\.com\/open\?id=([\w-]+)/;
    var videoRegex = /https:\/\/drive\.google\.com\/file\/d\/([\w-]+)\/view/;
    var imageMatches = cellValue.match(imageRegex);
    var videoMatches = cellValue.match(videoRegex);
    if (imageMatches && imageMatches.length > 1) {
        var imageId = imageMatches[1];
        return `https://drive.google.com/file/d/${imageId}/preview`; // Cambio aquí
    }
    if (videoMatches && videoMatches.length > 1) {
        var videoId = videoMatches[1];
        return `https://drive.google.com/file/d/${videoId}/preview`;
    }
    return '';
}
var apiKey = 'AIzaSyDnWjAbEwleOjTecK8wD8ifbasGkx7LONE', url = `https://sheets.googleapis.com/v4/spreadsheets/${spreadsheetId}/values/${hoja}?key=${apiKey}`;

fetch(url)
    .then(response => response.json())
    .then(data => {
        var newsHTML = '';
        if (data.values && data.values.length > 0) {
            for (var i = 1; i < data.values.length; i++) {
                var fila = data.values[i];
                var fotoOVideo = extractDriveImageUrl(fila[2]);
                var titulo = fila[3];
                var descripcion = fila[4];
                var categoria = fila[5];

                // Construir el HTML para cada noticia
                newsHTML += `<div class="col-md-4 mb-4">
                                <div class="card text-center">
                                <a href="${fotoOVideo}" target="_blank"><iframe style="margin-bottom: 10px;" width="290" height="200" src="${fotoOVideo}" alt="Dar Click"></iframe>
                                </a>
                                    <div class="card-body">
                                        <h4 class="card-title">${titulo}</h4>
                                        <p class="card-text" style="
                                        color: #000;
                                    ">${descripcion}</p>
                                        <p class="card-text"><small class="text-muted">${categoria}</small></p>
                                    </div>
                                </div>
                            </div>`;
            }
        } else {
            newsHTML = '<p>No se encontraron resultados.</p>';
        }
        document.getElementById('newsContainer').innerHTML = newsHTML;
    })
    .catch(error => console.error('Error al obtener los datos:', error));
