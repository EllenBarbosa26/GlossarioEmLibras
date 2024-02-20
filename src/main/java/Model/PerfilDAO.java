package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PerfilDAO {
    private Connection conexao;

    public PerfilDAO() {
    }

    public void inserirPerfil(Perfil perfil) throws SQLException {
        String sql = "INSERT INTO profile (nome, email, biografia, foto) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, perfil.getNome());
            ps.setString(2, perfil.getEmail());
            ps.setString(4, perfil.getBiografia());
            ps.setString(5, perfil.getFoto());
            ps.executeUpdate();
        }
    }

    public void editarPerfil(Perfil perfil) throws SQLException {
        String sql = "UPDATE profile SET name = ?, bio = ?, avatar_url = ? WHERE email = ?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, perfil.getNome());
            ps.setString(2, perfil.getBiografia());
            ps.setString(3, perfil.getFoto());
            ps.setString(4, perfil.getEmail());
            ps.executeUpdate();
        }
    }



}
