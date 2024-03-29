package com.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                book.setQuantity(rs.getInt(9)); 
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
                book.setQuantity(rs.getInt(9)); 
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
            String sql = "SELECT * FROM book WHERE bookStatus = 'Active' AND quantity > 0 ORDER BY bookId DESC";
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
                book.setQuantity(rs.getInt(9)); 
                list.add(book);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Book> getAllNewBooks() {
        List<Book> list = new ArrayList<Book>();
        Book book = null;
        try {
            String sql = "SELECT * FROM book WHERE bookStatus = 'Active' AND quantity > 0 ORDER BY bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                book = new Book();
                book.setBookId(rs.getInt(1));
                book.setBookName(rs.getString(2));
                book.setAuthor(rs.getString(3));
                book.setPrice(rs.getInt(4));
                book.setGenres(rs.getString(5));
                book.setBookStatus(rs.getString(6));
                book.setPhoto(rs.getString(7));
                book.setEmail(rs.getString(8));
                book.setQuantity(rs.getInt(9)); 
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getBookNameOptions() {
        List<String> options = new ArrayList<>();
        try {
            String sql = "SELECT DISTINCT bookname FROM book";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                options.add(rs.getString("bookname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return options;
    }

    public String getBookPhotoByName(String bookName) {
        String photo = null;
        try {
            String sql = "SELECT photo FROM book WHERE bookname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                photo = rs.getString("photo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return photo;
    }
    public String getBookAuthorByName(String bookName) {
        String author = "";
        try {
            String sql = "SELECT author FROM book WHERE bookname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                author = rs.getString("author");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return author;
    }
    public int getPriceByName(String bookName) {
        int price = 0;
        try {
            String sql = "SELECT price FROM book WHERE bookname=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, bookName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                price = rs.getInt("price");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return price;
    }
    public boolean addBookQuantity(String bookName, int quantity) {
        boolean check = false;
        try {
            String sql = "UPDATE book SET quantity = quantity + ? WHERE bookname = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setString(2, bookName);

            int i = ps.executeUpdate();
            if (i == 1) {
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
    
    public int getSoldCopyByName(String bookName) {
    int soldCopy = 0;

    try {
        String sql = "SELECT soldcopy FROM book WHERE bookname = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, bookName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                soldCopy = rs.getInt("soldcopy");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return soldCopy;
    }

    public List<Book> getBookBySearch(String ch) {
        List<Book> list = new ArrayList<Book>();
        Book book = null;
        try {
            String sql = "SELECT * FROM book WHERE bookname like ? OR author like ? OR genres like ? AND bookstatus =?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "Active");
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
                book.setQuantity(rs.getInt(9)); 
                list.add(book);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
}
