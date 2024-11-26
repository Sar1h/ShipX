package orders.model;

public class OrderData {
    private String trackingNumber;
    private String senderName;
    private String receiverName;
    private String status;
    private String packageType;
    private String shipMethod;
    private String createdDate;

    public OrderData(String trackingNumber, String senderName, String receiverName, 
                    String status, String packageType, String shipMethod, String createdDate) {
        this.trackingNumber = trackingNumber;
        this.senderName = senderName;
        this.receiverName = receiverName;
        this.status = status != null ? status : "Pending";
        this.packageType = packageType;
        this.shipMethod = shipMethod;
        this.createdDate = createdDate;
    }

    // Getters
    public String getTrackingNumber() { return trackingNumber; }
    public String getSenderName() { return senderName; }
    public String getReceiverName() { return receiverName; }
    public String getStatus() { return status; }
    public String getPackageType() { return packageType; }
    public String getShipMethod() { return shipMethod; }
    public String getCreatedDate() { return createdDate; }

    // Setters
    public void setTrackingNumber(String trackingNumber) { this.trackingNumber = trackingNumber; }
    public void setSenderName(String senderName) { this.senderName = senderName; }
    public void setReceiverName(String receiverName) { this.receiverName = receiverName; }
    public void setStatus(String status) { this.status = status; }
    public void setPackageType(String packageType) { this.packageType = packageType; }
    public void setShipMethod(String shipMethod) { this.shipMethod = shipMethod; }
    public void setCreatedDate(String createdDate) { this.createdDate = createdDate; }
} 