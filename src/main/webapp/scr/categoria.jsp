<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Categoria" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="Controller.CategoriaController" %>

<!DOCTYPE html>
<html lang="pt-br">

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Moderador moderador = (Moderador) session.getAttribute("moderador");
    Boolean isModerador = (Boolean) session.getAttribute("isModerador");
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="scr/css/timeline.css">
    <link rel="stylesheet" href="scr/css/catagoriaestilos.css">
    <script src="scr/Javc/scripttamiline.js"></script>
    <script src="scr/Javc/categoria.js"></script>
    <title>LibrasDev</title>
</head>
<body>
    <jsp:include page="../aside.jsp"/>
    <main>
        <header class="header-categoria">
            <a href="timeline.jsp"><h1 class="textolibras">LibrasDev</h1></a>
            <%
                if (moderador != null){%>
                    <ion-icon class="icon-publicar" name="duplicate-outline"></ion-icon>
                <%}
            %>
            <div class="barra-de-pesquisa">
                <form class="form-pesquisa" action="">
                    <input type="text" name="Pesquisa" id="pesquisa" placeholder="Pesquisar" required>
                    <ion-icon class="ico-lupa" type="submit" name="search-outline"></ion-icon>
                </form>
            </div>
        </header>

        <div class="conteiner-Nova-Categoria">
            <ion-icon class="icon-x-categoria" name="close"></ion-icon>
            <form action="processar_categoria" method="post" enctype="multipart/form-data">
                <input type="file" name="imagem" id="uploadInput" style="display: none;">
                <div class="up-img"><ion-icon class="icon-camera" onclick="openFileUploaderCategoria()" name="camera-outline"></ion-icon></div>
                <input type="text" name="Nome-categoria" id="Nome-categoria" oninput="limitarPalavrasCategoria()" placeholder="Nome da Categoria" required>
                <input type="text" name="categoria-video" id="categoria-video" placeholder="Descrição" required>
                <p class="contagem-Letras-Categoria" id="contagem-palavras-Categoria">0/4 palavras</p>
                <button type="submit" class="button-Nova-categoria">Adicionar</button>
            </form>
        </div>

        <div class="conteiner-categorias">
            <%
                if (categorias != null && !categorias.isEmpty()) {
                    for (Categoria categoria : categorias) {
            %>
            <div class="catagoria">
                <div class="quant-videos">
                    <p class="quantidade">9</p>
                    <p class="videos">Videos</p>
                </div>
                <img class="imagcategoria" src="<%= categoria.getImage()%>" alt="imagem da categoria">
                <p><%= categoria.getNome() %></p>
                <% if (moderador != null) { %>
                    <ion-icon class="lixeira" name="trash-outline"></ion-icon>
                <% } %>
            </div>
            <div class="conteiner-Apagar-Categoria">
                <% if (moderador != null) { %>
                    <p class="msg-de-Aterta">Você realmente deseja apagar esta categoria ?</p>
                    <form action="apagar_categoria" method="post">
                        <input type="hidden" name="id" value="<%= categoria.getId() %>">
                        <button type="submit" class="button-Sim">Sim</button>
                    </form>
                    <button type="submit" class="button-Nao">Não</button>
                <% } %>
            </div>
            <%
                    }
                }
            %>
        </div>
    </main>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="Javc/scripttamiline.js"></script>
</body>
</html>
