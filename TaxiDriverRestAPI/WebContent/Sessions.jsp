<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule Sessions</title>
</head>
<body>
	
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<h2 align="center"><font><strong>Schedule Session</strong></font></h2>
	<form action="AddSession" method="post">
		<table align="center" cellpadding="5" cellspacing="5" border="1">
			<tr></tr>
			<tr bgcolor="#A52A2A">
				<td><b>training type</b></td>
				<td><b>start date</b></td>
				<td><b>end date</b></td>
				<td><b>certificate expire date</b></td>
			</tr>
			<tr bgcolor="#DEB887">
				<td>
					<select name="tid">
					<%
					Connection con = null;
					try
					{
						InitialContext ic = new InitialContext();
						DataSource ds = (DataSource)ic.lookup("java:/MySqlDS");
						con = ds.getConnection();
					}
					catch (Exception e)
					{
						e.printStackTrace();
					}
					
					Statement stmt = null;
					ResultSet rs = null;
					
					try{ 
						stmt = con.createStatement();
						String sql ="SELECT * FROM Trainings";
	
						rs = stmt.executeQuery(sql);
						while(rs.next()){
					%>
					<option value="<%=rs.getInt("training_id") %>"><%=rs.getString("training_type") %></option>
					<%
						}
	
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
					</select>
				</td>
				<td><input type="date" name="s_d"></td>
				<td><input type="date" name="e_d"></td>
				<td><input type="date" name="c_e_d"></td>
			</tr>
		</table>
			<center><input type="submit" name="session_submit" value="add schedule"/></center>
	</form>
</body>
</html>
