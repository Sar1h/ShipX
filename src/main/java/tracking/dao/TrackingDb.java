package tracking.dao;

import java.sql.*;
import tracking.model.TrackingData;

public class TrackingDb {
    private Connection getConnection() throws SQLException {
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://13.203.63.17:3306/courier"; // Replace <EC2_PUBLIC_IP> with the public IP or DNS of your EC2 instance
            String username = "root"; // Replace with your database username
            String pass = "root1"; // Replace with your database pas            
            System.out.println("Attempting database connection to: " + url);
            return DriverManager.getConnection(url, username, pass);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found", e);
        }
    }

    public TrackingData getShipmentDetails(String trackingNumber) {
        TrackingData shipment = null;
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM orders WHERE track_no = ?")) {
            
            ps.setString(1, trackingNumber);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    shipment = new TrackingData();
                    shipment.setTrackingNumber(rs.getString("track_no"));
                    shipment.setStatus(rs.getString("status"));
                    shipment.setLastUpdated(rs.getTimestamp("last_updated"));
                    shipment.setSenderName(rs.getString("sname"));
                    shipment.setSenderCity(rs.getString("scity"));
                    shipment.setReceiverName(rs.getString("rname"));
                    shipment.setReceiverCity(rs.getString("rcity"));
                    shipment.setType(rs.getString("type"));
                    shipment.setDescription(rs.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return shipment;
    }
} 