package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import com.Entity.Book;
public class BookDAOimpl implements BookDAO{
    private Connection conn;
    public BookDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    public boolean addBook(Book book) {
        boolean check = false;
        try {
            String sql = "INSERT INTO book(bookname,author,price,genres,bookstatus,photo,email) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setInt(3, book.getPrice());
            ps.setString(4, book.getGenres());
            ps.setString(5, book.getBookStatus());
            ps.setString(6, book.getPhoto());
            ps.setString(7, book.getEmail());

            int i = ps.executeUpdate();
            if(i == 1) {
                check = true;
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<Book>();
        Book book = null;
        try {
            String sql = "SELECT * FROM book";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getInt(4));
                book.setGenres(rs.getString(5));
                book.setBookStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Book getBookById(int id) {        
    Book book = null;
        try {
            String sql = "SELECT * FROM book WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getInt(4));
                book.setGenres(rs.getString(5));
                book.setBookStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }
    public boolean updateBooks(Book book) {
        boolean check = false;
        try {
            String sql = "UPDATE book SET bookname = ?, author = ?, price = ?, genres = ?, bookstatus = ?, photo = ? WHERE bookId =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthor());
            ps.setInt(3, book.getPrice());
            ps.setString(4, book.getGenres());
            ps.setString(5, book.getBookStatus());
            ps.setString(6, book.getPhoto());
            ps.setInt(7, book.getBookId());
            int i = ps.executeUpdate();
            if (i == 1)
            {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public boolean deleteBook(int id) {
        boolean check = false;
        try {
            String sql = "DELETE FROM book WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    public List<Book> getNewBooks() {
        List<Book> list = new ArrayList<Book>();
        Book book = null;
        try {
            String sql = "SELECT * FROM book WHERE bookStatus = 'Active' ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getInt(4));
                book.setGenres(rs.getString(5));
                book.setBookStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                list.add(book);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
