package auth.dao;

import java.sql.*; 

import auth.model.SignupData;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SignupDb {
    Connection con = null;
    PreparedStatement ps = null;

    public String setDb(SignupData d, HttpServletRequest req, HttpServletResponse res) {
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             String url = "jdbc:mysql://13.203.63.17:3306/courier"; // Replace <EC2_PUBLIC_IP> with the public IP or DNS of your EC2 instance
             String username = "root"; // Replace with your database username
             String pass = "root1"; // Replace with your database pas            
             System.out.println("Attempting database connection to: " + url);
             con= DriverManager.getConnection(url, username, pass);

            // Prepare an SQL query to insert data
            String query = "INSERT INTO users (first_name, last_name, email, phone_no, address, password) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1, d.getFname());
            ps.setString(2, d.getLname());
            ps.setString(3, d.getEmail());
            ps.setString(4, d.getPhone());
            ps.setString(5, d.getAddress());
            ps.setString(6, d.getPassword());

            // Execute the query
            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                return "A new record was inserted successfully!";
            } else {
                return "No record was inserted.";
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            handleError(req, res, "Error: Duplicate entry or constraint violation. " + e.getMessage());
        } catch (SQLSyntaxErrorException e) {
            handleError(req, res, "Error: SQL syntax error in your query. " + e.getMessage());
        } catch (SQLDataException e) {
            handleError(req, res, "Error: Data-related issue occurred (e.g., invalid data type). " + e.getMessage());
        } catch (SQLException e) {
            handleError(req, res, "Error: Database error occurred. " + e.getMessage());
        } catch (ClassNotFoundException e) {
            handleError(req, res, "Error: JDBC Driver not found. " + e.getMessage());
        } catch (Exception e) {
            handleError(req, res, "Error: An unexpected error occurred. " + e.getMessage());
        } finally {
            // Close the PreparedStatement and Connection
            try {
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null; // Return null since error handling will redirect to error.jsp
    }

    private void handleError(HttpServletRequest req, HttpServletResponse res, String errorMessage) {
        try {
            req.setAttribute("errorMessage", errorMessage);
            RequestDispatcher rd = req.getRequestDispatcher("errorDbc.jsp");
            rd.forward(req, res);
        } catch (Exception e) {
            e.printStackTrace(); // Log the error for debugging
        }
    }
}



/*package auth.dao;

import java.sql.*;

import auth.model.SignupData;

public class SignupDb {
	Connection con = null;
	PreparedStatement ps =null;


	@SuppressWarnings("finally")
	public String setDb(SignupData d) {
		try {
		    // Load the MySQL driver
		    Class.forName("com.mysql.jdbc.Driver");
		    
		    // Establish a connection to the database
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courier", "root", "root");
		    
		    // Prepare an SQL query to insert data
		    String query = "INSERT INTO users (first_name, last_name, email, phone_no, address, password) VALUES (?, ?, ?, ?, ?, ?)";
		    ps = con.prepareStatement(query);
		    
		    ps.setString(1, d.getFname());
		    ps.setString(2, d.getLname());
		    ps.setString(3, d.getEmail());
		    ps.setString(4, d.getPhone());
		    ps.setString(5, d.getAddress());
		    ps.setString(6, d.getPassword());
		    
		    // Execute the query
		    int rowsInserted = ps.executeUpdate();
		    if (rowsInserted > 0) {
		        System.out.println("A new record was inserted successfully!");
		        return "A new record was inserted successfully!";
		    }
		} catch (Exception e) {
		    // Print the exception for debugging purposes
		    System.out.println(e);
		    return e.getMessage();
		}
//		}finally {
//		    // Close the PreparedStatement and Connection
//		    try {
//		        if (ps != null) ps.close();
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		    }
//		    try {
//		        if (con != null) con.close();
//		    } catch (Exception e) {
//		        e.printStackTrace();
//		    }
		
		return "Ok";
	      }
	    }
	*/
