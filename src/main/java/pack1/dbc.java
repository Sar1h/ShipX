package pack1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pack1.dao.DbDao;
import pack1.model.DbConnect;

/**
 * Servlet implementation class dbc
 */
@WebServlet("/dbc")
public class dbc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i=Integer.parseInt(request.getParameter("n1"));
		PrintWriter out=response.getWriter();
		
		DbDao dao=new DbDao();
		DbConnect u1=dao.getDB(i);
		
		request.setAttribute("u1", u1);
		RequestDispatcher rd=request.getRequestDispatcher("display.jsp");
		rd.forward(request, response);
		//out.println("hello"+s);
	}


}
