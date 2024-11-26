document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('trackingForm');
    const input = document.getElementById('trackingNumber');
    const trackingResults = document.querySelector('.tracking-result');

    if (!form || !input) {
        console.error('Required elements not found');
        return;
    }

    // Format tracking number as user types
    input.addEventListener('input', function(e) {
        let value = e.target.value.replace(/[^0-9]/g, '');
        if (value.length > 10) value = value.substr(0, 10);
        e.target.value = value;
        
        // Remove any existing error messages when user starts typing
        const existingError = document.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
    });

    // Handle form submission
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        const trackingNumber = input.value.trim();
        
        if (trackingNumber.length !== 10) {
            showError('Please enter a valid 10-digit tracking number');
            return;
        }

        // Update form action with tracking number
        form.action = `TrackingController?trackingNumber=${trackingNumber}`;
        
        // Submit the form
        form.submit();
    });

    // Show error message function
    function showError(message) {
        const existingError = document.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }

        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.innerHTML = `
            <i class="fas fa-exclamation-circle"></i>
            <span>${message}</span>
        `;

        const searchBox = document.querySelector('.tracking-search');
        if (searchBox) {
            searchBox.insertAdjacentElement('afterend', errorDiv);
        }
    }

    // Animate progress bar if tracking results exist
    if (trackingResults) {
        const progress = document.querySelector('.progress');
        const points = document.querySelectorAll('.point');
        
        if (progress) {
            const width = progress.style.width;
            progress.style.width = '0';
            setTimeout(() => {
                progress.style.width = width;
            }, 100);
        }

        if (points.length > 0) {
            points.forEach((point, index) => {
                if (point.classList.contains('active')) {
                    setTimeout(() => {
                        point.style.opacity = '0';
                        setTimeout(() => {
                            point.style.opacity = '1';
                        }, 100);
                    }, index * 100);
                }
            });
        }
    }
}); 