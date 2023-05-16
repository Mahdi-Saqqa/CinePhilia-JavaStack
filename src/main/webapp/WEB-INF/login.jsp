<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 5/16/2023
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Log In</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<style>
    .container-center {
        margin-top: 50vh;
        transform: translateY(-50%);
    }
</style>
</head>
<body class="bg-dark text-light">
<div class="container-fluid row h-100 my-auto">
        <div class="col-md-6 mx-auto my-auto">
            <div class="logo d-flex flex-column justify-content-center align align-items-center ">
                <!-- CinePhilia logo -->
                <img src="/img/Logo.png" alt="CinePhilia Logo mx-auto">
                <!-- Slogan -->
                <h3 class="h3 text-center w-50 mx-auto">With CinePhilia, Every film becomes an immersive experience that speaks to your soul.</h3>
            </div>
        </div>
        <div class="col-md-6">
            <div class="login-form">
                <h2>Login</h2>
                <form action="login" method="post" class="w-75">
                    <!-- Email input -->
                    <div class="form-group">
                        <label for="username">User Name:</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>

                    <!-- Password input -->
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary"  value="Login!">Login</button>
                </form>
                <p>Don't have an account? <a href="/register">Sign up</a></p>
                <c:if test="${logoutMessage != null}">
                    <span class="alert alert-danger">${logoutMessage}</span>
                </c:if>
                <c:if test="${errorMessage != null}">
                    <span class="alert alert-danger">${errorMessage}</span>
                </c:if>
            </div>
        </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
