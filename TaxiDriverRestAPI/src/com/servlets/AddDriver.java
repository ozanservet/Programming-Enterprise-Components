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

@WebServlet("/AddDriver")
public class AddDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String driver_id = request.getParameter("did");
		String dr_name = request.getParameter("dname");
		String dr_address = request.getParameter("daddress");
		String dr_phone = request.getParameter("dphone");
		int dr_id = 0;
		if(driver_id!=null)
			dr_id =Integer.parseInt(request.getParameter("did"));
		
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
		
		String query = "INSERT INTO Drivers (driver_id, driver_name, driver_address, driver_phone) VALUES (?, ?, ?, ?)";
		try{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, dr_id);
			ps.setString(2, dr_name);
			ps.setString(3, dr_address);
			ps.setString(4, dr_phone);
			int i = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {
				con.close();
				response.sendRedirect("drivers.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
