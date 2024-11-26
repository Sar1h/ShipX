<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Queries - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .queries-container {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .query-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            padding: 20px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .query-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .query-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background: #e9ecef;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #495057;
        }

        .user-details {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 600;
            color: #212529;
        }

        .user-email {
            font-size: 0.9em;
            color: #6c757d;
        }

        .query-subject {
            font-weight: 600;
            color: #0056b3;
            margin-bottom: 10px;
        }

        .query-message {
            color: #495057;
            line-height: 1.5;
            margin-bottom: 20px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #0056b3;
        }

        .reply-section {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .reply-input {
            width: 100%;
            min-height: 100px;
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            resize: vertical;
            font-family: inherit;
            transition: border-color 0.2s;
        }

        .reply-input:focus {
            outline: none;
            border-color: #0056b3;
        }

        .btn-submit {
            align-self: flex-end;
            padding: 10px 20px;
            background: #0056b3;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: background-color 0.2s;
        }

        .btn-submit:hover {
            background: #004494;
        }

        .btn-submit:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 15px 25px;
            border-radius: 8px;
            background: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            display: flex;
            align-items: center;
            gap: 10px;
            animation: slideIn 0.3s ease-out;
        }

        .notification.success {
            background: #d4edda;
            color: #155724;
        }

        .notification.error {
            background: #f8d7da;
            color: #721c24;
        }

        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
    <div class="admin-layout">
        <jsp:include page="adminSidebar.jsp">
            <jsp:param name="activePage" value="queries"/>
        </jsp:include>

        <main class="admin-main">
            <div class="admin-header">
                <h1>Customer Queries</h1>
                <div class="admin-controls">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="searchInput" placeholder="Search by name or email...">
                    </div>
                    <button class="btn-refresh" onclick="refreshQueries()">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                </div>
            </div>

            <div class="queries-container" id="queriesContainer">
                <c:forEach items="${queries}" var="query">
                    <div class="query-card" data-id="${query.id}">
                        <div class="query-header">
                            <div class="user-info">
                                <div class="user-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="user-details">
                                    <span class="user-name">${query.name}</span>
                                    <span class="user-email">${query.email}</span>
                                </div>
                            </div>
                            <div class="query-timestamp">
                                <i class="far fa-clock"></i>
                                ${query.timestamp}
                            </div>
                        </div>
                        
                        <div class="query-subject">
                            <i class="fas fa-envelope"></i> ${query.subject}
                        </div>
                        
                        <div class="query-message">
                            ${query.message}
                        </div>
                        
                        <div class="reply-section">
                            <textarea class="reply-input" 
                                placeholder="Type your reply here..."
                                rows="4"></textarea>
                            <button class="btn-submit" onclick="submitReply(this)">
                                <i class="fas fa-paper-plane"></i>
                                Submit Reply
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>

    <script>
        function refreshQueries() {
            const searchQuery = document.getElementById('searchInput').value;
            window.location.href = '${pageContext.request.contextPath}/admin/QueryController' +
                                 (searchQuery ? '?search=' + encodeURIComponent(searchQuery) : '');
        }

        function submitReply(button) {
            const card = button.closest('.query-card');
            const id = card.dataset.id;
            const reply = card.querySelector('.reply-input').value.trim();
            
            if (!reply) {
                alert('Please enter a reply');
                return;
            }

            button.disabled = true;
            button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Submitting...';

            const formData = new URLSearchParams();
            formData.append('id', id);
            formData.append('reply', reply);

            fetch('${pageContext.request.contextPath}/admin/QueryController', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString()
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(result => {
                if (result === 'success') {
                    card.remove();
                    showNotification('Reply sent successfully!', 'success');
                } else {
                    throw new Error('Failed to send reply');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification('Failed to send reply: ' + error.message, 'error');
            })
            .finally(() => {
                button.disabled = false;
                button.innerHTML = '<i class="fas fa-paper-plane"></i> Submit Reply';
            });
        }

        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.className = 'notification ' + type;
            
            const iconClass = type === 'success' ? 'fas fa-check-circle' : 'fas fa-exclamation-circle';
            
            notification.innerHTML = '<i class="' + iconClass + '"></i> ' + message;
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.remove();
            }, 3000);
        }

        document.getElementById('searchInput').addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                refreshQueries();
            }
        });
    </script>
</body>
</html> 