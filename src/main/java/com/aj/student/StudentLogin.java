package com.aj.student;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aj.connection.AES;
import com.aj.connection.DatabaseConnection;

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String vercode = request.getParameter("vercode");
		String captchaDB = null;
		String encryptPassword = null;
		try {
			encryptPassword = AES.encrypt(upass);
			System.out.println("encryptPassword==>" + encryptPassword);

			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			HttpSession hs = request.getSession();
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			if (captchaDB.equals(vercode)) {
				ResultSet resultset = st.executeQuery("select * from tblstudent where uname='" + uname + "' OR email='"+uname+"' and upass='" + encryptPassword +"'");
				if (resultset.next()) {
					if (resultset.getInt("status") == 1) {
						hs.setAttribute("uname", resultset.getString("uname"));
						hs.setAttribute("email", resultset.getString("email"));
						hs.setAttribute("sname", resultset.getString("sname"));
						hs.setAttribute("college_name", resultset.getString("college_name"));
						int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("student-dashboard.jsp");
					} else {
						String message = "Account not activated please inform admin to activate account.";
						hs.setAttribute("account-activation", message);
						int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
						response.sendRedirect("student-login.jsp");
					}
				} else {
					String message = "You have enter wrong credentials";
					hs.setAttribute("credential", message);
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
					response.sendRedirect("student-login.jsp");
				}
			} else {
				String message = "You have enter invalid verification code";
				hs.setAttribute("verificationCode", message);
				int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='" + newRandomCaptcha + "'");
				response.sendRedirect("student-login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
