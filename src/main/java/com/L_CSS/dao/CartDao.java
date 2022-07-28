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

	ArrayList<CartDto> selectCartList(@Param("loginId")String loginId, @Param("ctcode")String ctcode);

	int deleteCart(String ctcode);

	int InsertCart(@Param("pdcode")String pdcode, @Param("pdcmcode")String pdcmcode,@Param("loginId")String loginId, @Param("ctcode")String ctcode, @Param("ctamount")int amount);

	int deleteCartList(String ctcode);
	

}
