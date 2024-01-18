<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.User" %>
<%@ page import="com.DAO.UserDAOimpl" %>
<%@ page import="com.Entity.Order" %>
<%@ page import="com.DAO.OrderDAOimpl" %>
<%@ page import="com.Entity.Item" %>
<%@ page import="com.DAO.ItemDAOimpl" %>
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
    <%@ include file="Components/navbar.jsp" %>
    <div class="container-fluid">
        <h3 class="mt-2 text-center text-primary">Your Orders</h3>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Book Name</th>
                    <th scope="col">QTY</th>
                    <th scope="col">Price</th>
                    <th scope="col">Order ID</th>
                </tr>
            </thead>
            <tbody>
                <%
                    User user = (User)session.getAttribute("userobj");
                    int userId = user.getId();
                    ItemDAOimpl itemDAO = new ItemDAOimpl(DBConnect.getConnection());
                    List<Item> items = itemDAO.getBookByUser(userId);
    
                    for (Item item : items) {
                %>
                <tr>
                    <td><%= item.getBookName() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td><%= item.getPrice() %></td>
                    <td><%= item.getOrderId() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <div class="text-center mt-4 mr-2">
        <a href="Order.jsp" button type="button" class="btn btn-primary mb-2"><i class="fa-solid fa-file-invoice"></i> Order Details</button>
    </div>
    </body>
</html>
