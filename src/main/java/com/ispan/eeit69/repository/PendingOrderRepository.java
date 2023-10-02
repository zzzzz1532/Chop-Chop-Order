package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import com.ispan.eeit69.model.PendingOrder;

public interface PendingOrderRepository extends JpaRepository<PendingOrder, Integer> {
	@Query("SELECT MAX(p.orderNo) FROM PendingOrder p")
	Integer findLastOrderNo();
	@Query("SELECT p FROM PendingOrder p WHERE p.orderNo = :updatedOrderNo")
	List<PendingOrder> findByOrderNo(@Param("updatedOrderNo")Integer updatedOrderNo);
	@Query("SELECT p.diningLocation FROM PendingOrder p WHERE p.orderNo = :updatedOrderNo")
    String findDiningLocation(@Param("updatedOrderNo")Integer updatedOrderNo);
    @Query("SELECT p.orderPrice FROM PendingOrder p WHERE p.orderNo = :updatedOrderNo")
    Integer findOrderPrice(@Param("updatedOrderNo")Integer updatedOrderNo);

	// 添加判斷訂單是否存在的方法
	boolean existsByOrderNo(Integer orderNo);
}
