// Navigation and common functionality
document.addEventListener('DOMContentLoaded', function() {
    // Mobile navigation toggle
    const navToggle = document.querySelector('.nav-toggle');
    const navLinks = document.querySelector('.nav-links');
    
    if (navToggle) {
        navToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
    }

    // Form validation
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', validateForm);
    });
});

function validateForm(e) {
    const form = e.target;
    const inputs = form.querySelectorAll('input[required]');
    let isValid = true;

    inputs.forEach(input => {
        if (!input.value.trim()) {
            isValid = false;
            showError(input, 'This field is required');
        } else {
            clearError(input);
        }

        // Email validation
        if (input.type === 'email' && !validateEmail(input.value)) {
            isValid = false;
            showError(input, 'Please enter a valid email address');
        }
    });

    if (!isValid) {
        e.preventDefault();
    }
}

function validateEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function showError(input, message) {
    const formGroup = input.closest('.form-group');
    const error = formGroup.querySelector('.error-message') || 
                 createErrorElement(message);
    
    input.classList.add('error');
    if (!formGroup.querySelector('.error-message')) {
        formGroup.appendChild(error);
    }
}

function clearError(input) {
    const formGroup = input.closest('.form-group');
    const error = formGroup.querySelector('.error-message');
    
    input.classList.remove('error');
    if (error) {
        error.remove();
    }
}

function createErrorElement(message) {
    const error = document.createElement('div');
    error.className = 'error-message';
    error.textContent = message;
    return error;
} 