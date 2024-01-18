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
    <title>Update Address</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="Components/AllCss.jsp" %>
    <style type="text/css">
    </style>
    <c:if test="${empty userobj}">
        <c:redirect url="Login.jsp"/>
    </c:if>
</head>
<body style="background-color: white;">
<%@ include file="Components/navbar.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Edit Address</h4>
                    <form action="update_address" method="post">
                    <input type="hidden" value="${userobj.id}" name="id">
                    <div class="form-group mt-4">
                        <label for="example-name">Address</label>
                        <input type="text" id="address" name="address" value="${userobj.address}" class="form-control" required>
                    </div>
                    <div class="form-group mb-1">
                        <label for="example-name">City</label>
                        <input type="text" id="citybox" name="city" value="${userobj.city}" class="form-control" required>
                    </div>
                    <div class="form-group mb-1">
                        <label for="example-name">Zipcode</label>
                        <input type="number" id="zipcodebox" name="zipcode" value="${userobj.zipcode}" class="form-control" required>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">Save Change</button>
                    </div>
                    </form>
                    <c:if test="${not empty succMsg}">
                        <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 20px">${succMsg}</p>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>
                    <c:if test="${not empty failMsg}">
                        <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 20px">${failMsg}</p>
                        <c:remove var="failMsg" scope="session"/>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../Components/Footer.jsp" %>
</body>
</html>