package com.pk.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.http.HttpSession;

public class Registration {
	private Connection con=null;
	HttpSession se=null;

	public Registration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
			con = 
					DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc", 
							"root", "tiger");
			// connection with data base
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String Registration(String name, String phone, String email, String pw) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from mvc where phone='" + phone 
					+ "' or email='" + email + "'");
			boolean b = rs.next();
			if (b) {
				status = "existed";
			} else {
				ps = (PreparedStatement) con.prepareStatement("insert into mvc values(0,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, email);
				ps.setString(4, pw);
				int a = ps.executeUpdate();
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public String login(String email,String pass) {
		String status="";
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement("select * from mvc where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			if(rs.next()) {
				status="success";
				String id=Integer.toString(rs.getInt("id"));
				String uname=rs.getString("name");
				se.setAttribute("id", id);
				se.setAttribute("uname", uname);
			}else {
				status="failure";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}


}
