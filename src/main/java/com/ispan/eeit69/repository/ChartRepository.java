package com.ispan.eeit69.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan.eeit69.model.Chart;

public interface ChartRepository extends JpaRepository<Chart, Integer> {

	// 查詢營業額
	@Query("SELECT SUM(Complete_Order.orderPrice) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate")
	Integer calRevenue(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

	// 查詢訂單量
	@Query("SELECT COUNT(DISTINCT Complete_Order.orderNo) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate")
	Integer countOrders(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

	// 統計內用外帶比例
	@Query("SELECT Complete_Order.diningLocation, COUNT(Complete_Order) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate GROUP BY Complete_Order.diningLocation")
	List<Object[]> countDiningLocation(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

	// 統計產品類別比例
	@Query("SELECT Complete_Order.categoryName, COUNT(Complete_Order) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate GROUP BY Complete_Order.categoryName")
	List<Object[]> countFoodCategory(@Param("startDate") Date startDate, @Param("endDate") Date endDate);

	// 熱門商品排行
	@Query("SELECT Complete_Order.foodName, SUM(Complete_Order.foodQuantity), SUM(Complete_Order.orderPrice) FROM Chart Complete_Order WHERE Complete_Order.complete_at BETWEEN :startDate AND :endDate GROUP BY Complete_Order.foodName ORDER BY SUM(Complete_Order.foodQuantity) DESC")
	List<Object[]> hotProduct(@Param("startDate") Date startDate, @Param("endDate") Date endDate);


}
