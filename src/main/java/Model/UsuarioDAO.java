package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/librasdev?user=root";
    private static final String USUARIO = "root";
    private static final String SENHA = "@102938luk";

    private static final String INSERIR_USUARIO = "INSERT INTO user (username, password, email) VALUES (?, ?, ?)";
    private static final String OBTENER_USUARIO_POR_ID = "SELECT * FROM user WHERE user_id = ?";
    private static final String OBTER_USUARIO_POR_NOME_OU_EMAIL = "SELECT * FROM user WHERE username = ? OR email = ?";
    private static final String OBTER_USUARIO_POR_NOME_EMAIL = "SELECT * FROM user WHERE username = ? AND email = ?";
    private static final String OBTER_USUARIO_POR_EMAIL_SENHA = "SELECT * FROM user WHERE email = ? AND password = ?";

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

    public Usuario obterUsuarioPorNomeOuEmail(Usuario usuario) {
        try (Connection conexao = obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(OBTER_USUARIO_POR_NOME_OU_EMAIL)) {
            pstmt.setString(1, usuario.getUsername());
            pstmt.setString(2, usuario.getEmail());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuarioBD = new Usuario(
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("avatar_url"),
                            rs.getString("bio"),
                            rs.getInt("user_id")
                    );
                    return usuarioBD;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    public Usuario obterUsuarioUserEEmail(Usuario usuario) {
        try (Connection conexao = obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(OBTER_USUARIO_POR_NOME_EMAIL)) {
            pstmt.setString(1, usuario.getUsername());
            pstmt.setString(2, usuario.getEmail());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuarioBD = new Usuario(
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getInt("user_id")
                    );
                    return usuarioBD;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Usuario obterUsuarioEmailESenha(Usuario usuario) {
        try (Connection conexao = obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(OBTER_USUARIO_POR_EMAIL_SENHA)) {
            pstmt.setString(1, usuario.getEmail());
            pstmt.setString(2, usuario.getSenha());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Usuario usuarioBD = new Usuario(
                            rs.getString("username"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getString("avatar_url"),
                            rs.getString("bio"),
                            rs.getInt("user_id")
                    );
                    return usuarioBD;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void editarUsuario(String email, String novoAvatarUrl, String novaBio) {
        String editarUsuarioQuery = "UPDATE user SET avatar_url = ?, bio = ? WHERE email = ?";

        try (Connection conexao = obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(editarUsuarioQuery)) {

            pstmt.setString(1, novoAvatarUrl);
            pstmt.setString(2, novaBio);
            pstmt.setString(3, email);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}