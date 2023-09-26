package com.ispan.eeit69.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.PendingOrder;
import com.ispan.eeit69.repository.PendingOrderRepository;

@Service
public class PendingOrderService {

    @Autowired
    private PendingOrderRepository pendingOrderRepository; // 假設您使用Spring Data JPA進行資料庫操作

    public void saveOrder(PendingOrder pendingOrder) {
        // 執行資料庫操作，將資料存入資料表
        pendingOrderRepository.save(pendingOrder);
    }
}
