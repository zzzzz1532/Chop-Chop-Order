package com.ispan.eeit69.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.PendingOrder;

public interface PendingOrderRepository extends JpaRepository<PendingOrder, Integer> {
	// 添加根据订单号查询订单的方法
	PendingOrder findByOrderNo(Integer orderNo);

	@Query("SELECT MAX(p.orderNo) FROM PendingOrder p")
	Integer findLastOrderNo();
	
	@Query("SELECT p FROM PendingOrder p WHERE p.orderNo = :orderNo")
	List<PendingOrder> findLastOrderByOrderNo(@Param("orderNo") Integer orderNo);



	// 添加判断订单是否存在的方法
	boolean existsByOrderNo(Integer orderNo);
}
