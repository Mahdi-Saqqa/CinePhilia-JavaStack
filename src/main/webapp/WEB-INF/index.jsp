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
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->

</head>
<body>
<!--
Sections animate in and out on scroll. Scroll up or down and the sections will wrap around after hitting the start or end. Uses GSAP for the animations.
-->

<header>
    <div>
    </div>
</header>
 <div >
     <section class="first">
         <div class="outer">
             <div class="inner">
                 <div class="bg one">
                     <h2 class="section-heading">Scroll down</h2>
                 </div>
             </div>
         </div>

     </section>
     <section class="second">
         <div class="outer">
             <div class="inner">
                 <div class="bg">
                     <h2 class="section-heading">Animated with GSAP</h2>
                 </div>
             </div>
         </div>
     </section>
     <section class="third">
         <div class="outer">
             <div class="inner">
                 <div class="bg">
                     <h2 class="section-heading">GreenSock</h2>
                 </div>
             </div>
         </div>
     </section>
     <section class="fourth">
         <div class="outer">
             <div class="inner">
                 <div class="bg">
                     <h2 class="section-heading">Animation platform</h2>
                 </div>
             </div>
         </div>
     </section>
     <section class="fifth">
         <div class="outer">
             <div class="inner">
                 <div class="bg">
                     <h2 class="section-heading">Keep scrolling</h2>
                 </div>
             </div>
         </div>
     </section>
 </div>
<script src="https://cdn.jsdelivr.net/npm/gsap@3.11/dist/gsap.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script><!-- change to match your file/naming structure -->
</body>
</html>