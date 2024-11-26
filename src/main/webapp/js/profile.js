document.addEventListener('DOMContentLoaded', function() {
    // Tab Switching
    const tabButtons = document.querySelectorAll('.tab-btn');
    const tabContents = document.querySelectorAll('.tab-content');

    tabButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Remove active class from all buttons and contents
            tabButtons.forEach(btn => btn.classList.remove('active'));
            tabContents.forEach(content => content.classList.remove('active'));

            // Add active class to clicked button and corresponding content
            button.classList.add('active');
            const tabId = button.dataset.tab;
            document.getElementById(tabId).classList.add('active');
        });
    });

    // Form Submissions
    const personalInfoForm = document.getElementById('personalInfoForm');
    const securityForm = document.getElementById('securityForm');
    const preferencesForm = document.getElementById('preferencesForm');

    if (personalInfoForm) {
        personalInfoForm.addEventListener('submit', handlePersonalInfoSubmit);
    }
    if (securityForm) {
        securityForm.addEventListener('submit', handleSecuritySubmit);
    }
    if (preferencesForm) {
        preferencesForm.addEventListener('submit', handlePreferencesSubmit);
    }

    // Avatar Change
    const avatarButton = document.querySelector('.change-avatar');
    if (avatarButton) {
        avatarButton.addEventListener('click', handleAvatarChange);
    }
});

async function handlePersonalInfoSubmit(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    try {
        const response = await fetch('/api/profile/update', {
            method: 'POST',
            body: formData
        });
        
        if (response.ok) {
            showNotification('Profile updated successfully', 'success');
        } else {
            showNotification('Failed to update profile', 'error');
        }
    } catch (error) {
        console.error('Error updating profile:', error);
        showNotification('An error occurred', 'error');
    }
}

async function handleSecuritySubmit(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    if (formData.get('newPassword') !== formData.get('confirmPassword')) {
        showNotification('Passwords do not match', 'error');
        return;
    }
    
    try {
        const response = await fetch('/api/profile/security', {
            method: 'POST',
            body: formData
        });
        
        if (response.ok) {
            showNotification('Password updated successfully', 'success');
            e.target.reset();
        } else {
            showNotification('Failed to update password', 'error');
        }
    } catch (error) {
        console.error('Error updating password:', error);
        showNotification('An error occurred', 'error');
    }
}

async function handlePreferencesSubmit(e) {
    e.preventDefault();
    const formData = new FormData(e.target);
    
    try {
        const response = await fetch('/api/profile/preferences', {
            method: 'POST',
            body: formData
        });
        
        if (response.ok) {
            showNotification('Preferences updated successfully', 'success');
        } else {
            showNotification('Failed to update preferences', 'error');
        }
    } catch (error) {
        console.error('Error updating preferences:', error);
        showNotification('An error occurred', 'error');
    }
}

function handleAvatarChange() {
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    
    input.onchange = async function(e) {
        const file = e.target.files[0];
        if (file) {
            const formData = new FormData();
            formData.append('avatar', file);
            
            try {
                const response = await fetch('/api/profile/avatar', {
                    method: 'POST',
                    body: formData
                });
                
                if (response.ok) {
                    const data = await response.json();
                    document.querySelector('.profile-avatar img').src = data.avatarUrl;
                    showNotification('Avatar updated successfully', 'success');
                } else {
                    showNotification('Failed to update avatar', 'error');
                }
            } catch (error) {
                console.error('Error updating avatar:', error);
                showNotification('An error occurred', 'error');
            }
        }
    };
    
    input.click();
}

function showNotification(message, type) {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;
    
    // Add to document
    document.body.appendChild(notification);
    
    // Remove after 3 seconds
    setTimeout(() => {
        notification.remove();
    }, 3000);
}