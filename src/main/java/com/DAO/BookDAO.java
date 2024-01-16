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
}
