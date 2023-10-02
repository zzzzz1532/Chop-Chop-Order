package com.ispan.eeit69.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.repository.PendingOrderRepository;

@Service
public class PendingOrderService {

	@Autowired
	private PendingOrderRepository pendingOrderRepository;

	public String getDiningLocation() {

		return pendingOrderRepository.findLastDiningLocation();
	}

	public Integer getOrderNo() {
		return pendingOrderRepository.findLastOrderNo();
	}
}
