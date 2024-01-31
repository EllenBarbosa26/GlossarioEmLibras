package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/?user=root";
    private static final String USUARIO = "root";
    private static final String SENHA = "@102938luk";

    private static final String INSERIR_USUARIO = "INSERT INTO user (username, password, email) VALUES (?, ?, ?)";
    private static final String OBTENER_USUARIO_POR_ID = "SELECT * FROM user WHERE user_id = ?";

    private Connection obterConexao() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, SENHA);
    }

    public Usuario inserirUsuario(String username, String password, String email) {
        try (Connection conexao = obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(INSERIR_USUARIO)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, email);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Usuario obterUsuarioPorId() {
        try (Connection conexao = obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(OBTENER_USUARIO_POR_ID)) {
            int userId = 0;
            pstmt.setInt(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuario = new Usuario(
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getInt("user_id")
                    );
                    return usuario;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


}