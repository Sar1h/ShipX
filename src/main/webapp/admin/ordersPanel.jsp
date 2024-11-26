<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Orders Panel - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="admin-layout">
        <div class="admin-sidebar" id="adminSidebar">
            <div class="sidebar-header">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Company Logo" class="company-logo">
                <button class="toggle-sidebar" onclick="toggleSidebar()">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            
            <nav class="sidebar-nav">
                <ul>
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/admin/ordersPanel.jsp">
                            <i class="fas fa-box"></i>
                            <span>Orders</span>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/Query.jsp">
                            <i class="fas fa-question-circle"></i>
                            <span>Customer Queries</span>
                        </a>
                    </li>
                </ul>
            </nav>
            
            <div class="sidebar-footer">
                <a href="${pageContext.request.contextPath}/logout.jsp" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </div>
        </div>

        <main class="admin-main">
            <div class="admin-header">
                <h1>Orders Management</h1>
                <div class="admin-controls">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="searchInput" placeholder="Search by tracking number...">
                    </div>
                    <div class="sort-box">
                        <select id="sortSelect">
                            <option value="none">Sort by: None</option>
                            <option value="priority">Sort by: Status Priority</option>
                        </select>
                    </div>
                    <button class="btn-refresh" onclick="refreshOrders()">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                </div>
            </div>

            <div class="orders-table-container">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Tracking No.</th>
                            <th>Sender</th>
                            <th>Receiver</th>
                            <th>From</th>
                            <th>To</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="ordersTableBody">
                        <c:forEach items="${orders}" var="order">
                            <tr data-tracking="${order.trackingNumber}">
                                <td>${order.trackingNumber}</td>
                                <td>${order.senderName}</td>
                                <td>${order.receiverName}</td>
                                <td>${order.senderAddress}</td>
                                <td>${order.receiverAddress}</td>
                                <td class="status-cell">
                                    <select class="status-select" onchange="markUnsaved(this)">
                                        <option value="pickup pending" ${order.status == 'pickup pending' ? 'selected' : ''}>Pickup Pending</option>
                                        <option value="picked up" ${order.status == 'picked up' ? 'selected' : ''}>Picked Up</option>
                                        <option value="at sender warehouse facility" ${order.status == 'at sender warehouse facility' ? 'selected' : ''}>At Sender Warehouse</option>
                                        <option value="in transit" ${order.status == 'in transit' ? 'selected' : ''}>In Transit</option>
                                        <option value="at receiver warehouse facility" ${order.status == 'at receiver warehouse facility' ? 'selected' : ''}>At Receiver Warehouse</option>
                                        <option value="out for delivery" ${order.status == 'out for delivery' ? 'selected' : ''}>Out for Delivery</option>
                                        <option value="delivered" ${order.status == 'delivered' ? 'selected' : ''}>Delivered</option>
                                    </select>
                                    <span class="unsaved-indicator" style="display: none;">●</span>
                                </td>
                                <td>
                                    <button class="btn-update" onclick="updateStatus(this)">
                                        <i class="fas fa-save"></i> Update
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('adminSidebar');
            sidebar.classList.toggle('collapsed');
        }

        function markUnsaved(selectElement) {
            const row = selectElement.closest('tr');
            const indicator = row.querySelector('.unsaved-indicator');
            indicator.style.display = 'inline';
        }

        function refreshOrders() {
            const searchQuery = document.getElementById('searchInput').value;
            const sortOption = document.getElementById('sortSelect').value;
            
            let url = '${pageContext.request.contextPath}/admin/OrderPanelController';
            
            // Add parameters if they exist
            const params = new URLSearchParams();
            if (searchQuery) params.append('search', searchQuery);
            if (sortOption !== 'none') params.append('sort', sortOption);
            
            if (params.toString()) {
                url += '?' + params.toString();
            }

            window.location.href = url;
        }

        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.className = `notification ${type}`;
            
            const iconClass = (type == 'success') ? 'fa-check-circle' : 'fa-exclamation-circle';
            
            notification.innerHTML = 
                '<i class="fas ' + iconClass + '"></i>' +
                message;
            
            document.body.appendChild(notification);

            // Remove notification after 3 seconds
            setTimeout(function() {
                notification.remove();
            }, 3000);
        }

        function updateStatus(button) {
            const row = button.closest('tr');
            const trackingNumber = row.dataset.tracking;
            const status = row.querySelector('.status-select').value;
            const indicator = row.querySelector('.unsaved-indicator');

            // Show loading state
            button.disabled = true;
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Updating...';

            fetch('${pageContext.request.contextPath}/admin/OrderPanelController', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: 'trackingNumber=' + trackingNumber + '&status=' + status
            })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(function(result) {
                if (result === 'success') {
                    indicator.style.display = 'none';
                    if (status === 'delivered') {
                        row.remove();
                    }
                    showNotification('Status updated successfully', 'success');
                } else {
                    throw new Error(result || 'Failed to update status');
                }
            })
            .catch(function(error) {
                console.error('Error:', error);
                showNotification('Failed to update status: ' + error.message, 'error');
            })
            .finally(function() {
                // Reset button state
                button.disabled = false;
                button.innerHTML = '<i class="fas fa-save"></i> Update';
            });
        }

        // Add event listeners for search and sort
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const sortSelect = document.getElementById('sortSelect');

            searchInput.addEventListener('input', function(e) {
                // Optional: Add debounce here if you want to search as user types
            });

            sortSelect.addEventListener('change', function(e) {
                refreshOrders();
            });
        });
    </script>
</body>
</html> 