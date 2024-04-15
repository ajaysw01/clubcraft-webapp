<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	String del = request.getParameter("del");
	//System.out.println("del==>>"+del);
try {
	int deleteStudent = DatabaseConnection.insertUpdateFromSqlQuery("delete from tblstudent where sid='" + del + "'");
	if (deleteStudent > 0) {
		String message = "Student deleted successfully.";
		session.setAttribute("delStudent", message);
		response.sendRedirect("super-admin-view-students-list.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>