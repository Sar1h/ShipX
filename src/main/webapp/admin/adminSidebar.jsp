<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="admin-sidebar" id="adminSidebar">
    <div class="sidebar-header">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Company Logo" class="company-logo">
        <button class="toggle-sidebar" onclick="toggleSidebar()">
            <i class="fas fa-bars"></i>
        </button>
    </div>
    
    <nav class="sidebar-nav">
        <ul>
            <li class="${param.activePage == 'orders' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/admin/ordersPanel.jsp">
                    <i class="fas fa-box"></i>
                    <span>Orders</span>
                </a>
            </li>
            <li class="${param.activePage == 'queries' ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/admin/Query.jsp">
                    <i class="fas fa-question-circle"></i>
                    <span>Customer Queries</span>
                </a>
            </li>
        </ul>
    </nav>
    
    <div class="sidebar-footer">
        <a href="${pageContext.request.contextPath}/logout.jsp" class="logout-btn">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
        </a>
    </div>
</div>

<script>
function toggleSidebar() {
    const sidebar = document.getElementById('adminSidebar');
    sidebar.classList.toggle('collapsed');
}
</script> 