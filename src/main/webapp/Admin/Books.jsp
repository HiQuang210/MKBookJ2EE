<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin:Books</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
</head>
<body style="background-color: #F8F8F8;">
<%@ include file="navbar.jsp" %>
<h1 class="text-center">Hello Admin!</h1>
<c:if test="${not empty succMsg}">
  <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 16px">${succMsg}</p>
  <c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failMsg}">
  <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 16px">${failMsg}</p>
  <c:remove var="failMsg" scope="session"/>
</c:if>
<table class="table table-striped">
    <thead class="bg-dark text-white">
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Book cover</th>
        <th scope="col">Book name</th>
        <th scope="col">Author</th>
        <th scope="col">Price</th>
        <th scope="col">Genres</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
      </tr>
    </thead>
    <tbody>
      <%
      BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
      List<Book> list = dao.getAllBooks();
      for (Book book : list) {
        %>
        <tr>
          <td><%=book.getBookId() %></td>
          <td><img src="../Images/<%=book.getPhoto()%>" style="width:75px; height: 100px;"></td>
          <td><%=book.getBookName()%></td>
          <td><%=book.getAuthor()%></td>
          <td><%=book.getPrice()%> VND</td>
          <td><%=book.getGenres()%></td>
          <td><%=book.getBookStatus()%></td>
          <td>
            <a href="EditBook.jsp?id=<%=book.getBookId()%>" class="btn btn-primary">Edit</a>
            <form action="../delete_book" method="post" style="display: inline;">
                <input type="hidden" name="id" value="<%=book.getBookId()%>">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </td>
        </tr>
        <%
      }
      %>
    </tbody>
  </table>

</div>
</body>
</html>