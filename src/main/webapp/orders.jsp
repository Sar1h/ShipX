<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Orders - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orders.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-layout">
    <jsp:include page="Header.jsp" />


        <main class="main-content">
            <div class="page-header">
                <h1><i class="fas fa-clock"></i> Pending Orders</h1>
                <div class="header-actions">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search orders...">
                    </div>
                    <button class="btn-filter">
                        <i class="fas fa-filter"></i> Filter
                    </button>
                    <button class="btn-export">
                        <i class="fas fa-download"></i> Export
                    </button>
                </div>
            </div>

            <!-- Filter Panel -->
            <div class="filter-panel">
                <div class="filter-group">
                    <label>Date Range</label>
                    <div class="date-inputs">
                        <input type="date" placeholder="Start Date">
                        <input type="date" placeholder="End Date">
                    </div>
                </div>
                <div class="filter-group">
                    <label>Status</label>
                    <select>
                        <option value="all">All Status</option>
                        <option value="processing">Processing</option>
                        <option value="pending_pickup">Pending Pickup</option>
                        <option value="pending_payment">Pending Payment</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label>Service Type</label>
                    <select>
                        <option value="all">All Services</option>
                        <option value="express">Express Delivery</option>
                        <option value="standard">Standard Delivery</option>
                        <option value="economy">Economy</option>
                    </select>
                </div>
                <div class="filter-actions">
                    <button class="btn-apply">Apply Filters</button>
                    <button class="btn-reset">Reset</button>
                </div>
            </div>

            <!-- Orders Table -->
            <div class="orders-table-container">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" class="select-all">
                            </th>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Service Type</th>
                            <th>Origin</th>
                            <th>Destination</th>
                            <th>Created Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample Order Rows -->
                        <tr>
                            <td><input type="checkbox" class="select-order"></td>
                            <td>#ORD-2024-001</td>
                            <td>
                                <div class="customer-info">
                                    <img src="${pageContext.request.contextPath}/images/avatar1.jpg" alt="Customer">
                                    <div>
                                        <span class="customer-name">John Doe</span>
                                        <span class="customer-email">john@example.com</span>
                                    </div>
                                </div>
                            </td>
                            <td>Express Delivery</td>
                            <td>New York, USA</td>
                            <td>London, UK</td>
                            <td>Mar 15, 2024</td>
                            <td>
                                <span class="status-badge status-processing">Processing</span>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn-view" title="View Details">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                    <button class="btn-edit" title="Edit Order">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn-delete" title="Delete Order">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                        <!-- Add more order rows as needed -->
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <button class="btn-prev" disabled>
                    <i class="fas fa-chevron-left"></i> Previous
                </button>
                <div class="page-numbers">
                    <button class="active">1</button>
                    <button>2</button>
                    <button>3</button>
                    <span>...</span>
                    <button>10</button>
                </div>
                <button class="btn-next">
                    Next <i class="fas fa-chevron-right"></i>
                </button>
            </div>

            <!-- Bulk Actions Panel -->
            <div class="bulk-actions">
                <span>3 items selected</span>
                <div class="bulk-buttons">
                    <button class="btn-bulk-approve">
                        <i class="fas fa-check"></i> Approve Selected
                    </button>
                    <button class="btn-bulk-reject">
                        <i class="fas fa-times"></i> Reject Selected
                    </button>
                    <button class="btn-bulk-delete">
                        <i class="fas fa-trash"></i> Delete Selected
                    </button>
                </div>
            </div>
        </main>

        <!-- Order Details Modal -->
        <div class="modal" id="orderDetailsModal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Order Details #ORD-2024-001</h2>
                    <button class="btn-close">×</button>
                </div>
                <div class="modal-body">
                    <!-- Order details content -->
                </div>
                <div class="modal-footer">
                    <button class="btn-secondary">Close</button>
                    <button class="btn-primary">Update Status</button>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/orders.js"></script>
</body>
</html>