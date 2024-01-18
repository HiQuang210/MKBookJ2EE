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
    <title>Edit Profile</title>
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
                    <h4 class="text-center">Edit Profile</h4>
                    <form action="update_profile" method="post">
                        <input type="hidden" value="${userobj.id}" name="id">
                        <div class="form-group mt-4 row">
                            <div class="col-md-6">
                                <label for="example-name">First name</label>
                                <input type="text" id="firstnamebox" name="firstname" value="${userobj.firstname}" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="example-name">Last name</label>
                                <input type="text" id="lastnamebox" name="lastname" value="${userobj.lastname}" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group mb-1">
                            <label for="example-name">Email</label>
                            <input type="text" id="emailbox" name="email" value="${userobj.email}" class="form-control" readonly="readonly">
                        </div>
                        <div class="form-group mb-1">
                            <label for="example-name">Phone</label>
                            <input type="number" id="phonebox" name="phone" value="${userobj.phone}" class="form-control">
                        </div>
                        <div class="form-group mb-1">
                            <label for="example-name">Password</label>
                            <input type="password" id="passwordbox" name="password" placeholder="Enter your password" class="form-control" required>
                        </div>
                        <div class="text-center mt-4 mb-4">
                            <button type="submit" class="btn btn-primary">Save Change</button>
                            <a href="ChangePassword.jsp" class="btn btn-secondary"><i class="fa-solid fa-key"></i> Change Password</a>
                        </div>
                        <c:if test="${not empty succMsg}">
                            <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 20px">${succMsg}</p>
                            <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        <c:if test="${not empty failMsg}">
                            <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 20px">${failMsg}</p>
                            <c:remove var="failMsg" scope="session"/>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../Components/Footer.jsp" %>
</body>
</html>