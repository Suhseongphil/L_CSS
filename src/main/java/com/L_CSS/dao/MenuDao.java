package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.MenuDto;


public interface MenuDao {

	String getmax();

	int insertMenu(MenuDto menu);

	ArrayList<MenuDto> getMenu();

	int updateState(@Param("mucode")String mucode,@Param("mustate") int mustate);

	int deleteMenu(String mucode);
	
}
