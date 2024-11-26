package orders.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import orders.model.OrderData;

public class MyOrdersDb {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/courier";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public List<OrderData> getUserOrders(String userEmail) {
        List<OrderData> orders = new ArrayList<>();
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT track_no, sname, rname, COALESCE(status, 'Pending') as status, " +
                          "type, shipmethod, DATE_FORMAT(created_at, '%Y-%m-%d %H:%i') as created_at " +
                          "FROM orders WHERE semail = ? ORDER BY created_at DESC";
            
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, userEmail);
                System.out.println("Executing query for email: " + userEmail);
                
                try (ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        OrderData order = new OrderData(
                            rs.getString("track_no"),
                            rs.getString("sname"),
                            rs.getString("rname"),
                            rs.getString("status"),
                            rs.getString("type"),
                            rs.getString("shipmethod"),
                            rs.getString("created_at")
                        );
                        orders.add(order);
                        System.out.println("Found order: " + order.getTrackingNumber());
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
        }
        
        return orders;
    }
} 