package com.AdminServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.DAO.BookDAO;
import com.DAO.BookDAOimpl;
import com.Entity.Book;
import com.DB.DBConnect;
@WebServlet("/importbook")
public class ImportBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String bookName = request.getParameter("bookName");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<Book> exportBooks = (List<Book>) session.getAttribute("exportBooks");

        if (exportBooks == null) {
            exportBooks = new ArrayList<>();
        }
        boolean bookExists = false;
        for (Book book : exportBooks) {
            if (book.getBookName().equals(bookName)) {
                book.setQuantity(book.getQuantity() + quantity);
                bookExists = true;
                break;
            }
        }

        if (!bookExists) {
            BookDAO dao = new BookDAOimpl(DBConnect.getConnection());
            int price = dao.getPriceByName(bookName);
            Book importedBook = new Book(bookName, "", price, "", "", "", "", quantity);
            exportBooks.add(importedBook);
        }
        session.setAttribute("exportBooks", exportBooks);
        out.println("Book imported successfully to ExportInvoice table.");
    }
}
