package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.eeit69.model.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {
    
}

