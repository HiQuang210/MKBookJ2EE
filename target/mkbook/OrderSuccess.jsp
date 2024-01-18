<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order success</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="Components/AllCss.jsp" %>
</head>
<c:if test="${empty userobj}">
    <c:redirect url="Login.jsp"/>
</c:if>
<body style="background-color: #F8F8F8;">
<%@ include file="Components/navbar.jsp" %>
<div class="container-fluid">
    <div class="row p-5">
        <div class="col-md-4 offset-md-4 text-center">
            <div class="text-success" style="font-size: 48px;">
                <i class="fa-solid fa-circle-check"></i>
            </div>
            <h4>Success! Your order will be delivered soon!</h4>
            <a href="index.jsp" class="btn btn-success">Go back home</a>
        </div>
    </div>
</div>
</body>
</html>