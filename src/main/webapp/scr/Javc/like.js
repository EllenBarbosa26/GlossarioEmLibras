document.addEventListener('DOMContentLoaded', function() {
    // Selecione todos os elementos com a classe 'icon-sem-curtida'
    var iconsSemCurtida = document.querySelectorAll('.icon-sem-curtida');
    var iconsComCurtida = document.querySelectorAll('.icon-com-curtida');

    // Adicione eventos aos ícones sem curtida
    iconsSemCurtida.forEach(function(iconSemCurtida) {
        iconSemCurtida.addEventListener('click', function() {
            Like(iconSemCurtida);
        });
    });

    // Adicione eventos aos ícones com curtida
    iconsComCurtida.forEach(function(iconComCurtida) {
        iconComCurtida.addEventListener('click', function() {
            Dislike(iconComCurtida);
        });
    });

    function Like(icon) {
        // Use o argumento 'icon' para manipular apenas o ícone clicado
        var iconComCurtida = icon.nextElementSibling; // assumindo que o próximo elemento é o ícone com curtida

        if (icon.style.display === 'block') {
            icon.style.display = 'none';
            iconComCurtida.style.display = 'block';
        } else {
            icon.style.display = 'block';
            iconComCurtida.style.display = 'none';
        }
    }

    function Dislike(icon) {
        // Use o argumento 'icon' para manipular apenas o ícone clicado
        var iconSemCurtida = icon.previousElementSibling; // assumindo que o elemento anterior é o ícone sem curtida

        if (icon.style.display === 'block') {
            icon.style.display = 'none';
            iconSemCurtida.style.display = 'block';
        } else {
            icon.style.display = 'block';
            iconSemCurtida.style.display = 'none';
        }
    }
});
