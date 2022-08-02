package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.MenuDto;

public interface MenuDao {

	String getmax();

	void insertMenu(MenuDto menu);

	ArrayList<MenuDto> getMenu();

	void updateState(@Param("mucode") String mucode, @Param("mustate") int mustate);

	void deleteMenu(String mucode);

	ArrayList<MenuDto> MenuInfo(String cfcode);

	CafeDto MyCafeInfo(String loginId);

	ArrayList<MenuDto> getMyMenu(String mucfcode);

	void updateMymenu(MenuDto menu);

	String getMyMenuImg(String muimg);

	ArrayList<String> getType();
}
