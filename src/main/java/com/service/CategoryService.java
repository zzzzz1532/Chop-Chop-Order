package com.service;

import java.util.List;
import java.util.Optional;

import com.model.Category;

public interface CategoryService {
	void resetCategoryTable();
	
	void save(Category category);
	boolean existsByCategoryId(Category category);
	boolean isPersist(Category category);	
	void detach(Category category);
	
	void update(Category category);
	
	void deleteById(Integer id);
	
	List<Category> findAll();
	Optional<Category> findById(Integer id);	
	Category findByCategoryId(String categoryId);
	
}
