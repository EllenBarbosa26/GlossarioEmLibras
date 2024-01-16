package Controller;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cadastroUsuario")
public class UsuarioController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Busca do jsp - HTML
        //RequestDispatcher rd = request.getRequestDispatcher("jsp/admin.jsp");
        //rd.forward(request, response);
    }
}
