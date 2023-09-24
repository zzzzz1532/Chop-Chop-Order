package com.ispan.eeit69.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ispan.eeit69.service.ProductService;
import com.ispan.eeit69.model.Product;
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
}


