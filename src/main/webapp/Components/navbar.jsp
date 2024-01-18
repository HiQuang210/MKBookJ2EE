<div class="container-fluid" style="height: 10px; background-color: #004963"></div>

<div class="container-fluid p-3 bg-light">
<div class="row">
<div class="col-md-3 mt-1">
<h3><i class="fa-solid fa-torii-gate"></i> MKBook</h3>
</div>
<div class = "col-md-6 mt-1">
  <form class="form-inline my-2 my-lg-0" action="Search.jsp" method="post">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="ch">
    <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
  </form>
</div>
<div class="col-md-3 mt-1 text-right">
  <a href="Cart.jsp" class="btn" style="background-color: transparent; color: #007bff; font-size: 24px; display: none; text-align: right;" id="shoppingCartIcon">
    <i class="fa-solid fa-cart-shopping"></i> Go to cart
  </a>
</div>
</div>
</div>

<!-- Logout modal -->
<!-- Modal -->
<div class="modal fade" id="UserLogoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
  <script>
    var userobj = '${userobj}';
    function toggleVisibility() {
        var loginNavItem = document.getElementById("loginNavItem");
        var welcomeText = document.getElementById("welcomeText");
        var logoutNavItem = document.getElementById("logoutNavItem");
        var shoppingCartIcon = document.getElementById("shoppingCartIcon");

        if (userobj == null || userobj === "") {
            loginNavItem.style.display = "block";
            welcomeText.style.display = "none";
            logoutNavItem.style.display = "none";
            shoppingCartIcon.style.display = "none";
            settingNavItem.style.display = "none";
        } else {
            loginNavItem.style.display = "none";
            welcomeText.style.display = "block";
            logoutNavItem.style.display = "block";
            shoppingCartIcon.style.display = "block";
            settingNavItem.style.display = "block";
        }
    }
    $(document).ready(function () {
        $('#logoutButton').on('click', function () {
            window.location.href = 'logout';
        });
    });
    window.onload = toggleVisibility;
  </script>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="AllRecent.jsp"><i class="fa-solid fa-book"></i> Recent Book</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="#"><i class="fa-solid fa-arrow-trend-up"></i> Trending</a>
        </li>
        <li id="settingNavItem" class="nav-item active">
          <a class="nav-link" href="Setting.jsp"><i class="fa-solid fa-gear"></i> Setting</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li id="welcomeText" class="nav-item active">
          <span class="navbar-text mr-3 text-white">Welcome, ${userobj.firstname} ${userobj.lastname}</span>
        </li>
        <li id="loginNavItem" class="nav-item active">
          <a class="nav-link" href="Login.jsp"><i class="fa-solid fa-door-open"></i> Login</a>
        </li>
        <li id="logoutNavItem" class="nav-item active">
          <a class="nav-link" data-toggle="modal" data-target="#UserLogoutModal">
            <i class="fa-solid fa-right-to-bracket"></i> Logout</a>
          </a>
        </li>
      </ul>
    </div>
  </nav>