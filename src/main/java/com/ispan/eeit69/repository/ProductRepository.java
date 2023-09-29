package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.List;

import com.ispan.eeit69.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	// 在這裡可以定義自訂的查詢方法

	// ProductRepository.java
	@Query("SELECT p FROM Product p JOIN FETCH p.category JOIN FETCH p.labels")
	List<Product> findAllWithCategoryAndLabels();

	Product findByProductName(String productName);
	Product findByProductPrice(BigDecimal productPrcie);
	Product findByProductId(String productId);
	

}
