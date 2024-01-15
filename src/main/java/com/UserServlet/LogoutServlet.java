package com.UserServlet;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("userobj");
            session.setAttribute("succMsg", "Logout Successfully");
            response.sendRedirect("Login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
