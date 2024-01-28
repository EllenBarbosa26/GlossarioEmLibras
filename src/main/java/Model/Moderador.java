package Model;

public class Moderador extends Usuario {
    private int codigo;

    public Moderador(String nome, String email, String senha, int codigo) {
        super(nome, email, senha);
        this.codigo = codigo;
    }


    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
}
