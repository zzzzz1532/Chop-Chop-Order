package com.ispan.eeit69.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.PendingOrder;
@Service
public interface PendingOrderService {
	
	List<PendingOrder> findAll(); 
}