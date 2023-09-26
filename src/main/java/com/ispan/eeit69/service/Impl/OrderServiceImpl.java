package com.ispan.eeit69.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Order;
import com.ispan.eeit69.repository.OrderRepository;
import com.ispan.eeit69.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderRepository Order;
	
	
	@Override
	public List<Order> findAll() {
		
		return Order.findAll();
	}

}
