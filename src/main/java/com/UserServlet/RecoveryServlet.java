package com.UserServlet;
import java.io.IOException;
import com.DAO.UserDAO;
import com.DAO.UserDAOimpl;
import com.DB.DBConnect;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
@WebServlet("/recovery")
public class RecoveryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");

            // Check if email is submitted
            if (email != null && !email.isEmpty()) {
                processEmailSubmission(request, response, email);
            } else {
                processPasscodeSubmission(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void processEmailSubmission(HttpServletRequest request, HttpServletResponse response, String email)
            throws ServletException, IOException {
        try {
            boolean emailExists = checkIfEmailExists(email);
            if (emailExists) {
                String passcode = generatePasscode();
                request.getSession().setAttribute("resetEmail", email);
                storePasscodeInSession(request, passcode);
                sendEmail(email, passcode);
                request.getSession().setAttribute("succMsg", "A password reset email has been sent to your email. If you do not see it, check your Gmail spam folder.");
                request.getSession().setAttribute("validEmail", true);
            } else {
                request.getSession().setAttribute("failMsg", "Your entered email is not connected to any account.");
                request.getSession().setAttribute("validEmail", false);
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("ForgotPass.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void processPasscodeSubmission(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String passcode = request.getParameter("passcode");
            String storedPasscode = (String) request.getSession().getAttribute("passcode");

            if (passcode != null && storedPasscode != null && passcode.equals(storedPasscode)) {
                request.getSession().setAttribute("validPasscode", true);
                response.sendRedirect("ResetPass.jsp");
            } else {
                request.getSession().setAttribute("passcodeErrorMsg", "Invalid passcode. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("ForgotPass.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void sendEmail(String to, String passcode) {

        String from = "hongquang395@gmail.com"; 

        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.setProperty("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, "shtiyuuqpogjjijc"); 
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Password Reset");
            message.setText("Your password reset passcode is: " + passcode);
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    private boolean checkIfEmailExists(String email) {
        UserDAO userDAO = new UserDAOimpl(DBConnect.getConnection()); 
        return userDAO.getUserByEmail(email) != null;
    }

    private String generatePasscode() {
        return String.valueOf((int) (Math.random() * 900000 + 100000));
    }

    private void storePasscodeInSession(HttpServletRequest request, String passcode) {
        request.getSession().setAttribute("passcode", passcode);
    }
}

