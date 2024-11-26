<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Questions - Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .questions-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .questions-table th,
        .questions-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .questions-table th {
            background: #f8f9fa;
            font-weight: 600;
        }

        .reply-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .submit-btn {
            padding: 8px 16px;
            background: #2196F3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #1976D2;
        }

        .controls {
            margin: 20px 0;
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn-refresh,
        .btn-sort {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-refresh {
            background-color: #28a745;
            color: white;
        }

        .btn-sort {
            background-color: #17a2b8;
            color: white;
        }

        .btn-refresh:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-sort:hover {
            background-color: #138496;
            transform: scale(1.05);
        }

        .btn-refresh i,
        .btn-sort i {
            font-size: 16px;
        }

        /* Add animation for refresh button */
        .btn-refresh:active i {
            animation: spin 1s linear;
        }

        @keyframes spin {
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <div class="admin-layout">
        <jsp:include page="adminSidebar.jsp">
            <jsp:param name="activePage" value="questions"/>
        </jsp:include>

        <main class="admin-main">
            <div class="admin-header">
                <h1>Customer Questions</h1>
                <div class="controls">
                    <button class="btn-refresh" onclick="loadQuestions('none')">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                    <button class="btn-sort" onclick="loadQuestions('timestamp')">
                        <i class="fas fa-sort"></i> Sort by Time
                    </button>
                </div>
            </div>

            <div class="table-container">
                <table class="questions-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Subject</th>
                            <th>Message</th>
                            <th>Reply</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="questionsTableBody">
                        <!-- Questions will be loaded here -->
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <script>
        function loadQuestions(sortBy) {
            if (!sortBy) sortBy = 'none';
            
            const tbody = document.getElementById('questionsTableBody');
            tbody.innerHTML = '<tr><td colspan="6" style="text-align: center;">Loading...</td></tr>';

            fetch('${pageContext.request.contextPath}/admin/CustQuestionController?sortBy=' + sortBy)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(questions => {
                    tbody.innerHTML = '';

                    if (questions && questions.length > 0) {
                        questions.forEach((question, index) => {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                                <td>${question.name || ''}</td>
                                <td>${question.email || ''}</td>
                                <td>${question.subject || ''}</td>
                                <td>${question.message || ''}</td>
                                <td>
                                    <input type="text" 
                                        id="reply-input-${question.id}" 
                                        name="reply-input-${question.name}" 
                                        class="reply-input" 
                                        placeholder="Type your reply..."
                                        autocomplete="off">
                                </td>
                                <td>
                                    <button class="submit-btn" 
                                        id="submit-btn-${question.id}" 
                                        name="submit-btn-${question.id}" 
                                        onclick="submitReply(${question.id}, this)">
                                        <i class="fas fa-paper-plane"></i> Submit
                                    </button>
                                </td>
                            `;
                            tbody.appendChild(row);
                        });
                    } else {
                        tbody.innerHTML = `
                            <tr>
                                <td colspan="6" style="text-align: center;">No questions found</td>
                            </tr>
                        `;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    tbody.innerHTML = `
                        <tr>
                            <td colspan="6" style="text-align: center; color: red;">
                                Error loading questions: ${error.message}
                            </td>
                        </tr>
                    `;
                });
        }

        function submitReply(id, btn) {
            const tr = btn.closest('tr');
            const reply = tr.querySelector('.reply-input').value.trim();
            
            if (!reply) {
                alert('Please enter a reply');
                return;
            }

            btn.disabled = true;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Submitting...';

            const formData = new FormData();
            formData.append('id', id);
            formData.append('reply', reply);

            fetch('${pageContext.request.contextPath}/admin/CustQuestionController', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    tr.remove();
                    // Show success message
                    const successMsg = document.createElement('div');
                    successMsg.className = 'alert alert-success';
                    successMsg.textContent = 'Reply sent successfully!';
                    tr.parentNode.insertBefore(successMsg, tr.nextSibling);
                    setTimeout(() => successMsg.remove(), 3000);
                } else {
                    throw new Error('Failed to send reply');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to send reply: ' + error.message);
            })
            .finally(() => {
                btn.disabled = false;
                btn.innerHTML = '<i class="fas fa-paper-plane"></i> Submit';
            });
        }

        document.addEventListener('DOMContentLoaded', function() {
            loadQuestions('none');
        });
    </script>

    <style>
        .table-container {
            margin: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .questions-table {
            width: 100%;
            border-collapse: collapse;
        }

        .questions-table th,
        .questions-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .questions-table th {
            background-color: #f8f9fa;
            font-weight: 600;
        }

        .questions-table tr:hover {
            background-color: #f5f5f5;
        }

        .reply-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 5px;
        }

        .submit-btn {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .submit-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .alert {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
    </style>
</body>
</html> 