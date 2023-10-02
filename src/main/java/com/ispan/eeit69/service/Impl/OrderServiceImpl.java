package com.ispan.eeit69.service.Impl;

import com.ispan.eeit69.model.Label;
import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.repository.LabelRepository;
import com.ispan.eeit69.repository.PendingOrderRepository;
import com.ispan.eeit69.repository.ProductRepository;
import com.ispan.eeit69.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private PendingOrderRepository pendingOrderRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private LabelRepository labelRepository;
	
	private Integer cachedOrderNo; // 暫存OrderNo
    private Integer cachedOrderPrice; // 暫存OrderPrice
    private String cachedDiningLocation; // 暫存diningLocation
	
	@Override
	public Integer updateOrderPriceAndReturnOrderNo(List<Map<String, Object>> orderItems) {
		BigDecimal totalOrderPrice = BigDecimal.ZERO;
		Integer updatedOrderNo = null;

		// 最後一個訂單號並加1
		Integer lastOrderNo = pendingOrderRepository.findLastOrderNo();
		Integer newOrderNo = (lastOrderNo != null) ? lastOrderNo + 1 : 1;

		for (Map<String, Object> orderItem : orderItems) {
			// 提取orderItem中的數據
			Integer productId = (Integer) orderItem.get("productId");
			Integer labelId = (Integer) orderItem.get("labelId");
			Integer foodQuantity = (Integer) orderItem.get("foodQuantity");
			String diningLocation = (String) orderItem.get("diningLocation");
			String foodNote = (String) orderItem.get("foodNote");
			String orderNote = (String) orderItem.get("orderNote");

			// 查詢產品標籤訊息
			Product product = productRepository.findById(productId).orElse(null);
			Label label = labelRepository.findById(labelId).orElse(null);

			if (product != null && label != null) {
				// 計算totalPrice
				BigDecimal productPrice = product.getProductPrice();
				BigDecimal labelPrice = label.getLabelPrice();
				BigDecimal totalPrice = (productPrice.add(labelPrice)).multiply(new BigDecimal(foodQuantity));

				totalOrderPrice = totalOrderPrice.add(totalPrice);

				// 創建PendingOrder對象
				PendingOrder pendingOrder = new PendingOrder();
				pendingOrder.setOrderNo(newOrderNo);
				pendingOrder.setDiningLocation(diningLocation);
				pendingOrder.setProductName(product.getProductName());
				pendingOrder.setCategoryName(product.getCategory().getCategoryName());
				pendingOrder.setFoodQuantity(foodQuantity);
				pendingOrder.setOrderPrice(totalPrice.intValue());
				pendingOrder.setCreated_at(new Timestamp(System.currentTimeMillis()));
				pendingOrder.setLabelName(label.getLabelName());
				pendingOrder.setFoodNote(foodNote);
				pendingOrder.setOrderNote(orderNote);

				// 保存訂單
				pendingOrderRepository.save(pendingOrder);
				if (updatedOrderNo == null) {
					updatedOrderNo = newOrderNo;
				}
			}
		}
		// 暫存OrderNo、OrderPrice和diningLocation
        cachedOrderNo = updatedOrderNo;
        cachedOrderPrice = totalOrderPrice.intValue();
        cachedDiningLocation = orderItems.get(0).get("diningLocation").toString(); // 假設diningLocation相同

		// 更新總訂單價格
		List<PendingOrder> ordersToUpdate = pendingOrderRepository.findLastOrderByOrderNo(newOrderNo);

		if (!ordersToUpdate.isEmpty()) {
		    for (PendingOrder orderToUpdate : ordersToUpdate) {
		        orderToUpdate.setOrderPrice(cachedOrderPrice); // 使用暫存的OrderPrice
		    }

		    pendingOrderRepository.saveAll(ordersToUpdate);
		}
		return updatedOrderNo;
	}
	@Override
    public Integer getTotalOrderPrice() {
        // 返回實際的totalOrderPrice值
        return cachedOrderPrice;
    }

    @Override
    public Integer getNewOrderNo() {
        // 返回實際的newOrderNo值
        return cachedOrderNo;
    }

    @Override
    public String getDiningLocation() {
        // 返回暫存的diningLocation值
        return cachedDiningLocation;
    }

}
