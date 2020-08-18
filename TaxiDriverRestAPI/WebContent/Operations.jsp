<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Operation Page</title>
</head>
<body>
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<center>
		Welcome ${username}<br>
		Please choose an option below
		
		<form action="Operations" method="post">
			<select name="selection">
			    <option value="Drivers">add/edit/delete drivers</option>
			    <option value="Editqualifications">add/edit/delete qualifications</option>
			    <option value="Edittrainingtype">add/edit/delete training types</option>
			    <option value="Sessions">schedule sessions</option>
			    <option value="Assign">assign a session</option>
			    <option value="Outcome">record outcome</option>
			    <option value="Checkdriversstatus">check driver's qualifications and trainings</option>
			    <option value="Expiring30days">check expiring dates</option>
			</select>
			<input type="submit" value="select">
		</form>
	</center>
</body>
</html>