<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - FastTrack Courier</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .orders-container {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .orders-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.2);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .orders-table th, .orders-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .orders-table th {
            background: #f8f9fa;
            font-weight: 600;
            color: #333;
        }
        
        .orders-table tr:hover {
            background: #f5f5f5;
        }
        
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
            text-transform: capitalize;
        }
        
        .status-pending { background: #cce5ff; color: #004085; }
        .status-intransit { background: #fff3cd; color: #856404; }
        .status-delivered { background: #d4edda; color: #155724; }
        .status-cancelled { background: #f8d7da; color: #721c24; }
        
        .tracking-link {
            color: #007bff;
            text-decoration: none;
        }
        
        .tracking-link:hover {
            text-decoration: underline;
        }
        
        .empty-orders {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <jsp:include page="Header.jsp" />
    
    <div class="orders-container">
        <h1><i class="fas fa-box"></i> My Orders</h1>
        
        <c:if test="${empty orders}">
            <div class="empty-orders">
                <i class="fas fa-box-open fa-3x"></i>
                <h2>No Orders Found</h2>
                <p>You haven't placed any orders yet.</p>
                <a href="SimpleShipmentForm.jsp" class="btn-primary">Create New Shipment</a>
            </div>
        </c:if>
        
        <c:if test="${not empty orders}">
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>Tracking Number</th>
                        <th>Receiver</th>
                        <th>Package Type</th>
                        <th>Shipping Method</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.trackingNumber}</td>
                            <td>${order.receiverName}</td>
                            <td>${order.packageType}</td>
                            <td>${order.shipMethod}</td>
                            <td>
                                <span class="status-badge status-${fn:toLowerCase(fn:replace(order.status, ' ', ''))}">
                                    ${order.status}
                                </span>
                            </td>
                            <td>${order.createdDate}</td>
                            <td>
                                <a href="track.jsp?tracking=${order.trackingNumber}" 
                                   class="tracking-link">
                                    <i class="fas fa-search"></i> Track
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    
    
</body>
</html> 