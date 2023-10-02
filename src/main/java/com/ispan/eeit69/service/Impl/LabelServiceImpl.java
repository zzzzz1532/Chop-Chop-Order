package com.ispan.eeit69.service.Impl;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit69.model.Label;

import com.ispan.eeit69.repository.LabelRepository;
import com.ispan.eeit69.service.LabelService;

@Service
public class LabelServiceImpl implements LabelService {
    private final LabelRepository labelRepository;

    @Autowired
    public LabelServiceImpl(LabelRepository labelRepository) {
        this.labelRepository = labelRepository;
    }

    @Override
	public BigDecimal getLabelPriceById(Integer id) {
        Label label = labelRepository.findById(id).orElse(null);
        if (label != null) {
            return label.getLabelPrice();
        } else {
            return null;
        }
    }
}
