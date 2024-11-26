package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import admin.dao.QueryDb;
import admin.model.QueryData;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/QueryController")
public class QueryController extends HttpServlet {
    private final QueryDb queryDb;

    public QueryController() {
        queryDb = new QueryDb();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String sortOption = request.getParameter("sort");
            String searchQuery = request.getParameter("search");
            
            List<QueryData> queries = queryDb.getAllQueries(sortOption, searchQuery);
            
            request.setAttribute("queries", queries);
            request.getRequestDispatcher("/admin/Query.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Failed to load queries: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String reply = request.getParameter("reply");
            
            boolean success = queryDb.updateQueryReply(id, reply);
            
            response.setContentType("text/plain");
            response.getWriter().write(success ? "success" : "error");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Failed to update reply: " + e.getMessage());
        }
    }
} 