package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dto.CartDto;

public interface CartDao {

	String getmax();

	ArrayList<CartDto> selectMyCart(String loginId);

	int updateMinus(@Param("amount")int amount, @Param("ctcode")String ctcode);

	int updatePlus(@Param("amount")int amount, @Param("ctcode")String ctcode);

	int updateTotal(@Param("ctcode")String ctctcode, @Param("cttotal")int toTal);

	ArrayList<CartDto> selectCart(String loginId);
	

}
