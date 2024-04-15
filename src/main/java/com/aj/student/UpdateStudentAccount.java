package com.aj.student;

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
 * Servlet implementation class UpdateStudentAccount
 */
@WebServlet("/UpdateStudentAccount")
public class UpdateStudentAccount extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:/Ajay/Practice/eclipse-workspace/ClubCraft/src/main/webapp/uploads/";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String sname = null;
				String email = null;
				String mobile = null;
				String course = null;
				String dob = null;
				String address = null;
				String uname = null;
				String upass = null;
				String collegeName = null;
				String gameName=null;
				String encryptPassword = null;

				for (FileItem item : multiparts) {
					try {
						if (!item.isFormField()) {

							// profile image
							imageName = new File(item.getName()).getName();

							if (imageName != null && !imageName.isEmpty()) {
								item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));
							} else {
								FileItem iName = (FileItem) multiparts.get(11);
								imageName = iName.getString();
							}

						} else {
							
							FileItem studentName = (FileItem) multiparts.get(0);
							sname = studentName.getString();
							

							FileItem semail = (FileItem) multiparts.get(1);
							email = semail.getString();
							

							FileItem smobile = (FileItem) multiparts.get(2);
							mobile = smobile.getString();
							

							FileItem scourse = (FileItem) multiparts.get(3);
							course = scourse.getString();
							

							FileItem sdob = (FileItem) multiparts.get(4);
							dob = sdob.getString();
							

							FileItem saddress = (FileItem) multiparts.get(5);
							address = saddress.getString();
							

							FileItem suname = (FileItem) multiparts.get(6);
							uname = suname.getString();
							

							FileItem supass = (FileItem) multiparts.get(7);
							upass = supass.getString();
							encryptPassword = AES.encrypt(upass);
							

							FileItem scollegeName = (FileItem) multiparts.get(8);
							collegeName = scollegeName.getString();
							
							FileItem game = (FileItem) multiparts.get(9);
							gameName = game.getString();
							
						}
					} catch (Exception exception) {
						//exception.printStackTrace();
					}

				}
				try {
					HttpSession hs = request.getSession();
					String imagePath = UPLOAD_DIRECTORY + imageName;
					System.out.println("imagePath " + imagePath);
					if (!imageName.isEmpty()) {
						int i = DatabaseConnection.insertUpdateFromSqlQuery("update tblstudent set sname='" + sname + "',email='" + email + "',mobile='" + mobile + "',course='"
								+ course + "',dob='" + dob + "',address='" + address + "',college_name='" + collegeName
								+ "',photo='" + imageName + "',photo_path='" + imagePath + "',game_name='"+gameName+"' where uname='"+ hs.getAttribute("uname") + "'");
						if (i > 0) {
							String success = "Student info update successfully.";
							session.setAttribute("message", success);
							response.sendRedirect("student-view-profile.jsp");
						}
					} else {
						int i = DatabaseConnection.insertUpdateFromSqlQuery("update tblstudent set sname='" + sname + "',email='" + email + "',mobile='" + mobile + "',course='"
								+ course + "',dob='" + dob + "',address='" + address + "',college_name='" + collegeName
								+ "',game_name='"+gameName+"' where uname='" + hs.getAttribute("uname") + "'");
						if (i > 0) {
							String success = "Student info update successfully.";
							session.setAttribute("message", success);
							response.sendRedirect("student-view-profile.jsp");
						}
					}

				} catch (Exception e) {
					//e.printStackTrace();
				}
			} catch (Exception ex) {
				//ex.printStackTrace();
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}
}