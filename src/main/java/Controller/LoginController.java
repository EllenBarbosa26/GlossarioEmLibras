package Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import Model.Usuario;
import Model.UsuarioDAO;
import Model.Moderador;
import Model.ModeradorDAO;

public class LoginController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        // Obtenha o código inserido pelo moderador
        String codigoInserido = request.getParameter("codigo");

        // Verifique se o código é igual a "libras0237"
        if ("libras0237".equals(codigoInserido)) {

            HttpSession session = request.getSession(true);
            session.setAttribute("isModerador", true);
            // Se for igual, encaminhe para a controller Timeline
            response.sendRedirect(request.getContextPath() + "/timeline");

        } else {
            // Caso contrário, você pode adicionar lógica para lidar com credenciais inválidas
            response.getWriter().println("Código incorreto. Tente novamente.");
        }


        // Verifique se o usuário existe no banco de dados
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.obterUsuarioPorId();

        if (usuario != null) {
            // Se o usuário existe, cria a sessão para o usuário
            HttpSession session = request.getSession(true);
            session.setAttribute("usuario", usuario);

            // Redireciona para a controller Timeline
            response.sendRedirect(request.getContextPath() + "/timeline");
        } else {
            // Caso contrário, exiba uma mensagem de credenciais inválidas
            response.getWriter().println("Credenciais inválidas. Tente novamente.");
        }

    }
}
