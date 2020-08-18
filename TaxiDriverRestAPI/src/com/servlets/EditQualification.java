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

@WebServlet("/EditQualification")
public class EditQualification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String qualification_id = request.getParameter("qid");
		String q_type = request.getParameter("qtype");
		int q_id = 0;
		if(qualification_id!=null)
			q_id =Integer.parseInt(request.getParameter("qid"));
		
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
		
		String query = "UPDATE Qualifications SET qualification_type=? WHERE qualification_id=?";
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, q_type);
			ps.setInt(2, q_id);
			int i = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			try {
				con.close();
				response.sendRedirect("qualifications.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
