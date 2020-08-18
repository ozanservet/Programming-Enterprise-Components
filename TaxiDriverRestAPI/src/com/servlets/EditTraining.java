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
import javax.servlet.http.HttpSession;

import javax.naming.InitialContext;
import javax.sql.DataSource;

@WebServlet("/EditTraining")
public class EditTraining extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int t_id = 0;
		HttpSession session = request.getSession();
		t_id= (int)session.getAttribute("tid");
		
		String t_type = request.getParameter("ttype");
		
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
		
		String query = "UPDATE IGNORE Trainings SET training_type=? WHERE training_id=?";
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, t_type);
			ps.setInt(2, t_id);
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
