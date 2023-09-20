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
	
	// 查詢每日營業額及訂單量
	@Query("SELECT DATE(c.complete_at) AS orderDate, SUM(c.orderPrice) AS Revenue, COUNT(DISTINCT c.orderNo) AS orderQuan FROM Chart c WHERE c.complete_at BETWEEN :startDate AND :endDate GROUP BY orderDate ORDER BY orderDate")
	List<Object[]> findDailyData(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
	//日期格式化 - 顯示星期幾的查詢語句，用在上面方法
//	@Query("SELECT FUNCTION('DATE_FORMAT', c.complete_at, '%Y/%m/%d %W'), SUM(c.orderPrice) AS Revenue, COUNT(DISTINCT c.orderNo) AS orderQuan FROM Chart c WHERE c.complete_at BETWEEN :startDate AND :endDate GROUP BY FUNCTION('DATE_FORMAT', c.complete_at, '%Y/%m/%d %W') ORDER BY FUNCTION('DATE_FORMAT', c.complete_at, '%Y/%m/%d %W')")

	// 查詢當日每小時營業額及訂單量
	@Query("SELECT DATE_FORMAT(c.complete_at, '%Y/%m/%d %H:00') AS formattedDate, SUM(c.orderPrice) AS revenue, COUNT(DISTINCT c.orderNo) AS orderQuan FROM Chart c WHERE c.complete_at BETWEEN :startDate AND :endDate GROUP BY formattedDate ORDER BY formattedDate")
	List<Object[]> findHourData(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
	
	
}
