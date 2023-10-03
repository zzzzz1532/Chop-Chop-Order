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
    private BigDecimal cachedOrderPrice; // 暫存OrderPrice

    @Override
    public Integer updateOrderPriceAndReturnOrderNo(List<Map<String, Object>> orderItems) {
        // 清空缓存的OrderNo和OrderPrice
        cachedOrderNo = null;
        cachedOrderPrice = BigDecimal.ZERO; // 初始化为零

        Integer updatedOrderNo = null;

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
                // 计算totalPrice
                BigDecimal productPrice = product.getProductPrice();
                BigDecimal labelPrice = label.getLabelPrice();
                BigDecimal totalPrice = (productPrice.add(labelPrice)).multiply(new BigDecimal(foodQuantity));

                // 将当前订单项的totalPrice添加到缓存的OrderPrice中
                cachedOrderPrice = cachedOrderPrice.add(totalPrice);

                if (cachedOrderNo == null) {
                    // 如果缓存中没有OrderNo，查询数据库获取最后一个OrderNo
                    Integer lastOrderNo = pendingOrderRepository.findLastOrderNo();
                    if (lastOrderNo == null) {
                        cachedOrderNo = 1;
                    } else {
                        cachedOrderNo = lastOrderNo + 1;
                    }
                }
                // 创建PendingOrder对象
                PendingOrder pendingOrder = new PendingOrder();
                pendingOrder.setOrderNo(cachedOrderNo);
                pendingOrder.setDiningLocation(diningLocation);
                pendingOrder.setProductName(product.getProductName());
                pendingOrder.setCategoryName(product.getCategory().getCategoryName());
                pendingOrder.setFoodQuantity(foodQuantity);
                pendingOrder.setOrderPrice(cachedOrderPrice.intValue()); // 使用缓存的OrderPrice
                pendingOrder.setCreated_at(new Timestamp(System.currentTimeMillis()));
                pendingOrder.setLabelName(label.getLabelName());
                pendingOrder.setFoodNote(foodNote);
                pendingOrder.setOrderNote(orderNote);

                // 保存订单
                pendingOrderRepository.save(pendingOrder);
                if (updatedOrderNo == null) {
                    updatedOrderNo = cachedOrderNo;
                }
            }
        }// 在订单项迭代结束后，将累计的totalPrice设置为订单的OrderPrice
       
        if (cachedOrderNo != null) {
            PendingOrder pendingOrder = new PendingOrder();
            pendingOrder.setOrderNo(cachedOrderNo);
            pendingOrder.setOrderPrice(cachedOrderPrice.intValue()); // 使用缓存的OrderPrice

            // 更新订单的OrderPrice
            pendingOrderRepository.updateOrderPrice(cachedOrderNo, cachedOrderPrice.intValue());

            if (updatedOrderNo == null) {
                updatedOrderNo = cachedOrderNo;
            }
        }

        System.out.println(updatedOrderNo);
        return updatedOrderNo;
    }
}