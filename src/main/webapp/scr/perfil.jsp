<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>
<%@ page import="Model.Perfil" %>

<!DOCTYPE html>
<html lang="pt-br">

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Moderador moderador = (Moderador) session.getAttribute("moderador");
    Perfil perfil = (Perfil) session.getAttribute("perfil");

    if (usuario == null && moderador == null){
        response.sendRedirect("../index.jsp");
    }

    String nome;
    if (usuario != null) {
        nome = usuario.getNome();
    } else {
        nome = moderador.getNome();
    }
    String email;
    if ( usuario != null) {
        email = usuario.getEmail();
    }else {
        email = moderador.getEmail();
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="scr/css/perfilestilos.css">
    <script src="scr/Javc/perfil.js"></script>
    <script src="scr/Javc/scripttamiline.js"></script>
    <script src="scr/Javc/like.js"></script>
    <title>LibrasDev</title>

    <style>
    .icon-sair-perfil {
        font-size: 28px;
        margin-left: 10px;
        margin-top: 6px;
        cursor: pointer;
        color: rgb(112, 97, 171);
        transition: all 0.2s;
    }

    .icon-sair-perfil:hover {
        transform: scale(1.2);
    }

    .conteiner-sair-perfil{
        position: absolute;
        margin-left: 120px;
        border: solid 1px rgba(151, 131, 230, 1);
        width: 450px;
        margin-top: 20px;
        height: 170px;
        border-radius: 15px;
        background-color: rgba(255, 255, 255, 0.884);
        backdrop-filter: blur(8px);
        display: flex;
        flex-direction: column;
        align-items: center;
        max-height: 500px;
        overflow-y: auto;
        z-index: 1000;
        display: none;
    }

    .msg-sair{
        text-align: center;
    }

    .button-Nao{
        position: absolute;
        background-color: rgba(151, 131, 230, 1);
        border:none;
        width: 100px;
        height: 35px;
        border-radius: 15px;
        color: #ffffff;
        transition: transform 0.3s;
        cursor: pointer;
        margin-top: 20px;
        margin-left: 260px;
    }

    .button-Sim{
        position: absolute;
        background-color: rgba(151, 131, 230, 1);
        border:none;
        width: 100px;
        height: 35px;
        border-radius: 15px;
        color: #ffffff;
        transition: transform 0.3s;
        cursor: pointer;
        margin-top: 20px;
        margin-left: 100px;
    }

    .button-Nao:hover{
        transform: scale(1.1);
    }

    .button-Sim:hover{
        transform: scale(1.1);
    }
    </style>
    <!-- codigo para abrir o msg-sair -->
    <script>
         document.addEventListener('DOMContentLoaded', function () {

             var sairApagar = document.querySelectorAll('.button-Nao');
             var conteinerSair = document.querySelectorAll('.conteiner-sair-perfil');
             var iconsair = document.querySelectorAll('.icon-sair-perfil');

             sairApagar.forEach(function (sair, index) {
                 sair.addEventListener('click', function () {
                     conteinerSair[index].style.display = 'none';
                 });
             });

             iconsair.forEach(function (icon, index) {
                 icon.addEventListener('click', function () {
                     conteinerSair[index].style.display = 'block';
                 });
             });

         });
    </script>
</head>

<body>
    <jsp:include page="../aside.jsp"/>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <main>

            <div class="conteiner-sair-perfil">
                <p class="msg-sair">Você realmente dejesa sair?</p>
                <button type="submit" class="button-Sim">Sim</button>
                <button type="submit" class="button-Nao">Não</button>
            </div>

        <header class="bio-perfil">
            <div class="bio">
                <img class="imag-perfil" src="scr/img/Usuario-img.jpg" alt="">
                <div class="texto-bio">
                    <h1 class="usuario">@<%= nome %></h1>
                    <button class="editar-perfil">Editar Perfil</button>
                    <ion-icon class="icon-sair-perfil" name="log-out-outline"></ion-icon>
                </div>
                <div class="legenda-bio">
                    <p class="textodabio">Seja bem-vindo(a) ao meu perfil!</p>
                </div>

            </div>

        </header>


        <div class="conteinareditar" id="minhaDiv">
            <form action="editar_perfil" method="post"  enctype="multipart/form-data">
                <div class="imgediter">
                    <ion-icon class="x-sair" name="backspace-outline"></ion-icon>
                    <input type="file" name="uploadInput" id="uploadInput" style="display: none;">
                    <ion-icon class="camera-icon" name="camera-outline" onclick="openFileUploader()"></ion-icon>
                    <img class="img" src="scr/img/Usuario-img.jpg" alt="">
                    <input type="text" name="NovoNome" id="novonome" placeholder="@NovoNome" required>
                    <input type="hidden" name="email" id="email" value="<%= email %>">
                </div>
                <div class="bionovotexto">
                    <textarea name="BioTexto" id="novotextobio" cols="30" rows="10" placeholder="Fale um pouco sobre você" oninput="limitarPalavrasEditar()" required></textarea>
                    <p id="contagem-palavras">0/20 palavras</p>
                </div>
                <button class="submitbutton" type="submit">Editar</button>
            </form>

        </div>

        <div class="conteiner-editar-video">
                    <ion-icon class="icon-x-editar" name="close"></ion-icon>
                    <form action="">
                        <video class="video-test up-video-editar" src="/scr/video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4" muted loop></video>
                        <input type="text" name="Categoria" id="categoria-video-editar" placeholder="Categoria" required>
                        <input type="text" name="NomeDoVideo" id="nome-video-editar" oninput="limitarPalavrasEditar()" placeholder="Novo nome do Video" required>
                        <p class="contagem-publica" id="contagem-palavras-editar">0/4 palavras</p>
                        <ion-icon name="trash-outline" class="icon icon-lixeira"></ion-icon>
                        <button type="submit" class="button-editar-video">Editar</button>
                    </form>
                </div>

        <div class="conteiner-comentario">
            <div class="video-demostracao">
                <ion-icon class="icon-x-comentario" name="close"></ion-icon>
                <video class="video-test" src="video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4"
                    loop muted></video>
                <div class="texto-video">
                    <h1 class="novonome">Nome do video</h1>
                     <p class="usuario">@Usuario</p>
                </div>

                <ion-icon name="options-outline" class="icon opcoes-especiais"></ion-icon>

                <ion-icon name="heart-outline" class=" icon comentarioheart icon-sem-curtida"></ion-icon>
                <ion-icon name="heart" class="icon comentarioheart icon-com-curtida"></ion-icon>
                <p class="numero-de-curtidas">349</p>
            </div>

            <div class="formulario-comentario">
                <form action="">
                    <img class="img-usuario img-novo-comentario" src="img/Usuario-img.jpg" alt="">
                    <textarea name="NovoComentario" id="novocomentario" cols="30" rows="10"
                        placeholder="Novo Comentario" oninput="limitarPalavras()" required></textarea>
                    <p id="contagem-palavras">0/10 palavras</p>
                    <button type="submit" class="button-eviar-novo-comentario">Enviar</button>
                </form>
            </div>
            <div class="comentarios">
                <img class="img-usuario img-comentrio" src="img/Usuario-img.jpg" alt="">
                <p>Comentario publicado</p>
            </div>
        </div>

        

        <div class="contricuicoes">
            <div>
                <p class="suas-contribuicoes">Suas Contribuições:</p>
            </div>
        </div>

        <div class="conteiner-video">

            <div class="videos">

                <video class="video-test" src="video/Vídeo_teste.mp4" loop muted></video>
                <div class="acoes-video">
                    <div class="texto-video">
                        <h1 class="nome-do-video novonome">Nome do video</h1>
                        <p class="usuario">@Usuario</p>
                    </div>
                    <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                    <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                    <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                </div>
            </div>
            <div class="videos">
                <video class="video-test video-test2"
                    src="video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4" loop muted></video>
                <div class="acoes-video">
                    <div class="texto-video">
                        <h1 class="nome-do-video novonome">Nome do video</h1>
                        <p class="usuario">@Usuario</p>
                    </div>
                    <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                    <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                    <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                </div>
            </div>

            <div class="videos">
                <video class="video-test video-test2"
                    src="video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4" loop muted></video>
                <div class="acoes-video">
                    <div class="texto-video">
                        <h1 class="nome-do-video novonome">Nome do video</h1>
                        <p class="usuario">@Usuario</p>
                    </div>
                    <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                    <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                    <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                </div>
            </div>

            <div class="videos">
                <video class="video-test video-test2"
                    src="video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4" loop muted></video>
                <div class="acoes-video">
                    <div class="texto-video">
                        <h1 class="nome-do-video novonome">Nome do video</h1>
                        <p class="usuario">@Usuario</p>
                    </div>
                    <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                    <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                    <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                </div>
            </div>

            <div class="videos">
                <video class="video-test video-test2"
                    src="video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4" loop muted></video>
                <div class="acoes-video">
                    <div class="texto-video">
                        <h1 class="nome-do-video">Nome do video</h1>
                        <p class="usuario">@Usuario</p>
                    </div>
                    <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                    <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                    <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                </div>
            </div>

        </div>
    </main>

    <div vw class="enabled">
        <div vw-access-button class="active"></div>
        <div vw-plugin-wrapper>
          <div class="vw-plugin-top-wrapper"></div>
        </div>
      </div>
      <script src="https://vlibras.gov.br/app/vlibras-plugin.js"></script>
      <script>
        new window.VLibras.Widget('https://vlibras.gov.br/app');
      </script>
</body>

</html>