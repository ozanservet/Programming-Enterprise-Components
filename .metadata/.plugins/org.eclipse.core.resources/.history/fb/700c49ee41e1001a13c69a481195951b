<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Drivers</title>
</head>
<body>
<center>
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<%
		String driver_id = request.getParameter("did");
		int dr_id = 0;
		if(driver_id!=null) {
			dr_id =Integer.parseInt(request.getParameter("did"));
		}
		session.setAttribute("did", dr_id);
	%>
	<form action="EditDriver" method="post">
	driver number plate: <input type="text" name="did" disabled="disabled" value="<%=dr_id %>"><br>
	name: <input type="text" name="dname"><br>
	address: <input type="text" name="daddress"><br>
	phone: <input type="text" name="dphone"><br>
	<input type="submit" value="edit">
	</form>
	</center>
</body>
</html>