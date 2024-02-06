<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Categoria" %>

<!DOCTYPE html>
<html lang="pt-br">

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Boolean isModerador = (Boolean) session.getAttribute("isModerador");
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");

    if (usuario == null && isModerador == null){
        response.sendRedirect("../index.jsp");
    }
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="scr/css/timeline.css">
    <link rel="stylesheet" href="scr/css/catagoriaestilos.css">

    <title>LibrasDev</title>
</head>
<body>
<aside class="sidebar">
    <header class="cabecalho-sidebar">
        <a href="timeline.jsp"><img class="imgusuario" src="img/Usuario-img.jpg" alt="sem foto de perfil"></a>
        <p> @Usuario</p>
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

    <button class="button-sidebar">
        <div>
            <ion-icon class="icon-sidebar" name="help-circle-outline"></ion-icon>
            <p>Ajuda</p>
        </div>
    </button>

    <form action = "sugestao">
        <button class="button-sidebar">
            <div>
                <ion-icon class="icon-sidebar" name="hand-left-outline"></ion-icon>
                <p>Sugestao</p>
            </div>
        </button>
    </form>

    <ion-icon class="lua iconformat" name="moon-outline"></ion-icon>
    <ion-icon class="sol iconformat" name="sunny-outline"></ion-icon>

</aside>

<main>
    <header class="header-categoria">
        <a href="timeline.jsp"><h1 class="textolibras">LibrasDev</h1></a>
        <div class="barra-de-pesquisa">
            <form class="form-pesquisa" action="">

                <input type="text" name="Pesquisa" id="pesquisa" placeholder="Pesquisar" required>
                <ion-icon class="ico-lupa" type="submit" name="search-outline"></ion-icon>
            </form>

        </div>
    </header>

    <div class="conteiner-categorias">
        <%
            if (categorias != null){
            for (Categoria categoria : categorias) {
        %>
        <div class="catagoria">
            <div class="quant-videos">
                <p class="quantidade">9</p>
                <p class="videos">Videos</p>
            </div>
            <img class="imagcategoria" src="img/desktop-outline.svg" alt="">
            <p><%= categoria.getNome() %></p>
        </div>
        <%}
            }
            else{

            }
        %>
        <form action="adicionar_categoria">
            <div class="catagoria">
                <img class="imagcategoria" src="img/desktop-outline.svg" alt="">
                <button class="button_add">Adicionar</button>
            </div>
        </form>

    </div>
</main>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<script src="Javc/scripttamiline.js"></script>

</body>
</html>