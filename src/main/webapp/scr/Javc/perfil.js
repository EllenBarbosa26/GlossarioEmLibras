function limitarPalavrasEditar() {
    var textarea = document.getElementById('novotextobio');
    var contagemPalavras = document.getElementById('contagem-palavras');
    
    var palavras = textarea.value.split(/\s+/).filter(function(word) {
        return word.length > 0;
    });

    if (palavras.length > 20) {
        textarea.value = palavras.slice(0, 20).join(" ");
    }

    contagemPalavras.textContent = palavras.length + '/20 palavras';
}



document.addEventListener('DOMContentLoaded', function () {
    var inputNome = document.getElementById('novonome');
    var h1Usuario = document.querySelector('.usuario');
    

    var textareaBio = document.getElementById('novotextobio');
    var pTextodabio = document.querySelector('.textodabio');
    var usuariosidebar = document.querySelector('.usuariosidebar');

    // Restaurar valores do armazenamento local, se disponíveis
    inputNome.value = localStorage.getItem('NovoNome') || '';
    textareaBio.value = localStorage.getItem('BioTexto') || '';

    // Adicionar evento de entrada para campos
    inputNome.addEventListener('input', function () {
        h1Usuario.textContent = '@' + inputNome.value;
        usuariosidebar.textContent = '@' + inputNome.value;
        // Salvar valor no armazenamento local
        localStorage.setItem('NovoNome', inputNome.value);
    });

    textareaBio.addEventListener('input', function () {
        pTextodabio.textContent = textareaBio.value;
        // Salvar valor no armazenamento local
        localStorage.setItem('BioTexto', textareaBio.value);
    });
});


document.addEventListener('DOMContentLoaded', function() {
    var conteinareditar = document.querySelector('.conteinareditar');
    var xsair = document.querySelector('.x-sair');
    var editarperfil = document.querySelector('.editar-perfil');
    var submitbutton = document.querySelector('.submitbutton');

    xsair.addEventListener('click', Editarperfiltestsair);
    editarperfil.addEventListener('click', Editarperfiltestentra);
    submitbutton.addEventListener('click', Editarperfiltestsubmr)
    
    function Editarperfiltestentra(){
        conteinareditar.style.display = 'block';
    }

    function Editarperfiltestsair(){
        conteinareditar.style.display = 'none';
    }

    function Editarperfiltestsubmr(){
        if (submitbutton == true) {
            conteinareditar.style.display = 'none';
        } 
    }
})


function openFileUploader() {
    document.getElementById('uploadInput').click();
}


document.addEventListener('DOMContentLoaded', function() {
    let isDragging = false;
    let initialX, initialY;
    const div = document.getElementById('minhaDiv');
    const marginX = parseInt(window.getComputedStyle(div).marginLeft, 10) || 0;
    const marginY = parseInt(window.getComputedStyle(div).marginTop, 10) || 0;

    div.addEventListener('mousedown', (event) => {
        isDragging = true;
        initialX = event.clientX - div.getBoundingClientRect().left;
        initialY = event.clientY - div.getBoundingClientRect().top;
        div.style.cursor = 'grabbing'; // Muda o cursor durante o arraste
    });

    document.addEventListener('mousemove', (event) => {
        if (isDragging) {
            const newX = event.clientX - initialX - marginX;
            const newY = event.clientY - initialY - marginY;
            div.style.left = newX + 'px';
            div.style.top = newY + 'px';
        }
    });

    document.addEventListener('mouseup', () => {
        isDragging = false;
        div.style.cursor = 'grab';
    });
});



