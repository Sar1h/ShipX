package pack1.dao;

import java.sql.*;
import pack1.model.DbConnect;

public class DbDao {
	
	
	
	public DbConnect getDB(int i) {
		
		DbConnect a=new DbConnect();
		try {
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from info where id="+i);
			if(rs.next()) {
				a.setId(rs.getInt("id"));
				a.setName(rs.getString("name"));
				a.setAge(rs.getInt("age"));
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	    
	    return a;
	}

}
