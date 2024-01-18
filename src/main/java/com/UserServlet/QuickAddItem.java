package com.UserServlet;
import java.io.IOException;
import com.DAO.ItemDAOimpl;
import com.DB.DBConnect;
import com.Entity.Item;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/quickadditem")
public class QuickAddItem extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int uid=Integer.parseInt(request.getParameter("uid"));
            int bid=Integer.parseInt(request.getParameter("bid"));
            Item item = new Item();
            item.setUserId(uid);
            item.setBookId(bid);
            item.setQuantity(1);
            ItemDAOimpl dao = new ItemDAOimpl(DBConnect.getConnection());
            boolean check = dao.addCart(item);

            HttpSession session = request.getSession();
            if (check) {
                session.setAttribute("addCart","Book Added to cart");
                response.sendRedirect("AllRecent.jsp");
                System.out.println("Add item to cart success");
            } else {
                session.setAttribute("failed","Something went wrong...");
                System.out.println("Not registered to cart");
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }    
    }
}
