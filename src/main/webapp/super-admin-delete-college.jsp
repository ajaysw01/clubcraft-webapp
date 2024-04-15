<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	int del = Integer.parseInt(request.getParameter("del"));
	//System.out.println("del==>>"+del);
try {
	int deleteCollege = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblcollege where cid='" + del + "'");
	if (deleteCollege > 0) {
		String message = "College deleted successfully.";
		session.setAttribute("delCollege", message);
		response.sendRedirect("super-admin-view-college-list.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>