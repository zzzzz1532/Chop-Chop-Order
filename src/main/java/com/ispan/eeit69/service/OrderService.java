package com.ispan.eeit69.service;

import java.util.List;
import java.util.Map;

import com.ispan.eeit69.utils.OrderDto;

public interface OrderService {

	OrderDto updateOrderPriceAndReturnOrderNo(List<Map<String, Object>> orderItems);


}