function copyText(text) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    alert('Texto copiado para a área de transferência: ' + text);
}

document.addEventListener('DOMContentLoaded', function () {
    const boxtipos = document.querySelectorAll('.boxtipos');
    const boxInformacoes = document.querySelectorAll('.box-imformacao');

    boxtipos.forEach(function (boxtipo, index) {
        boxtipo.addEventListener('click', function () {
            // Mostra apenas a correspondente
            boxInformacoes.forEach(function (boxInfo) {
                boxInfo.classList.remove('show');
            });
            boxInformacoes[index].classList.add('show');
        });
    });

    const iconXBox = document.querySelectorAll('.icon-x-box');

    iconXBox.forEach(function (icon, index) {
        icon.addEventListener('click', function () {
            // Oculta a box-imformacao ao clicar no ícone de fechar
            boxInformacoes[index].classList.remove('show');
        });
    });
});