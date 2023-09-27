package com.ispan.eeit69.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.service.OrderService;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/create")
    public ResponseEntity<?> createOrders(@RequestBody List<PendingOrder> pendingOrders) {
        try {
            // 呼叫 OrderService 創建訂單
            List<Integer> orderNumbers = orderService.createOrders(pendingOrders);
            return new ResponseEntity<>(orderNumbers, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("無法創建訂單：" + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}

