package com.aj.admin;

import com.aj.connection.DatabaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminManageStudent")
public class AdminManageStudent extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int statusMode = 0;
		try {

			ResultSet rs = com.aj.connection.DatabaseConnection.getResultFromSqlQuery("select status from tblstudent where sid='" + request.getParameter("id") + "'");
			while (rs.next()) {
				if (rs.getInt("status") == 1) {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblstudent set status=0 where sid='" + request.getParameter("id") + "'");
				} else {
					statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update tblstudent set status=1 where sid='" + request.getParameter("id") + "'");
				}
			}
			if (statusMode > 0) {
				response.sendRedirect("view-user-student-list.jsp");
			} else {
				response.sendRedirect("view-user-student-list.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
