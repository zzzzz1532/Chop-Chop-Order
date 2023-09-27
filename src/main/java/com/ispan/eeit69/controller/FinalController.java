package com.ispan.eeit69.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class FinalController {
    @GetMapping("/final")
    public String finalPage(@RequestParam(name = "orderNumbers", required = false) String orderNumbers, Model model) {
        model.addAttribute("orderNumbers", orderNumbers);
        return "final";
    }
}
