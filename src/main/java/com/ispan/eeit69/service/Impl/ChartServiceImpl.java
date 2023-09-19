package com.ispan.eeit69.service.Impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	
	//日營業總額
	@Override
	public Integer calDailyTotalRevenue() {
		Integer dailyRevenue = chartRp.calRevenue(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));

		return dailyRevenue;
	}
	
	//近 7 天營業總額
	@Override
	public Integer calWeeklyTotalRevenue() {
		Integer weekRevenue = chartRp.calRevenue(DateUtils.getStartDateForLastSevenDays(currentDate),
				DateUtils.endOfDay(currentDate));

		return weekRevenue;
	}
	
	//近 30 天營業總額
	@Override
	public Integer calMonthlyTotalRevenue() {
		Integer monthRevenue = chartRp.calRevenue(DateUtils.getStartDateForLastThirtyDays(currentDate),
				DateUtils.endOfDay(currentDate));

		return monthRevenue;
	}
	
	//日總訂單
	@Override
	public Integer countDailyOrders() {
		Integer dailyOrders = chartRp.countOrders(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));

		return dailyOrders;
	}
	
	//近 7 天總訂單
	@Override
	public Integer countWeeklyOrders() {
		Integer weekOrders = chartRp.countOrders(DateUtils.getStartDateForLastSevenDays(currentDate),
				DateUtils.endOfDay(currentDate));

		return weekOrders;
	}
	
	//近 30 天總訂單
	@Override
	public Integer countMonthlyOrders() {
		Integer monthOrders = chartRp.countOrders(DateUtils.getStartDateForLastThirtyDays(currentDate),
				DateUtils.endOfDay(currentDate));

		return monthOrders;
	}
	
	//日外帶內用比例
	@Override
	public List<Object[]> countDailyDiningLocation() {
		List<Object[]> dailyDiningLocation = chartRp.countDiningLocation(DateUtils.startOfDay(currentDate),
				DateUtils.endOfDay(currentDate));
		return dailyDiningLocation;
	}
	
	//近 7 天外帶內用比例
	@Override
	public List<Object[]> countWeeklyDiningLocation() {
		List<Object[]> weekDiningLocation = chartRp.countDiningLocation(
				DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		return weekDiningLocation;
	}
	
	//近 30 天外帶內用比例
	@Override
	public List<Object[]> countMonthlyDiningLocation() {
		List<Object[]> monthDiningLocation = chartRp.countDiningLocation(
				DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		return monthDiningLocation;
	}
	
	//日產品類別比例
	@Override
	public List<Object[]> countDailyFoodCategory() {
		List<Object[]> dailyFoodCategory = chartRp.countFoodCategory(DateUtils.startOfDay(currentDate),
				DateUtils.endOfDay(currentDate));
		return dailyFoodCategory;
	}
	
	//近 7 天產品類別比例
	@Override
	public List<Object[]> countWeeklyFoodCategory() {
		List<Object[]> weeklyFoodCategory = chartRp.countFoodCategory(
				DateUtils.getStartDateForLastSevenDays(currentDate), DateUtils.endOfDay(currentDate));
		return weeklyFoodCategory;
	}
	
	//近 30 天產品類別比例
	@Override
	public List<Object[]> countMonthlyFoodCategory() {
		List<Object[]> monthlyFoodCategory = chartRp.countFoodCategory(
				DateUtils.getStartDateForLastThirtyDays(currentDate), DateUtils.endOfDay(currentDate));
		return monthlyFoodCategory;
	}
	
	//日熱賣產品排行
	@Override
	public List<Object[]> dailyHotProduct() {
		List<Object[]> dailyHotProduct = chartRp.hotProduct(DateUtils.startOfDay(currentDate),
				DateUtils.endOfDay(currentDate));
		return dailyHotProduct;
	}

	//近 7 天熱賣產品排行
	@Override
	public List<Object[]> weeklyHotProduct() {
		List<Object[]> weeklyHotProduct = chartRp.hotProduct(DateUtils.getStartDateForLastSevenDays(currentDate),
				DateUtils.endOfDay(currentDate));
		return weeklyHotProduct;
	}
	
	//近 30 天熱賣產品排行
	@Override
	public List<Object[]> monthlyHotProduct() {
		List<Object[]> monthlyHotProduct = chartRp.hotProduct(DateUtils.getStartDateForLastThirtyDays(currentDate),
				DateUtils.endOfDay(currentDate));
		return monthlyHotProduct;

	}

	// 營業額&訂單量分析圖

	// 測試查詢分析圖原始資料
//	public List<Object[]> findDailyData() {
//		List<Object[]> originData = chartRp.findDailyData(DateUtils.getStartDateForLastSevenDays(currentDate),
//				DateUtils.endOfDay(currentDate));
//		return originData;
//	}
	
	// 日營業額訂單量數據
	public List<List<Object>> findDailyData(){
		List<Object[]> originDatas = chartRp.findHourData(DateUtils.startOfDay(currentDate),
				DateUtils.endOfDay(currentDate));
		
		List<Object> dates = new ArrayList<>();
		List<Object> orders = new ArrayList<>();
		List<Object> revenues = new ArrayList<>();
		
		
		for(Object[] data :originDatas) {
			
			String date = (String) data[0];
			Long revenue = (Long)data[1];
			Long order = (Long)data[2];
			
			String formattedDate = date.replace(" ", " <br> ");			
			
			dates.add(formattedDate);
			revenues.add(revenue);
			orders.add(order);
		}
		
		List<List<Object>> result = new ArrayList<>();
		result.add(dates);
		result.add(revenues);
		result.add(orders);

		return result;
	
	}
	
	// 近 7 天營業額訂單量每日數據
	@Override
	public List<List<Object>> findWeeklyData() {
		List<Object[]> originDatas = chartRp.findDailyData(DateUtils.getStartDateForLastSevenDays(currentDate),
				DateUtils.endOfDay(currentDate));

		List<Object> dates = new ArrayList<>();
		List<Object> orders = new ArrayList<>();
		List<Object> revenues = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd EEEE");
		
		
		for(Object[] data :originDatas) {
			
			Date date = (Date)data[0];
			Long revenue = (Long)data[1];
			Long order = (Long)data[2];
			
			String formattedDate = dateFormat.format(date).replace(" ", " <br> ");
			
			
			dates.add(formattedDate);
			revenues.add(revenue);
			orders.add(order);
		}
		
		List<List<Object>> result = new ArrayList<>();
		result.add(dates);
		result.add(revenues);
		result.add(orders);

		return result;
	}
	
	// 近 30 天營業額訂單量每日數據
	@Override
	public List<List<Object>> findMonthlyData() {
		List<Object[]> originDatas = chartRp.findDailyData(DateUtils.getStartDateForLastThirtyDays(currentDate),
				DateUtils.endOfDay(currentDate));

		List<Object> dates = new ArrayList<>();
		List<Object> orders = new ArrayList<>();
		List<Object> revenues = new ArrayList<>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd EEEE");
		
		
		for(Object[] data :originDatas) {
			
			Date date = (Date)data[0];
			Long revenue = (Long)data[1];
			Long order = (Long)data[2];
			
			String formattedDate = dateFormat.format(date).replace(" ", " <br> ");
			
			
			dates.add(formattedDate);
			revenues.add(revenue);
			orders.add(order);
		}
		
		List<List<Object>> result = new ArrayList<>();
		result.add(dates);
		result.add(revenues);
		result.add(orders);

		return result;
	}

}
