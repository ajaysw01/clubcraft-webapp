<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>

<table border="1" class="table">
	<tr>
		<th>Student Name</th>
		<th>College Name</th>
		<th>Game Name</th>
		<th>Team Name</th>
		<th>Register Date</th>
	</tr>
	<%
		String selectedItem = request.getParameter("item");
		System.out.println("selectedItem==>>" + selectedItem);
		ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("SELECT * FROM tblentryregistertournament WHERE game_name = '" + selectedItem + "' and (tournament_college_name='"+session.getAttribute("collegeName")+"' or college_name='"+session.getAttribute("collegeName")+"')");
		try {
			// Display information
			while (resultset.next()) {
				String student_name = resultset.getString("student_name");
				String college_name = resultset.getString("college_name");
				String game_name = resultset.getString("game_name");
				String team_name = resultset.getString("team_name");
				String register_at = resultset.getString("register_at");
		%>
		<tr>
			<td><%=student_name%></td>
			<td><%=college_name%></td>
			<td><%=game_name%></td>
			<td><font color="blue"><h4><%=team_name%></h4></font></td>
			<td><%=register_at%></td>
		</tr>
		<%
			}
		} catch (Exception e) {
				out.println("<p>Error retrieving information: " + e.getMessage() + "</p>");
		}
	%>
</table>