package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.MenuDto;

public interface MenuDao {

	String getmax();

	int insertMenu(MenuDto menu);

	ArrayList<MenuDto> getMenu();

	int updateState(@Param("mucode") String mucode, @Param("mustate") int mustate);

	int deleteMenu(String mucode);

	ArrayList<MenuDto> MenuInfo(String cfcode);

	CafeDto MyCafeInfo(String loginId);

	ArrayList<MenuDto> getMyMenu(String mucfcode);

	int updateMymenu(MenuDto menu);

	String getMyMenuImg(String muimg);

	ArrayList<String> getType();
}
