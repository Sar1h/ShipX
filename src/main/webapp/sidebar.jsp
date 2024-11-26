<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<aside class="sidebar">
    <!-- Logo Section -->
    <div class="sidebar-header">
        <div class="logo-container">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="FastTrack Logo">
            <span class="logo-text">FastTrack</span>
        </div>
        <button class="sidebar-toggle">
            <i class="fas fa-bars"></i>
        </button>
    </div>

    <!-- User Profile Section -->
    <div class="user-profile">
        <div class="profile-image">
            <img src="${pageContext.request.contextPath}/images/user-avatar.jpg" alt="User Avatar">
            <span class="status-dot online"></span>
        </div>
        <div class="profile-info">
            <span class="user-name">${sessionScope.user.name}</span>
            <span class="user-role">${sessionScope.user.role}</span>
        </div>
    </div>

    <!-- Navigation Menu -->
    <nav class="sidebar-nav">
        <ul class="nav-list">
            <!-- Dashboard -->
            <li class="nav-item ${pageContext.request.servletPath == '/dashboard' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/dashboard">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <!-- Shipments Section -->
            <li class="nav-section">
                <span class="section-title">Shipments</span>
                <ul>
                    <li class="nav-item ${pageContext.request.servletPath == '/add-shipment' ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/add-shipment">
                            <i class="fas fa-plus-circle"></i>
                            <span>Add Shipment</span>
                        </a>
                    </li>
                    <li class="nav-item ${pageContext.request.servletPath == '/track-shipment' ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/track-shipment">
                            <i class="fas fa-search-location"></i>
                            <span>Track Shipment</span>
                        </a>
                    </li>
                    <li class="nav-item ${pageContext.request.servletPath == '/orders-pending' ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/orders-pending">
                            <i class="fas fa-clock"></i>
                            <span>Orders Pending</span>
                            <span class="badge">5</span>
                        </a>
                    </li>
                </ul>
            </li>

            <!-- Customer Service Section -->
            <li class="nav-section">
                <span class="section-title">Customer Service</span>
                <ul>
                    <li class="nav-item ${pageContext.request.servletPath == '/customer-queries' ? 'active' : ''}">
                        <a href="${pageContext.request.contextPath}/customer-queries">
                            <i class="fas fa-comments"></i>
                            <span>Customer Queries</span>
                            <span class="badge badge-warning">3</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/feedback">
                            <i class="fas fa-star"></i>
                            <span>Feedback</span>
                        </a>
                    </li>
                </ul>
            </li>

            <!-- Reports Section -->
            <li class="nav-section">
                <span class="section-title">Reports</span>
                <ul>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/reports/shipments">
                            <i class="fas fa-chart-bar"></i>
                            <span>Shipment Reports</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/reports/revenue">
                            <i class="fas fa-dollar-sign"></i>
                            <span>Revenue Reports</span>
                        </a>
                    </li>
                </ul>
            </li>

            <!-- Settings Section -->
            <li class="nav-section">
                <span class="section-title">Settings</span>
                <ul>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/profile">
                            <i class="fas fa-user-cog"></i>
                            <span>Profile Settings</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/system-settings">
                            <i class="fas fa-cogs"></i>
                            <span>System Settings</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- Sidebar Footer -->
    <div class="sidebar-footer">
        <a href="${pageContext.request.contextPath}/help" title="Help">
            <i class="fas fa-question-circle"></i>
        </a>
        <a href="${pageContext.request.contextPath}/notifications" title="Notifications">
            <i class="fas fa-bell"></i>
            <span class="badge badge-danger">2</span>
        </a>
        <a href="${pageContext.request.contextPath}/logout" title="Logout">
            <i class="fas fa-power-off"></i>
        </a>
    </div>
</aside>