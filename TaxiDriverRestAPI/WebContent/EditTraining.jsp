<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Training</title>
</head>
<body>
<center>
<b>Edit Training</b>
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	<%
		String train_id = request.getParameter("tid");
		int t_id = 0;
		if(train_id!=null) {
			t_id =Integer.parseInt(request.getParameter("tid"));
		}
		session.setAttribute("tid", t_id);
	%>
	<form action="EditTraining" method="post">
	training id: <input type="text" name="t_id" disabled="disabled" value="<%=t_id %>"><br>
	type: <input type="text" name="ttype"><br>
	<input type="submit" value="edit">
	</form>
	</center>
</body>
</html>