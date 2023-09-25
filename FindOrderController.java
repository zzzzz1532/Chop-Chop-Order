package com.ispan.eeit69.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit69.model.Order;
import com.ispan.eeit69.service.OrderService;

@Controller
public class FindOrderController {

    @Autowired
    private OrderService orderService;

    // 查詢所有訂單 - RESTful 風格
    @GetMapping("/Order")
    public @ResponseBody List<Order> findAllOrder() {
        try {
            // 使用OrderService加载订单数据
            return orderService.loadOrdersFromJsonFile();
        } catch (IOException e) {
            // 处理文件读取异常
            e.printStackTrace();
            return null; // 或者返回适当的错误信息
        }
    }

    @GetMapping("/showOrderSystem")
    public String showOrderSystem() {
        return "showOrderSystem"; // 返回 JSP 视图的名称
    }
}
