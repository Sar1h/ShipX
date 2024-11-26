package queries.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.SQLSyntaxErrorException;

import auth.model.SignupData;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import queries.model.CustQueriesData;

public class CustQueriesDb {
	Connection con = null;
    PreparedStatement ps = null;

    public String setDb(CustQueriesData d, HttpServletRequest req, HttpServletResponse res) {
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courier", "root", "root");

            // Prepare an SQL query to insert data
            String query = "INSERT INTO custqueries (name, email, subject, message) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1, d.getName());
            ps.setString(2, d.getEmail());
            ps.setString(3, d.getSubject());
            ps.setString(4, d.getMessage());

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
        return null;
    }

    private void handleError(HttpServletRequest req, HttpServletResponse res, String errorMessage) {
        try {
            req.setAttribute("errorMessage", errorMessage);
            RequestDispatcher rd = req.getRequestDispatcher("errorDbc.jsp");
            rd.forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
