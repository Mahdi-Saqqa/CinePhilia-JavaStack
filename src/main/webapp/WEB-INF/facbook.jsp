<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <title>Tacos</title>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/login.css"> <!-- change to match your file/naming structure -->
  <title>Login</title>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
  <title>jQuery Example</title>
  <script>
    $(document).ready(function() {
      // Execute some code here
    });
  </script>
</head>
<body class="bg-dark">
<form action="/login/facebook" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

  <button type="submit">Login with Facebook</button>
</form>
<div class="pt-5 mt-3">
  <c:if test="${logoutMessage != null}">
    <span id="error" class="alert alert-light text-center">${logoutMessage}</span>
  </c:if>
  <c:if test="${errorMessage != null}">
    <span id="error" class="alert alert-light text-center">${errorMessage}</span>
  </c:if>
</div>



  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>

<script type="text/javascript">
  $(document).ready(function() {
    $.ajaxSetup({ cache: true });
    $.getScript('https://connect.facebook.net/en_US/sdk.js', function(){
      FB.init({
        appId: '767801081595722',
        version: 'v2.7' // or v2.1, v2.2, v2.3, ...
      });
      $('#loginbutton,#feedbutton').removeAttr('disabled');
      FB.getLoginStatus(updateStatusCallback);
      console.log(updateStatusCallback)
    });
  });
</script>
</body>
</html>
