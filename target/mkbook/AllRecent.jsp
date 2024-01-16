<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</style>
</head>
<body style="background-color: #F8F8F8;">
    <%@ include file="Components/navbar.jsp" %>
    <div class="container-fluid">
        <h3 class="text-center">Recent Book</h3>
        <div class="row">
            <%
            BookDAOimpl dao = new BookDAOimpl(DBConnect.getConnection());
            List<Book> list = dao.getAllNewBooks();
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
                            <a href="" class="btn btn-info btn-sm"><i class="fa-solid fa-cart-shopping"></i> Add to cart</a>
                            <a href="" class="btn btn-success btn-sm ml-1">View Detail</a>
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