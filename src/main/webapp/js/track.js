document.addEventListener('DOMContentLoaded', function() {
    const trackingForm = document.getElementById('trackingForm');
    const trackingResult = document.querySelector('.tracking-result');
    const recentTracks = document.querySelector('.recent-tracks');

    // Initialize tracking history from localStorage
    initializeRecentTracks();

    // Form submission handler
    trackingForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const trackingNumber = document.getElementById('trackingNumber').value;
        
        if (validateTrackingNumber(trackingNumber)) {
            try {
                showLoader();
                const shipmentData = await fetchTrackingInfo(trackingNumber);
                updateTrackingResult(shipmentData);
                addToRecentTracks(trackingNumber);
                hideLoader();
            } catch (error) {
                showError('Unable to fetch tracking information. Please try again.');
                hideLoader();
            }
        }
    });

    // Tracking number validation
    function validateTrackingNumber(number) {
        const trackingRegex = /^FT[0-9]{9}$/;
        if (!trackingRegex.test(number)) {
            showError('Please enter a valid tracking number (Format: FTxxxxxxxxx)');
            return false;
        }
        return true;
    }

    // Fetch tracking information
    async function fetchTrackingInfo(trackingNumber) {
        try {
            const response = await fetch(/api/tracking/${trackingNumber});
            if (!response.ok) {
                throw new Error('Tracking information not found');
            }
            return await response.json();
        } catch (error) {
            console.error('Error fetching tracking info:', error);
            throw error;
        }
    }

    // Update tracking result display
    function updateTrackingResult(data) {
        // Update shipment details
        document.querySelector('.info-card:nth-child(1) p').textContent = data.trackingNumber;
        document.querySelector('.info-card:nth-child(2) p').textContent = data.estimatedDelivery;
        document.querySelector('.info-card:nth-child(3) p').textContent = data.serviceType;

        // Update status badge
        const statusBadge = document.querySelector('.status-badge');
        statusBadge.className = status-badge status-${data.status.toLowerCase()};
        statusBadge.textContent = data.status;

        // Update addresses
        updateAddressInfo(data.sender, '.address-card:nth-child(1)');
        updateAddressInfo(data.receiver, '.address-card:nth-child(2)');

        // Update timeline
        updateTimeline(data.events);

        // Show the result section
        trackingResult.style.display = 'block';
        trackingResult.scrollIntoView({ behavior: 'smooth' });
    }

    // Update address information
    function updateAddressInfo(address, selector) {
        const addressCard = document.querySelector(selector);
        addressCard.querySelector('.address-name').textContent = address.name;
        const addressLines = addressCard.querySelectorAll('p:not(.address-name)');
        addressLines[0].textContent = address.street;
        addressLines[1].textContent = ${address.city}, ${address.state} ${address.zip};
        addressLines[2].textContent = address.country;
    }

    // Update timeline events
    function updateTimeline(events) {
        const timeline = document.querySelector('.timeline');
        timeline.innerHTML = ''; // Clear existing events

        events.forEach((event, index) => {
            const timelineItem = document.createElement('div');
            timelineItem.className = timeline-item ${index === 0 ? 'current' : 'completed'};
            
            timelineItem.innerHTML = `
                <div class="timeline-icon">
                    <i class="fas ${getEventIcon(event.type)}"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-date">
                        <i class="far fa-clock"></i>
                        ${formatDate(event.timestamp)}
                    </div>
                    <h4>${event.status}</h4>
                    <p>${event.description}</p>
                    <p class="location">${event.location}</p>
                </div>
            `;

            timeline.appendChild(timelineItem);
        });
    }

    // Get appropriate icon for event type
    function getEventIcon(eventType) {
        const icons = {
            pickup: 'fa-box',
            transit: 'fa-truck',
            delivery: 'fa-home',
            exception: 'fa-exclamation-triangle',
            processed: 'fa-warehouse'
        };
        return icons[eventType] || 'fa-circle';
    }

    // Recent tracks management
    function initializeRecentTracks() {
        const recentTrackings = getRecentTracks();
        updateRecentTracksList(recentTrackings);
    }

    function addToRecentTracks(trackingNumber) {
        let recentTrackings = getRecentTracks();
        
        // Remove if exists and add to beginning
        recentTrackings = recentTrackings.filter(t => t.number !== trackingNumber);
        recentTrackings.unshift({
            number: trackingNumber,
            timestamp: new Date().toISOString()
        });

        // Keep only last 5
        recentTrackings = recentTrackings.slice(0, 5);
        
        localStorage.setItem('recentTracks', JSON.stringify(recentTrackings));
        updateRecentTracksList(recentTrackings);
    }

    function getRecentTracks() {
        try {
            return JSON.parse(localStorage.getItem('recentTracks')) || [];
        } catch {
            return [];
        }
    }

    function updateRecentTracksList(trackings) {
        const recentList = document.querySelector('.recent-list');
        recentList.innerHTML = '';

        trackings.forEach(track => {
            const item = document.createElement('a');
            item.href = '#';
            item.className = 'recent-item';
            item.innerHTML = `
                <i class="fas fa-history"></i>
                <span>${track.number}</span>
                <small>${formatTimeAgo(new Date(track.timestamp))}</small>
            `;

            item.addEventListener('click', (e) => {
                e.preventDefault();
                document.getElementById('trackingNumber').value = track.number;
                trackingForm.dispatchEvent(new Event('submit'));
            });

            recentList.appendChild(item);
        });
    }

    // Utility functions
    function formatDate(timestamp) {
        return new Date(timestamp).toLocaleString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    function formatTimeAgo(date) {
        const seconds = Math.floor((new Date() - date) / 1000);
        
        let interval = seconds / 31536000;
        if (interval > 1) return Math.floor(interval) + ' years ago';
        
        interval = seconds / 2592000;
        if (interval > 1) return Math.floor(interval) + ' months ago';
        
        interval = seconds / 86400;
        if (interval > 1) return Math.floor(interval) + ' days ago';
        
        interval = seconds / 3600;
        if (interval > 1) return Math.floor(interval) + ' hours ago';
        
        interval = seconds / 60;
        if (interval > 1) return Math.floor(interval) + ' minutes ago';
        
        return Math.floor(seconds) + ' seconds ago';
    }

    // Loading state management
    function showLoader() {
        const loader = document.createElement('div');
        loader.className = 'loader';
        loader.innerHTML = '<i class="fas fa-circle-notch fa-spin"></i>';
        trackingForm.appendChild(loader);
    }

    function hideLoader() {
        const loader = document.querySelector('.loader');
        if (loader) {
            loader.remove();
        }
    }

    // Error handling
    function showError(message) {
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        
        const existingError = trackingForm.querySelector('.error-message');
        if (existingError) {
            existingError.remove();
        }
        
        trackingForm.insertBefore(errorDiv, trackingForm.firstChild);
        
        setTimeout(() => {
            errorDiv.remove();
        }, 5000);
    }

    // Share functionality
    document.querySelector('.btn-action').addEventListener('click', async () => {
        const trackingNumber = document.querySelector('.info-card:nth-child(1) p').textContent;
        try {
            await navigator.share({
                title: 'Track Shipment',
                text: Track my shipment: ${trackingNumber},
                url: window.location.href
            });
        } catch (err) {
            console.log('Share failed:', err.message);
        }
    });
});