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
        function hideStatusMessage() {
            var failMsgElement = document.getElementById('failMsg');
            var succMsgElement = document.getElementById('succMsg');

            if (failMsgElement) {
                failMsgElement.style.display = 'none';
            }
            if (succMsgElement) {
            succMsgElement.style.display = 'none';
            }
        }

        function setRememberMe() {
            var emailInput = document.getElementById('email');
            var passwordInput = document.getElementById('password');
            var rememberMeCheckbox = document.getElementById('rememberMe');

            if (rememberMeCheckbox.checked) {
                document.cookie = "rememberedEmail=" + emailInput.value + "; expires=Thu, 31 Dec 2030 12:00:00 UTC; path=/";
                document.cookie = "rememberedPassword=" + passwordInput.value + "; expires=Thu, 31 Dec 2030 12:00:00 UTC; path=/";
            }
        }

        function fillRememberedCredentials() {
            var rememberedEmail = getCookie("rememberedEmail");
            var rememberedPassword = getCookie("rememberedPassword");
            var emailInput = document.getElementById('email');
            var passwordInput = document.getElementById('password');
            var failMsgElement = document.getElementById('failMsg');

            if (!failMsgElement || failMsgElement.style.display === 'none') {
                if (rememberedEmail && rememberedPassword) {
                    emailInput.value = rememberedEmail;
                    passwordInput.value = rememberedPassword;
                }
            }
        }

        function getCookie(name) {
            var match = document.cookie.match(new RegExp(name + '=([^;]+)'));
            return match ? match[1] : null;
        }

        window.onload = fillRememberedCredentials;
    </script>
</head>
<body style="background-color: #F8F8F8;">
    <div class="wrapper">
        <form action="login" method="post" onsubmit="setRememberMe()">
            <h1 class="text-center fw-bold">Login</h1>
            <c:if test="${not empty succMsg}">
                <p id="succMsg" class="text-center text-success" style="font-weight: bold; font-size: 16px">${succMsg}</p>
                <c:remove var="succMsg" scope="session"/>
            </c:if>
            <div class="input-box mt-4">
                <input type="email" placeholder="Email" id="email" name="email" required onclick="hideStatusMessage()">
                <i class="fa-solid fa-user"></i>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" id="password" name="password" required onclick="hideStatusMessage()">
                <i class="fa-solid fa-lock"></i>
            </div>
            <div class="remember-forgot">
                <div class="remember-me">
                    <label><input type="checkbox" id="rememberMe"> Remember me</label>
                </div>
                <div class="forgot-password">
                    <a href="ForgotPass.jsp">Forgot Password?</a>
                </div>
            </div>
            <c:if test="${not empty failMsg}">
                <p id="failMsg" class="text-center text-danger" style="font-weight: bold; font-size: 16px">${failMsg}</p>
                <c:remove var="failMsg" scope="session"/>
            </c:if>
            <button type="submit" class="btn btn-primary">Login</button>
            <div class="register-link">
                <p>Don't have an account? <a href="Register.jsp">Register</a></p>
            </div>
        </form>
    </div>
</body>
</html>
