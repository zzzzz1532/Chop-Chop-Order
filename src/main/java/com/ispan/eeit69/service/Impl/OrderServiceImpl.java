package com.ispan.eeit69.service.Impl;

import com.ispan.eeit69.model.Label;
import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.model.Product;
import com.ispan.eeit69.repository.LabelRepository;
import com.ispan.eeit69.repository.PendingOrderRepository;
import com.ispan.eeit69.repository.ProductRepository;
import com.ispan.eeit69.service.OrderService;
import com.ispan.eeit69.utils.OrderDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
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

    @Override
    public OrderDto updateOrderPriceAndReturnOrderNo(List<Map<String, Object>> orderItems) {
    	cachedOrderNo = null;
    	
    	for (Map<String, Object> orderData : orderItems) {
            // 提取其他属性的值，如 productId、foodQuantity、diningLocation 等
            String productId = (String) orderData.get("productI");
            Integer foodQuantity = (Integer) orderData.get("foodQuantity");
            String diningLocation = (String) orderData.get("diningLocation");
            String foodNote = (String) orderData.get("foodNote");
            String orderNote = (String) orderData.get("orderNote");

            // 提取 labelId 的值，如果是數組則轉換為 List
            Object labelIdObj = orderData.get("labelid");
            List<Integer> labelIds = new ArrayList<>();

            if (labelIdObj instanceof Integer) {
                labelIds.add((Integer) labelIdObj);
            } else if (labelIdObj instanceof List) {
                // 如果是數組，將其轉換為 List
                labelIds.addAll((List<Integer>) labelIdObj);
            }

            // 驗證產品和標籤是否存在於資料庫中
            if (validateData(productId, labelIds)) {
                // 生成訂單號
                generateOrderNumber();

                // 計算總價等操作
                BigDecimal totalPrice = calculateTotalPrice(productId, labelIds, foodQuantity);

                // 創建 PendingOrder 對象並填入資料表
                createPendingOrder(cachedOrderNo, diningLocation, productId, foodQuantity, totalPrice,
                        foodNote, orderNote, labelIds);
            }
        }

        // 返回訂單號或其他需要的資訊
        return new OrderDto(cachedOrderNo);
    }

    private boolean validateData(String productId, List<Integer> labelIds) {
        // 在這裡進行產品和標籤的驗證邏輯，檢查他們是否存在於資料表中
        Product product = productRepository.findByProductId(productId);
        if (product == null) {
            // 產品不存在於資料庫中，返回 false 表示驗證失敗
            return false;
        }

        for (Integer labelId : labelIds) {
        	Label label = labelRepository.findById(labelId).orElse(null);
            if (label == null) {
                // 標籤不存在於資料庫中，返回 false 表示驗證失敗
                return false;
            }
        }

        // 所有驗證通過，返回 true 表示驗證成功
        return true;
    }
    

    private void generateOrderNumber() {
        // 生成訂單號
        // 將生成的訂單號存入 cachedOrderNo
        if (cachedOrderNo == null) {
            Integer lastOrderNo = pendingOrderRepository.findLastOrderNo();
            if (lastOrderNo == null) {
                cachedOrderNo = 1;
            } else {
                cachedOrderNo = lastOrderNo + 1;
            }
        }
    }

    private BigDecimal calculateTotalPrice(String productId, List<Integer> labelIds, Integer foodQuantity) {
        // 在這裡進行單項總價計算的邏輯，包括產品價格和標籤價格的計算
        BigDecimal totalPrice = BigDecimal.ZERO;

        if (!labelIds.isEmpty()) {
            for (Integer labelId : labelIds) {
                Label label = labelRepository.findById(labelId).orElse(null);

                if (label != null) {
                    BigDecimal labelPrice = label.getLabelPrice();
                    totalPrice = totalPrice.add(labelPrice);
                }
            }
        }

        // 計算產品價格
        Product product = productRepository.findByProductId(productId);

        if (product != null) {
            BigDecimal productPrice = product.getProductPrice();
            totalPrice = totalPrice.add(productPrice.multiply(new BigDecimal(foodQuantity)));
        }

        return totalPrice;
    }

    private void createPendingOrder(Integer orderNo, String diningLocation, String productId, Integer foodQuantity,
            BigDecimal totalPrice, String foodNote, String orderNote, List<Integer> labelIds) {
        // 在這裡創建 PendingOrder 對象並保存到數據庫中
        PendingOrder pendingOrder = new PendingOrder();
        pendingOrder.setOrderNo(orderNo); // 设置OrderNo
        pendingOrder.setDiningLocation(diningLocation);

        // 查詢產品名稱
        Product product = productRepository.findByProductId(productId);
        if (product != null) {
            pendingOrder.setProductName(product.getProductName());
            pendingOrder.setCategoryName(product.getCategory().getCategoryName());
        }

        pendingOrder.setFoodQuantity(foodQuantity);
        pendingOrder.setOrderPrice(totalPrice.intValue()); // 使用每個訂單的totalPrice
        pendingOrder.setCreated_at(new Timestamp(System.currentTimeMillis()));

        // 根據 labelIds 查詢對應的 labelName 並拼接成字符串
        List<String> labelNames = new ArrayList<>();
        for (Integer labelId : labelIds) {
            Label label = labelRepository.findById(labelId).orElse(null);
            if (label != null) {
                labelNames.add(label.getLabelName());
            }
        }
        String labelNamesStr = String.join(", ", labelNames);
        pendingOrder.setLabelName(labelNamesStr);
        System.out.println(labelNamesStr);
        System.out.println(labelNames);

        pendingOrder.setFoodNote(foodNote);
        pendingOrder.setOrderNote(orderNote);

        // 保存訂單
        pendingOrderRepository.save(pendingOrder);
    }
}
