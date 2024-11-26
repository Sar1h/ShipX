package tracking.model;

import java.util.Date;

public class TrackingData {
    private String trackingNumber;
    private String status;
    private String statusClass;
    private int statusProgress;
    private Date lastUpdated;
    private String senderName;
    private String senderCity;
    private String receiverName;
    private String receiverCity;
    private String type;
    private String description;

    // Constructor
    public TrackingData() {}

    // Getters and Setters
    public String getTrackingNumber() {
        return trackingNumber;
    }

    public void setTrackingNumber(String trackingNumber) {
        this.trackingNumber = trackingNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
        setStatusProgress(status);
    }

    public String getStatusClass() {
        return statusClass;
    }

    public void setStatusClass(String statusClass) {
        this.statusClass = statusClass;
    }

    public int getStatusProgress() {
        return statusProgress;
    }

    private void setStatusProgress(String status) {
        switch (status.toLowerCase()) {
            case "pickup pending":
                this.statusProgress = 0;
                break;
            case "picked up":
                this.statusProgress = 20;
                break;
            case "at sender warehouse facility":
                this.statusProgress = 40;
                break;
            case "in transit":
                this.statusProgress = 60;
                break;
            case "at receiver warehouse facility":
                this.statusProgress = 80;
                break;
            case "out for delivery":
                this.statusProgress = 90;
                break;
            case "delivered":
                this.statusProgress = 100;
                break;
            default:
                this.statusProgress = 0;
        }
    }

    public Date getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Date lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    // Added missing setters and getters
    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderCity() {
        return senderCity;
    }

    public void setSenderCity(String senderCity) {
        this.senderCity = senderCity;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverCity() {
        return receiverCity;
    }

    public void setReceiverCity(String receiverCity) {
        this.receiverCity = receiverCity;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
} 