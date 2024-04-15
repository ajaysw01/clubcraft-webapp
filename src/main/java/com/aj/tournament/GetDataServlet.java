package com.aj.tournament;

import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.aj.connection.AES;
import com.aj.connection.DatabaseConnection;

/**
 * Servlet implementation class GetDataServlet
 */
@WebServlet("/GetDataServlet")
public class GetDataServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String selectedValue = request.getParameter("selectedValue");
		String result = "";

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblgames where game_name='" + selectedValue + "'");
			// Process the result set
			if (resultset.next()) {
				result = resultset.getString("game_type");
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
