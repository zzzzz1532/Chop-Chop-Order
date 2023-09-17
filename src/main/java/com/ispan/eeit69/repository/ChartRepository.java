package com.ispan.eeit69.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.Chart;

public interface ChartRepository extends JpaRepository<Chart, Integer>{
	
	@Query("SELECT SUM(Complete_Order.orderPrice) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate")
	Integer calRevenueInDateRange(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

	@Query("SELECT COUNT(DISTINCT Complete_Order.orderNo) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate")
	Integer countOrders(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
