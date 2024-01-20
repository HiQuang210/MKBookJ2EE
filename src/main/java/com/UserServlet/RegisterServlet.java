package com.UserServlet;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import com.Entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String password=request.getParameter("password");
            String confirmpass=request.getParameter("confirmpass");


            System.out.println(firstname + " " + lastname + " " + email + " " + phone + " " + password + " " + confirmpass + " ");

            User user = new User();
            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);
            HttpSession session = request.getSession();
            session.removeAttribute("succMsg");
            session.removeAttribute("failMsg");
            if (password.equals(confirmpass)) {
                UserDAOimpl dao = new UserDAOimpl(DBConnect.getConnection());
                if (dao.isEmailExists(email)) {
                    System.out.println("Email already exists");
                    session.setAttribute("failMsg", "The entered email is already registered.");
                    response.sendRedirect("Register.jsp");
                } else {
                    boolean check = dao.UserRegister(user);
            
                    if (check) {
                        System.out.println("User registration successfully");
                        session.setAttribute("succMsg", "Registration successfully.");
                        response.sendRedirect("Register.jsp");
                    } else {
                        System.out.println("Something went wrong");
                        session.setAttribute("failMsg", "Something went wrong, please try again.");
                        response.sendRedirect("Register.jsp");
                    }
                }
            } else {
                session.setAttribute("failMsg", "Passwords do not match.");
                response.sendRedirect("Register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
