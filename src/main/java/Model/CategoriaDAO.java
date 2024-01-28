package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    private static final String TABLE_NAME = "category";
    private static final String COLUMN_ID = "category_id";
    private static final String COLUMN_NAME = "name";
    private static final String COLUMN_DESCRIPTION = "description";

    private Connection connection;

    public CategoriaDAO(Connection connection) {
        this.connection = connection;
    }

    public void insert(Categoria categoria) throws SQLException {
        String sql = "INSERT INTO " + TABLE_NAME + " (" + COLUMN_NAME + ", " + COLUMN_DESCRIPTION + ") VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, categoria.getNome());
            statement.setString(2, categoria.getDescricao());
            statement.executeUpdate();
        }
    }

    public void update(Categoria categoria) throws SQLException {
        String sql = "UPDATE " + TABLE_NAME + " SET " + COLUMN_NAME + " = ?, " + COLUMN_DESCRIPTION + " = ? WHERE " + COLUMN_ID + " = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, categoria.getNome());
            statement.setString(2, categoria.getDescricao());
            statement.setInt(3, categoria.getId());
            statement.executeUpdate();
        }
    }

    public void delete(int categoriaId) throws SQLException {
        String sql = "DELETE FROM " + TABLE_NAME + " WHERE " + COLUMN_ID + " = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, categoriaId);
            statement.executeUpdate();
        }
    }

    public List<Categoria> getAllCategorias() throws SQLException {
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM " + TABLE_NAME;
        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getInt(COLUMN_ID));
                categoria.setNome(resultSet.getString(COLUMN_NAME));
                String descricao = resultSet.getString(COLUMN_DESCRIPTION);
                categoria.setDescricao(descricao != null ? descricao : "");
                categorias.add(categoria);
            }
        }
        return categorias;
    }
}
