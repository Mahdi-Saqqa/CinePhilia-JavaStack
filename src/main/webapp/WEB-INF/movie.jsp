<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <c:if test="${currentUser.dark}">

        <style>
            *{
                color:white;
            }
        </style>
    </c:if>
    <c:if test="${!currentUser.dark}">

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
    <link rel="icon" type="image/x-icon" href="/img/favicon.png">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/index.css">
    <style>
        .page {
            position: relative;
            height:100%;
        }

        .popup {
            position:absolute;
            z-index:5;
            top:-20vh;
            left:-50vw;
            width:80vw;
            aspect-ratio: 16/9;
            background:rgba(0,0,0,0.7);
            opacity:0;
            visibility:hidden;
            transition:.3s ease;
        }

        .show-popup .popup {
            opacity:1;
            visibility: visible;
        }

        .popup > iframe {
            position:absolute;
            top:50px;
            left:50%;
            margin-left:-280px;
        }
    </style>

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
                        <a href="#submenu3" data-bs-toggle="collapse" class="nav-link px-0 align-middle px-sm-0 px-2 py-4">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">Genre</span> </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="/genre/11" class="nav-link px-0"> <span class="d-none d-sm-inline">Action</span></a>
                            </li>
                            <li>
                                <a href="/genre/12" class="nav-link px-0"> <span class="d-none d-sm-inline">Adventure</span></a>
                            </li>
                            <li>
                                <a href="/genre/13" class="nav-link px-0"> <span class="d-none d-sm-inline">History</span></a>
                            </li>
                            <li>
                                <a href="/genre/14" class="nav-link px-0"> <span class="d-none d-sm-inline">Drama</span></a>
                            </li>
                            <li>
                                <a href="genre/15" class="nav-link px-0"> <span class="d-none d-sm-inline">War</span></a>
                            </li>
                            <li>
                                <a href="/genre/18" class="nav-link px-0"> <span class="d-none d-sm-inline">Comedy</span></a>
                            </li>
                            <li>
                                <a href="/genre/22" class="nav-link px-0"> <span class="d-none d-sm-inline">Horror</span></a>
                            </li>
                            <li>
                                <a href="/genre/19" class="nav-link px-0"> <span class="d-none d-sm-inline">Crime</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/wishlist" class="nav-link px-sm-0 px-2 py-4">
                            <i class="bi bi-heart"></i><span class="ms-1 d-none d-sm-inline">Wishlist</span></a>
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
                                    <li><a class="dropdown-item" href="/switchmode">Switch Mode</a></li>
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
        <div class="col col-sm-9 col-xl-11 px-sm-10 px-12 sticky-top ">
            <main class="row overflow-auto canvas">








                        <div class="col-md-6 col-sm-12 col-6 h-sm-100 ">


                            <img class="rounded mx-auto w-75 ms-5 img-fluid"  src="https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movie.poster}" alt="Movie Poster" class="img-fluid">

                        </div >
                        <div class="col-md-5 col-sm-12 h-sm-100">
                            <h1 class="display-4 my-5">${movie.title}</h1>
                            <p class="lead me-5 text-wrap">${movie.overview}</p>
                            <p>Family movie:
                                <c:if test="${movie.isAdult()==true}">
                                        This is an R-rated movie, Content may not be suitable for all audiences
                                </c:if>
                                <c:if test="${movie.isAdult()==false}">
                                    This is a family friendly movie
                                </c:if>
                            </p>
                            <p>Genre:
                                <c:forEach var="genre" items="${movie.genres}">
                                    <a href="/genre/${genre.id}">${genre.name}</a>
                                </c:forEach>
                            </p>
                            <div class="page">
                                <p><a href="#media-popup" data-media="//www.youtube.com/embed/${movie.trailer}" class="btn btn-outline-warning fw-bold">Watch Trailer</a></p>

                                <div class="popup" id="media-popup">
                                    <iframe width="560" height="315" src="" frameborder="0" allowfullscreen></iframe>
                                </div>
                            </div>





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
                                <c:forEach var="role" items="${currentUser.roles}">
                                    <c:if test="${role.name == 'ROLE_ADMIN'}">
                                        <a href= "/admin/deletemovie/${movie.id}" class="text-muted"><i class="bi bi-trash3
                                            <c:if test="${currentUser.dark}">
                                                text-white
                                            </c:if>"></i></a>

                                        <a href="/admin/editmovie/${movie.id}" class="text-muted"><i class="bi bi-pen
                                            <c:if test="${currentUser.dark}">
                                                text-white
                                            </c:if>"></i></a>
                                    </c:if>
                                </c:forEach>
                            <p>${errorMessage}</p>
                                <c:if test="${currentUser != null}" >
                                    <c:if test="${wished}">
                                        <a class="btn btn-outline-danger my-3" href="/user/watchlater/${movie.id}/delete">Remove from Wishlist</a>
                                    </c:if>
                                    <c:if test="${!wished}">
                                        <a class="btn btn-outline-success my-3" href="/user/watchlater/${movie.id}">Watch Later</a>
                                    </c:if>
                                    <button class="btn btn-outline-primary my-3" onclick="createReviewBox(this)">Add Review</button>
                                </c:if>
                            <form action="/movie/${movie.id}/addreview" method="post" id="reviewBoxContainer">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>

                            <c:forEach var="review" items="${movie.reviews}">
                                <div class="d-flex mb-3 bg-light text-black rounded review-container" data-review-id="${review.id}">
                                    <div class="w-100 card-content">
                                        <div class="d-flex justify-content-between w-100">
                                            <h5 class="text-black my-2 mx-2">A review by ${review.user.username}</h5>
                                            <small class="text-muted text-black my-2 mx-2">${review.createdAt}</small>
                                        </div>
                                        <p class="card-text text-black ms-4 review-text">${review.review}</p>
                                        <div class="form-container" style="display: none;">
                                            <form action="/review/${review.id}/edit" method="post" class="edit-review-form">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <input type="hidden" name="reviewId" value="${review.id}" />
                                                <textarea name="review" class="form-control edit-review" rows="3">${review.review}</textarea>
                                                <input type="submit" class="btn btn-primary my-auto" value="Update Review" />
                                            </form>
                                        </div>
                                        <div class="d-flex flex-column justify-content-between w-100 container fluid">
                                            <p class="card-text text-black align-self-end justify-content-end">
                                                <c:choose>
                                                    <c:when test="${review.user.id == currentUser.id}">
                                                        <a href="/deletereview/${review.id}" class="text-muted"><i class="bi bi-trash3 text-black"></i></a>
                                                        <i class="bi bi-pen text-black edit-btn"></i>
                                                    </c:when>
                                                    <c:when test="${review.user.id != currentUser.id}">
                                                        <c:forEach var="role" items="${currentUser.roles}">
                                                            <c:if test="${role.name == 'ROLE_ADMIN'}">
                                                                <a href="/deletereview/${review.id}" class="text-muted"><i class="bi bi-trash3 text-black"></i></a>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

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


