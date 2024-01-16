package com.AdminServlet;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.BookDAO;
import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
@WebServlet("/bookaddquantity")
public class BookAddQuantity extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookName = request.getParameter("bookName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        BookDAO dao = new BookDAOimpl(DBConnect.getConnection());
        boolean success = dao.addBookQuantity(bookName, quantity);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(success ? "Quantity updated successfully" : "Failed to update quantity");
    }
    
}
