package Model;

public class Moderador extends Usuario {
    private int codigo;

    public Moderador(String nome, String s, String email, String senha) {
        super(nome, email);
        this.codigo = codigo;
    }


    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
}
