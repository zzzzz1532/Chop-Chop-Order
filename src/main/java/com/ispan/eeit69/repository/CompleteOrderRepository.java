package com.ispan.eeit69.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ispan.eeit69.model.CompleteOrder;


public interface CompleteOrderRepository extends JpaRepository<CompleteOrder, Integer> {
    

	@Query(value = "SELECT " +
	        "  po.orderNo as orderNo, " +
	        "  po.diningLocation as diningLocation, " +
	        "  MIN(po.created_at) as createdAt, " +
	        "  SUM(CAST(po.orderPrice AS DECIMAL(10, 2))) as totalOrderPrice " +
	        "FROM Complete_Order po " +
	        "GROUP BY po.orderNo, po.diningLocation", nativeQuery = true)
	List<Object[]> findCompletedOrdeeForAllOrders();



}

