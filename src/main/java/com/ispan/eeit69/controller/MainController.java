package com.ispan.eeit69.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.service.ProductService;
@Controller
public class MainController {
    @Autowired
    private ProductService productService;

    @GetMapping("/main")
    public String main(Model model) {
        List<Product> productsWithCategory = productService.getAllProductsWithCategory();
        model.addAttribute("products", productsWithCategory);
        return "main";
    }
    @GetMapping("/getProductInfo")
    public ResponseEntity<Product> getProductInfo(@RequestParam Integer productId) {
        System.out.println("Received productId: " + productId); // 添加日志输出
        Product product = productService.getProductById(productId);
        if (product != null) {
            return ResponseEntity.ok(product);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}


