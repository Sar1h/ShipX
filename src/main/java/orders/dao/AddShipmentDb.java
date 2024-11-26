package orders.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLSyntaxErrorException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import orders.model.*;

public class AddShipmentDb {
    Connection con = null;
    PreparedStatement ps = null;

    public String setDb(SenderData s, RecieverData r, ProductData p, String tracking_number, HttpServletRequest req, HttpServletResponse res) {
        try {
            // Add validation
            if (s == null || r == null || p == null || tracking_number == null) {
                return "Invalid data received";
            }

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courier", "root", "root");

            // Debug logging
            System.out.println("Database connection established");

            String query = "INSERT INTO orders " +
                    "(sname, sphone, semail, saddress, scity, sstate, szip, " +
                    "rname, rphone, remail, raddress, rcity, rstate, rzip, " +
                    "type, shipmethod, description, length, width, height, track_no) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(query);

            // Set sender parameters
            ps.setString(1, s.getName());
            ps.setString(2, s.getPhone());
            ps.setString(3, s.getEmail());
            ps.setString(4, s.getAddress());
            ps.setString(5, s.getCity());
            ps.setString(6, s.getState());
            ps.setString(7, s.getZip());

            // Set receiver parameters
            ps.setString(8, r.getName());
            ps.setString(9, r.getPhone());
            ps.setString(10, r.getEmail());
            ps.setString(11, r.getAddress());
            ps.setString(12, r.getCity());
            ps.setString(13, r.getState());
            ps.setString(14, r.getZip());

            // Set product parameters
            ps.setString(15, p.getType());
            ps.setString(16, p.getShipMethod());
            ps.setString(17, p.getDescription());
            ps.setInt(18, p.getLength());
            ps.setInt(19, p.getWidth());
            ps.setInt(20, p.getHeight());
            ps.setString(21, tracking_number);

            // Debug logging
            System.out.println("Executing query with parameters:");
            System.out.println("Sender: " + s.getName() + ", " + s.getEmail());
            System.out.println("Receiver: " + r.getName() + ", " + r.getEmail());
            System.out.println("Product: " + p.getType() + ", " + p.getDescription());

            int rowsInserted = ps.executeUpdate();
            System.out.println("Rows inserted: " + rowsInserted);

            if (rowsInserted > 0) {
                return "A new record was inserted successfully!";
            } else {
                return "No record was inserted.";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error: " + e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        } finally {
            closeResources();
        }
    }

    private void closeResources() {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
            System.out.println("Resources closed");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

