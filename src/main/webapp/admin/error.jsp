<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error - Admin Panel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <div class="error-container">
        <h1>Error</h1>
        <p>${errorMessage}</p>
        <button onclick="window.location.href='${pageContext.request.contextPath}/admin/OrderPanelController'">
            Try Again
        </button>
    </div>
</body>
</html> 