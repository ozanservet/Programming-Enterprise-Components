<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>

<%
	if(session.getAttribute("username") == null)
	{
		response.sendRedirect("login.jsp");
	}
%>
<%

int d_id = (int) request.getAttribute("driver_id");
ArrayList<String> tarrlist = (ArrayList<String>) request.getAttribute("tlist");

%>

<h2 align="center"><font><strong>Write your comment</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<form action="AddOutcome" method="post">

<tr bgcolor="#A52A2A">
<td><b>driver number plate</b></td>
<td><b>training type</b></td>
<td><b>outcome</b></td>
<td><b>option</b></td>
</tr>
<tr bgcolor="#DEB887">
	<td><input type="text" name="did" disable value="<%=d_id%>"/></td>
	<td>
	<select name="selectedtype">
<%

String outcometext = "";
for(String s : tarrlist){
%>

	<option value="<%=s%>"><%=s%></option>
	
<% 
}
%>
</select>
	</td>
	<td ><input type="text" name="outcome"></td>
	<td>
		<input type="submit" value="Add" />
		 <input type="hidden" name="d_id" value="d_id" />
	</td>
	
</tr>
</form>
</table>

