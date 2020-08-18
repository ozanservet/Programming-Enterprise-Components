package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.InitialContext;
import javax.sql.DataSource;

@WebServlet("/DeleteTraining")
public class DeleteTraining extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String training_id = request.getParameter("tid");
		int t_id = 0;
		if(training_id!=null)
			t_id =Integer.parseInt(request.getParameter("tid"));
		
		Connection con = null;
		try
		{
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:/MySqlDS");
			con = ds.getConnection();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		String query = "DELETE FROM Trainings  WHERE training_id='" + t_id + "'";
		try{
			Statement stmt = con.createStatement();
			int rowNum = stmt.executeUpdate(query);
			
			System.out.println(rowNum);
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {
				con.close();
				response.sendRedirect("trainings.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
