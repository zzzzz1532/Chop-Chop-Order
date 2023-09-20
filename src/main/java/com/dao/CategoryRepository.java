package com.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	Category findByCategoryId(String categoryId);
	Optional<Category> findById(Integer id);

	@Override
	boolean existsById(Integer id) ;
}
