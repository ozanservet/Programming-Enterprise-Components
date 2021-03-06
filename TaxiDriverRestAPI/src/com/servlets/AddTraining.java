package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.InitialContext;
import javax.sql.DataSource;

@WebServlet("/AddTraining")
public class AddTraining extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String training_id = request.getParameter("tid");
		String training_type = request.getParameter("ttype");
		int tr_id = 0;
		if(training_id!=null)
			tr_id =Integer.parseInt(request.getParameter("tid"));
		
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
		
		PreparedStatement ps = null;
		
		String query = "INSERT INTO Trainings (training_id, training_type) VALUES (?, ?)";
		try{
			ps=con.prepareStatement(query);
			ps.setInt(1, tr_id);
			ps.setString(2, training_type);
			int i = ps.executeUpdate();
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
