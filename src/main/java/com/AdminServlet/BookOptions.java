package com.AdminServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.BookDAOimpl;
import com.DB.DBConnect;
@WebServlet("/booknameoptions")
public class BookOptions extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Assuming you have a method in your DAO to get book name options
        BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
        List<String> options = dao.getBookNameOptions();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        for (String option : options) {
            out.println("<option value='" + option + "'>" + option + "</option>");
        }
        out.close();
    }
}
