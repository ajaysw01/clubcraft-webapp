package com.aj.admin;
import com.aj.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class AddTeamToTournament
 */
@WebServlet("/AddTeamToTournament")
public class AddTeamToTournament extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int ertId = 0;
		int addTeamToTournament = 0;
		String tcollegeName = request.getParameter("tcollegeName");
		int entryFees=Integer.parseInt(request.getParameter("entryFees"));
		String teamData[] = request.getParameterValues("teamData");
		String game_name = request.getParameter("game_name");
		String team_name = request.getParameter("team_name");
		
		HttpSession hs=request.getSession();
		hs.setAttribute("entryFees", entryFees);
		
		for (String teamMembers : teamData) {
			addTeamToTournament=DatabaseConnection.insertUpdateFromSqlQuery("insert into tblentryregistertournament(ertId,student_name,college_name,game_name,team_name,tournament_college_name)values('"+ertId+"','"+teamMembers+"','"+hs.getAttribute("collegeName")+"','"+game_name+"','"+team_name+"','"+tcollegeName+"')");
		}
		if(addTeamToTournament>0) {
			response.sendRedirect("admin-process-payment.jsp");
		}
	}

}
