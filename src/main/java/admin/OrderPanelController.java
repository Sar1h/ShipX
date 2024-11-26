package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import admin.dao.OrderPanelDb;
import admin.model.OrderPanelData;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/OrderPanelController")
public class OrderPanelController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final OrderPanelDb orderPanelDb;

    public OrderPanelController() {
        super();
        orderPanelDb = new OrderPanelDb();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String sortOption = request.getParameter("sort");
            String searchQuery = request.getParameter("search");
            
            // Debug log
            System.out.println("Fetching orders with sort: " + sortOption + ", search: " + searchQuery);
            
            List<OrderPanelData> orders = orderPanelDb.getAllOrders(sortOption, searchQuery);
            
            // Debug log
            System.out.println("Found " + orders.size() + " orders");
            
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/admin/ordersPanel.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error in OrderPanelController.doGet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to load orders: " + e.getMessage());
            request.getRequestDispatcher("/admin/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String trackingNumber = request.getParameter("trackingNumber");
            String newStatus = request.getParameter("status");
            
            System.out.println("Updating status for tracking: " + trackingNumber + " to: " + newStatus);
            
            boolean success = orderPanelDb.updateOrderStatus(trackingNumber, newStatus);
            
            response.setContentType("text/plain");
            response.getWriter().write(success ? "success" : "error");
            
        } catch (Exception e) {
            System.err.println("Error in OrderPanelController.doPost: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update status: " + e.getMessage());
        }
    }
} 