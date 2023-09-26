package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.service.PendingOrderService;

@Controller
@RequestMapping("/cart") // 設定您的端點路徑
public class PendingOrderController {

    @Autowired
    private PendingOrderService pendingOrderService;

    @PostMapping("/savePendingOrder")
    @ResponseBody
    public String savePendingOrder(@RequestBody String data) {
        // 您可以在這裡對收到的data進行處理，然後將其轉換為PendingOrder模型（根據需要）
        // 假設您的data是JSON格式的字符串，您可以使用Jackson或其他JSON處理庫將其轉換為PendingOrder對象

        // 處理data，轉換為PendingOrder對象
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            PendingOrder pendingOrder = objectMapper.readValue(data, PendingOrder.class);
            // 執行資料庫操作，將資料存入資料表
            pendingOrderService.saveOrder(pendingOrder);
            return "PendingOrder saved successfully";
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "Error processing data";
        }
    }


}