package Controller;

import Model.*;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;

@WebServlet("/add-video")
@MultipartConfig
public class VideoController extends HttpServlet {
    private static final Logger logger = LoggerFactory.getLogger(CategoriaController.class);
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        logger.debug("Servlet Path: {}", action);

        if ("/add-video".equals(action)) {
            try {
                process_video(request, response);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void process_video(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String nome = request.getParameter("NomeDoVideo");
        String categoria = request.getParameter("Categoria");

        Part videoPart = request.getPart("Video");
        String videoNome = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();

        String caminhoVideo = "src/main/webapp/scr/video/" + videoNome;

        try (InputStream input = videoPart.getInputStream();
             OutputStream output = Files.newOutputStream(new File(caminhoVideo).toPath())) {
            IOUtils.copy(input, output);
        }

        String caminhoRelativo = "scr/video/" + videoNome;

        VideoDAO videoDAO = new VideoDAO();
        HttpSession session = request.getSession(true);
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        Moderador moderador = (Moderador) session.getAttribute("moderador");

        if (usuario != null) {
            Video video = new Video(nome, caminhoRelativo, usuario.getCodigo(), Integer.valueOf(categoria));
            try {
                videoDAO.addVideo(video);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            Video video = new Video(nome, caminhoRelativo, moderador.getCodigo(), Integer.valueOf(categoria));
            try {
                videoDAO.addVideo(video);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("/GlossarioEmLibra/timeline");
    }
}
