<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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
        function hideStatusMessage() {
            var succMsgElement = document.getElementById('succMsg');
            var failMsgElement = document.getElementById('failMsg');

            if (succMsgElement) {
                succMsgElement.style.display = 'none';
            }

            if (failMsgElement) {
                failMsgElement.style.display = 'none';
            }
        }
    </script>
</head>
<body style="background-color: #F8F8F8;" onclick="hideStatusMessage()">
    <div class="wrapper">
        <form action="register" method="post">
            <h1 class="text-center fw-bold">Register</h1>
            <div class="input-box mt-3">
                <div class="row">
                    <div class="col">
                        <input type="text" placeholder="First Name" name="firstname" required>
                    </div>
                    <div class="col">
                        <input type="text" placeholder="Last Name" name="lastname" required>
                    </div>
                </div>
            </div>
            <div class="input-box">
                <input type="email" placeholder="Email" name="email" required>
            </div>
            <div class="input-box">
                <input type="text" placeholder="Phone Number" name="phone" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" name="password" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Confirm Password" name="confirmpass" required>
            </div>
            <c:if test="${not empty succMsg}">
                <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 16px">${succMsg}</p>
                <c:remove var="succMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty failMsg}">
                <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 16px">${failMsg}</p>
                <c:remove var="failMsg" scope="session"/>
            </c:if>
            <button type="submit" class="btn btn-success">Register</button>
            <div class="register-link">
                <p>Return to <a href="Login.jsp">Sign in</a></p>
            </div>
        </form>
    </div>
</body>
</html>
