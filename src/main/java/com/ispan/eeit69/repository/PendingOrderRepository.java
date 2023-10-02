package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.PendingOrder;

import antlr.collections.List;

public interface PendingOrderRepository extends JpaRepository<PendingOrder, Integer> {
	
	@Modifying
    @Query("SELECT p FROM PendingOrder p WHERE p.orderNo = :orderNo")
    List findByOrderNo(@Param("orderNo") Integer orderNo);
	
    @Modifying
    @Query("DELETE FROM PendingOrder p WHERE p.orderNo = :orderNo")
    void deleteById(@Param("orderNo") Integer orderNo);



}
