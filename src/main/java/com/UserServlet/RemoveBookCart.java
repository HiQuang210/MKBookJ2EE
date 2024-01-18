package com.UserServlet;
import java.io.IOException;

import com.DAO.ItemDAOimpl;
import com.DB.DBConnect;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bid = Integer.parseInt(request.getParameter("bid"));
        int uid = Integer.parseInt(request.getParameter("uid"));
        ItemDAOimpl dao = new ItemDAOimpl(DBConnect.getConnection());
        boolean check = dao.deleteBook(bid, uid);
        HttpSession session = request.getSession();
        if(check)
        {
            session.setAttribute("succMsg", "Book removed from cart");
            response.sendRedirect("Cart.jsp");
        } else {
            session.setAttribute("failMsg", "Something went wrong...");
            response.sendRedirect("Cart.jsp");
        }
    }
}
