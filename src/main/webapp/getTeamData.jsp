<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	String selectedValue = request.getParameter("selectedValue");
	try {
		ResultSet rs = DatabaseConnection.getResultFromSqlQuery("SELECT * FROM tblteam WHERE team_name ='" + selectedValue + "' and college_name='"+session.getAttribute("collegeName")+"'");
		// Generate HTML for data list with checkboxes
		StringBuilder html = new StringBuilder();
		String teamName = null;
		html.append("<ul>");
		while (rs.next()) {
			html.append("<li><input type='checkbox' name='teamData' value='" + rs.getString("student_name") + "'> "
			+ rs.getString("student_name") + "</li>");
		}
		html.append("</ul>");
		
		// Send HTML response
		out.print(html.toString());
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
