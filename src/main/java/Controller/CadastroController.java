package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import Model.Usuario;
import Model.Moderador;

@WebServlet("/cadastro")

public class CadastroController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter writer= response.getWriter();
       String nome = request.getParameter("nome");
       String email = request.getParameter("email");
       String senha = request.getParameter("senha");
       Usuario usuario = new Usuario(nome, email, senha);
        HttpSession session = request.getSession(true);
        session.setAttribute("usuario", usuario);

        //writer.println(email);
        //writer.println(senha);
        
        
        response.sendRedirect("timeline");//DAO
    }
}
