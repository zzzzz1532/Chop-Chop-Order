package com.dao;

import com.model.Category;

public interface CategoryRepositoryCustom {
	public boolean isPersist(Category category);
	
	void detach(Category category);

}
