package com.ispan.eeit69.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ispan.eeit69.repository.PendingOrderRepository;
import com.ispan.eeit69.service.PendingOrderService;

@Controller
public class FindPendingOrderController {

    @Autowired
    PendingOrderService pendingOrderService;

    @Autowired
    PendingOrderRepository pendingOrderRepository;

    
//    @GetMapping("/pendingorder")
//    public List<PendingOrderSummary> findOrderSummaryByOrderNo(@RequestParam Integer orderNo) {
//        List<Object[]> rawOrderSummaryList = pendingOrderService.findOrderSummaryByOrderNo(orderNo);
//
//        // Convert raw data to a list of PendingOrderSummary DTOs
//        List<PendingOrderSummary> orderSummaryList = new ArrayList<>();
//        for (Object[] rawOrderSummary : rawOrderSummaryList) {
//            PendingOrderSummary orderSummaryDTO = new PendingOrderSummary();
//            orderSummaryDTO.setOrderNo((Integer) rawOrderSummary[0]);
//            orderSummaryDTO.setDiningLocation((String) rawOrderSummary[1]);
//            orderSummaryDTO.setProductName((List<Object[]>) rawOrderSummary[2]);
//            orderSummaryDTO.setCategoryName((List<Object[]>) rawOrderSummary[3]);
//            orderSummaryDTO.setFoodQuantity((List<Object[]>) rawOrderSummary[4]);
//            orderSummaryDTO.setOrderPrice((List<Object[]>) rawOrderSummary[5]);
//            orderSummaryDTO.setLabelName((List<Object[]>) rawOrderSummary[6]);
//            orderSummaryDTO.setFoodNote((List<Object[]>) rawOrderSummary[7]);
//            orderSummaryDTO.setOrderNote((List<Object[]>) rawOrderSummary[8]);
//            orderSummaryDTO.setCreated_at((String) rawOrderSummary[9]);
//
//            orderSummaryList.add(orderSummaryDTO);
//        }
//
//        return orderSummaryList;
//    }
     
    
    
//    @GetMapping("/pendingorder")
//    public @ResponseBody List<PendingOrder> findAllpendingOrder() {
//    	
//        return pendingOrderService.findAll();
//        
//    }

    
    @GetMapping("/findorder")
    public @ResponseBody List<Object[]> findAllpendingOrder() {
    	
        return pendingOrderService.findOrderDetailsForAllOrders();
        
    }
    
    
    
     @GetMapping("/showOrderSystem")
     public String pendingOrders() {
         return "showOrderSystem";
     }
    

     
     
    // Delete order by orderNo
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





