<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Random" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin:Invoice</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
    <style>
        @media print {
            #printButton {
                display: none;
            }
        }
    </style>
</head>
<body style="background-color: #F8F8F8;">
<%@ include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
</c:if>
<script>
    function removeExportBooks() {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '../removecurrent', true);
        xhr.send();
    }
    document.addEventListener('visibilitychange', function () {
        if (document.visibilityState === 'hidden') {
            removeExportBooks();
        }
    });
    window.addEventListener('beforeunload', function () {
        removeExportBooks();
    });
    $(document).ready(function () {
        $("#printButton").click(function () {
            window.print();
        });
    });
    function checkExportBooks() {
        var exportBooks = '${exportBooks}';
        if (!exportBooks || exportBooks.length === 0) {
            window.location.href = 'Inventory.jsp';
        }
    }
    function calculateTotal() {
        var total = 0;

        // Iterate over the table rows
        var tableRows = document.querySelectorAll('tbody tr');
        for (var i = 0; i < tableRows.length; i++) {
            var amountCell = tableRows[i].querySelector('td:nth-child(4)'); // Assuming "Amount" is in the 4th column
            var amountValue = parseFloat(amountCell.textContent.trim());

            // Check if the value is a valid number
            if (!isNaN(amountValue)) {
                total += amountValue;
            }
        }
        console.log('Total:', total); 
        var totalContainer = document.getElementById('totalAmount');
        totalContainer.style.fontSize = '20px';
        totalContainer.style.fontWeight = 'bold';
        totalContainer.innerHTML = total + ' VND';
    }
    window.onload = function () {
        checkExportBooks();
        calculateTotal();
    };
</script>
<div class="container-fluid">
    <div class="ml-1 mt-1">
        <h1 style="font-size: 40px; font-weight: bold;">Invoice</h1>
    </div>
</div>
<div class="mt-2 ml-2">
    <p style="font-size: 20px; margin-bottom: 5px;">Owner: ${userobj.firstname} ${userobj.lastname}</p>
    <p style="font-size: 20px; margin-bottom: 5px;">Date: <%= getCurrentDate() %></p>
    <p style="font-size: 20px; margin-bottom: 5px;">Order number: <%= generateOrderNumber() %></p>
</div>
<div class="d-flex flex-column">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Item</th>
                <th scope="col">QTY</th>
                <th scope="col">Price</th>
                <th scope="col">Amount</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${exportBooks}">
                <tr>
                    <td>${book.bookName}</td>
                    <td>${book.quantity}</td>
                    <td>${book.price}</td>
                    <td>${book.price * book.quantity}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="d-flex justify-content-between mt-2 ml-2">
        <p style="font-size: 20px; font-weight: bold;">Total: </p>
        <p style="font-size: 20px; font-weight: bold; margin-right: 10px;"><span id="totalAmount"></span></p>
    </div>
</div>
<div class="text-md-right mt-4">
    <img src="../Images/signature.png" alt="Signature" style="max-width: 300px; max-height: 150px;">
</div>
<div class="text-md-right mt-4 mr-2">
    <button type="button" class="btn btn-primary mx-auto mb-2" id="printButton"><i class="fa-solid fa-print"></i> Print</button>
</div>
</body>
<%@ include file="../Components/Footer.jsp" %>
</html>
<%! 
    private String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        return sdf.format(new Date());
    }

    private String generateOrderNumber() {
        String characters = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder orderNumber = new StringBuilder();
        
        for (int i = 0; i < 8; i++) {
            orderNumber.append(characters.charAt(random.nextInt(characters.length())));
        }
        
        return orderNumber.toString();
    }
%>