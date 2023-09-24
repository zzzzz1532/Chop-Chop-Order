package com.ispan.eeit69.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Category;

import com.ispan.eeit69.repository.CategoryRepository;

import java.util.List;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

	public Category getCategoryById(Integer id) {
		return categoryRepository.findById(id).orElse(null);
	}

	public void saveCategory(Category Category) {
		categoryRepository.save(Category);
	}

	public void deleteCategory(Integer id) {
		categoryRepository.deleteById(id);
	}
}