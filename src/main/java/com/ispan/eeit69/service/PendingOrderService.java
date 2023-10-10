package com.ispan.eeit69.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.PendingOrder;

public interface PendingOrderService {
    
    List<PendingOrder> findAll(); 

//    List<PendingOrderSummary> findOrderSummaryByOrderNo(Integer orderNo);
    
    List<Object[]> findOrderDetailsByOrderNo(Integer orderNo);
    
    List<Object[]> findOrderDetailsForAllBasicOrders(Integer orderNo);
    
		
    void deleteById(Integer orderNo);

    void copyPendingOrderToCompleteOrder(Integer orderNo);

	List<Object[]> findOrderDetailsForAllOrders();

	List<Object[]> findCompletedOrdeeForAllOrders();
	
	List<Object[]> findCompletedDetailsForAllBasicOrders(Integer orderNo);
	
	List<Object[]> findCompletedDetailsByOrderNo(Integer orderNo);
	   
}

