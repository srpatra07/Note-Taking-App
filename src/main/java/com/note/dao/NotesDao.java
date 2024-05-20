package com.note.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.note.dto.Notes;

public class NotesDao {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("swarup");
	
	EntityManager em = emf.createEntityManager();
	
	EntityTransaction et = em.getTransaction();
	
	
	public Notes fetchNotesById(int id)
	{
		Notes note = em.find(Notes.class, id);
		return note;
	}
	
	public List<Notes> fetchAllNotes()
	{
		Query query = em.createQuery("select n from Notes n");
		
		List<Notes> notes = query.getResultList();
		
		return notes;
	}
	
	public void updateNotesById(int id)
	{
		Notes note = em.find(Notes.class, id);
		
		et.begin();
		em.merge(note);
		et.commit();
	}
	
	public void deleteNotesById(int id)
	{
		Notes note = em.find(Notes.class, id);
		
		et.begin();
		em.remove(note);
		et.commit();
	}
}
