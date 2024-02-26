package com.pk.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.pk.model.Registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/register")
public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		try {

			if (request.getParameter("register") != null) {
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				String cp = request.getParameter("cp");

				if (pw.equals(cp)) {
					String status = reg.Registration(name, phone, email, pw);

					if (status.equals("existed")) {

						request.setAttribute("status", "Existed record");
						RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
						rd1.forward(request, response);

					} else if (status.equals("success")) {

						request.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					} else {

						request.setAttribute("status", "Registration failed");
						RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
						rd1.forward(request, response);
					}
				}
			} else if (request.getParameter("login") != null) {
				String mail = request.getParameter("em");
				String pass = request.getParameter("pass");
				String status = reg.login(mail, pass);
				System.out.println(status);
				if (status.equals("success")) {
					request.setAttribute("status", "Login Succesfully!");
					RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
					rd1.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Login failed");
					RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("logout") != null) {
//				session.invalidate();
//				RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
//				rd1.forward(request, response);
				doGet(request, response);
			} else if (session.getAttribute("uname") != null && request.getParameter("submit") != null) {
				String name = request.getParameter("uname");
				String pno = request.getParameter("phone");
				String email = request.getParameter("email");
				Registration u = new Registration(session);
				String status = u.update(name, pno, email);
				if (status.equals("success")) {
					request.setAttribute("status", "Profile successfully Updated");
					RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
					rd1.forward(request, response);
				} else {
					request.setAttribute("status", "Updation failure");
					RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("reset") != null) {
				String email = (String) session.getAttribute("useremail");
				String newPass = request.getParameter("newPW");
				String confirmPass = request.getParameter("confirmPW");
				if(newPass.equals(confirmPass)) {
					boolean check=reg.updatePassword(email, confirmPass);
					if(check) {
						System.out.println("Password Update successfully!!");
						request.setAttribute("status", "Password Update successfully!!");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);
					}else {
						System.out.println("Password Update failed");
						request.setAttribute("status", "Password Update failed !!");
						RequestDispatcher rd1 = request.getRequestDispatcher("ResetPass.jsp");
						rd1.forward(request, response);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession se = request.getSession();
		if (request.getParameter("logout") != null) {
			se.invalidate();
			RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
			rd1.forward(request, response);
		}
	}

}
