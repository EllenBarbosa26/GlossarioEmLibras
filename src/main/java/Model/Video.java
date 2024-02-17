package Model;

import java.util.Date;

public class Video {
    private int videoId;
    private String title;
    private String arquivoUrl;
    private Date uploadDate;
    private int userId;
    private int categoryId;

    public Video(int videoId, String title, String arquivoUrl, Date uploadDate, int userId, int categoryId) {
        this.videoId = videoId;
        this.title = title;
        this.arquivoUrl = arquivoUrl;
        this.uploadDate = uploadDate;
        this.userId = userId;
        this.categoryId = categoryId;
    }
    public Video(String title, String arquivoUrl, int userId, int categoryId) {
        this.title = title;
        this.arquivoUrl = arquivoUrl;
        this.userId = userId;
        this.categoryId = categoryId;
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

    public String getArquivoUrl() {
        return arquivoUrl;
    }

    public void setArquivoUrl(String arquivoUrl) {
        this.arquivoUrl = arquivoUrl;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}