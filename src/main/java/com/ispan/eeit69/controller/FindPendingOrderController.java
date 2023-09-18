package com.ispan.eeit69.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.service.PendingOrderService;

@Controller
public class FindPendingOrderController {

	@Autowired
	PendingOrderService pendingOrderService;

	// 查詢所有暫存訂單 - RESTful 風格
	@GetMapping("/pendingOrder")
	public @ResponseBody List<PendingOrder> findAllpendingOrder() {
		return pendingOrderService.findAll();
	}

	
	@GetMapping("/showPendingOrders")
	public String pendingOrders() {
		return "showPendingOrders";
	}

	@GetMapping("/test")
	public String test() {
		return "chart";
	}
}
