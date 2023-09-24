package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.ispan.eeit69.model.Category;
import com.ispan.eeit69.service.CategoryService;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
	

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/")
	public String main(Model model) {
		// 从数据库或其他数据源中获取 category 数据
		List<Category> categories = categoryService.getAllCategories();

		// 将 categories 数据传递给JSP 页面
		model.addAttribute("categories", categories);

		return "main"; // 返回视图名称，Spring MVC 将呈现对应的JSP页面
	}
	
}
