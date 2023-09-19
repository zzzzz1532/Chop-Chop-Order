package com.ispan.eeit69.service;

import java.util.List;

public interface ChartService {
	 Integer calDailyTotalRevenue();
	 Integer calWeeklyTotalRevenue();
	 Integer calMonthlyTotalRevenue();
	 
	 Integer countDailyOrders();
	 Integer countWeeklyOrders();
	 Integer countMonthlyOrders();
	 
	 List<Object[]> countDailyDiningLocation();
	 List<Object[]> countWeeklyDiningLocation();
	 List<Object[]> countMonthlyDiningLocation();
	 
	 List<Object[]> countDailyFoodCategory();
	 List<Object[]> countWeeklyFoodCategory();
	 List<Object[]> countMonthlyFoodCategory();
	 
	 List<Object[]> dailyHotProduct();
	 List<Object[]> weeklyHotProduct();
	 List<Object[]> monthlyHotProduct();
	 
	 
}
