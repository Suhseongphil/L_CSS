package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.GbpeopleDto;
import com.L_CSS.dto.GbreserveDto;
import com.L_CSS.dto.GroupBuyDto;
import com.L_CSS.dto.ProductDto;

public interface GroupBuyDao {

	ArrayList<GbreserveDto> getGroupBuyInfo();

	ArrayList<String> getPdType();

	ArrayList<ProductDto> getProduct(String pdtype);

	String getAddress(String loginId);

	String getmax();

	void insertGroupBuy(GroupBuyDto groupBuy);

	GbreserveDto getGroupbuy(String gbcode);

	ArrayList<GbpeopleDto> getGbpeople(String gbcode);

	void insertGbpeopleDto(GbpeopleDto gbInfo);

	void deleteGbpeople(String gbcode);

	void deleteGroupBuy(String gbcode);

	ArrayList<GbreserveDto> getGroupBuyInfo2();

	GbpeopleDto getGbInfo(@Param("gbcode")String gbcode, @Param("loginId")String loginId);

	void deleteChatRoom(String gbcode);

	void outGbpeople(@Param("gbcode")String gbcode, @Param("loginId")String loginId);

	void outChatroom(@Param("gbcode")String gbcode, @Param("loginId")String loginId);

	void updateGroupBuy(GroupBuyDto modGb);

}
