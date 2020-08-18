<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Qualification</title>
</head>
<body>
<center>
<b>Edit Qualification</b>
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<form action="EditQualification" method="post">
	id: <input type="text" name="qid"><br>
	type: <input type="text" name="qtype"><br>
	<input type="submit" value="edit">
	</form>
</center>
</body>
</html>