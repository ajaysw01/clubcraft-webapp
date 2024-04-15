<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	int del = Integer.parseInt(request.getParameter("del"));
	//System.out.println("del==>>"+del);
try {
	int deleteGame = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblgames where gid='" + del + "'");
	if (deleteGame > 0) {
		String message = "Game deleted successfully.";
		session.setAttribute("delGame", message);
		response.sendRedirect("super-admin-game-view-list.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>