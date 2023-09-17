package com.ispan.eeit69.service.Impl;

import java.util.Date;

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
		Integer dailyRevenue = chartRp.calRevenueInDateRange
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		
		return dailyRevenue;
	}

	@Override
	public Integer calWeekTotalRevenue() {
		Integer weekRevenue = chartRp.calRevenueInDateRange
				(DateUtils.getFirstDayOfWeek(currentDate), DateUtils.getLastDayOfWeek(currentDate));
		
		return weekRevenue;
	}

	@Override
	public Integer calMonthTotalRevenue() {
		Integer monthRevenue = chartRp.calRevenueInDateRange
				(DateUtils.getFirstDayOfMonth(currentDate), DateUtils.getLastDayOfMonth(currentDate));
		
		return monthRevenue;
	}

	@Override
	public Integer countDailyOrders() {
		Integer dailyOrders = chartRp.countOrders
				(DateUtils.startOfDay(currentDate), DateUtils.endOfDay(currentDate));
		
		return dailyOrders;
	}

	@Override
	public Integer countWeekOrders() {
		Integer weekOrders = chartRp.countOrders
				(DateUtils.getFirstDayOfWeek(currentDate), DateUtils.getLastDayOfWeek(currentDate));
		
		return weekOrders;
	}

	@Override
	public Integer countMonthOrders() {
		Integer monthOrders = chartRp.countOrders
				(DateUtils.getFirstDayOfMonth(currentDate), DateUtils.getLastDayOfMonth(currentDate));
		
		return monthOrders;
	}

	

}
