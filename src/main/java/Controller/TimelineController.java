package Controller;

import Model.Categoria;
import Model.CategoriaDAO;
import Model.Video;
import Model.VideoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/timeline")

public class TimelineController extends HttpServlet {
    @Override

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CategoriaDAO categoriaDAO = new CategoriaDAO(); // Pode ser necessário ajustar isso dependendo de como você está gerenciando suas conexões.
        List<Categoria> categorias = categoriaDAO.getAllCategorias();

        request.setAttribute("categorias", categorias);
        try {
            getVideo( request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        RequestDispatcher rd = request.getRequestDispatcher("scr/timeline.jsp");
        rd.forward(request, response);
    }

    private void getVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        VideoDAO videoDAO = new VideoDAO();
        List<Video> videos = videoDAO.getAllVideos();
        request.setAttribute("videos", videos);
    }
}
