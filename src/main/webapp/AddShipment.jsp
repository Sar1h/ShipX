 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Shipment - FastTrack Courier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Addshipment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
</head>
<body>
    <div class="dashboard-layout">
        <!-- Include your sidebar here -->
        <!-- jsp:include page="/sidebar.jsp" /-->
        <jsp:include page="Header.jsp" />

        <main class="main-content">
            <div class="page-header" >
                <h1><i class="fas fa-plus-circle"></i>Add New Shipment</h1>
                <nav class="breadcrumb">
                    <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a> /
                    <span>Add Shipment</span>
                </nav>
            </div>

            <div class="shipment-form-container">
                <form action=AddShipmentController method="post" id="shipmentForm" class="multi-step-form animate__animated animate__fadeIn">
                    <!-- Step 1: Sender Details -->
                    <div class="form-step" data-step="1">
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

                    <!-- Step 2: Receiver Details -->
                    <div class="form-step" data-step="2">
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

                    <!-- Step 3: Package Details -->
                    <div class="form-step" data-step="3">
                        <h2>Package Details</h2>
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
                            <div class="form-group">
                                <label for="dimensions">Dimensions (cm)*</label>
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

                    <!-- Step 4: Shipping Options -->
                    <div class="form-step" data-step="4">
                        <h2>Shipping Options</h2>
                        <div class="shipping-options">
                            <div class="shipping-option animate__animated animate__fadeInUp">
                                <input type="radio" id="express" name="shippingMethod" value="express" required>
                                <label for="express" class="option-card">
                                    <div class="option-icon"><i class="fas fa-plane"></i></div>
                                    <div class="option-content">
                                        <span class="option-title">Express Delivery</span>
                                        <span class="option-description">1-2 Business Days</span>
                                        <span class="option-price">$49.99</span>
                                    </div>
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
                            <div class="shipping-option">
                                <input type="radio" id="economy" name="shippingMethod" value="economy">
                                <label for="economy">
                                    <i class="fas fa-box"></i>
                                    <span class="option-title">Economy Delivery</span>
                                    <span class="option-description">5-7 Business Days</span>
                                    <span class="option-price">$19.99</span>
                                </label>
                            </div>
                        </div>

                        <div class="additional-services">
                            <h3>Additional Services</h3>
                            <div class="service-options">
                                <div class="service-option">
                                    <input type="checkbox" id="insurance" name="insurance">
                                    <label for="insurance">
                                        <i class="fas fa-shield-alt"></i>
                                        <span class="option-title">Shipping Insurance</span>
                                        <span class="option-price">+$9.99</span>
                                    </label>
                                </div>
                                <div class="service-option">
                                    <input type="checkbox" id="signature" name="signature">
                                    <label for="signature">
                                        <i class="fas fa-signature"></i>
                                        <span class="option-title">Signature Required</span>
                                        <span class="option-price">+$4.99</span>
                                    </label>
                                </div>
                                <div class="service-option">
                                    <input type="checkbox" id="packaging" name="packaging">
                                    <label for="packaging">
                                        <i class="fas fa-box-open"></i>
                                        <span class="option-title">Premium Packaging</span>
                                        <span class="option-price">+$7.99</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Navigation Buttons -->
                    <div class="form-navigation">
                        <button type="button" class="btn-prev" disabled>
                            <i class="fas fa-arrow-left"></i> Previous
                        </button>
                        <div class="step-indicators">
                            <div class="progress-bar">
                                <div class="progress"></div>
                            </div>
                            <div class="step-dots">
                                <span class="step-dot active"></span>
                                <span class="step-dot"></span>
                                <span class="step-dot"></span>
                                <span class="step-dot"></span>
                            </div>
                        </div>
                        <button type="button" class="btn-next">
                            Next <i class="fas fa-arrow-right"></i>
                        </button>
                        <button type="submit" class="btn-submit" style="display: none;">
                            Submit Shipment <i class="fas fa-check"></i>
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/js/AddShipment.js"></script>
</body>
</html>