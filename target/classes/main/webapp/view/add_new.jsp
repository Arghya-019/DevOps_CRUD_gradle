<%-- 
    Document   : add_new
    Created on : Feb 17, 2016, 11:08:25 AM
    Author     : 32588
--%>

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

.headerclass{
	margin-left: 4em;
}


hr {
	border: 0;
	height: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}
/* form {
	font-size: 1em !important;
	font-family: Arial !important;
	font-weight: bold !important;
}

body { //
	background-color: #f4f7f8;
} */



/*#footer {
	clear: both;
	position: relative;
	z-index: 10;
	height: 3em;
	margin-top: -3em;
}

hr {
	border: 0;
	height: 0;
	border-top: 1px solid rgba(0, 0, 0, 0.1);
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}
 */
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
	<div  style="margin-left: 5em;">
	<h3>Add Customer</h3>
	<hr/>
	<FORM METHOD="POST" ACTION="../add">
		<TABLE   cellspacing="1">
			<TR>
				<TD><h5>Name</h5></TD>
				<TD><INPUT TYPE="TEXT" id="addCustomer_customerName" NAME="name" SIZE="25" required>
				</TD>
			</TR>
			<TR>
				<TD><h5>Address</h5></TD>
				<TD><INPUT TYPE="TEXT" id="addCustomer_customerAddree" NAME="address" SIZE="25" required>
				</TD>
			</TR>
			<TR>
				<TD><h5>Contact Number</h5></TD>
				<TD><INPUT TYPE="TEXT" id="addCustomer_customerContactNo" NAME="contactNumber" SIZE="25" required>
				</TD>
			</TR>
			<TR>
				<TD><h5>AlternateContactNumber</h5></TD>
				<TD><INPUT TYPE="TEXT" id="addCustomer_customerAltContactNo" NAME="alternateContactNumber" SIZE="25"
					required></TD>
			</TR>
			<TR>
				<TD><h5>Specialty</h5></TD>
				<TD><INPUT TYPE="TEXT" id="addCustomer_customerSpecialty" NAME="specialty" SIZE="25" required></TD>
			</TR>
			<TR>
				<TD><h5>QualificationSummary</h5></TD>
				<TD><INPUT TYPE="TEXT" id="addCustomer_customerQualification" NAME="qualificationSummary" SIZE="25"
					required></TD>
			</TR>
			<TR>
				<TD></TD>
				<TD><INPUT TYPE="SUBMIT" VALUE="Create" id="addCustomer_save" NAME="B1">
				<INPUT TYPE="RESET" VALUE="Cancel" NAME="B2"></TD>
			</TR>

		</TABLE>
	</FORM>
	<br/>
	<div class="msg_position" style="color: #FF0000;">${add_fail_message}</div>
	<div class="msg_position" style="color: #009933;">${add_success_message}</div>
	<a href="\DevOpsPortal/view/display.jsp">Back to Customer List</a><br/><br/>
	<br/>
	<hr>
	<br/>
	<footer>&#169; Hexaware Technologies Limited </footer>
	</div>
</body>
</html>
