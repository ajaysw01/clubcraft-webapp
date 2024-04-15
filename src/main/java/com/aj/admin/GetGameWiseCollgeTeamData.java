package com.aj.admin;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aj.connection.DatabaseConnection;

/**
 * Servlet implementation class GetGameWiseCollgeTeamData
 */
@WebServlet("/GetGameWiseCollgeTeamData")
public class GetGameWiseCollgeTeamData extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String selectedValue = request.getParameter("selectedValue");
		String result = "";

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblstudent where game_name='" + selectedValue + "'");
			// Process the result set
			if (resultset.next()) {
				result = resultset.getString("sname");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// Send the response back
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(result);
	}

}
