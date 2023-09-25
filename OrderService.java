package com.ispan.eeit69.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ispan.eeit69.model.Order;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@Service
public class OrderService {
    public List<Order> loadOrdersFromJsonFile() throws IOException {
        // 创建ObjectMapper对象
        ObjectMapper objectMapper = new ObjectMapper();

        // 从资源文件中读取JSON文件并解析为Order对象列表
        List<Order> orders = objectMapper.readValue(
                Paths.get("/Chop-Chop-Order-EC/src/main/resources/JSON/Pending.json").toFile(),
                objectMapper.getTypeFactory().constructCollectionType(List.class, Order.class)
        );

        return orders;
    }
}
