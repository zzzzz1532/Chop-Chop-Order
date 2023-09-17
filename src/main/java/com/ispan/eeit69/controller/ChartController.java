package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	//週營業總額
	@GetMapping("/weekTotalRevenue")
	public @ResponseBody Integer calWeekTotalRevenue() {
		return chartService.calWeekTotalRevenue();
	}
	
	//月營業總額
	@GetMapping("/monthTotalRevenue")
	public @ResponseBody Integer calMonthTotalRevenue() {
		return chartService.calMonthTotalRevenue();
	}
	
	//日總訂單
	@GetMapping("/dailyOrders")
	public @ResponseBody Integer calDailyOrders() {
		return chartService.countDailyOrders();
	}

	//週總訂單
	@GetMapping("/weekOrders")
	public @ResponseBody Integer calWeekOrders() {
		return chartService.countWeekOrders();
	}
		
	//月總訂單
	@GetMapping("/monthOrders")
	public @ResponseBody Integer calMonthOrders() {
		return chartService.countMonthOrders();
	}
	
}
