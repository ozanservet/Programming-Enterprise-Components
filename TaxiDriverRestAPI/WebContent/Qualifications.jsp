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

<h2 align="center"><font><strong>Add/Edit/Delete Qualifications</strong></font></h2>
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
String sql ="SELECT * FROM Qualifications";

rs = stmt.executeQuery(sql);
while(rs.next()){
%>

<tr bgcolor="#DEB887">
<td><%=rs.getString("qualification_id") %></td>
<td><%=rs.getString("qualification_type") %></td>
<td>
    <form action="editqualification.jsp" method="post">
        <input type="submit" name="edit_qualification" value="Edit" />
        <input type="hidden" name="did" value="<%=rs.getString("qualification_id")%>" />
    </form>
</td>
<td>
    <form action="DeleteQualification" method="post">
        <input type="submit" name="delete_qualification" value="Delete" />
        <input type="hidden" name="qid" value="<%=rs.getString("qualification_id")%>" />
    </form>
</td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<form action="AddQualification" method="post">
<tr bgcolor="#DEB887">
<td><input type="text" name="qid"><br></td>
<td><input type="text" name="qtype"><br></td>
<td><input type="submit" value="Add"></td>
<td></td>
</tr>
</form>

</table>

