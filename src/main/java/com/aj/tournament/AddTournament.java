package com.aj.tournament;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.aj.connection.AES;
import com.aj.connection.DatabaseConnection;

/**
 * Servlet implementation class AddTournament
 */
@WebServlet("/AddTournament")
public class AddTournament extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:/Ajay/Practice/eclipse-workspace/ClubCraft/src/main/webapp/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				int tid = 0;
				String tPlace = null;
				String sDate = null;
				String eDate = null;
				String tWinningPrice = null;
				String tTeamSize = null;
				String gameName = null;
				String gameType = null;
				String tFees = null;
				String collegeName = null;

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem place = (FileItem) multiparts.get(0);
						tPlace = place.getString();

						FileItem sdate = (FileItem) multiparts.get(1);
						sDate = sdate.getString();

						FileItem edate = (FileItem) multiparts.get(2);
						eDate = edate.getString();

						FileItem winningPrice = (FileItem) multiparts.get(3);
						tWinningPrice = winningPrice.getString();

						FileItem teamSize = (FileItem) multiparts.get(4);
						tTeamSize = teamSize.getString();
						
						FileItem college = (FileItem) multiparts.get(5);
						collegeName = college.getString();
						
						FileItem game = (FileItem) multiparts.get(6);
						gameName = game.getString();

						FileItem gType = (FileItem) multiparts.get(7);
						gameType = gType.getString();

						FileItem eFees = (FileItem) multiparts.get(8);
						tFees = eFees.getString();

						

					}
				}
				try {
					String imagePath = UPLOAD_DIRECTORY + imageName;
					int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into tbltournament(tid,place,start_date,end_date,winning_price,team_size,game_name,game_type,tentry_fees,college_name,photo,photo_path) values('"
									+ tid + "','" + tPlace + "','" + sDate + "','" + eDate + "','" + tWinningPrice
									+ "','" + tTeamSize + "','" + gameName + "','" + gameType + "','" + tFees + "','"
									+ collegeName + "','" + imageName + "','" + imagePath + "')");
					if (i > 0) {
						String success = "Tournament added successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("admin-add-tournament.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}

}
