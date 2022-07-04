package com.L_CSS.dao;

import com.L_CSS.dto.ProductDto;

public interface ProductDao {

	String getmax();

	int insert(ProductDto productDto);

}
