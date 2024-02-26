package com.pk.controller;

import java.io.IOException;

import com.pk.model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class Delete extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session=req.getSession();
			Registration reg=new Registration(session);
			int id=Integer.parseInt(req.getParameter("userid"));
			System.out.println(id+"-------id ");
			String status=reg.delete(id);
			if(status.equals("sucess")) {
				req.setAttribute("status", "Account Deleted Sucessfully");
				RequestDispatcher re=req.getRequestDispatcher("Delete.jsp");
				re.forward(req, resp);
			}else {
				req.setAttribute("status", "Failure Occured");
				RequestDispatcher re=req.getRequestDispatcher("Delete.jsp");
				re.forward(req, resp);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}
}
