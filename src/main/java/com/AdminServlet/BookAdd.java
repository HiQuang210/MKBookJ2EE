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
import com.Entity.User;
@WebServlet("/add_books")
@MultipartConfig
public class BookAdd extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String bookName=request.getParameter("bookname");
            String author=request.getParameter("author");
            int price = Integer.parseInt(request.getParameter("price"));
            String selectedTags = request.getParameter("selectedTags");
            String genres = selectedTags;
            String bookStatus=request.getParameter("bookstatus");
            Part part=request.getPart("bookimg");
            String fileName=part.getSubmittedFileName();

            Book book=new Book(bookName, author, price, genres, bookStatus, fileName, "admin", 0, 0);
            System.out.println(book);

            BookDAOimpl dao=new BookDAOimpl(DBConnect.getConnection());
            boolean check=dao.addBook(book);
            HttpSession session=request.getSession();
            User user = (User) session.getAttribute("userobj");
            if (user == null) {
                // User is not authenticated, redirect to login page
                session.setAttribute("failMsg", "You are not logged in. Please log in to continue.");
                response.sendRedirect("Login.jsp");
                return; // Exit the servlet
            }
            if (check) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "Images";
            
                System.out.println("Path for saving image: " + uploadPath); 

                File imagesDir = new File(uploadPath);
                if (!imagesDir.exists()) {
                    imagesDir.mkdirs();
                }
            
                part.write(uploadPath + File.separator + fileName);
            
                session.setAttribute("succMsg", "Book added successfully");
                response.sendRedirect("Admin/AddBook.jsp");
            } else {
                session.setAttribute("failMsg", "Something went wrong...");
                response.sendRedirect("Admin/AddBook.jsp");
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
