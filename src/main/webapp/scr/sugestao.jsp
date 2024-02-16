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
    <link rel="shortcut icon" href="scr/img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="scr/css/timeline.css">
    <link rel="stylesheet" href="scr/css/sugestoes.css">
    <script src="scr/Javc/scripttamiline.js"></script>
    <script src="scr/Javc/like.js"></script>
    <script src="scr/Javc/sugestoes.js"></script>
    <script src="scr/Javc/textoprincipal.js"></script>
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
                <button class="button-sidebar sugestoes">
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
                    <h1 class="usuario"></h1>
        </header>

        </div>
    </main>

    <main>
            <header class="header-categoria">
                <a href="/scr/timeline.html">
                    <h1 class="textolibras">LibrasDev</h1>
                </a>
            </header>

            <div class="texto-sugestoes">
                <p class="textoprincipal">A equipe LibrasDev está aberta a sugestões de qualquer natureza, seja relacionada à acessibilidade ou
                    segurança. Buscamos constantemente melhorias em nossos serviços e valorizamos a diversidade de
                    perspectivas. Se você tiver ideias para novas categorias, acessibilidade ou melhorias na segurança,
                    convidamos você a compartilhá-las. Queremos construir um ambiente inclusivo e seguro, e sua contribuição
                    é fundamental para alcançar esse objetivo. Juntos, podemos aprimorar nossa plataforma para beneficiar a
                    todos.</p>
                <p class="textoprincipal">Você pode enviar suas sugestões por meio desses contatos:</p>
            </div>

            <div class="conteiner-contatos">

                <div class="box-contatos">
                    <div class="box-icon-text">
                        <ion-icon class="icon-contatos" name="mail-outline"></ion-icon>
                        <p>Email</p>
                    </div>

                    <button class="button-contato" onclick="copyText(this)">
                        librasdev591@gmail.com
                    </button>
                </div>

                <div class="box-contatos">
                    <div class="box-icon-text">
                        <ion-icon class="icon-contatos" name="logo-whatsapp"></ion-icon>
                        <p>WhatsApp</p>
                    </div>

                    <button class="button-contato" onclick="copyText(this)">
                        (77)99990-4608
                    </button>
                </div>

            </div>
        </main>


        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>