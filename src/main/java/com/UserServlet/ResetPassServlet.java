package com.UserServlet;

import com.DAO.UserDAO;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.Entity.User;

import java.io.IOException;

@WebServlet("/resetpass")
public class ResetPassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean validEmail = (boolean) request.getSession().getAttribute("validEmail");
        try {
            if (validEmail) {
                String newPassword = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmpass");
    
                if (newPassword.equals(confirmPassword)) {
                    updateUserPassword(request, newPassword);
                    request.getSession().setAttribute("succMsg", "Password updated successfully.");
                    request.getSession().removeAttribute("resetEmail");
                    request.getSession().removeAttribute("validEmail");
                    request.getSession().removeAttribute("validPasscode");
                    response.sendRedirect("Login.jsp");
                } else {
                    request.getSession().setAttribute("failMsg", "Passwords do not match.");
                    response.sendRedirect("ResetPass.jsp");
                }
            } else {
                response.sendRedirect("ForgotPass.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateUserPassword(HttpServletRequest request, String newPassword) {
        try {
            String email = (String) request.getSession().getAttribute("resetEmail");
            boolean validEmail = (boolean) request.getSession().getAttribute("validEmail");
    
            if (validEmail && email != null) {
                UserDAO userDAO = new UserDAOimpl(DBConnect.getConnection());
                User user = userDAO.getUserByEmail(email);
    
                if (user != null) {
                    user.setPassword(newPassword);
                    userDAO.updateUser(user);
                }
            } else {
                // Handle the case where the email is not valid or not present
                System.out.println("Invalid email or email not present in session");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
