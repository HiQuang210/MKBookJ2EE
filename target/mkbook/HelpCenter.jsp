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
    <title>Help Center</title>
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
                <i class="fa-solid fa-phone-volume"></i>
            </div>
            <h3>24/7 Service</h3>
            <h4>Hot Line Number</h4>
            <h5>03294029402</h5>
        </div>
    </div>
</div>
</body>
</html>