package com.ispan.eeit69.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.service.PendingOrderService;
@RestController
@RequestMapping("/api/order")
public class PendingOrderController {
	


	    @Autowired
	    private PendingOrderService pendingOrderService;

	    @PostMapping("/submit")
	    public ResponseEntity<String> submitOrder(@RequestBody OrderData orderData) {
	        try {
	            // 创建PendingOrder对象并设置相应属性
	            PendingOrder pendingOrder = new PendingOrder();
	            pendingOrder.setDiningLocation(orderData.getOrderChoice()); // 设置内用外带选项
	            // 设置其他订单属性，例如订单号、产品名称、数量、总额等
	            // ...

	            // 调用PendingOrderService保存订单
	            pendingOrderService.save(pendingOrder);

	            return new ResponseEntity<>("Order submitted successfully", HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return new ResponseEntity<>("Failed to submit order", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	}
