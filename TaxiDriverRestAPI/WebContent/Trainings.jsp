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

<h2 align="center"><font><strong>Add/Edit/Delete Training</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>id</b></td>
<td><b>type</b></td>
<td><b>option</b></td>
<td><b>option</b></td>
</tr>

<%
try{ 

stmt = con.createStatement();
String sql ="SELECT * FROM Trainings";

rs = stmt.executeQuery(sql);
while(rs.next()){
%>

<tr bgcolor="#DEB887">
<td><%=rs.getString("training_id") %></td>
<td><%=rs.getString("training_type") %></td>
<td>
    <form action="edittraining.jsp" method="post">
        <input type="submit" name="edit_training" value="Edit" />
        <input type="hidden" name="tid" value="<%=rs.getString("training_id")%>" />
    </form>
</td>
<td>
    <form action="DeleteTraining" method="post">
        <input type="submit" name="delete_training" value="Delete" />
        <input type="hidden" name="tid" value="<%=rs.getString("training_id")%>" />
    </form>
</td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<form action="AddTraining" method="post">
<tr bgcolor="#DEB887">
<td><input type="text" name="tid"><br></td>
<td><input type="text" name="ttype"><br></td>
<td><input type="submit" value="Add"></td>
<td></td>
</tr>
</form>

</table>

