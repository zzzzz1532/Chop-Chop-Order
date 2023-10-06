package com.ispan.eeit69.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.PendingOrder;


public interface PendingOrderRepository extends JpaRepository<PendingOrder, Integer> {
    
	@Query(value = "SELECT " +
	        "  po.orderNo as orderNo, " +
	        "  po.diningLocation as diningLocation, " +
	        "  MIN(po.created_at) as createdAt, " +
	        "  SUM(CAST(po.orderPrice AS DECIMAL(10, 2))) as totalOrderPrice " +
	        "FROM PendingOrder po " +
	        "GROUP BY po.orderNo, po.diningLocation,po.diningLocation", nativeQuery = true)
	List<Object[]> findOrderDetailsForAllOrders();

    
    @Query("DELETE FROM PendingOrder o WHERE o.orderNo = :orderNo")
    void deleteById(@Param("orderNo") Integer orderNo);

}

