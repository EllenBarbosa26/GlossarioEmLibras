<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Usuario" %>
<%@ page import="Model.Moderador" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Moderador moderador = (Moderador) session.getAttribute("moderador");
    Boolean isModerador = (Boolean) session.getAttribute("isModerador");
%>

<aside class="sidebar">
    <header class="cabecalho-sidebar">
        <form action="perfil">
            <img class="imgusuario" src="scr/img/image 2.png" alt="sem foto de perfil">
        </form>
        <p>
            <%if (usuario != null) {%>
            <%=usuario.getNome()%>
            <%} else {%>
            <%=moderador.getNome()%>
            <%}%>
        </p>
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

    <form action="sugestao">
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