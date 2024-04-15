package com.aj.tournament;
import com.aj.connection.DatabaseConnection;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class EditTournamentInfo
 */
@WebServlet("/EditTournamentInfo")
public class EditTournamentInfo extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int tid = Integer.parseInt(request.getParameter("tid"));
		String tplace = request.getParameter("tplace");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String game_name = request.getParameter("game_name");
		String textbox = request.getParameter("textbox");
		String collegeName = request.getParameter("collegeName");
		int teamSize = Integer.parseInt(request.getParameter("teamSize"));
		int eFees = Integer.parseInt(request.getParameter("eFees"));
		double winPrice = Double.parseDouble(request.getParameter("winPrice"));
		HttpSession hs = request.getSession();
		try {
			int editTournament=DatabaseConnection.insertUpdateFromSqlQuery("update tbltournament set place='"+tplace+"',start_date='"+sdate+"',end_date='"+edate+"',winning_price='"+winPrice+"',team_size='"+teamSize+"',game_name='"+game_name+"',game_type='"+textbox+"',tentry_fees='"+eFees+"' where tid='"+tid+"' and college_name='"+hs.getAttribute("collegeName")+"'");
			if(editTournament>0) {
				String edit="Information edit successfully.";
				hs.setAttribute("editMessage", edit);
				response.sendRedirect("admin-mange-tournament.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
