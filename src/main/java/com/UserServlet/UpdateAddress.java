package com.UserServlet;

import java.io.IOException;

import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_address")
public class UpdateAddress extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            int zipcode = Integer.parseInt(request.getParameter("zipcode"));
            User user = new User();
            user.setId(id);
            user.setAddress(address);
            user.setCity(city);
            user.setZipcode(zipcode);
            UserDAOimpl dao = new UserDAOimpl(DBConnect.getConnection());
            HttpSession session = request.getSession();
            boolean check = dao.updateAddress(user);

            if (check) {
                session.setAttribute("succMsg", "Address updated successfully.");
                response.sendRedirect("EditAddress.jsp");
            } else {
                session.setAttribute("failMsg", "Failed to update address. Please try again.");
                response.sendRedirect("EditAddress.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

