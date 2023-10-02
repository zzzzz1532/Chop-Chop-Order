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
		// 先调用OrderService完成其逻辑
		Integer updatedOrderNo = orderService.updateOrderPriceAndReturnOrderNo(orderItems);
		// 再调用EcpayOrderService继续执行其逻辑，获取支付表单字符串
		String aioCheckOutALLForm = ecpayOrderService.ecpayCheckout();
		// 将支付表单字符串添加到模型中
//        System.out.println("Payment Form: " + aioCheckOutALLForm);
//        Model.addAttribute("aioCheckOutALLForm", aioCheckOutALLForm);

		return aioCheckOutALLForm;
	}
}
