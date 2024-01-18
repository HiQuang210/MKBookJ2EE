package com.UserServlet;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.Entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserDAOimpl dao=new UserDAOimpl(DBConnect.getConnection());
            HttpSession session=request.getSession(); 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            if ("admin@gmail.com".equals(email)) {
                User admin = dao.getUserByEmail("admin@gmail.com");

                if (admin != null && password.equals(admin.getPassword())) {
                    session.setAttribute("userobj", admin);
                    response.sendRedirect("Admin/HomeAdmin.jsp");
                } else {
                    session.setAttribute("failMsg", "Email or password entered is incorrect");
                    response.sendRedirect("Login.jsp");
                }
            } else {

                User user=dao.Login(email, password);
                if(user!=null) {
                    session.setAttribute("userobj", user);
                    response.sendRedirect("index.jsp");
                } else {
                    session.setAttribute("failMsg", "Email or password entered is incorrect");
                    response.sendRedirect("Login.jsp");
                }
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
