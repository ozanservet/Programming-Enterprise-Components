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

@WebServlet("/AddOutcome")
public class AddOutcome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String driverid = request.getParameter("did");
		int drv_id = 0;
		if(driverid!=null)
			drv_id= Integer.parseInt(driverid);
		
		String t_type = request.getParameter("selectedtype");
		String ses_outcome = request.getParameter("outcome");
		
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

		String query = "UPDATE Sessions SET s_outcome=? WHERE driver_id=? AND training_id IN (SELECT training_id FROM Trainings where training_type=?)";
		
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, ses_outcome);
			ps.setInt(2, drv_id);
			ps.setString(3, t_type);
			int i = ps.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (con != null) {
				try {
					con.close();
					response.sendRedirect("driveroutcome.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
