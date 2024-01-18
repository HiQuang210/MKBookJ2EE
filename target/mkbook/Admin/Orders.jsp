<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Order" %>
<%@ page import="com.DAO.OrderDAOimpl" %>
<%@ page import="com.Entity.User" %>
<%@ page import="com.DAO.UserDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin: Orders</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
</head>
<body style="background-color: #F8F8F8;">
<%@ include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
</c:if>
<div class="container-fluid">
    <h3 class="mt-2 text-center text-primary">All Orders</h3>
    <table class="table table-striped">
        <thead class="bg-dark text-white">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">User Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Phone</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody>
            <%
                OrderDAOimpl orderDAO = new OrderDAOimpl(DBConnect.getConnection());
                UserDAOimpl userDAO = new UserDAOimpl(DBConnect.getConnection());

                List<Order> orders = orderDAO.getAllOrders();

                for (Order order : orders) {
                    User user = userDAO.getUserById(order.getUserId());
            %>
            <tr>
                <td><%= order.getOrderId() %></td>
                <td><%= user.getFirstname() + " " + user.getLastname() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getAddress() %></td>
                <td><%= user.getPhone() %></td>
                <td><%= order.getAmount() %></td>
                <td><%= order.getPaymentType() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
