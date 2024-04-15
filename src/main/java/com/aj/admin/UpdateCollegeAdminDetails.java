package com.aj.admin;
import com.aj.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aj.connection.DatabaseConnection;

/**
 * Servlet implementation class UpdateCollegeAdminDetails
 */
@WebServlet("/UpdateCollegeAdminDetails")
public class UpdateCollegeAdminDetails extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mobile = request.getParameter("mobile");
		System.out.println("Mobile No ==>> " + mobile);
		HttpSession hs = request.getSession();
		System.out.println("Email Id==>> "+hs.getAttribute("email"));
		System.out.println("College Name==>> "+hs.getAttribute("collegeName"));
		try {
			int i = DatabaseConnection.insertUpdateFromSqlQuery("update tbladmin set mobile='" + mobile+ "' where email='"+hs.getAttribute("email")+"' and  college_name='" + hs.getAttribute("collegeName") + "'");
			if (i > 0) {
				String message = "Info edit sucessfully.";
				hs.setAttribute("edit", message);
				response.sendRedirect("admin-profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
