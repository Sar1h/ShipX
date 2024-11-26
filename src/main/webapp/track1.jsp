<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Shipment - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tracking.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-layout">
         <jsp:include page="Header2.jsp" /><br><br><br>
        
        <main class="main-content">
            <div class="tracking-container">
                <div class="tracking-hero">
                    <h1><i class="fas fa-search-location"></i> Track Your Shipment</h1>
                    <p class="subtitle">Enter your tracking number to get real-time updates on your package</p>
                    
                    <div class="tracking-search">
                        <form action="TrackingController" method="get" class="search-form">
                            <div class="search-box">
                                <i class="fas fa-search"></i>
                                <input type="text" 
                                       name="trackingNumber" 
                                       placeholder="Enter your tracking number (e.g., FT123456789)"
                                       pattern="[A-Za-z0-9]+"
                                       required>
                                <button type="submit">Track Package</button>
                            </div>
                        </form>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="error-message">
                            <i class="fas fa-exclamation-circle"></i>
                            ${error}
                        </div>
                    </c:if>
                </div>

                <c:if test="${not empty shipment}">
                    <div class="tracking-result">
                        <div class="shipment-header">
                            <div class="tracking-info">
                                <h2>Tracking Number: <span class="highlight">${shipment.trackingNumber}</span></h2>
                                <span class="status-badge ${shipment.statusClass}">
                                    <i class="fas fa-circle"></i> ${shipment.status}
                                </span>
                            </div>
                            <div class="last-update">
                                Last Updated: <fmt:formatDate value="${shipment.lastUpdated}" pattern="MMM dd, yyyy HH:mm"/>
                            </div>
                        </div>

                        <div class="progress-tracker">
                            <div class="progress-container">
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: ${shipment.statusProgress}%">
                                        <span class="progress-text">${shipment.statusProgress}%</span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="status-points">
                                <div class="point ${shipment.statusProgress >= 0 ? 'active' : ''}">
                                    <i class="fas fa-box"></i>
                                    <span>Pickup Pending</span>
                                </div>
                                <div class="point ${shipment.statusProgress >= 20 ? 'active' : ''}">
                                    <i class="fas fa-truck-loading"></i>
                                    <span>Picked Up</span>
                                </div>
                                <div class="point ${shipment.statusProgress >= 40 ? 'active' : ''}">
                                    <i class="fas fa-warehouse"></i>
                                    <span>At Warehouse</span>
                                </div>
                                <div class="point ${shipment.statusProgress >= 60 ? 'active' : ''}">
                                    <i class="fas fa-truck-moving"></i>
                                    <span>In Transit</span>
                                </div>
                                <div class="point ${shipment.statusProgress >= 80 ? 'active' : ''}">
                                    <i class="fas fa-box-open"></i>
                                    <span>Out for Delivery</span>
                                </div>
                                <div class="point ${shipment.statusProgress >= 100 ? 'active' : ''}">
                                    <i class="fas fa-check-circle"></i>
                                    <span>Delivered</span>
                                </div>
                            </div>
                        </div>

                        <div class="shipment-details">
                            <div class="detail-grid">
                                <div class="detail-card sender">
                                    <h3><i class="fas fa-user-circle"></i> Sender Details</h3>
                                    <div class="detail-content">
                                        <p class="name">${fn:toUpperCase(fn:substring(shipment.senderName, 0, 1))}${fn:toLowerCase(fn:substring(shipment.senderName, 1, -1))}</p>
                                        <p class="location"><i class="fas fa-map-marker-alt"></i> ${shipment.senderCity}</p>
                                    </div>
                                </div>

                                <div class="detail-card route">
                                    <div class="route-line">
                                        <i class="fas fa-plane"></i>
                                    </div>
                                </div>

                                <div class="detail-card receiver">
                                    <h3><i class="fas fa-user-circle"></i> Receiver Details</h3>
                                    <div class="detail-content">
                                        <p class="name">${fn:toUpperCase(fn:substring(shipment.receiverName, 0, 1))}${fn:toLowerCase(fn:substring(shipment.receiverName, 1, -1))}</p>
                                        <p class="location"><i class="fas fa-map-marker-alt"></i> ${shipment.receiverCity}</p>
                                    </div>
                                </div>
                            </div>

                            <div class="package-details">
                                <h3><i class="fas fa-box"></i> Package Information</h3>
                                <div class="package-grid">
                                    <div class="package-item">
                                        <span class="label">Type:</span>
                                        <span class="value">${shipment.type}</span>
                                    </div>
                                    <div class="package-item">
                                        <span class="label">Description:</span>
                                        <span class="value">${shipment.description}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>
    </div>
</body>
</html>