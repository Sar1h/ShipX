document.addEventListener('DOMContentLoaded', function() {
    const shipmentForm = document.getElementById('shipmentForm');
    const weightInput = document.getElementById('weight');
    const lengthInput = document.getElementById('length');
    const widthInput = document.getElementById('width');
    const heightInput = document.getElementById('height');
    
    // Calculate shipping cost on input change
    const dimensionInputs = [weightInput, lengthInput, widthInput, heightInput];
    dimensionInputs.forEach(input => {
        input.addEventListener('input', calculateShippingCost);
    });

    // Initialize cost calculation
    calculateShippingCost();
});

function calculateShippingCost() {
    const weight = parseFloat(document.getElementById('weight').value) || 0;
    const length = parseFloat(document.getElementById('length').value) || 0;
    const width = parseFloat(document.getElementById('width').value) || 0;
    const height = parseFloat(document.getElementById('height').value) || 0;

    // Calculate volume in cubic centimeters
    const volume = length * width * height;
    
    // Base rate per kg
    const baseRate = 10;
    // Volume factor (price per 1000 cubic cm)
    const volumeFactor = 0.001;
    
    // Calculate total cost
    const weightCost = weight * baseRate;
    const volumeCost = volume * volumeFactor;
    const totalCost = Math.max(weightCost, volumeCost);

    // Update the displayed cost
    const costElement = document.getElementById('estimatedCost');
    if (costElement) {
        costElement.textContent = totalCost.toFixed(2);
    }
}

// Validate shipment form
function validateShipmentForm(e) {
    const form = e.target;
    let isValid = true;

    // Validate addresses
    const senderAddress = form.querySelector('#senderAddress').value.trim();
    const receiverAddress = form.querySelector('#receiverAddress').value.trim();

    if (!senderAddress || !receiverAddress) {
        isValid = false;
        showError(form.querySelector('#senderAddress'), 'Address is required');
    }

    // Validate dimensions
    const dimensions = ['weight', 'length', 'width', 'height'];
    dimensions.forEach(dim => {
        const input = form.querySelector(`#${dim}`);
        const value = parseFloat(input.value);
        
        if (isNaN(value) || value <= 0) {
            isValid = false;
            showError(input, 'Please enter a valid number');
        }
    });

    if (!isValid) {
        e.preventDefault();
    }
} 