package com.ispan.eeit69.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Category;
import com.ispan.eeit69.model.Label;
import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.repository.CategoryRepository;
import com.ispan.eeit69.repository.LabelRepository;
import com.ispan.eeit69.repository.PendingOrderRepository;
import com.ispan.eeit69.repository.ProductRepository;

@Service
public class OrderService {
	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private LabelRepository labelRepository;

	@Autowired
	private PendingOrderRepository pendingOrderRepository;

	public void createOrders(List<PendingOrder> pendingOrders) {
		// 生成新的訂單號碼
		Integer newOrderNo = generateNewOrderNumber();
		for (PendingOrder pendingOrder : pendingOrders) {
			 pendingOrder.setCreated_at(new Timestamp(System.currentTimeMillis()));

			Product product = productRepository.findByProductName(pendingOrder.getProductName());
			if (product == null) {
				throw new IllegalArgumentException("Invalid productName: " + pendingOrder.getProductName());
			}
			// 驗證 categoryName 是否存在於資料庫中
			Category category = categoryRepository.findByCategoryName(pendingOrder.getCategoryName());
			if (category == null) {
				throw new IllegalArgumentException("Invalid categoryName: " + pendingOrder.getCategoryName());
			}
			// 驗證 labelName 是否存在於資料庫中
			Label label = labelRepository.findByLabelName(pendingOrder.getLabelName());
			if (label == null) {
				throw new IllegalArgumentException("Invalid labelName: " + pendingOrder.getLabelName());
			}
			// 驗證通過後，生成新的訂單編號
			pendingOrder.setOrderNo(newOrderNo);
			// 將購物車資料寫入資料庫
			pendingOrderRepository.save(pendingOrder);
		}
	}

	private Integer generateNewOrderNumber() {
		// 在這裡實現生成新訂單編號的邏輯
		// 您可以查詢資料庫中最後一筆訂單編號並加1，確保其唯一性
		// 以下是一個示例，您可以根據實際情況進行調整
		Integer lastOrderNo = pendingOrderRepository.findLastOrderNumber();
		if (lastOrderNo == null) {
			return 1; // 資料庫中無訂單時，設定為1
		} else {
			return lastOrderNo + 1;
		}
	}
}