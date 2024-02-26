package com.pk.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/verify")
public class Verify extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usercode =req.getParameter("usercode");
		HttpSession session = req.getSession();

		if(usercode.equals(session.getAttribute("otp"))) {
			req.setAttribute("status", "OTP is Successfully Verified !");
			RequestDispatcher rd1 = req.getRequestDispatcher("ResetPass.jsp");
            rd1.forward(req, resp);
		}else {
			req.setAttribute("status", "Wrong OTP!!");
			RequestDispatcher rd1 = req.getRequestDispatcher("Verify.jsp");
            rd1.forward(req, resp);
			
		}
	}
}
