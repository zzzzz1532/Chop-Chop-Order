package com.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.dao.CategoryRepositoryCustom;
import com.model.Category;

@Repository
public class CategoryRepositoryCustomimpl implements CategoryRepositoryCustom {
	
	@PersistenceContext
	EntityManager  entityManager;
	
	@Override
	public boolean isPersist(Category category) {
		boolean ans = entityManager.contains(category);
		if(ans)
			return true;
		else
			return false;
	}

	@Override
	public void detach(Category category) {
		entityManager.detach(category);
	}
}
