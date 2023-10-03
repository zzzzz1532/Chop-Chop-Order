package com.ispan.eeit69.service;

import com.ispan.eeit69.utils.OrderDto;

public interface EcpayOrderService {

	String ecpayCheckout(OrderDto orderDto);

}