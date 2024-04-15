package com.aj.admin;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aj.connection.AES;
import com.aj.connection.DatabaseConnection;
import com.aj.email.EmailUtility;

/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password = null;
		String userPassword = "";
		String databaseEmailId = "";
		String resultMessage = "";
		String decryptPassword=null;
		String message = "ClubCraft System Team";
		HttpSession session = request.getSession();
		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tbladmin where email='" + email + "'");
			if (resultset.next()) {
				databaseEmailId = resultset.getString("email");
			}

			if (databaseEmailId.equals(email)) {
				ResultSet resultPassword = DatabaseConnection.getResultFromSqlQuery("select upass from tbladmin where email='" + email + "'");
				if (resultPassword.next()) {
					password = resultset.getString("upass");
					decryptPassword = AES.decrypt(password);
					
					userPassword = "Hi " + email + "," + System.lineSeparator() + System.lineSeparator()+ "Your Admin Login Portal" + System.lineSeparator() + "Password: " + decryptPassword + System.lineSeparator()+ System.lineSeparator() + "Thank you." + System.lineSeparator()+ "ClubCraft System Team.";
					EmailUtility.sendEmail(host, port, "ajaysw45@gmail.com", "vpsdseyokhdvthif", email, message,userPassword);
					resultMessage = "Your login password send successfully in your email.";
					session.setAttribute("mail-success", resultMessage);
					response.sendRedirect("forgot-password.jsp");
				}
			} else {
				String fail = "Your email id is wrong, unable to get password.";
				session.setAttribute("fail", fail);
				response.sendRedirect("forgot-password.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
