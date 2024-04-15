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
 * Servlet implementation class AddGame
 */
@WebServlet("/AddGame")
public class AddGame extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String game_name = request.getParameter("game_name");
		String game_type = request.getParameter("game_type");
		HttpSession hs = request.getSession();

		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblgames where game_name='" + game_name + "'");
			if (resultset.next()) {
				String message = "Already Game Added.";
				hs.setAttribute("alreadyAdded", message);
				response.sendRedirect("super-admin-add-games.jsp");
			} else {
				int addGame = DatabaseConnection.insertUpdateFromSqlQuery(
						"insert into tblgames(game_name,game_type) values('" + game_name + "','" + game_type + "')");
				if (addGame > 0) {
					String message = "Game added successfully.";
					hs.setAttribute("success", message);
					response.sendRedirect("super-admin-add-games.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
