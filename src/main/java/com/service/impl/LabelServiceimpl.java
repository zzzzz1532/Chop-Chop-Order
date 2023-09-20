package com.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.dao.LabelRepository;
import com.dao.LabelRepositoryCustom;
import com.model.Label;
import com.service.LabelService;

@Service
@Transactional
public class LabelServiceimpl implements LabelService {
	
	LabelRepository labelRepository;
	LabelRepositoryCustom labelRepositoryCustom;
	
	public LabelServiceimpl(LabelRepository labelRepository, LabelRepositoryCustom labelRepositoryCustom) {
		super();
		this.labelRepository = labelRepository;
		this.labelRepositoryCustom = labelRepositoryCustom;
	}

	@Override
	public void resetLabelTable() {
		throw new RuntimeException("本系統未提供此功能");			
	}

	@Override
	public void save(Label label) {
		labelRepository.save(label);
	}

	@Override
	public boolean existsByLabelId(Label label) {
		if (labelRepositoryCustom.isPersist(label)) {
			labelRepositoryCustom.detach(label);
		}
		Label emp = findByLabelId(label.getLabelId());
		return emp!= null;
	}

	@Override
	public boolean isPersist(Label label) {
		boolean ans = labelRepository.existsById(label.getId());
		return ans;
	}

	@Override
	public void detach(Label label) {
		labelRepositoryCustom.detach(label);		
	}

	@Override
	public void update(Label label) {
		labelRepository.save(label);
		
	}

	@Override
	public void deleteById(Integer id) {
		labelRepository.deleteById(id);	
	}

	@Override
	public List<Label> findAll() {
		return labelRepository.findAll();
	}

	@Override
	public Optional<Label> findById(Integer id) {
		return labelRepository.findById(id);
	}

	@Override
	public Label findByLabelId(String labelId) {
		Label emp = labelRepository.findByLabelId(labelId);
		return emp;
	}
}
