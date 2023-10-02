package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.ispan.eeit69.service.PendingOrderService;


@Controller
public class FinalController {

    @Autowired
    private PendingOrderService pendingOrderService;

    @GetMapping("/final") // 
    public String showFinalPage(Model model) {
        // 獲取OrderNo和diningLocation數據
        Integer orderNo = pendingOrderService.getOrderNo();
        String diningLocation = pendingOrderService.getDiningLocation();

        // 將數據存入Model以便在JSP頁面中使用
        model.addAttribute("orderNo", orderNo);
        model.addAttribute("diningLocation", diningLocation);

        // 返回"final"页面的视图名称
        return "final";
    }
}
