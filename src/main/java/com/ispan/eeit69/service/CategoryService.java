package com.ispan.eeit69.service;

import java.util.List;

import com.ispan.eeit69.model.Category;

public interface CategoryService {

	List<Category> getAllCategories();

	Category getCategoryById(Integer id);

	void saveCategory(Category Category);

	void deleteCategory(Integer id);

}