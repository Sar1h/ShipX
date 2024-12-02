package admin.dao;

import java.sql.*;
import java.util.*;
import admin.model.QueryData;

public class QueryDb {
    private Connection getConnection() throws SQLException {
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             String url = "jdbc:mysql://13.203.63.17:3306/courier"; // Replace <EC2_PUBLIC_IP> with the public IP or DNS of your EC2 instance
             String username = "root"; // Replace with your database username
             String pass = "root1"; // Replace with your database pas            
             System.out.println("Attempting database connection to: " + url);
             return DriverManager.getConnection(url, username, pass);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found: " + e.getMessage());
        }
    }

    public List<QueryData> getAllQueries(String sortOption, String searchQuery) {
        List<QueryData> queries = new ArrayList<>();
        String sql = "SELECT * FROM custqueries WHERE reply IS NULL OR reply = ''";
        
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            sql += " AND (name LIKE ? OR email LIKE ?)";
        }
        
        if ("timestamp".equals(sortOption)) {
            sql += " ORDER BY timestamp DESC";
        }

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                ps.setString(1, "%" + searchQuery + "%");
                ps.setString(2, "%" + searchQuery + "%");
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    QueryData query = new QueryData();
                    query.setId(rs.getInt("id"));
                    query.setName(rs.getString("name"));
                    query.setEmail(rs.getString("email"));
                    query.setSubject(rs.getString("subject"));
                    query.setMessage(rs.getString("message"));
                    query.setTimestamp(rs.getString("timestamp"));
                    queries.add(query);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to fetch queries: " + e.getMessage());
        }
        return queries;
    }

    public boolean updateQueryReply(int id, String reply) {
        String sql = "UPDATE custqueries SET reply = ?, status = 'replied' WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, reply);
            ps.setInt(2, id);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
} 