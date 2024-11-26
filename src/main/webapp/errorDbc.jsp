<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - FastTrack Courier</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/status-pages.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="status-container error">
        <div class="status-icon">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        <div class="status-content">
            <h1>Oops! Something went wrong</h1>
            <div class="error-details">
                <p class="status-message">
                    <%
                        String errorMessage = (String)request.getAttribute("errorMessage");
                        out.println(errorMessage != null ? errorMessage : "An unexpected error occurred.");
                    %>
                </p>
                <div class="error-code">
                    <small>Error Code: ${pageContext.errorData.statusCode}</small>
                </div>
            </div>
            <div class="status-actions">
                <a href="ClientDash.jsp" class="btn-primary">
                    <i class="fas fa-home"></i> Back to Home
                </a>
                <a href="javascript:history.back()" class="btn-secondary">
                    <i class="fas fa-arrow-left"></i> Go Back
                </a>
                <a href="#" class="btn-help" onclick="showHelp()">
                    <i class="fas fa-question-circle"></i> Need Help?
                </a>
            </div>
        </div>
    </div>

    <script>
        function showHelp() {
            alert('Please contact our support team:\nEmail: support@fasttrack.com\nPhone: 1-800-FASTTRACK');
        }
    </script>
</body>
</html>