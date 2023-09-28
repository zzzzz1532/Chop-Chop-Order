package com.ispan.eeit69.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.ispan.eeit69.service.LabelService;

import java.math.BigDecimal;

@RestController
@RequestMapping("/labels")
public class LabelController {

	private final LabelService labelService;

	@Autowired
	public LabelController(LabelService labelService) {
		this.labelService = labelService;
	}

	@GetMapping("/{id}/labelprice")
	public BigDecimal getLabelPriceById(@PathVariable Integer id) {

		return labelService.getLabelPriceById(id);
	}
}