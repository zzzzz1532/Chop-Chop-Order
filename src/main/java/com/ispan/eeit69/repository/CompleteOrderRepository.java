package com.ispan.eeit69.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.CompleteOrder;


public interface CompleteOrderRepository extends JpaRepository<CompleteOrder, Integer> {
    

	@Query(value = "SELECT " +
	        "  po.orderNo as orderNo, " +
	        "  po.diningLocation as diningLocation, " +
	        "  MIN(po.created_at) as createdAt, " +
	        "  MIN(po.complete_at) as completeAt, " +
	        "  SUM(CAST(po.orderPrice AS DECIMAL(10, 2))) as totalOrderPrice " +
	        "FROM Complete_Order po " +
	        "GROUP BY po.orderNo, po.diningLocation", nativeQuery = true)
	List<Object[]> findCompletedOrdeeForAllOrders();

	@Query(value = "SELECT " +
	        "  po.orderNo as orderNo, " +
	        "  po.diningLocation as diningLocation, " +
	        "  MIN(po.created_at) as createdAt, " +
	        "  MIN(po.complete_at) as completeAt, " +
	        "  SUM(CAST(po.orderPrice AS DECIMAL(10, 2))) as totalOrderPrice " +
	        "FROM Complete_Order po WHERE po.orderNo = :orderNo " +  // 添加這個空格
	        "GROUP BY po.orderNo, po.diningLocation,po.diningLocation", nativeQuery = true)
	List<Object[]> findCompletedDetailsForAllBasicOrders(@Param("orderNo") Integer orderNo);
	
	@Query(value = "SELECT * FROM Complete_Order po WHERE po.orderNo = :orderNo", nativeQuery = true)
	List<Object[]> findCompletedDetailsByOrderNo(@Param("orderNo") Integer orderNo);
	
}

