document.addEventListener('DOMContentLoaded', function() {
    // Initialize variables
    const ordersTable = document.querySelector('.orders-table');
    const filterPanel = document.querySelector('.filter-panel');
    const searchInput = document.querySelector('.search-box input');
    const selectAllCheckbox = document.querySelector('.select-all');
    const bulkActionsPanel = document.querySelector('.bulk-actions');
    const modal = document.getElementById('orderDetailsModal');

    // Initialize DataTable with advanced features
    const dataTable = new DataTable(ordersTable, {
        pageLength: 10,
        order: [[6, 'desc']], // Sort by created date by default
        responsive: true,
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excel',
                text: '<i class="fas fa-file-excel"></i> Export to Excel',
                className: 'btn-export'
            },
            {
                extend: 'pdf',
                text: '<i class="fas fa-file-pdf"></i> Export to PDF',
                className: 'btn-export'
            }
        ]
    });

    // Filter Panel Toggle
    document.querySelector('.btn-filter').addEventListener('click', () => {
        filterPanel.classList.toggle('show');
    });

    // Apply Filters
    document.querySelector('.btn-apply').addEventListener('click', () => {
        applyFilters();
    });

    // Reset Filters
    document.querySelector('.btn-reset').addEventListener('click', () => {
        resetFilters();
    });

    // Search Functionality
    searchInput.addEventListener('keyup', debounce(() => {
        dataTable.search(searchInput.value).draw();
    }, 300));

    // Bulk Selection
    selectAllCheckbox.addEventListener('change', () => {
        const checkboxes = document.querySelectorAll('.select-order');
        checkboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
        updateBulkActionsPanel();
    });

    // Individual Selection
    document.addEventListener('change', (e) => {
        if (e.target.classList.contains('select-order')) {
            updateBulkActionsPanel();
        }
    });

    // Order Details Modal
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('btn-view')) {
            const orderId = e.target.closest('tr').dataset.orderId;
            openOrderDetails(orderId);
        }
    });

    // Bulk Actions
    document.querySelector('.btn-bulk-approve').addEventListener('click', () => {
        bulkAction('approve');
    });

    document.querySelector('.btn-bulk-reject').addEventListener('click', () => {
        bulkAction('reject');
    });

    document.querySelector('.btn-bulk-delete').addEventListener('click', () => {
        bulkAction('delete');
    });

    // Filter Application
    function applyFilters() {
        const filters = {
            dateStart: document.querySelector('input[type="date"]:first-child').value,
            dateEnd: document.querySelector('input[type="date"]:last-child').value,
            status: document.querySelector('select[name="status"]').value,
            serviceType: document.querySelector('select[name="serviceType"]').value
        };

        dataTable.clear();
        fetchFilteredOrders(filters).then(orders => {
            dataTable.rows.add(orders).draw();
        });

        filterPanel.classList.remove('show');
    }

    // Reset Filters
    function resetFilters() {
        document.querySelectorAll('.filter-panel input, .filter-panel select').forEach(element => {
            element.value = element.defaultValue;
        });
        dataTable.search('').columns().search('').draw();
        filterPanel.classList.remove('show');
    }

    // Update Bulk Actions Panel
    function updateBulkActionsPanel() {
        const selectedCount = document.querySelectorAll('.select-order:checked').length;
        if (selectedCount > 0) {
            bulkActionsPanel.style.display = 'flex';
            bulkActionsPanel.querySelector('span').textContent = ${selectedCount} items selected;
        } else {
            bulkActionsPanel.style.display = 'none';
        }
    }

    // Open Order Details
    async function openOrderDetails(orderId) {
        try {
            const order = await fetchOrderDetails(orderId);
            populateOrderModal(order);
            modal.style.display = 'block';
        } catch (error) {
            showNotification('Error fetching order details', 'error');
        }
    }

    // Populate Order Modal
    function populateOrderModal(order) {
        const modalContent = modal.querySelector('.modal-body');
        modalContent.innerHTML = `
            <div class="order-details">
                <div class="detail-section">
                    <h3>Order Information</h3>
                    <div class="detail-grid">
                        <div class="detail-item">
                            <span class="label">Order ID:</span>
                            <span class="value">${order.id}</span>
                        </div>
                        <div class="detail-item">
                            <span class="label">Created Date:</span>
                            <span class="value">${formatDate(order.createdDate)}</span>
                        </div>
                        <div class="detail-item">
                            <span class="label">Status:</span>
                            <span class="value status-badge status-${order.status.toLowerCase()}">${order.status}</span>
                        </div>
                    </div>
                </div>
                <!-- Add more sections as needed -->
            </div>
        `;
    }

    // Bulk Actions Handler
    async function bulkAction(action) {
        const selectedOrders = Array.from(document.querySelectorAll('.select-order:checked'))
            .map(checkbox => checkbox.closest('tr').dataset.orderId);

        if (!selectedOrders.length) return;

        try {
            const response = await fetch('/api/orders/bulk', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    action,
                    orderIds: selectedOrders
                })
            });

            if (response.ok) {
                showNotification(Successfully ${action}ed ${selectedOrders.length} orders, 'success');
                refreshTable();
            } else {
                throw new Error('Bulk action failed');
            }
        } catch (error) {
            showNotification(Error performing bulk ${action}, 'error');
        }
    }

    // Fetch Filtered Orders
    async function fetchFilteredOrders(filters) {
        try {
            const response = await fetch('/api/orders/filter', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(filters)
            });
            return await response.json();
        } catch (error) {
            showNotification('Error fetching filtered orders', 'error');
            return [];
        }
    }

    // Fetch Order Details
    async function fetchOrderDetails(orderId) {
        const response = await fetch(/api/orders/${orderId});
        if (!response.ok) throw new Error('Failed to fetch order details');
        return await response.json();
    }

    // Utility Functions
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

    function formatDate(date) {
        return new Date(date).toLocaleDateString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    function showNotification(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = notification ${type};
        notification.textContent = message;
        document.body.appendChild(notification);

        setTimeout(() => {
            notification.remove();
        }, 3000);
    }

    // Table Refresh
    function refreshTable() {
        dataTable.ajax.reload();
        updateBulkActionsPanel();
    }

    // Export Functionality
    document.querySelector('.btn-export').addEventListener('click', () => {
        const selectedFormat = document.querySelector('.export-format').value;
        exportOrders(selectedFormat);
    });

    async function exportOrders(format) {
        try {
            const response = await fetch(/api/orders/export?format=${format});
            const blob = await response.blob();
            const url = window.URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = orders-export.${format};
            document.body.appendChild(a);
            a.click();
            window.URL.revokeObjectURL(url);
        } catch (error) {
            showNotification('Error exporting orders', 'error');
        }
    }
});