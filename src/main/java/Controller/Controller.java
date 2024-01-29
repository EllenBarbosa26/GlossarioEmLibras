package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/Controller", "/processar-dados"})
public class Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if (acao != null) {
            if ("Perfil".equals(acao)) {
                //new PerfilController().executa(request, response);
            } else if ("Cadastrar".equals(acao)) {
              //  new CadastroController().executa(request, response);
            } else if ("Login".equals(acao)) {

            } else if ("Moderador".equals(acao)) {
               // new ModeradorController().executa(request, response);
            } else {
                // Lógica para tratamento de ação desconhecida, se necessário
            }
        }



        else {
            // Lógica para tratamento de "acao" sendo null, se necessário
        }

    }
}