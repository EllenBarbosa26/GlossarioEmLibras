package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer= response.getWriter();
        writer.println("<html>");
        writer.println("<body>");
        writer.println("<h1>Login<h1>");
        writer.println("<body>");
        writer.println("<html>");
    }

    public void execute(HttpServletRequest request, HttpServletResponse response) {
    }

    public void executa(HttpServletRequest request, HttpServletResponse response) {
    }
}