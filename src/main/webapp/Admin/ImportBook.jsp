<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin: AddBook</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script>
        function fetchBookPhoto() {
            var selectedBook = $("#booknamebox").val();
            $.ajax({
                url: "../bookcover?bookname=" + selectedBook,
                type: "GET",
                success: function (data) {
                    $("#bookcover").attr("src", "../Images/" + data);
                }
            });
        }

        function fetchBookNameOptions() {
            $.ajax({
                url: "../booknameoptions",
                type: "GET",
                success: function (data) {
                    var booknamebox = $("#booknamebox");
                    booknamebox.empty();
                    booknamebox.append('<option value="" disabled selected>Select Bookname...</option>');
                    booknamebox.append(data);
                }
            });
        }

        function updateConfirmButtonState() {
            var confirmButton = $("#confirmButton");
            var isTableEmpty = $("#bookTable tbody tr").length === 0;
            confirmButton.prop("disabled", isTableEmpty);
        }

        $(document).ready(function () {
            updateConfirmButtonState();
            fetchBookNameOptions();
            fetchBookPhoto();

            $(document).on("click", "#confirmButton", function () {
                if ($("#bookTable tbody tr").length > 0) {
                    $("#OrderConfirmModal").modal("show");
                } else {
                    alert("Please import at least one book before confirming.");
                }
            });

            $("#confirmOrderButton").click(function () {
                $("#bookTable tbody tr").each(function () {
                var bookName = $(this).find("td:eq(1)").text();
                var quantity = parseInt($(this).find("td:eq(3)").text());

                $.ajax({
                    url: "../bookaddquantity", 
                    type: "POST",
                    data: { bookName: bookName, quantity: quantity },
                    success: function (result) {
                    console.log(result);  
                }
            });
        });
            window.location.href = 'ExportInvoice.jsp';
        });
        });

        var totalAmount = 0;

        function updateTotal() {
            var totalElement = $("#totalAmount");
            totalElement.text(totalAmount + " VND");
        }

        function importBook() {
            var total = 0;
            var selectedBook = $("#booknamebox").val();
            var quantity = $("#quantitybox").val();
            if (selectedBook && quantity && quantity > 0) {
                $.ajax({
                    url: "../bookauthor?bookname=" + selectedBook,
                    type: "GET",
                    success: function (author) {
                        $.ajax({
                            url: "../bookprice?bookname=" + selectedBook,
                            type: "GET",
                            success: function (price) {
                                var totalPrice = quantity * price;
                                var tableBody = $("#bookTable tbody");
                                var existingRow = tableBody.find("tr:contains('" + selectedBook + "')");

                                if (existingRow.length > 0) {
                                    var existingQuantity = parseInt(existingRow.find("td:eq(3)").text());
                                    var existingTotalPrice = parseInt(existingRow.find("td:eq(4)").text());
                                    existingRow.find("td:eq(3)").text(existingQuantity + parseInt(quantity));
                                    existingRow.find("td:eq(4)").text(existingTotalPrice + totalPrice);
                                } else {
                                    var newRow = "<tr>" +
                                        "<td>" + (tableBody.children().length + 1) + "</td>" +
                                        "<td>" + selectedBook + "</td>" +
                                        "<td>" + author + "</td>" +
                                        "<td>" + quantity + "</td>" +
                                        "<td>" + totalPrice + "</td>" +
                                        "</tr>";
                                    tableBody.append(newRow);
                                }
                                totalAmount += totalPrice;
                                updateTotal();
                                updateConfirmButtonState();
                                $.ajax({
                                    url: "../importbook", 
                                    type: "POST",
                                    data: { bookName: selectedBook, quantity: quantity },
                                    success: function (result) {
                                },
                                error: function (error) {
                                    console.error("Error importing book:", error);
                                }
                            });
                            }
                        });
                    }
                });
            }
        }
    </script>
</head>
<body style="background-color: white;">
<%@ include file="navbar.jsp" %>
<c:if test="${empty userobj}">
    <c:redirect url="../Login.jsp"/>
</c:if>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 text center border bg-white">
            <div class="form-group mt-1">
                <label for="example-name">Book Cover</label>
            </div>
            <div class="form-group text-center">
                <img id="bookcover" src="../Images/NoImage.png" style="width:125px; height: 175px;">
            </div>
            <div class="form-group mt-4">
                <label for="example-name">Book Name</label>
                <select id="booknamebox" name="bookname" class="form-control" onchange="fetchBookPhoto()">
                    <option value="" disabled selected>Select Bookname...</option>
                </select>
            </div>
            <div class="form-group mb-4">
                <label for="example-name">Quantity</label>
                <input type="number" placeholder="Enter quantity" id="quantitybox" name="quantity" class="form-control" required>
            </div>
            <div class="form-group mt-1 text-center">
                <button type="button" class="btn btn-primary mx-auto" onclick="importBook()">Import <i class="fa-solid fa-circle-arrow-right"></i></button>
            </div>
        </div>
        <div class="col-md-9 bg-white">
            <table id="bookTable" class="table table-striped">
                <thead class="bg-dark text-white">
                  <tr>
                    <th scope="col">No.</th>
                    <th scope="col">Book name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Amount</th>
                  </tr>
                </thead>
                <tbody>

                </tbody>
              </table>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-md-12 text-right">
            <p style="font-size: 24px; font-weight: bold;">Total: <span id="totalAmount">0 VND</span></p>
            <button type="button" class="btn btn-success mx-auto mb-2" data-toggle="modal" data-target="#OrderConfirmModal" id="confirmButton"><i class="fa-solid fa-money-bill"></i> Proceed</button>
        </div>
    </div>
    <div class="modal fade" id="OrderConfirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Book Import Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Confirm the current import order?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-success" id="confirmOrderButton">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../Components/Footer.jsp" %>
</body>
</html>