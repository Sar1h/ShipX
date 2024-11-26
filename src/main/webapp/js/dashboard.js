document.addEventListener('DOMContentLoaded', function() {
    // User Profile Dropdown
    const userProfile = document.querySelector('.user-profile');
    const dropdownMenu = document.querySelector('.dropdown-menu');

    if (userProfile) {
        userProfile.addEventListener('click', function(e) {
            e.stopPropagation();
            dropdownMenu.classList.toggle('active');
        });
    }

    // Close dropdown when clicking outside
    document.addEventListener('click', function() {
        if (dropdownMenu) {
            dropdownMenu.classList.remove('active');
        }
    });

    // Search Functionality
    const searchInput = document.querySelector('.search-bar input');
    if (searchInput) {
        searchInput.addEventListener('input', debounce(function(e) {
            searchShipments(e.target.value);
        }, 300));
    }

    // Notifications
    const notificationBell = document.querySelector('.notifications');
    if (notificationBell) {
        notificationBell.addEventListener('click', function() {
            loadNotifications();
        });
    }

    // Mobile Sidebar Toggle
    const sidebarToggle = document.createElement('button');
    sidebarToggle.className = 'sidebar-toggle';
    sidebarToggle.innerHTML = '<i class="fas fa-bars"></i>';
    document.querySelector('.top-nav').prepend(sidebarToggle);

    sidebarToggle.addEventListener('click', function() {
        document.querySelector('.sidebar').classList.toggle('active');
    });
});

// Debounce function for search
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Search shipments function
async function searchShipments(query) {
    if (!query) return;
    
    try {
        const response = await fetch(`/api/shipments/search?q=${encodeURIComponent(query)}`);
        const data = await response.json();
        updateShipmentsTable(data);
    } catch (error) {
        console.error('Error searching shipments:', error);
    }
}

// Update shipments table with search results
function updateShipmentsTable(shipments) {
    const tbody = document.querySelector('.shipments-table tbody');
    if (!tbody) return;

    tbody.innerHTML = shipments.map(shipment => `
        <tr>
            <td>${shipment.trackingNumber}</td>
            <td>${shipment.receiverAddress}</td>
            <td>
                <span class="status-badge ${shipment.status.toLowerCase()}">
                    ${shipment.status}
                </span>
            </td>
            <td>${formatDate(shipment.createdAt)}</td>
            <td>
                <div class="action-buttons">
                    <a href="/track?id=${shipment.trackingNumber}" 
                       class="btn-icon" title="Track">
                        <i class="fas fa-search"></i>
                    </a>
                    <a href="/shipment/details/${shipment.id}" 
                       class="btn-icon" title="Details">
                        <i class="fas fa-info-circle"></i>
                    </a>
                </div>
            </td>
        </tr>
    `).join('');
}

// Format date helper function
function formatDate(dateString) {
    const options = { year: 'numeric', month: 'short', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
}

// Load notifications
async function loadNotifications() {
    try {
        const response = await fetch('/api/notifications');
        const notifications = await response.json();
        showNotificationsPopup(notifications);
    } catch (error) {
        console.error('Error loading notifications:', error);
    }
}

// Show notifications popup
function showNotificationsPopup(notifications) {
    // Implementation for showing notifications popup
    console.log('Showing notifications:', notifications);
}