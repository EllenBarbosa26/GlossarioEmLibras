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
    <script src="scr/Javc/scripttamiline.js"></script>
    <script src="scr/Javc/categoria.js"></script>
    <title>LibrasDev</title>
</head>
<body>
    <aside class="sidebar">
        <header class="cabecalho-sidebar">
            <form action = "perfil">
            <img class="imgusuario" src="scr/img/Usuario-img.jpg" alt="sem foto de perfil"/>
            </form>
            <p>@Usuario</p>
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
            <a href="timeline.jsp"><h1 class="textolibras">LibrasDev</h1></a>

            <ion-icon class="icon-publicar" name="duplicate-outline"></ion-icon>

            <div class="barra-de-pesquisa">
                <form class="form-pesquisa" action="">
                    
                    <input type="text" name="Pesquisa" id="pesquisa" placeholder="Pesquisar" required>
                    <ion-icon class="ico-lupa" type="submit" name="search-outline"></ion-icon>
                </form>
                
            </div>
        </header>

        <div class="conteiner-Nova-Categoria">
                    <ion-icon class="icon-x-categoria" name="close"></ion-icon>
                    <form action="adicionar_categoria">
                        <input type="file" id="uploadInput" style="display: none;">
                        <div class="up-img"><ion-icon class="icon-camera" onclick="openFileUploaderCategoria()" name="camera-outline"></ion-icon></div>
                        <input type="text" name="Categoria" id="categoria-video" placeholder="Descrição" required>
                        <input type="text" name="NomeDaCategria" id="Nome-categoria" oninput="limitarPalavrasCategoria()" placeholder="Nome da Cadegoria" required>
                        <p class="contagem-Letras-Categoria" id="contagem-palavras-Categoria">0/4 palavras</p>
                        <button type="submit" class="button-Nova-categoria">Adicionar</button>
                    </form>
                </div>

/
        <div class="conteiner-Apagar-Categoria">
                        <p class="msg-de-Aterta">Você realmente dejesa apager esta categoria(nomedacategoria)?</p>
                        <button type="submit" class="button-Sim">Sim</button>
                        <button type="submit" class="button-Nao">Não</button>

                </div>

        <div class="conteiner-categorias">
            <%
                        if (categorias != null && !categorias.isEmpty() ){
                        for (Categoria categoria : categorias) {
            %>
            <div class="catagoria">
                <div class="quant-videos">
                    <p class="quantidade">9</p>
                    <p class="videos">Videos</p>
                </div>
                <img class="imagcategoria" src="scr/img/desktop-outline.svg" alt="">
                <p><%= categoria.getNome() %></p>
                 <ion-icon class="lixeira" name="trash-outline"></ion-icon>
            </div>
            <%}
                }

            %>

        </div>
    </main>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
            <script src="Javc/scripttamiline.js"></script>

</body>
</html>