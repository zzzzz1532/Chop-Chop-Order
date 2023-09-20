package com.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.dao.LabelRepositoryCustom;
import com.model.Label;

@Repository
public class LabelRepositoryCustomimpl implements LabelRepositoryCustom {
	
	@PersistenceContext
	EntityManager  entityManager;
	
	@Override
	public boolean isPersist(Label label) {
		boolean ans = entityManager.contains(label);
		if(ans)
			return true;
		else
			return false;
	}

	@Override
	public void detach(Label label) {
		entityManager.detach(label);
	}
}
