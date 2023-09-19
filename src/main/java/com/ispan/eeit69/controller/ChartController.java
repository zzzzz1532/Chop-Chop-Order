package com.ispan.eeit69.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit69.model.Chart;
import com.ispan.eeit69.service.ChartService;

@Controller
public class ChartController {

	@Autowired
	ChartService chartService;
	
	//日營業總額
	@GetMapping("/dailyTotalRevenue")
	public @ResponseBody Integer calDailyTotalRevenue() {
		return chartService.calDailyTotalRevenue();
	}

	//近 7 七天營業總額
	@GetMapping("/weeklyTotalRevenue")
	public @ResponseBody Integer calWeeklyTotalRevenue() {
		return chartService.calWeeklyTotalRevenue();
	}
	
	//近 30 天營業總額
	@GetMapping("/monthlyTotalRevenue")
	public @ResponseBody Integer calMonthlyTotalRevenue() {
		return chartService.calMonthlyTotalRevenue();
	}
	
	//日總訂單
	@GetMapping("/dailyOrders")
	public @ResponseBody Integer countDailyOrders() {
		return chartService.countDailyOrders();
	}

	//近 7 七天總訂單
	@GetMapping("/weeklyOrders")
	public @ResponseBody Integer countWeeklyOrders() {
		return chartService.countWeeklyOrders();
	}
		
	//近 30 天總訂單
	@GetMapping("/monthlyOrders")
	public @ResponseBody Integer countMonthlyOrders() {
		return chartService.countMonthlyOrders();
	}
	
	//日外帶內用比例
	@GetMapping("/dailyDingingLocation")
	public @ResponseBody List<Object[]> countDailyDiningLocation() {
		return chartService.countDailyDiningLocation();
	}
	
	//近 7 七天外帶內用比例
	@GetMapping("/weeklyDingingLocation")
	public @ResponseBody List<Object[]> countWeeklyDiningLocation() {
		return chartService.countWeeklyDiningLocation();
	}

	//近 30 天外帶內用比例
	@GetMapping("/monthlyDingingLocation")
	public @ResponseBody List<Object[]> countMonthlyDiningLocation() {
		return chartService.countMonthlyDiningLocation();
	}
	
	//日產品類別比例
	@GetMapping("/dailyFoodCategory")
	public @ResponseBody List<Object[]> countDailyFoodCategory() {
		return chartService.countDailyFoodCategory();
	}
	
	//近 7 七天產品類別比例
	@GetMapping("/weeklyFoodCategory")
	public @ResponseBody List<Object[]> countWeeklyFoodCategory() {
		return chartService.countWeeklyFoodCategory();
	}
	
	//近 30 天產品類別比例
	@GetMapping("/monthlyFoodCategory")
	public @ResponseBody List<Object[]> countMonthlyFoodCategory() {
		return chartService.countMonthlyFoodCategory();
	}
	
//	//日熱賣產品排行
//	@GetMapping("/dailyHotProduct")
//	public @ResponseBody List<Object[]> dailyHotProduct() {
//		return chartService.dailyHotProduct();
//	}
//	
//	
//		
//	//週熱賣產品排行
//	@GetMapping("/weeklyHotProduct")
//	public @ResponseBody List<Object[]> weeklyHotProduct() {
//		return chartService.weeklyHotProduct();
//	}
//		
//	//月熱賣產品排行
//	@GetMapping("/monthlyHotProduct")
//	public @ResponseBody List<Object[]> monthlyHotProduct() {
//		return chartService.monthlyHotProduct();
//	}
	
	
	//日熱賣產品排行
	@GetMapping("/dailyHotProduct")
	public @ResponseBody List<Map<String, Object>> dailyHotProduct() {
		List<Object[]> dailyData = chartService.dailyHotProduct();
		List<Map<String, Object>> dailyHotProduct = new ArrayList<>();
		
		for (Object[] item : dailyData) {
			Map<String, Object> data = new HashMap<>();
			data.put("productName", item[0]);
	        data.put("productQuantity", item[1]);
	        data.put("productPrice", item[2]);
	        dailyHotProduct.add(data);
		}
		
		return dailyHotProduct;
	}
	
	
	//近 7 七天熱賣產品排行
	@GetMapping("/weeklyHotProduct")
	public @ResponseBody List<Map<String, Object>> weeklyHotProduct() {
	    List<Object[]> weeklyData = chartService.weeklyHotProduct();
	    List<Map<String, Object>> weeklyHotProduct = new ArrayList<>();

	    for (Object[] item : weeklyData) {
	        Map<String, Object> data = new HashMap<>();
	        data.put("productName", item[0]);
	        data.put("productQuantity", item[1]);
	        data.put("productPrice", item[2]);
	        weeklyHotProduct.add(data);
	    }

	    return weeklyHotProduct;
	}
	
		
	//近 30 天熱賣產品排行
	@GetMapping("/monthlyHotProduct")
	public @ResponseBody List<Map<String, Object>> monthlyHotProduct() {
	    List<Object[]> monthlyData = chartService.monthlyHotProduct();
	    List<Map<String, Object>> monthlyHotProduct = new ArrayList<>();

	    for (Object[] item : monthlyData) {
	        Map<String, Object> data = new HashMap<>();
	        data.put("productName", item[0]);
	        data.put("productQuantity", item[1]);
	        data.put("productPrice", item[2]);
	        monthlyHotProduct.add(data);
	    }

	    return monthlyHotProduct;
	}
	
	// 測試查詢原始資料
//	@GetMapping("/testOriginData")
//	public @ResponseBody List<Chart> findOriginData(){
//		return chartService.findAll();	
//	}
	
}
