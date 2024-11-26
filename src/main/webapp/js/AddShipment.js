document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('shipmentForm');
    const steps = Array.from(document.querySelectorAll('.form-step'));
    const nextBtn = document.querySelector('.btn-next');
    const prevBtn = document.querySelector('.btn-prev');
    const submitBtn = document.querySelector('.btn-submit');
    let currentStep = 0;

    function updateProgress(stepIndex) {
        const progress = ((stepIndex + 1) / steps.length) * 100;
        const progressBar = document.querySelector('.progress');
        if (progressBar) {
            progressBar.style.width = progress + '%';
        }
    }

    function showStep(stepIndex) {
        steps.forEach((step, index) => {
            step.style.display = index === stepIndex ? 'block' : 'none';
        });

        // Update dots
        const dots = document.querySelectorAll('.step-dot');
        dots.forEach((dot, index) => {
            dot.classList.toggle('active', index <= stepIndex);
        });

        // Update buttons
        prevBtn.disabled = stepIndex === 0;
        if (stepIndex === steps.length - 1) {
            nextBtn.style.display = 'none';
            submitBtn.style.display = 'block';
        } else {
            nextBtn.style.display = 'block';
            submitBtn.style.display = 'none';
        }

        updateProgress(stepIndex);
    }

    function validateStep(stepIndex) {
        const currentStepElement = steps[stepIndex];
        const inputs = currentStepElement.querySelectorAll('input[required], select[required], textarea[required]');
        let isValid = true;

        inputs.forEach(input => {
            if (!input.value.trim()) {
                isValid = false;
                input.classList.add('error');
            } else {
                input.classList.remove('error');
            }
        });

        return isValid;
    }

    // Initialize first step
    showStep(currentStep);

    // Next button click handler
    nextBtn.addEventListener('click', () => {
        if (validateStep(currentStep)) {
            currentStep++;
            showStep(currentStep);
        } else {
            alert('Please fill in all required fields before proceeding.');
        }
    });

    // Previous button click handler
    prevBtn.addEventListener('click', () => {
        currentStep--;
        showStep(currentStep);
    });

    // Form submission
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        if (validateStep(currentStep)) {
            // Add your form submission logic here
            alert('Form submitted successfully!');
            // You can use form.submit() or send data via AJAX
        } else {
            alert('Please fill in all required fields before submitting.');
        }
    });

    // Add input validation styling
    document.querySelectorAll('input[required], select[required], textarea[required]').forEach(input => {
        input.addEventListener('input', () => {
            if (input.value.trim()) {
                input.classList.remove('error');
            }
        });
    });
});