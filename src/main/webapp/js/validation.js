document.addEventListener('DOMContentLoaded', function() {
    // Get the form
    const form = document.querySelector('form');
    
    if (form) {
        form.addEventListener('submit', function(e) {
            if (!validateForm(this)) {
                e.preventDefault();
            }
        });

        // Add input event listeners for real-time validation
        const inputs = form.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                validateField(this);
            });
        });
    }
});

function validateForm(form) {
    let isValid = true;
    const inputs = form.querySelectorAll('input');
    
    inputs.forEach(input => {
        if (!validateField(input)) {
            isValid = false;
        }
    });

    // Additional password match validation for signup form
    if (form.id === 'signupForm') {
        const password = form.querySelector('#password');
        const confirmPassword = form.querySelector('#confirmPassword');
        if (password.value !== confirmPassword.value) {
            showError(confirmPassword, 'Passwords do not match');
            isValid = false;
        }
    }

    return isValid;
}

function validateField(input) {
    let isValid = true;
    const value = input.value.trim();

    // Reset previous validation
    input.classList.remove('error', 'success');
    hideError(input);

    // Check required fields
    if (!value) {
        showError(input, 'This field is required');
        isValid = false;
    } else {
        // Specific validation based on input type
        switch(input.type) {
            case 'email':
                if (!isValidEmail(value)) {
                    showError(input, 'Please enter a valid email address');
                    isValid = false;
                }
                break;
            case 'tel':
                if (!isValidPhone(value)) {
                    showError(input, 'Please enter a valid phone number');
                    isValid = false;
                }
                break;
            case 'password':
                if (value.length < 6) {
                    showError(input, 'Password must be at least 6 characters');
                    isValid = false;
                }
                break;
        }
    }

    if (isValid) {
        input.classList.add('success');
    }

    return isValid;
}

function showError(input, message) {
    input.classList.add('error');
    const errorElement = input.nextElementSibling;
    if (errorElement && errorElement.classList.contains('error-message')) {
        errorElement.textContent = message;
        errorElement.style.display = 'block';
    }
}

function hideError(input) {
    const errorElement = input.nextElementSibling;
    if (errorElement && errorElement.classList.contains('error-message')) {
        errorElement.style.display = 'none';
    }
}

function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function isValidPhone(phone) {
    return /^\d{10}$/.test(phone);
}