package com.Entity;

public class Book {
    private int bookId;
    private String bookName;
    private String author;
    private int price;
    private String genres;
    private String bookStatus;
    private String photo;
    private String email;
    private int quantity;
    private int soldCopy;
    public Book() {
        super();
    }
    public Book(String bookName, String author, int price, String genres, String bookStatus, String photo, String email, int quantity, int soldCopy) {
        super();
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.genres = genres;
        this.bookStatus = bookStatus;
        this.photo = photo;
        this.email = email;
        this.quantity = quantity;
        this.soldCopy = soldCopy;
    }
    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
    public String getBookName() {
        return bookName;
    }
    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public int getPrice() {
        return price;
    }
    public void setPrice(int price) {
        this.price = price;
    }
    public String getGenres() {
        return genres;
    }
    public void setGenres(String genres) {
        this.genres = genres;
    }
    public String getBookStatus() {
        return bookStatus;
    }
    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }
    public String getPhoto() {
        return photo;
    }
    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public int getSoldCopy() {
        return soldCopy;
    }
    public void setSoldCopy(int soldCopy) {
        this.soldCopy = soldCopy;
    }
    public String toString() {
        return "Book [bookId=" + bookId + ", bookName=" + bookName + ", author=" + author + ", price=" + price + ", genres=" + genres + ", bookstatus=" + bookStatus + ", photo=" + photo + ", email=" + email + ", quantity=" + quantity + " , soldCopy=" + soldCopy +"]";
    }
}
