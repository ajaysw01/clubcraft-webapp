<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	String del = request.getParameter("del");
	//System.out.println("del==>>"+del);
try {
	int deleteCollegeAdmin = DatabaseConnection.insertUpdateFromSqlQuery("delete from tbladmin where id='" + del + "'");
	if (deleteCollegeAdmin > 0) {
		String message = "College admin deleted successfully.";
		session.setAttribute("delAdmin", message);
		response.sendRedirect("super-admin-view-college-admin-list.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>