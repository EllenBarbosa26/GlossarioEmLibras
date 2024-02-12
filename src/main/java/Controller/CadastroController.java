package Controller;

import Model.UsuarioDAO;
import Model.Usuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cadastro")
public class CadastroController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter writer = response.getWriter();
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Verifica se o usuário já existe no banco de dados
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioExistente = new Usuario(nome, senha, email);

        if (usuarioDAO.obterUsuarioPorNomeOuEmail(usuarioExistente) == null) {
            // Se o usuário não existe, cadastra no banco de dados
            Usuario novoUsuario = new Usuario(nome, senha, email);
            usuarioDAO.inserirUsuario(novoUsuario.getUsername(), novoUsuario.getPassword(), novoUsuario.getEmail());

            // Cria a sessão para o novo usuário
            HttpSession session = request.getSession(true);
            session.setAttribute("usuario", novoUsuario);

            response.sendRedirect("timeline");
        } else {
            // Se o usuário já existe, redireciona para uma página informando sobre o cadastro duplicado
            HttpSession session = request.getSession(true);
            session.setAttribute("msgDeErro", "Já existe um usuário cadastrado com essas informações!");

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }
}