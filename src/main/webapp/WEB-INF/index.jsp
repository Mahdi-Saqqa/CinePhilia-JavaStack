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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <style>
        * {
            color:white;

        .kodfun-galeri {
            display: flex;
            height: 20 rem;
            gap: 1rem;
        }

        .kodfun-galeri > div {
            flex:1;
            border-radius:1rem;
            background-position: center;
            background-repeat: no-repeat;
            background-size: auto 100%;
            transition: all .8s cubic-bezier(.25, .4, .45, 1.4);
        }
        .kodfun-galeri > div:hover {
            flex:5;
        }

    </style>
</head>
<body class="bg-dark">
<div class="container-fluid overflow-hidden">
<div class="row vh-100 overflow-auto">
    <div class="col-12 col-sm-3 col-xl-2 px-sm-2 px-0 bg-dark d-flex sticky-top">
        <div class="d-flex flex-sm-column flex-row flex-grow-1 align-items-center align-items-sm-start px-3 pt-2 text-white">
            <a href="/" class="d-flex align-items-center py-3 pb-sm-3 mb-md-0 me-md-auto text-white text-decoration-none">
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
            <div class="dropdown py-sm-4 mt-sm-auto ms-auto ms-sm-0 flex-shrink-1">
                <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="https://github.com/mdo.png" alt="hugenerd" width="28" height="28" class="rounded-circle">
                    <span class="d-none d-sm-inline mx-1">Joe</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
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
    <div class="col d-flex flex-column h-100">
        <main class="row">
            <div class="kodfun-galeri">
                <div style="background-image: url('/img/BohemianRhapsody.jpeg');"></div>
                <div style="background-image: url('/img/house-of-gucci-lady-gaga.jpg');"></div>
                <div style="background-image: url('/img/moonlight.jpg');"></div>
                <div style="background-image: url('/img/oculus.jpg');"></div>
                <div style="background-image: url('/img/riddle.jpg');"></div>
            </div>
        </main>
<%--        <footer class="row bg-light py-4 mt-auto">--%>
<%--            <div class="col"> </div>--%>
<%--        </footer>--%>
    </div>
</div>
</div>



<script src="https://cdn.jsdelivr.net/npm/gsap@3.11/dist/gsap.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script><!-- change to match your file/naming structure -->
</body>
</html>