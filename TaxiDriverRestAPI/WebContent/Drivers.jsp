<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

Statement stmt = null;
ResultSet rs = null;
%>

<h2 align="center"><font><strong>Add/Edit/Delete Driver</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>driver number plate</b></td>
<td><b>name</b></td>
<td><b>address</b></td>
<td><b>phone</b></td>
<td><b>option</b></td>
<td><b>option</b></td>
</tr>

<%
try{ 
stmt = con.createStatement();
String sql ="SELECT * FROM Drivers";

rs = stmt.executeQuery(sql);
while(rs.next()){
%>

<tr bgcolor="#DEB887">
<td><%=rs.getString("driver_id") %></td>
<td><%=rs.getString("driver_name") %></td>
<td><%=rs.getString("driver_address") %></td>
<td><%=rs.getString("driver_phone") %></td>
<td>
    <form action="editdriver.jsp" method="post">
        <input type="submit" name="edit_user" value="Edit" />
        <input type="hidden" name="did" value="<%=rs.getString("driver_id")%>" />
    </form>
</td>
<td>
    <form action="DeleteDriver" method="post">
        <input type="submit" name="delete_user" value="Delete" />
        <input type="hidden" name="did" value="<%=rs.getString("driver_id")%>" />
    </form>
</td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<form action="AddDriver" method="post">
<tr bgcolor="#DEB887">
<td><input type="text" name="did"><br></td>
<td><input type="text" name="dname"><br></td>
<td><input type="text" name="daddress"><br></td>
<td><input type="text" name="dphone"><br></td>
<td><input type="submit" value="Add"></td>
<td></td>
</tr>
</form>

</table>
