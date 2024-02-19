<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>
<%@ page import="Model.Video" %>
<%@ page import="Model.Categoria" %>
<%@ page import="java.util.List" %>
<%@ page import="Controller.VideoController" %>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="scr/img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="scr/css/catagoriaestilos.css">
    <link rel="stylesheet" href="scr/css/timeline.css">
    <script src="scr/Javc/categoria.js"></script>
    <script src="scr/Javc/like.js"></script>
    <title>LibrasDev</title>
</head>
<html lang="pt-br">

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Moderador moderador = (Moderador) session.getAttribute("moderador");
    Video video = (Video) session.getAttribute("video");
    List<Video> videos = (List<Video>) request.getAttribute("videos");
%>
<% Boolean isModerador = (Boolean) session.getAttribute("isModerador");%>



<body>
    <jsp:include page="../aside.jsp"/>

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
            <form action="add-video" method="post" enctype="multipart/form-data">
                <input type="file" name="Video" id="uploadInput" accept="video/*" style="display: none;">
                <div class="up-video"><ion-icon class="icon-video" onclick="openFileUploaderTimeline()" name="videocam"></ion-icon></div>
                <select name="Categoria" id="categoria-video">
                    <%
                        List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
                        for (Categoria categoria : categorias){%>
                            <option value="<%= categoria.getId()%>"><%= categoria.getNome()%></option>
                        <%}
                    %>
                </select>
                <div id="videofinder"></div>
                <input type="text" name="NomeDoVideo" id="Nome-video" oninput="limitarPalavrasPublicar()" placeholder="Nome do Video" required>
                <p class="contagem-publica" id="contagem-palavras-publicar">0/4 palavras</p>
                <button type="submit" class="button-publicar-video">publicar</button>
            </form>
        </div>

        <div class="conteiner-editar-video">
                    <ion-icon class="icon-x-editar" name="close"></ion-icon>
                    <form action="">
                        <video class="video-test up-video-editar" src="scr/video/Vбdeo%20do%20WhatsApp%20de%202024-01-22%20Е(s)%2009.32.10_2e5356ff.mp4" muted loop></video>
                        <input type="text" name="Categoria" id="categoria-video-editar" placeholder="Categoria" required>
                        <input type="text" name="NomeDoVideo" id="nome-video-editar" oninput="limitarPalavrasEditar()" placeholder="Novo nome do Video" required>
                        <p class="contagem-publica" id="contagem-palavras-editar">0/4 palavras</p>
                        <ion-icon name="trash-outline" class="icon icon-lixeira lixeira "></ion-icon>
                        <button type="submit" class="button-editar-video">Editar</button>
                    </form>
        </div>

        <div class="conteiner-comentario">
            <div class="video-demostracao">
                <ion-icon class="icon-x-comentario" name="close"></ion-icon>
                <video class="video-test" src="video/Vídeo%20do%20WhatsApp%20de%202024-01-31%20à(s)%2011.47.19_2e786a6f.mp4" loop muted></video>
                <div class="texto-video">
                    <%--<%for (int i = 0; i < videos.size(); i++){%>
                        <h1 class="novonome"><%= videos.get(i).getTitle()%></h1>
                        <%if (usuario != null){%>
                        <%
                            int userID = videos.get(i).getUserId();
                            String nomeUsuario = usuario.getNomeUsuarioPorID(userID);
                        %>
                        <p class="usuario"><%= nomeUsuario %></p>
                        <%}%>
                    <%}%>
                &lt;%&ndash;<p class="usuario"><%= nomeUsuario %></p>&ndash;%&gt;--%>
                </div>

                <ion-icon name="heart-outline" class="icon comentarioheart icon-sem-curtida"></ion-icon>
                <ion-icon name="heart" class="icon comentarioheart icon-com-curtida"></ion-icon>
                <p class="numero-de-curtidas">349</p>
            </div>



            <div class="formulario-comentario">
                <form action="">
                    <img class="img-usuario img-novo-comentario" src="img/Usuario-img.jpg" alt="">
                    <textarea name="NovoComentario" id="novocomentario" cols="30" rows="10"
                        placeholder="Novo Comentário" oninput="limitarPalavras()" required></textarea>
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

            <%--<% for(int i = 0; i <20; i++) {%>
                <div class="videos">
                    <video class="video-test video-test2"
                        src="scr/video/Vбdeo%20do%20WhatsApp%20de%202024-01-22%20Е(s)%2009.32.10_2e5356ff.mp4" loop muted></video>
                    <div class="acoes-video">
                        <div class="texto-video">
                            <h1 class="nome-do-video nomevideo">Nome do video</h1>
                            <p class="usuario">@Usuário</p>
                        </div>
                        <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                        <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                        <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                    </div>
                </div>
            <%}%>--%>

                                                <%-- VIDEOS ADICIONADOS NO BANCO DE DADOS --%>
            <div class="videos">
                <% if (videos != null) { %>
                <% for(int i=0; i<videos.size(); i++){ %>
                    <video class="video-test video-test2" src="<%= videos.get(i).getArquivoUrl()%>" loop muted></video>
                    <div class="acoes-video">
                        <div class="texto-video">
                            <h1 class="nome-do-video nomevideo"><%= videos.get(i).getTitle()%></h1>
                            <% if (usuario != null) { %>
                            <p class="usuario"><%= usuario.getNome()%></p>
                            <% } else { %>
                            <p class="usuario">@Usuário</p>
                            <% } %>
                        </div>
                        <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
                        <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
                        <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>
                    </div>
               <% } %>
                <% } else { %>
                <p>Sem mais vídeos disponíveis</p>
                <% } %>
            </div>

            <ion-icon name="chatbubbles-outline" class="icon icon-cometario"></ion-icon>
            <ion-icon name="heart-outline" class=" icon icon-sem-curtida"></ion-icon>
            <ion-icon name="heart" class=" icon icon-com-curtida"></ion-icon>

        </div>

    </main>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="scr/Javc/scripttamiline.js"></script>

    <script>
        function openFileUploaderTimeline() {
            const uploadInput = document.getElementById('uploadInput');
            if (!uploadInput) {
                console.error("Elemento 'uploadInput' não encontrado.");
                return;
            }
            uploadInput.click();
        }
    </script>

</body>

</html>