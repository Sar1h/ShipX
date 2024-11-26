<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://jakarta.apache.org/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://jakarta.apache.org/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://jakarta.apache.org/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Your Shipment - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tracking.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-layout">
        <jsp:include page="Header.jsp" />
        
        <main class="main-content">
            <div class="tracking-hero">
                <h1>Track Your Shipment</h1>
                <p>Enter your 10-digit tracking number to get real-time updates</p>
                
                <div class="tracking-search">
                    <form id="trackingForm" action="TrackingController" method="get">
                        <div class="search-box">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" 
                                   id="trackingNumber" 
                                   name="trackingNumber" 
                                   placeholder="Enter tracking number" 
                                   required
                                   pattern="[0-9]{10}" 
                                   maxlength="10"
                                   value="${param.trackingNumber}">
                            <button type="submit">Track Now</button>
                        </div>
                    </form>
                </div>

                <c:if test="${not empty error}">
                   <div class="error-message">
                     <i class="fas fa-exclamation-circle"></i>
                          <span>${error}</span>
                    </div>
</c:if>
<c:if test="${empty error}">
    <div class="info-message">
        <i class="fas fa-info-circle"></i>
        <span>Enter a valid tracking number.</span>
    </div>
</c:if>

            </div>

            <c:if test="${not empty shipment}">
                <div class="tracking-result">
                    <div class="status-card">
                        <div class="status-header">
                            <div class="tracking-info">
                                <h2>${shipment.trackingNumber}</h2>
                                <span class="status ${shipment.statusClass}">
                                    <i class="fas fa-circle"></i>
                                    ${shipment.status}
                                </span>
                            </div>
                            <div class="last-update">
                                Last Updated: <fmt:formatDate value="${shipment.lastUpdated}" pattern="MMM dd, yyyy hh:mm a"/>
                            </div>
                        </div>

                        <div class="timeline">
                            <div class="progress-line">
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: ${shipment.statusProgress}%"></div>
                                </div>
                                <div class="status-points">
                                    <div class="point ${shipment.statusProgress >= 0 ? 'active' : ''}" data-status="Pickup Scheduled">
                                        <i class="fas fa-box"></i>
                                        <span>Pickup</span>
                                    </div>
                                    <div class="point ${shipment.statusProgress >= 20 ? 'active' : ''}" data-status="Picked Up">
                                        <i class="fas fa-warehouse"></i>
                                        <span>Origin</span>
                                    </div>
                                    <div class="point ${shipment.statusProgress >= 40 ? 'active' : ''}" data-status="In Transit">
                                        <i class="fas fa-truck-fast"></i>
                                        <span>In Transit</span>
                                    </div>
                                    <div class="point ${shipment.statusProgress >= 80 ? 'active' : ''}" data-status="Out for Delivery">
                                        <i class="fas fa-truck-loading"></i>
                                        <span>Out for Delivery</span>
                                    </div>
                                    <div class="point ${shipment.statusProgress >= 100 ? 'active' : ''}" data-status="Delivered">
                                        <i class="fas fa-check-circle"></i>
                                        <span>Delivered</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="details-grid">
                        <div class="detail-card package-info">
                            <h3><i class="fas fa-box"></i> Package Details</h3>
                            <div class="detail-content">
                                <div class="detail-item">
                                    <span class="label">Type:</span>
                                    <span class="value">${shipment.type}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">Description:</span>
                                    <span class="value">${shipment.description}</span>
                                </div>
                            </div>
                        </div>

                        <div class="detail-card route-info">
                            <h3><i class="fas fa-route"></i> Shipping Route</h3>
                            <div class="route-display">
                                <div class="location from">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <div class="location-details">
                                        <span class="city">${shipment.senderCity}</span>
                                        <span class="name">${shipment.senderName}</span>
                                    </div>
                                </div>
                                <div class="route-arrow">
                                    <i class="fas fa-plane"></i>
                                </div>
                                <div class="location to">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <div class="location-details">
                                        <span class="city">${shipment.receiverCity}</span>
                                        <span class="name">${shipment.receiverName}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/js/tracking.js" async></script>
    
</body>
</html> 