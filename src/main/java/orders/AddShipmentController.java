package orders;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import orders.model.*;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class AddShipmentController
 */
@WebServlet("/AddShipmentController")
public class AddShipmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShipmentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter out=res.getWriter();
		
		String sname = req.getParameter("senderName");
		String sphone = req.getParameter("senderPhone");
		String semail = req.getParameter("senderEmail");
		String saddress = req.getParameter("senderAddress");
		String scity = req.getParameter("senderCity");
		String sstate = req.getParameter("senderState");
		String szip = req.getParameter("senderZip");
		
		String rname = req.getParameter("receiverName");
		String rphone = req.getParameter("receiverPhone");
		String remail = req.getParameter("receiverEmail");
		String raddress = req.getParameter("receiverAddress");
		String rcity = req.getParameter("receiverCity");
		String rstate = req.getParameter("receiverState");
		String rzip = req.getParameter("receiverZip");
		
		String type = req.getParameter("packageType");
		String description = req.getParameter("description");
		String shipMethod = req.getParameter("shippingMethod");
		
		double weight = Double.parseDouble(req.getParameter("weight"));
		double declaredValue = Double.parseDouble(req.getParameter("declaredValue"));
		
		
			int length = Integer.parseInt(req.getParameter("length"));
			int width = Integer.parseInt(req.getParameter("width"));
			int height = Integer.parseInt(req.getParameter("height"));
			
			SenderData s=new SenderData(sname, sphone, semail, saddress, scity, sstate, szip);
			RecieverData r=new RecieverData(rname, rphone, remail, raddress, rcity, rstate, rzip);
			ProductData p=new ProductData(type, description, shipMethod, length, width, height);
			
//			out.println(
//				    "<html><body>" +
//				    "<h2>Sender Details</h2>" +
//				    "<p>Name: " + sname + "</p>" +
//				    "<p>Phone: " + sphone + "</p>" +
//				    "<p>Email: " + semail + "</p>" +
//				    "<p>Address: " + saddress + "</p>" +
//				    "<p>City: " + scity + "</p>" +
//				    "<p>State: " + sstate + "</p>" +
//				    "<p>Zip: " + szip + "</p>" +
//				    "<h2>Receiver Details</h2>" +
//				    "<p>Name: " + rname + "</p>" +
//				    "<p>Phone: " + rphone + "</p>" +
//				    "<p>Email: " + remail + "</p>" +
//				    "<p>Address: " + raddress + "</p>" +
//				    "<p>City: " + rcity + "</p>" +
//				    "<p>State: " + rstate + "</p>" +
//				    "<p>Zip: " + rzip + "</p>" +
//				    "<h2>Package Details</h2>" +
//				    "<p>Type: " + type + "</p>" +
//				    "<p>Description: " + description + "</p>" +
//				    "<p>Shipping Method: " + shipMethod + "</p>" +
//				    "<p>Weight: " + weight + " kg</p>" +
//				    "<p>Declared Value: $" + declaredValue + "</p>" +
//				    "<p>Dimensions: " + length + " x " + width + " x " + height + " cm</p>" +
//				    "</body></html>"
//				);

			
			try {			
			req.setAttribute("senderdata", s);
			req.setAttribute("recieverdata", r);
			req.setAttribute("productdata", p);
			RequestDispatcher rd=req.getRequestDispatcher("/AddShipmentDbc");
			rd.forward(req, res);
		} catch (NumberFormatException e) {
			req.setAttribute("errorMessage", "Invalid numeric values provided");
			RequestDispatcher rd = req.getRequestDispatcher("errorDbc.jsp");
			rd.forward(req, res);
		}
		
	}

}
