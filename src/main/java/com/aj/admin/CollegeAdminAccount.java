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


@WebServlet("/CollegeAdminAccount")
public class CollegeAdminAccount extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int role = 1;
		String encryptPassword = null;
		String adminId = null;
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String collegeName = request.getParameter("collegeName");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();

		try {
			encryptPassword = AES.encrypt(password);
			System.out.println("encryptPassword" + encryptPassword);
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where college_name='" + collegeName + "'");
			if (resultset.next()) {
				String message="Already college admin registered.";
				hs.setAttribute("alreadyRegistered", message);
				response.sendRedirect("college-admin-register.jsp");
			} else {
				adminId = DatabaseConnection.generateCollegeAdminId();
				int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into tbladmin(id,fullname,email,mobile,college_name,upass,role)values('"
								+ adminId + "','" + fullname + "','" + email + "','" + mobile + "','" + collegeName
								+ "','" + encryptPassword + "','" + role + "')");
				if (i > 0) {
					String message = "Account created successfully.";
					hs.setAttribute("account-success", message);
					response.sendRedirect("college-admin-register.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
