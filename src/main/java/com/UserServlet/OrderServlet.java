package com.UserServlet;
import java.io.IOException;

import com.DAO.ItemDAO;
import com.DAO.ItemDAOimpl;
import com.DAO.OrderDAO;
import com.DAO.OrderDAOimpl;
import com.DB.DBConnect;
import com.Entity.Order;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("id"));
            double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
            String paymentType = request.getParameter("payment");
            Order order = new Order();
            order.setUserId(userId);
            order.setAmount(totalPrice);
            order.setPaymentType(paymentType);

            OrderDAO orderDAO = new OrderDAOimpl(DBConnect.getConnection());
            boolean orderAdded = orderDAO.addOrder(order);
            if (orderAdded) {
                // Update the orderId in the item table for the user
                ItemDAO itemDAO = new ItemDAOimpl(DBConnect.getConnection());
                boolean orderIdUpdated = itemDAO.updateOrderIdByUserId(userId, order.getOrderId());

                if (orderIdUpdated) {
                    System.out.println("Order placed successfully. Order ID: " + order.getOrderId());
                    response.sendRedirect("OrderSuccess.jsp");
                } else {
                    System.out.println("Error: Failed to update orderId in the item table");
                    // You can redirect or set an error message here
                }
            } else {
                System.out.println("Error: Failed to add order to the database");
                // You can redirect or set an error message here
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
