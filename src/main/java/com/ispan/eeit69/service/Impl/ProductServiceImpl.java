package com.ispan.eeit69.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Category;
import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.repository.CategoryRepository;
import com.ispan.eeit69.repository.ProductRepository;
import com.ispan.eeit69.service.ProductService;

import java.io.IOException;
import java.io.Reader;
import java.math.BigDecimal;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository, CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
    }

    @Override
	public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
	public Product getProductById(Integer id) {
        return productRepository.findById(id).orElse(null);
    }

    @Override
	public void saveProduct(Product product) {
        productRepository.save(product);
    }

    @Override
	public void deleteProduct(Integer id) {
        productRepository.deleteById(id);
    }

    @Override
	public List<Product> getAllProductsWithCategoryAndLabels() {
        return productRepository.findAllWithCategoryAndLabels();
    }

    
    //
    @Override
	public List<Product> getAllProductsWithCategory() {
        List<Product> products = productRepository.findAll();
        for (Product product : products) {
            try {
                String imageDataUrl = clobToImageDataUrl(product.getPicture());
                product.setImage(imageDataUrl); // 設置image屬性為圖像數據URI
            } catch (Exception e) {
                // 處理異常
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
    //圖片處理邏輯
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
                    // 
                    return "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData.toString().getBytes());
                }
            }
        }
        return null;
    }
    
    //根據產品ID查詢產品價格
    @Override
	public BigDecimal  getProductPriceById(Integer id) {
        Product product = productRepository.findById(id).orElse(null);
        if (product != null) {
            return product.getProductPrice();
        } else {
            return null;
        }
    }
}

