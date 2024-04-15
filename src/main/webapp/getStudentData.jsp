<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	String selectedValue = request.getParameter("selectedValue");
	try {
		ResultSet rs = DatabaseConnection.getResultFromSqlQuery("SELECT * FROM tblstudent WHERE game_name ='" + selectedValue + "' and college_name='"+session.getAttribute("collegeName")+"'");
		// Generate HTML for data list with checkboxes
		StringBuilder html = new StringBuilder();
		html.append("<ul>");
		while (rs.next()) {
			html.append("<li><input type='checkbox' name='dataItem' value='" + rs.getString("sname") + "'> "
			+ rs.getString("sname") + "</li>");
		}
		html.append("</ul>");
		// Send HTML response
		out.print(html.toString());
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
