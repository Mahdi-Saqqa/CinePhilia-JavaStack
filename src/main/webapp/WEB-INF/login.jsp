<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 5/16/2023
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Login and Registration</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<style>
    .container-center {
        margin-top: 50vh;
        transform: translateY(-50%);
    }
</style>
</head>
<body>
<div class="container container-center">
    <div class="row">
        <div class="col-md-6">
            <div class="logo">
                <!-- CinePhilia logo -->
                <img src="path_to_logo_image" alt="CinePhilia Logo">
                <!-- Slogan -->
                <p>With CinePhilia, Every film becomes an immersive experience that speaks to your soul.</p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="login-form">
                <h2>Login</h2>
                <form action="login" method="post">
                    <!-- Email input -->
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>

                    <!-- Password input -->
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary">Login</button>
                </form>
                <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
            </div>
        </div>
    </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
