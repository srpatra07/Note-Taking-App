package com.note.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.note.dao.UserDao;
import com.note.dto.Notes;
import com.note.dto.User;

@WebServlet("/add_notes")
public class AddNotesServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title"); 
		String description = req.getParameter("description");
		
		Notes note = new Notes();
		note.setTitle(title);
		note.setDescription(description);
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("userObj");
		
		List<Notes> list = new ArrayList<Notes>();
		list.add(note);
		
		user.setNotes(list);
		note.setUser(user);
		
		UserDao dao = new UserDao();
		dao.saveAndUpdateUser(user);
		
		session.setAttribute("success", "Notes added successfully");
		
		resp.sendRedirect("home.jsp");
		
	}
}
