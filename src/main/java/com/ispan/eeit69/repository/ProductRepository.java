package com.ispan.eeit69.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ispan.eeit69.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    // 在這裡可以定義自訂的查詢方法
}

