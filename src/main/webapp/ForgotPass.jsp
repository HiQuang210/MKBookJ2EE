<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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

    </script>
</head>
<body style="background-color: #F8F8F8;">
    <div class="wrapper">
        <form action="login" method="post" onsubmit="setRememberMe()">
            <h1 class="text-center fw-bold">Password Recovery</h1>
            <c:if test="${not empty succMsg}">
                <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 16px">${succMsg}</p>
                <c:remove var="succMsg" scope="session"/>
            </c:if>
            <div class="input-box mt-4">
                <input type="email" placeholder="Email" id="email" name="email" required onclick="hideStatusMessage()">
                <i class="fa-solid fa-user"></i>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Passcode" id="passcode" name="passcode" required onclick="hideStatusMessage()">
                <i class="fa-solid fa-hashtag"></i>
            </div>
            <c:if test="${not empty succMsg}">
                <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 16px">${succMsg}</p>
                <c:remove var="succMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty failMsg}">
                <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 16px">${failMsg}</p>
                <c:remove var="failMsg" scope="session"/>
            </c:if>
            <button type="submit" class="btn btn-info">Request password reset</button>
            <div class="register-link">
                <p>Return to <a href="Login.jsp">Sign in</a></p>
            </div>
        </form>
    </div>
</body>
</html>
