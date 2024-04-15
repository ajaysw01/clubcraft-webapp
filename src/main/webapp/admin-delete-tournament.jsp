<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.aj.connection.*"%>
<%
	int del=Integer.parseInt(request.getParameter("del"));
	//System.out.println("del==>>"+del);
	try{
		int deleteTournament=DatabaseConnection.insertUpdateFromSqlQuery("delete from tbltournament where tid='"+del+"' and college_name='"+session.getAttribute("collegeName")+"'");
		if(deleteTournament>0){
			String delTournament="Tournament Information deleted successfully.";
			session.setAttribute("delTournament", delTournament);
			response.sendRedirect("admin-mange-tournament.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>