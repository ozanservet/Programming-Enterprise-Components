package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.naming.InitialContext;
import javax.sql.DataSource;

@WebServlet("/Outcome")
public class Outcome extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String drv_id = request.getParameter("did");
		int d_id = 0;
		if(drv_id!=null)
			d_id= Integer.parseInt(drv_id);
		
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
		ResultSet rs = null;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String query = "SELECT * FROM Trainings WHERE session_start_date <= ? AND training_id IN ( Select training_id from Sessions WHERE driver_id=?)";
				
		ArrayList<String> tlist = new ArrayList<String>();
		try{
			ps = con.prepareStatement(query);
			ps.setDate(1, java.sql.Date.valueOf(dateFormat.format(date)));
			ps.setInt(2,d_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String ts = rs.getString("training_type");
				tlist.add(ts);
			}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		request.setAttribute("tlist", tlist);
		request.setAttribute("driver_id", d_id);

		request.getRequestDispatcher("outcome.jsp").forward(request,response);
		
	}

}
