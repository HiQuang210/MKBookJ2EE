<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <%@ include file="Components/AllCss.jsp" %>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('Images/BookBG.jpg') no-repeat;
            background-size: cover;
            background-position: center;
            overflow-x: hidden;
        }
    </style>
    <script>
        var validPasscode = '${sessionScope.validPasscode}';
        if (!validPasscode) {
            window.location.href = 'Login.jsp';
        }
    </script>
</head>
<body style="background-color: #F8F8F8;">
    <div class="wrapper">
        <form action="resetpass" method="post">
            <h1 class="text-center fw-bold">Reset Password</h1>
            <div class="input-box mt-4">
                <input type="password" placeholder="Enter New Password" id="password" name="password" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Confirm New Password" id="confirmpass" name="confirmpass" required>
            </div>
            <c:if test="${not empty failMsg}">
                <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 16px">${failMsg}</p>
                <c:remove var="failMsg" scope="session"/>
            </c:if>
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </form>
    </div>
</body>
</html>
