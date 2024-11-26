package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.google.gson.Gson;
import admin.dao.CustQuestionDb;
import admin.model.CustQuestionData;
import java.util.List;

@WebServlet("/admin/CustQuestionController")
public class CustQuestionController extends HttpServlet {
    private CustQuestionDb questionDb;
    private Gson gson;

    @Override
    public void init() {
        questionDb = new CustQuestionDb(); // Ensure proper initialization
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String sortBy = request.getParameter("sortBy");
            if (sortBy == null) sortBy = "none"; // Default value
            
            List<CustQuestionData> questions = questionDb.getAllQuestions(sortBy);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(questions));
            out.flush();
        } catch (Exception e) {
            log("Error in doGet", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("name");
            if (idParam == null || idParam.isEmpty()) {
                throw new IllegalArgumentException("ID is required");
            }

            int id = Integer.parseInt(idParam);
            String reply = request.getParameter("reply");
            if (reply == null || reply.trim().isEmpty()) {
                throw new IllegalArgumentException("Reply cannot be empty");
            }

            boolean success = questionDb.updateReply(id, reply);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\":" + success + "}");
        } catch (Exception e) {
            log("Error in doPost", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\":false,\"error\":\"" + e.getMessage() + "\"}");
        }
    }
}
