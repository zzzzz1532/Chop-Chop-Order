package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ispan.eeit69.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
	// 自定义查询方法（如果需要的话）
	Category findByCategoryName(String categoryName);
}
