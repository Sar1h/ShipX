<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/main1.css">
    <style>
        .error-alert {
            background-color: #ffebee;
            color: #c62828;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
            text-align: center;
        }
    </style>
</head>
<body class="auth-body">
    <div class="auth-container">
        <form id="userLoginForm" class="auth-form" action="LoginController" method="POST">
            <h2>Login</h2>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
                <div class="error-alert">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control" required>
                <small class="error-message"></small>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
                <small class="error-message"></small>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Login</button>
            <div class="form-footer">
                <span>Don't have an account? <a href="signup.jsp">Sign Up</a></span>                
            </div>
        </form>
    </div>

    <script>
        // Basic form validation
        document.getElementById('userLoginForm').addEventListener('submit', function(e) {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            
            if (!email || !password) {
                e.preventDefault();
                alert('Please fill in all fields');
            }
        });
    </script>
</body>
</html>