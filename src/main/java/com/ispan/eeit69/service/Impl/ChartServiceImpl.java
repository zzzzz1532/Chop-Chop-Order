package com.ispan.eeit69.service.Impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.repository.ChartRepository;
import com.ispan.eeit69.service.ChartService;
import com.ispan.eeit69.utils.DateUtils;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired
	ChartRepository chartRp;
	
	Date currentDate = new Date();

	@Override
	public Integer calDailyTotalRevenue() {
		Integer dailyRevenue = chartRp.calRevenue
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		
		return dailyRevenue;
	}

	@Override
	public Integer calWeeklyTotalRevenue() {
		Integer weekRevenue = chartRp.calRevenue
				(DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		
		return weekRevenue;
	}

	@Override
	public Integer calMonthlyTotalRevenue() {
		Integer monthRevenue = chartRp.calRevenue
				(DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		
		return monthRevenue;
	}

	@Override
	public Integer countDailyOrders() {
		Integer dailyOrders = chartRp.countOrders
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		
		return dailyOrders;
	}

	@Override
	public Integer countWeeklyOrders() {
		Integer weekOrders = chartRp.countOrders
				(DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		
		return weekOrders;
	}

	@Override
	public Integer countMonthlyOrders() {
		Integer monthOrders = chartRp.countOrders
				(DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		
		return monthOrders;
	}

	@Override
	public List<Object[]> countDailyDiningLocation() {
		List<Object[]> dailyDiningLocation = chartRp.countDiningLocation
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		return dailyDiningLocation;
	}

	@Override
	public List<Object[]> countWeeklyDiningLocation() {
		List<Object[]> weekDiningLocation = chartRp.countDiningLocation
				(DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		return weekDiningLocation;
	}

	@Override
	public List<Object[]> countMonthlyDiningLocation() {
		List<Object[]> monthDiningLocation = chartRp.countDiningLocation
				(DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		return monthDiningLocation;
	}

	@Override
	public List<Object[]> countDailyFoodCategory() {
		List<Object[]> dailyFoodCategory = chartRp.countFoodCategory
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		return dailyFoodCategory;
	}

	@Override
	public List<Object[]> countWeeklyFoodCategory() {
		List<Object[]> weeklyFoodCategory = chartRp.countFoodCategory
				(DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		return weeklyFoodCategory;
	}

	@Override
	public List<Object[]> countMonthlyFoodCategory() {
		List<Object[]> monthlyFoodCategory = chartRp.countFoodCategory
				(DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		return monthlyFoodCategory;
	}

	@Override
	public List<Object[]> dailyHotProduct() {
		List<Object[]> dailyHotProduct = chartRp.hotProduct
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		return dailyHotProduct;
	}

	@Override
	public List<Object[]> weeklyHotProduct() {
		List<Object[]> weeklyHotProduct = chartRp.hotProduct
				(DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		return weeklyHotProduct;
	}

	@Override
	public List<Object[]> monthlyHotProduct() {
		List<Object[]> monthlyHotProduct = chartRp.hotProduct
				(DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		return monthlyHotProduct;
	}

	//營業額&訂單量分析圖
	

	

}
