package com.aj.admin;
import com.aj.connection.DatabaseConnection;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AddCollege
 */
@WebServlet("/AddCollege")
public class AddCollege extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String college_name = request.getParameter("college_name");
		HttpSession hs = request.getSession();

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcollege where college_name='" + college_name + "'");
			if (resultset.next()) {
				String message = "Already college name added.";
				hs.setAttribute("alreadyAdded", message);
				response.sendRedirect("super-admin-add-college.jsp");
			} else {
				int addCollege = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblcollege(college_name) values('" + college_name + "')");
				if (addCollege > 0) {
					String message = "College added successfully.";
					hs.setAttribute("success", message);
					response.sendRedirect("super-admin-add-college.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
