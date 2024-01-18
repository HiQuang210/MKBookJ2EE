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

@WebServlet("/change_password")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String oldPassword = request.getParameter("oldpass");
            String newPassword = request.getParameter("newpass");
            String confirmPassword = request.getParameter("confirmpass");

            HttpSession session = request.getSession();
            UserDAOimpl dao = new UserDAOimpl(DBConnect.getConnection());
            boolean check = dao.checkPassword(id, oldPassword);

            if (check && newPassword.equals(confirmPassword)) {
                User user = new User();
                user.setId(id);
                user.setPassword(newPassword);
                dao.updatePassword(user);
                session.setAttribute("succMsg", "Password updated successfully.");
                response.sendRedirect("ChangePassword.jsp");
            } else {
                session.setAttribute("failMsg", "Incorrect old password or new passwords do not match.");
                response.sendRedirect("ChangePassword.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
