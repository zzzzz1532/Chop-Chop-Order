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
    	
    	for (Map<String, Object> orderItem : orderItems) {
            // 提取其他属性的值，如 productId、foodQuantity、diningLocation 等
            Integer productId = (Integer) orderItem.get("productId");
            Integer foodQuantity = (Integer) orderItem.get("foodQuantity");
            String diningLocation = (String) orderItem.get("diningLocation");
            String foodNote = (String) orderItem.get("foodNote");
            String orderNote = (String) orderItem.get("orderNote");

            // 提取 labelId 的值，如果是数组则转换为 List
            Object labelIdObj = orderItem.get("labelId");
            List<Integer> labelIds = new ArrayList<>();

            if (labelIdObj instanceof Integer) {
                labelIds.add((Integer) labelIdObj);
            } else if (labelIdObj instanceof List) {
                // 如果是数组，将其转换为 List
                labelIds.addAll((List<Integer>) labelIdObj);
            }

            // 验证产品和标签是否存在于数据库中
            if (validateData(productId, labelIds)) {
                // 生成订单号
                generateOrderNumber();

                // 计算总价等操作
                BigDecimal totalPrice = calculateTotalPrice(productId, labelIds, foodQuantity);

                // 创建 PendingOrder 对象并回填数据库
                createPendingOrder(cachedOrderNo, diningLocation, productId, foodQuantity, totalPrice,
                        foodNote, orderNote, labelIds);
            }
        }

        // 返回订单号或其他需要的信息
        return new OrderDto(cachedOrderNo);
    }

    private boolean validateData(Integer productId, List<Integer> labelIds) {
        // 在这里进行产品和标签的验证逻辑，检查它们是否存在于数据库中
        Product product = productRepository.findById(productId).orElse(null);
        if (product == null) {
            // 产品不存在于数据库中，返回 false 表示验证失败
            return false;
        }

        for (Integer labelId : labelIds) {
            Label label = labelRepository.findById(labelId).orElse(null);
            if (label == null) {
                // 标签不存在于数据库中，返回 false 表示验证失败
                return false;
            }
        }

        // 所有验证通过，返回 true 表示验证成功
        return true;
    }
    

    private void generateOrderNumber() {
        // 在这里生成订单号，你可以根据需要的规则生成唯一的订单号
        // 将生成的订单号存入 cachedOrderNo
        if (cachedOrderNo == null) {
            Integer lastOrderNo = pendingOrderRepository.findLastOrderNo();
            if (lastOrderNo == null) {
                cachedOrderNo = 1;
            } else {
                cachedOrderNo = lastOrderNo + 1;
            }
        }
    }

    private BigDecimal calculateTotalPrice(Integer productId, List<Integer> labelIds, Integer foodQuantity) {
        // 在这里进行总价计算的逻辑，包括产品价格和标签价格的计算
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

        // 计算产品价格
        Product product = productRepository.findById(productId).orElse(null);

        if (product != null) {
            BigDecimal productPrice = product.getProductPrice();
            totalPrice = totalPrice.add(productPrice.multiply(new BigDecimal(foodQuantity)));
        }

        return totalPrice;
    }

    private void createPendingOrder(Integer orderNo, String diningLocation, Integer productId, Integer foodQuantity,
            BigDecimal totalPrice, String foodNote, String orderNote, List<Integer> labelIds) {
        // 在这里创建 PendingOrder 对象并保存到数据库中
        PendingOrder pendingOrder = new PendingOrder();
        pendingOrder.setOrderNo(orderNo); // 设置OrderNo
        pendingOrder.setDiningLocation(diningLocation);

        // 查询产品名称
        Product product = productRepository.findById(productId).orElse(null);
        if (product != null) {
            pendingOrder.setProductName(product.getProductName());
            pendingOrder.setCategoryName(product.getCategory().getCategoryName());
        }

        pendingOrder.setFoodQuantity(foodQuantity);
        pendingOrder.setOrderPrice(totalPrice.intValue()); // 使用每个订单项的totalPrice
        pendingOrder.setCreated_at(new Timestamp(System.currentTimeMillis()));

        // 根据 labelIds 查询对应的 labelName 并拼接成字符串
        List<String> labelNames = new ArrayList<>();
        for (Integer labelId : labelIds) {
            Label label = labelRepository.findById(labelId).orElse(null);
            if (label != null) {
                labelNames.add(label.getLabelName());
            }
        }
        String labelNamesStr = String.join(", ", labelNames);
        pendingOrder.setLabelName(labelNamesStr);

        pendingOrder.setFoodNote(foodNote);
        pendingOrder.setOrderNote(orderNote);

        // 保存订单
        pendingOrderRepository.save(pendingOrder);
    }
}
