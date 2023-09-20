package com.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dao.ProductRepository;
import com.dao.ProductRepositoryCustom;
import com.model.Category;
import com.model.Label;
import com.model.Product;
import com.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	ProductRepository productRepository;
	ProductRepositoryCustom productRepositoryCustom;
		
	public ProductServiceImpl(ProductRepository productRepository, ProductRepositoryCustom productRepositoryCustom) {
		super();
		this.productRepository = productRepository;
		this.productRepositoryCustom = productRepositoryCustom;
	}

	@Override
	public void resetProductTable() {
		throw new RuntimeException("本系統未提供此功能");		
	}

	@Override
	public void save(Product product) {
		productRepository.save(product);
	}

	@Override
	public boolean existsByProductId(Product product) {
		if (productRepositoryCustom.isPersist(product)) {
			productRepositoryCustom.detach(product);
		}
		Product emp = findByProductId(product.getProductId());
		return emp!= null;
	}

	@Override
	public void update(Product product) {
		productRepository.save(product);		
	}

	@Override
	public void deleteById(Integer id) {
		productRepository.deleteById(id);		
	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Optional<Product> findById(Integer id) {
		return productRepository.findById(id);
	}

	@Override
	public Product findByProductId(String productId) {
		Product emp = productRepository.findByProductId(productId);
		return emp;
	}

	@Override
	public boolean isPersist(Product product) {
		boolean ans = productRepository.existsById(product.getId());
		return ans;
	}

	@Override
	public void detach(Product product) {
		productRepositoryCustom.detach(product);	
	}

	@Override
	public List<Category> getCategoryList() {
		return null;
	}

	@Override
	public List<Label> getLabelList() {
		return null;
	}

	@Override
	public Page<Product> findAll(PageRequest of) {
		return productRepository.findAll(of);
	}
	public List<Product> getNonEmptyProducts(List<Product> products) {
	    List<Product> nonEmptyProducts = new ArrayList<>();
	    for (Product product : products) {
	        if (product != null) {
	            nonEmptyProducts.add(product);
	        }
	    }
	    return nonEmptyProducts;
	}
}
