public class Play {
    private String title;
    private String author;
    private String genre;
    
    public Play() {
        title = '';
        author = '';
        genre = '';
    }
    
    public Play(String pTitle, String pAuthor, String pGenre) {
        title = pTitle;
        author = pAuthor;
        genre = pGenre;
    }
    
    public String getTitle() {
        return title;
    }
    
    public String getAuthor() {
        return author;
    }
    
    public String getGenre() {
        return genre;
    }
    
    public void setTitle(String pTitle) {
        title = pTitle;
    }
    
    public void setAuthor(String pAuthor) {
        author = pAuthor;
    }
    
    public void setGenre(String pGenre) {
        genre = pGenre;
    }
    
    public void display () {
        System.debug('Title: ' + title + ' Author: ' + author + ' Genre: ' + genre);
    }
}