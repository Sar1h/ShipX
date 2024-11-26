package auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import auth.dao.LoginDb;
import auth.model.LoginData;
import java.io.IOException;

import com.mysql.cj.Session;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDb loginDb;

    public void init() {
        loginDb = new LoginDb();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            LoginData userData = loginDb.validateUser(email, password);
            
            if (userData != null) {
                HttpSession session = request.getSession();
                session.setAttribute("email", userData.getEmail());
                session.setAttribute("role", userData.getRole());
                
                // Redirect based on role
                if ("admin".equals(userData.getRole())) {
                	session.setAttribute("User", userData.getName());
                    response.sendRedirect(request.getContextPath() + "/admin/ordersPanel.jsp");
                } else {
                	session.setAttribute("User", userData.getName());
                    response.sendRedirect(request.getContextPath() + "/ClientDash.jsp");
                }
            } else {
                // Invalid credentials
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("userlogin.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during login");
            request.getRequestDispatcher("userlogin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("userlogin.jsp");
    }
} 