<script type="text/javascript" >

    $(document).ready( function () {
        const rates=parseInt(${movie.avgRates()});

        setRating(rates)
    });
</script>
<script>
    $("[data-media]").on("click", function(e) {
        e.preventDefault();
        var $this = $(this);
        var videoUrl = $this.attr("data-media");
        var popup = $this.attr("href");
        var $popupIframe = $(popup).find("iframe");

        $popupIframe.attr("src", videoUrl);

        $this.closest(".page").addClass("show-popup");
    });

    $(".popup").on("click", function(e) {
        e.preventDefault();
        e.stopPropagation();

        $(".page").removeClass("show-popup");
    });

    $(".popup > iframe").on("click", function(e) {
        e.stopPropagation();
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        // Show form and hide text card
        function switchToForm(container) {
            container.find('.review-text').hide();
            container.find('.form-container').show();
        }

        // Show text card and hide form
        function switchToTextCard(container) {
            container.find('.form-container').hide();
            container.find('.review-text').show();
        }

        // Switch between text card and form
        function switchCard(container) {
            const formContainer = container.find('.form-container');
            const reviewText = container.find('.review-text');
            const editBtn = container.find('.edit-btn');

            editBtn.click(function() {
                if (formContainer.is(':hidden')) {
                    switchToForm(container);
                } else {
                    switchToTextCard(container);
                }
            });
        }

        // Iterate over each review container
        $('.review-container').each(function() {
            const container = $(this);
            switchCard(container);
        });
    });
</script>


</body>
</html>