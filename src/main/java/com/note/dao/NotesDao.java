  package com.note.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.note.dto.Notes;
import com.note.dto.User;

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
		Notes notes = em.find(Notes.class, id);
		
		User user = notes.getUser();
		
		List<Notes> list = user.getNotes();
		
		for(Notes n : list)
		{
			if(n.getId() == id)
			{
				list.remove(n);
				break;
			}
		}
		
		et.begin();
		em.merge(user);
		em.remove(notes);
		et.commit();
	}
}
