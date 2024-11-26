package queries.dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import queries.model.CustQueriesData;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CustQueriesDbc")
public class CustQueriesDbc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustQueriesDbc() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        CustQueriesData d = (CustQueriesData)request.getAttribute("data");
        CustQueriesDb s = new CustQueriesDb();
        String m = s.setDb(d, request, response);
        out.println(m);
        response.sendRedirect("success1.jsp");
    }
}
