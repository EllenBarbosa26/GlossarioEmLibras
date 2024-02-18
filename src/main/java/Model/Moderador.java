package Model;

public class Moderador extends Usuario {
    private int codigo;

    public Moderador(String nome, String email, String senha, int codigo) {
        super(nome, email, senha);
        this.codigo = codigo;
    }

    // Corrigindo o construtor
    public Moderador(String nome, String senha, String email) {
        super(nome, senha, email);
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }




}
