<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Shipment - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/SimpleShipment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-layout">
        <jsp:include page="Header.jsp" />

        <main class="main-content">
            <div class="page-header">
                <h1><i class="fas fa-box"></i> Create New Shipment</h1>
                <nav class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> /
                    <span>Create Shipment</span>
                </nav>
            </div>

            <div class="shipment-form-container">
                <form action="AddShipmentController" method="post" id="shipmentForm">
                    <!-- Sender Details Section -->
                    <div class="form-section">
                        <h2><i class="fas fa-user-edit"></i> Sender Details</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="senderName">Sender Name*</label>
                                <input type="text" id="senderName" name="senderName" required>
                            </div>
                            <div class="form-group">
                                <label for="senderPhone">Phone Number*</label>
                                <input type="tel" id="senderPhone" name="senderPhone" required>
                            </div>
                            <div class="form-group">
                                <label for="senderEmail">Email Address*</label>
                                <input type="email" id="senderEmail" name="senderEmail" required>
                            </div>
                            <div class="form-group full-width">
                                <label for="senderAddress">Pickup Address*</label>
                                <textarea id="senderAddress" name="senderAddress" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="senderCity">City*</label>
                                <input type="text" id="senderCity" name="senderCity" required>
                            </div>
                            <div class="form-group">
                                <label for="senderState">State*</label>
                                <input type="text" id="senderState" name="senderState" required>
                            </div>
                            <div class="form-group">
                                <label for="senderZip">ZIP Code*</label>
                                <input type="text" id="senderZip" name="senderZip" required>
                            </div>
                        </div>
                    </div>

                    <!-- Receiver Details Section -->
                    <div class="form-section">
                        <h2><i class="fas fa-user-check"></i> Receiver Details</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="receiverName">Receiver Name*</label>
                                <input type="text" id="receiverName" name="receiverName" required>
                            </div>
                            <div class="form-group">
                                <label for="receiverPhone">Phone Number*</label>
                                <input type="tel" id="receiverPhone" name="receiverPhone" required>
                            </div>
                            <div class="form-group">
                                <label for="receiverEmail">Email Address*</label>
                                <input type="email" id="receiverEmail" name="receiverEmail" required>
                            </div>
                            <div class="form-group full-width">
                                <label for="receiverAddress">Delivery Address*</label>
                                <textarea id="receiverAddress" name="receiverAddress" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="receiverCity">City*</label>
                                <input type="text" id="receiverCity" name="receiverCity" required>
                            </div>
                            <div class="form-group">
                                <label for="receiverState">State*</label>
                                <input type="text" id="receiverState" name="receiverState" required>
                            </div>
                            <div class="form-group">
                                <label for="receiverZip">ZIP Code*</label>
                                <input type="text" id="receiverZip" name="receiverZip" required>
                            </div>
                        </div>
                    </div>

                    <!-- Package Details Section -->
                    <div class="form-section">
                        <h2><i class="fas fa-box-open"></i> Package Details</h2>
                        <div class="form-grid">
                            <div class="form-group">
                                <label for="packageType">Package Type*</label>
                                <select id="packageType" name="packageType" required>
                                    <option value="">Select Package Type</option>
                                    <option value="document">Document</option>
                                    <option value="parcel">Parcel</option>
                                    <option value="fragile">Fragile</option>
                                    <option value="heavy">Heavy Goods</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="weight">Weight (kg)*</label>
                                <input type="number" id="weight" name="weight" step="0.01" required>
                            </div>
                            <div class="form-group full-width">
                                <label>Dimensions (cm)*</label>
                                <div class="dimensions-group">
                                    <input type="number" id="length" name="length" placeholder="Length" required>
                                    <input type="number" id="width" name="width" placeholder="Width" required>
                                    <input type="number" id="height" name="height" placeholder="Height" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="declaredValue">Declared Value ($)*</label>
                                <input type="number" id="declaredValue" name="declaredValue" step="0.01" required>
                            </div>
                            <div class="form-group full-width">
                                <label for="description">Package Description*</label>
                                <textarea id="description" name="description" required></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Shipping Method Section -->
                    <div class="form-section">
                        <h2><i class="fas fa-truck"></i> Shipping Method</h2>
                        <div class="shipping-options">
                            <div class="shipping-option">
                                <input type="radio" id="express" name="shippingMethod" value="express" required>
                                <label for="express">
                                    <i class="fas fa-plane"></i>
                                    <span class="option-title">Express Delivery</span>
                                    <span class="option-description">1-2 Business Days</span>
                                    <span class="option-price">$49.99</span>
                                </label>
                            </div>
                            <div class="shipping-option">
                                <input type="radio" id="standard" name="shippingMethod" value="standard">
                                <label for="standard">
                                    <i class="fas fa-truck"></i>
                                    <span class="option-title">Standard Delivery</span>
                                    <span class="option-description">3-5 Business Days</span>
                                    <span class="option-price">$29.99</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-paper-plane"></i> Create Shipment
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/js/SimpleShipment.js"></script>
</body>
</html> 