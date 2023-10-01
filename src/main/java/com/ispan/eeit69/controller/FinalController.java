package com.ispan.eeit69.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class FinalController {
    @GetMapping("/final")
    public String finalPage(@RequestParam String orderNumber, Model model) {
        // 在此處理Final頁面的邏輯，您可以使用orderNumber来檢索相關訂單數據
        return "final"; // 返回Final頁面的視圖名稱
    }
}

