document.addEventListener('DOMContentLoaded', function() {
    var h3 = document.querySelector('#login');
    var ion = document.querySelector('#iconlogin');
    var paralogar = document.querySelector('.paralogar');
    var saidelogar = document.querySelector('#saidelogar');
    var logargoogle = document.querySelector('.logargoogle');
    var iconx = document.querySelector('.iconx');
    var cadastrese = document.querySelector('.cadastrese');
    var soumoderador = document.querySelector('.soumoderador');
    var logarModerador = document.querySelector('.logarModerador');
    var iconsair = document.querySelector('.iconsair');
    var souusuario = document.querySelector('.souusuario');
    var iconsairusuario = document.querySelector('.iconsairusuario')
    var logarUsuario = document.querySelector('.logarUsuario');

    h3.addEventListener('click', toggleParalogar);
    ion.addEventListener('click', toggleParalogar);
    saidelogar.addEventListener('click', testParalogar);
    cadastrese.addEventListener('click', testParagoogle);
    iconx.addEventListener('click', testParagooglefeixar);
    soumoderador.addEventListener('click', testlogarmoderador);
    iconsair.addEventListener('click', logmoderadorsair);
    souusuario.addEventListener('click', TestlogarUsuario);
    iconsairusuario.addEventListener('click', TestlogarUsuariosair);

    

    function TestlogarUsuariosair(){
        
        logarUsuario.style.display = 'none';
    }

    function TestlogarUsuario(){
        logarUsuario.style.display = 'block';
        paralogar.style.display = 'none';
    }

    function logmoderadorsair(){
        
        logarModerador.style.display = 'none';
    }

    function testlogarmoderador(){
        logarModerador.style.display = 'block';
        paralogar.style.display = 'none';
    }

    function testParagoogle(){
        logargoogle.style.display = 'block';
        paralogar.style.display = 'none';
    }

    function testParagooglefeixar(){
        logargoogle.style.display = 'none';
    }

    function testParalogar(){
        paralogar.style.display = 'none';
    }

    function toggleParalogar() { 
     paralogar.style.display = 'block';
        
    }
});
