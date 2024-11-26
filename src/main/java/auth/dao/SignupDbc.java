package auth.dao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import auth.model.SignupData;

/**
 * Servlet implementation class SignupDbc
 */
@WebServlet("/SignupDbc")
public class SignupDbc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupDbc() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		SignupData d=(SignupData)request.getAttribute("data");
		out.println("dbc");
		SignupDb s=new SignupDb();
		String m=s.setDb(d,request,response);
		out.println(m);
		response.sendRedirect("userlogin.jsp");
		

	}

	

}
