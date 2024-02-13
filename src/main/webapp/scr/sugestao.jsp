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

            <p class="usuariosidebar"><%= usuario.getNome()%></p>
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
                    <h1 class="usuario">Sugestao</h1>
        </header>

        </div>
    </main>
</body>

</html>