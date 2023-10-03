package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.PendingOrder;


public interface PendingOrderRepository extends JpaRepository<PendingOrder, Integer> {
    
	
//	@ Modifying
//    @ Query("SELECT new com.ispan.eeit69.model.PendingOrderSummary(" +
//            "o.orderNo, o.diningLocation, " +
//            "GROUP_CONCAT(o.productName), GROUP_CONCAT(o.categoryName), " +
//            "GROUP_CONCAT(o.foodQuantity), SUM(o.orderPrice), " +
//            "o.created_at) " +
//            "FROM PendingOrder o " +
//            "WHERE o.orderNo = :orderNo " +
//            "GROUP BY o.orderNo, o.diningLocation, o.created_at")
//    List<PendingOrderSummary> findOrderSummaryByOrderNo(@Param("orderNo") Integer orderNo);
    
    @Modifying
    @Query("DELETE FROM PendingOrder p WHERE p.orderNo = :orderNo")
    void deleteById(@Param("orderNo") Integer orderNo);
}

