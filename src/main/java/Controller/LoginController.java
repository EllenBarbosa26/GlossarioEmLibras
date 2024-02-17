package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import Model.Usuario;
import Model.UsuarioDAO;
import Model.Moderador;
import Model.ModeradorDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet(urlPatterns = {"/processar-dados-usuario", "/processar-dados-moderador"})
public class LoginController extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(CategoriaController.class);
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        logger.debug("Servlet Path: {}", action);

        if ("/processar-dados-usuario".equals(action)) {
            processUser(request, response);
        }else if ("/processar-dados-moderador".equals(action)) {
            processModerador(request, response);
        }
    }
    protected void processUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Verifique se o usuário existe no banco de dados
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = new Usuario("", senha, email);
        usuario = usuarioDAO.obterUsuarioEmailESenha(usuario);

        if (usuario != null) {
            // Se o usuário existe, cria a sessão para o usuário
            HttpSession session = request.getSession(true);
            session.setAttribute("usuario", usuario);

            // Redireciona para a controller Timeline
            response.sendRedirect(request.getContextPath() + "/timeline");
        } else {
            // Caso contrário, exiba uma mensagem de credenciais inválidas
            HttpSession session = request.getSession(true);
            session.setAttribute("msgDeErro", "Credenciais inválidas! Tente novamente!");

            response.sendRedirect(request.getContextPath() + "/");
        }
    }
    protected void processModerador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Verifique se as credenciais são do moderador
        ModeradorDAO moderadorDAO = new ModeradorDAO();
        Moderador moderador = new Moderador("", senha, email);
        moderador = moderadorDAO.obterModeradorEmailESenha(moderador);

        if (moderador != null) {
            // Se o moderador existe, cria a sessão para o moderado
            HttpSession session = request.getSession(true);
            session.setAttribute("moderador", moderador);

            // Redireciona para a controller Timeline
            response.sendRedirect(request.getContextPath() + "/timeline");
        } else {
            // Caso contrário, exiba uma mensagem de credenciais inválidas
            HttpSession session = request.getSession(true);
            session.setAttribute("msgDeErro", "Credenciais inválidas! Tente novamente!");

            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}