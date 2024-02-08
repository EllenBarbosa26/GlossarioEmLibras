package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import Model.Usuario;
import Model.UsuarioDAO;
import Model.Moderador;
import Model.ModeradorDAO;

@WebServlet(urlPatterns = {"/processar-dados"})
public class LoginController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        // Obtenha o código inserido pelo moderador
        String codigoInserido = request.getParameter("codigo");

        // Verifique se o código é igual a "libras0237"
        if (codigoInserido != null){
            if ("libras0237".equals(codigoInserido)) {

                HttpSession session = request.getSession(true);
                session.setAttribute("isModerador", true);
                // Se for igual, encaminhe para a controller Timeline
                // pegar email e senha do moderador

                response.sendRedirect(request.getContextPath() + "/timeline");

            } else{
                // Caso contrário, você pode adicionar lógica para lidar com credenciais inválidas
                HttpSession session = request.getSession(true);
                session.setAttribute("msgDeErro", "Código incorreto! Tente novamente!");

                response.sendRedirect(request.getContextPath() + "/");
            }
        }
        else{
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
    }
}
