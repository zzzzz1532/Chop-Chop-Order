package com.ispan.eeit69.service;


public interface ChartService {
	 Integer calDailyTotalRevenue();
	 Integer calWeekTotalRevenue();
	 Integer calMonthTotalRevenue();
	 
	 Integer countDailyOrders();
	 Integer countWeekOrders();
	 Integer countMonthOrders();
}
