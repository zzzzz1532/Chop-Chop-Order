package com.ispan.eeit69.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Category;
import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.repository.CategoryRepository;
import com.ispan.eeit69.repository.ProductRepository;

import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product getProductById(Integer id) {
        return productRepository.findById(id).orElse(null);
    }

    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    public void deleteProduct(Integer id) {
        productRepository.deleteById(id);
    }
    public List<Product> getAllProductsWithCategoryAndLabels() {
        return productRepository.findAllWithCategoryAndLabels();
    }
    @Autowired
    private CategoryRepository categoryRepository; // 假设你有一个 CategoryRepository

    public List<Product> getAllProductsWithCategory() {
        List<Product> products = productRepository.findAll();
        for (Product product : products) {
            Integer categoryId = product.getCategory().getId();
            Category category = categoryRepository.findById(categoryId).orElse(null);
            if (category != null) {
                product.getCategory().setCategoryName(category.getCategoryName());
            }
        }
        return products;
    }
}

