package orders;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import orders.dao.MyOrdersDb;
import orders.model.OrderData;

import java.io.IOException;
import java.util.List;

@WebServlet("/MyOrdersController")
public class MyOrdersController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("key");
        
        System.out.println("Session ID: " + session.getId());
        System.out.println("User Email from session: " + userEmail);
        
        if (userEmail == null) {
            System.out.println("No user email found in session, redirecting to login");
            response.sendRedirect("userlogin.jsp");
            return;
        }
        
        MyOrdersDb ordersDb = new MyOrdersDb();
        List<OrderData> userOrders = ordersDb.getUserOrders(userEmail);
        
        System.out.println("Found " + userOrders.size() + " orders for user: " + userEmail);
        
        request.setAttribute("orders", userOrders);
        request.getRequestDispatcher("MyOrders.jsp").forward(request, response);
    }
} 