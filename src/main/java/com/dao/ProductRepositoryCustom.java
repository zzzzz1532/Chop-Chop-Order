package com.dao;

import com.model.Product;

public interface ProductRepositoryCustom {
	public boolean isPersist(Product product);
	
	void detach(Product product);

}
