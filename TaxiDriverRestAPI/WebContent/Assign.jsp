<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>

<%
	if(session.getAttribute("username") == null)
	{
		response.sendRedirect("login.jsp");
	}
%>
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

	ResultSet rs = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	String dateplus = sdf.format(c.getTime());;
%>
<body>
<h2 align="center"><font><strong>Assign Driver</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
	<form action="Assign" method="post">
		<tr bgcolor="#A52A2A">
			<td><b>driver number plate</b></td>
			<td><b>training type</b></td>
			<td><b>operation</b></td>
		</tr>
		<tr bgcolor="#DEB887">
			<td>
			<select name="did">
			
			<%
			try{ 
			String sql ="SELECT * FROM Drivers";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int drv_id = rs.getInt("driver_id");
			%>
			
			<option value="<%=drv_id %>"><%=drv_id %></option>
			
			<% 
			}
				con = null;
				rs = null;
				stmt = null;
				ps = null;
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			%>
			
			</select>
			</td>
			<td>
			<select name="tid">
			
			<%
				try{ 
					String sql ="SELECT * FROM Trainings WHERE session_start_date >= '" + java.sql.Date.valueOf(dateplus) + "'";
					
					stmt = con.createStatement();
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
			<td>
				<input type="submit" value="assign">
			</td>
		</tr>
	</from>
</table>
</body>
