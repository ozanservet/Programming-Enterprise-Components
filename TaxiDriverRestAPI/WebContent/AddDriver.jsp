<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Driver Page</title>
</head>
<body>
<center>
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<h3>Add new driver form</h3>
	<form action="AddDriver" method="post">
	number plate: <input type="text" name="did"><br>
	name: <input type="text" name="dname"><br>
	address: <input type="text" name="daddress"><br>
	phone: <input type="text" name="dphone"><br>
	<input type="submit" value="Add">
	</form>
</center>
</body>
</html>