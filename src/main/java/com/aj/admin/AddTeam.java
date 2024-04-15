package com.aj.admin;
import com.aj.connection.DatabaseConnection;
import com.aj.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 * Servlet implementation class AddTeam
 */
@WebServlet("/AddTeam")
public class AddTeam extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String teamName = request.getParameter("teamName");
		String collegeName = request.getParameter("collegeName");
		String game_name = request.getParameter("game_name");
		String dataItem[] = request.getParameterValues("dataItem");
		HttpSession hs = request.getSession();
		try {
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblteam where team_name='" + teamName + "'");
			if (resultset.next()) {
				String team = "Team already added.";
				hs.setAttribute("team-error", team);
				response.sendRedirect("admin-add-team.jsp");
			} else {
				for (String studentName : dataItem) {
					int addTeam = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblteam(team_name,college_name,student_name,game_name) values('" + teamName
									+ "','" + collegeName + "','" + studentName + "','" + game_name + "')");
				}
				String message = "Team added successfully.";
				hs.setAttribute("team", message);
				response.sendRedirect("admin-add-team.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
