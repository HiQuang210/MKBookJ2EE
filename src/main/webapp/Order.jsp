<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.User" %>
<%@ page import="com.DAO.UserDAOimpl" %>
<%@ page import="com.Entity.Order" %>
<%@ page import="com.DAO.OrderDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="Components/AllCss.jsp" %>
</head>
<c:if test="${empty userobj}">
    <c:redirect url="Login.jsp"/>
</c:if>
<body style="background-color: #F8F8F8;">
    <%
    User user = (User)session.getAttribute("userobj");
    int userId = user.getId();
    %>
<%@ include file="Components/navbar.jsp" %>
<div class="container-fluid">
    <h3 class="mt-2 text-center text-primary">Your Orders</h3>
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Date</th>
                <th scope="col">Amount</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody>
            <%
                OrderDAOimpl orderDAO = new OrderDAOimpl(DBConnect.getConnection());
                List<Order> orders = orderDAO.getOrdersByUserId(userId);

                for (Order order : orders) {
            %>
            <tr>
                <th scope="row"><%= order.getOrderId() %></th>
                <td><%= order.getOrderDate() %></td>
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
