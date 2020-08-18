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

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Calendar c = Calendar.getInstance();
String todaydate = sdf.format(c.getTime());
c.add(Calendar.DAY_OF_MONTH, 30);
String dateplus = sdf.format(c.getTime());
%>

<h2 align="center"><font><strong>Expire Dates</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>driver number plate</b></td>
<td><b>Expiring</b></td>
<td><b>Date</b></td>
</tr>

<%
try{ 
String sql ="SELECT * FROM Drivers_Qualifications INNER JOIN Qualifications ON Drivers_Qualifications.qualification_id = Qualifications.qualification_id INNER JOIN Drivers ON Drivers_Qualifications.driver_id = Drivers.driver_id WHERE (certificate_expire_date BETWEEN '" +  todaydate + "' AND '" + java.sql.Date.valueOf(dateplus) + "') ";

stmt = con.createStatement();
rs = stmt.executeQuery(sql);

while(rs.next()){
%>

<tr bgcolor="#DEB887">
<td align="right"><%=rs.getString("Drivers.driver_id") %></td>
<td align="right"><%=rs.getString("Qualifications.qualification_type") %></td>
<td salign="right"><%=rs.getString("certificate_expire_date") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

</table>

