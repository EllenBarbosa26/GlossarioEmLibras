package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;

public class VideoDAO {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/librasdev?user=root";
    private static final String USUARIO = "root";
    private static final String SENHA = "@102938luk";
    private Connection connection;

    public VideoDAO() {
        try {
            this.connection = DriverManager.getConnection(URL, USUARIO, SENHA);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao conectar ao banco de dados", e);
        }
    }

    public void addVideo(Video video, boolean isModerator, int moderatorId) throws SQLException {
        LocalDate dataAtual = LocalDate.now();
        String sql = "INSERT INTO video (title, arquivo, upload_date, user_id, category_id, moderator_id, is_moderator) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, video.getTitle());
            statement.setString(2, video.getArquivoUrl());
            statement.setDate(3, java.sql.Date.valueOf(dataAtual));
            if (isModerator) {
                statement.setInt(4, 0);
                statement.setInt(5, video.getCategoryId());
                statement.setInt(6, moderatorId);
                statement.setBoolean(7, true);
            } else {
                statement.setInt(4, video.getUserId());
                statement.setInt(5, video.getCategoryId());
                statement.setNull(6, Types.INTEGER);
                statement.setBoolean(7, false);
            }

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int generatedId = generatedKeys.getInt(1);
                        video.setVideoId(generatedId);
                    } else {
                        throw new SQLException("Falha ao obter o ID gerado para o vídeo.");
                    }
                }
            } else {
                throw new SQLException("Falha ao inserir o vídeo, nenhuma linha afetada.");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao adicionar vídeo", e);
        }
    }


    public Video getVideoById(int videoId) {
        String sql = "SELECT * FROM video WHERE video_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, videoId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return createVideoFromResultSet(resultSet);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao obter vídeo por ID", e);
        }
        return null;
    }

    public List<Video> getAllVideos() {
        List<Video> videos = new ArrayList<>();
        String sql = "SELECT * FROM video";
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                videos.add(createVideoFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao obter todos os vídeos", e);
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
