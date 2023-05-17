<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-6 text-center mb-4">
            <img src="/img/logo.png" alt="CinePhilia Logo">
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="register-form">
                <h2 class="text-center">Register</h2>
                <h1>Register!</h1>


                <form:form method="POST" action="/register" modelAttribute="user">
                    <!-- Username input -->

                    <div class="form-group">
                        <form:label path="username">Username:</form:label>
                        <form:input path="username" type="text" class="form-control"/>
                    </div>
                    <!-- Email input -->

                    <div class="form-group">
                        <form:label path="email">Email:</form:label>
                        <form:input path="email" type="email" class="form-control"/>
                    </div>
                    <!-- Password input -->
                    <div class="form-group">
                        <form:label path="password">Password:</form:label>
                        <form:password path="password" class="form-control"/>
                    </div>
                    <!-- Confirm password input -->
                    <div class="form-group">
                        <form:label path="confirmPassword">PWConfirm:</form:label>
                        <form:password path="confirmPassword" class="form-control"/>
                    </div>
                    <!-- Date of Birth input -->
                    <div class="form-group">
                        <form:label path="dob">Date Of Birth:</form:label>
                        <form:input path="dob" type="date" class="form-control"/>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block" value="Register!">Register</button>
                </form:form>
            </div>
            <div class="d-grid">
                <p class="alert alert-danger"><form:errors path="user.*"/></p>

            </div>
        </div>
    </div>
    <!-- Include Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

