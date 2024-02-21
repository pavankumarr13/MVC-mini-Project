package com.pk.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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
		String status1="";
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			ps=con.prepareStatement("select * from mvc where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			if(rs.next()) {
				status1="success";
				String id=Integer.toString(rs.getInt("id"));
				String uname=rs.getString("name");
				String em=rs.getString("email");
				se.setAttribute("id", id);
				se.setAttribute("uname", uname);
				se.setAttribute("email", em);
			}else {
				status1="failure";
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return status1;
	}
	
	public String update(String name, String pno, String email) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("update mvc set name='" + name + "',phone='" + pno + "',email='" + email + "' where id= '" + se.getAttribute("id") + "' ");
            se.setAttribute("uname", name);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
	
	public Student getInfo() {
        Statement st = null;
        ResultSet rs = null;
        Student s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from mvc where id= '" + se.getAttribute("id") + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new Student();
                s.setName(rs.getString("name"));
                s.setPhone(rs.getString("phone"));
                s.setEmail(rs.getString("email"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

	public ArrayList<Student> getUserinfo(String id) {
        Statement st = null;
        ResultSet rs = null;
        ArrayList<Student> al = new ArrayList<>();
        try {
            st = con.createStatement();
            String qry = "select * from mvc where id = '" + id + "';";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                Student p = new Student();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setDate(rs.getString("date"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }




}
