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
    // Abrir o seletor de arquivo ao clicar no elemento com o ID 'uploadInput'
    document.getElementById('uploadInput').click();

    // Quando o usuário selecionar um arquivo, executar esta função
    document.getElementById('uploadInput').onchange = function(event) {
        // Verificar se há arquivos selecionados
        if (event.target.files.length > 0) {
            // Obter o primeiro arquivo selecionado
            const file = event.target.files[0];

            // Definir o caminho da imagem selecionada
            const imagemSelecionada = URL.createObjectURL(file);

            // Atualizar o atributo src da classe 'imagcategoria' com o caminho da imagem selecionada
            document.querySelector('.imagcategoria').src = imagemSelecionada;

            // Agora você pode fazer o que quiser com 'imagemSelecionada'
            console.log('Imagem selecionada:', imagemSelecionada);

            // Se precisar do caminho do arquivo, você pode obtê-lo usando 'file.name' ou 'file.path' (dependendo do navegador)
            console.log('Caminho do arquivo:', file.name);
        }
    };
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

        var sairApagar = document.querySelectorAll('.button-Nao');
        var conteinerApagar = document.querySelectorAll('.conteiner-Apagar-Categoria');
        var lixeira = document.querySelectorAll('.lixeira');

        sairApagar.forEach(function (sair, index) {
            sair.addEventListener('click', function () {
                conteinerApagar[index].style.display = 'none';
            });
        });

        lixeira.forEach(function (icon, index) {
            icon.addEventListener('click', function () {
                conteinerApagar[index].style.display = 'block';
            });
        });


});