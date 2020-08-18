<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.RequestDispatcher"%>

<%
	if(session.getAttribute("username") == null)
	{
		response.sendRedirect("login.jsp");
	}
%>
<%
ArrayList<String> tlist = (ArrayList<String>) request.getAttribute("tidlist");
ArrayList<String> qlist = (ArrayList<String>) request.getAttribute("qidlist");
int driver_id = (int) request.getAttribute("driver_id");

for (String i : tlist) {
	System.out.println(i);
}

for (String j : qlist) {
	System.out.println(j);
}

%>

<h2 align="center"><font><strong>Driver's Qualification and Training List</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr bgcolor="#A52A2A">
<td><b>driver number plate</b></td>
<td><b>name</b></td>
<td><b>definition</b></td>
</tr>

<%
for (String i : tlist) {

%>

<tr bgcolor="#DEB887">
<td><%out.println(driver_id);%></td>
<td>training: </td>
<td><%out.println(i);%></td>
</tr>

<%
}
%>

<%
for (String i : qlist) {

%>

<tr bgcolor="#DEB887">
<td><%out.println(driver_id);%></td>
<td>qualification: </td>
<td><%out.println(i);%></td>
</tr>

<%
}
%>

</table>

