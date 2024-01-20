package com.UserServlet;
import java.io.IOException;
import com.DAO.ItemDAOimpl;
import com.DB.DBConnect;
import com.Entity.Item;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/additem")
public class AddItem extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String uidParam = request.getParameter("uid");
            String bidParam = request.getParameter("bid");
            String quantityParam = request.getParameter("quantity");

            if (uidParam != null && bidParam != null && quantityParam != null) {
                int uid = Integer.parseInt(uidParam);
                int bid = Integer.parseInt(bidParam);
                int quantity = Integer.parseInt(quantityParam);
                System.out.println("Quantity transferred to servlet: " + quantity);

                Item item = new Item();
                item.setUserId(uid);
                item.setBookId(bid);
                item.setQuantity(quantity);

                ItemDAOimpl dao = new ItemDAOimpl(DBConnect.getConnection());
                boolean check = dao.addCart(item);

                HttpSession session = request.getSession();
                if (check) {
                    session.setAttribute("addMoreCart", "Book Added to cart");
                    response.sendRedirect("ViewBook.jsp");
                    System.out.println("Add item to cart success");
                } else {
                    session.setAttribute("failed", "Something went wrong...");
                    System.out.println("Not registered to cart");
                }
            } else {
                System.out.println("One or more parameters are null");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

