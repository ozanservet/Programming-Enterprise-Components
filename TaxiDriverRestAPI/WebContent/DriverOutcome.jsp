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
<title>Driver Selection</title>
</head>
<body>
	<center>
	<%
		if(session.getAttribute("username") == null)
		{
			response.sendRedirect("login.jsp");
		}
	%>
	
	<h2 align="center"><font><strong>Choose driver to add outcome</strong></font></h2>
		<form action="Outcome" method="post">
			<table align="center" cellpadding="5" cellspacing="5" border="1">
				<tr></tr>
				<tr bgcolor="#A52A2A">
					<td><b>driver number plates</b></td>
				</tr>
				<tr bgcolor="#DEB887">
					<td>
						<select name="did">
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
						int drv_id;

						Statement stmt = null;
						ResultSet rs = null;
						
						try{ 
							stmt = con.createStatement();
							String sql ="SELECT * FROM Drivers";
		
							rs = stmt.executeQuery(sql);
							while(rs.next()){
								drv_id = rs.getInt("driver_id");
						%>
						<option value="<%=drv_id %>"><%=drv_id %></option>
						<%
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
						%>
						</select>
					</td>
				</tr>
			</table>
			<center><input type="submit" name="session_submit" value="select"/></center>
		</form>
	</center>
</body>
</html>
