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
@WebServlet(urlPatterns = "/login")
public class Login extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		try {
			if (request.getParameter("login") != null) {
				String mail = request.getParameter("em");
				String pass = request.getParameter("pass");
				String status = reg.login(mail, pass);
				System.out.println(status);
				if (status.equals("success")) {
					request.setAttribute("status", status);
					RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
					rd1.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Login failed");
					RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("logout") != null) {
				session.invalidate();
				RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
				rd1.forward(request, response);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
