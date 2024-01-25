<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/image 2.png" type="image/librasdev">
    <link rel="stylesheet" href="css/perfilestilos.css">
    <script src="Javc/perfil.js"></script>
    <script src="Javc/scripttamiline.js"></script>
    <script src="Javc/like.js"></script>
    <title>LibrasDev</title>
</head>

<body>
    <aside class="sidebar">

        <header class="cabecalho-sidebar">
            <a href="timeline.html"> <img class="imgusuario" src="img/image 2.png"
                    alt="sem foto de perfil"></a>

            <p class="usuariosidebar">@Usuario</p>
        </header>

        <button class="button-sidebar">
            <div class="perfil">
                <ion-icon class="icon-sidebar" name="person-outline"></ion-icon>
                <p>Perfil</p>
            </div>
        </button>

        <a href="categoria.html">
            <button class="button-sidebar">
            <div>
                <ion-icon class="icon-sidebar" name="book-outline"></ion-icon>
                <p>Categorias</p>
            </div>
        </button>
        </a>

        <button class="button-sidebar">
            <div>
                <ion-icon class="icon-sidebar" name="help-circle-outline"></ion-icon>
                <p>Ajuda</p>
            </div>
        </button>

        <button class="button-sidebar">
            <div>
                <ion-icon class="icon-sidebar" name="hand-left-outline"></ion-icon>
                <p>Sugestões </p>
            </div>
        </button>

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
                    <h1 class="usuario">@Usuario</h1>
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
                <div class="Gifs">

                </div>
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