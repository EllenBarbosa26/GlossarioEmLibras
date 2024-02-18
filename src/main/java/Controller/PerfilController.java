package Controller;

import Model.Perfil;
import Model.PerfilDAO;
import org.apache.commons.io.IOUtils;

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

@WebServlet(urlPatterns = {"/perfil","/editar_perfil"})
@MultipartConfig

public class PerfilController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

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

    private void editarPerfil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // Obter informações do perfil
        String email = request.getParameter("email"); // Certifique-se de ter o campo email no formulário


        // Obter informações atualizadas
        String novoNome = request.getParameter("NovoNome");
        String novaBiografia = request.getParameter("NovoBiografia");

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

        RequestDispatcher rd = request.getRequestDispatcher("scr/perfil.jsp");
        rd.forward(request, response);

    }
}
