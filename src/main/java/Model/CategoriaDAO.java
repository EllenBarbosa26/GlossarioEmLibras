package Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    private static final String URL = "jdbc:mysql://127.0.0.1:3306/librasdev?user=root";
    private static final String USUARIO = "root";
    private static final String SENHA = "@102938luk";

    private static final String TABLE_NAME = "category";
    private static final String COLUMN_ID = "category_id";
    private static final String COLUMN_NAME = "name";
    private static final String COLUMN_DESCRIPTION = "description";
    private static final String COLUMN_IMAGE  = "image_path";



    private Connection obterConexao() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, SENHA);
    }


    public CategoriaDAO() {

    }

    public void insert(Categoria categoria) throws SQLException {
        String sql = "INSERT INTO " + TABLE_NAME + " (" + COLUMN_NAME + ", " + COLUMN_DESCRIPTION + ", " + COLUMN_IMAGE + ") VALUES (?, ?, ?)";
        try (Connection conexao = obterConexao();
             PreparedStatement psmt = conexao.prepareStatement(sql)){

            psmt.setString(1, categoria.getNome());
            psmt.setString(2, categoria.getDescricao());
            psmt.setString(3, categoria.getImage());

            psmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace(); // Adicione um tratamento adequado de exceções aqui
        }
    }

    public void update(Categoria categoria) throws SQLException {
        String sql = "UPDATE " + TABLE_NAME + " SET " + COLUMN_NAME + " = ?, " + COLUMN_DESCRIPTION + " = ?, " + COLUMN_IMAGE + " = ? WHERE " + COLUMN_ID + " = ?";
        try (Connection conexao = obterConexao();
             PreparedStatement psmt = conexao.prepareStatement(sql)) {
            psmt.setString(1, categoria.getNome());
            psmt.setString(2, categoria.getDescricao());
            psmt.setString(3, categoria.getImage());
            psmt.setInt(4, categoria.getId());
            psmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int categoriaId) throws SQLException {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE " + COLUMN_ID + " = ?";
        try (Connection conexao = obterConexao();
             PreparedStatement psmt = conexao.prepareStatement(sql)) {
            psmt.setInt(1, categoriaId);
            psmt.executeUpdate();
        }
    }

    public List<Categoria> getAllCategorias() {
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (Connection conexao = obterConexao();
             PreparedStatement psmt = conexao.prepareStatement(sql);
             ResultSet resultSet = psmt.executeQuery()) {
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getInt(COLUMN_ID));
                categoria.setNome(resultSet.getString(COLUMN_NAME));
                String descricao = resultSet.getString(COLUMN_DESCRIPTION);
                categoria.setDescricao(descricao != null ? descricao : "");
                String imagem = resultSet.getString(COLUMN_IMAGE);
                categoria.setImage(imagem != null ? imagem : "");
                categorias.add(categoria);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;
    }

    public List<Categoria> pesquisarCategorias(String termoPesquisa) throws SQLException {
        List<Categoria> categoriasEncontradas = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME + " WHERE " + COLUMN_NAME + " LIKE ?";
        try (Connection conexao = obterConexao();
             PreparedStatement psmt = conexao.prepareStatement(sql)) {
            psmt.setString(1, "%" + termoPesquisa + "%");
            try (ResultSet resultSet = psmt.executeQuery()) {
                while (resultSet.next()) {
                    Categoria categoria = new Categoria();
                    categoria.setId(resultSet.getInt(COLUMN_ID));
                    categoria.setNome(resultSet.getString(COLUMN_NAME));
                    String descricao = resultSet.getString(COLUMN_DESCRIPTION);
                    categoria.setDescricao(descricao != null ? descricao : "");
                    String imagem = resultSet.getString(COLUMN_IMAGE);
                    categoria.setImage(imagem != null ? imagem : "");
                    categoriasEncontradas.add(categoria);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoriasEncontradas;
    }

}