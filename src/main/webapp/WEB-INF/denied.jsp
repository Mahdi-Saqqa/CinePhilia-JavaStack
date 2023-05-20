<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <title>CinePhilia</title>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/index.css"> <!-- change to match your file/naming structure -->

</head>
<body class="bg-dark">
<div class="container-fluid overflow-hidden">
  <div class="row vh-100 overflow-auto">
    <%--        <div class="col-12 col-sm-3 col-xl-1 px-sm-2 px-0 bg-dark d-flex sticky-top h-sm-100">--%>
    <div class="col-12 col-sm-2 col-xl-1 px-sm-1 px-0 bg-dark d-flex sticky-lg-top sticky-md-top h-sm-100">

      <div class="d-flex flex-sm-column flex-row flex-grow-1 align-items-center align-items-sm-start px-3 pt-2 text-white">
        <a href="/" class="d-flex align-items-center pb-sm-3 mb-md-0 me-md-auto text-white text-decoration-none">
          <span class="fs-5">C<span class="d-none d-sm-inline">inePhilia</span></span>
        </a>
        <ul class="nav nav-pills flex-sm-column flex-row flex-nowrap flex-shrink-1 flex-sm-grow-0 flex-grow-1 mb-sm-auto mb-0 justify-content-center align-items-center align-items-sm-start" id="menu">
          <li class="nav-item">
            <a href="#" class="nav-link px-sm-0 px-2 py-4">
              <i class="fs-5 bi-house"></i><span class="ms-1 d-none d-sm-inline">Home</span>
            </a>
          </li>
          <li>
            <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-sm-0 px-2 py-4">
              <i class="bi bi-search"></i><span class="ms-1 d-none d-sm-inline">Search</span> </a>
          </li>
          <li>
            <a href="#" class="nav-link px-sm-0 px-2 py-4">
              <i class="bi bi-shuffle"></i><span class="ms-1 d-none d-sm-inline">Discover</span></a>
          </li>
          <li>
            <a href="#" class="nav-link px-sm-0 px-2 py-4">
              <i class="fs-5 bi-grid"></i><span class="ms-1 d-none d-sm-inline">Wishlist</span></a>
          </li>
          <li>
            <a href="#" class="nav-link px-sm-0 px-2 py-4">
              <i class="fs-5 bi-people"></i><span class="ms-1 d-none d-sm-inline">About us</span> </a>
          </li>
        </ul>
        <div class="py-sm-4 mt-sm-auto ms-auto ms-sm-0 flex-shrink-1">
          <div class="dropdown">
            <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
              <img src="https://github.com/mdo.png" alt="hugenerd" width="28" height="28" class="rounded-circle">
              <span class="d-none d-sm-inline mx-1">${currentUser.username}</span>
            </a>
            <ul id="user-list" class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
              <li><a class="dropdown-item" href="#">New project...</a></li>
              <li><a class="dropdown-item" href="#">Settings</a></li>
              <li><a class="dropdown-item" href="#">Profile</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Sign out</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="col col-sm-9 col-xl-11 px-sm-10 px-12 sticky-top ">
      <main class="row overflow-auto canvas">
            <h1 class="h1 text-uppercase  text-center my-auto">Access Denied</h1>
        <h3 class="h3 text-uppercase  text-center my-auto">403 error code</h3>
        <p class="h3 text-uppercase  text-center my-auto">You don't have permession to view this page</p>
      </main>


    </div>
  </div>
</div>
<script src="/js/index.js" ></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>