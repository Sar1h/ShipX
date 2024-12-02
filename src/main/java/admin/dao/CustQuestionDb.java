package admin.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import admin.model.CustQuestionData;

public class CustQuestionDb {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private Connection getConnection() throws SQLException, ClassNotFoundException {
    	String url = "jdbc:mysql://13.203.63.17:3306/courier"; // Replace <EC2_PUBLIC_IP> with the public IP or DNS of your EC2 instance
        String username = "root"; // Replace with your database username
        String pass = "root1"; // Replace with your database pas            
        System.out.println("Attempting database connection to: " + url);
        return DriverManager.getConnection(url, username, pass);
    }

    public List<CustQuestionData> getAllQuestions(String sortBy) {
        List<CustQuestionData> questions = new ArrayList<>();
        try {
            con = getConnection();
            System.out.println("Database connection established");
            
            String sql = "SELECT * FROM custqueries WHERE status != 'replied' OR status IS NULL";
            if ("timestamp".equals(sortBy)) {
                sql += " ORDER BY timestamp DESC";
            }
            
            System.out.println("Executing SQL: " + sql);
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            System.out.println("Columns found:");
            for (int i = 1; i <= columnCount; i++) {
                System.out.println(rsmd.getColumnName(i));
            }
            
            while (rs.next()) {
                try {
                    CustQuestionData question = new CustQuestionData(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getString("timestamp")
                    );
                    questions.add(question);
                    System.out.println("Added question: " + question.getName());
                } catch (SQLException e) {
                    System.out.println("Error reading row: " + e.getMessage());
                    e.printStackTrace();
                }
            }
            System.out.println("Total questions found: " + questions.size());
            
        } catch (Exception e) {
            System.err.println("Error in getAllQuestions: " + e.getMessage());
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return questions;
    }

    public boolean updateReply(int id, String reply) {
        try {
            con = getConnection();
            String sql = "UPDATE custqueries SET reply = ?, status = 'replied' WHERE id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, reply);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeResources();
        }
    }

    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 