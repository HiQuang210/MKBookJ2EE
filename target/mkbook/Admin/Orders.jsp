<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin:Orders</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
</head>
<body style="background-color: #F8F8F8;">
<%@ include file="navbar.jsp" %>
<h1 class="text-center">Hello Admin!</h1>
<table class="table table-striped">
    <thead class="bg-dark text-white">
      <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Phone</th>
        <th scope="col">Books Purchased</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">1</th>
        <td>Hikari</td>
        <td>hgdushguh@gmail.com</td>
        <td>86 dsfdsf, st2</td>
        <td>0294923049</td>
        <td>Book1, Book2 x2, Book3</td>
        <td>499.000VND</td>
        <td>COD</td>
      </tr>
    </tbody>
  </table>

</div>
</body>
</html>