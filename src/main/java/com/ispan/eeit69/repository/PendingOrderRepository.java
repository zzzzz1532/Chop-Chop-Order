package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.eeit69.model.PendingOrder;

public interface PendingOrderRepository extends JpaRepository<PendingOrder, Integer> {
	@Query("SELECT MAX(orderNo) FROM PendingOrder")
	Integer findLastOrderNumber();

}
