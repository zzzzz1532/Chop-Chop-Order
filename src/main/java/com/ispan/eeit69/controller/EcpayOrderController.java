package com.ispan.eeit69.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit69.service.EcpayOrderService;
import com.ispan.eeit69.service.OrderService;

@Controller
public class EcpayOrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private EcpayOrderService ecpayOrderService;

	@PostMapping("/ecpayCheckout")
	@ResponseBody
	public String ecpayCheckout(@RequestBody List<Map<String, Object>> orderItems) {
		
		Integer updatedOrderNo = orderService.updateOrderPriceAndReturnOrderNo(orderItems);
		
		String aioCheckOutALLForm = ecpayOrderService.ecpayCheckout(updatedOrderNo);
		// 将支付表单字符串添加到模型中
//        System.out.println("Payment Form: " + aioCheckOutALLForm);
//        Model.addAttribute("aioCheckOutALLForm", aioCheckOutALLForm);

		return aioCheckOutALLForm;
	}
}
