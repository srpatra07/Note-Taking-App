package com.note.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.note.dto.User;

public class UserDao {
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("swarup");
	
	EntityManager em = emf.createEntityManager();
	
	EntityTransaction et = em.getTransaction();

	public void saveAndUpdateUser(User user)
	{
		et.begin();
		em.merge(user);
		et.commit();
	}
	
	public User fetchUserById(int id)
	{
		User user = em.find(User.class, id);
		return user;
	}
	
	public List<User> fetchAllUsers()
	{
		Query query = em.createQuery("select s from User s");
		List<User> users = query.getResultList();
		return users;
	}
	
	public User fetchUserByEmailAndPassword(String email, String password)
	{
		Query query = em.createQuery("select s from User s where s.email = ? and s.password = ?");
		
		query.setParameter(1, email);
		query.setParameter(2, password);
		
		List<User> user = query.getResultList();
		
		if(user.get(0) != null)
		{
			return user.get(0);
		}

		return null;
	}
}
