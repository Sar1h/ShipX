package orders.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class testCon {
    public static void main(String[] args) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courier", "root", "root");

            // Prepare the SQL query
            String query = "INSERT INTO orders " +
                           "(sname, sphone, semail, saddress, scity, sstate, szip, " +
                           "rname, rphone, remail, raddress, rcity, rstate, rzip, " +
                           "type, shipmethod, description, length, width, height) " +
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(query);

            // Set dummy data for testing
            ps.setString(1, "Sender Name");
            ps.setString(2, "1234567890");
            ps.setString(3, "sender@example.com");
            ps.setString(4, "123 Sender Street");
            ps.setString(5, "Sender City");
            ps.setString(6, "Sender State");
            ps.setString(7, "12345");

            ps.setString(8, "Receiver Name");
            ps.setString(9, "0987654321");
            ps.setString(10, "receiver@example.com");
            ps.setString(11, "456 Receiver Avenue");
            ps.setString(12, "Receiver City");
            ps.setString(13, "Receiver State");
            ps.setString(14, "67890");

            ps.setString(15, "Package Type");
            ps.setString(16, "Shipping Method");
            ps.setString(17, "Package Description");
            ps.setInt(18, 10);  // Length
            ps.setInt(19, 5);   // Width
            ps.setInt(20, 3);   // Height

            // Execute the query
            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("Test Passed: A new record was inserted successfully!");
            } else {
                System.out.println("Test Failed: No record was inserted.");
            }
        } catch (Exception e) {
            System.out.println("Test Failed: Exception occurred - " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close the PreparedStatement and Connection
            try {
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
