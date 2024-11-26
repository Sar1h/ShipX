package queries;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import queries.model.CustQueriesData;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class CustQueries
 */
@WebServlet("/CustQueriesController")
public class CustQueriesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustQueriesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out=res.getWriter();
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String subject=req.getParameter("subject");
		String message=req.getParameter("message");
		
		CustQueriesData d=new CustQueriesData(name, email, subject, message);
		
		req.setAttribute("data", d);
		RequestDispatcher rd=req.getRequestDispatcher("/CustQueriesDbc");
		rd.forward(req, res);
		
		//out.println();
	}

}
