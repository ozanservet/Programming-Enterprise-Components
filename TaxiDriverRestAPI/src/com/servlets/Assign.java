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

@WebServlet("/Assign")
public class Assign extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	     String driver_id = request.getParameter("did");
			int dr_id = 0;
			if(driver_id!=null) {
				dr_id =Integer.parseInt(request.getParameter("did"));
			}
			
		     String training_id = request.getParameter("tid");
				int tr_id = 0;
				if(training_id!=null) {
					tr_id =Integer.parseInt(request.getParameter("tid"));
				}
			
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
			
			String query = "INSERT INTO Sessions (training_id, driver_id) VALUES (?,?)";
			try{
				
				ps=con.prepareStatement(query);
				ps.setInt(1, tr_id);
				ps.setInt(2, dr_id);
				ps.executeUpdate();
				
			}catch(Exception e) {
				System.out.println(e);
			}finally {
				try {
					con.close();
					response.sendRedirect("assign.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}

}
