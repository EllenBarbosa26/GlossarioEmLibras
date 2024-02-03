<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="scr/img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="scr/css/timeline.css">
    <script src="scr/Javc/scripttamiline.js"></script>
    <script src="scr/Javc/like.js"></script>
    <title>LibrasDev</title>
</head>
<html lang="pt-br">

<%

 Usuario usuario = (Usuario) session.getAttribute("usuario");

%>
<% Boolean isModerador = (Boolean) session.getAttribute("isModerador");%>



<body>

    <aside class="sidebar">
        <header class="cabecalho-sidebar">
            <a href="perfil.jsp"><img class="imgusuario" src="img/Usuario-img.jpg"
                    alt="sem foto de perfil"></a>
            <p><%= isModerador%></p>

        </header>

        <form action="perfil">
            <button class="button-sidebar">
                <div>
                    <ion-icon class="icon-sidebar" name="person-outline"></ion-icon>
                    <p>Perfil</p>
                </div>
            </button>
        </form>


        <form action="categoria">
            <button class="button-sidebar">
                <div>
                    <ion-icon class="icon-sidebar" name="book-outline"></ion-icon>
                    <p>Categorias</p>
                </div>
            </button>
        </form>



        <button class="button-sidebar">
            <div>
                <ion-icon class="icon-sidebar" name="help-circle-outline"></ion-icon>
                <p>Ajuda</p>
            </div>
        </button>

        <button class="button-sidebar">
            <div>
                <ion-icon class="icon-sidebar" name="hand-left-outline"></ion-icon>
                <p>Sugestões </p>
            </div>
        </button>

        <ion-icon class="lua iconformat" name="moon-outline"></ion-icon>
        <ion-icon class="sol iconformat" name="sunny-outline"></ion-icon>

    </aside>

    <main>
        <header class="header-categoria">
            <a href="timeline.jsp">
                <h1 class="textolibras">LibrasDev</h1>
            </a>

            <ion-icon class="icon-publicar" name="duplicate-outline"></ion-icon>

            <div class="barra-de-pesquisa">
                <form class="form-pesquisa" action="">

                    <input type="text" name="Pesquisa" id="pesquisa" placeholder="Pesquisar" required>
                    <ion-icon class="ico-lupa" type="submit" name="search-outline"></ion-icon>
                </form>

            </div>
        </header>

        <div class="conteiner-publicacao">
            <ion-icon class="icon-x-publicacao" name="close"></ion-icon>
            <form action="">
                <input type="file" d="uploadInput" style="display: none;">
                <div class="up-video"><ion-icon onclick="openFileUploader()" class="icon-video" name="videocam"></ion-icon></div>
                <input type="text" name="Categoria" id="categoria-video" placeholder="Categoria" required>
                <input type="text" name="NomeDoVideo" id="Nome-video" oninput="limitarPalavrasPublicar()" placeholder="Nome do Video" required>
                <p class="contagem-publica" id="contagem-palavras-publicar">0/4 palavras</p>
                <button type="submit" class="button-publicar-video">publicar</button>
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
                        <video class="video-test" src="/scr/video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4"
                            loop muted></video>
                        <div class="texto-video">
                            <h1 class="novonome">Nome do video</h1>
                            <p class="usuario">@Usuario</p>
                        </div>

                      <%
                          if (isModerador != null && isModerador) {
                              // Código específico para moderadores
                      %>
                              <ion-icon name="options-outline" class="icon opcoes-especiais"></ion-icon>
                      <%
                          }
                      %>

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

        <div class="conteiner-video">


<% for(int i = 0; i <20; i++) {%>
            <div class="videos">
                <video class="video-test video-test2"
                    src="video/Vídeo do WhatsApp de 2024-01-22 à(s) 09.32.10_2e5356ff.mp4" loop muted></video>
                <div class="acoes-video">
                    <div class="texto-video">
                        <h1 class="nome-do-video nomevideo">Nome do video</h1>
                        <p class="usuario">@Usuario</p>
                    </div>
                    <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                    <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                    <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>


                </div>
            </div>
            <%}%>



    </main>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>