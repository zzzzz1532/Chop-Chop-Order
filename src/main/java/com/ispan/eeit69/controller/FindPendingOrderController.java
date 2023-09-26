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
	@GetMapping("/pendingorder")
	public @ResponseBody List<PendingOrder> findAllpendingOrder() {
		return pendingOrderService.findAll();
	}

	
	@GetMapping("/showOrderSystem")
	public String pendingOrders() {
		return "showOrderSystem";
	}

	@GetMapping("/test")
	public String test() {
		return "chart";
	}
	@GetMapping("/index")
	public String index() {
		return "/";
	}
}
