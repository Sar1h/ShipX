package tracking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tracking.dao.TrackingDb;
import tracking.model.TrackingData;

import java.io.IOException;

@WebServlet("/TrackingController")
public class TrackingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String trackingNumber = request.getParameter("trackingNumber");
        
        if (trackingNumber != null && !trackingNumber.trim().isEmpty()) {
            TrackingDb trackingDb = new TrackingDb();
            TrackingData shipment = trackingDb.getShipmentDetails(trackingNumber);
            
            if (shipment != null) {
                request.setAttribute("shipment", shipment);
            } else {
                request.setAttribute("error", "No shipment found with this tracking number");
            }
        }
        
        request.getRequestDispatcher("track.jsp").forward(request, response);
    }
} 