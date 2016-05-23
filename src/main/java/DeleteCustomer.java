import java.io.PrintWriter;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Properties;

public class DeleteCustomer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String param_id = request.getParameter("id"); // Emp iD to be deleted
		pw.println(param_id);
		int check = 0;
		pw.println("trying to connect..");
		Connection connection = null;
		// ResultSet rs;
		check = delete(param_id);
		if (check == 0) {
			request.setAttribute("delete_fail_message", "Failed to delete Customer Data");
			request.getRequestDispatcher("./view/display.jsp").forward(request, response);
		}

		else {

			request.setAttribute("delete_success_message", "Customer data Deleted Successfully.");
			request.getRequestDispatcher("./view/display.jsp").forward(request, response);
		}
	}

	public int delete(String param_id)
			throws ServletException, IOException {
		int check = 0;
		Connection connection = null;
		try {
			HexConnection hexConnection = new HexConnection();
			connection = hexConnection.getConnection();
			String sql = "DELETE FROM customer_details WHERE id = '" + param_id + "' ";
			PreparedStatement prep = connection.prepareStatement(sql);
			check = prep.executeUpdate();
			prep.close();

			//pw.println("Values Deleted");

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
