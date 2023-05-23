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
        <h3 class="d-flex align-items-center ">${genre.name} <i class="fa-regular fa-chevron-right"></i></h3>
        <div class="row w-100 justify-content-evenly">
          <c:forEach var="movie" items="${movies}">
            <a href="/movie/${movie.id}" class="ratio-16x9 m-3
                        <c:if test="${currentUser.dark}">
                       bg-dark text-white
                        </c:if>
"  style="width: 30vh; background-size: cover; text-decoration: none;" onmouseover="cardHoverIn(this)" onmouseleave="cardHoverOut(this, 1)"  >
              <img class="rounded img-fluid" src="https://www.themoviedb.org/t/p/w355_and_h200_bestv2${movie.poster}">
              <p class="text- mt-2 h6" id="title" >${movie.title}</p>
              <p class="text-muted" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${movie.overview}</p>
            </a>
          </c:forEach>
        </div>

      </main>


    </div>
  </div>
</div>
<script>
  function redirect(id){
    window.location.href = "/movie/"+id;
  }
</script>

<script src="/js/index.js" ></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>