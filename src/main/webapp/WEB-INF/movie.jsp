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
    <c:if test="${currentUser.dark}">

        <style>
            *{
                color:white;
            }
        </style>
    </c:if>
    <c:if test="${currentUser.dark==null || !currentUser.dark}">

        <style>
            a{
                color:black;
            }
        </style>
    </c:if>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>CinePhilia</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css"> <!-- change to match your file/naming structure -->

</head>
<body
        <c:if test="${currentUser.dark}">
            class=" bg-dark text-white"
        </c:if>
>
<div class="container-fluid overflow-hidden">
    <div class="row vh-100 overflow-auto">
        <%--        <div class="col-12 col-sm-3 col-xl-1 px-sm-2 px-0 bg-dark d-flex sticky-top h-sm-100">--%>
        <div class="col-12 col-sm-2 col-xl-1 px-sm-1 px-0   d-flex sticky-lg-top sticky-md-top h-sm-100">

            <div class="d-flex flex-sm-column flex-row flex-grow-1 align-items-center align-items-sm-start px-3 pt-2
<c:if test="${currentUser.dark}">
        bg-dark text-white
                </c:if>">
                <a href="/" class="d-flex align-items-center pb-sm-3 mb-md-0 me-md-auto  text-decoration-none">
                    <span class="fs-5"><img src="/img/Logo-2.png" width="30em" height="30em"></span> <span class="d-none d-sm-inline ms-1">CinePhilia</span>
                </a>
                <ul class="nav nav-pills flex-sm-column flex-row flex-nowrap flex-shrink-1 flex-sm-grow-0 flex-grow-1 mb-sm-auto mb-0 justify-content-center align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="/" class="nav-link px-sm-0 px-2 py-4">
                            <i class="fs-5 bi-house"></i><span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="/search" class="nav-link px-sm-0 px-2 py-4">
                            <i class="bi bi-search"></i><span class="ms-1 d-none d-sm-inline">Search</span> </a>
                    </li>
                    <li>
                        <a href="/discover" class="nav-link px-sm-0 px-2 py-4">
                            <i class="bi bi-shuffle"></i><span class="ms-1 d-none d-sm-inline">Discover</span></a>
                    </li>
                    <li>
                        <a href="/wishlist" class="nav-link px-sm-0 px-2 py-4">
                            <i class="fs-5 bi-grid"></i><span class="ms-1 d-none d-sm-inline">Wishlist</span></a>
                    </li>
                    <li>
                        <a href="/aboutus" class="nav-link px-sm-0 px-2 py-4">
                            <i class="fs-5 bi-people"></i><span class="ms-1 d-none d-sm-inline">About us</span> </a>
                    </li>
                </ul>
                <div class="py-sm-4 mt-sm-auto ms-auto ms-sm-0 flex-shrink-1">
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center  text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://github.com/mdo.png" alt="hugenerd" width="28" height="28" class="rounded-circle">
                            <span class="d-none d-sm-inline mx-1">
                                <c:if test="${currentUser.username == null}">
                                    Guest
                                </c:if>
                                ${currentUser.username}
                            </span>
                        </a>
                        <ul id="user-list" class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
                            <c:forEach var="role" items="${currentUser.roles}">

                                <c:if test="${role.name == 'ROLE_ADMIN'}">
                                    <li><a class="dropdown-item" href="/admin/newmovie">Add Movie</a></li>
                                </c:if>
                                <c:if test="${role.name == 'ROLE_USER'}">
                                    <li><a class="dropdown-item" href="/settings">Settings</a></li>

                                    <li><a class="dropdown-item" href="/profile">Profile</a></li>
                                </c:if>

                            </c:forEach>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li>
                                <c:if test="${currentUser != null}">
                                    <form id="logoutForm" method="POST" action="/logout" class="dropdown-item">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="submit" class=" dropdown-item"  value="Logout!" />
                                    </form>
                                </c:if>
                                <c:if test="${currentUser == null}">
                                    <a href="/login" class="dropdown-item">Login</a>
                                </c:if>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col col-sm-9 col-xl-11 px-sm-10 px-12 ">
            <main class="row overflow-auto canvas">
                <div class="col-11 ratio ratio-16x9">
                    <iframe src="https://www.youtube.com/embed/${movie.trailer}?autoplay=1&mute=1" allowfullscreen></iframe>
                </div>

                        <div class="col-md-6 col-sm-12 col-6 h-sm-100 ">
                            <img class="rounded mx-auto w-75 ms-5 img-fluid"  src="https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movie.poster}" alt="Movie Poster" class="img-fluid">
                        </div >
                        <div class="col-md-5 col-sm-12 h-sm-100">
                            <h1 class="display-4 my-5">${movie.title}</h1>
                            <p class="lead me-5 text-wrap">${movie.overview}</p>
                            <p>genres:
                                <c:forEach var="genre" items="${movie.genres}">
                                    <a href="/genre/${genre.id}">${genre.name}</a>
                                </c:forEach>
                            </p>
                            <c:if test="${movie.avgRates()==0}">
                                <span class="fs-6">Be the first to rate this movie</span>
                            </c:if>
                            <c:if test="${movie.avgRates() !=0}">
                                <span>your Rate: ${loggedUserRate}</span>
                                <span>Avg Rate :${movie.avgRates()}</span>
                            </c:if>
                            <form class="rating-stars">
                                <a class="bi bi-star fs-3" data-rating="1" href="/rateMovie/${movie.id}/1"></a>
                                <a class="bi bi-star fs-3" data-rating="2" href="/rateMovie/${movie.id}/2"></a>
                                <a class="bi bi-star fs-3" data-rating="3" href="/rateMovie/${movie.id}/3"></a>
                                <a class="bi bi-star fs-3" data-rating="4" href="/rateMovie/${movie.id}/4"></a>
                                <a class="bi bi-star fs-3" data-rating="5" href="/rateMovie/${movie.id}/5"></a>
                            </form>
                            <p>${errorMessage}</p>
                            <button class="btn btn-primary my-3" onclick="createReviewBox(this)">Add Review</button>
                            <form action="/movie/${movie.id}/addreview" method="post" id="reviewBoxContainer">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                               
                            </form>

                                <c:forEach var="review" items="${movie.reviews}">


                                    <div class="d-flex mb-3 bg-light text-black rounded" style="max-width: 540px;">



                                            <div class="w-100">
                                                <div class="d-flex justify-content-between w-100  ">
                                                <h5 class="text-black my-2 mx-2">A review by ${review.user.username} </h5>
                                                <small class="text-muted text-black my-2 mx-2">${review.createdAt}</small>
                                                </div>
                                                <p class="card-text text-black ms-4">${review.review}</p>
                                                <div class=" d-flex  flex-column justify-content-between  w-100 container-fluid">


                                                    <p class="card-text text-black align-self-end justify-content-end">
                                                        <c:choose>
                                                            <c:when test="${review.user.id == currentUser.id}">
                                                                <a href="/deletereview/${review.id}" class="text-muted"><i class="bi bi-trash3 text-black"></i></a>
                                                            <a href="/editreview/${review.id}" class="text-muted"><i class="bi bi-pen text-black"></i></a>

                                                        </c:when>
                                                            <c:when test="${review.user.id != currentUser.id}">
                                                                <c:forEach var="role" items="${currentUser.roles}">
                                                                    <c:if test="${role.name == 'ROLE_ADMIN'}">
                                                                        <a href="/deletereview/${review.id}" class="text-muted"><i class="bi bi-trash3 text-black"></i></a>
                                                            <a href="/editreview/${review.id}" class="text-muted"><i class="bi bi-pen text-black"></i></a>

                                                        </c:if>
                                                                </c:forEach>
                                                            </c:when>
                                                        </c:choose>


                                                </div>

                                            </div>
                                        </div>
                                </c:forEach>

                    </div>

                </div>


            </main>


        </div>
    </div>
</div>

<script type="text/javascript" src="/js/star.js"></script><!-- change to match your file/naming structure -->
<script src="/js/index.js" ></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>