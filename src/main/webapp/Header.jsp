<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .user-profile {
            display: flex;
            align-items: center;
            margin-left: 20px;
            padding: 5px 15px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            color: #333;
        }
        
        .user-profile i {
            margin-right: 8px;
            color: #007bff;
        }
        
        .user-name {
            font-weight: 500;
            color: #007bff;
        }
        
        .nav-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }
    </style>
</head>
<body>
<div>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="ClientDash.jsp" class="logo">
                <img src="images/logo.png" alt="FastTrack Logo">
                <!-- <span>FastTrack Courier</span>-->
            </a>
            <div class="nav-links">
                <a href="track.jsp">Track Package</a>
                <a href="SimpleShipmentForm.jsp">Book Shipment</a>
                <a href="#services">Services</a>
                <a href="#about">About Us</a>
                <a href="contactUs.jsp">Contact</a>
                <div class="nav-right">
                    <div class="user-profile">
                        <i class="fas fa-user-circle"></i>
                        <span class="user-name">${sessionScope.User}</span>
                    </div>
                    <!-- a href="${pageContext.request.contextPath}/MyOrdersController">My Orders</a-->
                    <a href="logout.jsp" class="btn-signup">Logout</a>
                </div>
            </div>
            <div class="mobile-menu">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
