package Model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class Perfil extends Usuario {
    private String biografia;
    private byte[] foto;

    public Perfil(String nome, String email, String senha, String biografia, byte[] foto) {
        super(nome, email, senha);
        this.biografia = biografia;
        this.foto = foto;
    }

    private byte[] carregarFoto(String caminhoDaFoto) throws IOException {
        File arquivoFoto = new File(caminhoDaFoto);
        BufferedImage imagem = ImageIO.read(arquivoFoto);

        // Convertendo a imagem para um array de bytes
        return convertImageToByteArray(imagem);
    }

    private byte[] convertImageToByteArray(BufferedImage imagem) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        // Escrever a imagem no stream de bytes no formato desejado (por exemplo, JPEG)
        ImageIO.write(imagem, "jpg", baos);

        // Fechar o stream
        baos.flush();
        baos.close();

        // Obter os bytes da imagem
        return baos.toByteArray();
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

}
