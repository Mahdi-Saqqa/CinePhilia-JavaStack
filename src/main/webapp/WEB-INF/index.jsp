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
        }
        .canvas{
            min-height:60vh;
        }
        @media (min-width: 1024px) {
            .h-sm-100 {
                height: 100%;
            }
        }
        .movie-card{
            aspect-ratio: 16/9;
        }
        .movie-card:hover {
            -webkit-filter: brightness(70%);
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            -ms-transition: all 1s ease;
            transition: all 1s ease;
        }

    </style>
</head>
<body class="bg-dark">
<div class="container-fluid overflow-hidden">
    <div class="row vh-100 overflow-auto">
        <div class="col-12 col-sm-3 col-xl-1 px-sm-2 px-0 bg-dark d-flex sticky-top h-sm-100">
            <div class="d-flex flex-sm-column flex-row flex-grow-1 align-items-center align-items-sm-start px-3 pt-2 text-white">
                <a href="/" class="d-flex align-items-center pb-sm-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5">B<span class="d-none d-sm-inline">rand</span></span>
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
        </div>
        <div class="col col-sm-9 col-xl-11 px-sm-10 px-12 sticky-top ">
            <main class="row overflow-auto canvas">
                <div class="kodfun-galeri">
                    <div style="height:60vh; background-image: url('/img/BohemianRhapsody.jpeg');"></div>
                    <div style="height:60vh; background-image: url('/img/house-of-gucci-lady-gaga.jpg');"></div>
                    <div style="height:60vh; background-image: url('/img/riddle.jpg');"></div>
                    <div style="height:60vh; background-image: url('/img/theForest.jpg');"></div>
                    <div style="height:60vh; background-image: url('/img/oculus.jpg');"></div>
                    <div style="height:60vh; background-image: url('/img/moonlight.jpg');"></div>
                </div>
                <div class="row  mt-5 w-100 justify-content-evenly">
                    <c:forEach var="movie" items="${movies}">
                            <div   class="card   ratio-16x9  movie-card  m-3  "  style="width: 30vh; background-image: url('https://www.themoviedb.org/t/p/w355_and_h200_bestv2${movie.poster}'); background-size: cover;" onmouseover="cardHoverIn(this)" onmouseleave="cardHoverOut(this, 1)"  >
                                <p class="text-center mt-4 h2  invisible" id="title" >${movie.title}</p>
                            </div>
                    </c:forEach>
                </div>

            </main>


        </div>
    </div>
</div>
<link rel="stylesheet" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.0.js" ></script>
<script>
    function cardHoverIn(element) {
        element.style.transform = "scale(" + 1.1 + ")";
        let title = element.querySelector("#title");
        title.classList.remove("invisible");
    }
    function cardHoverOut(element) {
        let title = element.querySelector("#title");
        let subtext = element.querySelector("#subtext");
        element.style.transform = "scale(" + 1 + ")";

        title.classList.add("invisible");
    }

</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>