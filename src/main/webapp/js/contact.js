document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.contact-form');
    
    form.addEventListener('submit', function(e) {
        const submitButton = form.querySelector('.btn-primary');
        submitButton.textContent = 'Sending...';
        submitButton.disabled = true;
    });
}); 