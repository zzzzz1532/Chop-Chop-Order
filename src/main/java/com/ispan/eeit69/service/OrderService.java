package com.ispan.eeit69.service;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ispan.eeit69.model.Order;
import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.repository.OrderRepository;
import com.ispan.eeit69.repository.PendingOrderRepository;

@Service
public interface OrderService {

	List<Order> findAll(); 
}
