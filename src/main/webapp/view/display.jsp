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

table {
	border-collapse: collapse;
	width: 90%;
}
th,td{
	font-size: 14px;
	text-align: left;
	padding: 8px; 
	border-top:1pt solid #f2f2f2;
  	border-bottom:1pt solid #f2f2f2;
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

.headerclass{
	margin-left: 4em;
}


hr {
	border: 0;
	height: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}
</style>
</head>
<body>
	<div id="header" style="background-color: #add8e6;">
		<TABLE class="headerclass">
			<tr>
				<TD><img src="hexaware_logo.png" alt="logo" /></TD>
				<TD><h1>DevOps Solutions</h1></TD>
			</tr>
		</TABLE>
	</div>
	<br/>
	<div style="margin-left: 5em;">
	<h3>Customers</h3>
	<a href="\DevOpsPortal/view/add_new.jsp"> Create New Customer </a>
	<br/>
	<br/>
	<form action="update_delete" method="post">
		<table cellspacing="50">
			<tr >
				<td><b>Name</b></td>
				<td><b>Address</b></td>
				<td><b>Contact Number</b></td>
				<td><b>Alternate Contact Number</b></td>
				<td><b>Specialty</b></td>
				<td><b>Qualification Summary</b></td>

				<td><b>Action</b></td>
			</tr>
			<%@ page import="java.sql.*"%>
			<%@ page import="java.io.*"%>
			<%@ page import="java.util.*"%>
			<%@ page import="java.util.Properties"%>
			<%@ page import="java.io.InputStream"%>
			<%
				try {
					Properties prop = new Properties();

					InputStream input = null;
					String filename = "database_config.properties";
					input = getClass().getClassLoader().getResourceAsStream(
							filename);
					if (input == null) {
						System.out.println("Sorry, unable to find " + filename);
						//pw.println("file not found");
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
					String query = "select * from customer_details";
					Connection conn = DriverManager.getConnection(connectionURL,
							uname, psword);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
			%>

			<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("address")%></td>
				<td><%=rs.getString("contactNumber")%></td>
				<td><%=rs.getString("alternateContactNumber")%></td>
				<td><%=rs.getString("specialty")%></td>
				<td><%=rs.getString("qualificationSummary")%></td>
				<TD><a
					href="\DevOpsPortal/view/update.jsp?id=<%=rs.getString("id")%>">Edit</a>

					<a href="\DevOpsPortal/delete?id=<%=rs.getString("id")%>"
					onclick="return confirm('Are you sure..?');">Delete</a></TD>

			</tr>
			<%
				}
			%>

		</table>
	</form>
	
	<%
		rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

	<div class="msg_position" style="color: #FF0000;">${update_fail_message}</div>
	<div class="msg_position" style="color: #009933;">${update_success_message}</div>
	<div class="msg_position" style="color: #FF0000;">${delete_fail_message}</div>
	<div class="msg_position" style="color: #009933;">${delete_success_message}</div>
	<br/>
	<hr>
	<br/>
	<footer>&#169; Hexaware Technologies Limited </footer>
	</div>
</body>
</html>
