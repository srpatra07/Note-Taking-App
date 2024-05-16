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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String mobile = req.getParameter("mobile");
		
		User user = new User();
		user.setName(name);
		user.setAge(Integer.parseInt(age));
		user.setEmail(email);
		user.setPassword(password);
		user.setMobile(Long.parseLong(mobile));
		
		UserDao dao = new UserDao();
		dao.saveAndUpdateUser(user);
		
		HttpSession session = req.getSession();
		session.setAttribute("success", "Registration Successfully...");
		
		resp.sendRedirect("register.jsp");
		
	}
}
