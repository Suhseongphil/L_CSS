package com.L_CSS.dao;

import com.L_CSS.dto.ProductDto;

public interface ProductDao {

	String getmax();

	void inserttbList(ProductDto productDto);

	void insertcmList(ProductDto productDto);

}
