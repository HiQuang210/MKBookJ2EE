<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.User" %>
<%@ page import="com.DAO.UserDAOimpl" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.Entity.Item" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DAO.ItemDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book Detail</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="Components/AllCss.jsp" %>
    <script>
      function enableOrderButton() {
        var paymentMethod = document.getElementById("inputState").value;
        var orderButton = document.getElementById("orderButton");

        if (paymentMethod !== "NoSelect") {
            orderButton.removeAttribute("disabled");
        } else {
            orderButton.setAttribute("disabled", "disabled");
        }
    }
  </script>
</head>
<c:if test="${empty userobj}">
    <c:redirect url="Login.jsp"/>
</c:if>
<c:if test="${not empty succMsg}">
    <div class="alert alert-success" role="alert">${succMsg}</div>
    <c:remove var="succMsg" scope="session"/>
</c:if>
<c:if test="${not empty failMsg}">
    <div class="alert alert-success" role="alert">${succMsg}</div>
    <c:remove var="failMsg" scope="session"/>
</c:if>
<body style="background-color: white;">
<%@ include file="Components/navbar.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 text-center border bg-white">
            <h3 class="mt-4 mb-3 text-center text-success fw-bold">Your Selected Items</h3>
            <table class="table table-striped">
                <thead>
                  <tr>
                    <th scope="col">Book Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Amount</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                    <%
                    User user = (User)session.getAttribute("userobj");
                    ItemDAOimpl dao = new ItemDAOimpl(DBConnect.getConnection());
                    List<Item> item = dao.getBookByUser(user.getId());
                    double totalPrice = 0.0;
                    for (Item i : item) {
                        totalPrice += i.getPrice();
                    %>
                    <tr>
                        <th scope="row"><%=i.getBookName()%></th>
                        <td scope = "row"><%=i.getQuantity()%></td>
                        <td scope = "row"><%=i.getPrice()%></td>
                        <td>
                            <a href="remove_book?bid=<%=i.getBookId()%>&&uid=<%=i.getUserId()%>" class="btn btn-sm btn-danger">Remove</a>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                    <tr>
                        <td>Total Price</td>
                        <td></td>
                        <td></td>
                        <td><%= totalPrice %></td>
                    </tr>
                </tbody>
              </table>
        </div>
        <div class="col-md-6 bg-white">
            <h3 class="mt-4 mb-3 text-center text-success fw-bold">Your Order Details</h3>
            <form action="order" method="post">
                <input type="hidden" value="${userobj.id}" name="id">
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="inputName">Name</label>
                      <input type="text" class="form-control" value="<%=user.getFirstname() + ' ' + user.getLastname()%>" readonly="readonly">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="">Email</label>
                      <input type="email" class="form-control" value="<%=user.getEmail()%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="">Phone Number</label>
                      <input type="text" class="form-control" value="<%=user.getPhone()%>" readonly="readonly">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="">Address</label>
                      <input type="text" class="form-control" value="<%=user.getAddress()%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="">City</label>
                      <input type="text" class="form-control" value="<%=user.getCity()%>" readonly="readonly">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="">Zipcode</label>
                      <input type="text" class="form-control" value="<%=user.getZipcode()%>" readonly="readonly">
                    </div>
                </div>
                <div class="form-group">
                    <label>Payment method</label>
                    <select id="inputState" class="form-control" name="payment" onchange="enableOrderButton()">
                      <option disabled selected value="NoSelect">Choose...</option>
                      <option value="COD">Cash on Delivery</option>
                      <option value="Credit">Credit card</option>
                    </select>
                </div>
                <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                <div class="mb-4 text-center">
                  <button class="btn btn-success" id="orderButton" disabled>Order now</button>
                    <a href="index.jsp" class="btn btn-primary">Continue Shopping</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<%@ include file="../Components/Footer.jsp" %>
</html>