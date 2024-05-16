package com.note.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.note.dao.UserDao;
import com.note.dto.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDao dao = new UserDao();
		User user = dao.fetchUserByEmailAndPassword(email, password);
		
		HttpSession session = req.getSession();
		
		if(user != null)
		{
			session.setAttribute("userObj",user);
			resp.sendRedirect("home.jsp");
		}
		else
		{
			session.setAttribute("failure", "Invalid Credentials...");
			resp.sendRedirect("login.jsp");
		}
		
	}
}
