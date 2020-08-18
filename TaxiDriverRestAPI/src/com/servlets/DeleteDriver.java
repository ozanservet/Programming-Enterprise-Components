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

@WebServlet("/DeleteDriver")
public class DeleteDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String driver_id = request.getParameter("did");
		int dr_id = 0;
		if(driver_id!=null) {
			dr_id =Integer.parseInt(request.getParameter("did"));
		}else {System.out.println("NULL Pointer driver_id class DeleteDriver.java");}
		
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
		
		String query = "DELETE FROM Drivers  WHERE driver_id='" + dr_id + "'";
		try{
			Statement stmt = con.createStatement();
			int rowNum = stmt.executeUpdate(query);
			
			System.out.println(rowNum);
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
