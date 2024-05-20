package com.note.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.note.dao.NotesDao;

@WebServlet("/update")
public class UpdateNotesServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		NotesDao note = new NotesDao();
		
		note.updateNotesById(id);
		
		HttpSession session = req.getSession();
		session.setAttribute("updatesuccess", "Notes Updated Succsssfully...");
		
		resp.sendRedirect("home.jsp");
		
	}
	
}
