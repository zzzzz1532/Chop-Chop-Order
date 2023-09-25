package com.ispan.eeit69.model;

import java.util.List;

public class ChartData {

	private List<Integer> revenue; //營業額
	private List<Integer> orders; // 訂單量
	private List<String> categories; // 時間週期
	
	public ChartData(List<Integer> revenue, List<Integer> orders, List<String> categories) {
		super();
		this.revenue = revenue;
		this.orders = orders;
		this.categories = categories;
	}

	public ChartData() {
		
	}

	public List<Integer> getRevenue() {
		return revenue;
	}

	public void setRevenue(List<Integer> revenue) {
		this.revenue = revenue;
	}

	public List<Integer> getOrders() {
		return orders;
	}

	public void setOrders(List<Integer> orders) {
		this.orders = orders;
	}

	public List<String> getCategories() {
		return categories;
	}

	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	
	

}
