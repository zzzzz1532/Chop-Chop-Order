package com.ispan.eeit69.service;

import java.util.List;

import com.ispan.eeit69.model.PendingOrder;

public interface PendingOrderService {
	
	List<PendingOrder> findAll(); 
	
	String findDiningLocation(Integer updatedOrderNo);

	List<PendingOrder> findOrderNo(Integer updatedOrderNo);

	Integer findOrderPrice(Integer updatedOrderNo);
	
	List<Object[]> findOrderDetailsByOrderNo(Integer orderNo);
    
	
    void deleteById(Integer orderNo);

    void copyPendingOrderToCompleteOrder(Integer orderNo);

	List<Object[]> findOrderDetailsForAllOrders();

	List<Object[]> findCompletedOrdeeForAllOrders();
}
