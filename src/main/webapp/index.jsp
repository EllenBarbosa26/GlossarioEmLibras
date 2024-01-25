<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="scr/css/indexstilos.css">
    <link rel="stylesheet" href="scr/css/indexstilos.css">
    <script src="scr/Javc/script.js"></script>
    <link rel="shortcut icon" href="scr/img/image 2.png" type="image/librasdev">

    <title>LibrasDev</title>

    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <script src="https://unpkg.com/jwt-decode/build/jwt-decode.js"></script>
    <script src="scr/Javc/jsgoogle.js"></script>
    <script src="scr/Javc/verificacao.js"></script>
</head>

<body>
<div class="cabecalho">
    <div class="logo">
        <h1>LibrasDev</h1>
        <h2>Glossário</h2>
    </div>
    <div class="login">
        <h3 id="login">Login</h3>
        <ion-icon id="iconlogin" name="log-in-outline"></ion-icon>
    </div>
</div>

<div class="conteiner1">.</div>

<div class="test">
    <div class="paralogar">
        <div class="conteinertest">
            <ion-icon id="saidelogar" name="arrow-up-circle-outline"></ion-icon>
            <img src="scr/img/image 2.png" alt="">
            <h1>LibrasDev</h1>
            <button class="souusuario">Sou Usuário</button>
            <button class="soumoderador">Sou Moderador</button>
        </div>
    </div>
</div>

<div class="testlogar">
    <div class="logargoogle">
        <div class="conteinergoogle">
            <img class="iconx" src="scr/img/ph_x-bold.png" alt="">
            <img class="vector" src="scr/img/icon_Vector.png" alt="">
            <form action="cadastro" method="get">
                <p>Cadastre-se</p>
                <input type="text" id="nome-usuario-cadastro" name="nome" placeholder="@Usuario" required>
                <input type="email" id="email-cadastro" name="email" placeholder="Digite seu email" required>
                <input type="password" id="senha-cadastro" name="senha" placeholder="Digite sua senha" required>
                <button type="submit" class="button-cadastro">Cadastrar</button>
            </form>
        </div>
    </div>
</div>


<div class="testlogarUsuario">
    <div class="logarUsuario">
        <div class="conteinergoogleUsuario">
            <img class="iconsairusuario" src="scr/img/ph_x-bold.png" alt="">
            <img class="vector" src="scr/img/icon_Vector.png" alt="">
            <form action="processar-dados" onsubmit="verificarUsuario(); return false;">
                <p>Insira o seu Email e senha:</p>
                <input type="email" id="email" name="email" placeholder="Digite seu email" required>
                <input type="password" id="senha" name="senha" placeholder="Digite sua senha" required>
                <button type="submit">Logar</button>
            </form>
        </div>
    </div>
</div>

<div class="testlogarModerador">
    <div class="logarModerador">
        <div class="conteinergoogleModerador">
            <img class="iconsair" src="scr/img/ph_x-bold.png" alt="">
            <img class="vector" src="scr/img/icon_Vector.png" alt="">
            <form action="processar-dados" onsubmit="verificarModerador(); return false;">
                <p>Insira o seu código de moderador:</p>
                <input type="text" name="Código" id="codigo" placeholder="Digite seu Código" required>
                <button type="submit">Logar</button>
            </form>
        </div>
    </div>
</div>

<div class="bemvindo">
    <div class="textocadastro">
        <h2>Bem-Vindo!</h2>
        <h1>LibrasDev</h1>
        <p>Seu Glossário em <br> Libras para termos <br> técnicos em <br> Tecnologia da <br> Informação(TI).</p>
        <button class="cadastrese">Cadastre-se</button>
    </div>
    <div class="imag">
        <img src="scr/img/image 6.png" alt="Imagem central">
    </div>
</div>

<div class="sobre">
    <h2>Sobre o LibrasDev</h2>
    <p>O LibrasDev é uma plataforma idealizada e desenvolvida para ser um glossário em Libras voltado para termos
        técnicos da área de TI (Tecnologia da Informação). Por meio de entrevistas e leituras, percebeu-se que
        muitas pessoas surdas e até mesmo seus intérpretes desconhecem determinados termos ou, em alguns casos, não
        há um sinal de Libras estabelecido para representá-los. Diante dessa constatação, o LibrasDev surge como uma
        ferramenta essencial para auxiliar na comunicação e disseminar conhecimento dentro dessa comunidade. Ele
        facilita a integração das pessoas surdas no universo da TI. O site é enriquecido visualmente com gifs, que
        podem ser disponibilizados pela própria comunidade. Ao fazer login, além de ter acesso a esses termos, o
        usuário pode contribuir com seus próprios conteúdos.
    </p>
</div>


<div class="conteiner2">.</div>

<div class="rodape">
    <h1>LibrasDev</h1>
    <h2>Desenvolvido por: Ellen Conseição, Lucas Prates e Vinício Couto</h2>
</div>

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>