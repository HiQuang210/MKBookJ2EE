package com.DAO;
import java.util.List;

import com.Entity.Book;

public interface BookDAO {
    public boolean addBook(Book book);
    public List<Book> getAllBooks();
    public Book getBookById(int id);
    public boolean updateBooks(Book book);
    public boolean deleteBook(int id);
    public List<Book> getNewBooks();
    public List<Book> getAllNewBooks();
    public String getBookPhotoByName(String bookName);
    public String getBookAuthorByName(String bookName);
    public int getSoldCopyByName(String bookName);
    public int getPriceByName(String bookName);
    public boolean addBookQuantity(String bookName, int quantity);
    public List<Book> getBookBySearch(String ch);
}
