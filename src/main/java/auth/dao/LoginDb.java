package auth.dao;

import java.sql.*;
import auth.model.LoginData;

public class LoginDb {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public LoginData validateUser(String email, String password) {
        LoginData loginData = null;
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Replace with your EC2 instance's public IP or DNS and credentials
            String url = "jdbc:mysql://13.203.63.17:3306/courier"; // Replace <EC2_PUBLIC_IP> with the public IP or DNS of your EC2 instance
            String username = "root"; // Replace with your database username
            String pass = "root1"; // Replace with your database password

            con = DriverManager.getConnection(url, username, pass);
            String query = "SELECT email, password, role, first_name FROM users WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            
            System.out.println("Executing query for email: " + email);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
                loginData = new LoginData();
                loginData.setEmail(rs.getString("email"));
                loginData.setPassword(rs.getString("password"));
                loginData.setRole(rs.getString("role"));
                loginData.setName(rs.getString("first_name"));
                System.out.println("User found with role: " + loginData.getRole());
            } else {
                System.out.println("No user found with these credentials");
            }
            
        } catch (Exception e) {
            System.err.println("Error in validateUser: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return loginData;
    }			
} 