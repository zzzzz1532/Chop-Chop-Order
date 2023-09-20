package com.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Label;

public interface LabelRepository extends JpaRepository<Label, Integer>{
	Label findByLabelId(String labelId);

	@Override
	boolean existsById(Integer id) ;
}
