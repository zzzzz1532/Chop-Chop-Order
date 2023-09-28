package com.ispan.eeit69.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Label;

import com.ispan.eeit69.repository.LabelRepository;

@Service
public class LabelService {
    private final LabelRepository labelRepository;

    @Autowired
    public LabelService(LabelRepository labelRepository) {
        this.labelRepository = labelRepository;
    }

    public BigDecimal getLabelPriceById(Integer id) {
        Label label = labelRepository.findById(id).orElse(null);
        if (label != null) {
            return label.getLabelPrice();
        } else {
            return null;
        }
    }
}
