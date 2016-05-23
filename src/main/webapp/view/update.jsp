<!DOCTYPE html>
<html>
<head>
<style>
form {
	font-size: 14px;
	font-family: Helvetica, Arial, sans-serif;
	color: rgb(51, 51, 51);
}

body {
	font-size: 14px;
	font-family: Helvetica, Arial, sans-serif;
	color: rgb(51, 51, 51);
}

#footer {
	clear: both;
	position: relative;
	z-index: 10;
	height: 3em;
	margin-top: -3em;
}

#header {
	position: relative;
	height: 7em;
	margin-top: -1em;
	margin-left: -1em;
	border-bottom: 1px solid black;
}

.headerclass {
	margin-left: 4em;
}

hr {
	border: 0;
	height: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}
</style>

<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.InputStream"%>

<%
	String clickedLinkId = request.getParameter("id");
%>

</head>
<body>
	<%
		try {
			Properties prop = new Properties();

			InputStream input = null;
			String filename = "database_config.properties";
			input = getClass().getClassLoader().getResourceAsStream(filename);
			if (input == null) {
				System.out.println("Sorry, unable to find " + filename);
				return;
			}

			//load a properties file from class path, inside static method
			prop.load(input);

			//Setting connection Parameters 
			String connectionURL = prop.getProperty("connectionURL");

			// Mysql user name and password whichever you have given during installation 
			String uname = prop.getProperty("uname");
			String psword = prop.getProperty("psword");
			String driver = prop.getProperty("driver");
			Class.forName(driver);
			String query = "select * from customer_details where id = '" + clickedLinkId + "'";
			Connection conn = DriverManager.getConnection(connectionURL, uname, psword);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
	%>
	<div id="header" style="background-color: #add8e6;">
		<TABLE class="headerclass">
			<tr>
				<TD><img src="hexaware_logo.png" alt="logo" /></TD>
				<TD><h1>DevOps Solutions</h1></TD>
			</tr>
		</TABLE>
	</div>
	<br />
	<div style="margin-left: 5em;">
		<h3>Edit Customer</h3>
		<hr />
		<FORM METHOD="POST" ACTION="../update">
			<TABLE cellspacing="15">
				<TR>
					<TD>Name</TD>
					<TD><INPUT TYPE="TEXT" NAME="name" SIZE="20"
						value="<%=rs.getString("name")%>" required></TD>
				</TR>
				<TR>
					<TD>Gender</TD>
					<TD><INPUT TYPE="TEXT" NAME="address" SIZE="20"
						value="<%=rs.getString("address")%>" required></TD>
				</TR>
				<TR>
					<TD>Contact Number</TD>
					<TD><INPUT TYPE="TEXT" NAME="contactNumber" SIZE="20"
						value="<%=rs.getString("contactNumber")%>" required></TD>
				</TR>
				<TR>
					<TD>AlternateContactNumber</TD>
					<TD><INPUT TYPE="TEXT" NAME="alternateContactNumber" SIZE="25"
						value="<%=rs.getString("alternateContactNumber")%>" required></TD>
				</TR>
				<TR>
					<TD>Specialty</TD>
					<TD><INPUT TYPE="TEXT" NAME="specialty" SIZE="25"
						value="<%=rs.getString("specialty")%>" required></TD>
				</TR>
				<TR>
					<TD>QualificationSummary</TD>
					<TD><INPUT TYPE="TEXT" NAME="qualificationSummary" SIZE="25"
						value="<%=rs.getString("qualificationSummary")%>" required></TD>
				</TR>
				<input type="hidden" name="ID_to_update" value=<%=clickedLinkId%>>

				<TR>
					<TD></TD>
					<TD><INPUT TYPE="SUBMIT" VALUE="Submit" NAME="B1">
						<INPUT TYPE="RESET" VALUE="Cancel" NAME="B2">
					</TD>
				</TR>
				<%
					}
				%>
			</TABLE>
		</FORM>
	
	<%
		rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<a href="display.jsp"> Back to Customer List</a>
	<br/>
	<hr/>
	<br/>
	<footer>&#169; Hexaware Technologies Limited </footer>
	<br/>
	</div>
</body>
</html>
