package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ModeradorDAO {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/?user=root";
    private static final String USUARIO = "root";
    private static final String SENHA = "";

    private static final String INSERIR_MODERADOR = "INSERT INTO moderador (username, password, email) VALUES (?, ?, ?)";
    private static final String OBTER_MODERADOR_POR_ID = "SELECT * FROM moderador WHERE moderador_id = ?";
    private static final String ATUALIZAR_MODERADOR = "UPDATE moderador SET username = ?, password = ?, email = ? WHERE moderador_id = ?";
    private static final String EXCLUIR_MODERADOR = "DELETE FROM moderador WHERE moderador_id = ?";

    public void inserirModerador(Moderador moderador) {
        try (Connection connection = DriverManager.getConnection(URL, USUARIO, SENHA);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERIR_MODERADOR)) {

            preparedStatement.setString(1, moderador.getNome());
            preparedStatement.setString(2, moderador.getSenha());
            preparedStatement.setString(3, moderador.getEmail());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Moderador obterModeradorPorId(int moderadorId) {
        try (Connection connection = DriverManager.getConnection(URL, USUARIO, SENHA);
             PreparedStatement preparedStatement = connection.prepareStatement(OBTER_MODERADOR_POR_ID)) {

            preparedStatement.setInt(1, moderadorId);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Moderador(
                            resultSet.getString("username"),
                            resultSet.getString("email"),
                            resultSet.getString("password"),
                            resultSet.getInt("moderador_id")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void atualizarModerador(Moderador moderador) {
        try (Connection connection = DriverManager.getConnection(URL, USUARIO, SENHA);
             PreparedStatement preparedStatement = connection.prepareStatement(ATUALIZAR_MODERADOR)) {

            preparedStatement.setString(1, moderador.getNome());
            preparedStatement.setString(2, moderador.getSenha());
            preparedStatement.setString(3, moderador.getEmail());
            preparedStatement.setInt(4, moderador.getCodigo());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void excluirModerador(int moderadorId) {
        try (Connection connection = DriverManager.getConnection(URL, USUARIO, SENHA);
             PreparedStatement preparedStatement = connection.prepareStatement(EXCLUIR_MODERADOR)) {

            preparedStatement.setInt(1, moderadorId);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
