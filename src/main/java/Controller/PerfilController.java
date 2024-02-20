package Controller;

import Model.*;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/perfil","/editar_perfil","/exibir_videos"})
@MultipartConfig

public class PerfilController extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(CategoriaController.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath(); // Use getServletPath() para obter o caminho da servlet

        logger.debug("Servlet Path: {}", action);

        if ("/exibir_videos".equals(action)) {
                exibirVideos(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        logger.debug("Servlet Path: {}", action);

        if ("/perfil".equals(action)) {

                perfil(request, response);

        }else if ("/editar_perfil".equals(action)) {

            try {
                editarPerfil(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }

    private void exibirVideos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.debug("Chegou aqui");

        String categoriaIdStr = request.getParameter("categoria");

        if (categoriaIdStr != null && !categoriaIdStr.isEmpty()) {
            try {
                int categoriaId = Integer.parseInt(categoriaIdStr);

                VideoDAO videoDAO = new VideoDAO();

                List<Video> videosDaCategoria = videoDAO.getVideosByCategoria(categoriaId);

                for (Video video : videosDaCategoria) {
                    System.out.println("Nome do vídeo: " + video.getTitle());
                }

                request.setAttribute("videos", videosDaCategoria);

                CategoriaDAO categoriaDAO = new CategoriaDAO(); // Pode ser necessário ajustar isso dependendo de como você está gerenciando suas conexões.
                List<Categoria> categorias = categoriaDAO.getAllCategorias();

                request.setAttribute("categorias", categorias);

                RequestDispatcher dispatcher = request.getRequestDispatcher("scr/timeline.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {

                logger.error("Erro ao obter vídeos da categoria", e);

            }
        }
    }

    private void editarPerfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        logger.error(" Chegou em editar Perfil " );


        String email = request.getParameter("email"); // Certifique-se de ter o campo email no formulário

        logger.error("email: ", email);

        // Obter informações atualizadas
        String novoNome = request.getParameter("NovoNome");
        String novaBiografia = request.getParameter("NovoBiografia");

        logger.error("nome: ", novoNome);
        logger.error("Biografia: ", novaBiografia);

        // Processar a imagem, se houver uma nova
        Part imagemPart = request.getPart("uploadInput");
        byte[] novaFoto = null;

        if (imagemPart.getSize() > 0) {
            // Processar a nova imagem
            InputStream input = imagemPart.getInputStream();
            novaFoto = IOUtils.toByteArray(input);
        }

        // Criar objeto Perfil com as informações atualizadas
        Perfil perfilAtualizado = new Perfil(novoNome, email, null, novaBiografia, novaFoto);

        // Atualizar o perfil no banco de dados
//        PerfilDAO perfilDAO = new PerfilDAO(seuObjetoConnection); // Substitua "seuObjetoConnection" pela sua instância de conexão
//        perfilDAO.editarPerfil(perfilAtualizado);

        // Redirecionar de volta para a página de perfil ou outra página apropriada
        response.sendRedirect("/caminho/para/pagina/de/perfil");
    }


    protected void perfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.debug("Chegou aqui");
        RequestDispatcher rd = request.getRequestDispatcher("scr/perfil.jsp");
        rd.forward(request, response);

    }
}
