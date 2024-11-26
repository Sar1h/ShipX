package auth;

import jakarta.servlet.RequestDispatcher; 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import auth.model.SignupData;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/SignupController")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out=res.getWriter();
		//out.println("Welcome");
		
		String fname=req.getParameter("firstName");
		String lname=req.getParameter("lastName");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String password=req.getParameter("confirmPassword");
		
		SignupData d=new SignupData(fname,lname,email,phone,address,password);
		
		req.setAttribute("data", d);
		RequestDispatcher rd=req.getRequestDispatcher("/SignupDbc");
		rd.forward(req, res);
		
		//out.println(fname+" "+lname+" "+email+" "+phone+" "+password);
	}

}
