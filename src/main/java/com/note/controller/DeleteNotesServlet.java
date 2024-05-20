package com.note.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.note.dao.NotesDao;

@WebServlet("/delete_note")
public class DeleteNotesServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		NotesDao dao = new NotesDao();
		
		dao.deleteNotesById(id);
		
		resp.sendRedirect("home.jsp");
		
	}
}
