package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.CategoriaDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import Model.Categoria;


@WebServlet(urlPatterns = {"/categoria","/adicionar_categoria", "/processar_categoria", "/apagar_categoria"})
public class CategoriaController extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(CategoriaController.class);
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath(); // Use getServletPath() para obter o caminho da servlet

        logger.debug("Servlet Path: {}", action);

        if ("/categoria".equals(action)) {
            try {
                categoria(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if ("/adicionar_categoria".equals(action)) {

            add_categoria(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        if ("/processar_categoria".equals(action)) {
            try {
                process_categoria(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    protected void categoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {


        CategoriaDAO categoriaDAO = new CategoriaDAO(); // Pode ser necessário ajustar isso dependendo de como você está gerenciando suas conexões.
        List<Categoria> categorias = categoriaDAO.getAllCategorias();


        request.setAttribute("categorias", categorias);

        RequestDispatcher rd = request.getRequestDispatcher("scr/categoria.jsp");
        rd.forward(request, response);


    }

    private void add_categoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        RequestDispatcher rd = request.getRequestDispatcher("scr/add_categoria.jsp");
        rd.forward(request, response);

    }

    private void process_categoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");

        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoria = new Categoria(nome, descricao);
        categoriaDAO.insert(categoria);

        // Adicione lógica para processar os dados, por exemplo, salvar no banco de dados

        logger.debug("nome " + nome + "Descrição" + descricao);

        response.sendRedirect("/GlossarioEmLibra/categoria");

    }

    protected void apagar_categoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int categoriaId = Integer.parseInt(request.getParameter("admin_id"));
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        try {
            categoriaDAO.delete(categoriaId);
            System.out.println("Categoria deletada com sucesso.");
        } catch (SQLException e) {
            System.err.println("Erro ao deletar categoria: " + e.getMessage());
        }
        response.sendRedirect("/GlossarioEmLibra/categoria"); // Redirecionar após excluir
    }
}