package com.aj.student;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aj.connection.AES;
import com.aj.connection.DatabaseConnection;
/**
 * Servlet implementation class AddFeedback
 */
@WebServlet("/AddFeedback")
public class AddFeedback extends HttpServlet {
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fid = 0;
		String sid=null;
		String studentName=request.getParameter("studentName");
		String collegeName=request.getParameter("collegeName");
		String feedback = request.getParameter("feedback");
		double ratings = Double.parseDouble(request.getParameter("rating"));
		HttpSession hs=request.getSession();
		
		try {
			int addQuestion = DatabaseConnection.insertUpdateFromSqlQuery("insert into tblfeedback(fid,student_name,college_name,description,ratings)values('"
							+ fid + "','" + studentName + "','"+collegeName+"','" + feedback + "','" + ratings + "')");
			if (addQuestion > 0) {
				String message = "Feedback submitted successfully.";
				hs.setAttribute("feedback", message);
				response.sendRedirect("student-give-feedback.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
