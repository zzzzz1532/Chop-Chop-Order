package com.dao;

import com.model.Label;

public interface LabelRepositoryCustom {
	public boolean isPersist(Label label);
	
	void detach(Label label);
}
