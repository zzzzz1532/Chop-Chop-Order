package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit69.service.OrderService;

import java.util.List;
import java.util.Map;

@RestController
public class OrderController {

    @Autowired
    private OrderService orderService;
    

    @PostMapping("/processOrder")
    public Integer processOrder(@RequestBody List<Map<String, Object>> orderItems) {
        Integer updatedOrderNo = orderService.updateOrderPriceAndReturnOrderNo(orderItems);
        return updatedOrderNo;
    }
}
