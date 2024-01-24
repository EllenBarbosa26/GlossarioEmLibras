function limitarPalavrasPublicar() {
    var input = document.getElementById('Nome-video');
    var contagemPalavras = document.getElementById('contagem-palavras-publicar');
    
    var palavras = input.value.split(/\s+/).filter(function(word) {
        return word.length > 0;
    });

    if (palavras.length > 4) {
        input.value = palavras.slice(0, 4).join(" ");
        palavras = palavras.slice(0, 4);
    }

    contagemPalavras.textContent = palavras.length + '/4 palavras';
}


function limitarPalavras() {
    var textarea = document.getElementById('novocomentario');
    var contagemPalavras = document.getElementById('contagem-palavras');
    
    var palavras = textarea.value.split(/\s+/).filter(function(word) {
        return word.length > 0;
    });

    if (palavras.length > 10) {
        textarea.value = palavras.slice(0, 10).join(" ");
        palavras = palavras.slice(0, 10);
    }

    contagemPalavras.textContent = palavras.length + '/10 palavras';
}

function openFileUploader() {
    document.getElementById('uploadInput').click();
}

document.addEventListener('DOMContentLoaded', function() {
    var sidebar = document.querySelector('.sidebar');
    var lua = document.querySelector('.lua');
    var sol = document.querySelector('.sol');
    var body = document.querySelector('body');
    var suascontribuicoes = document.querySelector('.suas-contribuicoes');
    var legendabio = document.querySelector('.legenda-bio');
    var usuario = document.querySelector('.usuario');
    var conteinareditar = document.querySelector('.conteinareditar');
    var nomevideo = document.querySelector('.nomevideo');
    var icon = document.querySelector('.icon');
    var iconpublicar = document.querySelector('.icon-publicar');

    lua.addEventListener('click', Mudardecor);
    sol.addEventListener('click', Mudardecor);

    function Mudardecor() {
        if (lua.style.display == 'block') {
            lua.style.display = 'none';
            sol.style.display = 'block';
            body.style.background = 'black';
            sidebar.style.background = 'rgb(77, 67, 121)';
            suascontribuicoes.style.color = 'white';
            legendabio.style.color = 'white';
            usuario.style.color = 'white';
            conteinareditar.style.background = 'white';

        } else {
            lua.style.display = 'block';
            sol.style.display = 'none';
            body.style.background = 'white';
            sidebar.style.background = 'rgba(151, 131, 230, 1)';
            suascontribuicoes.style.color = 'black';
            legendabio.style.color = 'black';
            usuario.style.color = 'black';
            conteinareditar.style.background = '';
            nomevideo.style.color = 'white';
            usuario.style.color = 'white';
            icon.style.color = 'white';
            iconpublicar.style.color = 'white';
        }
    }
});





document.addEventListener('DOMContentLoaded', function() {
    var saircomentarios = document.querySelectorAll('.icon-x-comentario');
    var iconcomentarios = document.querySelectorAll('.icon-cometario');
    var nomesdovideo = document.querySelectorAll('.nome-do-video');
    var conteinercomentario = document.querySelector('.conteiner-comentario');

    // Adiciona eventos para cada ícone e nome do vídeo
    saircomentarios.forEach(function(saircomentario) {
        saircomentario.addEventListener('click', sairdocomentario);
    });

    iconcomentarios.forEach(function(iconcomentario) {
        iconcomentario.addEventListener('click', entrarcomentario);
    });

    nomesdovideo.forEach(function(nomevideo) {
        nomevideo.addEventListener('click', entrarcomentario);
    });

    function sairdocomentario() {
        conteinercomentario.style.display = 'none';
    }

    function entrarcomentario() {
        conteinercomentario.style.display = 'flex';
    }

    

var sairpublicacao = document.querySelectorAll('.icon-x-publicacao');
var conteinerpublicacao = document.querySelectorAll('.conteiner-publicacao');
var iconpublicar = document.querySelectorAll('.icon-publicar');

sairpublicacao.forEach(function (sair, index) {
    sair.addEventListener('click', function () {
        conteinerpublicacao[index].style.display = 'none';
    });
});

iconpublicar.forEach(function (icon, index) {
    icon.addEventListener('click', function () {
        conteinerpublicacao[index].style.display = 'block';
    });
});
});



document.addEventListener('DOMContentLoaded', function() {
    var videos = document.querySelectorAll('.video-test');

    videos.forEach(function(video) {
        video.addEventListener('click', function() {
            // Pausa todos os vídeos
            videos.forEach(function(otherVideo) {
                if (otherVideo !== video) {
                    otherVideo.pause();
                    otherVideo.currentTime = 0;
                }
            });

            // Reproduz ou pausa o vídeo clicado
            if (video.paused) {
                video.play();
            } else {
                video.pause();
                video.currentTime = 0;
            }
        });
    });
});


