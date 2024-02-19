package Controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

import Model.CategoriaDAO;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

import Model.Categoria;


@WebServlet(urlPatterns = {"/categoria","/adicionar_categoria", "/processar_categoria", "/apagar_categoria","/pesquisar_categoria", "/acessar_categoria"})
@MultipartConfig
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
        } else if ("/pesquisar_categoria".equals(action)) {
            try {
                pesquisar_categoria(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void pesquisar_categoria(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException, SQLException {
        logger.debug("Chegou aqui");

        CategoriaDAO categoriaDAO = new CategoriaDAO();
        List<Categoria> categorias;


        String searchTerm = request.getParameter("pesquisa");

        logger.debug("Termo da pesquisa: " + searchTerm);

        if (searchTerm != null && !searchTerm.isEmpty()) {
            logger.debug("Chegou aqui dentro do if");
            // Se houver um termo de pesquisa, buscar apenas as categorias correspondentes
            categorias = categoriaDAO.pesquisarCategorias(searchTerm);


        } else {
            // Caso contrário, buscar todas as categorias
            logger.debug("Chegou aqui dentro do else");
            categorias = categoriaDAO.getAllCategorias();
        }

        request.setAttribute("categorias", categorias);
        RequestDispatcher rd = request.getRequestDispatcher("scr/categoria.jsp");
        rd.forward(request, response);
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
        }else if ("/apagar_categoria".equals(action)) {
            apagar_categoria(request, response);
        } else if ("/acessar_categoria".equals(action)) {
            try {
                acessar_categoria(request, response);
            } catch (SQLException e){
                throw new RuntimeException(e);
            }
        }
    }

    private void apagar_categoria(HttpServletRequest request, HttpServletResponse response) {
        String categoriaId = request.getParameter("id"); // You need to pass the category ID from your JSP

        logger.debug("ID da categoria :" , categoriaId);

        if (categoriaId != null) {
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            try {
                categoriaDAO.delete(Integer.parseInt(categoriaId));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        try {
            response.sendRedirect("/GlossarioEmLibra/categoria");
        } catch (IOException e) {
            throw new RuntimeException(e);
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
        String nome = request.getParameter("Nome-categoria");
        String descricao = request.getParameter("categoria-video");

        Part imagemPart = request.getPart("imagem");
        String imagemNome = Paths.get(imagemPart.getSubmittedFileName()).getFileName().toString();

        String caminhoImagem = "src/main/webapp/scr/img-categoria/" + imagemNome;

        try (InputStream input = imagemPart.getInputStream();
             OutputStream output = Files.newOutputStream(new File(caminhoImagem).toPath())) {
            IOUtils.copy(input, output);
        }

        String caminhoRelativo = "scr/img-categoria/" + imagemNome;

        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoria = new Categoria(nome, descricao, caminhoRelativo);
        categoriaDAO.insert(categoria);

        response.sendRedirect("/GlossarioEmLibra/categoria");

    }

    protected void acessar_categoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException  {
        String categoria = request.getParameter("categoria");

        response.sendRedirect("/GlossarioEmLibra/videos_categoria");
    }
}