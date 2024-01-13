<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>MKBookstore</title>
</style>
</head>
<body>
    <h1>User Home</h1>
    <c:if test="${not empty userobj}">
        <h1>Name: ${userobj.firstname} ${userobj.lastname}</h1>
        <h1>Email: ${userobj.email}</h1>
    </c:if>
</body>
</html>