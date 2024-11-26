<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - FastTrack Courier</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/status-pages.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="status-container success">
        <div class="status-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        <div class="status-content">
            <h1>Success!</h1>
            <p class="status-message">Your shipment has been successfully created.</p>
            <div class="tracking-info">
                <p>Tracking Number: <strong>${trackno}</strong></p>
                <small>Keep this number for future reference</small>
            </div>
            <div class="status-actions">
                <a href="ClientDash.jsp" class="btn-primary">
                    <i class="fas fa-home"></i> Back to Home
                </a>
                <a href="SimpleShipmentForm.jsp" class="btn-secondary">
                    <i class="fas fa-plus"></i> Create Another Shipment
                </a>
            </div>
        </div>
    </div>
</body>
</html>