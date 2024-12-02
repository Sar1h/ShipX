	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div>
 <!-- Navigation -->
   <nav class="navbar">
        <div class="nav-container">
            <a href="index.jsp" class="logo">
                <img src="images/logo.png" alt="FastTrack Logo">
                <!-- <span>FastTrack Courier</span>-->
            </a>
            <div class="nav-links">
                <a href="track.jsp">Track Package</a>
                <a href="#services">Services</a>
                <a href="#about">About Us</a>
                <a href="contactUs.jsp">Contact</a>
                <a href="userlogin.jsp" class="btn-login">Login</a>
                <a href="signup.jsp" class="btn-signup">Sign Up</a>
            </div>
            <div class="mobile-menu">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
