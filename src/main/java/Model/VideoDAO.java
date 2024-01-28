package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VideoDAO {
    private Connection connection;

    public VideoDAO(Connection connection) {
        this.connection = connection;
    }

    public void addVideo(Video video) throws SQLException {
        String query = "INSERT INTO video (title, arquivo, upload_date, user_id, category) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, video.getTitle());
            statement.setBytes(2, video.getArquivo());
            statement.setDate(3, video.getUploadDate());
            statement.setInt(4, video.getUserId());
            statement.setInt(5, video.getCategory());

            statement.executeUpdate();
        }
    }

    public Video getVideoById(int videoId) throws SQLException {
        String query = "SELECT * FROM video WHERE video_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, videoId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToVideo(resultSet);
                }
            }
        }

        return null;
    }

    public List<Video> getAllVideos() throws SQLException {
        List<Video> videos = new ArrayList<>();
        String query = "SELECT * FROM video";

        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Video video = mapResultSetToVideo(resultSet);
                videos.add(video);
            }
        }

        return videos;
    }

    private Video mapResultSetToVideo(ResultSet resultSet) throws SQLException {
        Video video = new Video();
        video.setCodigo(resultSet.getInt("video_id"));
        video.setTitulo(resultSet.getString("title"));
        video.setArquivo(resultSet.getBytes("arquivo"));
        video.setData(String.valueOf(resultSet.getDate("upload_date")));
        video.setUserId(resultSet.getInt("user_id"));
        video.setCategory(resultSet.getInt("category"));

        return video;
    }
}
