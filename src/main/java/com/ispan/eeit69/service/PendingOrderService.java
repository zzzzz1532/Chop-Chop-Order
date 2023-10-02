package com.ispan.eeit69.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.repository.PendingOrderRepository;

@Service
public class PendingOrderService {

	@Autowired
	private PendingOrderRepository pendingOrderRepository;

	public String findDiningLocation(Integer updatedOrderNo) {
        return pendingOrderRepository.findDiningLocation(updatedOrderNo);
    }

    public List<PendingOrder> findOrderNo(Integer updatedOrderNo) {
        return pendingOrderRepository.findByOrderNo(updatedOrderNo);
    }

    public Integer findOrderPrice(Integer updatedOrderNo) {
        return pendingOrderRepository.findOrderPrice(updatedOrderNo);
    }
}
