package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.GbpeopleDto;
import com.L_CSS.dto.GbreserveDto;
import com.L_CSS.dto.GroupBuyDto;
import com.L_CSS.dto.ProductDto;

public interface GroupBuyDao {

	ArrayList<GroupBuyDto> getGroupBuyInfo();

	ArrayList<String> getPdType();

	ArrayList<ProductDto> getProduct(String pdtype);

	String getAddress(String loginId);

	String getmax();

	void insertGroupBuy(GroupBuyDto groupBuy);

	GbreserveDto getGroupbuy(String gbcode);

	int gbpeopleCnt(String gbcode);

	ArrayList<GbpeopleDto> getGbpeople(String gbcode);

	void insertGbpeopleDto(GbpeopleDto gbInfo);

	void deleteGbpeople(String gbcode);

	void deleteGroupBuy(String gbcode);

}
