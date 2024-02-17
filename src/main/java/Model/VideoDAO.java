package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.time.LocalDate;

public class VideoDAO {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/librasdev?user=root";
    private static final String USUARIO = "root";
    private static final String SENHA = "@102938luk";
    private Connection connection;

    public VideoDAO() throws SQLException {
        this.connection = DriverManager.getConnection(URL, USUARIO, SENHA);
    }

    public void addVideo(Video video) throws SQLException {
        LocalDate dataAtual = LocalDate.now();
        String sql = "INSERT INTO video (video_id, title, arquivo, upload_date, user_id, category_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, video.getVideoId());
            statement.setString(2, video.getTitle());
            statement.setString(3, video.getArquivoUrl());
            statement.setDate(4, java.sql.Date.valueOf(dataAtual));
            statement.setInt(5, video.getUserId());
            statement.setInt(6, video.getCategoryId());
            statement.executeUpdate();
        }
    }

    public Video getVideoById(int videoId) throws SQLException {
        String sql = "SELECT * FROM video WHERE video_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, videoId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return createVideoFromResultSet(resultSet);
                }
            }
        }
        return null;
    }

    public List<Video> getAllVideos() throws SQLException {
        List<Video> videos = new ArrayList<>();
        String sql = "SELECT * FROM video";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                videos.add(createVideoFromResultSet(resultSet));
            }
        }
        return videos;
    }

    private Video createVideoFromResultSet(ResultSet resultSet) throws SQLException {
        int videoId = resultSet.getInt("video_id");
        String title = resultSet.getString("title");
        String arquivoUrl = resultSet.getString("arquivo");
        Date uploadDate = resultSet.getDate("upload_date");
        int userId = resultSet.getInt("user_id");
        int categoryId = resultSet.getInt("category_id");

        return new Video(videoId, title, arquivoUrl, uploadDate, userId, categoryId);
    }
}