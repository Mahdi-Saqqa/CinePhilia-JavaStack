<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        h1 {
            color:white;
        }
        star {
            cursor: pointer;
            color: gray;
        }
        star highlight {
            color: orange;
        }
    </style>
</head>
<body class="bg-dark">
<div class="container-fluid overflow-hidden">
    <div class="row vh-100 overflow-auto">
        <div class="col-12 col-sm-3 col-xl-2 px-sm-2 px-0 bg-dark d-flex sticky-top">
            <div class="d-flex flex-sm-column flex-row flex-grow-1 align-items-center align-items-sm-start px-3 pt-2 text-white">
                <a href="/" class="d-flex align-items-center py-3 pb-sm-3 mb-md-0 me-md-auto text-white text-decoration-none">
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
            </div>
        </div>

        <div class="col-sm-9 col-xl-10 py-3">
            <div class="row">
                <iframe width="420" height="315"
                        src="https://www.youtube.com/embed/${movie.trailer}?autoplay=1&mute=1">
                </iframe>
                <div class="col-md-6 col-sm-12">
                    <img class="rounded" style="height: 600px; width: 400px;" src="https://www.themoviedb.org/t/p/w600_and_h900_bestv2${movie.poster}" alt="Movie Poster" class="img-fluid">
                </div>
                <div class="col-md-6 col-sm-12">
                    <h1 class="display-4 my-5">${movie.title}</h1>
                    <p class="lead me-5 text-wrap">${movie.overview}</p>
                    <p>genres:
                        <c:forEach var="genre" items="${movie.genres}">
                            <a href="/genre/${genre.id}">${genre.name}</a>
                        </c:forEach>
                    </p>
                    <div class="rating-stars">
                        <i class="bi bi-star display-6" data-rating="1"></i>
                        <i class="bi bi-star display-6" data-rating="2"></i>
                        <i class="bi bi-star display-6" data-rating="3"></i>
                        <i class="bi bi-star display-6" data-rating="4"></i>
                        <i class="bi bi-star display-6" data-rating="5"></i>
                        <c:if test="${movie.avgRates()==0}">
                            <span>Be the first to rate this movie</span>
                        </c:if>
                        <c:if test="${movie.avgRates() !=0}">
                            ${movie.avgRates()}
                        </c:if>
                    </div>

                    <button class="btn btn-primary" onclick="createReviewBox(this)">Add Review</button>
                </div>
            </div>
            <div id="reviewBoxContainer"></div>
        </div>

    </div>
</div>
</div>
</div>
</div>

<script>
    const stars = document.querySelectorAll('.rating-stars i');

    stars.forEach(star => {
        star.addEventListener('click', () => {
            const rating = star.getAttribute('data-rating');
            setRating(rating);
        });
    });

    function setRating(rating) {
        stars.forEach(star => {
            const starRating = star.getAttribute('data-rating');
            if (starRating <= rating) {
                star.classList.add('bi-star-fill');
                star.classList.add('text-warning');
                star.classList.remove('bi-star');
            } else {
                star.classList.add('bi-star');
                star.classList.remove('text-warning');
                star.classList.remove('bi-star-fill');
            }
        });
    }

    function createReviewBox(elem) {

        var reviewBoxContainer = document.getElementById("reviewBoxContainer");

        // Create the review box div
        var reviewBoxDiv = document.createElement("div");
        reviewBoxDiv.classList.add("review-box");

        // Create the review input field
        var reviewInput = document.createElement("textarea");
        reviewInput.classList.add("form-control");
        reviewInput.setAttribute("rows", "4");
        reviewInput.setAttribute("placeholder", "Write your review...");

        // Create the submit button
        var submitButton = document.createElement("button");
        submitButton.classList.add("btn", "btn-primary");
        submitButton.textContent = "Submit Review";

        // Append the input field and submit button to the review box div
        reviewBoxDiv.appendChild(reviewInput);
        reviewBoxDiv.appendChild(submitButton);

        // Append the review box div to the container
        reviewBoxContainer.appendChild(reviewBoxDiv);
        elem.remove();
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.11/dist/gsap.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script><!-- change to match your file/naming structure -->
</body>
</html>
