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

@WebServlet("/AddSession")
public class AddSession extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String trainingid = request.getParameter("tid");
		int t_id = 0;
		if(trainingid!=null)
			t_id= Integer.parseInt(request.getParameter("tid"));
		
		String[] startdt = request.getParameterValues("s_d");
		String[] enddt = request.getParameterValues("e_d");
		String[] expiredt = request.getParameterValues("c_e_d");
		String sd ="";
		String ed ="";
		String ced="";
		sd = startdt[0];
		ed = enddt[0];
		ced = expiredt[0];
		
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
		
		String query = "UPDATE Trainings SET session_start_date=?, session_end_date=?, certificate_expire_date=? WHERE training_id=?";
		
		try{
			ps=con.prepareStatement(query);
			ps.setDate(1, java.sql.Date.valueOf(sd));
			ps.setDate(2, java.sql.Date.valueOf(ed));
			ps.setDate(3, java.sql.Date.valueOf(ced));
			ps.setInt(4, t_id);
			int i = ps.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
					response.sendRedirect("sessions.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

}
