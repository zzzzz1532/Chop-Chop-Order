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
	PendingOrderRepository pendingOrder;
	
	
	@Override
	public List<PendingOrder> findAll() {
		
		return pendingOrder.findAll();
	}

}
