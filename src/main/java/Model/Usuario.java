package Model;

import java.sql.*;

public class Usuario {

    private String nome;
    private String email;
    private String senha;
    private String avatar_url;
    private String bio;
    private int codigo;


//    public Usuario(String nome, String email) {
//        this.nome = nome;
//        this.email = email;
//    }

    public Usuario(String nome, String senha, String email) {
        this.nome = nome;
        this.senha = senha;
        this.email = email;
    }

    public Usuario(String nome, String email, String senha, int codigo) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.codigo = codigo;
    }

    public Usuario(String nome) {
    }

    public Usuario(String avatar_url, String bio){
        this.avatar_url = avatar_url;
        this.bio = bio;
    }

    public Usuario(String nome, String email, String senha, String avatar_url, String bio, int codigo) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
        this.avatar_url = avatar_url;
        this.bio = bio;
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }


    public String getUsername() {
        return nome;
    }

    public String getPassword() {
        return senha;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getNomeUsuarioPorID(int usuarioID) {
        String nomeUsuario = "";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/librasdev?user=root", "root", "@102938luk");

            String query;
            if (usuarioID < 1000) { // Assumindo que IDs de usuário são menores que 1000
                query = "SELECT username FROM user WHERE id = ?";
            } else {
                query = "SELECT username FROM admin WHERE id = ?";
            }

            stmt = conn.prepareStatement(query);
            stmt.setInt(1, usuarioID);
            rs = stmt.executeQuery();

            if (rs.next()) {
                nomeUsuario = rs.getString("username");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return nomeUsuario;
    }


}