<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>

<!DOCTYPE html>
<html lang="pt-br">

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Boolean isModerador = (Boolean) session.getAttribute("isModerador");

    if (usuario == null && isModerador == null){
        response.sendRedirect("../index.jsp");
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
</head>

<body>
    <aside class="sidebar">

        <header class="cabecalho-sidebar">
            <a href="timeline.jsp"> <img class="imgusuario" src="scr/img/image 2.png"
                    alt="sem foto de perfil"></a>
            <p><%= usuario.getNome()%></p>
        </header>


          <form action = "perfil">
                      <button class="button-sidebar">
                        <div>
                            <ion-icon class="icon-sidebar" name="person-outline"></ion-icon>
                            <p>Perfil</p>
                        </div>
                    </button>
                </form>

         <form action = "categoria">
                   <button class="button-sidebar categorias">
                      <div>
                        <ion-icon class="icon-sidebar" name="book-outline"></ion-icon>
                        <p>Categorias</p>
                      </div>
                   </button>
                </form>

         <form action="ajuda">
                <button class="button-sidebar">
                    <div>
                        <ion-icon class="icon-sidebar" name="help-circle-outline"></ion-icon>
                        <p>Ajuda</p>
                    </div>
                </button>
                </form>

         <form action = "sugestao">
                       <button class="button-sidebar">
                           <div>
                               <ion-icon class="icon-sidebar" name="hand-left-outline"></ion-icon>
                               <p>Sugestões</p>
                           </div>
                       </button>
                       </form>

        <ion-icon class="lua iconformat" name="moon-outline"></ion-icon>
        <ion-icon class="sol iconformat" name="sunny-outline"></ion-icon>

    </aside>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <main>
        <header class="bio-perfil">
            <div class="bio">
                <img class="imag-perfil" src="img/Usuario-img.jpg" alt="">
                <div class="texto-bio">
                    <h1 class="usuario">@<%= usuario.getNome()%></h1>
                    <button class="editar-perfil">Editar Perfil</button>

                </div>
                <div class="legenda-bio">
                    <p class="textodabio">Meu nome é Hitalmo Fernandes, sou intérprete de Libras há mais de 3 anos.</p>
                </div>

            </div>

        </header>


        <div class="conteinareditar" id="minhaDiv">
            <form action="">
                <div class="imgediter">
                    <ion-icon class="x-sair" name="backspace-outline"></ion-icon>
                    <input type="file" id="uploadInput" style="display: none;">
                    <ion-icon class="camera-icon" name="camera-outline" onclick="openFileUploader()"></ion-icon>
                    <img class="img" src="img/Usuario-img.jpg" alt="">
                    <input type="text" name="NovoNome" id="novonome" placeholder="@NovoNome" required>
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
</body>

</html>