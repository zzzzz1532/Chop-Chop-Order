package com.ispan.eeit69.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.repository.PendingOrderRepository;
import com.ispan.eeit69.service.PendingOrderService;

@Service
public class PendingOrderServiceImpl implements PendingOrderService {

    @Autowired
    PendingOrderRepository pendingOrderRepository;

    @Override
	public List<PendingOrder> findAll() {
		
		return pendingOrderRepository.findAll();
	}

    @Override
    public void deleteById(Integer orderNo) {
        pendingOrderRepository.deleteById(orderNo);
    }

	@Override
	public List<Object[]> findOrderDetailsForAllOrders() {
		return  pendingOrderRepository.findOrderDetailsForAllOrders();		
	}

//    @Override
//    public List<PendingOrderSummary> findOrderSummaryByOrderNo(Integer orderNo) {
//        return pendingOrderRepository.findOrderSummaryByOrderNo(orderNo);
//    }

    
//     @Override
//     public List<Object[]> findOrderNo(Integer orderNo) {
//		
//		return  pendingOrderRepository.findOrderSummaryByOrderNo(orderNo);
//	}
    
    
}

