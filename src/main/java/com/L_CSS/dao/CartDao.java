package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CartDto;

public interface CartDao {

	String getmax();

	ArrayList<CartDto> selectMyCart(String loginId);

	void updateMinus(@Param("amount")int amount, @Param("ctcode")String ctcode);

	void updatePlus(@Param("amount")int amount, @Param("ctcode")String ctcode);

	void updateTotal(@Param("ctcode")String ctctcode, @Param("cttotal")int toTal);

	ArrayList<CartDto> selectCart(String loginId);

	ArrayList<CartDto> selectCartList(@Param("loginId")String loginId, @Param("ctcode")String ctcode);

	void deleteCart(String ctcode);

	int InsertCart(CartDto mycart);

	int deleteCartList(String ctcode);
	

}
