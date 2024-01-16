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
    <c:set var="validEmail" value="${sessionScope.validEmail}" />
    <script>
        var validEmail = <c:out value="${validEmail}" />;
        
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

        function togglePasscodeInput() {
        var passcodeContainer = document.getElementById('passcodeContainer');
        var passcodeInput = document.getElementById('passcode');
        var emailInput = document.getElementById('email');

        if (passcodeContainer && passcodeInput && emailInput) {
            if (validEmail) {
                passcodeContainer.style.display = 'block';
                passcodeInput.disabled = false;
                emailInput.disabled = true;
            } else {
                // Ensure email input is disabled if the passcode error occurs
                passcodeContainer.style.display = 'none';
                passcodeInput.disabled = true;
                emailInput.disabled = true;
            }
        }
        }

        function checkValidEmail() {
            if (validEmail) {
                togglePasscodeInput();
            }
        }

        window.onload = checkValidEmail;

        function checkPasscode() {
            var passcode = document.getElementById('passcode').value;
            var storedPasscode = '<%= session.getAttribute("passcode") %>';
            var passcodeErrorMsgElement = document.getElementById('passcodeErrorMsg');
            var succMsgElement = document.getElementById('succMsg');
            var failMsgElement = document.getElementById('failMsg');
            var emailInput = document.getElementById('email');
            var passcodeContainer = document.getElementById('passcodeContainer');

            if (passcode === storedPasscode) {
                // Redirect to ResetPassword.jsp
                window.location.href = 'ResetPassword.jsp';
            } else {
                // Display passcode error message
               if (succMsgElement) {
                   succMsgElement.style.display = 'none';
                }
               if (failMsgElement) {
                   failMsgElement.style.display = 'none';
                }
                passcodeErrorMsgElement.style.display = 'block';
        
                // Update validEmail to false
                validEmail = false;
                // Ensure email input is disabled if the passcode error occurs
                passcodeContainer.style.display = 'none';
                document.getElementById('passcode').disabled = true;
                emailInput.disabled = false;
            }
        }
    </script>
</head>
<body style="background-color: #F8F8F8;">
    <div class="wrapper">
        <form action="recovery" method="post">
            <h1 class="text-center fw-bold">Password Recovery</h1>
            <div class="input-box mt-4">
                <input type="email" placeholder="Email" id="email" name="email" required onclick="hideStatusMessage(); togglePasscodeInput();">
                <i class="fa-solid fa-user"></i>
            </div>
            <div class="input-box" style="display: none;" id="passcodeContainer">
                <input type="hidden" name="passcodeSubmission" value="true">
                <input type="number" placeholder="Passcode" id="passcode" name="passcode">
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
            <c:if test="${not empty passcodeErrorMsg}">
                <p id="passcodeErrorMsg" class="text-center text-danger" style="font-weight: bold; font-size: 16px">${passcodeErrorMsg}</p>
                <c:remove var="passcodeErrorMsg" scope="session"/>
            </c:if>
            <button type="submit" class="btn btn-info">Request password reset</button>
            <div class="register-link">
                <p>Return to <a href="Login.jsp">Sign in</a></p>
            </div>
        </form>
    </div>rtrty
</body>
</html>
