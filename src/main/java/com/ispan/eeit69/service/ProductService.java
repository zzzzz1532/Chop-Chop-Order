package com.ispan.eeit69.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.ispan.eeit69.model.Category;
import com.ispan.eeit69.model.Label;
import com.ispan.eeit69.model.Product;

public interface ProductService {
	void resetProductTable();                        //重製
	
	//Interface CrudRepository<T,ID>
	void save(Product product);                      //create
	boolean existsByProductId(Product product);  //檢查資料是否存在
	boolean isPersist(Product product);	
	void detach(Product product);
	
	void update(Product product);                   //update
	
	void deleteById(Integer id);                    //delete
	
	List<Product> findAll();                          //read	
	Optional<Product>findById(Integer id);        //read
	Product findByProductId(String productId);
	
	List<Category> getCategoryList();
	List<Label> getLabelList();

	Page<Product> findAll(PageRequest of);
	List<Product> getNonEmptyProducts(List<Product> products);

	List<Product> searchProducts(String keyword);

}
