package Model;

public class Video {
    private int videoId;
    private String title;
    private Blob arquivo;
    private Date uploadDate;
    private int userId;
    private int category;

    public byte[] getArquivoBytes() {
        try {
            return arquivo.getBytes(1, (int) arquivo.length());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    public void setArquivoBytes(byte[] bytes) {
        try {
            this.arquivo = new javax.sql.rowset.serial.SerialBlob(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Blob getArquivo() {
        return arquivo;
    }

    public void setArquivo(Blob arquivo) {
        this.arquivo = arquivo;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }
}