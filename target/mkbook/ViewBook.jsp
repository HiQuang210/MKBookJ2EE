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
    <title>Book Detail</title>
    <link rel="stylesheet" href="style.css">
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
    <script>
        function validateQuantity() {
            var quantityBox = document.getElementById('quantitybox');
            var maxQuantity = '<%=book.getQuantity()%>';
            var enteredQuantity = parseInt(quantityBox.value);
            if (enteredQuantity > maxQuantity) {
                quantityBox.value = maxQuantity;
            }
        }
        function printFormData() {
        var quantityBox = document.getElementById('quantitybox');
        console.log("Quantity value: " + quantityBox.value);
    }
    </script>
    <!-- <c:if test="${not empty addCart}">
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
    </c:if> -->
</head>
<body style="background-color: white;">
    <%
    BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
    Book book = dao.getBookById(bid);
    User user = (User)session.getAttribute("userobj");
    %>
<%@ include file="Components/navbar.jsp" %>
<div class="container-fluid">
    <form method="get" action="additem">
        <div class="row">
            <div class="col-md-6 text-center p-5 border bg-white">
                <img src="Images/<%=book.getPhoto()%>" style="height: 350px; width: 250px"><br>
                <h1 style="font-size: 40px;"><%=book.getBookName()%></h1>
                <h2 style="font-size: 30px;"><%=book.getAuthor()%></h2>
                <h2 style="font-size: 28px;"><%=book.getGenres()%></h2>
                <div class="row">
                    <div class="col-md-6 text-success">
                        <h3 style="font-size: 28px;"><%=book.getPrice()%> VND</h3>
                    </div>
                    <div class="col-md-6 text-success">
                        <h3 style="font-size: 24px;">In stock: <%=book.getQuantity()%></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 p-5 bg-white mt-4">
                <div class="row">
                    <div class="col-md-12 text-center mb-3">
                        <p class="h3 font-weight-bold text-primary">Contact seller:</p>
                        <p class="h4 font-weight-bold text-primary"><i class="fa-solid fa-envelope-circle-check"></i> admin@gmail.com</p>
                    </div>
                    <div class="col-md-4 text-success text-center p-2">
                        <i class="fa-solid fa-money-bill-wave" style="font-size: 48px;"></i>
                        <p style="font-size: 24px; font-weight: bold;">Cash on Delivery</p>
                    </div>
                    <div class="col-md-4 text-success text-center p-2">
                        <i class="fa-solid fa-rotate-left" style="font-size: 48px;"></i>
                        <p style="font-size: 24px; font-weight: bold;">Return Available</p>
                    </div>
                    <div class="col-md-4 text-success text-center p-2">
                        <i class="fa-solid fa-star" style="font-size: 48px;"></i>
                        <p style="font-size: 24px; font-weight: bold;">Best Quality</p>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-md-4"></div> 
                    <div class="col-md-3">
                        <input type="number" placeholder="Select qty" id="quantitybox" name="quantity" class="form-control" oninput="validateQuantity()" required">
                        <input type="hidden" name="uid" value="<%= user.getId() %>">
                        <input type="hidden" name="bid" value="<%= book.getBookId() %>">
                    </div>
                    <div class="col-md-4 text-center">
                        <% if (user==null) {
                        %>
                        <a href="Login.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
                        <%
                        } else {
                        %>
                        <a href="ViewBook.jsp" button type="submit" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add to Cart</a>
                        <%
                        }
                        %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center mt-3">
                        <a href="index.jsp" class="btn btn-secondary"><i class="fa-solid fa-arrow-left"></i> Continue Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<%@ include file="../Components/Footer.jsp" %>
</body>
</html>