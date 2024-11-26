<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Queries - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Customerqueries.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

 <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="index.html" class="logo">
                <img src="images/logo.png" alt="FastTrack Logo">
                <span>FastTrack Courier</span>
            </a>
            <div class="nav-links">
                <a href="tracking.jsp">Track Package</a>
                <a href="#services">Services</a>
                <a href="#about">About Us</a>
                <a href="#contact">Contact</a>
                <a href="login.jsp" class="btn-login">Login</a>
                <a href="signup.jsp" class="btn-signup">Sign Up</a>
            </div>
            <div class="mobile-menu">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>
    <div class="dashboard-layout">
    
    
        
        <main class="main-content">
            <!-- Header Section -->
            <div class="page-header">
                <h1><i class="fas fa-comments"></i> Customer Queries</h1>
                <div class="header-actions">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search queries...">
                    </div>
                    <div class="view-options">
                        <button class="active">
                            <i class="fas fa-inbox"></i> Inbox
                        </button>
                        <button>
                            <i class="fas fa-paper-plane"></i> Sent
                        </button>
                        <button>
                            <i class="fas fa-archive"></i> Archived
                        </button>
                    </div>
                </div>
            </div>

            <!-- Main Content Grid -->
            <div class="queries-grid">
                <!-- Queries List -->
                <div class="queries-list">
                    <div class="list-header">
                        <div class="bulk-actions">
                            <input type="checkbox" id="selectAll">
                            <label for="selectAll">Select All</label>
                        </div>
                        <div class="sort-options">
                            <select>
                                <option>Latest First</option>
                                <option>Oldest First</option>
                                <option>Priority High-Low</option>
                                <option>Priority Low-High</option>
                            </select>
                        </div>
                    </div>

                    <!-- Query Items -->
                    <div class="query-items">
                        <div class="query-item unread selected">
                            <div class="item-checkbox">
                                <input type="checkbox" checked>
                            </div>
                            <div class="item-priority high">
                                <i class="fas fa-exclamation-circle"></i>
                            </div>
                            <div class="item-content">
                                <div class="item-header">
                                    <h3>Package Delivery Delay</h3>
                                    <span class="timestamp">2 hours ago</span>
                                </div>
                                <div class="item-body">
                                    <p class="customer-name">John Doe</p>
                                    <p class="query-preview">My package (tracking: FT123456) was supposed to arrive yesterday but...</p>
                                </div>
                                <div class="item-footer">
                                    <span class="badge">Delivery Issue</span>
                                    <span class="badge">Urgent</span>
                                </div>
                            </div>
                        </div>

                        <!-- More query items... -->
                        <div class="query-item">
                            <div class="item-checkbox">
                                <input type="checkbox">
                            </div>
                            <div class="item-priority medium">
                                <i class="fas fa-exclamation"></i>
                            </div>
                            <div class="item-content">
                                <div class="item-header">
                                    <h3>Billing Inquiry</h3>
                                    <span class="timestamp">1 day ago</span>
                                </div>
                                <div class="item-body">
                                    <p class="customer-name">Sarah Smith</p>
                                    <p class="query-preview">I was charged twice for my last shipment (Invoice #INV-2024-089)...</p>
                                </div>
                                <div class="item-footer">
                                    <span class="badge">Billing</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Query Details -->
                <div class="query-details">
                    <div class="details-header">
                        <div class="customer-profile">
                            <img src="${pageContext.request.contextPath}/images/avatar1.jpg" alt="Customer">
                            <div class="profile-info">
                                <h2>John Doe</h2>
                                <p>john.doe@example.com</p>
                                <p>Customer since: Jan 2024</p>
                            </div>
                        </div>
                        <div class="query-actions">
                            <button class="btn-resolve">
                                <i class="fas fa-check-circle"></i> Mark as Resolved
                            </button>
                            <button class="btn-assign">
                                <i class="fas fa-user-plus"></i> Assign
                            </button>
                            <button class="btn-more">
                                <i class="fas fa-ellipsis-v"></i>
                            </button>
                        </div>
                    </div>

                    <div class="details-content">
                        <div class="query-thread">
                            <!-- Original Query -->
                            <div class="message customer">
                                <div class="message-header">
                                    <span class="sender">John Doe</span>
                                    <span class="timestamp">Mar 15, 2024, 10:30 AM</span>
                                </div>
                                <div class="message-content">
                                    <p>My package (tracking: FT123456) was supposed to arrive yesterday but I haven't received it yet. This is urgent as it contains important documents.</p>
                                    <div class="message-attachments">
                                        <a href="#" class="attachment">
                                            <i class="fas fa-paperclip"></i> tracking_screenshot.jpg
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Reply -->
                            <div class="message staff">
                                <div class="message-header">
                                    <span class="sender">Support Staff (Jane)</span>
                                    <span class="timestamp">Mar 15, 2024, 10:45 AM</span>
                                </div>
                                <div class="message-content">
                                    <p>I apologize for the delay. I've checked your tracking number and I can see that there was a weather-related delay. The package is currently at our local distribution center and will be delivered today by 5 PM.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Reply Form -->
                        <div class="reply-form">
                            <div class="form-header">
                                <div class="reply-type">
                                    <button class="active">
                                        <i class="fas fa-reply"></i> Reply
                                    </button>
                                    <button>
                                        <i class="fas fa-reply-all"></i> Reply All
                                    </button>
                                    <button>
                                        <i class="fas fa-forward"></i> Forward
                                    </button>
                                </div>
                                <div class="template-select">
                                    <select>
                                        <option>Select Template</option>
                                        <option>Delivery Delay Response</option>
                                        <option>General Apology</option>
                                        <option>Request More Information</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-editor">
                                <textarea placeholder="Type your reply..."></textarea>
                                <div class="editor-actions">
                                    <button title="Attach File">
                                        <i class="fas fa-paperclip"></i>
                                    </button>
                                    <button title="Insert Template">
                                        <i class="fas fa-file-alt"></i>
                                    </button>
                                    <button title="Format Text">
                                        <i class="fas fa-font"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="form-footer">
                                <button class="btn-send">
                                    <i class="fas fa-paper-plane"></i> Send Reply
                                </button>
                                <button class="btn-save">
                                    <i class="fas fa-save"></i> Save Draft
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Customer Information Sidebar -->
                    <div class="customer-sidebar">
                        <div class="sidebar-section">
                            <h3>Customer Details</h3>
                            <div class="detail-item">
                                <span class="label">Phone:</span>
                                <span class="value">+1 (555) 123-4567</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">Location:</span>
                                <span class="value">New York, USA</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">Total Orders:</span>
                                <span class="value">15</span>
                            </div>
                        </div>

                        <div class="sidebar-section">
                            <h3>Related Shipments</h3>
                            <div class="related-shipment">
                                <span class="tracking-number">FT123456</span>
                                <span class="status pending">In Transit</span>
                                <a href="#" class="view-details">View Details</a>
                            </div>
                        </div>

                        <div class="sidebar-section">
                            <h3>Previous Queries</h3>
                            <div class="previous-query">
                                <span class="query-date">Mar 10, 2024</span>
                                <span class="query-subject">Delivery Address Change</span>
                                <span class="status resolved">Resolved</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/js/Customerqueries.js"></script>
</body>
</html>