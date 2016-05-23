import java.io.PrintWriter;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import java.sql.*;
import java.util.Properties;
import javax.servlet.http.*;

public class UpdateCustomer extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter pw = response.getWriter();

		String param_id = request.getParameter("ID_to_update"); // Emp iD to be
																// updated
		pw.println(param_id);

		int check = 0;

		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");
		String alternateContactNumber = request.getParameter("alternateContactNumber");
		String specialty = request.getParameter("specialty");
		String qualificationSummary = request.getParameter("qualificationSummary");
		
		pw.println("trying to connect..");

		// Declaring classes required for Database support
		Connection connection = null;

		check = update(name, address, contactNumber, alternateContactNumber, specialty, qualificationSummary, param_id);
		// ResultSet rs;

		if (check == 0) {
			request.setAttribute("update_fail_message", "Failed to Update Customer Data");
			request.getRequestDispatcher("./view/display.jsp").forward(request, response);
		}

		else {
			request.setAttribute("update_success_message", "Customer Data Updated Successfully");
			request.getRequestDispatcher("./view/display.jsp").forward(request, response);
		}
	}

	public int update(String name, String address, String contactNumber, String alternateContactNumber, String specialty, String qualificationSummary, String param_id)
			throws ServletException, IOException {
		int check = 0;
		Connection connection = null;
		try {
			System.out.println("trying to connect");
			HexConnection hexConnection = new HexConnection();
			connection = hexConnection.getConnection();
			System.out.println("connection success");
			// pw.println("Connection Success");
			String sql = "UPDATE customer_details SET name = ?,address = ?,contactNumber = ?,alternateContactNumber = ?,specialty = ?,qualificationSummary = ? WHERE id = '"
					+ param_id + "' ";

			PreparedStatement prep = connection.prepareStatement(sql);

			prep.setString(1, name);
			prep.setString(2, address);
			prep.setString(3, contactNumber);
			prep.setString(4, alternateContactNumber);
			prep.setString(5, specialty);
			prep.setString(6, qualificationSummary);

			prep.executeUpdate();
			check = prep.executeUpdate();

			prep.close();
		} catch (Exception E) {
			//pw.println("The error is==" + E.getMessage());
		} finally {
			try {
				connection.close();
			} catch (Exception e) {
				//pw.println("The error is==" + e.getMessage());
			}
		}

		return check;
	}
	
}
