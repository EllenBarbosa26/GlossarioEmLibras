function copyText(button) {
    var text = button.innerText.trim(); // Obtém o texto dentro do botão
    navigator.clipboard.writeText(text); // Copia o texto para a área de transferência
    button.classList.add('clicked'); // Adiciona uma classe para destacar visualmente o botão clicado

    // Remove a classe de destaque após 1 segundo
    setTimeout(function() {
        button.classList.remove('clicked');
    }, 1000);
    alert('Texto copiado para a área de transferência: ' + text);
}