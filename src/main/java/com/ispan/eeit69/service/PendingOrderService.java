package com.ispan.eeit69.service;

import java.util.List;

import com.ispan.eeit69.model.PendingOrder;
//import com.ispan.eeit69.model.PendingOrderSummary;

public interface PendingOrderService {
    
    List<PendingOrder> findAll(); 

//    List<PendingOrderSummary> findOrderSummaryByOrderNo(Integer orderNo);
    
    void deleteById(Integer orderNo);
    
}

