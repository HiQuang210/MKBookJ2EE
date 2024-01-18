<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.User" %>
<%@ page import="com.DAO.UserDAOimpl" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Setting</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="Components/AllCss.jsp" %>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
        }
        a:hover {
            text-decoration: none;
        }

    </style>
    <c:if test="${empty userobj}">
        <c:redirect url="Login.jsp"/>
    </c:if>
</head>
<body style="background-color: white;">
<%@ include file="Components/navbar.jsp" %>
<div class="container-fluid">
    <h1 class="mt-2 text-center">Hello ${userobj.firstname} ${userobj.lastname}</h1>
    <div class="row">
        <div class="col-md-6">
            <a href="EditProfile.jsp">
                <div class="card">
                    <div class = "card-body text-center">
                        <div class="text-primary" style="font-size: 48px;">
                            <i class="fa-solid fa-shield-halved"></i>
                        </div>
                        <h3>Account Setting</h3>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-6">
            <a href="EditAddress.jsp">
                <div class="card">
                    <div class = "card-body text-center">
                        <div class="text-warning" style="font-size: 48px;">
                            <i class="fa-solid fa-location-dot"></i>
                        </div>
                        <h3>Edit Address</h3>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-6">
            <a href="Order.jsp">
                <div class="card">
                    <div class = "card-body text-center">
                        <div class="text-danger" style="font-size: 48px;">
                            <i class="fa-solid fa-box-open"></i>
                        </div>
                        <h3>My Order</h3>
                        <p>Track your orders</p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-6">
            <a href="HelpCenter.jsp">
                <div class="card">
                    <div class = "card-body text-center">
                        <div class="text-secondary" style="font-size: 48px;">
                            <i class="fa-solid fa-circle-info"></i>
                        </div>
                        <h3>Help Center</h3>
                        <p>24/7 Service</p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<%@ include file="../Components/Footer.jsp" %>
</body>
</html>