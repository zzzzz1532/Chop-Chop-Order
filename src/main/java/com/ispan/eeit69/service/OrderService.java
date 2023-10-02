package com.ispan.eeit69.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

	Integer updateOrderPriceAndReturnOrderNo(List<Map<String, Object>> orderItems);


}