package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.service.ProductService;

import java.math.BigDecimal;
import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController {
    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/{id}")
    public Product getProductById(@PathVariable Integer id) {
        return productService.getProductById(id);
    }

    @PostMapping("/")
    public void saveProduct(@RequestBody Product product) {
        productService.saveProduct(product);
    }

    @DeleteMapping("/{id}")
    public void deleteProduct(@PathVariable Integer id) {
        productService.deleteProduct(id);
    }
    @GetMapping("/getAllProductsWithCategoryAndLabels")
    public List<Product> getAllProductsWithCategoryAndLabels() {
       return productService.getAllProductsWithCategoryAndLabels();
    }
    @GetMapping("/{id}/productprice")
    public ResponseEntity<BigDecimal> getProductPriceById(@PathVariable Integer id) {
        BigDecimal productPrice = productService.getProductPriceById(id);

        if (productPrice != null) {
            return ResponseEntity.ok(productPrice);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
   
}