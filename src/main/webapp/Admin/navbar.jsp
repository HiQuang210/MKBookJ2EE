<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<div class="container-fluid" style="height: 10px; background-color: #004963"></div>

<div class="container-fluid p-3 bg-light">
  <div class="row">
      <div class="col-md-6 col-12 mt-1">
          <h3><i class="fa-solid fa-torii-gate"></i> MKBook</h3>
      </div>
      <div class="col-md-6 col-12 mt-1 text-md-right"> 
          <a href="" class="btn btn-info"><i class="fa-solid fa-inbox mr-2"></i>Contact us</a>
      </div>
  </div>
</div>

<!-- Logout modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body">
              Are you sure you want to log out?
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
              <button type="button" class="btn btn-danger" id="logoutButton">Logout</button>
          </div>
      </div>
  </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="HomeAdmin.jsp"><i class="fa-solid fa-landmark"></i> Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="Books.jsp"><i class="fa-solid fa-book"></i> All Book</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="AddBook.jsp"><i class="fa-solid fa-upload"></i> Upload Book</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="Inventory.jsp"><i class="fa-solid fa-boxes-stacked"></i></i> Inventory</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="Orders.jsp"><i class="fa-solid fa-file-invoice"></i> Order</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <c:if test="${not empty userobj}">
            <span class="navbar-text mr-3 text-white">Welcome, ${userobj.firstname} ${userobj.lastname}</span>
          </c:if>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="../Login.jsp" data-toggle="modal" data-target="#exampleModal">
              <i class="fa-solid fa-right-from-bracket"></i> Logout
          </a>
      </li>
    </ul>
    </div>
  </nav>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <!-- Your script -->
  <script>
    $(document).ready(function () {
        $('#logoutButton').on('click', function () {
            // Redirect to the logout servlet when the button in the modal is clicked
            window.location.href = '../logout';
        });
    });
  </script>
