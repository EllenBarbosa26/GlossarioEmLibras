function limitarPalavrasCategoria() {
    var input = document.getElementById('Nome-categoria');
    var contagemPalavras = document.getElementById('contagem-palavras-Categoria');

    var palavras = input.value.split(/\s+/).filter(function (word) {
        return word.length > 0;
    });

    if (palavras.length > 4) {
        input.value = palavras.slice(0, 4).join(" ");
        palavras = palavras.slice(0, 4);
    }

    contagemPalavras.textContent = palavras.length + '/4 palavras';
}

function openFileUploaderCategoria() {
    document.getElementById('uploadInput').click();
}

document.addEventListener('DOMContentLoaded', function () {
    var sairpublicacao = document.querySelectorAll('.icon-x-categoria');
    var conteinerpublicacao = document.querySelectorAll('.conteiner-Nova-Categoria');
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