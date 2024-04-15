package com.aj.student;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

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
 * Servlet implementation class StudentAccount
 */
@WebServlet("/StudentAccount")
public class StudentAccount extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "C:/Ajay/Practice/eclipse-workspace/ClubCraft/src/main/webapp/uploads/";
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				int status = 1;
				String imageName = null;
				String sid = null;
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
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem studentId = (FileItem) multiparts.get(0);
						sid = studentId.getString();

						FileItem studentName = (FileItem) multiparts.get(1);
						sname = studentName.getString();

						FileItem semail = (FileItem) multiparts.get(2);
						email = semail.getString();

						FileItem smobile = (FileItem) multiparts.get(3);
						mobile = smobile.getString();

						FileItem scourse = (FileItem) multiparts.get(4);
						course = scourse.getString();

						FileItem sdob = (FileItem) multiparts.get(5);
						dob = sdob.getString();

						FileItem saddress = (FileItem) multiparts.get(6);
						address = saddress.getString();

						FileItem suname = (FileItem) multiparts.get(7);
						uname = suname.getString();

						FileItem supass = (FileItem) multiparts.get(8);
						upass = supass.getString();
						encryptPassword = AES.encrypt(upass);
						System.out.println("encryptPassword"+encryptPassword);

						FileItem scollegeName = (FileItem) multiparts.get(9);
						collegeName = scollegeName.getString();
						
						FileItem game = (FileItem) multiparts.get(10);
						gameName = game.getString();

					}
				}
				try {
					String imagePath = UPLOAD_DIRECTORY + imageName;
					int i = DatabaseConnection.insertUpdateFromSqlQuery(
							"insert into tblstudent(sid,sname,email,mobile,course,dob,address,photo,photo_path,uname,upass,college_name,game_name,status) values('"
									+ sid + "','" + sname + "','" + email + "','" + mobile + "','" + course + "','"
									+ dob + "','" + address + "','" + imageName + "','" + imagePath + "','" + uname
									+ "','" + encryptPassword + "','" + collegeName + "','"+gameName+"','"+status+"')");
					if (i > 0) {
						String success = "Student added successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("student-register.jsp");
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
