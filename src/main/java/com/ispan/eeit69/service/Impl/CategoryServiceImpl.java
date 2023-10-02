package com.ispan.eeit69.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Category;

import com.ispan.eeit69.repository.CategoryRepository;
import com.ispan.eeit69.service.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
	public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

	@Override
	public Category getCategoryById(Integer id) {
		return categoryRepository.findById(id).orElse(null);
	}

	@Override
	public void saveCategory(Category Category) {
		categoryRepository.save(Category);
	}

	@Override
	public void deleteCategory(Integer id) {
		categoryRepository.deleteById(id);
	}
}