//package com.ispan.eeit69.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.ispan.eeit69.model.CompleteOrder;
//import com.ispan.eeit69.service.CompleteOrderService;
//
//@Controller
//public class FindCompleteOrderController {
//	
//	@Autowired
//	CompleteOrderService cos;
//
//	@GetMapping("/findOrders")
//	public @ResponseBody List<CompleteOrder> findOrders(){
//		return cos.findAll();
//	}
//	
//	@GetMapping("/historyOrders")
//	public String showHistroyOrdersPage(){
//		return "testing";
//	}
//
//}
