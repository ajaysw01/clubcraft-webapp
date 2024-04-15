package com.aj.contact;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aj.connection.AES;
import com.aj.connection.DatabaseConnection;
/**
 * Servlet implementation class AddContact
 */
@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;
		HttpSession hs = request.getSession();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		try {
			int help = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcontact(cid,name,email,subject,message)values('"
							+ id + "','" + name + "','" + email + "','" + subject + "','" + message + "')");
			if (help > 0) {
				String contactMessage = "Thanks for contacting us! We will get in touch with you.";
				hs.setAttribute("message", contactMessage);
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
