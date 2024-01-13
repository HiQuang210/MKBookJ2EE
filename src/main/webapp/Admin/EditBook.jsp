<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@ page import="com.Entity.Book" %>
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin: Editook</title>
    <link rel="stylesheet" href="style.css">
    <%@ include file="../Components/AllCss.jsp" %>
    <style>
        .tag-container {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
        }
        .list-group-item.tag {
            font-size: 12px;
            color: black;
            cursor: pointer;
            margin-right: 5px;
            margin-bottom: 5px;
            background-color: #f0f0f0; 
        }

        .list-group-item.tag.active {
            background-color: #ffeeba; 
            color: black; 
        }
        .vnd-text {
            font-size: 16px;
            color: rgba(0, 0, 0, 0.5); 
            position: absolute;
            right: 20px; 
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
    <script>
        var selectedTags = [];
    
        function toggleTag(tag) {
            if (tag.classList.contains('active')) {
                // If the tag is already selected, remove it from the array
                selectedTags = selectedTags.filter(function (item) {
                    return item !== tag.innerText;
                });
                tag.classList.remove('active');
            } else if (selectedTags.length < 3) {
                // If less than 3 tags are selected, add the tag to the array
                selectedTags.push(tag.innerText);
                tag.classList.add('active');
            } else {
                // If 3 tags are already selected, prevent adding more tags
                alert('You can only select up to 3 tags.');
            }
    
            // Update the hidden input field value
            document.getElementById('selectedTags').value = selectedTags.join(', ');
        }
    
        function validateForm() {
            // Check if at least one tag is selected
            if (selectedTags.length === 0) {
                alert('Please select at least 1 tag.');
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body style="background-color: #F8F8F8;">
<%@ include file="navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Edit Book</h4>
                    <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    BookDAOimpl dao=new BookDAOimpl(DBConnect.getConnection());
                    Book book = dao.getBookById(id);
                    %>
                    <form action="../edit_books" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
                        <input type="hidden" name ="id" value="<%=book.getBookId()%>">
                    <div class="form-group mt-4">
                        <label for="example-name">Book Name*</label>
                        <input type="text" placeholder="Book Name" id="booknamebox" name="bookname" class="form-control" value="<%=book.getBookName()%>" required>
                    </div>
                    <div class="form-group mb-1">
                        <label for="example-name">Author*</label>
                        <input type="text" placeholder="Author" id="authorbox" name="author" class="form-control" value="<%=book.getAuthor()%>" required>
                    </div>
                    <div class="form-group mb-1">
                        <label for="example-name">Price*</label>
                        <div class="input-group">
                            <input type="number" placeholder="Price" id="pricebox" name="price" class="form-control" value="<%=book.getPrice()%>" required>
                            <div class="vnd-text">VND</div>
                        </div>
                    </div>
                    <div class="form-group mb-1">
                        <label for="example-name">Genres (Select up to 3)*</label>
                        <div class="tag-container">
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Adventure</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Comedy</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Crime</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Education</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Fantasy</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Fiction</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Historical</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Horror</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Isekai</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Mystery</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Narrative</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Romance</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Science Fiction</span>
                            <span class="badge badge-secondary list-group-item tag" onclick="toggleTag(this)">Thriller</span>
                        </div>
                        <input type="hidden" name="selectedTags" id="selectedTags" value="">
                    </div>
                    <div class="form-group mb-1">
                        <label for="example-name">Book Status</label>
                        <select id="inputState" name="bookstatus" class="form-control" required>>
                            <%
                            if ("Active".equals(book.getBookStatus())) {
                                %>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                            <%
                            } else {
                                %>
                            <option value="Inactive">Inactive</option>
                            <option value="Active">Active</option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="example-name">Upload Photo</label>
                        <input type="file" name="bookimg" id="bookimg" class="form-control-file"z>
                    </div>
                    <div class="form-group mt-2 text-center">
                        <button type="submit" class="btn btn-primary mx-auto">Update Book</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="../Components/Footer.jsp" %>
</body>
</html>