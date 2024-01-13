package com.AdminServlet;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
@WebServlet("/delete_book")
public class BookDelete extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request (displaying information or confirmation page, if needed)
        // ...
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
            boolean check = dao.deleteBook(id);
            HttpSession session = request.getSession();
            if (check) {
                session.setAttribute("succMsg", "Book deleted successfully");
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

