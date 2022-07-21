package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.GroupBuyDto;

public interface GroupBuyDao {

	ArrayList<GroupBuyDto> getGroupBuyInfo();

	ArrayList<String> getPdType();

}
