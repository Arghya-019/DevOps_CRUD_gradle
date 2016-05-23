import java.io.PrintWriter;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.Properties;

public class AddCustomer extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");
		String alternateContactNumber = request.getParameter("alternateContactNumber");
		String specialty = request.getParameter("specialty");
		String qualificationSummary = request.getParameter("qualificationSummary");
		
		pw.println("trying to connect..");

		pw.println("Values Inputted");

		if (add(name, address, contactNumber, alternateContactNumber, specialty, qualificationSummary) == 0) {
			request.setAttribute("add_fail_message", "Failed to Add new Customer.");
			request.getRequestDispatcher("./view/add_new.jsp").forward(request, response);
		}

		else {
			request.setAttribute("add_success_message", "New Customer Added to Database.");
			request.getRequestDispatcher("./view/add_new.jsp").forward(request, response);
		}
	}

	public int add(String name, String address, String contactNumber, String alternateContactNumber, String specialty, String qualificationSummary)
			throws ServletException, IOException {
		int check = 0;
		Connection connection = null;
		System.out.println("trying to connect");
		HexConnection hexConnection = new HexConnection();
		connection = hexConnection.getConnection();
		System.out.println("connection success");
		try {
			String sql = "INSERT INTO customer_details (name, address, contactNumber, alternateContactNumber, specialty,qualificationSummary) VALUES (?, ?, ?, ?, ?, ?);";

			PreparedStatement prep = connection.prepareStatement(sql);
			
			prep.setString(1, name);
			prep.setString(2, address);
			prep.setString(3, contactNumber);
			prep.setString(4, alternateContactNumber);
			prep.setString(5, specialty);
			prep.setString(6, qualificationSummary);

			check = prep.executeUpdate();
			prep.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return check;
	}

}
