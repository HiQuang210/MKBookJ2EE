package com.UserServlet;
import java.io.IOException;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.Entity.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/update_profile")
public class ProfileUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String oldPassword = request.getParameter("oldpass");
            String newPassword = request.getParameter("newpass");
            String confirmNewPassword = request.getParameter("confirmpass");

            HttpSession session = request.getSession();
            UserDAOimpl dao = new UserDAOimpl(DBConnect.getConnection());

            boolean isPasswordMatch = dao.checkPassword(id, oldPassword);

            if (isPasswordMatch && newPassword.equals(confirmNewPassword)) {
                User user = new User();
                user.setId(id);
                user.setPassword(newPassword);

                boolean isPasswordUpdated = dao.updatePassword(user);

                if (isPasswordUpdated) {
                    session.setAttribute("succMsg", "Password updated successfully.");
                    response.sendRedirect("ChangePassword.jsp");
                } else {
                    session.setAttribute("failMsg", "Something went wrong...");
                    response.sendRedirect("ChangePassword.jsp");
                }
            } else {
                session.setAttribute("failMsg", "Incorrect old password or new passwords do not match.");
                response.sendRedirect("ChangePassword.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

