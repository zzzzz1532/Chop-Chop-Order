package com.ispan.eeit69.service;

import java.math.BigDecimal;
import java.util.List;

import com.ispan.eeit69.model.Product;

public interface ProductService {

	List<Product> getAllProducts();

	Product getProductById(Integer id);

	void saveProduct(Product product);

	void deleteProduct(Integer id);

	List<Product> getAllProductsWithCategoryAndLabels();

	List<Product> getAllProductsWithCategory();
	//根據產品ID查詢產品價格
	BigDecimal getProductPriceById(Integer id);

}