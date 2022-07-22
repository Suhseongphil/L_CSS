package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.GroupBuyDto;
import com.L_CSS.dto.ProductDto;

public interface GroupBuyDao {

	ArrayList<GroupBuyDto> getGroupBuyInfo();

	ArrayList<String> getPdType();

	ArrayList<ProductDto> getProduct(String pdtype);

	String getAddress(String loginId);

}
