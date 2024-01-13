package com.AdminServlet;
import java.io.File;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
import com.Entity.Book;
@WebServlet("/edit_books")
@MultipartConfig
public class BookEdit extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String bookName = request.getParameter("bookname");
            String author = request.getParameter("author");
            int price = Integer.parseInt(request.getParameter("price"));
            String selectedTags = request.getParameter("selectedTags");
            String genres = selectedTags;
            String bookStatus = request.getParameter("bookstatus");
            Part part = request.getPart("bookimg");

            String fileName = null;
            if (part != null && part.getSize() > 0) {
                fileName = part.getSubmittedFileName();
            }
    
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
            Book existingBook = dao.getBookById(id);
    
            // Create a new Book object with updated information
            Book updatedBook = new Book();
            updatedBook.setBookId(id);
            updatedBook.setBookName(bookName);
            updatedBook.setAuthor(author);
            updatedBook.setPrice(price);
            updatedBook.setGenres(genres);
            updatedBook.setBookStatus(bookStatus);
    
            // Set the photo to the existing photo if no new image is uploaded
            if (fileName != null) {
                updatedBook.setPhoto(fileName);
            } else {
                updatedBook.setPhoto(existingBook.getPhoto());
            }
    
            boolean check = dao.updateBooks(updatedBook);
            HttpSession session = request.getSession();
            if (check) {
                if (fileName != null) {
                    // Upload the new image only if an image is uploaded
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "Images";
                    System.out.println("Path for updating image: " + uploadPath);
    
                    File imagesDir = new File(uploadPath);
                    if (!imagesDir.exists()) {
                        imagesDir.mkdirs();
                    }
    
                    part.write(uploadPath + File.separator + fileName);
                }
    
                session.setAttribute("succMsg", "Book updated successfully");
                response.sendRedirect("Admin/Books.jsp");
            } else {
                session.setAttribute("failMsg", "Something went wrong...");
                response.sendRedirect("Admin/Books.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
