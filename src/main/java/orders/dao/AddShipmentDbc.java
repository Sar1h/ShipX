package orders.dao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import orders.model.*;
import utils.TrackingNumberGenerator;

import java.io.IOException;
import java.io.PrintWriter;

import auth.dao.SignupDb;

/**
 * Servlet implementation class AddShipmentDbc
 */
@WebServlet("/AddShipmentDbc")
public class AddShipmentDbc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShipmentDbc() {
        super();
        // TODO Auto-generated constructor stub 
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			SenderData s = (SenderData)req.getAttribute("senderdata");
			RecieverData r = (RecieverData)req.getAttribute("recieverdata");
			ProductData p = (ProductData)req.getAttribute("productdata");
			String tracking_number = TrackingNumberGenerator.generateTrackingNumber(s);
			
			// Add validation to check if attributes are null
			if (s == null || r == null || p == null || tracking_number == null) {
				req.setAttribute("errorMessage", "Missing required data. Please fill all fields.");
				req.getRequestDispatcher("errorDbc.jsp").forward(req, res);
				return;
			}
			
			AddShipmentDb ads = new AddShipmentDb();
			String result = ads.setDb(s, r, p,tracking_number, req, res);
			
			// Check the result before redirecting
			if (result != null && result.contains("successfully")) {
				res.sendRedirect("sucess.jsp");
			} else {
				req.setAttribute("errorMessage", result != null ? result : "Failed to process shipment request");
				req.getRequestDispatcher("errorDbc.jsp").forward(req, res);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "System error: " + e.getMessage());
			req.getRequestDispatcher("errorDbc.jsp").forward(req, res);
		}
	}
}
