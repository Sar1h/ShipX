document.addEventListener('DOMContentLoaded', function() {
    // Initialize variables
    const queryItems = document.querySelectorAll('.query-item');
    const searchInput = document.querySelector('.search-box input');
    const selectAllCheckbox = document.getElementById('selectAll');
    const replyForm = document.querySelector('.reply-form');
    const templateSelect = document.querySelector('.template-select select');
    const viewOptions = document.querySelectorAll('.view-options button');

    // Initialize rich text editor
    const editor = initializeEditor();

    // Query item selection
    queryItems.forEach(item => {
        item.addEventListener('click', (e) => {
            if (!e.target.closest('.item-checkbox')) {
                handleQuerySelection(item);
            }
        });
    });

    // Search functionality
    searchInput.addEventListener('input', debounce(() => {
        const searchTerm = searchInput.value.toLowerCase();
        filterQueries(searchTerm);
    }, 300));

    // Select all functionality
    selectAllCheckbox.addEventListener('change', () => {
        const checkboxes = document.querySelectorAll('.query-item input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
        updateBulkActions();
    });

    // View options
    viewOptions.forEach(button => {
        button.addEventListener('click', () => {
            viewOptions.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            filterByView(button.textContent.trim());
        });
    });

    // Reply form handling
    replyForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        await handleReplySubmission();
    });

    // Template selection
    templateSelect.addEventListener('change', () => {
        if (templateSelect.value) {
            loadTemplate(templateSelect.value);
        }
    });

    // Query Selection Handler
    function handleQuerySelection(item) {
        queryItems.forEach(qi => qi.classList.remove('selected'));
        item.classList.add('selected');
        item.classList.remove('unread');
        
        const queryId = item.dataset.queryId;
        loadQueryDetails(queryId);
    }

    // Load Query Details
    async function loadQueryDetails(queryId) {
        try {
            const response = await fetch(/api/queries/${queryId});
            const queryData = await response.json();
            updateQueryDetails(queryData);
        } catch (error) {
            showNotification('Error loading query details', 'error');
        }
    }

    // Update Query Details
    function updateQueryDetails(queryData) {
        // Update customer profile
        document.querySelector('.customer-profile img').src = queryData.customer.avatar;
        document.querySelector('.profile-info h2').textContent = queryData.customer.name;
        document.querySelector('.profile-info p').textContent = queryData.customer.email;

        // Update message thread
        const thread = document.querySelector('.query-thread');
        thread.innerHTML = '';
        queryData.messages.forEach(message => {
            thread.appendChild(createMessageElement(message));
        });

        // Update customer sidebar
        updateCustomerSidebar(queryData.customer);

        // Scroll to latest message
        thread.scrollTop = thread.scrollHeight;
    }

    // Create Message Element
    function createMessageElement(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = message ${message.type};
        messageDiv.innerHTML = `
            <div class="message-header">
                <span class="sender">${message.sender}</span>
                <span class="timestamp">${formatDate(message.timestamp)}</span>
            </div>
            <div class="message-content">
                <p>${message.content}</p>
                ${message.attachments ? createAttachmentsHTML(message.attachments) : ''}
            </div>
        `;
        return messageDiv;
    }

    // Create Attachments HTML
    function createAttachmentsHTML(attachments) {
        return `
            <div class="message-attachments">
                ${attachments.map(attachment => `
                    <a href="${attachment.url}" class="attachment">
                        <i class="fas fa-paperclip"></i> ${attachment.name}
                    </a>
                `).join('')}
            </div>
        `;
    }

    // Update Customer Sidebar
    function updateCustomerSidebar(customer) {
        // Update customer details
        const detailsSection = document.querySelector('.customer-sidebar .sidebar-section:first-child');
        detailsSection.innerHTML = `
            <h3>Customer Details</h3>
            <div class="detail-item">
                <span class="label">Phone:</span>
                <span class="value">${customer.phone}</span>
            </div>
            <div class="detail-item">
                <span class="label">Location:</span>
                <span class="value">${customer.location}</span>
            </div>
            <div class="detail-item">
                <span class="label">Total Orders:</span>
                <span class="value">${customer.totalOrders}</span>
            </div>
        `;

        // Update related shipments
        updateRelatedShipments(customer.shipments);

        // Update previous queries
        updatePreviousQueries(customer.previousQueries);
    }

    // Handle Reply Submission
    async function handleReplySubmission() {
        const replyContent = editor.getData();
        const selectedQuery = document.querySelector('.query-item.selected');
        
        if (!replyContent.trim() || !selectedQuery) {
            showNotification('Please enter a reply message', 'warning');
            return;
        }

        try {
            const response = await fetch('/api/queries/reply', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    queryId: selectedQuery.dataset.queryId,
                    content: replyContent,
                    attachments: getAttachments()
                })
            });

            if (response.ok) {
                showNotification('Reply sent successfully', 'success');
                editor.setData('');
                loadQueryDetails(selectedQuery.dataset.queryId);
            } else {
                throw new Error('Failed to send reply');
            }
        } catch (error) {
            showNotification('Error sending reply', 'error');
        }
    }

    // Load Reply Template
    async function loadTemplate(templateId) {
        try {
            const response = await fetch(/api/templates/${templateId});
            const template = await response.json();
            editor.setData(template.content);
        } catch (error) {
            showNotification('Error loading template', 'error');
        }
    }

    // Filter Queries
    function filterQueries(searchTerm) {
        queryItems.forEach(item => {
            const text = item.textContent.toLowerCase();
            item.style.display = text.includes(searchTerm) ? 'flex' : 'none';
        });
    }

    // Filter by View
    function filterByView(view) {
        const queries = document.querySelectorAll('.query-item');
        queries.forEach(query => {
            switch(view) {
                case 'Inbox':
                    query.style.display = !query.classList.contains('archived') ? 'flex' : 'none';
                    break;
                case 'Archived':
                    query.style.display = query.classList.contains('archived') ? 'flex' : 'none';
                    break;
                case 'Sent':
                    query.style.display = query.classList.contains('sent') ? 'flex' : 'none';
                    break;
            }
        });
    }

    // Initialize Rich Text Editor
    function initializeEditor() {
        return ClassicEditor
            .create(document.querySelector('.form-editor textarea'), {
                toolbar: ['bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote'],
                placeholder: 'Type your reply...'
            })
            .catch(error => {
                console.error('Editor initialization failed:', error);
            });
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
        return new Date(date).toLocaleString('en-US', {
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

    // File Attachment Handling
    document.querySelector('.editor-actions button[title="Attach File"]')
        .addEventListener('click', () => {
            const input = document.createElement('input');
            input.type = 'file';
            input.multiple = true;
            input.addEventListener('change', handleFileSelection);
            input.click();
        });

    function handleFileSelection(event) {
        const files = Array.from(event.target.files);
        files.forEach(file => {
            addAttachmentPreview(file);
        });
    }

    function addAttachmentPreview(file) {
        const preview = document.createElement('div');
        preview.className = 'attachment-preview';
        preview.innerHTML = `
            <i class="fas fa-paperclip"></i>
            <span>${file.name}</span>
            <button type="button" class="remove-attachment">×</button>
        `;
        document.querySelector('.form-editor').appendChild(preview);

        preview.querySelector('.remove-attachment').addEventListener('click', () => {
            preview.remove();
        });
    }

    function getAttachments() {
        return Array.from(document.querySelectorAll('.attachment-preview'))
            .map(preview => ({
                name: preview.querySelector('span').textContent,
                // Add more attachment details as needed
            }));
    }

    // Initialize tooltips
    initializeTooltips();
});

// Initialize tooltips
function initializeTooltips() {
    tippy('[data-tippy-content]', {
        placement: 'top',
        arrow: true,
        theme: 'light'
    });
}