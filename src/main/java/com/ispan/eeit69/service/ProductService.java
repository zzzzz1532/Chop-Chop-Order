package com.ispan.eeit69.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Category;
import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.repository.CategoryRepository;
import com.ispan.eeit69.repository.ProductRepository;

import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;

    @Autowired
    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
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

    public List<Product> getAllProductsWithCategory() {
        List<Product> products = productRepository.findAll();
        for (Product product : products) {
            try {
                String imageDataUrl = clobToImageDataUrl(product.getPicture());
                product.setImageDataUrl(imageDataUrl);
            } catch (Exception e) {
                // 处理异常
                e.printStackTrace();
            }

            Integer categoryId = product.getCategory().getId();
            Category category = categoryRepository.findById(categoryId).orElse(null);
            if (category != null) {
                product.getCategory().setCategoryName(category.getCategoryName());
            }
        }
        return products;
    }

    private String clobToImageDataUrl(Clob clob) throws SQLException, IOException {
        if (clob != null) {
            try (Reader reader = clob.getCharacterStream()) {
                if (reader != null) {
                    StringBuilder imageData = new StringBuilder();
                    char[] buffer = new char[1024];
                    int bytesRead;
                    while ((bytesRead = reader.read(buffer)) != -1) {
                        imageData.append(buffer, 0, bytesRead);
                    }
                    return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData.toString().getBytes());
                }
            }
        }
        return null;
    }
}

