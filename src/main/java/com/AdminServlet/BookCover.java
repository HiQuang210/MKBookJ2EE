package com.AdminServlet;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
@WebServlet("/bookcover")
public class BookCover extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookName = request.getParameter("bookname");
        BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
        String photo = dao.getBookPhotoByName(bookName);
        response.getWriter().write(photo);
    }
}
