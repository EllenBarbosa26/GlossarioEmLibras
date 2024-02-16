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
    <script src="scr/Javc/scripttamiline.js"></script>
    <script src="scr/Javc/like.js"></script>
    <script src="scr/Javc/ajuda.js"></script>
    <link rel="stylesheet" href="scr/css/ajuda.css">
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
                <button class="button-sidebar ajuda">
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
                    <h1 class="usuario"></h1>
        </header>

        </div>
    </main>
    <main>

            <div class="cabecalho-ajuda">
                <h1>Ajuda com a Plataforma</h1>
            </div>

            <div class="tipos-de-ajuda">

                <div class="boxtipos oq-librasDev">
                    <ion-icon class="icon-tipos" name="help-circle-outline"></ion-icon>
                    <p>O que é LibrasDev?</p>
                </div>

                <div class="boxtipos sobre-midias">
                    <ion-icon class="icon-tipos icon-midia" name="file-tray-stacked-outline"></ion-icon>
                    <p>Sobre as Mídias</p>
                </div>

                <div class="boxtipos sobre-simbulos">
                    <ion-icon class="icon-tipos icon-simbulos" name="layers-outline"></ion-icon>
                    <p>Sobre os Símbolos</p>
                </div>

                <div class="boxtipos direitos-deveres">
                    <ion-icon class="icon-tipos icon-DeD" name="warning-outline"></ion-icon>
                    <p>Direitos e Deveres</p>
                </div>

            </div>

            <div class="conteiner-centralizacao">

                <div class="box-imformacao">
                    <div class="cabecalho-box">
                        <ion-icon class="icon-box" name="help-circle-outline"></ion-icon>
                        <p>O que é LibrasDev?</p>
                        <ion-icon class="icon-x-box" name="close-outline"></ion-icon>
                    </div>
                    <div class="imformacoes">
                        <p>
                            O LibrasDev é uma plataforma idealizada e desenvolvida para ser um glossário em Libras voltado
                            para termos técnicos da área de TI (Tecnologia da Informação). Por meio de entrevistas e
                            leituras, percebeu-se que muitas pessoas surdas e até mesmo seus intérpretes desconhecem
                            determinados termos ou, em alguns casos, não há um sinal de Libras estabelecido para
                            representá-los. Diante dessa constatação, o LibrasDev surge como uma ferramenta essencial para
                            auxiliar na comunicação e disseminar conhecimento dentro dessa comunidade. Ele facilita a
                            integração das pessoas surdas no universo da TI. O site é enriquecido visualmente com videos, que
                            podem ser disponibilizados pela própria comunidade. Ao fazer login, além de ter acesso a esses
                            termos, o usuário pode contribuir com seus próprios conteúdos.
                        </p>
                    </div>
                </div>

                <div class="box-imformacao">
                    <div class="cabecalho-box">
                        <ion-icon class="icon-box" name="file-tray-stacked-outline"></ion-icon>
                        <p>Sobre as Mídias</p>
                        <ion-icon class="icon-x-box" name="close-outline"></ion-icon>
                    </div>
                    <div class="imformacoes">
                        <p>
                            As mídias (imagens e vídeos) presentes no LibrasDev podem ser inseridas por todos os usuários, exceto as imagens das categorias, que só podem ser criadas pelos administradores da plataforma. No entanto, para você, nosso usuário que deseja colaborar com o glossário, pode enviar suas mídias: vídeos gravados horizontalmente e imagens de qualquer diâmetro. No entanto, solicitamos que você cumpra as nossas regras (que podem ser encontradas na aba "Direitos e Deveres") para que sua publicação não seja removida por justa causa, podendo até perder o acesso ao seu perfil.
                        </p>
                    </div>
                </div>

                <div class="box-imformacao">
                    <div class="cabecalho-box">
                        <ion-icon class="icon-box" name="layers-outline"></ion-icon>
                        <p>Sobre os Símbolos</p>
                        <ion-icon class="icon-x-box" name="close-outline"></ion-icon>
                    </div>
                    <div class="imformacoes">
                        <p>
                            Você, como usuário, pode ver em nossa plataforma diversos símbolos/ícones, e aqui está qual é a função de cada um deles:
                        </p>

                        <div class="sobre-icon">
                            <ion-icon class="iconsobre" name="chatbubbles-outline"></ion-icon>
                            <p>Ícone de balões de fala: Esse ícone serve para abrir a aba de comentários, proporcionando ao usuário a possibilidade de ler os comentários feitos naquele vídeo específico ou até mesmo enviar seu próprio comentário. É uma ferramenta fundamental para interação e engajamento entre os usuários, permitindo que compartilhem suas opiniões, feedbacks e interajam com o conteúdo e com outros usuários da plataforma.</p>
                        </div>

                        <div class="sobre-icon">
                            <ion-icon class="iconsobre" name="duplicate-outline"></ion-icon>
                            <p>Ícone de adicionar: Este ícone tem como função abrir a aba que permitirá que o usuário possa adicionar uma nova contribuição para a nossa plataforma. Ao clicar neste ícone, será aberta uma pequena aba que possibilitará a escolha do arquivo que deseja enviar. Essa funcionalidade é essencial para encorajar os usuários a compartilharem conteúdo relevante, seja através de imagens, vídeos ou outros tipos de arquivos, enriquecendo assim a experiência de todos na plataforma.</p>
                        </div>

                        <div class="sobre-icon">
                            <ion-icon class="iconsobre" name="moon-outline"></ion-icon>
                            <p>Ícone de Lua: Este ícone serve para que o usuário possa transicionar o modo da tela de claro para escuro, caso tenha mais facilidade de trabalhar com tela escura. Ao clicar neste ícone, a interface da plataforma muda para um esquema de cores mais adequado para ambientes com pouca luminosidade ou para usuários que preferem uma experiência visual menos intensa.</p>
                        </div>

                        <div class="sobre-icon">
                            <ion-icon class="iconsobre" name="sunny-outline"></ion-icon>
                            <p>Ícone de Sol: Este ícone serve para que o usuário possa transicionar o modo da tela de escuro para claro, caso tenha mais facilidade de trabalhar com tela clara. Ao clicar neste ícone, a interface da plataforma muda para um esquema de cores mais adequado para ambientes com muita luminosidade ou para usuários que preferem uma experiência visual mais intensa.</p>
                        </div>

                        <div class="sobre-icon">
                            <ion-icon class="iconsobre" name="options-outline"></ion-icon>
                            <p>Ícone de 3 tracinhos: Este ícone está presente quando o usuário clica no de comentários. Ele serve para que o usuário possa editar ou apagar as suas contribuições da forma que desejar.

                            Ao clicar neste ícone, o usuário pode acessar um menu de opções relacionadas à sua contribuição, como editar o conteúdo para fazer correções ou atualizações, ou apagar a contribuição completamente, caso decida remover o conteúdo da plataforma.</p>
                        </div>
                    </div>
                </div>

                <div class="box-imformacao">
                    <div class="cabecalho-box">
                        <ion-icon class="icon-box" name="warning-outline"></ion-icon>
                        <p>Direitos e Deveres</p>
                        <ion-icon class="icon-x-box" name="close-outline"></ion-icon>
                    </div>
                    <div class="imformacoes">
                        <p>
                            Como toda plataforma, temos regras a serem seguidas para o bem da comunidade que estamos tentando criar:
                        </p>
                        <p>
                            1º: Qualquer tipo de preconceito ou crime de ódio feito nesta plataforma terá consequências, seja através de comentários, texto de bios ou até mesmo no nome escolhido pelo usuário.
                        </p>
                        <p>
                            2º: As mídias inseridas na plataforma que não estiverem de acordo com o conteúdo proposto pelo LibrasDev (Tecnologia da Informação) poderão ser apagadas por justa causa. Se o vídeo ou imagem for considerado impróprio ou negativo de alguma maneira, o perfil que publicou o conteúdo poderá ser banido da plataforma.
                        </p>
                        <p>
                            3º: Não aconselhamos que os usuários disponibilizem de alguma maneira dados ou formas de contato pessoais, como telefone, email, entre outros.
                        </p>
                        <p>
                            4º: Caso algum usuário tenha sido atacado ou presenciou algo que viola nossas diretrizes, poderá entrar em contato conosco pelo nosso email ou através do contato disponível na aba de ajuda e sugestões. Com isso, nossos administradores poderão verificar e resolver o problema.
                        </p>
                    </div>
                </div>

            </div>



            <div class="box-contatos">

                <div class="texto-imformativo">
                    <p>
                        Se nenhuma dessas páginas fornecer a ajuda ou informações que você precisa, sinta-se à vontade para
                        enviar sua dúvida pelos nossos meios de contato.
                    </p>
                </div>

                <div class="contatos">
                    <div class="copiado">

                    </div>
                    <div class="boxcontatos email" onclick="copyText('librasdev591@gmail.com')">
                        <ion-icon class="icon-contatos" name="mail-outline"></ion-icon>
                        <p>librasdev591@gmail.com</p>
                    </div>

                    <div class="boxcontatos numero" onclick="copyText('(77)99990-4608')">
                        <ion-icon class="icon-contatos" name="logo-whatsapp"></ion-icon>
                        <p>(77)99990-4608</p>
                    </div>
                </div>

            </div>


        </main>




        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>

</html>