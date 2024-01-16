<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin:Books</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
</head>
<body style="background-color: #F8F8F8;">
<%@ include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
</c:if>


</body>
</html>