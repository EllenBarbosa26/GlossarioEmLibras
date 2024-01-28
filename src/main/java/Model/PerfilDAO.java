package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PerfilDAO {
    private Connection conexao;

    public PerfilDAO(Connection conexao) {
        this.conexao = conexao;
    }

    public void inserirPerfil(Perfil perfil) throws SQLException {
        String sql = "INSERT INTO perfis (nome, email, senha, biografia, foto) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, perfil.getNome());
            ps.setString(2, perfil.getEmail());
            ps.setString(3, perfil.getSenha());
            ps.setString(4, perfil.getBiografia());
            ps.setBytes(5, perfil.getFoto());
            ps.executeUpdate();
        }
    }

    public Perfil obterPerfilPorEmail(String email) throws SQLException {
        String sql = "SELECT * FROM perfis WHERE email = ?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String nome = rs.getString("nome");
                    String senha = rs.getString("senha");
                    String biografia = rs.getString("biografia");
                    byte[] foto = rs.getBytes("foto");

                    return new Perfil(nome, email, senha, biografia, foto);
                }
            }
        }
        return null;
    }

}
