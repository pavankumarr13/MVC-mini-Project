package com.pk.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.pk.model.Registration;
@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet {
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		try {

			if(request.getParameter("register")!=null) {
				String name =request.getParameter("name");
				String phone =request.getParameter("phone");
				String email =request.getParameter("email");
				String pw =request.getParameter("pw");
				String cp=request.getParameter("cp");

				if(pw.equals(cp)) {
					String status = reg.Registration(name, phone, email, pw);


					if (status.equals("existed")) {

						request.setAttribute("status", "Existed record");
						RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
						rd1.forward(request, response);

					} else if (status.equals("success")) {

						request.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					} else{

						request.setAttribute("status", "Registration failed");
						RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
						rd1.forward(request, response);
					}
				}
			}

		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
