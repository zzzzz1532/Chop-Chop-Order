package com.ispan.eeit69.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.repository.PendingOrderRepository;
import com.ispan.eeit69.service.PendingOrderService;

@Controller
public class FindPendingOrderController {

    @Autowired
    PendingOrderService pendingOrderService;

    @Autowired
    PendingOrderRepository pendingOrderRepository;

    // 查詢所有暫存訂單 - RESTful 風格
    @GetMapping("/pendingorder")
    public @ResponseBody List<PendingOrder> findAllpendingOrder() {
    	
        return pendingOrderService.findAll();
        
        
    }

    @GetMapping("/showOrderSystem")
    public String pendingOrders() {
        return "showOrderSystem";
    }

    
    @GetMapping("/index")
    public String index() {
        return "/";
    }

    
    @DeleteMapping("/orderIDdelete/{orderNo}")
    public String deleteProduct(
            RedirectAttributes ra,
            @PathVariable Integer orderNo
    ) {
        try {
            pendingOrderService.deleteById(orderNo);
            ra.addFlashAttribute("message", "<font color='green'>已刪除OrderID: " + orderNo + " 之紀錄</font>");
        } catch (Exception e) {
            ra.addFlashAttribute("message", "<font color='red'>刪除商品編號: " + orderNo + " 之紀錄失敗:" + e.getMessage() + "</font>");
            e.printStackTrace();
        }
        return "redirect:/showOrderSystem";
    }

   
}
