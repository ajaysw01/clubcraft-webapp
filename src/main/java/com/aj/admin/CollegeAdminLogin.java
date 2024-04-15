package com.aj.admin;
import com.aj.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

import com.aj.connection.AES;

/**
 * Servlet implementation class CollegeAdminLogin
 */
@WebServlet("/CollegeAdminLogin")
public class CollegeAdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String encryptPassword = null;
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
		try {
			encryptPassword = AES.encrypt(password);
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery(
					"select * from tbladmin where email='" + email + "' and upass='" + encryptPassword + "'");
			if (resultset.next()) {
				if (resultset.getInt("role") == 1) {
					hs.setAttribute("email", resultset.getString("email"));
					hs.setAttribute("fullName", resultset.getString("fullname"));
					hs.setAttribute("collegeName", resultset.getString("college_name"));
					response.sendRedirect("admin-dashboard.jsp");
				} else {
					hs.setAttribute("email", resultset.getString("email"));
					hs.setAttribute("fullName", resultset.getString("fullname"));
					hs.setAttribute("collegeName", resultset.getString("college_name"));
					response.sendRedirect("super-admin-dashboard.jsp");
				}
			} else {
				String message = "Invalid login details, please enter valid details";
				hs.setAttribute("message", message);
				response.sendRedirect("admin-login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
