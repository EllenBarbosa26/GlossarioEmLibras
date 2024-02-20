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

    <style>
        .btnCategoria{
            border: none;
            background-color: transparent;
            border-radius: 25px;
        }
    </style>

</head>
<body>
    <jsp:include page="../aside.jsp"/>
    <main>
        <header class="header-categoria">
            <a href="timeline"><h1 class="textolibras">LibrasDev</h1></a>
            <%
                if (moderador != null){%>
                    <ion-icon class="icon-publicar" name="duplicate-outline"></ion-icon>
                <%}
            %>
            <div class="barra-de-pesquisa">
                <form class="form-pesquisa" id="formPesquisa" action="pesquisar_categoria" method="get">
                    <input type="text" name="pesquisa" id="pesquisa" placeholder="Pesquisar" required>
                    <ion-icon class="ico-lupa" id="iconeLupa" type="submit" name="search-outline"></ion-icon>
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

                <button class="btnCategoria">
                    <div class="catagoria" >
                        <div class="quant-videos">
                        </div>

                        <img class="imagcategoria" onclick="acessar_categoria('<%= categoria.getId() %>')" src="<%= categoria.getImage()%>" alt="imagem da categoria">

                        <p><%= categoria.getNome() %></p>
                        <% if (moderador != null) { %>
                        <ion-icon class="lixeira" name="trash-outline"></ion-icon>
                        <% } %>
                    </div>
                </button>


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

    <script>
        document.getElementById('iconeLupa').addEventListener('click', function() {
            document.getElementById('formPesquisa').submit();
        });
    </script>

    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="Javc/scripttamiline.js"></script>

    <script>
        function acessar_categoria(idCategoria){
            console.log('clicou na categoria:', idCategoria);
            var url = "exibir_videos?categoria=" + encodeURIComponent(idCategoria);
            // Redirecionar para a página do controlador
            window.location.href = url;
        }
    </script>

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
