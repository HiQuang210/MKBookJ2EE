<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page import="com.Entity.User" %>
<%@ page import="com.DAO.UserDAOimpl" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>MKBookstore</title>
    <%@ include file="Components/AllCss.jsp" %>
<style type="text/css">
    .crd-h:hover{
        background-color: #EFEFEF;
    }

    body {
            overflow-x: hidden;
        }
    #toast {
        min-width: 300px;
        position: fixed;
        bottom: 30px;
        left: 50%;
        margin-left: -125px;
        background: #2e2e2e;
        padding: 10px;
        color: white;
        text-align: center;
        z-index: 1;
        font-size: 18px;
        visibility: hidden;
        box-shadow: 0 0 25px #000000;
    }

    #toast.display {
        visibility: visible;
        animation: fadeIn 0.5s, fadeOut 1s 3s;
    }

    @keyframes fadeIn {from {bottom:0; opacity:0;}
    to {
        bottom: 30px;
        opacity: 1;
    }}

    @keyframes fadeOut {from {bottom: 30px; opacity: 1;}
    to {
        bottom: 0;
        opacity: 0;
    }}
</style>
<c:if test="${not empty addCart}">
<div id="toast">${addCart}</div>
<script type="text/javascript">
    showToast();
    function showToast(content)
    {
        $("#toast").addClass("display");
        $("#toast").html(content);
        setTimeout(()=>{
            $("#toast").removeClass("display");
        }, 2000)
    }
</script>
<c:remove var="addCart" scope="session"/>
</c:if>
</head>
<body style="background-color: #F8F8F8;">
    <%
    User user = (User)session.getAttribute("userobj");
    %>
    <%@ include file="Components/navbar.jsp" %>
    <div class="container-fluid">
        <h3 class="text-center">Recent Book</h3>
        <div class="row">
            <%
            String ch=request.getParameter("ch");
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
            List<Book> list = dao.getBookBySearch(ch);
                for (Book book : list) {
            %>
            <div class="col-md-3">
                <div class="card crd-h">
                    <div class="card-body text-center">
                        <img alt="" src="Images/<%=book.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumbnail">
                        <p><%=book.getBookName()%></p>
                        <p><%=book.getAuthor()%></p>
                        <p>
                            <%=book.getPrice()%> VND
                        </p>
                        <div class="row d-flex justify-content-center">
                            <% if (user==null) {
                                %>
                                <a href="Login.jsp" class="btn btn-info btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add to cart</a>
                                <%
                                 } else {
                                %>
                                <a href="quickadditem?bid=<%=book.getBookId()%>&&uid=<%=user.getId()%>" class="btn btn-info btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add to cart</a>
                                <%
                                 }
                                 %>
                            <a href="ViewBook.jsp?bid=<%=book.getBookId()%>" class="btn btn-success btn-sm ml-1">View Detail</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>