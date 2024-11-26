package admin.dao;

import java.sql.*;
import java.util.*;
import admin.model.OrderPanelData;

public class OrderPanelDb {
    
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/courier";
            String username = "root";
            String password = "root";
            
            System.out.println("Attempting database connection to: " + url);
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found: " + e.getMessage());
        }
    }

    public List<OrderPanelData> getAllOrders(String sortOption, String searchQuery) {
        List<OrderPanelData> orders = new ArrayList<>();
        String query = "SELECT track_no, sname, rname, saddress, raddress, status FROM orders WHERE status != 'delivered'";
        
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            query += " AND track_no LIKE ?";
        }
        
        if ("priority".equals(sortOption)) {
            query += " ORDER BY FIELD(status, 'pickup pending', 'picked up', " +
                    "'at sender warehouse facility', 'in transit', " +
                    "'at receiver warehouse facility', 'out for delivery')";
        }

        System.out.println("Executing query: " + query);

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                ps.setString(1, "%" + searchQuery + "%");
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderPanelData order = new OrderPanelData();
                    order.setTrackingNumber(rs.getString("track_no"));
                    order.setSenderName(rs.getString("sname"));
                    order.setReceiverName(rs.getString("rname"));
                    order.setSenderAddress(rs.getString("saddress"));
                    order.setReceiverAddress(rs.getString("raddress"));
                    order.setStatus(rs.getString("status"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Failed to fetch orders: " + e.getMessage());
        }
        
        return orders;
    }

    public boolean updateOrderStatus(String trackingNumber, String newStatus) {
        String query = "UPDATE orders SET status = ? WHERE track_no = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, newStatus);
            ps.setString(2, trackingNumber);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Error updating status: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
} 